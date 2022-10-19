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
	description = "�Qu� pasa?";
};
FUNC INT DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gunnar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Hallo_15_00"); //�Qu� pasa?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_01"); //Desde que Onar anunci� que contrataba mercenarios, el patio se ha llenado de bribones.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_02"); //Ha venido toda la chusma que antes no ten�a agallas para salir del bosque.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_03"); //Los bastardos salen de todas partes...
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_04"); //As� que ahora eres mercenario, �eh?
	};	
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_05"); //�Qu� Innos te acompa�e!
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
	description = "�Los mercenarios vienen de todas partes?";
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
	AI_Output (other, self, "DIA_Gunnar_Everywhere_15_00"); //�Los mercenarios vienen de todas partes?
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_01"); //La mayor�a viene de la colonia penal.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_02"); //Otro grupo de mercenarios lleg� del sur, donde seguramente se dedicaban a cazar orcos.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_03"); //Y apuesto que tambi�n han venido unos cuantos bandidos de las monta�as para comer gratis.
};

// ************************************************************
// 			  			Aud dem S�den
// ************************************************************
INSTANCE DIA_Gunnar_South (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 3;
	condition   = DIA_Gunnar_South_Condition;
	information = DIA_Gunnar_South_Info;
	permanent   = TRUE;
	description = "�Qu� sabes de los mercenarios del sur?";
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
	AI_Output (other, self, "DIA_Gunnar_South_15_00"); //�Qu� sabes de los mercenarios del sur?
	AI_Output (self, other, "DIA_Gunnar_South_10_01"); //No mucho. Tengo entendido que se dedicaban a cazar orcos.
	AI_Output (self, other, "DIA_Gunnar_South_10_02"); //Su jefe es Sylvio. Bullco, Sentenza, Raoul y otros trabajan para �l...
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
	description = "�Qui�nes fueron los que vinieron de la colonia?";
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
	AI_Output (other, self, "DIA_Gunnar_Colony_15_00"); //�Qui�nes vinieron de la colonia?
	AI_Output (self, other, "DIA_Gunnar_Colony_10_01"); //Lee y su gente. Torlof, Cord, Jarvis, Wolf y los dem�s.
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
	description = "�De qu� bandidos hablabas?";
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
	AI_Output (other, self, "DIA_Gunnar_Bandits_15_00"); //�De qu� bandidos hablabas?
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_01"); //Ah, no era m�s que un chismorreo. No estoy seguro.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_02"); //Al sur del valle hay monta�as con minas abandonadas. All� se esconden algunos bandidos.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_03"); //Tambi�n hay presos de la colonia, como la mayor�a de los mercenarios del patio.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_04"); //La �nica diferencia es que son a�n m�s canallas. Matan a todo el que se acerca demasiado.
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


