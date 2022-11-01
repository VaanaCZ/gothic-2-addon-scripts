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
	Npc_ExchangeRoutine	(self,"Start");
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
		AI_Output	(self, other, "DIA_Addon_Gaan_MeetingIsRunning_03_00"); //Finalmente una faccia nuova. Benvenuto nell'Anello dell'Acqua.
		DIA_Addon_Gaan_MeetingIsRunning_One_time = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Gaan_MeetingIsRunning_03_01"); //Vatras vuole vederti. Vai direttamente da lui.
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

	description	 = 	"Avete molto spazio quassù.";
};

func int DIA_Gaan_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Gaan_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_HALLO_15_00"); //Avete molto spazio qui su.
	AI_Output			(self, other, "DIA_Gaan_HALLO_03_01"); //È un posto abbastanza tranquillo. Ma se attraversi il passo là dietro, non sarai più della stessa opinione per molto tempo.
	AI_Output			(self, other, "DIA_Gaan_HALLO_03_02"); //Se questa piccola striscia di terra ti ha impressionato, allora aspetta di vedere la Valle delle Miniere.

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

	description	 = 	"Chi sei?";
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
	AI_Output			(other, self, "DIA_Gaan_WASMACHSTDU_15_00"); //Chi sei?
	AI_Output			(self, other, "DIA_Gaan_WASMACHSTDU_03_01"); //Mi chiamo Gaan. Sono un cacciatore e lavoro per Bengar, il contadino dei pascoli dell'altopiano.
	AI_Output			(self, other, "DIA_Gaan_WASMACHSTDU_03_02"); //Trascorro la maggior parte del tempi qui fuori, a crogiolarmi al sole.
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

	description	 = 	"Perché quell'aria solenne?";
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
	AI_Output	(other, self, "DIA_Addon_Gaan_Ranger_15_00"); //Perché quell'aria solenne?
	AI_Output	(self, other, "DIA_Addon_Gaan_Ranger_03_01"); //Indossi l'anello di acquamarina.
	AI_Output	(other, self, "DIA_Addon_Gaan_Ranger_15_02"); //Appartieni all'Anello dell'Acqua?
	AI_Output	(self, other, "DIA_Addon_Gaan_Ranger_03_03"); //Sicuro. È bello vedere una faccia nuova.
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

	description	 = 	"Qual è il tuo ruolo nell'Anello dell'Acqua?";
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
	AI_Output	(other, self, "DIA_Addon_Gaan_AufgabeBeimRing_15_00"); //Qual è il tuo ruolo nell'Anello dell'Acqua?
	AI_Output	(self, other, "DIA_Addon_Gaan_AufgabeBeimRing_03_01"); //Sorveglio l'ingresso del passo per vedere chi entra e chi esce.
	AI_Output	(self, other, "DIA_Addon_Gaan_AufgabeBeimRing_03_02"); //Ma da quando i paladini hanno chiuso la porta del passo non c'è più stato molto traffico.
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

	description	 = 	"Hai saputo di quelle persone scomparse?";
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
	AI_Output	(other, self, "DIA_Addon_Gaan_MissingPeople_15_00"); //Hai saputo di quelle persone scomparse?
	AI_Output	(self, other, "DIA_Addon_Gaan_MissingPeople_03_01"); //E come no! È per questo che dobbiamo tenere gli occhi aperti.
	AI_Output	(self, other, "DIA_Addon_Gaan_MissingPeople_03_02"); //Ma a dire il vero non ho visto nulla che possa aiutarti.
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

	description	 = 	"Cosa devo sapere sulla Valle delle Miniere?";
};

func int DIA_Gaan_WALD_Condition ()
{
	return TRUE;
};

