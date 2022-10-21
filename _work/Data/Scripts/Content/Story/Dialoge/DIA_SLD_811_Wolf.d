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
	description	= "Alles klar?";
};

func int DIA_Wolf_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Wolf_Hallo_15_00"); //Alles klar?
	AI_Output (self, other, "DIA_Wolf_Hallo_08_01"); //Hey! Ich kenne dich! Aus der Kolonie.
	AI_Output (self, other, "DIA_Wolf_Hallo_08_02"); //Was willst du hier?
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
	description	= "Ich bin gekommen, um mich euch anzuschließen.";
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
	AI_Output (other, self, "DIA_Wolf_WannaJoin_15_00"); //Ich bin gekommen, um mich euch anzuschließen.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_01"); //Warum nicht. Hab nichts dagegen. Hast immerhin damals unsere Mine von den Gardisten befreit.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_02"); //Aber rechne bloß nicht damit, dass du bei den meisten anderen hier so einfach landen kannst.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_03"); //Es sind viele Neue dazu gekommen seit damals. Und einige der alten Söldner werden sich nicht an dich erinnern.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_04"); //Hätte dich auch fast nicht erkannt, siehst ziemlich abgemagert aus.
	AI_Output (other, self, "DIA_Wolf_WannaJoin_15_05"); //Als die Barriere eingestürzt ist, hätte es mich fast erwischt.
	AI_Output (self, other, "DIA_Wolf_WannaJoin_08_06"); //Da hast du ja noch mal Glück gehabt.
	
	B_LogEntry (TOPIC_SLDRespekt,"Wolf hat nichts dagegen einzuwenden, das ich mich den Söldnern anschließe.");
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
	description	= "Hast du was zu verkaufen?";
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
	AI_Output (other, self, "DIA_Wolf_WannaBuy_15_00"); //Hast du was zu verkaufen?
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_01"); //Ach, frag nicht.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_02"); //Bennet, einer von den Neuen, kümmert sich jetzt um die Waffen und Rüstungen.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_03"); //In der Kolonie war ich noch verantwortlich für Lees gesamtes Waffenlager und dann kommt so ein gelernter Schmied daher und 'zack', bin ich meinen Job los.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_04"); //Ich brauche unbedingt eine neue Aufgabe, und wenn ich bloß auf die Bauernhöfe draußen aufpassen müsste.
	AI_Output (self, other, "DIA_Wolf_WannaBuy_08_05"); //Ist mir egal, Hauptsache, ich sitze hier nicht mehr rum.
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
	description	= "Kannst du mir was beibringen?";
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
	AI_Output (other, self, "DIA_Wolf_WannaLearn_15_00"); //Kannst du mir was beibringen?
	AI_Output (self, other, "DIA_Wolf_WannaLearn_08_01"); //Ich kann dir ein paar Tricks im Umgang mit dem Bogen zeigen, wenn du willst. Hab sowieso zurzeit nichts Besseres vor.
	
	Wolf_TeachBow = TRUE;
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Wolf kann mir den Umgang mit dem Bogen zeigen.");
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
	description	= "Ich will mehr übers Bogenschießen lernen.";
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
	AI_Output (other, self, "DIA_Wolf_TEACH_15_00"); //Ich will mehr übers Bogenschießen lernen.
	AI_Output (self, other, "DIA_Wolf_TEACH_08_01"); //Was soll ich dir beibringen?
	
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
		AI_Output (self ,other,"DIA_Wolf_Teach_BACK_08_00"); //Na bitte. Du bist schon treffsicherer geworden.
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
	description	= "Und? Schon 'ne neue Aufgabe gefunden?";
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
	AI_Output (other, self, "DIA_Wolf_PERM_15_00"); //Und? Schon 'ne neue Aufgabe gefunden?
	AI_Output (self, other, "DIA_Wolf_PERM_08_01"); //Bis jetzt noch nicht. Sag mir Bescheid, wenn du einen Job für mich hast.
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
	description	= "Schon mal in der Stadt versucht, eine Arbeit zu finden?";
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
	AI_Output (other, self, "DIA_Wolf_Stadt_15_00"); //Schon mal in der Stadt versucht, eine Arbeit zu finden?
	AI_Output (self, other, "DIA_Wolf_Stadt_08_01"); //In der Stadt? (lacht) Keine tausend Pferde bringen mich da hin.
	AI_Output (self, other, "DIA_Wolf_Stadt_08_02"); //Oder glaubst du etwa, ich würde dort als Milizsoldat arbeiten wollen? Ich stell mich mir gerade in dieser Hofschranzenuniform vor.
	AI_Output (self, other, "DIA_Wolf_Stadt_08_03"); //Und dann dieser Gehorsamswahn. Ne, lass mal - hier auf dem Hof hab ich zwar gerade nichts zu tun, aber ich kann wenigstens machen, was ich will.
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
	description = "Ich habe gehört, du kannst Rüstungen aus Crawlerplatten herstellen?";
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
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_00"); //Ich habe gehört, du kannst Rüstungen aus Crawlerplatten herstellen?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_01"); //Stimmt. Von wem hast du das gehört?
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_02"); //Ein Jäger namens Gestath hat mir davon erzählt.
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_03"); //Kannst du mir so eine Rüstung herstellen?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_04"); //Klar. Bring mir 10 Crawlerplatten, dann mach ich dir eine.
	AI_Output (other, self, "DIA_Wolf_AboutCrawler_15_05"); //Wie viel willst du dafür haben?
	AI_Output (self, other, "DIA_Wolf_AboutCrawler_08_06"); //Lass gut sein. Ich mach sie dir umsonst. Um der alten Zeiten willen.
	
	MIS_Wolf_BringCrawlerPlates = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_RUNNING);
	B_LogEntry (TOPIC_Wolf_BringCrawlerPlates,"Aus 10 Crawlerplatten kann Wolf mir eine Rüstung herstellen.");
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
	description = B_BuildLearnString ("Bring mir bei, wie man Crawlern die Platten abnimmt!", B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate));
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
	AI_Output (other, self, "DIA_Wolf_TeachCrawlerPlates_15_00"); //Bring mir bei, wie man Crawlern die Platten abnimmt!
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
	{
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_01"); //Ganz einfach: Die Rückenplatten sind nur an den Rändern mit dem Körper verwachsen. Nimm einfach eine scharfe Klinge und schneide sie heraus.
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_02"); //Kapiert?
		AI_Output (other, self, "DIA_Wolf_TeachCrawlerPlates_15_03"); //Klingt einfach.
		AI_Output (self, other, "DIA_Wolf_TeachCrawlerPlates_08_04"); //Sag' ich ja.
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
	description = "Ich habe die Crawlerplatten für die Rüstung.";
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
	AI_Output (other, self, "DIA_Wolf_BringPlates_15_00"); //Ich habe die Crawlerplatten für die Rüstung.
	B_GiveInvItems (other, self, ItAt_CrawlerPlate, 10);
	AI_Output (self, other, "DIA_Wolf_BringPlates_08_01"); //Gut! Immer her damit.
		
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
	description = "Ok, wo ist die Rüstung?";
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
	AI_Output (other, self, "DIA_Wolf_ArmorReady_15_00"); //Ok, wo ist die Rüstung?

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
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_01"); //Ich werd' sie dir zusammenbauen. Komm morgen wieder.
		}
		else
		{
			CreateInvItems (self, ItAr_Djg_Crawler, 1);
			Npc_RemoveInvItems (self, ItAt_CrawlerPlate, 10);
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_02"); //Ich hab sie fertig. Hier ist sie.
			B_GiveInvItems (self, other, ItAr_Djg_Crawler, 1);
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_03"); //Ist ziemlich gut geworden, finde ich ...
			AI_Output (other, self, "DIA_Wolf_ArmorReady_15_04"); //Danke!
			AI_Output (self, other, "DIA_Wolf_ArmorReady_08_05"); //Nicht der Rede wert ...
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Wolf_ArmorReady_08_06"); //Scherzkeks. Ich brauche zuerst die Crawlerplatten ...
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

	description	 = 	"Ich hab vielleicht einen Job für dich auf Bengars Hof.";
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
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_00"); //Ich hab vielleicht einen Job für dich auf Bengars Hof.

	if (DIA_Wolf_BENGAR_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Wolf_BENGAR_08_01"); //Lass hören.
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_02"); //Der Pass zum Minental mündet genau in Bengars Bauernhof. Er hat Probleme mit den ganzen Biestern, die sich durch den Pass zwängen.
	AI_Output			(other, self, "DIA_Wolf_BENGAR_15_03"); //Jemand müsste Bengars Hof verteidigen.
	AI_Output			(self, other, "DIA_Wolf_BENGAR_08_04"); //Das wäre was. Dann wäre ich wenigstens weg vom Hof hier und muss nicht mehr auf die Schmiede starren.
	DIA_Wolf_BENGAR_oneTime = TRUE;
	};
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_05"); //Abgemacht. Und weil du einer von uns bist, mache ich dir auch einen fairen Preis. Gib mir 300 Goldmünzen, und ich bin schon weg.
			Wolf_BENGAR_geld = 300;
		}
		else
		{
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_06"); //Gut. Das macht 800 Goldmünzen.
			AI_Output			(other, self, "DIA_Wolf_BENGAR_15_07"); //Stolzer Preis.
			AI_Output			(self, other, "DIA_Wolf_BENGAR_08_08"); //Tja. Für einen von uns würde ich es fast umsonst machen. Aber für dich ...
			Wolf_BENGAR_geld = 800;
		};

	Info_ClearChoices	(DIA_Wolf_BENGAR);
	Info_AddChoice	(DIA_Wolf_BENGAR, "Ich denk´ darüber nach", DIA_Wolf_BENGAR_nochnicht );
	Info_AddChoice	(DIA_Wolf_BENGAR, "Hier, dein Geld.", DIA_Wolf_BENGAR_geld );
};
func void DIA_Wolf_BENGAR_geld ()
{
	AI_Output			(other, self, "DIA_Wolf_BENGAR_geld_15_00"); //Hier ist dein Gold.

	if (B_GiveInvItems (other, self, ItMi_Gold,	Wolf_BENGAR_geld))
	{
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_01"); //Gut. Dann wollen wir mal den Biestern auf die Pelle rücken. Mal sehen, wen ich hier auf dem Hof noch anwerben kann.
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_02"); //Wir sehen uns.
		
	
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
		AI_Output			(self, other, "DIA_Wolf_BENGAR_geld_08_03"); //Tja, wenn du das Geld hättest, wäre ich schon unterwegs.
	};
	Info_ClearChoices	(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht ()
{
	AI_Output			(other, self, "DIA_Wolf_BENGAR_nochnicht_15_00"); //Ich denke darüber nach.
	AI_Output			(self, other, "DIA_Wolf_BENGAR_nochnicht_08_01"); //Okay, aber lass mich nicht hängen.
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

	description	 = 	"Alles in Ordnung?";
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
	AI_Output			(other, self, "DIA_Wolf_PERMKAP3_15_00"); //Alles in Ordnung?

	if ((Npc_IsDead(Bengar))&&(DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output			(self, other, "DIA_Wolf_PERMKAP3_08_01"); //Mein Geldgeber ist tot. Auch gut. Ich wollte immer schon mal einen Bauernhof besitzen.
		AI_StopProcessInfos (self);	
		Npc_ExchangeRoutine	(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Wolf_PERMKAP3_08_02"); //Klar! Alles ruhig.
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

	description	 = 	"Hättest du Lust, mit einem Schiff hier zu verschwinden?";
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
	AI_Output			(other, self, "DIA_Wolf_SHIP_15_00"); //Hättest du Lust, mit einem Schiff hier zu verschwinden?

	if (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& (!Npc_IsDead (Bengar))
	{
	AI_Output			(self, other, "DIA_Wolf_SHIP_08_01"); //Nein. Jetzt nicht mehr. Ich hab schon meine Aufgabe gefunden. Vielleicht ein andermal.
	wolf_SaidNo = TRUE;
	}
	else
	{
	AI_Output			(self, other, "DIA_Wolf_SHIP_08_02"); //Na klar. Nix wie weg hier. Ich könnte dir eine große Hilfe sein, dein Schiff zu verteidigen. Wo soll's hingehen?
	MIS_BengarsHelpingSLD = LOG_OBSOLETE;
	
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                                             
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                                             
	B_LogEntry (TOPIC_Crew,"Wolf hat die Nase voll von dieser Insel und ist bereit alles zu tun um von hier zu verschwinden. Er ist ein guter Kämpfer."); 
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
	description	 = 	"Ich muss zu einer Insel nicht weit von dieser hier. ";
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
	AI_Output			(other, self, "DIA_Wolf_KnowWhereEnemy_15_00"); //Ich muss zu einer Insel nicht weit von dieser hier.
	AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_01"); //Ja, worauf warten wir noch? Ich könnte dir auf See Bogen- und Armbrustschießen beibringen.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Wolf_KnowWhereEnemy_15_02"); //Mir fällt gerade ein, dass ich eigentlich schon genug Leute beisammen habe.
		AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_03"); //(verärgert) SO ist das also. Erst winkst du mit dem roten Tuch und dann wird nix draus, was?
		AI_Output			(self, other, "DIA_Wolf_KnowWhereEnemy_08_04"); //Du kannst mich mal. Hoffentlich säuft dein Kahn ab.
		AI_StopProcessInfos (self);
	}
	else 
	{
		Info_ClearChoices (DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice (DIA_Wolf_KnowWhereEnemy,"Ich werd´ mir das nochmal überlegen.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Wolf_KnowWhereEnemy,"Willkommen an Bord",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Wolf_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_Yes_15_00"); //Willkommen an Bord!
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_Yes_15_01"); //Komm zum Hafen. Bald geht's los.
	AI_Output (self ,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02"); //Bin schon unterwegs.
	
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
	AI_Output (other,self ,"DIA_Wolf_KnowWhereEnemy_No_15_00"); //Ich werd mir das noch mal überlegen.
	AI_Output (self ,other,"DIA_Wolf_KnowWhereEnemy_No_08_01"); //Ach, weißt du was, ich glaube, du bist nur ein Aufschneider. Ich glaube dir kein Wort. Scher dich weg.

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
	description	 = 	"Ich kann dich doch nicht mehr gebrauchen.";
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
	AI_Output			(other, self, "DIA_Wolf_LeaveMyShip_15_00"); //Ich kann dich doch nicht mehr gebrauchen.
	AI_Output			(self, other, "DIA_Wolf_LeaveMyShip_08_01"); //Erst machst du mir Hoffnungen und dann so eine Abfuhr. Du Dreckskerl, du wirst mich noch kennen lernen.
	
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

	description	 = 	"Hör mal.";
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
	AI_Output			(other, self, "DIA_Wolf_SHIPOFF_15_00"); //Hör mal.
	AI_Output			(self, other, "DIA_Wolf_SHIPOFF_08_01"); //Verpfeif dich, du Dreckskerl.
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


























 
































