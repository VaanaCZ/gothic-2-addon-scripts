
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14000_Addon_Saturas_ADW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Niech cię chroni Adanos.
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Saturas_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14000_Addon_Saturas_ADW;
	nr			= 900;
	condition	= DIA_Addon_Saturas_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Saturas_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Saturas_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Saturas_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) 
	&& (other.attribute[ATR_DEXTERITY] >= (31 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Saturas_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Saturas_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Saturas_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 31)
	{
		
		B_GiveInvItems (self, other, ItSc_Water01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Saturas_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWStart
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADWStart		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Saturas_ADWStart_Condition;
	information	 = 	DIA_Addon_Saturas_ADWStart_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_ADWStart_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Saturas_ADWStart_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Dzięki Adanosowi. Nareszcie jesteś. Myśleliśmy, że już się nie pokażesz.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //Co? Skąd się tu wzięliście?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Przeszedłeś przez portal, a my za tobą. Wkrótce potem przybyliśmy tutaj.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Jesteśmy tu już od kilku dni.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //KILKU DNI?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Kiedy nie mogliśmy cię nigdzie znaleźć, Nefarius próbował ustalić, co się mogło stać. Bez rezultatów.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //No dobrze. W końcu jesteś i możesz rozpocząć pracę.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co działo się w międzyczasie?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Co działo się w międzyczasie?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Doszliśmy do wielu wniosków.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Trzęsienia ziemi są coraz silniejsze. Znajdujemy się blisko epicentrum.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Twórcy tych starych budowli założyli tu kiedyś miasto, które udało nam się odkryć.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Jednak z jakiegoś powodu ich cywilizacja została zniszczona.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Możemy się jedynie domyślać dlaczego.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Odkryłeś jakieś ślady zaginionych ludzi?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co się dzieje z Krukiem?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //Co się dzieje z Krukiem?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //W liście Kruk pisał o świątyni i o tym, że spróbuje dostać się do środka.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Jesteśmy pewni, że chodzi o świątynię Adanosa, którą Kruk będzie próbował zbezcześcić.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Trzęsienia ziemi są bez wątpienia wynikiem rzucania bezbożnych czarów, mających przełamać potężne zaklęcie.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Bramy świątyni są zamknięte magią, a to zaklęcie ożywia kamiennych strażników.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Świątynia się broni. Musimy powstrzymać Kruka, zanim dostanie się do sanktuarium.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co zrobimy później?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Kruk jest byłym magnatem, a nie magiem. ", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co Kruk chce zrobić w świątyni?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Co Kruk chce zrobić w świątyni?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder Mächtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir können davon ausgehen, dass er nichts Gutes im Schilde führt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Wiemy tylko, że chodzi mu o potężny artefakt, związany z Adanosem i Beliarem.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //Na pewno nie ma dobrych zamiarów...
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Kruk jest byłym magnatem, a nie magiem. Jak mógłby przygotować taki czar?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Może to nie on. Może jakiś mag renegat, który wypełnia jego rozkazy.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //Tak czy inaczej, MUSIMY zapobiec złu.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Odkryłeś jakieś ślady zaginionych ludzi?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Zaledwie wczoraj, w ruinach na wschodzie, znaleźliśmy zwłoki rybaka.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Wygląda na to, że pochodził z Khorinis. Powinieneś zobaczyć ciało.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Co zrobimy później?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //Zostaniemy tutaj i będziemy dalej badali tę pradawną cywilizację.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Stare zwoje budowniczych zawierają mnóstwo tajemnic, które musimy odkryć – jeśli chcemy zrozumieć, co stało się w przeszłości.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //A teraz musisz coś dla nas zrobić...
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "O co chodzi?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //O co chodzi?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Musisz znaleźć Kruka i powstrzymać go przed bezczeszczeniem świątyni Adanosa.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Mam go zabić?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Jeśli to jedyny sposób, by go powstrzymać, to... TAK! W imię Adanosa!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Zbierz wszystkie zapiski i relikty budowniczych, które zdołasz znaleźć, i przynieś je do nas.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Musimy dowiedzieć się więcej na temat tych ludzi i tego, co ich spotkało.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Kiedy przejrzymy zamiary Kruka, będziemy mogli mu przeszkodzić.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Musisz też znaleźć sposób na uwolnienie niewolników.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //To wszystko? Zrobię to z zamkniętymi oczami.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //Wiem, że to niełatwe zadanie. Zrozum, to twoja szansa na odzyskanie mojego zaufania.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Kruk bezcześci świątynię Adanosa. Muszę go powstrzymać, nawet jeśli oznacza to jego zabicie."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas chce, żebym uwolnił niewolników."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas chce, żebym przyniósł mu każdą rzecz, która pozwoli mu poznać bliżej prastarą kulturę budowniczych."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "W takim razie ruszam w drogę.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //W takim razie ruszam w drogę.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Jeszcze jedno... Krukowi towarzyszy wielu bandytów.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //Podczas twojej nieobecności przyjęliśmy kolejnego członka Wodnego Kręgu.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Wysłaliśmy go na bagna. Nie wrócił.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Sądzimy, że bandyci atakują każdego, kto nie wygląda jak oni.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Załatw sobie ich zbroję.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //Będziesz mógł podejść bliżej ich obozu, nie ryzykując, że cię zaatakują.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bandyci strzelają do wszystkich, którzy nie wyglądają jak oni. Będę potrzebować zbroi bandytów, jeśli chcę się do nich zbliżyć."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info PoorRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PoorRanger		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_PoorRanger_Condition;
	information	 = 	DIA_Addon_Saturas_PoorRanger_Info;

	description	 = 	"Którego to nieszczęśnika wysłałeś na bagna?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //Którego to nieszczęśnika wysłałeś na bagna?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Nazywał się Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Chyba nie zaszedł daleko.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas wysłał na bagna człowieka imieniem Lance. Boi się jednak, że nie zaszedł daleko."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Piraten
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Piraten		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Piraten_Condition;
	information	 = 	DIA_Addon_Saturas_Piraten_Info;

	description	 = 	"Gdzie znajdę pasującą na mnie zbroję bandytów?";
};

func int DIA_Addon_Saturas_Piraten_Condition ()
{
	if (AlligatorJack.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Greg.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Piraten_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //Gdzie znajdę pasującą na mnie zbroję bandytów?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Na zachodzie jest obóz piratów.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Z tego, co wiem, utrzymują kontakty z bandytami.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Nie sądzę, żeby cię zaatakowali.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Może uda ci się znaleźć u nich jakąś pomoc...

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas uważa, że piraci mogą pomóc mi zdobyć zbroję bandytów."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LanceLeiche
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceLeiche		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_LanceLeiche_Condition;
	information	 = 	DIA_Addon_Saturas_LanceLeiche_Info;

	description	 = 	"Znalazłem ciało Lance'a.";
};

func int DIA_Addon_Saturas_LanceLeiche_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_PoorRanger))
	&& (Npc_HasItems (NONE_Addon_114_Lance_ADW, ItRi_LanceRing) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceLeiche_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Znalazłem ciało Lance'a.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //Oby jego dusza dostąpiła królestwa Adanosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Uważaj na siebie, synu. Nie chcę opłakiwać kolejnej straty.
	
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP (XP_Addon_LanceLeiche);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceRing		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_LanceRing_Condition;
	information	 = 	DIA_Addon_Saturas_LanceRing_Info;

	description	 = 	"Mam akwamarynowy pierścień Lance'a.";
};

func int DIA_Addon_Saturas_LanceRing_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_LanceLeiche))
	&& (Npc_HasItems (other,ItRi_LanceRing))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Mam akwamarynowy pierścień Lance'a.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Najlepiej oddaj mi go, zanim wpadnie w niepowołane ręce.
	B_GiveInvItems (other, self, ItRi_LanceRing, 1);		
	B_GivePlayerXP (XP_Addon_LanceRing);
};
///////////////////////////////////////////////////////////////////////
//	Info Tokens
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Tokens		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_Tokens_Condition;
	information	 = 	DIA_Addon_Saturas_Tokens_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jeśli chodzi o relikty...";
};

