// ***************************************************************
//								EXIT
// ***************************************************************

// ---------------------
	var int Lothar_ImOV;
// ---------------------

INSTANCE DIA_Lothar_EXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lothar_EXIT_Condition()
{	
	if (Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_EXIT_Info() 
{
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							First EXIT
// ***************************************************************

INSTANCE DIA_Lothar_FirstEXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent   = TRUE;
	description = "Muszę iść! (KONIEC)";
};
FUNC INT DIA_Lothar_FirstEXIT_Condition()
{	
	if (Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_FirstEXIT_Info() 
{
	AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_00"); //Muszę iść!
	if (Lothar_Regeln == FALSE)
	{
		AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_01"); //Zaczekaj! Nie znasz nowych przepisów obowiązujących w mieście!
		AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_02"); //Na razie.
	}
	else
	{
		if (Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_03"); //Jeśli jeszcze raz usłyszę, że opowiadasz mieszkańcom tego miasta jakieś brednie o smokach, wpadniesz w tarapaty, rozumiemy się?
		}
		else
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_04"); //Dopóki przebywasz w Khorinis, możesz się czuć bezpieczny.

			if (hero.guild != GIL_PAL)
			{
				AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_05"); //Porządku w mieście strzegą teraz królewscy paladyni!
			};
		};

		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine (self, "START");
	};

	// ------- Canthars TA auswechseln -------
	if (Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine (Canthar, "START");
		Canthar_InStadt = TRUE;
	};

	AI_StopProcessInfos (self);
};


// ***************************************************************
//							Hallo
// ***************************************************************

instance DIA_Lothar_Hallo (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Hallo_Condition;
	information	 = 	DIA_Lothar_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lothar_Hallo_Condition ()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lothar_Hallo_01_00"); //Stój, nieznajomy!

	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Hallo_01_01"); //Nie widziałem, żebyś przechodził przez tę bramę.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_02"); //I co w związku z tym?
		AI_Output (self, other, "DIA_Lothar_Hallo_01_03"); //A strażnicy strzegący drugiej bramy mają zakaz wpuszczania kogokolwiek do miasta.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_04"); //Eeem...
		AI_Output (self, other, "DIA_Lothar_Hallo_01_05"); //Będę musiał się rozmówić z tymi obwiesiami!
		AI_Output (self, other, "DIA_Lothar_Hallo_01_06"); //Pozwól, że się przedstawię:
	};

	AI_Output (self, other, "DIA_Lothar_Hallo_01_07"); //Jestem Lothar, królewski paladyn i skromny sługa naszego Pana, Innosa.
	AI_Output (self, other, "DIA_Lothar_Hallo_01_08"); //Nasz dowódca, Lord Hagen, powierzył mi zadanie informowania wszystkich przybyszy o nowych prawach obowiązujących w mieście.

	//ADDON>
	AI_Output (self, other, "DIA_Addon_Lothar_Hallo_01_00"); //Mieszkańcy miasta znikają bez śladu, więc wszyscy muszą przestrzegać ustalonych zasad - o ile nie chcą, aby to samo spotkało także ich.
	//ADDON<

	if Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	{
		B_StartOtherRoutine (Lester, "XARDAS");
	};
};

// ***************************************************************
//						Wichtige Nachricht			E1
// ***************************************************************
instance DIA_Lothar_MESSAGE		(C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_MESSAGE_Condition;
	information	 = 	DIA_Lothar_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"Mam ważną wiadomość dla przywódcy paladynów!";
};
func int DIA_Lothar_MESSAGE_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_MESSAGE_Info ()
{
 	AI_Output (other, self, "DIA_Lothar_MESSAGE_15_00"); //Mam ważną wiadomość dla przywódcy paladynów!
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_01"); //Wielmożny Lord Hagen nikogo nie przyjmuje.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_02"); //Wszelkimi sprawami pospólstwa zajmuje się Lord Andre, dowódca straży miejskiej.
};	

