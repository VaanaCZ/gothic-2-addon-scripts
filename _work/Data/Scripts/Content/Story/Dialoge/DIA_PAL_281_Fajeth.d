FUNC INT C_SnapperDeath()
{
	if  Npc_IsDead(NewMine_Snapper1) 
	&& 	Npc_IsDead(NewMine_Snapper2)
	&& 	Npc_IsDead(NewMine_Snapper3)
	&& 	Npc_IsDead(NewMine_Snapper4)
	&& 	Npc_IsDead(NewMine_Snapper5)
	&& 	Npc_IsDead(NewMine_Snapper6)
	&& 	Npc_IsDead(NewMine_Snapper7)
	&& 	Npc_IsDead(NewMine_Snapper8)
	{
		return TRUE;
	}; 

};
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fajeth_EXIT   (C_INFO)
{
	npc         = PAL_281_Fajeth;
	nr          = 999;
	condition   = DIA_Fajeth_EXIT_Condition;
	information = DIA_Fajeth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

/* 
	Seit einiger Zeit suchen wir in diesem verfluchten Gebiet eine Stelle, die noch erzhaltiges Gestein enthält, 
	nicht ständig von Orkpatroullien heimgesucht wird, wo die dauernden Drachenangriffe ausbleiben!
	Wir sind völlig verdreckt und ausgehungert, haben unzählige Kämpfe ausgetragen 
	und haben endlich hier den Funken einer Hoffnung gefunden bei diesem dreckigen Loch in der Erde dort drüben unseren praktisch unmöglichen Auftrag zu erledigen.
	Und da kommt einer wie du daher und besitzt die Frechheit uns zu sagen, wir seien überfällig! Entweder bist du völlig verrückt oder einfach nur unverschämt!
*/
///////////////////////////////////////////////////////////////////////	
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_First		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_First_Condition;
	information	 = 	DIA_Fajeth_First_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_First_Condition ()
{
	if (Garond.aivar[AIV_TalkedToPlayer] == FALSE) 
	{
			return TRUE;
	};
};
func void DIA_Fajeth_First_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_First_12_00"); //Chi sei e cosa ci fai qui?
	AI_Output (other, self, "DIA_Fajeth_First_15_01"); //Sono in viaggio per ordine di Lord Hagen...
	AI_Output (self, other, "DIA_Fajeth_First_12_02"); //Allora dovresti provare a raggiungere il castello. Lì è dove si trova il comandante Garond. È il comandante a capo di questa spedizione.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Hallo		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Hallo_Condition;
	information	 = 	DIA_Fajeth_Hallo_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_Hallo_Condition ()
{
	if (MIS_ScoutMine == LOG_RUNNING) 
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_00"); //Da dove vieni?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_01"); //Sono qui in nome di Garond...
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_02"); //Molto bene. Ho sempre bisogno di nuovi uomini.
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_03"); //Non sono qui per aiutarvi.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_04"); //No? Allora perché sei venuto?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_05"); //La mia missione consiste nello scoprire quanto metallo avete estratto finora.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_06"); //Onorato mago. La tua presenza ispira coraggio in me e i miei uomini.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_07"); //Sarebbe sicuramente utile se tu potessi usare i poteri di Innos per noi.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Cosa posso fare per te?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"La mia missione è più urgente.",DIA_Fajeth_Hallo_KDFNein);	
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_08"); //E la mia missione consiste nel fare qualsiasi cosa io ritenga necessaria per estrarre il metallo e proteggerlo.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_09"); //Questo include la requisizione di soldati. Sei al servizio di Innos, pertanto seguirai i miei ordini.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Cosa posso fare per te?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ho già ricevuto un ordine, da Garond.",DIA_Fajeth_Hallo_MILNein);	
	}
	else //GIL_SLD
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_10"); //Ascolta, non so perché Garond mi abbia mandato un mercenario, ma deve avere le sue ragioni.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_11"); //Ma prima che io ti rimandi indietro, eseguirai una missione per me.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Tutto ha un prezzo.",DIA_Fajeth_Hallo_SLDJa);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"No, non ho tempo...",DIA_Fajeth_Hallo_SLDNein);	
	};
}; 
FUNC VOID DIA_Fajeth_Hallo_Tun () //Mission
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //Cosa posso fare per te?
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //Da giorni un branco di squartatori si aggira intorno al campo. Sembra che stiano aspettando il momento giusto per attaccare.
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //Non so cosa stiano aspettando, ma fino a quando staranno qui, non ci sarà pace nel campo.

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //Quel codardo di Fed, più degli altri, è terrorizzato a morte e sta spaventando gli altri detenuti.
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //Dunque chi dovrei mandare? Bilgot? Ah, è un codardo pure lui.
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //E Tengron? Sicuramente sa combattere, ma gli manca la scaltrezza necessaria.
	};
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //L'unico che può farcela sei tu. Voglio che tu rintracci queste dannate bestie e che le uccida.
	
	Wld_InsertNpc	(NewMine_Snapper7,"OW_PATH_333");	//Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc	(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc	(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");	

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic (TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FajethKillSnapper,LOG_RUNNING);
	B_LogEntry (TOPIC_FajethKillSnapper,"Fajeth mi ha chiesto di cacciare gli squartatori che vagano per i campi da alcuni giorni.");
	
	Info_ClearChoices (DIA_Fajeth_Hallo);
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
FUNC VOID DIA_Fajeth_Hallo_KDFNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //La mia missione è più urgente. Non posso aiutarti.
	AI_Output (self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //Naturalmente, o onorato, ti dirò tutto quello che vorrai sapere.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
FUNC VOID DIA_Fajeth_Hallo_MILNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //Ho già ricevuto un ordine, da Garond.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //E lo porterai a termine. Ma solo dopo che ti avrò mandato indietro.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //Tutto quello che voglio sentirti dire ora è 'cosa posso dare per te?' Hai capito?
};
FUNC VOID DIA_Fajeth_Hallo_SLDJa ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //Tutto ha un prezzo. Se mi paghi, potrei pensarci sopra.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //Non sono abituato a fare affari con i mercenari. Odio contrattare per un prezzo migliore.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //Ma come segno di buona volontà ti pagherò 100 pezzi d'oro se lavorerai per me.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //Abbiamo un accordo?
	Fajeth_Pay = TRUE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Cosa posso fare per te?",DIA_Fajeth_Hallo_Tun);	
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"No, non ho tempo...",DIA_Fajeth_Hallo_SLDNein);	
};
FUNC VOID DIA_Fajeth_Hallo_SLDNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //No, non ho tempo di occuparmi dei tuoi problemi.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //Stai rifiutando dei soldi facili? Non me lo sarei mai aspettato da un mercenario.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //Visto che non vuoi aiutarci, ti suggerisco di chiedere quello che vuoi sapere e poi andartene.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
///////////////////////////////////////////////////////////////////////	
//	Info Leader
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Leader		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Leader_Condition;
	information	 = 	DIA_Fajeth_Leader_Info;
	permanent 	 =  FALSE;
	description	 =  "Ho ucciso il capo della banda.";
};
func int DIA_Fajeth_Leader_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER) 
  	&&  Npc_IsDead(NewMine_LeadSnapper) 
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
			return TRUE;
	};
};
func void DIA_Fajeth_Leader_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Leader_15_00"); //Ho ucciso il capo della banda.
	AI_Output (self, other, "DIA_Fajeth_Leader_12_01"); //Bene. Senza un capo sono molto meno pericolosi. Non penso che ci attaccheranno più.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_Leader_12_02"); //Ecco il tuo denaro, come stabilito.
		B_GiveInvItems (self, other, ItMi_Gold,100); 
	};
	
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
		
		
};
///////////////////////////////////////////////////////////////////////
//	Info SNAPPER_Killed
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_SNAPPER_KILLED		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_SNAPPER_KILLED_Condition;
	information	 = 	DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent	 = 	TRUE;
	description	 = 	"Gli squartatori sono finiti!";
};

