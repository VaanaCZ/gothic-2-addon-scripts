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
	description = "¡Quiero convertirme en ciudadano!";
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
	AI_Output (other, self, "DIA_VLK_16_JOIN_15_00"); //¡Quiero convertirme en ciudadano!
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_01"); //¿Nos vas a ayudar a defender la ciudad de los orcos?
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_02"); //Si eres ciudadano de Khorinis, puedes enrolarte en la milicia. Habla con uno de los guardias de la ciudad.
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
	description = "¿Quiénes son las personalidades de la ciudad?";
};                       

FUNC INT DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_PEOPLE_15_00"); //¿Quiénes son las personalidades de la ciudad?
	AI_Output (self, other, "DIA_VLK_16_PEOPLE_16_01"); //Los paladines controlan el barrio alto.
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
	description = "¿Qué cosas interesantes hay aquí para ver?";
};                       

FUNC INT DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_LOCATION_15_00"); //¿Qué cosas interesantes hay aquí para ver?
	AI_Output (self, other, "DIA_VLK_16_LOCATION_16_01"); //En el mercado hay todo tipo de mercancías.
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
	description = "¿Qué hay de nuevo?";
};                       
func INT DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_STANDARD_15_00"); //¿Qué hay de nuevo?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_00"); //Espero que la milicia acabe averiguando por qué la población de Khorinis no hace más que descender.
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_01"); //Es normal temer por tu vida cuando desaparece tanta gente.
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
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_01"); //¿No lo sabes? Se han visto orcos en las afueras de la ciudad. Esperemos que los paladines cuenten con suficientes efectivos.
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_02"); //Me pregunto a qué se debe que los granjeros ya no vengan al mercado.
	};
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_03"); //El mercenario acusado del asesinato de Lothar es inocente. Encontraron pruebas de que le tendieron una trampa. Me he enterado en el mercado.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_04"); //Es un escándalo. Los mercenarios del terrateniente han asesinado al honorable Lothar en plena calle.
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_05"); //Pero Innos les castigará personalmente por sus pecados. Nadie puede alzar una mano contra un guerrero de nuestro Señor.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_06"); //He oído que los criminales se han marchado de la granja de Onar. Dicen que han vuelto al Valle de las Minas por miedo a los hombres de lord Hagen.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_07"); //Me he enterado de que un pelotón de paladines ha conseguido derrotar a los monstruosos dragones en el Valle de las Minas.
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
