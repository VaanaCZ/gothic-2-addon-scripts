
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
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Ké tì Adanos provází.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Koneènì jsi tady – díky Adanovi. U jsme mysleli, e se tu neukáeš.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(zmatenì) Coe? Jak to, e u jsi TADY?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Prošel jsi portálem a my tì hned následovali. Netrvalo dlouho a dorazili jsme i sem.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Po tobì ale nebylo ani vidu. U jsme tu nìkolik dní.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(pøekvapenì) NÌKOLIK DNÍ? Jak je to moné?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Kdy jsme tì nikde nemohli najít, Nefarius zaèal pátrat, kde se stala chyba. A zmatenı je z toho a doteï.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //Ale hlavnì e jsi tady a mùeme zaèít pracovat.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co se mezitím stalo?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Co se stalo mezitím?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Nasbírali jsme spoustu novıch informací.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Ta zemìtøesení jsou tu skuteènì SILNÌJŠÍ. U nejsme daleko od epicentra.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Stavitelé tìchto starıch budov tu kdysi postavili celé mìsto, aspoò co zatím mùeme øíci.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Z nìjakého dùvodu však jejich civilizace zanikla.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Proè, to se zatím mùeme jen dohadovat.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Našli jste nìjakou stopu po tìch pohøešovanıch?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "A co Havran?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //A co Havran?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //Havran se v dopise zmiòoval o nìjakém chrámu a e se snail dostat dovnitø.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Všichni jsme toho názoru, e ten chrám, kterı chce Havran znesvìtit, patøí Adanovi.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Ta zemìtøesení jsou urèitì vısledkem ïábelského zaklínání, které se støetlo s mocnım kouzlem.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Brány chrámu jsou magicky uzavøeny a tohle je ta samá magie, která probouzí ty kamenné stráce.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Chrám se brání sám. Musíme Havrana zastavit, ještì ne pronikne do nejsvìtìjší svatynì.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "A co bude dál?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Havran je bıvalı rudobaron, ádnı mág.", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co chce Havran v tom chrámu najít?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Co Havran v tom chrámu vlastnì chce?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder Mächtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir können davon ausgehen, dass er nichts Gutes im Schilde führt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Víme jen to, e to má nìco spoleèného s mocnım artefaktem, kterı je nìjak spojen s Adanem a Beliarem.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(zarputile) Jisté je jenom to, e rozhodnì nejde po nièem dobrém.
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Havran je jen bıvalı rudobaron, ádnı mág. Jak zrovna ON mùe provést takovouhle invokaci?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Moná není sám, tøeba podplatil nìjakého odpadlého mága.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //A je to, jak chce, MUSÍME pøedcházet zlu.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Našel jsi nìjakou stopu po tìch pohøešovanıch?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Jen vèera jsme našli rybáøovo tìlo. Leelo pod jednou z tìch rozvalin na vıchodì.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Nejspíš šlo o rybáøe z Khorinidu. Mìl by ses na to podívat.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Co bude dál?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //MY zùstaneme tady a budeme dál studovat tu starobylou kulturu.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Ty staré texty stavitelù obsahují spoustu tajemství, která musíme odhalit. Pokud tedy chceme zjistit, co se tam tenkrát stalo.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //Mezitím pro nás ale musíš zjistit pár vìcí.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co mám udìlat?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //Co mám dìlat?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Musíš najít Havrana a postarat se, aby nemohl znesvìtit Adanùv chrám.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Tím myslíš, e ho mám ZABÍT.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Pokud to bude jedinı zpùsob, jak ho zastavit, pak v Adanovì jménu ANO!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Jinak sbírej všechny staré relikvie a písemnosti, které tu staøí stavitelé zanechali, a pøines nám je.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Musíme zjistit víc o tomto lidu a odhalit dùvod, proè odešel.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Havranovy plány musíme napøed znát, abychom jim mohli èelit.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Krom toho musíš zjistit, jak osvobodit otroky.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(cynicky) A to je všecko? To zvládnu levou zadní.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(otrávenì) Já vím, e po tobì chceme moc. Ber to jako šanci znovu získat mou dùvìru.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran znesvìcuje posvátnı Adanùv chrám. Musím ho zastavit, i kdybych ho pøitom mìl zabít."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas chce, abych osovodil otroky."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas mì poádal, abych mu pøinesl cokoliv, co by mohlo odhalit nìco blišího o dávnıch stavitelích."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Tak já pùjdu.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //Tak já tedy pùjdu.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Ještì nìco – Havran se obklopil spoustou banditù.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //Bìhem tvé nepøítomnosti dorazil další èlen kruhu vody.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Poslali jsme ho do bainy. Ještì se nevrátil.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Poèítáme, e banditi napadnou kadého, kdo nebude vypadat jako oni.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Take si poøiï brnìní banditù.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //To je jedinı zpùsob, jak se k nim pøiblíit, ani by tì napadli.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Banditi støílí na kadého, kdo nepatøí mezi nì. Jestli se k nim mám dostat, musím si napøed opatøit jejich zbroj."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Zaèít");
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

	description	 = 	"Co za chudáka jste poslali do tìch bain?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //A kterého chudáka jste do té bainy poslali?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Jmenuje se Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Obávám se, e se moc daleko nedostal.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas poslal do bain nìjakého Lanceho a teï se bojí, e se asi moc daleko nedostal."); 
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

	description	 = 	"Kde bych našel zbroj banditù, která by mi sedla?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //Kde najdu zbroj banditù, která by mi padla?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Na západì by mìl bıt tábor pirátù.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Pokud víme, jsou s bandity v kontaktu.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Neøekl bych, e tì napadnou, sotva se k nim pøiblííš.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Moná tam najdeš nìjakou pomoc.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas tvrdí, e by mi s tou zbrojí mohli pomoci piráti."); 
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

	description	 = 	"Našel jsem Lanceovo tìlo.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Našel jsem Lancovo tìlo.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //Ké jeho duše vstoupí do království Adanova.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Dej pozor, synu. U nechci oplakávat ádnou další smrt.
	
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

	description	 = 	"Tady je Lanceùv akvamarínovı prsten.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Tady je Lancùv akvamarínovı prsten.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Radši mi ho dej, a nepadne do nesprávnıch rukou.
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

	description	 = 	"Co se tıèe tìch relikvií...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //Co se tıèe tìch relikvií...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Myslím, e tu pro tebe nìco mám.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Tyhle kamenné tabulky u známe. Nic nového u se z nich nedovíme.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Musí jich bıt ještì víc.
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
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //A co TOHLE?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //To vypadá dobøe. Kde jsi to našel?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Pøedal jsem Saturasovi následující relikvie:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Banditi tyhle kamenné tabulky pouívají jako mìnu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Nesou znamení velkého váleèníka Quarhodrona.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Je velitelem toho, jeho syn Rhademes zpùsobil pád celého mìsta.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(pohrdavì) Tss. Vsadím se, e ti banditi ani nevìdí, s èím to vlastnì obchodují.
				Log_AddEntry (TOPIC_Addon_Relicts,"Èervenou tabulku, která banditùm slouí jako platidlo. Nese jméno mocného váleèníka Quarhodrona."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //Tyhle tabulky jsem našel v budovì na jihu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Á, tabulka strácù smrti. Byli to právì oni, kteøí vyvolali duchy mrtvıch.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Stavitelé byli velmi silnì spojeni se svımi pøedky.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Tyhle tabulky jsem našel v budovì na jihozápadì.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Soudì podle té tabulky to má nìco spoleèného s ubikacemi pro mìstské knìze.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Veleknìz se jmenoval KHARDIMON. Moc o nìm zatím nevíme.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Tohle leelo v budovì u velké bainy.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Nejspíš to bıval dùm léèitelù.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Moc o nich nevíme. Nejspíš zmizeli jako první.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Tohle leelo ve velké budovì hluboko v rokli.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //Bıvala to knihovna dávného lidu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Evidentnì tabulka uèencù.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Spousta písemností, které jsme našli, se odkazuje na vùdce jakési kasty uèencù.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Zvláštní je, e nikde není zmínìno jeho jméno.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
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
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Vıbornì. Obraz tohoto mìsta u se nám pomalu vyjasòuje, ale ještì stále nevíme dost.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //Urèitì tu musí bıt nìkde ukryto pìt tìchto kamennıch tabulek.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Najdi je a pøines mi je.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //Tady máš za odmìnu trochu zlata.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Teï u jsme získali všechny relikvie, které potøebujeme.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Prokázals nám velkou slubu. Dìkuji ti.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //Tohle bude rozhodující krok v našich studiích.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Uvidím, jestli se dá nìco dìlat.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Dobøe, ale pospìš si, èas hraje proti nám.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Dobøe e jsi pøišel. Objevili jsme nové vìci, o které se s tebou musíme podìlit.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Tak to vyklopte.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //To potopené mìsto kdysi neslo jméno Jharkendar. Spravovalo je pìt vládcù, kteøí se vzájemnì dìlili o moc nad svım lidem.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Kadı z nich mìl vlastní sídlo, kde il a kde uchovával svùj majetek.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Pøi hledání relikvií se proto musíš soustøedit zejména na jejich sídla.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "A co kdy ty domy u dávno neexistují?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Kde bych mìl ta sídla hledat?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Kde bych ta sídla našel?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Strukturu jharkendarskıch staveb studuje Riordian.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Poví ti, kde bys mìl ta sídla hledat.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas chce, abych prohledal sídla stavitelù a poohlédl se tam po nìèem uiteèném. Kde se ty stavby nacházejí, se mám optat Riordiana."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //A co kdy u neexistují?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Pokud nenajdeš domy, pak jsou pravdìpodobnì pohøbeny spolu s mìstem.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Ale pokud stále existují, mohou bıt pro naše studia neocenitelnım pøínosem.
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

	description	 = 	"Proè potøebuješ tìch pìt kamennıch tabulek?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Proè potøebujete tìch pìt kamennıch tabulek?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Záznamy, které jsme v tìchto rozvalinách našli, nejsou úplné.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Ale písemné záznamy stavitelù hovoøí o pìti vládcích, kteøí toto mìsto spravovali.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Jako symbol moci nosil kadı z nich jednu z tìchto tabulek.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Myslím, e na tìch tabulkách najdeme odpovìdi na naše otázky.
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

	description	 = 	"Nefarius øíkal nìco o povodni.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius mi vyprávìl o povodni.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Je psáno, e sám Adanos sestoupil z nebes, aby ztrestal nevìøící a vyhnal je do øíše mrtvıch.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //Ve svém boském hnìvu dopustil, aby moøe vystoupilo z bøehù a stavitele tohoto mìsta smetlo z povrchu zemského.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //Pøipomínkou tìchto dávnıch událostí je baina na vıchodì.

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

	description	 = 	"Co mohlo Adana tolik rozzlobit?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Co mohlo Adana tak rozzuøit?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Chrám v tomto mìstì bıval kdysi velkou a slavnou stavbou.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Kadı zde uctíval boha Adana a modlil se k nìmu.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Avšak Rhademes, syn velitele Quarhodrona, tento chrám znesvìtil.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Spousta lidí pak podlehla svodùm zla.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Poèítám, e Adanos mu ten èin neodpustil a jeho hnìv dopadl na celou zemi.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Tím spíše je dùleité Havrana zastavit, protoe ten se chystá uèinit to samé.
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

	description	 = 	"Co se tıèe Havrana...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //Co se tıèe Havrana...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Byl jsem v táboøe banditù na vıchodì. Havran je jejich velitelem.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Ale napøed musím z cesty odklidit pár banditù, jinak se k Havranovi nedostanu.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Dobøe, tak hodnì štìstí. A nezapomeò, e to musíš zvládnout co nejrychleji.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Havran nesmí svùj plán uskuteènit za ádnou cenu.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Má tam zlatı dùl a vìzni mu v nìm tìí zlato.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //To je mu podobné. Musíme odtamtud ty vìznì dostat.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(povzdech) Ano, samozøejmì. Pracuju na tom.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Mezi bandity je i jeden chlápek, co tvrdí, e ví, co má Havran v plánu.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Jmenuje se Fortuno. Havran se prı chce dostat do chrámu a ukrást tam nìjakı velice mocnı artefakt.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //A ví o tom artefaktu nìco blišího?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Prozradil mi jen, e Havran nechal otevøít hrob Adanova knìze.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Tam by se mìl nacházet klíè ke chrámu. Mìl by ses tam porozhlédnout.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Havran vìznì pøinutil, aby vykopali knìzùv hrob.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //To není dobré. Musíš si pospíšit a Havrana zastavit.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //Dostal jsem se do Havranova obydlí.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //A co? Co Havran?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Pøišel jsem pøíliš pozdì. Pøímo pøed oèima mi zmizel do Adanova chrámu.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(znepokojenì) Coe? Tak to je KATASTROFA! Proè jsi nešel za ním?

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
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Chceš mi ohlásit nìco nového?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Zatím nic.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Radím ti, nepodceòuj Havrana, rozumíš?
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

	description	 = 	"Nemohl jsem následovat Havrana!";
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
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Nemohl jsem za ním. Zablokoval vchod zevnitø.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //(chvatnì) Musím uvaovat.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //Otázka zní, jak se Havran dostal do chrámu.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Co udìlal, ne prošel portálem?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Pøednesl pøed bránou nìjaké zaøíkání.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //A ještì pøedtím?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Otevøel pohøební místnost.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //To u jsem ti øekl.
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Správnì!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //Vím jen, e tam urèitì provedl nìjakı rituál.
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //(pøemıšlí) Rituál.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //(koneènì na to pøišel) Ano! To je ono!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Obávám se, e si Havran pøivlastnil moc strácù smrti.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //O chrámu se dozvìdìl od ducha!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Musíš jít za Myxirem a tohle všechno mu povìdìt!
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Havran získal moc strácù smrti. O Adanovì chrámu se dozvìdìl od nìjakého ducha. Musím zajít za Myxirem a zpravit ho o tom.");  
	
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

	description	 = 	"Mluvil jsem s Quarhodronem.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Hovoøil jsem s Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //A co øíkal?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //Pomùe mi, jedinì kdy naleznu odpovìï na jeho otázky.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //A kde je tedy problém?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Nevím jistì, zda ty odpovìdi znám.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Hmm, víme, e na severu mìsta si uèenci vybudovali knihovnu.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Velmi peèlivì zaznamenávali všechny tehdejší události.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Snad tam najdeš i odpovìdi, které po tobì Quarhodron chce.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas se domnívá, e odpovìdi na Quarhodronovy otázky najdu v knihovnì uèencù, která leí daleko na severu."); 

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

	description	 = 	"Ten problém s branou do chrámu u jsem vyøešil.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Problém s chrámem u je vyøešen.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //A promluvil ten duch?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Ano, promluvil.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Pak tedy u víš, jak se dostat do chrámu.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Správnì. A taky mi prozradil, co v chrámu najdu.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Hovoøil o mocném meèi, kterı je ukryt v Adanovıch komnatách.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(zoufale) Pøi Adanovi! Jsme to ale tupci! Jak jsme mohli bıt tak hloupí!
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //(roztøesenì) Ty náznaky v záznamech.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //(vzrušenì) Ten meè mùe bıt jedinì Beliarùv dráp.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Musíme se co nejdøív dostat do tìch komnat a zmocnit se té zbranì!
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co to je ten 'Beliarùv dráp'?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co jsou to komnaty Adanovy?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Co je to ten Beliarùv dráp?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //Je to ztìlesnìní zla. Dílo samotného BELIARA!
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Kadı, kdo jej nosí, má v rukou nástroj strašlivé zkázy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Èím mocnìjší je jeho nositel, tím vìtší sílu v sobì tají i Dráp.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Jeho kouzlu odolá pouze ten, jeho duch je silnı a víra neoblomná.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //Teï u je mi jasné, proè stavitelé toto údolí uzavøeli.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Pøinesli do mìsta zkázonosnou zbraò a podlehli její zlé moci.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Ti namyšlení blázni se pak z nenasytnosti navzájem pobili.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Krutosti nebraly konce, dokud na celou zemi nedopadl Adanùv hnìv a vše nezatopilo moøe.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //Jasnì. Tvùrci portálu udìlali dobøe, e tyto vìci ukryli pøed zbytkem svìta.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Jakı tragickı konec to postihl tak úasnou kulturu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //U si uvìdomuješ, jak je tvùj úkol naléhavı?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Havran je silnı bojovník a navíc je zaslepenı touhou po moci.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //V jeho rukou bude Dráp strašlivım nástrojem zkázy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Nesmí se k té zbrani dostat, jinak bude vše ztraceno.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"V Adanovì chrámu je ukryta mocná zbraò. Øíká se jí 'Beliarùv dráp'. Nìco tak mocného se Havranovi nesmí dostat do rukou."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //A co jsou ty Adanovy komnaty?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Nyní u víme, e vchod není jedinou pøekákou, která nám brání ve vstupu do chrámu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //V samotném chrámu jsou tøi komnaty, které mají odradit všechny vetøelce.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Klíèem jsou barevné relikvie stavitelù.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Pouze kdy shromádíme všechny relikvie a rozøešíme jejich hádanky, dostaneme se do vnitøní svatynì chrámu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Nevím, zda Havran u tyto hádanky rozøešil, ale pokud se mu to podaøilo, pak máme velkı problém.
	
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

	description	 = 	"Co pøesnì bych mìl s tìmi relikviemi v chrámu dìlat?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Co pøesnì bych mìl s tìmi relikviemi v chrámu dìlat?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Víme pøíliš málo. Ale doufejme, e a se dostaneš do chrámu, zjistíš sám, k èemu slouí.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Lituji, e ti nemohu øíci více. Všechno u je teï na tobì.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Seber relikvie a okamitì se vydej do chrámu.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas mì poslal do Adanova chrámu s pìti relikviemi stavitelù, abych se dostal skrze jeho komnaty a zastavil Havrana."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Ké tì milosrdnı Adanos provází.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Snad ještì není pøíliš pozdì.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Zemìtøesení ustala a jak vidím, ještì stále jsi mezi ivımi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Znamená to, e jsi ve svém snaení uspìl?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Ano. Havran je mrtvı.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //Take u je to za námi. Díky Adanovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Vedl sis dobøe, synu. Jsme ti velice zavázáni.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Vyrval jsi ze spárù zla velmi mocnou zbraò a znovu nastolil rovnováhu v tomhle koutì svìta.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Kdy zemìtøesení ustala, diskutovali jsme, co by se teï mìlo stát, a došli jsme k závìru.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Bì a vezmi si Beliarùv dráp. Od nynìjška jej mùeš nosit.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //Ve tvıch rukou se nám snad stane mocnım spojencem.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //Uívej ho moudøe, mùj synu. Ké ti Adanos pomùe.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //My zùstaneme zde a postaráme se, aby chrám brzy dosáhl své bıvalé skvìlosti.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Pouze Myxir je na cestì do Khorinidu, aby pomohl Vatrasovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras u byl ve mìstì pøíliš dlouho.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir byl vyslán, aby pomohl Vatrasovi v pøístavu."); 

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

	description	 = 	"Osvobodil jsem vìznì.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Osvobodil jsem vìznì.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Vıbornì. Ké se v poøádku vrátí do vlasti.
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

	description	 = 	"Získal jsem 'Beliarùv dráp'.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //Zmocnil jsem se Beliarova drápu.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Ale nemohu jej nosit.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //Beliarùv dráp je velmi ZVLÁŠTNÍ zbraò.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Má vlastní vùli a vìdomí.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //A ty, kterı nyní tuto zbraò nosíš, jsi jeho pánem a vládcem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Je tvou souèástí a pøizpùsobí se tvım schopnostem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Ale udìlá to pouze ze své vlastní vùle.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //A k tomu ho mùe pøesvìdèit pouze samotnı BELIAR.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "A proè by mi mìl Beliar pomáhat?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Co mùu s tou zbraní dìlat?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //A co mám s tou zbraní tedy dìlat?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //To závisí na tobì. Zmocnil ses této zbranì a nyní jsi jejím pánem.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Mùu ti jen naznaèit, jaké máš monosti.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Buï ho dáš MNÌ a já dohlédnu na to, aby u nezpùsobil ádnou další škodu...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //...nebo si pøivlastníš jeho moc a budeš s ním bojovat.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Copak tu zbraò nemùeš uloit nìkde v bezpeèí?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Nemùeš tu zbraò uklidit nìkam do bezpeèí?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des Bösen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschließt, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Kdy mi ji dáš, pak ji zneškodním, aby u ji nikdo nikdy nemohl zneuít.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Tak se poøádnì rozmysli, co udìláš.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Mohu dát Beliarùv dráp Saturasovi, nebo si jej nechat pro sebe."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //A proè by mi mìl Beliar pomáhat?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Dosáhneš toho pouze modlitbou k Beliarovi.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Ale buï opatrnı – Beliar je zákeønı.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Pokud ho rozhnìváš, dá ti svùj hnìv jaksepatøí pocítit.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Mám-li Dráp podrobit své vùli, musím se pomodlit k Beliarovi.");

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

	description	 = 	"Co teï budeš dìlat?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //Co budete dìlat teï?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Zùstaneme tady a postaráme se, aby chrám dosáhl své bıvalé slávy.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Za ty vìky jsou jeho stìny pøímo v alostném stavu.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //A co se tıèe tebe, mùj synu...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Jsem rád, e jsem se v tobì nezklamal. Stal se z tebe ochránce rovnováhy. U o tom není pochyb.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Nebıt tvé odvahy a síly, ostrov Khorinis by se potopil. Dìkujeme ti a v duchu ti budeme stále vzdávat èest.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Nyní se vìnuj jinım úkolùm, je leí pøed tebou, a navra do tohoto svìta rovnováhu a mír.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Nyní bì a naplò svùj osud, ochránèe. Naše modlitby tì budou provázet.
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

	description	 = 	"Vezmi si 'Beliarùv dráp' a zniè ho.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //Vezmi si Beliarùv dráp a zniè jej.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Jak si pøeješ, synu. Dej mi ho.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Tak u nezpùsobí ádné zlo – potopím jej do moøskıch hlubin.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //Adanova moudrost nad ním bude bdít.
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

	description	 = 	"Mùeš mì zasvìtit do kruhù magie?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Mùeš mì zasvìtit do kruhù magie?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Tys mágem ohnì. Co by tomu øekl Pyrokar?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //To nikdo nemusí vìdìt.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(povzdech) Vidím, e to myslíš vánì, a tak tvé prosbì vyhovím.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Ale mám pocit, e naše vìdìní je ve špatnıch rukou. S mou pomocí u nadále nepoèítej.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //Nemìl jsi mì zklamat.
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
	description	 = 	"Chci postoupit na další magickou úroveò.";
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
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Chci si osvojit vyšší úrovnì magie.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Ano, jsi pøipraven vylepšit své vìdomosti.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Nyní vstupuješ do druhého kruhu magie. Ké ti Adanos dá sílu pouívat moc, kterou ti ve své velkolepé moudrosti propùjèil.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Ano, teï nastal ten správnı èas. Nyní vstupuješ do tøetího kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Jsi moudøejší a mùeš pouívat nová a mocnìjší kouzla. Uívej je opatrnì.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //Èas nadešel. Jsi pøipraven vstoupit do ètvrtého kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Mocná jsou tvá slova i skutky. Nová kouzla vol vdy opatrnì a s rozmyslem.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Poskytneme ti vısadu vstoupit do pátého kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Kouzla, která se nyní nauèíš, budou skuteènì nièivá.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //Proto si uvìdomuj svou moc a nikdy nepodléhej velkolepım iluzím.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //To u není mùj úkol.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //K zasvìcení do šestého a posledního kruhu magie musíš zajít do kláštera ohnivıch mágù.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Ještì je pøíliš brzy. Vra se pozdìji.
	};
};

















