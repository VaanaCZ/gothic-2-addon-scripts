// ************************************************************
// 			  					EXIT
// ************************************************************
INSTANCE DIA_Wolf_EXIT   (C_INFO)
{
	npc         = SLD_811_Wolf;
	nr          = 999;
	condition   = DIA_Wolf_EXIT_Condition;
	information = DIA_Wolf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wolf_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Wolf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo
// ************************************************************
instance DIA_Wolf_Hallo		(C_INFO)
{
	npc		 	= SLD_811_Wolf;
	nr		 	= 4;
	condition	= DIA_Wolf_Hallo_Condition;
	information	= DIA_Wolf_Hallo_Info;
	permanent 	= FALSE;
	description	= "Je všechno v poâádku?";
};

func int DIA_Wolf_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Wolf_Hallo_15_00"); //Jsi v poâádku?
	AI_Output (self, other, "DIA_Wolf_Hallo_08_01"); //Hej, já tê znám! Z kolonie!
	AI_Output (self, other, "DIA_Wolf_Hallo_08_02"); //Co tady chceš?
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Wolf_WannaJoin		(C_INFO)
{
	npc		 	= SLD_811_Wolf;
	nr		 	= 5;
	condition	= DIA_Wolf_WannaJoin_Condition;
	information	= DIA_Wolf_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "Pâišel jsem se k vám pâidat.";
};

func int DIA_Wolf_WannaJoin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wolf_Hallo))
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Wolf_WannaJoin_15_00"); //Pâišel jsem se k vám pâidat.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_01"); //Proè ne, já proti tobê nic nemám. Vždyã jsi z našeho dolu kdysi vyhnal stráže.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_02"); //Ale nepoèítej s tím, že tê takhle snadno pâijmou i ostatní.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_03"); //Od tý doby sem pâišla spousta nových lidí a nêkteâí staâí žoldáci už si na tebe asi ani nebudou pamatovat.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_04"); //Já tê taky skoro nepoznal, vypadáš nêjak zruchanê.
	AI_Output (other, self, "DIA_Wolf_WannaJoin_15_05"); //Když bariéra padla, sotva jsem si zachránil holý život.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_06"); //Tak tos mêl teda štêstí.
	
	B_LogEntry (TOPIC_SLDRespekt,"Vlkovi nebude vadit, když se pâipojím k žoldnéâùm.");
};

// ************************************************************
// 			  				WannaBuy
// ************************************************************
instance DIA_Wolf_WannaBuy		(C_INFO)
{
	npc		 	= SLD_811_Wolf;
	nr		 	= 6;
	condition	= DIA_Wolf_WannaBuy_Condition;
	information	= DIA_Wolf_WannaBuy_Info;
	permanent 	= FALSE;
	description	= "Nemáš nêco na prodej?";
};

func int DIA_Wolf_WannaBuy_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaBuy_Info ()
{
	AI_Output (other, self, "DIA_Wolf_WannaBuy_15_00"); //Nemáš nêco na prodej?
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_01"); //Ále, ani se neptej.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_02"); //O zbranê a zbroj se teë stará Bennet, jeden z têch nových chlápkù.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_03"); //V kolonii jsem vedl celou Leeovu zbrojírnu - a pak si pâijde nêjaký školený kováâ a bác, jsem bez práce.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_04"); //Zoufale potâebuju novou práci, i když tu nedêlám nic jinýho, než hlídám polnosti.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_05"); //Ale nevadí mi to, aspoà tu nemusím sedêt s rukama v klínê.
}; 

// ************************************************************
// 			  				WannaLearn
// ************************************************************
instance DIA_Wolf_WannaLearn (C_INFO)
{
	npc		 	= SLD_811_Wolf;
	nr		 	= 7;
	condition	= DIA_Wolf_WannaLearn_Condition;
	information	= DIA_Wolf_WannaLearn_Info;
	permanent 	= FALSE;
	description	= "Mùžeš mê nêèemu nauèit?";
};

