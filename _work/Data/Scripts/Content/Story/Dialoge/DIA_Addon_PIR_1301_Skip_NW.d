
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skip_NW_EXIT   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 999;
	condition   = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Skip_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Skip_NW_Hallo_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Skip_NW_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //No, nareszcie jesteś. Czekam już od paru godzin.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //Chwileczkę. Nie jesteś kupcem z miasta, prawda?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //Gdzie jest Baltram?
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_WerBistDu_Condition;
	information	 = 	DIA_Addon_Skip_NW_WerBistDu_Info;

	description	 = 	"Kim jesteś?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //Kim jesteś?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Nie mam pojęcia, czemu miałoby cię to obchodzić, ale jeśli musisz wiedzieć, to na imię mam Skip. Mówi ci to coś?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //Kto?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //Nie mów, że nie słyszałeś o Skipie. Skąd ty się w ogóle wziąłeś?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Jestem najbardziej poszukiwanym w Khorinis przestępcą. Ja i moi chłopcy od lat grasujemy na tych wodach.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //Musiałeś o tym słyszeć.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Jesteś piratem.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "A powinienem cię znać?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "No tak! Dopiero teraz sobie przypomniałem.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //No tak! Dopiero teraz sobie przypomniałem.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //Naprawdę? Słyszałeś o mnie?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Niech to diabli! Właśnie zastanawiałem się, czy nie pójść do miasta.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //Całe szczęście, że tego nie zrobiłem.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //Strażnicy od razu wtrąciliby mnie do lochu, bez dwóch zdań.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Chwila, chyba nie przyszedłeś tu, żeby mnie aresztować?!
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Taaaaa...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //To byłby twój ostatni błąd w życiu. Każdy, kto chce przeszkodzić Skipowi, szybko staje się żarciem dla rekinów.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //A powinienem cię znać?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Uważaj, co mówisz, chłopcze, bo znasz Skipa tylko z dobrej strony. Módl się, żebyś nie poznał go z tej złej.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Jesteś piratem.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //Tak, do cholery. Przecież to widać od razu. Jestem też nerwowy.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Jest tak potwornie nudno, że aż chce się gryźć liny.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};
///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Baltram_Condition;
	information	 = 	DIA_Addon_Skip_NW_Baltram_Info;

	description	 = 	"Baltram? Czekasz na tego kupca?";
};

func int DIA_Addon_Skip_NW_Baltram_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //Baltram? Czekasz na tego kupca?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Myślisz, że jesteś cholernie sprytny, co?
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Przecież mówiłem, nie?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Wygląda na to, że ten przeklęty handlarzyna zapomniał o mnie.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Ech, jak ja bym chciał, żeby jeszcze raz wpadł mi w łapy.
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Pirat Skip powiedział mi, że Baltram, kupiec z miasta, robi interesy z piratami."); 
	
	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_BaltramPaket_Condition;
	information	 = 	DIA_Addon_Skip_BaltramPaket_Info;

	description	 = 	"Mam dla ciebie przesyłkę od Baltrama.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition ()
{
	if (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //Mam dla ciebie przesyłkę od Baltrama.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Co u licha? To on teraz wysyła chłopców na posyłki?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Ma pełne gacie strachu, co? Ale czego można spodziewać się po takim kiepskim kupczyku, jak on?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Mówi, że chce za to trzy butelki rumu.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //A to dobre! Najpierw każe mi tu czekać, bogowie wiedzą ile, a potem nie ma odwagi targować się ze mną osobiście.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Daj mu dwie butelki. Powinno wystarczyć.
	CreateInvItems (self, ItFo_Addon_Rum, 2);									
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);

	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Woher_Condition;
	information	 = 	DIA_Addon_Skip_NW_Woher_Info;

	description	 = 	"Skąd pochodzisz?";
};

func int DIA_Addon_Skip_NW_Woher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_WerBistDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Woher_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //Skąd pochodzisz?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Chcesz wiedzieć, gdzie mieści się nasza kryjówka?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //Nie jest to rzecz, o której chciałbym mówić jakiemuś typkowi ze Straży.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Jeśli ci to powiem, to tak, jakbym poszedł do Khorinis i oddał się w ręce strażników.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //Nie mam zamiaru ci o tym mówić. Po co masz się kręcić wśród nas?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //Wyspa Khorinis jest duża, ale jeśli nie masz kogi lub okrętu wojennego, to i tak się nie dostaniesz do naszej kryjówki.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //Musiałbyś też znać drogę przez klify. Nikomu, kto nie zna tajnego przesmyku, nie udało się jeszcze tamtędy przepłynąć.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //Tylko dwóch ludzi zna tę drogę, a ty nie jesteś jednym z nich.
};


