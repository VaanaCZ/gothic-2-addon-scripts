///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Quarhodron_EXIT   (C_INFO)
{
	npc         = NONE_ADDON_111_Quarhodron;
	nr          = 999;
	condition   = DIA_Addon_Quarhodron_EXIT_Condition;
	information = DIA_Addon_Quarhodron_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Hello		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_Hello_Condition;
	information	 = 	DIA_Addon_Quarhodron_Hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int DIA_Addon_Quarhodron_Hello_NoPerm;
func int DIA_Addon_Quarhodron_Hello_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Addon_Quarhodron_Hello_NoPerm == FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Addon_Quarhodron_Hello_Info ()
{
	IF (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_00"); //Dlaczego zak��casz m�j spok�j, stra�niku?
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_01"); //Powiedz mi, z czym do mnie przychodzisz?
		 
		Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Co znajduje si� w �wi�tyni Adanosa?", DIA_Addon_Quarhodron_Hello_schwert );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Kto� dosta� si� do �wi�tyni Adanosa.", DIA_Addon_Quarhodron_Hello_raven );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Pozw�l mi wej�� do �wi�tyni Adanosa.", DIA_Addon_Quarhodron_Hello_tempel );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Kraj rozdzieraj� trz�sienia ziemi. ", DIA_Addon_Quarhodron_Hello_erdbeben );
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems 	(hero, ItWr_Addon_SUMMONANCIENTGHOST,1); //Joly: sonst gammelt das ding unn�tz herum.
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_02"); //Bengla anthani, Osiri?
		B_Say (other, self, "$CANTUNDERSTANDTHIS");	
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_03"); //Bengla anthani?
		AI_StopProcessInfos (self);
	};
};
var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;
func void B_Quarhodron_Hello_KommZumPunkt ()
{
	if (DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3)
	&& (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Wielka m�dro�� staro�ytnych musi ci� przyt�acza�.", DIA_Addon_Quarhodron_Hello_frech );
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_erdbeben_15_00"); //Kraj rozdzieraj� trz�sienia ziemi. Je�li czego� nie zrobimy, ca�a wyspa zostanie zatopiona.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_01"); //Nic ju� nie mo�emy zrobi�.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_02"); //Na Jarkendar spad� gniew Adanosa, kt�ry zniszczy wszystkich niewiernych.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_raven ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_00"); //Kto� dosta� si� do �wi�tyni Adanosa.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_raven_11_01"); //Niemo�liwe. Sam zablokowa�em bram�. Nie mo�na jej sforsowa�.
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_02"); //Czy�by?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_tempel ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_tempel_15_00"); //Pozw�l mi wej�� do �wi�tyni Adanosa.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_tempel_11_01"); //�wi�tynia ma pozosta� zamkni�ta na ca�� wieczno��. Tak zdecydowa�a rada.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_schwert ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_schwert_15_00"); //Co znajduje si� w �wi�tyni Adanosa?
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_schwert_11_01"); //Moje najwi�ksze nieszcz�cie, moje najwi�ksze rozczarowanie.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_frech ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Hello_frech_15_00"); //Wielka m�dro�� staro�ytnych musi ci� przyt�acza�.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_01"); //Cz�owiek twojej pozycji nie mo�e si� tak do mnie zwraca�.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_02"); //Nie mog� oprze� si� wra�eniu, �e nie jeste� tym, za kogo si� podajesz.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_03"); //Je�li naprawd� potrzebujesz mej pomocy, b�dziesz musia� udowodni� swe intencje.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_04"); //Odpowiedz na moje pytania, abym mia� pewno��, �e nie wyjawi� tajemnic obcemu.
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron pomo�e mi tylko pod warunkiem, �e udowodni� swoj� warto��. Zada� mi kilka trudnych pyta�. Musz� na nie odpowiedzie�!"); 

	Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Fragen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Fragen		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_Fragen_Condition;
	information	 = 	DIA_Addon_Quarhodron_Fragen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Zadawaj swe pytania.";
};

func int DIA_Addon_Quarhodron_Fragen_Condition ()
{
	if (QuarhodronIstZufrieden == FALSE)
		{
			return TRUE;
		};
};

var int Quarhodrons_NextQuestion;
var int QuarhodronIstZufrieden;
var int Quarhodrons_RichtigeAntworten;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed ()
{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_00"); //Twoje odpowiedzi s� tak z�e, jak twoje intencje.
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_01"); //Nie pomog� ci.
		AI_StopProcessInfos (self);	
};

