// *****************************************************
// 							EXIT 
// *****************************************************
INSTANCE DIA_Harad_EXIT   (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 999;
	condition   = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Harad_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Harad_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *****************************************************
// 							Hallo
// *****************************************************
instance DIA_Harad_Hallo		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 2;
	condition	= DIA_Harad_Hallo_Condition;
	information	= DIA_Harad_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
func int DIA_Harad_Hallo_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Harad_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Harad_Hallo_12_00"); //(irritato) Cosa vuoi?
};

// *****************************************************
// 							Arbeit
// *****************************************************
instance DIA_Harad_Arbeit		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Arbeit_Condition;
	information	= DIA_Harad_Arbeit_Info;
	permanent   = FALSE;
	description = "Sto cercando lavoro.";
};
func int DIA_Harad_Arbeit_Condition ()
{
	return TRUE;
};
func void DIA_Harad_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Harad_Arbeit_15_00"); //Sto cercando del lavoro.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_01"); //Mmmh, potrebbe servirmi un nuovo apprendista.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_02"); //Brian terminerà presto il suo apprendistato, e poi lascerà la città.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_03"); //Sei in grado di fare qualcosa?
	AI_Output (other, self, "DIA_Harad_Arbeit_15_04"); //Se intendi se conosco il lavoro del fabbro...
	AI_Output (self, other, "DIA_Harad_Arbeit_12_05"); //No. Non è quello che intendo.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_06"); //Prima o poi, gli orchi arriveranno ad assediare la città, e allora i soli uomini che conteranno saranno quelli in grado di difendere la città.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Harad_Arbeit_12_07"); //E io non prenderò come apprendista qualcuno che mi disonori scappando dalla città insieme alle donne e ai buoni a nulla, invece di resistere qui con gli altri uomini.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Se riesco a convincere Harad che non sono un fannullone, mi accetterà come apprendista.");
};

// *****************************************************
// 						MIS_Orc
// *****************************************************
instance DIA_Harad_Taugenichts (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Taugenichts_Condition;
	information	= DIA_Harad_Taugenichts_Info;
	permanent   = FALSE;
	description = "Non sono un buono a nulla!";
};
func int DIA_Harad_Taugenichts_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};
func void DIA_Harad_Taugenichts_Info ()
{
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_00"); //Non sono un buono a nulla!
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_01"); //Sono parole grosse. Puoi dimostrarle con grandi gesta?
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_02"); //Dove vuoi arrivare?
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_03"); //Portami un'arma degli orchi.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_04"); //Degli orchi sono stati avvistati vicino alla città. Con un po' di fortuna, non dovrai cercare a lungo.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_05"); //Se riuscirai ad abbatterne uno, ti prenderò come apprendista.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_06"); //Sempre che gli altri maestri siano d'accordo.
	
	MIS_Harad_Orc = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HaradOrk,LOG_RUNNING);
	B_LogEntry (TOPIC_HaradOrk,"C'è un orco fuori dalla città. Harad il fabbro vuole che lo uccida. Un'arma orchesca sarà la prova.");
};

