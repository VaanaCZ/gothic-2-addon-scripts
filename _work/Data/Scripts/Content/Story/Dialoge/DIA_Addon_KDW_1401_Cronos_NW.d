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

	description	 = 	"Mohl bych tê na chvilku vyrušit?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Mùžu tê na chvilku vyrušit?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(pâekvapenê) To jsi TY? Nikdy jsem nemyslel, že ten tvùj ksicht ještê nêkdy uvidím.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Máš vážnê kuráž, že se tu ukazuješ. Svého èasu bychom tê zaživa stáhli z kùže.
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

	description	 = 	"Co tady dêláš?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Co tady dêláš?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(zmatenê) Mám zjistit nêco víc o strážcích chrámu.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Jsou pêknê tuhý oâíšek, to ti povím. Nic podobného, jako jsou tihle kamenní strážci, jsem ještê nevidêl.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Jednu chvíli úplnê bezduše stojí, a najednou tê napadnou, jako když je nêco posedne.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Ještê jsem nezjistil, co je vlastnê pohání, ale jedna vêc je jistá: jsou magického pùvodu.
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

	description	 = 	"Povêz mi nêco o têch kamenných strážcích.";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Povêz mi o têch kamenných strážcích nêco víc.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //(nejistê) Zatím ti víc neâeknu. Museli jsme je všechny znièit. Teë už nejsou nebezpeèní.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Když jsme sem pâišli, napadli nás.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Porazili jsme je jen spojenými silami a obávám se, že za portálem jich èeká ještê víc.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Musí existovat zpùsob, jak znièit sílu, která je pohání, a udêlat z nich zase obyèejné sochy.
	
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
	description	 = 	"Mùžeš mi prodat nêjaké vybavení?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Mùžeš mi prodat nêjakou výbavu?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Proè ne? Pokud si dobâe vzpomínám, už jsme spolu obchodovali.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Povêz mi, co potâebuješ.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
