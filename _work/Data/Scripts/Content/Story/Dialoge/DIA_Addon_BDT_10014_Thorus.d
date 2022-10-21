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
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Znasz zasad�. Bez czerwonego kamienia nikt nie wejdzie do kopalni.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Zapomnij o kopalni. Musz� si� dosta� do Kruka.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Pewnie, ale zasady dotycz� wszystkich. Nawet ciebie.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Id� z powrotem. Je�eli spr�bujesz wej�� na g�r� bez pozwolenia, stra�nicy ci� zabij�. Takie s� zasady.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Jak ci si� co� nie podoba, to id� porozmawia� z Estebanem. On jest odpowiedzialny za ob�z.
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
	description = "To naprawd� wa�ne, abym dosta� si� do Kruka...";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//To naprawd� wa�ne, �ebym dosta� si� do Kruka...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//No i co z tego? Naprawd� s�dzisz, �e zdo�asz do niego dotrze�?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Jego stra�nik ma rozkaz NIKOGO nie wpuszcza�. B�dziesz martwy, zanim zdo�asz go zobaczy�.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Tak wi�c wybij to sobie z g�owy.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Kruk jest przyw�dc� bandyt�w. B�d� musia� oczy�ci� sobie drog�, aby do niego dotrze�."); 
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
	description = "Nie pami�tasz mnie? Ze Starego Obozu?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Nie pami�tasz mnie? Ze Starego Obozu?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Jeste� jednym z wi�ni�w? A mo�e by�e� jednym z moich stra�nik�w. Co z tego? Wydaje ci si�, �e teraz jeste�my sojusznikami?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//Nie, nie wydaje mi si�.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Mo�e to ty obali�e� barier�... mo�e to ty zabi�e� moich kumpli.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//No i co z tego?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Te dni ju� min�y.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Chcesz wej��? To zdob�d� czerwony kamie� i nie marnuj mojego czasu.
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
	description = "Daj spok�j, wpu�� mnie. Przez wzgl�d na stare, dobre czasy.";
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
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //Daj spok�j, wpu�� mnie. Przez wzgl�d na stare, dobre czasy.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Pozw�l, �e ci co� wyja�ni�. Wiesz, dlaczego wci�� �yj�?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Bo zawsze by�em lojalny wzgl�dem moich ludzi.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Nie musi mi si� podoba� to, co robi Kruk. Ale mimo to b�d� przestrzega� zasad. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //I ty tak�e!
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
	description = "Mam dla ciebie kamienn� tabliczk�.";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//Mam dla ciebie kamienn� tabliczk�.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//To nie ta. Licz� si� tylko czerwone.
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
	description = "Mam tabliczk� z czerwonego kamienia...";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//Mam tabliczk� z czerwonego kamienia...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//W porz�dku.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Wyko�czy�e� Estebana - a to oznacza, �e teraz TY b�dziesz wykonywa� jego prac�.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//W kopalni s� problemy z pe�zaczami.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Znikn�o ju� trzech kopaczy. Twoim zadaniem jest zdoby� nowych.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//A wtedy b�d� m�g� w ko�cu wej�� do tej piekielnej kopalni?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Wykonaj swoje zadanie - potem r�b, co tylko zechcesz.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Poniewa� teraz przej��em obowi�zki Estebana, powinienem wys�a� trzech kopaczy do kopalni.");
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
	description = "Przys�a�em trzech ludzi.";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//Przys�a�em trzech ludzi.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//W porz�dku. Je�li o mnie chodzi, mo�esz wej��.

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
	description = "Hej, a co z pancerzem? Gdzie go dostan�?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Hej, a co z pancerzem? Gdzie go dostan�?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//Nigdzie. Takie pancerze s� zarezerwowane dla stra�y Kruka.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Nie mog� uwierzy�, �e przeprowadza si� rekrutacj�, ale koniec ko�c�w decyzja nie nale�y do mnie, a do Kruka.
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
	description = "Co si� dzieje z wi�niami?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//Co si� dzieje z wi�niami?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Hmm, ich zadanie zosta�o wykonane. Z tego, co wiem, powinni teraz wydobywa� z�oto.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//A je�eli spr�buj� uciec?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//...Bloodwyn wys�a�by za nimi swych stra�nik�w. Nie s�dz� jednak, by byli a� tak szaleni, �eby pr�bowa� ucieczki.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//Chyba �e..
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//Chyba �e co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//...kto� by im pom�g�. Nie znam jednak nikogo dostatecznie g�upiego, �eby si� na to powa�y�... Przynajmniej tak d�ugo, jak Bloodwyn tu jest.
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
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//Co zamierzasz zrobi�?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//S�ucham?!
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Bloodwyn nie stoi ci ju� na drodze. Zastanawiam si�, kto b�dzie nast�pny. Kruk? A mo�e ja?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Boisz si�?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Nie boj� si� walki. Jedynie konsekwencji twoich czyn�w.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Ten ob�z to wszystko, co mamy.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Nie uda�o si� tak, aby wszyscy byli zadowoleni, ale ZADZIA�A�O.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//A ka�dy kolejny zabity oznacza coraz wi�kszy roz�am.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//Jeste�my bandytami, pariasami, pogardzanymi wyrzutkami.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Dok�dkolwiek p�jdziemy, b�d� nas �ciga�, zamyka� w wi�zieniach i zabija�.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Nie ma dla nas ani lepszego miejsca, ani lepszego czasu.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//Czego wi�c chcesz?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Ci ludzie potrzebuj� kogo�, kto ich poprowadzi. Kto ma to zrobi�? Ty? Kto�, kto nie potrafi usiedzie� na miejscu?
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
	description = "Dlaczego wi�c nie zostaniesz przyw�dc� obozu?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Dlaczego wi�c nie zostaniesz przyw�dc� obozu?
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//Dobrze, ale co z Krukiem?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Kruk nied�ugo b�dzie mia� inne k�opoty. Ja ju� o to zadbam.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Upewnij si�, �e wi�niowie mog� swobodnie opu�ci� ob�z.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//Dobrze. Zajm� si� wszystkimi stra�nikami na zewn�trz.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn nie �yje, a Thorus postara si�, aby niewolnicy mogli opu�ci� ob�z."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Teraz ponownie porozmawiam ze stra�nikami niewolnik�w, a wtedy Patrick i jego ch�opaki wreszcie zabior� si� do roboty."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"Stra� niewolnik�w nie b�dzie ju� sprawia�a k�opot�w, wi�c Patrick i jego ch�opaki wreszcie mog� zabra� si� do roboty."); 
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
	description = "Uda�o mi si�. Kruka ju� nie ma.";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//Uda�o mi si�. Kruka ju� nie ma.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//To b�dzie nauczka dla Beliara.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Ruszasz dalej?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Moje zadanie w dolinie zosta�o wykonane. Odpoczn� kilka dni.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//Tak, ci�gle w drodze, co? Bezpiecznej podr�y.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Kto wie, mo�e jeszcze kiedy� si� spotkamy.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Kto wie... Spotkasz na swojej drodze jeszcze wiele bram i �uk�w. A przy jednym z nich znajdziesz mnie...
	
	AI_StopProcessInfos (self);
	
};



