///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Babera_EXIT   (C_INFO)
{
	npc         = BAU_934_Babera;
	nr          = 999;
	condition   = DIA_Babera_EXIT_Condition;
	information = DIA_Babera_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Babera_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Babera_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_HALLO		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	1;
	condition	 = 	DIA_Babera_HALLO_Condition;
	information	 = 	DIA_Babera_HALLO_Info;

	description	 = 	"Salve, bella fanciulla.";
};

func int DIA_Babera_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Babera_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Babera_HALLO_15_00"); //Salve, bella fanciulla.
	AI_Output			(self, other, "DIA_Babera_HALLO_16_01"); //Smettila di tentare di lusingarmi ragazzo, e dimmi cosa vuoi. Ho da fare.
};

///////////////////////////////////////////////////////////////////////
//	Info Wiesiehtsaus
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_WIESIEHTSAUS		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	2;
	condition	 = 	DIA_Babera_WIESIEHTSAUS_Condition;
	information	 = 	DIA_Babera_WIESIEHTSAUS_Info;

	description	 = 	"Come procede il lavoro nei campi?";
};

func int DIA_Babera_WIESIEHTSAUS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Babera_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Babera_WIESIEHTSAUS_Info ()
{
	AI_Output			(other, self, "DIA_Babera_WIESIEHTSAUS_15_00"); //Come procede il lavoro nei campi?
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_16_01"); //Guarda questi immensi campi che abbiamo da lavorare e avrai una risposta alla tua domanda.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_16_02"); //Stai cercando un lavoro alla fattoria?

	Info_ClearChoices	(DIA_Babera_WIESIEHTSAUS);

	if (hero.guild == GIL_NONE)
		{
			Info_AddChoice	(DIA_Babera_WIESIEHTSAUS, "No. In verità, voglio diventare un mercenario.", DIA_Babera_WIESIEHTSAUS_Nein );
			Info_AddChoice	(DIA_Babera_WIESIEHTSAUS, "Forse.", DIA_Babera_WIESIEHTSAUS_Vielleicht );
		};
};
func void DIA_Babera_WIESIEHTSAUS_Vielleicht ()
{
	AI_Output			(other, self, "DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00"); //Forse.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01"); //In questo caso dovresti andare a parlare con il nostro padrone Sekob, il vecchio negriero. Forse ha qualcosa da farti fare.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02"); //Ovviamente potresti rivolgerti anche alla fattoria di Onar alla fine della lunga strada.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03"); //Ma fai attenzione ai mercenari. A loro non piacciono gli stranieri.

	Info_ClearChoices	(DIA_Babera_WIESIEHTSAUS);
};

func void DIA_Babera_WIESIEHTSAUS_Nein ()
{
	AI_Output			(other, self, "DIA_Babera_WIESIEHTSAUS_Nein_15_00"); //No. In verità, voglio diventare un mercenario.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Nein_16_01"); //Allora sei capitato nel posto sbagliato. Di solito i mercenari si trovano nella fattoria del padrone.

	Info_ClearChoices	(DIA_Babera_WIESIEHTSAUS);
};

///////////////////////////////////////////////////////////////////////
//	Info bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_BRONKO		(C_INFO)
{
	npc		 	 = 	BAU_934_Babera;
	nr		 	 = 	3;
	condition	 = 	DIA_Babera_BRONKO_Condition;
	information	 = 	DIA_Babera_BRONKO_Info;

	description	 = 	"(chiedi di Bronco)";
};

func int DIA_Babera_BRONKO_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bronko_Hallo))
		&& (Npc_KnowsInfo(other, DIA_Babera_WIESIEHTSAUS)) 
		)
		{
				return TRUE;
		};
};

func void DIA_Babera_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Babera_BRONKO_15_00"); //Di' un po', chi è quel losco figuro laggiù...
	AI_Output			(self, other, "DIA_Babera_BRONKO_16_01"); //Quello è Bronco. Che vuoi sapere?
	AI_Output			(other, self, "DIA_Babera_BRONKO_15_02"); //È lui il tuo padrone?
	AI_Output			(self, other, "DIA_Babera_BRONKO_16_03"); //(ride) Te lo ha detto lui? Sekob è il nostro padrone. Bronco non è altro che un perdigiorno e un poco di buono. Ma ha la forza di un toro.
	AI_Output			(self, other, "DIA_Babera_BRONKO_16_04"); //Ecco perché nessuno gli dice niente quando non lavora.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Babera_BRONKO_16_05"); //Egli non teme nessuno tranne voi mercenari.

		}
	else
		{
			AI_Output			(self, other, "DIA_Babera_BRONKO_16_06"); //Le uniche persone che possono convincerlo a tornare al lavoro sono i mercenari. Ha paura di loro.

		};
	Babera_BronkoKeinBauer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Rosi
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_Rosi		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	3;
	condition	 = 	DIA_Babera_Rosi_Condition;
	information	 = 	DIA_Babera_Rosi_Info;

	description	 = 	"Dov’è Rosi?";
};

func int DIA_Babera_Rosi_Condition ()
{
		if (MIS_bringRosiBackToSekob == LOG_RUNNING)
		&& (Kapitel >= 5)
		&& (RosiFoundKap5 == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Babera_Rosi_Info ()
{
	AI_Output			(other, self, "DIA_Babera_Rosi_15_00"); //Dov’è Rosi?
	AI_Output			(self, other, "DIA_Babera_Rosi_16_01"); //Non riusciva a stare più qui e se n'è andata a nord, nel bosco.
	B_LogEntry (TOPIC_RosisFlucht,"Rosi è scappata dalla fattoria di Sekob. Babera dice che si è diretta a nord, nei boschi."); 
	B_LogEntry (TOPIC_bringRosiBackToSekob,"Rosi è scappata dalla fattoria di Sekob. Babera dice che si è diretta a nord, nei boschi."); 
};


///////////////////////////////////////////////////////////////////////
//	Info dustoerst
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_DUSTOERST		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	10;
	condition	 = 	DIA_Babera_DUSTOERST_Condition;
	information	 = 	DIA_Babera_DUSTOERST_Info;
	permanent	 = 	TRUE;

	description	 = 	"E a parte questo?";
};

func int DIA_Babera_DUSTOERST_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Babera_BRONKO))
		{
				return TRUE;
		};
};

func void DIA_Babera_DUSTOERST_Info ()
{
	AI_Output			(other, self, "DIA_Babera_DUSTOERST_15_00"); //E a parte questo?
	AI_Output			(self, other, "DIA_Babera_DUSTOERST_16_01"); //Ho da fare.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Babera_PICKPOCKET (C_INFO)
{
	npc			= BAU_934_Babera;
	nr			= 900;
	condition	= DIA_Babera_PICKPOCKET_Condition;
	information	= DIA_Babera_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Babera_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Babera_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Babera_PICKPOCKET);
	Info_AddChoice		(DIA_Babera_PICKPOCKET, DIALOG_BACK 		,DIA_Babera_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Babera_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Babera_PICKPOCKET_DoIt);
};

func void DIA_Babera_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Babera_PICKPOCKET);
};
	
func void DIA_Babera_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Babera_PICKPOCKET);
};


