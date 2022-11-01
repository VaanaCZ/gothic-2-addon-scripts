///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cronos_EXIT   (C_INFO)
{
	npc         = KDW_1401_Addon_Cronos_NW;
	nr          = 999;
	condition   = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Hallo		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Hallo_Condition;
	information	 = 	DIA_Addon_Cronos_Hallo_Info;

	description	 = 	"Mogę ci przeszkodzić?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Mogę ci przeszkodzić?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //To TY? Nie myślałem, że jeszcze cię kiedyś zobaczę.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Masz dużo odwagi, pokazując się tu. Swego czasu chcieliśmy obedrzeć cię ze skóry.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Masz szczęście, że minęło już parę tygodni i wszyscy się trochę uspokoili.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WasMachstdu		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_WasMachstdu_Condition;
	information	 = 	DIA_Addon_Cronos_WasMachstdu_Info;

	description	 = 	"Co robisz?";
};

func int DIA_Addon_Cronos_WasMachstdu_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_WasMachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Co robisz?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //Moim zadaniem jest dowiedzieć się więcej na temat strażników świątyni.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Mają kamienne ciała! Ci strażnicy naprawdę posiadają zdumiewające zdolności.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //W jednej chwili stoją w całkowitym bezruchu, by nagle rzucić się na ciebie niczym opętani.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Nie udało mi się jeszcze ustalić, jaka energia ich napędza, ale jedno jest pewne - jest magicznego pochodzenia.
};
///////////////////////////////////////////////////////////////////////
//	Info Waechter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Waechter		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Waechter_Condition;
	information	 = 	DIA_Addon_Cronos_Waechter_Info;

	description	 = 	"Opowiedz mi więcej o tych kamiennych strażnikach.";
};

func int DIA_Addon_Cronos_Waechter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_Waechter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Opowiedz mi więcej o tych kamiennych strażnikach.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //Wiele więcej ci nie powiem. Musieliśmy ich zniszczyć. Teraz są niegroźni.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Zaatakowali nas, kiedy tu przybyliśmy.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Pokonaliśmy ich dopiero zjednoczonymi siłami. Obawiam się, że po drugiej stronie portalu czeka więcej takich strażników.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Musi być jakiś sposób na wyłączenie napędzającej ich energii. Coś, co sprawi, że staną się zwykłymi kamiennymi posągami.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_NW_Trade		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_NW_Trade_Condition;
	information	 = 	DIA_Addon_Cronos_NW_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Możesz mi sprzedać trochę sprzętu?";
};

func int DIA_Addon_Cronos_NW_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Możesz mi sprzedać trochę sprzętu?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Czemu nie? Jeśli dobrze pamiętam, ostatnim razem także handlowaliśmy.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Powiedz mi, czego potrzebujesz.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