// *****************************************************
// 						Orc Running
// *****************************************************
instance DIA_Harad_OrcRunning (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcRunning_Condition;
	information	= DIA_Harad_OrcRunning_Info;
	permanent   = FALSE;
	description = "Parliamo di nuovo della questione dell’orco...";
};
func int DIA_Harad_OrcRunning_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	&& (Harad_HakonMission == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Harad_OrcRunning_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_15_00"); //Parliamo di nuovo della questione sull’orco...
	AI_Output (self, other, "DIA_Harad_OrcRunning_12_01"); //(brusco) Cosa?
	
	Info_ClearChoices (DIA_Harad_OrcRunning);	
	Info_AddChoice (DIA_Harad_OrcRunning, "Il tuo orco è spacciato!", DIA_Harad_OrcRunning_Done);
	Info_AddChoice (DIA_Harad_OrcRunning, "Un orco è un avversario maledettamente ostico...", DIA_Harad_OrcRunning_TooHard);

	//AI_Output (self, other, "DIA_Harad_OrcRunning_12_02"); //Ah, ich verstehe schon. Du hast Wichtigeres zu tun. Schon in Ordnung, die Sache hat sich erledigt.
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_00"); //Ma un orco è un avversario dannatamente tosto...
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_01"); //Mmmh... guardandoti bene, potresti aver ragione. Non hai molta carne su quelle ossa. Ma questo si può cambiare.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_02"); //Ad ogni modo, dovrai dimostrarmi che possiedi il coraggio necessario per combattere.
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_03"); //Non potrebbe essere qualcosa di un pochino più piccolo?
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_04"); //Mmmh... (riflettendo) Hakon, il mercante d'armi del mercato, mi ha detto che è stato attaccato dai briganti qualche giorno fa.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_05"); //Si dice che quei maledetti si aggirino nella zona fuori dal cancello est.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_06"); //Quei codardi non dovrebbero essere terribilmente svegli.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_07"); //Trova quei bastardi! Ogni singolo brigante. Allora saprò che potrai esserci utile qui in città.
	
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	
	if (MIS_HakonBandits != LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Lehrling, "Harad mi ha raccontato dei briganti che hanno rapinato il mercante Hakon fuori città. Se riesco a trovarli, si convincerà che sono in gamba. Dovrei parlare con Hakon, forse sa qualcosa di più su dove possano trovarsi questi briganti.");
	}
	else
	{
		B_LogEntry (TOPIC_Lehrling, "Harad mi ha raccontato dei briganti che hanno rapinato il mercante Hakon fuori città. Se riesco a trovarli, si convincerà che sono in gamba.");
	};
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_Done_15_00"); //Il tuo orco è spacciato!
	AI_Output (self, other, "DIA_Harad_OrcRunning_Done_12_01"); //Bene! Allora smettila di sprecare fiato e lascia che siano le tue gesta a parlare al posto tuo.
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

// *****************************************************
// 						Orc Success
// *****************************************************
instance DIA_Harad_OrcSuccess (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcSuccess_Condition;
	information	= DIA_Harad_OrcSuccess_Info;
	permanent   = FALSE;
	description = "Ho l’arma dell’orco che volevi.";
};
func int DIA_Harad_OrcSuccess_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	{
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_OrcSuccess_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcSuccess_15_00"); //Ho l’arma dell’orco che volevi.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_01"); //Fammi vedere...
	
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_01, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_02, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_03, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_04, 1);
		}
		else //if (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcSword_01, 1);
		};
	
	if (Harad_HakonMission == TRUE)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_02"); //Ce l'hai fatta veramente? Bravo ragazzo!
	};
	
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_03"); //È da parecchio che non mi trovavo tra le mani un'arma del genere, ero un soldato ai tempi della Guerra degli Orchi.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_04"); //Quelli erano tempi duri, te lo dico io.
	
	if (Player_IsApprentice == APP_Harad)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_05"); //Sapevo che c'era una ragione per prenderti come apprendista. Ben fatto!
	}
	else if (Player_IsApprentice == APP_NONE) 
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_06"); //Non pensavo che avresti potuto farcela. Sono impressionato.
	}
	else //anderer Weg
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_07"); //Peccato che tu abbia deciso di intraprendere un'altra strada.
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_08"); //Mi saresti stato molto utile.
	};
	
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP (XP_Harad_Orc);
	B_LogEntry (Topic_Lehrling,"Harad mi accetterà come apprendista se riuscirò ad avere l'approvazione degli altri mastri.");
};

// *****************************************************
// 						LEHRLING	(PERM)
// *****************************************************
var int Harad_StartGuild;
// ----------------------

