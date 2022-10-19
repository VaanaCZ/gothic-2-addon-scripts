///////////////////////////////////////////////////////////////////////
//	C_BragoBanditsDead 
///////////////////////////////////////////////////////////////////////

func int C_BragoBanditsDead ()
{
	if ( Npc_IsDead (Ambusher_1013) || (Bdt_1013_Away == TRUE) )
	&& (Npc_IsDead (Ambusher_1014)) 
	&& (Npc_IsDead (Ambusher_1015))
	{
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cavalorn_EXIT   (C_INFO)
{
	npc         = Bau_4300_Addon_Cavalorn;
	nr          = 999;
	condition   = DIA_Addon_Cavalorn_EXIT_Condition;
	information = DIA_Addon_Cavalorn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Cavalorn_PICKPOCKET (C_INFO)
{
	npc			= Bau_4300_Addon_Cavalorn;
	nr			= 900;
	condition	= DIA_Addon_Cavalorn_PICKPOCKET_Condition;
	information	= DIA_Addon_Cavalorn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ukrást tento toulec se šípy je tak snadné jako vzít dítêti bonbón.)";
};                       

FUNC INT DIA_Addon_Cavalorn_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (25 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Cavalorn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Cavalorn_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Cavalorn_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Cavalorn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Cavalorn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Cavalorn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cavalorn_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 25)
	{
		
		B_GiveInvItems (self, other, ItRw_Arrow, 44);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Addon_Cavalorn_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Cavalorn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Cavalorn_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_MeetingIsRunning		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;
func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_MeetingIsRunning_08_00"); //Vítej do 'kruhu', pâíteli.
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Gaan_MeetingIsRunning_08_01"); //Vatras ti svêâí nový úkol.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_HALLO		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_HALLO_Condition;
	information	 = 	DIA_Addon_Cavalorn_HALLO_Info;

	description	 = 	"Máš problém?";
};

func int DIA_Addon_Cavalorn_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_15_00"); //Problémy?
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_08_01"); //(naštvanê) Sakra. Netuším, kde se schovávaj. Zabiješ jednoho a za chvíli tu máš zase všechny.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_08_02"); //(potutelnê) Ale moment, dyk já tê znám! Ty seš ten chlápek, co na mê v Hornickým údolí furt žebral šípy!
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Ty se jmenuješ Cavalorn, že?", DIA_Addon_Cavalorn_HALLO_Ja );
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Manê si vzpomínám...?", DIA_Addon_Cavalorn_HALLO_weissNicht );

};
func void DIA_Addon_Cavalorn_HALLO_weissNicht ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_weissNicht_15_00"); //No, matnê se na nêco pamatuju.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_weissNicht_08_01"); //Ale no tak. Ve svý chajdê v Hornickým údolí jsem tê pâece uèil stâílet z luku a plížit se. Už si vzpomínáš?

};