// ***************************************************************
//							Auge Innos 				E2
// ***************************************************************
instance DIA_Lothar_EyeInnos (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_EyeInnos_Condition;
	information	 = 	DIA_Lothar_EyeInnos_Info;
	permanent    =  FALSE;
	description	 = 	"Przybywam, aby zdobyć Oko Innosa!";
};
func int DIA_Lothar_EyeInnos_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_EyeInnos_Info ()
{
	AI_Output (other, self, "DIA_Lothar_EyeInnos_15_00"); //Przybywam, aby zdobyć Oko Innosa!

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_01"); //To sprawa Lorda Hagena i z nim powinieneś na ten temat rozmawiać.
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_02"); //Święte Oko Innosa! Skąd o nim wiesz?! Nie należysz do zakonu!
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_03"); //Powiedział mi o nim pewien mag.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_04"); //Nie wiem, jakimi motywami mógł się kierować, powierzając ci jeden z sekretów naszego zakonu.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_05"); //Z pewnością nie chodziło mu o to, abyś położył swoje brudne łapska na naszej świętej relikwii.
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_06"); //Ale...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_07"); //Nie chcę więcej o tym słyszeć!
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output (self, other, "DIA_Lothar_EyeInnos_01_08"); //Najpierw te opowieści o smokach, a teraz jeszcze coś takiego - to oburzające!
		};
	};
};	

// ***************************************************************
//							Drachen 				E2
// ***************************************************************
instance DIA_Lothar_Dragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Dragons_Condition;
	information	 = 	DIA_Lothar_Dragons_Info;
	permanent    =  FALSE;
	description	 = 	"Posłuchaj - miastu zagrażają smoki!";
};
func int DIA_Lothar_Dragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Dragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Dragons_15_00"); //Posłuchaj - miastu zagrażają smoki!
	if ((hero.guild != GIL_PAL)&&(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_01"); //To niemożliwe!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_02"); //Kolejny szaleniec!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_03"); //I tak już mamy w mieście wystarczająco dużo problemów. Nawet bez jakiegoś nawiedzonego dziwaka, straszącego obywateli niestworzonymi historiami o smokach!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_04"); //Ostatnia osoba, która opowiadała tutaj historie o smokach, została przeze mnie aresztowana i wysłana wraz z resztą więźniów do Górniczej Doliny. Więc lepiej uważaj, co mówisz!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_05"); //Nie możemy pozwolić, aby ktoś siał panikę wśród naszych obywateli!
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_06"); //Już o tym słyszałem. Jednak trudno mi w to uwierzyć.
		AI_Output (self, other, "DIA_Lothar_Dragons_01_07"); //Byłoby lepiej, gdybyś zachował tę wiedzę dla siebie. Musimy zapobiegać wybuchowi paniki.
	};
	Player_TalkedAboutDragons = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_Ornament		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lothar_Ornament_Condition;
	information	 = 	DIA_Addon_Lothar_Ornament_Info;

	description	 = 	"Wiesz może coś o kamieniu z kamiennego kręgu przy farmie Lobarta?";
};

func int DIA_Addon_Lothar_Ornament_Condition ()
{
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //Wiesz może coś o kamieniu z kamiennego kręgu przy farmie Lobarta?
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //Oczywiście. Zniszczyliśmy go - zagrażał okolicznym włościanom.
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //Czemu pytasz?
	
	Info_ClearChoices	(DIA_Addon_Lothar_Ornament);
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Szukam metalowej części ornamentu w kształcie pierścienia.", DIA_Addon_Lothar_Ornament_suche );
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Sądzisz, że to normalne?", DIA_Addon_Lothar_Ornament_normal );
};
func void DIA_Addon_Lothar_Ornament_normal ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //Sądzisz, że to normalne?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //Chodzi ci o tego kamiennego potwora?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //O ile mi wiadomo, to tą sprawą zajmują się Magowie Wody.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //Nie chcę się tym więcej przejmować - mamy dość swojej roboty w mieście i Górniczej Dolinie.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //Dobrze.
};

func void DIA_Addon_Lothar_Ornament_suche ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //Szukam metalowej części ornamentu w kształcie pierścienia.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //Powinien znajdować się gdzieś w pobliżu kamiennego kręgu Lobarta.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //Tak, było tam coś takiego - kamienny stwór miał to przy sobie. Sądziłem, że to magiczna runa.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //Przekazałem ją Lordowi Hagenowi, ale nie wiem, czy nadal ją ma.
};

