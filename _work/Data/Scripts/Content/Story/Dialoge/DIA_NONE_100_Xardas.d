// ************************************************************
// 			  				FIRST EXIT 
// ************************************************************

INSTANCE DIA_Xardas_FirstEXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_FirstEXIT_Condition;
	information	= DIA_Xardas_FirstEXIT_Info;
	permanent	= FALSE;
	description = "Mi metterò in viaggio il più in fretta possibile! (FINE)";
};
                       
FUNC INT DIA_Xardas_FirstEXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Xardas_FirstEXIT_Info()
{	
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //Mi metterò in marcia il più in fretta possibile!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //Bene! Un'ultima cosa: non dire a nessuno che hai parlato con me. Soprattuto non dirlo a nessun mago.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Da quando sono andato in esilio, il Circolo del Fuoco mi considera morto, e questa è una cosa positiva.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: muß auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
	Npc_ExchangeRoutine (self,"START");
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Xardas_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_EXIT_Condition;
	information	= DIA_Xardas_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_EXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
var int Addon_zuerst;
// ------------------------------------------------------------
instance DIA_Xardas_Hello (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 1;
	condition	= DIA_Xardas_Hello_Condition;
	information	= DIA_Xardas_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Xardas_Hello_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Xardas_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //Rieccoti qui! (sorridendo) Non pensavo che ci saremmo rivisti.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //Mi sembra di essere rimasto tre settimane sotto un cumulo di macigni.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //Già. Sei sopravvissuto solo grazie alla tua armatura magica. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //Avevo temuto di non riuscire a estrarti dalle macerie del tempio.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Ma ora sei qui, e questo mi basta.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Dobbiamo affrontare una NUOVA minaccia.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "Ora abbiamo molto tempo. Il Dormiente è stato sconfitto.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "Di quale NUOVA minaccia stai parlando?", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //Devi allearti con loro! È l'unico modo per fermare Beliar.
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Almeno ora abbiamo abbastanza tempo. Ce l'ho fatta. Il Dormiente...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //…è stato scacciato. L'hai sconfitto, è vero, ma non rientra nei nostri poteri fermare la guerra che si scatenerà ora.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //Con il suo urlo finale, il Dormiente ha messo in moto gli eserciti delle tenebre.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //Si è trattato di un ordine a tutte le creature del male. Un comando a cui tutti sono stati costretti a obbedire.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Il suo ultimo ordine è stato: VENITE! Ed essi sono venuti. Tutti quanti. Anche i draghi.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //(sbalordito) ...I draghi!
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Sono creature di antico potere. Riesco ad avvertire la loro presenza persino da qui.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Hanno ammassato un intero esercito di umili servitori intorno a loro.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //Dove si trova ora questo esercito?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //L'esercito è accampato non lontano da qui, nella Valle delle Miniere vicino Khorinis, e si sta preparando ad attaccare.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //(pensieroso) Non c'è rimasto molto tempo.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Ma non è tutto. C'è un'ALTRA minaccia di cui siamo venuti a conoscenza soltanto da poco.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "Di quale ALTRA minaccia stai parlando?", DIA_Addon_Xardas_Hello_Man );
	};
};
	
///////////////////////////////////////////////////////////////////////
//	Info AWAY
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_AWAY (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_AWAY_Condition;
	information	 = 	DIA_Xardas_AWAY_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Bene, allora andiamocene subito via di qui.";
};