func void DIA_Addon_Cavalorn_HALLO_Ja ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_Ja_15_00"); //Ty jsi Cavalorn, že jo?
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Ja_08_01"); //Á, vidím, že jsi na mê nezapomnêl, i když už jsme z tý hnusný kolonie pryè.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Ja_08_02"); //Kam máš namíâeno?
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Nemám žádný urèitý úkol.", DIA_Addon_Cavalorn_HALLO_keinZiel );
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Zpátky do Hornického údolí.", DIA_Addon_Cavalorn_HALLO_Bauern );

	if (Mil_310_Stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Do mêsta.", DIA_Addon_Cavalorn_HALLO_Stadt );
	};
};
func void DIA_Addon_Cavalorn_HALLO_Stadt ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_HALLO_Stadt_15_00"); //Do mêsta.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_01"); //(smêje se) Jo tak do mêsta!
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_02"); //Mùžeš se dostat do problémù se strážema - jen tak nêkoho do mêsta nepustí. Potlouká se tu totiž plno banditù.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_03"); //Poslední dobou sem zaèal chodit jeden z têch bejvalejch psionikù z Hornickýho údolí. Prý chodí poâád do Khorinidu a ven.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_04"); //Vešel do údolí pod tou velkou vêží. Vchod musí bejt nêkde tam u toho vodopádu.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_05"); //Snad by sis mêl s tím chlápkem promluvit.
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_Bauern_15_00"); //Zpátky do Hornického údolí.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Bauern_08_01"); //(pâekvapenê) Vážnê? Hmm, moc rád bych tam šel s tebou, ale napâed musím dodêlat, co mám.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Bauern_08_02"); //Až budeš v Hornickém údolí, nemohl by ses mrknout, jestli náhodou ještê nestojí moje stará chajda? Rád bych se tam ještê nêkdy vrátil.
	
	MIS_Addon_Cavalorn_TheHut = LOG_RUNNING;	
	Log_CreateTopic (TOPIC_Addon_CavalornTheHut, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_CavalornTheHut,"Cavalorn chce, abych zjistil, zda jeho stará chýše v Hornickém údolí ještê stojí. Pokud si vzpomínám, bývala v kopcích západnê od pùvodního Starého tábora. Poèítám, že tam nêco nechal.");
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_keinZiel_15_00"); //Nemám na mysli nic urèitého.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_keinZiel_08_01"); //Když mi to nechceš âíct, tak si to nech pro sebe.

	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Beutel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Beutel		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_Beutel_Condition;
	information	 = 	DIA_Addon_Cavalorn_Beutel_Info;

	description	 = 	"Dostal jsem se do té tvé chýše v Hornickém údolí.";
};

func int DIA_Addon_Cavalorn_Beutel_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_HALLO))
	&& ((Npc_HasItems (other,ItSe_ADDON_CavalornsBeutel))||(SC_OpenedCavalornsBeutel == TRUE))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_Beutel_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_00"); //Byl jsem v té tvé chatrèi v Hornickém údolí.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_01"); //Takže poâád ještê stojí.
	if (MIS_Addon_Cavalorn_TheHut == LOG_RUNNING)
	{
		AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_02"); //Jo, a taky už vím, co jsi tam chtêl.
	};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_03"); //Takže jsi nêco našel?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_04"); //Jestli myslíš ten váèek s rudou, tak jo, ten mám.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_05"); //Ty seš ale lišák!
	if (MIS_Addon_Cavalorn_TheHut == LOG_RUNNING)
	{
		AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_06"); //Co jiného bys mohl z té chatrèe chtít? Jinak tam nebylo nic.
	};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_07"); //A máš ho s sebou? Dám ti za nêj 100 zlaãákù.
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);

	if (Npc_HasItems (other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Jasnê.", DIA_Addon_Cavalorn_Beutel_ja );
	}
	else if  (Npc_HasItems (other,ItMi_Nugget))
	{
		Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Ne, ale mám tu hrudku rudy.", DIA_Addon_Cavalorn_Beutel_jaerz );
	};
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Ne.", DIA_Addon_Cavalorn_Beutel_no );
};
func void DIA_Addon_Cavalorn_Beutel_back ()
{
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	AI_Output	(self, other, "DIA_Addon_Cavalorn_back_08_00"); //Doufám, že se tam brzo vrátím.
};
func void DIA_Addon_Cavalorn_Beutel_jaerz ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_jaerz_15_00"); //Ne, ale mám tu kousek rudy.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_jaerz_08_01"); //Taky dobâe.
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back );
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Proè jsi to tam vùbec nechával?", DIA_Addon_Cavalorn_Beutel_why );
};
func void DIA_Addon_Cavalorn_Beutel_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_ja_15_00"); //Jasnê.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_ja_08_01"); //Paráda.
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back );
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Proè jsi to napâed nechal tady?", DIA_Addon_Cavalorn_Beutel_why );
};

func void DIA_Addon_Cavalorn_Beutel_no ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_no_15_00"); //Ne.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_no_08_01"); //Tak mi ho VRAÃ. Beztak už jsem se mêl vrátit do toho proklatýho Hornickýho údolí.
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_no_15_02"); //Málem jsi mê rozbreèel.
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back );
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Proè jsi to napâed nechal tady?", DIA_Addon_Cavalorn_Beutel_why );
};

