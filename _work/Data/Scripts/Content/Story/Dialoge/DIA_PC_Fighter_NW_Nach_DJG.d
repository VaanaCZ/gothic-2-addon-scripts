
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

	description = "¿Estás tranquilo?";
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
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00"); //¿Estás tranquilo?
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01"); //Claro, ¿por qué no iba a estarlo? Los dragones han muerto, ¿no?
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02"); //El caso es algo más complicado.
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03"); //(Se ríe) Bueno. Como siempre. Avísame cuando necesites mi hacha.
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
	description	 = 	"Tú y tu hacha podríais serme útiles.";
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
	AI_Output			(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00"); //Tú y tu hacha podríais serme útiles.
	AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01"); //Bien. No me sorprende. ¿Qué puedo hacer por ti?
	AI_Output			(other, self, "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02"); //¿Te embarcarías conmigo para sacudir a los enemigos en una isla?
	AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03"); //(Se ríe) Claro. Ahora mismo. Dime lo que hay que hacer.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Gorn estaba completamente de acuerdo cuando le hablé de la isla. Si necesito un hacha, debería llevarlo conmigo.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04"); //En este momento la tripulación está completa, pero voy a pensarme si te puedes enrolar.
		AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05"); //Si tienes que echar a alguien por mí, escoge al más débil.
		AI_Output			(self, other, "DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06"); //Corren tiempos difíciles, y todo el que pueda echar una mano es necesario.
	}
	else 
	{
		Info_ClearChoices (DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice (DIA_GornNW_nach_DJG_KnowWhereEnemy,"Te lo diré cuando sea el momento.",DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice (DIA_GornNW_nach_DJG_KnowWhereEnemy,"Ven abordo conmigo. Espérame en el puerto.",DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00"); //Acompáñame a bordo. Espérame en el puerto.
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01"); //¿Un barco? ¡Ja! Tengo que decirte algo. Contigo no hay manera de aburrirse. Nos vemos.
	
	
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
	AI_Output (other,self ,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00"); //Te lo diré cuando sea el momento.
	AI_Output (self ,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01"); //De acuerdo.

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
	description	 = 	"Quizá harías mejor en quedarte aquí.";
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
	AI_Output			(other, self, "DIA_GornNW_nach_DJG_LeaveMyShip_15_00"); //Quizá harías mejor en quedarte aquí.
	AI_Output			(self, other, "DIA_GornNW_nach_DJG_LeaveMyShip_12_01"); //¿Se supone que tengo que dejarte ir solo? Um. Para mí no es fácil, pero es tu guerra. Si quieres que finalmente te siga, vuelve a verme.
	
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
	description	 = 	"Vuelve, te necesito.";
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
	AI_Output	(other, self, "DIA_GornNW_nach_DJG_StillNeedYou_15_00"); //Vuelve. Te necesito.
	AI_Output	(self, other, "DIA_GornNW_nach_DJG_StillNeedYou_12_01"); //¿Qué te dije? Creía que querías que me pudriera aquí mientras tú te divertías. Hasta luego.
		
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