instance DIA_Harad_LEHRLING (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_LEHRLING_Condition;
	information	= DIA_Harad_LEHRLING_Info;
	permanent   = TRUE;
	description = "Quando posso iniziare come tuo apprendista?";
};
func int DIA_Harad_LEHRLING_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Harad_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Harad_LEHRLING_15_00"); //Quando posso iniziare come tuo apprendista?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		// ------ Harad ------
		if (MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_01"); //Abbiamo sempre bisogno di un uomo in grado di battere un orco qui.
			
			if (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_02"); //Inoltre, Hakon mi ha detto che hai sistemato la storia dei briganti. Bravo ragazzo!
			};
		}
		else //HakonBandits SUCCESS
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_03"); //Non hai ucciso un orco, ma Hakon mi ha raccontato di come hai sistemato la storia briganti. Bravo ragazzo!
		};
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_04"); //Per quanto mi riguarda, puoi iniziare anche subito.
				
		stimmen = stimmen + 1;
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_05"); //Per quanto riguarda gli altri maestri...
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_06"); //Thorben ti ha dato la sua benedizione.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_07"); //Il buon vecchio Thorben vuole che tu ottenga la benedizione degli dei. Penso sia una buona idea.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_08"); //Thorben dice che non ha mai parlato con te.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_09"); //Bosper ha cercato di convincermi. Ti vuole come apprendista lui stesso.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_10"); //Ho avuto una breve, ma intensa, discussione con lui al riguardo.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_11"); //Alla fine ha accettato.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_12"); //Mi ha chiesto di dargli almeno la possibilità di cercare di interessarti alla sua professione.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_13"); //Dacci un'occhiata, puoi sempre decidere in seguito. A meno che tu voglia rinunciare al suo voto, si intende.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_14"); //E Bosper non ti conosce ancora.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_15"); //Come al solito, Constantino non si interessa di nulla. Ha detto che per quanto gli riguarda puoi cominciare quando vuoi.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_16"); //Constantino dice che sei accusato di un crimine qui in città, è vero?
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_17"); //In tal caso, dovresti sistemare la tua posizione immediatamente!
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_18"); //Constantino non ha mai sentito parlare di te.
		};
		
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_19"); //E Matteo dice che gli hai riportato il suo oro. Mi pare tu sia un giovane onorevole.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_20"); //E Matteo dice che gli devi ancora qualcosa. Non so cosa ci sia tra di voi, ma faresti meglio a sistemare la cosa.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_21"); //E Matteo dice che non ha mai parlato con te di questo.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_22"); //E Matteo dice che non ti ha mai visto nel suo negozio.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_23"); //Questo significa che hai l'approvazione di tutti i maestri!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_24"); //Questo significa che hai l'approvazione di quattro maestri. È abbastanza per essere accettato come apprendista.
			};
			
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_25"); //Sei pronto per iniziare il tuo apprendistato con me?
			
			Info_ClearChoices (DIA_Harad_LEHRLING);
			Info_AddChoice (DIA_Harad_LEHRLING, "Bene... ci penserò su.", DIA_Harad_LEHRLING_Later);
			Info_AddChoice (DIA_Harad_LEHRLING, "Accetto!", DIA_Harad_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_26"); //Hai bisogno dell'approvazione di almeno quattro maestri per essere accettato come apprendista nella parte bassa della città.
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_27"); //Dunque dovresti parlare con tutti quelli che non sono ancora convinti.
		};
	}
	else //Mission nicht erfüllt
	{
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_28"); //Non prima che tu mi abbia dimostrato che vali qualcosa.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_00"); //Accetto!
	AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_01"); //Bene! Ti insegnerò come forgiare una spada decente.
	
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_02"); //So già farlo!
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_03"); //Bene, ancora meglio!
	};
	
	if (other.attribute[ATR_STRENGTH] < (T_MED-30))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_04"); //Oltre a quello, è ora che tu diventi un po' più forte. Mi sembri così sciupato!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Harad_StartGuild = other.guild;
	
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("schmied", GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_LogEntry (Topic_Bonus,"Harad mi ha accettato come apprendista: ora ho accesso ai quartieri alti.");
	B_LogEntry (Topic_Bonus,"Harad comprerà le armi che forgio per un buon prezzo.");
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_CityTeacher, "Harad può insegnarmi l'arte del fabbro. Inoltre, può aiutarmi a divenire più forte.");
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_Later_15_00"); //Bene... ci penserò su.
	if (!Npc_IsDead (Brian))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_Later_12_01"); //Fai con calma. Brian starà qui ancora per un po'.
	};
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

// *****************************************************
// 						Zustimmung
// *****************************************************
instance DIA_Harad_Zustimmung		(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  2;
	condition	 = 	DIA_Harad_Zustimmung_Condition;
	information	 = 	DIA_Harad_Zustimmung_Info;
	permanent    =  TRUE;
	description	 = 	"Posso prestare servizio come apprendista con un altro maestro?";
};

func int DIA_Harad_Zustimmung_Condition ()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

//------------------------------------
var int DIA_Harad_Zustimmung_Permanent;
//------------------------------------

