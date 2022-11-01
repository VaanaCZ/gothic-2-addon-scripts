
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14030_Addon_Myxir_ADW;
	nr          = 999;
	condition   = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Myxir_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14030_Addon_Myxir_ADW;
	nr			= 900;
	condition	= DIA_Addon_Myxir_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Myxir_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Myxir_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Myxir_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Myxir_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Myxir_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Myxir_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Myxir_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_ADWHello_Condition;
	information	 = 	DIA_Addon_Myxir_ADWHello_Info;

	description	 = 	"Masz jakieś wieści?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //Masz jakieś wieści?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //Fascynują mnie budowniczowie tych ruin!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Szkoda, że ich język jest martwy, tak jak oni.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //Ich potężne rytuały i przywołania nie były w stanie im pomóc.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //Przywołania?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Budowniczowie byli mocno związani ze światem duchów.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Jeśli dobrze rozumiem, uważali, że cały czas pozostają w kontakcie ze swoimi przodkami.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Dlatego, aby otrzymać od nich rady lub przepowiednie, regularnie odprawiali rytuały przywołania.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Jak działały te przywołania?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "O ile wiem, ożywieńcy nie gadają zbyt wiele.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //Jak działały te przywołania?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Strażnicy umarłych znali specjalne zaklęcia, którymi starali się przebłagać duchy.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Opisy, które tu znalazłem, są w większości bardzo mętne. Nieczęsto znajduję jasne odpowiedzi na swoje pytania.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //O ile wiem, ożywieńcy nie gadają zbyt wiele.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Budowniczowie nie stworzyli bezdusznych ożywieńców, takich jak zombie czy inne plugawe istoty.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //Duchy są duszami wielkich wojowników, kapłanów i władców.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Nie mam wątpliwości, że naprawdę istnieją.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_PermADW		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Myxir_PermADW_Condition;
	information	 = 	DIA_Addon_Myxir_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jeśli spotkam ducha, dam ci znać.";
};
func int DIA_Addon_Myxir_PermADW_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Jeśli spotkam ducha, dam ci znać.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //Tak, koniecznie.
};
///////////////////////////////////////////////////////////////////////
//	Info GeistTafel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistTafel		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistTafel_Condition;
	information	 = 	DIA_Addon_Myxir_GeistTafel_Info;

	description	 = 	"Przysłał mnie Saturas.";
};

func int DIA_Addon_Myxir_GeistTafel_Condition ()
{
	if (Saturas_RiesenPlan == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistTafel_Info ()
{
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Przysłał mnie Saturas.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Kruk dostał się do świątyni i zamknął za sobą portal.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //Saturas uważa, że swoją wiedzę o świątyni Kruk uzyskał od ducha!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //O Adanosie!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Kruk musiał przyzwać ducha najwyższego kapłana Khardimona, aby dowiedzieć się, jak wejść do świątyni.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //Według zapisów, grób kapłana znajduje się w jaskiniach pod fortecą!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //Będziesz musiał zrobić tak samo.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Ale nie możesz już spytać Khardimona...
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //W zachodniej części doliny znajduje się grób wodza Quarhodrona.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Będziesz musiał go odnaleźć... i przebudzić Quarhodrona.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //W tych inskrypcjach zapisano, jak wyznawca Adanosa może przywołać ducha.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //Myślisz, że to może się udać?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //Przeczytałem wiele sprzecznych informacji.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Na przykład inskrypcje Y'Beriona, przywódcy Bractwa Śniącego.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Ale wierzę w każde słowo autora TYCH zapisów!
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Mówisz poważnie?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Dlaczego Quarhodrona? Dlaczego nie kapłana Khardimona?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Bractwo Śniącego nie głosiło samych kłamstw. ", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //Dlaczego Quarhodrona? Dlaczego nie kapłana Khardimona?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Kruk z pewnością sprofanował jego grób w czasie przywołania.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Musimy poszukać innego ducha.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //Bractwo Śniącego nie głosiło samych kłamstw. Śniący naprawdę istniał.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //To nie tylko kłamstwa sprawiły, że byli niewiarygodni, lecz ich własne słowa.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //Były mętne! Wyznawcy Śniącego pozostawali pod złym wpływem palonego przez nich bagiennego ziela.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //Powaga i podniosłość słów spisanych na tej kamiennej tablicy przekonują mnie, że ich autor mówi prawdę.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //Mówisz poważnie?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Chcę, żeby sprawdzono każdy zakamarek.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Nawet jeśli istnieje jedynie cień szansy na spotkanie jednego z budowniczych, musimy go wykorzystać.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Kruk tak właśnie zrobił.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Zgoda. Co mam zrobić, jeśli chcę przyzwać ducha?", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Zgoda. Co mam zrobić, jeśli chcę przyzwać ducha?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Znajdź grobowiec Quarhodrona na zachodzie doliny.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Przyzwij ducha, wypowiadając słowa strażników umarłych, które tu spisałem.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //To wszystko. Teraz musimy znaleźć jego grób.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //Powodzenia, synu!

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir chce, bym obudził ducha starożytnego wodza, Quarhodrona i zapytał go o radę. Dał mi dokumenty z formułą magiczną, którą muszę odczytać na głos przy grobie Quarhodrona, na zachodzie."); 

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
};

///////////////////////////////////////////////////////////////////////
//	Info GeistPerm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistPerm		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistPerm_Condition;
	information	 = 	DIA_Addon_Myxir_GeistPerm_Info;

	description	 = 	"Przypomnij mi, o co chodzi z tym wodzem Quarhodronem?";
};

func int DIA_Addon_Myxir_GeistPerm_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistPerm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //Przypomnij mi, o co chodzi z tym wodzem Quarhodronem?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Powinieneś znaleźć jego grób i przywołać ducha słowami strażnika umarłych.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //Masz je spisane. Musisz je jedynie głośno wypowiedzieć.
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Myxir_TalkedToGhost_Info;

	description	 = 	"Rozmawiałem z Quarhodronem.";
};
func int DIA_Addon_Myxir_TalkedToGhost_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	&& (SC_TalkedToGhost == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //Rozmawiałem z Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //Więc naprawdę udało ci się przywołać go z krainy umarłych?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //To wprost niesamowite. Jeszcze bardziej podziwiam tych budowniczych.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Kto wie, co mogliby osiągnąć, gdyby wciąż istnieli...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //Co powiedział duch?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Dał mi coś, dzięki czemu będę mógł dostać się do świątyni.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Więc idź prosto do Saturasa. Interesuje go, co masz do powiedzenia.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Kiedy obudzę Quarhodrona, mam się zgłosić do Saturasa."); 
	};
};

///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Naucz mnie tego dziwnego języka.";
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition ()
{
	if (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)	
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_ADW_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();

	if (DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach); 
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};	
	
	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,DIALOG_BACK,DIA_Addon_Myxir_ADW_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1 ()
{
	if (B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};

















