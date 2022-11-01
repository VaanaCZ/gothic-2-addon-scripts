// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_7_EXIT_Condition;
	information	= DIA_BAU_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_7_JOIN_Condition;
	information	= DIA_BAU_7_JOIN_Info;
	permanent	= TRUE;
	description = "¿Qué sabes de los mercenarios?";
};                       

FUNC INT DIA_BAU_7_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_JOIN_15_00"); //¿Qué sabes de los mercenarios?
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_01"); //Onar los contrató para defender la granja.
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_02"); //La mayoría se comporta como si la granja fuera suya, pero por lo menos nos protegen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_7_PEOPLE_Condition;
	information	= DIA_BAU_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_BAU_7_PEOPLE_07_01"); //La granja grande es de Onar y las pequeñas también son suyas, pero las arrienda.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_7_LOCATION_Condition;
	information	= DIA_BAU_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Cuéntame algo más de la zona.";
};                       

FUNC INT DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_LOCATION_15_00"); //Cuéntame algo más de la zona.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_01"); //La granja grande que está al este del valle es de Onar. La granja de Sekob está al norte.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_02"); //Y la granja de Bengar está en la meseta del sudoeste. Se puede subir allí desde el valle, por una gran escalinata de piedra.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_7_STANDARD_Condition;
	information	= DIA_BAU_7_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Qué hay de nuevo?";
};                       
func INT DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_STANDARD_15_00"); //¿Qué hay de nuevo?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_01"); //Hemos declarado nuestra independencia: no vamos a volver a pagar impuestos a la ciudad. ¡El rey no ha hecho nada por nosotros y estamos hartos!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_02"); //Ahora mismo, no pasa gran cosa.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_03"); //¡Ahora se oyen rumores de dragones! Al rey siempre se le ocurren ideas nuevas para sacarle dinero al pueblo.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_04"); //Ten cuidado, por el desfiladero cruzan un montón de seres siniestros y animales salvajes.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_05"); //Ahora que los dragones han muerto, los paladines se dignan a salir de la ciudad. Ya era hora de que volviera a reinar el orden por aquí.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_7 (var c_NPC slf)
{
	DIA_BAU_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