func int DIA_Addon_Saturas_Tokens_Condition ()
{
	if (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};

var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //Jeśli chodzi o relikty...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Wydaje mi się, że mam tu coś dla ciebie.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Mamy już podobne kamienne tablice. Te już nam się nie przydadzą.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Tam musi być coś więcej.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	
	
	var int BroughtToken;BroughtToken = 0;
	var int XP_BroughtTokens;XP_BroughtTokens = 0;
	
	if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
	{	
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //A to możecie wykorzystać?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //Wygląda nieźle. Gdzie to znalazłeś?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Saturas otrzymał ode mnie następujące relikty:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Bandyci używają tych tabliczek jako waluty.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Na tablicach jest symbol Quarhodrona, wielkiego wojownika i dowódcy.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Jego syn – Rademes – doprowadził do zagłady całego miasta.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //Phi. Założę się, że bandyci nie mają pojęcia, co wpadło im w ręce.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Czerwoną kamienną tablicę, którą bandyci używali jako walutę. Jest na niej znak wielkiego wodza Quarhodrona."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //Tę tabliczkę znalazłem w budynku na południu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Ach! Tablica strażników umarłych. Przywołuje duchy zmarłych.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Związki pomiędzy budowniczymi i ich przodkami były bardzo silne.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Fioletową kamienną tablicę z posiadłości strażników umarłych na południu."); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Znalazłem tę tabliczkę w budynku na południowym zachodzie.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Z tego, co na niej napisano, wynika, że był to dom kapłanów miasta.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Najwyższy kapłan nazywał się KHARDIMON. Nie wiemy wiele więcej na jego temat.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Niebieską kamienną tablicę z domostwa kapłanów na południowym zachodzie."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Ta tabliczka leżała w budynku niedaleko wielkiego bagna.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Na pewno był to dom uzdrowicieli.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Nie wiemy o nich zbyt wiele. Wygląda na to, że zniknęli pierwsi.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Zieloną kamienną tablicę z domu uzdrowicieli w południowej części bagna."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Ta część leżała w wielkim budynku w kanionie.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //To była biblioteka tego pradawnego ludu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Najwyraźniej jest to tablica uczonych.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Większość pism, które znaleźliśmy, jest autorstwa przywódcy Kasty Uczonych.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Co dziwne, nie zostawił swojego imienia na żadnym z pism...
				Log_AddEntry (TOPIC_Addon_Relicts,"- Żółtą kamienną tablicę z biblioteki uczonych na północy."); 
		};		 
			
			if (SC_Knows_WeaponInAdanosTempel == TRUE)
			{
			};
	
			XP_BroughtTokens = (XP_Addon_ForOneToken * BroughtToken);
	
			B_GivePlayerXP (XP_BroughtTokens);
			Saturas_BroughtTokenAmount = (Saturas_BroughtTokenAmount + BroughtToken);

		if (Saturas_BroughtTokenAmount < 5)
		{
			if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Bardzo dobrze. Mamy coraz wyraźniejszy obraz miasta, ale jeszcze nie wiemy wszystkiego.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //Na tym terenie musi być ukrytych pięć takich kamiennych tablic.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Znajdź je i przynieś do mnie.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //Weź to złoto jako swe wynagrodzenie.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Mamy już wszystkie potrzebne relikty.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Oddałeś nam wielką przysługę. Dziękujemy.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //To pozwoli nam wykonać decydujący krok w naszych badaniach.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Zobaczymy, co uda mi się znaleźć.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Dobrze. Tylko się pośpiesz. Czas ucieka.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlateHint
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_StonePlateHint		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_StonePlateHint_Condition;
	information	 = 	DIA_Addon_Saturas_StonePlateHint_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Saturas_StonePlateHint_Condition ()
{
	if ((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE))
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_StonePlateHint_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Dobrze, że jesteś. Mamy nowe informacje, które chcemy ci przekazać.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Zamieniam się w słuch.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //Zaginione miasto nosiło nazwę Jarkendar. Miało 5 władców, którzy wspólnie nim rządzili.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Każdy z władców miał posiadłość, w której mieszkał i gdzie trzymał swoje dobra.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Wydaje się konieczne, abyś w czasie poszukiwań reliktów tej zaginionej cywilizacji starał się również odnaleźć ich domostwa.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "A jeśli żadna z nich już nie istnieje?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Gdzie powinienem ich szukać?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Gdzie powinienem ich szukać?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Riordian prowadził badania nad układem budynków Jarkendaru.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Powie ci, gdzie są te posiadłości.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas chce, żebym poszukał czegoś użytecznego w posiadłościach budowniczych. Riordian powie mi, gdzie je znaleźć."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //A jeśli żadna z tych posiadłości już nie istnieje?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Jeśli nie uda ci się znaleźć tych domów, to znaczy, że najprawdopodobniej zostały zniszczone w czasie upadku miasta.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Ale jeśli wciąż istnieją, to mogą okazać się bezcenne dla naszych badań.
};

///////////////////////////////////////////////////////////////////////
//	Info SCBroughtAllToken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_SCBroughtAllToken		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Info;

	description	 = 	"Po co potrzebujesz tych pięciu kamiennych tabliczek?";
};

func int DIA_Addon_Saturas_SCBroughtAllToken_Condition ()
{
	if (ScBroughtToken == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Po co potrzebujesz tych pięciu kamiennych tabliczek?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Zapiski, które znaleźliśmy w ruinach, są niepełne.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Ale pisma budowniczych wspominają o pięciu władcach rządzących miastem.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Każdy z nich miał jedną z tablic, symbol swojej władzy.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Sądzę, że dzięki tym tablicom znajdziemy odpowiedzi na moje pytania.
};

///////////////////////////////////////////////////////////////////////
//	Info Flut
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Flut		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Flut_Condition;
	information	 = 	DIA_Addon_Saturas_Flut_Info;

	description	 = 	"Nefarius opowiedział mi o potopie...";
};

func int DIA_Addon_Saturas_Flut_Condition ()
{
	if (NefariusADW_Talk2Saturas == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Flut_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius opowiedział mi o potopie...
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Przekazy głoszą, że Adanos zstąpił z nieba, aby ukarać niewierzących i wygnać ich do królestwa umarłych.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //W świętym gniewie kazał falom morskim zalać budowniczych tego miasta i zmyć ich z powierzchni.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //Bagno na wschodzie jest pozostałością po tych wydarzeniach.

	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AdanosZorn
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_AdanosZorn		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_AdanosZorn_Condition;
	information	 = 	DIA_Addon_Saturas_AdanosZorn_Info;

	description	 = 	"Dlaczego Adanos tak się rozgniewał?";
};
func int DIA_Addon_Saturas_AdanosZorn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Flut))
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_AdanosZorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Dlaczego Adanos tak się rozgniewał?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Świątynia w tym mieście była kiedyś wielkim, jasnym budynkiem.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Wszyscy ją podziwiali i modlili się do naszego boga – Adanosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Rademes, syn dowódcy Quarhodrona, zbezcześcił świątynię.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Jeden po drugim budowniczowie schodzili na ścieżkę zła.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Adanos nie mógł im wybaczyć i kraj został dotknięty jego zemstą.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Dlatego tak ważne jest, abyśmy powstrzymali Kruka. Ma zamiar dostać się do świątyni...
};

