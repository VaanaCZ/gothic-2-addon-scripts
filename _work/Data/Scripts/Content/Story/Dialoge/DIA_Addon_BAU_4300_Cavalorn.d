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
	description = "(Ukrást tento toulec se šípy je tak snadné jako vzít dítęti bonbón.)";
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
		AI_Output	(self, other, "DIA_Addon_Gaan_MeetingIsRunning_08_01"); //Vatras ti svęâí nový úkol.
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
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_08_01"); //(naštvanę) Sakra. Netuším, kde se schovávaj. Zabiješ jednoho a za chvíli tu máš zase všechny.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_08_02"); //(potutelnę) Ale moment, dyk já tę znám! Ty seš ten chlápek, co na mę v Hornickým údolí furt žebral šípy!
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Ty se jmenuješ Cavalorn, že?", DIA_Addon_Cavalorn_HALLO_Ja );
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Manę si vzpomínám...?", DIA_Addon_Cavalorn_HALLO_weissNicht );

};
func void DIA_Addon_Cavalorn_HALLO_weissNicht ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_weissNicht_15_00"); //No, matnę se na nęco pamatuju.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_weissNicht_08_01"); //Ale no tak. Ve svý chajdę v Hornickým údolí jsem tę pâece učil stâílet z luku a plížit se. Už si vzpomínáš?

};

func void DIA_Addon_Cavalorn_HALLO_Ja ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_Ja_15_00"); //Ty jsi Cavalorn, že jo?
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Ja_08_01"); //Á, vidím, že jsi na mę nezapomnęl, i když už jsme z tý hnusný kolonie pryč.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Ja_08_02"); //Kam máš namíâeno?
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Nemám žádný určitý úkol.", DIA_Addon_Cavalorn_HALLO_keinZiel );
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Zpátky do Hornického údolí.", DIA_Addon_Cavalorn_HALLO_Bauern );

	if (Mil_310_Stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Do męsta.", DIA_Addon_Cavalorn_HALLO_Stadt );
	};
};
func void DIA_Addon_Cavalorn_HALLO_Stadt ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_HALLO_Stadt_15_00"); //Do męsta.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_01"); //(smęje se) Jo tak do męsta!
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_02"); //Můžeš se dostat do problémů se strážema - jen tak nękoho do męsta nepustí. Potlouká se tu totiž plno banditů.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_03"); //Poslední dobou sem začal chodit jeden z tęch bejvalejch psioniků z Hornickýho údolí. Prý chodí poâád do Khorinidu a ven.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_04"); //Vešel do údolí pod tou velkou vęží. Vchod musí bejt nękde tam u toho vodopádu.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_05"); //Snad by sis męl s tím chlápkem promluvit.
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_Bauern_15_00"); //Zpátky do Hornického údolí.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Bauern_08_01"); //(pâekvapenę) Vážnę? Hmm, moc rád bych tam šel s tebou, ale napâed musím dodęlat, co mám.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Bauern_08_02"); //Až budeš v Hornickém údolí, nemohl by ses mrknout, jestli náhodou ještę nestojí moje stará chajda? Rád bych se tam ještę nękdy vrátil.
	
	MIS_Addon_Cavalorn_TheHut = LOG_RUNNING;	
	Log_CreateTopic (TOPIC_Addon_CavalornTheHut, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_CavalornTheHut,"Cavalorn chce, abych zjistil, zda jeho stará chýše v Hornickém údolí ještę stojí. Pokud si vzpomínám, bývala v kopcích západnę od původního Starého tábora. Počítám, že tam nęco nechal.");
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_keinZiel_15_00"); //Nemám na mysli nic určitého.
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_00"); //Byl jsem v té tvé chatrči v Hornickém údolí.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_01"); //Takže poâád ještę stojí.
	if (MIS_Addon_Cavalorn_TheHut == LOG_RUNNING)
	{
		AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_02"); //Jo, a taky už vím, co jsi tam chtęl.
	};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_03"); //Takže jsi nęco našel?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_04"); //Jestli myslíš ten váček s rudou, tak jo, ten mám.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_05"); //Ty seš ale lišák!
	if (MIS_Addon_Cavalorn_TheHut == LOG_RUNNING)
	{
		AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_06"); //Co jiného bys mohl z té chatrče chtít? Jinak tam nebylo nic.
	};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_07"); //A máš ho s sebou? Dám ti za nęj 100 zlaăáků.
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);

	if (Npc_HasItems (other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Jasnę.", DIA_Addon_Cavalorn_Beutel_ja );
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
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Proč jsi to tam vůbec nechával?", DIA_Addon_Cavalorn_Beutel_why );
};
func void DIA_Addon_Cavalorn_Beutel_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_ja_15_00"); //Jasnę.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_ja_08_01"); //Paráda.
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back );
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Proč jsi to napâed nechal tady?", DIA_Addon_Cavalorn_Beutel_why );
};

