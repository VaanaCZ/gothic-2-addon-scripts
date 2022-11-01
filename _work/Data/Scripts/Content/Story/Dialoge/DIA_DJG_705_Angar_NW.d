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

	description = "Cosa succede?";
};                       
FUNC INT DIA_Angar_NW_AllDragonsDead_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Angar_NW_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Angar_NW_AllDragonsDead_15_00"); //Come va?
	AI_Output (self ,other,"DIA_Angar_NW_AllDragonsDead_04_01"); //Abbastanza bene. Ma ho ancora questo maledetto mal di testa, anche se la situazione è migliorata da quando non sono più nella Valle delle Miniere.
	if (Angar_IsOnBoard != LOG_SUCCESS) 
	{
	AI_Output (self ,other,"DIA_Angar_NW_AllDragonsDead_04_02"); //Resterò qui così saprai dove trovarmi nel caso in cui avessi bisogno di me.
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
	description	 = 	"Me ne andrò da Khorinis. Vuoi venire con me?";
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
	AI_Output			(other, self, "DIA_Angar_NW_KnowWhereEnemy_15_00"); //Me ne andrò da Khorinis. Vuoi venire con me?
	AI_Output			(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_01"); //Più mi allontano dalla Valle delle Miniere e meglio è. Quando partiamo?
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	
	B_LogEntry (TOPIC_Crew,"Angar è grato per ogni miglio che riuscirà a frapporre tra sé e le miniere. Si è offerto di accompagnarmi nel mio viaggio.");  
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Angar_NW_KnowWhereEnemy_15_02"); //Subito. Ho abbastanza uomini per governare la nave. Forse tornerò a prenderti più tardi.
		AI_Output			(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_03"); //Va bene. Mi troverai qui se avrai bisogno di me.
	}
	else 
	{
		Info_ClearChoices (DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice (DIA_Angar_NW_KnowWhereEnemy,"Ti farò sapere quando è il momento di andare.",DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Angar_NW_KnowWhereEnemy,"Vai al porto, allora. Ti raggiungerò lì più tardi.",DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Angar_NW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00"); //Vai al porto, allora. Ti raggiungerò lì più tardi.
	AI_Output (self ,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01"); //Vado.
	 
                                                                                                                                                  
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
	AI_Output (other,self ,"DIA_Angar_NW_KnowWhereEnemy_No_15_00"); //Ti farò sapere quando è il momento di andare.
	AI_Output (self ,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01"); //Bene.

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
	description	 = 	"Rimani qui e tieni a bada il tuo dolore.";
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
	AI_Output			(other, self, "DIA_Angar_NW_LeaveMyShip_15_00"); //Rimani qui e tieni a bada il tuo dolore.
	AI_Output			(self, other, "DIA_Angar_NW_LeaveMyShip_04_01"); //D'accordo. Tornerò indietro. Forse è meglio così.
	
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
	description	 = 	"Torna a bordo.";
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
	AI_Output	(other, self, "DIA_Angar_NW_StillNeedYou_15_00"); //Torna a bordo.
	AI_Output	(self, other, "DIA_Angar_NW_StillNeedYou_04_01"); //Tu sei peggio di me. Un po' più di risolutezza ti farebbe bene. Ci vediamo dopo.
		
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

	description	 = 	"Ho trovato il tuo amuleto.";
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