///////////////////////////////////////////////////////////////////////
//	Info RavenInfos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavenInfos		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	9;
	condition	 = 	DIA_Addon_Saturas_RavenInfos_Condition;
	information	 = 	DIA_Addon_Saturas_RavenInfos_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jeśli chodzi o Kruka...";
};
var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;

var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_RUNNING)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavenInfos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //Jeśli chodzi o Kruka...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Byłem w obozie bandytów. Kruk jest ich przywódcą.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Aby się do niego zbliżyć, muszę się pozbyć niektórych bandytów.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Dobrze. Powodzenia. Ale nie zapomnij, że musisz się spieszyć.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Kruk nie może zrealizować swoich planów.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Ma kopalnię złota i każe w niej pracować swoim więźniom.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //To podobne do niego. Musisz uwolnić więźniów.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //Oczywiście. Pracuję nad tym.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Jeden z bandytów twierdzi, że zna plany Kruka.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Nazywa się Fortuno. Mówi, że Kruk chce się dostać do świątyni, aby zdobyć potężny artefakt.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //I co? Wie coś więcej na temat tego artefaktu?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Powiedział mi tylko, że Kruk kazał rozkopać grób jednego z kapłanów Adanosa.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Możliwe, że w tym grobie jest klucz do świątyni. Powinieneś się tam rozejrzeć.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Kruk kazał więźniom rozkopać grobowiec.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //To niedobrze. Musisz się pospieszyć i pozbyć Kruka.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //Wtargnąłem do siedziby Kruka.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //Co z nim?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Przybyłem za późno. Na moich oczach zniknął w świątyni Adanosa.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //Co? To TRAGEDIA! Dlaczego nie wyruszyłeś za nim?!

		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (RavenNeuigkeit != 0)
	{
		var int XP_RavenNeuigkeit;
		XP_RavenNeuigkeit = (RavenNeuigkeit * XP_Ambient);
		B_GivePlayerXP (XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Przynosisz jakieś wieści?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Nie tym razem.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Dam ci radę – nie lekceważ Kruka. Rozumiesz?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TuerZu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TuerZu		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TuerZu_Condition;
	information	 = 	DIA_Addon_Saturas_TuerZu_Info;

	description	 = 	"Nie mogłem iść za nim!";
};

func int DIA_Addon_Saturas_TuerZu_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TuerZu_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Nie mogłem iść za nim. Zablokował bramę od wewnątrz.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //Muszę pomyśleć...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //Ciekawe, jak Kruk dostał się do świątyni...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Co zrobił, zanim przeszedł przez portal?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Wypowiedział zaklęcie przy bramie.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //A przedtem?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Otworzył grób.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //Już ci mówiłem...
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Dokładnie!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //Wiem, że musiał odprawić jakiś rytuał...
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //Rytuał...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //Tak! Właśnie to!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Obawiam się, że Kruk zyskał moc strażników umarłych.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //Zdobył wiedzę na temat świątyni od ducha!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Musisz udać się do Myxira i mu o tym opowiedzieć.
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Kruk posiadł moc Strażnika Umarłych i od ducha zdobył informacje o świątyni Adanosa. Powinienem przekazać te wiadomości Myxirowi.");  
	
	Saturas_RiesenPlan = TRUE;	
};