func void DIA_Addon_Cavalorn_Beutel_why ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_why_15_00"); //Proè jsi to tam vùbec nechával?
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_01"); //Netušil jsem, že ruda bude mít tady v Khorinidu takovou cenu.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_02"); //Dyk v kolonii sis za mizernej kousek rudy nekoupil ani pitomej nocleh.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_03"); //A tady v pâístavním mêstê by ti tu pro ten samej kousek rozmlátili lebku.
};

///////////////////////////////////////////////////////////////////////
//	Info ErzGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_ErzGeben		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_ErzGeben_Condition;
	information	 = 	DIA_Addon_Cavalorn_ErzGeben_Info;

	description	 = 	"Dej mi 100 zlatých a já ti tu tvou rudu pâinesu.";
};

func int DIA_Addon_Cavalorn_ErzGeben_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Beutel))
	&& ((Npc_HasItems (other,ItSe_ADDON_CavalornsBeutel))||(Npc_HasItems (other,ItMi_Nugget)))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_ErzGeben_15_00"); //Dej mi 100 zlaãákù a vrátím ti tvou rudu.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ErzGeben_08_01"); //Dobâe, tady máš.
	CreateInvItems (self, ItMi_Gold, 100);									
	B_GiveInvItems (self, other, ItMi_Gold, 100);		

	if (B_GiveInvItems (other, self, ItSe_ADDON_CavalornsBeutel,1) == FALSE)
		{
			B_GiveInvItems (other, self, ItMi_Nugget,1);
		};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ErzGeben_08_02"); //Seš vážnê kámoš, díky moc.
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_CavalornsBeutel);
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_WASMACHSTDU		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information	 = 	DIA_Addon_Cavalorn_WASMACHSTDU_Info;

	description	 = 	"Co tady dêláš?";
};

func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_HALLO))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_WASMACHSTDU_15_00"); //Co tu vlastnê dêláš?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_WASMACHSTDU_08_01"); //Sedím tu jako pecka. Nebejt têch zatracenejch banditù, nebyl bych tady.
	
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Banditen		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Cavalorn_Banditen_Condition;
	information	 = 	DIA_Addon_Cavalorn_Banditen_Info;

	description	 = 	"Co to bylo s têmi bandity?";
};

func int DIA_Addon_Cavalorn_Banditen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_WASMACHSTDU))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_Banditen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Banditen_15_00"); //Co bylo s bandity?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_01"); //Copak jsi posledních pár týdnù prospal nebo co?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Banditen_15_02"); //No...
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_03"); //Mluvím o tý lùze z trestanecký kolonie, co se tady usadila. Rabujou a zabíjejí, co jim síly staèí.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_04"); //(povzdychne si) Nejspíš mám kliku, že mê nezabili. Jen jsem se chvíli nesoustâedil a už jsem chytil jednu zezadu.
	
	if (C_BragoBanditsDead () == FALSE) 
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_05"); //Netuším, jak teë dostanu zpátky svý vêci.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_ARTEFAKT		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information	 = 	DIA_Addon_Cavalorn_ARTEFAKT_Info;

	description	 = 	"Tebe okradli banditi?";
};

func int DIA_Addon_Cavalorn_ARTEFAKT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Banditen))
	&& (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_ARTEFAKT_15_00"); //Ti banditi tê okradli?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_01"); //(vztekle) Jo. Zmlátili mê a pak mê hodili goblinùm, aã si mê sežerou.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_02"); //A byly to sakra dùležitý vêci. Dopis a všecky mý prachy. Absolutnê netuším, jak je dostat zpátky.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_03"); //Když mi ale nikdo nebude krejt záda, nemùžu se tam vrátit. Ta zbabêlá chátra!
};

///////////////////////////////////////////////////////////////////////
//	Info HELFEN
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_HELFEN		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_HELFEN_Condition;
	information	 = 	DIA_Addon_Cavalorn_HELFEN_Info;

	description	 = 	"Mùžu ti s têmi bandity nêjak pomoct?";
};

