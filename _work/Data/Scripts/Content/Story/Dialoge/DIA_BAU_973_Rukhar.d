///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rukhar_EXIT   (C_INFO)
{
	npc         = BAU_973_Rukhar;
	nr          = 999;
	condition   = DIA_Rukhar_EXIT_Condition;
	information = DIA_Rukhar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rukhar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rukhar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HALLO		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	4;
	condition	 = 	DIA_Rukhar_HALLO_Condition;
	information	 = 	DIA_Rukhar_HALLO_Info;

	description	 = 	"Avete birra decente, qui?";
};

func int DIA_Rukhar_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rukhar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HALLO_15_00"); //Avete birra decente, qui?
	AI_Output			(self, other, "DIA_Rukhar_HALLO_12_01"); //Non è proprio la migliore, ma di questi tempi non si può essere troppo schizzinosi.

};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	5;
	condition	 = 	DIA_Rukhar_WASMACHSTDU_Condition;
	information	 = 	DIA_Rukhar_WASMACHSTDU_Info;

	description	 = 	"Cosa stai facendo, qui?";
};

func int DIA_Rukhar_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_WASMACHSTDU_15_00"); //Cosa stai facendo, qui?
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_01"); //Fino a qualche settimana fa lavoravo nei campi del proprietario terriero.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_02"); //Un giorno ne ho avuto abbastanza, ho preso e me ne sono andato.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_03"); //Ora sono il padrone di me stesso. Tutto ciò che possiedo si trova in questo forziere, ed è anche tutto ciò che mi serve.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_04"); //Ti interessa una piccola gara?
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"Si può scommettere nella taverna."); 

};


///////////////////////////////////////////////////////////////////////
//	Info Wettkampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WETTKAMPF		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_WETTKAMPF_Condition;
	information	 = 	DIA_Rukhar_WETTKAMPF_Info;

	description	 = 	"Di che tipo di competizione si tratta? ";
};

func int DIA_Rukhar_WETTKAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_WETTKAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_WETTKAMPF_15_00"); //Che tipo di gara sarebbe?
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_01"); //È una gara di bevute.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_02"); //Le regole sono molto semplici.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_03"); //A turno ordiniamo un boccale della miglior birra che il vecchio oste ha da offrire.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_04"); //Ogni boccale deve essere bevuto fino all'ultimo sorso, in modo che non versi nemmeno una goccia se lo giri sul tavolo.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_05"); //L'ultimo a rimanere in piedi vince. Chi perde paga il conto più i soldi della scommessa. Beh? Che ne dici?
	AI_Output			(other, self, "DIA_Rukhar_WETTKAMPF_15_06"); //Magari un'altra volta, quando non andrò così di fretta.

};

///////////////////////////////////////////////////////////////////////
//	Info HoleRandolph
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HOLERANDOLPH		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_HOLERANDOLPH_Condition;
	information	 = 	DIA_Rukhar_HOLERANDOLPH_Info;

	description	 = 	"Posso scommettere su qualcun altro, comunque?";
};

func int DIA_Rukhar_HOLERANDOLPH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WETTKAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_HOLERANDOLPH_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HOLERANDOLPH_15_00"); //Posso scommettere anche su qualcun altro?
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_01"); //Certamente. Se riesci a trovare qualcuno con abbastanza fegato da sfidarmi, allora scommetterò con te.
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_02"); //Tutti quanti versano la stessa quota in un contenitore. Il vincitore si porta a casa tutto. La puntata dipende da quanti soldi hai.
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_03"); //Portami qualcuno che voglia sfidarmi e scommetterò con te.
	B_LogEntry (TOPIC_Wettsaufen,"Rukhar chiama questo gioco CIN CIN. No grazie, non sono interessato. Troverò qualcun altro per farlo divertire."); 

};

///////////////////////////////////////////////////////////////////////
//	Info RandolphWill
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_RANDOLPHWILL		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_RANDOLPHWILL_Condition;
	information	 = 	DIA_Rukhar_RANDOLPHWILL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Conosco qualcuno che vuole competere contro di te.";
};

var int DIA_Rukhar_RANDOLPHWILL_noPerm;

