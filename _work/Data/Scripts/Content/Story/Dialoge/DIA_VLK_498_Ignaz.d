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
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_00");//O, przychodzisz w samą porę. Właśnie poszukuję asystenta do mojego magicznego eksperymentu.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_01");//Jestem pewien, że zgodzisz się pomóc w imię nauki.
	AI_Output (other, self, "DIA_Ignaz_Hallo_15_02");//Powoli, przyjacielu. Najpierw powiedz mi dokładnie, o co chodzi.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_03");//Stworzyłem nowe zaklęcie. Zaklęcie Zapomnienia.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_04");//Przeprowadziłem już parę udanych testów, ale wciąż brakuje mi czasu na jedną, ostateczną próbę.
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
	description = "Co będę z tego miał?";
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
	AI_Output (other, self, "DIA_Ignaz_Traenke_15_00");//Co będę z tego miał?
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_01");//Mógłbym cię nauczyć przygotowywać różne mikstury.
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_02");//Znam przepisy na esencje lecznicze, regenerujące manę i zwiększające szybkość.
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
	description = "Powiedz mi więcej o tym eksperymencie i o samym zaklęciu.";
};

FUNC INT DIA_Ignaz_Experiment_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Ignaz_Experiment_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_00");//Powiedz mi więcej o tym eksperymencie i o samym zaklęciu.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_01");//Zaklęcie służy do wymazywania z pamięci różnych wspomnień.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_02");//Jak na razie udało mi się ustalić, że działa ono tylko i wyłącznie wtedy, gdy ofiara jest wściekła - na przykład została ostatnio pobita lub okradziona.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_03");//Nawet jeśli ktoś był jedynie świadkiem takiego wydarzenia, zostanie ono usunięte z jego pamięci.
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_04");//Więc mam kogoś pobić, a potem wypróbować na nim zaklęcie?
	//AI_Output (other, self, "DIA_Ignaz_Add_15_00"); //Ma to sens tylko i wyłącznie wtedy, kiedy ofiara jest NAPRAWDĘ wściekła.
	//AI_Output (other, self, "DIA_Ignaz_Add_15_01"); //Tutaj, w dzielnicy portowej, ludzie są przyzwyczajeni do bójek. Lepiej spróbuję gdzie indziej.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_05");//Tak, masz słuszność. Ale żeby kogoś rozwścieczyć, wystarczy go zaatakować - nie musisz od razu łamać mu wszystkich kości.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_06");//Lepiej wybierz sobie jakąś samotną ofiarę - jeśli ktoś zobaczy bójkę, możesz mieć problemy z Lordem Andre.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_07");//Nie ma również sensu rzucać zaklęcia na osobę, która właśnie cię atakuje. Musisz poczekać na właściwy moment.
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
	description = "Dobrze, wypróbuję to zaklęcie.";
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
	AI_Output (other, self, "DIA_Ignaz_teilnehmen_15_00");//Dobrze, wypróbuję to zaklęcie.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_01");//A zatem weź ten zwój i poszukaj sobie dobrej świnki doświadczalnej.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_02");//Kiedy już skończysz, wróć do mnie i powiedz, jak ci poszło.
	
	B_GiveInvItems (self, other, ITSC_Charm,1);
	MIS_Ignaz_Charm = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ignaz,LOG_RUNNING);
	B_LogEntry (TOPIC_Ignaz,"Mam wypróbować nowe zaklęcie Ignaza. Jest to czar zapomnienia. Osoby, które są na mnie obrażone z jakiegoś powodu, nie będą chciały ze mną rozmawiać. W takim przypadku zaklęcie Ignaza może okazać się naprawdę przydatne.");
	B_LogEntry (TOPIC_Ignaz,"Pobity nie będzie nawet pamiętał, że zgłosił swoje pobicie straży. Teraz mogę zaatakować każdego w dzielnicy portowej bez obaw, że się na mnie obrazi.");
	
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
	AI_Output (self, other, "DIA_Ignaz_Running_14_01");//Czy próba się powiodła? Czy tylko zmarnowałeś zwój? Co? Mów szybko.
	AI_Output (self, other, "DIA_Ignaz_Running_14_02");//Jeśli potrzebujesz więcej zwojów z czarami, możesz je kupić ode mnie.
	
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
	description = "Użyłem zwoju z twoim zaklęciem.";
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
	AI_Output (other, self, "DIA_Ignaz_Danach_15_00");//Użyłem zwoju z twoim zaklęciem.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_01");//Dobrze, dobrze. I co, zadziałało?
	AI_Output (other, self, "DIA_Ignaz_Danach_15_02");//Tak, zadziałało.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_03");//Doskonale! Jeden mały krok dla nauki, jeden ogromny krok dla mojej kariery.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_04");//Teraz mogę cię nauczyć paru rzeczy o sztuce alchemii.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_05");//Mogę ci również dać kilka przydatnych przedmiotów, jeśli chcesz.
	
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Ignaz może mi pokazać receptury na różne mikstury. Mieszka w dzielnicy portowej.");
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
	description = "Pokaż mi swoje towary.";
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
	AI_Output (other, self, "DIA_Ignaz_Trade_15_00");//Pokaż mi swoje towary.
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
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Mikstura szybkości", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)),DIA_Ignaz_Teach_Speed);
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
			AI_Output (self, other,"DIA_Ignaz_Teach_14_01"); //Aby przygotować miksturę, potrzebujesz menzurki.
			AI_Output (self, other,"DIA_Ignaz_Teach_14_02"); //Będą ci również potrzebne odpowiednie składniki.
			//AI_Output (self, other,"DIA_Ignaz_Teach_14_03"); //Eins noch. Falls du vorhast, das Wissen um Elixiere der Geschicklichkeit zu lernen, solltest du wissen, dass die benötigten Pflanzen dafür sehr selten sind.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_04"); //Co chcesz wiedzieć?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Ignaz_Teach_14_05"); //Wiesz już wszystko, czego mógłbym cię nauczyć.
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

