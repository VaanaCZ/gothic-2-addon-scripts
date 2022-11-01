// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_9_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_9_EXIT_Condition;
	information	= DIA_PAL_9_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_9_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_9_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_9_JOIN_Condition;
	information	= DIA_PAL_9_JOIN_Info;
	permanent	= TRUE;
	description = "¿Cómo puedo convertirme en paladín?";
};                       

FUNC INT DIA_PAL_9_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_JOIN_15_00"); //¿Cómo puedo convertirme en paladín?
	AI_Output (self, other, "DIA_PAL_9_JOIN_09_01"); //¡Serán elegidos todos aquellos que demuestren su valía al servicio de Innos o del rey!
	AI_Output (self, other, "DIA_PAL_9_JOIN_09_02"); //En pocas palabras: solo serán elegidos los mejores, y a ti te falta mucho, chaval.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_9_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_9_PEOPLE_Condition;
	information	= DIA_PAL_9_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_PAL_9_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_PAL_9_PEOPLE_09_01"); //Lord Hagen.
	AI_Output (other, self, "DIA_PAL_9_PEOPLE_15_02"); //¿Y?
	AI_Output (self, other, "DIA_PAL_9_PEOPLE_09_03"); //Y nadie más. Lord Hagen es el comandante supremo de toda la isla.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_9_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_9_LOCATION_Condition;
	information	= DIA_PAL_9_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Por qué habéis venido los paladines a Khorinis?";
};                       

FUNC INT DIA_PAL_9_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_LOCATION_15_00"); //¿Por qué habéis venido los paladines a Khorinis?
	AI_Output (self, other, "DIA_PAL_9_LOCATION_09_01"); //¡No es de tu incumbencia, amigo! ¡Basta con que sepas que servimos a Innos y al rey!
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_9_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_9_STANDARD_Condition;
	information	= DIA_PAL_9_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Qué pasa?";
};
                       
func INT DIA_PAL_9_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_9_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_STANDARD_15_00"); //¿Qué pasa?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_9_STANDARD_09_01"); //Ahora que sabemos que nos enfrentamos a dragones, seguro que nuestro comandante no tarda en hacer algo.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_9_STANDARD_09_02"); //Seguimos sin tener noticias de nuestro destacamento del Valle de las Minas. Es muy preocupante.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_9_STANDARD_09_03"); //¡Demos gracias a Innos! Se ha conjurado la amenaza de los dragones y solo tenemos que encargarnos de los orcos para hacernos con el mineral.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_9_STANDARD_09_04"); //Si no tienes nada más importante que decir, ¡lárgate, gamberro!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_9 (var c_NPC slf)
{
	DIA_PAL_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_9_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_9_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_9_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_9_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
