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

	description	 = 	"Mohl bych tì na chvilku vyrušit?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Mùžu tì na chvilku vyrušit?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(pøekvapenì) To jsi TY? Nikdy jsem nemyslel, že ten tvùj ksicht ještì nìkdy uvidím.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Máš vážnì kuráž, že se tu ukazuješ. Svého èasu bychom tì zaživa stáhli z kùže.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Mùžeš být rád, že už je to pár týdnù a všichni jsme se uklidnili.
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

	description	 = 	"Co tady dìláš?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Co tady dìláš?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(zmatenì) Mám zjistit nìco víc o strážcích chrámu.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Jsou pìknì tuhý oøíšek, to ti povím. Nic podobného, jako jsou tihle kamenní strážci, jsem ještì nevidìl.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Jednu chvíli úplnì bezduše stojí, a najednou tì napadnou, jako když je nìco posedne.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Ještì jsem nezjistil, co je vlastnì pohání, ale jedna vìc je jistá: jsou magického pùvodu.
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

	description	 = 	"Povìz mi nìco o tìch kamenných strážcích.";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Povìz mi o tìch kamenných strážcích nìco víc.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //(nejistì) Zatím ti víc neøeknu. Museli jsme je všechny znièit. Teï už nejsou nebezpeèní.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Když jsme sem pøišli, napadli nás.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Porazili jsme je jen spojenými silami a obávám se, že za portálem jich èeká ještì víc.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Musí existovat zpùsob, jak znièit sílu, která je pohání, a udìlat z nich zase obyèejné sochy.
	
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
	description	 = 	"Mùžeš mi prodat nìjaké vybavení?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Mùžeš mi prodat nìjakou výbavu?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Proè ne? Pokud si dobøe vzpomínám, už jsme spolu obchodovali.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Povìz mi, co potøebuješ.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
