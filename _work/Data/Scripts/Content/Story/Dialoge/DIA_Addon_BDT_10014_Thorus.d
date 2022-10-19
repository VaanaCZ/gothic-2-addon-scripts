//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Conosci le regole: nessuno entra nella miniera senza una tavoletta di pietra rossa.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Lascia perdere la miniera: devo vedere Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//In ogni caso, abbiamo delle regole che si applicano a tutti. Anche a te.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Torna indietro. Se cerchi di entrare nella piazza alta senza permesso, le altre guardie ti uccideranno. QUELLE sono le regole.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Se per te questo è un problema, vai a parlare con Esteban. È il responsabile del campo.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "È importante riuscire a raggiungere Raven…";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//Per me è importante raggiungere Raven
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//Ah sì? Pensi davvero di riuscire ad arrivare fino a lui?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Le sue guardie hanno l'ordine di non lasciare entrare NESSUNO. Saresti morto prima ancora di vederlo.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Quindi levatelo dalla testa.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven è il capo dei briganti. Per arrivare a lui dovrò allontanarne alcuni."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "Non mi riconosci? Dal vecchio campo?";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Non ti ricordi di me? Dal Vecchio campo
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Eri uno dei prigionieri?! Forse eri una delle mie guardie. E allora? Questo ci rende alleati, ora?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//No, niente affatto.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Forse sei il tizio che ha abbattuto la Barriera, e forse hai anche ucciso i miei amici.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//E allora?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Quei tempi sono passati.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Vuoi entrare? Allora procurati una pietra rossa e non farmi perdere tempo.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "Andiamo, fammi entrare. In ricordo dei vecchi tempi.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //Andiamo, fammi entrare. In ricordo dei vecchi tempi.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Lascia che ti spieghi una cosa. Lo sai perché sono ancora vivo?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Perché sono sempre stato leale nei confronti della mia gente.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Non devo approvare tutto quello che fa Raven. Ma mi atterrò alle regole. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //E lo farai anche tu!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(fermo) No!
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "Ho qui una tavoletta di pietra per te…";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//Ho qui una tavoletta di pietra per te
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//Non hai la pietra giusta. Sono importanti solo le pietre rosse.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "Ho qui una tavoletta rossa…";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//Ho qui una tavoletta rossa
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//Va bene.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Hai ucciso Esteban, allora il suo lavoro ora lo farai TU!
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//Hanno qualche problema con gli scavaragno, nella miniera.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Tre scavatori ci hanno già rimesso le penne. Tu devi procurare dei rimpiazzi.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//E quando riuscirò a entrare in quella maledetta miniera?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Fai il tuo lavoro: dopo potrai fare quello che vuoi.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Dal momento che ho sostituito Esteban nel suo lavoro, dovrei mandare tre scavatori alla miniera.");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "Ho inviato tre uomini.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//Ho inviato tre uomini.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//Va bene. Allora, per quanto mi riguarda, puoi entrare.

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "Ehi, guarda la tua armatura. Dove posso procurarmene una così?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Ehi, guarda la tua armatura. Dove posso procurarmene una così?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//Non puoi. Questa armatura è riservata alle guardie di Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Dubito che ci sia un esame di ammissione per nuovi candidati. Ma l'ultima parola spetta a Raven, non a me.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "Come stanno i prigionieri?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//Come stanno i prigionieri?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Ehm, hanno fatto il loro lavoro. Per quanto ne so, ora dovrebbero scavare l'oro.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//E se scappano...?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//… Bloodwyn li farà inseguire dalle sue guardie. Ma dubito che sarebbero tanto pazzi da cercare di scappare.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//A meno che
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//A meno che... cosa?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//… qualcuno non li convinca a farlo. Ma non conosco nessuno che sia tanto stupido da farlo... almeno finché qui c'è Bloodwyn.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//Cosa stai macchinando?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//Cosa??
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Ora ti sei sbarazzato anche di Bloodwyn. Mi domando solo a chi toccherà dopo. A Raven? O a me?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Hai paura?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Non ho paura di combattere. Ma ho paura delle conseguenze delle tue azioni.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Questo campo è l'unica cosa che ci è rimasta.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Non avrà sempre funzionato alla perfezione, ma FUNZIONA.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//E ad ogni persona che uccidi, salta un altro pezzo della nostra comunità.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//Noi siamo briganti. Reietti, fuorilegge, desperados.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Ovunque andiamo, ci danno la caccia, ci sbattono in galera e ci ammazzano.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Non abbiamo un luogo migliore di questo né un tempo migliore di questo.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//Che cosa vuoi ottenere?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Questi uomini hanno bisogno di una guida. E chi? Tu? Tu che sei sempre in movimento da un posto all'altro?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "Così dovresti assumere il comando del campo.";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Allora assumi il comando del campo.
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//Bene, ma cosa ne è di Raven?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Raven avrà presto altre preoccupazioni. Ci penserò io.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Ah, sì, e assicurati che i prigionieri possano lasciare il campo in santa pace.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//Va bene. Mi occuperò di tutte le guardie là fuori.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn è morto e Thorus farà in modo che gli schiavi possano lasciare il campo."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Ora parlerò di nuovo al 'guardiano degli schiavi', poi Patrick e i suoi ragazzi potranno prendere il volo."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"Dal momento che il 'guardiano degli schiavi' è fuori causa, Patrick può andarsene con i suoi ragazzi."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "L’ho fatto. Raven è spacciato.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//L’ho fatto. Raven è spacciato.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//Ciò significa che hai mollato un bel calcione a Beliar.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Allora andrai avanti?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Il mio lavoro nella valle è finito. Qualche giorno di riposo mi farebbe bene.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(ride) Sì, sei sempre in movimento, vero? (serio) Fai buon viaggio.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Chissà, forse ci incontreremo ancora.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Chissà. Dovrai superare molte porte e molti passaggi. E di sicuro mi incontrerai sul tuo cammino
	
	AI_StopProcessInfos (self);
	
};



