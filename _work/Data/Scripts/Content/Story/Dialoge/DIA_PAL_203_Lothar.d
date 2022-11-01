// ***************************************************************
//								EXIT
// ***************************************************************

// ---------------------
	var int Lothar_ImOV;
// ---------------------

INSTANCE DIA_Lothar_EXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lothar_EXIT_Condition()
{	
	if (Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_EXIT_Info() 
{
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							First EXIT
// ***************************************************************

INSTANCE DIA_Lothar_FirstEXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent   = TRUE;
	description = "Devo andare! (FINE)";
};
FUNC INT DIA_Lothar_FirstEXIT_Condition()
{	
	if (Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_FirstEXIT_Info() 
{
	AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_00"); //Devo andare!
	if (Lothar_Regeln == FALSE)
	{
		AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_01"); //Aspetta! Non conosci ancora le leggi della città!
		AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_02"); //Più tardi.
	}
	else
	{
		if (Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_03"); //Se sentirò dire anche solo UNA volta che stai raccontando alla gente dei draghi, finirai in grossi guai, sono stato chiaro?
		}
		else
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_04"); //Fino a quando resterai a Khorinis potrai ritenerti al sicuro.

			if (hero.guild != GIL_PAL)
			{
				AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_05"); //I paladini del Re proteggono questa città!
			};
		};

		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine (self, "START");
	};

	// ------- Canthars TA auswechseln -------
	if (Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine (Canthar, "START");
		Canthar_InStadt = TRUE;
	};

	AI_StopProcessInfos (self);
};


// ***************************************************************
//							Hallo
// ***************************************************************

instance DIA_Lothar_Hallo (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Hallo_Condition;
	information	 = 	DIA_Lothar_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lothar_Hallo_Condition ()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lothar_Hallo_01_00"); //Fermo, straniero!

	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Hallo_01_01"); //Non ti ho visto entrare da questo cancello.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_02"); //E allora?
		AI_Output (self, other, "DIA_Lothar_Hallo_01_03"); //E le guardie all'altro cancello hanno l'ordine di non lasciar entrare in città nessuno sconosciuto.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_04"); //Ehm...
		AI_Output (self, other, "DIA_Lothar_Hallo_01_05"); //Farò un bel discorsetto a quei due!
		AI_Output (self, other, "DIA_Lothar_Hallo_01_06"); //Ma veniamo a noi:
	};

	AI_Output (self, other, "DIA_Lothar_Hallo_01_07"); //Io sono Lothar, paladino del Re e umile servo di Innos, nostro Signore.
	AI_Output (self, other, "DIA_Lothar_Hallo_01_08"); //Il nostro comandante, Lord Hagen, mi ha affidato l'incarico di spiegare ai nuovi venuti le nuove leggi, che valgono per tutti gli abitanti della città.

	//ADDON>
	AI_Output (self, other, "DIA_Addon_Lothar_Hallo_01_00"); //Da quando la gente ha cominciato a sparire, qui in città, tutti devono stare attenti a non subire la stessa sorte.
	//ADDON<

	if Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	{
		B_StartOtherRoutine (Lester, "XARDAS");
	};
};

// ***************************************************************
//						Wichtige Nachricht			E1
// ***************************************************************
instance DIA_Lothar_MESSAGE		(C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_MESSAGE_Condition;
	information	 = 	DIA_Lothar_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"Ho un messaggio importante per il capo dei paladini!";
};
func int DIA_Lothar_MESSAGE_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_MESSAGE_Info ()
{
 	AI_Output (other, self, "DIA_Lothar_MESSAGE_15_00"); //Ho un messaggio importante per il capo dei paladini!
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_01"); //L'onorevole Lord Hagen non riceve nessuno.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_02"); //Lord Andre, il comandante delle guardie cittadine, è responsabile di tutti i problemi riguardanti la gente comune.
};	

