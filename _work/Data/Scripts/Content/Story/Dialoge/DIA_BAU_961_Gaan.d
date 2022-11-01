///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gaan_EXIT   (C_INFO)
{
	npc         = BAU_961_Gaan;
	nr          = 999;
	condition   = DIA_Gaan_EXIT_Condition;
	information = DIA_Gaan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
var int DIA_Gaan_EXIT_oneTime;
FUNC INT DIA_Gaan_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_Gaan_EXIT_Info()
{
	AI_StopProcessInfos (self);
	if (DIA_Gaan_EXIT_oneTime == FALSE)
	{
	Npc_ExchangeRoutine	(self,"Začít");
	DIA_Gaan_EXIT_oneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_MeetingIsRunning		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Gaan_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Gaan_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Gaan_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Gaan_MeetingIsRunning_One_time;
func void DIA_Addon_Gaan_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Gaan_MeetingIsRunning_One_time == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Gaan_MeetingIsRunning_03_00"); //Á, nová tváâ. Vítej v kruhu vody.
		DIA_Addon_Gaan_MeetingIsRunning_One_time = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Gaan_MeetingIsRunning_03_01"); //Vatras tę chce vidęt. Męl bys za ním zajít.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_HALLO		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	3;
	condition	 = 	DIA_Gaan_HALLO_Condition;
	information	 = 	DIA_Gaan_HALLO_Info;

	description	 = 	"Tady nahoâe je docela hezky.";
};

func int DIA_Gaan_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Gaan_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_HALLO_15_00"); //Tady nahoâe je docela hezky.
	AI_Output			(self, other, "DIA_Gaan_HALLO_03_01"); //Je to tu docela pękné. Ale jakmile projdeš tím průsmykem támhle, pâestaneš si to myslet.
	AI_Output			(self, other, "DIA_Gaan_HALLO_03_02"); //Jestli na tebe tenhle kus zemę udęlal dojem, tak počkej, co pak uvidíš v Hornickém údolí.

};



///////////////////////////////////////////////////////////////////////
//	Info Wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	4;
	condition	 = 	DIA_Gaan_WASMACHSTDU_Condition;
	information	 = 	DIA_Gaan_WASMACHSTDU_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Gaan_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Gaan_HALLO))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Gaan_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_WASMACHSTDU_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Gaan_WASMACHSTDU_03_01"); //Jmenuju se Gaan. Jsem lovec a pracuju pro Bengara. Farmaâí tady na náhorních pastvinách.
	AI_Output			(self, other, "DIA_Gaan_WASMACHSTDU_03_02"); //Trávím tady venku vętšinu svého času a vyhâívám se na slunci.
};

///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_Ranger		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Gaan_Ranger_Condition;
	information	 = 	DIA_Addon_Gaan_Ranger_Info;

	description	 = 	"Proč se tváâíš tak zasmušile?";
};

func int DIA_Addon_Gaan_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Gaan_HALLO))
	&& (SCIsWearingRangerRing == TRUE)
	&& (RangerMeetingRunning == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Gaan_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Gaan_Ranger_15_00"); //Proč se tváâíš tak vážnę?
	AI_Output	(self, other, "DIA_Addon_Gaan_Ranger_03_01"); //Nosíš akvamarínový prsten.
	AI_Output	(other, self, "DIA_Addon_Gaan_Ranger_15_02"); //Ty patâíš ke kruhu vody?
	AI_Output	(self, other, "DIA_Addon_Gaan_Ranger_03_03"); //Samozâejmę. A rád mezi námi vidím novou tváâ.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AufgabeBeimRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_AufgabeBeimRing		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Gaan_AufgabeBeimRing_Condition;
	information	 = 	DIA_Addon_Gaan_AufgabeBeimRing_Info;

	description	 = 	"Co v tom 'kruhu vody' dęláš ty?";
};

func int DIA_Addon_Gaan_AufgabeBeimRing_Condition ()
{
	if ((Npc_KnowsInfo (other, DIA_Addon_Gaan_Ranger))
	|| (RangerMeetingRunning != 0))
	&& (Kapitel < 3)
		{
			return TRUE;
		};
};