func void B_Quarhodron_Fragen_Choices ()
{
	Log_AddEntry  (TOPIC_Addon_Quarhodron," --- PYTANIA QUARHODRONA ---"); 

	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{
		if (Quarhodrons_NextQuestion == 1)
		&& (Quarhodrons_RichtigeAntworten == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_00"); //Nie wierz� ci.
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_01"); //Lepiej wr��, kiedy zdecydujesz si� m�wi� prawd�.
			AI_StopProcessInfos (self);
		}
		else 
		{
			if (Quarhodrons_NextQuestion == 1)
			{
				if (B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_02"); //Zdolno�ci stra�nika umar�ych pozwoli�y ci mnie obudzi�, to prawda.
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_03"); //Je�li naprawd� jeste� tym, za kogo si� podajesz, zdo�asz odpowiedzie� na wszystkie moje pytania.
					AI_Output (self, other, "DIA_Addon_Quarhodron_Add_11_00"); //Za wyj�tkiem jednego...
					
					B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
				};
				Quarhodrons_NextQuestion = 2;
			};
			
			if (Quarhodrons_NextQuestion == 7)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_04"); //Kto zamkn�� portal, by uchroni� ludzi przed z�em?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kto zamkn�� portal, by uchroni� ludzi przed z�em? ---"); 
				Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
			}
			else if (Quarhodrons_NextQuestion == 6)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_05"); //Kto �agodzi cierpienia i opiekuje si� chorymi?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kto �agodzi cierpienia i opiekuje si� chorymi? ---"); 
				Quarhodrons_NextQuestion = 7;
			}
			else if (Quarhodrons_NextQuestion == 5)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_06"); //Kto ma decyduj�cy g�os w radzie pi�ciu?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kto ma decyduj�cy g�os w radzie pi�ciu? ---"); 
				Quarhodrons_NextQuestion = 6;
			}	
			else if (Quarhodrons_NextQuestion == 4)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_07"); //Kto jest odpowiedzialny za z�o, kt�re na nas spad�o?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kto jest odpowiedzialny za z�o, kt�re na nas spad�o? ---"); 
				Quarhodrons_NextQuestion = 5;
			}
			else if (Quarhodrons_NextQuestion == 3)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_08"); //Kto mo�e wyda� mi bezpo�redni rozkaz?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kto mo�e wyda� mi bezpo�redni rozkaz? ---"); 
				Quarhodrons_NextQuestion = 4;
			}	
			else if (Quarhodrons_NextQuestion == 2)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_09"); //Kto niegdy� broni� mieszka�c�w Jarkendaru przed wrogimi atakami?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- Kto niegdy� broni� mieszka�c�w Jarkendaru przed wrogimi atakami? ---"); 
				Quarhodrons_NextQuestion = 3;
			};
			
			Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
			
			if (Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Sk�d mam to wiedzie�?", DIA_Addon_Quarhodron_Fragen_NoPlan );
			}
			else
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Nie wiem.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			};
			
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Uczeni.", DIA_Addon_Quarhodron_Fragen_gele );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Stra�nicy Umar�ych.", DIA_Addon_Quarhodron_Fragen_totenw );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Kap�ani.", DIA_Addon_Quarhodron_Fragen_prie );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Kasta Wojownik�w.", DIA_Addon_Quarhodron_Fragen_warr );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Uzdrowiciele.", DIA_Addon_Quarhodron_Fragen_heiler );
		};
	};
};
var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info ()
{
	Quarhodrons_NextQuestion 		= 0;
	Quarhodrons_RichtigeAntworten 	= 0;
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Fragen_15_00"); //Zadawaj swe pytania.
	
	if (DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_01"); //Jestem Quarhodron, dawny genera� Jarkendaru.
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_02"); //Przebudzi�e� mnie.
		
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_03"); //Do kt�rej kasty nale�ysz?

	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_warr ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_warr_15_00"); //Kasta wojownik�w.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 3)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 5)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_prie ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_prie_15_00"); //Kap�ani.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 4)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_gele ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_gele_15_00"); //Uczeni.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 6)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_totenw ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_totenw_15_00"); //Stra�nicy umar�ych.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_heiler ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_heiler_15_00"); //Uzdrowiciele.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 7)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_NoPlan ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_NoPlan_15_00"); //Nie wiem.
	
	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	&& (Quarhodrons_RichtigeAntworten >= 6) 
	{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_01"); //Dobrze. Ufam ci i udziel� pomocy.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
	}
	else if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{	
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_02"); //Wi�c nie marnuj mego czasu.
		AI_StopProcessInfos (self);	
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GibMirKey
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_GibMirKey		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_GibMirKey_Condition;
	information	 = 	DIA_Addon_Quarhodron_GibMirKey_Info;

	description	 = 	"(Za��daj klucza od �wi�tyni)";
};
func int DIA_Addon_Quarhodron_GibMirKey_Condition ()
{
	if (QuarhodronIstZufrieden == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Quarhodron_GibMirKey_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_00"); //Jaki� parszywy dra� dosta� si� do �wi�tyni Adanosa!
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_01"); //Je�li natychmiast nie wpu�cisz mnie do �wi�tyni, rozp�ta si� tu piek�o.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_02"); //Niemo�liwe! Najwy�szy kap�an Khardimon i ja jeste�my jedynymi w Jarkendarze, kt�rzy wiedz�, jak otworzy� portal w �wi�tyni Adanosa.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_03"); //C�. Wygl�da na to, �e ten Khardimon si� wygada�.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_04"); //Powtarzam, brama zosta�a otwarta. Widzia�em to na w�asne oczy.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_05"); //Dobrze. S�ysz� prawd� w twoim g�osie. Nie b�d� ju� w�tpi� w twe s�owa.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_06"); //Mam nadziej�.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_07"); //We� zatem s�owo, kt�re otworzy ci przej�cie. Zapisane jest na tej kamiennej tablicy. Wypowiedz je przy zamkni�tej bramie �wi�tyni, a stanie ona otworem.
	CreateInvItems (self, ItMi_TempelTorKey, 1);									
	B_GiveInvItems (self, other, ItMi_TempelTorKey, 1);		
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_08"); //M�j czas dobiega ko�ca. Nie mog� ci wi�cej pom�c.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_09"); //Ale strze� si�. Pami�taj o komnatach Adanosa. Albo spotka ci� pewna �mier�....
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_10"); //Zaczekaj. O co chodzi z tymi komnatami?
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_11"); //Gasn� me si�y. �egnaj. Spotkamy si� ponownie w krainie umar�ych...
	AI_StopProcessInfos (self);
	
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron da� mi kamienn� tablic�, kt�ra otwiera przej�cie do �wi�tyni Adanosa."); 
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,"Quarhodron wspomnia� o 'Komnatach Adanosa' i ostrzeg�, bym mia� si� na baczno�ci. Je�li nie chc� zgin�� w �wi�tyni Adanosa, musz� si� dowiedzie�, o co mu chodzi�o."); 

	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};