func int DIA_Addon_Cavalorn_HELFEN_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_ARTEFAKT))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	&& (C_BragoBanditsDead () == FALSE)//Joly:VORSICHT!!!!!muss als letztes Stehen
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_HELFEN_15_00"); //Mùžu ti s têmi bandity nêjak pomoct?

	if (Npc_HasEquippedArmor(other) == FALSE)
	&& (hero.guild == GIL_NONE) 
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_01"); //(potutelnê) Možná. Ale seš pêkný tintítko, urèitê už jsi celý týdny nemêl v ruce poâádnej meè.
	};
	
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_02"); //No, ale nemám na výbêr, a tak musím souhlasit. Èas kvapí.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_03"); //Tak dávej pozor. Dole na cestê najdeš jednu z têch špinavejch dêr, kde se tak rádi ukrejvaj banditi.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_04"); //Jsou to ti samí, co mi èmajzli mý vêci.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_05"); //Dej mi vêdêt, až budeš chtít vyrazit. Ukážem têm šupákùm, zaè je toho loket.
	
	MIS_Addon_Cavalorn_KillBrago = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillBrago, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KillBrago,"Banditi ukradli Cavalornovi nêco cenného. Chce, abychom se s nimi vypoâádali spoleènê."); 

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info AUSRUESTUNG
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_AUSRUESTUNG		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information	 = 	DIA_Addon_Cavalorn_AUSRUESTUNG_Info;

	description	 = 	"Potâebuji lepší vybavení.";
};

func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition ()
{
	if 	(MIS_Addon_Cavalorn_KillBrago != 0)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_00"); //Potâebuju lepší výbavu.
		
		if (C_BragoBanditsDead () == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_01"); //Ty svinê mi toho moc nenechaly.
		};
		
	AI_Output	(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_02"); //Mùžu ti dát vlèí nùž, bude to zatím staèit.
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_03"); //Tomuhle âíkáš nùž?

	CreateInvItems (self, ItMW_Addon_Knife01, 1);									
	B_GiveInvItems (self, other, ItMW_Addon_Knife01, 1);					
	 
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_04"); //A co nêco na léèení?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_05"); //Ještê mi zbyly dva léèivý lektvary, máš zájem?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_06"); //Jasnê, dej je sem.
	
	CreateInvItems (self, ItPo_Health_01, 2);									
	B_GiveInvItems (self, other, ItPo_Health_01, 2);					

};

///////////////////////////////////////////////////////////////////////
//	Info LETSKILLBANDITS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_LETSKILLBANDITS		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information	 = 	DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;

	description	 = 	"Jdeme na tu chátru.";
};

func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition ()
{
	if (MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	&& (C_BragoBanditsDead () == FALSE)	//Joly:VORSICHT!!!!!muss als letztes Stehen
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00"); //Tak pojëme na tu chátru.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01"); //Jasná páka. Krej mi záda, jo?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02"); //Èeká je móc nepâíjemný pâekvapení.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"KillBandits");

	if (Bdt_1013_Away == FALSE)
	{
		Ambusher_1013.aivar[AIV_EnemyOverride] = FALSE;
	};
	Ambusher_1014.aivar[AIV_EnemyOverride] = FALSE;
	Ambusher_1015.aivar[AIV_EnemyOverride] = FALSE;
};

