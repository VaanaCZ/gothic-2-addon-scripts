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

	description	 = 	"Mohl bych tę na chvilku vyrušit?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Můžu tę na chvilku vyrušit?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(pâekvapenę) To jsi TY? Nikdy jsem nemyslel, že ten tvůj ksicht ještę nękdy uvidím.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Máš vážnę kuráž, že se tu ukazuješ. Svého času bychom tę zaživa stáhli z kůže.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Můžeš být rád, že už je to pár týdnů a všichni jsme se uklidnili.
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

	description	 = 	"Co tady dęláš?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Co tady dęláš?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(zmatenę) Mám zjistit nęco víc o strážcích chrámu.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Jsou pęknę tuhý oâíšek, to ti povím. Nic podobného, jako jsou tihle kamenní strážci, jsem ještę nevidęl.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Jednu chvíli úplnę bezduše stojí, a najednou tę napadnou, jako když je nęco posedne.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Ještę jsem nezjistil, co je vlastnę pohání, ale jedna vęc je jistá: jsou magického původu.
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

	description	 = 	"Povęz mi nęco o tęch kamenných strážcích.";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Povęz mi o tęch kamenných strážcích nęco víc.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //(nejistę) Zatím ti víc neâeknu. Museli jsme je všechny zničit. Teë už nejsou nebezpeční.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Když jsme sem pâišli, napadli nás.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Porazili jsme je jen spojenými silami a obávám se, že za portálem jich čeká ještę víc.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Musí existovat způsob, jak zničit sílu, která je pohání, a udęlat z nich zase obyčejné sochy.
	
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
	description	 = 	"Můžeš mi prodat nęjaké vybavení?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Můžeš mi prodat nęjakou výbavu?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Proč ne? Pokud si dobâe vzpomínám, už jsme spolu obchodovali.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Povęz mi, co potâebuješ.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