func int DIA_Xardas_AWAY_Condition ()
{	
	if (!Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (!Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info ()
{
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //Allora sbrighiamoci ad andarcene!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //Se scappiamo ora, rimanderemo solo il nostro scontro con i draghi a più tardi.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //Con l'aiuto dei soldati e dei maghi che vivono da queste parti possiamo fermarli, prima che il loro esercito sia completamente formato.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //Non avremo un'occasione migliore di questa.
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_TODO (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	1;
	condition	 = 	DIA_Xardas_TODO_Condition;
	information	 = 	DIA_Xardas_TODO_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Cosa facciamo, adesso?";
};

func int DIA_Xardas_TODO_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info ()
{
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //Cosa possiamo fare?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Stavolta non possiamo farcela da soli. Solo il potere di Innos può aiutarci ad affrontare questi draghi.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //Un gruppo di paladini si è stanziato nella città di Khorinis, non molto lontano da qui.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //Essi possiedono un potente artefatto che potrebbe aiutarci a sconfiggere i draghi.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //Lo chiamano l''Occhio di Innos'. Devi impossessarti di questo artefatto.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Metti al corrente i paladini della minaccia. DEVI riuscire a convincere il loro capo ad aiutarci!
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //Dopo che avrai parlato con lui, dovrai trovare il manufatto di Beliar.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //È complementare all'Occhio di Innos. Non deve cadere nelle mani del Male.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"C'è un gruppo di paladini accampati nella città di Khorinis. Essi hanno un potente artefatto con loro: l'Occhio di Innos. Il suo potere dovrebbe aiutarci a respingere la minaccia dei draghi. Devo persuadere i paladini a unirsi alla nostra causa."); 
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlate
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Xardas_StonePlate		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Xardas_StonePlate_Condition;
	information	 = 	DIA_Addon_Xardas_StonePlate_Info;

	description	 = 	"Puoi dirmi qualcos'altro su questa tavoletta?";
};
func int DIA_Addon_Xardas_StonePlate_Condition ()
{
	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Xardas_StonePlate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //Puoi dirmi qualcos'altro su questa tavoletta?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der Höhlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //Inizialmente pensavo fosse un manufatto magico, ma ora ritengo che non rivesta una particolare importanza.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //Non sono riuscito a decifrare completamente il significato della tavoletta, ma sembra riguardi la storia di un popolo molto antico.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //Se vuoi la tavoletta prendila pure, io non so che farmene.

	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// ***														***
// 						Addon Report
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Portal entdeckt
// ------------------------------------------------------------
instance DIA_Addon_Xardas_Portal (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_Portal_Condition;
	information	= DIA_Addon_Xardas_Portal_Info;

	description	= "I Maghi dell'Acqua hanno scoperto un portale per una parte sconosciuta dell'isola...";
};

func int DIA_Addon_Xardas_Portal_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_WhatsOrnament))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //I Maghi dell'Acqua hanno scoperto un portale per una parte sconosciuta dell'isola...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //Interessante...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //Non appena avrai trovato qualcosa di DAVVERO utile, vieni subito a riferirmelo!
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //Il manufatto di Beliar potrebbe essere nascosto lì. Trovalo!
};

// ------------------------------------------------------------
// 						Nochmal wegen Portal
// ------------------------------------------------------------
instance DIA_Addon_Xardas_PortalAgain (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_PortalAgain_Condition;
	information	= DIA_Addon_Xardas_PortalAgain_Info;
	permanent 	= TRUE;
	description	= "La parte sconosciuta dell'isola...";
};

func int DIA_Addon_Xardas_PortalAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Xardas_Portal))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //La parte sconosciuta dell'isola...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //Non seccarmi con queste minuzie. Torna quando avrai trovato qualcosa di utile.
};

// ------------------------------------------------------------
// 						Addon Success
// ------------------------------------------------------------
instance DIA_Addon_Xardas_AddonSuccess (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_AddonSuccess_Condition;
	information	= DIA_Addon_Xardas_AddonSuccess_Info;

	description	= "Ho esplorato la parte sconosciuta dell'isola...";
};

func int DIA_Addon_Xardas_AddonSuccess_Condition ()
{
	if (C_SCHasBeliarsWeapon())
	|| (Saturas_KlaueInsMeer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //Ho esplorato la parte sconosciuta dell'isola...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //E cosa hai trovato?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //Un potente manufatto: l'Artiglio di Beliar.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //L'Artiglio di Beliar?! Dov'è adesso? L'hai con te?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Sì, eccolo.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //(avidamente) Interessante.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Quest'arma potrebbe esserci utilissima, ma è anche estremamente pericolosa.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //Bada a te! E soprattutto: non perderla!
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //Non ce l'ho più...
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //L'ho dati ai Maghi dell'Acqua così che potessero gettarlo in mare...
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //Sei pazzo? Hai idea di cosa ti sei lasciato sfuggire?
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //Quell'arma avrebbe potuto esserci utilissima!
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //Penso sia stato meglio così.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //(sospira) Le vie degli dei sono imperscrutabili...
	};
};

// --------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_WEAPON (C_INFO)		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_WEAPON_Condition;
	information	 = 	DIA_Xardas_WEAPON_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Ho bisogno di armi.";
};