func void B_Addon_Cavalorn_VatrasBrief ()
{
	
	if (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_00"); //Pak koneènê splním svùj úkol. Už takhle jsem ztratil spoustu èasu.
		AI_Output	(other, self, "DIA_Addon_Cavalorn_VatrasBrief_15_01"); //Jaký úkol?
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_02"); //(pro sebe) No, napâed se musím dostat do mêsta a potom...
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_03"); //(povzdychne si) Nevím, jak to všecko stihnu vèas.
		AI_Output	(other, self, "DIA_Addon_Cavalorn_VatrasBrief_15_04"); //(ironicky) A co já?
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_05"); //(odhaduje) Hmm, proè ne. Mùžeš do mêsta doruèit dopis.
	};
	
	AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_06"); //A já tím získám èas, abych si sehnal výbavu.

	if (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_07"); //Jeden z têch banditù musí mít ten dopis u sebe.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_08"); //Zanes ho do mêsta vodnímu mágu Vatrasovi. Najdeš ho v Adanovê chrámu, celý dny tam káže.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_09"); //Vyâië mu, že jsem to nezvládnul.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_10"); //A když se tê zeptá, kde jsem, vyâië mu, že jsem na cestê na místo srazu, jo?
		B_LogEntry (TOPIC_Addon_KDW,"Vodního mága Vatrase najdu v pâístavu Khorinis. Káže v tamêjším Adanovê chrámu."); 
	};
	
	if (Npc_HasEquippedArmor(other) == FALSE)
	&& (hero.guild == GIL_NONE) 
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_11"); //Jo, a ještê jedna vêc. Napâed si u nêkoho ze sedlákù kup àáký slušný ošacení.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_12"); //Jinak tê budou považovat za banditu. Tady máš pár zlaãákù.
		CreateInvItems (self, ItMi_Gold, 50);									
		B_GiveInvItems (self, other, ItMi_Gold, 50);	
	};
	
	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;

	if (MIS_Addon_Cavalorn_Letter2Vatras == 0)
	{
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_RUNNING;
	};

	Npc_ExchangeRoutine	(self,"Zaèít");
	B_GivePlayerXP (XP_Addon_Cavalorn_KillBrago);
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);

	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

///////////////////////////////////////////////////////////////////////
//	Info BragoKilled
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_BragoKilled		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_BragoKilled_Condition;
	information	 = 	DIA_Addon_Cavalorn_BragoKilled_Info;

	important	 = 	TRUE;
};

func int DIA_Addon_Cavalorn_BragoKilled_Condition ()
{
	if 	(Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT")<500) 
	&& 	(MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING)
	&&	(C_BragoBanditsDead () == TRUE)//Joly:VORSICHT!!!!!muss als letztes Stehen
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Cavalorn_BragoKilled_08_00"); //Tak to bysme mêli. Ha! Nemêli si se mnou nic zaèínat.
	
	B_Addon_Cavalorn_VatrasBrief ();
	
};

///////////////////////////////////////////////////////////////////////
//	Info PCKilledBrago
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_PCKilledBrago		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information	 = 	DIA_Addon_Cavalorn_PCKilledBrago_Info;

	description	 = 	"Banditi už to mají spoèítané.";
};

func int DIA_Addon_Cavalorn_PCKilledBrago_Condition ()
{
	if 	(MIS_Addon_Cavalorn_KillBrago == 0)
	&&  (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Banditen))
	&&	(C_BragoBanditsDead () == TRUE) 	//Joly:VORSICHT!!!!!muss als letztes Stehen
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_PCKilledBrago_15_00"); //Banditi už jsou vyâízení.

	B_Addon_Cavalorn_VatrasBrief ();

};

///////////////////////////////////////////////////////////////////////
//	Info JUNGS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_JUNGS		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cavalorn_JUNGS_Condition;
	information	 = 	DIA_Addon_Cavalorn_JUNGS_Info;

	description	 = 	"Ta zbroj, co máš na sobê, je vážnê zajímavá.";
};

