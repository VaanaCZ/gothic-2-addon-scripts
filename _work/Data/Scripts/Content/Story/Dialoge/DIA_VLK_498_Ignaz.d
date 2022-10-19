///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_EXIT   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 999;
	condition   = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ignaz_PICKPOCKET (C_INFO)
{
	npc			= VLK_498_Ignaz;
	nr			= 900;
	condition	= DIA_Ignaz_PICKPOCKET_Condition;
	information	= DIA_Ignaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ignaz_PICKPOCKET_Condition()
{
	C_Beklauen (38, 50);
};
 
FUNC VOID DIA_Ignaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_BACK 		,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
	
func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Hallo   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ignaz_Hallo_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Hallo_Info()
{
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_00");//Á - pâišel jsi právê vèas. Potâebuju pro své magické pokusy nêjakého asistenta.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_01");//Jsem si jistý, že jsi celý nedoèkavý, jak mi ve vêdeckém zájmu udêlat malou laskavost.
	AI_Output (other, self, "DIA_Ignaz_Hallo_15_02");//Pomalu, pâíteli. Nejdâív mi âekni, o co vlastnê jde.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_03");//Vymyslel jsem nové kouzlo. Kouzlo zapomnêní.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_04");//Už jsem úspêšnê provedl nêkolik praktických zkoušek, ale na finální test se mi nedostává èasu.
};
///////////////////////////////////////////////////////////////////////
//	Info Lerninhalte Traenke
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Traenke   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 3;
	condition   = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent   = FALSE;
	description = "Co z toho budu mít, když ti pomùžu?";
};

FUNC INT DIA_Ignaz_Traenke_Condition()
{	
	if (MIS_Ignaz_Charm != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Traenke_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Traenke_15_00");//Co z toho budu mít, když ti pomùžu?
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_01");//Mùžu tê nauèit, jak se pâipravují lektvary.
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_02");//Znám recepty na léèivou esenci, esenci many a lektvar rychlosti.
	//AI_Output (self, other, "DIA_Ignaz_Traenke_14_03");//Außerdem kann ich dir beibringen, wie du ein Elixier der Geschicklichkeit herstellst.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Experiment
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Experiment   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 4;
	condition   = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent   = FALSE;
	description = "Âekni mi o tom experimentu a kouzlu víc.";
};

FUNC INT DIA_Ignaz_Experiment_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Ignaz_Experiment_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_00");//Âekni mi o tom experimentu a kouzlu víc.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_01");//To kouzlo má za následek, že si urèitá osoba nepamatuje rùzné události.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_02");//Už se mi podaâilo zjistit, že to funguje, pokud je dotyèná osoba naštvaná - napâíklad pokud jí nêkdo právê dal nakládaèku, nebo ji oloupil.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_03");//Dokonce i když je jen svêdkem takové události, tak se jí to pak vymaže z pamêti.
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_04");//To bych jako mêl nêkoho srazit na zem a pak na nêj seslat kouzlo?
	AI_Output (other, self, "DIA_Ignaz_Add_15_00"); //Funguje to jen v pâípadê, že je obêã po boji OPRAVDU naštvaná.
	AI_Output (other, self, "DIA_Ignaz_Add_15_01"); //(pro sebe) Tady v pâístavní ètvrti se to mlátí poâád. Radêji bych si mêl obêã vyhlídnout nêkde jinde.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_05");//Ano, mám dojem, žes trefil hâebíèek na hlavièku. Ale abys nêkoho naštval, staèí, abys ho napadl, nemusíš ho srazit k zemi.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_06");//Takže by sis mêl vybrat nêkoho, kdo je o samotê - pokud kolem budou lidé, jen se dostaneš do potíží s lordem Andrem.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_07");//Taky nemá žádný smysl sesílat kouzlo na nêkoho, kdo na tebe právê útoèí. Poèkej na ten správný okamžik.
};	
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_teilnehmen   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 5;
	condition   = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent   = FALSE;
	description = "Dobrá, vyzkouším to kouzlo.";
};

