// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_7_EXIT_Condition;
	information	= DIA_MIL_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_7_JOIN_Condition;
	information	= DIA_MIL_7_JOIN_Info;
	permanent	= TRUE;
	description = "�Quiero alistarme en la milicia!";
};                       

FUNC INT DIA_MIL_7_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //�Quiero alistarme en la milicia!
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //�Ni siquiera eres ciudadano de Khorinis! �Por qu� piensas que lord Andre debe aceptarte?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //�Podr�a llegar cualquiera para hacerse con un arma y una armadura y luego desaparecer!
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //�Pero hablo en serio!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //A m� no me lo digas, expl�caselo a lord Andre. Le encontrar�s en el cuartel.
		};
	}
	else
	{
		B_Say (self, other, "$ABS_GOOD");
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_7_PEOPLE_Condition;
	information	= DIA_MIL_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "�Qu� sabes de los paladines?";
};                       

FUNC INT DIA_MIL_7_PEOPLE_Condition()
{
	if (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_PEOPLE_15_00"); //�Qu� sabes de los paladines?
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //No mucho. Nadie sabe por qu� han venido. Ni siquiera los que pertenecemos a la guardia de la ciudad.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //Han tomado el control de la ciudad, han echado al gobernador de la c�mara del consejo y han despojado al juez de su cargo.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //En mi opini�n, est� bien. Esos imb�ciles presuntuosos necesitaban una lecci�n de humildad.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_7_LOCATION_Condition;
	information	= DIA_MIL_7_LOCATION_Info;
	permanent	= TRUE;
	description = "�Qu� alternativas tengo en la ciudad?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //�Qu� alternativas tengo en la ciudad?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Si no quieres acabar en los bajos fondos del distrito del puerto, encuentra un empleo fijo. Pregunta en la parte baja de la ciudad, a lo mejor tienes suerte.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Si tienes pensado quedarte un tiempo en la ciudad, deber�as alistarte en la milicia, o por lo menos hacer instrucci�n de combate.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Los instructores de combate del cuartel tambi�n adiestran a civiles.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Los orcos no tardar�n en llegar y, cuando lo hagan, te alegrar�s de cada hora que hayas empleado en el campo de instrucci�n.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_7_STANDARD_Condition;
	information	= DIA_MIL_7_STANDARD_Info;
	permanent	= TRUE;
	description = "�Qu� hay de nuevo?";
};                       
func INT DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_STANDARD_15_00"); //�Qu� hay de nuevo?
		
	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //Est�n desapareciendo ciudadanos poco a poco. Hasta ahora, no hemos podido averiguar qu� les ha ocurrido. �Los orcos estar�n implicados?
			
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{		
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //Se rumorea que los granjeros se han rebelado. Menudo momento han elegido, ahora que estamos en plena guerra contra los orcos.
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Es hora de que los paladines acaben con la rebeli�n de los granjeros. El que infringe la ley ha de ser castigado, sobre todo ahora, que estamos en guerra.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //Por lo visto, el mercenario acusado de asesinar a Lothar es inocente. Alguien encontr� pruebas de que le hab�an tendido una trampa.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Uno de los mercenarios de Onar asesin� al honorable palad�n Lothar, pero al cerdo lo han pillado y ha dado con sus huesos en prisi�n.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //Algunos mercenarios ya se han ido de la granja de Onar. Algunos problemas se resuelven solos.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //Ya no hay dragones, pero los problemas no han acabado. Los orcos son los siguientes. �Resolveremos los problemas por orden!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_7 (var c_NPC slf)
{
	DIA_MIL_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