func int DIA_Addon_Cavalorn_JUNGS_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_HALLO))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_JUNGS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_JUNGS_15_00"); //Máš na sobê zajímavou zbroj, ty už nepatâíš ke Stínùm?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_JUNGS_08_01"); //Ke Stínùm? Ti už neexistují, co padla bariéra.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_JUNGS_08_02"); //Jakmile jsme koneènê vypadli z Hornickýho údolí, nebyl dùvod, abych se k nim dál hlásil.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_JUNGS_08_03"); //Teë pracuju pro vodní mágy. Patâím ke kruhu vody.
	
	SC_KnowsRanger = TRUE;

	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Cavalorn mi prozradil, že patâí ke komunitê, která si âíká 'kruh vody'."); 

	Cavalorn_RangerHint = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Ring
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Ring		(C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 5;
	condition	= DIA_Addon_Cavalorn_Ring_Condition;
	information	= DIA_Addon_Cavalorn_Ring_Info;
	permanent 	= FALSE;
	description	= "Povêz mi o tom kruhu vody nêco víc!";
};
func int DIA_Addon_Cavalorn_Ring_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};
func void DIA_Addon_Cavalorn_Ring_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_Ring_15_00"); //Povêz mi o tom kruhu vody nêco víc!
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_01"); //Fakt o tom nesmím mluvit.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_02"); //Jedinê tê mùžu poslat za Vatrasem, kterej v Khorinidu mágy vody zastupuje.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_03"); //Udêláš dobâe, když si s ním promluvíš. Povêz mu, že tê posílám já.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_04"); //Možná tê pâijme mezi nás. Nutnê potâebujeme další dobrý lidi.
	B_LogEntry (TOPIC_Addon_RingOfWater,"Další informace o kruhu vody mi sdêlí vodní mág Vatras."); 
};
///////////////////////////////////////////////////////////////////////
//	Gegner
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Feinde (C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 6;
	condition	= DIA_Addon_Cavalorn_Feinde_Condition;
	information	= DIA_Addon_Cavalorn_Feinde_Info;
	permanent 	= FALSE;
	description	= "Copak jsi tenkrát se svými lidmi nepatâil k nepâátelùm vodních mágù?";
};
func int DIA_Addon_Cavalorn_Feinde_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};
func void DIA_Addon_Cavalorn_Feinde_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_Feinde_15_00"); //Copak ty a tví lidi nebývali nepâáteli vodních mágù?
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_01"); //Ty bláznivý starý èasy už jsou pryè. Už není žádný Nový ani Starý tábor.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_02"); //Trestanecká kolonie už neexistuje a každej se musí postarat sám o sebe.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_03"); //Vêtšinu z nás bejvalejch trestancù stejnê ještê poâád pronásledujou.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_04"); //Vodní mágové mi ale zmírnili trest, a tak se tu mùžu volnê pohybovat.
};
///////////////////////////////////////////////////////////////////////
//	Wo KdW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_KdWTask (C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 6;
	condition	= DIA_Addon_Cavalorn_KdWTask_Condition;
	information	= DIA_Addon_Cavalorn_KdWTask_Info;
	permanent 	= FALSE;
	description	= "Co mágové vody dêlají teë?";
};
func int DIA_Addon_Cavalorn_KdWTask_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_JUNGS))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Cavalorn_KdWTask_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_KdWTask_15_00"); //Co vodní mágové dêlají teë?
	AI_Output (self, other, "DIA_Addon_Cavalorn_KdWTask_08_01"); //Jdou po nêèem velkým. Má to co dêlat s nêjakou neprozkoumanou èástí tohohle ostrova.
	AI_Output (other, self, "DIA_Addon_Cavalorn_KdWTask_15_02"); //Neprozkoumanou èástí? A kde to má být?
	AI_Output (self, other, "DIA_Addon_Cavalorn_KdWTask_08_03"); //Víc ti âíct nemùžu. Bêž do Khorinidu a promluv si s Vatrasem.
};	

///////////////////////////////////////////////////////////////////////
//	Info BroughtLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_BroughtLetter		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information	 = 	DIA_Addon_Cavalorn_BroughtLetter_Info;

	description	 = 	"Pâedal jsem tvùj dopis Vatrasovi.";
};

func int DIA_Addon_Cavalorn_BroughtLetter_Condition ()
{
	if (MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_JUNGS))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_BroughtLetter_15_00"); //Doruèil jsem Vatrasovi tvùj dopis.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_BroughtLetter_08_01"); //Nic jinýho jsem ani neèekal. Díky.
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Ornament		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cavalorn_Ornament_Condition;
	information	 = 	DIA_Addon_Cavalorn_Ornament_Info;

	description	 = 	"Hledáš nêco?";
};

