
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
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Kéž tě Adanos provází.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Konečně jsi tady – díky Adanovi. Už jsme mysleli, že se tu neukážeš.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(zmateně) Cože? Jak to, že už jsi TADY?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Prošel jsi portálem a my tě hned následovali. Netrvalo dlouho a dorazili jsme i sem.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Po tobě ale nebylo ani vidu. Už jsme tu několik dní.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(překvapeně) NĚKOLIK DNÍ? Jak je to možné?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Když jsme tě nikde nemohli najít, Nefarius začal pátrat, kde se stala chyba. A zmatený je z toho až doteď.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //Ale hlavně že jsi tady a můžeme začít pracovat.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co se mezitím stalo?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Co se stalo mezitím?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Nasbírali jsme spoustu nových informací.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Ta zemětřesení jsou tu skutečně SILNĚJŠÍ. Už nejsme daleko od epicentra.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Stavitelé těchto starých budov tu kdysi postavili celé město, aspoň co zatím můžeme říci.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Z nějakého důvodu však jejich civilizace zanikla.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Proč, to se zatím můžeme jen dohadovat.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Našli jste nějakou stopu po těch pohřešovaných?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "A co Havran?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //A co Havran?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //Havran se v dopise zmiňoval o nějakém chrámu a že se snažil dostat dovnitř.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Všichni jsme toho názoru, že ten chrám, který chce Havran znesvětit, patří Adanovi.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Ta zemětřesení jsou určitě výsledkem ďábelského zaklínání, které se střetlo s mocným kouzlem.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Brány chrámu jsou magicky uzavřeny a tohle je ta samá magie, která probouzí ty kamenné strážce.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Chrám se brání sám. Musíme Havrana zastavit, ještě než pronikne do nejsvětější svatyně.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "A co bude dál?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Havran je bývalý rudobaron, žádný mág.", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co chce Havran v tom chrámu najít?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Co Havran v tom chrámu vlastně chce?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder Mächtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir können davon ausgehen, dass er nichts Gutes im Schilde führt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Víme jen to, že to má něco společného s mocným artefaktem, který je nějak spojen s Adanem a Beliarem.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(zarputile) Jisté je jenom to, že rozhodně nejde po ničem dobrém.
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Havran je jen bývalý rudobaron, žádný mág. Jak zrovna ON může provést takovouhle invokaci?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Možná není sám, třeba podplatil nějakého odpadlého mága.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //Ať je to, jak chce, MUSÍME předcházet zlu.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Našel jsi nějakou stopu po těch pohřešovaných?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Jen včera jsme našli rybářovo tělo. Leželo pod jednou z těch rozvalin na východě.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Nejspíš šlo o rybáře z Khorinidu. Měl by ses na to podívat.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Co bude dál?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //MY zůstaneme tady a budeme dál studovat tu starobylou kulturu.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Ty staré texty stavitelů obsahují spoustu tajemství, která musíme odhalit. Pokud tedy chceme zjistit, co se tam tenkrát stalo.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //Mezitím pro nás ale musíš zjistit pár věcí.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co mám udělat?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //Co mám dělat?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Musíš najít Havrana a postarat se, aby nemohl znesvětit Adanův chrám.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Tím myslíš, že ho mám ZABÍT.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Pokud to bude jediný způsob, jak ho zastavit, pak v Adanově jménu ANO!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Jinak sbírej všechny staré relikvie a písemnosti, které tu staří stavitelé zanechali, a přines nám je.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Musíme zjistit víc o tomto lidu a odhalit důvod, proč odešel.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Havranovy plány musíme napřed znát, abychom jim mohli čelit.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Krom toho musíš zjistit, jak osvobodit otroky.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(cynicky) A to je všecko? To zvládnu levou zadní.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(otráveně) Já vím, že po tobě chceme moc. Ber to jako šanci znovu získat mou důvěru.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran znesvěcuje posvátný Adanův chrám. Musím ho zastavit, i kdybych ho přitom měl zabít."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas chce, abych osovodil otroky."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas mě požádal, abych mu přinesl cokoliv, co by mohlo odhalit něco bližšího o dávných stavitelích."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Tak já půjdu.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //Tak já tedy půjdu.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Ještě něco – Havran se obklopil spoustou banditů.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //Během tvé nepřítomnosti dorazil další člen kruhu vody.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Poslali jsme ho do bažiny. Ještě se nevrátil.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Počítáme, že banditi napadnou každého, kdo nebude vypadat jako oni.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Takže si pořiď brnění banditů.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //To je jediný způsob, jak se k nim přiblížit, aniž by tě napadli.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Banditi střílí na každého, kdo nepatří mezi ně. Jestli se k nim mám dostat, musím si napřed opatřit jejich zbroj."); 

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

	description	 = 	"Co za chudáka jste poslali do těch bažin?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //A kterého chudáka jste do té bažiny poslali?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Jmenuje se Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Obávám se, že se moc daleko nedostal.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas poslal do bažin nějakého Lanceho a teď se bojí, že se asi moc daleko nedostal."); 
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

	description	 = 	"Kde bych našel zbroj banditů, která by mi sedla?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //Kde najdu zbroj banditů, která by mi padla?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Na západě by měl být tábor pirátů.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Pokud víme, jsou s bandity v kontaktu.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Neřekl bych, že tě napadnou, sotva se k nim přiblížíš.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Možná tam najdeš nějakou pomoc.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas tvrdí, že by mi s tou zbrojí mohli pomoci piráti."); 
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

	description	 = 	"Našel jsem Lanceovo tělo.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Našel jsem Lancovo tělo.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //Kéž jeho duše vstoupí do království Adanova.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Dej pozor, synu. Už nechci oplakávat žádnou další smrt.
	
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

	description	 = 	"Tady je Lanceův akvamarínový prsten.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Tady je Lancův akvamarínový prsten.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Radši mi ho dej, ať nepadne do nesprávných rukou.
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

	description	 = 	"Co se týče těch relikvií...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //Co se týče těch relikvií...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Myslím, že tu pro tebe něco mám.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Tyhle kamenné tabulky už známe. Nic nového už se z nich nedovíme.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Musí jich být ještě víc.
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
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //To vypadá dobře. Kde jsi to našel?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Předal jsem Saturasovi následující relikvie:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Banditi tyhle kamenné tabulky používají jako měnu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Nesou znamení velkého válečníka Quarhodrona.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Je velitelem toho, jehož syn Rhademes způsobil pád celého města.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(pohrdavě) Tss. Vsadím se, že ti banditi ani nevědí, s čím to vlastně obchodují.
				Log_AddEntry (TOPIC_Addon_Relicts,"Červenou tabulku, která banditům slouží jako platidlo. Nese jméno mocného válečníka Quarhodrona."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //Tyhle tabulky jsem našel v budově na jihu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Á, tabulka strážců smrti. Byli to právě oni, kteří vyvolali duchy mrtvých.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Stavitelé byli velmi silně spojeni se svými předky.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Tyhle tabulky jsem našel v budově na jihozápadě.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Soudě podle té tabulky to má něco společného s ubikacemi pro městské kněze.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Velekněz se jmenoval KHARDIMON. Moc o něm zatím nevíme.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Tohle leželo v budově u velké bažiny.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Nejspíš to býval dům léčitelů.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Moc o nich nevíme. Nejspíš zmizeli jako první.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Tohle leželo ve velké budově hluboko v rokli.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //Bývala to knihovna dávného lidu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Evidentně tabulka učenců.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Spousta písemností, které jsme našli, se odkazuje na vůdce jakési kasty učenců.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Zvláštní je, že nikde není zmíněno jeho jméno.
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
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Výborně. Obraz tohoto města už se nám pomalu vyjasňuje, ale ještě stále nevíme dost.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //Určitě tu musí být někde ukryto pět těchto kamenných tabulek.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Najdi je a přines mi je.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //Tady máš za odměnu trochu zlata.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Teď už jsme získali všechny relikvie, které potřebujeme.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Prokázals nám velkou službu. Děkuji ti.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //Tohle bude rozhodující krok v našich studiích.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Uvidím, jestli se dá něco dělat.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Dobře, ale pospěš si, čas hraje proti nám.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Dobře že jsi přišel. Objevili jsme nové věci, o které se s tebou musíme podělit.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Tak to vyklopte.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //To potopené město kdysi neslo jméno Jharkendar. Spravovalo je pět vládců, kteří se vzájemně dělili o moc nad svým lidem.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Každý z nich měl vlastní sídlo, kde žil a kde uchovával svůj majetek.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Při hledání relikvií se proto musíš soustředit zejména na jejich sídla.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "A co když ty domy už dávno neexistují?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Kde bych měl ta sídla hledat?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Kde bych ta sídla našel?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Strukturu jharkendarských staveb studuje Riordian.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Poví ti, kde bys měl ta sídla hledat.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas chce, abych prohledal sídla stavitelů a poohlédl se tam po něčem užitečném. Kde se ty stavby nacházejí, se mám optat Riordiana."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //A co když už neexistují?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Pokud nenajdeš domy, pak jsou pravděpodobně pohřbeny spolu s městem.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Ale pokud stále existují, mohou být pro naše studia neocenitelným přínosem.
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

	description	 = 	"Proč potřebuješ těch pět kamenných tabulek?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Proč potřebujete těch pět kamenných tabulek?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Záznamy, které jsme v těchto rozvalinách našli, nejsou úplné.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Ale písemné záznamy stavitelů hovoří o pěti vládcích, kteří toto město spravovali.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Jako symbol moci nosil každý z nich jednu z těchto tabulek.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Myslím, že na těch tabulkách najdeme odpovědi na naše otázky.
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

	description	 = 	"Nefarius říkal něco o povodni.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius mi vyprávěl o povodni.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Je psáno, že sám Adanos sestoupil z nebes, aby ztrestal nevěřící a vyhnal je do říše mrtvých.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //Ve svém božském hněvu dopustil, aby moře vystoupilo z břehů a stavitele tohoto města smetlo z povrchu zemského.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //Připomínkou těchto dávných událostí je bažina na východě.

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
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Co mohlo Adana tak rozzuřit?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Chrám v tomto městě býval kdysi velkou a slavnou stavbou.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Každý zde uctíval boha Adana a modlil se k němu.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Avšak Rhademes, syn velitele Quarhodrona, tento chrám znesvětil.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Spousta lidí pak podlehla svodům zla.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Počítám, že Adanos mu ten čin neodpustil a jeho hněv dopadl na celou zemi.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Tím spíše je důležité Havrana zastavit, protože ten se chystá učinit to samé.
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

	description	 = 	"Co se týče Havrana...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //Co se týče Havrana...
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Byl jsem v táboře banditů na východě. Havran je jejich velitelem.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Ale napřed musím z cesty odklidit pár banditů, jinak se k Havranovi nedostanu.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Dobře, tak hodně štěstí. A nezapomeň, že to musíš zvládnout co nejrychleji.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Havran nesmí svůj plán uskutečnit za žádnou cenu.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Má tam zlatý důl a vězni mu v něm těží zlato.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //To je mu podobné. Musíme odtamtud ty vězně dostat.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(povzdech) Ano, samozřejmě. Pracuju na tom.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Mezi bandity je i jeden chlápek, co tvrdí, že ví, co má Havran v plánu.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Jmenuje se Fortuno. Havran se prý chce dostat do chrámu a ukrást tam nějaký velice mocný artefakt.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //A ví o tom artefaktu něco bližšího?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Prozradil mi jen, že Havran nechal otevřít hrob Adanova kněze.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Tam by se měl nacházet klíč ke chrámu. Měl by ses tam porozhlédnout.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Havran vězně přinutil, aby vykopali knězův hrob.
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
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Přišel jsem příliš pozdě. Přímo před očima mi zmizel do Adanova chrámu.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(znepokojeně) Cože? Tak to je KATASTROFA! Proč jsi nešel za ním?

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
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Chceš mi ohlásit něco nového?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Zatím nic.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Radím ti, nepodceňuj Havrana, rozumíš?
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
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Nemohl jsem za ním. Zablokoval vchod zevnitř.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //(chvatně) Musím uvažovat.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //Otázka zní, jak se Havran dostal do chrámu.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Co udělal, než prošel portálem?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Přednesl před bránou nějaké zaříkání.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //A ještě předtím?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Otevřel pohřební místnost.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //To už jsem ti řekl.
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Správně!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //Vím jen, že tam určitě provedl nějaký rituál.
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //(přemýšlí) Rituál.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //(konečně na to přišel) Ano! To je ono!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Obávám se, že si Havran přivlastnil moc strážců smrti.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //O chrámu se dozvěděl od ducha!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Musíš jít za Myxirem a tohle všechno mu povědět!
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Havran získal moc strážců smrti. O Adanově chrámu se dozvěděl od nějakého ducha. Musím zajít za Myxirem a zpravit ho o tom.");  
	
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
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Hovořil jsem s Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //A co říkal?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //Pomůže mi, jedině když naleznu odpověď na jeho otázky.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //A kde je tedy problém?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Nevím jistě, zda ty odpovědi znám.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Hmm, víme, že na severu města si učenci vybudovali knihovnu.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Velmi pečlivě zaznamenávali všechny tehdejší události.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Snad tam najdeš i odpovědi, které po tobě Quarhodron chce.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas se domnívá, že odpovědi na Quarhodronovy otázky najdu v knihovně učenců, která leží daleko na severu."); 

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

	description	 = 	"Ten problém s branou do chrámu už jsem vyřešil.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Problém s chrámem už je vyřešen.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //A promluvil ten duch?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Ano, promluvil.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Pak tedy už víš, jak se dostat do chrámu.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Správně. A taky mi prozradil, co v chrámu najdu.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Hovořil o mocném meči, který je ukryt v Adanových komnatách.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(zoufale) Při Adanovi! Jsme to ale tupci! Jak jsme mohli být tak hloupí!
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //(roztřeseně) Ty náznaky v záznamech.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //(vzrušeně) Ten meč může být jedině Beliarův dráp.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Musíme se co nejdřív dostat do těch komnat a zmocnit se té zbraně!
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co to je ten 'Beliarův dráp'?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co jsou to komnaty Adanovy?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Co je to ten Beliarův dráp?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //Je to ztělesnění zla. Dílo samotného BELIARA!
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Každý, kdo jej nosí, má v rukou nástroj strašlivé zkázy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Čím mocnější je jeho nositel, tím větší sílu v sobě tají i Dráp.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Jeho kouzlu odolá pouze ten, jehož duch je silný a víra neoblomná.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //Teď už je mi jasné, proč stavitelé toto údolí uzavřeli.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Přinesli do města zkázonosnou zbraň a podlehli její zlé moci.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Ti namyšlení blázni se pak z nenasytnosti navzájem pobili.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Krutosti nebraly konce, dokud na celou zemi nedopadl Adanův hněv a vše nezatopilo moře.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //Jasně. Tvůrci portálu udělali dobře, že tyto věci ukryli před zbytkem světa.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Jaký tragický konec to postihl tak úžasnou kulturu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //Už si uvědomuješ, jak je tvůj úkol naléhavý?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Havran je silný bojovník a navíc je zaslepený touhou po moci.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //V jeho rukou bude Dráp strašlivým nástrojem zkázy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Nesmí se k té zbrani dostat, jinak bude vše ztraceno.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"V Adanově chrámu je ukryta mocná zbraň. Říká se jí 'Beliarův dráp'. Něco tak mocného se Havranovi nesmí dostat do rukou."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //A co jsou ty Adanovy komnaty?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Nyní už víme, že vchod není jedinou překážkou, která nám brání ve vstupu do chrámu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //V samotném chrámu jsou tři komnaty, které mají odradit všechny vetřelce.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Klíčem jsou barevné relikvie stavitelů.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Pouze když shromáždíme všechny relikvie a rozřešíme jejich hádanky, dostaneme se do vnitřní svatyně chrámu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Nevím, zda Havran už tyto hádanky rozřešil, ale pokud se mu to podařilo, pak máme velký problém.
	
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

	description	 = 	"Co přesně bych měl s těmi relikviemi v chrámu dělat?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Co přesně bych měl s těmi relikviemi v chrámu dělat?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Víme příliš málo. Ale doufejme, že až se dostaneš do chrámu, zjistíš sám, k čemu slouží.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Lituji, že ti nemohu říci více. Všechno už je teď na tobě.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Seber relikvie a okamžitě se vydej do chrámu.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas mě poslal do Adanova chrámu s pěti relikviemi stavitelů, abych se dostal skrze jeho komnaty a zastavil Havrana."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Kéž tě milosrdný Adanos provází.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Snad ještě není příliš pozdě.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Zemětřesení ustala a jak vidím, ještě stále jsi mezi živými.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Znamená to, že jsi ve svém snažení uspěl?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Ano. Havran je mrtvý.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //Takže už je to za námi. Díky Adanovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Vedl sis dobře, synu. Jsme ti velice zavázáni.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Vyrval jsi ze spárů zla velmi mocnou zbraň a znovu nastolil rovnováhu v tomhle koutě světa.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Když zemětřesení ustala, diskutovali jsme, co by se teď mělo stát, a došli jsme k závěru.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Běž a vezmi si Beliarův dráp. Od nynějška jej můžeš nosit.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //Ve tvých rukou se nám snad stane mocným spojencem.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //Užívej ho moudře, můj synu. Kéž ti Adanos pomůže.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //My zůstaneme zde a postaráme se, aby chrám brzy dosáhl své bývalé skvělosti.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Pouze Myxir je na cestě do Khorinidu, aby pomohl Vatrasovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras už byl ve městě příliš dlouho.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir byl vyslán, aby pomohl Vatrasovi v přístavu."); 

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

	description	 = 	"Osvobodil jsem vězně.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Osvobodil jsem vězně.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Výborně. Kéž se v pořádku vrátí do vlasti.
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

	description	 = 	"Získal jsem 'Beliarův dráp'.";
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
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //Beliarův dráp je velmi ZVLÁŠTNÍ zbraň.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Má vlastní vůli a vědomí.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //A ty, který nyní tuto zbraň nosíš, jsi jeho pánem a vládcem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Je tvou součástí a přizpůsobí se tvým schopnostem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Ale udělá to pouze ze své vlastní vůle.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //A k tomu ho může přesvědčit pouze samotný BELIAR.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "A proč by mi měl Beliar pomáhat?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Co můžu s tou zbraní dělat?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //A co mám s tou zbraní tedy dělat?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //To závisí na tobě. Zmocnil ses této zbraně a nyní jsi jejím pánem.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Můžu ti jen naznačit, jaké máš možnosti.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Buď ho dáš MNĚ a já dohlédnu na to, aby už nezpůsobil žádnou další škodu...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //...nebo si přivlastníš jeho moc a budeš s ním bojovat.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Copak tu zbraň nemůžeš uložit někde v bezpečí?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Nemůžeš tu zbraň uklidit někam do bezpečí?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des Bösen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschließt, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Když mi ji dáš, pak ji zneškodním, aby už ji nikdo nikdy nemohl zneužít.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Tak se pořádně rozmysli, co uděláš.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Mohu dát Beliarův dráp Saturasovi, nebo si jej nechat pro sebe."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //A proč by mi měl Beliar pomáhat?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Dosáhneš toho pouze modlitbou k Beliarovi.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Ale buď opatrný – Beliar je zákeřný.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Pokud ho rozhněváš, dá ti svůj hněv jaksepatří pocítit.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Mám-li Dráp podrobit své vůli, musím se pomodlit k Beliarovi.");

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

	description	 = 	"Co teď budeš dělat?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //Co budete dělat teď?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Zůstaneme tady a postaráme se, aby chrám dosáhl své bývalé slávy.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Za ty věky jsou jeho stěny přímo v žalostném stavu.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //A co se týče tebe, můj synu...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Jsem rád, že jsem se v tobě nezklamal. Stal se z tebe ochránce rovnováhy. Už o tom není pochyb.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Nebýt tvé odvahy a síly, ostrov Khorinis by se potopil. Děkujeme ti a v duchu ti budeme stále vzdávat čest.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Nyní se věnuj jiným úkolům, jež leží před tebou, a navrať do tohoto světa rovnováhu a mír.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Nyní běž a naplň svůj osud, ochránče. Naše modlitby tě budou provázet.
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

	description	 = 	"Vezmi si 'Beliarův dráp' a znič ho.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //Vezmi si Beliarův dráp a znič jej.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Jak si přeješ, synu. Dej mi ho.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Tak už nezpůsobí žádné zlo – potopím jej do mořských hlubin.
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

	description	 = 	"Můžeš mě zasvětit do kruhů magie?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Můžeš mě zasvětit do kruhů magie?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Tys mágem ohně. Co by tomu řekl Pyrokar?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //To nikdo nemusí vědět.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(povzdech) Vidím, že to myslíš vážně, a tak tvé prosbě vyhovím.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Ale mám pocit, že naše vědění je ve špatných rukou. S mou pomocí už nadále nepočítej.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //Neměl jsi mě zklamat.
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
	description	 = 	"Chci postoupit na další magickou úroveň.";
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
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Chci si osvojit vyšší úrovně magie.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Ano, jsi připraven vylepšit své vědomosti.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Nyní vstupuješ do druhého kruhu magie. Kéž ti Adanos dá sílu používat moc, kterou ti ve své velkolepé moudrosti propůjčil.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Ano, teď nastal ten správný čas. Nyní vstupuješ do třetího kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Jsi moudřejší a můžeš používat nová a mocnější kouzla. Užívej je opatrně.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //Čas nadešel. Jsi připraven vstoupit do čtvrtého kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Mocná jsou tvá slova i skutky. Nová kouzla vol vždy opatrně a s rozmyslem.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Poskytneme ti výsadu vstoupit do pátého kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Kouzla, která se nyní naučíš, budou skutečně ničivá.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //Proto si uvědomuj svou moc a nikdy nepodléhej velkolepým iluzím.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //To už není můj úkol.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //K zasvěcení do šestého a posledního kruhu magie musíš zajít do kláštera ohnivých mágů.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Ještě je příliš brzy. Vrať se později.
	};
};

















