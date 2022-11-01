// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gunnar_EXIT   (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 999;
	condition   = DIA_Gunnar_EXIT_Condition;
	information = DIA_Gunnar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gunnar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo 
// ************************************************************
var int Gunnar_HalloGesagt;
// ------------------------

INSTANCE DIA_Gunnar_Hallo   (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 1;
	condition   = DIA_Gunnar_Hallo_Condition;
	information = DIA_Gunnar_Hallo_Info;
	permanent   = TRUE;
	description = "¿Qué pasa?";
};
FUNC INT DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gunnar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Hallo_15_00"); //¿Qué pasa?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_01"); //Desde que Onar anunció que contrataba mercenarios, el patio se ha llenado de bribones.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_02"); //Ha venido toda la chusma que antes no tenía agallas para salir del bosque.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_03"); //Los bastardos salen de todas partes...
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_04"); //Así que ahora eres mercenario, ¿eh?
	};	
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_05"); //¡Qué Innos te acompañe!
	};
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_06"); //La gente de la ciudad no es bienvenida.
	};
	
	Gunnar_HalloGesagt = TRUE;
};

// ************************************************************
// 			  				  Everywhere 
// ************************************************************
INSTANCE DIA_Gunnar_Everywhere   (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 2;
	condition   = DIA_Gunnar_Everywhere_Condition;
	information = DIA_Gunnar_Everywhere_Info;
	permanent   = TRUE;
	description = "¿Los mercenarios vienen de todas partes?";
};
FUNC INT DIA_Gunnar_Everywhere_Condition()
{
	if (Gunnar_HalloGesagt == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_Everywhere_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Everywhere_15_00"); //¿Los mercenarios vienen de todas partes?
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_01"); //La mayoría viene de la colonia penal.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_02"); //Otro grupo de mercenarios llegó del sur, donde seguramente se dedicaban a cazar orcos.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_03"); //Y apuesto que también han venido unos cuantos bandidos de las montañas para comer gratis.
};

// ************************************************************
// 			  			Aud dem Süden
// ************************************************************
INSTANCE DIA_Gunnar_South (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 3;
	condition   = DIA_Gunnar_South_Condition;
	information = DIA_Gunnar_South_Info;
	permanent   = TRUE;
	description = "¿Qué sabes de los mercenarios del sur?";
};
FUNC INT DIA_Gunnar_South_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_South_Info()
{
	AI_Output (other, self, "DIA_Gunnar_South_15_00"); //¿Qué sabes de los mercenarios del sur?
	AI_Output (self, other, "DIA_Gunnar_South_10_01"); //No mucho. Tengo entendido que se dedicaban a cazar orcos.
	AI_Output (self, other, "DIA_Gunnar_South_10_02"); //Su jefe es Sylvio. Bullco, Sentenza, Raoul y otros trabajan para él...
};

// ************************************************************
// 			  			Aus der Barriere
// ************************************************************
INSTANCE DIA_Gunnar_Colony (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 4;
	condition   = DIA_Gunnar_Colony_Condition;
	information = DIA_Gunnar_Colony_Info;
	permanent   = TRUE;
	description = "¿Quiénes fueron los que vinieron de la colonia?";
};
FUNC INT DIA_Gunnar_Colony_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_Colony_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Colony_15_00"); //¿Quiénes vinieron de la colonia?
	AI_Output (self, other, "DIA_Gunnar_Colony_10_01"); //Lee y su gente. Torlof, Cord, Jarvis, Wolf y los demás.
};

// ************************************************************
// 			  				Banditen
// ************************************************************
INSTANCE DIA_Gunnar_Bandits (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 5;
	condition   = DIA_Gunnar_Bandits_Condition;
	information = DIA_Gunnar_Bandits_Info;
	permanent   = TRUE;
	description = "¿De qué bandidos hablabas?";
};
FUNC INT DIA_Gunnar_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_Bandits_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Bandits_15_00"); //¿De qué bandidos hablabas?
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_01"); //Ah, no era más que un chismorreo. No estoy seguro.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_02"); //Al sur del valle hay montañas con minas abandonadas. Allí se esconden algunos bandidos.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_03"); //También hay presos de la colonia, como la mayoría de los mercenarios del patio.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_04"); //La única diferencia es que son aún más canallas. Matan a todo el que se acerca demasiado.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gunnar_PICKPOCKET (C_INFO)
{
	npc			= BAU_902_Gunnar;
	nr			= 900;
	condition	= DIA_Gunnar_PICKPOCKET_Condition;
	information	= DIA_Gunnar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Gunnar_PICKPOCKET_Condition()
{
	C_Beklauen (45, 70);
};
 
FUNC VOID DIA_Gunnar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gunnar_PICKPOCKET);
	Info_AddChoice		(DIA_Gunnar_PICKPOCKET, DIALOG_BACK 		,DIA_Gunnar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gunnar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gunnar_PICKPOCKET_DoIt);
};

func void DIA_Gunnar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gunnar_PICKPOCKET);
};
	
func void DIA_Gunnar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gunnar_PICKPOCKET);
};