func int DIA_Addon_Cavalorn_Ornament_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_HALLO))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_00"); //Hledáš nêco?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_01"); //To je to tak vidêt? Jo, mágové vody mi nakázali hledat nêjaký ztracený ornament.
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_02"); //To se mi hodí, Nefarius mi zadal úplnê stejný úkol.

	if (SC_KnowsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_03"); //Takže ty patâíš ke kruhu vody?
		if (SC_IsRanger == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_04"); //Ano.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_05"); //Ještê ne, ale pracuju na tom.
		};
	};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_06"); //To jsem rád, že v tom nejsem sám.
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_07"); //Už jsi našel nêjaký ornament?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_08"); //Zjistil jsem, kde by se jeden mêl nacházet.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_09"); //Tenhle kamennej kruh by mohl bejt jednou z têch staveb, kterou mi Nefarius popsal.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_10"); //Teë jen musíme najít nêjaký mechanismus, po kterým se máme dívat.
};
///////////////////////////////////////////////////////////////////////
//	Info Triggered
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Triggered		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_Triggered_Condition;
	information	 = 	DIA_Addon_Cavalorn_Triggered_Info;

	description	 = 	"Zkoušel jsem ten mechanismus.";
};

func int DIA_Addon_Cavalorn_Triggered_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ornament))
	&& (ORNAMENT_SWITCHED_FARM == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_Triggered_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Triggered_15_00"); //Vyzkoušel jsem ten mechanismus, a nic to nedêlá.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_01"); //Pak mêli Lobartovi lidi pravdu.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_02"); //Âíkali, že jeden z nich si už tady s têma kamenama hrál.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_03"); //Prej se ze zemê vynoâila nêjaká kamenná obluda a napadla je.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_04"); //Zavolali domobranu, domobrana zavolala paladiny a ti tu potvoru znièili.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_05"); //Už jsem to tu celý prohledal. Jestli tu nêjaký ornament byl, pak ho teë mají paladinové.
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice	(DIA_Addon_Cavalorn_Triggered, "Pak se jeden z nás musí dostat do horní èásti mêsta.", DIA_Addon_Cavalorn_Triggered_Pal );
	Info_AddChoice	(DIA_Addon_Cavalorn_Triggered, "Pak k nim zajdu a požádám je, aby mi ten ornament vrátili.", DIA_Addon_Cavalorn_Triggered_OBack );
};
func void B_Cavalorn_Triggered_Wohin ()
{
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Triggered_Wohin_08_00"); //Pùjdu teë do mêsta. Sejdeme se u Vatrase.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Mêsto");
	
	Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Ornament,"Jeden z chybêjících úlomkù ornamentu mají paladinové z horní èásti mêsta."); 

	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_RUNNING;
	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack ()
{
	AI_UnequipArmor	(self);
	CreateInvItems (self, ITAR_BAU_L, 1);	
	Npc_RemoveInvItems	(self, ITAR_RANGER_Addon,	Npc_HasItems (self, ITAR_RANGER_Addon ) );
	Npc_RemoveInvItems	(self, ITAR_Fake_RANGER,	Npc_HasItems (self, ITAR_Fake_RANGER ) );
	AI_EquipBestArmor (self); 
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Triggered_OBack_15_00"); //Tak já za nima zajdu a o ten ornament je požádám.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Triggered_OBack_08_01"); //Dobâe.
	B_Cavalorn_Triggered_Wohin ();
};

func void DIA_Addon_Cavalorn_Triggered_Pal ()
{
	AI_UnequipArmor	(self);
	CreateInvItems (self, ITAR_BAU_L, 1);	
	Npc_RemoveInvItems	(self, ITAR_RANGER_Addon,	Npc_HasItems (self, ITAR_RANGER_Addon ) );
	Npc_RemoveInvItems	(self, ITAR_Fake_RANGER,	Npc_HasItems (self, ITAR_Fake_RANGER ) );
	AI_EquipBestArmor (self); 
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Triggered_Pal_15_00"); //Pak se jeden z nás musí dostat do horní èásti mêsta.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Triggered_Pal_08_01"); //Na to nemám èas. To musíš udêlat ty.
	B_Cavalorn_Triggered_Wohin ();
};

///////////////////////////////////////////////////////////////////////
//	Info GotOrnaFromHagen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_GotOrnaFromHagen		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information	 = 	DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;

	description	 = 	"Získal jsem chybêjící ornament od lorda Hagena.";
};

func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition ()
{
	if (Lord_Hagen_GotOrnament == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00"); //Lord Hagen mi dal ten chybêjící ornament.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01"); //Vidíš? Já âíkal, že ho budou mít paladinové.
	B_GivePlayerXP (XP_Ambient);
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
};