FUNC INT DIA_Ignaz_teilnehmen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Ignaz_Experiment)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_teilnehmen_Info()
{
	AI_Output (other, self, "DIA_Ignaz_teilnehmen_15_00");//Dobrá, vyzkouším to kouzlo.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_01");//Tak si vezmi tenhle svitek a vyzkoušej si život pokusné myši.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_02");//Až to provedeš, tak se vraã o tom poreferovat.
	
	B_GiveInvItems (self, other, ITSC_Charm,1);
	MIS_Ignaz_Charm = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ignaz,LOG_RUNNING);
	B_LogEntry (TOPIC_Ignaz,"Mám vyzkoušet nové Ignazovo kouzlo - kouzlo zapomnêní. Když se na mê nêkdo pâi bitce nebo z jiného dùvodu rozhnêvá, urèitê se se mnou už nebude chtít bavit. A tehdy nastane pravá chvíle pro použití tohoto zaklínadla.");
	B_LogEntry (TOPIC_Ignaz,"Tohle je ideální pâíležitost vyzkoušet to kouzlo - pod jeho pùsobením také zapomene ohlásit mimoâádnou událost. Nemyslím si, že by menší rvaèka v pâístavu vzbudila velký rozruch.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Running   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent   = FALSE;
	description = "K tomu experimentu...";
};

FUNC INT DIA_Ignaz_Running_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_RUNNING)
	&& (Charm_Test == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Running_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Running_15_00");//K tomu experimentu...
	AI_Output (self, other, "DIA_Ignaz_Running_14_01");//Tak co, uspêl jsi? Nebo jsi to kouzlo jen tak zbùhdarma vyplýtval? Co?
	AI_Output (self, other, "DIA_Ignaz_Running_14_02");//Jestli potâebuješ další svitky, tak si je ode mê mùžeš koupit.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Danach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent   = FALSE;
	description = "Použil jsem ten svitek.";
};
FUNC INT DIA_Ignaz_Danach_Condition()
{	
	if (Charm_Test == TRUE)
	&& (MIS_Ignaz_Charm == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Danach_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Danach_15_00");//Použil jsem ten svitek.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_01");//Fajn, fajn. A povedlo se?
	AI_Output (other, self, "DIA_Ignaz_Danach_15_02");//Ano, funguje to.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_03");//Výbornê. Malý krok pro vêdu, ale obrovský pro mê!
	AI_Output (self, other, "DIA_Ignaz_Danach_14_04");//Teë mùžu nêco ze svého èasu využít na to, abych tê zasvêtil do tajù alchymie.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_05");//Taky ti mùžu dát nêkolik užiteèných vêcí, jestli máš zájem.
	
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Ignaz mi ukáže nêkteré recepty na míchání lektvarù. Žije v pâístavní ètvrti.");
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP (XP_MIS_Ignaz_Charm);
	
	//PATCH fallls alle Scrolls aufgekauft oder geplündert wurden
	CreateInvItems (self,ITSC_Charm		, 3);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Trade   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent   = TRUE;
	trade 		= TRUE;
	description = "Ukaž mi své zboží.";
};
FUNC INT DIA_Ignaz_Trade_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_SUCCESS)
	|| (Npc_KnowsInfo (other,DIA_Ignaz_Running))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Ignaz_Trade_15_00");//Ukaž mi své zboží.
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Teach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent   = TRUE;
	description = "Nauè mê nêco z alchymie.";
};
//----------------------------------------
var int DIA_Ignaz_Teach_permanent;
//----------------------------------------

FUNC INT DIA_Ignaz_Teach_Condition()
{	
	if (DIA_Ignaz_Teach_permanent == FALSE)
	&& (Ignaz_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Ignaz_Teach_15_00");//Nauè mê nêco z alchymie.
	
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_ClearChoices (DIA_Ignaz_Teach);
		Info_AddChoice (DIA_Ignaz_Teach,DIALOG_BACK,DIA_Ignaz_Teach_BACK);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Lektvar rychlosti", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Esence many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Esence hojivé síly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)) ,DIA_Ignaz_Teach_Health);
		talente = (talente + 1);
	};
	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_01"); //K pâípravê lektvaru s pomocí alchymistické kolony potâebuješ laboratorní baàku.
			AI_Output (self, other,"DIA_Ignaz_Teach_14_02"); //Na každý lektvar budeš taky potâebovat rùzné rostliny a další ingredience.
			//AI_Output (self, other,"DIA_Ignaz_Teach_14_03"); //Eins noch. Falls du vorhast, das Wissen um Elixiere der Geschicklichkeit zu lernen, solltest du wissen, dass die benötigten Pflanzen dafür sehr selten sind.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_04"); //Co bys rád vêdêl?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Ignaz_Teach_14_05"); //Už znáš všechno, èemu bych tê mohl nauèit.
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};
	
FUNC VOID DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Speed);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices (DIA_Ignaz_Teach);
};