///////////////////////////////////////////////////////////////////////
//	Info GhostQuestions
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_GhostQuestions		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_GhostQuestions_Condition;
	information	 = 	DIA_Addon_Saturas_GhostQuestions_Info;

	description	 = 	"Rozmawiałem z Quarhodronem.";
};
func int DIA_Addon_Saturas_GhostQuestions_Condition ()
{
	if ((Npc_IsDead(Quarhodron)) == FALSE)
	&& (SC_TalkedToGhost == TRUE) 
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_GhostQuestions_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Rozmawiałem z Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //I co powiedział?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //Że pomoże mi tylko wtedy, jeśli odpowiem mu na kilka pytań.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //W czym problem?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Nie jestem pewien, co mam mu powiedzieć.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Hm... wiemy, że uczeni z tego miasta zbudowali na północy bibliotekę.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Bardzo dokładnie spisywali wszystkie wydarzenia przeszłości.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Może tam znajdziesz odpowiedzi na pytania Quarhodrona.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas sądzi, że odpowiedzi na pytania Quarhodrona mogę znaleźć w bibliotece uczonych. Leży ona daleko na północy."); 

};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Saturas_TalkedToGhost_Info;

	description	 = 	"Problem z bramą u wejścia do świątyni został rozwiązany.";
};

func int DIA_Addon_Saturas_TalkedToGhost_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Problem z bramą u wejścia do świątyni został rozwiązany.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //Duch przemówił?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Tak.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Wiesz, jak dostać się do świątyni?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Tak. Zdradził też, co się w niej znajduje.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Mówił o potężnym mieczu oraz o komnatach Adanosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //Na Adanosa! Jak mogliśmy być tak krótkowzroczni?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //Wskazówki w tych dokumentach...
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //Tym mieczem może być jedynie Szpon Beliara.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Musimy jak najszybciej przejść przez komnaty i zdobyć tę broń.
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co to za Szpon Beliara?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Czym są komnaty Adanosa?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Co to za Szpon Beliara?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //To wcielenie zła. Beliar stworzył ten miecz własnoręcznie.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Każdy, kto nim włada, posiada potężne narzędzie zniszczenia.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Im silniejszy jest właściciel broni, tym większa moc Szpona.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Jedynie ktoś wielkiego ducha i silnej wiary może oprzeć się jego mocy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //To jasne, dlaczego budowniczowie odcięli od świata tę dolinę.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Przynieśli to narzędzie zła do swojego miasta i ulegli jego czarowi.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Chciwość sprawiła, że ci aroganccy głupcy pozabijali się nawzajem.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Na tym się nie skończyło. Gniew Adanosa przetoczył się po całym kraju i wszystko zatopiło morze.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //W rzeczy samej, twórcy portalu dobrze zrobili, ukrywając te rzeczy przed resztą świata.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Cóż za tragiczny koniec tak wspaniałej kultury.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //Teraz rozumiesz doniosłość swojej misji?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Kruk jest silnym wojownikiem zaślepionym rządzą władzy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //W jego ręku Szpon stanie się narzędziem zniszczenia.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Nie wolno mu dostać tej broni. Inaczej czeka nas zagłada.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"W świątyni Adanosa znajduje się potężna broń, Szpon Beliara. Nie można dopuścić, by wpadła w ręce Kruka."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //Czym są komnaty Adanosa?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Wiem, że brama ma tylko przeszkadzać w wejściu do świątyni.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //Jednak w środku są trzy komnaty, które powinny zatrzymać każdego intruza.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Kluczem do nich są kolorowe relikty budowniczych.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Jeśli zdobędziemy wszystkie relikty i rozwiążemy ich zagadki, będziemy mogli dostać się do sanktuarium świątyni.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Nie wiem, czy Kruk rozszyfrował sekrety świątyni. Jeśli tak zrobił, to mamy duży problem.
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,LogText_Addon_Relicts); 
	
	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,LogText_Addon_Relicts); 

	Saturas_KnowsHow2GetInTempel = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RelictsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RelictsBack		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_RelictsBack_Condition;
	information	 = 	DIA_Addon_Saturas_RelictsBack_Info;

	description	 = 	"Co dokładnie powinienem zrobić z reliktami w świątyni?";
};

