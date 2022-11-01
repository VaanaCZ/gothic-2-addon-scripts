// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_12_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_12_EXIT_Condition;
	information	= DIA_PAL_12_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_12_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_12_JOIN_Condition;
	information	= DIA_PAL_12_JOIN_Info;
	permanent	= TRUE;
	description = "¡Quiero convertirme en paladín!";
};                       

FUNC INT DIA_PAL_12_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_JOIN_15_00"); //¡Quiero convertirme en paladín!
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //¿Tú? ¡No me hagas reír! Ni siquiera eres miembro de la guardia de la ciudad.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //Si no viera claramente que eres un palurdo estúpido, pensaría que tratabas de insultarme.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //Solo los mejores de los mejores de entre los siervos fieles del rey y de nuestro Señor Innos son aceptados como paladines.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_12_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_12_PEOPLE_Condition;
	information	= DIA_PAL_12_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_PAL_12_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_01"); //El honorable lord Hagen, aunque lord Andre se encarga de todos los asuntos relacionados con la plebe.
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //Lo encontrarás en el cuartel. A lo mejor tienes suerte y te dedica unos minutos de su valioso tiempo.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_12_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_12_LOCATION_Condition;
	information	= DIA_PAL_12_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Qué hacéis los paladines en Khorinis?";
};                       

FUNC INT DIA_PAL_12_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //¿Qué hacéis los paladines en Khorinis?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //La gente que hace preguntas acaba en la horca en un periquete.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //Si hay algo que lord Andre no puede permitirse es que los espías se enteren de la naturaleza de nuestra misión.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //Ten cuidado con lo que preguntas.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_12_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_12_STANDARD_Condition;
	information	= DIA_PAL_12_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Cómo van las cosas?";
};
                       
func INT DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_STANDARD_15_00"); //¿Cómo van las cosas?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //Ahora que sabemos que nos enfrentamos a dragones, seguro que nuestro comandante no tarda en hacer algo.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //Seguimos sin tener noticias de nuestro destacamento del Valle de las Minas. Es muy preocupante.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //¡Demos gracias a Innos! Se ha conjurado la amenaza de los dragones, y solo tenemos que encargarnos de los orcos para hacernos con el mineral.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //No esperarás que te responda esa pregunta, ¿eh, chaval?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_12 (var c_NPC slf)
{
	DIA_PAL_12_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
