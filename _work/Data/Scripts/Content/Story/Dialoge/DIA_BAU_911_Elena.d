// ************************************************************
// 			  					EXIT 
// ************************************************************
INSTANCE DIA_Elena_EXIT   (C_INFO)
{
	npc         = BAU_911_Elena;
	nr          = 999;
	condition   = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Elena_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo 
// ************************************************************
instance DIA_Elena_HALLO		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 1;
	condition	= DIA_Elena_HALLO_Condition;
	information	= DIA_Elena_HALLO_Info;
	permanent	= FALSE;
	description	= "Witaj, pi�kna nieznajoma.";
};

func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Elena_HALLO_15_00"); //Witaj, pi�kna nieznajoma.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_01"); //Hmmm. Sk�d uciek�e�?
	}
	else
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_02"); //Czego chcesz?
	};
};


// ************************************************************
// 			  					Aufstand
// ************************************************************
instance DIA_Elena_Aufstand		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 2;
	condition	= DIA_Elena_Aufstand_Condition;
	information	= DIA_Elena_Aufstand_Info;
	permanent	= FALSE;
	description	= "Podobno buntujecie si� przeciwko Kr�lowi?";
};

func int DIA_Elena_Aufstand_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info ()
{
	AI_Output (other, self, "DIA_Elena_Aufstand_15_00"); //Podobno buntujecie si� przeciwko Kr�lowi?
	AI_Output (self, other, "DIA_Elena_Aufstand_16_01"); //M�j ojciec zadecydowa�, �e najwy�szy czas zadba� o nasze bezpiecze�stwo.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Elena_Aufstand_16_02"); //Stra� i tak nigdy nam nie pomog�a. Interesowa�a ich tylko nasza spi�arnia.
	};
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Arbeit		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 3;
	condition	= DIA_Elena_Arbeit_Condition;
	information	= DIA_Elena_Arbeit_Info;
	permanent	= FALSE;
	description	= "Jakiego rodzaju prace prowadzone s� na farmie?";
};

func int DIA_Elena_Arbeit_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Elena_Arbeit_15_00"); //Jakiego rodzaju prace prowadzone s� na farmie?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_01"); //M�j ojciec p�aci wszystkim m�czyznom, kt�rzy zgodz� si� broni� farmy.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_02"); //Jeste� zainteresowany? Nie wygl�dasz na osob�, kt�rej marzeniem jest praca na roli.
	AI_Output (other, self, "DIA_Elena_Arbeit_15_03"); //Ile p�aci tw�j ojciec?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_04"); //Musisz to z nim uzgodni�.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_05"); //Wiem tylko, �e ka�dy najemnik codziennie dostaje pieni�dze.
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Regeln		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 4;
	condition	= DIA_Elena_Regeln_Condition;
	information	= DIA_Elena_Regeln_Info;
	permanent	= FALSE;
	description	= "Czy panuj� tutaj jakie� zasady, o kt�rych powinienem pami�ta�?";
};

func int DIA_Elena_Regeln_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Elena_Regeln_15_00"); //Czy panuj� tutaj jakie� zasady, o kt�rych powinienem pami�ta�?
	AI_Output (self, other, "DIA_Elena_Regeln_16_01"); //Nie dotykaj niczego, co nie nale�y do ciebie.
	AI_Output (self, other, "DIA_Elena_Regeln_16_02"); //Trzymaj si� z daleka od nie swoich spraw.
	AI_Output (self, other, "DIA_Elena_Regeln_16_03"); //Je�li wdasz si� w walk�, trzymaj si� najemnik�w.
	AI_Output (self, other, "DIA_Elena_Regeln_16_04"); //Je�li rozpoczniesz b�jk� z miejscowymi ch�opami, wszyscy obr�c� si� przeciwko tobie.
};


// ************************************************************
// 			  					Aufgabe 
// ************************************************************
instance DIA_Elena_AUFGABE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 5;
	condition	= DIA_Elena_AUFGABE_Condition;
	information	= DIA_Elena_AUFGABE_Info;
	permanent 	= FALSE;
	description	= "Czym si� zajmujesz?";
};

