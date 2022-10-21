///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pyrokar_EXIT   (C_INFO)
{
	npc         = KDF_500_Pyrokar;
	nr          = 999;
	condition   = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  2;
	condition	 = 	DIA_Pyrokar_WELCOME_Condition;
	information	 = 	DIA_Pyrokar_WELCOME_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_WELCOME_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //Dunque tu sei il nuovo novizio. Bene, presumo che padre Parlan ti abbia già assegnato un incarico.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(con tono leggermente duro) Sappi che tutti quelli all'interno della Comunità del fuoco devono portare a termine il proprio compito secondo la volontà di Innos.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Hagen_Condition;
	information	 = 	DIA_Pyrokar_Hagen_Info;
	permanent	 =  FALSE;
	description	 =  "Devo parlare con i paladini. È urgente.";
};
func int DIA_Pyrokar_Hagen_Condition ()
{	
	if (other.guild  == GIL_NOV) //muss kommen
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //Devo parlare con i paladini. È una questione urgente.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //Vuoi dirci come mai vuoi parlare con loro?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //Ho un messaggio urgente da riferirgli.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //E sarebbe?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //Un esercito del male guidato dai draghi si sta radunando nella Valle delle Miniere! Dobbiamo fermarli prima che sia troppo tardi.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Mmmh. Dovremo valutare le tue parole, novizio. Quando sarà il momento, ti faremo sapere cos'ha deciso il nostro consiglio.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Nel frattempo faresti meglio a tornare ai tuoi compiti da novizio.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //Bene, non vogliamo trattenerti ulteriormente dal fare il tuo lavoro. Ora puoi andare.
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Auge_Condition;
	information	 = 	DIA_Pyrokar_Auge_Info;
	permanent	 =  FALSE;
	description	 =  "Sto cercando l’Occhio di Innos.";
};
func int DIA_Pyrokar_Auge_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Auge_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //Sto cercando l’Occhio di Innos
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Chiunque sia convinto di essere in grado di trovare l'amuleto sacro e di indossarlo è un pazzo.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //È l'amuleto stesso a scegliere il suo padrone. Nessuno può portarlo, tranne colui che è il prescelto.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Mi piacerebbe provare.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Il compito di un novizio è mostrare umiltà, non desiderio.
	
 	B_LogEntry (TOPIC_INNOSEYE, "Non pensavo sarebbe stato così difficile, ma Pyrokar non mi consegnerà l'Occhio volontariamente senza l'aiuto dei paladini.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //Bene, non vogliamo trattenerti oltre. Il lavoro ti aspetta, puoi andare ora.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Pyrokar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Pyrokar_MissingPeople_Info;

	description	 = 	"Alcuni abitanti di Khorinis sono misteriosamente scomparsi.";
};
func int DIA_Addon_Pyrokar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Pyrokar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Alcuni abitanti di Khorinis sono misteriosamente scomparsi.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //Lo so, ed è una faccenda incresciosa. Ma siamo d'accordo con i Maghi dell'Acqua che se ne occuperannno loro.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //E lo stesso vale per le indagini sugli insoliti terremoti che hanno colpito le regioni nord-orientali di Khorinis.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Finora nessuno ha richiesto il nostro intervento. Pertanto, non prenderemo alcuna iniziativa in merito.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Sì, ma...
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //Non ci sono ma! Agiremo come ci sembrerà opportuno, e spero che anche TU rispetterai gli ordini.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"I Maghi del Fuoco si dolgono per la perdita dei cittadini. Tuttavia, dicono che sia compito dei Maghi dell'Acqua. Non c'è modo di ricevere aiuto al monastero."); 

	if (other.guild  == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		AI_StopProcessInfos (self); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_GOAWAY_Condition;
	information	 = 	DIA_Pyrokar_GOAWAY_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_GOAWAY_Condition ()
{
	//ADDON>
	if (Npc_KnowsInfo (hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return FALSE;
		};
	//ADDON<

	if (Npc_IsInState (self, ZS_Talk)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Hagen)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(seccato) L'obbedienza è una virtù che devi ancora imparare, in un modo o nell'altro...
	
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 =  1;
	condition	 = 	DIA_Pyrokar_FIRE_Condition;
	information	 = 	DIA_Pyrokar_FIRE_Info;
	permanent	 =  FALSE;
	description	 = 	"Voglio sottopormi alla Prova del Fuoco.";
};
func int DIA_Pyrokar_FIRE_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild  == GIL_NOV)
	&&  Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_FIRE_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Voglio sottopormi alla Prova del Fuoco.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(sorpreso) Così conosci... vuoi sottoporti alla Prova del Fuoco?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Sì, mi riferisco alla Legge del fuoco che dice...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(lo interrompe bruscamente) Conosciamo la Legge del fuoco. Abbiamo visto anche molti novizi morire durante la prova. Dovresti riflettere su questa tua decisione.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //L'ho già fatto e voglio affrontare la prova. Sono certo di riuscire a superarla.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(ammonendo) Se proprio insisti, allora l'Alto Concilio ti sottoporrà alla prova.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Insisto nell'essere sottoposto alla Prova del Fuoco.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //E sia. Quando sei pronto, ogni stregone dell'Alto Concilio ti affiderà una missione da completare.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Possa Innos avere pietà della tua anima.
	
	B_LogEntry (TOPIC_FireContest,"Ho richiesto la Prove del Fuoco da Pyrokar. Ora devo completare i tre compiti che l'Alto Concilio mi assegnerà.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_TEST_Condition;
	information	 = 	DIA_Pyrokar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Sono pronto ad affrontare la tua prova, maestro.";
};
func int DIA_Pyrokar_TEST_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Sono pronto ad affrontare la tua prova, maestro.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //Solo Innos sa se riuscirai a superarla. Verrai sottoposto alla stessa prova che viene assegnata ai novizi prescelti.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //La Prova della magia. (distaccato) Probabilmente sai già che UN solo novizio può superare la prova.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //Capisco. Chi sono i miei avversari?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //Nella sua infinita saggezza, Innos ha scelto altri tre novizi da sottoporre a questa prova: Agon, Igaraz e Ulf. Essi hanno già cominciato.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(bruscamente) Ma ora basta con le chiacchiere! Ecco in cosa consiste la prova: 'Segui i segnali di Innos e portaci ciò che il credente trova dietro il sentiero'.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Ti servirà questa chiave.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //Questo è tutto ciò che abbiamo da dirti.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar sta preparando la Prova del Fuoco per me. È la stessa prova che hanno affrontato i novizi prescelti Ulf, Igaraz e Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Devo seguire i segni di Innos e 'riportare quello che il credente troverà alla fine del sentiero'. Mi ha dato anche una chiave.");
	
	CreateInvItems (self,ItKe_MagicChest,1);
	B_GiveInvItems (self,other,ItKe_MagicChest,1);
	
	//------------Igaraz klar machen------------------- 
	B_StartOtherRoutine (Igaraz,"CONTEST");
	AI_Teleport (Igaraz,"NW_TAVERNE_BIGFARM_05");	
	CreateInvItems (Igaraz, ItKe_MagicChest,1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;
	
	//---------Smalltalk Partner herbeirufen 
	B_StartOtherRoutine (NOV607,"EXCHANGE");
	
	//------------Agon klar machen-------------------
	B_StartOtherRoutine (Agon,"GOLEMDEAD");
	AI_Teleport (Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems (Agon, ItKe_MagicChest,1);		
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	//------------Ulf klar machen-------------------
	B_StartOtherRoutine (Ulf,"SUCHE");
	AI_Teleport (Ulf,"NW_TROLLAREA_PATH_42");	
	CreateInvItems (Ulf, ItKe_MagicChest,1);	
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	//-------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	20;
	condition	 = 	DIA_Pyrokar_RUNNING_Condition;
	information	 = 	DIA_Pyrokar_RUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Pyrokar_RUNNING_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&&  Npc_IsInState (self, ZS_Talk) 
	&& (other.guild  == GIL_NOV)
	&& (Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_RUNNING_Info ()
{
	var int randomizer;
	randomizer = Hlp_Random (3); 
	
	if  (randomizer == 0)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Fino a quando sarai impegnato con la prova, non abbiamo altro da dirti.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //Perché sei ancora qui? Vai ad affrontare la tua prova!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //È il momento di trasformare le tue parole in azioni concrete. Non credi, novizio?
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SUCCESS_Condition;
	information	 = 	DIA_Pyrokar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Ho trovato la pietra runica";
};
func int DIA_Pyrokar_SUCCESS_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild  == GIL_NOV)
	&& (!Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	&& (( Npc_HasItems (other,itmi_runeblank) >= 1)
	|| ( Npc_HasItems (other,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SUCCESS_Info ()
{
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //Ho trovato la pietra runica
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(incredulo) Tu... Ce l'hai fatta? Hai seguito i segnali di Innos e hai scoperto il portale nascosto...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //...E ho sconfitto tutti i mostri che già pregustavano di avermi per cena.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //Che fine hanno fatto gli altri novizi? Che ne è stato di Agon? Non hanno avuto successo?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Hanno fallito. Suppongo che non fossero destinati a superare la prova.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Beh, allora dichiariamo che hai superato la prova. E puoi tenerti la runa.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Prüfung erfolgreich und die anderen noch nicht. 
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Todo_Condition;
	information	 = 	DIA_Pyrokar_Todo_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Pyrokar_Todo_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (other.guild  == GIL_NOV)
	&& ((MIS_RUNE  != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)) 

	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Todo_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Hai superato la prova che ti avevo affidato.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Ma...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //...Devi ancora superare la prova di Ulthar.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //...Devi ancora superare la prova di Serpentes.
	};
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	3;
	condition	 = 	DIA_Pyrokar_MAGICAN_Condition;
	information	 = 	DIA_Pyrokar_MAGICAN_Info;
	permanent	 =  FALSE;
	description	 = 	"Entrerò a far parte della Gilda dei maghi, adesso?";
};

func int DIA_Pyrokar_MAGICAN_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE  		  == LOG_SUCCESS)
	&& (MIS_GOLEM 		  == LOG_SUCCESS)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_MAGICAN_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //Entrerò a far parte della Gilda dei maghi, adesso?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Ce l’hai fatta. Hai superato la Prova del Fuoco. Eravamo sicuri che ci saresti riuscito.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(insiste) Così come siamo sicuri che continuerai a dare il massimo per diventare un servo DEGNO di Innos.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Dunque, se sei pronto a prestare il Giuramento del fuoco, verrai accettato nelle nostre fila come mago.
	
};
///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	1;
	condition	 = 	DIA_Pyrokar_OATH_Condition;
	information	 = 	DIA_Pyrokar_OATH_Info;
	permanent 	 =  FALSE;
	description	 = 	"Sono pronto a entrare nel Circolo del Fuoco.";
};
func int DIA_Pyrokar_OATH_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_OATH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Sono pronto ad entrare nel Circolo del Fuoco.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Bene, allora presta il sacro Giuramento del fuoco.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(solennemente) Giuri davanti a Innos l'onnipotente, ai suoi schiavi e al Fuoco sacro...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //...che d'ora in avanti e per sempre, tutta la tua vita sarà vincolata al fuoco...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //...fino a quando il tuo corpo e la tua anima troveranno pace in queste sacre stanze e la fiamma della tua vita si spegnerà?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Lo giuro.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Ripetendo le parole del giuramento, hai appena fatto il patto con il fuoco.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Indossa questa veste come simbolo dell'eterno legame.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//fürs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Ora che sei stato accettato fra le nostre fila, puoi parlare con Lord Hagen, il comandante supremo dei paladini.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Siamo anche molto interessati al suo parere sulla situazione. Ora sei libero di andare a Khorinis.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Aspettiamo che ci porti la sua risposta immediatamente.
};
///////////////////////////////////////////////////////////////////////
//	Info  Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Lernen_Condition;
	information	 = 	DIA_Pyrokar_Lernen_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Cosa posso apprendere, adesso?";
};
func int DIA_Pyrokar_Lernen_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Lernen_Info ()
{
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Cosa posso imparare ora?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Per prima cosa, ora hai il diritto di sapere cosa sono i Cerchi della magia. Essi ti daranno il potere di usare le rune.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //Più in alto salirai nei sei cerchi della magia, più potenti diventeranno gli incantesimi che potrai usare.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Puoi apprendere la formula dai fratelli nel monastero. Ciascuno di loro è specializzato in un'area particolare e provvederà a insegnartela.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Karras, per esempio, è un maestro dell'invocazione e dell'evocazione, mentre Hyglas ti insegnerà le magie del fuoco.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Nessuno conosce i poteri del ghiaccio e del fulmine meglio di Marduk. Parlan può insegnarti altri tipi di incantesimi e ti introdurrà ai primi cerchi.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Ma ciascuno di essi ti insegnerà solo la formula - le rune che ti serviranno dovrai creartele da solo.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"Maestro Parlan mi introdurrà al primo Circolo della Magia.");
	
	B_LogEntry (Topic_KlosterTeacher,"Fratello Karras insegna formule per invocazioni ed evocazioni.");
	B_LogEntry (Topic_KlosterTeacher,"Fratello Hyglas può insegnarmi i misteri del fuoco.");
	B_LogEntry (Topic_KlosterTeacher,"Fratello Marduk può insegnarmi i poteri del ghiaccio e del fulmine.");
	B_LogEntry (Topic_KlosterTeacher,"Fratello Parlan insegna varie altre formule.");
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Wunsch_Condition;
	information	 = 	DIA_Pyrokar_Wunsch_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Vorrei esprimere un desiderio...";
};
func int DIA_Pyrokar_Wunsch_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Wunsch_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Vorrei esprimere un desiderio...
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Dopo essere stato accettato, ogni mago ha il diritto di esprimere il suo primo desiderio.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Dunque, quale sarà il tuo primo desiderio come mago?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Nessuno.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Babo sarà il nuovo giardiniere del monastero",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Il novizio Opolos ha il permesso di entrare in biblioteca.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Dryian rimarrà nel monastero.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Nessuno.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(stupito) E sia. Il nuovo mago rinuncia al suo desiderio.
	
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	
	
};