// ***************************************************************
//							WerVonDrachen 				E3
// ***************************************************************
instance DIA_Lothar_WhoDragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_WhoDragons_Condition;
	information	 = 	DIA_Lothar_WhoDragons_Info;
	permanent    =  FALSE;
	description	 = 	"Czy ktoś już ostrzegał was o zagrożeniu ze strony smoków?";
};
func int DIA_Lothar_WhoDragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Dragons))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WhoDragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WhoDragons_15_00"); //Czy ktoś już ostrzegał was o zagrożeniu ze strony smoków?
	AI_Output (self, other, "DIA_Lothar_WhoDragons_01_01"); //Tak. Nazywał się Diego. Przynajmniej tak mi się wydaje.

	if ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_WhoDragons_01_02"); //Ostrzegałem go - tak jak ciebie! Ale ten szaleniec nie chciał mnie w ogóle słuchać!
	};
};	

// ***************************************************************
//							Regeln 				E1
// ***************************************************************
instance DIA_Lothar_Regeln (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_Regeln_Condition;
	information	 = 	DIA_Lothar_Regeln_Info;
	permanent    =  FALSE;
	description	 = 	"Opowiedz mi o przepisach obowiązujących w mieście!";
};
func int DIA_Lothar_Regeln_Condition ()
{	
	return TRUE;
};
func void DIA_Lothar_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Regeln_15_00"); //No dobrze - opowiedz mi o przepisach panujących w mieście!
	AI_Output (self, other, "DIA_Lothar_Regeln_01_01"); //Po pierwsze: dostojny paladyn Lord Hagen rezyduje w górnym mieście, wraz ze swoimi wojskami.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_02"); //Dlatego jedynie poważani obywatele mogą tam wchodzić.
	AI_Output (self ,other, "DIA_Lothar_Add_01_04"); //Po drugie: ratusz w górnym mieście został przejęty przez paladynów, którzy założyli tam swoją główną siedzibę. Tylko paladyni i członkowie straży mogą wchodzić do środka.
	AI_Output (self ,other, "DIA_Lothar_Add_01_05"); //Po trzecie: ktokolwiek zostanie oskarżony o popełnienie przestępstwa, musi się oczyścić z zarzutów przed dowódcą straży.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_05"); //Jakieś pytania?
	
	Lothar_Regeln = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_MissingPeople		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lothar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Lothar_MissingPeople_Info;

	description	 = 	"Mieszkańcy miasta tak po prostu znikają?";
};

func int DIA_Addon_Lothar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lothar_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //Mieszkańcy miasta tak po prostu znikają?
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //Tak. Z dnia na dzień jest coraz więcej zgłoszeń.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //Straż nie zdołała rozwiązać zagadki tych dziwnych zdarzeń.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //Nic więc dziwnego, że ludność miasta zachowuje się nieufnie w stosunku do obcych.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_04"); //Będąc w mieście, staraj się nie zwracać na siebie uwagi.
	
		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};
	
	SC_HearedAboutMissingPeople = TRUE;
};

// ***************************************************************
//							HowCitizen 				E2
// ***************************************************************
instance DIA_Lothar_HowCitizen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	4;
	condition	 = 	DIA_Lothar_HowCitizen_Condition;
	information	 = 	DIA_Lothar_HowCitizen_Info;
	permanent    =  FALSE;
	description	 = 	"Jak mogę zostać obywatelem miasta?";
};
func int DIA_Lothar_HowCitizen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_HowCitizen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_06"); //Jak mogę zostać obywatelem miasta?
	AI_Output (self ,other, "DIA_Lothar_Add_01_07"); //Obywatelem miasta może być jedynie osoba posiadająca stałe zatrudnienie!
	AI_Output (self ,other, "DIA_Lothar_Add_01_09"); //Nie myśl jednak, że zostaniesz dopuszczony do Lorda Hagena tylko dlatego, że jesteś obywatelem Khorinis!
	AI_Output (self ,other, "DIA_Lothar_Add_01_10"); //Obywatelstwo daje ci prawo wstępu do górnego miasta - nic więcej!
	AI_Output (self ,other, "DIA_Lothar_Add_01_11"); //Tylko członkowie straży mają wstęp do ratusza miejskiego!
};

