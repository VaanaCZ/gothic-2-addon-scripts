// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Pepe_EXIT   (C_INFO)
{
	npc         = BAU_912_Pepe;
	nr          = 999;
	condition   = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Pepe_Hallo (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 1;
	condition	= DIA_Pepe_Hallo_Condition;
	information	= DIA_Pepe_Hallo_Info;
	permanent	= FALSE;
	description	= "Cosa stai facendo, qui?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //Cosa stai facendo, qui?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //(annoiato) Faccio la guardia alle pecore! (sospira) E possibilmente cerco di rimanere fuori dai guai.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Non è sempre possibile, vero?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //Naaa, e soprattutto non con i mercenari. Sono davvero contento di starmene qua fuori al pascolo, anche se può rivelarsi pericoloso.
	};
};

// ************************************************************
// 								Danger
// ************************************************************
instance DIA_Pepe_Danger (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 2;
	condition	= DIA_Pepe_Danger_Condition;
	information	= DIA_Pepe_Danger_Info;
	permanent 	= FALSE;
	description	= "Perché è così pericoloso pascolare?";
};
func int DIA_Pepe_Danger_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};
func void DIA_Pepe_Danger_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Cosa c'è di pericoloso nel pascolo?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //C'è un piccolo gruppo di lupi che si aggira nella zona. Di recente, quelle dannate bestie si sono avvicinate e hanno mangiato una delle mie pecore quasi ogni giorno.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Fino a qualche giorno fa avevo quasi il doppio delle pecore che ho adesso. Non voglio nemmeno pensare cosa mi farà Onar quando lo scoprirà.
};

// ************************************************************
// 								WhyNotSLD
// ************************************************************
instance DIA_Pepe_WhyNotSLD	(C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 3;
	condition	= DIA_Pepe_WhyNotSLD_Condition;
	information	= DIA_Pepe_WhyNotSLD_Info;
	PERMANENT 	= FALSE;
	description	= "Perché non hai detto ai mercenari dei lupi? Pensavo che lavorassero per te.";
};
func int DIA_Pepe_WhyNotSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	&& ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
func void DIA_Pepe_WhyNotSLD_Info ()
{
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //Perché non hai informato i mercenari dei lupi? Pensavo che lavorassero per te.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Sì, è vero, avrei dovuto dirglielo, ma non ne ho avuto il coraggio, dannazione.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //E ora che mi ritrovo con così tante pecore uccise, ho paura di raccontarlo in giro.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Ma l'hai appena detto a ME...
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //(irritato) E infatti me ne sto già pentendo.
};

// ************************************************************
// 								KillWolves
// ************************************************************
instance DIA_Pepe_KillWolves (C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr			= 4;
	condition	= DIA_Pepe_KillWolves_Condition;
	information	= DIA_Pepe_KillWolves_Info;
	permanent 	= FALSE;
	description	= "E se uccido quei lupi?";
};
func int DIA_Pepe_KillWolves_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	{
		return TRUE;
	};
};
func void DIA_Pepe_KillWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //E se uccido quei lupi?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //(beffardo) Tu, da solo? Ah ah. Non ci credo. Farò meglio a chiedere al mio capo di occuparsene.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Lascia stare, era solo una proposta. Andrò a parlare ai ragazzi e vedrò cos'hanno da dire in proposito...
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //(spaventato) Aspetta un attimo. D'accordo, d'accordo! Ehm... Tu sei il migliore e puoi uccidere cento lupi alla volta. Non c'è problema!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Essi si aggirano principalmente fra gli alberi vicino al pascolo. (precisa) Credo che ce ne fossero solo quattro...
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Le pecore di Pepe sono minacciate da quattro lupi. Dovrei cacciarli via.");
};

// ************************************************************
// 								KilledWolves
// ************************************************************
instance DIA_Pepe_KilledWolves		(C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_KilledWolves_Condition;
	information	 = 	DIA_Pepe_KilledWolves_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ho ammazzato i lupi.";
};
func int DIA_Pepe_KilledWolves_Condition ()
{
	if  (MIS_Pepe_KillWolves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Pepe_KilledWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Mi sono occupato dei lupi.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //(stupito) Ce l'hai fatta! Grazie a Innos!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Ma non so ancora come dire a Onar che tutte quelle pecore sono morte.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //(fra sé e sé) È tutta colpa di quel dannato Bullco!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //Non ho bisogno che tu ti prenda gioco di me. Le bestie non sono tutte morte.
	};
};