FUNC VOID DIA_Pyrokar_Wunsch_Dyrian ()
{
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //Permetti al novizio Dyrian di rimanere nel monastero.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //E sia.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Il novizio potrà rimanere nel monastero e assumerà il ruolo attualmente vacante di giardiniere.
	
	B_GivePlayerXP (XP_HelpDyrian);
	
	B_StartOtherRoutine (Dyrian,"FAVOUR");
	
	MIS_HelpDyrian = LOG_SUCCESS;
	
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Babo ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //Nomina il novizio Babo responsabile dei giardini del monastero.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //E sia.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //A partire da ora, il novizio Babo si occuperà dei giardini del monastero.
	
	B_GivePlayerXP (XP_HelpBabo);
	
	B_StartOtherRoutine (Babo,"FAVOUR");
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	MIS_HelpBabo = LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Opolos ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //Il novizio Opolos ha il permesso di accedere in biblioteca.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //E sia.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //Da ora in poi, il novizio Opolos studierà i testi sacri di Innos.
	
	B_GivePlayerXP (XP_HelpOpolos);
	
	B_StartOtherRoutine (Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	
	MIS_HelpOpolos 	= LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};
///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Nachricht_Condition;
	information	 = 	DIA_Pyrokar_Nachricht_Info;
	permanent	 =  FALSE;
	description	 = 	"Ho notizie di Lord Hagen...";
};
func int DIA_Pyrokar_Nachricht_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Nachricht_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //Porto notizie di Lord Hagen. Egli vuole le prove della presenza dei draghi e dell'esercito del male.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //Dunque devo recarmi nella Valle delle Miniere e procurarmi le prove per lui.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Bene. Seguirai i suoi ordini dunque. Il paladino Sergio ti scorterà fino al passo.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Che Innos ti protegga.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Così mi sono diretto verso la Valle delle Miniere.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Bene. Dal momento che conosci già la strada per la valle, non ti serve una scorta.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Prenditi cura di questa faccenda per Lord Hagen e che Innos ti protegga.
	};

};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	4;
	condition	 = 	DIA_Pyrokar_TEACH_Condition;
	information	 = 	DIA_Pyrokar_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Insegnami l’ultimo Circolo della Magia.";
};
func int DIA_Pyrokar_TEACH_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5) 
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Insegnami l’ultimo Cerchio della magia.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //È passato tanto tempo da quando hai stretto il legame con il fuoco. Da allora sono successe molte cose e noi non troviamo pace.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Tu sei il prescelto di Innos, dunque avrai bisogno di tutta la tua forza per prevalere in battaglia.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Ora ti consacrerò, prescelto. Stai entrando nel sesto cerchio: ti auguro che tu possa portare la luce e dissolvere le tenebre.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Ora, se lo desideri, posso insegnarti la formula magica per l'ultimo cerchio.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Oh... un'ultima cosa. Mi ci è voluto un po' per riconoscere il tuo valore.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Hai ricevuto quella lettera da me quando ti hanno gettato nella Barriera.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Sì, così facendo mi hai risparmiato tutte le chiacchiere del giudice.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //E tu sei il prescelto di Innos.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //Ricevi la mia benedizione ora, prescelto!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innos, luce del sole e fuoco del mondo, benedici quest'uomo, tuo servo prescelto.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Dagli il coraggio, la forza e la saggezza per seguire la via che hai tracciato per lui.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Non è ancora giunto il momento per questo. Ti darò istruzioni solo dopo che avrei percorso un altro pezzo del cammino che Innos traccerà per te.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SPELLS_Condition;
	information	 = 	DIA_Pyrokar_SPELLS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Istruiscimi (a creare le rune)";
};
func int DIA_Pyrokar_SPELLS_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SPELLS_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Insegnami.
	
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
	Info_AddChoice		(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //Non sono in grado di insegnarti altro.
	};
};
FUNC VOID DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
};
FUNC VOID DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};
///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_Parlan_Condition;
	information	 = 	DIA_Pyrokar_Parlan_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mi manda Parlan....";
};
func int DIA_Pyrokar_Parlan_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Parlan_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Mi ha mandato Parlan. Voglio aumentare i miei poteri magici.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Beh, tu hai imparato molte cose, e la tua forza è cresciuta. Da ora in poi, sarò il tuo maestro.
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_TEACH_MANA_Condition;
	information	 = 	DIA_Pyrokar_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voglio aumentare i miei poteri magici.";
};
func int DIA_Pyrokar_TEACH_MANA_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo (hero,DIA_Pyrokar_Parlan)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Voglio aumentare i miei poteri magici.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Avverto il potere magico scorrere in te in maniera ottimale. Nemmeno io posso insegnarti come migliorarlo ulteriormente.
	};
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	900;
	condition	 = 	DIA_Pyrokar_PERM_Condition;
	information	 = 	DIA_Pyrokar_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"(Benedizione)";
};
func int DIA_Pyrokar_PERM_Condition ()
{	
	if (Kapitel >= 2)	
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Benedicimi, maestro.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //Che ne dici di una piccola benedizione? Potrebbe tornarmi utile.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Possa la tua battaglia finale contro il nostro acerrimo nemico essere coronata da un successo. Che Innos sia con te.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Possa Innos accompagnarti e proteggerti da tutte le insidie che dovrai affrontare.
			};
};

