
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14000_Addon_Saturas_ADW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Che Adanos ti protegga.
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Saturas_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14000_Addon_Saturas_ADW;
	nr			= 900;
	condition	= DIA_Addon_Saturas_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Saturas_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Saturas_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Saturas_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) 
	&& (other.attribute[ATR_DEXTERITY] >= (31 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Saturas_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Saturas_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Saturas_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 31)
	{
		
		B_GiveInvItems (self, other, ItSc_Water01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Saturas_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWStart
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADWStart		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Saturas_ADWStart_Condition;
	information	 = 	DIA_Addon_Saturas_ADWStart_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_ADWStart_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Saturas_ADWStart_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Sia ringraziato Adanos. Sei qui, finalmente. Pensavamo che non ti saresti più fatto vedere.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(confuso) Cosa? Come mai voi siete già QUI?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Sei passato attraverso il portale e ti abbiamo seguito. Non ci è voluto molto per arrivare qui.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Ma tu non c'eri. Siamo qui da parecchi giorni.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(sorpreso) PARECCHI GIORNI? Come è possibile?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Non riuscivamo a trovarti da nessuna parte, quindi Nefarius ha cercato di capire che cosa potesse essere andato storto. Fino ad ora non era approdato a nulla.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //Bene. Ora sei qui e puoi cominciare a lavorare.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Che cosa è successo, nel frattempo?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Cosa è successo nel frattempo?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Abbiamo capito molte cose nuove.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //I terremoti qui sembrano proprio essere PIÙ FORTI. Ora non siamo molto lontani dal loro epicentro.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //I costruttori di queste vecchie strutture eressero qui una città, questo possiamo confermarlo.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Tuttavia, per qualche motivo la loro cultura si esaurì.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Per ora possiamo solo fare ipotesi.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Hai trovato tracce delle persone scomparse?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Che c'entra Raven?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //Che c'entra Raven?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //Nella sua lettera, Raven parlava di un tempio e diceva che stava cercando di entrarvi.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Siamo tutti dell'idea che Raven cerchi di profanare il tempio di Adanos.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //I terremoti sono evidentemente provocati da incantamenti sacrileghi che continuano a scontrarsi con un incantesimo potente.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Le porte del tempio sono sigillate dalla magia, che provoca il risveglio delle sentinelle di pietra.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Il tempio si difende. Dobbiamo fermare Raven prima che possa penetrare nel sancta sanctorum.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Qual è la prossima mossa?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Raven è solo un ex barone del metallo, non un mago.", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Che cosa vuole Raven, nel tempio?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Che cosa vuole Raven, nel tempio?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder Mächtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir können davon ausgehen, dass er nichts Gutes im Schilde führt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Sappiamo solo che ha a che fare con un potente artefatto collegato in qualche modo ad Adanos e Beliar.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(cupo) Possiamo ragionevolmente supporre che non sia mosso da buone intenzioni
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Raven è solo un ex barone del metallo, non un mago. Come può essere all'altezza di un'invocazione di quel genere?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Forse ha pagato un mago rinnegato perché lo faccia al posto suo.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //Comunque sia, DOBBIAMO evitare il peggio.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Hai trovato tracce delle persone scomparse?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Abbiamo trovato solo ieri il corpo di un pescatore sotto uno degli edifici crollati a est.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Sembra che il pescatore fosse originario di Khorinis. Dovresti indagare.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Poi cosa succede?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //NOI rimarremo qui e continueremo a studiare l'antica cultura.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Le antiche iscrizioni sugli edifici nascondono moltissimi segreti che dobbiamo svelare, se vogliamo capire che cosa è successo tanto tempo fa.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //Nel frattempo, TU devi fare qualche cosetta per noi
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Cosa dovrei fare?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //Cosa dovrei fare?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Devi trovare Raven e impedirgli di profanare il tempio di Adanos.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //In altre parole dovrei UCCIDERLO.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Se è l'unico modo per fermarlo, allora, nel nome di Adanos… SÌ!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Nel frattempo, raccogli tutti gli antichi cimeli e le iscrizioni dei costruttori che trovi e portaceli.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Dobbiamo sapere di più su questa gente e sulla loro scomparsa.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Solo quando avremo capito cosa ha in mente di fare Raven potremo fermarlo.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Inoltre, devi trovare il modo di liberare gli schiavi.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(cinico) È tutto? Posso farlo con una mano sola.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(irritato) So che ti chiedo molto. In cambio avrai la possibilità di riconquistare la mia fiducia.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven sta sconsacrando il tempio dedicato ad Adanos. Lo devo fermare. Anche se questo significa ucciderlo."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas vuole che liberi gli schiavi."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas vuole che gli porti tutto quello che può dargli più informazioni sull'antico popolo dei costruttori."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Allora è meglio che vada.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //Allora è meglio che vada.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Un'ultima cosa... Raven ha raccolto attorno a sé un gran numero di briganti.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //In tua assenza, abbiamo portato qui un altro componente dell''Anello dell'Acqua'.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //L'abbiamo inviato nella palude. Non è tornato.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Sospettiamo che i briganti attacchino chiunque abbia un aspetto diverso dal loro.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Quindi procurati un'armatura da brigante.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //È l'unico modo per avvicinarsi a loro senza essere immediatamente attaccati.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"I briganti sparano a qualsiasi cosa sia diverso da loro. Ho bisogno di un'armatura da briganti per avvicinarmi."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info PoorRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PoorRanger		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_PoorRanger_Condition;
	information	 = 	DIA_Addon_Saturas_PoorRanger_Info;

	description	 = 	"Chi è il poveraccio che hai inviato nella palude?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //Chi è il poveraccio che hai inviato nella palude?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Si chiamava Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Temo che non sia andato tanto lontano.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas ha mandato nella palude un tizio di nome Lance. Saturas ha paura che Lance non sia andato molto lontano."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Piraten
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Piraten		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Piraten_Condition;
	information	 = 	DIA_Addon_Saturas_Piraten_Info;

	description	 = 	"Dove trovo un'armatura da brigante della mia misura?";
};

func int DIA_Addon_Saturas_Piraten_Condition ()
{
	if (AlligatorJack.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Greg.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Piraten_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //Dove trovo un'armatura da brigante della mia misura?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Sembra che a ovest ci sia un accampamento di pirati.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //A quanto ci risulta, sono in contatto con i briganti.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Non penso che ti attaccheranno se ti avvicini a loro.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Forse possono aiutarti in qualche modo

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas dice che i pirati potrebbero aiutarmi nella mia ricerca di un'armatura."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LanceLeiche
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceLeiche		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_LanceLeiche_Condition;
	information	 = 	DIA_Addon_Saturas_LanceLeiche_Info;

	description	 = 	"Ho trovato il corpo di Lance.";
};

func int DIA_Addon_Saturas_LanceLeiche_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_PoorRanger))
	&& (Npc_HasItems (NONE_Addon_114_Lance_ADW, ItRi_LanceRing) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceLeiche_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Ho trovato il corpo di Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //Che la sua anima possa entrare nel regno di Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Fai attenzione, figlio mio. Non voglio piangere per un altro lutto.
	
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP (XP_Addon_LanceLeiche);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceRing		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_LanceRing_Condition;
	information	 = 	DIA_Addon_Saturas_LanceRing_Info;

	description	 = 	"Ho qui l'anello di acquamarina di Lance.";
};

func int DIA_Addon_Saturas_LanceRing_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_LanceLeiche))
	&& (Npc_HasItems (other,ItRi_LanceRing))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Ho qui l'anello di acquamarina di Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Farai meglio a darmelo per evitare che cada nelle mani sbagliate.
	B_GiveInvItems (other, self, ItRi_LanceRing, 1);		
	B_GivePlayerXP (XP_Addon_LanceRing);
};
///////////////////////////////////////////////////////////////////////
//	Info Tokens
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Tokens		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_Tokens_Condition;
	information	 = 	DIA_Addon_Saturas_Tokens_Info;
	permanent	 = 	TRUE;

	description	 = 	"A proposito dei cimeli…";
};

