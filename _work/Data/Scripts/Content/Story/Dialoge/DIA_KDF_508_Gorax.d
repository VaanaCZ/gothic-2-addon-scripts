///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap1_EXIT_Condition;
	information = DIA_Gorax_KAp1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gorax_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gorax_PICKPOCKET (C_INFO)
{
	npc			= KDF_508_Gorax;
	nr			= 888;
	condition	= DIA_Gorax_PICKPOCKET_Condition;
	information	= DIA_Gorax_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(UkradenÌ tohoto klÌËe bude zatracenÏ tÏûkÈ)";
};                       

FUNC INT DIA_Gorax_PICKPOCKET_Condition()
{
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff))
	{
		return 1;
	};
};
FUNC VOID DIA_Gorax_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gorax_PICKPOCKET);
	Info_AddChoice		(DIA_Gorax_PICKPOCKET, DIALOG_BACK 		,DIA_Gorax_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gorax_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gorax_PICKPOCKET_DoIt);
};

func void DIA_Gorax_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems (self,ItKe_KlosterSchatz,1);
		B_GiveInvItems (self, other, ItKe_KlosterSchatz, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_Gorax_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Gorax_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gorax_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info HELP
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_HELP		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 = 	2;
	condition	 = 	DIA_Gorax_HELP_Condition;
	information	 = 	DIA_Gorax_HELP_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gorax_HELP_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Gorax_HELP_Info ()
{
	AI_Output (self, other, "DIA_Gorax_HELP_14_00"); //Mohu ti nÏjak pomoci?
};
///////////////////////////////////////////////////////////////////////
//	Info GOLD
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_GOLD		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  2;
	condition	 = 	DIA_Gorax_GOLD_Condition;
	information	 = 	DIA_Gorax_GOLD_Info;
	permanent	 = 	TRUE;
	description	 = 	"P¯inesl jsem kopu zlata.";
};
//-----------------------------------
var int DIA_Gorax_GOLD_perm;
//-----------------------------------
func int DIA_Gorax_GOLD_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)//ADDON
	{
		return TRUE;
	};
};
func void DIA_Gorax_GOLD_Info ()
{
	AI_Output (other, self, "DIA_Gorax_GOLD_15_00"); //P¯inesl jsem kopu zlata.
	
	if (Npc_HasItems (other, ItMi_Gold) >= Summe_Kloster)
	{
		AI_Output (self, other, "DIA_Gorax_GOLD_14_01"); //(pln oËek·v·nÌ) Ach - p¯in·öÌö dar Innosovi. Velmi dob¯e, m˘j synu.
		AI_Output (self, other, "DIA_Gorax_GOLD_14_02"); //Pouûiju tv˘j dar ve prospÏch kl·ötera, jak si Innos p¯eje.
	
		DIA_Gorax_GOLD_perm = TRUE; //WICHTIG
		B_GiveInvItems (other, self, ItMi_Gold, Summe_Kloster);
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_14_02"); //Co jsi s tÌm zlatem udÏlal? Utratils ho? P¯ines ho sem!
	};
	
};

///////////////////////////////////////////////////////////////////////
//	Info DaronsStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gorax_DaronsStatue		(C_INFO)
{
	npc		 = 	KDF_508_Gorax;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Gorax_DaronsStatue_Condition;
	information	 = 	DIA_Addon_Gorax_DaronsStatue_Info;
	permanent	 = 	TRUE;

	description	 = 	"M·m tu soöku, kterou mÏl Daron donÈst do kl·ötera.";
};

func int DIA_Addon_Gorax_DaronsStatue_Condition ()
{
	if (other.guild == GIL_NOV)
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)//ADDON
	{
		return TRUE;
	};
};