func int DIA_Wolf_WannaLearn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaLearn_Info ()
{
	AI_Output (other, self, "DIA_Wolf_WannaLearn_15_00"); //Mùžu se u tebe nêèemu pâiuèit?
	AI_Output (self, other, "DIA_Wolf_WannaLearn_08_01"); //Jestli chceš, mùžu ti poradit pár trikù v zacházení s lukem. Nic lepšího teë stejnê dêlat nemùžu.
	
	Wolf_TeachBow = TRUE;
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Vlk mê nauèí zacházet s luky.");
};

// ************************************************************
// 			  				TEACH
// ************************************************************
var int Wolf_Merke_Bow;
// ------------------------------------------------------

instance DIA_Wolf_TEACH (C_INFO)
{
	npc		 	= SLD_811_Wolf;
	nr		 	= 8;
	condition	= DIA_Wolf_TEACH_Condition;
	information	= DIA_Wolf_TEACH_Info;
	permanent 	= TRUE;
	description	= "Chtêl bych se trochu vylepšit ve stâelbê.";
};

func int DIA_Wolf_TEACH_Condition ()
{
	if (Wolf_TeachBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Wolf_TEACH_15_00"); //Chtêl bych se trochu vylepšit ve stâelbê.
	AI_Output (self, other, "DIA_Wolf_TEACH_08_01"); //Co bych tê mêl nauèit?
	
	Wolf_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	
	Info_ClearChoices (DIA_Wolf_Teach);
	Info_AddChoice (DIA_Wolf_Teach, DIALOG_BACK, DIA_Wolf_Teach_Back);
	Info_AddChoice (DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	,DIA_Wolf_Teach_Bow_1);
	Info_AddChoice (DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow5 , B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Wolf_Teach_Bow_5);
};

FUNC VOID DIA_Wolf_Teach_Back ()
{
	if (Wolf_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output (self ,other,"DIA_Wolf_Teach_BACK_08_00"); //A je to. Už máš zase o nêco pâesnêjší mušku.
	};
	
	Info_ClearChoices (DIA_Wolf_Teach);
};

FUNC VOID DIA_Wolf_Teach_BOW_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 90);
	
	Info_ClearChoices (DIA_Wolf_Teach);
	Info_AddChoice (DIA_Wolf_Teach, DIALOG_BACK, DIA_Wolf_Teach_Back);
	Info_AddChoice (DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow1 , B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	,DIA_Wolf_Teach_Bow_1);
	Info_AddChoice (DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow5 , B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Wolf_Teach_Bow_5);
};

FUNC VOID DIA_Wolf_Teach_BOW_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 90);
	
	Info_ClearChoices (DIA_Wolf_Teach);
	Info_AddChoice (DIA_Wolf_Teach, DIALOG_BACK, DIA_Wolf_Teach_Back);
	Info_AddChoice (DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow1 , B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	,DIA_Wolf_Teach_BOW_1);
	Info_AddChoice (DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow5 , B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Wolf_Teach_BOW_5);
};

// ************************************************************
// 			  					PERM
// ************************************************************
instance DIA_Wolf_PERM		(C_INFO)
{
	npc		 	= SLD_811_Wolf;
	nr			= 9;
	condition	= DIA_Wolf_PERM_Condition;
	information	= DIA_Wolf_PERM_Info;
	permanent	= TRUE;
	description	= "Tak co? Už sis našel novou práci?";
};

