// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_EXIT_Condition;
	information	= DIA_Lester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_Hello (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Hello_Condition;
	information	= DIA_Lester_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       
FUNC INT DIA_Lester_Hello_Condition()
{	
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Hello_Info()
{	
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//Sei TU? Davvero! Ehi, sono felice di rivederti!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "Ci conosciamo?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lester! Come sei arrivato qui?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lester! Come sei arrivato qui?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//È stata una fuga pazzesca. Dopo che la Barriera è esplosa ho vagato nella zona per un po', in preda alla confusione.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Poi ho trascorso i miei giorni aprendomi la strada attraverso questi boschi, fino a quando non ho trovato questa valle.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten e Gorn sono ancora nella Valle delle Miniere. Perlomeno, così credo.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//Dovrei conoscerti?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Pronto? C'è qualcuno in casa? Ho rischiato la vita per farti avere quella strana pietra.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Mi devi qualcosa... QUESTO dovresti ricordartelo.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//Ti ricordi ancora Diego, Milten e Gorn?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten e CHI?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Certo. Che mi dici di loro?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Certo. Ce mi dici di loro?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Per quanto ne so, dovrebbero essere sopravvissuti alla distruzione della Barriera.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Non ho idea di dove essi siano adesso, quei tre stanno probabilmente ancora vagando nella Valle della Miniera.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Se li incontri, fammelo sapere.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten e CHI?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Non dirmi che non te li ricordi. Le pietre focalizzatrici, il troll, l'enorme mucchio di metallo dei Maghi dell'Acqua...?
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Non sono sicuro...
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Ti ricorderai col tempo. C'è voluto un po' per schiarirmi le idee anche per me.
};
// ************************************************************
// 		  				  Was ist passiert?		//E1
// ************************************************************
INSTANCE DIA_Lester_WhatHappened (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_WhatHappened_Condition;
	information	= DIA_Lester_WhatHappened_Info;
	permanent	= FALSE;
	description = "Cosa è successo?";
};                       
FUNC INT DIA_Lester_WhatHappened_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_WhatHappened_Info()
{	
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//Cosa è successo?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//Dopo che il Dormiente è stato sconfitto, l'intera Fratellanza ha perduto la ragione.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Senza il loro maestro erano solamente degli involucri vuoti.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//E tu? Cosa mi dici di te?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//È stato lo stesso anche per me. Ho avuto incubi e persino allucinazioni. Ma una volta che la mia mente è stata più o meno sgombra, sono scappato.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//Una volta mi è parso di vedere una gigantesca ombra scura calare su un gruppo di fuggitivi e incenerirli tutti in una gigantesca nube di fuoco.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//In quel momento ho veramente creduto che un drago fosse venuto a uccidermi.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Hai visto qualcos'altro?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//No, ho alzato i tacchi e sono scappato via!
};
// ************************************************************
// 		  				   Minental		 		//E1 
// ************************************************************
INSTANCE DIA_Lester_MineColony (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_MineColony_Condition;
	information	= DIA_Lester_MineColony_Info;
	permanent	= FALSE;
	description = "Da quanto tempo ti nascondi in questa valle?";
};                       
FUNC INT DIA_Lester_MineColony_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_MineColony_Info()
{	
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//Da quanto tempo ti nascondi in questa valle?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//Non lo so con esattezza. Una settimana, forse. Ma c'è dell'altro:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Quando sono arrivato, di sera, ho gettato uno sguardo alla montagna, c'erano solo alcuni alberi laggiù.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//E quando, il mattino seguente, ho alzato lo sguardo, ho visto quella torre. Avrei potuto giurare che prima non ci fosse. Da allora non ho più lasciato la valle.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//Intendi la torre di Xardas? Sapevo che fosse potente, ma creare una torre così...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Xardas il negromante? Vive in quella torre? Non so se questo mi faccia piacere...
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Non preoccuparti, è stato lui a soccorrermi nel tempio del Dormiente. È dalla nostra parte.
};
///////////////////////////////////////////////////////////////////////
//	Info SEND_XARDAS
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_SEND_XARDAS		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_SEND_XARDAS_Condition;
	information	 = 	DIA_Lester_SEND_XARDAS_Info;
	permanent	 = 	FALSE;
	description	 = 	"Devi parlare a Xardas dell’ombra...";
};
func int DIA_Lester_SEND_XARDAS_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Lester_WhatHappened)
	&& Npc_KnowsInfo (other,DIA_Lester_MineColony)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_SEND_XARDAS_Info ()
{
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Devi raccontare a Xardas dell'ombra che hai visto, potrebbe essere importante.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //Pensi non sia stata solo la mia immaginazione? Vuoi dire che c'era veramente un...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //...drago. Sì.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Stai per lanciarti nuovamente nel bel mezzo di una delle tue avventure, vero?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Non direi proprio nel mezzo... non ancora.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //(sospira) Bene, d'accordo, se è così importante, allora andrò a incontrarlo, ma non ora.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //Per il momento intendo riposarmi. Sono ancora esausto dopo la fuga dalla colonia penale.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //Credo tu abbia grandi progetti. Ci vedremo più tardi da Xardas.
	
	AI_StopProcessInfos (self);
	
	//wird bei LOLO zu Xardas gebeamt
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_STADT		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_STADT_Condition;
	information	 = 	DIA_Addon_Lester_STADT_Info;

	description	 = 	"Sono diretto a KHORINIS! Cosa sai della città?";
};

