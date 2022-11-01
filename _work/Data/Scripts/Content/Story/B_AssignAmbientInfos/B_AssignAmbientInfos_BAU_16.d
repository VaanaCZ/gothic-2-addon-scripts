// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_16_EXIT_Condition;
	information	= DIA_BAU_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_16_JOIN_Condition;
	information	= DIA_BAU_16_JOIN_Info;
	permanent	= TRUE;
	description = "¡Cuéntame algo más de esos mercenarios!";
};                       

FUNC INT DIA_BAU_16_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_16_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_JOIN_15_00"); //¡Cuéntame algo más de esos mercenarios!
	AI_Output (self, other, "DIA_BAU_16_JOIN_16_01"); //Se tiran todo el día holgazaneando en la granja, se pelean de vez en cuando y creen que es para morirse de risa.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_16_PEOPLE_Condition;
	information	= DIA_BAU_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_BAU_16_PEOPLE_16_01"); //En mi opinión, los mercenarios.
	AI_Output (self, other, "DIA_BAU_16_PEOPLE_16_02"); //Onar les paga, pero casi todos hacen lo que les da la gana.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_16_LOCATION_Condition;
	information	= DIA_BAU_16_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Qué me cuentas de este lugar?";
};                       

FUNC INT DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_LOCATION_15_00"); //¿Qué me cuentas de este lugar?
	AI_Output (self, other, "DIA_BAU_16_LOCATION_16_01"); //Aquí hay tres granjas. La de Onar está al este y la de Sekob en el extremo norte del valle.
	AI_Output (self, other, "DIA_BAU_16_LOCATION_16_02"); //Hay un sendero que lleva a la meseta del sudoeste, donde está la granja de Bengar.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_16_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_16_STANDARD_Condition;
	information	= DIA_BAU_16_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Qué hay de nuevo?";
};                       
func INT DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_STANDARD_15_00"); //¿Qué hay de nuevo?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_01"); //¡Las tropas de la ciudad ya no nos quitan las cosechas ni el ganado! Nos defendemos y ya no nos dejamos.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_02"); //Se dice que se está movilizando un ejército en el Valle de las Minas. No tardarán en venir.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_03"); //Se rumorea que hay dragones en el Valle de las Minas. No le doy mucho crédito.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_04"); //Algunos mercenarios se han marchado. No sé si es algo bueno o malo.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_05"); //Mira que enviar a los paladines al Valle de las Minas. ¿De qué va todo esto?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_16 (var c_NPC slf)
{
	DIA_BAU_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_16_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
