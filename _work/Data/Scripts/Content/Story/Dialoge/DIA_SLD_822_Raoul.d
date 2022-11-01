// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Raoul_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_EXIT_Condition;
	information	= DIA_Raoul_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Raoul_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Raoul_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				NoSentenza
// ************************************************************
instance DIA_Raoul_NoSentenza (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_NoSentenza_Condition;
	information	= DIA_Raoul_NoSentenza_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Raoul_NoSentenza_Condition()
{
	if (!Npc_KnowsInfo(other, DIA_Sentenza_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_NoSentenza_Info()
{	
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_00"); //Aspetta un attimo, amico!
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_01"); //Non mi pare che Sentenza ti abbia perquisito.
	
	if (Hlp_IsValidNpc(Sentenza))
	&& (!C_NpcIsDown(Sentenza))
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_02"); //SENTENZA! Vieni qui!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_03"); //(con falsa cortesia) Un momento, sarà subito qui!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_04"); //Allora avrai una bella sorpresa!
		
		B_Attack (Sentenza, other, AR_NONE, 0);
	}
	else 
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_05"); //Dov'è andato a cacciarsi? Beh, non importa, sei stato fortunato...
	};
	
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				Hello
// ************************************************************
instance DIA_Raoul_Hello (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_Hello_Condition;
	information	= DIA_Raoul_Hello_Info;
	permanent	= TRUE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Raoul_Hello_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Hello_Info()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_00"); //(annoiato) Cosa vuoi?
	}
	else
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_01"); //(irritato) Cosa vuoi questa volta?
	};
};

// ************************************************************
// 			  				PERM (Gil_None)
// ************************************************************

var int Raoul_gesagt;
// -------------------------
instance DIA_Raoul_PERMNone (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_PERMNone_Condition;
	information	= DIA_Raoul_PERMNone_Info;
	permanent	= TRUE;
	description = "Voglio dare un’occhiata nei dintorni della fattoria!"; 
};                       

FUNC INT DIA_Raoul_PERMNone_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_PERMNone_Info()
{
	AI_Output (other, self, "DIA_Raoul_PERMNone_15_00"); //Voglio dare un’occhiata nei dintorni della fattoria!
	
	if (Raoul_gesagt == FALSE)
	{
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_01"); //Non entrare nell'edificio a sinistra. Silvio è lì e ora non è proprio di buon umore.
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_02"); //Se vede un debole che non appartiene alla fattoria, potrebbe decidere di sfogarsi su di lui.
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_03"); //Divertiti!
		AI_StopProcessInfos (self);
	};
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
instance DIA_Raoul_WannaJoin (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_WannaJoin_Condition;
	information	= DIA_Raoul_WannaJoin_Info;
	permanent	= FALSE;
	description = "Voglio unirmi a Lee!"; 
};                       

FUNC INT DIA_Raoul_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_00"); //Voglio unirmi a Lee!
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_01"); //Lee non avrà più molto da dire da queste parti se continua così!
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_02"); //Cosa vuoi dire?
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_03"); //Vuole che tutti rimangano seduti a girarsi i pollici. Intimidire qualche contadini ogni tanto, e basta.
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_04"); //Silvio dice sempre che la miglior difesa è l'attacco e ha dannatamente ragione.
};
	
// ************************************************************
// 			  				AboutSylvio
// ************************************************************
instance DIA_Raoul_AboutSylvio (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_AboutSylvio_Condition;
	information	= DIA_Raoul_AboutSylvio_Info;
	permanent	= FALSE;
	description = "Chi è Silvio?"; 
};                       

