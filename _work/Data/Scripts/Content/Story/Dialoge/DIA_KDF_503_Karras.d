///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP1_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello 		(C_INFO)
{
	npc			= KDF_503_Karras;
	nr          = 1;
	condition	= DIA_Karras_Hello_Condition;
	information	= DIA_Karras_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
func int DIA_Karras_Hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Karras_Hello_Info ()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //Co pro tebe mohu udělat, novici?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Co pro tebe mohu udělat, bratře?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Do těchto komnat zavítají ctihodní Innosovi válečníci jen zřídka.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Co pro tebe mohu udělat?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(nedůvěřivě) Co tady děláš?
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Mission_Condition;
	information	 = 	DIA_Karras_Mission_Info;
	permanent    =  FALSE;
	description	 = 	"Přišel jsem si přečíst nějaké svaté texty.";
};
func int DIA_Karras_Mission_Condition ()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Mission_Info ()
{
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //Přišel jsem si přečíst nějaké svaté texty.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Rozumím. Jestli se ti podaří najít mezi náročným studiem nějaký volný čas, stav se za mnou.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //Je tady ještě jedna záležitost, ke které bych potřeboval diskrétního novice.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Aufgabe_Condition;
	information	 = 	DIA_Karras_Aufgabe_Info;
	permanent    =  FALSE;
	description	 = 	"Máš pro mě nějaký úkol?";
};
func int DIA_Karras_Aufgabe_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Karras_Mission)
	{
		return TRUE;
	};
};
func void DIA_Karras_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //Máš pro mě nějaký úkol?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Ano. Týká se to toho bláznivého Ignaze. Žije v Khorinidu a experimentuje s různými lektvary a léčivými odvary. Ale také s kouzly a magií.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //A to mě trápí. Ptám se sám sebe, jestli se jeho magie neprotiví Innosovi.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Abych se mohl přesvědčit, potřebuji nějaké jeho kouzelné svitky.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Chci, abys šel do města a získal pro mě tři jeho magické svitky.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Ale nikomu ani muk - je to jasné?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Jasně.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Tady máš 150 zlatých. To by mělo pokrýt tvé výdaje.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Mistr Karras mě poslal do města, kde mu mám obstarat tři svitky s kouzly, které vyrábí a prodává Ignaz.");

	B_GiveInvItems (self, other, ItMi_Gold,150);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Success_Condition;
	information	 = 	DIA_Karras_Success_Info;
	permanent    =  FALSE;
	description	 = 	"Tady jsou ty magické svitky, které jsi chtěl.";
};
func int DIA_Karras_Success_Condition ()
{	
	if (MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems (other, ItSc_Charm) >= 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_Success_Info ()
{
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Tady jsou ty magické svitky, které jsi chtěl.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Velmi dobře, můj mladý příteli.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //Ale teď je načase, aby ses věnoval svým studiím.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Za odměnu si vezmi tenhle čarovný svitek.
	
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP (XP_KarrasCharm);
	B_GiveInvItems (other, self, ItSc_Charm,3);
	B_GiveInvItems (self, other, ItSc_SumWolf,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Trade_Condition;
	information	 = 	DIA_Karras_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Ukaž mi své zboží.";
	trade		 =  TRUE; 
};
func int DIA_Karras_Trade_Condition ()
{	
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Karras_Trade_15_00"); //Ukaž mi své zboží.
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_JOB_Condition;
	information	 = 	DIA_Karras_JOB_Info;
	permanent    =  FALSE;
	description	 = 	"Co máš přesně na starosti?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //Co máš přesně na starosti?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Mým úkolem je cvičit mágy v umění sférické manifestace.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Co to znamená?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //No, učím je, jak vyvolávat stvoření z jiných sfér.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //Většinou se tomu říká prostě vyvolávání, i když tenhle výraz naprosto nestačí k popsání umění stvoření služebníka.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //Navíc mám několik zajímavých svitků s kouzly, které u Goraxe nenajdeš.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Ale nabízím je jen členům našeho řádu.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistr Karras z kláštera mě může zásobit svitky s kouzly - pokud se tedy stanu mágem ohně.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr 			 =  10;
	condition	 = 	DIA_Karras_TEACH_Condition;
	information	 = 	DIA_Karras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Rád bych se od tebe něčemu přiučil (vytvořit runy).";
};

func int DIA_Karras_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Karras_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //Uč mě.
	
		Info_ClearChoices   (DIA_Karras_TEACH);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
		{
			Info_AddChoice 		(DIA_Karras_TEACH,B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)),DIA_Karras_TEACH_SUMGOBL);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
		{
			Info_AddChoice	    (DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Karras_TEACHSummonWolf);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Karras_TEACH_SummonSkeleton);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Karras_TEACH_SummonGolem);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Karras_TEACH_SummonDemon);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};
		if 	(abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //V tuhle chvíli není nic, co by ses ode mě mohl naučit.
		}
		else
		{
			Info_AddChoice 		(DIA_Karras_TEACH,DIALOG_BACK,DIA_Karras_TEACH_BACK);
		};

};
FUNC VOID DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices   (DIA_Karras_TEACH);
};
FUNC VOID DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};
FUNC VOID DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);	
};
FUNC VOID DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE4_Condition;
	information	 = 	DIA_Karras_CIRCLE4_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtěl bych se naučit čtvrtý kruh magie.";
};
func int DIA_Karras_CIRCLE4_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE4_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Chtěl bych se naučit čtvrtý kruh magie.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Dobrá. Všechna znamení jsou splněna. Vstup nyní do čtvrtého kruhu, aby se v tobě probudila síla nové magie.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Prošel jsi dlouhou cestou a Innos bude i nadále osvětlovat tvou stezku.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Ještě stále není vše hotovo.
	};
};
/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE5_Condition;
	information	 = 	DIA_Karras_CIRCLE5_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtěl bych se naučit pátý kruh magie.";
};
func int DIA_Karras_CIRCLE5_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE5_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Chtěl bych se naučit pátý kruh magie.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //V tom případě nyní vstup do pátého kruhu magie. Budeš vládnout ještě silnější magií než kdykoliv předtím.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //Užívej její moc s rozvahou, bratře - temnota je stále příliš silná a naši nepřátelé též.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //Do šestého a nejvyššího kruhu magie tě doprovodit nemohu. Až přijde správný čas, zasvětí tě sám Pyrokar.
			
			B_LogEntry (Topic_KlosterTeacher,"Mistr Pyrokar mě zasvětí do šestého kruhu magie.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //Čas ještě nedozrál.
	};
};
//#####################################################################
//##
//##		Kapitel 2
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP2_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##		Kapitel 3
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_ChasePedro_Condition;
	information	 = 	DIA_Karras_ChasePedro_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};

