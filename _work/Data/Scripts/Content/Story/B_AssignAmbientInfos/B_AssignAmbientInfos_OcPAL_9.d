// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCPAL_9_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCPAL_9_EXIT_Condition;
	information	= DIA_OCPAL_9_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCPAL_9_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCPAL_9_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCPAL_9_PEOPLE_Condition;
	information	= DIA_OCPAL_9_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_OCPAL_9_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_9_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_OCPAL_9_PEOPLE_09_01"); //Garond es el comandante del castillo. La verdad es que su posición no es envidiable.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCPAL_9_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCPAL_9_LOCATION_Condition;
	information	= DIA_OCPAL_9_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Qué sabes de este valle?";
};                       

FUNC INT DIA_OCPAL_9_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_9_LOCATION_15_00"); //¿Qué sabes de este valle?
	AI_Output (self, other, "DIA_OCPAL_9_LOCATION_09_01"); //Los orcos han construido una alta muralla protectora en el este, supongo que para proteger sus pertrechos. Detrás de la muralla hay un lugar donde atracan sus barcos.
	AI_Output (self, other, "DIA_OCPAL_9_LOCATION_09_02"); //Espero que los orcos tarden en abastecerse. Ya nos cuesta afrontar lo que tienen ahora mismo.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCPAL_9_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCPAL_9_STANDARD_Condition;
	information	= DIA_OCPAL_9_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Cómo van las cosas?";
};
                       
func INT DIA_OCPAL_9_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_STANDARD_15_00"); //¿Cómo van las cosas?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_01"); //¡Los dragones han vuelto a atacar! ¡No obstante, Innos nos protegerá en la batalla y las criaturas de Beliar van a pagarlo caro con su sangre!
	};

	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_02"); //¡Cazadores de dragones! ¡Debían habernos enviado paladines!
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_03"); //¡Ahora que hemos acabado con los ladrones, nos ocuparemos de los orcos!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_04"); //Tenemos que llevar el mineral al barco y largarnos de esta tierra maldita.
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_05"); //¡Traición! La puerta no debía haberse abierto. ¡Muerte a los traidores!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCPAL_9 (var c_NPC slf)
{
	DIA_OCPAL_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
