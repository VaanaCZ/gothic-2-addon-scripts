
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Riordian_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14040_Addon_Riordian_ADW;
	nr          = 999;
	condition   = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HelloADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_HelloADW		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_HelloADW_Condition;
	information	 = 	DIA_Addon_Riordian_HelloADW_Info;

	description	 = 	"Spodziewałeś się TEGO?";
};

func int DIA_Addon_Riordian_HelloADW_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_HelloADW_15_00"); //Spodziewałeś się TEGO?
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_01"); //W żadnym wypadku. Jestem zdumiony wielkością tego miasta.
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_02"); //Większość budynków jest przysypana zwałami ziemi i kamieni, ale w całej krainie można znaleźć ruiny, które przetrwały do naszych czasów.
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_03"); //Mieszkały tu tysiące ludzi.
};

///////////////////////////////////////////////////////////////////////
//	Info WhatToFind
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_WhatToFind		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_WhatToFind_Condition;
	information	 = 	DIA_Addon_Riordian_WhatToFind_Info;

	description	 = 	"Co mogę tutaj znaleźć?";
};

func int DIA_Addon_Riordian_WhatToFind_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Riordian_HelloADW))
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_WhatToFind_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_WhatToFind_15_00"); //Co mogę tutaj znaleźć?
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_01"); //Na wschodzie, przy wielkim bagnie, znajduje się ogromna forteca.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_02"); //Z tego, co wiemy, jest tam teraz siedziba bandytów.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_03"); //Nie szedłbym tam na twoim miejscu. Mają wiele posterunków i strażników.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_04"); //Lepiej unikaj bagna, aż zdobędziesz więcej doświadczenia, albo znajdziesz sposób na uniknięcie bandytów.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_05"); //Na zachodzie znaleźliśmy paru piratów.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_06"); //Nie jestem do końca pewien, ale wydaje mi się, że nas zauważyli.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_07"); //Chyba nie przejmują się naszą obecnością.
};

///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Gegend		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_Gegend_Condition;
	information	 = 	DIA_Addon_Riordian_Gegend_Info;
	permanent	 = 	TRUE;

	description	 = 	"Opowiedz mi więcej o tej okolicy.";
};

func int DIA_Addon_Riordian_Gegend_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Riordian_WhatToFind))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
var int DIA_Addon_Riordian_Gegend_Info_OneTime;
func void DIA_Addon_Riordian_Gegend_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_Gegend_15_00"); //Opowiedz mi więcej o tej okolicy.
	AI_Output	(self, other, "DIA_Addon_Riordian_Gegend_10_01"); //Co chcesz wiedzieć?
	
	Info_ClearChoices	(DIA_Addon_Riordian_Gegend);
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, DIALOG_BACK, DIA_Addon_Riordian_Gegend_Back );
	
	if (DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_AddonWorld) == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Czy istnieje mapa tego regionu?", DIA_Addon_Riordian_Gegend_map );
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Gdzie widziałeś piratów?", DIA_Addon_Riordian_Gegend_Piraten );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Gdzie przebywają bandyci?", DIA_Addon_Riordian_Gegend_bandits );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Byłeś już na zachodzie?", DIA_Addon_Riordian_Gegend_west );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Co znajduje się na wschodzie?", DIA_Addon_Riordian_Gegend_ost );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Gdzie dojdę, idąc na południe?", DIA_Addon_Riordian_Gegend_sued );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Co znajduje się na północy?", DIA_Addon_Riordian_Gegend_nord );
};
func void DIA_Addon_Riordian_Gegend_Back ()
{
	Info_ClearChoices	(DIA_Addon_Riordian_Gegend);
};
func void DIA_Addon_Riordian_Gegend_map ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_map_15_00"); //Czy istnieje mapa tego regionu?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_map_10_01"); //Tak, narysował ją Cronos. Z pewnością ci ją przekaże.
};
func void DIA_Addon_Riordian_Gegend_bandits ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_bandits_15_00"); //Gdzie przebywają bandyci?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_01"); //Mają na wschodzie taką niby fortecę i mnóstwo posterunków.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_02"); //Aby się tam dostać, musisz przejść przez wielkie grzęzawisko.
};
func void DIA_Addon_Riordian_Gegend_Piraten ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_Piraten_15_00"); //Gdzie widziałeś piratów?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_01"); //Wałęsają się na zachodzie.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_02"); //Wydaje mi się, że na coś polowali.
};

