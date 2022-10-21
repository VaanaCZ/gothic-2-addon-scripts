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
		AI_Output (self, other, "DIA_Baltram_Hallo_01_00"); //Witaj, przybyszu. Nazywam siê Baltram. Przyszed³eœ uzupe³niæ zapasy jedzenia?
		AI_Output (self, other, "DIA_Baltram_Hallo_01_01"); //Niestety, muszê ciê rozczarowaæ. W tej chwili nie mam zbyt wielu zapasów.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_02"); //Ale wkrótce dostanê now¹ dostawê.
	}
	else
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_03"); //Jeœli przyszed³eœ, ¿eby kupiæ jedzenie, to mo¿esz ju¿ odejœæ.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_04"); //Wy, najemnicy, nic mnie nie obchodzicie! Mam przez was tylko k³opoty.
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
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_00"); //Sk¹d ten sceptycyzm?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_01"); //Widzê u ciebie znak Wodnego Krêgu.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_02"); //Jesteœ jego cz³onkiem?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_03"); //A jeœli tak?
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_04"); //To wiedz, ¿e Laresowi marzy siê zmiana pracy i odwo³anie z placówki w porcie.
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_05"); //Zobaczê, czy uda mi siê znaleŸæ kogoœ, kto zechcia³by go zast¹piæ.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_06"); //Rozumiem.
	B_GivePlayerXP (XP_Ambient);

	B_LogEntry (TOPIC_Addon_BringRangerToLares,"Baltram, kupiec z targowiska, zajmie siê zorganizowaniem zastêpcy dla Laresa. Mo¿e Lares NARESZCIE opuœci port."); 

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
	description  =  "Masz dla mnie jak¹œ robotê?";
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
	AI_Output (other, self, "DIA_Baltram_Job_15_00"); //Masz dla mnie jak¹œ pracê?
	AI_Output (self, other, "DIA_Baltram_Job_01_01"); //Nie, mam ju¿ ch³opca na posy³ki. Porozmawiaj z innymi kupcami.
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
	AI_Output (self, other, "DIA_Baltram_Trick_01_02"); //Mój ch³opiec na posy³ki nie wróci³, a czekam na dostawê od farmera Akila.
	AI_Output (other, self, "DIA_Baltram_Trick_15_03"); //A ile na tym zarobiê?
	AI_Output (self, other, "DIA_Baltram_Trick_01_04"); //Dam ci 50 sztuk z³ota.
	AI_Output (other, self, "DIA_Baltram_Trick_15_05"); //Œwietnie, zajmê siê tym.
	AI_Output (self, other, "DIA_Baltram_Trick_01_06"); //W porz¹dku, powiedz Akilowi, ¿e ja ciê przys³a³em. Dostaniesz od niego paczkê. Przynieœ j¹ do mnie.
	
	MIS_Baltram_ScoutAkil = LOG_RUNNING;
	B_LogEntry (TOPIC_Nagur,"Baltram zatrudni³ mnie jako ch³opca na posy³ki. Mam przynieœæ przesy³kê z farmy Akila.");
	
	Log_CreateTopic (TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Baltram,LOG_RUNNING);
	B_LogEntry (TOPIC_Baltram, "Jeœli przyniosê Baltramowi przesy³kê, zap³aci mi 50 sztuk z³ota.");
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
	description	 = 	"Poka¿ mi swoje towary.";
};

func int DIA_Baltram_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Baltram_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Baltram_WAREZ_15_00"); //Poka¿ mi swoje towary.
	
	if (Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Baltram sprzedaje na targowisku ¿ywnoœæ.");
		Baltram_TradeLOG = TRUE;
	};
	
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_01"); //Nie powinni byli do tego dopuœciæ. No i jeden z najemników zamordowa³ paladyna.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_02"); //Coœ siê musia³o w koñcu staæ!
	};
	if ((MIS_BaltramTrade != LOG_SUCCESS)
	&& ((hero.guild == GIL_SLD)
	||  (hero.guild == GIL_DJG)))
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_03"); //Tacy jak ty nic ode mnie nie dostan¹.
		AI_Output (other, self,"DIA_Baltram_WAREZ_15_04"); //Dlaczego?
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_05"); //Najpierw podjudzasz wieœniaków, a potem udajesz, ¿e nic siê nie sta³o.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_06"); //A teraz zje¿d¿aj, odstraszasz mi klientów.
		
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
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_03"); //A co mia³em zrobiæ? Czasy s¹ ciê¿kie, jakoœ trzeba zarobiæ na chleb.
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "A nie boisz siê schwytania na gor¹cym uczynku?", DIA_Addon_Baltram_Skip_erwischen );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "A pomyœla³eœ o konsekwencjach?", DIA_Addon_Baltram_Skip_MIL );
};
func void DIA_Addon_Baltram_Skip_Back ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_Back_15_00"); //Tylko tyle chcia³em wiedzieæ.
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_MIL_15_00"); //A pomyœla³eœ o konsekwencjach?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_MIL_01_01"); //Powiem ci wszystko, co wiem, a ty mnie nie zakapujesz. Umowa stoi?
	
	Info_ClearChoices (DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Czym z nimi handlujesz?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Co wiesz o piratach?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_erwischen ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_erwischen_15_00"); //A nie boisz siê schwytania na gor¹cym uczynku?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_01"); //To mo¿liwe - w koñcu tobie uda³o siê o tym dowiedzieæ...
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_02"); //Ale nikomu nie powiesz, prawda?
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Czym z nimi handlujesz?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Co wiesz o piratach?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_was ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_was_15_00"); //Czym z nimi handlujesz?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_01"); //Z regu³y dostarczam im ¿ywnoœæ.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_02"); //W zamian otrzymujê najlepszy rum, jaki trafia do Khorinis.
	
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Tylko tyle chcia³em wiedzieæ.", DIA_Addon_Baltram_Skip_Back );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Mogê ci pomóc w interesach.", DIA_Addon_Baltram_Skip_Ich );
};

