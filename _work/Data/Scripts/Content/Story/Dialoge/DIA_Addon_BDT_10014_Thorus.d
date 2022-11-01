//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Znasz zasadę. Bez czerwonego kamienia nikt nie wejdzie do kopalni.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Zapomnij o kopalni. Muszę się dostać do Kruka.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Pewnie, ale zasady dotyczą wszystkich. Nawet ciebie.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Idź z powrotem. Jeżeli spróbujesz wejść na górę bez pozwolenia, strażnicy cię zabiją. Takie są zasady.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Jak ci się coś nie podoba, to idź porozmawiać z Estebanem. On jest odpowiedzialny za obóz.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "To naprawdę ważne, abym dostał się do Kruka...";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//To naprawdę ważne, żebym dostał się do Kruka...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//No i co z tego? Naprawdę sądzisz, że zdołasz do niego dotrzeć?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Jego strażnik ma rozkaz NIKOGO nie wpuszczać. Będziesz martwy, zanim zdołasz go zobaczyć.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Tak więc wybij to sobie z głowy.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Kruk jest przywódcą bandytów. Będę musiał oczyścić sobie drogę, aby do niego dotrzeć."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "Nie pamiętasz mnie? Ze Starego Obozu?";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Nie pamiętasz mnie? Ze Starego Obozu?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Jesteś jednym z więźniów? A może byłeś jednym z moich strażników. Co z tego? Wydaje ci się, że teraz jesteśmy sojusznikami?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//Nie, nie wydaje mi się.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Może to ty obaliłeś barierę... może to ty zabiłeś moich kumpli.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//No i co z tego?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Te dni już minęły.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Chcesz wejść? To zdobądź czerwony kamień i nie marnuj mojego czasu.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "Daj spokój, wpuść mnie. Przez wzgląd na stare, dobre czasy.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //Daj spokój, wpuść mnie. Przez wzgląd na stare, dobre czasy.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Pozwól, że ci coś wyjaśnię. Wiesz, dlaczego wciąż żyję?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Bo zawsze byłem lojalny względem moich ludzi.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Nie musi mi się podobać to, co robi Kruk. Ale mimo to będę przestrzegać zasad. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //I ty także!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //Nie!
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "Mam dla ciebie kamienną tabliczkę.";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//Mam dla ciebie kamienną tabliczkę.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//To nie ta. Liczą się tylko czerwone.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "Mam tabliczkę z czerwonego kamienia...";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//Mam tabliczkę z czerwonego kamienia...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//W porządku.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Wykończyłeś Estebana - a to oznacza, że teraz TY będziesz wykonywał jego pracę.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//W kopalni są problemy z pełzaczami.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Zniknęło już trzech kopaczy. Twoim zadaniem jest zdobyć nowych.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//A wtedy będę mógł w końcu wejść do tej piekielnej kopalni?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Wykonaj swoje zadanie - potem rób, co tylko zechcesz.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Ponieważ teraz przejąłem obowiązki Estebana, powinienem wysłać trzech kopaczy do kopalni.");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "Przysłałem trzech ludzi.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//Przysłałem trzech ludzi.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//W porządku. Jeśli o mnie chodzi, możesz wejść.

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "Hej, a co z pancerzem? Gdzie go dostanę?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Hej, a co z pancerzem? Gdzie go dostanę?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//Nigdzie. Takie pancerze są zarezerwowane dla straży Kruka.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Nie mogę uwierzyć, że przeprowadza się rekrutację, ale koniec końców decyzja nie należy do mnie, a do Kruka.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "Co się dzieje z więźniami?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//Co się dzieje z więźniami?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Hmm, ich zadanie zostało wykonane. Z tego, co wiem, powinni teraz wydobywać złoto.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//A jeżeli spróbują uciec?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//...Bloodwyn wysłałby za nimi swych strażników. Nie sądzę jednak, by byli aż tak szaleni, żeby próbować ucieczki.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//Chyba że..
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//Chyba że co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//...ktoś by im pomógł. Nie znam jednak nikogo dostatecznie głupiego, żeby się na to poważył... Przynajmniej tak długo, jak Bloodwyn tu jest.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//Co zamierzasz zrobić?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//Słucham?!
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Bloodwyn nie stoi ci już na drodze. Zastanawiam się, kto będzie następny. Kruk? A może ja?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Boisz się?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Nie boję się walki. Jedynie konsekwencji twoich czynów.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Ten obóz to wszystko, co mamy.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Nie udało się tak, aby wszyscy byli zadowoleni, ale ZADZIAŁAŁO.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//A każdy kolejny zabity oznacza coraz większy rozłam.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//Jesteśmy bandytami, pariasami, pogardzanymi wyrzutkami.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Dokądkolwiek pójdziemy, będą nas ścigać, zamykać w więzieniach i zabijać.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Nie ma dla nas ani lepszego miejsca, ani lepszego czasu.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//Czego więc chcesz?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Ci ludzie potrzebują kogoś, kto ich poprowadzi. Kto ma to zrobić? Ty? Ktoś, kto nie potrafi usiedzieć na miejscu?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "Dlaczego więc nie zostaniesz przywódcą obozu?";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Dlaczego więc nie zostaniesz przywódcą obozu?
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//Dobrze, ale co z Krukiem?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Kruk niedługo będzie miał inne kłopoty. Ja już o to zadbam.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Upewnij się, że więźniowie mogą swobodnie opuścić obóz.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//Dobrze. Zajmę się wszystkimi strażnikami na zewnątrz.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn nie żyje, a Thorus postara się, aby niewolnicy mogli opuścić obóz."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Teraz ponownie porozmawiam ze strażnikami niewolników, a wtedy Patrick i jego chłopaki wreszcie zabiorą się do roboty."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"Straż niewolników nie będzie już sprawiała kłopotów, więc Patrick i jego chłopaki wreszcie mogą zabrać się do roboty."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "Udało mi się. Kruka już nie ma.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//Udało mi się. Kruka już nie ma.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//To będzie nauczka dla Beliara.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Ruszasz dalej?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Moje zadanie w dolinie zostało wykonane. Odpocznę kilka dni.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//Tak, ciągle w drodze, co? Bezpiecznej podróży.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Kto wie, może jeszcze kiedyś się spotkamy.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Kto wie... Spotkasz na swojej drodze jeszcze wiele bram i łuków. A przy jednym z nich znajdziesz mnie...
	
	AI_StopProcessInfos (self);
	
};