func int DIA_Fajeth_SNAPPER_KILLED_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	&& (C_SnapperDeath() == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_SNAPPER_KILLED_Info ()
{
 		
	AI_Output (hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //Gli squartatori sono finiti!
	AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //Ottimo lavoro. Dovremmo essere in grado di occuparci delle altre bestie là fuori.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //Hai guadagnato il tuo denaro. Eccoti 100 pezzi d'oro, come stabilito.
		B_GiveInvItems (self, other, ItmI_Gold,100); 
	};					
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
};
///////////////////////////////////////////////////////////////////////
//	Info Running
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Running		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Running_Condition;
	information	 = 	DIA_Fajeth_Running_Info;
	permanent	 =  TRUE;
	description  =  "Com’è il morale dei tuoi uomini?";
};

func int DIA_Fajeth_Running_Condition ()
{
	if  (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Running_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Running_15_00"); //Com’è il morale dei tuoi uomini?
	AI_Output (self, other, "DIA_Fajeth_Running_12_01"); //Vuoi sapere com'è il morale degli uomini? Possono a malapena lavorare dalla paura!
	AI_Output (self, other, "DIA_Fajeth_Running_12_02"); //Occupati di quegli squartatori, o qualcuno finirà per impazzire!
};
///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_BELOHNUNG		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	3;	
	condition	 = 	DIA_Fajeth_BELOHNUNG_Condition;
	information	 = 	DIA_Fajeth_BELOHNUNG_Info;
	permanent	 =  FALSE;
	description	 = 	"Quanto minerale avete estratto fino ad ora?";
};

