var int URSHAK_SUCKED;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Urshak_EXIT   (C_INFO)
{
	npc         = NONE_110_Urshak;
	nr          = 999;
	condition   = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HALLO		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	5;
	condition	 = 	DIA_Urshak_HALLO_Condition;
	information	 = 	DIA_Urshak_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (URSHAK_SUCKED	== FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Urshak_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_00"); //(aggressivo) KHROTOK JABARTH!!!
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //Aspetta! Me conoscere te. Tu essere amico umano con voce dolce.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //Amico uccidere demone cattivo KRUSHAK.
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"Ho ritrovato il mio vecchio amico orco Ur-Shak."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "Cosa stai facendo, qui?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "Un orco parlante?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //Un orco parlante?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //Tu dimenticato di Ur-Shak? Questo rende me triste.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //Ur-Shak aiutato amico molto tempo fa, prima di prendere ULU-MULU per raggiungere mio villaggio. Dunque orchi rispettano amico e amico non può essere ucciso da orchi.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //Amico poi entra dentro tempio degli orchi e sconfigge demone malvagio. È successo molti anni fa. Non ti ricordi?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //Hai scelto il momento sbagliato per incrociare la mia strada. Stavo quasi per ucciderti. Che ci fai qui?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //Ur-Shak guarda terra e vede cosa ne è di essa e della mia gente.
	Info_ClearChoices	(DIA_Urshak_HALLO);
};



///////////////////////////////////////////////////////////////////////
//	Info WasmachenOrks
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASMACHENORKS		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	6;
	condition	 = 	DIA_Urshak_WASMACHENORKS_Condition;
	information	 = 	DIA_Urshak_WASMACHENORKS_Info;

	description	 = 	"Perché gli orchi stanno attaccando gli umani?";
};

func int DIA_Urshak_WASMACHENORKS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASMACHENORKS_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //Perché gli orchi stanno attaccando gli umani?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //Ur-Shak dice sempre a orchi che umani non sono cattivi e che ci sono molti buoni amici fra loro.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //Ma lo sciamano non ascolta Ur-Shak. Ur-Shak non è ancora ben visto fra la gente.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //Dunque Ur-Shak non prestare molta attenzione a grosso piano di guerra contro gli umani.
	B_LogEntry (TOPIC_Urshak,"Non è ancora riuscito a convincere il suo popolo ad ascoltarlo. È ancora un esiliato."); 
};


///////////////////////////////////////////////////////////////////////
//	Info soviele
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_SOVIELE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	7;
	condition	 = 	DIA_Urshak_SOVIELE_Condition;
	information	 = 	DIA_Urshak_SOVIELE_Info;

	description	 = 	"Perché siete improvvisamente diventati così tanti?";
};

func int DIA_Urshak_SOVIELE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_SOVIELE_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //Perché siete improvvisamente diventati così tanti?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //Gli orchi vengono dalle montagne, ma altri sono venuti con navi e hanno fatto grosso recinto.
};


///////////////////////////////////////////////////////////////////////
//	Info Zaun
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_ZAUN		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	8;
	condition	 = 	DIA_Urshak_ZAUN_Condition;
	information	 = 	DIA_Urshak_ZAUN_Info;

	description	 = 	"Cosa si nasconde dietro il lungo recinto di orchi a est?";
};

func int DIA_Urshak_ZAUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_ZAUN_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //Cosa si nasconde dietro la lunga palizzata degli orchi a est?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //Gli orchi fanno sempre grossa palizzata e un campo base per guerra.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //Palizzata buona per guerra. Nasconde la forza dell'esercito e protegge gli orchi.
};



///////////////////////////////////////////////////////////////////////
//	Info washastduvor
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASHASTDUVOR		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_WASHASTDUVOR_Condition;
	information	 = 	DIA_Urshak_WASHASTDUVOR_Info;

	description	 = 	"Cosa pensi di fare, adesso?";
};

