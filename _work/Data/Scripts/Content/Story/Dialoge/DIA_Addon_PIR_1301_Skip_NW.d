
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //No, nareszcie jesteœ. Czekam ju¿ od paru godzin.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //Chwileczkê. Nie jesteœ kupcem z miasta, prawda?
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

	description	 = 	"Kim jesteœ?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //Kim jesteœ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Nie mam pojêcia, czemu mia³oby ciê to obchodziæ, ale jeœli musisz wiedzieæ, to na imiê mam Skip. Mówi ci to coœ?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //Kto?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //Nie mów, ¿e nie s³ysza³eœ o Skipie. Sk¹d ty siê w ogóle wzi¹³eœ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Jestem najbardziej poszukiwanym w Khorinis przestêpc¹. Ja i moi ch³opcy od lat grasujemy na tych wodach.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //Musia³eœ o tym s³yszeæ.
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Jesteœ piratem.", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "A powinienem ciê znaæ?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "No tak! Dopiero teraz sobie przypomnia³em.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //No tak! Dopiero teraz sobie przypomnia³em.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //Naprawdê? S³ysza³eœ o mnie?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Niech to diabli! W³aœnie zastanawia³em siê, czy nie pójœæ do miasta.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //Ca³e szczêœcie, ¿e tego nie zrobi³em.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //Stra¿nicy od razu wtr¹ciliby mnie do lochu, bez dwóch zdañ.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Chwila, chyba nie przyszed³eœ tu, ¿eby mnie aresztowaæ?!
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Taaaaa...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //To by³by twój ostatni b³¹d w ¿yciu. Ka¿dy, kto chce przeszkodziæ Skipowi, szybko staje siê ¿arciem dla rekinów.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //A powinienem ciê znaæ?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Uwa¿aj, co mówisz, ch³opcze, bo znasz Skipa tylko z dobrej strony. Módl siê, ¿ebyœ nie pozna³ go z tej z³ej.
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Jesteœ piratem.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //Tak, do cholery. Przecie¿ to widaæ od razu. Jestem te¿ nerwowy.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Jest tak potwornie nudno, ¿e a¿ chce siê gryŸæ liny.
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Myœlisz, ¿e jesteœ cholernie sprytny, co?
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //Przecie¿ mówi³em, nie?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Wygl¹da na to, ¿e ten przeklêty handlarzyna zapomnia³ o mnie.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Ech, jak ja bym chcia³, ¿eby jeszcze raz wpad³ mi w ³apy.
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Pirat Skip powiedzia³ mi, ¿e Baltram, kupiec z miasta, robi interesy z piratami."); 
	
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

	description	 = 	"Mam dla ciebie przesy³kê od Baltrama.";
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
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //Mam dla ciebie przesy³kê od Baltrama.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Co u licha? To on teraz wysy³a ch³opców na posy³ki?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Ma pe³ne gacie strachu, co? Ale czego mo¿na spodziewaæ siê po takim kiepskim kupczyku, jak on?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Mówi, ¿e chce za to trzy butelki rumu.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //A to dobre! Najpierw ka¿e mi tu czekaæ, bogowie wiedz¹ ile, a potem nie ma odwagi targowaæ siê ze mn¹ osobiœcie.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Daj mu dwie butelki. Powinno wystarczyæ.
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

	description	 = 	"Sk¹d pochodzisz?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //Sk¹d pochodzisz?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Chcesz wiedzieæ, gdzie mieœci siê nasza kryjówka?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //Nie jest to rzecz, o której chcia³bym mówiæ jakiemuœ typkowi ze Stra¿y.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Jeœli ci to powiem, to tak, jakbym poszed³ do Khorinis i odda³ siê w rêce stra¿ników.
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //Nie mam zamiaru ci o tym mówiæ. Po co masz siê krêciæ wœród nas?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //Wyspa Khorinis jest du¿a, ale jeœli nie masz kogi lub okrêtu wojennego, to i tak siê nie dostaniesz do naszej kryjówki.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //Musia³byœ te¿ znaæ drogê przez klify. Nikomu, kto nie zna tajnego przesmyku, nie uda³o siê jeszcze tamtêdy przep³yn¹æ.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //Tylko dwóch ludzi zna tê drogê, a ty nie jesteœ jednym z nich.
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

	description	 = 	"Znasz mo¿e cz³owieka z przepask¹ na oku?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Znasz mo¿e cz³owieka z przepask¹ na oku?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Znam wielu takich ludzi.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //To cz³owiek z Khorinis, który chyba zna ciê ca³kiem nieŸle.
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Niemo¿liwe. Nie znam ¿adnych szczurów l¹dowych.
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

	description	 = 	"Ostatnio zniknê³o wielu mieszkañców miasta.";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Ostatnio zniknê³o wielu mieszkañców miasta i coœ mi siê wydaje, ¿e macza³eœ w tym palce.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //Co? A niech to szlag! Ale widzisz... To nie jest takie proste.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //Wygl¹dam na handlarza ¿ywym towarem? Nie! Wo¿ê tylko towary i nie interesuje mnie, co to za ³adunek i sk¹d pochodzi.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //Woziliœmy ju¿ wiele towarów dla tych œwiñ.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //Na pocz¹tku to by³y zwyk³e rzeczy. No, czasami trochê siê szmuglowa³o...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Dopiero póŸniej dowiedzieliœmy siê, ¿e porywaj¹ tych ludzi. Nie mam zielonego pojêcia, co z nimi robi¹.
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
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //Bandyci, a kto inny? Szumowiny, które kryj¹ siê na ca³ej wyspie.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //I dzia³aj¹ nie tylko w pobli¿u Khorinis.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //O, przypomnia³em sobie w³aœnie jedno imiê. Dexter. Tak, jeden z nich na pewno nazywa siê Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Zaginieni ludzie zostali porwani na rozkaz kapitana bandytów, Dextera. Chodz¹ plotki, ¿e ukrywa siê on gdzieœ na po³udnie od farmy Onara."); 

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

	description	 = 	"'Bandyci' mówi¹ mi niewiele. Mów konkretnie. Imiona, miejsca, kontakty...";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //"Bandyci" mówi¹ mi niewiele. Mów konkretnie. Imiona, miejsca, kontakty...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //Imiona? Chcesz wiedzieæ, jak siê nazywa ich herszt? Szlag by to trafi³, pamiêta³em przecie¿... No, jak ten pies siê nazywa?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Ech, nie mogê sobie przypomnieæ. Chocia¿ jego imiê by³o krótkie i ³atwe do zapamiêtania.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Ale mogê ci powiedzieæ, gdzie go spotkaæ.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //Masz przy sobie porz¹dn¹ mapê?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //Mam tu tak¹ mapê. Mo¿e byæ?
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Ta mapa jest ju¿ ca³a zabazgrana.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //Nie.
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //W takim razie chyba muszê ci opisaæ to miejsce.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //Na wschodzie znajdziesz farmê. Jej w³aœciciel ma na imiê Onar, o ile dobrze pamiêtam.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Farma otoczona jest przez du¿e po³acie pól, a na po³udnie od niej, na wysokiej skale, wznosi siê twierdza.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //W niej znajdziesz tego cz³owieka.
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

	description	 = 	"Mam tu tak¹ mapê. Mo¿e byæ?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Mam tu tak¹ mapê. Mo¿e byæ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //Mo¿e. Zaznaczê ci, gdzie znaleŸæ tego cz³owieka.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Proszê, oto twoja mapa.
	
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

	description	 = 	"Dok¹d zawozicie tych ludzi?";
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
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //Dok¹d zawozicie tych ludzi?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Ju¿ mówi³em, ¿e nie wyjawiê ci po³o¿enia naszej tajnej przystani.
};