func int DIA_Addon_Saturas_RelictsBack_Condition ()
{
	if (Saturas_SCBroughtAllToken == TRUE)
	&& (Saturas_KnowsHow2GetInTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_RelictsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Co dokładnie powinienem zrobić z reliktami w świątyni?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Nie wiemy wiele na ten temat. Ale miejmy nadzieję, że rozpoznasz ich znaczenie, kiedy dostaniesz się do świątyni.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Naprawdę bardzo mi przykro, że nie mogę bardziej ci pomóc. Teraz wszystko zależy od ciebie.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Weź relikty i natychmiast idź do świątyni.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas wysyła mnie do świątyni Adanosa z pięcioma reliktami budowniczych. Muszę przedostać się przez komnaty i zatrzymać Kruka."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Niech Adanos zmiłuje się nad nami i ma nas w swej opiece.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Może nie jest jeszcze za późno.
};

///////////////////////////////////////////////////////////////////////
//	Info RavensDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavensDead		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_RavensDead_Condition;
	information	 = 	DIA_Addon_Saturas_RavensDead_Info;

	important	 = 	TRUE;
};
func int DIA_Addon_Saturas_RavensDead_Condition ()
{
	if (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavensDead_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Trzęsienia ziemi ustały, a ty wciąż żyjesz.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Twoja misja powiodła się?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Tak. Kruk nie żyje.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //A więc wszystko się skończyło. Dzięki Adanosowi!
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Dobrze zrobiłeś, mój synu. Jesteśmy twoimi dłużnikami.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Odebrałeś sługom zła potężną broń i przywróciłeś równowagę w tej części świata.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Kiedy trzęsienia ziemi ustały, ustaliliśmy, co trzeba zrobić w następnej kolejności.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Zdobądź Szpon Beliara. Ta broń jest tobie przeznaczona.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //W twoich rękach powinna stać się naszym potężnym sprzymierzeńcem.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //Używaj jej mądrze, synu. Niech Adanos ci pomoże.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //My zostaniemy tutaj i postaramy się, aby świątynia odzyskała dawny blask.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Tylko Myxir wyruszył do Khorinis, aby wesprzeć Vatrasa.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras zbyt długo był sam w mieście.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir udał się do miasta portowego, aby pomóc Vatrasowi."); 

	B_GivePlayerXP (XP_Addon_Saturas_RavensDead);
};

///////////////////////////////////////////////////////////////////////
//	Info FreedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_FreedMissingPeople		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information	 = 	DIA_Addon_Saturas_FreedMissingPeople_Info;

	description	 = 	"Uwolniłem więźniów.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Uwolniłem więźniów.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Bardzo dobrze. Oby szczęśliwie dotarli do swej ojczyzny.
	B_GivePlayerXP (XP_Addon_Saturas_FreedMissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarsWeapon
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarsWeapon		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarsWeapon_Info;

	description	 = 	"Zabrałem Szpon Beliara.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info ()
{
	AI_UnequipWeapons (hero);
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //Zabrałem Szpon Beliara.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Ale nie mogę go użyć.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //Szpon Beliara to wyjątkowa broń.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Ma swoją duszę i własną wolę.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //Ty, właściciel tej potężnej broni, jesteś jej panem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Broń jest teraz częścią ciebie i dostosuje się do twoich umiejętności.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Ale nie zrobi tego z własnej woli.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //Jedynie sam BELIAR może zmusić ją, by ci służyła.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Dlaczego Beliar miałby mi pomóc?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Co mogę zrobić z tą bronią?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //Co mogę zrobić z tą bronią?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //To zależy od ciebie. Zdobyłeś ją i jesteś teraz jej panem.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Mogę ci jednak służyć radą.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Albo przekażesz ją MNIE, a ja upewnię się, że nie spowoduje więcej szkód...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //...albo przyswoisz sobie jej moc i będziesz używać miecza do walki.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Nie mógłbyś przechować broni?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Nie mógłbyś przechować broni?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des Bösen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschließt, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Jeśli mi ją oddasz, sprawię, że nie będzie można jej użyć. Nigdy więcej nie zostanie wykorzystana do złych celów.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Więc dokładnie przemyśl, co zrobić.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Mogę przekazać Szpon Beliara Saturasowi albo zatrzymać go dla siebie."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //Dlaczego Beliar miałby mi pomóc?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Tylko modlitwa może go przekonać.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Ale uważaj. Beliar jest nikczemny.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Jeśli go rozwścieczysz, odczujesz na sobie jego furię.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Aby podporządkować Szpon Beliara swojej woli, muszę pomodlić się do Beliara.");

	B_Say 	  	(other,self,"$VERSTEHE");
};

///////////////////////////////////////////////////////////////////////
//	Info PermENDE_ADDON
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PermENDE_ADDON		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co teraz zrobisz?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_RavensDead))
		{
			return TRUE;
		};
};
var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;
func void DIA_Addon_Saturas_PermENDE_ADDON_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //Co teraz zrobisz?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Zostaniemy tutaj i postaramy się, żeby świątynia odzyskała swą dawną świetność.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Te stare mury zbyt długo stały w ruinie.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //A jeśli chodzi o ciebie, mój synu...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Jestem bardzo szczęśliwy, widząc, że myliłem się co do ciebie. Jesteś Strażnikiem Równowagi. Nie ma co do tego wątpliwości.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Bez twojej siły i odwagi wyspę Khorinis czekałaby zagłada. Dziękujemy ci. Chwała twemu męstwu.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Skoncentruj się na pozostałych czekających cię zadaniach i przywróć temu światu równowagę i pokój.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Idź i wypełnij swoje przeznaczenie, Strażniku. Będą ci towarzyszyć nasze modlitwy.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarWeapGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarWeapGeben		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Info;

	description	 = 	"Weź Szpon Beliara i zniszcz go.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_BeliarsWeapon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //Weź Szpon Beliara i zniszcz go.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Jak sobie życzysz, synu. Oddaj mi broń.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Nie wyrządzi już nikomu krzywdy, gdy zatopię ją w morskich odmętach.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //Na jej straży stać będzie mądrość Adanosa.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP (XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachCircle
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_PreTeachCircle		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Info;

	description	 = 	"Możesz mnie nauczyć kręgów magii?";
};