func int DIA_Urshak_WASHASTDUVOR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASHASTDUVOR_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //Cosa pensi di fare, adesso?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //Ur-Shak aspetta che esploratori orchi portino Ur-Shak a Hosh-Pak.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //Chi è Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //Essere venerabile sciamano. Lui avere grande influenza sui guerrieri e fare grossi piani per orchi.

	B_LogEntry (TOPIC_Urshak,"Ur-Shak intende incontrare lo sciamano orchesco Hosh-Pak e convincerlo ad accettarlo nuovamente nel concilio degli sciamani."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Dove si trova questo Hosh-Pak?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Perché non vai da lui, allora?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //Perché non vai da lui, allora?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //Ur-Shak prova continuamente a riottenere l'onore e il suo vecchio posto all'interno del consiglio degli sciamani.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //Ma finora, Hosh-Pak non volere ascoltare Ur-Shak. Orchi uccidere Ur-Shak se vedere lui senza esploratori. Ur-Shak deve parlare con Hosh-Pak.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //Forse oggi sarò fortunato.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //Dove si trova questo Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //Hosh-Pak essere in posto dove può vedere orchi guerrieri, su una fortezza vicina a un grosso vulcano.

};

func void DIA_Urshak_WASHASTDUVOR_weiter ()
{
	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);
};



///////////////////////////////////////////////////////////////////////
//	Info hoshpakDead
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKDEAD		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_HOSHPAKDEAD_Condition;
	information	 = 	DIA_Urshak_HOSHPAKDEAD_Info;

	description	 = 	"Hosh-Pak è morto.";
};

func int DIA_Urshak_HOSHPAKDEAD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_WASHASTDUVOR))
		&& (Npc_IsDead(Hosh_pak))
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //Hosh-Pak è morto.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //Hosh-Pak morto? RUSHTASOK!
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //Il mio cuore porta un peso tremendo. Ur-Shak non dimenticherà mai grande orco che ha nominato Ur-Shak sciamano.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //Capisco. Hosh-Pak era il tuo mentore.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //Ur-Shak ora deve portare fardello di dolore, deve dare l'ultima sepoltura a Hosh-Pak. Ur-Shak deve andare.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //Meglio se amico attraversare passo. Qui essere troppo pericoloso.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //Ur-Shak triste se anche amico umano muore.

	B_LogEntry (TOPIC_Urshak,"Hosh-Pak è morto. Il mio amico orco è diretto alla tenda di Hosh-Pak. Egli è addolorato per il suo mentore. Dovrei lasciarlo andare."); 

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,20);
	Npc_ExchangeRoutine	(self,"Start");
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");	
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");	
};


///////////////////////////////////////////////////////////////////////
//	Info geh
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_GEH		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_GEH_Condition;
	information	 = 	DIA_Urshak_GEH_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_GEH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<1000) == FALSE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_GEH_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //È meglio se amico attraversa passo ora.
	Npc_SetRefuseTalk (self,10);
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info HoshpakRache
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKRACHE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_HOSHPAKRACHE_Condition;
	information	 = 	DIA_Urshak_HOSHPAKRACHE_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HOSHPAKRACHE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<=1000))
		&& (URSHAK_SUCKED == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKRACHE_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //(aggressivo) KHROTOK ! Ho saputo che tu presente quando Hosh-Pak è stato ucciso. Tu fatto grosso sbaglio, straniero.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //Vedo che hai preso il suo posto qui. Mi hai preso in giro.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //L'influenza che hai sulla tua gente è maggiore di quanto voglia ammettere. Ora non sei altro che uno strumento del male.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //Straniero avere ragione. Ur-Shak ora essere animato solo da rabbia e vendetta.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //Ur-Shak vede grosso errore nel fidarsi di umano malvagio. Ur-Shak si pente di aver chiamato amico l'umano e di averlo aiutato a non essere ucciso.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //Lo straniero ora abbandona la valle e attraversa il passo. Ur-Shak non può più uccidere straniero ora. L'onore degli sciamani impone a Ur-Shak di non uccidere.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //La prossima volta che ci incontreremo saremo nemici. Ora è meglio se tu vai.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"Ur-Shak è stato accettato nuovamente nel concilio degli sciamani degli orchi. Ora è dalla parte del nemico ed è un pochino nervoso. Farò meglio a tenermi lontano da lui fino a quando non avrò sistemato la mia divergenza con gli orchi. Allora si sarà sicuramente calmato."); 
	B_GivePlayerXP (XP_UrshakBecomesShaman);
};


///////////////////////////////////////////////////////////////////////
//	Info keineWahl
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_KEINEWAHL		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_KEINEWAHL_Condition;
	information	 = 	DIA_Urshak_KEINEWAHL_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_KEINEWAHL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKRACHE))
	&& (Npc_IsInState (self,ZS_Talk))
		{
				return TRUE;
		};
};

func void DIA_Urshak_KEINEWAHL_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //Vai. Me no parlare con straniero.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















