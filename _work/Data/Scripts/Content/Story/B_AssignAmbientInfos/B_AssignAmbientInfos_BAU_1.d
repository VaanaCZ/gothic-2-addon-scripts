// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_1_EXIT_Condition;
	information	= DIA_BAU_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_1_JOIN_Condition;
	information	= DIA_BAU_1_JOIN_Info;
	permanent	= TRUE;
	description = "Cuéntame algo más de esos mercenarios.";
};                       

FUNC INT DIA_BAU_1_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_JOIN_15_00"); //Cuéntame algo más de esos mercenarios.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_01"); //Te aconsejo que los evites.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_02"); //Si a alguno de ellos no le gusta tu cara, a lo mejor te la parte.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_03"); //Después te puedes quejar a Lee, pero seguirás con la cara partida.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_1_PEOPLE_Condition;
	information	= DIA_BAU_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_01"); //Es la granja de Onar. Él es quien toma todas las decisiones.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_02"); //Te aconsejo que no te pelees con sus mercenarios. No son unos chicos con los que se pueda jugar.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_03"); //En concreto, Sylvio es un bribón bastante ladino, aunque su líder, Lee, es buen tipo.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_1_LOCATION_Condition;
	information	= DIA_BAU_1_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Qué hay por aquí?";
};                       

FUNC INT DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_LOCATION_15_00"); //¿Qué hay por aquí?
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_01"); //Nada más que tierras de labranza y granjas. Y un puñado de mercenarios, pero casi todos están al este, en la granja de Onar.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_02"); //Al norte está la granja de Sekob, pero sólo van a cobrar la renta.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_03"); //Al sudoeste está el sendero que lleva a la granja de Bengar.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_1_STANDARD_Condition;
	information	= DIA_BAU_1_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Qué hay de nuevo?";
};                       
func INT DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_STANDARD_15_00"); //¿Qué hay de nuevo?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_01"); //Onar ha contratado mercenarios para quitarse de encima a la milicia de la ciudad. Si no, se llevarían hasta la última oveja.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_02"); //Casi nada. Seguimos con los mismos problemas. La milicia, los orcos y los bandidos.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_03"); //Pasan cosas raras. Hace unas cuantas noches vi una silueta negra, y no era humaná.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_04"); //Cada vez se ven orcos con más frecuencia. A veces creo que por cada orco que matamos aparecen dos nuevos.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_05"); //Los paladines se van al Valle de las Minas. ¿De qué va todo esto? No va a quedar nadie que frene el avance de la milicia.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_1 (var c_NPC slf)
{
	DIA_BAU_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
