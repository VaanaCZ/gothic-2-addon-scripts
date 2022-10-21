// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Maria_EXIT   (C_INFO)
{
	npc         = BAU_910_Maria;
	nr          = 999;
	condition   = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 1;
	condition	= DIA_Maria_Hallo_Condition;
	information	= DIA_Maria_Hallo_Info;
	permanent  	= FALSE;
	description = "Chi sei?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //Chi sei?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Sono Maria, la moglie di Onar.
	AI_Output (self, other, "DIA_Maria_Hallo_17_02"); //Che cosa ci fai qui?
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 2;
	condition	= DIA_Maria_Umsehen_Condition;
	information	= DIA_Maria_Umsehen_Info;
	permanent  	= FALSE;
	description = "Volevo solo dare un'occhiata in giro...";
};

func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Volevo solo dare un'occhiata in giro...
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //Con tutti questi uomini nella fattoria ora, non c'è più pace all'interno della casa.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //Continuano a fare avanti e indietro.
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 3;
	condition	= DIA_Maria_Soeldner_Condition;
	information	= DIA_Maria_Soeldner_Info;
	permanent  	= FALSE;
	description = "I mercenari vi stanno importunando?";
};

func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //I mercenari vi stanno importunando?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Oh beh, dimenticati di ciò che ti ho detto, è molto più sicuro qui da quando voi ragazzi siete arrivati.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //Oh beh, almeno la fattoria è diventata un posto molto più sicuro da quando i mercenari sono arrivati.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Quando eravamo ancora da soli, le guardie venivano dalla città per saccheggiare le nostre provviste.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Esse prendevano la parte migliore del raccolto e anche alcune pecore, e in cambio non hanno fatto nulla per noi.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //Un paio di quei mascalzoni ci hanno anche derubati.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //Non fraintendermi, soldato. So benissimo che non siete tutti uguali.
		};	
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 4;
	condition	= DIA_Maria_Mission_Condition;
	information	= DIA_Maria_Mission_Info;
	permanent  	= FALSE;
	description = "Cosa ti hanno portato via?";
};

func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //Cosa ti hanno portato via?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //Soprattutto oro e argento. Hanno preso addirittura il mio regalo di nozze. Un vassoio d'oro.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //Scommetto che ora si trova a prendere polvere nel forziere di qualche sporca guardia cittadina.
	};
	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 5;
	condition	= DIA_Maria_BringPlate_Condition;
	information	= DIA_Maria_BringPlate_Info;
	permanent  	= FALSE;
	description = "Ho un piatto d’oro qui, Per caso è tuo?";
};

func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1);
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //Ho un piatto d’oro qui, per caso è tuo?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //Sì! È questo! Ti sono infinitamente grata!
	
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP (XP_Maria_Teller);
};


// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------

instance DIA_Maria_Belohnung	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 6;
	condition	= DIA_Maria_Belohnung_Condition;
	information	= DIA_Maria_Belohnung_Info;
	permanent  	= TRUE;
	description = "E la mia ricompensa?";
};

func int DIA_Maria_Belohnung_Condition ()
{
	if (MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //E la mia ricompensa?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //Tu lavori come mercenario per mio marito, non è vero?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Sì.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //Quanto ti paga mio marito?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //Non è abbastanza. Vai da lui e digli di darti di più.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //E tu pensi che lo farà?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //Sa cosa gli succede se non lo farà. Fidati di me.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //Vuoi essere assunto come mercenario qui alla fattoria?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "No, davvero.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Sì.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Tieni, prendi questo. Te lo sei meritato.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //No, davvero.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Allora prendi quest'oro come ricompensa. Te lo sei guadagnato.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Sì.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //D’accordo, se lavori qui allora farò in modo che tu riceva una paga adeguata.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Torna da me quando avrai discusso la tua paga con mio marito.
	Info_ClearChoices (DIA_Maria_Belohnung);
};
		
// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 7;
	condition	= DIA_Maria_AboutOnar_Condition;
	information	= DIA_Maria_AboutOnar_Info;
	permanent  	= FALSE;
	description = "Dimmi di Onar.";
};

func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, "DIA_Maria_AboutOnar_15_00"); //Dimmi di Onar.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //È una brava persona. Un po' rude e molto impaziente, ma nessuno è perfetto.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //Ho detto a mio marito: 'perché lasci che i soldati cittadini ti trattino in questo modo'?
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //Gli ho detto: 'fai qualcosa'.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Così ha assunto dei mercenari. Ora mi sento come se mi trovassi nel mezzo di una guerra.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //D'altra parte, noi SIAMO in guerra, non è così?
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 8;
	condition	= DIA_Maria_PERM_Condition;
	information	= DIA_Maria_PERM_Info;
	permanent  	= FALSE;
	description = "È accaduto qualcosa di rilevante qui, ultimamente?";
};

func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //È accaduto qualcosa di rilevante qui, ultimamente?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //I paladini sono passati di qui.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //All'inizio credevamo che stessero per attaccare la fattoria, invece erano diretti alla Valle delle Miniere.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Wasili ha inseguito un ladro un paio di notti fa. A parte questo, è stato tutto tranquillo.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //La situazione qui è molto più tranquilla da quando alcuni dei mercenari se ne sono andati.
	};
};
			

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maria_PICKPOCKET (C_INFO)
{
	npc			= BAU_910_Maria;
	nr			= 900;
	condition	= DIA_Maria_PICKPOCKET_Condition;
	information	= DIA_Maria_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen (60, 110);
};
 
FUNC VOID DIA_Maria_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maria_PICKPOCKET);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_BACK 		,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};
	
func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


			
			
			
			



	