func int DIA_Addon_Lester_STADT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_STADT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //Sto andando a Khorinis! Cosa sai sulla città?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Su Khorinis? Beh, è una città portuale, niente di speciale.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Perché me lo chiedi?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Devo recarmi dai paladini che si dice siano in città.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //(ride) Ma davvero? Ah! Non ti faranno neppure entrare in città, tantomeno nella zona in cui si trovano i paladini.
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_Vorschlag		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_Vorschlag_Condition;
	information	 = 	DIA_Addon_Lester_Vorschlag_Info;

	description	 = 	"Puoi suggerirmi un modo per entrare in città?";
};

func int DIA_Addon_Lester_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lester_STADT))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //Puoi suggerirmi un modo per entrare in città?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Sicuro. Qualche tempo fa lavoravo per un vecchio alchimista di nome Constantino.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //È un personaggio molto influente in città, e ha ordinato alle guardie di lasciar entrare chiunque possa vendergli erbe rare.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //È presto detto: raccogli un bel fascio di quelle erbe che crescono qui intorno, poi ti presenti alle porte della città sostenendo di lavorare per Constantino ed è fatta.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Ma non raccogliere un miscuglio di piante. Le guardie non sono delle arche di scienza, e non sanno nulla di alchimia.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //Ma il tuo fascio di erbe deve avere un'aria convincente.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //10 esemplari dello stesso tipo di pianta dovrebbero essere sufficienti.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Grazie per il suggerimento.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester dice che posso aggirare le guardie cittadine portando 10 piante dello stesso tipo, purché dica loro che sono per il vecchio alchimista Constantino."); 
	
	MIS_Addon_Lester_PickForConstantino = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info PASSAGEPLANTSSUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;

	description	 = 	"Quella storia delle piante per Constantino ha funzionato d'incanto.";
};