func void DIA_Harad_Zustimmung_Info ()
{
	AI_Output (other, self, "DIA_Harad_Zustimmung_15_00"); //Posso prestare servizio come apprendista con un altro maestro?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_01"); //Sei un uomo valido.
		if (MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_02"); //Hakon mi ha raccontato di come ti sei occupato dei briganti.
		};
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_03"); //Ti darò la mia approvazione.
		
		if (DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP (XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		B_LogEntry (Topic_Lehrling,"Harad darà la sua approvazione qualora dovessi fare l'apprendista da qualche parte.");
		
		if (!Npc_IsDead(Brian))
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_04"); //Brian starà qui ancora per un po'. Una persona forte per prendere il suo posto spunterà sicuramente fuori col tempo.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_05"); //Per quanto riguarda gli altri maestri... Gli altri maestri potranno anche approvare, ma io ti darò la mia approvazione solamente quando mi avrai dimostrato che sei capace di fare qualcosa.
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Harad_MILKommentar;
	var int Harad_PALKommentar;
	var int Harad_INNOSKommentar;
// ----------------------------------

instance DIA_Harad_AlsLehrling (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 1;
	condition   = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Harad_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Harad)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Harad_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Harad_StartGuild != GIL_MIL)
	&& (Harad_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_00"); //Sei nell'esercito ora? Sono fiero di te!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_01"); //Fino a quando sarai nell'esercito, naturalmente, non mi aspetterò che tu adempia anche ai tuoi doveri di apprendista.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_02"); //Ma se hai bisogno di qualcosa, puoi venire da me in qualsiasi momento.
		Harad_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Harad_StartGuild != GIL_PAL)
	&& (Harad_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_03"); //Sei riuscito a farti accettare nei paladini!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_04"); //Sono felice di averti preso come apprendista. Anche se non hai trascorso molto tempo dietro l'incudine.
		
		Harad_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Harad_StartGuild != GIL_NOV)
	&& (Harad_StartGuild != GIL_KDF)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_05"); //Dunque sei entrato a far parte del monastero. Avrei preferito che tu fossi rimasto in città. Abbiamo bisogno di ogni uomo valido.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_06"); //Ma se hai dovuto seguire la chiamata di Innos, non c'è altro da fare.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_07"); //Se hai bisogno di qualcosa, io sono qui per te.
		Harad_INNOSKommentar = TRUE;
	}
	
	else if (Harad_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Harad_MILKommentar == FALSE)
	&& (Harad_PALKommentar == FALSE)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_08"); //È passato parecchio tempo dall'ultima volta che sei venuto qui. Dove sei stato, mmh?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_09"); //Eccoti ancora qui...
		Harad_Lehrling_Day = Wld_GetDay();
	};
};

// *****************************************************
// 					Verkaufst du Waffen?
// *****************************************************
instance DIA_Harad_Waffen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Waffen_Condition;
	information	 = 	DIA_Harad_Waffen_Info;
	permanent    =  FALSE;
	description	 = 	"Vendi anche le armi?";
};
func int DIA_Harad_Waffen_Condition ()
{	
	if (Kapitel == 1)
	{
		return TRUE;
	};
};
func void DIA_Harad_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Waffen_15_00"); //Vendi anche le armi?
	AI_Output (self, other, "DIA_Harad_Waffen_12_01"); //Scordatelo. Tutto quello che produco è destinato ai paladini o all'esercito.
	AI_Output (self ,other, "DIA_Harad_Add_12_00"); //Ho un ordine di 100 spade da parte di Lord Hagen. Vuole equipaggiare la guardia cittadina.
};

// *****************************************************
// 					Aufgaben als Lehrling
// *****************************************************
instance DIA_Harad_Aufgaben	(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  1;
	condition	 = 	DIA_Harad_Aufgaben_Condition;
	information	 = 	DIA_Harad_Aufgaben_Info;
	permanent    =  FALSE;
	description	 = 	"Quali sono i miei compiti come apprendista?";
};

func int DIA_Harad_Aufgaben_Condition ()
{	
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};
func void DIA_Harad_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_00"); //Quali sono i miei compiti come apprendista?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_01"); //Tre ipotesi.
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_02"); //Forgiare, forgiare e forgiare?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_03"); //Non sei così stupido come sembri. Pago per ogni lama. Se non lavori, niente soldi. È semplice.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_05"); //Inoltre, ti insegnerò tutto quello che dovrai sapere per fabbricare una spada semplice.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_06"); //Forgiare le lame magiche è qualcosa riservato solamente ai fabbri più esperti e ti manca ancora molta strada per quello...
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_07"); //Se ti serve un posto per dormire, puoi riposarti da qualche parte a casa mia. Tutto chiaro finora?
};