func int DIA_Addon_Saturas_Tokens_Condition ()
{
	if (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};

var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //A proposito dei cimeli
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Penso di avere qui qualcosa per te.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Conosciamo già questo tipo di tavolette di pietra. Non ci faranno fare grandi progressi.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Ci dev'essere dell'altro.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	
	
	var int BroughtToken;BroughtToken = 0;
	var int XP_BroughtTokens;XP_BroughtTokens = 0;
	
	if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
	{	
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //Cosa ne dici di QUESTO?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //Niente male. Dove l'hai trovato?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Ho dato a Saturas i seguenti cimeli:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //I briganti usano queste tavolette di pietra come valuta corrente.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Le tavolette hanno il segno di Quahodron, un grande guerriero.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //È il comandante il cui figlio Rhademes ha provocato la caduta dell'intera città.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(sprezzante) Tsk. Scommetto che i briganti non sanno nemmeno che cosa vendono.
				Log_AddEntry (TOPIC_Addon_Relicts,"Una tavoletta di pietra rossa che i briganti usano come moneta corrente. Porta il nome del grande guerriero Quarhodron."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //Ho trovato queste tavolette in un edificio a sud.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Ah! Una tavoletta dei guardiani dei morti. Erano loro che evocavano gli spiriti dei defunti.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Il legame dei costruttori con i loro antenati era molto forte.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NV"); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Ho trovato queste tavolette in una struttura a sud-ovest.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //A giudicare dalla tavoletta, ha qualcosa a che fare con gli alloggi dei sacerdoti della città.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Il nome del sommo sacerdote era KHARDIMON. Non sappiamo molto di lui.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NV"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Questo oggetto si trovava in un edificio vicino alla grande palude.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Doveva essere la casa dei guaritori.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Non sappiamo molto di loro. Sembra che siano stati i primi a scomparire.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NV"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Questo pezzo si trovava in un grande edificio in una gola profonda.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //Era la biblioteca dell'antico popolo.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //A quanto pare era una tavoletta degli studiosi.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Molti degli scritti che abbiamo trovato si possono far risalire al capo della 'Casta degli studiosi'.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //È curioso che non abbia lasciato il suo nome in alcun luogo
				Log_AddEntry (TOPIC_Addon_Relicts,"#NV"); 
		};		 
			
			if (SC_Knows_WeaponInAdanosTempel == TRUE)
			{
			};
	
			XP_BroughtTokens = (XP_Addon_ForOneToken * BroughtToken);
	
			B_GivePlayerXP (XP_BroughtTokens);
			Saturas_BroughtTokenAmount = (Saturas_BroughtTokenAmount + BroughtToken);

		if (Saturas_BroughtTokenAmount < 5)
		{
			if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Molto bene. L'immagine di questa città si sta facendo sempre più chiara, ma non sappiamo ancora abbastanza.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //In tutto, ci devono essere cinque tavolette di pietra di questo tipo nascoste qui in giro.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Trovale e portamele.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //In cambio avrai dell'oro.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Ora abbiamo raccolto tutti i cimeli che ci servono.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Ci hai reso un grande servizio. Grazie.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //Questo ci farà fare un importante passo avanti nei nostri studi.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Vedrò se riesco a trovare qualcosa.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Bene. Ma sbrigati. Il tempo non ci è amico.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlateHint
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_StonePlateHint		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_StonePlateHint_Condition;
	information	 = 	DIA_Addon_Saturas_StonePlateHint_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Saturas_StonePlateHint_Condition ()
{
	if ((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE))
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_StonePlateHint_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Hai fatto bene a venire. Abbiamo fatto nuove scoperte che dobbiamo illustrarti.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Allora sentiamo.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //La città affondata si chiamava Jharkendar ed era governata da cinque uomini.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Ciascuno di essi viveva in una residenza, nella quale conservava i propri averi.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Di conseguenza, mentre cerchi cimeli dell'antica cultura è di vitale importanza che tu perlustri a fondo queste residenze.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "E se queste residenze non esistessero più?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Dove dovrei cercare queste residenze?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Dove dovrei cercare queste residenze?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Riordian ha studiato la struttura degli edifici di Jharkendar.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Ti dirà dove cercare le residenze.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas vuole che perlustri le dimore dei costruttori alla ricerca di qualcosa di utile. Riordian mi dirà dove posso trovare questi edifici."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //E se queste residenze non esistessero più?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Se non riesci a trovare queste abitazioni, probabilmente sono affondate insieme alla città.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Se invece esistessero ancora, sarebbero di inestimabile valore per i nostri studi.
};

///////////////////////////////////////////////////////////////////////
//	Info SCBroughtAllToken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_SCBroughtAllToken		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Info;

	description	 = 	"Perché ti servono queste cinque tavolette di pietra?";
};

func int DIA_Addon_Saturas_SCBroughtAllToken_Condition ()
{
	if (ScBroughtToken == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Perché ti servono queste cinque tavolette di pietra?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //I dati che siamo riusciti a raccogliere tra queste rovine non sono completi.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Ma gli scritti dei costruttori parlano di cinque governanti che esercitavano il potere su questa città.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Ciascuno di essi aveva una di queste tavolette come simbolo del suo potere.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Penso che queste tavolette siano la chiave per ottenere le risposte.
};

///////////////////////////////////////////////////////////////////////
//	Info Flut
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Flut		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Flut_Condition;
	information	 = 	DIA_Addon_Saturas_Flut_Info;

	description	 = 	"Nefarius mi ha parlato di una inondazione…";
};

func int DIA_Addon_Saturas_Flut_Condition ()
{
	if (NefariusADW_Talk2Saturas == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Flut_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius mi ha parlato di un'inondazione
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //È scritto che Adanos in persona sia disceso dal cielo per punire i miscredenti e spedirli nel regno dei morti.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //Animato dal sacro furore, fece ricadere il mare sui costruttori di questa città e li spazzò via.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //La palude a est porta ancora i segni di questi eventi passati.

	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AdanosZorn
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_AdanosZorn		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_AdanosZorn_Condition;
	information	 = 	DIA_Addon_Saturas_AdanosZorn_Info;

	description	 = 	"Che cosa può aver fatto irritare tanto Adanos?";
};
func int DIA_Addon_Saturas_AdanosZorn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Flut))
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_AdanosZorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Che cosa può aver fatto irritare tanto Adanos?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Il tempio di questa città era una struttura grandiosa e gloriosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Tutti lo rispettavano e pregavano il nostro dio Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Rhademes, figlio del comandante Quahodron, ha profanato il tempio.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Di conseguenza, uno dopo l'altro tutti caddero vittima del male.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Sospetto che Adanos non potesse perdonarlo e la sua vendetta ricadde su quella terra.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Riuscire a fermare Raven è ancora più importante. Sta per fare esattamente la stessa cosa...
};

