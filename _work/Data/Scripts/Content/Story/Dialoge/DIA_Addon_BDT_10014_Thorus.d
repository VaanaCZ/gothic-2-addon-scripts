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
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Znasz zasadê. Bez czerwonego kamienia nikt nie wejdzie do kopalni.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Zapomnij o kopalni. Muszê siê dostaæ do Kruka.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Pewnie, ale zasady dotycz¹ wszystkich. Nawet ciebie.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//IdŸ z powrotem. Je¿eli spróbujesz wejœæ na górê bez pozwolenia, stra¿nicy ciê zabij¹. Takie s¹ zasady.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Jak ci siê coœ nie podoba, to idŸ porozmawiaæ z Estebanem. On jest odpowiedzialny za obóz.
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
	description = "To naprawdê wa¿ne, abym dosta³ siê do Kruka...";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//To naprawdê wa¿ne, ¿ebym dosta³ siê do Kruka...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//No i co z tego? Naprawdê s¹dzisz, ¿e zdo³asz do niego dotrzeæ?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Jego stra¿nik ma rozkaz NIKOGO nie wpuszczaæ. Bêdziesz martwy, zanim zdo³asz go zobaczyæ.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Tak wiêc wybij to sobie z g³owy.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Kruk jest przywódc¹ bandytów. Bêdê musia³ oczyœciæ sobie drogê, aby do niego dotrzeæ."); 
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
	description = "Nie pamiêtasz mnie? Ze Starego Obozu?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Nie pamiêtasz mnie? Ze Starego Obozu?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Jesteœ jednym z wiêŸniów? A mo¿e by³eœ jednym z moich stra¿ników. Co z tego? Wydaje ci siê, ¿e teraz jesteœmy sojusznikami?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//Nie, nie wydaje mi siê.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Mo¿e to ty obali³eœ barierê... mo¿e to ty zabi³eœ moich kumpli.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//No i co z tego?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Te dni ju¿ minê³y.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Chcesz wejœæ? To zdob¹dŸ czerwony kamieñ i nie marnuj mojego czasu.
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
	description = "Daj spokój, wpuœæ mnie. Przez wzgl¹d na stare, dobre czasy.";
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
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //Daj spokój, wpuœæ mnie. Przez wzgl¹d na stare, dobre czasy.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Pozwól, ¿e ci coœ wyjaœniê. Wiesz, dlaczego wci¹¿ ¿yjê?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Bo zawsze by³em lojalny wzglêdem moich ludzi.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Nie musi mi siê podobaæ to, co robi Kruk. Ale mimo to bêdê przestrzegaæ zasad. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //I ty tak¿e!
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
	description = "Mam dla ciebie kamienn¹ tabliczkê.";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//Mam dla ciebie kamienn¹ tabliczkê.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//To nie ta. Licz¹ siê tylko czerwone.
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
	description = "Mam tabliczkê z czerwonego kamienia...";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//Mam tabliczkê z czerwonego kamienia...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//W porz¹dku.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Wykoñczy³eœ Estebana - a to oznacza, ¿e teraz TY bêdziesz wykonywa³ jego pracê.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//W kopalni s¹ problemy z pe³zaczami.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Zniknê³o ju¿ trzech kopaczy. Twoim zadaniem jest zdobyæ nowych.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//A wtedy bêdê móg³ w koñcu wejœæ do tej piekielnej kopalni?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Wykonaj swoje zadanie - potem rób, co tylko zechcesz.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Poniewa¿ teraz przej¹³em obowi¹zki Estebana, powinienem wys³aæ trzech kopaczy do kopalni.");
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
	description = "Przys³a³em trzech ludzi.";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//Przys³a³em trzech ludzi.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//W porz¹dku. Jeœli o mnie chodzi, mo¿esz wejœæ.

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
	description = "Hej, a co z pancerzem? Gdzie go dostanê?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Hej, a co z pancerzem? Gdzie go dostanê?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//Nigdzie. Takie pancerze s¹ zarezerwowane dla stra¿y Kruka.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Nie mogê uwierzyæ, ¿e przeprowadza siê rekrutacjê, ale koniec koñców decyzja nie nale¿y do mnie, a do Kruka.
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
	description = "Co siê dzieje z wiêŸniami?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//Co siê dzieje z wiêŸniami?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Hmm, ich zadanie zosta³o wykonane. Z tego, co wiem, powinni teraz wydobywaæ z³oto.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//A je¿eli spróbuj¹ uciec?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//...Bloodwyn wys³a³by za nimi swych stra¿ników. Nie s¹dzê jednak, by byli a¿ tak szaleni, ¿eby próbowaæ ucieczki.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//Chyba ¿e..
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//Chyba ¿e co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//...ktoœ by im pomóg³. Nie znam jednak nikogo dostatecznie g³upiego, ¿eby siê na to powa¿y³... Przynajmniej tak d³ugo, jak Bloodwyn tu jest.
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
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//Co zamierzasz zrobiæ?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//S³ucham?!
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Bloodwyn nie stoi ci ju¿ na drodze. Zastanawiam siê, kto bêdzie nastêpny. Kruk? A mo¿e ja?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Boisz siê?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Nie bojê siê walki. Jedynie konsekwencji twoich czynów.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Ten obóz to wszystko, co mamy.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Nie uda³o siê tak, aby wszyscy byli zadowoleni, ale ZADZIA£A£O.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//A ka¿dy kolejny zabity oznacza coraz wiêkszy roz³am.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//Jesteœmy bandytami, pariasami, pogardzanymi wyrzutkami.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Dok¹dkolwiek pójdziemy, bêd¹ nas œcigaæ, zamykaæ w wiêzieniach i zabijaæ.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Nie ma dla nas ani lepszego miejsca, ani lepszego czasu.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//Czego wiêc chcesz?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Ci ludzie potrzebuj¹ kogoœ, kto ich poprowadzi. Kto ma to zrobiæ? Ty? Ktoœ, kto nie potrafi usiedzieæ na miejscu?
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
	description = "Dlaczego wiêc nie zostaniesz przywódc¹ obozu?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Dlaczego wiêc nie zostaniesz przywódc¹ obozu?
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//Dobrze, ale co z Krukiem?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Kruk nied³ugo bêdzie mia³ inne k³opoty. Ja ju¿ o to zadbam.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Upewnij siê, ¿e wiêŸniowie mog¹ swobodnie opuœciæ obóz.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//Dobrze. Zajmê siê wszystkimi stra¿nikami na zewn¹trz.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn nie ¿yje, a Thorus postara siê, aby niewolnicy mogli opuœciæ obóz."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Teraz ponownie porozmawiam ze stra¿nikami niewolników, a wtedy Patrick i jego ch³opaki wreszcie zabior¹ siê do roboty."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"Stra¿ niewolników nie bêdzie ju¿ sprawia³a k³opotów, wiêc Patrick i jego ch³opaki wreszcie mog¹ zabraæ siê do roboty."); 
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
	description = "Uda³o mi siê. Kruka ju¿ nie ma.";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//Uda³o mi siê. Kruka ju¿ nie ma.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//To bêdzie nauczka dla Beliara.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Ruszasz dalej?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Moje zadanie w dolinie zosta³o wykonane. Odpocznê kilka dni.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//Tak, ci¹gle w drodze, co? Bezpiecznej podró¿y.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Kto wie, mo¿e jeszcze kiedyœ siê spotkamy.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Kto wie... Spotkasz na swojej drodze jeszcze wiele bram i ³uków. A przy jednym z nich znajdziesz mnie...
	
	AI_StopProcessInfos (self);
	
};



