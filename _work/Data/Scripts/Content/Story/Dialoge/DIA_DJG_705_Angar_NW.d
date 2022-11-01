// ************************************************************
// 	  				   EXIT 
// ************************************************************

INSTANCE DIA_Angar_NW_KAP5_EXIT(C_INFO)
{
	npc			= DJG_705_Angar_NW;
	nr			= 999;
	condition	= DIA_Angar_NW_KAP5_EXIT_Condition;
	information	= DIA_Angar_NW_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Angar_NW_KAP5_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Angar_NW_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  	  Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_Angar_NW_AllDragonsDead(C_INFO)
{
	npc			= DJG_705_Angar_NW;
	nr			= 59;
	condition	= DIA_Angar_NW_AllDragonsDead_Condition;
	information	= DIA_Angar_NW_AllDragonsDead_Info;

	description = "Qu'y a-t-il?";
};                       
FUNC INT DIA_Angar_NW_AllDragonsDead_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Angar_NW_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Angar_NW_AllDragonsDead_15_00"); //Comment ça se passe ?
	AI_Output (self ,other,"DIA_Angar_NW_AllDragonsDead_04_01"); //Plutôt bien. Mais j'ai encore ces maux de tête même si ça va mieux depuis que j'ai quitté la Vallée des mines.
	if (Angar_IsOnBoard != LOG_SUCCESS) 
	{
	AI_Output (self ,other,"DIA_Angar_NW_AllDragonsDead_04_02"); //Je vais rester ici. Ainsi vous saurez où me trouver si vous avez besoin de moi.
	};
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_NW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	DJG_705_Angar_NW;
	nr			 = 	55;
	condition	 = 	DIA_Angar_NW_KnowWhereEnemy_Condition;
	information	 = 	DIA_Angar_NW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Je vais quitter Khorinis. Voulez-vous venir avec moi ?";
};
func int DIA_Angar_NW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Angar_IsOnBoard == FALSE) 
	&& (Npc_KnowsInfo(other, DIA_Angar_NW_AllDragonsDead))
	{
		return TRUE;
	};
};
func void DIA_Angar_NW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Angar_NW_KnowWhereEnemy_15_00"); //Je vais quitter Khorinis. Voudriez-vous venir avec moi ?
	AI_Output			(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_01"); //Plus je serai loin de la Vallée des mines, mieux cela vaudra. Quand partons-nous ?
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	
	B_LogEntry (TOPIC_Crew,"Plus Angar pourra mettre de kilomètres entre lui et la Vallée des mines, plus il sera content. Il m'a proposé de m'accompagner dans mon voyage.");  
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Angar_NW_KnowWhereEnemy_15_02"); //Pour l'instant, mon équipage est au complet. Peut-être reviendrai-je plus tard.
		AI_Output			(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_03"); //Très bien. Je serai ici si vous avez besoin de moi.
	}
	else 
	{
		Info_ClearChoices (DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice (DIA_Angar_NW_KnowWhereEnemy,"Je vous ferai savoir quand il sera temps d'y aller.",DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Angar_NW_KnowWhereEnemy,"Alors, allez au port. Je vous y retrouverai plus tard.",DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Angar_NW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00"); //Alors allez au port. Je vous y retrouverai plus tard.
	AI_Output (self ,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01"); //J'y vais de ce pas.
	 
                                                                                                                                                  
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Angar_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	B_GivePlayerXP (XP_Crewmember_Success);

	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Angar_NW_KnowWhereEnemy);
};

FUNC VOID DIA_Angar_NW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Angar_NW_KnowWhereEnemy_No_15_00"); //Je vous ferai savoir quand il sera temps de partir.
	AI_Output (self ,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01"); //Bien.

	Angar_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Angar_NW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_NW_LeaveMyShip		(C_INFO)
{
	npc			 = 	DJG_705_Angar_NW;
	nr			 = 	55;
	condition	 = 	DIA_Angar_NW_LeaveMyShip_Condition;
	information	 = 	DIA_Angar_NW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Restez ici et prenez soin de vous.";
};
func int DIA_Angar_NW_LeaveMyShip_Condition ()
{	
	if (Angar_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Angar_NW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Angar_NW_LeaveMyShip_15_00"); //Restez ici et soignez-vous.
	AI_Output			(self, other, "DIA_Angar_NW_LeaveMyShip_04_01"); //Très bien. Je repars. C'est peut-être mieux ainsi.
	
	Angar_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_NW_StillNeedYou		(C_INFO)
{
	npc			 = 	DJG_705_Angar_NW;
	nr			 = 	55;
	condition	 = 	DIA_Angar_NW_StillNeedYou_Condition;
	information	 = 	DIA_Angar_NW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Revenez à bord.";
};

func int DIA_Angar_NW_StillNeedYou_Condition ()
{	
	if ((Angar_IsOnBOard == LOG_OBSOLETE)	
	|| (Angar_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Angar_NW_StillNeedYou_15_00"); //Retournez à bord.
	AI_Output	(self, other, "DIA_Angar_NW_StillNeedYou_04_01"); //Vous êtes pire que moi. Quand vous vous serez décidé, faites-moi signe. On se voit plus tard.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Angar_IsOnBoard	 = LOG_SUCCESS;
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

INSTANCE DIA_Angar_NW_PICKPOCKET (C_INFO)
{
	npc			= DJG_705_Angar_NW;
	nr			= 900;
	condition	= DIA_Angar_NW_PICKPOCKET_Condition;
	information	= DIA_Angar_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Angar_NW_PICKPOCKET_Condition()
{
	C_Beklauen (47, 34);
};
 
FUNC VOID DIA_Angar_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Angar_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Angar_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Angar_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Angar_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Angar_NW_PICKPOCKET_DoIt);
};

func void DIA_Angar_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Angar_NW_PICKPOCKET);
};
	
func void DIA_Angar_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Angar_NW_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_NW_FOUNDAMULETT		(C_INFO)
{
	npc		 = 	DJG_705_Angar_NW;
	nr		 = 	7;
	condition	 = 	DIA_Angar_NW_FOUNDAMULETT_Condition;
	information	 = 	DIA_Angar_NW_FOUNDAMULETT_Info;

	description	 = 	"J'ai trouvé votre amulette.";
};

func int DIA_Angar_NW_FOUNDAMULETT_Condition ()
{
	if 	(Npc_HasItems (other,ItAm_Mana_Angar_MIS))
		&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_NW_FOUNDAMULETT_Info ()
{
	B_AngarsAmulettAbgeben ();
};
