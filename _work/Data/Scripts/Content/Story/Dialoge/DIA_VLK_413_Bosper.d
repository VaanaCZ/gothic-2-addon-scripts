// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Bosper_EXIT   (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 999;
	condition   = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 							Hallo
// ***********************************************************
instance DIA_Bosper_HALLO		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr			 =  2;
	condition	 = 	DIA_Bosper_HALLO_Condition;
	information	 = 	DIA_Bosper_HALLO_Info;
	permanent    =  FALSE;
	important    =  TRUE;
};
func int DIA_Bosper_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Bosper_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //Benvenuto nel mio negozio, straniero!
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Io sono Bosper. Fabbrico archi e vendo pelli.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Cosa ti porta a Khorinis?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper fabbrica archi e commercia pelli. Il suo negozio è al cancello est, nei bassifondi della città.");
};

// ***********************************************************
// 						 	IntoOV		//e1
// ***********************************************************
instance DIA_Bosper_IntoOV		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 1;
	condition	= DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent   = FALSE;
	description = "Devo raggiungere i quartieri alti...";
};
func int DIA_Bosper_IntoOV_Condition ()
{	
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Bosper_IntoOV_Info ()
{
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Devo raggiungere i quartieri alti...
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //Dove stanno i paladini? Dimenticatelo.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Devi essere un rispettabile cittadino, o almeno avere un lavoro decente.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //In quanto straniero, non hai nessuna possibilità di entrare.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //L'ho notato...
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Per conquistare l'accesso ai quartieri alti, devo prima diventare un rispettabile cittadino o trovarmi un lavoro.");
};

// ***********************************************************
// 						 	SeekWork	//e1
// ***********************************************************
instance DIA_Bosper_SeekWork		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent   = FALSE;
	description = "Sto cercando lavoro.";
};
func int DIA_Bosper_SeekWork_Condition ()
{	
	return TRUE;
};
func void DIA_Bosper_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SeekWork_15_00"); //Sto cercando lavoro!
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Mmmh, potrebbe servirmi un nuovo apprendista.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //L'ultimo ha lasciato il lavoro due giorni fa.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //Sai qualcosa sulla caccia, quindi?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Beh...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Potrei insegnarti come scuoiare gli animali.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Ti pagherò bene per ogni pelle che mi porterai.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Posso portarti delle pelli, se è quello che vuoi.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //Eccellente! Portami più pelli di animali che puoi, te le comprerò a un buon prezzo.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper sta cercando un nuovo apprendista. Potrei lavorare per lui.");	
 
};

// ***********************************************************
// 						 	LEHRLING	//e2 PERM
// ***********************************************************
// ----------------------
var int Bosper_HintToJob;
var int Bosper_StartGuild;
// ----------------------

instance DIA_Bosper_LEHRLING		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent   = TRUE;
	description = "Voglio iniziare come tuo apprendista!";
};
func int DIA_Bosper_LEHRLING_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //Voglio iniziare come tuo apprendista!

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //(ghigno) Ottimo! Sembri già conoscere le basi.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad pensa che tu sia un uomo valido.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Ma Harad non è convinto delle tue abilità.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Ma Harad dice che non ti ha mai visto.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben ti ha dato la sua benedizione. Io non sono così pio, ma mi sta bene così.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben ti darà la sua approvazione con la benedizione degli dei.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben non ha idea di chi tu sia.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino dice che puoi iniziare quando vuoi, per quel che gli riguarda.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino dice che sei stato accusato di un crimine qui in città, spero si tratti di qualcosa di insignificante.
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Fai in modo che la faccenda sia chiarita.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino non ha mai sentito parlare di te.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //E Matteo dice che vali il tuo peso in oro.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //E Matteo ha menzionato alcuni debiti, qualunque cosa intendesse, faresti meglio a parlargli.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matteo dice che non ha parlato con te di questo.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matteo dice che non ti ha mai visto in vita sua.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //Questo significa che hai l'approvazione di tutti i maestri!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Hai l'approvazione di quattro maestri. Sarà sufficiente per essere accettato come apprendista.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Puoi lavorare per me quando vorrai.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Bene... ci penserò su.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Accetto!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Hai bisogno della approvazione di almeno quattro maestri per cominciare a fare apprendistato nella parte bassa della città.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //Questo significa che dovresti parlare con tutti quelli che non sono ancora convinti.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Prima che io ti prenda con me ho bisogno di sapere, naturalmente, se hai qualche capacità.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Mi hai riportato il mio arco, ma questo non dice molto sul tuo talento come cacciatore.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //Accetto!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Non te ne pentirai! Penso che potremo lavorare bene insieme.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper mi ha accettato come apprendista. Ora ho accesso ai quartieri alti.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //Bene... ci penserò su.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Non prendere la decisione sbagliata! Saresti perfetto per me.
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};
		
			
// ***********************************************************
// 						OtherMasters	 	//e2
// ***********************************************************
instance DIA_Bosper_OtherMasters (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent   = FALSE;
	description = "E se volessi prestare servizio con uno degli altri maestri?";
};
func int DIA_Bosper_OtherMasters_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //E se volessi prestare servizio con uno degli altri maestri?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //(stizzito) Sciocchezze!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad e Matteo hanno già degli apprendisti.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Constantino l'alchimista è un solitario e non ha preso con sé un apprendista per anni.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //E per quanto riguarda Thorben, tutti sanno che è uno spiantato, probabilmente non potrebbe nemmeno pagarti.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Io, d'altra parte, ho urgente bisogno di un apprendista e pago anche bene.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Ma non importa dove vuoi iniziare, ti serve l'approvazione di tutti gli altri maestri della parte bassa della città...
	
	
	
};

