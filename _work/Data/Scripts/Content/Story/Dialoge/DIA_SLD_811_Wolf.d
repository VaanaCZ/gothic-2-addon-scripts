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
	description	= "Wszystko w porz¹dku?";
};

func int DIA_Wolf_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Wolf_Hallo_15_00"); //Wszystko w porz¹dku?
	AI_Output (self, other, "DIA_Wolf_Hallo_08_01"); //Hej, ja ciê znam! By³eœ w Kolonii!
	AI_Output (self, other, "DIA_Wolf_Hallo_08_02"); //Czego tu szukasz?
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
	description	= "Chcê siê do was przy³¹czyæ.";
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
	AI_Output (other, self, "DIA_Wolf_WannaJoin_15_00"); //Chcê siê do was przy³¹czyæ.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_01"); //Czemu nie. Nie mam nic przeciwko tobie. W koñcu pomog³eœ nam wtedy odbiæ kopalniê z r¹k stra¿ników.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_02"); //Tylko nie myœl, ¿e z pozosta³ymi pójdzie ci równie ³atwo.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_03"); //Do³¹czy³o do nas wielu nowych, a niektórzy ze starej bandy mog¹ ciê ju¿ nie pamiêtaæ.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_04"); //Nawet ja ledwo ciê pozna³em. Nie wygl¹dasz najlepiej.
	AI_Output (other, self, "DIA_Wolf_WannaJoin_15_05"); //Po upadku Bariery ledwo uszed³em z ¿yciem.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_06"); //No to i tak mia³eœ szczêœcie.
	
	B_LogEntry (TOPIC_SLDRespekt,"Wilk nie sprzeciwia siê mojemu wst¹pieniu w szeregi najemników.");
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
	description	= "Masz coœ do sprzedania?";
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
	AI_Output (other, self, "DIA_Wolf_WannaBuy_15_00"); //Masz coœ do sprzedania?
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_01"); //Nawet nie pytaj.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_02"); //Naszym orê¿em i pancerzami zajmuje siê teraz jeden z nowych - Bennet.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_03"); //W Kolonii odpowiada³em za ca³¹ zbrojowniê Lee, a tutaj proszê: pojawia siê zawodowy kowal i rach-ciach - straci³em robotê.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_04"); //Potrzebujê jakiejœ ciekawej pracy, choæby nawet przy pilnowaniu farm.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_05"); //Byle tylko nie siedzieæ tutaj z za³o¿onymi rêkami.
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
	description	= "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output (other, self, "DIA_Wolf_WannaLearn_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Wolf_WannaLearn_08_01"); //Jeœli chcesz, mogê ci pokazaæ, jak sprawniej pos³ugiwaæ siê ³ukiem. I tak nie mam teraz nic lepszego do roboty.
	
	Wolf_TeachBow = TRUE;
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Wilk mo¿e mnie nauczyæ, jak pos³ugiwaæ siê ³ukiem.");
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
	description	= "Chcê siê nauczyæ czegoœ o ³ucznictwie.";
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
	AI_Output (other, self, "DIA_Wolf_TEACH_15_00"); //Chcê siê nauczyæ czegoœ o ³ucznictwie.
	AI_Output (self, other, "DIA_Wolf_TEACH_08_01"); //Czego mogê ciê nauczyæ?
	
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
		AI_Output (self ,other,"DIA_Wolf_Teach_BACK_08_00"); //No i proszê. Od razu poprawi³a siê twoja celnoœæ.
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
	description	= "Co s³ychaæ? Znalaz³eœ ju¿ jak¹œ pracê?";
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
	AI_Output (other, self, "DIA_Wolf_PERM_15_00"); //Co s³ychaæ? Znalaz³eœ ju¿ jak¹œ pracê?
	AI_Output (self, other, "DIA_Wolf_PERM_08_01"); //Jeszcze nie. Daj mi znaæ, gdybyœ mia³ dla mnie jak¹œ robotê.
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
	description	= "Próbowa³eœ szukaæ pracy w mieœcie?";
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
	AI_Output (other, self, "DIA_Wolf_Stadt_15_00"); //Próbowa³eœ szukaæ pracy w mieœcie?
	AI_Output (self, other, "DIA_Wolf_Stadt_08_01"); //W mieœcie? Musia³byœ mnie tam koñmi zaci¹gn¹æ.
	AI_Output (self, other, "DIA_Wolf_Stadt_08_02"); //A co, mo¿e myœlisz, ¿e chcia³bym pracowaæ w stra¿y? Taaa... ju¿ sobie wyobra¿am: ja w mundurze stra¿nika!
	AI_Output (self, other, "DIA_Wolf_Stadt_08_03"); //I jeszcze te ci¹g³e rozkazy. Nie, nie ma mowy. Mo¿e i na farmie nie jest za du¿o roboty, ale przynajmniej nikt mn¹ nie pomiata.
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
	description = "Podobno umiesz sporz¹dzaæ zbroje z pancerzy pe³zaczy?";
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
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_00"); //Podobno umiesz sporz¹dzaæ zbroje z pancerzy pe³zaczy?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_01"); //Tak, to prawda. Sk¹d wiesz?
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_02"); //Powiedzia³ mi o tym myœliwy imieniem Gestath.
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_03"); //Móg³byœ zrobiæ tak¹ zbrojê dla mnie?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_04"); //Jasne. Przynieœ mi tylko 10 pancerzy pe³zaczy.
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_05"); //Ile to bêdzie kosztowaæ?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_06"); //Nie ma o czym mówiæ. Nie wezmê pieniêdzy od starego druha.
	
	MIS_Wolf_BringCrawlerPlates = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_RUNNING);
	B_LogEntry (TOPIC_Wolf_BringCrawlerPlates,"Wilk mo¿e zrobiæ dla mnie zbrojê z 10 pancerzy pe³zacza.");
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
	description = B_BuildLearnString ("Naucz mnie zdzierania p³yt pancerza z pe³zaczy!", B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate));
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
	AI_Output (other, self, "DIA_Wolf_TeachCrawlerPlates_15_00"); //Naucz mnie zdejmowaæ pancerze z martwych pe³zaczy.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
	{
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_01"); //To proste. Pancerze przylegaj¹ do cia³a tylko na krawêdziach. WeŸ po prostu ostry nó¿ i wytnij je wzd³u¿ brzegów.
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_02"); //Zapamiêta³eœ?
		AI_Output (other, self, "DIA_Wolf_TeachCrawlerPlates_15_03"); //To nic trudnego.
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_04"); //W rzeczy samej.
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
	description = "Mam dla ciebie pancerze pe³zaczy na zbrojê.";
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
	AI_Output (other, self, "DIA_Wolf_BringPlates_15_00"); //Mam dla ciebie pancerze pe³zaczy na zbrojê.
	B_GiveInvItems (other, self, ItAt_CrawlerPlate, 10);
	AI_Output (self, other, "DIA_Wolf_BringPlates_08_01"); //Œwietnie! Poka¿.
		
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
	description = "I co z t¹ zbroj¹?";
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
	AI_Output (other, self, "DIA_Wolf_ArmorReady_15_00"); //I co z t¹ zbroj¹?

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
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_01"); //Bez obaw, zrobiê j¹ dla ciebie. Bêdzie gotowa na jutro.
		}
		else
		{
			CreateInvItems (self, ItAr_Djg_Crawler, 1);
			Npc_RemoveInvItems (self, ItAt_CrawlerPlate, 10);
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_02"); //Ju¿ skoñczona. Proszê.
			B_GiveInvItems (self, other, ItAr_Djg_Crawler, 1);
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_03"); //Moim zdaniem wygl¹da ca³kiem nieŸle.
			AI_Output (other, self, "DIA_Wolf_ArmorReady_15_04"); //Dziêki!
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_05"); //Nie ma sprawy.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Wolf_ArmorReady_08_06"); //¯arty siê ciebie trzymaj¹? A gdzie masz pancerze pe³zaczy?
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

	description	 = 	"Chyba znalaz³em na farmie Bengara pracê w sam raz dla ciebie.";
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
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_00"); //Chyba znalaz³em na farmie Bengara pracê w sam raz dla ciebie.

	if (DIA_Wolf_BENGAR_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Wolf_BENGAR_08_01"); //S³ucham.
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_02"); //Prze³êcz do Górniczej Doliny koñczy siê tu¿ przy farmie Bengara. Biedak ma wiêc mnóstwo problemów z ró¿nymi bestiami, które schodz¹ z gór.
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_03"); //Przyda³by mu siê ktoœ o obrony farmy.
	AI_Output			(self, other, "DIA_Wolf_BENGAR_08_04"); //To rzeczywiœcie niez³a propozycja. Przynajmniej nie musia³bym tu siedzieæ i gapiæ siê têsknym wzrokiem na kuŸniê.
	DIA_Wolf_BENGAR_oneTime = TRUE;
	};
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_05"); //W porz¹dku. Jako ¿e jesteœ jednym z nas, z³o¿ê ci specjaln¹ ofertê. Daj mi 300 sztuk z³ota i mogê ruszaæ w drogê.
			Wolf_BENGAR_geld = 300;
		}
		else
		{
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_06"); //W porz¹dku. To bêdzie kosztowa³o... 800 sztuk z³ota.
			AI_Output			(other, self, "DIA_Wolf_BENGAR_15_07"); //To du¿o pieniêdzy.
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_08"); //Có¿, dla jednego z nas zrobi³bym to za po³owê ceny. Ale dla ciebie...
			Wolf_BENGAR_geld = 800;
		};

	Info_ClearChoices	(DIA_Wolf_BENGAR);
	Info_AddChoice	(DIA_Wolf_BENGAR, "Muszê siê zastanowiæ.", DIA_Wolf_BENGAR_nochnicht );
	Info_AddChoice	(DIA_Wolf_BENGAR, "Oto twoje z³oto.", DIA_Wolf_BENGAR_geld );
};
func void DIA_Wolf_BENGAR_geld ()
{
	AI_Output			(other, self, "DIA_Wolf_BENGAR_geld_15_00"); //Oto twoje z³oto.

	if (B_GiveInvItems (other, self, ItMi_Gold,	Wolf_BENGAR_geld))
	{
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_01"); //Œwietnie. Nim wyruszê na farmê Bengara, zastanowiê siê, kogo móg³bym zabraæ ze sob¹.
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_02"); //Do zobaczenia!
		
	
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
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_03"); //Có¿, gdybyœ mia³ pieni¹dze, móg³bym od razu ruszaæ w drogê.
	};
	Info_ClearChoices	(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht ()
{
	AI_Output			(other, self, "DIA_Wolf_BENGAR_nochnicht_15_00"); //Zastanowiê siê jeszcze.
	AI_Output			(self, other, "DIA_Wolf_BENGAR_nochnicht_08_01"); //Jak chcesz. Tylko mnie nie zawiedŸ!
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

	description	 = 	"Wszystko w porz¹dku?";
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
	AI_Output			(other, self, "DIA_Wolf_PERMKAP3_15_00"); //Wszystko w porz¹dku?

	if ((Npc_IsDead(Bengar))&&(DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output			(self, other, "DIA_Wolf_PERMKAP3_08_01"); //Mój pracodawca nie ¿yje. Ale co robiæ? Zawsze chcia³em mieæ w³asn¹ farmê.
		AI_StopProcessInfos (self);	
		Npc_ExchangeRoutine	(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Wolf_PERMKAP3_08_02"); //Tak, cisza i spokój.
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

	description	 = 	"Masz mo¿e ochotê wyrwaæ siê st¹d na pok³adzie okrêtu?";
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
	AI_Output			(other, self, "DIA_Wolf_SHIP_15_00"); //Nie chcia³byœ wyp³yn¹æ ze mn¹ w morze?

	if (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& (!Npc_IsDead (Bengar))
	{
	AI_Output			(self, other, "DIA_Wolf_SHIP_08_01"); //Nie, ju¿ nie. Znalaz³em dla siebie odpowiednie miejsce. Mo¿e innym razem.
	wolf_SaidNo = TRUE;
	}
	else
	{
	AI_Output			(self, other, "DIA_Wolf_SHIP_08_02"); //Jasne, czemu nie. Chêtnie siê st¹d wyniosê. Mogê równie dobrze broniæ twojego statku. Dok¹d p³yniemy?
	MIS_BengarsHelpingSLD = LOG_OBSOLETE;
	
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                                             
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                                             
	B_LogEntry (TOPIC_Crew,"Wilk ma ju¿ doœæ tej wyspy i gotów jest zrobiæ wszystko, ¿eby siê st¹d wydostaæ. Jest dobrym wojownikiem."); 
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
	description	 = 	"Niedaleko. Na poblisk¹ wyspê.";
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
	AI_Output			(other, self, "DIA_Wolf_KnowWhereEnemy_15_00"); //Niedaleko. Na poblisk¹ wyspê.
	AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_01"); //No to na co czekamy? Podczas podró¿y mogê ciê jeszcze poduczyæ ³ucznictwa i strzelania z kuszy.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Wolf_KnowWhereEnemy_15_02"); //Przypomnia³em sobie, ¿e jednak mam ju¿ doœæ ludzi.
		AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_03"); //A wiêc to tak?! Najpierw obiecujesz z³ote góry, a potem ka¿esz mi spadaæ, co?
		AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_04"); //Sp³ywaj! Mam nadziejê, ¿e ta twoja balia utonie w pó³ drogi.
		AI_StopProcessInfos (self);
	}
	else 
	{
		Info_ClearChoices (DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice (DIA_Wolf_KnowWhereEnemy,"Muszê siê nad tym jeszcze zastanowiæ.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Wolf_KnowWhereEnemy,"Witamy na pok³adzie!",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Wolf_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_Yes_15_00"); //Witamy na pok³adzie!
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_Yes_15_01"); //ZejdŸ na przystañ. Wkrótce odp³ywamy.
	AI_Output (self ,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02"); //Ju¿ idê.
	
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
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_No_15_00"); //Muszê siê nad tym jeszcze zastanowiæ.
	AI_Output (self ,other,"DIA_Wolf_KnowWhereEnemy_No_08_01"); //Wiesz co? Nie wierzê ju¿ w ani jedno twoje s³owo. ZejdŸ mi z oczu.

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
	description	 = 	"Jednak mi siê nie przydasz.";
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
	AI_Output			(other, self, "DIA_Wolf_LeaveMyShip_15_00"); //Jednak mi siê nie przydasz.
	AI_Output			(self, other, "DIA_Wolf_LeaveMyShip_08_01"); //Najpierw dajesz mi nadziejê, a potem ka¿esz spadaæ? Jesteœ draniem, jakich ma³o. Zap³acisz mi za to.
	
	Wolf_IsOnBoard	 = LOG_FAILED;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Npc_ExchangeRoutine (self,"Start"); 
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

	description	 = 	"S³uchaj.";
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
	AI_Output			(other, self, "DIA_Wolf_SHIPOFF_15_00"); //S³uchaj.
	AI_Output			(self, other, "DIA_Wolf_SHIPOFF_08_01"); //Odwal siê, sukinsynu.
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


























 
