func int DIA_Karras_ChasePedro_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Nesmíš ztrácet čas, bratře. Musíš dohonit Pedra a vrátit klášteru Innosovo oko.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Pokud nebude Oko navráceno, budeme všichni ztraceni.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Co tady děláš? Neměl bys být na cestě za tím bezpáteřním zrádcem Pedrem?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Později. Nejprve si musím něco zařídit.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Nedostane se nijak daleko.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Později. Nejprve si musím něco zařídit.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Uvědomuješ si vůbec, co tahle ztráta pro klášter znamená? Innosovo oko je mocná zbraň.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nikdo nemůže tušit, co s tím amuletem nepřítel zamýšlí, ale něco rozhodně plánuje a my mu to musíme překazit.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Takže se okamžitě vydej na cestu za tím zlodějem!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Nedostane se nijak daleko.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //To doufám, pro tvoje vlastní dobro. Pokud by měl uniknout jen proto, že se tady poflakuješ, sám tě dokopu před tribunál.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //Z čeho bys mě obvinil?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //Ze spolčování s nepřítelem. Nepotřebuješ velkou fantazii, aby sis dokázal představit, jaký by tě za to potkal trest.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Takže už neztrácej čas, protože tvůj další osud bude záviset na tom, za jakých okolností se příště setkáme.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_NeedInfo_Condition;
	information	 = 	DIA_Karras_NeedInfo_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_Karras_NeedInfo_Condition ()
{	
	if (Npc_KnowsInfo  (other ,DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Karras_NeedInfo_Info ()
{
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //Víš všechno, co potřebuješ. Ať už jsi na cestě!
	
	AI_StopProcessInfos (self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	1;	//damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition	 = 	DIA_Karras_InnosEyeRetrieved_Condition;
	information	 = 	DIA_Karras_InnosEyeRetrieved_Info;
	permanent	 = 	FALSE;
	description	 =	"Přinesl jsem zpátky Innosovo oko.";
};

func int DIA_Karras_InnosEyeRetrieved_Condition ()
{	
	if	(KAPITEL == 3)
	&& 	(MIS_NOVIZENCHASE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Karras_InnosEyeRetrieved_Info ()
{
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //Přinesl jsem zpátky Innosovo oko.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //To mi spadl kámen ze srdce, že se ti podařilo Innosovo oko nepříteli uzmout.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Ale nebezpečí nebylo odvráceno. Zlo kuje další plány a pokračuje s nebývalou agresivitou.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //To už mi také došlo.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Nedělej si ze mě šprťouchlata. Situace je vážná, velice vážná, a nemůžeme vědět, komu je možné důvěřovat.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //Nepříteli se už podařilo uvést v pokušení novice Pedra a může se mu to podařit u mnohých dalších.

	B_GivePlayerXP (XP_AMBIENT);
};
	
///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_Perm   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 5;
	condition   = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent   = TRUE;
	description = "Jak pokračují tvá studia?";
};
FUNC INT DIA_Karras_KAP3_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
		{
			return TRUE;
		};	
};
FUNC VOID DIA_Karras_KAP3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_00"); //Jak pokračují tvá studia?

	if (MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF)
	{
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //Podařilo se mi přijít na něco ohledně Pátračů.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //A co to má být?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Jsou zcela jasně démonického původu. Tedy přinejmenším jsou - nebo alespoň byli - pod vlivem démonů.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Když na ně narazíš, buď opatrný.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //Jak novátorský přístup.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Je mi líto, ale nemám dost materiálů, abych mohl vyvozovat přesnější stanoviska.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Ale kdyby se ti podařilo získat od nich něco, co bych mohl podrobit zkoumání...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras potřebuje něco, co bylo v přímém kontaktu s pátrači. Jen tak bude moci pokračovat ve svých výzkumech."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Uvidím, co se dá dělat.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Mohl by do toho být nějakým způsobem zapletený Spáč?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"A jaké materiály bys potřeboval?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Ještě stále pracuji na interpretaci důkazů souvisejících s Pátrači.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Samozřejmě - jakmile něco zjistím, dám ti okamžitě vědět.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //Nepřítel má mnoho tváří. Je velmi obtížné určit, která z nich představuje pro klášter největší nebezpečí.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Mohl by do toho být nějakým způsobem zapletený Spáč?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //Ten příběh o Spáčovi jsem slyšel. Ale tak obecně, že k tomu nemám co říci.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Démonů je bezpočet a zapletený do toho může být kterýkoliv z nich.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Takže chceš, abych ti přinesl mrtvolu?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //Ne, copak ses zbláznil? Nebezpečí, které by představovala přítomnost démonického stvoření za zdmi kláštera, by bylo příliš velké.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Bude stačit, když najdeš nějaké předměty, které jsou pro tyto tvory typické.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Zbytky démonické aury, která je obklopuje, by měly pro bližší zkoumání stačit.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //A jaké materiály bys potřeboval?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Co já vím - nějaké předměty, které jsou pro tato stvoření typické.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Takže ty chceš, abych ti přinesl mrtvolu?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Pokusím se.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //To by bylo opravdu výborné. Mezitím se budu věnovat svému vlastnímu výzkumu.
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************

INSTANCE DIA_Karras_HaveBook   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent   = FALSE;
	description = "Získal jsem Almanach posedlých.";
};
FUNC INT DIA_Karras_HaveBook_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems (hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
var int KarrasGotResearchDMTBook_Day;
FUNC VOID DIA_Karras_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //Mám u sebe Almanach posedlých. Možná by se ti mohl k něčemu hodit.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Ukaž mi ho.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Ano, to by mělo stačit. Prozkoumám tu knihu.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //Ale jedním si už jsem jistý.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //Pátrači jsou podle mě zcela zvrácená forma života vytvořená Beliarem.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Ta stvoření jsou částečně démonického a částečně lidského původu.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Ale pořád nedokážu přesně určit, jestli stojíme před typickou duchovní posedlostí, nebo čistě fyzickou mutací.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Přijď později. Pak budu určitě vědět něco víc.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras pro svůj další výzkum potřebuje Almanach posedlých. Vrátím se k němu později."); 
	KarrasGotResearchDMTBook_Day = Wld_GetDay(); 
	B_GivePlayerXP (XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************

INSTANCE DIA_Karras_ResearchDMTEnd   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent   = TRUE;

	description = "Už jsi přišel na něco nového ohledně pátračů?";
};
FUNC INT DIA_Karras_ResearchDMTEnd_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //Už jsi přišel na něco nového ohledně Pátračů?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Ano. Už vím, kdo nebo co jsou Pátrači skutečně zač.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //Nenapínej mě!
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Kdysi to bývali lidé, jako ty nebo já. Udělali osudnou chybu, když zasvětili svůj život nečisté magii velice mocného arcidémona.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Pod vlivem tohoto arcidémona a velice mocných drog žili pouze proto, aby mu sloužili, až se z nich staly jen pouhé stíny sebe sama.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Dnes nejsou nic víc než nástroje zla bez vlastní vůle, a nikdy nepřestanou lovit následovníky Innose.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Musíme být opatrní. Zdá se sice, že se zatím vyhýbají těmto posvátným Innosovým síním.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Ale pokud bude jejich moc nadále růst, netuším, jestli tu budeme v bezpečí.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Díky. To bylo vážně povzbudivé.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Opravdu? To ovšem nastoluje další otázky. Například, kým byli předtím a jaký arcidémon z nich udělal to, čím jsou dnes?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //Mám jisté podezření. Celé to zní jako bratrstvo Spáče. Znám ty chlapíky.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //Doufám, že víš, do čeho se to zaplétáš. Dávej na sebe pozor, bratře.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //Abych nezapomněl. Tady je tvůj almanach. Už ho nebudu potřebovat.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Karrasovy studie byly úspěšné. Vypadá to, že pátrači jsou nějak spojeni se Spáčovým bratrstvem."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //Pracuji na tom. Přijď později.
	};
};

//********************************************************************
//	Prot_BlackEye	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_Prot_BlackEye   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent   = TRUE;

	description = "Existuje způsob, jak se ochránit před mentálními útoky pátračů?";
};
FUNC INT DIA_Karras_Prot_BlackEye_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Existuje způsob, jak se ochránit před mentálními útoky Pátračů?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Jistě. Amulet s kamenem z posvátné půdy by měl mít požadovaný ochranný efekt.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Bohužel nemám dostatek takových kamenů.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Jsou z nich postaveny některé ze svatyní, které jsme vybudovali.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Dobrá. Však já už nějaké někde splaším.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Ano, udělej to. Ale ať tě ani nenapadne nějak poškodit ty svatyně, slyšíš?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras mě může před mentálními útoky pátračů trochu ochránit. Potřebuje k tomu ale kámen z posvátné půdy, jaký lze získat v některých svatyních."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Nemám tušení. Stále toho vím příliš málo, než abych znal odpověď. Zeptej se mě později.
	};
};