// ************************************************************
// 					Was hast du über Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_Bullco_Condition;
	information	 = 	DIA_Pepe_Bullco_Info;
	permanent	 = 	FALSE;
	description	 = 	"Cosa hai detto di Bullco?";
};
func int DIA_Pepe_Bullco_Condition ()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (!Npc_IsDead(Bullco))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Bullco_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //Cosa hai detto di Bullco?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //È uno dei mercenari. Tenere d'occhio il pascolo era in realtà compito suo.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //E invece lui e il suo amico Silvio gironzolano intorno a Thekla in cucina tutto il giorno.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //È colpa di quel bastardo se non verrò pagato per settimane a causa della perdita delle pecore.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Vorrei almeno prenderlo a pugni in faccia per quello che ha fatto, ma nessuno può farcela contro di lui. Quel tipo è un assassino.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Bullco dovrebbe occuparsi meglio delle pecore di Pepe. Pepe vuole che qualcuno lo convinca.");
};

// ************************************************************
// 						Bullco geschlagen
// ************************************************************
instance DIA_Pepe_BullcoDefeated (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_BullcoDefeated_Condition;
	information	 = 	DIA_Pepe_BullcoDefeated_Info;
	permanent	 = 	FALSE;
	description	 = 	"Bullco ha avuto ciò che si meritava.";
};
func int DIA_Pepe_BullcoDefeated_Condition ()
{
	if (MIS_Pepe_KickBullco == LOG_RUNNING)
	{
		if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Pepe_BullcoDefeated_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullco ha avuto ciò che si meritava. Gli ho dato una lezione.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Gli sta bene.

	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP (XP_KickBullco);
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Pepe_PERM		(C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr		 	= 6;
	condition	= DIA_Pepe_PERM_Condition;
	information	= DIA_Pepe_PERM_Info;
	permanent	= TRUE;
	description	= "Come state tu e le tue pecore?";
};

func int DIA_Pepe_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info ()
{
	AI_Output (other, self, "DIA_Pepe_PERM_15_00"); //Come state tu e le tue pecore?

	if (kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //Io sto bene, e anche le pecore, ovviamente mi riferisco a quelle che sono rimaste. Io sto bene, e anche le pecore, ovviamente mi riferisco a quelle che sono rimaste.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Bene. Ma i lupi torneranno un giorno e probabilmente ce ne saranno di più!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //Ho sentito le cose più assurde. Pare che alcuni loschi figuri si siano presentati da Sekob. Stanno assediando la sua casa.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //Ho sentito dire che alcuni delinquenti si sono stabiliti nella fattoria di Lobart. Forse qualcuno dovrebbe aiutarlo.
	};
};

// ************************************************************
// 			  					Liesel 
// ************************************************************
instance DIA_Pepe_Liesel		(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	7;
	condition	 = 	DIA_Pepe_Liesel_Condition;
	information	 = 	DIA_Pepe_Liesel_Info;
	permanent	 = 	FALSE;
	description	 = 	"Posso comprare una pecora?";
};
func int DIA_Pepe_Liesel_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Pepe_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Liesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //Posso comprare una pecora?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Quando vuoi, sempre che tu possa pagare. Una pecora ti costerà 100 monete d'oro.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Se paghi, puoi prenderti una pecora. Ma devi trattarla bene.
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	8;
	condition	 = 	DIA_Pepe_BuyLiesel_Condition;
	information	 = 	DIA_Pepe_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ecco 100 pezzi d’oro. Dammi una pecora.";
};
func int DIA_Pepe_BuyLiesel_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Pepe_LIESEL))
	{
		return TRUE;
	};
};
func void DIA_Pepe_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Ecco 100 monete d’oro. Dammi una pecora.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Bene. Puoi prenderti Betsy, la troverai al pascolo.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Basta che la chiami e ti seguirà. È molto intelligente per essere una pecora. Mi raccomando, trattala bene!
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Di nuovo? D'accordo, prendi Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Betsy? Ma anche l'ultima pecora si chiamava così...
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Tutte le pecore si chiamano Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Tranne i montoni, ovviamente.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //E loro come si chiamano?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Bruce.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Non hai oro a sufficienza. Non posso darti una pecora per meno di quella somma.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pepe_PICKPOCKET (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 900;
	condition	= DIA_Pepe_PICKPOCKET_Condition;
	information	= DIA_Pepe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Pepe_PICKPOCKET_Condition()
{
	C_Beklauen (15, 25);
};
 
FUNC VOID DIA_Pepe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pepe_PICKPOCKET);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_BACK 		,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};
	
func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};