func void DIA_Addon_Gaan_AufgabeBeimRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Gaan_AufgabeBeimRing_15_00"); //Jaký je tvůj úkol v rámci kruhu vody?
	AI_Output	(self, other, "DIA_Addon_Gaan_AufgabeBeimRing_03_01"); //Dohlížím na vstup do průsmyku a hlídám, kdo pâichází a odchází.
	AI_Output	(self, other, "DIA_Addon_Gaan_AufgabeBeimRing_03_02"); //Ale od té doby, co paladinové zavâeli bránu, sem už moc lidí nechodí.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Gaan_MissingPeople_Condition;
	information	 = 	DIA_Addon_Gaan_MissingPeople_Info;

	description	 = 	"Slyšel jsi o tęch pohâešovaných lidech?";
};

func int DIA_Addon_Gaan_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Gaan_AufgabeBeimRing))
	&& (SC_HearedAboutMissingPeople == TRUE)
			{
				return TRUE;
			};
};

func void DIA_Addon_Gaan_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Gaan_MissingPeople_15_00"); //Nezaslechl jsi nęco o tęch pohâešovaných lidech?
	AI_Output	(self, other, "DIA_Addon_Gaan_MissingPeople_03_01"); //Jistęže ano. Právę proto musíme mít oči na stopkách.
	AI_Output	(self, other, "DIA_Addon_Gaan_MissingPeople_03_02"); //Ale popravdę âečeno jsem zatím nevidęl nic, co by ti mohlo poskytnout nęjakou stopu.
};

///////////////////////////////////////////////////////////////////////
//	Info wald
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WALD		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	5;
	condition	 = 	DIA_Gaan_WALD_Condition;
	information	 = 	DIA_Gaan_WALD_Info;

	description	 = 	"Co bych męl vędęt o Hornickém údolí?";
};

func int DIA_Gaan_WALD_Condition ()
{
	return TRUE;
};

func void DIA_Gaan_WALD_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_WALD_15_00"); //Co bych męl vędęt o Hornickém údolí?
	AI_Output			(self, other, "DIA_Gaan_WALD_03_01"); //Tak to nevím. Byl jsem tam jen na skok. Vypadá to tam pęknę nebezpečnę.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_02"); //Nejlepší vęc, jakou můžeš udęlat, je držet se po vstupu do průsmyku vyšlapané stezky.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_03"); //Buë můžeš jít velkou strží, nebo po cestę pâes most. Je to kratší a bezpečnęjší.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_04"); //Teë, když se to všude hemží skâety, musíš být hodnę opatrný.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_05"); //Nerad bych tę táhnul k bylinkáâce.

};

///////////////////////////////////////////////////////////////////////
//	Info sagitta
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_SAGITTA		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	7;
	condition	 = 	DIA_Gaan_SAGITTA_Condition;
	information	 = 	DIA_Gaan_SAGITTA_Info;

	description	 = 	"Bylinkáâce?";
};

func int DIA_Gaan_SAGITTA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Gaan_WALD))
		{
				return TRUE;
		};
};

func void DIA_Gaan_SAGITTA_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_SAGITTA_15_00"); //Bylinkáâce?
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_01"); //Jmenuje se Sagitta. Léčí farmáâe a ostatní lidi, co žijí mimo męsto.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_02"); //Vážnę podivná ženština.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_03"); //Nikdo za ní ve skutečnosti nechce chodit a všichni o ní rozšiâují různé fámy.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_04"); //Ale když je ti zle, nenajdeš nic lepšího než Sagittu a její kuchyŕ plnou léčivých bylin.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_05"); //Najdeš ji v tom pruhu lesa za Sekobovou farmou.

};

///////////////////////////////////////////////////////////////////////
//	Info monster
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_MONSTER		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	8;
	condition	 = 	DIA_Gaan_MONSTER_Condition;
	information	 = 	DIA_Gaan_MONSTER_Info;

	description	 = 	"Jak ta nebezpečná bestie vypadá?";
};