func void DIA_Addon_Gorax_DaronsStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Gorax_DaronsStatue_15_00"); //M·m tady tu soöku, kterou mÏl Daron p¯inÈst do kl·ötera.
	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	{
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_01"); //(povzdech) Je to trapnÈ, ûe n·m tak cennou vÏc p¯inesl jen r·doby novic.
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_02"); //Ale z·roveÚ to potvrzuje tvÈ rozhodnutÌ slouûit Innosovi.
		
		//-----------PATCH M.F.----------------------
		if B_GiveInvItems (other, self, ItMi_LostInnosStatue_Daron,1)
		{
			Npc_RemoveInvItems (self, ItMi_LostInnosStatue_Daron,1);
		};
		
		
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_03"); //Jsem ti velmi vdÏËn˝, mlad˝ novici.
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_ReturnedLostInnosStatue_Daron);
		DIA_Gorax_GOLD_perm = TRUE; //WICHTIG
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_04"); //Soöku? J· tu û·dnou soöku nevidÌm. Nap¯ed mi ji p¯ines a pak moûn· tÈ tvÈ historce uvÏ¯Ìm.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_SLEEP		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  4;
	condition	 = 	DIA_Gorax_SLEEP_Condition;
	information	 = 	DIA_Gorax_SLEEP_Info;
	description	 = 	"Hled·m mÌsto, kde bych se mohl vyspat.";
};
func int DIA_Gorax_SLEEP_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE)
	&& (other.guild == GIL_NOV) 
	{
		return TRUE;
	};
};
func void DIA_Gorax_SLEEP_Info ()
{
	AI_Output (other, self, "DIA_Gorax_SLEEP_15_00"); //Hled·m mÌsto, kde bych se mohl vyspat.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_01"); //Hned vedle dve¯Ì je voln· postel. PrvnÌ napravo, vedle vchodu. M˘ûeö sp·t tam.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_02"); //Svoje vÏci si m˘ûeö d·t do nÏkterÈ z nepouûÌvan˝ch truhel.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_03"); //A nezapomeÚ - v loûnicÌch m·g˘ nem·ö co pohled·vat. TakÈ nesmÌö vstupovat do knihovny, leda ûe bys mÏl v˝slovnÈ povolenÌ.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  3;
	condition	 = 	DIA_Gorax_Aufgabe_Condition;
	information	 = 	DIA_Gorax_Aufgabe_Info;
	permanent	 =  FALSE;
	description	 = 	"M·ö pro mÏ nÏjak˝ ˙kol?";
};
func int DIA_Gorax_Aufgabe_Condition ()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Gorax_Aufgabe_15_00"); //M·ö pro mÏ nÏjak˝ ˙kol?
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_01"); //Vy novicovÈ v poslednÌ dobÏ pracujete tvrdÏ. A ti, kdo hodnÏ pracujÌ, by takÈ mÏli hodnÏ jÌst.
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_02"); //Tady m·ö klÌË od spiûÌrny. Najdeö tam skopovÈ klob·sy. RozdÏl je mezi novice - ale spravedlivÏ!
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_03"); //Aû budeö hotov, zase za mnou p¯ijÔ.
	 
	CreateInvItems (self, ItKe_KlosterStore,1); 
	B_GiveInvItems (self, other, ItKe_KlosterStore,1);
	MIS_GoraxEssen = LOG_RUNNING; 
	
	Log_CreateTopic (Topic_GoraxEssen,LOG_MISSION);
	Log_SetTopicStatus (Topic_GoraxEssen,LOG_RUNNING);
	B_LogEntry (Topic_GoraxEssen,"Mistr Gorax chce, abych skopovÈ klob·sy ze spiûÌrny spravedlivÏ rozdÏlil mezi novice. KromÏ mÏ jich kl·öter ob˝v· celkem t¯in·ct.");
};
///////////////////////////////////////////////////////////////////////
//	Info W¸rste verteilt
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Wurst		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  2;
	condition	 = 	DIA_Gorax_Wurst_Condition;
	information	 = 	DIA_Gorax_Wurst_Info;
	permanent	 =  TRUE;
	description	 = 	"Rozdal jsem novic˘m ty klob·sy (˙kol splnÏn).";
};
func int DIA_Gorax_Wurst_Condition ()
{
	if (MIS_GoraxEssen == LOG_RUNNING)
	&& (Mob_HasItems ("WURSTTRUHE",ItFo_SchafsWurst) == 0)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Wurst_Info ()
{
	AI_Output (other, self, "DIA_Gorax_Wurst_15_00"); //RozdÏlil jsem ty klob·sy.
	
	if (Wurst_Gegeben >= 13)
	{
		AI_Output (self, other, "DIA_Gorax_Wurst_14_01"); //A uËinil jsi tak spravedlivÏ. Vezmi si tenhle svitek s lÈËiv˝m kouzlem - a bÏû si zase po svÈ pr·ci.
		
		MIS_GoraxEssen = LOG_SUCCESS; 
		B_GivePlayerXP (XP_GoraxEssen);
		B_GiveInvItems (self, other, ItSc_LightHeal,2);
	}
	else 
	{
		AI_Output (self, other, "DIA_Gorax_Wurst_14_02"); //V·ûnÏ? V tom p¯ÌpadÏ ses ale p¯i plnÏnÌ toho ˙kolu moc nesnaûil.
		AI_Output (self, other, "DIA_Gorax_Wurst_14_03"); //BuÔ jsi ty klob·sy snÏdl s·m, nebo jsi nÏkomu dal vÌc, neû mu n·leûelo.
		AI_Output (self, other, "DIA_Gorax_Wurst_14_04"); //Poslouchej, protoûe jsi nov˝, nech·m to protentokr·t b˝t. Ale p¯ÌötÏ budu p¯ÌsnÏjöÌ!
		
		MIS_GoraxEssen = LOG_FAILED; 
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe 2
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Aufgabe2		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  3;
	condition	 = 	DIA_Gorax_Aufgabe2_Condition;
	information	 = 	DIA_Gorax_Aufgabe2_Info;
	permanent	 =  FALSE;
	description	 = 	"M·ö pro mÏ nÏjak˝ dalöÌ ˙kol?";
};
func int DIA_Gorax_Aufgabe2_Condition ()
{
	if ((MIS_GoraxEssen == LOG_SUCCESS)
	|| (MIS_GoraxEssen == LOG_FAILED))
	&& (Npc_IsDead (Orlan) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Aufgabe2_Info ()
{
	AI_Output (other, self, "DIA_Gorax_Aufgabe2_15_00"); //M·ö pro mÏ nÏjak˝ dalöÌ ˙kol?
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_01"); //Ano. Jak vÌö, dÏl·me tady v˝bornÈ vÌno a takÈ je prod·v·me.
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_02"); //Orlan, majitel hostince "U MrtvÈ harpyje", si objednal dod·vku. Dohodli jsme se, ûe za ty l·hve zaplatÌ 240 zlat˝ch.
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_03"); //Dones mu tyto l·hve - ale nenech se oöidit.
	 
	B_GiveInvItems (self, other, ItFo_Wine,12);
	MIS_GoraxWein = LOG_RUNNING; 
	
	Log_CreateTopic (Topic_GoraxWein,LOG_MISSION);
	Log_SetTopicStatus (Topic_GoraxWein,LOG_RUNNING);
	B_LogEntry (Topic_GoraxWein,"Mistr Gorax chce, abych hospodskÈmu Orlanovi doruËil dvan·ct lahvÌ vÌna. MÏl by mi za nÏ d·t 240 zlaù·k˘.");
};
///////////////////////////////////////////////////////////////////////
//	Info Orlan
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Orlan		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  3;
	condition	 = 	DIA_Gorax_Orlan_Condition;
	information	 = 	DIA_Gorax_Orlan_Info;
	permanent	 =  TRUE;
	description	 = 	"Byl jsem za Orlanem.";
};
//----------------------------------
var int DIA_Gorax_Orlan_permanent;
//-----------------------------------
func int DIA_Gorax_Orlan_Condition ()
{
	if (MIS_GoraxWein == LOG_RUNNING)
	&& Npc_KnowsInfo (other, DIA_Orlan_Wein)
	&& (DIA_Gorax_Orlan_permanent == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Orlan_Info ()
{
	if (Npc_HasItems (other, ItmI_Gold) >= 100)
	{
		AI_Output (other, self, "DIA_Gorax_Orlan_15_00"); //Byl jsem za Orlanem.
		AI_Output (self, other, "DIA_Gorax_Orlan_14_01"); //A dostal jsi 240 zlat˝ch?
	
		DIA_Gorax_Orlan_permanent = TRUE;
		Info_ClearChoices (DIA_Gorax_Orlan);
	
		Info_AddChoice (DIA_Gorax_Orlan,"Ten öizuÚk mÏ oöulil! (P¯edat 100 zlaù·k˘.)",DIA_Gorax_Orlan_100);
		Info_AddChoice (DIA_Gorax_Orlan,"Tady je zlato. (Odevzdat 240 zlaù·k˘.)",DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_14_02"); //Co jsi s tÌm zlatem udÏlal? Utratils ho? P¯ines ho sem!
		
	};
};
FUNC VOID DIA_Gorax_Orlan_100 ()
{
	AI_Output (other, self, "DIA_Gorax_Orlan_100_15_00"); //Dal mi mÈnÏ!
	AI_Output (self, other, "DIA_Gorax_Orlan_100_14_01"); //Tys mu to prodal lacinÏji? To ne, proË jen jsem ze vöech lidÌ posÌlal pr·vÏ TEBE?
	AI_Output (self, other, "DIA_Gorax_Orlan_100_14_02"); //Jsi naprosto a tot·lnÏ neschopn˝. BÏû mi z oËÌ.
	
	B_GiveInvItems (other, self, ItMI_Gold, 100);
	
	MIS_GoraxWein = LOG_FAILED;
	 
	Info_ClearChoices (DIA_Gorax_Orlan);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Gorax_Orlan_240 ()
{
	AI_Output (other, self, "DIA_Gorax_Orlan_240_15_00"); //Dostal jsem ty penÌze.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 240)	
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_240_14_01"); //V˝bornÏ. Jsi v·ûnÏ schopn˝. Jako odmÏnu si vezmi tenhle svitek s lÈËiv˝m kouzlem. A teÔ bÏû a najdi si nÏjakou dalöÌ pr·ci.
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP (XP_Goraxwein);			
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_240_14_02"); //Ale Ë·st tÏch penÏz jsi uû staËil utratit, co? Jsi k niËemu - zmiz!
		MIS_GoraxWein = LOG_FAILED; 
		B_GiveInvItems (other, self, ItMI_Gold, Npc_HasItems (other, ItmI_Gold));
	};
	
	Info_ClearChoices (DIA_Gorax_Orlan);
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_JOB		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  35;
	condition	 = 	DIA_Gorax_JOB_Condition;
	information	 = 	DIA_Gorax_JOB_Info;
	permanent	 =  FALSE;
	description	 = 	"Jakou pr·ci tu vykon·v·ö?";
};
func int DIA_Gorax_JOB_Condition ()
{
	return TRUE;
};
func void DIA_Gorax_JOB_Info ()
{
	AI_Output (other, self, "DIA_Gorax_JOB_15_00"); //Co tu m·ö na pr·ci?
	AI_Output (self, other, "DIA_Gorax_JOB_14_01"); //MÈ ˙koly jsou mnohÈ a r˘znorodÈ. Nejsem jen spr·vce, jsem tÈû str·ûcem pokladnice.
	AI_Output (self, other, "DIA_Gorax_JOB_14_02"); //NavÌc dohlÌûÌm na vinn˝ sklep a star·m se o kl·öternÌ z·soby jÌdla.
	AI_Output (self, other, "DIA_Gorax_JOB_14_03"); //Takûe pokud budeö nÏco pot¯ebovat, m˘ûeö za mnou kdykoliv zajÌt a dostaneö to - samoz¯ejmÏ za rozumnou protihodnotu.
	
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistr Gorax mÏ m˘ûe z·sobit vöÌm, co bych mohl v kl·öte¯e upot¯ebit.");
};
///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_TRADE		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  99;
	condition	 = 	DIA_Gorax_TRADE_Condition;
	information	 = 	DIA_Gorax_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 =  TRUE;
	description	 = 	"Pot¯ebuji p·r vÏcÌ...";
};
func int DIA_Gorax_TRADE_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Gorax_JOB)
	{
		return TRUE;
	};
};
func void DIA_Gorax_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Gorax_TRADE_15_00"); //Pot¯ebuji p·r vÏcÌ.
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP f¸r KDF
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_KDF		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  5;
	condition	 = 	DIA_Gorax_KDF_Condition;
	information	 = 	DIA_Gorax_KDF_Info;
	permanent 	 =  FALSE;
	description	 = 	"Pot¯ebuji novÈ mÌsto na spanÌ.";
};
func int DIA_Gorax_KDF_Condition ()
{
	if (other.guild == GIL_KDF) 
	{
		return TRUE;
	};
};
func void DIA_Gorax_KDF_Info ()
{
	AI_Output (other, self, "DIA_Gorax_KDF_15_00"); //Pot¯ebuji novÈ mÌsto na spanÌ.
	AI_Output (self, other, "DIA_Gorax_KDF_14_01"); //Napravo odsud je voln˝ pokoj. Vezmi si tenhle klÌË. Najdeö tam vöechno, co pot¯ebujeö.
	
	B_GiveInvItems (self, other,ItKe_KDFPlayer,1);
	Wld_InsertItem (ItPo_Perm_Mana,"FP_ITEM_KDFPLAYER");
};
//########################################################################
//##
//##		Kapitel 2
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap2_EXIT_Condition;
	information = DIA_Gorax_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap2_EXIT_Condition()
{
	if (kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gorax_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//########################################################################
//##
//##		Kapitel 3
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap3_EXIT_Condition;
	information = DIA_Gorax_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap3_EXIT_Condition()
{
	if (kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gorax_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info KillPedro
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_KILLPEDRO		(C_INFO)
{
	npc		 = 	KDF_508_Gorax;
	nr		 = 	3;
	condition	 = 	DIA_Gorax_KILLPEDRO_Condition;
	information	 = 	DIA_Gorax_KILLPEDRO_Info;
	important	 = 	TRUE;
};

func int DIA_Gorax_KILLPEDRO_Condition ()
{
	if (Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void DIA_Gorax_KILLPEDRO_Info ()
{
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_00"); //PoËkej, ûold·ku. Pot¯ebuji si s tebou promluvit.
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_15_01"); //Co chceö?
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_02"); //Kl·öter se ocitl ve velice delik·tnÌ situaci.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_03"); //Moment·lnÏ se zd·, ûe nikdo nevÏ¯Ì nikomu. A potom ta vÏc s Pedrem, to je nav˝sost... (polkne)
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_04"); //M·m pro tebe ˙kol p¯Ìmo z nejvyööÌch mÌst. Nejsi Ëlenem bratrstva ohnÏ, a tedy jedin˝, kdo tu vÏc m˘ûe za¯Ìdit.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_05"); //Ale musÌm tÏ varovat. Pokud ti ten ˙kol zad·m, budeö jej muset splnit. Jakmile se dozvÌö, o co se jedn·, nebudeö uû mÌt na v˝bÏr. RozumÌö?
	
	Info_ClearChoices	(DIA_Gorax_KILLPEDRO);
	Info_AddChoice	(DIA_Gorax_KILLPEDRO, "ZapomeÚ na to. Je to na mÏ p¯Ìliö riskantnÌ.", DIA_Gorax_KILLPEDRO_nein );
	Info_AddChoice	(DIA_Gorax_KILLPEDRO, "ÿekni, co chceö.", DIA_Gorax_KILLPEDRO_ja );
};
func void DIA_Gorax_KILLPEDRO_nein ()
{
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_nein_15_00"); //ZapomeÚ na to. Je to na mÏ p¯Ìliö riskantnÌ.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_nein_14_01"); //V po¯·dku. V tom p¯ÌpadÏ zapomeÚ, ûe bych cokoliv ¯Ìkal.
	AI_StopProcessInfos (self);
};

func void DIA_Gorax_KILLPEDRO_ja ()
{
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_ja_15_00"); //ÿekni, co chceö.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_01"); //Dobr·. Poslouchej dob¯e, protoûe to ¯eknu jenom jednou.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_02"); //Serpentes chce, abys Pedra za jeho zradu potrestal smrtÌ, jakmile se ti dostane do rukou.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_03"); //Jakmile sv˘j ˙kol splnÌö, dostaneö zaplaceno.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_04"); //Nikdy jsem to ne¯ekl. A tys takÈ nic neslyöel, rozumÌö?

 	B_LogEntry (TOPIC_TraitorPedro, "Gorax mi vy¯Ìdil vzkaz od Serpenta, ûe pokud narazÌm na zr·dce Pedra, m·m ho bez okolk˘ zabÌt.");
	
	B_GivePlayerXP (XP_Gorax_KILLPEDRO_GotMission);
	MIS_Gorax_KillPedro = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

//########################################################################
//##
//##		Kapitel 4
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap4_EXIT_Condition;
	information = DIA_Gorax_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap4_EXIT_Condition()
{
	if (kapitel == 4)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gorax_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//########################################################################
//##
//##		Kapitel 5
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap5_EXIT_Condition;
	information = DIA_Gorax_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap5_EXIT_Condition()
{
	if (kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gorax_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};




 






