///////////////////////////////////////////////////////////////////////
//	Info RavenInfos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavenInfos		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	9;
	condition	 = 	DIA_Addon_Saturas_RavenInfos_Condition;
	information	 = 	DIA_Addon_Saturas_RavenInfos_Info;
	permanent	 = 	TRUE;

	description	 = 	"A proposito di Raven…";
};
var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;

var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_RUNNING)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavenInfos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //A proposito di Raven
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Ero nel campo dei briganti a est. Raven è il loro capo.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Ma per arrivare a Raven, devo prima togliere di mezzo alcuni dei briganti.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Bene. Allora buona fortuna. Ma non dimenticare che non abbiamo molto tempo.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Raven non deve raggiungere il suo obiettivo in nessun modo.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Ha una miniera d'oro e ha dei prigionieri che lo estraggono.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //Tipico di Raven. Devi far uscire i prigionieri.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(sospira) Sì, certo. Ci sto lavorando.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //C'è persino un tizio con i briganti che sostiene di conoscere i piani di Raven.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Il suo nome è Fortuno. Dice che Raven vuole entrare nel tempio per impossessarsi di un potente artefatto.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //E allora? Sapeva qualcosa di più su questo artefatto?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Ha potuto dirmi solo che Raven ha fatto scoperchiare la tomba di un sacerdote di Adanos.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Questa tomba può contenere la chiave del tempio. Dovresti dare un'occhiata da quelle parti.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Raven ha obbligato i prigionieri a scavare la tomba del sacerdote.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //Non va bene. Devi sbrigarti a fermare Raven.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //Sono riuscito a entrare negli appartamenti di Raven.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //E allora? Che mi dici di Raven?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Sono arrivato troppo tardi. È scomparso nel tempio di Adanos proprio davanti ai miei occhi.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(agitato) Cosa?! È una CATASTROFE. Perché non l'hai seguito?!

		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (RavenNeuigkeit != 0)
	{
		var int XP_RavenNeuigkeit;
		XP_RavenNeuigkeit = (RavenNeuigkeit * XP_Ambient);
		B_GivePlayerXP (XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Hai qualcosa di nuovo da riferire?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Per ora no.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Ti consiglio di non sottovalutare questo Raven, mi hai sentito?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TuerZu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TuerZu		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TuerZu_Condition;
	information	 = 	DIA_Addon_Saturas_TuerZu_Info;

	description	 = 	"Non sono riuscito a seguire Raven!";
};

func int DIA_Addon_Saturas_TuerZu_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TuerZu_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Non ho potuto seguire Raven. Ha bloccato l'entrata dall'interno.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //(precipitoso) Devo pensare
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //La domanda è: come ha fatto Raven a entrare nel tempio
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Che cosa ha fatto prima di attraversare il portale?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Ha pronunciato un incantesimo al cancello.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //E prima?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Ha aperto una camera di sepoltura.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //Te ne ho già parlato
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Esatto!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //So solo che deve aver eseguito un certo rituale in quel punto
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //(pensando) Un rituale
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //(illuminazione) Sì! Ci siamo!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Temo che Raven si sia appropriato del potere dei guardiani dei morti.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //Ha saputo tutto del tempio da uno spirito!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Devi andare da Myxir a dirglielo!
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Raven ha ottenuto il potere dei guardiani dei morti. La sua conoscenza del tempio di Adanos deriva da un fantasma. Devo andare a dirlo a Myxir.");  
	
	Saturas_RiesenPlan = TRUE;	
};