func int DIA_Gaan_MONSTER_Condition ()
{
	if 	(
		(MIS_Gaan_Snapper == LOG_RUNNING)	
		&&((Npc_IsDead(Gaans_Snapper))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Gaan_MONSTER_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_MONSTER_15_00"); //Jak ta nebezpečná bestie vypadá?
	AI_Output			(self, other, "DIA_Gaan_MONSTER_03_01"); //Poâádnę nevím. Až doteë jsem jen slyšel vrčení a škrábání. Ale dokážu si pâedstavit, co ty zvuky vydávalo.
	AI_Output			(self, other, "DIA_Gaan_MONSTER_03_02"); //Pâed tím nejsou v bezpečí ani vlci. Ta bestie už je do jednoho vyvraždila.

};

///////////////////////////////////////////////////////////////////////
//	Info monster
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WASZAHLSTDU		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	9;
	condition	 = 	DIA_Gaan_WASZAHLSTDU_Condition;
	information	 = 	DIA_Gaan_WASZAHLSTDU_Info;

	description	 = 	"Kolik mi dáš, když tu bestii zabiju?";
};

func int DIA_Gaan_WASZAHLSTDU_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Gaan_MONSTER))
		&&((Npc_IsDead(Gaans_Snapper))== FALSE)
		)
			{
					return TRUE;
			};
}; 

func void DIA_Gaan_WASZAHLSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_WASZAHLSTDU_15_00"); //Kolik mi dáš, když tu bestii zabiju?
	AI_Output			(self, other, "DIA_Gaan_WASZAHLSTDU_03_01"); //Nękomu, kdo to zabije, bych dal všechno, co můžu postrádat.
	//AI_Output			(self, other, "DIA_Gaan_WASZAHLSTDU_03_02"); //30 Goldmünzen? 
	//Auskommentiert, weil "?" ist auch so gesprochen worden - kommt nicht gut
	B_Say_Gold   (self,other,30);
	MIS_Gaan_Deal = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info wohermonster
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WOHERMONSTER		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	10;
	condition	 = 	DIA_Gaan_WOHERMONSTER_Condition;
	information	 = 	DIA_Gaan_WOHERMONSTER_Info;

	description	 = 	"Kde ta zatracená bestie žije?";
};

func int DIA_Gaan_WOHERMONSTER_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Gaan_MONSTER))
		&&((Npc_IsDead(Gaans_Snapper))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Gaan_WOHERMONSTER_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_WOHERMONSTER_15_00"); //Kde ta zatracená bestie žije?
	AI_Output			(self, other, "DIA_Gaan_WOHERMONSTER_03_01"); //Nękde mimo les. Možná sem chodí z Hornického údolí. Ale nejsem si tím jistý.
	AI_Output			(self, other, "DIA_Gaan_WOHERMONSTER_03_02"); //Nikdy jsem v Hornickém údolí nebyl.
 
};


///////////////////////////////////////////////////////////////////////
//	Info MonsterTot
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_MONSTERTOT		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 11;
	condition	 = 	DIA_Gaan_MONSTERTOT_Condition;
	information	 = 	DIA_Gaan_MONSTERTOT_Info;
	important	 = 	TRUE;
};

func int DIA_Gaan_MONSTERTOT_Condition ()
{
	if 	((Npc_IsDead(Gaans_Snapper))== TRUE) 
	&& 	(RangerMeetingRunning != LOG_RUNNING)
			{
					return TRUE;
			};
};

func void DIA_Gaan_MONSTERTOT_Info ()
{
	AI_Output			(self, other, "DIA_Gaan_MONSTERTOT_03_00"); //To odporné zvíâe je mrtvé.
	AI_Output			(self, other, "DIA_Gaan_MONSTERTOT_03_01"); //Tak to zase můžu bez obav začít lovit.
	

	if (MIS_Gaan_Deal == LOG_RUNNING)
		{
			AI_Output			(self, other, "DIA_Gaan_MONSTERTOT_03_02");	//Tady jsou peníze, co jsem ti slíbil.

			CreateInvItems (self, ItMi_Gold, 30);									
			B_GiveInvItems (self, other, ItMi_Gold, 30);					
		};
	
	MIS_Gaan_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_Gaan_WaldSnapper);
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  			  ASK TEACHER 
// ************************************************************

