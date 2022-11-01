// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCPAL_4_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCPAL_4_EXIT_Condition;
	information	= DIA_OCPAL_4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCPAL_4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCPAL_4_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCPAL_4_PEOPLE_Condition;
	information	= DIA_OCPAL_4_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_OCPAL_4_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_OCPAL_4_PEOPLE_04_01"); //El comandante Garond. Está en el edificio mayor del castillo.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCPAL_4_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCPAL_4_LOCATION_Condition;
	information	= DIA_OCPAL_4_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Qué me cuentas del Valle de las Minas?";
};                       

FUNC INT DIA_OCPAL_4_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_LOCATION_15_00"); //¿Qué me cuentas del Valle de las Minas?
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_01"); //Tengo entendido que allí hay muchas minas... si es que no las han invadido los orcos.
	AI_Output (self, other, "DIA_OCPAL_4_LOCATION_04_02"); //La mayor parte de los soldados son prisioneros, pero también hay algunos paladines.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCPAL_4_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCPAL_4_STANDARD_Condition;
	information	= DIA_OCPAL_4_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Cómo van las cosas?";
};
                       
func INT DIA_OCPAL_4_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_4_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_STANDARD_15_00"); //¿Cómo van las cosas?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_01"); //¡Los orcos nos han rodeado, pero nos defenderemos a muerte e Innos nos ayudará contra los dragones!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_02"); //Los orcos no van a tardar en atacar. ¿Dónde están los malditos refuerzos?
			if (other.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_03"); //¿De veras crees que los cazadores de dragones tenéis alguna oportunidad contra todos los dragones?
			}
			else
			{
				AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_04"); //¡Los supuestos cazadores de dragones no van a lograr gran cosa!
			};
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_05"); //¡Gracias a Innos! ¡Esas bestias infernales han sido derrotadas!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_06"); //Parece que la muerte de los dragones no ha impresionado demasiado a los orcos. En el nombre de Innos, ¿por qué no se marchan? Algo malo se trama.
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_07"); //La maldita puerta está atrancada. Los orcos entran en tropel en el castillo y nada se lo impide.
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_04_08"); //Alguien tiene que informar a lord Hagen. Le necesitamos ya.
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCPAL_4 (var c_NPC slf)
{
	DIA_OCPAL_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