///////////////////////////////////////////////////////////////////////
//	Info GhostQuestions
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_GhostQuestions		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_GhostQuestions_Condition;
	information	 = 	DIA_Addon_Saturas_GhostQuestions_Info;

	description	 = 	"Ho parlato con Quarhodron.";
};
func int DIA_Addon_Saturas_GhostQuestions_Condition ()
{
	if ((Npc_IsDead(Quarhodron)) == FALSE)
	&& (SC_TalkedToGhost == TRUE) 
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_GhostQuestions_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Ho parlato con Quarhodron.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //E allora? Cosa ti ha detto?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //Mi aiuterà solo se risponderò ad alcune domande.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //Qual è il problema?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Non sono sicuro delle risposte.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Mhmm… sappiamo che gli studiosi di questa città hanno costruito una biblioteca nel nord.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Si sono impegnati molto per archiviare gli eventi del passato.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Forse troverai là le risposte alle domande di Quarhodron.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas pensa che io possa trovare le risposte alle domande di Quarhodron nella biblioteca degli studiosi. La biblioteca è lontana, a nord."); 

};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Saturas_TalkedToGhost_Info;

	description	 = 	"Il problema con la porta del tempio è risolto.";
};

func int DIA_Addon_Saturas_TalkedToGhost_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Il problema con la porta del tempio è risolto.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //Lo spirito ha parlato?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Sì.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Allora sai come entrare nel tempio.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Esatto. E mi ha anche detto che cosa è contenuto nel tempio.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Ha parlato di una potente spada e delle stanze di Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(disperandosi) Per Adanos. Che sciocchi siamo stati. Come abbiamo potuto essere tanto ingenui?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //(scosso) Gli indizi negli archivi
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //(eccitato) Questa spada può essere solo l''Artiglio di Beliar'.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Dobbiamo entrare in quelle stanze il prima possibile e impossessarci dell'arma.
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Che cos'è l''Artiglio di Beliar'?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Dove sono le camere di Adanos?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Che cos'è l''Artiglio di Beliar'?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //È l'incarnazione del Male. L'ha creata Beliar IN PERSONA.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Chiunque la porti possiede un terribile strumento di distruzione.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //E più è potente colui che la porta, maggiore è il potere dell''Artiglio'.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Solo una persona forte di spirito e di fede incrollabile può reggere questo incantesimo.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //Ora mi è chiaro il motivo per cui i costruttori hanno isolato questa valle.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Portarono quest'arma del Male nella loro città e caddero vittima del suo potere.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Questi sciocchi arroganti si sono distrutti l'un l'altro mossi dall'avidità.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //La crudeltà non ebbe fine finché la furia di Adanos non spazzò la terra sommergendo ogni cosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //Certo. I creatori del portale hanno fatto bene a nascondere queste cose al resto del mondo.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Una tragica fine per una cultura meravigliosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //Ora ti rendi conto di quanto sia urgente la nostra missione?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Raven è un forte combattente ed è accecato dalla brama di potere.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //Nelle sue mani, l'Artiglio sarà uno strumento di distruzione.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Non deve arrivare all'arma o saremo tutti perduti.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"C'è un'arma potente dentro il tempio di Adanos. Si chiama 'Artiglio di Beliar'. Non si può permettere a Raven di mettere le mani su quest'arma."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //Che cosa sono le stanze di Adanos?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Ora sappiamo che l'entrata non è l'unico ostacolo che ci impedisce di entrare nel cuore del tempio.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //Dentro al tempio ci sono tre stanze che dovrebbero respingere tutti gli intrusi.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //La chiave sono i cimeli colorati dei costruttori.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Solo se raccogliamo tutti quei cimeli e risolviamo gli enigmi potremo entrare nel sancta sanctorum del tempio.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Non so se Raven sia stato in grado di risolvere gli enigmi del tempio, ma in tal caso abbiamo un grosso problema.
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,LogText_Addon_Relicts); 
	
	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,LogText_Addon_Relicts); 

	Saturas_KnowsHow2GetInTempel = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RelictsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RelictsBack		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_RelictsBack_Condition;
	information	 = 	DIA_Addon_Saturas_RelictsBack_Info;

	description	 = 	"Che cosa dovrei fare, esattamente, con i cimeli nel tempio?";
};