// ************************************************************
// 						Klingen verkaufen
// ************************************************************
instance DIA_Harad_SellBlades (C_INFO)
{
	npc			 = VLK_412_Harad;
	nr			 = 200;
	condition	 = DIA_Harad_SellBlades_Condition;
	information	 = DIA_Harad_SellBlades_Info;
	permanent    = TRUE;
	description	 = "Voglio vendere le armi che ho forgiato.";
};
func int DIA_Harad_SellBlades_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};
func void DIA_Harad_SellBlades_Info ()
{
	AI_Output (other, self, "DIA_Harad_SellBlades_15_00"); //Voglio vendere le armi che ho forgiato.
	
	var C_ITEM equipWeap; equipWeap = Npc_GetEquippedMeleeWeapon(other);
	
	var int anzahl_common; anzahl_common = Npc_HasItems (other, ItMw_1H_Common_01);
	if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE) { anzahl_common = anzahl_common - 1; };
	var int anzahl_schwert1; anzahl_schwert1 = Npc_HasItems (other, ItMw_Schwert1);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) { anzahl_schwert1 = anzahl_schwert1 - 1; };
	var int anzahl_schwert4; anzahl_schwert4 = Npc_HasItems (other, ItMw_Schwert4);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE) { anzahl_schwert4 = anzahl_schwert4 - 1; };
	var int anzahl_rubinklinge; anzahl_rubinklinge = Npc_HasItems (other, ItMw_Rubinklinge);
	if (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE) { anzahl_rubinklinge = anzahl_rubinklinge - 1; };
	var int anzahl_elbastardo; anzahl_elbastardo = Npc_HasItems (other, ItMw_ElBastardo);
	if (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE) { anzahl_elbastardo = anzahl_elbastardo - 1; };
	
	var int gesamt; gesamt = (anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo);
	
    if (gesamt == 0)
	{
		if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) 
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE)  
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_01"); //Tutto quello che hai è l'arma al tuo fianco. Farai meglio a tenerla.
		}
		else
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_04"); //Allora forgiane qualcuna! Accetterò solamente spade semplici.
		};
	}
	else //(gesamt >= 1) - die verbeliebenden Klingen verkaufen ------
	{
		AI_Output (self, other, "DIA_Harad_SellBlades_12_02"); //Bene, da' qua.
		
		Npc_RemoveInvItems (other, ItMw_1H_Common_01, anzahl_common);
		Npc_RemoveInvItems (other, ItMw_Schwert1, anzahl_Schwert1);
		Npc_RemoveInvItems (other, ItMw_Schwert4, anzahl_Schwert4);
		Npc_RemoveInvItems (other, ItMw_Rubinklinge, anzahl_Rubinklinge);
		Npc_RemoveInvItems (other, ItMw_ElBastardo, anzahl_ElBastardo);
		
				var string concatText;
				concatText = ConcatStrings(IntToString(gesamt), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
				AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
				
		AI_Output (self, other, "DIA_Harad_SellBlades_12_03"); //D'accordo, ecco la tua paga.
		var int lohn;
		lohn 	= (anzahl_common * Value_Common1)
				+ (anzahl_schwert1 * Value_Schwert1)
				+ (anzahl_schwert4 * Value_Schwert4)
				+ (anzahl_rubinklinge * Value_Rubinklinge)
				+ (anzahl_elbastardo * Value_ElBastardo);
				
		lohn 	= (lohn / 3);
		
		B_GiveInvItems (self, other, itmi_gold, lohn);
	};
};
	
