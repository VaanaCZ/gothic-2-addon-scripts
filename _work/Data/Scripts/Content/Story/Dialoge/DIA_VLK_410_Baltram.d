///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Baltram_EXIT   (C_INFO)
{
	npc         = VLK_410_Baltram;
	nr          = 999;
	condition   = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////AUSKOMMENTIERT WEGEN ADDON M.F. (Missionen passen nicht mehr, Spielfluß hemmend)
//	Info Sperre
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Baltram_Sperre		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	1;
	condition	 = 	DIA_Baltram_Sperre_Condition;
	information	 = 	DIA_Baltram_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	&& ((!Npc_KnowsInfo (other, DIA_Addon_Baltram_LaresAbloese))
	|| (SCIsWearingRangerRing == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Baltram_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Sperre_01_00"); //Was willst du? Du bist ein Sträfling aus der Minenkolonie. Mit dir mache ich keine Geschäfte!
	AI_StopProcessInfos (self);	 
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Hallo		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_Hallo_Condition;
	information	 = 	DIA_Baltram_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	//&& (Canthar_Sperre == FALSE)
	&& (MIS_Nagur_Bote == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Baltram_Hallo_Info ()
{
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_00"); //Witaj, przybyszu. Nazywam się Baltram. Przyszedłeś uzupełnić zapasy jedzenia?
		AI_Output (self, other, "DIA_Baltram_Hallo_01_01"); //Niestety, muszę cię rozczarować. W tej chwili nie mam zbyt wielu zapasów.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_02"); //Ale wkrótce dostanę nową dostawę.
	}
	else
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_03"); //Jeśli przyszedłeś, żeby kupić jedzenie, to możesz już odejść.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_04"); //Wy, najemnicy, nic mnie nie obchodzicie! Mam przez was tylko kłopoty.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LaresAbloese
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_LaresAbloese		(C_INFO)
{
	npc		 	= VLK_410_Baltram;
	nr		 	= 1;
	condition	= DIA_Addon_Baltram_LaresAbloese_Condition;
	information	= DIA_Addon_Baltram_LaresAbloese_Info;

	important 	= TRUE;
};

func int DIA_Addon_Baltram_LaresAbloese_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (SCIsWearingRangerRing == TRUE)
	&& (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_00"); //Skąd ten sceptycyzm?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_01"); //Widzę u ciebie znak Wodnego Kręgu.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_02"); //Jesteś jego członkiem?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_03"); //A jeśli tak?
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_04"); //To wiedz, że Laresowi marzy się zmiana pracy i odwołanie z placówki w porcie.
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_05"); //Zobaczę, czy uda mi się znaleźć kogoś, kto zechciałby go zastąpić.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_06"); //Rozumiem.
	B_GivePlayerXP (XP_Ambient);

	B_LogEntry (TOPIC_Addon_BringRangerToLares,"Baltram, kupiec z targowiska, zajmie się zorganizowaniem zastępcy dla Laresa. Może Lares NARESZCIE opuści port."); 

	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Job		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	3;
	condition	 = 	DIA_Baltram_Job_Condition;
	information	 = 	DIA_Baltram_Job_Info;
	permanent	 =  FALSE;
	description  =  "Masz dla mnie jakąś robotę?";
};
func int DIA_Baltram_Job_Condition ()
{
	if (MIS_Nagur_Bote != LOG_RUNNING)
	&& (MIS_Nagur_Bote != LOG_SUCCESS)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Baltram_Job_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Job_15_00"); //Masz dla mnie jakąś pracę?
	AI_Output (self, other, "DIA_Baltram_Job_01_01"); //Nie, mam już chłopca na posyłki. Porozmawiaj z innymi kupcami.
};
///////////////////////////////////////////////////////////////////////
//	Info Trick
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Trick		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	4;
	condition	 = 	DIA_Baltram_Trick_Condition;
	information	 = 	DIA_Baltram_Trick_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Baltram_Trick_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Trick_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Trick_01_00"); //Szukasz pracy?
	AI_Output (other, self, "DIA_Baltram_Trick_15_01"); //Jasne, a o co chodzi?
	AI_Output (self, other, "DIA_Baltram_Trick_01_02"); //Mój chłopiec na posyłki nie wrócił, a czekam na dostawę od farmera Akila.
	AI_Output (other, self, "DIA_Baltram_Trick_15_03"); //A ile na tym zarobię?
	AI_Output (self, other, "DIA_Baltram_Trick_01_04"); //Dam ci 50 sztuk złota.
	AI_Output (other, self, "DIA_Baltram_Trick_15_05"); //Świetnie, zajmę się tym.
	AI_Output (self, other, "DIA_Baltram_Trick_01_06"); //W porządku, powiedz Akilowi, że ja cię przysłałem. Dostaniesz od niego paczkę. Przynieś ją do mnie.
	
	MIS_Baltram_ScoutAkil = LOG_RUNNING;
	B_LogEntry (TOPIC_Nagur,"Baltram zatrudnił mnie jako chłopca na posyłki. Mam przynieść przesyłkę z farmy Akila.");
	
	Log_CreateTopic (TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Baltram,LOG_RUNNING);
	B_LogEntry (TOPIC_Baltram, "Jeśli przyniosę Baltramowi przesyłkę, zapłaci mi 50 sztuk złota.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Baltram_TradeLOG;
// --------------------------------------------------------------
instance DIA_Baltram_WAREZ		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_WAREZ_Condition;
	information	 = 	DIA_Baltram_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Pokaż mi swoje towary.";
};

func int DIA_Baltram_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Baltram_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Baltram_WAREZ_15_00"); //Pokaż mi swoje towary.
	
	if (Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Baltram sprzedaje na targowisku żywność.");
		Baltram_TradeLOG = TRUE;
	};
	
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_01"); //Nie powinni byli do tego dopuścić. No i jeden z najemników zamordował paladyna.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_02"); //Coś się musiało w końcu stać!
	};
	if ((MIS_BaltramTrade != LOG_SUCCESS)
	&& ((hero.guild == GIL_SLD)
	||  (hero.guild == GIL_DJG)))
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_03"); //Tacy jak ty nic ode mnie nie dostaną.
		AI_Output (other, self,"DIA_Baltram_WAREZ_15_04"); //Dlaczego?
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_05"); //Najpierw podjudzasz wieśniaków, a potem udajesz, że nic się nie stało.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_06"); //A teraz zjeżdżaj, odstraszasz mi klientów.
		
		MIS_BaltramTrade = LOG_FAILED;
		
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Skip
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_Skip		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_Skip_Condition;
	information	 = 	DIA_Addon_Baltram_Skip_Info;

	description	 = 	"Handlujesz z piratami?";
};