func int DIA_Xardas_WEAPON_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //Ho bisogno di armi.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //Posso darti solo quel poco che mi è rimasto qui.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Dai un'occhiata nella torre. Puoi prendere tutto ciò che ritieni utile.
};


///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ARTEFAKT (C_INFO)	//E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_ARTEFAKT_Condition;
	information	 = 	DIA_Xardas_ARTEFAKT_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Cos’è esattamente l’Occhio di Innos?";
};

func int DIA_Xardas_ARTEFAKT_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //Cos’è esattamente l’Occhio di Innos?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //Si tratta di un amuleto. Secondo la leggenda, Innos vi avrebbe infuso parte del suo stesso potere.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Esso ti permetterà di recuperare una parte della forza che hai perduto, e ci aiuterà a sconfiggere i draghi.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //Possiede anche alcuni poteri nascosti. Ti dirò di più una volta che avrai ottenuto l'amuleto.
};

///////////////////////////////////////////////////////////////////////
//	Info PALADIN
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PALADIN	(C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	3;
	condition	 = 	DIA_Xardas_PALADIN_Condition;
	information	 = 	DIA_Xardas_PALADIN_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Perché i paladini dovrebbero consegnarmi l’Occhio di Innos?";
};
func int DIA_Xardas_PALADIN_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_PALADIN_Info ()
{
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //Perché i paladini dovrebbero consegnarmi l’Occhio di Innos?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Perché tu sei quello destinato a portarlo.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //Come fai a saperlo?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //Ci sono diversi motivi, il più importante dei quali è che sei riuscito a sconfiggere il Dormiente. Se non fossi un prescelto dagli dei, a quest'ora saresti già morto.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //Supponiamo che tu abbia ragione e che io sia destinato a portare l'Occhio di Innos... Come faccio a convincere i paladini?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //È l'Occhio stesso a scegliere chi può portarlo. Una volta che lo avrai indossato, i paladini non potranno più dubitare della tue parole.
};
///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Khorinis (C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	4;
	condition	 = 	DIA_Xardas_Khorinis_Condition;
	information	 = 	DIA_Xardas_Khorinis_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Come si arriva in città?";
};
func int DIA_Xardas_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Lothar.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //Come si arriva in città?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //Segui il sentiero attraverso le montagne. La città è grande, non puoi sbagliarti.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //Ma fai attenzione! La strada per la città è ricca di pericoli, e tu non sei più forte come una volta.
};
// ************************************************************
// 			  		Zum zweiten Mal bei Xardas
// ************************************************************

instance DIA_Xardas_WhereEx (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	6;
	condition	 = 	DIA_Xardas_WhereEx_Condition;
	information	 = 	DIA_Xardas_WhereEx_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dove ci troviamo esattamente?";
};

func int DIA_Xardas_WhereEx_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //Dove siamo esattamente?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //Come ti ho già detto, ci troviamo vicino alla città di Khorinis.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //Ho ricostruito la mia torre qui.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Ma sono passati solo pochi giorni dall'ultima volta che ci siamo visti nella Valle delle Miniere...
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //I servi che ho evocato per costruire la mia torre hanno fatto un buon lavoro...
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //Puoi dirlo forte.
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dove posso trovare un equipaggiamento migliore?";
};

func int DIA_Xardas_EQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_WEAPON))
	&& (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //Dove posso trovare un equipaggiamento migliore?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //Il posto più vicino dove puoi ottenere delle armi e delle armature migliori è la città di Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Ma giù nella valle puoi trovare alcune erbe guaritrici che ti aiuteranno nel caso in cui venissi ferito in battaglia.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Vedi il lago proprio di fronte alla mia torre? C'è un passaggio segreto che da lì porta alla valle.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTLESTER
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ABOUTLESTER		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_ABOUTLESTER_Condition;
	information	 = 	DIA_Xardas_ABOUTLESTER_Info;
	permanent	 = 	FALSE;
	description	 = 	"Hai già parlato con Lester?";
};
func int DIA_Xardas_ABOUTLESTER_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	&& (Npc_GetDistToWP  (Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)) 
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_ABOUTLESTER_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //Hai già parlato con Lester?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Sì, l'ho tempestato di domande. Mi ha detto un sacco di cose, ma ora è completamente esausto.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //È quasi un miracolo che sia riuscito a sopravvivere a questa fuga. Ora l'ho mandato a riposare.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //Cosa ti ha detto?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Niente di buono, temo. Egli non solo ha visto i draghi, ma anche alcuni uomini incappucciati con dei mantelli neri.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //E allora?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Se questi uomini esistono davvero, allora la loro presenza potrebbe significare una possibile minaccia.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //E la cosa non mi piace affatto. Tieni, prendi il mio anello. Ti proteggerà contro la magia.
	
	B_GiveInvItems (self, other, ItRi_Prot_Mage_01,1);
	B_GivePlayerXP		(XP_Ambient);

};