// ***************************************************************
//							Auge Innos 				E2
// ***************************************************************
instance DIA_Lothar_EyeInnos (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_EyeInnos_Condition;
	information	 = 	DIA_Lothar_EyeInnos_Info;
	permanent    =  FALSE;
	description	 = 	"Sono venuto per prendere l’Occhio di Innos!";
};
func int DIA_Lothar_EyeInnos_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_EyeInnos_Info ()
{
	AI_Output (other, self, "DIA_Lothar_EyeInnos_15_00"); //Sono venuto per prendere l’Occhio di Innos!

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_01"); //L'Occhio è un argomento che riguarda Lord Hagen. Dovrai parlarne con lui.
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_02"); //Il sacro Occhio di Innos! Come fai a conoscerlo?!? Non sei un membro dell'ordine!
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_03"); //Me ne ha parlato un mago.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_04"); //Non so quali fossero i suoi motivi per affidarti uno dei segreti del nostro ordine.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_05"); //Ma di certo non intendeva che TU mettessi le mani sull'amuleto.
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_06"); //Ma...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_07"); //Non voglio più sentirne parlare!
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output (self, other, "DIA_Lothar_EyeInnos_01_08"); //Prima le favole sui draghi e adesso questo... incredibile!
		};
	};
};	

// ***************************************************************
//							Drachen 				E2
// ***************************************************************
instance DIA_Lothar_Dragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Dragons_Condition;
	information	 = 	DIA_Lothar_Dragons_Info;
	permanent    =  FALSE;
	description	 = 	"Ascolta... la città è minacciata dai draghi!";
};
func int DIA_Lothar_Dragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Dragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Dragons_15_00"); //Ascolta... la città è minacciata dai draghi!
	if ((hero.guild != GIL_PAL)&&(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_01"); //Non può essere!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_02"); //Un altro matto!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_03"); //Come se non avessimo già abbastanza tensione in città. Ci mancava solo un altro sciocco che spaventi la gente con le favole sui draghi!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_04"); //Ho subito rinchiuso l'ultima persona che raccontava fiabe sui draghi e l'ho mandato nella Valle delle Miniere con il convoglio di detenuti. Quindi tieni a freno la lingua!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_05"); //Non possiamo permetterci che qualcuno diffonda il panico tra la gente!
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_06"); //L'ho sentito spesso, ma è difficile da credere.
		AI_Output (self, other, "DIA_Lothar_Dragons_01_07"); //Sarebbe meglio se lo tenessi per te. Dobbiamo evitare la paura e il panico tra la gente.
	};
	Player_TalkedAboutDragons = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_Ornament		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lothar_Ornament_Condition;
	information	 = 	DIA_Addon_Lothar_Ornament_Info;

	description	 = 	"Sai nulla di una creatura di pietra trovata nel cerchio di pietre alla fattoria di Lobart?";
};

func int DIA_Addon_Lothar_Ornament_Condition ()
{
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //Sai nulla di una creatura di pietra trovata nel cerchio di pietre alla fattoria di Lobart?
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //Certo. L'abbiamo distrutta. Era un pericolo per le fattorie circostanti.
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //Perché me lo chiedi?
	
	Info_ClearChoices	(DIA_Addon_Lothar_Ornament);
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Cerco un frammento di un ornamento per anello.", DIA_Addon_Lothar_Ornament_suche );
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Pensia che sia normale?", DIA_Addon_Lothar_Ornament_normal );
};
func void DIA_Addon_Lothar_Ornament_normal ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //Pensia che sia normale?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //Quel mostro di pietra?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //So che se ne stanno occupando i Maghi dell'Acqua.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //La cosa non mi riguarda. Abbiamo i nostri compiti qui in città e nella Valle delle Miniere.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //Capisco.
};

func void DIA_Addon_Lothar_Ornament_suche ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //Cerco un frammento di un ornamento per anello.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //Pare fosse nei pressi del circolo di pietre di Lobart.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //Sì, c'era una cosa del genere. Ce l'aveva la creatura di pietra. Credevo fosse una runa magica.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //L'ho data a Lord Hagen, ma non so se ce l'abbia ancora.
};