// ***************************************************************
//							WoArbeit				E3
// ***************************************************************
instance DIA_Lothar_WoArbeit (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	5;
	condition	 = 	DIA_Lothar_WoArbeit_Condition;
	information	 = 	DIA_Lothar_WoArbeit_Info;
	permanent    =  FALSE;
	description	 = 	"Gdzie mogę znaleźć pracę?";
};
func int DIA_Lothar_WoArbeit_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_HowCitizen))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoArbeit_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_14"); //Gdzie mogę znaleźć pracę?
	AI_Output (self ,other, "DIA_Lothar_Add_01_15"); //Musisz zostać czeladnikiem u jednego z mistrzów rezydujących w dolnej części miasta.
	AI_Output (self ,other, "DIA_Lothar_Add_01_16"); //Jeśli zostaniesz przyjęty na praktykę, automatycznie staniesz się obywatelem miasta.
	AI_Output (self ,other, "DIA_Lothar_Add_01_17"); //Jednak wedle pradawnej tradycji, muszą się na to zgodzić pozostali mistrzowie.
	AI_Output (self ,other, "DIA_Lothar_Add_01_18"); //Jeśli chciałeś szukać pracy w dzielnicy portowej - zapomnij o tym!
	AI_Output (self ,other, "DIA_Lothar_Add_01_19"); //Mieszkają tam same najgorsze śmiecie. Najlepiej w ogóle unikać tego miejsca!
};

// ***************************************************************
//							ToOV 				E2
// ***************************************************************
instance DIA_Lothar_ToOV (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	6;
	condition	 = 	DIA_Lothar_ToOV_Condition;
	information	 = 	DIA_Lothar_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"Jak dojść do górnego miasta?";
};
func int DIA_Lothar_ToOV_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToOV_Info ()
{
	AI_Output (other, self, "DIA_Lothar_ToOV_15_00"); //Jak dojść do górnego miasta?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_01"); //Czy ty mnie w ogóle słuchasz?!
	AI_Output (self, other, "DIA_Lothar_ToOV_01_02"); //Nie jesteś obywatelem tego miasta. Możesz więc sobie oszczędzić wysiłku - strażnicy i tak cię nie wpuszczą.
	AI_Output (self, other, "DIA_Lothar_ToOV_01_03"); //Nie masz szans na przedostanie się za bramę!
};	

// ***************************************************************
//							ToMiliz 				E2
// ***************************************************************
instance DIA_Lothar_ToMiliz (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToMiliz_Condition;
	information	 = 	DIA_Lothar_ToMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"Jak mogę zostać członkiem straży?";
};
func int DIA_Lothar_ToMiliz_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToMiliz_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_26"); //Jak mogę zostać członkiem straży?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_27"); //Wedle rozkazu Lorda Hagena jedynie obywatele miasta mogą zaciągać się do straży.
		AI_Output (other, self, "DIA_Lothar_Add_15_28"); //Rozumiem.
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_29"); //Jeśli chcesz się dowiedzieć czegoś więcej, porozmawiaj z Lordem Andre. Znajdziesz go w koszarach.
};	

// ***************************************************************
//							ToPaladins 				E2
// ***************************************************************
instance DIA_Lothar_ToPaladins (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToPaladins_Condition;
	information	 = 	DIA_Lothar_ToPaladins_Info;
	permanent    =  FALSE;
	description	 = 	"Co muszę zrobić, żeby zdobyć taką zbroję jak twoja?";
};
func int DIA_Lothar_ToPaladins_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_ToMiliz))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToPaladins_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_30"); //Co muszę zrobić, żeby zdobyć taką zbroję jak twoja?
	if (other.guild != GIL_MIL)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_31"); //Co takiego?! Nawet nie jesteś członkiem straży!
	};
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_32"); //Nie jesteś nawet OBYWATELEM!
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_33"); //Skąd ci przyszło do głowy, że mógłbyś założyć zbroję PALADYNA?
	AI_Output (self ,other, "DIA_Lothar_Add_01_34"); //Tylko kilku członków straży, którzy wykazali się szczególnymi zasługami, dostąpiło tego zaszczytu.
	AI_Output (self ,other, "DIA_Lothar_Add_01_35"); //Jeśli chcesz zostać paladynem, masz przed sobą długą drogę, chłopcze!
};	