func int DIA_Addon_Baltram_Skip_Condition ()
{
	if (SCKnowsBaltramAsPirateTrader == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_Skip_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_00"); //Handlujesz z piratami?
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_01"); //Co? Kto tak mówi?
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_02"); //Jeden z nich... Chyba czeka na ciebie w swojej zatoczce.
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_03"); //A co miałem zrobić? Czasy są ciężkie, jakoś trzeba zarobić na chleb.
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "A nie boisz się schwytania na gorącym uczynku?", DIA_Addon_Baltram_Skip_erwischen );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "A pomyślałeś o konsekwencjach?", DIA_Addon_Baltram_Skip_MIL );
};
func void DIA_Addon_Baltram_Skip_Back ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_Back_15_00"); //Tylko tyle chciałem wiedzieć.
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_MIL_15_00"); //A pomyślałeś o konsekwencjach?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_MIL_01_01"); //Powiem ci wszystko, co wiem, a ty mnie nie zakapujesz. Umowa stoi?
	
	Info_ClearChoices (DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Czym z nimi handlujesz?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Co wiesz o piratach?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_erwischen ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_erwischen_15_00"); //A nie boisz się schwytania na gorącym uczynku?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_01"); //To możliwe - w końcu tobie udało się o tym dowiedzieć...
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_02"); //Ale nikomu nie powiesz, prawda?
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Czym z nimi handlujesz?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Co wiesz o piratach?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_was ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_was_15_00"); //Czym z nimi handlujesz?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_01"); //Z reguły dostarczam im żywność.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_02"); //W zamian otrzymuję najlepszy rum, jaki trafia do Khorinis.
	
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Tylko tyle chciałem wiedzieć.", DIA_Addon_Baltram_Skip_Back );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Mogę ci pomóc w interesach.", DIA_Addon_Baltram_Skip_Ich );
};