// ************************************************************
// 						Weapon_Common Lehrer
// ************************************************************
func void B_Harad_TeachSmith()
{
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_01"); //È abbastanza facile, ragazzo. Prendi un pezzo di acciaio grezzo e tienilo sul fuoco fino a quando non sarà incandescente.
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_02"); //Poi martella la lama sull'incudine dandole la forma.
};
// ------------------------------------------------------------
func void B_HaradSmithChoices()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
	Info_AddChoice	(DIA_Harad_TeachSmith, DIALOG_BACK, DIA_Harad_TeachSmith_BACK);
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_04))		,DIA_Harad_TeachSmith_Harad04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_03))		,DIA_Harad_TeachSmith_Harad03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_02))		,DIA_Harad_TeachSmith_Harad02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_01))		,DIA_Harad_TeachSmith_Harad01);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice	(DIA_Harad_TeachSmith, B_BuildLearnString("Apprendi come forgiare"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Harad_TeachSmith_Common);
	};
};
// ------------------------------------------------------------
instance DIA_Harad_TeachSmith (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  50;
	condition	 = 	DIA_Harad_TeachSmith_Condition;
	information	 = 	DIA_Harad_TeachSmith_Info;
	permanent    =  TRUE;
	description	 = 	"Insegnami come si forgia una spada decente.";
};

func int DIA_Harad_TeachSmith_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Harad_TeachCommon_15_00"); //Insegnami come si forgia una spada decente.
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
};
func void DIA_Harad_TeachSmith_Common()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_Common)
	{
		B_Harad_TeachSmith();
		AI_Output (self, other, "DIA_Harad_TeachCommon_12_03"); //Le tue prime spade non saranno dei capolavori, ma potrai imparare il resto più tardi.
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad01()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_01)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad02()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_02)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad03()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_03)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad04()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_04)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};

// ************************************************************
// 							STR Lehrer bis 50
// ************************************************************
// -------------------------
	var int Harad_Merke_STR;
// -------------------------	

INSTANCE DIA_Harad_TeachSTR (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 100;
	condition	= DIA_Harad_TeachSTR_Condition;
	information	= DIA_Harad_TeachSTR_Info;
	permanent	= 1;
	description = "Voglio diventare più forte!";
};                       

FUNC INT DIA_Harad_TeachSTR_Condition()
{
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Harad_TeachSTR_Info()
{	
	AI_Output (other, self, "DIA_Harad_TeachSTR_15_00"); //Voglio diventare più forte!
	
	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if (Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_01"); //Hai già messo su un po' di muscoli.
	};

	if (other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_02"); //Torna quando vorrai imparare ancora.
	};
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};

// ------ 5 Stärke ------
func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};




//############################
//##						##
//##		Kapitel 2		##
//##						##
//############################

// *****************************************************
// 					Immer noch
// *****************************************************
instance DIA_Harad_ImmerNoch (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_ImmerNoch_Condition;
	information	 = 	DIA_Harad_ImmerNoch_Info;
	permanent    =  FALSE;
	description	 = 	"Lavori ancora per i paladini?";
};
func int DIA_Harad_ImmerNoch_Condition ()
{	
	if (Kapitel >= 2)
	{
		return TRUE;
	};	
};

func void DIA_Harad_ImmerNoch_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_01"); //Lavori ancora per i paladini?
	AI_Output (self ,other,"DIA_Harad_Add_12_02"); //Ho terminato l'ordine di Lord Hagen.
	AI_Output (self ,other,"DIA_Harad_Add_12_03"); //Ora sto producendo delle lame di metallo magiche per lui, ma stavolta in cambio di soldi.
	AI_Output (self ,other,"DIA_Harad_Add_12_04"); //Ma ho finalmente il tempo di fabbricare alcune armi per i negozianti del mercato.
	AI_Output (self ,other,"DIA_Harad_Add_12_05"); //Quindi, se stai cercando una buona lama, dovresti provare da loro.
};

// *****************************************************
// 					About Erzklingen
// *****************************************************
instance DIA_Harad_AboutErzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_AboutErzklingen_Condition;
	information	 = 	DIA_Harad_AboutErzklingen_Info;
	permanent    =  FALSE;
	description	 = 	"Parlami ancora delle lame di metallo magiche!";
};
func int DIA_Harad_AboutErzklingen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};	
};

func void DIA_Harad_AboutErzklingen_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_06"); //Parlami ancora delle lame di metallo magiche!
	AI_Output (self, other, "DIA_Harad_Waffen_12_02"); //Creare una lama magica è un processo veramente complesso e dispendioso, ma il risultato è una lama che è facile da maneggiare e praticamente indistruttibile.
	AI_Output (self, other, "DIA_Harad_Waffen_12_03"); //La lama è certamente di buona qualità, ma mostrerà il tuo vero potere solo nelle mani di un paladino.
	AI_Output (self, other, "DIA_Harad_Waffen_12_04"); //La spada di un paladino è consacrata da Innos. Come risultato, la lama magica diventa un'arma incantata che infligge danni incomparabili!
};

