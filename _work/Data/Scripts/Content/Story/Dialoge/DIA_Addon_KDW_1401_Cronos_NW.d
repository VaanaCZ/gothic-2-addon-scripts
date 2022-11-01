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

	description	 = 	"Mohl bych tě na chvilku vyrušit?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Můžu tě na chvilku vyrušit?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(překvapeně) To jsi TY? Nikdy jsem nemyslel, že ten tvůj ksicht ještě někdy uvidím.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Máš vážně kuráž, že se tu ukazuješ. Svého času bychom tě zaživa stáhli z kůže.
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

	description	 = 	"Co tady děláš?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Co tady děláš?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(zmateně) Mám zjistit něco víc o strážcích chrámu.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Jsou pěkně tuhý oříšek, to ti povím. Nic podobného, jako jsou tihle kamenní strážci, jsem ještě neviděl.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Jednu chvíli úplně bezduše stojí, a najednou tě napadnou, jako když je něco posedne.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Ještě jsem nezjistil, co je vlastně pohání, ale jedna věc je jistá: jsou magického původu.
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

	description	 = 	"Pověz mi něco o těch kamenných strážcích.";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Pověz mi o těch kamenných strážcích něco víc.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //(nejistě) Zatím ti víc neřeknu. Museli jsme je všechny zničit. Teď už nejsou nebezpeční.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Když jsme sem přišli, napadli nás.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Porazili jsme je jen spojenými silami a obávám se, že za portálem jich čeká ještě víc.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Musí existovat způsob, jak zničit sílu, která je pohání, a udělat z nich zase obyčejné sochy.
	
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
	description	 = 	"Můžeš mi prodat nějaké vybavení?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Můžeš mi prodat nějakou výbavu?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Proč ne? Pokud si dobře vzpomínám, už jsme spolu obchodovali.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Pověz mi, co potřebuješ.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
