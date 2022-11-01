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
	AI_Output (self, other, "DIA_Wolf_Hallo_08_01"); //Hej, já tę znám! Z kolonie!
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
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_01"); //Proč ne, já proti tobę nic nemám. Vždyă jsi z našeho dolu kdysi vyhnal stráže.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_02"); //Ale nepočítej s tím, že tę takhle snadno pâijmou i ostatní.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_03"); //Od tý doby sem pâišla spousta nových lidí a nękteâí staâí žoldáci už si na tebe asi ani nebudou pamatovat.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_04"); //Já tę taky skoro nepoznal, vypadáš nęjak zruchanę.
	AI_Output (other, self, "DIA_Wolf_WannaJoin_15_05"); //Když bariéra padla, sotva jsem si zachránil holý život.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_06"); //Tak tos męl teda štęstí.
	
	B_LogEntry (TOPIC_SLDRespekt,"Vlkovi nebude vadit, když se pâipojím k žoldnéâům.");
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
	description	= "Nemáš nęco na prodej?";
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
	AI_Output (other, self, "DIA_Wolf_WannaBuy_15_00"); //Nemáš nęco na prodej?
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_01"); //Ále, ani se neptej.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_02"); //O zbranę a zbroj se teë stará Bennet, jeden z tęch nových chlápků.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_03"); //V kolonii jsem vedl celou Leeovu zbrojírnu - a pak si pâijde nęjaký školený kováâ a bác, jsem bez práce.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_04"); //Zoufale potâebuju novou práci, i když tu nedęlám nic jinýho, než hlídám polnosti.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_05"); //Ale nevadí mi to, aspoŕ tu nemusím sedęt s rukama v klínę.
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
	description	= "Můžeš mę nęčemu naučit?";
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
	AI_Output (other, self, "DIA_Wolf_WannaLearn_15_00"); //Můžu se u tebe nęčemu pâiučit?
	AI_Output (self, other, "DIA_Wolf_WannaLearn_08_01"); //Jestli chceš, můžu ti poradit pár triků v zacházení s lukem. Nic lepšího teë stejnę dęlat nemůžu.
	
	Wolf_TeachBow = TRUE;
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Vlk mę naučí zacházet s luky.");
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
	description	= "Chtęl bych se trochu vylepšit ve stâelbę.";
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
	AI_Output (other, self, "DIA_Wolf_TEACH_15_00"); //Chtęl bych se trochu vylepšit ve stâelbę.
	AI_Output (self, other, "DIA_Wolf_TEACH_08_01"); //Co bych tę męl naučit?
	
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
		AI_Output (self ,other,"DIA_Wolf_Teach_BACK_08_00"); //A je to. Už máš zase o nęco pâesnęjší mušku.
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
	AI_Output (self, other, "DIA_Wolf_PERM_08_01"); //Ne, zatím ne. Dej mi vędęt, jestli na nęco natrefíš.
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
	description	= "Zkoušel sis nęco najít ve męstę?";
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
	AI_Output (other, self, "DIA_Wolf_Stadt_15_00"); //Zkoušel sis nęco najít ve męstę?
	AI_Output (self, other, "DIA_Wolf_Stadt_08_01"); //Ve męstę? (smęje se) Tam by mę nedostali ani párem volů!
	AI_Output (self, other, "DIA_Wolf_Stadt_08_02"); //Nebo si myslíš, že bych tam męl dęlat nęjakýho vojáka z domobrany? Nedovedu si pâedstavit, že bych nosil uniformu jako nęjakej dvoâan.
	AI_Output (self, other, "DIA_Wolf_Stadt_08_03"); //A pak ta slepá poslušnost. Ne, zapomeŕ na to - možná tady na farmę nemám moc co na práci, ale aspoŕ si můžu dęlat, co chci.
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
	description = "Slyšel jsem, že umíš vykovat zbroj z červích krunýâů?";
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
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_00"); //Slyšel jsem, že umíš vykovat zbroj z červích krunýâů?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_01"); //To je fakt. Od koho ses to dozvędęl?
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_02"); //Âekl mi to lovec jménem Gestath.
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_03"); //Dokázal bys takovou zbroj vyrobit?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_04"); //Jasnę. Pâines mi 10 červích krunýâů a já ti ji vyrobím.
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_05"); //A kolik za ni budeš chtít?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_06"); //Na placení zapomeŕ, udęlám ti ji grátis, na památku starých dobrých časů.
	
	MIS_Wolf_BringCrawlerPlates = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_RUNNING);
	B_LogEntry (TOPIC_Wolf_BringCrawlerPlates,"Vlk mi z 10 červích krunýâů vyková zbroj.");
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
	description = B_BuildLearnString ("Vysvętli mi, jak lze získat červí krunýâ.", B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate));
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
	AI_Output (other, self, "DIA_Wolf_TeachCrawlerPlates_15_00"); //Můžeš mę naučit, jak červí krunýâe oddęlit?
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
	{
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_01"); //To je jednoduché. Zadní krunýâe jsou totiž na tęle pevnę pâichycené pouze na okrajích. Stačí je ostrým nožem odâíznout a je to.
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_02"); //Chápeš?
		AI_Output (other, self, "DIA_Wolf_TeachCrawlerPlates_15_03"); //To je jednoduché.
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_04"); //Vždyă to povídám.
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
	description = "Sehnal jsem ty červí krunýâe na brnęní.";
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
	AI_Output (other, self, "DIA_Wolf_BringPlates_15_00"); //Sehnal jsem ty červí krunýâe na brnęní.
	B_GiveInvItems (other, self, ItAt_CrawlerPlate, 10);
	AI_Output (self, other, "DIA_Wolf_BringPlates_08_01"); //Skvęlé, tak je sem dej!
		
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
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_01"); //Jen co ji dám dohromady. Vraă se zítra.
		}
		else
		{
			CreateInvItems (self, ItAr_Djg_Crawler, 1);
			Npc_RemoveInvItems (self, ItAt_CrawlerPlate, 10);
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_02"); //Už je hotová - tady je.
			B_GiveInvItems (self, other, ItAr_Djg_Crawler, 1);
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_03"); //Jak tak koukám, to provedení je fakt skvęlé.
			AI_Output (other, self, "DIA_Wolf_ArmorReady_15_04"); //Díky!
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_05"); //Není zač.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Wolf_ArmorReady_08_06"); //Ty vtipálku, nejdâív potâebuju ty červí krunýâe.
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
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_02"); //Pâímo u Bengarova statku ústí průsmyk do Hornického údolí, kterým se poâád snaží prodrat nęjaké obludy. Nemusím ani dodávat, že z nich má ten sedlák pęknę tęžkou hlavu.
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_03"); //Proto je tâeba, aby Bengarův statek nękdo stâežil.
	AI_Output			(self, other, "DIA_Wolf_BENGAR_08_04"); //Na tom by mohlo nęco být. Aspoŕ budu venku na poli a nebudu muset poâád okounęt tady u kovárny.
	DIA_Wolf_BENGAR_oneTime = TRUE;
	};
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_05"); //Souhlasím. A když jsi teë jedním z nás, udęlám ti dobrou cenu. Dej mi 300 zlaăáků a já tam hned vyrazím.
			Wolf_BENGAR_geld = 300;
		}
		else
		{
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_06"); //Dobâe. Dęlá to 800 zlaăáků.
			AI_Output			(other, self, "DIA_Wolf_BENGAR_15_07"); //To je poâádný balík.
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_08"); //No, pro nękoho z nás bych to udęlal za babku, ale pro tebe...
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
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_01"); //Fajn, a teë půjdu dohlídnout na ty nestvůry. Uvidíme, jestli se mi na té farmę podaâí ještę nękoho naverbovat.
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_02"); //Tak se zatím męj.
		
	
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
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_03"); //No, kdybys męl dost penęz, už bych byl dávno na cestę.
	};
	Info_ClearChoices	(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht ()
{
	AI_Output			(other, self, "DIA_Wolf_BENGAR_nochnicht_15_00"); //Budu o tom pâemýšlet.
	AI_Output			(self, other, "DIA_Wolf_BENGAR_nochnicht_08_01"); //Fajn, ale ne abys mę shodil.
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
		AI_Output			(self, other, "DIA_Wolf_PERMKAP3_08_01"); //Můj zamęstnavatel je mrtvý. No, a já si vždycky pâál mít vlastní statek.
		AI_StopProcessInfos (self);	
		Npc_ExchangeRoutine	(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Wolf_PERMKAP3_08_02"); //No jasnę! Všude ticho jako v chrámu!
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

	description	 = 	"Chtęl bys odsud odplout?";
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
	AI_Output			(self, other, "DIA_Wolf_SHIP_08_01"); //Ne, už ne. Konečnę jsem si našel práci. Možná nękdy jindy.
	wolf_SaidNo = TRUE;
	}
	else
	{
	AI_Output			(self, other, "DIA_Wolf_SHIP_08_02"); //No jasnę, pojëme odsud. Můžu ti pomoct s obranou lodi. A kam máme namíâeno?
	MIS_BengarsHelpingSLD = LOG_OBSOLETE;
	
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                                             
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                                             
	B_LogEntry (TOPIC_Crew,"Vlk už má tohoto ostrova plné zuby a udęlal by cokoliv, jen aby se odsud dostal. Je to dobrý bojovník."); 
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
	AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_01"); //No tak na co ještę čekáme? Na moâi tę můžu trochu pocvičit ve stâelbę z luku a kuše.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Wolf_KnowWhereEnemy_15_02"); //Vlastnę jsem si zrovna uvędomil, že už mám dost lidí.
		AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_03"); //(naštvanę) Tak TAKHLE to je! Nejdâív prudíš, aă se pohnu, a pak z toho nic není, co?
		AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_04"); //Jdi do hajzlu! Doufám, že se ta tvoje kocábka brzo potopí.
		AI_StopProcessInfos (self);
	}
	else 
	{
		Info_ClearChoices (DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice (DIA_Wolf_KnowWhereEnemy,"Musím o tom ještę trochu popâemýšlet.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Wolf_KnowWhereEnemy,"Vítej na palubę!",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Wolf_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_Yes_15_00"); //Vítej na palubę!
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_Yes_15_01"); //Pâijë dolů do pâístavu, už brzo vyplujeme.
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
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_No_15_00"); //Musím o tom ještę trochu popâemýšlet.
	AI_Output (self ,other,"DIA_Wolf_KnowWhereEnemy_No_08_01"); //Hele, víš, co si myslím? Že se jenom tak vytahuješ. Nevęâím ti ani slovo, vysmahni!

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
	description	 = 	"Stejnę už mi nejsi k ničemu.";
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
	AI_Output			(other, self, "DIA_Wolf_LeaveMyShip_15_00"); //Stejnę už mi nejsi k ničemu.
	AI_Output			(self, other, "DIA_Wolf_LeaveMyShip_08_01"); //Nejdâív mi dáš nadęji, a pak mę takhle odmítneš. Ty svinę, za tohle zaplatíš!
	
	Wolf_IsOnBoard	 = LOG_FAILED;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Npc_ExchangeRoutine (self,"Začít"); 
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


























 
