func int DIA_Fajeth_BELOHNUNG_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	|| (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_BELOHNUNG_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //Quanto metallo avete estratto fino ad ora?
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //Riferisci a Garond che finora abbiamo estratto solamente DUE casse di metallo.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //Ho già subito abbastanza perdite grazie ai continui attacchi.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //Se Garond potrà mandarmi altri uomini, allora potremo estrarre più metallo
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //Capisco. Glielo farò sapere.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //Bene. Allora il resto dipende da te. Difenderemo la miniera fino a quando potremo.
	
	Fajeth_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"I minatori di Fajeth hanno raccolto DUE casse di metallo finora.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Perm2		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Perm2_Condition;
	information	 = 	DIA_Fajeth_Perm2_Info;
	permanent	 =  TRUE;
	description  =  "Come va la produzione di minerale?";
};

func int DIA_Fajeth_Perm2_Condition ()
{
	if  Npc_KnowsInfo (other,DIA_Fajeth_BELOHNUNG)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Perm2_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Perm2_15_00"); //Come va l’estrazione di metallo?
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_01"); //Male. Non stiamo facendo nessun progresso.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_02"); //Appena arrivati andava tutto bene, ma da allora i miei ragazzi hanno praticamente estratto solo dei frammenti. Niente di utilizzabile.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_03"); //Ma non ci arrenderemo. Perlomeno fino a quando sarò al comando io.
};
//#####################################################################
//##
//##
//##							KAPITEL 3 und höher
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Erzabbau
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_ERZABBAU		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr			 = 	11;
	condition	 = 	DIA_Fajeth_ERZABBAU_Condition;
	information	 = 	DIA_Fajeth_ERZABBAU_Info;
	permanent	 = 	TRUE;
	description	 = 	"Come va l’estrazione di minerale?";
};

func int DIA_Fajeth_ERZABBAU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Fajeth_BELOHNUNG))
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_00"); //Come va l’estrazione di metallo?
	
	if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_01"); //È diventato tutto calmo qui. Cosa starà succedendo?
		AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_02"); //I draghi sono morti.
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_03"); //Bene, allora spero che potrò rilassarmi presto. Sto lentamente impazzendo qui.
	}
	else 
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_04"); //Come puoi vedere. Malissimo.
	};
};





// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fajeth_PICKPOCKET (C_INFO)
{
	npc			= PAL_281_Fajeth;
	nr			= 900;
	condition	= DIA_Fajeth_PICKPOCKET_Condition;
	information	= DIA_Fajeth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Fajeth_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Fajeth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fajeth_PICKPOCKET);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_BACK 		,DIA_Fajeth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fajeth_PICKPOCKET_DoIt);
};

func void DIA_Fajeth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};
	
func void DIA_Fajeth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};