func void DIA_Addon_Baltram_Skip_Ich ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_Ich_15_00"); //Mogę ci pomóc w interesach.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_01"); //Niezły pomysł - ja nie mogę na razie opuszczać Khorinis.
	CreateInvItems (self, ItMi_Packet_Baltram4Skip_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Packet_Baltram4Skip_Addon, 1);		
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_02"); //Weź tę paczkę i powiedz Skipowi, żeby tym razem nie żałował rumu.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_03"); //Oczekuję co najmniej trzech butli.
	
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Baltram dał mi przesyłkę. Powinienem ją zanieść Skipowi."); 
	
	MIS_Addon_Baltram_Paket4Skip = LOG_RUNNING;
};

func void DIA_Addon_Baltram_Skip_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_pirat_15_00"); //Co wiesz o piratach?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_01"); //Zamieszkują ukrytą część wyspy.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_02"); //O ile mi wiadomo, można tam dotrzeć jedynie statkiem.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_03"); //Mieszkańcy Khorinis obawiają się piratów - i słusznie. To banda śmierdzących rzezimieszków...
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_04"); //Choć moim zdaniem i tak piraci są lepsi od bandytów.
};

///////////////////////////////////////////////////////////////////////
//	Info SkipsRum
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_SkipsRum		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_SkipsRum_Condition;
	information	 = 	DIA_Addon_Baltram_SkipsRum_Info;

	description	 = 	"Mam rum, tylko że Skip dał mi jedynie dwie butle.";
};

func int DIA_Addon_Baltram_SkipsRum_Condition ()
{
	
	if (Skip_Rum4Baltram == TRUE)
	&& (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFo_Addon_Rum) >= 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_SkipsRum_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_SkipsRum_15_00"); //Mam rum, tylko że Skip dał mi jedynie dwie butle.
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_01"); //Drogo, bardzo drogo... Za kogo się ten Skip uważa? No nic, dawaj.
	B_GiveInvItems (other, self, ItFo_Addon_Rum,2); 
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_02"); //Nie mogę dać ci zbyt wiele w zamian. To wszystko.
	CreateInvItems (self, ItMi_Gold, 10);									
	B_GiveInvItems (self, other, ItMi_Gold, 10);		

	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  4;
	condition	 = 	DIA_Baltram_AkilsHof_Condition;
	information	 = 	DIA_Baltram_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Jak trafić do gospodarstwa Akila?";
};
func int DIA_Baltram_AkilsHof_Condition ()
{
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Baltram_AkilsHof_15_00"); //Jak trafić do gospodarstwa Akila?
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_01"); //Wyjdź stąd przez wschodnią bramę i idź drogą na południowy wschód.
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_02"); //Po chwili dojdziesz do kamiennych schodów. Wejdź po nich i zobaczysz gospodarstwo Akila.
};
///////////////////////////////////////////////////////////////////////
//	Info Lieferung geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Lieferung	(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  5;
	condition	 = 	DIA_Baltram_Lieferung_Condition;
	information	 = 	DIA_Baltram_Lieferung_Info;
	permanent 	 =  FALSE;
	description	 = 	"Mam przesyłkę od Akila.";
};