//##############################################################
//##
//##
//##							KAPITEL 3
//##
//##
//##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP3_EXIT_Condition;
	information	= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BACKFROMOW_Condition;
	information	 = 	DIA_Pyrokar_BACKFROMOW_Info;

	description	 = 	"Vengo dalla vecchia Valle delle Miniere.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //Vengo dalla vecchia Valle delle Miniere.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //Che notizie porti?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //Il nemico ha radunato un esercito di draghi e orchi.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //L'abbiamo già saputo da Milten. Che ne è del carico di metallo del re?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //La miniera che stanno scavando per Garond nella valle non è in grado di soddisfare le richieste del re.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Le giornate stanno diventando sempre più grigie e la luce del sole sempre più debole.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //Sono stato attaccato dagli uomini vestiti di nero.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Lo so. Sono i Cercatori. Scagnozzi provenienti dai regni inferiori di Beliar. Fai attenzione a loro. Cercheranno di impossessarsi di te.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Una volta posseduto, non sarai più te stesso e a quel punto potrai trovare aiuto solo qui nel monastero. Fai attenzione dunque.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar mi ha raccontato dei Cercatori, uomini dalle vesti nere che sono seguaci di Beliar. Mi ha avvertito che possono possederti. Dovrò tornare velocemente al monastero se questo dovesse accadermi."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Ho chiesto a Karras di indagare su questa faccenda. Presto egli riuscirà certamente a saperne di più, in modo da avere una visione più chiara della situazione.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar ha ordinato a Karras di occuparsi della minaccia dei Cercatori."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Tieni questa runa, essa ti permetterà di tornare direttamente al monastero nel caso in cui tu abbia bisogno del nostro d'aiuto.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Ricordati, dobbiamo resistere, o saremo tutti condannati.

};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	31;
	condition	 = 	DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_GIVEINNOSEYE_Info;

	description	 = 	"Sono venuto per prendere l’Occhio di Innos.";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //Sono venuto per prendere l’Occhio di Innos.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Vedo che hai avuto l'autorizzazione per portare l'Occhio di Innos da Lord Hagen in persona
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Temo di doverti deludere. Siamo caduti vittima di un piano traditore del nemico.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //L'Occhio di Innos è stato preso con la forza e portato via da queste sacre mura.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Chi oserebbe tanto, maestro?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Chi è stato?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //Chi oserebbe tanto, maestro?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //Chi è stato?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Il male è astuto e di solito agisce in segreto. Solo di rado lo si vede operare alla luce del sole per perseguire i suoi scopi malvagi.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Ma ora la situazione è cambiata. Il nemico ora si mostra apertamente per le strade, in ogni casa e in ogni piazza.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //Questo significa solo che non teme alcun avversario e che non si tirerà indietro di fronte a niente.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Pedro, uno dei nostri seguaci più fedeli, candidato a indossare l'alta veste dei Maghi del fuoco, ha cambiato alleanza in maniera improvvisa e preoccupante.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //Il nemico si è impossessato di lui, infliggendoci un duro colpo.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro è stato costretto a introdursi nelle nostre sacre mura e a rubare l'Occhio.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Temo semplicemente che egli abbia trascorso troppo tempo da solo, fuori dai cancelli e dunque oltre le mura protettive del monastero, esposto a ogni sorta di pericolo in agguato.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschuß freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist für den SC nun als Traitor bekannt. Muß hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "Ottimo. Avrei dovuto saperlo. Sono arrivato tardi, questi idioti del monastero si sono lasciati rubare l'Occhio da sotto il naso da alcuni novizi, e ora toccherà a me rincorrere il traditore Pedro, nella speranza che non lo abbia già rivenduto.");
 	B_LogEntry (TOPIC_TraitorPedro, "Il traditore Pedro ha rubato l'Occhio di Innos dal monastero. Immagino che i Maghi del Fuoco sarebbero solamente contenti di acciuffarlo.");
};