func void DIA_Addon_Riordian_Gegend_nord ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_nord_15_00"); //Co znajduje się na północy?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_nord_10_01"); //Jeśli mogę ufać zapiskom budowniczych, znajdziesz tam wielką dolinę otoczoną wysokimi skałami.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_nord_10_02"); //Jest to sucha i pustynna okolica.
};

func void DIA_Addon_Riordian_Gegend_sued ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_sued_15_00"); //Gdzie dojdę, idąc na południe?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_sued_10_01"); //Tereny na południu są bardzo skaliste.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_sued_10_02"); //Znajdziesz tam wijące się drogi, wodospady i kamienne ruiny.
};

func void DIA_Addon_Riordian_Gegend_ost ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_ost_15_00"); //Co znajduje się na wschodzie?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_01"); //Wielkie bagno. Ten obszar jest bardzo niebezpieczny.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_02"); //Czają się tam nie tylko bandyci, ale też wyjątkowo groźne zwierzęta.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_03"); //Zachowaj ostrożność.
};
var int DIA_Addon_Riordian_Gegend_west_OneTime;
func void DIA_Addon_Riordian_Gegend_west ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_west_15_00"); //Byłeś już na zachodzie?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_01"); //Nie, ale tam na pewno jest wybrzeże.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_02"); //Podejrzewam, że piraci mają tam swój obóz.

	if (DIA_Addon_Riordian_Gegend_west_OneTime == FALSE)
	&& (Npc_HasItems (VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_03"); //Na wschodzie, niedaleko stąd, znaleźliśmy zwłoki rybaka.
		AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_04"); //Powinieneś się temu przyjrzeć.
		B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HousesOfRulers
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_HousesOfRulers		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_HousesOfRulers_Condition;
	information	 = 	DIA_Addon_Riordian_HousesOfRulers_Info;

	description	 = 	"Przysyła mnie Saturas. ";
};

func int DIA_Addon_Riordian_HousesOfRulers_Condition ()
{
	if (MIS_Saturas_LookingForHousesOfRulers == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_HousesOfRulers_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_HousesOfRulers_15_00"); //Przysyła mnie Saturas. Mam poszukać pięciu posiadłości w Jarkendarze.
	AI_Output	(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_01"); //Potrzebowałem dużo czasu, aby ustalić położenie posiadłości na podstawie zapisków budowniczych.
	AI_Output	(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_02"); //Ale teraz mogę ci je dokładnie opisać.
	MIS_Riordian_HousesOfRulers = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info WhereAreHouses
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_WhereAreHouses		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_WhereAreHouses_Condition;
	information	 = 	DIA_Addon_Riordian_WhereAreHouses_Info;

	description	 = 	"Gdzie mogę znaleźć te pięć budowli?";
};

func int DIA_Addon_Riordian_WhereAreHouses_Condition ()
{
	if (MIS_Riordian_HousesOfRulers == LOG_RUNNING)
	&& (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};
var int B_WhreAreHousesOfRulersOneTime;
func void B_WhreAreHousesOfRulers ()
{
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_00"); //Dom uczonych to wielka biblioteka. Musi być gdzieś daleko na północy.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_01"); //Dom wojowników to forteca otoczona przez skały. Leży na wschodzie.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_02"); //Domy kapłanów i strażników umarłych znajdowały się blisko siebie. Powinieneś je znaleźć na południowym zachodzie.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_03"); //Uzdrowiciele mieli swój dom leczniczy na południowym wschodzie.

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_04"); //Jeśli te budowle wciąż stoją, rozpoznasz je po architekturze.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_05"); //Są umieszczone na podwyższeniu. Strome schody prowadzą do wejścia otoczonego wysokimi kolumnami.

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_06"); //Mam nadzieję, że ci to pomoże.
	};

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Dom Uczonych to duża biblioteka. Na pewno znajduje się gdzieś na północy."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Dom Wojowników był fortecą na wschodzie, otoczoną klifami."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Kapłani i Strażnicy Umarłych mieszkali blisko siebie. Powinienem ich znaleźć na południowym zachodzie."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Dom Uzdrowicieli znajdował się na południowym wschodzie."); 
};

func void DIA_Addon_Riordian_WhereAreHouses_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_WhereAreHouses_15_00"); //Gdzie mogę znaleźć te pięć budowli?
	B_WhreAreHousesOfRulers ();
};

