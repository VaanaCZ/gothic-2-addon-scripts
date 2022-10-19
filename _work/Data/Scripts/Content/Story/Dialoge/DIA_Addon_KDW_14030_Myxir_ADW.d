
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

	description	 = 	"Masz jakieœ wieœci?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //Masz jakieœ wieœci?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //Fascynuj¹ mnie budowniczowie tych ruin!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Szkoda, ¿e ich jêzyk jest martwy, tak jak oni.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //Ich potê¿ne rytua³y i przywo³ania nie by³y w stanie im pomóc.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //Przywo³ania?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Budowniczowie byli mocno zwi¹zani ze œwiatem duchów.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Jeœli dobrze rozumiem, uwa¿ali, ¿e ca³y czas pozostaj¹ w kontakcie ze swoimi przodkami.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Dlatego, aby otrzymaæ od nich rady lub przepowiednie, regularnie odprawiali rytua³y przywo³ania.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Jak dzia³a³y te przywo³ania?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "O ile wiem, o¿ywieñcy nie gadaj¹ zbyt wiele.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //Jak dzia³a³y te przywo³ania?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Stra¿nicy umar³ych znali specjalne zaklêcia, którymi starali siê przeb³agaæ duchy.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Opisy, które tu znalaz³em, s¹ w wiêkszoœci bardzo mêtne. Nieczêsto znajdujê jasne odpowiedzi na swoje pytania.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //O ile wiem, o¿ywieñcy nie gadaj¹ zbyt wiele.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Budowniczowie nie stworzyli bezdusznych o¿ywieñców, takich jak zombie czy inne plugawe istoty.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //Duchy s¹ duszami wielkich wojowników, kap³anów i w³adców.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Nie mam w¹tpliwoœci, ¿e naprawdê istniej¹.
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

	description	 = 	"Jeœli spotkam ducha, dam ci znaæ.";
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
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Jeœli spotkam ducha, dam ci znaæ.
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

	description	 = 	"Przys³a³ mnie Saturas.";
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
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Przys³a³ mnie Saturas.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Kruk dosta³ siê do œwi¹tyni i zamkn¹³ za sob¹ portal.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //Saturas uwa¿a, ¿e swoj¹ wiedzê o œwi¹tyni Kruk uzyska³ od ducha!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //O Adanosie!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Kruk musia³ przyzwaæ ducha najwy¿szego kap³ana Khardimona, aby dowiedzieæ siê, jak wejœæ do œwi¹tyni.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //Wed³ug zapisów, grób kap³ana znajduje siê w jaskiniach pod fortec¹!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //Bêdziesz musia³ zrobiæ tak samo.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Ale nie mo¿esz ju¿ spytaæ Khardimona...
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //W zachodniej czêœci doliny znajduje siê grób wodza Quarhodrona.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Bêdziesz musia³ go odnaleŸæ... i przebudziæ Quarhodrona.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //W tych inskrypcjach zapisano, jak wyznawca Adanosa mo¿e przywo³aæ ducha.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //Myœlisz, ¿e to mo¿e siê udaæ?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //Przeczyta³em wiele sprzecznych informacji.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Na przyk³ad inskrypcje Y'Beriona, przywódcy Bractwa Œni¹cego.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Ale wierzê w ka¿de s³owo autora TYCH zapisów!
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Mówisz powa¿nie?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Dlaczego Quarhodrona? Dlaczego nie kap³ana Khardimona?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Bractwo Œni¹cego nie g³osi³o samych k³amstw. ", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //Dlaczego Quarhodrona? Dlaczego nie kap³ana Khardimona?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Kruk z pewnoœci¹ sprofanowa³ jego grób w czasie przywo³ania.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Musimy poszukaæ innego ducha.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //Bractwo Œni¹cego nie g³osi³o samych k³amstw. Œni¹cy naprawdê istnia³.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //To nie tylko k³amstwa sprawi³y, ¿e byli niewiarygodni, lecz ich w³asne s³owa.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //By³y mêtne! Wyznawcy Œni¹cego pozostawali pod z³ym wp³ywem palonego przez nich bagiennego ziela.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //Powaga i podnios³oœæ s³ów spisanych na tej kamiennej tablicy przekonuj¹ mnie, ¿e ich autor mówi prawdê.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //Mówisz powa¿nie?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Chcê, ¿eby sprawdzono ka¿dy zakamarek.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Nawet jeœli istnieje jedynie cieñ szansy na spotkanie jednego z budowniczych, musimy go wykorzystaæ.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Kruk tak w³aœnie zrobi³.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Zgoda. Co mam zrobiæ, jeœli chcê przyzwaæ ducha?", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Zgoda. Co mam zrobiæ, jeœli chcê przyzwaæ ducha?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //ZnajdŸ grobowiec Quarhodrona na zachodzie doliny.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Przyzwij ducha, wypowiadaj¹c s³owa stra¿ników umar³ych, które tu spisa³em.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //To wszystko. Teraz musimy znaleŸæ jego grób.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //Powodzenia, synu!

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir chce, bym obudzi³ ducha staro¿ytnego wodza, Quarhodrona i zapyta³ go o radê. Da³ mi dokumenty z formu³¹ magiczn¹, któr¹ muszê odczytaæ na g³os przy grobie Quarhodrona, na zachodzie."); 

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
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Powinieneœ znaleŸæ jego grób i przywo³aæ ducha s³owami stra¿nika umar³ych.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //Masz je spisane. Musisz je jedynie g³oœno wypowiedzieæ.
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

	description	 = 	"Rozmawia³em z Quarhodronem.";
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
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //Rozmawia³em z Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //Wiêc naprawdê uda³o ci siê przywo³aæ go z krainy umar³ych?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //To wprost niesamowite. Jeszcze bardziej podziwiam tych budowniczych.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Kto wie, co mogliby osi¹gn¹æ, gdyby wci¹¿ istnieli...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //Co powiedzia³ duch?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Da³ mi coœ, dziêki czemu bêdê móg³ dostaæ siê do œwi¹tyni.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Wiêc idŸ prosto do Saturasa. Interesuje go, co masz do powiedzenia.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Kiedy obudzê Quarhodrona, mam siê zg³osiæ do Saturasa."); 
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

	description	 = 	"Naucz mnie tego dziwnego jêzyka.";
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

















