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
	description = "Ich will Bürger dieser Stadt werden!";
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
	AI_Output (other, self, "DIA_VLK_16_JOIN_15_00"); //Ich will Bürger dieser Stadt werden!
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_01"); //Willst du uns helfen, die Stadt gegen die Orks zu verteidigen?
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_02"); //Wenn du Bürger von Khorinis bist, kannst du der Miliz beitreten - du solltest mit einer der Stadtwachen reden.
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
	description = "Wer sind die wichtigen Persönlichkeiten dieser Stadt?";
};                       

FUNC INT DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_PEOPLE_15_00"); //Wer sind die wichtigen Persönlichkeiten dieser Stadt?
	AI_Output (self, other, "DIA_VLK_16_PEOPLE_16_01"); //Die Paladine haben das obere Viertel besetzt.
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
	description = "Was gibt hier Interessantes zu sehen?";
};                       

FUNC INT DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_LOCATION_15_00"); //Was gibt es hier Interessantes zu sehen?
	AI_Output (self, other, "DIA_VLK_16_LOCATION_16_01"); //Auf dem Marktplatz kannst du alle möglichen Waren ansehen.
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
	description = "Was gibt's Neues?";
};                       
func INT DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_00"); //Ich hoffe, dass die Miliz endlich herausfindet, warum die Bevölkerung von Khorinis immer kleiner wird.
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_01"); //Man muss ja Angst um sein Leben haben, wenn man so hört, dass schon so viele vermisst werden.
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
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_01"); //Hast du es schon gehört? Die Orks sind vor der Stadt gesehen worden. Hoffentlich haben die Paladine genügend Leute.
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_02"); //Ich frage mich, ob das der Grund ist, dass keine Bauern mehr zum Markt kommen.
	};
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_03"); //Der Söldner, der Lothar ermordet haben soll, ist unschuldig. Man hat Beweise gefunden, dass man ihm den Mord nur anhängen wollte. Ich hab's auf dem Markt gehört.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_04"); //Es ist ungeheuerlich. Die Söldner des Großbauern haben den ehrenwerten Lothar auf offener Straße ermordet.
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_05"); //Aber Innos selbst wird sie für ihre Sünden bestrafen. Niemand darf Hand an einen Streiter unseres Herrn legen.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_06"); //Ich habe gehört, die Verbrecher flüchten von Onars Hof. Aus Angst vor Lord Hagens Männern sollen sie wieder zurück ins Minental gegangen sein.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_07"); //Ich habe gehört, einem Trupp der Paladine ist es gelungen, die fürchterlichen Drachen im Minental zu besiegen.
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