///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_SCSawGreg_Condition;
	information	 = 	DIA_Addon_Skip_SCSawGreg_Info;

	description	 = 	"Znasz może człowieka z przepaską na oku?";
};

func int DIA_Addon_Skip_SCSawGreg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_SCSawGreg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Znasz może człowieka z przepaską na oku?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Znam wielu takich ludzi.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //To człowiek z Khorinis, który chyba zna cię całkiem nieźle.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Niemożliwe. Nie znam żadnych szczurów lądowych.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Ale...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //Daj mi spokój. Nie obchodzi mnie to.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_MissingPeople_Condition;
	information	 = 	DIA_Addon_Skip_NW_MissingPeople_Info;

	description	 = 	"Ostatnio zniknęło wielu mieszkańców miasta.";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Ostatnio zniknęło wielu mieszkańców miasta i coś mi się wydaje, że maczałeś w tym palce.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //Co? A niech to szlag! Ale widzisz... To nie jest takie proste.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //Wyglądam na handlarza żywym towarem? Nie! Wożę tylko towary i nie interesuje mnie, co to za ładunek i skąd pochodzi.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //Woziliśmy już wiele towarów dla tych świń.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Na początku to były zwykłe rzeczy. No, czasami trochę się szmuglowało...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Dopiero później dowiedzieliśmy się, że porywają tych ludzi. Nie mam zielonego pojęcia, co z nimi robią.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //My ich tylko przewozimy.
};
///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Dexter_Condition;
	information	 = 	DIA_Addon_Skip_NW_Dexter_Info;

	description	 = 	"Co to za 'oni'?";
};

func int DIA_Addon_Skip_NW_Dexter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Dexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //Co to za "oni"?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //Bandyci, a kto inny? Szumowiny, które kryją się na całej wyspie.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //I działają nie tylko w pobliżu Khorinis.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //O, przypomniałem sobie właśnie jedno imię. Dexter. Tak, jeden z nich na pewno nazywa się Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Zaginieni ludzie zostali porwani na rozkaz kapitana bandytów, Dextera. Chodzą plotki, że ukrywa się on gdzieś na południe od farmy Onara."); 

	SC_KnowsDexterAsKidnapper = TRUE;			
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Name_Condition;
	information	 = 	DIA_Addon_Skip_NW_Name_Info;

	description	 = 	"'Bandyci' mówią mi niewiele. Mów konkretnie. Imiona, miejsca, kontakty...";
};

func int DIA_Addon_Skip_NW_Name_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Name_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //"Bandyci" mówią mi niewiele. Mów konkretnie. Imiona, miejsca, kontakty...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //Imiona? Chcesz wiedzieć, jak się nazywa ich herszt? Szlag by to trafił, pamiętałem przecież... No, jak ten pies się nazywa?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Ech, nie mogę sobie przypomnieć. Chociaż jego imię było krótkie i łatwe do zapamiętania.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Ale mogę ci powiedzieć, gdzie go spotkać.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //Masz przy sobie porządną mapę?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Mam tu taką mapę. Może być?
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Ta mapa jest już cała zabazgrana.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //Nie.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //W takim razie chyba muszę ci opisać to miejsce.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Na wschodzie znajdziesz farmę. Jej właściciel ma na imię Onar, o ile dobrze pamiętam.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Farma otoczona jest przez duże połacie pól, a na południe od niej, na wysokiej skale, wznosi się twierdza.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //W niej znajdziesz tego człowieka.
		B_Skip_SaysDextersName ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Landkarte_Condition;
	information	 = 	DIA_Addon_Skip_NW_Landkarte_Info;

	description	 = 	"Mam tu taką mapę. Może być?";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems (other,ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Mam tu taką mapę. Może być?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //Może. Zaznaczę ci, gdzie znaleźć tego człowieka.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Proszę, oto twoja mapa.
	
	Npc_RemoveInvItems	(self,ItWr_Map_NewWorld ,1 );
	CreateInvItems (self, ItWr_Map_NewWorld_Dexter, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Dexter, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Skip_NW_Wohin_Condition;
	information	 = 	DIA_Addon_Skip_NW_Wohin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dokąd zawozicie tych ludzi?";
};

func int DIA_Addon_Skip_NW_Wohin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Wohin_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //Dokąd zawozicie tych ludzi?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Już mówiłem, że nie wyjawię ci położenia naszej tajnej przystani.
};