// ***************************************************************
//							WoAndre 				E2
// ***************************************************************
instance DIA_Lothar_WoAndre (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	8;
	condition	 = 	DIA_Lothar_WoAndre_Condition;
	information	 = 	DIA_Lothar_WoAndre_Info;
	permanent    =  FALSE;
	description	 = 	"Gdzie mogę znaleźć przywódcę straży miejskiej?";
};
func int DIA_Lothar_WoAndre_Condition ()
{	
	if ( Npc_KnowsInfo(other, DIA_Lothar_Regeln) || Npc_KnowsInfo(other, DIA_Lothar_MESSAGE) )
	&& (Andre.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoAndre_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WoAndre_15_00"); //Gdzie mogę znaleźć przywódcę straży miejskiej?
	AI_Output (self, other, "DIA_Lothar_WoAndre_01_01"); //Lord Andre przebywa w koszarach po drugiej stronie miasta.
};	

// ***************************************************************
//							Schlafen 				E2
// ***************************************************************
instance DIA_Lothar_Schlafen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	9;
	condition	 = 	DIA_Lothar_Schlafen_Condition;
	information	 = 	DIA_Lothar_Schlafen_Info;
	permanent    =  FALSE;
	description	 = 	"Gdzie mogę spędzić noc?";
};
func int DIA_Lothar_Schlafen_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_22"); //Gdzie mogę spędzić noc?
	AI_Output (self ,other, "DIA_Lothar_Add_01_23"); //Jeśli szukasz miejsca do spania, udaj się do gospody naprzeciwko koszar.
	AI_Output (self ,other, "DIA_Lothar_Add_01_24"); //Paladyni opłacają kwatery dla wszystkich przyjezdnych.
	AI_Output (self ,other, "DIA_Lothar_Add_01_25"); //Wędrowni handlarze również tam sypiają.
};	