//********************************************************************
//	KarrasBlessedStone	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_KarrasBlessedStone   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;

	description = "Mám několik kamenů z posvěcené půdy.";
};
FUNC INT DIA_Karras_KarrasBlessedStone_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_HasItems (other,ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING)
	{
		return TRUE;
	};	
};
var int KarrasMakesBlessedStone_Day;
FUNC VOID DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //Mám několik kamenů z posvěcené půdy.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Výborně. Doufám, že všechny svatyně jsou stále na svých místech.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //Dobrá. Udělám ti ochranný amulet proti černému pohledu Pátračů.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Dej mi trochu času. Dám se hned do práce.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras mi dá amulet, který mě ochrání před mentálními útoky pátračů. Velmi mi to usnadní život."); 
	B_GivePlayerXP (XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos (self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************

INSTANCE DIA_Karras_ItAm_Prot_BlackEye_Mis   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent	 = 	TRUE;

	description = "Tak co je s tím ochranným amuletem, cos mi slíbil?";
};
var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
FUNC INT DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //Tak co je s tím ochranným amuletem, cos mi slíbil?
	
	if (KarrasMakesBlessedStone_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //Jsem hotov. Tady je, podívej. Vypadá nakonec nádherně.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Nos ho stále u sebe a Pátrači tě nebudou moci stáhnout do své duševní propasti.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Děkuji.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras mi dal amulet, který mě ochrání před černými pohledy pátračů."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Trpělivost. Ještě na tom pracuji.
	};
};

//#####################################################################
//##
//##		Kapitel 4
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit	
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP4_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##		Kapitel 5
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP5_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Karras_PICKPOCKET (C_INFO)
{
	npc			= KDF_503_Karras;
	nr			= 900;
	condition	= DIA_Karras_PICKPOCKET_Condition;
	information	= DIA_Karras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen (49, 35);
};
 
FUNC VOID DIA_Karras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Karras_PICKPOCKET);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_BACK 		,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};
	
func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};


