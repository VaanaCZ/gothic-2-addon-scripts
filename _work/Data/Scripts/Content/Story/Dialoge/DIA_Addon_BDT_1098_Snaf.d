//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_EXIT   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 999;
	condition   = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Snaf_PICKPOCKET (C_INFO)
{
	npc			= BDT_1098_Addon_Snaf;
	nr			= 900;
	condition	= DIA_Addon_Snaf_PICKPOCKET_Condition;
	information	= DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       
FUNC INT DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	C_Beklauen (49, 56);
};
 
FUNC VOID DIA_Addon_Snaf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
	
func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Hi   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 1;
	condition   = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Snaf_Hi_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Snaf_Hi_01_00"); //Vuoi mangiare o chiacchierare? Di cosa si tratta?
};
//---------------------------------------------------------------------
//	Was gibt's denn leckeres?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Cook (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 2;
	condition   = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent   = FALSE;
	description = "Cosa offre il menù?";
};
FUNC INT DIA_Addon_Snaf_Cook_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_Cook_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_15_00"); //Cosa offre il menù?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_01_01"); //Voglio provare un piatto nuovo: 'Strisce di fuoco in salsa di Martello'.
	
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"Strisce di fuoco?",DIA_Addon_Snaf_Cook_FEUER);	
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"Salsa di Martello?",DIA_Addon_Snaf_Cook_HAMMER);
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_FEUER_15_00");//Strisce di fuoco?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_01");//Carne ben cotta, arrostita delicatamente, con erba del fuoco marinata.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_02");//Ma non ti preoccupare: ho già tutti gli ingredienti.
};
FUNC VOID DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_15_00");//Salsa di Martello?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_01");//Una salsa a base di Martello. Ho avuto una ricetta da un tizio di nome Lou.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_02");//Tu procurami gli ingredienti e distilla il liquore sul banco dell'alchimista e io lo userò per preparare una salsa. Cosa ne pensi?
	
	Info_AddChoice (DIA_Addon_Snaf_Cook,"Non ho tempo, per questo.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice (DIA_Addon_Snaf_Cook,"Va bene, lo farò io.",DIA_Addon_Snaf_Cook_YES);
	
};
FUNC VOID DIA_Addon_Snaf_Cook_NO ()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");//Non ho tempo per questo.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");//Allora scordatelo.
	
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
};
FUNC VOID DIA_Addon_Snaf_Cook_YES()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");//Va bene, lo farò.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");//D'accordo. Eccoti la ricetta.
	
	B_GiveInvItems (self, other,ItWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	
	Log_CreateTopic (Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Hammer,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Hammer,"Snaf ha bisogno di alcol per la sua salsa. Mi ha dato la ricetta del Martello, che posso preparare sul tavolo del laboratorio.");
};
//---------------------------------------------------------------------
//	Info Booze
//---------------------------------------------------------------------
var int Snaf_Tip_Kosten;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Booze   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 3;
	condition   = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent   = FALSE;
	description = "Ho distillato il liquore.";
};
FUNC INT DIA_Addon_Snaf_Booze_Condition()
{	
	if (Npc_HasItems (other, ItFo_Addon_LousHammer) >= 1)
	&& (MIS_SnafHammer == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Booze_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Booze_15_00");//Ho distillato il liquore.

	//PATCH N.B.
	B_GiveInvItems (other, self, ItFo_Addon_LousHammer, 1);

	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_01");//Ottimo, allora finisco io.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_02");//Ecco, puoi assaggiarne un po' anche subito. Così avrai più forza nelle braccia.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_03");//Oh, e se posso aiutarti ancora… D'ora in poi le informazioni non ti costeranno nulla.
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems (self, other, ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Loushammer);
};

//---------------------------------------------------------------------
//	ATTENTAT
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Attentat   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 4;
	condition   = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent   = FALSE;
	description = "Cosa sai dirmi dell'attacco?";
};
FUNC INT DIA_Addon_Snaf_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_15_00"); //Cosa sai dirmi dell'attacco?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_01"); //Quella storia con Esteban?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_02"); //Sai com'è. Un barista sente tutto, ma non prende mai le parti di nessuno
	
	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Almeno dimmi a chi dovrei chiedere.",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Se fossi al posto mio, che cosa faresti?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Allora sai qualcosa?",DIA_Addon_Snaf_Attentat_Something);	
};
	