// ***********************************************************
// 							Bartok	 	//e2
// ***********************************************************
instance DIA_Bosper_Bartok (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 4;
	condition	= DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent   = FALSE;
	description = "Perché il tuo apprendista se n’è andato?";
};
func int DIA_Bosper_Bartok_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};
func void DIA_Bosper_Bartok_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //Perché il tuo apprendista se n’è andato?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Ha solo detto che era diventato troppo pericoloso là fuori.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Se sei veramente interessato, puoi chiederglielo tu stesso.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Il suo nome è Bartok. Probabilmente lo troverai vicino alla taverna di Coragon.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Attraversa il sottopassaggio dalla fucina e te la troverai di fronte.
};

// ***********************************************************
// 						ZUSTIMMUNG		 	//e3   PERM
// ***********************************************************

instance DIA_Bosper_ZUSTIMMUNG (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "Accetterai che io presti servizio con un altro maestro?";
};
func int DIA_Bosper_ZUSTIMMUNG_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info ()
{
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //Accetterai che io presti servizio con un altro maestro?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //(deluso) Speravo avresti scelto me.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Ma se hai deciso così...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //Vuol dire che voterai per me?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Se nessuno degli altri maestri si oppone, sì.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //Mi hai riportato il mio arco, dopo tutto.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Ma saresti sicuramente stato un buon cacciatore.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Bosper darà la sua approvazione qualora dovessi fare l'apprendista da qualche parte.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //(sospira) D'accordo! Avrai la mia approvazione, ma a una condizione.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Lavora per me, almeno per un breve periodo.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //In questo modo potrai scoprire da solo se ti piace o meno il mio mestiere.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //E chi lo sa, forse finirà per piacerti, e resterai con me.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //Se sei abbastanza abile per unirti a ME, sei anche abbastanza abile per tutti gli altri qui.
		Bosper_HintToJob = TRUE;
	};	
};

// ***********************************************************
// 							Job		 	//e3
// ***********************************************************
instance DIA_Bosper_Job (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent   = FALSE;
	description = "Cosa vuoi che faccia per te?";
};
func int DIA_Bosper_Job_Condition ()
{	
	if (Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Job_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Cosa vuoi che faccia per te?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Ti insegnerò come scuoiare un animale e mi porterai... diciamo... una mezza dozzina di pelli di lupo.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper può insegnarmi a scuoiare animali.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Portami una mezza dozzina di pelli di lupo.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Allora saprò che hai imparato il tuo mestiere.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Se non ci impiegherai una vita e se le pelli saranno in condizioni accettabili, ti prenderò con me se lo desidererai.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Oppure (sospira) potrai iniziare con uno degli altri maestri, se è quello che vuoi veramente.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Devo portare sei pelli di lupo a Bosper. Solo allora potrò lavorare per lui o ricevere la sua approvazione per lavorare con gli altri mastri.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Dovrei farmi insegnare a scuoiare animali.");
	};
};

// ***********************************************************
// 					Ich hab deine Felle	 	//e4
// ***********************************************************
instance DIA_Bosper_BringFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 102;
	condition	= DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent   = TRUE;
	description = "Riguardo alle pelli di lupo...";
};
func int DIA_Bosper_BringFur_Condition ()
{	
	if (MIS_Bosper_WolfFurs == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BringFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //Riguardo alle pelli di lupo...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //Sei già l'apprendista di un altro maestro ora. Ti comprerò le pelli a prezzo normale.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Le ho prese, tieni.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Ottimo! Sapevo che saresti stato adatto a questo lavoro.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //Ecco la paga che ti avevo promesso.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //E...? Cosa ne pensi? Non è forse un lavoro migliore, rispetto a battere tutto il giorno una spada o riempire bottigliette in una stanza polverosa?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper mi accetterà come apprendista se gli altri mastri approvano.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Abbiamo stabilito una mezza dozzina, ma hai ancora tempo. Portami quelle pelli.
	};

};

