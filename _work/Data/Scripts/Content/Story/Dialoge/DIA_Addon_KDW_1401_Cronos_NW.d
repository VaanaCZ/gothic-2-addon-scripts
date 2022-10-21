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

	description	 = 	"Mog� ci przeszkodzi�?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Mog� ci przeszkodzi�?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //To TY? Nie my�la�em, �e jeszcze ci� kiedy� zobacz�.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Masz du�o odwagi, pokazuj�c si� tu. Swego czasu chcieli�my obedrze� ci� ze sk�ry.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Masz szcz�cie, �e min�o ju� par� tygodni i wszyscy si� troch� uspokoili.
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
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //Moim zadaniem jest dowiedzie� si� wi�cej na temat stra�nik�w �wi�tyni.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Maj� kamienne cia�a! Ci stra�nicy naprawd� posiadaj� zdumiewaj�ce zdolno�ci.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //W jednej chwili stoj� w ca�kowitym bezruchu, by nagle rzuci� si� na ciebie niczym op�tani.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Nie uda�o mi si� jeszcze ustali�, jaka energia ich nap�dza, ale jedno jest pewne - jest magicznego pochodzenia.
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

	description	 = 	"Opowiedz mi wi�cej o tych kamiennych stra�nikach.";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Opowiedz mi wi�cej o tych kamiennych stra�nikach.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //Wiele wi�cej ci nie powiem. Musieli�my ich zniszczy�. Teraz s� niegro�ni.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Zaatakowali nas, kiedy tu przybyli�my.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Pokonali�my ich dopiero zjednoczonymi si�ami. Obawiam si�, �e po drugiej stronie portalu czeka wi�cej takich stra�nik�w.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Musi by� jaki� spos�b na wy��czenie nap�dzaj�cej ich energii. Co�, co sprawi, �e stan� si� zwyk�ymi kamiennymi pos�gami.
	
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
	description	 = 	"Mo�esz mi sprzeda� troch� sprz�tu?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Mo�esz mi sprzeda� troch� sprz�tu?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Czemu nie? Je�li dobrze pami�tam, ostatnim razem tak�e handlowali�my.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Powiedz mi, czego potrzebujesz.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
