// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_6_EXIT_Condition;
	information	= DIA_VLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_JOIN_Condition;
	information	= DIA_VLK_6_JOIN_Info;
	permanent	= TRUE;
	description = "¿Cómo me convierto en ciudadano?";
};                       

FUNC INT DIA_VLK_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //¿Cómo me convierto en ciudadano?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //¿Quieres instalarte aquí? ¿Ahora? ¿Cuando todo indica que el fin del mundo se aproxima?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //No tenía pensado quedarme para siempre.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Si aceptas mi consejo, deberías largarte a toda prisa mientras puedas. Pero si insistes, habla con uno de los ciudadanos influyentes.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_6_PEOPLE_Condition;
	information	= DIA_VLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quiénes son los ciudadanos influyentes de Khorinis?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //¿Quiénes son los ciudadanos influyentes de Khorinis?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Prueba con el herrero o el carpintero de la parte baja de la ciudad. Allí también encontrarás a otros artesanos de renombre.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //Estos hombres son los pocos que tienen algo que decir en la ciudad, además de los guardias de la ciudad y los paladines.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_6_LOCATION_Condition;
	information	= DIA_VLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Cómo puedo orientarme en la ciudad?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //¿Cómo puedo orientarme en la ciudad?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //La verdad es que no es fácil hacerlo. Ni siquiera los carteles ayudan.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Si no tienes mucho sentido de la orientación, será mejor que bajes al puerto (suponiendo que puedas encontrarlo) y busques la casa del cartógrafo.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //Está al lado de la taberna, en el muelle. Seguro que Brahim puede proporcionarte un mapa de la ciudad.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_6_STANDARD_Condition;
	information	= DIA_VLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Qué hay de nuevo?";
};                       
func INT DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //¿Qué hay de nuevo?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Desde que cayó la barrera, la ciudad está infestada de bandidos, pero los paladines no hacen nada. ¿Para qué narices están aquí, si puede saberse?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Últimamente el problema de los bandidos no es tan grave. Parece que alguien se ha estado ocupando del tema.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Han soltado al mercenario de mierda que asesinó al paladín. No habría sido mala idea ahorcarlo.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //Se dice que uno de los mercenarios de Onar ha matado a un paladín. Lo han cogido y lo han metido en la cárcel. No van a tardar en ahorcarlo.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //Me pregunto si hay algo de cierto en los rumores de los dragones...
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //Se dice que lord Hagen ha movilizado a sus hombres para liberar el Valle de las Minas. ¡Por fin hay algo de actividad!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_6 (var c_NPC slf)
{
	DIA_VLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