func int DIA_Rukhar_RANDOLPHWILL_Condition ()
{
	if  (
		(Npc_KnowsInfo(other, DIA_Randolph_GEGENWEN))
		&& (Npc_KnowsInfo(other, DIA_Rukhar_HOLERANDOLPH))
		&& (DIA_Rukhar_RANDOLPHWILL_noPerm == FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Rukhar_RANDOLPHWILL_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_15_00"); //Conosco qualcuno che vuole competere contro di te.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_01"); //E chi sarebbe?
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_15_02"); //Randolph.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_03"); //Oh-oh. Randolph il millantatore? D'accordo, perché no?
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_04"); //Manda quella mezza calzetta da me e l'accordo è fatto.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_05"); //Puoi sceglierlo di nuovo dopo due giorni. Chissà, forse sarai fortunato ed egli riuscirà a reggersi in piedi per allora.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_06"); //Quanto scommetti?

	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "Niente", DIA_Rukhar_RANDOLPHWILL_nix );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "100", DIA_Rukhar_RANDOLPHWILL_100 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "10 monete d’oro", DIA_Rukhar_RANDOLPHWILL_10 );
};
func void DIA_Rukhar_RANDOLPHWILL_annehmen ()
{
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_annehmen_12_00"); //Prenderò la tua scommessa e la terrò fino al termine della gara, va bene?
	DIA_Rukhar_RANDOLPHWILL_noPerm = TRUE;
};

func void DIA_Rukhar_RANDOLPHWILL_mehr ()
{
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "Niente", DIA_Rukhar_RANDOLPHWILL_nix );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "100", DIA_Rukhar_RANDOLPHWILL_100 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "10 monete d’oro", DIA_Rukhar_RANDOLPHWILL_10 );
};


func void DIA_Rukhar_RANDOLPHWILL_nix ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_nix_15_00"); //Niente
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_nix_12_01"); //Allora possiamo lasciar perdere ogni cosa.

	AI_StopProcessInfos (self);
};

func void DIA_Rukhar_RANDOLPHWILL_10 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_10_15_00"); //10 monete d’oro.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_10_12_01"); //Coraggio, non dirai sul serio. Un paio di monete in più non ti uccideranno di certo.

	Rukhar_Einsatz = 10;
	Rukhar_Gewinn = 20;

	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(seleziona un’altra puntata)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(accetta la puntata)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_20 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_20_15_00"); //20
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_20_12_01"); //Se vuoi scommettere, ti prego di farlo subito.

	Rukhar_Einsatz = 20;
	Rukhar_Gewinn = 40;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(seleziona un’altra puntata)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(accetta la puntata)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_50 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_50_15_00"); //50
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_50_12_01"); //Non essere così timido. Prova a rischiare.

	Rukhar_Einsatz = 50;
	Rukhar_Gewinn = 100;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(seleziona un’altra puntata)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(accetta la puntata)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_100 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_100_15_00"); //100
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_100_12_01"); //Questo sì che è parlare.
	
	Rukhar_Einsatz = 100;
	Rukhar_Gewinn = 200;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(seleziona un’altra puntata)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(accetta la puntata)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

///////////////////////////////////////////////////////////////////////
//	Info IchSeheDich
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_ICHSEHEDICH		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_ICHSEHEDICH_Condition;
	information	 = 	DIA_Rukhar_ICHSEHEDICH_Info;
	permanent	 = 	TRUE;
	
	description	=	"Ecco la mia puntata.";
};

var int DIA_Rukhar_ICHSEHEDICH_noPerm;

func int DIA_Rukhar_ICHSEHEDICH_Condition ()
{
	if 	(
		(DIA_Rukhar_ICHSEHEDICH_noPerm == FALSE)
		&& (DIA_Rukhar_RANDOLPHWILL_noPerm == TRUE)
		&& (Rukhar_Einsatz != 0)
		)
			{
					return TRUE;
			};
};

