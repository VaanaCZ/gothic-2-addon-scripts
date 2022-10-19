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
	description = "Wie sieht's aus?";
};
FUNC INT DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gunnar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Hallo_15_00"); //Wie sieht's aus?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_01"); //Seit Onar verlauten ließ, dass er Söldner anheuert, quillt der Hof fast über vor lauter Galgenvögeln.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_02"); //Das ganze Gesindel, das sich vorher nicht aus den Wäldern getraut hat, ist jetzt hier.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_03"); //Die Kerle kamen echt von überall her ...
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_04"); //Du bist jetzt auch einer von den Söldnern, hm?
	};	
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_05"); //Innos sei mit dir!
	};
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_06"); //Leute aus der Stadt sind hier nicht willkommen.
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
	description = "Die Söldner kamen von überall her?";
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
	AI_Output (other, self, "DIA_Gunnar_Everywhere_15_00"); //Die Söldner kamen von überall her?
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_01"); //Ein Großteil kam aus der Strafkolonie.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_02"); //Eine weitere Gruppe von Söldnern kam aus dem Süden, sie haben dort wohl Orks gejagt.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_03"); //Und ich wette, es sind auch mittlerweile ein paar Banditen aus den Bergen hier und lassen sich durchfüttern!
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
	description = "Was weißt du von den Söldnern aus dem Süden?";
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
	AI_Output (other, self, "DIA_Gunnar_South_15_00"); //Was weißt du von den Söldnern aus dem Süden?
	AI_Output (self, other, "DIA_Gunnar_South_10_01"); //Nicht viel. Die haben da wohl Orks gejagt, soviel ich weiß.
	AI_Output (self, other, "DIA_Gunnar_South_10_02"); //Sylvio ist ihr Boss. Zu ihm gehören Bullco, Sentenza, Raoul und noch ein paar andere ...
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
	description = "Wer kam alles aus der Kolonie?";
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
	AI_Output (other, self, "DIA_Gunnar_Colony_15_00"); //Wer kam alles aus der Kolonie?
	AI_Output (self, other, "DIA_Gunnar_Colony_10_01"); //Lee und seine Leute. Torlof, Cord, Jarvis, Wolf und wie sie alle heißen.
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
	description = "Von welchen Banditen hast du geredet?";
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
	AI_Output (other, self, "DIA_Gunnar_Bandits_15_00"); //Von welchen Banditen hast du geredet?
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_01"); //Das war nur so'n Spruch. Bin mir da nicht so sicher.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_02"); //Im Süden des Tals gibt es Berge mit verlassenen Minen. Da oben verstecken sich einige Banditen.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_03"); //Es sind auch Sträflinge aus der Kolonie, genau wie die meisten Söldner auf dem Hof hier.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_04"); //Nur mit dem Unterschied, dass sie noch schlimmerer Abschaum sind. Die bringen jeden um, der sich in ihre Nähe traut.
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