// ************************************************************
// 			  				WannaLearn
// ************************************************************
instance DIA_Addon_Cavalorn_WannaLearn (C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 7;
	condition	= DIA_Addon_Cavalorn_WannaLearn_Condition;
	information	= DIA_Addon_Cavalorn_WannaLearn_Info;
	permanent 	= FALSE;
	description	= "Mùžeš mê nêèemu nauèit?";
};

func int DIA_Addon_Cavalorn_WannaLearn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Hallo))
	&& (C_BragoBanditsDead () == TRUE)//Joly:VORSICHT!!!!!muss als letztes Stehen
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_WannaLearn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_WannaLearn_15_00"); //Mùžeš mê nêco nauèit?
	AI_Output (self, other, "DIA_Addon_Cavalorn_WannaLearn_08_01"); //Jasnê. Ale to ti povím, že tê pêknê zâídili, èlovêèe.
	AI_Output (self, other, "DIA_Addon_Cavalorn_WannaLearn_08_02"); //Ty si vùbec nic nepamatuješ, co?
	
	Cavalorn_Addon_TeachPlayer = TRUE;
	Log_CreateTopic (Topic_OutTeacher,LOG_NOTE);
	B_LogEntry (Topic_OutTeacher, LogText_Addon_Cavalorn_Teach);
};

// ************************************************************
// 			  				TEACH
// ************************************************************
var int Addon_Cavalorn_Merke_Bow;
var int Addon_Cavalorn_Merke_1h;
// ------------------------------------------------------

instance DIA_Addon_Cavalorn_TEACH (C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 8;
	condition	= DIA_Addon_Cavalorn_TEACH_Condition;
	information	= DIA_Addon_Cavalorn_TEACH_Info;
	permanent 	= TRUE;
	description	= "Chci se nauèit nêèemu z tvých dovedností.";
};

func int DIA_Addon_Cavalorn_TEACH_Condition ()
{
	if (Cavalorn_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func VOID DIA_Addon_Cavalorn_TEACH_Choices ()
{
	Info_ClearChoices (DIA_Addon_Cavalorn_Teach);
	Info_AddChoice (DIA_Addon_Cavalorn_Teach, DIALOG_BACK, DIA_Addon_Cavalorn_Teach_Back);

	if (Npc_GetTalentSkill (other,NPC_TALENT_SNEAK) == FALSE) 
			{
				Info_AddChoice		(DIA_Addon_Cavalorn_Teach, B_BuildLearnString("Plížení"	, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1))		,DIA_Addon_Cavalorn_Teach_Sneak);
			};

	Info_AddChoice (DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	 ,DIA_Addon_Cavalorn_Teach_Bow_1);
	Info_AddChoice (DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5) ,DIA_Addon_Cavalorn_Teach_Bow_5);
	Info_AddChoice (DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))	 ,DIA_Addon_Cavalorn_Teach_1H_1);
	Info_AddChoice (DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)	 ,DIA_Addon_Cavalorn_Teach_1H_5);
	
};
func void DIA_Addon_Cavalorn_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_TEACH_15_00"); //Chci si osvojit tvé schopnosti.
	AI_Output (self, other, "DIA_Addon_Cavalorn_TEACH_08_01"); //Jasnê. Co bys rád vêdêl?
	
	Addon_Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Addon_Cavalorn_Merke_1h =  other.HitChance[NPC_TALENT_1H];
	
	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_Sneak ()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
		{
			AI_Output			(self, other, "DIA_Addon_Cavalorn_Teach_Sneak_08_00"); //Jestli se chceš k nepâátelùm dostat nepozorovanê, musíš mêkce našlapovat.
		};

	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_BOW_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 90);
	
	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_BOW_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 90);
	
	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 30);
	
	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 30);

	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_Back ()
{
	if (Addon_Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	|| (Addon_Cavalorn_Merke_1h  < other.HitChance[NPC_TALENT_1H])
	{
		AI_Output (self ,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00"); //Takhle je to lepší. Zapomnêl jsi toho spoustu, ale neboj, dáme to zas do kupy.
	};

	Info_ClearChoices (DIA_Addon_Cavalorn_Teach);
};

















