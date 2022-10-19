///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jora_EXIT   (C_INFO)
{
	npc         = VLK_408_Jora;
	nr          = 999;
	condition   = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent   = TRUE;
	description = "Musím jít!";
};

FUNC INT DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jora_EXIT_Info()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //Hej! A co moje prachy?
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_Sperre_Condition;
	information	 = 	DIA_Jora_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Jora_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self,ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Jora_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Jsi bývalý trestanec z dùlní kolonie, nic ti neprodám!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	700;
	condition	 = 	DIA_Jora_WAREZ_Condition;
	information	 = 	DIA_Jora_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Ukaž mi své zboží.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Ukaž mi své zboží.
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET		(C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 1;
	condition	= DIA_Jora_GREET_Condition;
	information	= DIA_Jora_GREET_Info;
	permanent 	= FALSE;
	important	= TRUE;
};
func int DIA_Jora_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GREET_Info ()
{
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Innos tê provázej, cizinèe. Jestli si chceš poâídit dobrou cestovatelskou výbavu, pak jsi na tom správném místê.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Ale varuji tê: jestli máš v plánu si inventáâ vylepšit nêjak pokoutnê bez placení, zavolám stráže!
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //Poèkej, copak vypadám jako nêjaký chmaták?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //(pohrdavê) Pche! Dneska bys nebyl první, kdo by se mi snažil nêco èmajznout.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora prodává na tržišti všechny možné zbranê.");
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Bestohlen_Condition;
	information	 = 	DIA_Jora_Bestohlen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Nêkdo tê okradl?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //Nêkdo tê okradl?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //Nemùžu to dokázat, ten maník byl zatracenê chytrý. Pâedstavil se jako Rengaru - pokud to tedy je jeho skuteèné jméno.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //Posledních pár dní jen tak zevloval na tržišti.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //A každý veèer se pâímo na ulici nalívá pivem. Vsadím boty, že ten šmejd chlastá za MOJE peníze!
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //Jen jsem se na chvilku podíval jinam a už jsem byl bez portmonky!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //Poslyš - jestli se ti povede z toho Rengaru vytâískat moje prachy, povím ti všechno, co vím.
};


// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_HolDeinGold_Condition;
	information	 = 	DIA_Jora_HolDeinGold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mohl bych se pokusit získat zpátky tvoje peníze.";
};
func int DIA_Jora_HolDeinGold_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};
func void DIA_Jora_HolDeinGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //Mohl bych se pokusit získat zpátky tvoje peníze.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //(nedùvêâivê) Fakt? A jak to chceš udêlat?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"Ale za odmênu chci èást zlata!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Rád bych se dozvêdêl, jak se dostat do cechu zlodêjù.", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Pâijde na to - mùžu se s tvou pomocí dostat do horní ètvrti?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //Pâijde na to - mùžu se s tvou pomocí dostat do horní ètvrti?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //(smêje se) To jsi na špatné adrese, já vùbec nejsem z mêsta - jako vêtšina kupcù na tržišti.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Jestli se chceš dostat do horní ètvrti, promluv si v dolní èásti mêsta s nêkterými místními obchodníky.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //Rád bych se dozvêdêl, jak se dostat do cechu zlodêjù.
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Možná že ti mùžu pomoct.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Uvidím, co se dá dêlat.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Kolik penêz to bylo?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Proè jsi nezavolal stráže?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //Ale za odmênu chci èást zlata!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Nejdâív se postarej o to, aby mi vrátili portmonku, a teprve PAK si promluvíme o odmênê!
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Uvidím, co se dá dêlat.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Kolik penêz to bylo?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Proè jsi nezavolal stráže?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //Proè jsi nezavolal stráže?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Stráže jsou nêco platné, pouze pokud zlodêje pâistihneš pâi èinu.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //A když jsem zjistil, že jsem bez portmonky, ten parchant už byl dávno v prachu!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //Kolik penêz to bylo?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 zlaãákù - v téhle mizerné dobê je to víc než dost.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //Uvidím, co se dá dêlat.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //Dej si pozor. Jestli toho lotra jen tak zmlátíš, vloží se do toho stráže.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //Poslední dobou je to tu pêknê drsné. Od chvíle, co do mêsta pâibyli paladinové, stráže každého rváèe bez milosti sejmou.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Budeš si muset nêco vymyslet.
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //Jasnê.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "Obchodníka Jora okradl chlapík jménem Rengaru, který se pâes den potuluje po tržišti.");
	B_LogEntry (TOPIC_Jora, "Musím Jorovi vrátit ukradené zlato.");
	B_LogEntry (TOPIC_JoraDieb, "Obchodníka Jora okradl chlapík jménem Rengaru - jestli ho chytím, možná z toho bude koukat i nêjaká odmêna.");

	Info_ClearChoices 	(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_WegenDieb_Condition;
	information	 = 	DIA_Jora_WegenDieb_Info;
	permanent	 = 	TRUE;
	description	 = 	"K tomu zlodêji...";
};
func int DIA_Jora_WegenDieb_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_WegenDieb_Info ()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //K tomu zlodêji...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Tak jak to vypadá? Chytils ho, a co je dùležitêjší, máš to moje zlato?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"No, stala se mu taková tragická nehoda...",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"Už jsem ho dostal. Je to v klidu.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Utekl mi.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"Ještê stále na tom pracuji.",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //Ještê stále na tom pracuji.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //Tak koukej, aã už to zlato mám zpátky!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Utekl mi.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //A co moje zlato? To se taky ztratilo s ním?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Ano, chytil jsem ho. Teë bude chvíli bruèet v base.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //A co moje zlato?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //No, stala se mu taková tragická nehoda...
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //Aspoà už nikomu nic neukradne. Innosova spravedlnost zvítêzila!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //Kde je moje zlato?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zurückbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady je têch 50 zlaãákù, co ti ukradl.";
};