// ***********************************************************
// 							TeachFUR		 	//e4
// ***********************************************************
instance DIA_Bosper_TeachFUR (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent   = TRUE;
	description = "Insegnami a scuoiare gli animali! (5 LP)";
};
func int DIA_Bosper_TeachFUR_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_Job))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_TeachFUR_Info ()
{
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Insegnami come scuoiare gli animali!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //D'accordo, ascolta. È abbastanza facile, davvero.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Prendi una lama affilata e apri la pancia dell'animale. Poi fai delle piccole incisioni nell'interno delle gambe, e puoi rimuovere la pelle.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Portami le pelli di lupo e poi vedremo...
			B_LogEntry (TOPIC_BosperWolf,"Bosper mi ha insegnato a scuoiare animali.");
		};
	};
};

// **************************************************************
// 							TRADE
// **************************************************************
instance DIA_Bosper_Trade		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  700;
	condition	 = 	DIA_Bosper_Trade_Condition;
	information	 = 	DIA_Bosper_Trade_Info;
	permanent	 = 	TRUE;
	description	 = 	"Mostrami la mercanzia.";
};
func int DIA_Bosper_Trade_Condition ()
{
	if (MIS_Bosper_WolfFurs != LOG_RUNNING)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	
	return TRUE;
};
func void DIA_Bosper_Trade_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Mostrami la mercanzia.
	
	if (DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv (self);
		//Joly: Mc ArrowBolt
		//////////////////////////////////////////////////////////////////////////////////////
		Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
		var int McBolzenAmount;
		McBolzenAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
		Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
		var int McArrowAmount;
		McArrowAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
		//////////////////////////////////////////////////////////////////////////////////////
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Non sei qui per guardare la mia merce, dovresti portarmi quelle pelli!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //Quindi mettiti al lavoro!
	};
};

// **************************************************************
// 						Von Bogen gehört
// **************************************************************
instance DIA_Bosper_BogenRunning (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  5;
	condition	 = 	DIA_Bosper_BogenRunning_Condition;
	information	 = 	DIA_Bosper_BogenRunning_Info;
	permanent	 = 	FALSE;
	description	 = "Ho sentito che qualcuno ti ha derubato.";
};
func int DIA_Bosper_BogenRunning_Condition ()
{	
	if (MIS_Bosper_Bogen == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenRunning_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //Ho sentito che qualcuno ti ha derubato.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //Chi te l'ha detto? Probabilmente Bartok, eh? Non aveva niente di meglio da dirti? Oh, beh.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //Lascia che ti dica, se metto le mani su quel bastardo, potrà dire le sue preghiere!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //Ho lasciato il negozio solo per un momento. Quando sono tornato, l'ho giusto visto scappare, con il mio arco in spalla.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //Ho subito chiamato le guardie, ma quel ladruncolo è corso via verso il porto. E lo hanno perso di vista laggiù.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //Li ho costretti ad agire, e hanno ispezionato l'intero distretto del porto. Ma non hanno trovato nulla.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //Quegli incompetenti!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //Scommetto che il mio arco è ancora in città da qualche parte. Ho informato le guardie di entrambi i cancelli cittadini, e non hanno visto nessuno andarsene con il mio arco.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //Quando metterò le mani su quel bastardo...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"Hanno rubato un arco a Bosper. Il ladro è scappato verso il porto, riuscendo a fuggire. L'esercito ha setacciato la zona ma non ha trovato nulla, sebbene si creda che l'arco sia ancora in città.");
};

// **************************************************************
// 						Bogen gefunden
// **************************************************************
instance DIA_Bosper_BogenSuccess (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  6;
	condition	 = 	DIA_Bosper_BogenSuccess_Condition;
	information	 = 	DIA_Bosper_BogenSuccess_Info;
	permanent	 = 	FALSE;
	description	 = "Credo che questo arco sia tuo...";
};
func int DIA_Bosper_BogenSuccess_Condition ()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenSuccess_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //Credo che questo arco sia tuo...
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //Il mio arco! Dove lo hai trovato?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //In un buco buio pieno di topi.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //Spero non sia andato a cacciarti nei guai...
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //No, ho già fatto queste cose in passato.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //Mmmh... grazie lo stesso. Ti sono debitore per questo!
	 
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems (self, ItRw_Bow_L_03_MIS,1); 
	
};

// **************************************************************
// 							PERM
// **************************************************************
//------------------------
	var int Bosper_Island;
