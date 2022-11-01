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
	description	= "Witaj, piękna nieznajoma.";
};

func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Elena_HALLO_15_00"); //Witaj, piękna nieznajoma.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_01"); //Hmmm. Skąd uciekłeś?
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
	description	= "Podobno buntujecie się przeciwko Królowi?";
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
	AI_Output (other, self, "DIA_Elena_Aufstand_15_00"); //Podobno buntujecie się przeciwko Królowi?
	AI_Output (self, other, "DIA_Elena_Aufstand_16_01"); //Mój ojciec zadecydował, że najwyższy czas zadbać o nasze bezpieczeństwo.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Elena_Aufstand_16_02"); //Straż i tak nigdy nam nie pomogła. Interesowała ich tylko nasza spiżarnia.
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
	description	= "Jakiego rodzaju prace prowadzone są na farmie?";
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
	AI_Output (other, self, "DIA_Elena_Arbeit_15_00"); //Jakiego rodzaju prace prowadzone są na farmie?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_01"); //Mój ojciec płaci wszystkim mężczyznom, którzy zgodzą się bronić farmy.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_02"); //Jesteś zainteresowany? Nie wyglądasz na osobę, której marzeniem jest praca na roli.
	AI_Output (other, self, "DIA_Elena_Arbeit_15_03"); //Ile płaci twój ojciec?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_04"); //Musisz to z nim uzgodnić.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_05"); //Wiem tylko, że każdy najemnik codziennie dostaje pieniądze.
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
	description	= "Czy panują tutaj jakieś zasady, o których powinienem pamiętać?";
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
	AI_Output (other, self, "DIA_Elena_Regeln_15_00"); //Czy panują tutaj jakieś zasady, o których powinienem pamiętać?
	AI_Output (self, other, "DIA_Elena_Regeln_16_01"); //Nie dotykaj niczego, co nie należy do ciebie.
	AI_Output (self, other, "DIA_Elena_Regeln_16_02"); //Trzymaj się z daleka od nie swoich spraw.
	AI_Output (self, other, "DIA_Elena_Regeln_16_03"); //Jeśli wdasz się w walkę, trzymaj się najemników.
	AI_Output (self, other, "DIA_Elena_Regeln_16_04"); //Jeśli rozpoczniesz bójkę z miejscowymi chłopami, wszyscy obrócą się przeciwko tobie.
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
	description	= "Czym się zajmujesz?";
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
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_01"); //Sprzedaję towary produkowane na farmie. Gdybyś chciał coś kupić, daj mi znać.
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_02"); //Pozwól jednak, że cię ostrzegę. Nie znoszę złodziei, jasne?
	
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
	description	= "Pokaż mi, co masz na sprzedaż!";
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
	AI_Output			(other, self, "DIA_Elena_TRADE_15_00"); //Pokaż mi swoje towary!
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Elena_TRADE_16_01"); //Co mogę ci zaoferować?
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
	description	= "Czy ostatnio zdarzyło się coś ważnego?";
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
	AI_Output			(other, self, "DIA_Elena_PERM_15_00"); //Czy ostatnio zdarzyło się coś ważnego?

	if (kapitel <= 1)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_01"); //Parę dni temu mój ojciec zadecydował, że nie wolno nam sprzedawać niczego w mieście.
		AI_Output			(self, other, "DIA_Elena_PERM_16_02"); //Więc teraz trzymam się w pobliżu farmy i sprzedaję swoje towary przejezdnym.
	
		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_03"); //Ataki straży na okoliczne farmy stają się coraz częstsze. Interwencja mojego ojca jest tylko kwestią czasu.
	}
	else if (Kapitel == 3)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_04"); //Okoliczne ziemie stały się bardzo niebezpieczne. Nikt nie zapuszcza się poza własne tereny. Upłynęło już bardzo dużo czasu, od kiedy którekolwiek z nas było w mieście.
	}
	else if (kapitel == 4)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_05"); //Najemnicy stają się coraz bardziej niespokojni. Chociaż wydaje mi się, że od czasu jak opuścił nas Sylvio wraz ze swoją drużyną, i tak są w znacznie lepszej kondycji psychicznej.
	}
	else //Kapitel 5
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_06"); //Wszyscy mówią o zbliżającym się ataku orków. Ale ja nie wierzę w te pogłoski. Sądzę, że tutaj, na farmie, jesteśmy bezpieczni.
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

	description  =  "Sprzedajesz udziały w kopalni?";
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
	AI_Output			(other, self, "DIA_Elena_MINENANTEIL_15_00"); //Sprzedajesz udziały w kopalni?
	AI_Output			(self, other, "DIA_Elena_MINENANTEIL_16_01"); //No i co z tego? Sama zapłaciłam za nie majątek.
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





















