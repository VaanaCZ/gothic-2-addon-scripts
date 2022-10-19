// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thekla_EXIT (C_INFO)
{
	npc         = BAU_913_Thekla;
	nr          = 999;
	condition   = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Thekla_HALLO		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 1;
	condition	= DIA_Thekla_HALLO_Condition;
	information	= DIA_Thekla_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Thekla_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Thekla_HALLO_17_00"); //Che ci fai nella mia cucina?
};

// ************************************************************
// 			  				   Lecker
// ************************************************************
instance DIA_Thekla_Lecker		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 2;
	condition	= DIA_Thekla_Lecker_Condition;
	information	= DIA_Thekla_Lecker_Info;
	permanent 	= FALSE;
	description	= "Che odore delizioso, qui!";
};

func int DIA_Thekla_Lecker_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //Che odore delizioso, qui!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //Sì, certo! Conosco i tipi come te! Questo posto ne è pieno.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Prima cercano di essere tutti cortesi e disponibili, e poi quando hai bisogno di loro, non ci sono mai!
};

// ************************************************************
// 			  				   Hunger
// ************************************************************
var int Thekla_GaveStew;
// ---------------------

instance DIA_Thekla_Hunger		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 3;
	condition	= DIA_Thekla_Hunger_Condition;
	information	= DIA_Thekla_Hunger_Info;
	permanent 	= FALSE;
	description	= "Ho fame!";
};

func int DIA_Thekla_Hunger_Condition ()
{
	if (Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //Ho fame!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //Io non distribuisco cibo ai vagabondi. Do da mangiare solo a chi lavora.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //(in modo sprezzante) E a quella gentaglia mercenaria, ovviamente.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //Tieni il tuo cibo.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //Qui non serviamo le guardie cittadine.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //Come potrei rifiutare la richiesta di un rappresentante di Innos?
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	};
};

// ************************************************************
// 			  				   Arbeit
// ************************************************************

instance DIA_Thekla_Arbeit		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_Arbeit_Condition;
	information	= DIA_Thekla_Arbeit_Info;
	permanent 	= FALSE;
	description	= "Sto cercando lavoro.";
};

func int DIA_Thekla_Arbeit_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Arbeit_15_00"); //Sto cercando un lavoro...
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //Vuoi lavorare qui alla fattoria?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //Solo Onar può prendere una decisione in proposito. La fattoria appartiene a lui, così come tutta la valle.
};

// ************************************************************
// 			  				   WannaJoin
// ************************************************************

instance DIA_Thekla_WannaJoin		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 5;
	condition	= DIA_Thekla_WannaJoin_Condition;
	information	= DIA_Thekla_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "Veramente, avevo intenzione di unirmi ai mercenari...";
};

func int DIA_Thekla_WannaJoin_Condition ()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //Veramente, avevo intenzione di unirmi ai mercenari...
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //Dunque tu sei un altro di quelli che viene dalla colonia penale?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //Avrei dovuto capirlo! Lasciami in pace! Ho già abbastanza gente come te da queste parti!
};

// ************************************************************
// 			  				   Schlafen
// ************************************************************

instance DIA_Thekla_Schlafen		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 6;
	condition	= DIA_Thekla_Schlafen_Condition;
	information	= DIA_Thekla_Schlafen_Info;
	permanent 	= FALSE;
	description	= "Ho bisogno di un posto dove dormire.";
};

func int DIA_Thekla_Schlafen_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Schlafen_15_00"); //Ho bisogno di un posto dove dormire.
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Non pensare nemmeno di dormire nella mia cucina. Vatti a trovare un posto nella stalla.
};
		
// ************************************************************
// 			  				   Problem
// ************************************************************

instance DIA_Thekla_Problem		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Problem_Condition;
	information	= DIA_Thekla_Problem_Info;
	permanent 	= FALSE;
	description	= "Cos’hai contro i mercenari?";
};

func int DIA_Thekla_Problem_Condition ()
{
	if (kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Problem_15_00"); //Cos’hai contro i mercenari?
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //Ah, quegli imbecilli mi danno davvero sui nervi! Specialmente Silvio e quel grassone del suo compagno Bullco.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Quei due se ne stanno seduti nel loro angolo da giorni ormai, rendendomi la vita impossibile.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //La minestra è troppo calda, la carne è troppo dura, e così via.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //Perché allora non fai niente?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //E cosa dovrei fare, Signor So-tutto-io? Colpirli col mio mattarello? Posso farlo con i contadini, ma questi luridi bastardi mi picchierebbero.
	};
};

// ************************************************************
// 			  				   Manieren
// ************************************************************