// ***************************************************************
//							PERM - VOR OV				
// ***************************************************************
instance DIA_Lothar_PermB4OV (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 3;
	condition	= DIA_Lothar_PermB4OV_Condition;
	information	= DIA_Lothar_PermB4OV_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
func int DIA_Lothar_PermB4OV_Condition ()
{	
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Lothar_Regeln == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PermB4OV_Info ()
{
	AI_Output (self, other, "DIA_Lothar_PermB4OV_01_00"); //O całej reszcie dowiesz się od Lorda Andre!
	AI_StopProcessInfos(self);
};	
	

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() //überflüsige Outputs
{
	AI_Output (other, self, "DIA_Lothar_Add_15_00"); //Ale ja naprawdę muszę się zobaczyć z Lordem Hagenem!

	AI_Output (self ,other, "DIA_Lothar_Add_01_45"); //Jak widzę, przyjął cię w szeregi strażników.
	AI_Output (self ,other, "DIA_Lothar_Add_01_46"); //Hmmm - sądzę, że wie, co robi.
	
	AI_Output (other, self, "DIA_Lothar_Add_15_20"); //Ilu jest mistrzów?
	AI_Output (self ,other, "DIA_Lothar_Add_01_21"); //Z tego co wiem, pięciu.
		
	AI_Output (self ,other, "DIA_Lothar_Add_01_62"); //Czy nie wyraziłem się wystarczająco jasno? Żadnych opowieści o smokach!
	AI_Output (other, self, "DIA_Lothar_Add_15_63"); //Skąd wiesz...?
	AI_Output (self ,other, "DIA_Lothar_Add_01_64"); //To nie twoja sprawa!
	AI_Output (self ,other, "DIA_Lothar_Add_01_65"); //To ostatnie ostrzeżenie, zrozumiano?!
	
	AI_Output (other, self, "DIA_Lothar_Add_15_66"); //Gdzie mogę znaleźć dowódcę straży?
	AI_Output (other, self, "DIA_Lothar_Add_15_08"); //Jestem czeladnikiem praktykującym u jednego z mistrzów!
	
	// ------ NEWS_Modul für Unterstadt ------
	AI_Output (self ,other, "DIA_Lothar_Add_01_47"); //To znowu ty.

	AI_Output (self ,other, "DIA_Lothar_Add_01_43"); //Słyszałem, że byłeś u Lorda Andre?
	AI_Output (self ,other, "DIA_Lothar_Add_01_44"); //Powiedziałem ci, że do straży mogą wstępować tylko i wyłącznie obywatele miasta.

	AI_Output (self ,other, "DIA_Lothar_Add_01_48"); //Przekazałem Lordowi Hagenowi, że chciałbyś z nim porozmawiać...
	AI_Output (other, self, "DIA_Lothar_Add_15_49"); //No i co powiedział?
	AI_Output (self ,other, "DIA_Lothar_Add_01_50"); //Nigdy o tobie nie słyszał.
	AI_Output (other, self, "DIA_Lothar_Add_15_51"); //Oczywiście, że nie. Powiedziałeś mu o smokach?
	AI_Output (self ,other, "DIA_Lothar_Add_01_52"); //Czy nie mówiłem ci, żebyś skończył wreszcie z tymi opowieściami?!

	AI_Output (self ,other, "DIA_Lothar_Add_01_12"); //Słyszałem, że podobno zdobyłeś już poparcie niektórych mistrzów.
	AI_Output (self ,other, "DIA_Lothar_Add_01_13"); //Traktujesz to bardzo poważnie, prawda?

	AI_Output (self ,other, "DIA_Lothar_Add_01_01"); //Obowiązują cię pewne przepisy, tak jak wszystkich!
	AI_Output (self ,other, "DIA_Lothar_Add_01_02"); //Lord Hagen jest nieosiągalny.
	AI_Output (self ,other, "DIA_Lothar_Add_01_03"); //Jeśli faktycznie masz coś ważnego do powiedzenia, udaj się do Lorda Andre. On ci pomoże.
};


// #########################################
// #########################################
		
// 				Im Oberen Viertel
		
// #########################################
// #########################################


// ***************************************************************
//								OV Regeln
// ***************************************************************
instance DIA_Lothar_HelloAgain (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_HelloAgain_Condition;
	information	 = 	DIA_Lothar_HelloAgain_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lothar_HelloAgain_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	{
		return TRUE;
	};
};
func void DIA_Lothar_HelloAgain_Info ()
{
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_00"); //Aaa! To znowu ty!
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_01"); //A więc udało ci się w końcu przedostać do górnego miasta!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_36"); //Skąd masz tę szatę?
		AI_Output (other, self, "DIA_Lothar_Add_15_37"); //Przeszedłem Próbę Ognia.
		AI_Output (self ,other, "DIA_Lothar_Add_01_38"); //Niesamowite. A więc to wszystko musi się dziać z woli Innosa...
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_39"); //Przyłączyłeś się do Onara i jego najemników, prawda?
		AI_Output (self ,other, "DIA_Lothar_Add_01_40"); //Jak się tu dostałeś?
		AI_Output (other, self, "DIA_Lothar_Add_15_41"); //Przychodzę z propozycją pokojową od Lee...
		AI_Output (self ,other, "DIA_Lothar_Add_01_42"); //E tam! Lord Hagen nigdy się na to nie zgodzi.
	};
		
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_02"); //Panują tutaj pewne prawa, których musisz przestrzegać. Inaczej znajdziesz się poza murami miasta równie szybko, jak zostałeś wpuszczony!
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_03"); //Wolno ci wchodzić jedynie do budynków przeznaczonych dla handlarzy. Rozpoznasz je po znakach na drzwiach. Chcę, żebyśmy się dobrze zrozumieli.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_04"); //Inne domy należą do bogatych obywateli - nie masz tam czego szukać!
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV) 
	{
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_05"); //Nawet jeśli należysz do zakonu Innosa.
	};
	if (other.guild == GIL_MIL)
	{	
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_06"); //Jako członek straży masz prawo wchodzić do pokojów paladynów.
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_07"); //Jednak twoja kwatera znajduje się w koszarach.
	};
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_08"); //W tej dzielnicy mieszkają ważni obywatele. Traktuj ich z szacunkiem.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_09"); //Rozumiemy się?
	AI_Output (other, self, "DIA_Lothar_HelloAgain_15_10"); //Oczywiście.
};	