func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Możesz mnie nauczyć kręgów magii?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Jesteś magiem ognia. Co powie na to Pyrokar?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //Nie musi o tym wiedzieć.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //Widzę, że myślisz o tym poważnie. Spełnię twoją prośbę.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Jeśli odniosę wrażenie, że wykorzystasz swą wiedzę, aby czynić zło, nie będziesz mógł więcej na mnie liczyć.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //Lepiej mnie nie rozczaruj.
	};
	Saturas_Addon_TeachCircle = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_SaturasTeach); 
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCIRCLE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_CIRCLE		(C_INFO)
{
	npc			 = 	KDW_14000_Addon_Saturas_ADW;
	nr			 = 	99;
	condition	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chcę dowiedzieć się więcej o wyższych kręgach magii.";
};
var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;
func int DIA_Addon_Saturas_ADW_CIRCLE_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) < 6)
	&& (Saturas_Addon_TeachCircle == TRUE)
	&& (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_ADW_CIRCLE_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Chcę dowiedzieć się więcej o wyższych kręgach magii.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Tak, jesteś gotów na dalszą naukę.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Wstąp do drugiego kręgu magii. Niech Adanos obdarzy cię mądrością, byś roztropnie używał swych nowych mocy.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Tak, nastał ku temu czas. Wstąp do trzeciego kręgu magii.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Twoja wiedza pozwoli ci rzucać nowe, potężne zaklęcia. Używaj ich roztropnie.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //Nadszedł już czas. Jesteś gotów wstąpić do czwartego kręgu magii.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Twoje słowa i gesty mają teraz wielką moc. Zawsze rozsądnie i uważnie dobieraj nowe zaklęcia.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Masz przywilej wstąpienia do piątego kręgu magii.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Zaklęcia, których się teraz nauczysz, mają niszczycielską siłę.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //Bądź świadom swej wielkiej mocy i nie popadaj w samouwielbienie.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //To zadanie nie należy już do mnie.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //Aby poznać szósty i ostatni krąg zaklęć, musisz odwiedzić klasztor, Magu Ognia.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Jest zbyt wcześnie. Wróć później.
	};
};

