// ***************************************************************
//							WerVonDrachen 				E3
// ***************************************************************
instance DIA_Lothar_WhoDragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_WhoDragons_Condition;
	information	 = 	DIA_Lothar_WhoDragons_Info;
	permanent    =  FALSE;
	description	 = 	"Qualcuno ha già dichiarato di aver visto dei draghi qui?";
};
func int DIA_Lothar_WhoDragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Dragons))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WhoDragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WhoDragons_15_00"); //Qualcuno ha già dichiarato di aver visto dei draghi qui?
	AI_Output (self, other, "DIA_Lothar_WhoDragons_01_01"); //Già. Un tizio di nome Diego. Mi pare, almeno.

	if ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_WhoDragons_01_02"); //(minaccioso) Lo avevo avvertito, proprio come te! Ma quel matto non la smetteva di innervosirmi!
	};
};	

// ***************************************************************
//							Regeln 				E1
// ***************************************************************
instance DIA_Lothar_Regeln (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_Regeln_Condition;
	information	 = 	DIA_Lothar_Regeln_Info;
	permanent    =  FALSE;
	description	 = 	"Va bene... spiegami le regole della città!";
};
func int DIA_Lothar_Regeln_Condition ()
{	
	return TRUE;
};
func void DIA_Lothar_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Regeln_15_00"); //(sospiro) D'accordo, spiegami le regole della città!
	AI_Output (self, other, "DIA_Lothar_Regeln_01_01"); //Primo: L'onorevole paladino Lord Hagen risiede nei quartieri alti, insieme alle sue truppe.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_02"); //Per questo motivo i quartieri alti sono accessibili solamente ai cittadini onorevoli.
	AI_Output (self ,other, "DIA_Lothar_Add_01_04"); //Secondo: Il municipio nei quartieri alti è ora il centro di comando dei paladini. Solo i paladini stessi e i membri dell'esercito ne hanno accesso.
	AI_Output (self ,other, "DIA_Lothar_Add_01_05"); //E terzo: Chiunque venga accusato di un crimine dovrà discolparsi presso il comandante dell'esercito.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_05"); //Qualche domanda?
	
	Lothar_Regeln = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_MissingPeople		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lothar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Lothar_MissingPeople_Info;

	description	 = 	"I cittadini stanno scomparendo?";
};

func int DIA_Addon_Lothar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lothar_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //Sono scomparsi degli abitanti della città?
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //Già. E altri ne scompaiono ogni giorno.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //È una gran seccatura che la milizia non sia ancora riuscita a scoprire cosa c'è dietro questi strani fenomeni.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //Non mi meraviglia che i cittadini siano diventati diffidenti nei confronti degli stranieri.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_04"); //Cerca di non provocarli quando sarai in città, chiaro?
	
		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};
	
	SC_HearedAboutMissingPeople = TRUE;
};

// ***************************************************************
//							HowCitizen 				E2
// ***************************************************************
instance DIA_Lothar_HowCitizen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	4;
	condition	 = 	DIA_Lothar_HowCitizen_Condition;
	information	 = 	DIA_Lothar_HowCitizen_Info;
	permanent    =  FALSE;
	description	 = 	"Come faccio a DIVENTARE un cittadino di questa città?";
};
func int DIA_Lothar_HowCitizen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_HowCitizen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_06"); //Come faccio a DIVENTARE un cittadino di questa città?
	AI_Output (self ,other, "DIA_Lothar_Add_01_07"); //Solo le persone con un lavoro regolare saranno considerate cittadini!
	AI_Output (self ,other, "DIA_Lothar_Add_01_09"); //Ma non credere che sarai ammesso da Lord Hagen solo perché sei un cittadino!
	AI_Output (self ,other, "DIA_Lothar_Add_01_10"); //Come cittadino hai accesso ai quartieri alti e niente di più!
	AI_Output (self ,other, "DIA_Lothar_Add_01_11"); //Solo come membro dell'esercito avrai accesso al municipio!
};

