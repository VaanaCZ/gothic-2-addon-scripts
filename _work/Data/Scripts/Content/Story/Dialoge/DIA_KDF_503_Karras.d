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
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //Co pro tebe mohu udìlat, novici?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Co pro tebe mohu udìlat, bratøe?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Do tìchto komnat zavítají ctihodní Innosovi váleèníci jen zøídka.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Co pro tebe mohu udìlat?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(nedùvìøivì) Co tady dìláš?
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
	description	 = 	"Pøišel jsem si pøeèíst nìjaké svaté texty.";
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
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //Pøišel jsem si pøeèíst nìjaké svaté texty.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Rozumím. Jestli se ti podaøí najít mezi nároèným studiem nìjaký volný èas, stav se za mnou.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //Je tady ještì jedna záležitost, ke které bych potøeboval diskrétního novice.
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
	description	 = 	"Máš pro mì nìjaký úkol?";
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
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //Máš pro mì nìjaký úkol?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Ano. Týká se to toho bláznivého Ignaze. Žije v Khorinidu a experimentuje s rùznými lektvary a léèivými odvary. Ale také s kouzly a magií.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //A to mì trápí. Ptám se sám sebe, jestli se jeho magie neprotiví Innosovi.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Abych se mohl pøesvìdèit, potøebuji nìjaké jeho kouzelné svitky.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Chci, abys šel do mìsta a získal pro mì tøi jeho magické svitky.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Ale nikomu ani muk - je to jasné?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Jasnì.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Tady máš 150 zlatých. To by mìlo pokrýt tvé výdaje.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Mistr Karras mì poslal do mìsta, kde mu mám obstarat tøi svitky s kouzly, které vyrábí a prodává Ignaz.");

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
	description	 = 	"Tady jsou ty magické svitky, které jsi chtìl.";
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
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Tady jsou ty magické svitky, které jsi chtìl.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Velmi dobøe, mùj mladý pøíteli.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //Ale teï je naèase, aby ses vìnoval svým studiím.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Za odmìnu si vezmi tenhle èarovný svitek.
	
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
	description	 = 	"Co máš pøesnì na starosti?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //Co máš pøesnì na starosti?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Mým úkolem je cvièit mágy v umìní sférické manifestace.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Co to znamená?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //No, uèím je, jak vyvolávat stvoøení z jiných sfér.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //Vìtšinou se tomu øíká prostì vyvolávání, i když tenhle výraz naprosto nestaèí k popsání umìní stvoøení služebníka.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //Navíc mám nìkolik zajímavých svitkù s kouzly, které u Goraxe nenajdeš.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Ale nabízím je jen èlenùm našeho øádu.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistr Karras z kláštera mì mùže zásobit svitky s kouzly - pokud se tedy stanu mágem ohnì.");
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
	description	 = 	"Rád bych se od tebe nìèemu pøiuèil (vytvoøit runy).";
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
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //Uè mì.
	
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
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //V tuhle chvíli není nic, co by ses ode mì mohl nauèit.
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
	description	 = 	"Chtìl bych se nauèit ètvrtý kruh magie.";
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
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Chtìl bych se nauèit ètvrtý kruh magie.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Dobrá. Všechna znamení jsou splnìna. Vstup nyní do ètvrtého kruhu, aby se v tobì probudila síla nové magie.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Prošel jsi dlouhou cestou a Innos bude i nadále osvìtlovat tvou stezku.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Ještì stále není vše hotovo.
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
	description	 = 	"Chtìl bych se nauèit pátý kruh magie.";
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
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Chtìl bych se nauèit pátý kruh magie.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //V tom pøípadì nyní vstup do pátého kruhu magie. Budeš vládnout ještì silnìjší magií než kdykoliv pøedtím.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //Užívej její moc s rozvahou, bratøe - temnota je stále pøíliš silná a naši nepøátelé též.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //Do šestého a nejvyššího kruhu magie tì doprovodit nemohu. Až pøijde správný èas, zasvìtí tì sám Pyrokar.
			
			B_LogEntry (Topic_KlosterTeacher,"Mistr Pyrokar mì zasvìtí do šestého kruhu magie.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //Èas ještì nedozrál.
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
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Nesmíš ztrácet èas, bratøe. Musíš dohonit Pedra a vrátit klášteru Innosovo oko.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Pokud nebude Oko navráceno, budeme všichni ztraceni.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Co tady dìláš? Nemìl bys být na cestì za tím bezpáteøním zrádcem Pedrem?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Pozdìji. Nejprve si musím nìco zaøídit.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Nedostane se nijak daleko.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Pozdìji. Nejprve si musím nìco zaøídit.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Uvìdomuješ si vùbec, co tahle ztráta pro klášter znamená? Innosovo oko je mocná zbraò.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nikdo nemùže tušit, co s tím amuletem nepøítel zamýšlí, ale nìco rozhodnì plánuje a my mu to musíme pøekazit.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Takže se okamžitì vydej na cestu za tím zlodìjem!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Nedostane se nijak daleko.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //To doufám, pro tvoje vlastní dobro. Pokud by mìl uniknout jen proto, že se tady poflakuješ, sám tì dokopu pøed tribunál.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //Z èeho bys mì obvinil?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //Ze spolèování s nepøítelem. Nepotøebuješ velkou fantazii, aby sis dokázal pøedstavit, jaký by tì za to potkal trest.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Takže už neztrácej èas, protože tvùj další osud bude záviset na tom, za jakých okolností se pøíštì setkáme.

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
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //Víš všechno, co potøebuješ. A už jsi na cestì!
	
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
	description	 =	"Pøinesl jsem zpátky Innosovo oko.";
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
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //Pøinesl jsem zpátky Innosovo oko.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //To mi spadl kámen ze srdce, že se ti podaøilo Innosovo oko nepøíteli uzmout.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Ale nebezpeèí nebylo odvráceno. Zlo kuje další plány a pokraèuje s nebývalou agresivitou.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //To už mi také došlo.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Nedìlej si ze mì šprouchlata. Situace je vážná, velice vážná, a nemùžeme vìdìt, komu je možné dùvìøovat.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //Nepøíteli se už podaøilo uvést v pokušení novice Pedra a mùže se mu to podaøit u mnohých dalších.

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
	description = "Jak pokraèují tvá studia?";
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
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_00"); //Jak pokraèují tvá studia?

	if (MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF)
	{
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //Podaøilo se mi pøijít na nìco ohlednì Pátraèù.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //A co to má být?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Jsou zcela jasnì démonického pùvodu. Tedy pøinejmenším jsou - nebo alespoò byli - pod vlivem démonù.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Když na nì narazíš, buï opatrný.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //Jak novátorský pøístup.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Je mi líto, ale nemám dost materiálù, abych mohl vyvozovat pøesnìjší stanoviska.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Ale kdyby se ti podaøilo získat od nich nìco, co bych mohl podrobit zkoumání...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras potøebuje nìco, co bylo v pøímém kontaktu s pátraèi. Jen tak bude moci pokraèovat ve svých výzkumech."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Uvidím, co se dá dìlat.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Mohl by do toho být nìjakým zpùsobem zapletený Spáè?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"A jaké materiály bys potøeboval?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Ještì stále pracuji na interpretaci dùkazù souvisejících s Pátraèi.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Samozøejmì - jakmile nìco zjistím, dám ti okamžitì vìdìt.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //Nepøítel má mnoho tváøí. Je velmi obtížné urèit, která z nich pøedstavuje pro klášter nejvìtší nebezpeèí.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Mohl by do toho být nìjakým zpùsobem zapletený Spáè?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //Ten pøíbìh o Spáèovi jsem slyšel. Ale tak obecnì, že k tomu nemám co øíci.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Démonù je bezpoèet a zapletený do toho mùže být kterýkoliv z nich.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Takže chceš, abych ti pøinesl mrtvolu?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //Ne, copak ses zbláznil? Nebezpeèí, které by pøedstavovala pøítomnost démonického stvoøení za zdmi kláštera, by bylo pøíliš velké.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Bude staèit, když najdeš nìjaké pøedmìty, které jsou pro tyto tvory typické.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Zbytky démonické aury, která je obklopuje, by mìly pro bližší zkoumání staèit.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //A jaké materiály bys potøeboval?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Co já vím - nìjaké pøedmìty, které jsou pro tato stvoøení typické.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Takže ty chceš, abych ti pøinesl mrtvolu?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Pokusím se.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //To by bylo opravdu výborné. Mezitím se budu vìnovat svému vlastnímu výzkumu.
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
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //Mám u sebe Almanach posedlých. Možná by se ti mohl k nìèemu hodit.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Ukaž mi ho.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Ano, to by mìlo staèit. Prozkoumám tu knihu.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //Ale jedním si už jsem jistý.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //Pátraèi jsou podle mì zcela zvrácená forma života vytvoøená Beliarem.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Ta stvoøení jsou èásteènì démonického a èásteènì lidského pùvodu.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Ale poøád nedokážu pøesnì urèit, jestli stojíme pøed typickou duchovní posedlostí, nebo èistì fyzickou mutací.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Pøijï pozdìji. Pak budu urèitì vìdìt nìco víc.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras pro svùj další výzkum potøebuje Almanach posedlých. Vrátím se k nìmu pozdìji."); 
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

	description = "Už jsi pøišel na nìco nového ohlednì pátraèù?";
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
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //Už jsi pøišel na nìco nového ohlednì Pátraèù?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Ano. Už vím, kdo nebo co jsou Pátraèi skuteènì zaè.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //Nenapínej mì!
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Kdysi to bývali lidé, jako ty nebo já. Udìlali osudnou chybu, když zasvìtili svùj život neèisté magii velice mocného arcidémona.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Pod vlivem tohoto arcidémona a velice mocných drog žili pouze proto, aby mu sloužili, až se z nich staly jen pouhé stíny sebe sama.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Dnes nejsou nic víc než nástroje zla bez vlastní vùle, a nikdy nepøestanou lovit následovníky Innose.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Musíme být opatrní. Zdá se sice, že se zatím vyhýbají tìmto posvátným Innosovým síním.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Ale pokud bude jejich moc nadále rùst, netuším, jestli tu budeme v bezpeèí.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Díky. To bylo vážnì povzbudivé.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Opravdu? To ovšem nastoluje další otázky. Napøíklad, kým byli pøedtím a jaký arcidémon z nich udìlal to, èím jsou dnes?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //Mám jisté podezøení. Celé to zní jako bratrstvo Spáèe. Znám ty chlapíky.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //Doufám, že víš, do èeho se to zaplétáš. Dávej na sebe pozor, bratøe.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //Abych nezapomnìl. Tady je tvùj almanach. Už ho nebudu potøebovat.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Karrasovy studie byly úspìšné. Vypadá to, že pátraèi jsou nìjak spojeni se Spáèovým bratrstvem."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //Pracuji na tom. Pøijï pozdìji.
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

	description = "Existuje zpùsob, jak se ochránit pøed mentálními útoky pátraèù?";
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
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Existuje zpùsob, jak se ochránit pøed mentálními útoky Pátraèù?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Jistì. Amulet s kamenem z posvátné pùdy by mìl mít požadovaný ochranný efekt.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Bohužel nemám dostatek takových kamenù.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Jsou z nich postaveny nìkteré ze svatyní, které jsme vybudovali.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Dobrá. Však já už nìjaké nìkde splaším.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Ano, udìlej to. Ale a tì ani nenapadne nìjak poškodit ty svatynì, slyšíš?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras mì mùže pøed mentálními útoky pátraèù trochu ochránit. Potøebuje k tomu ale kámen z posvátné pùdy, jaký lze získat v nìkterých svatyních."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Nemám tušení. Stále toho vím pøíliš málo, než abych znal odpovìï. Zeptej se mì pozdìji.
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

	description = "Mám nìkolik kamenù z posvìcené pùdy.";
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
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //Mám nìkolik kamenù z posvìcené pùdy.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Výbornì. Doufám, že všechny svatynì jsou stále na svých místech.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //Dobrá. Udìlám ti ochranný amulet proti èernému pohledu Pátraèù.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Dej mi trochu èasu. Dám se hned do práce.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras mi dá amulet, který mì ochrání pøed mentálními útoky pátraèù. Velmi mi to usnadní život."); 
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
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //Jsem hotov. Tady je, podívej. Vypadá nakonec nádhernì.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Nos ho stále u sebe a Pátraèi tì nebudou moci stáhnout do své duševní propasti.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Dìkuji.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras mi dal amulet, který mì ochrání pøed èernými pohledy pátraèù."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Trpìlivost. Ještì na tom pracuji.
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