INSTANCE DIA_Gaan_AskTeacher (C_INFO)
{
	npc			= BAU_961_Gaan;
	nr          = 10;
	condition	= DIA_Gaan_AskTeacher_Condition;
	information	= DIA_Gaan_AskTeacher_Info;

	description = "Můžeš mę naučit nęco o lovu?";
};                       

FUNC INT DIA_Gaan_AskTeacher_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gaan_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00"); //Můžeš mę naučit nęco o lovu?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01"); //Žádný problém. Za 100 zlatých ti ukážu, jak vyvrhnout zvíâata, co jsi skolil.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02"); //Kožešiny a ostatní trofeje ti na trhu vynesou spoustu penęz.
		
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Gaan mę naučí, jak získat trofeje ze zvíâat.");
};


// ************************************************************
// 			  			  PAY TEACHER 
// ************************************************************

INSTANCE DIA_Gaan_PayTeacher (C_INFO)
{
	npc			= BAU_961_Gaan;
	nr          = 11;
	condition	= DIA_Gaan_PayTeacher_Condition;
	information	= DIA_Gaan_PayTeacher_Info;
	permanent	= TRUE;
	description = "Tady máš 100 zlaăáků a vysvętli mi, jak vyvrhnout zvíâata.";
};                       

var int DIA_Gaan_PayTeacher_noPerm;

FUNC INT DIA_Gaan_PayTeacher_Condition()
{
	if 	(Npc_KnowsInfo (other, DIA_Gaan_AskTeacher))
		&& (DIA_Gaan_PayTeacher_noPerm == FALSE)
			{
				return TRUE;
			};
};

FUNC VOID DIA_Gaan_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00"); //Tady. 100 zlatých za tvůj výklad o vyvrhování zvíâat.

	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01"); //Díky. Tak se mi to líbí.
		Gaan_TeachPlayer = TRUE;
		DIA_Gaan_PayTeacher_noPerm = TRUE;
	}
	else	
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02"); //Pâijë pozdęji, až budeš mít nęjaké peníze.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_TEACHHUNTING		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr          = 12;
	condition	 = 	DIA_Gaan_TEACHHUNTING_Condition;
	information	 = 	DIA_Gaan_TEACHHUNTING_Info;
	permanent	= TRUE;
	description	 = 	"Co mę můžeš naučit?";
};

func int DIA_Gaan_TEACHHUNTING_Condition ()
{
	if (Gaan_TeachPlayer == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Gaan_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_TEACHHUNTING_15_00"); //Co mę můžeš naučit?
	if 	(
			(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			||((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE) && (MIS_Gaan_Snapper == LOG_SUCCESS))
		)
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_03_01"); //To záleží na tom, co chceš vędęt.

			Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Vyjmutí zubů",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Gaan_TEACHHUNTING_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Vyjmutí drápů",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Gaan_TEACHHUNTING_Claws);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Stažení z kůže",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Gaan_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Žihadla krvavých much",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Gaan_TEACHHUNTING_BFSting);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Kâídla krvavých much",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Gaan_TEACHHUNTING_BFWing);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
			&& (MIS_Gaan_Snapper == LOG_SUCCESS)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Roh dračího chŕapavce",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  DIA_Gaan_TEACHHUNTING_DrgSnapperHorn);
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_03_02"); //Teë už tę nemůžu naučit nic, co bys ještę neznal. Je mi líto.
		};
};

func void DIA_Gaan_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
};

// ------ Klauen hacken ------
func void DIA_Gaan_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_00"); //Zvíâata o své drápy pâicházejí opravdu nerada. Âez musíš vést velmi pâesnę.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_01"); //Tvé ruce by se męly lehce pâekrývat. Pak silným trhnutím dráp oddęl od okolní tkánę.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_02"); //Obchodníci se mohou vždycky pâetrhnout, aby za drápy vysolili pęknou sumičku.
		
		};

		Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
		Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
		
};

