
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

	description	 = 	"Spodziewa³eœ siê TEGO?";
};

func int DIA_Addon_Riordian_HelloADW_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_HelloADW_15_00"); //Spodziewa³eœ siê TEGO?
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_01"); //W ¿adnym wypadku. Jestem zdumiony wielkoœci¹ tego miasta.
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_02"); //Wiêkszoœæ budynków jest przysypana zwa³ami ziemi i kamieni, ale w ca³ej krainie mo¿na znaleŸæ ruiny, które przetrwa³y do naszych czasów.
	AI_Output	(self, other, "DIA_Addon_Riordian_HelloADW_10_03"); //Mieszka³y tu tysi¹ce ludzi.
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

	description	 = 	"Co mogê tutaj znaleŸæ?";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_WhatToFind_15_00"); //Co mogê tutaj znaleŸæ?
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_01"); //Na wschodzie, przy wielkim bagnie, znajduje siê ogromna forteca.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_02"); //Z tego, co wiemy, jest tam teraz siedziba bandytów.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_03"); //Nie szed³bym tam na twoim miejscu. Maj¹ wiele posterunków i stra¿ników.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_04"); //Lepiej unikaj bagna, a¿ zdobêdziesz wiêcej doœwiadczenia, albo znajdziesz sposób na unikniêcie bandytów.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_05"); //Na zachodzie znaleŸliœmy paru piratów.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_06"); //Nie jestem do koñca pewien, ale wydaje mi siê, ¿e nas zauwa¿yli.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhatToFind_10_07"); //Chyba nie przejmuj¹ siê nasz¹ obecnoœci¹.
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

	description	 = 	"Opowiedz mi wiêcej o tej okolicy.";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_Gegend_15_00"); //Opowiedz mi wiêcej o tej okolicy.
	AI_Output	(self, other, "DIA_Addon_Riordian_Gegend_10_01"); //Co chcesz wiedzieæ?
	
	Info_ClearChoices	(DIA_Addon_Riordian_Gegend);
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, DIALOG_BACK, DIA_Addon_Riordian_Gegend_Back );
	
	if (DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_AddonWorld) == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Czy istnieje mapa tego regionu?", DIA_Addon_Riordian_Gegend_map );
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Gdzie widzia³eœ piratów?", DIA_Addon_Riordian_Gegend_Piraten );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Gdzie przebywaj¹ bandyci?", DIA_Addon_Riordian_Gegend_bandits );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "By³eœ ju¿ na zachodzie?", DIA_Addon_Riordian_Gegend_west );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Co znajduje siê na wschodzie?", DIA_Addon_Riordian_Gegend_ost );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Gdzie dojdê, id¹c na po³udnie?", DIA_Addon_Riordian_Gegend_sued );
	Info_AddChoice	(DIA_Addon_Riordian_Gegend, "Co znajduje siê na pó³nocy?", DIA_Addon_Riordian_Gegend_nord );
};
func void DIA_Addon_Riordian_Gegend_Back ()
{
	Info_ClearChoices	(DIA_Addon_Riordian_Gegend);
};
func void DIA_Addon_Riordian_Gegend_map ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_map_15_00"); //Czy istnieje mapa tego regionu?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_map_10_01"); //Tak, narysowa³ j¹ Cronos. Z pewnoœci¹ ci j¹ przeka¿e.
};
func void DIA_Addon_Riordian_Gegend_bandits ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_bandits_15_00"); //Gdzie przebywaj¹ bandyci?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_01"); //Maj¹ na wschodzie tak¹ niby fortecê i mnóstwo posterunków.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_02"); //Aby siê tam dostaæ, musisz przejœæ przez wielkie grzêzawisko.
};
func void DIA_Addon_Riordian_Gegend_Piraten ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_Piraten_15_00"); //Gdzie widzia³eœ piratów?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_01"); //Wa³êsaj¹ siê na zachodzie.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_02"); //Wydaje mi siê, ¿e na coœ polowali.
};

func void DIA_Addon_Riordian_Gegend_nord ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_nord_15_00"); //Co znajduje siê na pó³nocy?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_nord_10_01"); //Jeœli mogê ufaæ zapiskom budowniczych, znajdziesz tam wielk¹ dolinê otoczon¹ wysokimi ska³ami.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_nord_10_02"); //Jest to sucha i pustynna okolica.
};

func void DIA_Addon_Riordian_Gegend_sued ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_sued_15_00"); //Gdzie dojdê, id¹c na po³udnie?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_sued_10_01"); //Tereny na po³udniu s¹ bardzo skaliste.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_sued_10_02"); //Znajdziesz tam wij¹ce siê drogi, wodospady i kamienne ruiny.
};