func int DIA_Jora_BringGold_Condition ()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_BringGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Tady je têch 50 zlaãákù, co ti ukradl.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //Innos buë pochválen! Tak pâece je tady ve mêstê ještê nêjaká spravedlnost!
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //Hej, tohle není 50 zlaãákù! Snažíš se mê taky oškubat, nebo co?
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------

instance DIA_Jora_GHDgInfo (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_GHDgInfo_Condition;
	information	 = 	DIA_Jora_GHDgInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co víš o cechu zlodêjù?";
};

func int DIA_Jora_GHDgInfo_Condition ()
{
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GHDgInfo_Info ()
{
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //Co víš o cechu zlodêjù?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //No dobâe, tak poslouchej- ale jako bych ti nic neâekl, kapišto?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //Do krèmy v docích chodí pár podezâelých týpkù.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //Vsadím se, že i sám krèmáâ jich nêkolik zná.
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Jestli chceš vystopovat zlodêje, zkus si promluvit právê s NÍM.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //Mùžeš tâeba pâedstírat, že ses zapletl do nêèeho nekalého. Na to by mohl naletêt.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Ale mêj pâitom oèi otevâené - s têmi lidmi si není radno zahrávat.
		
		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Belohnung_Condition;
	information	 = 	DIA_Jora_Belohnung_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ale za odmênu chci èást zlata!";
};

func int DIA_Jora_Belohnung_Condition ()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Jora_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //Ale za odmênu chci èást zlata!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Ale já už jsem ti dal cennou radu.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //Tohle by jako odmêna mêlo staèit.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Jestli chceš zlato, tak vypátrej zlodêje a pak si u lorda Andre vyzvedni odmênu.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //Teë se musím zase vênovat zákazníkùm.
	};
	AI_StopProcessInfos (self); 
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_AlriksSchwert_Condition;
	information	 = 	DIA_Jora_AlriksSchwert_Info;
	permanent	 = 	FALSE;
	description	 = 	"Alrik tvrdí, že máš jeho meè.";
};
func int DIA_Jora_AlriksSchwert_Condition ()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_AlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik tvrdí, že máš jeho meè.
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //Myslíš toho otrhance, co mi prodal svou zbraà za pár pochodní a kouskù masa?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //Jo, to je on.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //Jeho meè poâád ještê mám.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //A kolik za nêj budeš chtít?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //No, že jsi to ty...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //Ále, víš co? Vem si ho zadarmo. Když už nic jiného, vrátils mi moje peníze.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //No, že jsi to ty - 50 zlaãákù.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //(mrzutê) Já už ho ale nemám! Èert ví, kam se podêl.
	};
};


// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BUYAlriksSchwert_Condition;
	information	 = 	DIA_Jora_BUYAlriksSchwert_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady je 50 zlaãákù, a teë mi dej Alrikùv meè.";
};
func int DIA_Jora_BUYAlriksSchwert_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};
func void DIA_Jora_BUYAlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Tady je 50 zlaãákù, a teë mi dej Alrikùv meè.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - für 50 Goldstücke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Tumáš - (vychytrale) byl to dobrý obchod.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //Nemáš sice dost zlata, ale to nevadí - nêjaký èas ti tu ten meè odložím. Takže se mùžeš vrátit pozdêji.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jora_PICKPOCKET (C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 900;
	condition	= DIA_Jora_PICKPOCKET_Condition;
	information	= DIA_Jora_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen (31, 45);
};
 
FUNC VOID DIA_Jora_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jora_PICKPOCKET);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_BACK 		,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};
	
func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};