func int DIA_Elena_AUFGABE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info ()
{
	AI_Output (other, self, "DIA_Elena_AUFGABE_15_00"); //Na czym polega twoja praca?
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_01"); //Sprzedaj� towary produkowane na farmie. Gdyby� chcia� co� kupi�, daj mi zna�.
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_02"); //Pozw�l jednak, �e ci� ostrzeg�. Nie znosz� z�odziei, jasne?
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Elena handluje na farmie Onara.");
};

// ************************************************************
// 			  					TRADE 
// ************************************************************

//---------------------------------
var int Elena_Trade_mit_mir;
//---------------------------------

instance DIA_Elena_TRADE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr          = 7;
	condition	= DIA_Elena_TRADE_Condition;
	information	= DIA_Elena_TRADE_Info;
	permanent	= TRUE;
	description	= "Poka� mi, co masz na sprzeda�!";
	trade		= TRUE;
};

func int DIA_Elena_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_AUFGABE))
	|| (Elena_Trade_mit_mir == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Elena_TRADE_15_00"); //Poka� mi swoje towary!
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Elena_TRADE_16_01"); //Co mog� ci zaoferowa�?
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Elena_PERM		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 900;
	condition	= DIA_Elena_PERM_Condition;
	information	= DIA_Elena_PERM_Info;
	permanent	= TRUE;
	description	= "Czy ostatnio zdarzy�o si� co� wa�nego?";
};

func int DIA_Elena_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Elena_PERM_15_00"); //Czy ostatnio zdarzy�o si� co� wa�nego?

	if (kapitel <= 1)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_01"); //Par� dni temu m�j ojciec zadecydowa�, �e nie wolno nam sprzedawa� niczego w mie�cie.
		AI_Output			(self, other, "DIA_Elena_PERM_16_02"); //Wi�c teraz trzymam si� w pobli�u farmy i sprzedaj� swoje towary przejezdnym.
	
		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_03"); //Ataki stra�y na okoliczne farmy staj� si� coraz cz�stsze. Interwencja mojego ojca jest tylko kwesti� czasu.
	}
	else if (Kapitel == 3)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_04"); //Okoliczne ziemie sta�y si� bardzo niebezpieczne. Nikt nie zapuszcza si� poza w�asne tereny. Up�yn�o ju� bardzo du�o czasu, od kiedy kt�rekolwiek z nas by�o w mie�cie.
	}
	else if (kapitel == 4)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_05"); //Najemnicy staj� si� coraz bardziej niespokojni. Chocia� wydaje mi si�, �e od czasu jak opu�ci� nas Sylvio wraz ze swoj� dru�yn�, i tak s� w znacznie lepszej kondycji psychicznej.
	}
	else //Kapitel 5
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_06"); //Wszyscy m�wi� o zbli�aj�cym si� ataku ork�w. Ale ja nie wierz� w te pog�oski. S�dz�, �e tutaj, na farmie, jeste�my bezpieczni.
	};
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Minenanteil
///////////////////////////////////////////////////////////////////////
instance DIA_Elena_MINENANTEIL		(C_INFO)
{
	npc		 = 	BAU_911_Elena;
	nr		 = 	2;
	condition	 = 	DIA_Elena_MINENANTEIL_Condition;
	information	 = 	DIA_Elena_MINENANTEIL_Info;

	description  =  "Sprzedajesz udzia�y w kopalni?";
};

func int DIA_Elena_MINENANTEIL_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Elena_Hallo))
		{
				return TRUE;
		};
};

func void DIA_Elena_MINENANTEIL_Info ()
{
	AI_Output			(other, self, "DIA_Elena_MINENANTEIL_15_00"); //Sprzedajesz udzia�y w kopalni?
	AI_Output			(self, other, "DIA_Elena_MINENANTEIL_16_01"); //No i co z tego? Sama zap�aci�am za nie maj�tek.
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Elena_PICKPOCKET (C_INFO)
{
	npc			= BAU_911_Elena;
	nr			= 900;
	condition	= DIA_Elena_PICKPOCKET_Condition;
	information	= DIA_Elena_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Elena_PICKPOCKET_Condition()
{
	C_Beklauen (30, 35);
};
 
FUNC VOID DIA_Elena_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Elena_PICKPOCKET);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_BACK 		,DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};
	
func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};





