//------------------------
instance DIA_Bosper_PERM		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  10;
	condition	 = 	DIA_Bosper_PERM_Condition;
	information	 = 	DIA_Bosper_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Come vanno le cose in città?";
};
func int DIA_Bosper_PERM_Condition ()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};
func void DIA_Bosper_PERM_Info ()
{
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Come vanno le cose in città?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Se gli orchi si faranno veramente vedere per assediarci, non sarà piacevole.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //C'è solo una nave e la sorvegliano i paladini. E non credo che la userebbero per salvare i cittadini.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Non c'è altro modo di andarsene da qui?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //No, nessuno di noi può lasciare l'isola senza una nave.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Non c'è niente di nuovo al momento. Ripassa più tardi.
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Bosper_MILKommentar;
	var int Bosper_PALKommentar;
	var int Bosper_INNOSKommentar;
// ----------------------------------

instance DIA_Bosper_AlsLehrling (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 1;
	condition   = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Bosper_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Bosper)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bosper_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Bosper_StartGuild != GIL_MIL)
	&& (Bosper_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Ti sei unito all'esercito, eh?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Non che mi importi. Fintanto che, a parte gli orchi e i briganti, vada anche a caccia di qualche lupo. (ghigno)
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Sembra che tu abbia fatto carriera. Paladino del re!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //Dovunque andrai, non dimenticarti del tuo vecchio maestro...
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Sei entrato a far parte del monastero, eh? Spero ti faranno uscire abbastanza da potermi portare alcune pelli...
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Dove sei stato per tutto questo tempo?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Mi servono altre pelli, ne hai portata qualcuna?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //Eccoti qui di nuovo...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};
	
// *******************************************************
//				 Aufgaben als Lehrling
// *******************************************************	
instance DIA_Bosper_Aufgaben (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 1;
	condition	= DIA_Bosper_Aufgaben_Condition;
	information	= DIA_Bosper_Aufgaben_Info;
	permanent	= FALSE;
	description	= "Quali sono i miei compiti come apprendista?";
};
func int DIA_Bosper_Aufgaben_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //Quali sono i miei compiti come apprendista?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //Facile. Portami tutte le pelli che troverai.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Ti pagherò un prezzo migliore rispetto a quanto ti darebbero gli altri mercanti.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //A parte questo, non devi presentarti qui in negozio. Posso cavarmela benissimo da solo.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //E dove dovrei dormire?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Non ho una stanza per te qui. Avranno sicuramente un letto per te nella locanda del mercato.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper pagherà dei soldi extra per le pelli di animali.");
};

// *******************************************************
//				 		SellFur
// *******************************************************	
// -----------------------------
	var int Bosper_TrollFurSold;
// -----------------------------

instance DIA_Bosper_SellFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 600;
	condition	= DIA_Bosper_SellFur_Condition;
	information	= DIA_Bosper_SellFur_Info;
	permanent	= TRUE;
	description	= "Ho qualche pelle per te...";
};
func int DIA_Bosper_SellFur_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_SellFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //Ho qualche pelle per te...
	
	if (Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(other, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
	{
		
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait (self,3);
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur) );
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
		};
		
		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Una pelle di pecora? Non avrai macellato la pecora di qualche contadino su ai pascoli, vero?
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //Non mi sognerei mai di farlo...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Pelle di lupo, bene...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //Una pelle di warg? Quelle bestiacce sono resistenti...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //Ah, persino una pelle di bestia d'ombra - queste valgono parecchio.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //Che diamine è QUESTA pelle?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Ho squartato un troll per quella.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //Questa... Questa vale una piccola fortuna.
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Un'altra gigantesca pelle di troll... stai forse cacciando quelle cose?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //Quando ne incontro uno, colgo l'opportunità...
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //E persino la pelle di un troll oscuro!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Ottimo lavoro. Torna quando ne avrai altre...
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Ma sai, sono interessato solamente alle pelli di lupo, di bestia d'ombra e simili...
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Bosper_Minenanteil (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_Minenanteil_Condition;
	information	= DIA_Bosper_Minenanteil_Info;

	description = "Vedo che hai messo in vendita le tue azioni della miniera.";
};   
                    
FUNC INT DIA_Bosper_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bosper_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Vedo che vendi quote minerarie.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Ehm, non ne so nulla. Puoi averle, se vuoi.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bosper_PICKPOCKET (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 900;
	condition	= DIA_Bosper_PICKPOCKET_Condition;
	information	= DIA_Bosper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Bosper_PICKPOCKET_Condition()
{
	C_Beklauen (67, 120);
};
 
FUNC VOID DIA_Bosper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bosper_PICKPOCKET);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_BACK 		,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};
	
func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};