func int DIA_Baltram_Lieferung_Condition ()
{
	if (Npc_HasItems (other, ItMi_BaltramPaket) >=1)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Lieferung_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Lieferung_15_00"); //Mam przesyłkę od Akila.
	AI_Output (self, other, "DIA_Baltram_Lieferung_01_01"); //Doskonale. Znowu mogę oferować świeży towar. Oto twoje 50 sztuk złota.
	
	B_GiveInvItems (other, self, ItMi_BaltramPaket,1);
	B_GiveInvItems (self, other, ItMi_Gold,50);
	
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP (XP_Baltram_ScoutAkil);
	
	Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	
	CreateInvItems (self,ItFo_Cheese	,  5); 	
	CreateInvItems (self,ItFo_Apple 	, 10); 
	CreateInvItems (self,ItFo_Beer  	,  5);
	CreateInvItems (self,ItFo_Bacon 	,  5);
	CreateInvItems (self,ItFo_Sausage	,  5);
	
};

///////////////////////////////////////////////////////////////////////
//	Info LetUsTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_LetUsTrade		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_LetUsTrade_Condition;
	information	 = 	DIA_Baltram_LetUsTrade_Info;
	permanent	 =  FALSE;
	description	 = 	"Nie możemy mimo wszystko robić wspólnie interesów?";
};
func int DIA_Baltram_LetUsTrade_Condition ()
{
	if (MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info ()
{
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_00"); //Nie możemy mimo wszystko robić wspólnie interesów?
	AI_Output (self, other, "DIA_Baltram_LetUsTrade_01_01"); //Słuchaj, jeśli dostarczysz mi 10 szynek i 10 butelek wina, to znowu ubijemy interes.
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_02"); //Zobaczę, co się da zrobić.
	
	MIS_BaltramTrade = LOG_RUNNING;
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

///////////////////////////////////////////////////////////////////////
//	Info HaveYourWarez
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_HaveYourWarez		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_HaveYourWarez_Condition;
	information	 = 	DIA_Baltram_HaveYourWarez_Info;
	permanent	 =  TRUE;
	description	 = 	"Mam to, czego chciałeś.";
};
func int DIA_Baltram_HaveYourWarez_Condition ()
{
	if (MIS_BaltramTrade == LOG_RUNNING)
	&& (MIS_BaltramTrade != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info ()
{
	AI_Output (other, self, "DIA_Baltram_HaveYourWarez_15_00"); //Mam to, czego chciałeś.
	AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_01"); //Pokaż.
	
	if (Npc_HasItems (other,ItFo_Bacon) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_02"); //Umówiliśmy się na 10 szynek. Przyjdź do mnie, jak będziesz tyle miał.
		
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};  
	if (Npc_HasItems (other,ItFo_Wine) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_03"); //A co z 10 butelkami wina? Zapomniałeś?
	
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	
	if (BaltramEnoughBacon == TRUE
	&&  BaltramEnoughWine  == TRUE)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_04"); //Hmmm, nie jest najlepsze, ale w dzisiejszych czasach nie można być zbyt wybrednym.
		
		B_GiveInvItems (other,self,ItFo_Bacon,10);
		B_GiveInvItems (other,self,ItFo_Wine,10);
		
		MIS_BaltramTrade = LOG_SUCCESS;
	
		B_GivePlayerXP (XP_BaltramTrade);
		
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_05"); //No, teraz możemy przejść do interesów.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Baltram_PICKPOCKET (C_INFO)
{
	npc			= VLK_410_Baltram;
	nr			= 900;
	condition	= DIA_Baltram_PICKPOCKET_Condition;
	information	= DIA_Baltram_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Baltram_PICKPOCKET_Condition()
{
	C_Beklauen (76, 175);
};
 
FUNC VOID DIA_Baltram_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Baltram_PICKPOCKET);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_BACK 		,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};
	
func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};



















