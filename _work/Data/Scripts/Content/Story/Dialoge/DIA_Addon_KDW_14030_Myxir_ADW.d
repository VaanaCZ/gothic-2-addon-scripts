
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
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
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

	description	 = 	"Masz jakie� wie�ci?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //Masz jakie� wie�ci?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //Fascynuj� mnie budowniczowie tych ruin!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Szkoda, �e ich j�zyk jest martwy, tak jak oni.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //Ich pot�ne rytua�y i przywo�ania nie by�y w stanie im pom�c.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //Przywo�ania?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Budowniczowie byli mocno zwi�zani ze �wiatem duch�w.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Je�li dobrze rozumiem, uwa�ali, �e ca�y czas pozostaj� w kontakcie ze swoimi przodkami.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Dlatego, aby otrzyma� od nich rady lub przepowiednie, regularnie odprawiali rytua�y przywo�ania.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Jak dzia�a�y te przywo�ania?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "O ile wiem, o�ywie�cy nie gadaj� zbyt wiele.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //Jak dzia�a�y te przywo�ania?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Stra�nicy umar�ych znali specjalne zakl�cia, kt�rymi starali si� przeb�aga� duchy.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Opisy, kt�re tu znalaz�em, s� w wi�kszo�ci bardzo m�tne. Niecz�sto znajduj� jasne odpowiedzi na swoje pytania.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //O ile wiem, o�ywie�cy nie gadaj� zbyt wiele.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Budowniczowie nie stworzyli bezdusznych o�ywie�c�w, takich jak zombie czy inne plugawe istoty.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //Duchy s� duszami wielkich wojownik�w, kap�an�w i w�adc�w.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Nie mam w�tpliwo�ci, �e naprawd� istniej�.
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

	description	 = 	"Je�li spotkam ducha, dam ci zna�.";
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
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Je�li spotkam ducha, dam ci zna�.
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

	description	 = 	"Przys�a� mnie Saturas.";
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
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Przys�a� mnie Saturas.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Kruk dosta� si� do �wi�tyni i zamkn�� za sob� portal.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //Saturas uwa�a, �e swoj� wiedz� o �wi�tyni Kruk uzyska� od ducha!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //O Adanosie!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Kruk musia� przyzwa� ducha najwy�szego kap�ana Khardimona, aby dowiedzie� si�, jak wej�� do �wi�tyni.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //Wed�ug zapis�w, gr�b kap�ana znajduje si� w jaskiniach pod fortec�!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //B�dziesz musia� zrobi� tak samo.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Ale nie mo�esz ju� spyta� Khardimona...
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //W zachodniej cz�ci doliny znajduje si� gr�b wodza Quarhodrona.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //B�dziesz musia� go odnale��... i przebudzi� Quarhodrona.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //W tych inskrypcjach zapisano, jak wyznawca Adanosa mo�e przywo�a� ducha.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //My�lisz, �e to mo�e si� uda�?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //Przeczyta�em wiele sprzecznych informacji.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Na przyk�ad inskrypcje Y'Beriona, przyw�dcy Bractwa �ni�cego.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Ale wierz� w ka�de s�owo autora TYCH zapis�w!
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "M�wisz powa�nie?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Dlaczego Quarhodrona? Dlaczego nie kap�ana Khardimona?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Bractwo �ni�cego nie g�osi�o samych k�amstw. ", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //Dlaczego Quarhodrona? Dlaczego nie kap�ana Khardimona?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Kruk z pewno�ci� sprofanowa� jego gr�b w czasie przywo�ania.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Musimy poszuka� innego ducha.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //Bractwo �ni�cego nie g�osi�o samych k�amstw. �ni�cy naprawd� istnia�.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //To nie tylko k�amstwa sprawi�y, �e byli niewiarygodni, lecz ich w�asne s�owa.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //By�y m�tne! Wyznawcy �ni�cego pozostawali pod z�ym wp�ywem palonego przez nich bagiennego ziela.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //Powaga i podnios�o�� s��w spisanych na tej kamiennej tablicy przekonuj� mnie, �e ich autor m�wi prawd�.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //M�wisz powa�nie?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Chc�, �eby sprawdzono ka�dy zakamarek.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Nawet je�li istnieje jedynie cie� szansy na spotkanie jednego z budowniczych, musimy go wykorzysta�.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Kruk tak w�a�nie zrobi�.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Zgoda. Co mam zrobi�, je�li chc� przyzwa� ducha?", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Zgoda. Co mam zrobi�, je�li chc� przyzwa� ducha?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Znajd� grobowiec Quarhodrona na zachodzie doliny.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Przyzwij ducha, wypowiadaj�c s�owa stra�nik�w umar�ych, kt�re tu spisa�em.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //To wszystko. Teraz musimy znale�� jego gr�b.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //Powodzenia, synu!

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir chce, bym obudzi� ducha staro�ytnego wodza, Quarhodrona i zapyta� go o rad�. Da� mi dokumenty z formu�� magiczn�, kt�r� musz� odczyta� na g�os przy grobie Quarhodrona, na zachodzie."); 

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
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Powiniene� znale�� jego gr�b i przywo�a� ducha s�owami stra�nika umar�ych.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //Masz je spisane. Musisz je jedynie g�o�no wypowiedzie�.
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

	description	 = 	"Rozmawia�em z Quarhodronem.";
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
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //Rozmawia�em z Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //Wi�c naprawd� uda�o ci si� przywo�a� go z krainy umar�ych?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //To wprost niesamowite. Jeszcze bardziej podziwiam tych budowniczych.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Kto wie, co mogliby osi�gn��, gdyby wci�� istnieli...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //Co powiedzia� duch?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Da� mi co�, dzi�ki czemu b�d� m�g� dosta� si� do �wi�tyni.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Wi�c id� prosto do Saturasa. Interesuje go, co masz do powiedzenia.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Kiedy obudz� Quarhodrona, mam si� zg�osi� do Saturasa."); 
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

	description	 = 	"Naucz mnie tego dziwnego j�zyka.";
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

