// *************************************************************
// -------------------------------------------------------------
//						NACH erstem Exit !!!
// -------------------------------------------------------------
// ************************************************************				//x

///////////////////////////////////////////////////////////////////////
//	Bei Paladinen gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_FirstPal		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	10;
	condition	 = 	DIA_Xardas_FirstPal_Condition;
	information	 = 	DIA_Xardas_FirstPal_Info;
	permanent	 = 	FALSE;
	description	 = 	"Sono stato in città...";
};
func int DIA_Xardas_FirstPal_Condition ()
{	
	if (Lothar.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Xardas_FirstPal_Info ()
{
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //Sono stato in città...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //E... ? Sei riuscito a parlare con il capo dei paladini?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //Non mi hanno lasciato incontrarlo...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //Sciocchezze! Deve esserci un modo per poterlo incontrare.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Se non dovessi trovare altre soluzioni, entra nel monastero e diventa un mago.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Si tratta di una soluzione moralmente discutibile, ma dovrebbe aiutarti a ottenere ciò che ti serve.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Se tu fossi un mago, egli acconsentirebbe sicuramente a incontrarti.
};

///////////////////////////////////////////////////////////////////////
//	Info Weiter (Perm)
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Weiter		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	99;
	condition	 = 	DIA_Xardas_Weiter_Condition;
	information	 = 	DIA_Xardas_Weiter_Info;
	permanent	 = 	TRUE;
	description	 = 	"Qual è la prossima mossa?";
};
func int DIA_Xardas_Weiter_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_Weiter_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //Qual è la prossima mossa?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Procederemo come stabilito. Non c'è altra via.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Vai a prendere l'Occhio di Innos mentre io continuerò a cercare delle risposte.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "Perché il Circolo del Fuoco non è tenuto a sapere della tua esistenza?";
};                       

FUNC INT DIA_Xardas_KdfSecret_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Xardas_KdfSecret_Info()
{	
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//Perché il Circolo del Fuoco non dovrebbe sapere della tua esistenza?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//Un tempo ero un alto membro del Circolo del Fuoco. Già allora sospettavo che la magia demoniaca potesse essere la chiave per la barriera magica.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Ma non sono mai riuscito a convincere gli altri membri del Circolo a seguire questa strada.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Dunque ho abbandonato il Circolo per dedicarmi allo studio della magia nera.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //Questo è un crimine per il quale i maghi del fuoco, (ironico) i Prescelti di Innos, gli eterni 'buoni' e 'virtuosi', non mi perdoneranno mai.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Essi sanno sicuramente che sono ancora vivo, ma non hanno idea di dove mi trovi, e anche questa è una cosa positiva.
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

INSTANCE DIA_Xardas_KAP3_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP3_EXIT_Condition;
	information	= DIA_Xardas_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BACKFROMOW		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	31;
	condition	 = 	DIA_Xardas_BACKFROMOW_Condition;
	information	 = 	DIA_Xardas_BACKFROMOW_Info;

	description	 = 	"Sono tornato dalla Valle delle Miniere.";
};

func int DIA_Xardas_BACKFROMOW_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //Sono tornato dalla Valle delle Miniere.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //Era ora. Che cosa hai visto?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //Avevi ragione. La valle è stata invasa da un massiccio esercito del nemico.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Gli orchi stanno assediando il castello, e i draghi hanno portato la devastazione in intere zone.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Se non vado errato, non ci vorrà molto prima che attacchino Khorinis.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DmtSindDa
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_DMTSINDDA		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	32;
	condition	 = 	DIA_Xardas_DMTSINDDA_Condition;
	information	 = 	DIA_Xardas_DMTSINDDA_Info;

	description	 = 	"Cosa diavolo è successo qui nel frattempo?";
};

