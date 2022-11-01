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
	description = "(Ukradení tohoto klíče bude zatracenę tęžké)";
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
	AI_Output (self, other, "DIA_Gorax_HELP_14_00"); //Mohu ti nęjak pomoci?
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
	description	 = 	"Pâinesl jsem kopu zlata.";
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
	AI_Output (other, self, "DIA_Gorax_GOLD_15_00"); //Pâinesl jsem kopu zlata.
	
	if (Npc_HasItems (other, ItMi_Gold) >= Summe_Kloster)
	{
		AI_Output (self, other, "DIA_Gorax_GOLD_14_01"); //(pln očekávání) Ach - pâinášíš dar Innosovi. Velmi dobâe, můj synu.
		AI_Output (self, other, "DIA_Gorax_GOLD_14_02"); //Použiju tvůj dar ve prospęch kláštera, jak si Innos pâeje.
	
		DIA_Gorax_GOLD_perm = TRUE; //WICHTIG
		B_GiveInvItems (other, self, ItMi_Gold, Summe_Kloster);
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_14_02"); //Co jsi s tím zlatem udęlal? Utratils ho? Pâines ho sem!
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

	description	 = 	"Mám tu sošku, kterou męl Daron donést do kláštera.";
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
	AI_Output	(other, self, "DIA_Addon_Gorax_DaronsStatue_15_00"); //Mám tady tu sošku, kterou męl Daron pâinést do kláštera.
	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	{
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_01"); //(povzdech) Je to trapné, že nám tak cennou vęc pâinesl jen rádoby novic.
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_02"); //Ale zároveŕ to potvrzuje tvé rozhodnutí sloužit Innosovi.
		
		//-----------PATCH M.F.----------------------
		if B_GiveInvItems (other, self, ItMi_LostInnosStatue_Daron,1)
		{
			Npc_RemoveInvItems (self, ItMi_LostInnosStatue_Daron,1);
		};
		
		
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_03"); //Jsem ti velmi vdęčný, mladý novici.
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_ReturnedLostInnosStatue_Daron);
		DIA_Gorax_GOLD_perm = TRUE; //WICHTIG
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_04"); //Sošku? Já tu žádnou sošku nevidím. Napâed mi ji pâines a pak možná té tvé historce uvęâím.
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
	description	 = 	"Hledám místo, kde bych se mohl vyspat.";
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
	AI_Output (other, self, "DIA_Gorax_SLEEP_15_00"); //Hledám místo, kde bych se mohl vyspat.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_01"); //Hned vedle dveâí je volná postel. První napravo, vedle vchodu. Můžeš spát tam.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_02"); //Svoje vęci si můžeš dát do nękteré z nepoužívaných truhel.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_03"); //A nezapomeŕ - v ložnicích mágů nemáš co pohledávat. Také nesmíš vstupovat do knihovny, leda že bys męl výslovné povolení.
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
	description	 = 	"Máš pro mę nęjaký úkol?";
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
	AI_Output (other, self, "DIA_Gorax_Aufgabe_15_00"); //Máš pro mę nęjaký úkol?
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_01"); //Vy novicové v poslední dobę pracujete tvrdę. A ti, kdo hodnę pracují, by také męli hodnę jíst.
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_02"); //Tady máš klíč od spižírny. Najdeš tam skopové klobásy. Rozdęl je mezi novice - ale spravedlivę!
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_03"); //Až budeš hotov, zase za mnou pâijë.
	 
	CreateInvItems (self, ItKe_KlosterStore,1); 
	B_GiveInvItems (self, other, ItKe_KlosterStore,1);
	MIS_GoraxEssen = LOG_RUNNING; 
	
	Log_CreateTopic (Topic_GoraxEssen,LOG_MISSION);
	Log_SetTopicStatus (Topic_GoraxEssen,LOG_RUNNING);
	B_LogEntry (Topic_GoraxEssen,"Mistr Gorax chce, abych skopové klobásy ze spižírny spravedlivę rozdęlil mezi novice. Kromę mę jich klášter obývá celkem tâináct.");
};
///////////////////////////////////////////////////////////////////////
//	Info Würste verteilt
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Wurst		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  2;
	condition	 = 	DIA_Gorax_Wurst_Condition;
	information	 = 	DIA_Gorax_Wurst_Info;
	permanent	 =  TRUE;
	description	 = 	"Rozdal jsem novicům ty klobásy (úkol splnęn).";
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
	AI_Output (other, self, "DIA_Gorax_Wurst_15_00"); //Rozdęlil jsem ty klobásy.
	
	if (Wurst_Gegeben >= 13)
	{
		AI_Output (self, other, "DIA_Gorax_Wurst_14_01"); //A učinil jsi tak spravedlivę. Vezmi si tenhle svitek s léčivým kouzlem - a bęž si zase po své práci.
		
		MIS_GoraxEssen = LOG_SUCCESS; 
		B_GivePlayerXP (XP_GoraxEssen);
		B_GiveInvItems (self, other, ItSc_LightHeal,2);
	}
	else 
	{
		AI_Output (self, other, "DIA_Gorax_Wurst_14_02"); //Vážnę? V tom pâípadę ses ale pâi plnęní toho úkolu moc nesnažil.
		AI_Output (self, other, "DIA_Gorax_Wurst_14_03"); //Buë jsi ty klobásy snędl sám, nebo jsi nękomu dal víc, než mu náleželo.
		AI_Output (self, other, "DIA_Gorax_Wurst_14_04"); //Poslouchej, protože jsi nový, nechám to protentokrát být. Ale pâíštę budu pâísnęjší!
		
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
	description	 = 	"Máš pro mę nęjaký další úkol?";
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
	AI_Output (other, self, "DIA_Gorax_Aufgabe2_15_00"); //Máš pro mę nęjaký další úkol?
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_01"); //Ano. Jak víš, dęláme tady výborné víno a také je prodáváme.
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_02"); //Orlan, majitel hostince "U Mrtvé harpyje", si objednal dodávku. Dohodli jsme se, že za ty láhve zaplatí 240 zlatých.
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_03"); //Dones mu tyto láhve - ale nenech se ošidit.
	 
	B_GiveInvItems (self, other, ItFo_Wine,12);
	MIS_GoraxWein = LOG_RUNNING; 
	
	Log_CreateTopic (Topic_GoraxWein,LOG_MISSION);
	Log_SetTopicStatus (Topic_GoraxWein,LOG_RUNNING);
	B_LogEntry (Topic_GoraxWein,"Mistr Gorax chce, abych hospodskému Orlanovi doručil dvanáct lahví vína. Męl by mi za nę dát 240 zlaăáků.");
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
		AI_Output (self, other, "DIA_Gorax_Orlan_14_01"); //A dostal jsi 240 zlatých?
	
		DIA_Gorax_Orlan_permanent = TRUE;
		Info_ClearChoices (DIA_Gorax_Orlan);
	
		Info_AddChoice (DIA_Gorax_Orlan,"Ten šizuŕk mę ošulil! (Pâedat 100 zlaăáků.)",DIA_Gorax_Orlan_100);
		Info_AddChoice (DIA_Gorax_Orlan,"Tady je zlato. (Odevzdat 240 zlaăáků.)",DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_14_02"); //Co jsi s tím zlatem udęlal? Utratils ho? Pâines ho sem!
		
	};
};
FUNC VOID DIA_Gorax_Orlan_100 ()
{
	AI_Output (other, self, "DIA_Gorax_Orlan_100_15_00"); //Dal mi ménę!
	AI_Output (self, other, "DIA_Gorax_Orlan_100_14_01"); //Tys mu to prodal lacinęji? To ne, proč jen jsem ze všech lidí posílal právę TEBE?
	AI_Output (self, other, "DIA_Gorax_Orlan_100_14_02"); //Jsi naprosto a totálnę neschopný. Bęž mi z očí.
	
	B_GiveInvItems (other, self, ItMI_Gold, 100);
	
	MIS_GoraxWein = LOG_FAILED;
	 
	Info_ClearChoices (DIA_Gorax_Orlan);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Gorax_Orlan_240 ()
{
	AI_Output (other, self, "DIA_Gorax_Orlan_240_15_00"); //Dostal jsem ty peníze.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 240)	
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_240_14_01"); //Výbornę. Jsi vážnę schopný. Jako odmęnu si vezmi tenhle svitek s léčivým kouzlem. A teë bęž a najdi si nęjakou další práci.
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP (XP_Goraxwein);			
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_240_14_02"); //Ale část tęch penęz jsi už stačil utratit, co? Jsi k ničemu - zmiz!
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
	description	 = 	"Jakou práci tu vykonáváš?";
};
func int DIA_Gorax_JOB_Condition ()
{
	return TRUE;
};
func void DIA_Gorax_JOB_Info ()
{
	AI_Output (other, self, "DIA_Gorax_JOB_15_00"); //Co tu máš na práci?
	AI_Output (self, other, "DIA_Gorax_JOB_14_01"); //Mé úkoly jsou mnohé a různorodé. Nejsem jen správce, jsem též strážcem pokladnice.
	AI_Output (self, other, "DIA_Gorax_JOB_14_02"); //Navíc dohlížím na vinný sklep a starám se o klášterní zásoby jídla.
	AI_Output (self, other, "DIA_Gorax_JOB_14_03"); //Takže pokud budeš nęco potâebovat, můžeš za mnou kdykoliv zajít a dostaneš to - samozâejmę za rozumnou protihodnotu.
	
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistr Gorax mę může zásobit vším, co bych mohl v klášteâe upotâebit.");
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
	description	 = 	"Potâebuji pár vęcí...";
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
	AI_Output			(other, self, "DIA_Gorax_TRADE_15_00"); //Potâebuji pár vęcí.
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP für KDF
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_KDF		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  5;
	condition	 = 	DIA_Gorax_KDF_Condition;
	information	 = 	DIA_Gorax_KDF_Info;
	permanent 	 =  FALSE;
	description	 = 	"Potâebuji nové místo na spaní.";
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
	AI_Output (other, self, "DIA_Gorax_KDF_15_00"); //Potâebuji nové místo na spaní.
	AI_Output (self, other, "DIA_Gorax_KDF_14_01"); //Napravo odsud je volný pokoj. Vezmi si tenhle klíč. Najdeš tam všechno, co potâebuješ.
	
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
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_00"); //Počkej, žoldáku. Potâebuji si s tebou promluvit.
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_15_01"); //Co chceš?
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_02"); //Klášter se ocitl ve velice delikátní situaci.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_03"); //Momentálnę se zdá, že nikdo nevęâí nikomu. A potom ta vęc s Pedrem, to je navýsost... (polkne)
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_04"); //Mám pro tebe úkol pâímo z nejvyšších míst. Nejsi členem bratrstva ohnę, a tedy jediný, kdo tu vęc může zaâídit.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_05"); //Ale musím tę varovat. Pokud ti ten úkol zadám, budeš jej muset splnit. Jakmile se dozvíš, o co se jedná, nebudeš už mít na výbęr. Rozumíš?
	
	Info_ClearChoices	(DIA_Gorax_KILLPEDRO);
	Info_AddChoice	(DIA_Gorax_KILLPEDRO, "Zapomeŕ na to. Je to na mę pâíliš riskantní.", DIA_Gorax_KILLPEDRO_nein );
	Info_AddChoice	(DIA_Gorax_KILLPEDRO, "Âekni, co chceš.", DIA_Gorax_KILLPEDRO_ja );
};
func void DIA_Gorax_KILLPEDRO_nein ()
{
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_nein_15_00"); //Zapomeŕ na to. Je to na mę pâíliš riskantní.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_nein_14_01"); //V poâádku. V tom pâípadę zapomeŕ, že bych cokoliv âíkal.
	AI_StopProcessInfos (self);
};

func void DIA_Gorax_KILLPEDRO_ja ()
{
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_ja_15_00"); //Âekni, co chceš.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_01"); //Dobrá. Poslouchej dobâe, protože to âeknu jenom jednou.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_02"); //Serpentes chce, abys Pedra za jeho zradu potrestal smrtí, jakmile se ti dostane do rukou.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_03"); //Jakmile svůj úkol splníš, dostaneš zaplaceno.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_04"); //Nikdy jsem to neâekl. A tys také nic neslyšel, rozumíš?

 	B_LogEntry (TOPIC_TraitorPedro, "Gorax mi vyâídil vzkaz od Serpenta, že pokud narazím na zrádce Pedra, mám ho bez okolků zabít.");
	
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




 






