FUNC INT DIA_Raoul_AboutSylvio_Condition()
{
	if (Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo (other, DIA_Raoul_WannaJoin))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_AboutSylvio_Info()
{	
	AI_Output (other, self, "DIA_Raoul_AboutSylvio_15_00"); //Chi è Sylvio?
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_01"); //Il nostro prossimo capo, se lo chiedi a me. Se hai intenzione di andare a chiedergli di unirti a noi, scordatelo!
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_02"); //Sembri a malapena in grado di portare le pecore al pascolo.
};

// ************************************************************
// 			  				Stimme
// ************************************************************
instance DIA_Raoul_Stimme (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_Stimme_Condition;
	information	= DIA_Raoul_Stimme_Info;
	permanent	= FALSE;
	description = "Sto cercando di diventare un mercenario. Ti dispiace?"; 
};                       

FUNC INT DIA_Raoul_Stimme_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Stimme_Info()
{	
	AI_Output (other, self, "DIA_Raoul_Stimme_15_00"); //Sto cercando di diventare un mercenario. Ti dispiace?
	AI_Output (self, other, "DIA_Raoul_Stimme_01_01"); //Ah, fai come ti pare...
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Raoul non ha niente in contrario se mi unisco ai mercenari.");
};

// ************************************************************
// 			  					Duell
// ************************************************************
instance DIA_Raoul_Duell (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_Duell_Condition;
	information	= DIA_Raoul_Duell_Info;
	permanent	= TRUE;
	description = "Methinks, sto per darti un pugno in faccia..."; 
};                       

FUNC INT DIA_Raoul_Duell_Condition()
{
	if (Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo (other, DIA_Raoul_AboutSylvio))
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Duell_Info()
{	
	AI_Output (other, self, "DIA_Raoul_Duell_15_00"); //Mi sa che sto per darti un pugno in faccia...
	AI_Output (self, other, "DIA_Raoul_Duell_01_01"); //Cosa?
	AI_Output (other, self, "DIA_Raoul_Duell_15_02"); //È proprio quello che ti serve in questo momento...
	AI_Output (self, other, "DIA_Raoul_Duell_01_03"); //Sono stato gentile con te finora, non è vero?
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

//#####################################################################

//							Mit erster Gilde

//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_PERM		(C_INFO)
{
	npc		 	= Sld_822_Raoul;
	nr		 	= 900;
	condition	= DIA_Raoul_PERM_Condition;
	information	= DIA_Raoul_PERM_Info;
	permanent	= TRUE;
	description	= "Per il resto, tutto bene?";
};

func int DIA_Raoul_PERM_Condition ()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_PERM_15_00"); //Tutto il resto è a posto?

	if (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_01"); //Non chiacchierare così tanto. Vai e portami quella pelle di troll oscuro.
	}
	else 
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_02"); //Stai cercando di diventare mio amico adesso, o cosa? Sparisci!

		 if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output			(self, other, "DIA_Raoul_PERM_01_03"); //Non ho dimenticato quello che hai fatto per me.
		};
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_TROLL		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	2;
	condition	 = 	DIA_Raoul_TROLL_Condition;
	information	 = 	DIA_Raoul_TROLL_Info;
	important	 = 	TRUE;

};

func int DIA_Raoul_TROLL_Condition ()
{
	if (hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLL_Info ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_00"); //(cinico) Non lo vedi?
	AI_Output			(other, self, "DIA_Raoul_TROLL_15_01"); //Che vuoi?

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_02"); //Ti sei unito ai mentecatti della città? Sembrerebbe di sì.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_03"); //Non pensare che ora ti rispetti solamente perché adesso sei uno di noi.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_04"); //Stiamo giocando a fare i grandi maghi, eh?
		};
	
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_05"); //Ti dirò qualcosa. Non importa cosa indossi, sono capace di vedere quanto vali.
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_06"); //Per me sei solo un grasso buono a nulla, niente di più.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "Devo andare.", DIA_Raoul_TROLL_weg );
	Info_AddChoice	(DIA_Raoul_TROLL, "Qual è il problema?", DIA_Raoul_TROLL_rechnung );
};

func void DIA_Raoul_TROLL_weg ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_weg_15_00"); //Devo andare.
	AI_Output			(self, other, "DIA_Raoul_TROLL_weg_01_01"); //Sì. Vattene.
	AI_StopProcessInfos (self);
};