func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_Something_15_00"); //Allora sai qualcosa?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_Something_01_01"); //Non ho detto QUELLO.
};
func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_GoWhere_15_00"); //Almeno dimmi da chi posso andare.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_GoWhere_01_01"); //Oh, amico! Dov’è la differenza? Scordatelo!
};
func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_YouBeingMe_15_00"); //Se fossi al posto mio, che cosa faresti?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_01"); //Penserei a quello che so del mandante.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_02"); //Prima di tutto, probabilmente è stato uno dei briganti, il che significa che si trova qui nel campo.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_03"); //In secondo luogo, se è qui nel campo ti sorveglia.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_04"); //In terzo luogo, se pensa che tu sia dalla parte di Esteban, non si scoprirà mai con te.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_05"); //Quindi, la domanda INTERESSANTE è: quante possibilità hai di trovare il tuo uomo?

	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
};

//---------------------------------------------------------------------
//	Info Abrechnung
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Abrechnung   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 5;
	condition   = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent   = TRUE;
	description = "Quante possibilità ho di trovare il mio uomo?";
};
FUNC INT DIA_Addon_Snaf_Abrechnung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Snaf_Attentat)
	&& (MIS_JUDAS == LOG_RUNNING)
	&& (Huno_zuSnaf == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Abrechnung_15_00"); //Quante possibilità ho di trovare il mio uomo?
	AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_01"); //Mmmh...
	
	if (Senyan_Erpressung == LOG_RUNNING) 
	&& (!Npc_IsDead (Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_02"); //Piuttosto scarse. Alcuni hanno notato che tu hai a che fare con Senyan.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_03"); //Dovrai rompere con lui, altrimenti non avrai mai alcuna possibilità di scoprire il responsabile dell'attacco.
		
		if (Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry (Topic_Addon_Senyan,"Dovrei chiudere con Senyan. Ma non sarebbe molto astuto attaccarlo direttamente. Prima dovrei parlargli.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if (Npc_IsDead(Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_04"); //Ti sei imbattuto in uno degli uomini di Esteban. L'uomo che stai cercando crederà che tu sia dalla sua parte.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_05"); //Ma non si farà riconoscere da te. Dovrai scoprire qualcosa di più.
	}
	else if (Finn_Petzt == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_06"); //Finn sembra essere molto nervoso da quando gli hai parlato.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_07"); //E qui tutti sanno che ha una buona reputazione presso Esteban.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_08"); //Questo significa che probabilmente gli hai detto qualcosa che non voleva sentire.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_09"); //Questo farà piacere all'uomo che stai cercando
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_10"); //Tuttavia, c'è sempre il rischio che vada dritto da Esteban a dirglielo (ironico), ma questo lo sai anche tu
	}
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_11"); //Dicono che tu abbia detto a Finn che lavori per Esteban.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_12"); //Non so che cosa hai in mente, esattamente, ma l'uomo che stai cercando d'ora in poi starà sicuramente più attento.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_13"); //Per ora è ancora tutto aperto.
	};
	
	//------------------- Abschied ----------------------------------
	if (Snaf_Rechnung == FALSE)
	{
		if (Snaf_Einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_14"); //Grazie.
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_15"); //(secco) Ehi. Non ti ho detto nulla che non tu sapessi già, chiaro?
			
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_16"); //Lo sapevo
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_17"); //Esattamente.
		};
	};
};

//---------------------------------------------------------------------
//	HOCH
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_HOCH (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HOCH_Info;
	permanent   = FALSE;
	description = "Huno dice che dovrei incontrare qualcuno, qui…";
};
FUNC INT DIA_Addon_Snaf_HOCH_Condition()
{	
	if (Huno_zuSnaf == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_HOCH_15_00"); //Mi manda Huno.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_01"); //Sembra che tu abbia trovato il tuo uomo.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_02"); //Vai al piano di sopra, c'è qualcuno che ti sta aspettando.
		
	AI_StopProcessInfos (self);
	AI_Teleport (Fisk,"BL_INN_UP_06");
	B_StartotherRoutine (Fisk,"MEETING");

	B_GivePlayerXP (XP_Addon_Auftraggeber);
};

