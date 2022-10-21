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
	description = "Musz� i��! (KONIEC)";
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
	AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_00"); //Musz� i��!
	if (Lothar_Regeln == FALSE)
	{
		AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_01"); //Zaczekaj! Nie znasz nowych przepis�w obowi�zuj�cych w mie�cie!
		AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_02"); //Na razie.
	}
	else
	{
		if (Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_03"); //Je�li jeszcze raz us�ysz�, �e opowiadasz mieszka�com tego miasta jakie� brednie o smokach, wpadniesz w tarapaty, rozumiemy si�?
		}
		else
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_04"); //Dop�ki przebywasz w Khorinis, mo�esz si� czu� bezpieczny.

			if (hero.guild != GIL_PAL)
			{
				AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_05"); //Porz�dku w mie�cie strzeg� teraz kr�lewscy paladyni!
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
	AI_Output (self, other, "DIA_Lothar_Hallo_01_00"); //St�j, nieznajomy!

	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Hallo_01_01"); //Nie widzia�em, �eby� przechodzi� przez t� bram�.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_02"); //I co w zwi�zku z tym?
		AI_Output (self, other, "DIA_Lothar_Hallo_01_03"); //A stra�nicy strzeg�cy drugiej bramy maj� zakaz wpuszczania kogokolwiek do miasta.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_04"); //Eeem...
		AI_Output (self, other, "DIA_Lothar_Hallo_01_05"); //B�d� musia� si� rozm�wi� z tymi obwiesiami!
		AI_Output (self, other, "DIA_Lothar_Hallo_01_06"); //Pozw�l, �e si� przedstawi�:
	};

	AI_Output (self, other, "DIA_Lothar_Hallo_01_07"); //Jestem Lothar, kr�lewski paladyn i skromny s�uga naszego Pana, Innosa.
	AI_Output (self, other, "DIA_Lothar_Hallo_01_08"); //Nasz dow�dca, Lord Hagen, powierzy� mi zadanie informowania wszystkich przybyszy o nowych prawach obowi�zuj�cych w mie�cie.

	//ADDON>
	AI_Output (self, other, "DIA_Addon_Lothar_Hallo_01_00"); //Mieszka�cy miasta znikaj� bez �ladu, wi�c wszyscy musz� przestrzega� ustalonych zasad - o ile nie chc�, aby to samo spotka�o tak�e ich.
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
	description	 = 	"Mam wa�n� wiadomo�� dla przyw�dcy paladyn�w!";
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
 	AI_Output (other, self, "DIA_Lothar_MESSAGE_15_00"); //Mam wa�n� wiadomo�� dla przyw�dcy paladyn�w!
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_01"); //Wielmo�ny Lord Hagen nikogo nie przyjmuje.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_02"); //Wszelkimi sprawami posp�lstwa zajmuje si� Lord Andre, dow�dca stra�y miejskiej.
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
	description	 = 	"Przybywam, aby zdoby� Oko Innosa!";
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
	AI_Output (other, self, "DIA_Lothar_EyeInnos_15_00"); //Przybywam, aby zdoby� Oko Innosa!

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_01"); //To sprawa Lorda Hagena i z nim powiniene� na ten temat rozmawia�.
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_02"); //�wi�te Oko Innosa! Sk�d o nim wiesz?! Nie nale�ysz do zakonu!
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_03"); //Powiedzia� mi o nim pewien mag.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_04"); //Nie wiem, jakimi motywami m�g� si� kierowa�, powierzaj�c ci jeden z sekret�w naszego zakonu.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_05"); //Z pewno�ci� nie chodzi�o mu o to, aby� po�o�y� swoje brudne �apska na naszej �wi�tej relikwii.
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_06"); //Ale...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_07"); //Nie chc� wi�cej o tym s�ysze�!
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output (self, other, "DIA_Lothar_EyeInnos_01_08"); //Najpierw te opowie�ci o smokach, a teraz jeszcze co� takiego - to oburzaj�ce!
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
	description	 = 	"Pos�uchaj - miastu zagra�aj� smoki!";
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
	AI_Output (other, self, "DIA_Lothar_Dragons_15_00"); //Pos�uchaj - miastu zagra�aj� smoki!
	if ((hero.guild != GIL_PAL)&&(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_01"); //To niemo�liwe!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_02"); //Kolejny szaleniec!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_03"); //I tak ju� mamy w mie�cie wystarczaj�co du�o problem�w. Nawet bez jakiego� nawiedzonego dziwaka, strasz�cego obywateli niestworzonymi historiami o smokach!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_04"); //Ostatnia osoba, kt�ra opowiada�a tutaj historie o smokach, zosta�a przeze mnie aresztowana i wys�ana wraz z reszt� wi�ni�w do G�rniczej Doliny. Wi�c lepiej uwa�aj, co m�wisz!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_05"); //Nie mo�emy pozwoli�, aby kto� sia� panik� w�r�d naszych obywateli!
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_06"); //Ju� o tym s�ysza�em. Jednak trudno mi w to uwierzy�.
		AI_Output (self, other, "DIA_Lothar_Dragons_01_07"); //By�oby lepiej, gdyby� zachowa� t� wiedz� dla siebie. Musimy zapobiega� wybuchowi paniki.
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

	description	 = 	"Wiesz mo�e co� o kamieniu z kamiennego kr�gu przy farmie Lobarta?";
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
	AI_Output	(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //Wiesz mo�e co� o kamieniu z kamiennego kr�gu przy farmie Lobarta?
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //Oczywi�cie. Zniszczyli�my go - zagra�a� okolicznym w�o�cianom.
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //Czemu pytasz?
	
	Info_ClearChoices	(DIA_Addon_Lothar_Ornament);
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Szukam metalowej cz�ci ornamentu w kszta�cie pier�cienia.", DIA_Addon_Lothar_Ornament_suche );
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "S�dzisz, �e to normalne?", DIA_Addon_Lothar_Ornament_normal );
};
func void DIA_Addon_Lothar_Ornament_normal ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //S�dzisz, �e to normalne?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //Chodzi ci o tego kamiennego potwora?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //O ile mi wiadomo, to t� spraw� zajmuj� si� Magowie Wody.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //Nie chc� si� tym wi�cej przejmowa� - mamy do�� swojej roboty w mie�cie i G�rniczej Dolinie.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //Dobrze.
};