func void DIA_Raoul_TROLL_rechnung ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_00"); //Qual è il problema?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_01"); //Conosco quelli come te. Solo parole e niente attributi.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_02"); //Detesto chi si veste pomposamente e si vanta delle proprie gesta eroiche.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_03"); //Proprio ieri ho fatto saltare i denti a uno dei ragazzi, perché diceva che avrebbe potuto stendere un troll oscuro con una mano legata dietro la schiena.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_04"); //E allora?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_05"); //(aspramente) Cosa vorresti dire con quel 'e allora'?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_06"); //Hai mai visto un troll oscuro, fanfarone? Hai idea di quanto siano grossi quei mostri, ragazzo?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_07"); //Se ti avvicini troppo, ti faranno a pezzi.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "Non è una cosa che mi riguarda.", DIA_Raoul_TROLL_rechnung_hastrecht );

	if (Npc_IsDead(Troll_Black))
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Ho già ucciso un troll oscuro.", DIA_Raoul_TROLL_rechnung_ich );
	}
	else
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Troll oscuro? Non c’è problema.", DIA_Raoul_TROLL_rechnung_noProb );
	};
};

func void B_Raoul_Blame ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00"); //Te la stai cercando, eh? Dovrei darti una bella lezione, ma ho un'idea migliore.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01"); //Se sei un guerriero così abile, allora dimostramelo.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02"); //Cosa ci guadagno io?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03"); //Che domanda stupida. Il tuo onore e la mascella tutta intera, per esempio?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04"); //Non è poi molto, vero?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05"); //Mmmh. Diciamo che ti pagherò un mucchio d'oro se mi porterai una pelle di troll oscuro. Che te ne pare?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06"); //Meglio.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07"); //Allora cosa stai aspettando?
	
	Log_CreateTopic (TOPIC_KillTrollBlack, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack, LOG_RUNNING);
	B_LogEntry (TOPIC_KillTrollBlack,"Raoul vuole che gli porti la pelle di un troll oscuro."); 
	
	MIS_Raoul_KillTrollBlack = LOG_RUNNING;

	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_hastrecht_15_00"); //Non m'interessa.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_hastrecht_01_01"); //Meglio per te, immagino.
	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_ich_15_00"); //Ho già ucciso un troll oscuro.
	B_Raoul_Blame ();
};
func void DIA_Raoul_TROLL_rechnung_noProb ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_noProb_15_00"); //Troll oscuro? Non c'è problema.
	B_Raoul_Blame ();
};
	
///////////////////////////////////////////////////////////////////////
//	Info TrophyFur
///////////////////////////////////////////////////////////////////////

instance DIA_Raoul_TrophyFur		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_TrophyFur_Condition;
	information	 = 	DIA_Raoul_TrophyFur_Info;
	permanent	 = 	TRUE;

	description	 = 	"Prima dimmi come togliere la pelle a un troll.";
};

func int DIA_Raoul_TrophyFur_Condition ()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)		
	&& (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Raoul_TrophyFur_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_TrophyFur_15_00"); //Prima dimmi come togliere la pelle a un troll.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_01"); //Allora apri bene le orecchie. Questo suggerimento è gratis.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_02"); //Afferra la bestia e apri una ferita in entrambe le gambe.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_03"); //Poi potrai tirare la pelle di quella cosa al di sopra delle orecchie. È troppo difficile o cosa?
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info TrollFell
///////////////////////////////////////////////////////////////////////

instance DIA_Raoul_TROLLFELL		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_TROLLFELL_Condition;
	information	 = 	DIA_Raoul_TROLLFELL_Info;

	description	 = 	"Ho la pelle di un troll oscuro.";
};

func int DIA_Raoul_TROLLFELL_Condition ()
{
	if (Npc_HasItems (other,ItAt_TrollBlackFur))
	&& (Npc_KnowsInfo(other, DIA_Raoul_TROLL))
		{
				return TRUE;
		};
};

func void DIA_Raoul_TROLLFELL_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_00"); //Ho la pelle di un troll oscuro.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_01"); //Impossibile. Fammi vedere.
	B_GiveInvItems 		(other, self, ItAt_TrollBlackFur,1);
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_02"); //Incredibile. Cosa vuoi in cambio?
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_03"); //Dammi quello che hai.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_04"); //D'accordo. Ti darò 500 pezzi d'oro e ci aggiungerò tre pozioni di cura potenti, che ne dici?
	
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "Non è abbastanza.", DIA_Raoul_TROLLFELL_nein );
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "Fatto.", DIA_Raoul_TROLLFELL_ja );

	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP (XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_ja_15_00"); //Venduta.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_ja_01_01"); //È stato un piacere.
	CreateInvItems (self, ItPo_Health_03, 3);									
	B_GiveInvItems (self, other, ItPo_Health_03, 3);					
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);					
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);

};

