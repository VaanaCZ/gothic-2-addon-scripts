// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Maria_EXIT   (C_INFO)
{
	npc         = BAU_910_Maria;
	nr          = 999;
	condition   = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 1;
	condition	= DIA_Maria_Hallo_Condition;
	information	= DIA_Maria_Hallo_Info;
	permanent  	= FALSE;
	description = "Kdo jsi?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //Kdo jsi?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Jsem Onarova žena, Maria.
	AI_Output (self, other, "DIA_Maria_Hallo_17_02"); //Co tady chceš?
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 2;
	condition	= DIA_Maria_Umsehen_Condition;
	information	= DIA_Maria_Umsehen_Info;
	permanent  	= FALSE;
	description = "Jen jsem se tu chtęl porozhlédnout...";
};

func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Jen jsem si to chtęl tady prohlédnout.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //S tolika chlapama na farmę se teë nemůžu uvnitâ domu moc zdržovat.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //Prostę sem jen tak vpadli.
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 3;
	condition	= DIA_Maria_Soeldner_Condition;
	information	= DIA_Maria_Soeldner_Info;
	permanent  	= FALSE;
	description = "Obtęžují tę ti žoldáci?";
};

func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //Obtęžují tę ti žoldáci?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Hele, zapomeŕ na to, co jsem právę âekla - je tu teë mnohem bezpečnęji, co se ti chlapi objevili.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //No, pâinejmenším je tu teë, co jsou tu žoldáci, mnohem bezpečnęji.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Dokud jsme tu byli sami, pokaždé pâišla domobrana z męsta a sebrala naši úrodu.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Sebrali nejlepší část úrody. A taky si vzali pár ovcí. Nedali nám za to vůbec nic.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //Nękteâí z tęch ničemů se tu dokonce odvážili krást.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //Nevysvętluj si to nijak zle, vojáku. Vím, že takoví nejsou všichni.
		};	
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 4;
	condition	= DIA_Maria_Mission_Condition;
	information	= DIA_Maria_Mission_Info;
	permanent  	= FALSE;
	description = "Tak co ti ukradli?";
};

func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //Tak co ti ukradli?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //Vętšinou zlato a stâíbro. Taky nám sebrali svatební dar. Zlatý tác.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //Vsadím se, že teë se na nęm usazuje prach v truhle nęjakého mizerného męstského strážného.
	};
	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 5;
	condition	= DIA_Maria_BringPlate_Condition;
	information	= DIA_Maria_BringPlate_Info;
	permanent  	= FALSE;
	description = "Mám u sebe zlatý tác. Není náhodou tvůj?";
};

func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1);
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //Mám u sebe zlatý tác. Není náhodou tvůj?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //Ano! To je on! Tisíceré díky!
	
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP (XP_Maria_Teller);
};


// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------

instance DIA_Maria_Belohnung	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 6;
	condition	= DIA_Maria_Belohnung_Condition;
	information	= DIA_Maria_Belohnung_Info;
	permanent  	= TRUE;
	description = "A co takhle nęjakou odmęnu?";
};

func int DIA_Maria_Belohnung_Condition ()
{
	if (MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //A co takhle nęjakou odmęnu?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //Pracuješ pro mého manžela jako žoldnéâ, ne?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Správnę.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //Kolik ti platí?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //To tedy moc není. Zajdi za ním a âekni mu, aă ti pâidá.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //A myslíš, že to udęlá?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //Ví, co by se stalo, kdyby ne. Vęâ mi.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //Chceš se tady na farmę nechat najmout jako žoldák?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "Ne - vážnę ne.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Ano.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Tady, vezmi si to. Zasloužíš si to.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //Ne - vážnę ne.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Tak si na oplátku vezmi tohle zlato. Zasloužil sis to.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Ano.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //Dobrá, pokud tady pracuješ, tak dohlédnu na to, abys dostával slušný žold.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Vraă se, až si s mým manželem promluvíš o tvém platu.
	Info_ClearChoices (DIA_Maria_Belohnung);
};
		
// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 7;
	condition	= DIA_Maria_AboutOnar_Condition;
	information	= DIA_Maria_AboutOnar_Info;
	permanent  	= FALSE;
	description = "Povęz mi nęco o Onarovi.";
};

func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, "DIA_Maria_AboutOnar_15_00"); //Âekni mi nęco o Onarovi.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //Je to fajn chlap. Trochu nabručený a hodnę netrpęlivý, ale všichni máme své chyby.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //Âekla jsem svému muži, proč ty vojáky nechá, aby s ním takhle zacházeli.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //Dęlej nęco, âíkám.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Tak najal žoldnéâe. Teë se cítím jako uprostâed války.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //Ale my vlastnę jsme ve válce, nebo ne?
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 8;
	condition	= DIA_Maria_PERM_Condition;
	information	= DIA_Maria_PERM_Info;
	permanent  	= FALSE;
	description = "Stalo se poslední dobou nęco zajímavého?";
};

func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //Stalo se poslední dobou nęco zajímavého?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //Prošli tudy paladinové.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //Nejdâív jsme si mysleli, že pâišli napadnout farmu, ale ve skutečnosti męli namíâeno do Hornického údolí.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Wasili načapal pâed pár dny v noci zlodęje. Jinak je tady klid.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //Je to tu mnohem klidnęjší, co nękteâí ze žoldnéâů odešli.
	};
};
			

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maria_PICKPOCKET (C_INFO)
{
	npc			= BAU_910_Maria;
	nr			= 900;
	condition	= DIA_Maria_PICKPOCKET_Condition;
	information	= DIA_Maria_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen (60, 110);
};
 
FUNC VOID DIA_Maria_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maria_PICKPOCKET);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_BACK 		,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};
	
func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


			
			
			
			



	