func void DIA_Addon_Lothar_Ornament_suche ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //Szukam metalowej cz�ci ornamentu w kszta�cie pier�cienia.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //Powinien znajdowa� si� gdzie� w pobli�u kamiennego kr�gu Lobarta.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //Tak, by�o tam co� takiego - kamienny stw�r mia� to przy sobie. S�dzi�em, �e to magiczna runa.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //Przekaza�em j� Lordowi Hagenowi, ale nie wiem, czy nadal j� ma.
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
	description	 = 	"Czy kto� ju� ostrzega� was o zagro�eniu ze strony smok�w?";
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
	AI_Output (other, self, "DIA_Lothar_WhoDragons_15_00"); //Czy kto� ju� ostrzega� was o zagro�eniu ze strony smok�w?
	AI_Output (self, other, "DIA_Lothar_WhoDragons_01_01"); //Tak. Nazywa� si� Diego. Przynajmniej tak mi si� wydaje.

	if ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_WhoDragons_01_02"); //Ostrzega�em go - tak jak ciebie! Ale ten szaleniec nie chcia� mnie w og�le s�ucha�!
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
	description	 = 	"Opowiedz mi o przepisach obowi�zuj�cych w mie�cie!";
};
func int DIA_Lothar_Regeln_Condition ()
{	
	return TRUE;
};
func void DIA_Lothar_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Regeln_15_00"); //No dobrze - opowiedz mi o przepisach panuj�cych w mie�cie!
	AI_Output (self, other, "DIA_Lothar_Regeln_01_01"); //Po pierwsze: dostojny paladyn Lord Hagen rezyduje w g�rnym mie�cie, wraz ze swoimi wojskami.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_02"); //Dlatego jedynie powa�ani obywatele mog� tam wchodzi�.
	AI_Output (self ,other, "DIA_Lothar_Add_01_04"); //Po drugie: ratusz w g�rnym mie�cie zosta� przej�ty przez paladyn�w, kt�rzy za�o�yli tam swoj� g��wn� siedzib�. Tylko paladyni i cz�onkowie stra�y mog� wchodzi� do �rodka.
	AI_Output (self ,other, "DIA_Lothar_Add_01_05"); //Po trzecie: ktokolwiek zostanie oskar�ony o pope�nienie przest�pstwa, musi si� oczy�ci� z zarzut�w przed dow�dc� stra�y.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_05"); //Jakie� pytania?
	
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

	description	 = 	"Mieszka�cy miasta tak po prostu znikaj�?";
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
	AI_Output	(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //Mieszka�cy miasta tak po prostu znikaj�?
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //Tak. Z dnia na dzie� jest coraz wi�cej zg�osze�.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //Stra� nie zdo�a�a rozwi�za� zagadki tych dziwnych zdarze�.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //Nic wi�c dziwnego, �e ludno�� miasta zachowuje si� nieufnie w stosunku do obcych.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_04"); //B�d�c w mie�cie, staraj si� nie zwraca� na siebie uwagi.
	
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
	description	 = 	"Jak mog� zosta� obywatelem miasta?";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_06"); //Jak mog� zosta� obywatelem miasta?
	AI_Output (self ,other, "DIA_Lothar_Add_01_07"); //Obywatelem miasta mo�e by� jedynie osoba posiadaj�ca sta�e zatrudnienie!
	AI_Output (self ,other, "DIA_Lothar_Add_01_09"); //Nie my�l jednak, �e zostaniesz dopuszczony do Lorda Hagena tylko dlatego, �e jeste� obywatelem Khorinis!
	AI_Output (self ,other, "DIA_Lothar_Add_01_10"); //Obywatelstwo daje ci prawo wst�pu do g�rnego miasta - nic wi�cej!
	AI_Output (self ,other, "DIA_Lothar_Add_01_11"); //Tylko cz�onkowie stra�y maj� wst�p do ratusza miejskiego!
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
	description	 = 	"Gdzie mog� znale�� prac�?";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_14"); //Gdzie mog� znale�� prac�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_15"); //Musisz zosta� czeladnikiem u jednego z mistrz�w rezyduj�cych w dolnej cz�ci miasta.
	AI_Output (self ,other, "DIA_Lothar_Add_01_16"); //Je�li zostaniesz przyj�ty na praktyk�, automatycznie staniesz si� obywatelem miasta.
	AI_Output (self ,other, "DIA_Lothar_Add_01_17"); //Jednak wedle pradawnej tradycji, musz� si� na to zgodzi� pozostali mistrzowie.
	AI_Output (self ,other, "DIA_Lothar_Add_01_18"); //Je�li chcia�e� szuka� pracy w dzielnicy portowej - zapomnij o tym!
	AI_Output (self ,other, "DIA_Lothar_Add_01_19"); //Mieszkaj� tam same najgorsze �miecie. Najlepiej w og�le unika� tego miejsca!
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
	description	 = 	"Jak doj�� do g�rnego miasta?";
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
	AI_Output (other, self, "DIA_Lothar_ToOV_15_00"); //Jak doj�� do g�rnego miasta?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_01"); //Czy ty mnie w og�le s�uchasz?!
	AI_Output (self, other, "DIA_Lothar_ToOV_01_02"); //Nie jeste� obywatelem tego miasta. Mo�esz wi�c sobie oszcz�dzi� wysi�ku - stra�nicy i tak ci� nie wpuszcz�.
	AI_Output (self, other, "DIA_Lothar_ToOV_01_03"); //Nie masz szans na przedostanie si� za bram�!
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
	description	 = 	"Jak mog� zosta� cz�onkiem stra�y?";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_26"); //Jak mog� zosta� cz�onkiem stra�y?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_27"); //Wedle rozkazu Lorda Hagena jedynie obywatele miasta mog� zaci�ga� si� do stra�y.
		AI_Output (other, self, "DIA_Lothar_Add_15_28"); //Rozumiem.
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_29"); //Je�li chcesz si� dowiedzie� czego� wi�cej, porozmawiaj z Lordem Andre. Znajdziesz go w koszarach.
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
	description	 = 	"Co musz� zrobi�, �eby zdoby� tak� zbroj� jak twoja?";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_30"); //Co musz� zrobi�, �eby zdoby� tak� zbroj� jak twoja?
	if (other.guild != GIL_MIL)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_31"); //Co takiego?! Nawet nie jeste� cz�onkiem stra�y!
	};
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_32"); //Nie jeste� nawet OBYWATELEM!
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_33"); //Sk�d ci przysz�o do g�owy, �e m�g�by� za�o�y� zbroj� PALADYNA?
	AI_Output (self ,other, "DIA_Lothar_Add_01_34"); //Tylko kilku cz�onk�w stra�y, kt�rzy wykazali si� szczeg�lnymi zas�ugami, dost�pi�o tego zaszczytu.
	AI_Output (self ,other, "DIA_Lothar_Add_01_35"); //Je�li chcesz zosta� paladynem, masz przed sob� d�ug� drog�, ch�opcze!
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
	description	 = 	"Gdzie mog� znale�� przyw�dc� stra�y miejskiej?";
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
	AI_Output (other, self, "DIA_Lothar_WoAndre_15_00"); //Gdzie mog� znale�� przyw�dc� stra�y miejskiej?
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
	description	 = 	"Gdzie mog� sp�dzi� noc?";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_22"); //Gdzie mog� sp�dzi� noc?
	AI_Output (self ,other, "DIA_Lothar_Add_01_23"); //Je�li szukasz miejsca do spania, udaj si� do gospody naprzeciwko koszar.
	AI_Output (self ,other, "DIA_Lothar_Add_01_24"); //Paladyni op�acaj� kwatery dla wszystkich przyjezdnych.
	AI_Output (self ,other, "DIA_Lothar_Add_01_25"); //W�drowni handlarze r�wnie� tam sypiaj�.
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
	AI_Output (self, other, "DIA_Lothar_PermB4OV_01_00"); //O ca�ej reszcie dowiesz si� od Lorda Andre!
	AI_StopProcessInfos(self);
};	
	

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() //�berfl�sige Outputs
{
	AI_Output (other, self, "DIA_Lothar_Add_15_00"); //Ale ja naprawd� musz� si� zobaczy� z Lordem Hagenem!

	AI_Output (self ,other, "DIA_Lothar_Add_01_45"); //Jak widz�, przyj�� ci� w szeregi stra�nik�w.
	AI_Output (self ,other, "DIA_Lothar_Add_01_46"); //Hmmm - s�dz�, �e wie, co robi.
	
	AI_Output (other, self, "DIA_Lothar_Add_15_20"); //Ilu jest mistrz�w?
	AI_Output (self ,other, "DIA_Lothar_Add_01_21"); //Z tego co wiem, pi�ciu.
		
	AI_Output (self ,other, "DIA_Lothar_Add_01_62"); //Czy nie wyrazi�em si� wystarczaj�co jasno? �adnych opowie�ci o smokach!
	AI_Output (other, self, "DIA_Lothar_Add_15_63"); //Sk�d wiesz...?
	AI_Output (self ,other, "DIA_Lothar_Add_01_64"); //To nie twoja sprawa!
	AI_Output (self ,other, "DIA_Lothar_Add_01_65"); //To ostatnie ostrze�enie, zrozumiano?!
	
	AI_Output (other, self, "DIA_Lothar_Add_15_66"); //Gdzie mog� znale�� dow�dc� stra�y?
	AI_Output (other, self, "DIA_Lothar_Add_15_08"); //Jestem czeladnikiem praktykuj�cym u jednego z mistrz�w!
	
	// ------ NEWS_Modul f�r Unterstadt ------
	AI_Output (self ,other, "DIA_Lothar_Add_01_47"); //To znowu ty.

	AI_Output (self ,other, "DIA_Lothar_Add_01_43"); //S�ysza�em, �e by�e� u Lorda Andre?
	AI_Output (self ,other, "DIA_Lothar_Add_01_44"); //Powiedzia�em ci, �e do stra�y mog� wst�powa� tylko i wy��cznie obywatele miasta.

	AI_Output (self ,other, "DIA_Lothar_Add_01_48"); //Przekaza�em Lordowi Hagenowi, �e chcia�by� z nim porozmawia�...
	AI_Output (other, self, "DIA_Lothar_Add_15_49"); //No i co powiedzia�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_50"); //Nigdy o tobie nie s�ysza�.
	AI_Output (other, self, "DIA_Lothar_Add_15_51"); //Oczywi�cie, �e nie. Powiedzia�e� mu o smokach?
	AI_Output (self ,other, "DIA_Lothar_Add_01_52"); //Czy nie m�wi�em ci, �eby� sko�czy� wreszcie z tymi opowie�ciami?!

	AI_Output (self ,other, "DIA_Lothar_Add_01_12"); //S�ysza�em, �e podobno zdoby�e� ju� poparcie niekt�rych mistrz�w.
	AI_Output (self ,other, "DIA_Lothar_Add_01_13"); //Traktujesz to bardzo powa�nie, prawda?

	AI_Output (self ,other, "DIA_Lothar_Add_01_01"); //Obowi�zuj� ci� pewne przepisy, tak jak wszystkich!
	AI_Output (self ,other, "DIA_Lothar_Add_01_02"); //Lord Hagen jest nieosi�galny.
	AI_Output (self ,other, "DIA_Lothar_Add_01_03"); //Je�li faktycznie masz co� wa�nego do powiedzenia, udaj si� do Lorda Andre. On ci pomo�e.
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
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_01"); //A wi�c uda�o ci si� w ko�cu przedosta� do g�rnego miasta!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_36"); //Sk�d masz t� szat�?
		AI_Output (other, self, "DIA_Lothar_Add_15_37"); //Przeszed�em Pr�b� Ognia.
		AI_Output (self ,other, "DIA_Lothar_Add_01_38"); //Niesamowite. A wi�c to wszystko musi si� dzia� z woli Innosa...
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_39"); //Przy��czy�e� si� do Onara i jego najemnik�w, prawda?
		AI_Output (self ,other, "DIA_Lothar_Add_01_40"); //Jak si� tu dosta�e�?
		AI_Output (other, self, "DIA_Lothar_Add_15_41"); //Przychodz� z propozycj� pokojow� od Lee...
		AI_Output (self ,other, "DIA_Lothar_Add_01_42"); //E tam! Lord Hagen nigdy si� na to nie zgodzi.
	};
		
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_02"); //Panuj� tutaj pewne prawa, kt�rych musisz przestrzega�. Inaczej znajdziesz si� poza murami miasta r�wnie szybko, jak zosta�e� wpuszczony!
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_03"); //Wolno ci wchodzi� jedynie do budynk�w przeznaczonych dla handlarzy. Rozpoznasz je po znakach na drzwiach. Chc�, �eby�my si� dobrze zrozumieli.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_04"); //Inne domy nale�� do bogatych obywateli - nie masz tam czego szuka�!
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV) 
	{
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_05"); //Nawet je�li nale�ysz do zakonu Innosa.
	};
	if (other.guild == GIL_MIL)
	{	
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_06"); //Jako cz�onek stra�y masz prawo wchodzi� do pokoj�w paladyn�w.
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_07"); //Jednak twoja kwatera znajduje si� w koszarach.
	};
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_08"); //W tej dzielnicy mieszkaj� wa�ni obywatele. Traktuj ich z szacunkiem.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_09"); //Rozumiemy si�?
	AI_Output (other, self, "DIA_Lothar_HelloAgain_15_10"); //Oczywi�cie.
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
	description  = 	"Gdzie mog� znale�� Lorda Hagena?";
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
	AI_Output (other, self, "DIA_Lothar_Hagen_15_00"); //Gdzie mog� znale�� Lorda Hagena?
	AI_Output (self, other, "DIA_Lothar_Hagen_01_01"); //Przebywa w ratuszu miejskim, na samym ko�cu g�rnego miasta.
	AI_Output (self, other, "DIA_Lothar_Hagen_01_02"); //Jednak nie zostaniesz tam wpuszczony, je�li nie podasz dobrego powodu.
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
	description  = 	"Poszed�em do Lorda Hagena...";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_53"); //Poszed�em do Lorda Hagena...
	AI_Output (self ,other, "DIA_Lothar_Add_01_54"); //I co? Chyba nie zadr�cza�e� go tymi swoimi opowie�ciami o smokach, prawda?
	AI_Output (other, self, "DIA_Lothar_Add_15_55"); //Zadr�cza�em.
	AI_Output (self ,other, "DIA_Lothar_Add_01_56"); //Powiedz mi, �e nie m�wisz powa�nie...
	AI_Output (other, self, "DIA_Lothar_Add_15_57"); //Kaza� mi zdoby� jaki� dow�d.
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
	description  = 	"Mam dow�d! Oto list od kapitana Garonda!";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_59"); //Mam dow�d! Oto list od kapitana Garonda!
	AI_Output (self ,other, "DIA_Lothar_Add_01_60"); //A wi�c smoki naprawd� istniej�?
	AI_Output (self ,other, "DIA_Lothar_Add_01_61"); //By�em wobec ciebie niesprawiedliwy. Z�o�� ofiar� Innosowi, aby wybaczy� mi moje zachowanie.
	
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
	description  = 	"Czy ostatnio wydarzy�o si� tu co� niezwyk�ego?";
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
	AI_Output (other, self, "DIA_Lothar_PERM_15_00"); //Czy zdarzy�o si� tu ostatnio co� ciekawego?
	if (other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_01"); //Tak, �e wpu�cili tutaj kogo� takiego jak ty. To absolutny ewenement.
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_02"); //Chyba sam powiniene� to wiedzie� najlepiej. W ko�cu jako cz�onek stra�y, zajmujesz si� pilnowaniem porz�dku w tym mie�cie!
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