///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	34;
	
	condition	 = 	DIA_Pyrokar_NOVIZENCHASE_Condition;
	information	 = 	DIA_Pyrokar_NOVIZENCHASE_Info;

	description	 = 	"In quale direzione è fuggito il ladro?";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition ()
{
	if (Kapitel == 3)
	   && (Pedro_Traitor == TRUE)	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //In quale direzione è fuggito il ladro?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro ha ucciso alcuni dei novizi che hanno cercato di fermarlo e si è dileguato nella nebbia del mattino.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //Molti novizi si sono messi sulle sue tracce per riportare l'Occhio intatto al suo posto.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Se vuoi raggiungerli devi affrettarti, prima che Pedro si allontani troppo.

	MIS_NovizenChase = LOG_RUNNING;	
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	35;
	condition	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Info;

	description	 = 	"Ho trovato l’Occhio di Innos.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition ()
{
	if (Kapitel == 3)
		&& 	(MIS_NovizenChase == LOG_RUNNING)
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //Ho trovato l'Occhio di Innos. È rotto.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Ma... non può essere. Cos'è successo?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Era in mano a delle persone davvero malvagie. Ad ogni modo, sono arrivato troppo tardi.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Stavano eseguendo uno strano incantesimo in un luogo per i rituali a forma di mezzaluna, su in quei boschi.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Che Innos ci protegga. Hanno profanato il nostro Circolo del sole.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Nemmeno nei miei incubi peggiori avrei mai immaginato che possedessero un potere così grande.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Cosa facciamo, adesso?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Cosa facciamo, adesso?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //Il nemico è diventato molto forte, tuttavia questo antico artefatto rappresenta ancora una potente minaccia per lui.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Dobbiamo riparare l'Occhio e ripristinare il suo vecchio potere. Ma non abbiamo molto tempo.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Non voglio nemmeno immaginare cosa ne sarà di tutti noi ora. Senza la protezione dell'Occhio, siamo completamente in balia del nemico.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Vai in città da Vatras, il mago dell'acqua. Solo lui saprà cosa fare in questa terribile situazione. Portagli l'Occhio, e sbrigati.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Perché Vatras?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Cos’è il Circolo del Sole?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar vuole che chieda consiglio a Vatras, il Mago dell'Acqua in città, su cosa fare con l'Occhio danneggiato.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Perché Vatras?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Il privilegio di indossare la veste non ti autorizza a discutere i miei ordini, fratello.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras è un servo di Adanos. Solo la conoscenza dei maghi dell'acqua ci permetterà di fare chiarezza in questo momento oscuro.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //Questo è tutto ciò che ti serve sapere.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Cos’è il Circolo del Sole?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Ogni anno, tutti i maghi e i novizi del monastero compiono un pellegrinaggio in questo luogo durante il solstizio per segnare l'inizio di un nuovo ciclo.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //Quel luogo è pieno dell'enorme potere del sole.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //Non sapevo che questo potere potesse essere annullato e invece è successo.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter ()
{
		Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
};


///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information	 = 	DIA_Pyrokar_SPOKETOVATRAS_Info;

	description	 = 	"Ho parlato con Vatras.";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //Ho parlato con Vatras.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Ah, bene. Dove si trova?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Sta preparando un rituale al Circolo del sole per riparare l'Occhio di Innos.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Se ciò che dici è vero, allora forse ci resta ancora una speranza.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras vuole che tu e Xardas gli diate una mano.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //COSA? Anche Xardas sarà li? Non può essere vero... stai mentendo.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Ehi, non è stata una mia decisione. È Vatras che ha insistito.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //C'è sempre quello Xardas di mezzo. Mi sono stancato. Difficilmente le cose potrebbero andare peggio.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Come faccio a sapere che Xardas non è in combutta con il nemico?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Non posso fidarmi di Xardas. Non mi importa di quanto ci serva.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Mi dispiace, ma non posso aiutare Vatras a queste condizioni.
	B_GivePlayerXP (XP_Ambient);


};


///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Info;

	description	 = 	"Non si può fare senza di te...";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Devi venire anche tu, altrimenti Vatras non potrà svolgere il rituale.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Devi fidarti di Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Non c'è niente che possa fare, hai sentito? Non ho la minima prova che Xardas non stia tramando contro di noi. Non posso accettare.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //E se ti portassi delle prove?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Temo sia impossibile. Dovresti recuperare delle prove davvero schiaccianti.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //Per ciò che riguarda Xardas, ho i miei dubbi che possa riuscire a impressionarmi.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar sembra riluttante quando si parla di Xardas. Andrò a discutere con Xardas su come convincerlo a venire al rituale al Circolo del Sole.");
	
	Pyrokar_DeniesInnosEyeRitual = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BUCHZURUECK_Condition;
	information	 = 	DIA_Pyrokar_BUCHZURUECK_Info;

	description	 = 	"Ho portato questo libro di Zardas.";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition ()
{
	if (Npc_HasItems (other,ItWr_XardasBookForPyrokar_Mis))
		 && (Kapitel == 3)
		 {
				return TRUE;
		 };
};

func void DIA_Pyrokar_BUCHZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //Ho portato questo libro di Zardas.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //È un segno della sua lealtà.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Fammelo vedere.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(stupito) Ma è incredibile. Hai la minima idea di cosa sia ciò che mi hai appena dato?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Ehm. No.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(irritato) Questo è un antico volume andato perso da anni.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Credevamo tutti che si fosse perso e ora invece vengo a sapere che ce l'aveva Xardas.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Allora accetterai di prendere parte al rituale?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Sì, partirò alla volta del Circolo del sole, ma di certo non perché sono convinto delle buone intenzioni di Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //Infatti verrò solo per farmi spiegare da quella carogna dove ha tenuto nascosto il libro per tutti questi anni. Stavolta ha passato davvero il limite.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Ci incontreremo al Circolo del sole.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar ha finalmente accettato di venire al Circolo del Sole.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_PRERITUAL_Condition;
	information	 = 	DIA_Pyrokar_PRERITUAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pensi di poter sistemare di nuovo l’Occhio?";
};

