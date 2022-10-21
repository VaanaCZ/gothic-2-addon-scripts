///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"Sei un pescatore?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //Sei un pescatore?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //(cinico) Ma come avrai fatto a indovinare?!
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Perché non mi lasci in pace?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Niente di personale, ma ultimamente non sono in buoni rapporti con la milizia.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Niente di personale, ma non sono particolarmente di buonumore. Colpa della milizia.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"Hai problemi con la milizia?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //Hai problemi con la milizia?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Quei bastardi vengono qui e si prendono quello che vogliono.
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //La settimana scorsa mi hanno preso tutto. 'È per una buona causa,' mi hanno detto.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //So che tutti devono arrangiarsi da quando i contadini hanno smesso di vendere le loro merci.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //E naturalmente a volte la gente ha fame. Non mi meraviglia che mi rubino il pesce da sotto il naso.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //Ma se continuano così, non avrò di che sfamarmi.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Dammi tutto il tuo pesce.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Forse posso aiutarti.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Ne hai parlato con i paladini?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //Ne hai parlato con i paladini?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //(ride) Stai scherzando? Cosa vuoi che gliene importi se un povero diavolo come me ha problemi con la milizia?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Dammi tutto il tuo pesce.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //(arrabbiato) Lo SAPEVO. Un altro di quei mascalzoni.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //Sei arrivato troppo tardi. I tuoi amici sono passati di qui ieri e si sono presi tutto.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //Bene. Meglio che tu te ne vada, ora.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Forse posso aiutarti.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //Non so. Certo, se conoscessi qualche miliziano che abbia rapporti con i paladini...
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Dubito che i paladini mi paghino il pesce.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Vedrò cosa posso fare.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Farim, il pescatore, ha problemi con la milizia. Gli portano via così tanto pesce che non ne gliene rimane a sufficienza per vivere. Dovrei trovare qualcuno nella milizia che abbia influenza sui paladini e che possa aiutarlo."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"So come risolvere i tuoi problemi con la milizia.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //So come risolvere i tuoi problemi con la milizia.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //E sarebbe?

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //Non posso star qui a fare la guardia al tuo pesce.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //Ma conosco la persona adatta.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Martin, il furiere dei paladini, vuole sentire la tua storia riguardo alla milizia e al pesce.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //E pensi che convincerà i miliziani a lasciarmi in pace?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //Così mi ha detto.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Eccellente. Grazie. Non posso darti molto. Ma aspetta...
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //Ho trovato questa strana pietra blu su una delle isole al largo di Khorinis.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //Non vale molto, ma troverai di sicuro il modo di usarla.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"Puoi dirmi qualcosa sulle persone che sono scomparse?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //Puoi dirmi qualcosa sulle persone che sono scomparse?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //Il mio amico William aveva cominciato a frequentare certi tipi loschi. E che fine ha fatto?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Un giorno non si è presentato al lavoro, e da allora non l'abbiamo più visto.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"Il tuo amico William è scomparso?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //Il tuo amico William è scomparso?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //Già. È un pescatore, ma ha fatto il passo più lungo della gamba.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //Non doveva immischiarsi con quella gentaglia.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "E chi sarebbero questi bastardi?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Si farà vivo prima o poi.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Cos'ha fatto?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "Quando l'hai visto l'ultima volta?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //Cos'ha fatto?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William aveva loschi commerci con quei manigoldi.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //Penso che vendesse delle merci di contrabbando a quei bastardi.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //E chi sarebbero questi bastardi?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //Non so chi siano, né cosa ci facciano qui a Khorinis.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //Però conosco il posto dove si incontravano con William.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //Una volta mi è capitato di vedere William lì mentre pescavo nella baia.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Dov'è esattamente che si incontravano?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Dov'è esattamente che si incontravano?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //C'è una baia di fronte al porto, a nord.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //Ci si arriva solo a nuoto, o in barca.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //Lì, sulla spiaggia, c'è un piccolo campo di pescatori. È lì che li ho visti.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Il pescatore Farim lamenta la perdita dell'amico William. Farim dice che William si incontrava spesso con dei tagliagole in una baia a nord del porto."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "Ho sentito abbastanza.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //Quando l'hai visto l'ultima volta?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Qualche giorno fa.

	Info_AddChoice	(DIA_Addon_Farim_William, "Forse è appena andato a pescare?", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Forse è solo uscito per pescare...
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //È improbabile. La sua barca è ancora ormeggiata al porto.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //Si farà vivo prima o poi.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //Non credo. È già troppo tempo che manca.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //Temo che uno di questi giorni ripescherò il suo cadavere.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Ho sentito abbastanza.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Risparmiati lo sforzo. Non credo che lo troverai.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"E com'è che i pesci mordono?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //Allora, abboccano?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Smettila di fingere che ti interessi.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //Con quel poco che c'è, è più facile morire che vivere.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //Eccoti ancora qui!
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //Hai saputo nulla del mio amico William?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //È morto.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //(sospira) Me l'aspettavo.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Grazie per essere tornato a dirmelo.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //Andrò alla taverna e mi berrò la sua parte dell'ultima pesca... Lui avrebbe voluto così...
};