///////////////////////////////////////////////////////////////////////
//	Info FoundHouse
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_FoundHouse		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_FoundHouse_Condition;
	information	 = 	DIA_Addon_Riordian_FoundHouse_Info;
	permanent	 = 	TRUE;

	description	 = 	"Eee, jeśli chodzi o te budynki...";
};

func int DIA_Addon_Riordian_FoundHouse_Condition ()
{
	if (MIS_Riordian_HousesOfRulers == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Riordian_WhereAreHouses))
	&& (RiordianHousesFoundCount < 5)
		{
			return TRUE;
		};
};
var int FOUNDHOUSEINFO[6];
const int Library = 1;
const int Heiler  = 2;
const int Warrior = 3;
const int Priest  = 4;
const int Totenw  = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;
func void DIA_Addon_Riordian_FoundHouse_Info ()
{
	RiordianHouseNeuigkeit = 0;
	
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_00"); //Eee, jeśli chodzi o te budynki...
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_01"); //Tak?
	
	if (SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE)
	&& (FOUNDHOUSEINFO [Library] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_02"); //Wygląda na to, że orkowie zainteresowali się biblioteką uczonych.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_03"); //Myślisz, że mogą odczytać ten prastary język?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_04"); //Nie sądzę, ale kto wie...
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_05"); //Może lepiej upewnij się, że nie sprawią kłopotów.
		FOUNDHOUSEINFO[Library] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
		
		Log_CreateTopic (TOPIC_Addon_CanyonOrcs, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_CanyonOrcs,"Mag Wody, Riordian, wolałby, żeby orkowie zniknęli z kanionu."); 
	};
	
	if ((Npc_IsDead(StoneGuardian_Heiler)) || (Npc_HasItems (other,ItMi_Addon_Stone_04)) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE) )
	&& (FOUNDHOUSEINFO [Heiler] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_06"); //Siedziba uzdrowicieli znajduje się na środku bagna i jest broniona przez wielu kamiennych strażników.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_07"); //Ciągle stoi?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_08"); //Tak, pytanie tylko – jak długo....
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_09"); //Smuci mnie, gdy widzę świadków przeszłości w takim stanie.
		FOUNDHOUSEINFO[Heiler] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if (RavenIsInTempel == TRUE)
	&& (FOUNDHOUSEINFO [Warrior] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_10"); //Kruk wykorzystał posiadłość wojowników jako swoją kryjówkę.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_11"); //Mądry wybór.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_12"); //To podobno najbezpieczniejsza forteca, jaką można znaleźć na tym terenie.
		FOUNDHOUSEINFO[Warrior] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if ((Npc_IsDead(Minecrawler_Priest)) || (Npc_HasItems (other,ItMi_Addon_Stone_03)) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE))
	&& (FOUNDHOUSEINFO [Priest] == FALSE)//crawler
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_13"); //W domu kapłanów jest mnóstwo pełzaczy...
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_14"); //Czy to nie dziwne, że te stworzenia pojawiły się w tym regionie?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_15"); //W rzeczy samej.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_16"); //O, Adanosie! Dzieją się tu dziwne rzeczy.
		
		FOUNDHOUSEINFO[Priest] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if ((Npc_IsDead(MayaZombie04_Totenw)) || (Npc_HasItems (other,ItMi_Addon_Stone_02)) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE))
	&& (FOUNDHOUSEINFO [Totenw] == FALSE)//Zombies
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_17"); //Siedziba strażników umarłych była opanowana przez moce zła.
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_18"); //Chyba nigdy jeszcze nie widziałem w jednym miejscu tylu zombie.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_19"); //To bardzo niedobrze. Strażnicy umarłych stali się ofiarami własnych zdolności.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_20"); //Ich powiązanie ze światem umarłych okazało się bardzo szkodliwe. Mam nadzieję, że uwolnisz ich z tej udręki.
		FOUNDHOUSEINFO[Totenw] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	
	
	if (RiordianHouseNeuigkeit > 0)
	{
		var int RiordianHouseXPs;
		RiordianHouseXPs = (XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit);
		B_GivePlayerXP (RiordianHouseXPs);
		
		RiordianHousesFoundCount = (RiordianHousesFoundCount + RiordianHouseNeuigkeit);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_21"); //Przypomnij mi znowu, gdzie się znajdują budynki.
		B_WhreAreHousesOfRulers ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info OrksWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_OrksWeg		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_OrksWeg_Condition;
	information	 = 	DIA_Addon_Riordian_OrksWeg_Info;

	description	 = 	"Orkowie wkrótce przestaną się interesować tym regionem.";
};

