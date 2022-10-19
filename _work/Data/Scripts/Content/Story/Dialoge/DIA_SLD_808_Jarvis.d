// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //Ehi! Non ti ho già visto da qualche parte?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //È possibile. Ero anch'io nella colonia.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Giusto... che cosa vuoi?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "Come vanno le cose?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //Come vanno le cose?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Al momento abbiamo seri problemi. Due fazioni stanno delineandosi tra noi mercenari.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Silvio e i suoi uomini dubitano che Lee stia facendo la cosa giusta.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "Come mai ci sono due fazioni?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //Come mai ci sono due fazioni?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //La maggior parte di noi è uscita dalla colonia con Lee ai tempi.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Ma alcuni dei mercenari si sono uniti a noi più tardi.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Essi non vengono dalla colonia, ma erano più a sud, a combattere gli orchi.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //In qualche modo hanno sentito dire che Lee aveva bisogno di uomini. Il loro capo era Silvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //Egli ha accettato la leadership di Lee, ma ora sta cercando di rivoltare i mercenari contro di lui e il suo piano.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //Molti degli uomini di Lee non pensano che sia un grande problema. Ma conosco i tipi come Silvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Non si fermerà davanti a nulla pur di realizzare i propri piani.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "Conosci le intenzioni di Lee?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //Conosci le intenzioni di Lee?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee vuole che aspettiamo che i paladini in città siano affamati.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Vuole portarci tutti via dall'isola. E solo Innos sa se ho qualcosa in contrario ad andarmene da qui.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //Non so come abbia intenzione di farlo, ma mi fido di lui. Ci ha sempre guidati bene finora.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "Sai cos’ha in mente Silvio?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //Sai cos’ha in mente Sylvio?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Silvio ha scoperto che alcuni paladini si sono diretti alla vecchia colonia.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //Dice che il resto dei paladini non oserà attaccarci qui e vuole approfittare della situazione.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Saccheggiare le piccole fattorie, tendere agguati alle pattuglie dell'esercito fuori dalla città, fermare i viaggiatori, cose del genere.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Ma Lee pensa che sarebbe la cosa peggiore che potremmo fare nella nostra situazione.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "Voglio diventare un mercenario!";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //Voglio diventare un mercenario!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //Non sono sicuro che sia una buona idea...
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //Qual è il problema?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //Beh, devo votare a favore o contro di te.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //E, nella situazione in cui siamo, voterei per te solo se potessi essere sicuro che sei dalla parte di Lee!
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "Allora che cosa dovrei fare?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //Allora che cosa dovrei fare?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //Semplice. Stendi un paio di ragazzi di Silvio! In questo modo entrambi gli schieramenti sapranno esattamente da che parte stai.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //E se ti atterrai alle regole di un duello, guadagnerai anche il rispetto degli altri.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis vuole che io stenda un paio degli uomini di Sylvio prima di concedermi il suo voto.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "Quali sono le regole di un duello?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //Quali sono le regole di un duello?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //Vai da Torlof e fattele spiegare, se sei interessato.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //Tanto per capirci: non mi importa se rispetti le regole o meno. Mi basta che i ragazzi siano stesi nel fango!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"E non devo neanche attenermi alle regole dei duelli…");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "Quali mercenari sono gli uomini di Silvio?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Quali mercenari sono gli uomini di Sylvio?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Ci sono sei uomini. Prima di tutti, Silvio stesso e la sua mano destra, Bullco.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //Poi c'è Rod, Sentenza, Fester e Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //Il resto della gente è imparziale o dalla parte di Lee.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Gli uomini di Sylvio sono Sylvio stesso, il suo vice Bullco, Rod, Sentenza, Fester e Raoul.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "Quanti uomini di Silvio devo far fuori?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //Quanti uomini di Silvio dovrei sconfiggere?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Se ne stendi tre a terra, allora avrai dimostrato da che parte stai.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Le tue scelte sono affari tuoi.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Solo un piccolo consiglio: non devi dimostrare il tuo coraggio. Non sfidare Silvio in persona, ti farebbe a pezzettini.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"È sufficiente che io stenda tre degli uomini di Sylvio. Ma farei meglio a non toccare Sylvio stesso.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "Quanti uomini di Silvio sono ancora nella mia lista?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //Quanti uomini di Sylvio sono ancora nella mia lista?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //Ho battuto Bullco.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //Ho sentito. Non male.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Sembra che la salute di Rod sia peggiorata ora.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza ha cercato di estorcermi dell'oro, un'idea non molto brillante.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //Ho steso Sentenza.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester ha cercato di fregarmi, questo è stato il suo errore.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester ha avuto quello che meritava.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //E per quanto riguarda Raoul...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Sono andato da Raoul...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //E allora?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Ha disperatamente bisogno di cure ora.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //Non hai ancora steso nessun uomo di Silvio finora.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Bene, continua così.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //Mi aspetto che tu stenda almeno tre di loro.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //È sufficiente, è sufficiente.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Li hai veramente stesi tutti, eh?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //Sono impressionato. Se Lee me lo chiederà, potrò votare per te senza esitazione.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Jarvis voterà per me se deciderò di unirmi ai mercenari.");
	};
};


// ###############################
// ##							##
// 			Höhere Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "Qualche novità?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Qualche novità?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Ora sei uno di noi. Bene.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Hai fatto la scelta sbagliata, avresti potuto essere uno di noi.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //Ultimamente, gli uomini di Silvio sono stati veramente sottomessi. (ride)
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Silvio se n'è finalmente andato. Dopo che ha sentito parlare dei draghi, lui e alcuni dei suoi ragazzi sono diretti verso la colonia mineraria.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //Probabilmente ha pensato che ci fosse di più da guadagnare lì.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Niente, per ora è tutto tranquillo. Non vedo l'ora di vedere cosa succederà.
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