func void DIA_Addon_Baltram_Skip_Ich ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_Ich_15_00"); //Mogê ci pomóc w interesach.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_01"); //Niez³y pomys³ - ja nie mogê na razie opuszczaæ Khorinis.
	CreateInvItems (self, ItMi_Packet_Baltram4Skip_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Packet_Baltram4Skip_Addon, 1);		
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_02"); //WeŸ tê paczkê i powiedz Skipowi, ¿eby tym razem nie ¿a³owa³ rumu.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_03"); //Oczekujê co najmniej trzech butli.
	
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Baltram da³ mi przesy³kê. Powinienem j¹ zanieœæ Skipowi."); 
	
	MIS_Addon_Baltram_Paket4Skip = LOG_RUNNING;
};

func void DIA_Addon_Baltram_Skip_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_pirat_15_00"); //Co wiesz o piratach?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_01"); //Zamieszkuj¹ ukryt¹ czêœæ wyspy.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_02"); //O ile mi wiadomo, mo¿na tam dotrzeæ jedynie statkiem.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_03"); //Mieszkañcy Khorinis obawiaj¹ siê piratów - i s³usznie. To banda œmierdz¹cych rzezimieszków...
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_04"); //Choæ moim zdaniem i tak piraci s¹ lepsi od bandytów.
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

	description	 = 	"Mam rum, tylko ¿e Skip da³ mi jedynie dwie butle.";
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
	AI_Output	(other, self, "DIA_Addon_Baltram_SkipsRum_15_00"); //Mam rum, tylko ¿e Skip da³ mi jedynie dwie butle.
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_01"); //Drogo, bardzo drogo... Za kogo siê ten Skip uwa¿a? No nic, dawaj.
	B_GiveInvItems (other, self, ItFo_Addon_Rum,2); 
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_02"); //Nie mogê daæ ci zbyt wiele w zamian. To wszystko.
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
	description	 = 	"Jak trafiæ do gospodarstwa Akila?";
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
	AI_Output (other, self, "DIA_Baltram_AkilsHof_15_00"); //Jak trafiæ do gospodarstwa Akila?
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_01"); //WyjdŸ st¹d przez wschodni¹ bramê i idŸ drog¹ na po³udniowy wschód.
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_02"); //Po chwili dojdziesz do kamiennych schodów. WejdŸ po nich i zobaczysz gospodarstwo Akila.
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
	description	 = 	"Mam przesy³kê od Akila.";
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
	AI_Output (other, self, "DIA_Baltram_Lieferung_15_00"); //Mam przesy³kê od Akila.
	AI_Output (self, other, "DIA_Baltram_Lieferung_01_01"); //Doskonale. Znowu mogê oferowaæ œwie¿y towar. Oto twoje 50 sztuk z³ota.
	
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
	description	 = 	"Nie mo¿emy mimo wszystko robiæ wspólnie interesów?";
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
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_00"); //Nie mo¿emy mimo wszystko robiæ wspólnie interesów?
	AI_Output (self, other, "DIA_Baltram_LetUsTrade_01_01"); //S³uchaj, jeœli dostarczysz mi 10 szynek i 10 butelek wina, to znowu ubijemy interes.
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_02"); //Zobaczê, co siê da zrobiæ.
	
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
	description	 = 	"Mam to, czego chcia³eœ.";
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
	AI_Output (other, self, "DIA_Baltram_HaveYourWarez_15_00"); //Mam to, czego chcia³eœ.
	AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_01"); //Poka¿.
	
	if (Npc_HasItems (other,ItFo_Bacon) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_02"); //Umówiliœmy siê na 10 szynek. PrzyjdŸ do mnie, jak bêdziesz tyle mia³.
		
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};  
	if (Npc_HasItems (other,ItFo_Wine) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_03"); //A co z 10 butelkami wina? Zapomnia³eœ?
	
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	
	if (BaltramEnoughBacon == TRUE
	&&  BaltramEnoughWine  == TRUE)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_04"); //Hmmm, nie jest najlepsze, ale w dzisiejszych czasach nie mo¿na byæ zbyt wybrednym.
		
		B_GiveInvItems (other,self,ItFo_Bacon,10);
		B_GiveInvItems (other,self,ItFo_Wine,10);
		
		MIS_BaltramTrade = LOG_SUCCESS;
	
		B_GivePlayerXP (XP_BaltramTrade);
		
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_05"); //No, teraz mo¿emy przejœæ do interesów.
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



















