// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_16_EXIT_Condition;
	information	= DIA_VLK_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_16_JOIN_Condition;
	information	= DIA_VLK_16_JOIN_Info;
	permanent	= TRUE;
	description = "Voglio diventare un cittadino di questa città!";
};                       

FUNC INT DIA_VLK_16_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_16_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_JOIN_15_00"); //Voglio diventare un cittadino di questa città!
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_01"); //Vuoi aiutarci a difendere la città dagli orchi?
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_02"); //Se sei un cittadino di Khorinis, puoi arruolarti nella guardia cittadina. Devi solo parlare con una delle guardie.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_16_PEOPLE_Condition;
	information	= DIA_VLK_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "Quali sono le personalità importanti in questa città?";
};                       

FUNC INT DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_PEOPLE_15_00"); //Quali sono le personalità importanti in questa città?
	AI_Output (self, other, "DIA_VLK_16_PEOPLE_16_01"); //I paladini hanno il controllo della parte alta della città.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_16_LOCATION_Condition;
	information	= DIA_VLK_16_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa c’è di interessante da vedere, qui?";
};                       

FUNC INT DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_LOCATION_15_00"); //Cosa c’è di interessante da vedere, qui?
	AI_Output (self, other, "DIA_VLK_16_LOCATION_16_01"); //Ci sono merci di ogni genere in vendita al mercato.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_16_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_16_STANDARD_Condition;
	information	= DIA_VLK_16_STANDARD_Info;
	permanent	= TRUE;
	description = "Novità?";
};                       
func INT DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_STANDARD_15_00"); //Novità?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_00"); //Spero che la milizia riuscirà a scoprire perché la popolazione di Khorinis continui a diminuire.
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_01"); //Non puoi non temere per la tua vita quando senti che molti altri sono già scomparsi.
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
		SC_HearedAboutMissingPeople = TRUE;
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_01"); //L'hai saputo? Gli orchi sono stati avvistati fuori della città. Speriamo che i paladini dispongano di abbastanza uomini.
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_02"); //Mi chiedo se sia questo il motivo per cui i contadini non vengono più al mercato.
	};
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_03"); //Il mercenario accusato dell'assasinio di Lothar è innocente. Hanno trovato delle prove che era stato incastrato. L'ho sentito dire al mercato.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_04"); //È un oltraggio. I mercenari di Onar hanno ucciso l'onorevole Lothar in mezzo alla strada.
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_05"); //Innos in persona li punirà per i loro peccati. Nessuno può alzare un dito contro un guerriero del nostro Signore.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_06"); //Ho sentito dire che i criminali stanno abbandonando la fattoria di Onar. Dicono che, per paura degli uomini di Lord Hagen, si ritireranno nella Valle delle Miniere.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_07"); //Ho sentito dire che un gruppo di paladini è riuscito a sconfiggere gli orribili draghi nella Valle delle Miniere.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_16 (var c_NPC slf)
{
	DIA_VLK_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_16_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