// ***************************************************************
//							WoArbeit				E3
// ***************************************************************
instance DIA_Lothar_WoArbeit (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	5;
	condition	 = 	DIA_Lothar_WoArbeit_Condition;
	information	 = 	DIA_Lothar_WoArbeit_Info;
	permanent    =  FALSE;
	description	 = 	"Dove trovo un lavoro?";
};
func int DIA_Lothar_WoArbeit_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_HowCitizen))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoArbeit_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_14"); //Dove trovo un lavoro?
	AI_Output (self ,other, "DIA_Lothar_Add_01_15"); //Dovrai iniziare come apprendista di uno dei maestri della parte bassa della città.
	AI_Output (self ,other, "DIA_Lothar_Add_01_16"); //Appena un maestro ti accetterà, diventerai un cittadino.
	AI_Output (self ,other, "DIA_Lothar_Add_01_17"); //Tuttavia, gli altri maestri devono essere d'accordo, com'è usanza di Khorinis.
	AI_Output (self ,other, "DIA_Lothar_Add_01_18"); //Se stavi pensando di cercare un lavoro nel distretto del porto, dimenticatelo!
	AI_Output (self ,other, "DIA_Lothar_Add_01_19"); //Laggiù vive la feccia della città. Non andarci neanche, o finirai per pentirtene.
};

// ***************************************************************
//							ToOV 				E2
// ***************************************************************
instance DIA_Lothar_ToOV (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	6;
	condition	 = 	DIA_Lothar_ToOV_Condition;
	information	 = 	DIA_Lothar_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"Come si arriva al quartiere più alto?";
};
func int DIA_Lothar_ToOV_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToOV_Info ()
{
	AI_Output (other, self, "DIA_Lothar_ToOV_15_00"); //Come si arriva ai quartieri alti?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_01"); //Di', ma mi stai ascoltando?!?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_02"); //Non sei un cittadino. Risparmiati la fatica, le guardie non ti farebbero entrare.
	AI_Output (self, other, "DIA_Lothar_ToOV_01_03"); //L'intera zona oltre il cancello interno ti è interdetta!
};	

// ***************************************************************
//							ToMiliz 				E2
// ***************************************************************
instance DIA_Lothar_ToMiliz (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToMiliz_Condition;
	information	 = 	DIA_Lothar_ToMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"Come posso entrare nella guardia cittadina?";
};
func int DIA_Lothar_ToMiliz_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToMiliz_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_26"); //Come posso entrare nella guardia cittadina?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_27"); //Per esplicito ordine di Lord Hagen, solo i cittadini sono ammessi nell'esercito.
		AI_Output (other, self, "DIA_Lothar_Add_15_28"); //Capisco.
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_29"); //Se vuoi saperne di più, parla con Lord Andre nella caserma.
};	

// ***************************************************************
//							ToPaladins 				E2
// ***************************************************************
instance DIA_Lothar_ToPaladins (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToPaladins_Condition;
	information	 = 	DIA_Lothar_ToPaladins_Info;
	permanent    =  FALSE;
	description	 = 	"Cosa devo far per procurarmi un’armatura come la tua?";
};
func int DIA_Lothar_ToPaladins_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_ToMiliz))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToPaladins_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_30"); //Cosa devo fareper procurarmi un’armatura come la tua?
	if (other.guild != GIL_MIL)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_31"); //(sbraitando) COSA?!? Non sei neanche un membro dell'esercito!
	};
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_32"); //Non sei neppure un CITTADINO!!
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_33"); //Come puoi anche solo pensare di essere autorizzato a indossare l'armatura di un PALADINO?!?
	AI_Output (self ,other, "DIA_Lothar_Add_01_34"); //Solamente pochi soldati dell'esercito, coloro i quali hanno compiuto gesta straordinarie, hanno ricevuto un simile onore finora.
	AI_Output (self ,other, "DIA_Lothar_Add_01_35"); //(severamente) Se vuoi diventare un paladino, hai ancora molta strada da fare, ragazzo mio!
};	