func int DIA_Xardas_DMTSINDDA_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_KnowsInfo(other, DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info ()
{

 	if (Npc_KnowsInfo(other, DIA_Lester_BACKINTOWN))
	{
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //Lester mi ha detto che volevi vedermi immediatamente.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //Cosa diavolo è successo qui nel frattempo?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //Il nemico ha saputo chi sei veramente e che hai intenzione di prendere l'Occhio di Innos.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //Si è reso conto della minaccia. La cosa lo ha costretto a venire allo scoperto e ad attaccare.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Il gioco a nascondino è finito. Ieri nessuno sapeva come sarebbe stato l'attacco da parte del nemico, ora è diventato fin troppo ovvio.

	B_LogEntry (TOPIC_INNOSEYE, "Il nemico ha scoperto che sto cercando l'Occhio di Innos. È ora che io lo trovi, prima che sia troppo tardi.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Sono stato attaccato dai maghi dalle toghe nere.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Ho finalmente recuperato la prova per Lord Hagen.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //Sono stato attaccato da alcuni maghi dalle vesti nere.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //Il nemico ha molte facce. The Seekers are one of them. Essi sono coloro che preparano il terreno all'avanzata del nemico.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Hanno preso posizione in punti strategici, e ora stanno aspettando solo l'occasione giusta per far scattare la loro trappola.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Stai alla larga da loro. Sono creature magiche molto potenti e cercheranno di ostacolarti ad ogni costo.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas conosceva gli uomini dalle vesti nere. Sembra che i Cercatori siano quelli che muovono i fili delle forze nemiche, e sono veramente pericolosi."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //Finalmente ho la prova che mi aveva chiesto Lord Hagen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //Di che prova si tratta?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //Ho ricevuto una lettera da Garond, il comandante dei paladini nella Valle delle Miniere, nella quale chiede rinforzi.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //Questo dovrebbe bastare a convincere quel guerrafondaio. Hai fatto un bel lavoro.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Qual è il passo successivo?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //Qual è il passo successivo?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Vai da Lord Hagen e consegnagli la lettera di Garond, in modo che egli possa garantirti l'accesso all'Occhio di Innos.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Quindi vai al monastero e parla con Pyrokar. Deve consegnarti l'Occhio.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Niente è più importante che mettere in salvo questo artefatto.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //Vai ora, prima che sia troppo tardi. Anche il nemico cercherà di impossessarsi dell'amuleto.
	B_LogEntry (TOPIC_INNOSEYE, "L'Occhio è nel monastero dei Maghi del Fuoco. Spero che Lord Hagen mi conceda il suo permesso dopo che gli avrò consegnato il messaggio da parte di Lord Garond. Il capo dei Maghi del Fuoco, Pyrokar, non mi farà avvicinare all'amuleto senza il permesso di Hagen.");
};

///////////////////////////////////////////////////////////////////////
//	Info InnosEyeBroken
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_INNOSEYEBROKEN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	33;
	condition	 = 	DIA_Xardas_INNOSEYEBROKEN_Condition;
	information	 = 	DIA_Xardas_INNOSEYEBROKEN_Info;

	description	 = 	"L’Occhio di Innos è stato distrutto.";
};

func int DIA_Xardas_INNOSEYEBROKEN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Xardas_DMTSINDDA))
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //L’Occhio di Innos è stato distrutto.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //Cosa stai dicendo? Distrutto?
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //L'ho trovato nelle foresta a nord, ma sfortunatamente sono riuscito a recuperarne solo i frammenti.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //Era la nostra unica speranza per combattere i draghi, ed è andata persa. Abbiamo fallito.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "E adesso?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //E adesso?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //Questo è un colpo terribile. Dobbiamo riorganizzarci. Mi ritirerò a meditare sulla situazione.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //Nel frattempo, dovresti recarti in città a parlare con Vatras, il Mago dell'Acqua. Spero che egli sappia cosa si può fare.

	B_LogEntry (TOPIC_INNOSEYE, "Xardas non è stato molto felice di sentire della distruzione dell'Occhio di Innos. Vatras, il Mago dell'Acqua in città, sembra essere la nostra unica speranza ormai.");

	MIS_Xardas_GoToVatrasInnoseye = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info RitualRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RITUALREQUEST		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_RITUALREQUEST_Condition;
	information	 = 	DIA_Xardas_RITUALREQUEST_Info;

	description	 = 	"Andre mi ha mandato da te.";
};

