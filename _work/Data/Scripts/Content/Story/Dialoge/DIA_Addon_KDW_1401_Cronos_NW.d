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

	description	 = 	"Mogê ci przeszkodziæ?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Mogê ci przeszkodziæ?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //To TY? Nie myœla³em, ¿e jeszcze ciê kiedyœ zobaczê.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Masz du¿o odwagi, pokazuj¹c siê tu. Swego czasu chcieliœmy obedrzeæ ciê ze skóry.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Masz szczêœcie, ¿e minê³o ju¿ parê tygodni i wszyscy siê trochê uspokoili.
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
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //Moim zadaniem jest dowiedzieæ siê wiêcej na temat stra¿ników œwi¹tyni.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Maj¹ kamienne cia³a! Ci stra¿nicy naprawdê posiadaj¹ zdumiewaj¹ce zdolnoœci.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //W jednej chwili stoj¹ w ca³kowitym bezruchu, by nagle rzuciæ siê na ciebie niczym opêtani.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Nie uda³o mi siê jeszcze ustaliæ, jaka energia ich napêdza, ale jedno jest pewne - jest magicznego pochodzenia.
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

	description	 = 	"Opowiedz mi wiêcej o tych kamiennych stra¿nikach.";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Opowiedz mi wiêcej o tych kamiennych stra¿nikach.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //Wiele wiêcej ci nie powiem. Musieliœmy ich zniszczyæ. Teraz s¹ niegroŸni.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Zaatakowali nas, kiedy tu przybyliœmy.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Pokonaliœmy ich dopiero zjednoczonymi si³ami. Obawiam siê, ¿e po drugiej stronie portalu czeka wiêcej takich stra¿ników.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Musi byæ jakiœ sposób na wy³¹czenie napêdzaj¹cej ich energii. Coœ, co sprawi, ¿e stan¹ siê zwyk³ymi kamiennymi pos¹gami.
	
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
	description	 = 	"Mo¿esz mi sprzedaæ trochê sprzêtu?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Mo¿esz mi sprzedaæ trochê sprzêtu?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Czemu nie? Jeœli dobrze pamiêtam, ostatnim razem tak¿e handlowaliœmy.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Powiedz mi, czego potrzebujesz.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