// ***************************************************************
//								Hagen
// ***************************************************************
instance DIA_Lothar_Hagen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_Hagen_Condition;
	information	 = 	DIA_Lothar_Hagen_Info;
	permanent    =  TRUE;
	description  = 	"Gdzie mogę znaleźć Lorda Hagena?";
};
func int DIA_Lothar_Hagen_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Hagen_15_00"); //Gdzie mogę znaleźć Lorda Hagena?
	AI_Output (self, other, "DIA_Lothar_Hagen_01_01"); //Przebywa w ratuszu miejskim, na samym końcu górnego miasta.
	AI_Output (self, other, "DIA_Lothar_Hagen_01_02"); //Jednak nie zostaniesz tam wpuszczony, jeśli nie podasz dobrego powodu.
};

// ***************************************************************
//							Oldworld Running
// ***************************************************************
instance DIA_Lothar_OWRunning (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunning_Condition;
	information	 = 	DIA_Lothar_OWRunning_Info;
	permanent    =  FALSE;
	description  = 	"Poszedłem do Lorda Hagena...";
};
func int DIA_Lothar_OWRunning_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) == 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunning_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_53"); //Poszedłem do Lorda Hagena...
	AI_Output (self ,other, "DIA_Lothar_Add_01_54"); //I co? Chyba nie zadręczałeś go tymi swoimi opowieściami o smokach, prawda?
	AI_Output (other, self, "DIA_Lothar_Add_15_55"); //Zadręczałem.
	AI_Output (self ,other, "DIA_Lothar_Add_01_56"); //Powiedz mi, że nie mówisz poważnie...
	AI_Output (other, self, "DIA_Lothar_Add_15_57"); //Kazał mi zdobyć jakiś dowód.
	AI_Output (self ,other, "DIA_Lothar_Add_01_58"); //A zatem - powodzenia... Co za wariat...
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							Oldworld Running UND Brief
// ***************************************************************
instance DIA_Lothar_OWRunningBrief (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunningBrief_Condition;
	information	 = 	DIA_Lothar_OWRunningBrief_Info;
	permanent    =  FALSE;
	description  = 	"Mam dowód! Oto list od kapitana Garonda!";
};
func int DIA_Lothar_OWRunningBrief_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunningBrief_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_59"); //Mam dowód! Oto list od kapitana Garonda!
	AI_Output (self ,other, "DIA_Lothar_Add_01_60"); //A więc smoki naprawdę istnieją?
	AI_Output (self ,other, "DIA_Lothar_Add_01_61"); //Byłem wobec ciebie niesprawiedliwy. Złożę ofiarę Innosowi, aby wybaczył mi moje zachowanie.
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//								PERM
// ***************************************************************
instance DIA_Lothar_PERM (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_PERM_Condition;
	information	 = 	DIA_Lothar_PERM_Info;
	permanent    =  TRUE;
	description  = 	"Czy ostatnio wydarzyło się tu coś niezwykłego?";
};
func int DIA_Lothar_PERM_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PERM_Info ()
{
	AI_Output (other, self, "DIA_Lothar_PERM_15_00"); //Czy zdarzyło się tu ostatnio coś ciekawego?
	if (other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_01"); //Tak, że wpuścili tutaj kogoś takiego jak ty. To absolutny ewenement.
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_02"); //Chyba sam powinieneś to wiedzieć najlepiej. W końcu jako członek straży, zajmujesz się pilnowaniem porządku w tym mieście!
	}
	else //KdF oder NOV
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_03"); //Nie.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lothar_PICKPOCKET (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 900;
	condition	= DIA_Lothar_PICKPOCKET_Condition;
	information	= DIA_Lothar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lothar_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Lothar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lothar_PICKPOCKET);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_BACK 		,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};
	
func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};