func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition ()
{
	if (MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //L'idea di portare le piante a Constantino ha funzionato a meraviglia. Sono riuscito a entrare.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //Proprio come ti avevo detto. Dovresti darmi retta ogni tanto, amico mio.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 		  		Perm	
// ************************************************************
INSTANCE DIA_Lester_Perm (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Perm_Condition;
	information	= DIA_Lester_Perm_Info;
	permanent	= TRUE;
	description = "Cosa puoi dirmi della zona?";
};                       
FUNC INT DIA_Lester_Perm_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_LESTER") <= 2000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Perm_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//Cosa puoi dirmi della zona?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Se continui per quella strada arriverai a una fattoria. La città inizia poco oltre.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Ma fai attenzione, non ci sono solamente lupi e ratti in zona, ma anche goblin e briganti!
};
// ************************************************************
// 		  		Sleep
// ************************************************************
INSTANCE DIA_Lester_Sleep (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Sleep_Condition;
	information	= DIA_Lester_Sleep_Info;
	permanent	= TRUE;
	description = "Sei ancora esausto?";
};                       
FUNC INT DIA_Lester_Sleep_Condition()
{
	if  (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_IN1_31") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Sleep_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Sei ancora esausto?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//E tanto. (sbadiglia) Ho raccontato tutto quanto a Xardas. Ora dormirò un po'. Credo, un giorno o...
	AI_Output	(self, other,"DIA_Lester_Sleep_13_02");	//...due ...o più.
	
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

INSTANCE DIA_Lester_KAP3_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP3_EXIT_Condition;
	information	= DIA_Lester_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BACKINTOWN
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_BACKINTOWN		(C_INFO) 
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_BACKINTOWN_Condition;
	information	 = 	DIA_Lester_BACKINTOWN_Info;
	important	 = 	TRUE;
};
func int DIA_Lester_BACKINTOWN_Condition ()
{	
	if (Npc_GetDistToWP (self, "LEVELCHANGE") <= 500) 
		&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_BACKINTOWN_Info ()
{
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //Ehi, sei tornato finalmente! Devi subito andare a parlare con Xardas, c'è un problema.
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //Lo credo proprio.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //È scoppiato un inferno da quando sei partito.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Parla con Xardas, ti sta aspettando!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas mi ha dato questa runa per te. Ti aiuterà a raggiungerlo più in fretta. Ci incontreremo lì più tardi.
	
	CreateInvItems 		(self,ItRu_TeleportXardas,1);
	B_GiveInvItems 		(self,other,ItRu_TeleportXardas,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");	//Joly: Lester geht wieder zurück in sein Tal!
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_PERM3		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	900;
	condition	 = 	DIA_Lester_PERM3_Condition;
	information	 = 	DIA_Lester_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Non sembri così forte.";
};

func int DIA_Lester_PERM3_Condition ()
{
	if (Kapitel >= 3)
	&& (Lester_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

var int DIA_Lester_PERM3_OneTime;
func void DIA_Lester_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //Non sembri così forte.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //Neanch'io mi sento molto bene, amico. Sono completamente esausto, e ho un continuo mal di testa.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Ogni volta che spunta fuori uno dei quegli incappucciati neri peggiora.
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //E posso anche dirti esattamente il perché.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Davvero? Non credo di volerlo sapere.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Questi incappucciati neri o Cercatori, come li chiamiamo noi maghi, erano i seguaci di un potente arcidemone. Ti dice qualcosa?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Mmmh, no. A meno che tu non voglia dirmi che...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //Sì, esatto. I Cercatori erano i seguaci del Dormiente. La setta rinnegata dei pazzi di Campo Palude.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //Erano i tuoi compagni, Lester, la vecchia Confraternita del Dormiente. Ora non sono altro che schiavi del male privi di anima.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Ne avevo il sospetto, ma speravo non fosse così. Vuoi dire che egli è tornato? Il Dormiente è nuovamente qui?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Buona domanda. Tutto quello che so di certo è che devo fermare i Cercatori, prima che diventino troppo potenti.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //Non mi piace l'idea, ma immagino tu abbia ragione. Mi dispiace, tutto questo mi sta dando alla testa.
					B_LogEntry (TOPIC_DEMENTOREN,"I miei sospetti hanno trovato conferma. Anche Lester non ha dubbi che i Cercatori siano dei seguaci del Dormiente del vecchio Campo Palude."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //Il mal di testa c'è ancora, ma spero che il problema si risolva presto.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //In un modo o nell'altro.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //Il mio mal di testa è diventato insopportabile. E ora anche questi uomini lucertola continuano ad attaccarmi. Mi chiedo da dove vengano.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //Questo mal di testa non si placa. C'è qualcosa che non va.
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //(sospira) Penso che mi riposerò prima.
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

INSTANCE DIA_Lester_KAP4_EXIT(C_INFO)
{
	npc		= PC_Psionic;
	nr		= 999;
	condition	= DIA_Lester_KAP4_EXIT_Condition;
	information	= DIA_Lester_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP4_EXIT_Info()
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

INSTANCE DIA_Lester_KAP5_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP5_EXIT_Condition;
	information	= DIA_Lester_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info XardasWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_XARDASWEG		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_XARDASWEG_Condition;
	information	 = 	DIA_Lester_XARDASWEG_Info;

	description	 = 	"Dov’è Xardas?";
};

func int DIA_Lester_XARDASWEG_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_00"); //Dov’è Xardas?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Se n'è andato, e ha lasciato questi esseri demoniaci nella torre.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Penso non voglia che qualcuno vada in giro a curiosare per la torre durante la sua assenza.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Dov'è andato?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //Non me lo ha detto. Mi ha solo chiesto di consegnarti questa lettera da parte sua.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //L'ho letta. Mi dispiace, ero curioso.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //E allora?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //Non ne ho idea, non ho capito una parola, amico. Ma una cosa è chiara: non lo rivedremo presto.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //Penso che la situazione si sia fatta troppo scottante per lui, e che si sia diretto verso le colline.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas è scomparso. Lester mi ha dato una lettera che Xardas ha lasciato per me."); 
};


///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lester_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ho scoperto dove si nasconde il nemico.";
};
func int DIA_Lester_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lester_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lester_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //Ho scoperto dove si nasconde il nemico.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Non chiedermi perché, ma ho la sensazione che dovrei venire con te.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //Cosa intendi dire?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //Non so spiegartelo, ma so che otterrò la risposta se verrò con te.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Mi dispiace, ma la nave è già al completo.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Forse lo è, forse il mio destino è insignificante di fronte agli eventi che ci attendono.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //Sai quello che devi fare. Fronteggia il male, non preoccuparti per me.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //Non sono importante.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Non posso farti venire con me!",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Allora vieni con me e trova le tue risposte!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Allora vieni con me e trova le tue risposte!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Ti incontrerò al porto. Andrò laggiù non appena sarò pronto.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Fai in fretta, il tempo stringe.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};

FUNC VOID DIA_Lester_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //Non posso farti venire con me!
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Capisco. Probabilmente non ti sarei di grande aiuto.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //Non importa chi prendi con te, assicurati di poterti fidare di loro.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //E prenditi cura di te stesso.

	Lester_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_LeaveMyShip_Condition;
	information	 = 	DIA_Lester_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Non c’è più spazio per te.";
};
func int DIA_Lester_LeaveMyShip_Condition ()
{	
	if (Lester_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lester_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Non c’è più spazio per te.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Ti capisco. Probabilmente farei lo stesso al tuo posto.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Se hai bisogno di me, ti aiuterò. Sai dove trovarmi.
	
	Lester_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_StillNeedYou_Condition;
	information	 = 	DIA_Lester_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ho bisogno dell’aiuto di un amico.";
};
func int DIA_Lester_StillNeedYou_Condition ()
{	
	if ((Lester_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lester_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //Ho bisogno dell’aiuto di un amico.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //Lo sapevo! Affronteremo tutto questo insieme, come ai vecchi tempi.
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Il male farà meglio a stare attento, gli stiamo con il fiato sul collo.
		
		self.flags 		 = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Penso sia meglio che io rimanga qui, dopo tutto. Buona fortuna.
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6 //auf der Dracheninsel ->Neue Instanz!!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lester_KAP6_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP6_EXIT_Condition;
	information	= DIA_Lester_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_PC_Psionic_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 900;
	condition	= DIA_PC_Psionic_PICKPOCKET_Condition;
	information	= DIA_PC_Psionic_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_PC_Psionic_PICKPOCKET_Condition()
{
	C_Beklauen (76, 20);
};
 
FUNC VOID DIA_PC_Psionic_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_BACK 		,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};
	
func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};




