func void DIA_Addon_Cavalorn_Beutel_no ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_no_15_00"); //Ne.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_no_08_01"); //Tak mi ho VRAĂ. Beztak už jsem se męl vrátit do toho proklatýho Hornickýho údolí.
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_no_15_02"); //Málem jsi mę rozbrečel.
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back );
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Proč jsi to napâed nechal tady?", DIA_Addon_Cavalorn_Beutel_why );
};

func void DIA_Addon_Cavalorn_Beutel_why ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_why_15_00"); //Proč jsi to tam vůbec nechával?
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_01"); //Netušil jsem, že ruda bude mít tady v Khorinidu takovou cenu.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_02"); //Dyk v kolonii sis za mizernej kousek rudy nekoupil ani pitomej nocleh.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_03"); //A tady v pâístavním męstę by ti tu pro ten samej kousek rozmlátili lebku.
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_ErzGeben_15_00"); //Dej mi 100 zlaăáků a vrátím ti tvou rudu.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ErzGeben_08_01"); //Dobâe, tady máš.
	CreateInvItems (self, ItMi_Gold, 100);									
	B_GiveInvItems (self, other, ItMi_Gold, 100);		

	if (B_GiveInvItems (other, self, ItSe_ADDON_CavalornsBeutel,1) == FALSE)
		{
			B_GiveInvItems (other, self, ItMi_Nugget,1);
		};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ErzGeben_08_02"); //Seš vážnę kámoš, díky moc.
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

	description	 = 	"Co tady dęláš?";
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_WASMACHSTDU_15_00"); //Co tu vlastnę dęláš?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_WASMACHSTDU_08_01"); //Sedím tu jako pecka. Nebejt tęch zatracenejch banditů, nebyl bych tady.
	
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

	description	 = 	"Co to bylo s tęmi bandity?";
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
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_01"); //Copak jsi posledních pár týdnů prospal nebo co?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Banditen_15_02"); //No...
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_03"); //Mluvím o tý lůze z trestanecký kolonie, co se tady usadila. Rabujou a zabíjejí, co jim síly stačí.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_04"); //(povzdychne si) Nejspíš mám kliku, že mę nezabili. Jen jsem se chvíli nesoustâedil a už jsem chytil jednu zezadu.
	
	if (C_BragoBanditsDead () == FALSE) 
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_05"); //Netuším, jak teë dostanu zpátky svý vęci.
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_ARTEFAKT_15_00"); //Ti banditi tę okradli?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_01"); //(vztekle) Jo. Zmlátili mę a pak mę hodili goblinům, aă si mę sežerou.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_02"); //A byly to sakra důležitý vęci. Dopis a všecky mý prachy. Absolutnę netuším, jak je dostat zpátky.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_03"); //Když mi ale nikdo nebude krejt záda, nemůžu se tam vrátit. Ta zbabęlá chátra!
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

	description	 = 	"Můžu ti s tęmi bandity nęjak pomoct?";
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_HELFEN_15_00"); //Můžu ti s tęmi bandity nęjak pomoct?

	if (Npc_HasEquippedArmor(other) == FALSE)
	&& (hero.guild == GIL_NONE) 
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_01"); //(potutelnę) Možná. Ale seš pękný tintítko, určitę už jsi celý týdny nemęl v ruce poâádnej meč.
	};
	
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_02"); //No, ale nemám na výbęr, a tak musím souhlasit. Čas kvapí.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_03"); //Tak dávej pozor. Dole na cestę najdeš jednu z tęch špinavejch dęr, kde se tak rádi ukrejvaj banditi.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_04"); //Jsou to ti samí, co mi čmajzli mý vęci.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_05"); //Dej mi vędęt, až budeš chtít vyrazit. Ukážem tęm šupákům, zač je toho loket.
	
	MIS_Addon_Cavalorn_KillBrago = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillBrago, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KillBrago,"Banditi ukradli Cavalornovi nęco cenného. Chce, abychom se s nimi vypoâádali společnę."); 

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
			AI_Output	(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_01"); //Ty svinę mi toho moc nenechaly.
		};
		
	AI_Output	(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_02"); //Můžu ti dát vlčí nůž, bude to zatím stačit.
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_03"); //Tomuhle âíkáš nůž?

	CreateInvItems (self, ItMW_Addon_Knife01, 1);									
	B_GiveInvItems (self, other, ItMW_Addon_Knife01, 1);					
	 
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_04"); //A co nęco na léčení?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_05"); //Ještę mi zbyly dva léčivý lektvary, máš zájem?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_06"); //Jasnę, dej je sem.
	
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
	AI_Output	(self, other, "DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02"); //Čeká je móc nepâíjemný pâekvapení.
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
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_00"); //Pak konečnę splním svůj úkol. Už takhle jsem ztratil spoustu času.
		AI_Output	(other, self, "DIA_Addon_Cavalorn_VatrasBrief_15_01"); //Jaký úkol?
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_02"); //(pro sebe) No, napâed se musím dostat do męsta a potom...
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_03"); //(povzdychne si) Nevím, jak to všecko stihnu včas.
		AI_Output	(other, self, "DIA_Addon_Cavalorn_VatrasBrief_15_04"); //(ironicky) A co já?
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_05"); //(odhaduje) Hmm, proč ne. Můžeš do męsta doručit dopis.
	};
	
	AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_06"); //A já tím získám čas, abych si sehnal výbavu.

	if (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_07"); //Jeden z tęch banditů musí mít ten dopis u sebe.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_08"); //Zanes ho do męsta vodnímu mágu Vatrasovi. Najdeš ho v Adanovę chrámu, celý dny tam káže.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_09"); //Vyâië mu, že jsem to nezvládnul.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_10"); //A když se tę zeptá, kde jsem, vyâië mu, že jsem na cestę na místo srazu, jo?
		B_LogEntry (TOPIC_Addon_KDW,"Vodního mága Vatrase najdu v pâístavu Khorinis. Káže v tamęjším Adanovę chrámu."); 
	};
	
	if (Npc_HasEquippedArmor(other) == FALSE)
	&& (hero.guild == GIL_NONE) 
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_11"); //Jo, a ještę jedna vęc. Napâed si u nękoho ze sedláků kup ŕáký slušný ošacení.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_12"); //Jinak tę budou považovat za banditu. Tady máš pár zlaăáků.
		CreateInvItems (self, ItMi_Gold, 50);									
		B_GiveInvItems (self, other, ItMi_Gold, 50);	
	};
	
	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;

	if (MIS_Addon_Cavalorn_Letter2Vatras == 0)
	{
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_RUNNING;
	};

	Npc_ExchangeRoutine	(self,"Začít");
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
	AI_Output	(self, other, "DIA_Addon_Cavalorn_BragoKilled_08_00"); //Tak to bysme męli. Ha! Nemęli si se mnou nic začínat.
	
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

	description	 = 	"Banditi už to mají spočítané.";
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

	description	 = 	"Ta zbroj, co máš na sobę, je vážnę zajímavá.";
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_JUNGS_15_00"); //Máš na sobę zajímavou zbroj, ty už nepatâíš ke Stínům?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_JUNGS_08_01"); //Ke Stínům? Ti už neexistují, co padla bariéra.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_JUNGS_08_02"); //Jakmile jsme konečnę vypadli z Hornickýho údolí, nebyl důvod, abych se k nim dál hlásil.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_JUNGS_08_03"); //Teë pracuju pro vodní mágy. Patâím ke kruhu vody.
	
	SC_KnowsRanger = TRUE;

	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Cavalorn mi prozradil, že patâí ke komunitę, která si âíká 'kruh vody'."); 

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
	description	= "Povęz mi o tom kruhu vody nęco víc!";
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
	AI_Output (other, self, "DIA_Addon_Cavalorn_Ring_15_00"); //Povęz mi o tom kruhu vody nęco víc!
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_01"); //Fakt o tom nesmím mluvit.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_02"); //Jedinę tę můžu poslat za Vatrasem, kterej v Khorinidu mágy vody zastupuje.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_03"); //Udęláš dobâe, když si s ním promluvíš. Povęz mu, že tę posílám já.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_04"); //Možná tę pâijme mezi nás. Nutnę potâebujeme další dobrý lidi.
	B_LogEntry (TOPIC_Addon_RingOfWater,"Další informace o kruhu vody mi sdęlí vodní mág Vatras."); 
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
	description	= "Copak jsi tenkrát se svými lidmi nepatâil k nepâátelům vodních mágů?";
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
	AI_Output (other, self, "DIA_Addon_Cavalorn_Feinde_15_00"); //Copak ty a tví lidi nebývali nepâáteli vodních mágů?
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_01"); //Ty bláznivý starý časy už jsou pryč. Už není žádný Nový ani Starý tábor.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_02"); //Trestanecká kolonie už neexistuje a každej se musí postarat sám o sebe.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_03"); //Vętšinu z nás bejvalejch trestanců stejnę ještę poâád pronásledujou.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_04"); //Vodní mágové mi ale zmírnili trest, a tak se tu můžu volnę pohybovat.
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
	description	= "Co mágové vody dęlají teë?";
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
	AI_Output (other, self, "DIA_Addon_Cavalorn_KdWTask_15_00"); //Co vodní mágové dęlají teë?
	AI_Output (self, other, "DIA_Addon_Cavalorn_KdWTask_08_01"); //Jdou po nęčem velkým. Má to co dęlat s nęjakou neprozkoumanou částí tohohle ostrova.
	AI_Output (other, self, "DIA_Addon_Cavalorn_KdWTask_15_02"); //Neprozkoumanou částí? A kde to má být?
	AI_Output (self, other, "DIA_Addon_Cavalorn_KdWTask_08_03"); //Víc ti âíct nemůžu. Bęž do Khorinidu a promluv si s Vatrasem.
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

	description	 = 	"Pâedal jsem tvůj dopis Vatrasovi.";
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_BroughtLetter_15_00"); //Doručil jsem Vatrasovi tvůj dopis.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_BroughtLetter_08_01"); //Nic jinýho jsem ani nečekal. Díky.
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

	description	 = 	"Hledáš nęco?";
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_00"); //Hledáš nęco?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_01"); //To je to tak vidęt? Jo, mágové vody mi nakázali hledat nęjaký ztracený ornament.
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_02"); //To se mi hodí, Nefarius mi zadal úplnę stejný úkol.

	if (SC_KnowsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_03"); //Takže ty patâíš ke kruhu vody?
		if (SC_IsRanger == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_04"); //Ano.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_05"); //Ještę ne, ale pracuju na tom.
		};
	};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_06"); //To jsem rád, že v tom nejsem sám.
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_07"); //Už jsi našel nęjaký ornament?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_08"); //Zjistil jsem, kde by se jeden męl nacházet.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_09"); //Tenhle kamennej kruh by mohl bejt jednou z tęch staveb, kterou mi Nefarius popsal.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_10"); //Teë jen musíme najít nęjaký mechanismus, po kterým se máme dívat.
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Triggered_15_00"); //Vyzkoušel jsem ten mechanismus, a nic to nedęlá.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_01"); //Pak męli Lobartovi lidi pravdu.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_02"); //Âíkali, že jeden z nich si už tady s tęma kamenama hrál.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_03"); //Prej se ze zemę vynoâila nęjaká kamenná obluda a napadla je.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_04"); //Zavolali domobranu, domobrana zavolala paladiny a ti tu potvoru zničili.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_05"); //Už jsem to tu celý prohledal. Jestli tu nęjaký ornament byl, pak ho teë mají paladinové.
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice	(DIA_Addon_Cavalorn_Triggered, "Pak se jeden z nás musí dostat do horní části męsta.", DIA_Addon_Cavalorn_Triggered_Pal );
	Info_AddChoice	(DIA_Addon_Cavalorn_Triggered, "Pak k nim zajdu a požádám je, aby mi ten ornament vrátili.", DIA_Addon_Cavalorn_Triggered_OBack );
};
func void B_Cavalorn_Triggered_Wohin ()
{
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Triggered_Wohin_08_00"); //Půjdu teë do męsta. Sejdeme se u Vatrase.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Męsto");
	
	Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Ornament,"Jeden z chybęjících úlomků ornamentu mají paladinové z horní části męsta."); 

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
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Triggered_Pal_15_00"); //Pak se jeden z nás musí dostat do horní části męsta.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Triggered_Pal_08_01"); //Na to nemám čas. To musíš udęlat ty.
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

	description	 = 	"Získal jsem chybęjící ornament od lorda Hagena.";
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
	AI_Output	(other, self, "DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00"); //Lord Hagen mi dal ten chybęjící ornament.
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
	description	= "Můžeš mę nęčemu naučit?";
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
	AI_Output (other, self, "DIA_Addon_Cavalorn_WannaLearn_15_00"); //Můžeš mę nęco naučit?
	AI_Output (self, other, "DIA_Addon_Cavalorn_WannaLearn_08_01"); //Jasnę. Ale to ti povím, že tę pęknę zâídili, človęče.
	AI_Output (self, other, "DIA_Addon_Cavalorn_WannaLearn_08_02"); //Ty si vůbec nic nepamatuješ, co?
	
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
	description	= "Chci se naučit nęčemu z tvých dovedností.";
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
	AI_Output (self, other, "DIA_Addon_Cavalorn_TEACH_08_01"); //Jasnę. Co bys rád vędęl?
	
	Addon_Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Addon_Cavalorn_Merke_1h =  other.HitChance[NPC_TALENT_1H];
	
	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_Sneak ()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
		{
			AI_Output			(self, other, "DIA_Addon_Cavalorn_Teach_Sneak_08_00"); //Jestli se chceš k nepâátelům dostat nepozorovanę, musíš mękce našlapovat.
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
		AI_Output (self ,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00"); //Takhle je to lepší. Zapomnęl jsi toho spoustu, ale neboj, dáme to zas do kupy.
	};

	Info_ClearChoices (DIA_Addon_Cavalorn_Teach);
};

