func int DIA_Pyrokar_PRERITUAL_Condition ()
{
		if (Pyrokar_GoesToRitualInnosEye == TRUE)
			&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
			&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_PRERITUAL_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //Credi di poter riparare nuovamente l'Occhio?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //È difficile a dirsi. Aspettiamo e vediamo cosa accade.
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_AUGEGEHEILT_Condition;
	information	 = 	DIA_Pyrokar_AUGEGEHEILT_Info;

	description	 = 	"Ce l’hai fatta. L’Occhio di Innos è guarito.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Pyrokar_AUGEGEHEILT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Ce l’hai fatta. L’Occhio di Innos è guarito.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Non credevo che sarebbe stato possibile.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Sì, maestro.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Hai dato prova più volte di essere pronto per l'Ordine supremo dei Maghi del fuoco.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //Da oggi sei un membro del consiglio e rappresenterai il nostro ordine nel mondo. Ora sei uno degli alti Maghi del fuoco.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Indossa l'alta veste con dignità e porta onore e ricchezza all'ordine, fratello mio.
		
			CreateInvItem	(hero, ITAR_KDF_H);
			AI_EquipArmor	(hero, ITAR_KDF_H);	
			
			heroGIL_KDF2 = TRUE;
		};	
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_KAP3_READY_Condition;
	information	 = 	DIA_Pyrokar_KAP3_READY_Info;

	description	 = 	"Cosa rimane da fare, qui?";
};