instance DIA_Thekla_Manieren		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Manieren_Condition;
	information	= DIA_Thekla_Manieren_Info;
	permanent 	= FALSE;
	description	= "Vuoi che insegni a quei due le buone maniere?";
};

func int DIA_Thekla_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thekla_Problem)) 
	&& (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //Vuoi che insegni a quei due le buone maniere?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Faresti meglio a restarne fuori, tesoro. Da quello che so, Silvio dispone di un'armatura magica e non può essere sconfitto.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //E che mi dici di Bullco?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Quel tipo è forte come un toro. Finora ha battuto tutti quelli che hanno cercato di attaccare briga con lui o con Silvio.
};
		
// ************************************************************
// 			  				  After Fight
// ************************************************************

instance DIA_Thekla_AfterFight (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_AfterFight_Condition;
	information	= DIA_Thekla_AfterFight_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Thekla_AfterFight_Condition ()
{
	if (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info ()
{
	if (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //Gliel'hai fatta vedere a Bullco, tesoro.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //Deve essere stato un lavoro davvero estenuante picchiare quel grasso maiale.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //Ti hanno dato davvero una bella lezione, tesoro.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //Non ti avevo forse avvertito? Ora capisci cosa intendevo.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Sono felice di vedere che ti stai divertendo.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //Ora non fare quella faccia. Non sei il primo che viene battuto da quelle canaglie.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Tieni, mangia un boccone così recupererai le forze.
	B_GiveInvItems (self, other, ItFo_XPStew, 1);	
	Thekla_GaveStew = TRUE;
};

// ************************************************************
// 			  				 PaketSuccess 
// ************************************************************
instance DIA_Thekla_SagittaPaket (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_SagittaPaket_Condition;
	information	= DIA_Thekla_SagittaPaket_Info;
	permanent 	= TRUE;
	description	= "Ecco il pacco consegnato da Sagitta.";
};

func int DIA_Thekla_SagittaPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_TheklasPaket))
	&& (MIS_Thekla_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info ()
{
	B_GiveInvItems (other, self, ItMi_TheklasPaket, 1);
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //Ecco il pacco consegnato da Sagitta.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //Grazie mille. Alla fine sei riuscito lo stesso a renderti utile.
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_TheklasPaket);		
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;
// ------------------------

instance DIA_Thekla_PERM		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 900;
	condition	= DIA_Thekla_PERM_Condition;
	information	= DIA_Thekla_PERM_Info;
	permanent	= TRUE;
	description	= "Posso avere un altro po’ di stufato?";
};
func int DIA_Thekla_PERM_Condition()
{
	if (Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //Posso avere un altro po’ di stufato?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //Mi dispiace, ma l'ho finito.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //Non te n'è rimasta nemmeno una piccola scodella?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //No.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //Posso leccare la pentola allora?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //Puoi darci un taglio?
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Se ti piace così tanto il mio stufato, devi fare qualcosa per guadagnartelo.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //Cosa?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Vai da Sagitta, la guaritrice che vive dietro la fattoria di Sekob, e portami un pacco delle sue erbe.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Se mi porti le erbe, ti cucinerò dello stufato.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Se porto le erbe di Sagitta la guaritrice a Thekla, ella cucinerà dell'altro stufato per me. Sagitta vive dietro la fattoria di Sekob.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //D'accordo, ti accontenterò. Tieni, così non morirai di fame proprio davanti ai miei occhi.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //Ehi, ehi, ehi, non essere così ingordo! Ti avvertirò quando avrò qualcos'altro da farti fare.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //DOPODICHÉ potrai avere dell'altro stufato, capito?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //Ho sentito che hai aiutato Bennet a fuggire di prigione. Bel lavoro, ragazzo.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Quei bastardi della guardia cittadina hanno gettato Bennet in cella.
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Fammi un favore e fallo uscire di lì, d’accordo? Nel frattempo ti preparerò dell'altro gustoso stufato.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //Non mi è rimasto niente. Torna più tardi.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Sei sempre affamato, non è vero? Cos'è che fai tutto il giorno?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //Ho ucciso alcuni draghi.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //Oh! Credo che ti meriti una bella scodella di stufato dunque.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //Mi dispiace, ma non ce n'è più.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //Niente erbe, niente stufato, capito?
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thekla_PICKPOCKET (C_INFO)
{
	npc			= BAU_913_Thekla;
	nr			= 900;
	condition	= DIA_Thekla_PICKPOCKET_Condition;
	information	= DIA_Thekla_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Thekla_PICKPOCKET_Condition()
{
	C_Beklauen (53, 60);
};
 
FUNC VOID DIA_Thekla_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thekla_PICKPOCKET);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_BACK 		,DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};
	
func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};