func void DIA_Raoul_TROLLFELL_nein ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_nein_15_00"); //Non è abbastanza.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_01"); //Fai come ti pare. Mi terrò la pelle, comunque.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_02"); //Non mi farò sfuggire questa opportunità dalle mani.
	MIS_Raoul_DoesntPayTrollFur = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FellZurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_FELLZURUECK		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_FELLZURUECK_Condition;
	information	 = 	DIA_Raoul_FELLZURUECK_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ridammi la mia pelle di troll.";
};

func int DIA_Raoul_FELLZURUECK_Condition ()
{
	if (MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems (self,ItAt_TrollBlackFur))
		{
				return TRUE;
		};
};

func void DIA_Raoul_FELLZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_FELLZURUECK_15_00"); //Ridammi la mia pelle di troll.
	AI_Output			(self, other, "DIA_Raoul_FELLZURUECK_01_01"); //No.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GotTrollFurBack
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_GotTrollFurBack		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_GotTrollFurBack_Condition;
	information	 = 	DIA_Raoul_GotTrollFurBack_Info;

	description	 = 	"Non provare più a derubarmi, capito?";
};

func int DIA_Raoul_GotTrollFurBack_Condition ()
{
	if (MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems (self,ItAt_TrollBlackFur) == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
				return TRUE;
		};
};

func void DIA_Raoul_GotTrollFurBack_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_GotTrollFurBack_15_00"); //Non provare più a derubarmi, capito?
	AI_Output			(self, other, "DIA_Raoul_GotTrollFurBack_01_01"); //D'accordo. Sai come vanno le cose qui attorno, non è vero? Dunque calmati.
	MIS_Raoul_DoesntPayTrollFur = LOG_SUCCESS;
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Raoul_KAP3_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP3_EXIT_Condition;
	information	= DIA_Raoul_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Raoul_KAP4_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP4_EXIT_Condition;
	information	= DIA_Raoul_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Raoul_KAP5_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP5_EXIT_Condition;
	information	= DIA_Raoul_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ship
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_Ship		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	2;
	condition	 = 	DIA_Raoul_Ship_Condition;
	information	 = 	DIA_Raoul_Ship_Info;

	description	 = 	"TI piacerebbe una crociera sull’oceano lontano da qui?";
};

func int DIA_Raoul_Ship_Condition ()
{
	if (Kapitel >= 5)	
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_Ship_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_Ship_15_00"); //Ti piacerebbe una bella crociera sull'oceano lontano da qui?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_01"); //Cosa stai architettando? Vuoi forse impadronirti della nave dei paladini? (ride)
	AI_Output			(other, self, "DIA_Raoul_Ship_15_02"); //E se così fosse?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_03"); //(serio) Sei completamente pazzo. No, grazie. Non fa per me.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_04"); //Non vedo nessun motivo per lasciare Khorinis. Che io guadagni il mio pasto qui o sulla terraferma, è lo stesso per me.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_05"); //Trovati qualcun altro.

	if ((Npc_IsDead(Torlof))== FALSE)
	{
		AI_Output			(self, other, "DIA_Raoul_Ship_01_06"); //Chiedi a Torlof. Una volta girava per il mare, se ben ricordo.
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Raoul_KAP6_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP6_EXIT_Condition;
	information	= DIA_Raoul_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Raoul_PICKPOCKET (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 900;
	condition	= DIA_Raoul_PICKPOCKET_Condition;
	information	= DIA_Raoul_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Raoul_PICKPOCKET_Condition()
{
	C_Beklauen (45, 85);
};
 
FUNC VOID DIA_Raoul_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Raoul_PICKPOCKET);
	Info_AddChoice		(DIA_Raoul_PICKPOCKET, DIALOG_BACK 		,DIA_Raoul_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Raoul_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Raoul_PICKPOCKET_DoIt);
};

func void DIA_Raoul_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Raoul_PICKPOCKET);
};
	
func void DIA_Raoul_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Raoul_PICKPOCKET);
};


































	
	
	
	


























