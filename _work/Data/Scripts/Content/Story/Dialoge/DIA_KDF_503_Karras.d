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
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //Co pro tebe mohu udêlat, novici?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Co pro tebe mohu udêlat, bratâe?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Do têchto komnat zavítají ctihodní Innosovi váleèníci jen zâídka.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Co pro tebe mohu udêlat?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(nedùvêâivê) Co tady dêláš?
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
	description	 = 	"Pâišel jsem si pâeèíst nêjaké svaté texty.";
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
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //Pâišel jsem si pâeèíst nêjaké svaté texty.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Rozumím. Jestli se ti podaâí najít mezi nároèným studiem nêjaký volný èas, stav se za mnou.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //Je tady ještê jedna záležitost, ke které bych potâeboval diskrétního novice.
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
	description	 = 	"Máš pro mê nêjaký úkol?";
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
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //Máš pro mê nêjaký úkol?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Ano. Týká se to toho bláznivého Ignaze. Žije v Khorinidu a experimentuje s rùznými lektvary a léèivými odvary. Ale také s kouzly a magií.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //A to mê trápí. Ptám se sám sebe, jestli se jeho magie neprotiví Innosovi.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Abych se mohl pâesvêdèit, potâebuji nêjaké jeho kouzelné svitky.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Chci, abys šel do mêsta a získal pro mê tâi jeho magické svitky.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Ale nikomu ani muk - je to jasné?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Jasnê.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Tady máš 150 zlatých. To by mêlo pokrýt tvé výdaje.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Mistr Karras mê poslal do mêsta, kde mu mám obstarat tâi svitky s kouzly, které vyrábí a prodává Ignaz.");

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
	description	 = 	"Tady jsou ty magické svitky, které jsi chtêl.";
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
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Tady jsou ty magické svitky, které jsi chtêl.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Velmi dobâe, mùj mladý pâíteli.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //Ale teë je naèase, aby ses vênoval svým studiím.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Za odmênu si vezmi tenhle èarovný svitek.
	
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
	description	 = 	"Co máš pâesnê na starosti?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //Co máš pâesnê na starosti?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Mým úkolem je cvièit mágy v umêní sférické manifestace.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Co to znamená?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //No, uèím je, jak vyvolávat stvoâení z jiných sfér.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //Vêtšinou se tomu âíká prostê vyvolávání, i když tenhle výraz naprosto nestaèí k popsání umêní stvoâení služebníka.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //Navíc mám nêkolik zajímavých svitkù s kouzly, které u Goraxe nenajdeš.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Ale nabízím je jen èlenùm našeho âádu.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistr Karras z kláštera mê mùže zásobit svitky s kouzly - pokud se tedy stanu mágem ohnê.");
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
	description	 = 	"Rád bych se od tebe nêèemu pâiuèil (vytvoâit runy).";
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
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //Uè mê.
	
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
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //V tuhle chvíli není nic, co by ses ode mê mohl nauèit.
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
	description	 = 	"Chtêl bych se nauèit ètvrtý kruh magie.";
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
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Chtêl bych se nauèit ètvrtý kruh magie.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Dobrá. Všechna znamení jsou splnêna. Vstup nyní do ètvrtého kruhu, aby se v tobê probudila síla nové magie.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Prošel jsi dlouhou cestou a Innos bude i nadále osvêtlovat tvou stezku.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Ještê stále není vše hotovo.
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
	description	 = 	"Chtêl bych se nauèit pátý kruh magie.";
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
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Chtêl bych se nauèit pátý kruh magie.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //V tom pâípadê nyní vstup do pátého kruhu magie. Budeš vládnout ještê silnêjší magií než kdykoliv pâedtím.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //Užívej její moc s rozvahou, bratâe - temnota je stále pâíliš silná a naši nepâátelé též.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //Do šestého a nejvyššího kruhu magie tê doprovodit nemohu. Až pâijde správný èas, zasvêtí tê sám Pyrokar.
			
			B_LogEntry (Topic_KlosterTeacher,"Mistr Pyrokar mê zasvêtí do šestého kruhu magie.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //Èas ještê nedozrál.
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
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Nesmíš ztrácet èas, bratâe. Musíš dohonit Pedra a vrátit klášteru Innosovo oko.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Pokud nebude Oko navráceno, budeme všichni ztraceni.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Co tady dêláš? Nemêl bys být na cestê za tím bezpáteâním zrádcem Pedrem?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Pozdêji. Nejprve si musím nêco zaâídit.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Nedostane se nijak daleko.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Pozdêji. Nejprve si musím nêco zaâídit.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Uvêdomuješ si vùbec, co tahle ztráta pro klášter znamená? Innosovo oko je mocná zbraà.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nikdo nemùže tušit, co s tím amuletem nepâítel zamýšlí, ale nêco rozhodnê plánuje a my mu to musíme pâekazit.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Takže se okamžitê vydej na cestu za tím zlodêjem!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Nedostane se nijak daleko.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //To doufám, pro tvoje vlastní dobro. Pokud by mêl uniknout jen proto, že se tady poflakuješ, sám tê dokopu pâed tribunál.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //Z èeho bys mê obvinil?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //Ze spolèování s nepâítelem. Nepotâebuješ velkou fantazii, aby sis dokázal pâedstavit, jaký by tê za to potkal trest.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Takže už neztrácej èas, protože tvùj další osud bude záviset na tom, za jakých okolností se pâíštê setkáme.

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
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //Víš všechno, co potâebuješ. Aã už jsi na cestê!
	
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
	description	 =	"Pâinesl jsem zpátky Innosovo oko.";
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
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //Pâinesl jsem zpátky Innosovo oko.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //To mi spadl kámen ze srdce, že se ti podaâilo Innosovo oko nepâíteli uzmout.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Ale nebezpeèí nebylo odvráceno. Zlo kuje další plány a pokraèuje s nebývalou agresivitou.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //To už mi také došlo.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Nedêlej si ze mê šprãouchlata. Situace je vážná, velice vážná, a nemùžeme vêdêt, komu je možné dùvêâovat.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //Nepâíteli se už podaâilo uvést v pokušení novice Pedra a mùže se mu to podaâit u mnohých dalších.

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
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //Podaâilo se mi pâijít na nêco ohlednê Pátraèù.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //A co to má být?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Jsou zcela jasnê démonického pùvodu. Tedy pâinejmenším jsou - nebo alespoà byli - pod vlivem démonù.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Když na nê narazíš, buë opatrný.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //Jak novátorský pâístup.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Je mi líto, ale nemám dost materiálù, abych mohl vyvozovat pâesnêjší stanoviska.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Ale kdyby se ti podaâilo získat od nich nêco, co bych mohl podrobit zkoumání...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras potâebuje nêco, co bylo v pâímém kontaktu s pátraèi. Jen tak bude moci pokraèovat ve svých výzkumech."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Uvidím, co se dá dêlat.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Mohl by do toho být nêjakým zpùsobem zapletený Spáè?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"A jaké materiály bys potâeboval?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Ještê stále pracuji na interpretaci dùkazù souvisejících s Pátraèi.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Samozâejmê - jakmile nêco zjistím, dám ti okamžitê vêdêt.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //Nepâítel má mnoho tváâí. Je velmi obtížné urèit, která z nich pâedstavuje pro klášter nejvêtší nebezpeèí.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Mohl by do toho být nêjakým zpùsobem zapletený Spáè?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //Ten pâíbêh o Spáèovi jsem slyšel. Ale tak obecnê, že k tomu nemám co âíci.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Démonù je bezpoèet a zapletený do toho mùže být kterýkoliv z nich.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Takže chceš, abych ti pâinesl mrtvolu?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //Ne, copak ses zbláznil? Nebezpeèí, které by pâedstavovala pâítomnost démonického stvoâení za zdmi kláštera, by bylo pâíliš velké.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Bude staèit, když najdeš nêjaké pâedmêty, které jsou pro tyto tvory typické.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Zbytky démonické aury, která je obklopuje, by mêly pro bližší zkoumání staèit.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //A jaké materiály bys potâeboval?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Co já vím - nêjaké pâedmêty, které jsou pro tato stvoâení typické.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Takže ty chceš, abych ti pâinesl mrtvolu?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Pokusím se.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //To by bylo opravdu výborné. Mezitím se budu vênovat svému vlastnímu výzkumu.
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
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //Mám u sebe Almanach posedlých. Možná by se ti mohl k nêèemu hodit.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Ukaž mi ho.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Ano, to by mêlo staèit. Prozkoumám tu knihu.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //Ale jedním si už jsem jistý.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //Pátraèi jsou podle mê zcela zvrácená forma života vytvoâená Beliarem.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Ta stvoâení jsou èásteènê démonického a èásteènê lidského pùvodu.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Ale poâád nedokážu pâesnê urèit, jestli stojíme pâed typickou duchovní posedlostí, nebo èistê fyzickou mutací.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Pâijë pozdêji. Pak budu urèitê vêdêt nêco víc.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras pro svùj další výzkum potâebuje Almanach posedlých. Vrátím se k nêmu pozdêji."); 
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

	description = "Už jsi pâišel na nêco nového ohlednê pátraèù?";
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
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //Už jsi pâišel na nêco nového ohlednê Pátraèù?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Ano. Už vím, kdo nebo co jsou Pátraèi skuteènê zaè.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //Nenapínej mê!
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Kdysi to bývali lidé, jako ty nebo já. Udêlali osudnou chybu, když zasvêtili svùj život neèisté magii velice mocného arcidémona.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Pod vlivem tohoto arcidémona a velice mocných drog žili pouze proto, aby mu sloužili, až se z nich staly jen pouhé stíny sebe sama.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Dnes nejsou nic víc než nástroje zla bez vlastní vùle, a nikdy nepâestanou lovit následovníky Innose.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Musíme být opatrní. Zdá se sice, že se zatím vyhýbají têmto posvátným Innosovým síním.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Ale pokud bude jejich moc nadále rùst, netuším, jestli tu budeme v bezpeèí.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Díky. To bylo vážnê povzbudivé.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Opravdu? To ovšem nastoluje další otázky. Napâíklad, kým byli pâedtím a jaký arcidémon z nich udêlal to, èím jsou dnes?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //Mám jisté podezâení. Celé to zní jako bratrstvo Spáèe. Znám ty chlapíky.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //Doufám, že víš, do èeho se to zaplétáš. Dávej na sebe pozor, bratâe.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //Abych nezapomnêl. Tady je tvùj almanach. Už ho nebudu potâebovat.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Karrasovy studie byly úspêšné. Vypadá to, že pátraèi jsou nêjak spojeni se Spáèovým bratrstvem."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //Pracuji na tom. Pâijë pozdêji.
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

	description = "Existuje zpùsob, jak se ochránit pâed mentálními útoky pátraèù?";
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
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Existuje zpùsob, jak se ochránit pâed mentálními útoky Pátraèù?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Jistê. Amulet s kamenem z posvátné pùdy by mêl mít požadovaný ochranný efekt.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Bohužel nemám dostatek takových kamenù.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Jsou z nich postaveny nêkteré ze svatyní, které jsme vybudovali.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Dobrá. Však já už nêjaké nêkde splaším.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Ano, udêlej to. Ale aã tê ani nenapadne nêjak poškodit ty svatynê, slyšíš?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras mê mùže pâed mentálními útoky pátraèù trochu ochránit. Potâebuje k tomu ale kámen z posvátné pùdy, jaký lze získat v nêkterých svatyních."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Nemám tušení. Stále toho vím pâíliš málo, než abych znal odpovêë. Zeptej se mê pozdêji.
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

	description = "Mám nêkolik kamenù z posvêcené pùdy.";
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
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //Mám nêkolik kamenù z posvêcené pùdy.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Výbornê. Doufám, že všechny svatynê jsou stále na svých místech.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //Dobrá. Udêlám ti ochranný amulet proti èernému pohledu Pátraèù.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Dej mi trochu èasu. Dám se hned do práce.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras mi dá amulet, který mê ochrání pâed mentálními útoky pátraèù. Velmi mi to usnadní život."); 
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
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //Jsem hotov. Tady je, podívej. Vypadá nakonec nádhernê.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Nos ho stále u sebe a Pátraèi tê nebudou moci stáhnout do své duševní propasti.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Dêkuji.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras mi dal amulet, který mê ochrání pâed èernými pohledy pátraèù."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Trpêlivost. Ještê na tom pracuji.
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


