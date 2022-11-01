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

	description = "Jak se vede?";
};                       
FUNC INT DIA_Angar_NW_AllDragonsDead_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Angar_NW_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Angar_NW_AllDragonsDead_15_00"); //Jak se vede?
	AI_Output (self ,other,"DIA_Angar_NW_AllDragonsDead_04_01"); //Docela dobře. Ale pořád mám ty šílené bolesti. I když od té doby, co nejsem v Hornickém údolí, se to dost zlepšilo.
	if (Angar_IsOnBoard != LOG_SUCCESS) 
	{
	AI_Output (self ,other,"DIA_Angar_NW_AllDragonsDead_04_02"); //Zůstanu tady. Takže kdybys mě potřeboval, víš, kde mě hledat.
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
	description	 = 	"Chystám se opustit Khorinis. Chceš se přidat?";
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
	AI_Output			(other, self, "DIA_Angar_NW_KnowWhereEnemy_15_00"); //Chystám se opustit Khorinis. Chceš se přidat?
	AI_Output			(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_01"); //Čím dál budu od Hornického údolí, tím líp. Kdy vyrazíme?
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	
	B_LogEntry (TOPIC_Crew,"Angar je rád za každou míli, o kterou se vzdálí od Hornického údolí. Nabídl mi, že mě na cestě doprovodí.");  
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Angar_NW_KnowWhereEnemy_15_02"); //Momentálně mám dost lidí na to, aby mohli řídit loď. Možná se k tobě později ještě vrátím.
		AI_Output			(self, other, "DIA_Angar_NW_KnowWhereEnemy_04_03"); //Fajn. Budu tady, kdybys mě potřeboval.
	}
	else 
	{
		Info_ClearChoices (DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice (DIA_Angar_NW_KnowWhereEnemy,"Dám ti vědět, až budeme vyplouvat.",DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Angar_NW_KnowWhereEnemy,"Zajdi tedy do přístavu. Pak se tam potkáme.",DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Angar_NW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00"); //Zajdi tedy do přístavu. Pak se tam potkáme.
	AI_Output (self ,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01"); //To se mi líbí.
	 
                                                                                                                                                  
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
	AI_Output (other,self ,"DIA_Angar_NW_KnowWhereEnemy_No_15_00"); //Dám ti vědět, až budeme vyplouvat.
	AI_Output (self ,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01"); //Dobrá.

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
	description	 = 	"Zůstaň tady a starej se o své problémy.";
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
	AI_Output			(other, self, "DIA_Angar_NW_LeaveMyShip_15_00"); //Zůstaň tady a starej se o své problémy.
	AI_Output			(self, other, "DIA_Angar_NW_LeaveMyShip_04_01"); //Dobrá. Vrátím se. Možná to bude tak lepší.
	
	Angar_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Začít"); 
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
	description	 = 	"Vrať se na palubu.";
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
	AI_Output	(other, self, "DIA_Angar_NW_StillNeedYou_15_00"); //Vrať se na palubu.
	AI_Output	(self, other, "DIA_Angar_NW_StillNeedYou_04_01"); //Jsi horší než já. Trochu víc rozhodnosti by ti jen prospělo. Ještě se uvidíme.
		
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

	description	 = 	"Našel jsem tvůj amulet.";
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
