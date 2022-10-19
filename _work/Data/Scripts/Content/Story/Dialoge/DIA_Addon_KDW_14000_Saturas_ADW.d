
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
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Niech ciê chroni Adanos.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Dziêki Adanosowi. Nareszcie jesteœ. Myœleliœmy, ¿e ju¿ siê nie poka¿esz.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //Co? Sk¹d siê tu wziêliœcie?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Przeszed³eœ przez portal, a my za tob¹. Wkrótce potem przybyliœmy tutaj.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Jesteœmy tu ju¿ od kilku dni.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //KILKU DNI?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Kiedy nie mogliœmy ciê nigdzie znaleŸæ, Nefarius próbowa³ ustaliæ, co siê mog³o staæ. Bez rezultatów.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //No dobrze. W koñcu jesteœ i mo¿esz rozpocz¹æ pracê.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co dzia³o siê w miêdzyczasie?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Co dzia³o siê w miêdzyczasie?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Doszliœmy do wielu wniosków.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Trzêsienia ziemi s¹ coraz silniejsze. Znajdujemy siê blisko epicentrum.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Twórcy tych starych budowli za³o¿yli tu kiedyœ miasto, które uda³o nam siê odkryæ.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Jednak z jakiegoœ powodu ich cywilizacja zosta³a zniszczona.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Mo¿emy siê jedynie domyœlaæ dlaczego.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Odkry³eœ jakieœ œlady zaginionych ludzi?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co siê dzieje z Krukiem?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //Co siê dzieje z Krukiem?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //W liœcie Kruk pisa³ o œwi¹tyni i o tym, ¿e spróbuje dostaæ siê do œrodka.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Jesteœmy pewni, ¿e chodzi o œwi¹tyniê Adanosa, któr¹ Kruk bêdzie próbowa³ zbezczeœciæ.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Trzêsienia ziemi s¹ bez w¹tpienia wynikiem rzucania bezbo¿nych czarów, maj¹cych prze³amaæ potê¿ne zaklêcie.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Bramy œwi¹tyni s¹ zamkniête magi¹, a to zaklêcie o¿ywia kamiennych stra¿ników.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Œwi¹tynia siê broni. Musimy powstrzymaæ Kruka, zanim dostanie siê do sanktuarium.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co zrobimy póŸniej?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Kruk jest by³ym magnatem, a nie magiem. ", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co Kruk chce zrobiæ w œwi¹tyni?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Co Kruk chce zrobiæ w œwi¹tyni?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder Mächtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir können davon ausgehen, dass er nichts Gutes im Schilde führt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Wiemy tylko, ¿e chodzi mu o potê¿ny artefakt, zwi¹zany z Adanosem i Beliarem.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //Na pewno nie ma dobrych zamiarów...
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Kruk jest by³ym magnatem, a nie magiem. Jak móg³by przygotowaæ taki czar?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Mo¿e to nie on. Mo¿e jakiœ mag renegat, który wype³nia jego rozkazy.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //Tak czy inaczej, MUSIMY zapobiec z³u.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Odkry³eœ jakieœ œlady zaginionych ludzi?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Zaledwie wczoraj, w ruinach na wschodzie, znaleŸliœmy zw³oki rybaka.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Wygl¹da na to, ¿e pochodzi³ z Khorinis. Powinieneœ zobaczyæ cia³o.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Co zrobimy póŸniej?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //Zostaniemy tutaj i bêdziemy dalej badali tê pradawn¹ cywilizacjê.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Stare zwoje budowniczych zawieraj¹ mnóstwo tajemnic, które musimy odkryæ – jeœli chcemy zrozumieæ, co sta³o siê w przesz³oœci.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //A teraz musisz coœ dla nas zrobiæ...
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "O co chodzi?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //O co chodzi?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Musisz znaleŸæ Kruka i powstrzymaæ go przed bezczeszczeniem œwi¹tyni Adanosa.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Mam go zabiæ?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Jeœli to jedyny sposób, by go powstrzymaæ, to... TAK! W imiê Adanosa!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Zbierz wszystkie zapiski i relikty budowniczych, które zdo³asz znaleŸæ, i przynieœ je do nas.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Musimy dowiedzieæ siê wiêcej na temat tych ludzi i tego, co ich spotka³o.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Kiedy przejrzymy zamiary Kruka, bêdziemy mogli mu przeszkodziæ.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Musisz te¿ znaleŸæ sposób na uwolnienie niewolników.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //To wszystko? Zrobiê to z zamkniêtymi oczami.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //Wiem, ¿e to nie³atwe zadanie. Zrozum, to twoja szansa na odzyskanie mojego zaufania.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Kruk bezczeœci œwi¹tyniê Adanosa. Muszê go powstrzymaæ, nawet jeœli oznacza to jego zabicie."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas chce, ¿ebym uwolni³ niewolników."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas chce, ¿ebym przyniós³ mu ka¿d¹ rzecz, która pozwoli mu poznaæ bli¿ej prastar¹ kulturê budowniczych."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "W takim razie ruszam w drogê.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //W takim razie ruszam w drogê.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Jeszcze jedno... Krukowi towarzyszy wielu bandytów.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //Podczas twojej nieobecnoœci przyjêliœmy kolejnego cz³onka Wodnego Krêgu.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Wys³aliœmy go na bagna. Nie wróci³.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //S¹dzimy, ¿e bandyci atakuj¹ ka¿dego, kto nie wygl¹da jak oni.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Za³atw sobie ich zbrojê.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //Bêdziesz móg³ podejœæ bli¿ej ich obozu, nie ryzykuj¹c, ¿e ciê zaatakuj¹.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bandyci strzelaj¹ do wszystkich, którzy nie wygl¹daj¹ jak oni. Bêdê potrzebowaæ zbroi bandytów, jeœli chcê siê do nich zbli¿yæ."); 

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

	description	 = 	"Którego to nieszczêœnika wys³a³eœ na bagna?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //Którego to nieszczêœnika wys³a³eœ na bagna?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Nazywa³ siê Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Chyba nie zaszed³ daleko.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas wys³a³ na bagna cz³owieka imieniem Lance. Boi siê jednak, ¿e nie zaszed³ daleko."); 
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

	description	 = 	"Gdzie znajdê pasuj¹c¹ na mnie zbrojê bandytów?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //Gdzie znajdê pasuj¹c¹ na mnie zbrojê bandytów?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Na zachodzie jest obóz piratów.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Z tego, co wiem, utrzymuj¹ kontakty z bandytami.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Nie s¹dzê, ¿eby ciê zaatakowali.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Mo¿e uda ci siê znaleŸæ u nich jak¹œ pomoc...

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas uwa¿a, ¿e piraci mog¹ pomóc mi zdobyæ zbrojê bandytów."); 
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

	description	 = 	"Znalaz³em cia³o Lance'a.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Znalaz³em cia³o Lance'a.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //Oby jego dusza dost¹pi³a królestwa Adanosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Uwa¿aj na siebie, synu. Nie chcê op³akiwaæ kolejnej straty.
	
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

	description	 = 	"Mam akwamarynowy pierœcieñ Lance'a.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Mam akwamarynowy pierœcieñ Lance'a.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Najlepiej oddaj mi go, zanim wpadnie w niepowo³ane rêce.
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

	description	 = 	"Jeœli chodzi o relikty...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //Jeœli chodzi o relikty...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Wydaje mi siê, ¿e mam tu coœ dla ciebie.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Mamy ju¿ podobne kamienne tablice. Te ju¿ nam siê nie przydadz¹.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Tam musi byæ coœ wiêcej.
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
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //A to mo¿ecie wykorzystaæ?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //Wygl¹da nieŸle. Gdzie to znalaz³eœ?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Saturas otrzyma³ ode mnie nastêpuj¹ce relikty:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Bandyci u¿ywaj¹ tych tabliczek jako waluty.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Na tablicach jest symbol Quarhodrona, wielkiego wojownika i dowódcy.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Jego syn – Rademes – doprowadzi³ do zag³ady ca³ego miasta.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //Phi. Za³o¿ê siê, ¿e bandyci nie maj¹ pojêcia, co wpad³o im w rêce.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Czerwon¹ kamienn¹ tablicê, któr¹ bandyci u¿ywali jako walutê. Jest na niej znak wielkiego wodza Quarhodrona."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //Tê tabliczkê znalaz³em w budynku na po³udniu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Ach! Tablica stra¿ników umar³ych. Przywo³uje duchy zmar³ych.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Zwi¹zki pomiêdzy budowniczymi i ich przodkami by³y bardzo silne.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Fioletow¹ kamienn¹ tablicê z posiad³oœci stra¿ników umar³ych na po³udniu."); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Znalaz³em tê tabliczkê w budynku na po³udniowym zachodzie.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Z tego, co na niej napisano, wynika, ¿e by³ to dom kap³anów miasta.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Najwy¿szy kap³an nazywa³ siê KHARDIMON. Nie wiemy wiele wiêcej na jego temat.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Niebiesk¹ kamienn¹ tablicê z domostwa kap³anów na po³udniowym zachodzie."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Ta tabliczka le¿a³a w budynku niedaleko wielkiego bagna.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Na pewno by³ to dom uzdrowicieli.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Nie wiemy o nich zbyt wiele. Wygl¹da na to, ¿e zniknêli pierwsi.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Zielon¹ kamienn¹ tablicê z domu uzdrowicieli w po³udniowej czêœci bagna."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Ta czêœæ le¿a³a w wielkim budynku w kanionie.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //To by³a biblioteka tego pradawnego ludu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //NajwyraŸniej jest to tablica uczonych.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Wiêkszoœæ pism, które znaleŸliœmy, jest autorstwa przywódcy Kasty Uczonych.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Co dziwne, nie zostawi³ swojego imienia na ¿adnym z pism...
				Log_AddEntry (TOPIC_Addon_Relicts,"- ¯ó³t¹ kamienn¹ tablicê z biblioteki uczonych na pó³nocy."); 
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
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Bardzo dobrze. Mamy coraz wyraŸniejszy obraz miasta, ale jeszcze nie wiemy wszystkiego.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //Na tym terenie musi byæ ukrytych piêæ takich kamiennych tablic.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //ZnajdŸ je i przynieœ do mnie.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //WeŸ to z³oto jako swe wynagrodzenie.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Mamy ju¿ wszystkie potrzebne relikty.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Odda³eœ nam wielk¹ przys³ugê. Dziêkujemy.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //To pozwoli nam wykonaæ decyduj¹cy krok w naszych badaniach.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Zobaczymy, co uda mi siê znaleŸæ.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Dobrze. Tylko siê poœpiesz. Czas ucieka.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Dobrze, ¿e jesteœ. Mamy nowe informacje, które chcemy ci przekazaæ.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Zamieniam siê w s³uch.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //Zaginione miasto nosi³o nazwê Jarkendar. Mia³o 5 w³adców, którzy wspólnie nim rz¹dzili.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Ka¿dy z w³adców mia³ posiad³oœæ, w której mieszka³ i gdzie trzyma³ swoje dobra.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Wydaje siê konieczne, abyœ w czasie poszukiwañ reliktów tej zaginionej cywilizacji stara³ siê równie¿ odnaleŸæ ich domostwa.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "A jeœli ¿adna z nich ju¿ nie istnieje?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Gdzie powinienem ich szukaæ?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Gdzie powinienem ich szukaæ?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Riordian prowadzi³ badania nad uk³adem budynków Jarkendaru.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Powie ci, gdzie s¹ te posiad³oœci.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas chce, ¿ebym poszuka³ czegoœ u¿ytecznego w posiad³oœciach budowniczych. Riordian powie mi, gdzie je znaleŸæ."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //A jeœli ¿adna z tych posiad³oœci ju¿ nie istnieje?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Jeœli nie uda ci siê znaleŸæ tych domów, to znaczy, ¿e najprawdopodobniej zosta³y zniszczone w czasie upadku miasta.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Ale jeœli wci¹¿ istniej¹, to mog¹ okazaæ siê bezcenne dla naszych badañ.
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

	description	 = 	"Po co potrzebujesz tych piêciu kamiennych tabliczek?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Po co potrzebujesz tych piêciu kamiennych tabliczek?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Zapiski, które znaleŸliœmy w ruinach, s¹ niepe³ne.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Ale pisma budowniczych wspominaj¹ o piêciu w³adcach rz¹dz¹cych miastem.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Ka¿dy z nich mia³ jedn¹ z tablic, symbol swojej w³adzy.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //S¹dzê, ¿e dziêki tym tablicom znajdziemy odpowiedzi na moje pytania.
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

	description	 = 	"Nefarius opowiedzia³ mi o potopie...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius opowiedzia³ mi o potopie...
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Przekazy g³osz¹, ¿e Adanos zst¹pi³ z nieba, aby ukaraæ niewierz¹cych i wygnaæ ich do królestwa umar³ych.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //W œwiêtym gniewie kaza³ falom morskim zalaæ budowniczych tego miasta i zmyæ ich z powierzchni.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //Bagno na wschodzie jest pozosta³oœci¹ po tych wydarzeniach.

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

	description	 = 	"Dlaczego Adanos tak siê rozgniewa³?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Dlaczego Adanos tak siê rozgniewa³?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Œwi¹tynia w tym mieœcie by³a kiedyœ wielkim, jasnym budynkiem.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Wszyscy j¹ podziwiali i modlili siê do naszego boga – Adanosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Rademes, syn dowódcy Quarhodrona, zbezczeœci³ œwi¹tyniê.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Jeden po drugim budowniczowie schodzili na œcie¿kê z³a.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Adanos nie móg³ im wybaczyæ i kraj zosta³ dotkniêty jego zemst¹.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Dlatego tak wa¿ne jest, abyœmy powstrzymali Kruka. Ma zamiar dostaæ siê do œwi¹tyni...
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

	description	 = 	"Jeœli chodzi o Kruka...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //Jeœli chodzi o Kruka...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //By³em w obozie bandytów. Kruk jest ich przywódc¹.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Aby siê do niego zbli¿yæ, muszê siê pozbyæ niektórych bandytów.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Dobrze. Powodzenia. Ale nie zapomnij, ¿e musisz siê spieszyæ.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Kruk nie mo¿e zrealizowaæ swoich planów.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Ma kopalniê z³ota i ka¿e w niej pracowaæ swoim wiêŸniom.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //To podobne do niego. Musisz uwolniæ wiêŸniów.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //Oczywiœcie. Pracujê nad tym.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Jeden z bandytów twierdzi, ¿e zna plany Kruka.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Nazywa siê Fortuno. Mówi, ¿e Kruk chce siê dostaæ do œwi¹tyni, aby zdobyæ potê¿ny artefakt.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //I co? Wie coœ wiêcej na temat tego artefaktu?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Powiedzia³ mi tylko, ¿e Kruk kaza³ rozkopaæ grób jednego z kap³anów Adanosa.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Mo¿liwe, ¿e w tym grobie jest klucz do œwi¹tyni. Powinieneœ siê tam rozejrzeæ.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Kruk kaza³ wiêŸniom rozkopaæ grobowiec.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //To niedobrze. Musisz siê pospieszyæ i pozbyæ Kruka.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //Wtargn¹³em do siedziby Kruka.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //Co z nim?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Przyby³em za póŸno. Na moich oczach znikn¹³ w œwi¹tyni Adanosa.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //Co? To TRAGEDIA! Dlaczego nie wyruszy³eœ za nim?!

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
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Przynosisz jakieœ wieœci?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Nie tym razem.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Dam ci radê – nie lekcewa¿ Kruka. Rozumiesz?
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

	description	 = 	"Nie mog³em iœæ za nim!";
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
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Nie mog³em iœæ za nim. Zablokowa³ bramê od wewn¹trz.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //Muszê pomyœleæ...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //Ciekawe, jak Kruk dosta³ siê do œwi¹tyni...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Co zrobi³, zanim przeszed³ przez portal?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Wypowiedzia³ zaklêcie przy bramie.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //A przedtem?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Otworzy³ grób.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //Ju¿ ci mówi³em...
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Dok³adnie!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //Wiem, ¿e musia³ odprawiæ jakiœ rytua³...
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //Rytua³...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //Tak! W³aœnie to!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Obawiam siê, ¿e Kruk zyska³ moc stra¿ników umar³ych.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //Zdoby³ wiedzê na temat œwi¹tyni od ducha!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Musisz udaæ siê do Myxira i mu o tym opowiedzieæ.
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Kruk posiad³ moc Stra¿nika Umar³ych i od ducha zdoby³ informacje o œwi¹tyni Adanosa. Powinienem przekazaæ te wiadomoœci Myxirowi.");  
	
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

	description	 = 	"Rozmawia³em z Quarhodronem.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Rozmawia³em z Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //I co powiedzia³?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //¯e pomo¿e mi tylko wtedy, jeœli odpowiem mu na kilka pytañ.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //W czym problem?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Nie jestem pewien, co mam mu powiedzieæ.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Hm... wiemy, ¿e uczeni z tego miasta zbudowali na pó³nocy bibliotekê.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Bardzo dok³adnie spisywali wszystkie wydarzenia przesz³oœci.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Mo¿e tam znajdziesz odpowiedzi na pytania Quarhodrona.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas s¹dzi, ¿e odpowiedzi na pytania Quarhodrona mogê znaleŸæ w bibliotece uczonych. Le¿y ona daleko na pó³nocy."); 

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

	description	 = 	"Problem z bram¹ u wejœcia do œwi¹tyni zosta³ rozwi¹zany.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Problem z bram¹ u wejœcia do œwi¹tyni zosta³ rozwi¹zany.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //Duch przemówi³?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Tak.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Wiesz, jak dostaæ siê do œwi¹tyni?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Tak. Zdradzi³ te¿, co siê w niej znajduje.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Mówi³ o potê¿nym mieczu oraz o komnatach Adanosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //Na Adanosa! Jak mogliœmy byæ tak krótkowzroczni?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //Wskazówki w tych dokumentach...
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //Tym mieczem mo¿e byæ jedynie Szpon Beliara.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Musimy jak najszybciej przejœæ przez komnaty i zdobyæ tê broñ.
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co to za Szpon Beliara?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Czym s¹ komnaty Adanosa?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Co to za Szpon Beliara?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //To wcielenie z³a. Beliar stworzy³ ten miecz w³asnorêcznie.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Ka¿dy, kto nim w³ada, posiada potê¿ne narzêdzie zniszczenia.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Im silniejszy jest w³aœciciel broni, tym wiêksza moc Szpona.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Jedynie ktoœ wielkiego ducha i silnej wiary mo¿e oprzeæ siê jego mocy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //To jasne, dlaczego budowniczowie odciêli od œwiata tê dolinê.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Przynieœli to narzêdzie z³a do swojego miasta i ulegli jego czarowi.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Chciwoœæ sprawi³a, ¿e ci aroganccy g³upcy pozabijali siê nawzajem.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Na tym siê nie skoñczy³o. Gniew Adanosa przetoczy³ siê po ca³ym kraju i wszystko zatopi³o morze.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //W rzeczy samej, twórcy portalu dobrze zrobili, ukrywaj¹c te rzeczy przed reszt¹ œwiata.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Có¿ za tragiczny koniec tak wspania³ej kultury.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //Teraz rozumiesz donios³oœæ swojej misji?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Kruk jest silnym wojownikiem zaœlepionym rz¹dz¹ w³adzy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //W jego rêku Szpon stanie siê narzêdziem zniszczenia.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Nie wolno mu dostaæ tej broni. Inaczej czeka nas zag³ada.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"W œwi¹tyni Adanosa znajduje siê potê¿na broñ, Szpon Beliara. Nie mo¿na dopuœciæ, by wpad³a w rêce Kruka."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //Czym s¹ komnaty Adanosa?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Wiem, ¿e brama ma tylko przeszkadzaæ w wejœciu do œwi¹tyni.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //Jednak w œrodku s¹ trzy komnaty, które powinny zatrzymaæ ka¿dego intruza.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Kluczem do nich s¹ kolorowe relikty budowniczych.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Jeœli zdobêdziemy wszystkie relikty i rozwi¹¿emy ich zagadki, bêdziemy mogli dostaæ siê do sanktuarium œwi¹tyni.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Nie wiem, czy Kruk rozszyfrowa³ sekrety œwi¹tyni. Jeœli tak zrobi³, to mamy du¿y problem.
	
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

	description	 = 	"Co dok³adnie powinienem zrobiæ z reliktami w œwi¹tyni?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Co dok³adnie powinienem zrobiæ z reliktami w œwi¹tyni?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Nie wiemy wiele na ten temat. Ale miejmy nadziejê, ¿e rozpoznasz ich znaczenie, kiedy dostaniesz siê do œwi¹tyni.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Naprawdê bardzo mi przykro, ¿e nie mogê bardziej ci pomóc. Teraz wszystko zale¿y od ciebie.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //WeŸ relikty i natychmiast idŸ do œwi¹tyni.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas wysy³a mnie do œwi¹tyni Adanosa z piêcioma reliktami budowniczych. Muszê przedostaæ siê przez komnaty i zatrzymaæ Kruka."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Niech Adanos zmi³uje siê nad nami i ma nas w swej opiece.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Mo¿e nie jest jeszcze za póŸno.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Trzêsienia ziemi usta³y, a ty wci¹¿ ¿yjesz.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Twoja misja powiod³a siê?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Tak. Kruk nie ¿yje.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //A wiêc wszystko siê skoñczy³o. Dziêki Adanosowi!
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Dobrze zrobi³eœ, mój synu. Jesteœmy twoimi d³u¿nikami.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Odebra³eœ s³ugom z³a potê¿n¹ broñ i przywróci³eœ równowagê w tej czêœci œwiata.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Kiedy trzêsienia ziemi usta³y, ustaliliœmy, co trzeba zrobiæ w nastêpnej kolejnoœci.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Zdob¹dŸ Szpon Beliara. Ta broñ jest tobie przeznaczona.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //W twoich rêkach powinna staæ siê naszym potê¿nym sprzymierzeñcem.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //U¿ywaj jej m¹drze, synu. Niech Adanos ci pomo¿e.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //My zostaniemy tutaj i postaramy siê, aby œwi¹tynia odzyska³a dawny blask.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Tylko Myxir wyruszy³ do Khorinis, aby wesprzeæ Vatrasa.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras zbyt d³ugo by³ sam w mieœcie.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir uda³ siê do miasta portowego, aby pomóc Vatrasowi."); 

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

	description	 = 	"Uwolni³em wiêŸniów.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Uwolni³em wiêŸniów.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Bardzo dobrze. Oby szczêœliwie dotarli do swej ojczyzny.
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

	description	 = 	"Zabra³em Szpon Beliara.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //Zabra³em Szpon Beliara.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Ale nie mogê go u¿yæ.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //Szpon Beliara to wyj¹tkowa broñ.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Ma swoj¹ duszê i w³asn¹ wolê.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //Ty, w³aœciciel tej potê¿nej broni, jesteœ jej panem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Broñ jest teraz czêœci¹ ciebie i dostosuje siê do twoich umiejêtnoœci.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Ale nie zrobi tego z w³asnej woli.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //Jedynie sam BELIAR mo¿e zmusiæ j¹, by ci s³u¿y³a.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Dlaczego Beliar mia³by mi pomóc?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Co mogê zrobiæ z t¹ broni¹?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //Co mogê zrobiæ z t¹ broni¹?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //To zale¿y od ciebie. Zdoby³eœ j¹ i jesteœ teraz jej panem.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Mogê ci jednak s³u¿yæ rad¹.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Albo przeka¿esz j¹ MNIE, a ja upewniê siê, ¿e nie spowoduje wiêcej szkód...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //...albo przyswoisz sobie jej moc i bêdziesz u¿ywaæ miecza do walki.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Nie móg³byœ przechowaæ broni?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Nie móg³byœ przechowaæ broni?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des Bösen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschließt, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Jeœli mi j¹ oddasz, sprawiê, ¿e nie bêdzie mo¿na jej u¿yæ. Nigdy wiêcej nie zostanie wykorzystana do z³ych celów.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Wiêc dok³adnie przemyœl, co zrobiæ.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Mogê przekazaæ Szpon Beliara Saturasowi albo zatrzymaæ go dla siebie."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //Dlaczego Beliar mia³by mi pomóc?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Tylko modlitwa mo¿e go przekonaæ.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Ale uwa¿aj. Beliar jest nikczemny.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Jeœli go rozwœcieczysz, odczujesz na sobie jego furiê.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Aby podporz¹dkowaæ Szpon Beliara swojej woli, muszê pomodliæ siê do Beliara.");

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
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Zostaniemy tutaj i postaramy siê, ¿eby œwi¹tynia odzyska³a sw¹ dawn¹ œwietnoœæ.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Te stare mury zbyt d³ugo sta³y w ruinie.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //A jeœli chodzi o ciebie, mój synu...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Jestem bardzo szczêœliwy, widz¹c, ¿e myli³em siê co do ciebie. Jesteœ Stra¿nikiem Równowagi. Nie ma co do tego w¹tpliwoœci.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Bez twojej si³y i odwagi wyspê Khorinis czeka³aby zag³ada. Dziêkujemy ci. Chwa³a twemu mêstwu.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Skoncentruj siê na pozosta³ych czekaj¹cych ciê zadaniach i przywróæ temu œwiatu równowagê i pokój.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //IdŸ i wype³nij swoje przeznaczenie, Stra¿niku. Bêd¹ ci towarzyszyæ nasze modlitwy.
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

	description	 = 	"WeŸ Szpon Beliara i zniszcz go.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //WeŸ Szpon Beliara i zniszcz go.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Jak sobie ¿yczysz, synu. Oddaj mi broñ.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Nie wyrz¹dzi ju¿ nikomu krzywdy, gdy zatopiê j¹ w morskich odmêtach.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //Na jej stra¿y staæ bêdzie m¹droœæ Adanosa.
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

	description	 = 	"Mo¿esz mnie nauczyæ krêgów magii?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Mo¿esz mnie nauczyæ krêgów magii?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Jesteœ magiem ognia. Co powie na to Pyrokar?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //Nie musi o tym wiedzieæ.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //Widzê, ¿e myœlisz o tym powa¿nie. Spe³niê twoj¹ proœbê.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Jeœli odniosê wra¿enie, ¿e wykorzystasz sw¹ wiedzê, aby czyniæ z³o, nie bêdziesz móg³ wiêcej na mnie liczyæ.
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
	description	 = 	"Chcê dowiedzieæ siê wiêcej o wy¿szych krêgach magii.";
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
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Chcê dowiedzieæ siê wiêcej o wy¿szych krêgach magii.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Tak, jesteœ gotów na dalsz¹ naukê.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Wst¹p do drugiego krêgu magii. Niech Adanos obdarzy ciê m¹droœci¹, byœ roztropnie u¿ywa³ swych nowych mocy.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Tak, nasta³ ku temu czas. Wst¹p do trzeciego krêgu magii.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Twoja wiedza pozwoli ci rzucaæ nowe, potê¿ne zaklêcia. U¿ywaj ich roztropnie.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //Nadszed³ ju¿ czas. Jesteœ gotów wst¹piæ do czwartego krêgu magii.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Twoje s³owa i gesty maj¹ teraz wielk¹ moc. Zawsze rozs¹dnie i uwa¿nie dobieraj nowe zaklêcia.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Masz przywilej wst¹pienia do pi¹tego krêgu magii.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Zaklêcia, których siê teraz nauczysz, maj¹ niszczycielsk¹ si³ê.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //B¹dŸ œwiadom swej wielkiej mocy i nie popadaj w samouwielbienie.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //To zadanie nie nale¿y ju¿ do mnie.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //Aby poznaæ szósty i ostatni kr¹g zaklêæ, musisz odwiedziæ klasztor, Magu Ognia.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Jest zbyt wczeœnie. Wróæ póŸniej.
	};
};

















