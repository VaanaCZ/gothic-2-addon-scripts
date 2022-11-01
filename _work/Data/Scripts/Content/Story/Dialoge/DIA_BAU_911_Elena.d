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
	description	= "Ciao, bellezza.";
};

func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Elena_HALLO_15_00"); //Ciao, bellezza.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_01"); //Mmmh. Da dove spunti fuori?
	}
	else
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_02"); //Cosa vuoi?
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
	description	= "Dicono che siete in rivolta contro il re.";
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
	AI_Output (other, self, "DIA_Elena_Aufstand_15_00"); //Dicono che siate in rivolta contro il re.
	AI_Output (self, other, "DIA_Elena_Aufstand_16_01"); //Mio padre ha deciso che è giunta l'ora di difenderci da soli.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Elena_Aufstand_16_02"); //La guardia cittadina non ci ha mai aiutati. L'unico motivo per cui venivano qui era per rubare le nostre provviste.
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
	description	= "Che tipo di lavoro bisogna fare qui alla fattoria?";
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
	AI_Output (other, self, "DIA_Elena_Arbeit_15_00"); //Che tipo di lavoro bisogna fare qui alla fattoria?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_01"); //Mio padre paga tutti gli uomini che aiutano a difendere la fattoria.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_02"); //Ti interessa? Non mi sembri uno con la passione per il lavoro nei campi.
	AI_Output (other, self, "DIA_Elena_Arbeit_15_03"); //Quanto è disposto a pagare tuo padre?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_04"); //Di questo dovrai discuterne con lui.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_05"); //Tutto ciò che so è che ogni mercenario qui viene pagato quotidianamente.
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
	description	= "Ci sono delle regole alle quali devo attenermi?";
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
	AI_Output (other, self, "DIA_Elena_Regeln_15_00"); //Ci sono delle regole alle quali devo attenermi?
	AI_Output (self, other, "DIA_Elena_Regeln_16_01"); //Non toccare niente che non sia tuo.
	AI_Output (self, other, "DIA_Elena_Regeln_16_02"); //Stai lontano dai luoghi che non ti riguardano.
	AI_Output (self, other, "DIA_Elena_Regeln_16_03"); //E se devi combattere contro qualcuno, fallo con i mercenari.
	AI_Output (self, other, "DIA_Elena_Regeln_16_04"); //Se inizi una rissa con i contadini, tutti quanti qui si metteranno contro di te.
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
	description	= "Qual è il tuo compito?";
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
	AI_Output (other, self, "DIA_Elena_AUFGABE_15_00"); //Qual è il tuo compito?
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_01"); //Vendo le merci che produciamo. Se vuoi acquistare qualcosa, fammelo sapere.
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_02"); //Ma lascia che ti avverta. Non sopporto chi cerca di mercanteggiare o di rubare, ci siamo capiti?
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Elena vende merce varia alla fattoria di Onar.");
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
	description	= "Mostrami la mercanzia.";
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
	AI_Output			(other, self, "DIA_Elena_TRADE_15_00"); //Mostrami la mercanzia.
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Elena_TRADE_16_01"); //Cosa posso offrirti?
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
	description	= "È accaduto qualcosa di rilevante, ultimamente?";
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
	AI_Output			(other, self, "DIA_Elena_PERM_15_00"); //È accaduto qualcosa di rilevante, ultimamente?

	if (kapitel <= 1)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_01"); //Un paio di giorni fa, mio padre ha stabilito che non possiamo più vendere niente in città.
		AI_Output			(self, other, "DIA_Elena_PERM_16_02"); //Dunque ora me ne sto qui alla fattoria a vendere le mie merci solo ai visitatori.
	
		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_03"); //Gli attacchi della guardia cittadina alle fattorie vicine si stanno facendo sempre più frequenti. È solo una questione di tempo prima che mio padre debba intervenire.
	}
	else if (Kapitel == 3)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_04"); //La regione è diventata piuttosto pericolosa. Ora nessuno si avventura più oltre i propri campi. È passato molto tempo da quando uno di noi si è recato in città l'ultima volta.
	}
	else if (kapitel == 4)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_05"); //I mercenari sono diventati sempre più irrequieti, ma da quando Silvio e i suoi uomini se ne sono andati, sembra essere tornata un po' più di pace.
	}
	else //Kapitel 5
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_06"); //Tutti continuano a parlare dell'imminente attacco degli orchi, ma io non ci credo realmente. Sono certa che siamo tutti al sicuro qui alla fattoria.
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

	description  =  "Vendi azioni della miniera?";
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
	AI_Output			(other, self, "DIA_Elena_MINENANTEIL_15_00"); //Vendi azioni della miniera?
	AI_Output			(self, other, "DIA_Elena_MINENANTEIL_16_01"); //E allora? Anch'io darei un braccio e una gamba per averle.
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





