func int DIA_Addon_Saturas_RelictsBack_Condition ()
{
	if (Saturas_SCBroughtAllToken == TRUE)
	&& (Saturas_KnowsHow2GetInTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_RelictsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Che cosa dovrei fare, esattamente, con i cimeli nel tempio?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Ne sappiamo troppo poco. Tuttavia, si spera che ne comprenderai il significato una volta entrato nel tempio.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Mi dispiace di non poterti dire di più. Ora è tutto nelle tue mani.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Prendi i cimeli e dirigiti immediatamente al tempio.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas mi ha mandato al tempio di Adanos con i cinque cimeli dei costruttori, per superare le camere e fermare Raven."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Che Adanos sia misericordioso e ci protegga tutti.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Forse non è ancora troppo tardi.
};

///////////////////////////////////////////////////////////////////////
//	Info RavensDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavensDead		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_RavensDead_Condition;
	information	 = 	DIA_Addon_Saturas_RavensDead_Info;

	important	 = 	TRUE;
};
func int DIA_Addon_Saturas_RavensDead_Condition ()
{
	if (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavensDead_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //I terremoti non sono ancora finiti e, a quanto vedo, sei ancora tra i vivi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Questo significa che la tua missione è riuscita?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Sì. Raven è morto.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //Allora è finita. Grazie Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Hai fatto bene, figlio mio. Abbiamo un grande debito nei tuoi confronti.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Hai sottratto al Male un'arma potente e hai riportato l'equilibrio in questa parte del mondo.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Quando i terremoti si sono fermati, abbiamo discusso di quello che sarebbe dovuto succedere e abbiamo raggiunto una conclusione.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Vai a prendere l''Artiglio di Beliar'. Che sia tu a portarlo, d'ora in poi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //Nelle tue mani, potrebbe dimostrarsi un potente alleato per noi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //Usalo con saggezza, figlio mio. Che Adanos ti aiuti.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //Rimarremo qui e faremo in modo che il tempio sia riportato al suo antico splendore.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Solo Myxir è già in cammino per Khorinis per prestare aiuto a Vatras.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras è rimasto troppo a lungo solo in città.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir è stato mandato in aiuto di Vatras nel porto."); 

	B_GivePlayerXP (XP_Addon_Saturas_RavensDead);
};

///////////////////////////////////////////////////////////////////////
//	Info FreedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_FreedMissingPeople		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information	 = 	DIA_Addon_Saturas_FreedMissingPeople_Info;

	description	 = 	"Ho liberato i prigionieri.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Ho liberato i prigionieri.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Molto bene. Che possano tornare sani e salvi alla loro patria.
	B_GivePlayerXP (XP_Addon_Saturas_FreedMissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarsWeapon
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarsWeapon		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarsWeapon_Info;

	description	 = 	"Ho preso l''Artiglio di Beliar'.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info ()
{
	AI_UnequipWeapons (hero);
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //Ho preso l''Artiglio di Beliar'.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Ma non posso portarlo.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //L''Artiglio di Beliar' è un'arma molto SPECIALE.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Ha una volontà e una coscienza proprie.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //Tu, che possiedi quest'arma potente, sei il suo signore e padrone.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //È parte di te e si adatterà alle tue capacità.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Ma non lo farà di sua spontanea volontà.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //Solo Beliar IN PERSONA può obbligarla a obbedirti.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "E perché Beliar dovrebbe aiutarmi?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Cosa posso fare con l'arma?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //Cosa posso fare con l'arma?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //Questo spetta a te: hai conquistato l'arma e ora sei il suo padrone.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Posso solo darti qualche raccomandazione su come usarla.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //O la dai a ME così che possa assicurarmi che non faccia più alcun male
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //.. oppure metti a frutto il suo potere brandendola in combattimento.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Non potresti tenere l'arma al sicuro?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Non potresti tenere l'arma al sicuro?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des Bösen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschließt, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Se la dai a me la renderò innocua, così che non se ne possa più abusare.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Quindi pensa bene a quello che intendi fare.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Posso dare l'Artiglio di Beliar a Saturas, oppure posso tenerlo per me."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //E perché Beliar dovrebbe aiutarmi?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Solo una preghiera a Beliar può ottenere il risultato.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Ma fai attenzione. Beliar è maligno.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Se scateni la sua ira, ne subirai le conseguenze.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Per piegare l'Artiglio al mio volere, devo pregare Beliar.");

	B_Say 	  	(other,self,"$VERSTEHE");
};

///////////////////////////////////////////////////////////////////////
//	Info PermENDE_ADDON
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PermENDE_ADDON		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Cosa farai ora?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_RavensDead))
		{
			return TRUE;
		};
};
var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;
func void DIA_Addon_Saturas_PermENDE_ADDON_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //Cosa farai ora?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Staremo qui e faremo in modo che il tempio torni all'antica gloria.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Le sue mura sono rimaste in queste deprecabili condizioni troppo a lungo.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //Per quanto ti riguarda, figlio mio
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Sono felice di vedere che non mi ero sbagliato su di te. Tu sei il Protettore dell'Equilibrio. Non ci sono dubbi a riguardo.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Senza il tuo coraggio e la tua forza, l'isola di Khorinis sarebbe sprofondata nelle acque. Ti ringraziamo e ti rendiamo onore.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Ora dedicati agli altri compiti che ti aspettano e riporta l'equilibrio e la pace in questo mondo.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Ora va e adempi il tuo destino, Protettore. Le nostre preghiere ti seguiranno.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarWeapGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarWeapGeben		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Info;

	description	 = 	"Prendi l''Artiglio di Beliar' e distruggilo.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_BeliarsWeapon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //Prendi l''Artiglio di Beliar' e distruggilo.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Come desideri, figlio mio. Dammelo.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Affinché non possa più fare alcun male, lo lascerò affondare negli abissi del mare.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //La saggezza di Adanos veglierà su di esso.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP (XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachCircle
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_PreTeachCircle		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Info;

	description	 = 	"Mi puoi insegnare i Circoli della magia?";
};

