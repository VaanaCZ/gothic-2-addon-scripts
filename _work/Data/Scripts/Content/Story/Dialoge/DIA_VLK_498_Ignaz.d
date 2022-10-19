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
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_00");//O, przychodzisz w sam¹ porê. W³aœnie poszukujê asystenta do mojego magicznego eksperymentu.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_01");//Jestem pewien, ¿e zgodzisz siê pomóc w imiê nauki.
	AI_Output (other, self, "DIA_Ignaz_Hallo_15_02");//Powoli, przyjacielu. Najpierw powiedz mi dok³adnie, o co chodzi.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_03");//Stworzy³em nowe zaklêcie. Zaklêcie Zapomnienia.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_04");//Przeprowadzi³em ju¿ parê udanych testów, ale wci¹¿ brakuje mi czasu na jedn¹, ostateczn¹ próbê.
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
	description = "Co bêdê z tego mia³?";
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
	AI_Output (other, self, "DIA_Ignaz_Traenke_15_00");//Co bêdê z tego mia³?
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_01");//Móg³bym ciê nauczyæ przygotowywaæ ró¿ne mikstury.
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_02");//Znam przepisy na esencje lecznicze, regeneruj¹ce manê i zwiêkszaj¹ce szybkoœæ.
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
	description = "Powiedz mi wiêcej o tym eksperymencie i o samym zaklêciu.";
};

FUNC INT DIA_Ignaz_Experiment_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Ignaz_Experiment_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_00");//Powiedz mi wiêcej o tym eksperymencie i o samym zaklêciu.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_01");//Zaklêcie s³u¿y do wymazywania z pamiêci ró¿nych wspomnieñ.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_02");//Jak na razie uda³o mi siê ustaliæ, ¿e dzia³a ono tylko i wy³¹cznie wtedy, gdy ofiara jest wœciek³a - na przyk³ad zosta³a ostatnio pobita lub okradziona.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_03");//Nawet jeœli ktoœ by³ jedynie œwiadkiem takiego wydarzenia, zostanie ono usuniête z jego pamiêci.
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_04");//Wiêc mam kogoœ pobiæ, a potem wypróbowaæ na nim zaklêcie?
	AI_Output (other, self, "DIA_Ignaz_Add_15_00"); //Ma to sens tylko i wy³¹cznie wtedy, kiedy ofiara jest NAPRAWDÊ wœciek³a.
	AI_Output (other, self, "DIA_Ignaz_Add_15_01"); //Tutaj, w dzielnicy portowej, ludzie s¹ przyzwyczajeni do bójek. Lepiej spróbujê gdzie indziej.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_05");//Tak, masz s³usznoœæ. Ale ¿eby kogoœ rozwœcieczyæ, wystarczy go zaatakowaæ - nie musisz od razu ³amaæ mu wszystkich koœci.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_06");//Lepiej wybierz sobie jak¹œ samotn¹ ofiarê - jeœli ktoœ zobaczy bójkê, mo¿esz mieæ problemy z Lordem Andre.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_07");//Nie ma równie¿ sensu rzucaæ zaklêcia na osobê, która w³aœnie ciê atakuje. Musisz poczekaæ na w³aœciwy moment.
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
	description = "Dobrze, wypróbujê to zaklêcie.";
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
	AI_Output (other, self, "DIA_Ignaz_teilnehmen_15_00");//Dobrze, wypróbujê to zaklêcie.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_01");//A zatem weŸ ten zwój i poszukaj sobie dobrej œwinki doœwiadczalnej.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_02");//Kiedy ju¿ skoñczysz, wróæ do mnie i powiedz, jak ci posz³o.
	
	B_GiveInvItems (self, other, ITSC_Charm,1);
	MIS_Ignaz_Charm = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ignaz,LOG_RUNNING);
	B_LogEntry (TOPIC_Ignaz,"Mam wypróbowaæ nowe zaklêcie Ignaza. Jest to czar zapomnienia. Osoby, które s¹ na mnie obra¿one z jakiegoœ powodu, nie bêd¹ chcia³y ze mn¹ rozmawiaæ. W takim przypadku zaklêcie Ignaza mo¿e okazaæ siê naprawdê przydatne.");
	B_LogEntry (TOPIC_Ignaz,"Pobity nie bêdzie nawet pamiêta³, ¿e zg³osi³ swoje pobicie stra¿y. Teraz mogê zaatakowaæ ka¿dego w dzielnicy portowej bez obaw, ¿e siê na mnie obrazi.");
	
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
	description = "Co do eksperymentu...";
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
	AI_Output (other, self, "DIA_Ignaz_Running_15_00");//Co do eksperymentu...
	AI_Output (self, other, "DIA_Ignaz_Running_14_01");//Czy próba siê powiod³a? Czy tylko zmarnowa³eœ zwój? Co? Mów szybko.
	AI_Output (self, other, "DIA_Ignaz_Running_14_02");//Jeœli potrzebujesz wiêcej zwojów z czarami, mo¿esz je kupiæ ode mnie.
	
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
	description = "U¿y³em zwoju z twoim zaklêciem.";
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
	AI_Output (other, self, "DIA_Ignaz_Danach_15_00");//U¿y³em zwoju z twoim zaklêciem.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_01");//Dobrze, dobrze. I co, zadzia³a³o?
	AI_Output (other, self, "DIA_Ignaz_Danach_15_02");//Tak, zadzia³a³o.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_03");//Doskonale! Jeden ma³y krok dla nauki, jeden ogromny krok dla mojej kariery.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_04");//Teraz mogê ciê nauczyæ paru rzeczy o sztuce alchemii.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_05");//Mogê ci równie¿ daæ kilka przydatnych przedmiotów, jeœli chcesz.
	
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Ignaz mo¿e mi pokazaæ receptury na ró¿ne mikstury. Mieszka w dzielnicy portowej.");
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
	description = "Poka¿ mi swoje towary.";
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
	AI_Output (other, self, "DIA_Ignaz_Trade_15_00");//Poka¿ mi swoje towary.
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
	description = "Opowiedz mi o sztuce alchemii.";
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
	AI_Output (other, self,"DIA_Ignaz_Teach_15_00");//Opowiedz mi o sztuce alchemii.
	
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_ClearChoices (DIA_Ignaz_Teach);
		Info_AddChoice (DIA_Ignaz_Teach,DIALOG_BACK,DIA_Ignaz_Teach_BACK);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Mikstura szybkoœci", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Esencja many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Esencja lecznicza", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)) ,DIA_Ignaz_Teach_Health);
		talente = (talente + 1);
	};
	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_01"); //Aby przygotowaæ miksturê, potrzebujesz menzurki.
			AI_Output (self, other,"DIA_Ignaz_Teach_14_02"); //Bêd¹ ci równie¿ potrzebne odpowiednie sk³adniki.
			//AI_Output (self, other,"DIA_Ignaz_Teach_14_03"); //Eins noch. Falls du vorhast, das Wissen um Elixiere der Geschicklichkeit zu lernen, solltest du wissen, dass die benötigten Pflanzen dafür sehr selten sind.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_04"); //Co chcesz wiedzieæ?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Ignaz_Teach_14_05"); //Wiesz ju¿ wszystko, czego móg³bym ciê nauczyæ.
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