// ***************************************************************
//							WoAndre 				E2
// ***************************************************************
instance DIA_Lothar_WoAndre (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	8;
	condition	 = 	DIA_Lothar_WoAndre_Condition;
	information	 = 	DIA_Lothar_WoAndre_Info;
	permanent    =  FALSE;
	description	 = 	"Dove si trova il comandante della guardia cittadina?";
};
func int DIA_Lothar_WoAndre_Condition ()
{	
	if ( Npc_KnowsInfo(other, DIA_Lothar_Regeln) || Npc_KnowsInfo(other, DIA_Lothar_MESSAGE) )
	&& (Andre.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoAndre_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WoAndre_15_00"); //Dove si trova il comandante della guardia cittadina?
	AI_Output (self, other, "DIA_Lothar_WoAndre_01_01"); //Potrai trovare Lord Andre nella caserma dall'altra parte della città.
};	

// ***************************************************************
//							Schlafen 				E2
// ***************************************************************
instance DIA_Lothar_Schlafen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	9;
	condition	 = 	DIA_Lothar_Schlafen_Condition;
	information	 = 	DIA_Lothar_Schlafen_Info;
	permanent    =  FALSE;
	description	 = 	"Dove trovo un posto per dormire?";
};
func int DIA_Lothar_Schlafen_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_22"); //Dove trovo un luogo per dormire?
	AI_Output (self ,other, "DIA_Lothar_Add_01_23"); //Se stai cercando un posto per dormire, vai alla locanda di fronte alla caserma.
	AI_Output (self ,other, "DIA_Lothar_Add_01_24"); //I paladini pagano per gli alloggi di tutti i viaggiatori che arrivano in città.
	AI_Output (self ,other, "DIA_Lothar_Add_01_25"); //Anche i venditori itineranti del mercato sono alloggiati lì.
};	

