///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jora_EXIT   (C_INFO)
{
	npc         = VLK_408_Jora;
	nr          = 999;
	condition   = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent   = TRUE;
	description = "Devo andare!";
};

FUNC INT DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jora_EXIT_Info()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //Ehi! E i miei soldi?
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_Sperre_Condition;
	information	 = 	DIA_Jora_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Jora_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self,ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Jora_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Sei un detenuto della colonia mineraria. Non ti venderò nulla!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	700;
	condition	 = 	DIA_Jora_WAREZ_Condition;
	information	 = 	DIA_Jora_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Mostrami la mercanzia.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Mostrami la mercanzia.
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET		(C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 1;
	condition	= DIA_Jora_GREET_Condition;
	information	= DIA_Jora_GREET_Info;
	permanent 	= FALSE;
	important	= TRUE;
};
func int DIA_Jora_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GREET_Info ()
{
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Innos sia con te, straniero. Se stai cercando un buon assortimento per il viaggiatore, sei nel posto giusto.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Ma ti avverto: se intendi servirti senza pagare, chiamerò le guardie!
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //Aspetta un momento, ti sembro forse un ladro?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //(sprezzante) Bah! Non saresti il primo a fuggire con la mia merce oggi.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora vende armi di ogni tipo al mercato.");
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Bestohlen_Condition;
	information	 = 	DIA_Jora_Bestohlen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Qualcuno ti ha derubato?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //Qualcuno ti ha derubato?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //Non posso provarlo. Quel tizio è stato dannatamente furbo. Si è presentato come Rengaru, se questo è il suo vero nome.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //Sono alcuni giorni che si aggira per il mercato.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //E ogni sera si ubriaca alla bancarella della birra in fondo alla strada. Scommetto che il bastardo sta bevendo con i MIEI soldi!
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //Mi sono distratto solo un attimo, e il mio borsellino era sparito!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //Ascolta, se mi riporti il mio oro da quel Rengaru, ti dirò quello che so.
};


// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_HolDeinGold_Condition;
	information	 = 	DIA_Jora_HolDeinGold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Potrei recuperare il tuo oro.";
};
func int DIA_Jora_HolDeinGold_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};
func void DIA_Jora_HolDeinGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //Potrei recuperare il tuo oro.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //(diffidente) Oh? E perché mai dovresti farlo?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"Come ricompensa, voglio una parte dell’oro!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Sto cercando indizi che mi portino alla gilda dei ladri!", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Dipende... puoi aiutarmi raggiungere il quartiere più alto?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //Dipende... puoi aiutarmi ad accedere al quartiere più alto?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //(ride) Hai scelto l'uomo sbagliato. Vengo da fuori città, come la maggior parte dei mercanti qui.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Sei vuoi accedere ai quartieri alti, vai a parlare con i mercanti residenti nei bassifondi della città.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //Sto cercando indizi che mi portino alla gilda dei ladri!
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Potrei anche aiutarti.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Vedrò cosa posso fare.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Quanto oro c’era nella borsa?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Perché non hai chiamato la guardia cittadina?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //Come ricompensa, voglio una parte dell’oro!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Prima vediamo se riesci a riportarmi il borsellino. POI potremo parlare della tua ricompensa.
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Vedrò cosa posso fare.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Quanto oro c’era nella borsa?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Perché non hai chiamato la guardia cittadina?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //Perché non hai chiamato la guardia cittadina?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Le guardie accorrono solamente se un ladro è colto sul fatto.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //E quando ho notato che il mio borsellino era sparito, quel bastardo se n'era già andato!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //Quanto oro c’era nella borsa?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 pezzi d'oro è un bel gruzzoletto in questi tempi sventurati.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //Vedrò cosa posso fare.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //Fai attenzione! Se stendi quel bastardo, coinvolgerai le guardie della città.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //Ultimamente, la situazione si è fatta difficile qui. Da quando sono arrivati in città i paladini, le guardie hanno cominciato a prendere misure severe contro le risse.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Quindi, cerca di pensare a qualcosa...
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //Lo farò.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "Un tizio di nome Rengaru ha derubato il mercante Jora. Egli trascorre i suoi giorni intorno al mercato.");
	B_LogEntry (TOPIC_Jora, "Devo recuperare l'oro di Jora per lui.");
	B_LogEntry (TOPIC_JoraDieb, "Rengaru ha derubato il mercante Jora. Se riuscirò ad acciuffarlo, potrebbe esserci una ricompensa.");

	Info_ClearChoices 	(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_WegenDieb_Condition;
	information	 = 	DIA_Jora_WegenDieb_Info;
	permanent	 = 	TRUE;
	description	 = 	"Riguardo al ladro...";
};
func int DIA_Jora_WegenDieb_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_WegenDieb_Info ()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //Riguardo al ladro...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Sì, come sta andando? Lo hai preso? E, soprattutto, hai il mio oro?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Beh, ha avuto un incidente fatale.",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"Sì, sono riuscito a prenderlo.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Mi è sfuggito.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"Ci sto ancora lavorando!",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //Ci sto ancora lavorando!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //Allora cerca di riportarmi il mio oro!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Mi è sfuggito.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //E il mio oro? L'ha portato con sé?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Sì, l'ho preso. Marcirà in prigione per un po'.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //Cosa mi dici del mio oro?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //Beh, ha avuto un fatale incidente.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //Perlomeno non ruberà a nessun altro! La giustizia di Innos ha trionfato.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //Dov'è il mio oro?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zurückbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ecco le 50 monete d’oro che ti ha rubato.";
};