func void DIA_Addon_Riordian_Gegend_ost ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_ost_15_00"); //Co znajduje siê na wschodzie?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_01"); //Wielkie bagno. Ten obszar jest bardzo niebezpieczny.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_02"); //Czaj¹ siê tam nie tylko bandyci, ale te¿ wyj¹tkowo groŸne zwierzêta.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_ost_10_03"); //Zachowaj ostro¿noœæ.
};
var int DIA_Addon_Riordian_Gegend_west_OneTime;
func void DIA_Addon_Riordian_Gegend_west ()
{
	AI_Output			(other, self, "DIA_Addon_Riordian_Gegend_west_15_00"); //By³eœ ju¿ na zachodzie?
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_01"); //Nie, ale tam na pewno jest wybrze¿e.
	AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_02"); //Podejrzewam, ¿e piraci maj¹ tam swój obóz.

	if (DIA_Addon_Riordian_Gegend_west_OneTime == FALSE)
	&& (Npc_HasItems (VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_03"); //Na wschodzie, niedaleko st¹d, znaleŸliœmy zw³oki rybaka.
		AI_Output			(self, other, "DIA_Addon_Riordian_Gegend_west_10_04"); //Powinieneœ siê temu przyjrzeæ.
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

	description	 = 	"Przysy³a mnie Saturas. ";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_HousesOfRulers_15_00"); //Przysy³a mnie Saturas. Mam poszukaæ piêciu posiad³oœci w Jarkendarze.
	AI_Output	(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_01"); //Potrzebowa³em du¿o czasu, aby ustaliæ po³o¿enie posiad³oœci na podstawie zapisków budowniczych.
	AI_Output	(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_02"); //Ale teraz mogê ci je dok³adnie opisaæ.
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

	description	 = 	"Gdzie mogê znaleŸæ te piêæ budowli?";
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
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_00"); //Dom uczonych to wielka biblioteka. Musi byæ gdzieœ daleko na pó³nocy.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_01"); //Dom wojowników to forteca otoczona przez ska³y. Le¿y na wschodzie.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_02"); //Domy kap³anów i stra¿ników umar³ych znajdowa³y siê blisko siebie. Powinieneœ je znaleŸæ na po³udniowym zachodzie.
	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_03"); //Uzdrowiciele mieli swój dom leczniczy na po³udniowym wschodzie.

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_04"); //Jeœli te budowle wci¹¿ stoj¹, rozpoznasz je po architekturze.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_05"); //S¹ umieszczone na podwy¿szeniu. Strome schody prowadz¹ do wejœcia otoczonego wysokimi kolumnami.

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_06"); //Mam nadziejê, ¿e ci to pomo¿e.
	};

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Dom Uczonych to du¿a biblioteka. Na pewno znajduje siê gdzieœ na pó³nocy."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Dom Wojowników by³ fortec¹ na wschodzie, otoczon¹ klifami."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Kap³ani i Stra¿nicy Umar³ych mieszkali blisko siebie. Powinienem ich znaleŸæ na po³udniowym zachodzie."); 
	Log_AddEntry (TOPIC_Addon_HousesOfRulers,"Dom Uzdrowicieli znajdowa³ siê na po³udniowym wschodzie."); 
};

func void DIA_Addon_Riordian_WhereAreHouses_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_WhereAreHouses_15_00"); //Gdzie mogê znaleŸæ te piêæ budowli?
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

	description	 = 	"Eee, jeœli chodzi o te budynki...";
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
	
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_00"); //Eee, jeœli chodzi o te budynki...
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_01"); //Tak?
	
	if (SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE)
	&& (FOUNDHOUSEINFO [Library] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_02"); //Wygl¹da na to, ¿e orkowie zainteresowali siê bibliotek¹ uczonych.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_03"); //Myœlisz, ¿e mog¹ odczytaæ ten prastary jêzyk?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_04"); //Nie s¹dzê, ale kto wie...
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_05"); //Mo¿e lepiej upewnij siê, ¿e nie sprawi¹ k³opotów.
		FOUNDHOUSEINFO[Library] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
		
		Log_CreateTopic (TOPIC_Addon_CanyonOrcs, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_CanyonOrcs,"Mag Wody, Riordian, wola³by, ¿eby orkowie zniknêli z kanionu."); 
	};
	
	if ((Npc_IsDead(StoneGuardian_Heiler)) || (Npc_HasItems (other,ItMi_Addon_Stone_04)) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE) )
	&& (FOUNDHOUSEINFO [Heiler] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_06"); //Siedziba uzdrowicieli znajduje siê na œrodku bagna i jest broniona przez wielu kamiennych stra¿ników.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_07"); //Ci¹gle stoi?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_08"); //Tak, pytanie tylko – jak d³ugo....
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_09"); //Smuci mnie, gdy widzê œwiadków przesz³oœci w takim stanie.
		FOUNDHOUSEINFO[Heiler] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if (RavenIsInTempel == TRUE)
	&& (FOUNDHOUSEINFO [Warrior] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_10"); //Kruk wykorzysta³ posiad³oœæ wojowników jako swoj¹ kryjówkê.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_11"); //M¹dry wybór.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_12"); //To podobno najbezpieczniejsza forteca, jak¹ mo¿na znaleŸæ na tym terenie.
		FOUNDHOUSEINFO[Warrior] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if ((Npc_IsDead(Minecrawler_Priest)) || (Npc_HasItems (other,ItMi_Addon_Stone_03)) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE))
	&& (FOUNDHOUSEINFO [Priest] == FALSE)//crawler
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_13"); //W domu kap³anów jest mnóstwo pe³zaczy...
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_14"); //Czy to nie dziwne, ¿e te stworzenia pojawi³y siê w tym regionie?
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_15"); //W rzeczy samej.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_16"); //O, Adanosie! Dziej¹ siê tu dziwne rzeczy.
		
		FOUNDHOUSEINFO[Priest] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};	

	if ((Npc_IsDead(MayaZombie04_Totenw)) || (Npc_HasItems (other,ItMi_Addon_Stone_02)) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE))
	&& (FOUNDHOUSEINFO [Totenw] == FALSE)//Zombies
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_17"); //Siedziba stra¿ników umar³ych by³a opanowana przez moce z³a.
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_18"); //Chyba nigdy jeszcze nie widzia³em w jednym miejscu tylu zombie.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_19"); //To bardzo niedobrze. Stra¿nicy umar³ych stali siê ofiarami w³asnych zdolnoœci.
		AI_Output	(self, other, "DIA_Addon_Riordian_FoundHouse_10_20"); //Ich powi¹zanie ze œwiatem umar³ych okaza³o siê bardzo szkodliwe. Mam nadziejê, ¿e uwolnisz ich z tej udrêki.
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
		AI_Output	(other, self, "DIA_Addon_Riordian_FoundHouse_15_21"); //Przypomnij mi znowu, gdzie siê znajduj¹ budynki.
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

	description	 = 	"Orkowie wkrótce przestan¹ siê interesowaæ tym regionem.";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_00"); //Orkowie wkrótce przestan¹ siê interesowaæ tym regionem.
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_01"); //Czemu tak uwa¿asz?

	if (OrcShaman_Sit_CanyonLibraryKey.aivar [AIV_KilledByPlayer] == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_02"); //Zabi³em ich przywódcê.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Riordian_OrksWeg_15_03"); //Ich przywódca nie ¿yje.
	};
	
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_04"); //Miejmy nadziejê, ¿e to prawda.
	AI_Output	(self, other, "DIA_Addon_Riordian_OrksWeg_10_05"); //Naprawdê nie mo¿emy sobie teraz pozwoliæ na tego rodzaju k³opoty.
	
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

	description	 = 	"Znalaz³em wszystkie posiad³oœci.";
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
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_00"); //Znalaz³em wszystkie posiad³oœci.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_01"); //Wszystkie by³y tam, gdzie wskaza³em?
	AI_Output	(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_02"); //Tak, mniej wiêcej.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_03"); //Bardzo dobrze. Wiêc moja praca siê op³aci³a.
	AI_Output	(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_04"); //Dziêkujê.
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

	description	 = 	"Mo¿esz mnie nauczyæ swych umiejêtnoœci?";
};

func int DIA_Addon_Riordian_ADW_PreTeach_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Riordian_ADW_PreTeach_15_00"); //Mo¿esz mnie nauczyæ swych umiejêtnoœci?
	AI_Output	(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_01"); //Mogê ciê podszkoliæ w sztuce alchemii.

	if  (Npc_HasItems (other,ItAm_Addon_WispDetector))
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_02"); //Mogê ci tak¿e pokazaæ, jak nauczyæ twojego ognika szukania przedmiotów.
	
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

	description	 = 	"Poka¿ mi, jak wyszkoliæ mojego ognika.";
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
		Info_AddChoice (DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString ("Eliksir zwinnoœci", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01"); //Mo¿esz przygotowywaæ mikstury na stole alchemicznym. Znajdziesz go na piêtrze w naszym domu.
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02"); //Ale potrzebna ci bêdzie pusta butelka, niezbêdne sk³adniki oraz umiejêtnoœæ przyrz¹dzania mikstury.
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03"); //Mo¿esz siê ode mnie nauczyæ, jak to robiæ. Pozosta³ych rzeczy musisz poszukaæ sam.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04"); //Co chcesz przyrz¹dziæ?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05"); //Nie mogê ciê nauczyæ niczego nowego.
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