// ------ Fell abziehen ------
func void DIA_Gaan_TEACHHUNTING_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Teeth_03_00"); //Nejsnadnęji se z mrtvých zvíâat získávají zuby. Âez musíš v jejich tlamę vést tęsnę kolem nich.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Teeth_03_01"); //Pak je silným trhnutím oddęlíš od lebky.
	
			
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Fell abziehen ------
func void DIA_Gaan_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Fur_03_00"); //Nejlepší způsob, jak získat kožešinu, je vést hluboký âez podél končetin.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Fur_03_01"); //Pak už je hračka stáhnout kůži od hlavy k ocasu.
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Blutfliegenstachel ------
func void DIA_Gaan_TEACHHUNTING_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFSting_03_00"); //Tyhle mouchy mají na hâbetę mękké místo.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFSting_03_01"); //Když na nęj zatlačíš, vytlačí se žihadlo daleko ze zadečku a pak ho stačí oddęlit nožem.
			
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};
// ------ Blutfliegenflügel ------
func void DIA_Gaan_TEACHHUNTING_BFWing ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFWing_03_00"); //Nejlepší způsob, jak oddęlit kâídla od tęla, je odâíznout je ostrým nožem tęsnę nad hrudí.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFWing_03_01"); //Musíš si dávat velký pozor, abys nepoškodil velmi jemnou tkáŕ kâídel. Pokud budeš pâi jejich oddęlování neopatrný, získáš akorát bezcennou hromadu smetí.

		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};
// ------ DrgSnapperHorn ------
func void DIA_Gaan_TEACHHUNTING_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00"); //Teë, když je ten pâerostlý chŕapavec mrtvý, ti můžu ukázat, jak získat jeho roh.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01"); //Zanoâíš nůž hluboko do čela a opatrnę tu vęc vypáčíš nahoru.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02"); //Pokud to nepůjde oddęlit od lebky, použij ještę další nůž z druhé strany.
	
			
			CreateInvItems (Gaans_Snapper, ItAt_DrgSnapperHorn, 1); //falls der Snapper ihm gerade vor den Füssen liegt!!
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};


///////////////////////////////////////////////////////////////////////
//	Info jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_JAGD		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	80;
	condition	 = 	DIA_Gaan_JAGD_Condition;
	information	 = 	DIA_Gaan_JAGD_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak jde lov?";
};

func int DIA_Gaan_JAGD_Condition ()
{
	return TRUE;
};

func void B_WasMachtJagd ()
{
	AI_Output			(other, self, "DIA_Gaan_JAGD_15_00"); //Jak jde lov?
};

func void DIA_Gaan_JAGD_Info ()
{
	B_WasMachtJagd ();

	if ((Npc_IsDead(Gaans_Snapper))== FALSE)
		{
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_01"); //Poslední zvíâe, co se mi podaâilo zabít, byla velká krysa. Nic extra a navíc z toho nic nekápne.
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_02"); //Posledních nękolik dní se tu potuluje nęjaká funící bestie.
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_03"); //Nejen že zabíjí všechno, co se hýbe, ale taky mi kazí moji práci.
			Log_CreateTopic (TOPIC_GaanSchnaubi, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GaanSchnaubi, LOG_RUNNING);
			B_LogEntry (TOPIC_GaanSchnaubi,"Lovce Gaana trápí nęjaká podivná nestvůra. Dokud ji nezabiju, nebude moci dál lovit."); 
			MIS_Gaan_Snapper = LOG_RUNNING;
		}
	else if (Kapitel >= 3)
		{
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_04"); //Začíná tu být pękný blázinec. Z průsmyku už se sem mezitím stihla nahrnout spousta tęch funících zvíâat.
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_05"); //Za tęchto okolností je lov čím dál tím obtížnęjší.
		}
	else
		{
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_06"); //Nemůžu si stęžovat.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gaan_PICKPOCKET (C_INFO)
{
	npc			= BAU_961_Gaan;
	nr			= 900;
	condition	= DIA_Gaan_PICKPOCKET_Condition;
	information	= DIA_Gaan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Gaan_PICKPOCKET_Condition()
{
	C_Beklauen (23, 35);
};
 
FUNC VOID DIA_Gaan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gaan_PICKPOCKET);
	Info_AddChoice		(DIA_Gaan_PICKPOCKET, DIALOG_BACK 		,DIA_Gaan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gaan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gaan_PICKPOCKET_DoIt);
};

func void DIA_Gaan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gaan_PICKPOCKET);
};
	
func void DIA_Gaan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gaan_PICKPOCKET);
};