// ***************************************************************
//							PERM - VOR OV				
// ***************************************************************
instance DIA_Lothar_PermB4OV (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 3;
	condition	= DIA_Lothar_PermB4OV_Condition;
	information	= DIA_Lothar_PermB4OV_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
func int DIA_Lothar_PermB4OV_Condition ()
{	
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Lothar_Regeln == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PermB4OV_Info ()
{
	AI_Output (self, other, "DIA_Lothar_PermB4OV_01_00"); //Puoi parlare con Lord Andre per tutto il resto!
	AI_StopProcessInfos(self);
};	
	

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() //überflüsige Outputs
{
	AI_Output (other, self, "DIA_Lothar_Add_15_00"); //Ma io DEVO vedere Lord Hagen!

	AI_Output (self ,other, "DIA_Lothar_Add_01_45"); //Vedo che ti ha accettato nell'esercito.
	AI_Output (self ,other, "DIA_Lothar_Add_01_46"); //Mmmh... deve sapere quello che fa.
	
	AI_Output (other, self, "DIA_Lothar_Add_15_20"); //Quanti maestri ci sono?
	AI_Output (self ,other, "DIA_Lothar_Add_01_21"); //Credo ce ne siano cinque in tutto.
		
	AI_Output (self ,other, "DIA_Lothar_Add_01_62"); //Dimmi, non sono stato forse chiaro? Niente più favole sui draghi!
	AI_Output (other, self, "DIA_Lothar_Add_15_63"); //Come fai a sapere che...?
	AI_Output (self ,other, "DIA_Lothar_Add_01_64"); //Questi NON sono affari tuoi!
	AI_Output (self ,other, "DIA_Lothar_Add_01_65"); //È l'ultima volta, hai capito?!?
	
	AI_Output (other, self, "DIA_Lothar_Add_15_66"); //Dove posso trovare il comandante dell'esercito?
	AI_Output (other, self, "DIA_Lothar_Add_15_08"); //Ora sono l'apprendista di uno dei maestri!
	
	// ------ NEWS_Modul für Unterstadt ------
	AI_Output (self ,other, "DIA_Lothar_Add_01_47"); //Ancora tu.

	AI_Output (self ,other, "DIA_Lothar_Add_01_43"); //Ho sentito dire che hai incontrato Lord Andre...
	AI_Output (self ,other, "DIA_Lothar_Add_01_44"); //Ti ho già detto che puoi unirti all'esercito solo se sei un cittadino.

	AI_Output (self ,other, "DIA_Lothar_Add_01_48"); //Ho riferito a Lord Hagen che desideri parlargli...
	AI_Output (other, self, "DIA_Lothar_Add_15_49"); //Cosa ti ha detto?
	AI_Output (self ,other, "DIA_Lothar_Add_01_50"); //Non ha mai sentito parlare di te.
	AI_Output (other, self, "DIA_Lothar_Add_15_51"); //Certo che no. Gli hai raccontato dei draghi?
	AI_Output (self ,other, "DIA_Lothar_Add_01_52"); //Non ti avevo detto di SMETTERLA con queste storie?!?

	AI_Output (self ,other, "DIA_Lothar_Add_01_12"); //Ho sentito dire che hai già ottenuto l'approvazione di alcuni maestri.
	AI_Output (self ,other, "DIA_Lothar_Add_01_13"); //Sei abbastanza serio a riguardo, non è vero?

	AI_Output (self ,other, "DIA_Lothar_Add_01_01"); //Devi obbedire alle regole, come tutti gli altri!
	AI_Output (self ,other, "DIA_Lothar_Add_01_02"); //Lord Hagen non è disponibile.
	AI_Output (self ,other, "DIA_Lothar_Add_01_03"); //Se hai qualcosa di IMPORTANTE da dire, vai da Lord Andre. Ti aiuterà!
};


// #########################################
// #########################################
		
// 				Im Oberen Viertel
		
// #########################################
// #########################################


// ***************************************************************
//								OV Regeln
// ***************************************************************
instance DIA_Lothar_HelloAgain (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_HelloAgain_Condition;
	information	 = 	DIA_Lothar_HelloAgain_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lothar_HelloAgain_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	{
		return TRUE;
	};
};
func void DIA_Lothar_HelloAgain_Info ()
{
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_00"); //Ah! Ancora tu!
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_01"); //Dunque alla fine ce l'hai fatta ad accedere ai quartieri alti!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_36"); //Dove hai preso quella veste?
		AI_Output (other, self, "DIA_Lothar_Add_15_37"); //Ho passato la Prova del Fuoco.
		AI_Output (self ,other, "DIA_Lothar_Add_01_38"); //Incredibile. Dunque quello che sta succedendo dev'essere il volere di Innos...
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_39"); //Non ti sei unito ai mercenari di Onar, vero?
		AI_Output (self ,other, "DIA_Lothar_Add_01_40"); //Come hai fatto a entrare?
		AI_Output (other, self, "DIA_Lothar_Add_15_41"); //Porto un'offerta di pace da parte di Lee...
		AI_Output (self ,other, "DIA_Lothar_Add_01_42"); //Bah! Lord Hagen non l'accetterà mai.
	};
		
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_02"); //Ci sono alcune cose a cui devi fare attenzione, altrimenti finirai fuori di qui velocemente come sei entrato.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_03"); //Ti è permesso entrare solamente negli edifici dei mercanti. Potrai riconoscerli dall'insegna sulla porta, giusto per evitare sviste.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_04"); //Gli altri edifici appartengono a cittadini importanti, non c'è niente per te!
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV) 
	{
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_05"); //Anche se sei un membro dell'ordine di Innos.
	};
	if (other.guild == GIL_MIL)
	{	
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_06"); //Come membro dell'esercito, avrai anche accesso alle stanze dei paladini.
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_07"); //Ma il tuo dormitorio è ancora nella caserma.
	};
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_08"); //In questo quartiere vivono i cittadini importanti della città, perciò trattali con rispetto.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_09"); //Ci siamo capiti?
	AI_Output (other, self, "DIA_Lothar_HelloAgain_15_10"); //Certo.
};	