func int DIA_Pyrokar_KAP3_READY_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_KAP3_READY_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Cosa mi rimane da fare qui?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Non perdere tempo in sciocchezze. Vai a uccidere i draghi. Tieni, prendi l'Occhio.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Ricordati che prima di poter attaccare un drago, devi parlargli.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fügt ihnen auch unerträgliche Schmerzen zu, wenn du es bei dir trägst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Il potere dell'Occhio costringerà i draghi a parlarti e a dirti la verità.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Inoltre, quando lo indosserai esso ti proteggerà dai loro attacchi.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Tuttavia il potere dell'occhio non dura in eterno e dovrai ricaricarlo nuovamente con energia magica.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Per farlo, ti serve l'essenza del cuore di un drago che puoi trasferire all'Occhio presso il laboratorio di un alchimista.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Solo allora potrai sfidare un altro drago.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Grazie. Me ne ricorderò.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Ora hai tutto ciò che ti serve. Vai dunque. Non c'è rimasto più molto tempo.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Ora sono pronto per affrontare i draghi. L'Occhio di Innos mi aiuterà ad annientarli. Ma non devo dimenticare di portarlo quando scenderò in campo contro le bestie. Devo parlare ai draghi prima di avere qualche probabilità di attaccarli. Il problema è che l'Occhio perde potere ogni volta che parlo a uno di loro. Mi servono il cuore di un drago e una fiaschetta da laboratorio vuota per portare la pietra indebolita dell'amuleto e l'estratto di cuore di drago su un banco d'alchimista prima di affrontare un altro drago."); 

	MIS_ReadyforChapter4 = TRUE; //Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck (NEWWORLD_ZEN);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	39;
	condition	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Info;

	description	 = 	"Ho trovato uno strano almanacco.";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))		
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //Ho trovato uno strano almanacco.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //Davvero? Di che almanacco si tratta?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Non ne sono sicuro. Credevo che tu sapessi cosa farne.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //In verità, questo è molto inquietante. Sono contento che tu l'abbia portato da me. È stata una mossa molto saggia.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Suppongo che ce ne siano degli altri in giro. Vai e trova altri di questi libri maledetti
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Ho il sospetto che si tratti di uno strumento di potere dei Cercatori.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Essi lo usano per controllare le anime perse delle loro vittime.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //A quanto pare essi riportano su questi libri i nomi delle persone che hanno in mente di possedere.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Ascolta. Ti do questa lettera magica. Ti aiuterà a leggere i nomi segnati sui libri.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Trova quelle vittime e portami i loro libri in modo che possa distruggerli.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Ma prima dovresti mostrarne almeno uno a Karras. Forse gli torneranno utili per i suoi studi.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //Non fare l'errore di tentare di distruggerli da solo. Non sei ancora pronto per resistere al loro potere.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar vuole rendere innocuo l'almanacco dei posseduti. Mi ha dato una lista di tutte le persone che i Cercatori intendono possedere. Più tardi potrebbero aggiungersi altri nomi alla lista."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Non avvicinarti troppo ai Cercatori, altrimenti si impossesseranno di te.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Se dovessi accorgerti di non essere ancora in grado di resistere al loro richiamo, torna da me il prima possibile.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //La tua anima può essere salvata solo qui nel monastero.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //Non esiste una protezione contro questi attacchi mentali?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //È possibile. Karras potrebbe essere a conoscenza di qualcosa in proposito.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"Karras dovrebbe aiutarmi a trovare una protezione contro gli assalti mentali dei Cercatori."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	70;
	condition	 = 	DIA_Pyrokar_SCOBSESSED_Condition;
	information	 = 	DIA_Pyrokar_SCOBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Libera dal demonio)";
};

func int DIA_Pyrokar_SCOBSESSED_Condition ()
{
	if (SC_IsObsessed == TRUE)
		{
				return TRUE;
		};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info ()
{
	if ((Got_HealObsession_Day<=(Wld_GetDay()-2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems (other,ItPo_HealObsession_MIS) == FALSE)  
		{
			if (hero.guild == GIL_KDF)
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Maestro, sono posseduto. Curami.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //E sia! Prendi questa pozione. Ti libererà dai tuoi incubi.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Possa la grazia di Innos salvarti.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Agisci nel suo interesse e fai attenzione all'occhio malvagio del nemico.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Ma ti avverto: se rimani esposto troppo a lungo al loro potere, a un certo punto non ci sarà più niente da fare per te. Tienilo a mente.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Credo di essere posseduto. Puoi curarmi?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //Non prima di aver ricevuto un segno del tuo rispetto verso questo monastero, figliolo. Sono 300 monete d'oro.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "È troppo.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Fantastico. Ecco i soldi.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Ma hai appena avuto una pozione guaritrice. Non tornare da me fino a quando non avrai davvero bisogno del mio aiuto.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Fantastico. Ecco i soldi.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Tieni, bevi questa. Possa la grazia di Innos salvarti.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //Portami i soldi e ti aiuterò.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //È troppo.
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Pyrokar_AlmanachBringen_Condition;
	information	 = 	DIA_Pyrokar_AlmanachBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ho molte altre cose da dirti sui quei posseduti";
};

func int DIA_Pyrokar_AlmanachBringen_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN))
		{
				return TRUE;
		};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Ho molte altre cose da dirti sui quei posseduti
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Parla, fratello.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold für einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //Ho trovato un altro almanacco.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //Ho altri libri dei Cercatori per te.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Mi fa piacere. Temo comunque che ve ne siano degli altri in giro. Continua a cercare.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Molti sono già stati trovati, ma non credo che li abbiamo tutti.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Mi hai già portato numerosi libri del nemico.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Sarei sorpreso se ce ne fossero molti altri in giro.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Prendi questo. È un regalo da parte del monastero che ti sarà d'aiuto quando incontrerai il male.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //E ricordati di dare un'occhiata alla mia lettera magica ogni tanto.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //È possibile che provino a fare la stessa cosa su altre persone i cui nomi non si trovavano ancora negli almanacchi.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE; 
	};
	AlmanachGeld	= (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems (self, ItMi_Gold, AlmanachGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, AlmanachGeld);
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

INSTANCE DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP4_EXIT_Condition;
	information	= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP4_EXIT_Info()
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

INSTANCE DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP5_EXIT_Condition;
	information	= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DRACHENTOT_Condition;
	information	 = 	DIA_Pyrokar_DRACHENTOT_Info;

	description	 = 	"Tutti i draghi sono morti.";
};

func int DIA_Pyrokar_DRACHENTOT_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //Tutti i draghi sono morti.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //Questa è davvero una bella notizia, ma non cambia per niente la nostra situazione che appare ormai disperata.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //I Cercatori non se ne sono ancora andati, anzi. Ho sentito sempre più voci secondo le quali il loro numero ultimamente è aumentato.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Uccidere i draghi ha certamente indebolito il nemico, ma non è bastato. Dobbiamo estirpare questo male alla radice.

};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DERMEISTER_Condition;
	information	 = 	DIA_Pyrokar_DERMEISTER_Info;

	description	 = 	"Ho parlato con i draghi.";
};