// *****************************************************
// 					Ich möchte eine Erzklinge kaufen
// *****************************************************
instance DIA_Harad_Erzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Erzklingen_Condition;
	information	 = 	DIA_Harad_Erzklingen_Info;
	permanent    =  TRUE;
	description	 = 	"Voglio comprare una lama di metallo magica.";
};
func int DIA_Harad_Erzklingen_Condition ()
{	
	if (OreBladeBought == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};	
};

//---------------------------------------------

var int OreBladeBought;

//---------------------------------------------

func void DIA_Harad_Erzklingen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Erzklingen_15_00"); //Voglio comprare una lama di metallo magica.
	if (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_01"); //Posso vendere le lame magiche solamente ai paladini. E anche allora, solo una a testa.
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_02"); //Voi paladini potete considerarvi fortunati a poter brandire delle lame così eccellenti.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_03"); //Per decreto di Lord Hagen, posso venderti una sola arma magica.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_04"); //Dunque, cosa ti posso offrire?
		
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Spada a due mani (2000 monete d’oro)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Spada a una mano (2000 monete d’oro)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC void B_Harad_NotEnoughGold ()
{
	AI_Output (self ,other,"B_Harad_NotEnoughGold_12_00"); //Non hai abbastanza oro.
};

FUNC VOID B_Harad_HaveFunWithYourSword ()
{
	AI_Output (self,other,"B_Harad_HaveGunWithYourSword_12_00"); //Prenditi cura della tua nuova arma. Vale una fortuna.
	
	OreBladeBought = TRUE;
	
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC VOID DIA_Harad_Erzklingen_2h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_2h_15_00"); //Prenderò la spada a due mani!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_2H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_2H_1);
		CreateInvItems (self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_2H_Blessed_01,1);
	
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Spada a due mani (2000 monete d’oro)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Spada a una mano (2000 monete d’oro)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_1h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_1h_15_00"); //Prenderò la spada a una mano!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_1H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_1H_1);
		CreateInvItems (self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_1H_Blessed_01,1);
		
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Spada a due mani (2000 monete d’oro)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Spada a una mano (2000 monete d’oro)",DIA_Harad_Erzklingen_1h);
	};
};



//############################
//##						##
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Harad_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_RepairNecklace_Condition;
	information	 = 	DIA_Harad_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ripari gioielli?";
};

func int DIA_Harad_RepairNecklace_Condition ()
{
	if 	((MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	 ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||    (MIS_SCKnowsInnosEyeIsBroken  == TRUE))) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_RepairNecklace_Info ()
{
	AI_Output (other,self ,"DIA_Harad_RepairNecklace_15_00"); //Ripari gioielli?
	AI_Output (self	,other,"DIA_Harad_RepairNecklace_12_01"); //Sono un armaiolo, non un gioielliere. Probabilmente non troverai nessuno qui in città che ti possa aiutare.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_02"); //La gente non ha più soldi in tasca, e nessuno si arricchirà per un bel po'.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_03"); //La maggior parte di loro sono solo felici di avere abbastanza per mangiare.
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//	Wo finde ich einen Goldschmied?
//*********************************************************************
instance DIA_Harad_Goldsmith		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_Goldsmith_Condition;
	information	 = 	DIA_Harad_Goldsmith_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dove posso trovare un orefice?";
};

func int DIA_Harad_Goldsmith_Condition ()
{
	if 	(Npc_KnowsInfo (other,DIA_Harad_RepairNecklace)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_Goldsmith_Info ()
{
	AI_Output (other,self ,"DIA_Harad_Goldsmith_15_00"); //Dove posso trovare un orefice?
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_01"); //Dovrebbe esserci un buon fabbro con i mercenari alla fattoria di Onar.
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_02"); //Forse dovresti cercare lì.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Harad_PICKPOCKET (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 900;
	condition	= DIA_Harad_PICKPOCKET_Condition;
	information	= DIA_Harad_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Harad_PICKPOCKET_Condition()
{
	C_Beklauen (14, 35);
};
 
FUNC VOID DIA_Harad_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Harad_PICKPOCKET);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_BACK 		,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};
	
func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};