func int DIA_Xardas_RITUALREQUEST_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Xardas_INNOSEYEBROKEN))
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RITUALREQUEST_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //Vatras mi ha mandato da te.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //Mi fa piacere. Cosa ti ha detto?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Ha detto qualcosa a proposito di un rituale di annullamento al Circolo del Sole.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //(ride) Quel vecchio demonio. Credo di sapere a cosa stia pensando. Sei venuto per convincermi ad andare da lui?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //Pare proprio di sì. Quando partirai?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //Non devo far aspettare Vatras. Mi metterò subito in viaggio. Completa i tuoi compiti e raggiungimi.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas ha accettato di presentarsi al rituale del Circolo del Sole.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Accetterò di presenziare al rituale solo quando sarò sicuro che tu sia pronto ad affrontare i draghi.
	};	
	B_GivePlayerXP (XP_Ambient);

};


///////////////////////////////////////////////////////////////////////
//	Info warumnichtjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WARUMNICHTJETZT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_WARUMNICHTJETZT_Condition;
	information	 = 	DIA_Xardas_WARUMNICHTJETZT_Info;

	description	 = 	"Perché non vai IMMEDIATAMENTE da Vatras?";
};

func int DIA_Xardas_WARUMNICHTJETZT_Condition ()
{
	if  (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&&	(Xardas_GoesToRitualInnosEye == FALSE)
	&& 	((hero.guild == GIL_MIL)
	|| 	 (hero.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //Perché non vai IMMEDIATAMENTE da Vatras?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //A volte non ti capisco proprio.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //(irritato) Non rivolgerti a me con quel tono. Se non fosse stato per ME, il tuo misero corpo starebbe ancora marcendo all'interno di quel tempio.

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Lascia perdere. Dimmi solo cosa devo fare.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Allora, spiegami almeno perché sei titubante.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Allora spiegami almeno i motivi della tua esitazione.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Da quando ho abbandonato i Maghi del Fuoco, mi sono tenuto a debita distanza da loro.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //E non intendo cambiare idea, a meno che non mi rimanga altra scelta.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Ma prima di espormi agli sguardi di rimprovero dei maghi, voglio essere certo che tu abbia anche la minima speranza di farcela contro i draghi.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //Ad ogni modo, non andrai molto lontano con quel tuo equipaggiamento logoro. Torna da me, ma solo quando sarai abbastanza forte.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Lascia perdere. Dimmi solo cosa devo fare.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Sei ancora troppo debole per combattere i draghi. Con questo equipaggiamento non hai nessuna speranza.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //Non tornare finché non sarai preparato meglio. Solo allora mi unirò a Vatras.
 	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bereit
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BEREIT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	condition	 = 	DIA_Xardas_BEREIT_Condition;
	information	 = 	DIA_Xardas_BEREIT_Info;

	description	 = 	"Sono pronto a combattere contro i draghi.";
};

func int DIA_Xardas_BEREIT_Condition ()
{
	if  (Xardas_GoesToRitualInnosEye == FALSE)
	&& 	(Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))	
	&&	((hero.guild == GIL_DJG)
	||   (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Sono pronto a combattere contro i draghi.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //Non dobbiamo perdere altro tempo allora. Mi metterò subito in viaggio per il Circolo del Sole. Completa i tuoi compiti, ci rivedremo lì.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas ha accettato di presentarsi al rituale del Circolo del Sole.");
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair"); 
	Xardas_GoesToRitualInnosEye = TRUE; 
};

///////////////////////////////////////////////////////////////////////
//	Info bingespannt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BINGESPANNT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	35;
	condition	 = 	DIA_Xardas_BINGESPANNT_Condition;
	information	 = 	DIA_Xardas_BINGESPANNT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pensi che il rito di annullamento funzionerà?";
};

func int DIA_Xardas_BINGESPANNT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		&& 	(Xardas_GoesToRitualInnosEye == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_BINGESPANNT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //Pensi che il rito di annullamento funzionerà?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //Non posso esserne certo. Dipende da cosa farà esattamente Vatras.
};

///////////////////////////////////////////////////////////////////////
//	Info PyroWillNicht
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PYROWILLNICHT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	37;
	condition	 = 	DIA_Xardas_PYROWILLNICHT_Condition;
	information	 = 	DIA_Xardas_PYROWILLNICHT_Info;

	description	 = 	"Pyrokar non ha intenzione di presentarsi al rito.";
};

func int DIA_Xardas_PYROWILLNICHT_Condition ()
{
	if (Pyrokar_DeniesInnosEyeRitual == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Xardas_PYROWILLNICHT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //Pyrokar si rifiuta di partecipare al rito.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //Prima vuole una prova che gli dimostri che può fidarsi di te.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //Ma davvero? Pyrokar. Interessante
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Quel vecchio rimbambito sta diventando un fastidio. Ma credo di avere qualcosa che potrà tornarci utile.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Quando ho abbandonato l'Ordine dei Maghi del Fuoco, ho portato con me alcune cose dal monastero.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich ständig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen könnte - Satz ist eh überflüssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //Non volevo che un gruppo di paladini o che i Maghi del Fuoco rivoltassero un giorno la mia torre da cima a fondo e trovassero tutte quelle cose.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Così le ho nascoste in alcuni posti sicuri, dove i maghi non le cercheranno di certo.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //E dove?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //Alcune di esse si trovano chiuse nel forziere alla fattoria di Sekob.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //Ti fidi di Sekob?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //No. Ma può essere comprato e non fa domande imbarazzanti. Inoltre il forziere è chiuso, e la chiave ce l'ho io.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Fra le tante cose c'è un libro molto vecchio. Quando Pyrokar lo vedrà, capirà che l'ho mandato io.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //A me non serve più, dunque credo che potrà tornarti utile come prova.
	B_LogEntry (TOPIC_INNOSEYE, "Xardas mi ha dato la chiave per il forziere nella fattoria di Sekob. Dovrò portare a Pyrokar il libro lì custodito.");
};


///////////////////////////////////////////////////////////////////////
//	Info RitualInnosEyeRepairImportant
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RitualInnosEyeRepairImportant		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important	 = 	TRUE;

};

func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info ()
{
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //Ora che l'Occhio di Innos è stato riparato, devi affrontare i draghi!
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //Essi servono tutti Beliar, il dio delle tenebre.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Ma ci deve essere un potere terreno che li controlla. Non può essere altrimenti.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //Scopri qual è la fonte del loro potere.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //Torna da me non appena l'avrai scoperta!
	
	Info_ClearChoices	(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice	(DIA_Xardas_RitualInnosEyeRepairImportant, DIALOG_ENDE, DIA_Xardas_RitualInnosEyeRepairImportant_weiter );

};		

 func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
 {
	AI_StopProcessInfos (self);
	B_StartOtherRoutine (Xardas,"Start");
  	B_StartOtherRoutine	(Vatras,"Start");

 };

///////////////////////////////////////////////////////////////////////
//	Info wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WASNUN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_WASNUN_Condition;
	information	 = 	DIA_Xardas_WASNUN_Info;
	permanent	 = 	TRUE;

	description	 = 	"L’Occhio di Innos è guarito. E adesso?";
};

func int DIA_Xardas_WASNUN_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //L’Occhio di Innos è stato ripristinato. E adesso?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //Non dimenticarti di indossarlo quando affronterai i draghi.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //Non perdere altro tempo. Vai nella Valle delle Miniere e uccidi quei draghi.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //Vai da Pyrokar e fatti spiegare come usare l'Occhio.
	};
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

INSTANCE DIA_Xardas_KAP4_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP4_EXIT_Condition;
	information	= DIA_Xardas_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PERM4		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	40;
	condition	 = 	DIA_Xardas_PERM4_Condition;
	information	 = 	DIA_Xardas_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Novità?";
};

func int DIA_Xardas_PERM4_Condition ()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PERM4_15_00"); //Ci sono novità?
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //I Cercatori non se ne sono ancora andati. Non avranno pace fino a quando non ti avranno trovato.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Uccidi i draghi nella Valle delle Miniere e scopri chi è il responsabile di questi attacchi, altrimenti la loro forza è destinata a crescere.

};


//#####################################################################
//##
//##
//##							KAPITEL 5 //Xardas ist weg!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP5_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP5_EXIT_Condition;
	information	= DIA_Xardas_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6 //Xardas ist auf der Dracheninsel ->neue Instanz!!!
//##
//##
//#####################################################################



INSTANCE DIA_Xardas_KAP6_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP6_EXIT_Condition;
	information	= DIA_Xardas_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



























