func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Mi puoi insegnare i Circoli della magia?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Tu sei un Mago del Fuoco. Che cosa ne direbbe Pyrokar?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //Non c'è bisogno che gli altri lo sappiano.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(sospira) Vedo che fai sul serio, quindi rispetterò la tua richiesta.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Tuttavia, se dovessi rendermi conto che la nostra conoscenza è nelle mani sbagliate, non potrai più contare sul mio aiuto.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //Quindi farai meglio a non deludermi.
	};
	Saturas_Addon_TeachCircle = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_SaturasTeach); 
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCIRCLE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_CIRCLE		(C_INFO)
{
	npc			 = 	KDW_14000_Addon_Saturas_ADW;
	nr			 = 	99;
	condition	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voglio imparare un livello di magia superiore.";
};
var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;
func int DIA_Addon_Saturas_ADW_CIRCLE_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) < 6)
	&& (Saturas_Addon_TeachCircle == TRUE)
	&& (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_ADW_CIRCLE_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Voglio imparare un livello di magia superiore.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Sì, sei pronto a estendere la tua conoscenza.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Entra nel secondo Circolo della magia. Possa Adanos darti la forza di usare saggiamente il potere che ti ha affidato.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Sì, è il momento giusto. Entra nel terzo Circolo della magia.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Ora la tua conoscenza ti permetterà di compiere nuove e più potenti magie. Usala con cautela.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //È giunta l'ora. Sei pronto per entrare nel quarto Circolo della magia.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Ora le tue parole e le tue azioni sono potenti. Scegli sempre con cautela e con saggezza i tuoi nuovi incantesimi.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Ora avrai il privilegio di entrare nel quinto Circolo della magia.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Gli incantesimi che imparerai ora possono essere veramente devastanti.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //Quindi bada al tuo potere e non lasciarti illudere dalla grandezza.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //Quello non è più mio compito, ora.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //Per apprendere il sesto e ultimo Circolo della magia, faresti meglio a raggiungere il monastero dei Maghi del Fuoco.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //È ancora troppo presto per te. Ripassa più tardi.
	};
};

















