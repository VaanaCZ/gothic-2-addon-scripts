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

	description = "Wie sieht's aus?";
};                       
FUNC INT DIA_Angar_NW_AllDragonsDead_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Angar_NW_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Angar_NW_AllDragonsDead_15_00"); //Wie sieht's aus?
	AI_Output (self ,other,"DIA_Angar_NW_AllDragonsDead_04_01"); //Ganz gut. Ich habe nur immer noch diese miesen Kopfschmerzen, obwohl sie schon besser geworden sind, seit ich nicht mehr im Minental bin.
	if (Angar_IsOnBoard != LOG_SUCCESS) 
	{
	AI_Output (self ,other,"DIA_Angar_NW_AllDragonsDead_04_02"); //Ich bleibe erst einmal hier. Dann weißt du, wo du mich finden kannst, wenn du mich brauchst.
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
	description	 = 	"Ich werde Khorinis verlassen. Würdest du mitkommen?";
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
	AI_Output			(other, self, "DIA_Angar_NW_KnowWhereEnemy_15_00"); //Ich werde Khorinis verlassen. Würdest du mitkommen?
	AI_Output			(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_01"); //Je weiter ich von dem Minental weg komme, um so besser. Wann geht's los?
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	
	B_LogEntry (TOPIC_Crew,"Angar ist über jede Meile dankbar, die zwischen ihm und dem Minental liegt. Er hat angeboten, mich auf der Reise zu begleiten");  
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Angar_NW_KnowWhereEnemy_15_02"); //Momentan habe ich schon genug Leute für das Schiff zusammen. Ich komme vielleicht später noch einmal auf dich zurück.
		AI_Output			(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_03"); //Gut. Ich bin hier, wenn du mich brauchst.
	}
	else 
	{
		Info_ClearChoices (DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice (DIA_Angar_NW_KnowWhereEnemy,"Ich sag dir noch, wenn´s los geht.",DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Angar_NW_KnowWhereEnemy,"Komm zum Hafen. Ich komme später nach.",DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Angar_NW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00"); //Komm zum Hafen. Ich komme später nach.
	AI_Output (self ,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01"); //Bin schon unterwegs.
	 
                                                                                                                                                  
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
	AI_Output (other,self ,"DIA_Angar_NW_KnowWhereEnemy_No_15_00"); //Ich sag dir noch, wann's los geht.
	AI_Output (self ,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01"); //Gut.

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
	description	 = 	"Bleib hier und kuriere deine Schmerzen.";
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
	AI_Output			(other, self, "DIA_Angar_NW_LeaveMyShip_15_00"); //Bleib hier und kuriere deine Schmerzen.
	AI_Output			(self, other, "DIA_Angar_NW_LeaveMyShip_04_01"); //Na gut. Ich gehe wieder zurück. Ist vielleicht auch besser so.
	
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
	description	 = 	"Komm zurück an Bord.";
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
	AI_Output	(other, self, "DIA_Angar_NW_StillNeedYou_15_00"); //Komm zurück an Bord.
	AI_Output	(self, other, "DIA_Angar_NW_StillNeedYou_04_01"); //Du bist ja schlimmer als ich. Ein bisschen mehr Entschlossenheit würde dir gut tun. Bis nachher.
		
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

	description	 = 	"Ich habe dein Amulett gefunden.";
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