func int DIA_Addon_Riordian_OrksWeg_Condition ()
{
	if (Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey))
	&& (FOUNDHOUSEINFO [Library] == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_OrksWeg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_00"); //Orkowie wkrótce przestaną się interesować tym regionem.
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_01"); //Czemu tak uważasz?

	if (OrcShaman_Sit_CanyonLibraryKey.aivar [AIV_KilledByPlayer] == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_02"); //Zabiłem ich przywódcę.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_03"); //Ich przywódca nie żyje.
	};
	
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_04"); //Miejmy nadzieję, że to prawda.
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_05"); //Naprawdę nie możemy sobie teraz pozwolić na tego rodzaju kłopoty.
	
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP (XP_Addon_Riordian_OrksWeg);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAllHouses
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_FoundAllHouses		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_FoundAllHouses_Condition;
	information	 = 	DIA_Addon_Riordian_FoundAllHouses_Info;

	description	 = 	"Znalazłem wszystkie posiadłości.";
};

func int DIA_Addon_Riordian_FoundAllHouses_Condition ()
{
	if (RiordianHousesFoundCount >= 5)
	&& (MIS_Riordian_HousesOfRulers == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Riordian_FoundAllHouses_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_00"); //Znalazłem wszystkie posiadłości.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_01"); //Wszystkie były tam, gdzie wskazałem?
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_02"); //Tak, mniej więcej.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_03"); //Bardzo dobrze. Więc moja praca się opłaciła.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_04"); //Dziękuję.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_FoundAllHouses);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_ADW_PreTeach		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information	 = 	DIA_Addon_Riordian_ADW_PreTeach_Info;

	description	 = 	"Możesz mnie nauczyć swych umiejętności?";
};

func int DIA_Addon_Riordian_ADW_PreTeach_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_ADW_PreTeach_15_00"); //Możesz mnie nauczyć swych umiejętności?
	AI_Output	(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_01"); //Mogę cię podszkolić w sztuce alchemii.

	if  (Npc_HasItems (other,ItAm_Addon_WispDetector))
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_02"); //Mogę ci także pokazać, jak nauczyć twojego ognika szukania przedmiotów.
	
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		Log_AddEntry		(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeach);
	};

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry	(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeachAlchemy);

	Riordian_ADW_ADDON_TeachWisp = TRUE;
	Riordian_ADW_ADDON_TeachAlchemy = TRUE;
	
};