// ***************************************************************
//								Hagen
// ***************************************************************
instance DIA_Lothar_Hagen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_Hagen_Condition;
	information	 = 	DIA_Lothar_Hagen_Info;
	permanent    =  TRUE;
	description  = 	"Dove si trova Lord Hagen?";
};
func int DIA_Lothar_Hagen_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Hagen_15_00"); //Dove si trova Lord Hagen?
	AI_Output (self, other, "DIA_Lothar_Hagen_01_01"); //È nel municipio, in fondo ai quartieri alti.
	AI_Output (self, other, "DIA_Lothar_Hagen_01_02"); //Ma non sarai ammesso senza una buona ragione.
};

// ***************************************************************
//							Oldworld Running
// ***************************************************************
instance DIA_Lothar_OWRunning (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunning_Condition;
	information	 = 	DIA_Lothar_OWRunning_Info;
	permanent    =  FALSE;
	description  = 	"Sono andato da Lord Hagen...";
};
func int DIA_Lothar_OWRunning_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) == 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunning_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_53"); //Sono andato da Lord Hagen...
	AI_Output (self ,other, "DIA_Lothar_Add_01_54"); //E... ? Non lo avrai seccato con le tue favole di draghi, vero?
	AI_Output (other, self, "DIA_Lothar_Add_15_55"); //Sì, l'ho fatto...
	AI_Output (self ,other, "DIA_Lothar_Add_01_56"); //Dimmi che non è vero...
	AI_Output (other, self, "DIA_Lothar_Add_15_57"); //Mi ha mandato a recuperare delle prove...
	AI_Output (self ,other, "DIA_Lothar_Add_01_58"); //Bene, buona fortuna. (tra sè) Che svitato...
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							Oldworld Running UND Brief
// ***************************************************************
instance DIA_Lothar_OWRunningBrief (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunningBrief_Condition;
	information	 = 	DIA_Lothar_OWRunningBrief_Info;
	permanent    =  FALSE;
	description  = 	"Ho la prova! Ecco la lettera del comandante Garond!";
};
func int DIA_Lothar_OWRunningBrief_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunningBrief_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_59"); //Ho la prova! Ecco la lettera del comandante Garond!
	AI_Output (self ,other, "DIA_Lothar_Add_01_60"); //Dunque ci sono veramente dei draghi?
	AI_Output (self ,other, "DIA_Lothar_Add_01_61"); //Ti ho trattato con ingiustizia. Pregherò Innos perché possa perdonare il mio comportamento.
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//								PERM
// ***************************************************************
instance DIA_Lothar_PERM (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_PERM_Condition;
	information	 = 	DIA_Lothar_PERM_Info;
	permanent    =  TRUE;
	description  = 	"È accaduto qualcosa di particolare, ultimamente?";
};
func int DIA_Lothar_PERM_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PERM_Info ()
{
	AI_Output (other, self, "DIA_Lothar_PERM_15_00"); //È accaduto qualcosa di particolare, ultimamente?
	if (other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_01"); //Sì, hanno lasciato entrare qualcuno come te. Una cosa del genere non succedeva da anni.
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_02"); //Dovresti saperlo bene. Come membro della guardia cittadina è tuo compito vigilare sulla legge e l'ordine!
	}
	else //KdF oder NOV
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_03"); //No.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lothar_PICKPOCKET (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 900;
	condition	= DIA_Lothar_PICKPOCKET_Condition;
	information	= DIA_Lothar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lothar_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Lothar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lothar_PICKPOCKET);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_BACK 		,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};
	
func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};





