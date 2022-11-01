
// ************************************************************
// 	  				   EXIT 
// ************************************************************

INSTANCE DIA_GornNW_nach_DJG_KAP5_EXIT(C_INFO)
{
	npc			= PC_Fighter_NW_nach_DJG;
	nr			= 999;
	condition	= DIA_GornNW_nach_DJG_KAP5_EXIT_Condition;
	information	= DIA_GornNW_nach_DJG_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_GornNW_nach_DJG_KAP5_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_nach_DJG_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  	  Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_GornNW_nach_DJG_AllDragonsDead(C_INFO)
{
	npc			= PC_Fighter_NW_nach_DJG;
	nr			= 59;
	condition	= DIA_GornNW_nach_DJG_AllDragonsDead_Condition;
	information	= DIA_GornNW_nach_DJG_AllDragonsDead_Info;
	permanent	= TRUE;

	description = "Odprężyłeś się wreszcie?";
};                       
FUNC INT DIA_GornNW_nach_DJG_AllDragonsDead_Condition()
{
	if (Gorn_IsOnBoard != LOG_SUCCESS) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_GornNW_nach_DJG_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00"); //Odprężyłeś się wreszcie?
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01"); //Jasne! Przecież smoki gryzą ziemię, nie?
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02"); //Sprawa jest trochę bardziej skomplikowana...
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03"); //Jak zwykle. Daj znać, gdyby mój topór mógł ci się na coś przydać.
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_GornNW_nach_DJG_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Fighter_NW_nach_DJG;
	nr			 = 	55;
	condition	 = 	DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information	 = 	DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Potrzebuję twojej pomocy.";
};
func int DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Gorn_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00"); //Potrzebuję twojej pomocy.
	AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01"); //Nie dziwi mnie to! Co mogę dla ciebie zrobić?
	AI_Output			(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02"); //Popłyniesz ze mną na pewną wyspę, żeby skopać parę tyłków?
	AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03"); //Zawsze wiedziałeś, jak mnie zachęcić! Co mam robić?
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Gorn bardzo się zapalił, kiedy powiedziałem mu o wyspie. Jeśli będę potrzebował jego pomocy, chętnie ze mną popłynie.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04"); //Mam już zebraną załogę, ale zastanawiam się, czy mimo to nie wziąć cię ze sobą.
		AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05"); //Gdybyś musiał kogoś wyrzucić, żeby zrobić miejsce dla mnie, pozbądź się najsłabszego.
		AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06"); //Podczas takiej wyprawy przydadzą się zaprawieni w boju wojownicy.
	}
	else 
	{
		Info_ClearChoices (DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice (DIA_GornNW_nach_DJG_KnowWhereEnemy,"Dam ci znać, gdy przyjdzie pora.",DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice (DIA_GornNW_nach_DJG_KnowWhereEnemy,"Chcę, żebyś ze mną popłynął. Czekaj na mnie na przystani.",DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00"); //Chcę, żebyś ze mną popłynął. Czekaj na mnie na przystani.
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01"); //Masz statek? Ho, ho! Jedno ci powiem - z tobą nie można się nudzić!
	
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

FUNC VOID DIA_GornNW_nach_DJG_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00"); //Dam ci znać, gdy przyjdzie pora.
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01"); //W porządku.

	Gorn_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_GornNW_nach_DJG_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Fighter_NW_nach_DJG;
	nr			 = 	55;
	condition	 = 	DIA_GornNW_nach_DJG_LeaveMyShip_Condition;
	information	 = 	DIA_GornNW_nach_DJG_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Może jednak lepiej będzie, jeśli tu zostaniesz.";
};
func int DIA_GornNW_nach_DJG_LeaveMyShip_Condition ()
{	
	if (Gorn_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_GornNW_nach_DJG_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_GornNW_nach_DJG_LeaveMyShip_15_00"); //Może jednak lepiej będzie, jeśli tu zostaniesz.
	AI_Output			(self, other, "DIA_GornNW_nach_DJG_LeaveMyShip_12_01"); //Mam cię puścić samego? Hmmm. Nie jestem zachwycony, ale przecież to twoja wojna. Gdybyś zmienił zdanie, wiesz, gdzie mnie szukać.
	
	Gorn_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_GornNW_nach_DJG_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Fighter_NW_nach_DJG;
	nr			 = 	55;
	condition	 = 	DIA_GornNW_nach_DJG_StillNeedYou_Condition;
	information	 = 	DIA_GornNW_nach_DJG_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Jednak będziesz mi potrzebny.";
};

func int DIA_GornNW_nach_DJG_StillNeedYou_Condition ()
{	
	if ((Gorn_IsOnBOard == LOG_OBSOLETE)	
	|| (Gorn_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_GornNW_nach_DJG_StillNeedYou_15_00"); //Jednak będziesz mi potrzebny.
	AI_Output	(self, other, "DIA_GornNW_nach_DJG_StillNeedYou_12_01"); //No proszę. A już myślałem, że zdechnę tu z nudów, podczas gdy ty będziesz się dobrze bawił. Do zobaczenia.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard	 = LOG_SUCCESS;
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


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_nach_DJG_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_NW_nach_DJG;
	nr			= 900;
	condition	= DIA_Fighter_nach_DJG_PICKPOCKET_Condition;
	information	= DIA_Fighter_nach_DJG_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_nach_DJG_PICKPOCKET_Condition()
{
	C_Beklauen (10, 25);
};
 
FUNC VOID DIA_Fighter_nach_DJG_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_nach_DJG_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_nach_DJG_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_nach_DJG_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_nach_DJG_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_nach_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_nach_DJG_PICKPOCKET);
};
	
func void DIA_Fighter_nach_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_nach_DJG_PICKPOCKET);
};