func int DIA_Pyrokar_DERMEISTER_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //Ho parlato con i draghi.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //Cosa ti hanno detto?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //Hanno continuato a parlare del potere del loro padrone e di come si sia sistemato nelle Sale di Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Che Innos ci protegga. Il Tempio Oscuro ha riottenuto il suo potere e ora sta inviando i propri uomini nel nostro mondo.

};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_WASISTIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_WASISTIRDORATH_Info;

	description	 = 	"Cosa sono queste stanze di Irdorath?";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //Cosa sono queste stanze di Irdorath?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //Il tempio della preghiera dell'est del dio Beliar. Ce ne sono quattro di essi nella terra di Myrtana, ma questo è probabilmente il più terrificante di tutti.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Circa 40 anni fa, i templi del nord e dell'ovest di questa orribile divinità furono distrutti.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //I cavalieri coraggiosi allora diedero tutto se stessi per radere al suolo quelle potenti costruzioni.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //A quel tempo, gli eserciti oscuri del nemico non poterono nulla contro la superiorità numerica dei paladini e dei cavalieri e il loro coraggio.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Sarebbe stato facile distruggere anche gli ultimi due templi rimasti e liberare così la terra dal male per sempre...
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //...ma dopo la distruzione del secondo tempio, essi scomparvero improvvisamente.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(beffardo) Scomparso. Un tempio intero. Sì, come no.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Non prendermi in giro. La situazione è grave. Se le Sale di Irdorath hanno davvero riottenuto il loro potere, allora non sarà facile annientare il nemico.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Per questo, dovrai prima trovarlo, e credo che questo sarà il tuo prossimo e più difficile compito.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Lo vedremo.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Secondo Pyrokar le Sale di Irdorath sono tempio d'invocazione perduto del dio Beliar. Devo trovare questo tempio."); 

};


