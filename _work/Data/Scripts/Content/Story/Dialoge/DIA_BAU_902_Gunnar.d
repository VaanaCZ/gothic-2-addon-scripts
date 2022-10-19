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
	description = "Co s�ycha�?";
};
FUNC INT DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gunnar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Hallo_15_00"); //Co tam?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_01"); //Odk�d Onar og�osi�, �e zatrudnia najemnik�w, wsz�dzie a� si� roi od opryszk�w.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_02"); //Zlaz�a si� tutaj ca�a ho�ota, kt�ra wcze�niej nie mia�a odwagi wyle�� z lasu.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_03"); //Teraz schodz� si� ze wszystkich stron.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_04"); //A wi�c ty r�wnie� jeste� teraz najemnikiem?
	};	
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_05"); //Niech Innos b�dzie z tob�!
	};
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_06"); //Ludzie z miasta nie s� tu mile widziani.
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
	description = "Najemnicy przybywaj� ze wszystkich stron?";
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
	AI_Output (other, self, "DIA_Gunnar_Everywhere_15_00"); //Najemnicy przybywaj� ze wszystkich stron?
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_01"); //Wi�kszo�� z nich pochodzi z kolonii karnej.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_02"); //Inna grupa najemnik�w przyby�a z po�udnia, gdzie pewnie ugania�a si� za orkami.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_03"); //Za�o�� si�, �e paru bandyt�w opu�ci�o g�ry, �eby tutaj przyby�! Zwabi�o ich darmowe �arcie!
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
	description = "Co wiesz na temat najemnik�w z po�udnia?";
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
	AI_Output (other, self, "DIA_Gunnar_South_15_00"); //Co wiesz na temat najemnik�w z po�udnia?
	AI_Output (self, other, "DIA_Gunnar_South_10_01"); //Niewiele. Z tego co wiem, polowali tam na ork�w.
	AI_Output (self, other, "DIA_Gunnar_South_10_02"); //Ich szefem jest Sylvio. Bullko, Sentenza, Raoul i paru innych to jego ludzie.
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
	description = "Kto pochodzi z Kolonii?";
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
	AI_Output (other, self, "DIA_Gunnar_Colony_15_00"); //Kto pochodzi z Kolonii?
	AI_Output (self, other, "DIA_Gunnar_Colony_10_01"); //Lee i jego ludzie. Torlof, Cord, Jarvis, Wilk i jeszcze paru innych.
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
	description = "O jakich bandyt�w ci chodzi?";
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
	AI_Output (other, self, "DIA_Gunnar_Bandits_15_00"); //O jakich bandyt�w ci chodzi?
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_01"); //Tak tylko gadam. Tak naprawd� nie jestem do ko�ca pewien.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_02"); //Na po�udniu znajduj� si� opuszczone kopalnie. W niekt�rych ukrywaj� si� bandyci.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_03"); //Oni r�wnie� s� skaza�cami z Kolonii, tak jak wi�kszo�� najemnik�w, kt�rych tutaj spotkasz.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_04"); //Jedyna r�nica polega na tym, �e to jeszcze gorsze �cierwo. Zabij� ka�dego, kto podejdzie zbyt blisko.
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


