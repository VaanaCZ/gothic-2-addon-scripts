
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
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Kéž tę Adanos provází.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Konečnę jsi tady – díky Adanovi. Už jsme mysleli, že se tu neukážeš.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(zmatenę) Cože? Jak to, že už jsi TADY?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Prošel jsi portálem a my tę hned následovali. Netrvalo dlouho a dorazili jsme i sem.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Po tobę ale nebylo ani vidu. Už jsme tu nękolik dní.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(pâekvapenę) NĘKOLIK DNÍ? Jak je to možné?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Když jsme tę nikde nemohli najít, Nefarius začal pátrat, kde se stala chyba. A zmatený je z toho až doteë.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //Ale hlavnę že jsi tady a můžeme začít pracovat.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co se mezitím stalo?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //Co se stalo mezitím?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Nasbírali jsme spoustu nových informací.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Ta zemętâesení jsou tu skutečnę SILNĘJŠÍ. Už nejsme daleko od epicentra.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Stavitelé tęchto starých budov tu kdysi postavili celé męsto, aspoŕ co zatím můžeme âíci.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Z nęjakého důvodu však jejich civilizace zanikla.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Proč, to se zatím můžeme jen dohadovat.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Našli jste nęjakou stopu po tęch pohâešovaných?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "A co Havran?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //A co Havran?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //Havran se v dopise zmiŕoval o nęjakém chrámu a že se snažil dostat dovnitâ.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Všichni jsme toho názoru, že ten chrám, který chce Havran znesvętit, patâí Adanovi.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Ta zemętâesení jsou určitę výsledkem ëábelského zaklínání, které se stâetlo s mocným kouzlem.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Brány chrámu jsou magicky uzavâeny a tohle je ta samá magie, která probouzí ty kamenné strážce.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //Chrám se brání sám. Musíme Havrana zastavit, ještę než pronikne do nejsvętęjší svatynę.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "A co bude dál?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Havran je bývalý rudobaron, žádný mág.", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co chce Havran v tom chrámu najít?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //Co Havran v tom chrámu vlastnę chce?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder Mächtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir können davon ausgehen, dass er nichts Gutes im Schilde führt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //Víme jen to, že to má nęco společného s mocným artefaktem, který je nęjak spojen s Adanem a Beliarem.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(zarputile) Jisté je jenom to, že rozhodnę nejde po ničem dobrém.
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Havran je jen bývalý rudobaron, žádný mág. Jak zrovna ON může provést takovouhle invokaci?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Možná není sám, tâeba podplatil nęjakého odpadlého mága.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //Aă je to, jak chce, MUSÍME pâedcházet zlu.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //Našel jsi nęjakou stopu po tęch pohâešovaných?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Jen včera jsme našli rybáâovo tęlo. Leželo pod jednou z tęch rozvalin na východę.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Nejspíš šlo o rybáâe z Khorinidu. Męl by ses na to podívat.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //Co bude dál?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //MY zůstaneme tady a budeme dál studovat tu starobylou kulturu.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Ty staré texty stavitelů obsahují spoustu tajemství, která musíme odhalit. Pokud tedy chceme zjistit, co se tam tenkrát stalo.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //Mezitím pro nás ale musíš zjistit pár vęcí.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Co mám udęlat?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //Co mám dęlat?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Musíš najít Havrana a postarat se, aby nemohl znesvętit Adanův chrám.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Tím myslíš, že ho mám ZABÍT.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Pokud to bude jediný způsob, jak ho zastavit, pak v Adanovę jménu ANO!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //Jinak sbírej všechny staré relikvie a písemnosti, které tu staâí stavitelé zanechali, a pâines nám je.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Musíme zjistit víc o tomto lidu a odhalit důvod, proč odešel.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //Havranovy plány musíme napâed znát, abychom jim mohli čelit.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Krom toho musíš zjistit, jak osvobodit otroky.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(cynicky) A to je všecko? To zvládnu levou zadní.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(otrávenę) Já vím, že po tobę chceme moc. Ber to jako šanci znovu získat mou důvęru.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran znesvęcuje posvátný Adanův chrám. Musím ho zastavit, i kdybych ho pâitom męl zabít."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas chce, abych osovodil otroky."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas mę požádal, abych mu pâinesl cokoliv, co by mohlo odhalit nęco bližšího o dávných stavitelích."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Tak já půjdu.", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //Tak já tedy půjdu.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Ještę nęco – Havran se obklopil spoustou banditů.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //Bęhem tvé nepâítomnosti dorazil další člen kruhu vody.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Poslali jsme ho do bažiny. Ještę se nevrátil.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Počítáme, že banditi napadnou každého, kdo nebude vypadat jako oni.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //Takže si poâië brnęní banditů.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //To je jediný způsob, jak se k nim pâiblížit, aniž by tę napadli.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Banditi stâílí na každého, kdo nepatâí mezi nę. Jestli se k nim mám dostat, musím si napâed opatâit jejich zbroj."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Začít");
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

	description	 = 	"Co za chudáka jste poslali do tęch bažin?";
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
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas poslal do bažin nęjakého Lanceho a teë se bojí, že se asi moc daleko nedostal."); 
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
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Na západę by męl být tábor pirátů.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Pokud víme, jsou s bandity v kontaktu.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //Neâekl bych, že tę napadnou, sotva se k nim pâiblížíš.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Možná tam najdeš nęjakou pomoc.

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

	description	 = 	"Našel jsem Lanceovo tęlo.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //Našel jsem Lancovo tęlo.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //Radši mi ho dej, aă nepadne do nesprávných rukou.
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

	description	 = 	"Co se týče tęch relikvií...";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //Co se týče tęch relikvií...
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Myslím, že tu pro tebe nęco mám.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Tyhle kamenné tabulky už známe. Nic nového už se z nich nedovíme.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Musí jich být ještę víc.
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
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //To vypadá dobâe. Kde jsi to našel?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Pâedal jsem Saturasovi následující relikvie:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Banditi tyhle kamenné tabulky používají jako męnu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Nesou znamení velkého válečníka Quarhodrona.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Je velitelem toho, jehož syn Rhademes způsobil pád celého męsta.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(pohrdavę) Tss. Vsadím se, že ti banditi ani nevędí, s čím to vlastnę obchodují.
				Log_AddEntry (TOPIC_Addon_Relicts,"Červenou tabulku, která banditům slouží jako platidlo. Nese jméno mocného válečníka Quarhodrona."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //Tyhle tabulky jsem našel v budovę na jihu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //Á, tabulka strážců smrti. Byli to právę oni, kteâí vyvolali duchy mrtvých.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //Stavitelé byli velmi silnę spojeni se svými pâedky.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //Tyhle tabulky jsem našel v budovę na jihozápadę.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //Soudę podle té tabulky to má nęco společného s ubikacemi pro męstské knęze.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //Veleknęz se jmenoval KHARDIMON. Moc o nęm zatím nevíme.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Tohle leželo v budovę u velké bažiny.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Nejspíš to býval dům léčitelů.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //Moc o nich nevíme. Nejspíš zmizeli jako první.
				Log_AddEntry (TOPIC_Addon_Relicts,"#NAME?"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Tohle leželo ve velké budovę hluboko v rokli.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //Bývala to knihovna dávného lidu.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Evidentnę tabulka učenců.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Spousta písemností, které jsme našli, se odkazuje na vůdce jakési kasty učenců.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Zvláštní je, že nikde není zmínęno jeho jméno.
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
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Výbornę. Obraz tohoto męsta už se nám pomalu vyjasŕuje, ale ještę stále nevíme dost.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //Určitę tu musí být nękde ukryto pęt tęchto kamenných tabulek.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //Najdi je a pâines mi je.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //Tady máš za odmęnu trochu zlata.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Teë už jsme získali všechny relikvie, které potâebujeme.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Prokázals nám velkou službu. Dękuji ti.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //Tohle bude rozhodující krok v našich studiích.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Uvidím, jestli se dá nęco dęlat.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Dobâe, ale pospęš si, čas hraje proti nám.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Dobâe že jsi pâišel. Objevili jsme nové vęci, o které se s tebou musíme podęlit.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Tak to vyklopte.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //To potopené męsto kdysi neslo jméno Jharkendar. Spravovalo je pęt vládců, kteâí se vzájemnę dęlili o moc nad svým lidem.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Každý z nich męl vlastní sídlo, kde žil a kde uchovával svůj majetek.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Pâi hledání relikvií se proto musíš soustâedit zejména na jejich sídla.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "A co když ty domy už dávno neexistují?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "Kde bych męl ta sídla hledat?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //Kde bych ta sídla našel?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Strukturu jharkendarských staveb studuje Riordian.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //Poví ti, kde bys męl ta sídla hledat.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas chce, abych prohledal sídla stavitelů a poohlédl se tam po nęčem užitečném. Kde se ty stavby nacházejí, se mám optat Riordiana."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //A co když už neexistují?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Pokud nenajdeš domy, pak jsou pravdępodobnę pohâbeny spolu s męstem.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Ale pokud stále existují, mohou být pro naše studia neocenitelným pâínosem.
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

	description	 = 	"Proč potâebuješ tęch pęt kamenných tabulek?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //Proč potâebujete tęch pęt kamenných tabulek?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Záznamy, které jsme v tęchto rozvalinách našli, nejsou úplné.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Ale písemné záznamy stavitelů hovoâí o pęti vládcích, kteâí toto męsto spravovali.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Jako symbol moci nosil každý z nich jednu z tęchto tabulek.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Myslím, že na tęch tabulkách najdeme odpovędi na naše otázky.
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

	description	 = 	"Nefarius âíkal nęco o povodni.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius mi vyprávęl o povodni.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Je psáno, že sám Adanos sestoupil z nebes, aby ztrestal nevęâící a vyhnal je do âíše mrtvých.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //Ve svém božském hnęvu dopustil, aby moâe vystoupilo z bâehů a stavitele tohoto męsta smetlo z povrchu zemského.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //Pâipomínkou tęchto dávných událostí je bažina na východę.

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
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //Co mohlo Adana tak rozzuâit?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //Chrám v tomto męstę býval kdysi velkou a slavnou stavbou.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Každý zde uctíval boha Adana a modlil se k nęmu.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Avšak Rhademes, syn velitele Quarhodrona, tento chrám znesvętil.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Spousta lidí pak podlehla svodům zla.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Počítám, že Adanos mu ten čin neodpustil a jeho hnęv dopadl na celou zemi.
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
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Byl jsem v táboâe banditů na východę. Havran je jejich velitelem.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Ale napâed musím z cesty odklidit pár banditů, jinak se k Havranovi nedostanu.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Dobâe, tak hodnę štęstí. A nezapomeŕ, že to musíš zvládnout co nejrychleji.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Havran nesmí svůj plán uskutečnit za žádnou cenu.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Má tam zlatý důl a vęzni mu v nęm tęží zlato.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //To je mu podobné. Musíme odtamtud ty vęznę dostat.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(povzdech) Ano, samozâejmę. Pracuju na tom.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Mezi bandity je i jeden chlápek, co tvrdí, že ví, co má Havran v plánu.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Jmenuje se Fortuno. Havran se prý chce dostat do chrámu a ukrást tam nęjaký velice mocný artefakt.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //A ví o tom artefaktu nęco bližšího?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //Prozradil mi jen, že Havran nechal otevâít hrob Adanova knęze.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //Tam by se męl nacházet klíč ke chrámu. Męl by ses tam porozhlédnout.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Havran vęznę pâinutil, aby vykopali knęzův hrob.
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
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Pâišel jsem pâíliš pozdę. Pâímo pâed očima mi zmizel do Adanova chrámu.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(znepokojenę) Cože? Tak to je KATASTROFA! Proč jsi nešel za ním?

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
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //Chceš mi ohlásit nęco nového?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Zatím nic.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //Radím ti, nepodceŕuj Havrana, rozumíš?
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
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //Nemohl jsem za ním. Zablokoval vchod zevnitâ.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //(chvatnę) Musím uvažovat.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //Otázka zní, jak se Havran dostal do chrámu.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //Co udęlal, než prošel portálem?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Pâednesl pâed bránou nęjaké zaâíkání.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //A ještę pâedtím?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Otevâel pohâební místnost.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //To už jsem ti âekl.
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //Správnę!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //Vím jen, že tam určitę provedl nęjaký rituál.
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //(pâemýšlí) Rituál.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //(konečnę na to pâišel) Ano! To je ono!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Obávám se, že si Havran pâivlastnil moc strážců smrti.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //O chrámu se dozvędęl od ducha!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //Musíš jít za Myxirem a tohle všechno mu povędęt!
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Havran získal moc strážců smrti. O Adanovę chrámu se dozvędęl od nęjakého ducha. Musím zajít za Myxirem a zpravit ho o tom.");  
	
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
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //Hovoâil jsem s Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //A co âíkal?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //Pomůže mi, jedinę když naleznu odpovęë na jeho otázky.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //A kde je tedy problém?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //Nevím jistę, zda ty odpovędi znám.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Hmm, víme, že na severu męsta si učenci vybudovali knihovnu.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Velmi pečlivę zaznamenávali všechny tehdejší události.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Snad tam najdeš i odpovędi, které po tobę Quarhodron chce.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas se domnívá, že odpovędi na Quarhodronovy otázky najdu v knihovnę učenců, která leží daleko na severu."); 

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

	description	 = 	"Ten problém s branou do chrámu už jsem vyâešil.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //Problém s chrámem už je vyâešen.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //A promluvil ten duch?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //Ano, promluvil.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Pak tedy už víš, jak se dostat do chrámu.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Správnę. A taky mi prozradil, co v chrámu najdu.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Hovoâil o mocném meči, který je ukryt v Adanových komnatách.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(zoufale) Pâi Adanovi! Jsme to ale tupci! Jak jsme mohli být tak hloupí!
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //(roztâesenę) Ty náznaky v záznamech.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //(vzrušenę) Ten meč může být jedinę Beliarův dráp.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Musíme se co nejdâív dostat do tęch komnat a zmocnit se té zbranę!
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co to je ten 'Beliarův dráp'?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "Co jsou to komnaty Adanovy?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //Co je to ten Beliarův dráp?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //Je to ztęlesnęní zla. Dílo samotného BELIARA!
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Každý, kdo jej nosí, má v rukou nástroj strašlivé zkázy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Čím mocnęjší je jeho nositel, tím vętší sílu v sobę tají i Dráp.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //Jeho kouzlu odolá pouze ten, jehož duch je silný a víra neoblomná.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //Teë už je mi jasné, proč stavitelé toto údolí uzavâeli.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Pâinesli do męsta zkázonosnou zbraŕ a podlehli její zlé moci.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Ti namyšlení blázni se pak z nenasytnosti navzájem pobili.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //Krutosti nebraly konce, dokud na celou zemi nedopadl Adanův hnęv a vše nezatopilo moâe.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //Jasnę. Tvůrci portálu udęlali dobâe, že tyto vęci ukryli pâed zbytkem svęta.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Jaký tragický konec to postihl tak úžasnou kulturu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //Už si uvędomuješ, jak je tvůj úkol naléhavý?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Havran je silný bojovník a navíc je zaslepený touhou po moci.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //V jeho rukou bude Dráp strašlivým nástrojem zkázy.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //Nesmí se k té zbrani dostat, jinak bude vše ztraceno.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"V Adanovę chrámu je ukryta mocná zbraŕ. Âíká se jí 'Beliarův dráp'. Nęco tak mocného se Havranovi nesmí dostat do rukou."); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //A co jsou ty Adanovy komnaty?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Nyní už víme, že vchod není jedinou pâekážkou, která nám brání ve vstupu do chrámu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //V samotném chrámu jsou tâi komnaty, které mají odradit všechny vetâelce.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Klíčem jsou barevné relikvie stavitelů.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //Pouze když shromáždíme všechny relikvie a rozâešíme jejich hádanky, dostaneme se do vnitâní svatynę chrámu.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //Nevím, zda Havran už tyto hádanky rozâešil, ale pokud se mu to podaâilo, pak máme velký problém.
	
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

	description	 = 	"Co pâesnę bych męl s tęmi relikviemi v chrámu dęlat?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //Co pâesnę bych męl s tęmi relikviemi v chrámu dęlat?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Víme pâíliš málo. Ale doufejme, že až se dostaneš do chrámu, zjistíš sám, k čemu slouží.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Lituji, že ti nemohu âíci více. Všechno už je teë na tobę.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Seber relikvie a okamžitę se vydej do chrámu.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas mę poslal do Adanova chrámu s pęti relikviemi stavitelů, abych se dostal skrze jeho komnaty a zastavil Havrana."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Kéž tę milosrdný Adanos provází.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Snad ještę není pâíliš pozdę.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Zemętâesení ustala a jak vidím, ještę stále jsi mezi živými.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //Znamená to, že jsi ve svém snažení uspęl?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //Ano. Havran je mrtvý.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //Takže už je to za námi. Díky Adanovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Vedl sis dobâe, synu. Jsme ti velice zavázáni.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Vyrval jsi ze spárů zla velmi mocnou zbraŕ a znovu nastolil rovnováhu v tomhle koutę svęta.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Když zemętâesení ustala, diskutovali jsme, co by se teë męlo stát, a došli jsme k závęru.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Bęž a vezmi si Beliarův dráp. Od nynęjška jej můžeš nosit.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //Ve tvých rukou se nám snad stane mocným spojencem.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //Užívej ho moudâe, můj synu. Kéž ti Adanos pomůže.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //My zůstaneme zde a postaráme se, aby chrám brzy dosáhl své bývalé skvęlosti.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //Pouze Myxir je na cestę do Khorinidu, aby pomohl Vatrasovi.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras už byl ve męstę pâíliš dlouho.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Myxir byl vyslán, aby pomohl Vatrasovi v pâístavu."); 

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

	description	 = 	"Osvobodil jsem vęznę.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //Osvobodil jsem vęznę.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Výbornę. Kéž se v poâádku vrátí do vlasti.
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
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //Beliarův dráp je velmi ZVLÁŠTNÍ zbraŕ.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Má vlastní vůli a vędomí.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //A ty, který nyní tuto zbraŕ nosíš, jsi jeho pánem a vládcem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Je tvou součástí a pâizpůsobí se tvým schopnostem.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Ale udęlá to pouze ze své vlastní vůle.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //A k tomu ho může pâesvędčit pouze samotný BELIAR.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "A proč by mi męl Beliar pomáhat?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Co můžu s tou zbraní dęlat?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //A co mám s tou zbraní tedy dęlat?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //To závisí na tobę. Zmocnil ses této zbranę a nyní jsi jejím pánem.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Můžu ti jen naznačit, jaké máš možnosti.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //Buë ho dáš MNĘ a já dohlédnu na to, aby už nezpůsobil žádnou další škodu...
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //...nebo si pâivlastníš jeho moc a budeš s ním bojovat.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "Copak tu zbraŕ nemůžeš uložit nękde v bezpečí?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //Nemůžeš tu zbraŕ uklidit nękam do bezpečí?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des Bösen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschließt, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Když mi ji dáš, pak ji zneškodním, aby už ji nikdo nikdy nemohl zneužít.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //Tak se poâádnę rozmysli, co udęláš.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Mohu dát Beliarův dráp Saturasovi, nebo si jej nechat pro sebe."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //A proč by mi męl Beliar pomáhat?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //Dosáhneš toho pouze modlitbou k Beliarovi.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Ale buë opatrný – Beliar je zákeâný.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Pokud ho rozhnęváš, dá ti svůj hnęv jaksepatâí pocítit.
	
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

	description	 = 	"Co teë budeš dęlat?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //Co budete dęlat teë?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Zůstaneme tady a postaráme se, aby chrám dosáhl své bývalé slávy.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Za ty vęky jsou jeho stęny pâímo v žalostném stavu.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //A co se týče tebe, můj synu...
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Jsem rád, že jsem se v tobę nezklamal. Stal se z tebe ochránce rovnováhy. Už o tom není pochyb.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Nebýt tvé odvahy a síly, ostrov Khorinis by se potopil. Dękujeme ti a v duchu ti budeme stále vzdávat čest.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Nyní se vęnuj jiným úkolům, jež leží pâed tebou, a navraă do tohoto svęta rovnováhu a mír.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Nyní bęž a naplŕ svůj osud, ochránče. Naše modlitby tę budou provázet.
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
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Jak si pâeješ, synu. Dej mi ho.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Tak už nezpůsobí žádné zlo – potopím jej do moâských hlubin.
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

	description	 = 	"Můžeš mę zasvętit do kruhů magie?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //Můžeš mę zasvętit do kruhů magie?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Tys mágem ohnę. Co by tomu âekl Pyrokar?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //To nikdo nemusí vędęt.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(povzdech) Vidím, že to myslíš vážnę, a tak tvé prosbę vyhovím.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Ale mám pocit, že naše vędęní je ve špatných rukou. S mou pomocí už nadále nepočítej.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //Nemęl jsi mę zklamat.
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
	description	 = 	"Chci postoupit na další magickou úroveŕ.";
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
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Chci si osvojit vyšší úrovnę magie.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //Ano, jsi pâipraven vylepšit své vędomosti.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Nyní vstupuješ do druhého kruhu magie. Kéž ti Adanos dá sílu používat moc, kterou ti ve své velkolepé moudrosti propůjčil.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //Ano, teë nastal ten správný čas. Nyní vstupuješ do tâetího kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Jsi moudâejší a můžeš používat nová a mocnęjší kouzla. Užívej je opatrnę.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //Čas nadešel. Jsi pâipraven vstoupit do čtvrtého kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Mocná jsou tvá slova i skutky. Nová kouzla vol vždy opatrnę a s rozmyslem.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Poskytneme ti výsadu vstoupit do pátého kruhu magie.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Kouzla, která se nyní naučíš, budou skutečnę ničivá.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //Proto si uvędomuj svou moc a nikdy nepodléhej velkolepým iluzím.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //To už není můj úkol.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //K zasvęcení do šestého a posledního kruhu magie musíš zajít do kláštera ohnivých mágů.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //Ještę je pâíliš brzy. Vraă se pozdęji.
	};
};

