func int DIA_Wolf_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Wolf_WannaBuy))
	&& (MIS_BengarsHelpingSLD == 0)
	&& (Wolf_IsOnBoard	!= LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Wolf_PERM_Info ()
{
	AI_Output (other, self, "DIA_Wolf_PERM_15_00"); //Tak co? Už sis našel novou práci?
	AI_Output (self, other, "DIA_Wolf_PERM_08_01"); //Ne, zatím ne. Dej mi vêdêt, jestli na nêco natrefíš.
};

// ************************************************************
// 			  					Stadt
// ************************************************************
instance DIA_Wolf_Stadt		(C_INFO)
{
	npc		 	= SLD_811_Wolf;
	nr			= 10;
	condition	= DIA_Wolf_Stadt_Condition;
	information	= DIA_Wolf_Stadt_Info;
	permanent	= FALSE;
	description	= "Zkoušel sis nêco najít ve mêstê?";
};

func int DIA_Wolf_Stadt_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Wolf_WannaBuy))
	&& (MIS_BengarsHelpingSLD == 0)
	&& (Wolf_IsOnBoard	!= LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Wolf_Stadt_Info ()
{
	AI_Output (other, self, "DIA_Wolf_Stadt_15_00"); //Zkoušel sis nêco najít ve mêstê?
	AI_Output (self, other, "DIA_Wolf_Stadt_08_01"); //Ve mêstê? (smêje se) Tam by mê nedostali ani párem volù!
	AI_Output (self, other, "DIA_Wolf_Stadt_08_02"); //Nebo si myslíš, že bych tam mêl dêlat nêjakýho vojáka z domobrany? Nedovedu si pâedstavit, že bych nosil uniformu jako nêjakej dvoâan.
	AI_Output (self, other, "DIA_Wolf_Stadt_08_03"); //A pak ta slepá poslušnost. Ne, zapomeà na to - možná tady na farmê nemám moc co na práci, ale aspoà si mùžu dêlat, co chci.
};


//#####################################################################
//##
//##
//##						Ab	KAPITEL  2
//##
//##
//#####################################################################

// ************************************************************
// 	  				   Wegen CrawlerArmor
// ************************************************************
var int MIS_Wolf_BringCrawlerPlates;
var int Wolf_MakeArmor;
var int Player_GotCrawlerArmor;
// ---------------------------------

INSTANCE DIA_Wolf_AboutCrawler(C_INFO)
{
	npc			= SLD_811_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_AboutCrawler_Condition;
	information	= DIA_Wolf_AboutCrawler_Info;
	permanent	= FALSE;
	description = "Slyšel jsem, že umíš vykovat zbroj z èervích krunýâù?";
};                       
FUNC INT DIA_Wolf_AboutCrawler_Condition()
{
	if (Kapitel >= 2)
	&& (Wolf_ProduceCrawlerArmor == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Wolf_AboutCrawler_Info()
{	
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_00"); //Slyšel jsem, že umíš vykovat zbroj z èervích krunýâù?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_01"); //To je fakt. Od koho ses to dozvêdêl?
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_02"); //Âekl mi to lovec jménem Gestath.
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_03"); //Dokázal bys takovou zbroj vyrobit?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_04"); //Jasnê. Pâines mi 10 èervích krunýâù a já ti ji vyrobím.
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_05"); //A kolik za ni budeš chtít?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_06"); //Na placení zapomeà, udêlám ti ji grátis, na památku starých dobrých èasù.
	
	MIS_Wolf_BringCrawlerPlates = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_RUNNING);
	B_LogEntry (TOPIC_Wolf_BringCrawlerPlates,"Vlk mi z 10 èervích krunýâù vyková zbroj.");
};


// ************************************************************
// 	  				  TeachCrawlerPlates
// ************************************************************

INSTANCE DIA_Wolf_TeachCrawlerPlates(C_INFO)
{
	npc			= SLD_811_Wolf;
	nr			= 2;
	condition	= DIA_Wolf_TeachCrawlerPlates_Condition;
	information	= DIA_Wolf_TeachCrawlerPlates_Info;
	permanent	= TRUE;
	description = B_BuildLearnString ("Vysvêtli mi, jak lze získat èerví krunýâ.", B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate));
};                       
FUNC INT DIA_Wolf_TeachCrawlerPlates_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Wolf_AboutCrawler))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Wolf_TeachCrawlerPlates_Info()
{	
	AI_Output (other, self, "DIA_Wolf_TeachCrawlerPlates_15_00"); //Mùžeš mê nauèit, jak èerví krunýâe oddêlit?
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
	{
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_01"); //To je jednoduché. Zadní krunýâe jsou totiž na têle pevnê pâichycené pouze na okrajích. Staèí je ostrým nožem odâíznout a je to.
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_02"); //Chápeš?
		AI_Output (other, self, "DIA_Wolf_TeachCrawlerPlates_15_03"); //To je jednoduché.
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_04"); //Vždyã to povídám.
	};
};

