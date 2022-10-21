
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
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Niech ci� chroni Adanos.
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
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
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
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Dzi�ki Adanosowi. Nareszcie jeste�. My�leli�my, �e ju� si� nie poka�esz.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //Co? Sk�d si� tu wzi�li�cie?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Przeszed�e� przez portal, a my za tob�. Wkr�tce potem przybyli�my tutaj.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Jeste�my tu ju� od kilku dni.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //KILKU DNI?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Kiedy nie mogli�my ci� nigdzie znale��, Nefarius pr�bowa� ustali�, co si� mog�o sta�. Bez rezultat�w.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //No dobrze. W ko�cu jeste� i mo�esz rozpocz�� prac�.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co dzia�o si� w mi�dzyczasie?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Co dzia�o si� w mi�dzyczasie?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Doszli�my do wielu wniosk�w.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Trz�sienia ziemi s� coraz silniejsze. Znajdujemy si� blisko epicentrum.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Tw�rcy tych starych budowli za�o�yli tu kiedy� miasto, kt�re uda�o nam si� odkry�.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Jednak z jakiego� powodu ich cywilizacja zosta�a zniszczona.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Mo�emy si� jedynie domy�la� dlaczego.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Odkry�e� jakie� �lady zaginionych ludzi?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co si� dzieje z Krukiem?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //Co si� dzieje z Krukiem?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //W li�cie Kruk pisa� o �wi�tyni i o tym, �e spr�buje dosta� si� do �rodka.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Jeste�my pewni, �e chodzi o �wi�tyni� Adanosa, kt�r� Kruk b�dzie pr�bowa� zbezcze�ci�.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Trz�sienia ziemi s� bez w�tpienia wynikiem rzucania bezbo�nych czar�w, maj�cych prze�ama� pot�ne zakl�cie.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Bramy �wi�tyni s� zamkni�te magi�, a to zakl�cie o�ywia kamiennych stra�nik�w.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //�wi�tynia si� broni. Musimy powstrzyma� Kruka, zanim dostanie si� do sanktuarium.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co zrobimy p�niej?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Kruk jest by�ym magnatem, a nie magiem. ", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co Kruk chce zrobi� w �wi�tyni?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Co Kruk chce zrobi� w �wi�tyni?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder M�chtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir k�nnen davon ausgehen, dass er nichts Gutes im Schilde f�hrt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Wiemy tylko, �e chodzi mu o pot�ny artefakt, zwi�zany z Adanosem i Beliarem.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //Na pewno nie ma dobrych zamiar�w...
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Kruk jest by�ym magnatem, a nie magiem. Jak m�g�by przygotowa� taki czar?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Mo�e to nie on. Mo�e jaki� mag renegat, kt�ry wype�nia jego rozkazy.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //Tak czy inaczej, MUSIMY zapobiec z�u.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Odkry�e� jakie� �lady zaginionych ludzi?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Zaledwie wczoraj, w ruinach na wschodzie, znale�li�my zw�oki rybaka.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Wygl�da na to, �e pochodzi� z Khorinis. Powiniene� zobaczy� cia�o.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Co zrobimy p�niej?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //Zostaniemy tutaj i b�dziemy dalej badali t� pradawn� cywilizacj�.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Stare zwoje budowniczych zawieraj� mn�stwo tajemnic, kt�re musimy odkry� � je�li chcemy zrozumie�, co sta�o si� w przesz�o�ci.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //A teraz musisz co� dla nas zrobi�...
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "O co chodzi?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //O co chodzi?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Musisz znale�� Kruka i powstrzyma� go przed bezczeszczeniem �wi�tyni Adanosa.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Mam go zabi�?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Je�li to jedyny spos�b, by go powstrzyma�, to... TAK! W imi� Adanosa!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Zbierz wszystkie zapiski i relikty budowniczych, kt�re zdo�asz znale��, i przynie� je do nas.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Musimy dowiedzie� si� wi�cej na temat tych ludzi i tego, co ich spotka�o.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Kiedy przejrzymy zamiary Kruka, b�dziemy mogli mu przeszkodzi�.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Musisz te� znale�� spos�b na uwolnienie niewolnik�w.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //To wszystko? Zrobi� to z zamkni�tymi oczami.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //Wiem, �e to nie�atwe zadanie. Zrozum, to twoja szansa na odzyskanie mojego zaufania.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Kruk bezcze�ci �wi�tyni� Adanosa. Musz� go powstrzyma�, nawet je�li oznacza to jego zabicie."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas chce, �ebym uwolni� niewolnik�w."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas chce, �ebym przyni�s� mu ka�d� rzecz, kt�ra pozwoli mu pozna� bli�ej prastar� kultur� budowniczych."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "W takim razie ruszam w drog�.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //W takim razie ruszam w drog�.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Jeszcze jedno... Krukowi towarzyszy wielu bandyt�w.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //Podczas twojej nieobecno�ci przyj�li�my kolejnego cz�onka Wodnego Kr�gu.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Wys�ali�my go na bagna. Nie wr�ci�.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //S�dzimy, �e bandyci atakuj� ka�dego, kto nie wygl�da jak oni.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Za�atw sobie ich zbroj�.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //B�dziesz m�g� podej�� bli�ej ich obozu, nie ryzykuj�c, �e ci� zaatakuj�.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bandyci strzelaj� do wszystkich, kt�rzy nie wygl�daj� jak oni. B�d� potrzebowa� zbroi bandyt�w, je�li chc� si� do nich zbli�y�."); 

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

	description	 = 	"Kt�rego to nieszcz�nika wys�a�e� na bagna?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //Kt�rego to nieszcz�nika wys�a�e� na bagna?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Nazywa� si� Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Chyba nie zaszed� daleko.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas wys�a� na bagna cz�owieka imieniem Lance. Boi si� jednak, �e nie zaszed� daleko."); 
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

	description	 = 	"Gdzie znajd� pasuj�c� na mnie zbroj� bandyt�w?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //Gdzie znajd� pasuj�c� na mnie zbroj� bandyt�w?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Na zachodzie jest ob�z pirat�w.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Z tego, co wiem, utrzymuj� kontakty z bandytami.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Nie s�dz�, �eby ci� zaatakowali.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Mo�e uda ci si� znale�� u nich jak�� pomoc...

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas uwa�a, �e piraci mog� pom�c mi zdoby� zbroj� bandyt�w."); 
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

	description	 = 	"Znalaz�em cia�o Lance'a.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Znalaz�em cia�o Lance'a.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //Oby jego dusza dost�pi�a kr�lestwa Adanosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Uwa�aj na siebie, synu. Nie chc� op�akiwa� kolejnej straty.
	
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

	description	 = 	"Mam akwamarynowy pier�cie� Lance'a.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Mam akwamarynowy pier�cie� Lance'a.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Najlepiej oddaj mi go, zanim wpadnie w niepowo�ane r�ce.
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

	description	 = 	"Je�li chodzi o relikty...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //Je�li chodzi o relikty...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Wydaje mi si�, �e mam tu co� dla ciebie.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Mamy ju� podobne kamienne tablice. Te ju� nam si� nie przydadz�.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Tam musi by� co� wi�cej.
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
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //A to mo�ecie wykorzysta�?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //Wygl�da nie�le. Gdzie to znalaz�e�?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Saturas otrzyma� ode mnie nast�puj�ce relikty:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Bandyci u�ywaj� tych tabliczek jako waluty.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Na tablicach jest symbol Quarhodrona, wielkiego wojownika i dow�dcy.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Jego syn � Rademes � doprowadzi� do zag�ady ca�ego miasta.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //Phi. Za�o�� si�, �e bandyci nie maj� poj�cia, co wpad�o im w r�ce.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Czerwon� kamienn� tablic�, kt�r� bandyci u�ywali jako walut�. Jest na niej znak wielkiego wodza Quarhodrona."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //T� tabliczk� znalaz�em w budynku na po�udniu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Ach! Tablica stra�nik�w umar�ych. Przywo�uje duchy zmar�ych.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Zwi�zki pomi�dzy budowniczymi i ich przodkami by�y bardzo silne.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Fioletow� kamienn� tablic� z posiad�o�ci stra�nik�w umar�ych na po�udniu."); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Znalaz�em t� tabliczk� w budynku na po�udniowym zachodzie.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Z tego, co na niej napisano, wynika, �e by� to dom kap�an�w miasta.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Najwy�szy kap�an nazywa� si� KHARDIMON. Nie wiemy wiele wi�cej na jego temat.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Niebiesk� kamienn� tablic� z domostwa kap�an�w na po�udniowym zachodzie."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Ta tabliczka le�a�a w budynku niedaleko wielkiego bagna.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Na pewno by� to dom uzdrowicieli.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Nie wiemy o nich zbyt wiele. Wygl�da na to, �e znikn�li pierwsi.
				Log_AddEntry (TOPIC_Addon_Relicts,"- Zielon� kamienn� tablic� z domu uzdrowicieli w po�udniowej cz�ci bagna."); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Ta cz�� le�a�a w wielkim budynku w kanionie.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //To by�a biblioteka tego pradawnego ludu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Najwyra�niej jest to tablica uczonych.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Wi�kszo�� pism, kt�re znale�li�my, jest autorstwa przyw�dcy Kasty Uczonych.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Co dziwne, nie zostawi� swojego imienia na �adnym z pism...
				Log_AddEntry (TOPIC_Addon_Relicts,"- ��t� kamienn� tablic� z biblioteki uczonych na p�nocy."); 
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
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Bardzo dobrze. Mamy coraz wyra�niejszy obraz miasta, ale jeszcze nie wiemy wszystkiego.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //Na tym terenie musi by� ukrytych pi�� takich kamiennych tablic.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Znajd� je i przynie� do mnie.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //We� to z�oto jako swe wynagrodzenie.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Mamy ju� wszystkie potrzebne relikty.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Odda�e� nam wielk� przys�ug�. Dzi�kujemy.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //To pozwoli nam wykona� decyduj�cy krok w naszych badaniach.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Zobaczymy, co uda mi si� znale��.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Dobrze. Tylko si� po�piesz. Czas ucieka.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Dobrze, �e jeste�. Mamy nowe informacje, kt�re chcemy ci przekaza�.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Zamieniam si� w s�uch.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //Zaginione miasto nosi�o nazw� Jarkendar. Mia�o 5 w�adc�w, kt�rzy wsp�lnie nim rz�dzili.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Ka�dy z w�adc�w mia� posiad�o��, w kt�rej mieszka� i gdzie trzyma� swoje dobra.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Wydaje si� konieczne, aby� w czasie poszukiwa� relikt�w tej zaginionej cywilizacji stara� si� r�wnie� odnale�� ich domostwa.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "A je�li �adna z nich ju� nie istnieje?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Gdzie powinienem ich szuka�?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Gdzie powinienem ich szuka�?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Riordian prowadzi� badania nad uk�adem budynk�w Jarkendaru.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Powie ci, gdzie s� te posiad�o�ci.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas chce, �ebym poszuka� czego� u�ytecznego w posiad�o�ciach budowniczych. Riordian powie mi, gdzie je znale��."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //A je�li �adna z tych posiad�o�ci ju� nie istnieje?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Je�li nie uda ci si� znale�� tych dom�w, to znaczy, �e najprawdopodobniej zosta�y zniszczone w czasie upadku miasta.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Ale je�li wci�� istniej�, to mog� okaza� si� bezcenne dla naszych bada�.
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

	description	 = 	"Po co potrzebujesz tych pi�ciu kamiennych tabliczek?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Po co potrzebujesz tych pi�ciu kamiennych tabliczek?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Zapiski, kt�re znale�li�my w ruinach, s� niepe�ne.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Ale pisma budowniczych wspominaj� o pi�ciu w�adcach rz�dz�cych miastem.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Ka�dy z nich mia� jedn� z tablic, symbol swojej w�adzy.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //S�dz�, �e dzi�ki tym tablicom znajdziemy odpowiedzi na moje pytania.
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

	description	 = 	"Nefarius opowiedzia� mi o potopie...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius opowiedzia� mi o potopie...
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Przekazy g�osz�, �e Adanos zst�pi� z nieba, aby ukara� niewierz�cych i wygna� ich do kr�lestwa umar�ych.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //W �wi�tym gniewie kaza� falom morskim zala� budowniczych tego miasta i zmy� ich z powierzchni.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //Bagno na wschodzie jest pozosta�o�ci� po tych wydarzeniach.

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

	description	 = 	"Dlaczego Adanos tak si� rozgniewa�?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Dlaczego Adanos tak si� rozgniewa�?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //�wi�tynia w tym mie�cie by�a kiedy� wielkim, jasnym budynkiem.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Wszyscy j� podziwiali i modlili si� do naszego boga � Adanosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Rademes, syn dow�dcy Quarhodrona, zbezcze�ci� �wi�tyni�.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Jeden po drugim budowniczowie schodzili na �cie�k� z�a.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Adanos nie m�g� im wybaczy� i kraj zosta� dotkni�ty jego zemst�.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Dlatego tak wa�ne jest, aby�my powstrzymali Kruka. Ma zamiar dosta� si� do �wi�tyni...
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

	description	 = 	"Je�li chodzi o Kruka...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //Je�li chodzi o Kruka...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //By�em w obozie bandyt�w. Kruk jest ich przyw�dc�.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Aby si� do niego zbli�y�, musz� si� pozby� niekt�rych bandyt�w.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Dobrze. Powodzenia. Ale nie zapomnij, �e musisz si� spieszy�.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Kruk nie mo�e zrealizowa� swoich plan�w.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Ma kopalni� z�ota i ka�e w niej pracowa� swoim wi�niom.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //To podobne do niego. Musisz uwolni� wi�ni�w.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //Oczywi�cie. Pracuj� nad tym.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Jeden z bandyt�w twierdzi, �e zna plany Kruka.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Nazywa si� Fortuno. M�wi, �e Kruk chce si� dosta� do �wi�tyni, aby zdoby� pot�ny artefakt.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //I co? Wie co� wi�cej na temat tego artefaktu?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Powiedzia� mi tylko, �e Kruk kaza� rozkopa� gr�b jednego z kap�an�w Adanosa.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Mo�liwe, �e w tym grobie jest klucz do �wi�tyni. Powiniene� si� tam rozejrze�.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Kruk kaza� wi�niom rozkopa� grobowiec.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //To niedobrze. Musisz si� pospieszy� i pozby� Kruka.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //Wtargn��em do siedziby Kruka.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //Co z nim?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Przyby�em za p�no. Na moich oczach znikn�� w �wi�tyni Adanosa.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //Co? To TRAGEDIA! Dlaczego nie wyruszy�e� za nim?!

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
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Przynosisz jakie� wie�ci?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Nie tym razem.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Dam ci rad� � nie lekcewa� Kruka. Rozumiesz?
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

	description	 = 	"Nie mog�em i�� za nim!";
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
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Nie mog�em i�� za nim. Zablokowa� bram� od wewn�trz.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //Musz� pomy�le�...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //Ciekawe, jak Kruk dosta� si� do �wi�tyni...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Co zrobi�, zanim przeszed� przez portal?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Wypowiedzia� zakl�cie przy bramie.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //A przedtem?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Otworzy� gr�b.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //Ju� ci m�wi�em...
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Dok�adnie!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //Wiem, �e musia� odprawi� jaki� rytua�...
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //Rytua�...
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //Tak! W�a�nie to!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Obawiam si�, �e Kruk zyska� moc stra�nik�w umar�ych.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //Zdoby� wiedz� na temat �wi�tyni od ducha!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Musisz uda� si� do Myxira i mu o tym opowiedzie�.
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Kruk posiad� moc Stra�nika Umar�ych i od ducha zdoby� informacje o �wi�tyni Adanosa. Powinienem przekaza� te wiadomo�ci Myxirowi.");  
	
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

	description	 = 	"Rozmawia�em z Quarhodronem.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Rozmawia�em z Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //I co powiedzia�?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //�e pomo�e mi tylko wtedy, je�li odpowiem mu na kilka pyta�.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //W czym problem?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Nie jestem pewien, co mam mu powiedzie�.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Hm... wiemy, �e uczeni z tego miasta zbudowali na p�nocy bibliotek�.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Bardzo dok�adnie spisywali wszystkie wydarzenia przesz�o�ci.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Mo�e tam znajdziesz odpowiedzi na pytania Quarhodrona.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas s�dzi, �e odpowiedzi na pytania Quarhodrona mog� znale�� w bibliotece uczonych. Le�y ona daleko na p�nocy."); 

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

	description	 = 	"Problem z bram� u wej�cia do �wi�tyni zosta� rozwi�zany.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Problem z bram� u wej�cia do �wi�tyni zosta� rozwi�zany.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //Duch przem�wi�?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Tak.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Wiesz, jak dosta� si� do �wi�tyni?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Tak. Zdradzi� te�, co si� w niej znajduje.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //M�wi� o pot�nym mieczu oraz o komnatach Adanosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //Na Adanosa! Jak mogli�my by� tak kr�tkowzroczni?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //Wskaz�wki w tych dokumentach...
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //Tym mieczem mo�e by� jedynie Szpon Beliara.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Musimy jak najszybciej przej�� przez komnaty i zdoby� t� bro�.
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co to za Szpon Beliara?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Czym s� komnaty Adanosa?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Co to za Szpon Beliara?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //To wcielenie z�a. Beliar stworzy� ten miecz w�asnor�cznie.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Ka�dy, kto nim w�ada, posiada pot�ne narz�dzie zniszczenia.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Im silniejszy jest w�a�ciciel broni, tym wi�ksza moc Szpona.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Jedynie kto� wielkiego ducha i silnej wiary mo�e oprze� si� jego mocy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //To jasne, dlaczego budowniczowie odci�li od �wiata t� dolin�.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Przynie�li to narz�dzie z�a do swojego miasta i ulegli jego czarowi.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Chciwo�� sprawi�a, �e ci aroganccy g�upcy pozabijali si� nawzajem.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Na tym si� nie sko�czy�o. Gniew Adanosa przetoczy� si� po ca�ym kraju i wszystko zatopi�o morze.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //W rzeczy samej, tw�rcy portalu dobrze zrobili, ukrywaj�c te rzeczy przed reszt� �wiata.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //C� za tragiczny koniec tak wspania�ej kultury.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //Teraz rozumiesz donios�o�� swojej misji?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Kruk jest silnym wojownikiem za�lepionym rz�dz� w�adzy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //W jego r�ku Szpon stanie si� narz�dziem zniszczenia.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Nie wolno mu dosta� tej broni. Inaczej czeka nas zag�ada.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"W �wi�tyni Adanosa znajduje si� pot�na bro�, Szpon Beliara. Nie mo�na dopu�ci�, by wpad�a w r�ce Kruka."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //Czym s� komnaty Adanosa?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Wiem, �e brama ma tylko przeszkadza� w wej�ciu do �wi�tyni.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //Jednak w �rodku s� trzy komnaty, kt�re powinny zatrzyma� ka�dego intruza.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Kluczem do nich s� kolorowe relikty budowniczych.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Je�li zdob�dziemy wszystkie relikty i rozwi��emy ich zagadki, b�dziemy mogli dosta� si� do sanktuarium �wi�tyni.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Nie wiem, czy Kruk rozszyfrowa� sekrety �wi�tyni. Je�li tak zrobi�, to mamy du�y problem.
	
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

	description	 = 	"Co dok�adnie powinienem zrobi� z reliktami w �wi�tyni?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Co dok�adnie powinienem zrobi� z reliktami w �wi�tyni?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Nie wiemy wiele na ten temat. Ale miejmy nadziej�, �e rozpoznasz ich znaczenie, kiedy dostaniesz si� do �wi�tyni.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Naprawd� bardzo mi przykro, �e nie mog� bardziej ci pom�c. Teraz wszystko zale�y od ciebie.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //We� relikty i natychmiast id� do �wi�tyni.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas wysy�a mnie do �wi�tyni Adanosa z pi�cioma reliktami budowniczych. Musz� przedosta� si� przez komnaty i zatrzyma� Kruka."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Niech Adanos zmi�uje si� nad nami i ma nas w swej opiece.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Mo�e nie jest jeszcze za p�no.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Trz�sienia ziemi usta�y, a ty wci�� �yjesz.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Twoja misja powiod�a si�?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Tak. Kruk nie �yje.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //A wi�c wszystko si� sko�czy�o. Dzi�ki Adanosowi!
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Dobrze zrobi�e�, m�j synu. Jeste�my twoimi d�u�nikami.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Odebra�e� s�ugom z�a pot�n� bro� i przywr�ci�e� r�wnowag� w tej cz�ci �wiata.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Kiedy trz�sienia ziemi usta�y, ustalili�my, co trzeba zrobi� w nast�pnej kolejno�ci.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Zdob�d� Szpon Beliara. Ta bro� jest tobie przeznaczona.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //W twoich r�kach powinna sta� si� naszym pot�nym sprzymierze�cem.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //U�ywaj jej m�drze, synu. Niech Adanos ci pomo�e.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //My zostaniemy tutaj i postaramy si�, aby �wi�tynia odzyska�a dawny blask.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Tylko Myxir wyruszy� do Khorinis, aby wesprze� Vatrasa.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras zbyt d�ugo by� sam w mie�cie.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir uda� si� do miasta portowego, aby pom�c Vatrasowi."); 

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

	description	 = 	"Uwolni�em wi�ni�w.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Uwolni�em wi�ni�w.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Bardzo dobrze. Oby szcz�liwie dotarli do swej ojczyzny.
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

	description	 = 	"Zabra�em Szpon Beliara.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //Zabra�em Szpon Beliara.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Ale nie mog� go u�y�.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //Szpon Beliara to wyj�tkowa bro�.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Ma swoj� dusz� i w�asn� wol�.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //Ty, w�a�ciciel tej pot�nej broni, jeste� jej panem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Bro� jest teraz cz�ci� ciebie i dostosuje si� do twoich umiej�tno�ci.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Ale nie zrobi tego z w�asnej woli.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //Jedynie sam BELIAR mo�e zmusi� j�, by ci s�u�y�a.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Dlaczego Beliar mia�by mi pom�c?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Co mog� zrobi� z t� broni�?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //Co mog� zrobi� z t� broni�?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //To zale�y od ciebie. Zdoby�e� j� i jeste� teraz jej panem.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Mog� ci jednak s�u�y� rad�.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Albo przeka�esz j� MNIE, a ja upewni� si�, �e nie spowoduje wi�cej szk�d...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //...albo przyswoisz sobie jej moc i b�dziesz u�ywa� miecza do walki.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Nie m�g�by� przechowa� broni?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Nie m�g�by� przechowa� broni?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des B�sen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschlie�t, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Je�li mi j� oddasz, sprawi�, �e nie b�dzie mo�na jej u�y�. Nigdy wi�cej nie zostanie wykorzystana do z�ych cel�w.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Wi�c dok�adnie przemy�l, co zrobi�.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Mog� przekaza� Szpon Beliara Saturasowi albo zatrzyma� go dla siebie."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //Dlaczego Beliar mia�by mi pom�c?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Tylko modlitwa mo�e go przekona�.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Ale uwa�aj. Beliar jest nikczemny.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Je�li go rozw�cieczysz, odczujesz na sobie jego furi�.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Aby podporz�dkowa� Szpon Beliara swojej woli, musz� pomodli� si� do Beliara.");

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
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Zostaniemy tutaj i postaramy si�, �eby �wi�tynia odzyska�a sw� dawn� �wietno��.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Te stare mury zbyt d�ugo sta�y w ruinie.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //A je�li chodzi o ciebie, m�j synu...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Jestem bardzo szcz�liwy, widz�c, �e myli�em si� co do ciebie. Jeste� Stra�nikiem R�wnowagi. Nie ma co do tego w�tpliwo�ci.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Bez twojej si�y i odwagi wysp� Khorinis czeka�aby zag�ada. Dzi�kujemy ci. Chwa�a twemu m�stwu.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Skoncentruj si� na pozosta�ych czekaj�cych ci� zadaniach i przywr�� temu �wiatu r�wnowag� i pok�j.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Id� i wype�nij swoje przeznaczenie, Stra�niku. B�d� ci towarzyszy� nasze modlitwy.
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

	description	 = 	"We� Szpon Beliara i zniszcz go.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //We� Szpon Beliara i zniszcz go.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Jak sobie �yczysz, synu. Oddaj mi bro�.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Nie wyrz�dzi ju� nikomu krzywdy, gdy zatopi� j� w morskich odm�tach.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //Na jej stra�y sta� b�dzie m�dro�� Adanosa.
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

	description	 = 	"Mo�esz mnie nauczy� kr�g�w magii?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Mo�esz mnie nauczy� kr�g�w magii?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Jeste� magiem ognia. Co powie na to Pyrokar?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //Nie musi o tym wiedzie�.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //Widz�, �e my�lisz o tym powa�nie. Spe�ni� twoj� pro�b�.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Je�li odnios� wra�enie, �e wykorzystasz sw� wiedz�, aby czyni� z�o, nie b�dziesz m�g� wi�cej na mnie liczy�.
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
	description	 = 	"Chc� dowiedzie� si� wi�cej o wy�szych kr�gach magii.";
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
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Chc� dowiedzie� si� wi�cej o wy�szych kr�gach magii.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Tak, jeste� got�w na dalsz� nauk�.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Wst�p do drugiego kr�gu magii. Niech Adanos obdarzy ci� m�dro�ci�, by� roztropnie u�ywa� swych nowych mocy.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Tak, nasta� ku temu czas. Wst�p do trzeciego kr�gu magii.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Twoja wiedza pozwoli ci rzuca� nowe, pot�ne zakl�cia. U�ywaj ich roztropnie.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //Nadszed� ju� czas. Jeste� got�w wst�pi� do czwartego kr�gu magii.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Twoje s�owa i gesty maj� teraz wielk� moc. Zawsze rozs�dnie i uwa�nie dobieraj nowe zakl�cia.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Masz przywilej wst�pienia do pi�tego kr�gu magii.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Zakl�cia, kt�rych si� teraz nauczysz, maj� niszczycielsk� si��.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //B�d� �wiadom swej wielkiej mocy i nie popadaj w samouwielbienie.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //To zadanie nie nale�y ju� do mnie.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //Aby pozna� sz�sty i ostatni kr�g zakl��, musisz odwiedzi� klasztor, Magu Ognia.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Jest zbyt wcze�nie. Wr�� p�niej.
	};
};

















