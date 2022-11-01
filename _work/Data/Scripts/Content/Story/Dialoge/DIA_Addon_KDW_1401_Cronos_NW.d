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

	description	 = 	"Posso seccarti per un momento?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Posso seccarti per un momento?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(sorpreso) Sei TU. Non avrei mai pensato di rivedere la tua faccia.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Hai un bel coraggio a venire qui. Un tempo ti avrei spellato vivo.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Buon per te che è successo qualche settimana fa e che ho avuto il tempo di calmarmi.
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

	description	 = 	"Cosa stai facendo, qui?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Cosa ci fai qui?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(confuso) Il mio compito è di saperne di più sui guardiani del tempio.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //È una brutta faccenda, lasciatelo dire. Queste sentinelle di pietra hanno caratteristiche che mi sono del tutto sconosciute.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Un attimo prima se ne stanno lì senza vita e un momento dopo ti attaccano come fossero possedute da un demone.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Non sono ancora riuscito a capire che cosa le muova, ma una cosa è sicura: ha origini nella magia.
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

	description	 = 	"Dimmi qualcosa di più su queste sentinelle di pietra.";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Dimmi qualcosa di più su queste sentinelle di pietra.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //(confuso) Non posso dirti molto fino ad ora. Purtroppo abbiamo dovuto distruggerle. Ora non sono più un pericolo.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Quando siamo arrivati ci hanno attaccati.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Siamo riusciti a sconfiggerle solo combinando i nostri poteri e temo che dietro al portale ce ne siano altre ad aspettarci.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Ci dev'essere un modo per annientare la forza che li anima, in modo tale che non siano altro che statue.
	
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
	description	 = 	"Puoi vendermi dell'equipaggiamento?";
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
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Puoi vendermi dell'equipaggiamento?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Perché no? Se ricordo bene, abbiamo già fatto affari insieme.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Dimmi che cosa ti serve.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