// ************************************************************
// 	  				   BringPlates
// ************************************************************

INSTANCE DIA_Wolf_BringPlates(C_INFO)
{
	npc			= SLD_811_Wolf;
	nr			= 3;
	condition	= DIA_Wolf_BringPlates_Condition;
	information	= DIA_Wolf_BringPlates_Info;
	permanent	= TRUE;
	description = "Sehnal jsem ty èerví krunýâe na brnêní.";
};                       
FUNC INT DIA_Wolf_BringPlates_Condition()
{
	if (MIS_Wolf_BringCrawlerPlates == LOG_RUNNING)
	&& (Npc_HasItems (other, ItAt_CrawlerPlate) >= 10)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Wolf_BringPlates_Info()
{	
	AI_Output (other, self, "DIA_Wolf_BringPlates_15_00"); //Sehnal jsem ty èerví krunýâe na brnêní.
	B_GiveInvItems (other, self, ItAt_CrawlerPlate, 10);
	AI_Output (self, other, "DIA_Wolf_BringPlates_08_01"); //Skvêlé, tak je sem dej!
		
	MIS_Wolf_BringCrawlerPlates = LOG_SUCCESS;
};


// ************************************************************
// 	  				  		ArmorReady
// ************************************************************
var int Wolf_Armor_Day;
// --------------------

INSTANCE DIA_Wolf_ArmorReady(C_INFO)
{
	npc			= SLD_811_Wolf;
	nr			= 4;
	condition	= DIA_Wolf_ArmorReady_Condition;
	information	= DIA_Wolf_ArmorReady_Info;
	permanent	= TRUE;
	description = "Prima, a kdy ta zbroj bude?";
};                       
FUNC INT DIA_Wolf_ArmorReady_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Wolf_AboutCrawler))
	&& (Player_GotCrawlerArmor == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Wolf_ArmorReady_Info()
{	
	AI_Output (other, self, "DIA_Wolf_ArmorReady_15_00"); //Prima, a kdy ta zbroj bude?

	if (Npc_HasItems (self, ItAt_CrawlerPlate) >= 10)
	{
		if (Wolf_MakeArmor == FALSE)
		{
			Wolf_Armor_Day = (Wld_GetDay() + 1);
			Wolf_MakeArmor = TRUE;
		};
		
		if (Wolf_MakeArmor == TRUE)
		&& (Wolf_Armor_Day > Wld_GetDay())
		{
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_01"); //Jen co ji dám dohromady. Vraã se zítra.
		}
		else
		{
			CreateInvItems (self, ItAr_Djg_Crawler, 1);
			Npc_RemoveInvItems (self, ItAt_CrawlerPlate, 10);
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_02"); //Už je hotová - tady je.
			B_GiveInvItems (self, other, ItAr_Djg_Crawler, 1);
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_03"); //Jak tak koukám, to provedení je fakt skvêlé.
			AI_Output (other, self, "DIA_Wolf_ArmorReady_15_04"); //Díky!
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_05"); //Není zaè.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Wolf_ArmorReady_08_06"); //Ty vtipálku, nejdâív potâebuju ty èerví krunýâe.
		Wolf_MakeArmor = FALSE;
		MIS_Wolf_BringCrawlerPlates = LOG_RUNNING;
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Wolf_KAP3_EXIT(C_INFO)
{
	npc			= SLD_811_Wolf;
	nr			= 999;
	condition	= DIA_Wolf_KAP3_EXIT_Condition;
	information	= DIA_Wolf_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Wolf_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Wolf_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info bengar
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_BENGAR		(C_INFO)
{
	npc		 = 	SLD_811_Wolf;
	nr		 = 	31;
	condition	 = 	DIA_Wolf_BENGAR_Condition;
	information	 = 	DIA_Wolf_BENGAR_Info;
	permanent	 = 	TRUE;

	description	 = 	"Možná jsem ti našel práci u Bengara na statku.";
};

func int DIA_Wolf_BENGAR_Condition ()
{
	 if (Npc_KnowsInfo(other, DIA_Wolf_HALLO))
	 && (MIS_BengarsHelpingSLD == LOG_RUNNING)
	 && (Kapitel >= 3)
	 && (Wolf_IsOnBoard	 != LOG_SUCCESS)
	  		{
				return TRUE;
	 		};
};

var int DIA_Wolf_BENGAR_oneTime;
var int Wolf_BENGAR_geld;

func void DIA_Wolf_BENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_00"); //Možná jsem ti našel práci u Bengara na statku.

	if (DIA_Wolf_BENGAR_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Wolf_BENGAR_08_01"); //Tak povídej.
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_02"); //Pâímo u Bengarova statku ústí prùsmyk do Hornického údolí, kterým se poâád snaží prodrat nêjaké obludy. Nemusím ani dodávat, že z nich má ten sedlák pêknê têžkou hlavu.
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_03"); //Proto je tâeba, aby Bengarùv statek nêkdo stâežil.
	AI_Output			(self, other, "DIA_Wolf_BENGAR_08_04"); //Na tom by mohlo nêco být. Aspoà budu venku na poli a nebudu muset poâád okounêt tady u kovárny.
	DIA_Wolf_BENGAR_oneTime = TRUE;
	};
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_05"); //Souhlasím. A když jsi teë jedním z nás, udêlám ti dobrou cenu. Dej mi 300 zlaãákù a já tam hned vyrazím.
			Wolf_BENGAR_geld = 300;
		}
		else
		{
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_06"); //Dobâe. Dêlá to 800 zlaãákù.
			AI_Output			(other, self, "DIA_Wolf_BENGAR_15_07"); //To je poâádný balík.
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_08"); //No, pro nêkoho z nás bych to udêlal za babku, ale pro tebe...
			Wolf_BENGAR_geld = 800;
		};

	Info_ClearChoices	(DIA_Wolf_BENGAR);
	Info_AddChoice	(DIA_Wolf_BENGAR, "Budu o tom pâemýšlet.", DIA_Wolf_BENGAR_nochnicht );
	Info_AddChoice	(DIA_Wolf_BENGAR, "Tady je zlato.", DIA_Wolf_BENGAR_geld );
};
func void DIA_Wolf_BENGAR_geld ()
{
	AI_Output			(other, self, "DIA_Wolf_BENGAR_geld_15_00"); //Tady je zlato.

	if (B_GiveInvItems (other, self, ItMi_Gold,	Wolf_BENGAR_geld))
	{
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_01"); //Fajn, a teë pùjdu dohlídnout na ty nestvùry. Uvidíme, jestli se mi na té farmê podaâí ještê nêkoho naverbovat.
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_02"); //Tak se zatím mêj.
		
	
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		B_GivePlayerXP (XP_BengarsHelpingSLD);
		AI_StopProcessInfos (self);
		AI_UseMob			(self,"BENCH",-1);
		Npc_ExchangeRoutine	(self,"BengarsFarm");
		B_StartOtherRoutine 	(SLD_815_Soeldner,"BengarsFarm");
		B_StartOtherRoutine 	(SLD_817_Soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_03"); //No, kdybys mêl dost penêz, už bych byl dávno na cestê.
	};
	Info_ClearChoices	(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht ()
{
	AI_Output			(other, self, "DIA_Wolf_BENGAR_nochnicht_15_00"); //Budu o tom pâemýšlet.
	AI_Output			(self, other, "DIA_Wolf_BENGAR_nochnicht_08_01"); //Fajn, ale ne abys mê shodil.
	Info_ClearChoices	(DIA_Wolf_BENGAR);
};

///////////////////////////////////////////////////////////////////////
//	Info permKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_PERMKAP3		(C_INFO)
{
	npc		 = 	SLD_811_Wolf;
	nr		 = 	80;
	condition	 = 	DIA_Wolf_PERMKAP3_Condition;
	information	 = 	DIA_Wolf_PERMKAP3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Je všechno v poâádku?";
};

func int DIA_Wolf_PERMKAP3_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_GetDistToWP(self,"FARM3")<3000) 
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& (Wolf_IsOnBoard	 != LOG_SUCCESS)
		{
				return TRUE;
		};
};
var int DIA_Wolf_PERMKAP3_onetime;
func void DIA_Wolf_PERMKAP3_Info ()
{
	AI_Output			(other, self, "DIA_Wolf_PERMKAP3_15_00"); //Tak co, všechno v cajku?

	if ((Npc_IsDead(Bengar))&&(DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output			(self, other, "DIA_Wolf_PERMKAP3_08_01"); //Mùj zamêstnavatel je mrtvý. No, a já si vždycky pâál mít vlastní statek.
		AI_StopProcessInfos (self);	
		Npc_ExchangeRoutine	(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Wolf_PERMKAP3_08_02"); //No jasnê! Všude ticho jako v chrámu!
	};
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Wolf_KAP4_EXIT(C_INFO)
{
	npc			= SLD_811_Wolf;
	nr			= 999;
	condition	= DIA_Wolf_KAP4_EXIT_Condition;
	information	= DIA_Wolf_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Wolf_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Wolf_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Wolf_KAP5_EXIT(C_INFO)
{
	npc			= SLD_811_Wolf;
	nr			= 999;
	condition	= DIA_Wolf_KAP5_EXIT_Condition;
	information	= DIA_Wolf_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Wolf_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Wolf_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info ship
///////////////////////////////////////////////////////////////////////
var int wolf_SaidNo;

instance DIA_Wolf_SHIP		(C_INFO)
{
	npc		 = 	SLD_811_Wolf;
	nr		 = 	2;
	condition	 = 	DIA_Wolf_SHIP_Condition;
	information	 = 	DIA_Wolf_SHIP_Info;

	description	 = 	"Chtêl bys odsud odplout?";
};

func int DIA_Wolf_SHIP_Condition ()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Wolf_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Wolf_SHIP_Info ()
{
	AI_Output			(other, self, "DIA_Wolf_SHIP_15_00"); //Nelíbilo by se ti odsud vyplout na lodi?

	if (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& (!Npc_IsDead (Bengar))
	{
	AI_Output			(self, other, "DIA_Wolf_SHIP_08_01"); //Ne, už ne. Koneènê jsem si našel práci. Možná nêkdy jindy.
	wolf_SaidNo = TRUE;
	}
	else
	{
	AI_Output			(self, other, "DIA_Wolf_SHIP_08_02"); //No jasnê, pojëme odsud. Mùžu ti pomoct s obranou lodi. A kam máme namíâeno?
	MIS_BengarsHelpingSLD = LOG_OBSOLETE;
	
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                                             
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                                             
	B_LogEntry (TOPIC_Crew,"Vlk už má tohoto ostrova plné zuby a udêlal by cokoliv, jen aby se odsud dostal. Je to dobrý bojovník."); 
	};
};

///////////////////////////////////////////////////////////////////////
//Ich muß zu einer Insel nicht weit von dieser hier.
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_811_Wolf;
	nr			 = 	2;
	condition	 = 	DIA_Wolf_KnowWhereEnemy_Condition;
	information	 = 	DIA_Wolf_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Chci se dostat na ostrov nedaleko odsud.";
};
func int DIA_Wolf_KnowWhereEnemy_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Wolf_SHIP))
	&& (Wolf_SaidNo == FALSE)
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Wolf_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Wolf_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Wolf_KnowWhereEnemy_15_00"); //Chci se dostat na ostrov nedaleko odsud.
	AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_01"); //No tak na co ještê èekáme? Na moâi tê mùžu trochu pocvièit ve stâelbê z luku a kuše.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Wolf_KnowWhereEnemy_15_02"); //Vlastnê jsem si zrovna uvêdomil, že už mám dost lidí.
		AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_03"); //(naštvanê) Tak TAKHLE to je! Nejdâív prudíš, aã se pohnu, a pak z toho nic není, co?
		AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_04"); //Jdi do hajzlu! Doufám, že se ta tvoje kocábka brzo potopí.
		AI_StopProcessInfos (self);
	}
	else 
	{
		Info_ClearChoices (DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice (DIA_Wolf_KnowWhereEnemy,"Musím o tom ještê trochu popâemýšlet.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Wolf_KnowWhereEnemy,"Vítej na palubê!",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Wolf_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_Yes_15_00"); //Vítej na palubê!
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_Yes_15_01"); //Pâijë dolù do pâístavu, už brzo vyplujeme.
	AI_Output (self ,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02"); //Už jdu.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                              
	                                                                                                     
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Wolf_IsOnBoard	 = LOG_SUCCESS;
	
	crewmember_Count = (Crewmember_Count +1);
	AI_StopProcessInfos (self);	

	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
};

FUNC VOID DIA_Wolf_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_No_15_00"); //Musím o tom ještê trochu popâemýšlet.
	AI_Output (self ,other,"DIA_Wolf_KnowWhereEnemy_No_08_01"); //Hele, víš, co si myslím? Že se jenom tak vytahuješ. Nevêâím ti ani slovo, vysmahni!

	Wolf_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Wolf_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_811_Wolf;
	nr			 = 	55;
	condition	 = 	DIA_Wolf_LeaveMyShip_Condition;
	information	 = 	DIA_Wolf_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Stejnê už mi nejsi k nièemu.";
};
func int DIA_Wolf_LeaveMyShip_Condition ()
{	
	if (Wolf_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Wolf_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Wolf_LeaveMyShip_15_00"); //Stejnê už mi nejsi k nièemu.
	AI_Output			(self, other, "DIA_Wolf_LeaveMyShip_08_01"); //Nejdâív mi dáš nadêji, a pak mê takhle odmítneš. Ty svinê, za tohle zaplatíš!
	
	Wolf_IsOnBoard	 = LOG_FAILED;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Npc_ExchangeRoutine (self,"Zaèít"); 
};

///////////////////////////////////////////////////////////////////////
//	Info shipoff
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_SHIPOFF		(C_INFO)
{
	npc		 = 	SLD_811_Wolf;
	nr		 = 	56;
	condition	 = 	DIA_Wolf_SHIPOFF_Condition;
	information	 = 	DIA_Wolf_SHIPOFF_Info;
	permanent	 = 	TRUE;

	description	 = 	"Poslouchej.";
};

func int DIA_Wolf_SHIPOFF_Condition ()
{
	if (Wolf_IsOnBoard	== LOG_FAILED)
		{
				return TRUE;
		};
};

func void DIA_Wolf_SHIPOFF_Info ()
{
	AI_Output			(other, self, "DIA_Wolf_SHIPOFF_15_00"); //Poslouchej.
	AI_Output			(self, other, "DIA_Wolf_SHIPOFF_08_01"); //Jdi do prdele, ty zkurvysynu!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Wolf_KAP6_EXIT(C_INFO)
{
	npc			= SLD_811_Wolf;
	nr			= 999;
	condition	= DIA_Wolf_KAP6_EXIT_Condition;
	information	= DIA_Wolf_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Wolf_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Wolf_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wolf_PICKPOCKET (C_INFO)
{
	npc			= SLD_811_Wolf;
	nr			= 900;
	condition	= DIA_Wolf_PICKPOCKET_Condition;
	information	= DIA_Wolf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Wolf_PICKPOCKET_Condition()
{
	C_Beklauen (32, 35);
};
 
FUNC VOID DIA_Wolf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wolf_PICKPOCKET);
	Info_AddChoice		(DIA_Wolf_PICKPOCKET, DIALOG_BACK 		,DIA_Wolf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wolf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wolf_PICKPOCKET_DoIt);
};

func void DIA_Wolf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wolf_PICKPOCKET);
};
	
func void DIA_Wolf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wolf_PICKPOCKET);
};


























 
