instance DIA_Addon_Riordian_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14040_Addon_Riordian_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Riordian_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Riordian_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pokaż mi, jak wyszkolić mojego ognika.";
};
var int DIA_Addon_Riordian_ADW_Teach_NoPerm;

func int DIA_Addon_Riordian_ADW_Teach_Condition ()
{
	if (DIA_Addon_Riordian_ADW_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	&& (Riordian_ADW_ADDON_TeachWisp == TRUE)
	&& (Npc_HasItems (other,ItAm_Addon_WispDetector))
		{
			return TRUE;
		};
};
func void DIA_Addon_Riordian_ADW_Teach_Info ()
{
	B_DIA_Addon_Riordian_Teach_15_00 ();

	if ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF]	 	== FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF]		== FALSE)
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] 	== FALSE)	
	|| ( PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] 	== FALSE)	
	{                                            
		Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
		Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,DIALOG_BACK,DIA_Addon_Riordian_ADW_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01 ();
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_FF, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FF)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_NONE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_NONE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE);
		};	
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_RUNE, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_RUNE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
		&& (WISPSKILL_LEVEL >= 2)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_MAGIC, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_MAGIC)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_FOOD, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FOOD)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD);
		};
		
		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE)
		&& (WISPSKILL_LEVEL >= 3)
		{
			Info_AddChoice (DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString (NAME_ADDON_WISPSKILL_POTIONS, B_GetLearnCostTalent (other, NPC_TALENT_WISPDETECTOR, WISPSKILL_POTIONS)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS);
		};
	}
	else 
	{
		B_DIA_Addon_Riordian_Teach_10_08 ();
		DIA_Addon_Riordian_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00 ();
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF ()
{
	if B_TeachPlayerTalentWispDetector  (self, other, WISPSKILL_FF)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_NONE)
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_RUNE)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_MAGIC)
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_FOOD)
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};
FUNC VOID DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS ()
{
	if B_TeachPlayerTalentWispDetector (self, other, WISPSKILL_POTIONS)
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X ();
	};
	Info_ClearChoices (DIA_Addon_Riordian_ADW_Teach);
};


///////////////////////////////////////////////////////////////////////
//	Info TeachAlchemy
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Riordian_ADW_TeachAlchemy   (C_INFO)
{
	npc         = KDW_14040_Addon_Riordian_ADW;
	nr          = 2;
	condition   = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent   = TRUE;
	description = "Naucz mnie warzenia mikstur.";
};
//----------------------------------------
var int DIA_Riordian_ADW_TeachAlchemy_permanent;
//----------------------------------------

FUNC INT DIA_Riordian_ADW_TeachAlchemy_Condition()
{	
	if (DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE)
	&& (Riordian_ADW_ADDON_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");//Naucz mnie warzenia mikstur.

	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	{
		Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,DIALOG_BACK,DIA_Riordian_ADW_TeachAlchemy_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Esencja lecznicza", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Ekstrakt leczniczy", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Esencja many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Ekstrakt many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Eliksir many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Eliksir ducha", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Eliksir zwinności", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01"); //Możesz przygotowywać mikstury na stole alchemicznym. Znajdziesz go na piętrze w naszym domu.
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02"); //Ale potrzebna ci będzie pusta butelka, niezbędne składniki oraz umiejętność przyrządzania mikstury.
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03"); //Możesz się ode mnie nauczyć, jak to robić. Pozostałych rzeczy musisz poszukać sam.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04"); //Co chcesz przyrządzić?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05"); //Nie mogę cię nauczyć niczego nowego.
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_BACK ()
{
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Health_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};
FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Health_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Mana_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Mana_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Mana_03 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Perm_Mana ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};

FUNC VOID DIA_Riordian_ADW_TeachAlchemy_Perm_Dex ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX);
	Info_ClearChoices (DIA_Riordian_ADW_TeachAlchemy);
};