func int DIA_Jora_BringGold_Condition ()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_BringGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Ecco le 50 monete d’oro che ti ha rubato.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //Sia lodato Innos! C'è ancora giustizia in città.
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //Ehi, questi non sono 50 pezzi d'oro! Stai cercando di derubarmi anche tu?
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------

instance DIA_Jora_GHDgInfo (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_GHDgInfo_Condition;
	information	 = 	DIA_Jora_GHDgInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Cosa puoi dirmi della gilda dei ladri?";
};

func int DIA_Jora_GHDgInfo_Condition ()
{
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GHDgInfo_Info ()
{
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //Cosa puoi dirmi della gilda dei ladri?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //Bene, ascolta: io non ti ho mai detto nulla, intesi?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //Ci sono alcuni loschi individui che frequentano la taverna del porto.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //Scommetto che il locandiere sa qualcosa...
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Se hai intenzione di scovare i ladri, faresti meglio a parlare con lui.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //Potresti far finta di essere invischiato in qualcosa di illegale, per esempio. Forse potrebbe cascarci.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Ma fai molta attenzione. Quella gente non deve essere presa alla leggera.
		
		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Belohnung_Condition;
	information	 = 	DIA_Jora_Belohnung_Info;
	permanent	 = 	FALSE;
	description	 = 	"Come ricompensa, voglio una parte dell’oro!";
};

func int DIA_Jora_Belohnung_Condition ()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Jora_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //Come ricompensa, voglio una parte dell’oro!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Ma ti ho già dato un prezioso indizio.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //Dovrebbe essere una ricompensa sufficiente per te.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Se è l'oro che vuoi, allora trova quei ladri e vai a riscuotere la taglia da Lord Andre.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //Ora devo tornare ai miei clienti...
	};
	AI_StopProcessInfos (self); 
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_AlriksSchwert_Condition;
	information	 = 	DIA_Jora_AlriksSchwert_Info;
	permanent	 = 	FALSE;
	description	 = 	"Alrik dice che tu hai la sua spada...";
};
func int DIA_Jora_AlriksSchwert_Condition ()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_AlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik dice che tu hai la sua spada...
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //Intendi quel tizio cencioso che ha scambiato la sua arma per qualche torcia e un pezzo di carne?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //Sì, è lui.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //Ho ancora la sua spada.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //Quanto vuoi per essa?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //Beh, per te...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //Ah, fa niente! Ecco, prendila. Dopo tutto, mi hai aiutato a riavere indietro il mio oro...
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //Beh, per te 50 pezzi d'oro.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //(irritato) Non ce l'ho più! Solo il diavolo sa dov'è finita quella cosa.
	};
};


// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BUYAlriksSchwert_Condition;
	information	 = 	DIA_Jora_BUYAlriksSchwert_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ecco 50 monete d’oro. Dammi la spada di Alrik.";
};
func int DIA_Jora_BUYAlriksSchwert_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};
func void DIA_Jora_BUYAlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Ecco 50 monete d’oro. Dammi la spada di Alrik.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - für 50 Goldstücke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Ecco a te... (scaltro) è stato un buon affare.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //Non hai abbastanza oro. Ma non preoccuparti, terrò la spada per un po'. Torna più tardi, dunque...
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jora_PICKPOCKET (C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 900;
	condition	= DIA_Jora_PICKPOCKET_Condition;
	information	= DIA_Jora_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen (31, 45);
};
 
FUNC VOID DIA_Jora_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jora_PICKPOCKET);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_BACK 		,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};
	
func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};