//---------------------------------------------------------------------
//	People
//---------------------------------------------------------------------
var int Kosten_Einmal;
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_People (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent   = TRUE;
	description = "Che cosa pensano qui di Esteban?";
};
FUNC INT DIA_Addon_Snaf_People_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_People_Info()
{
	
	AI_Output (other, self, "DIA_Addon_Snaf_People_15_00"); //Che cosa pensano qui di Esteban?
	AI_Output (self, other, "DIA_Addon_Snaf_People_01_01"); //Dovrai essere un po' più preciso...
	if (Kosten_Einmal == FALSE)
	&& (MIS_SnafHammer != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_02"); //Ogni informazione ti coster
		AI_Output (other, self, "DIA_Addon_Snaf_People_15_03"); //Quanto vuoi?
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_04"); //10 monete d'oro!
		
		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Snaf_People);
	Info_AddChoice (DIA_Addon_Snaf_People, DIALOG_BACK, DIA_Addon_Snaf_People_BACK);
	Info_AddChoice (DIA_Addon_Snaf_People, "Paul.", DIA_Addon_Snaf_People_Paul);
	Info_AddChoice (DIA_Addon_Snaf_People, "Huno.", DIA_Addon_Snaf_People_Huno);
	Info_AddChoice (DIA_Addon_Snaf_People, "Fisk.", DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice (DIA_Addon_Snaf_People, "Emilio.", DIA_Addon_Snaf_People_Emilio);
	if (!Npc_IsDead (Senyan))
	{
		Info_AddChoice (DIA_Addon_Snaf_People, "Senyan.", DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice (DIA_Addon_Snaf_People, "Lennar.", DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice (DIA_Addon_Snaf_People, "Finn.", DIA_Addon_Snaf_People_Finn);
};
// --------------------------------------------
	func void B_Addon_Snaf_NotEnough()
	{
		AI_Output (self, other, "DIA_Addon_Snaf_NotEnough_01_00"); //Non hai abbastanza oro, ragazzo!
	};

FUNC VOID DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_People);
};
FUNC VOID DIA_Addon_Snaf_People_Paul()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Paul_15_00"); //Cosa mi dici di Paul?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Paul_01_01"); //Non penso che Esteban gli piaccia molto. Dal momento che ha lavorato per Huno, non entrerà mai nella miniera.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Huno()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Huno_15_00"); //Che cosa pensa Huno di Esteban?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_01"); //Ah! Huno. Non so quasi nulla di lui.
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_02"); //(sogghigna) Naturalmente, quell'informazione è gratis.
};
FUNC VOID DIA_Addon_Snaf_People_Fisk()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Fisk_15_00"); //Cosa mi dici di Fisk?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_01"); //Fisk è Fisk. Paga la sua quota a Esteban e distribuisce le merci che ottiene in gran parte dai pirati.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_02"); //Non penso che gli interessi molto Esteban.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Emilio()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Emilio_15_00"); //Emilio. Che cosa pensa di Esteban?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Emilio_01_01"); //Non penso che porterebbe fiori sulla tomba di Esteban, non so se mi spiego.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Senyan()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Senyan_15_00"); //Che mi dici di Senyan?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Senyan_01_01"); //Senyan è uno dei ragazzi di Esteban. Lavora per lui da parecchio tempo.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Lennar()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Lennar_15_00"); //Che cosa pensa Lennar di Esteban?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Lennar_01_01"); //Per quanto ne so, Lennar non pensa AFFATTO.
};

func VOID DIA_Addon_Snaf_People_Finn()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Finn_15_00"); //Cosa mi dici di Finn?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_01"); //È un bravo scavatore. Ha naso per l'oro.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_02"); //E per questo motivo Esteban lo favorisce. Penso che goda di un'ottima reputazione presso di lui.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

//---------------------------------------------------------------------
//	Und du?
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Himself (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 7;
	condition   = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent   = FALSE;
	description = "Che cosa pensi TU di Esteban?";
};
FUNC INT DIA_Addon_Snaf_Himself_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Himself_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_00"); //Che cosa pensi TU di Esteban?
	AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_01"); //Chiunque parli di lui muore presto
	//AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_02"); //Und?
	//AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_03"); //Ende der Geschichte. //wav fehlt
};

//---------------------------------------------------------------------
//	PERM
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_PERM (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 8;
	condition   = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent   = TRUE;
	description = "Come vanno gli affari?";
};
FUNC INT DIA_Addon_Snaf_PERM_Condition()
{	
	if (Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_PERM_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_PERM_15_00"); //Come vanno gli affari?
	AI_Output (self, other, "DIA_Addon_Snaf_PERM_01_01"); //Bene! Per alcuni, qui, la morte di Esteban è motivo di festa
};