///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	54;
	condition	 = 	DIA_Pyrokar_BUCHIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_BUCHIRDORATH_Info;

	description	 = 	"Il libro di Xardas che tutti credevano fosse andato perso... dove si trova?";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (ItWr_HallsofIrdorathIsOpen  == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //Il libro di Xardas che tutti credevano fosse andato perso... dove si trova?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Ero sicuro che me l'avresti chiesto. Ma temo che non ti sarà di nessun aiuto.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //È stato sigillato magicamente. L'ho riposto in una delle nostre stanze inferiori e persino noi abbiamo cercato invano di aprirlo.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Quel maledetto Xardas ci ha giocato un brutto tiro.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //Posso vedere il libro?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Fai pure. Non capisco però come potrai riuscire dove i più grandi maestri del nostro monastero hanno fallito.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Ma accomodati pure e prova, Talamon non te lo impedirà.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Il libro di Xardas LE SALE DI IRDORATH si trova nei sotterranei del monastero, protetto da Talamon. I maghi non sono riusciti ad aprirlo. È stato sigillato magicamente e si dice che Xardas ne sia responsabile."); 
	
	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Info;

	description	 = 	"Sono riuscito ad aprire il libro di Xardas.";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition ()
{
	if (ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //Sono riuscito ad aprire il libro di Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Cosa? Come ci sei riuscito? Mi ha fatto quasi disperare.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas mi ha svelato il trucco.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Suppongo sia stata solo fortuna sfacciata.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Suppongo sia stata solo fortuna sfacciata.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Non dire sciocchezze. Fortuna!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Quando nemmeno io riesco ad aprire il libro e poi arriva uno come te e ce la fa...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //...dà da pensare.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Ad ogni modo, dato che sei stato l'unico in grado di aprire il libro, verrà affidato a te, almeno fino a quando non avremo superato questa crisi.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas mi ha rivelato il trucco.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Ah, ecco come hai fatto. Interessante. Spero solo per te che la cattiva influenza di Xardas non finisca per rovinarti.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Ti avverto. Non abboccare ai trucchetti di quel vecchio demonio. Potresti pentirtene.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;

	description	 = 	"Il libro parla di una biblioteca segreta.";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition ()
{
	if 	(ItWr_SCReadsHallsofIrdorath == TRUE)
		&& (Kapitel == 5)	
		&& (MIS_SCKnowsWayToIrdorath == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
			{
					return TRUE;
			};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //Il libro parla di una biblioteca segreta.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //Di cosa stai parlando?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //Una biblioteca nascosta dietro queste mura. Ti dice niente?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //No. Dove dovrebbe trovarsi questa biblioteca di cui parli?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Capisco, non ne hai idea. Mmmh.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar non sa niente sulla biblioteca segreta. Sembra che solo Xardas abbia accesso a essa."); 

};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;

	description	 = 	"So dove trovare le sale di Irdorath.";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //So dove trovare le sale di Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Il tempio si trova su un'isola. Ho trovato una carta nautica che ne indica la posizione.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //Splendido. Allora ti servirà una nave e un equipaggio per affrontare il nemico.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Ma ricordati che devi essere ben preparato se vuoi annientare il Signore di Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //Dove posso trovare un equipaggio?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Il tuo equipaggio dovrebbe essere composto da uomini affidabili.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Parla con i tuoi amici e pensa a chi potrebbe tornarti utile una volta che sarai sull'isola.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Ti servirà anche un mago. Ma purtroppo non posso darti un solo uomo del monastero.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Dovrai chiedere aiuto a un mago che non lavora nel monastero.

};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_SCWILLJORGEN_Condition;
	information	 = 	DIA_Pyrokar_SCWILLJORGEN_Info;

	description	 = 	"Jorgen è un esperto marinaio.";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&(Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen è un marinaio esperto. Lui potrebbe aiutarmi a raggiungere l'Isola di Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Temo che non sarà così semplice.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Ha accettato di lavorare per la Confraternita. Non ha mai pagato la tassa né ci ha mai portato una pecora in dono.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen deve terminare il suo lavoro prima, dopodiché, se lo vorrai, potrai assumerlo.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Quanto tempo gli ci vorrà?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Egli ha mangiato in un solo giorno ciò che un novizio consuma in tre settimane.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Dunque non posso permettergli di andarsene prima che abbia lavorato sodo nei nostri giardini per tre mesi.

};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_MACHDTFREI_Condition;
	information	 = 	DIA_Pyrokar_MACHDTFREI_Info;

	description	 = 	"Cosa devo fare per poter condurre Jorgen con me ADESSO?";
};

func int DIA_Pyrokar_MACHDTFREI_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_MACHDTFREI_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //Cosa devo fare per poter condurre Jorgen con me ADESSO?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Mmmh. A dire il vero c'è una cosa che potresti fare per me, e i tuoi buoni rapporti con Xardas potrebbero facilitarti.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //Ho saputo che negli ultimi giorni stanno accadendo strane cose nella sua torre.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Molti abitanti della città sentono delle forti grida provenire da lì di notte e vedono strane luci intorno alla torre.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Come se non avessimo già abbastanza problemi. Vai lì e sistema la faccenda.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Quindi potrai prendere Jorgen.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"Strane cose accadono nella torre di Xardas. Se dovessi occuparmene, posso portare Jorgen con me.");
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_DTCLEARED_Condition;
	information	 = 	DIA_Pyrokar_DTCLEARED_Info;

	description	 = 	"La faccenda della torre di Xardas si è risolta da sola.";
};

func int DIA_Pyrokar_DTCLEARED_Condition ()
{
	if (Npc_IsDead(Xardas_DT_Demon1)) 
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_DTCLEARED_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //La faccenda della torre di Xardas si è risolta da sola.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Di cosa si trattava allora? ...No, aspetta, non voglio nemmeno saperlo.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Se vuoi ancora prendere Jorgen, vai a parlargli e portalo con te.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Che Innos ti protegga.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

//---------------------------------
var int Pyro_Gives_Aura;
//---------------------------------
instance DIA_Pyrokar_AmulettofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_AmulettofDeath_Condition;
	information	 = 	DIA_Pyrokar_AmulettofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"La profezia fa riferimento alla sacra Aura di Innos.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition ()
{
	if (PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //La profezia fa riferimento alla sacra Aura di Innos.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //L'Aura di Innos è un amuleto destinato solo ai più grandi maghi di un'epoca.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Posso averlo?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Che tipo di amuleto è?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //Posso averlo?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //Cosa? Come intendi usarlo?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Per combattere il drago.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Sì, certo. Ti darò l'amuleto, ma abbine cura.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Contaci.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Non vorrei doverlo riacquistare da un mercante più tardi.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Usalo bene e che Innos possa sempre proteggerti.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //Che tipo di amuleto è?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //Dicono che sia stato forgiato da Innos in persona per donarlo alla razza umana.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Esso protegge chi lo indossa da ogni tipo di danno.
};


///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_PotionofDeath_Condition;
	information	 = 	DIA_Pyrokar_PotionofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Cosa sono le Lacrime di Innos?";
};

func int DIA_Pyrokar_PotionofDeath_Condition ()
{
	if (Npc_HasItems (other,ItPo_PotionOfDeath_01_MIS))
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info ()
{
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //Cosa sono le Lacrime di Innos?
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Le Lacrime di Innos non sono altro che una favola per bambini che racconta come ha avuto inizio la battaglia fra Innos e Beliar.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Capisco.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Ho trovato questa pozione.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Capisco.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //Non so se comprendi a fondo la tua situazione, ma credo sia difficile che il nostro nemico possa essere sconfitto grazie a una vecchia storiella per bambini.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //Ho trovato questa pozione.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //Non può essere. Non posso crederci.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //Qual è il problema?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Se queste sono davvero le Lacrime di Innos, allora...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(lo interrompe) Non credo proprio.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //Non interrompermi. Se queste sono le vere Lacrime di Innos, allora disponiamo di un'arma potente contro il nemico.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Allora, cosa sono le Lacrime di Innos?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Cosa intendi per 'arma'?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //Allora, cosa sono le Lacrime di Innos?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Quando Innos si rese conto che doveva battersi con suo fratello Beliar per preservare la creazione, il suo dispiacere fu enorme.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Egli iniziò a piangere e le sue lacrime caddero sulla terra. Ne caddero molte, dato che il suo cuore era talmente pieno di dolore che pianse per 13 anni.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Arriva al punto.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //La gente che trovò queste lacrime e le assaggiò ottenne una forza e un'intelligenza sovrannaturali. Essi riconobbero la saggezza dell'universo di Innos e cominciarono a servirlo.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Essi furono i primi membri della Comunità del fuoco. Le lacrime diedero loro forza, coraggio e saggezza, ma tutto questo è accaduto molto tempo fa e sono passati oltre 250 anni dall'ultima volta che qualcuno ha visto una lacrima di Innos.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Cosa intendi con 'arma'?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //La leggenda narra che, sotto l'influenza di questa sostanza, i guerrieri di Innos erano in grado di portare a termine dei compiti quasi sovrannaturali.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Essi erano immuni a ogni tipo di fatica e avevano la forza di due orsi.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Le più grandi imprese eroiche di quei tempi furono possibili solo grazie alle Lacrime di Innos.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Capisco.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Ma le lacrime possono portare anche morte e sofferenza. Solo ai membri del nostro ordine è concesso di bere questa pozione.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Tutti gli altri, inclusi i paladini del nostro Signore, andrebbero incontro a una morte dolorosa.

	Npc_RemoveInvItems 	(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems 		(hero,ItPo_PotionOfDeath_02_Mis,1);
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


INSTANCE DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc		= KDF_500_Pyrokar;
	nr		= 999;
	condition	= DIA_Pyrokar_KAP6_EXIT_Condition;
	information	= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pyrokar_PICKPOCKET (C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 900;
	condition	= DIA_Pyrokar_PICKPOCKET_Condition;
	information	= DIA_Pyrokar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen (108, 550);
};
 
FUNC VOID DIA_Pyrokar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK 		,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
	
func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};















































































































