func void DIA_Rukhar_ICHSEHEDICH_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_ICHSEHEDICH_15_00"); //Ecco la mia puntata.

	if (B_GiveInvItems (other, self, ItMi_Gold, Rukhar_Einsatz))
		{
			AI_Output			(self, other, "DIA_Rukhar_ICHSEHEDICH_12_01"); //D'accordo. Non metterci troppo a portare qui Randolph, intesi?
			DIA_Rukhar_ICHSEHEDICH_noPerm = TRUE;
			MIS_Rukhar_Wettkampf = LOG_RUNNING; 
			B_GivePlayerXP (XP_Ambient);
		}
	else
		{
			AI_Output			(self, other, "DIA_Rukhar_ICHSEHEDICH_12_02"); //Davvero divertente. Torna quando avrai abbastanza soldi.
		};
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info geldzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_GELDZURUECK		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_GELDZURUECK_Condition;
	information	 = 	DIA_Rukhar_GELDZURUECK_Info;
	permanent	 = 	TRUE;
	
	description	 = 	"Rivoglio indietro i miei soldi.";
};

func int DIA_Rukhar_GELDZURUECK_Condition ()
{
	if 	(
		(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
		&& (Rukhar_Won_Wettkampf == TRUE)
		)
	{
				return TRUE;
	};
};

func void DIA_Rukhar_GELDZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_GELDZURUECK_15_00"); //Rivoglio indietro i miei soldi.
	AI_Output			(self, other, "DIA_Rukhar_GELDZURUECK_12_01"); //I debiti di gioco sono debiti d'onore, amico. Avresti dovuto pensarci prima.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Haenseln
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HAENSELN		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_HAENSELN_Condition;
	information	 = 	DIA_Rukhar_HAENSELN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Sembra che tu abbia fatto il passo più lungo della gamba.";
};

func int DIA_Rukhar_HAENSELN_Condition ()
{
	if 	(
		(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
		&& (Rukhar_Won_Wettkampf == FALSE)
		)
	{
				return TRUE;
	};
};

var int DIA_Rukhar_HAENSELN_nureimalgeld;

func void DIA_Rukhar_HAENSELN_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HAENSELN_15_00"); //Sembra che tu abbia fatto il passo più lungo della gamba.

	if	(DIA_Rukhar_HAENSELN_nureimalgeld == FALSE)
		{
			AI_Output			(self, other, "DIA_Rukhar_HAENSELN_12_01"); //Eccoti i tuoi soldi, e non una parola di più.
			B_GivePlayerXP (XP_Rukhar_Lost);

			IntToFloat (Rukhar_Gewinn);
					
			CreateInvItems (self, ItMi_Gold, Rukhar_Gewinn);									
			B_GiveInvItems (self, other, ItMi_Gold, Rukhar_Gewinn);					

			DIA_Rukhar_HAENSELN_nureimalgeld = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Rukhar_HAENSELN_12_02"); //Te la farò pagare, puoi contarci.
		};

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_Perm		(C_INFO)
{
	npc			 = 	BAU_973_Rukhar;
	nr		 = 	7;
	condition	 = 	DIA_Rukhar_Perm_Condition;
	information	 = 	DIA_Rukhar_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"È successo qualcos’altro di interessante?";
};

func int DIA_Rukhar_Perm_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
		{
				return TRUE;
		};
};
func void DIA_Rukhar_Perm_Info ()
{
	AI_Output (other, self, "DIA_Rukhar_Perm_15_00"); //È successo qualcos’altro di interessante?
	AI_Output (self, other, "DIA_Rukhar_Perm_12_01"); //Non che io sappia. Nessuno mi dice niente.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rukhar_PICKPOCKET (C_INFO)
{
	npc			= BAU_973_Rukhar;
	nr			= 900;
	condition	= DIA_Rukhar_PICKPOCKET_Condition;
	information	= DIA_Rukhar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Rukhar_PICKPOCKET_Condition()
{
	C_Beklauen (26, 30);
};
 
FUNC VOID DIA_Rukhar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rukhar_PICKPOCKET);
	Info_AddChoice		(DIA_Rukhar_PICKPOCKET, DIALOG_BACK 		,DIA_Rukhar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rukhar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rukhar_PICKPOCKET_DoIt);
};

func void DIA_Rukhar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rukhar_PICKPOCKET);
};
	
func void DIA_Rukhar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rukhar_PICKPOCKET);
};




 


