func void DIA_Gaan_WALD_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_WALD_15_00"); //Cosa devo sapere sulla Valle delle Miniere?
	AI_Output			(self, other, "DIA_Gaan_WALD_03_01"); //Non ne ho idea. Ho dato solo un'occhiata di sfuggita alla valle. Aveva un aspetto molto minaccioso.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_02"); //La cosa migliore da fare, se hai intenzione di attraversare il passo, è rimanere sul sentiero battuto.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_03"); //Segui la strada attraverso la grande gola o quella oltre il ponte di pietra. Quest'ultima è più breve e sicura.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_04"); //Devi tenere gli occhi aperti ora che gli orchi infestano tutta la zona.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_05"); //Non voglio doverti trascinare dall'erborista.

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

	description	 = 	"Erborista?";
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
	AI_Output			(other, self, "DIA_Gaan_SAGITTA_15_00"); //Erborista?
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_01"); //Il suo nome è Sagitta. È la guaritrice dei contadini e delle altre persone che vivono fuori la città portuale.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_02"); //Una donna davvero strana.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_03"); //A nessuno piace andare da lei, ma tutti si divertono a spettegolare sul suo conto.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_04"); //Ma se sei ammalato, non troverai aiuto migliore di Sagitta e della sua cucina piena di erbe mediche.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_05"); //La troverai nella striscia di bosco dietro la fattoria di Sekob.

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

	description	 = 	"Che aspetto ha questa pericolosa bestia?";
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
	AI_Output			(other, self, "DIA_Gaan_MONSTER_15_00"); //Che aspetto ha questa pericolosa bestia?
	AI_Output			(self, other, "DIA_Gaan_MONSTER_03_01"); //Non lo so con esattezza. Finora ho sentito solo grugnire e grattare. Ma ho visto ciò che è capace di fare.
	AI_Output			(self, other, "DIA_Gaan_MONSTER_03_02"); //Persino i lupi non sono al sicuro. La bestia ne ha azzannato uno staccandogli di netto la testa.

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

	description	 = 	"Quanto sei disposto a pagare se uccido quella bestia per te?";
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
	AI_Output			(other, self, "DIA_Gaan_WASZAHLSTDU_15_00"); //Quanto sei disposto a pagare se uccido quella bestia per te?
	AI_Output			(self, other, "DIA_Gaan_WASZAHLSTDU_03_01"); //Darò tutto ciò che possiedo a colui che riuscirà a ucciderla.
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

	description	 = 	"Da dove arriva questa spregevole bestia?";
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
	AI_Output			(other, self, "DIA_Gaan_WOHERMONSTER_15_00"); //Da dove arriva questa spregevole bestia?
	AI_Output			(self, other, "DIA_Gaan_WOHERMONSTER_03_01"); //Da qualche parte fuori dai boschi. Forse dalla Valle delle Miniere, ma non ne sono sicuro.
	AI_Output			(self, other, "DIA_Gaan_WOHERMONSTER_03_02"); //Non sono mai stato nella Valle delle Miniere.
 
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
	AI_Output			(self, other, "DIA_Gaan_MONSTERTOT_03_00"); //Suppongo che quell'orribile creatura sia morta.
	AI_Output			(self, other, "DIA_Gaan_MONSTERTOT_03_01"); //Finalmente posso tornare a cacciare in pace.
	

	if (MIS_Gaan_Deal == LOG_RUNNING)
		{
			AI_Output			(self, other, "DIA_Gaan_MONSTERTOT_03_02");	//Eccoti i soldi che ti avevo promesso.

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

	description = "Puoi insegnarmi a cacciare?";
};                       

FUNC INT DIA_Gaan_AskTeacher_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gaan_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00"); //Puoi insegnarmi a cacciare?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01"); //Certamente. Per 100 monete d'oro posso mostrarti come sventrare gli animali che uccidi.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02"); //Le pellicce e altri trofei valgono un sacco di soldi sul mercato.
		
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Gaan può insegnarmi a scuoiare animali.");
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
	description = "Ecco. 100 monete d’oro per la tua capacità di scuoiare gli animali.";
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
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00"); //Ecco. 100 monete d’oro per la tua capacità di scuoiare gli animali.

	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01"); //Grazie. Così si fa.
		Gaan_TeachPlayer = TRUE;
		DIA_Gaan_PayTeacher_noPerm = TRUE;
	}
	else	
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02"); //Ripassa più tardi, quando avrai i soldi.
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
	description	 = 	"Cosa puoi insegnarmi?";
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
	AI_Output			(other, self, "DIA_Gaan_TEACHHUNTING_15_00"); //Cosa puoi insegnarmi?
	if 	(
			(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			||((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE) && (MIS_Gaan_Snapper == LOG_SUCCESS))
		)
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_03_01"); //Dipende da ciò che vuoi sapere.

			Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Rimuovi i denti",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Gaan_TEACHHUNTING_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Rimuovi gli artigli",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Gaan_TEACHHUNTING_Claws);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Pelle",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Gaan_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Pungiglione di sanguimosca",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Gaan_TEACHHUNTING_BFSting);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Ali di sanguimosca",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Gaan_TEACHHUNTING_BFWing);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
			&& (MIS_Gaan_Snapper == LOG_SUCCESS)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Corno del drago squartatore",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  DIA_Gaan_TEACHHUNTING_DrgSnapperHorn);
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_03_02"); //Attualmente non sono in grado di insegnarti più di quanto tu non sappia già. Mi spiace.
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
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_00"); //Gli artigli degli animali non si staccano tanto facilmente. Dovrai affondare il coltello con estrema precisione.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_01"); //Dovresti incrociare leggermente le mani e quindi staccare l'artiglio con uno strattone deciso.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_02"); //I mercanti sono sempre disposti a essere pagati in artigli.
		
		};

		Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
		Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
		
};

