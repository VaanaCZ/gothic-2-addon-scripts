
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //No, nareszcie jeste�. Czekam ju� od paru godzin.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //Chwileczk�. Nie jeste� kupcem z miasta, prawda?
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

	description	 = 	"Kim jeste�?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //Kim jeste�?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Nie mam poj�cia, czemu mia�oby ci� to obchodzi�, ale je�li musisz wiedzie�, to na imi� mam Skip. M�wi ci to co�?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //Kto?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //Nie m�w, �e nie s�ysza�e� o Skipie. Sk�d ty si� w og�le wzi��e�?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Jestem najbardziej poszukiwanym w Khorinis przest�pc�. Ja i moi ch�opcy od lat grasujemy na tych wodach.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //Musia�e� o tym s�ysze�.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Jeste� piratem.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "A powinienem ci� zna�?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "No tak! Dopiero teraz sobie przypomnia�em.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //No tak! Dopiero teraz sobie przypomnia�em.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //Naprawd�? S�ysza�e� o mnie?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Niech to diabli! W�a�nie zastanawia�em si�, czy nie p�j�� do miasta.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //Ca�e szcz�cie, �e tego nie zrobi�em.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //Stra�nicy od razu wtr�ciliby mnie do lochu, bez dw�ch zda�.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Chwila, chyba nie przyszed�e� tu, �eby mnie aresztowa�?!
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Taaaaa...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //To by�by tw�j ostatni b��d w �yciu. Ka�dy, kto chce przeszkodzi� Skipowi, szybko staje si� �arciem dla rekin�w.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //A powinienem ci� zna�?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Uwa�aj, co m�wisz, ch�opcze, bo znasz Skipa tylko z dobrej strony. M�dl si�, �eby� nie pozna� go z tej z�ej.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Jeste� piratem.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //Tak, do cholery. Przecie� to wida� od razu. Jestem te� nerwowy.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Jest tak potwornie nudno, �e a� chce si� gry�� liny.
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //My�lisz, �e jeste� cholernie sprytny, co?
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Przecie� m�wi�em, nie?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Wygl�da na to, �e ten przekl�ty handlarzyna zapomnia� o mnie.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Ech, jak ja bym chcia�, �eby jeszcze raz wpad� mi w �apy.
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Pirat Skip powiedzia� mi, �e Baltram, kupiec z miasta, robi interesy z piratami."); 
	
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

	description	 = 	"Mam dla ciebie przesy�k� od Baltrama.";
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
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //Mam dla ciebie przesy�k� od Baltrama.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Co u licha? To on teraz wysy�a ch�opc�w na posy�ki?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Ma pe�ne gacie strachu, co? Ale czego mo�na spodziewa� si� po takim kiepskim kupczyku, jak on?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //M�wi, �e chce za to trzy butelki rumu.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //A to dobre! Najpierw ka�e mi tu czeka�, bogowie wiedz� ile, a potem nie ma odwagi targowa� si� ze mn� osobi�cie.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Daj mu dwie butelki. Powinno wystarczy�.
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

	description	 = 	"Sk�d pochodzisz?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //Sk�d pochodzisz?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Chcesz wiedzie�, gdzie mie�ci si� nasza kryj�wka?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //Nie jest to rzecz, o kt�rej chcia�bym m�wi� jakiemu� typkowi ze Stra�y.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Je�li ci to powiem, to tak, jakbym poszed� do Khorinis i odda� si� w r�ce stra�nik�w.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //Nie mam zamiaru ci o tym m�wi�. Po co masz si� kr�ci� w�r�d nas?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //Wyspa Khorinis jest du�a, ale je�li nie masz kogi lub okr�tu wojennego, to i tak si� nie dostaniesz do naszej kryj�wki.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //Musia�by� te� zna� drog� przez klify. Nikomu, kto nie zna tajnego przesmyku, nie uda�o si� jeszcze tamt�dy przep�yn��.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //Tylko dw�ch ludzi zna t� drog�, a ty nie jeste� jednym z nich.
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

	description	 = 	"Znasz mo�e cz�owieka z przepask� na oku?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Znasz mo�e cz�owieka z przepask� na oku?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Znam wielu takich ludzi.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //To cz�owiek z Khorinis, kt�ry chyba zna ci� ca�kiem nie�le.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Niemo�liwe. Nie znam �adnych szczur�w l�dowych.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Ale...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //Daj mi spok�j. Nie obchodzi mnie to.
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

	description	 = 	"Ostatnio znikn�o wielu mieszka�c�w miasta.";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Ostatnio znikn�o wielu mieszka�c�w miasta i co� mi si� wydaje, �e macza�e� w tym palce.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //Co? A niech to szlag! Ale widzisz... To nie jest takie proste.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //Wygl�dam na handlarza �ywym towarem? Nie! Wo�� tylko towary i nie interesuje mnie, co to za �adunek i sk�d pochodzi.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //Wozili�my ju� wiele towar�w dla tych �wi�.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Na pocz�tku to by�y zwyk�e rzeczy. No, czasami troch� si� szmuglowa�o...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Dopiero p�niej dowiedzieli�my si�, �e porywaj� tych ludzi. Nie mam zielonego poj�cia, co z nimi robi�.
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //Bandyci, a kto inny? Szumowiny, kt�re kryj� si� na ca�ej wyspie.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //I dzia�aj� nie tylko w pobli�u Khorinis.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //O, przypomnia�em sobie w�a�nie jedno imi�. Dexter. Tak, jeden z nich na pewno nazywa si� Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Zaginieni ludzie zostali porwani na rozkaz kapitana bandyt�w, Dextera. Chodz� plotki, �e ukrywa si� on gdzie� na po�udnie od farmy Onara."); 

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

	description	 = 	"'Bandyci' m�wi� mi niewiele. M�w konkretnie. Imiona, miejsca, kontakty...";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //"Bandyci" m�wi� mi niewiele. M�w konkretnie. Imiona, miejsca, kontakty...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //Imiona? Chcesz wiedzie�, jak si� nazywa ich herszt? Szlag by to trafi�, pami�ta�em przecie�... No, jak ten pies si� nazywa?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Ech, nie mog� sobie przypomnie�. Chocia� jego imi� by�o kr�tkie i �atwe do zapami�tania.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Ale mog� ci powiedzie�, gdzie go spotka�.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //Masz przy sobie porz�dn� map�?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Mam tu tak� map�. Mo�e by�?
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Ta mapa jest ju� ca�a zabazgrana.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //Nie.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //W takim razie chyba musz� ci opisa� to miejsce.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Na wschodzie znajdziesz farm�. Jej w�a�ciciel ma na imi� Onar, o ile dobrze pami�tam.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Farma otoczona jest przez du�e po�acie p�l, a na po�udnie od niej, na wysokiej skale, wznosi si� twierdza.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //W niej znajdziesz tego cz�owieka.
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

	description	 = 	"Mam tu tak� map�. Mo�e by�?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Mam tu tak� map�. Mo�e by�?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //Mo�e. Zaznacz� ci, gdzie znale�� tego cz�owieka.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Prosz�, oto twoja mapa.
	
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

	description	 = 	"Dok�d zawozicie tych ludzi?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //Dok�d zawozicie tych ludzi?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Ju� m�wi�em, �e nie wyjawi� ci po�o�enia naszej tajnej przystani.
};