// ------ Fell abziehen ------
func void DIA_Gaan_TEACHHUNTING_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Teeth_03_00"); //La parte più facile da prendere da un animale sono i denti. Basta farci un'incisione intorno con il coltello.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Teeth_03_01"); //Quindi li separi dalla testa con uno strattone netto.
	
			
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Fell abziehen ------
func void DIA_Gaan_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Fur_03_00"); //Il modo migliore per rimuovere la pelliccia è fare un incisione profonda lungo le zampe posteriori.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Fur_03_01"); //Fatto questo, dovrebbe essere facile staccare la pelle partendo dalla parte anteriore fino a quella posteriore.
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Blutfliegenstachel ------
func void DIA_Gaan_TEACHHUNTING_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFSting_03_00"); //Questi insetti hanno un punto debole sulla schiena.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFSting_03_01"); //Se premi qui, il pungiglione verrà espulso abbastanza all'esterno e potrai staccarlo con il tuo coltello.
			
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};
// ------ Blutfliegenflügel ------
func void DIA_Gaan_TEACHHUNTING_BFWing ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFWing_03_00"); //Il modo migliore per rimuovere le ali di una sanguimosca è con un colpo di coltello affilato molto vicino al corpo dell'insetto.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFWing_03_01"); //Devi fare attenzione a non danneggiare il tessuto delicato delle ali, altrimenti non avranno più alcun valore.

		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};
// ------ DrgSnapperHorn ------
func void DIA_Gaan_TEACHHUNTING_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00"); //Ora che questo grosso squartatore è morto, posso mostrarti come rimuovere il suo corno.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01"); //Devi spingere il coltello dentro la fronte dell'animale e fare leva sul corno verso l'alto.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02"); //Se non dovesse staccarsi dalla testa, puoi aiutarti con un altro coltello dall'altra parte.
	
			
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

	description	 = 	"Come va la caccia?";
};

func int DIA_Gaan_JAGD_Condition ()
{
	return TRUE;
};

func void B_WasMachtJagd ()
{
	AI_Output			(other, self, "DIA_Gaan_JAGD_15_00"); //Come va la caccia?
};

func void DIA_Gaan_JAGD_Info ()
{
	B_WasMachtJagd ();

	if ((Npc_IsDead(Gaans_Snapper))== FALSE)
		{
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_01"); //L'ultimo animale che sono riuscito a uccidere è stato un ratto gigante. Non molto incoraggiante, e sicuramente non un bene per i miei affari.
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_02"); //Sono ormai diversi giorni che una strana bestia sbuffante si aggira nei paraggi.
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_03"); //Non solo essa uccide tutto ciò che si muove, ma interferisce anche con il mio lavoro.
			Log_CreateTopic (TOPIC_GaanSchnaubi, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GaanSchnaubi, LOG_RUNNING);
			B_LogEntry (TOPIC_GaanSchnaubi,"Quella creature sbuffante sta causando dei problemi a Gaan il cacciatore. A meno che io non sconfigga la bestia, egli non potrà più andare a caccia."); 
			MIS_Gaan_Snapper = LOG_RUNNING;
		}
	else if (Kapitel >= 3)
		{
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_04"); //Sto impazzendo qua fuori. Nel frattempo, decine di quegli animali sbuffanti hanno attraversato il passo.
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_05"); //In queste condizioni, cacciare sta diventando sempre più difficile.
		}
	else
		{
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_06"); //Non posso lamentarmi.
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































