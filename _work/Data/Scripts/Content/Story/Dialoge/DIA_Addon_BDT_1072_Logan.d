//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_EXIT   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 999;
	condition   = DIA_Addon_Logan_EXIT_Condition;
	information = DIA_Addon_Logan_EXIT_Info;
	permanent   = TRUE;
	description = "Przyjdê póŸniej...";
};
FUNC INT DIA_Addon_Logan_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Logan_EXIT_Info()
{		
	AI_Output (other,self,"DIA_Addon_Logan_EXIT_15_00");//Przyjdê póŸniej...
	
	if ((!MIS_HlpLogan == LOG_RUNNING)
	|| ( !MIS_HlpLogan == LOG_SUCCESS))
	&& (Logan_Inside == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Logan_EXIT_10_01");//Tak, uciekaj. Bêdê tu sta³ i zatrzymam ka¿dego, kto spróbuje siê zbli¿yæ.
	};
	AI_StopProcessInfos (self);
};	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Logan_PICKPOCKET (C_INFO)
{
	npc			= BDT_1072_Addon_Logan;
	nr			= 900;
	condition	= DIA_Addon_Logan_PICKPOCKET_Condition;
	information	= DIA_Addon_Logan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Logan_PICKPOCKET_Condition()
{
	C_Beklauen (59, 50);
};
 
FUNC VOID DIA_Addon_Logan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Logan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Logan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Logan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Logan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Logan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Logan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Logan_PICKPOCKET);
};
	
func void DIA_Addon_Logan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Logan_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1072_Logan_Mine   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_Mine_Condition;
	information = DIA_Addon_Logan_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Logan_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	&& (Npc_GetDistToWP (self, "BL_INN_CORNER_02") <= 1000) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_1072_Logan_Mine_10_00");//Uda³o ci siê, co? W porz¹dku, dobrze, ¿e mi pomagasz.
	
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};
//---------------------------------------------------------------------
//	Info INSIDE
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_How2   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_How2_Condition;
	information = DIA_Addon_Logan_How2_Info;
	permanent   = FALSE;
	description	= "Co u ciebie s³ychaæ?";
};
FUNC INT DIA_Addon_Logan_How2_Condition()	
{
	if (Logan_Inside == TRUE)
	&& (Npc_GetDistToWP (self,"BL_INN_CORNER_02") <= 1000)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_How2_Info()
{
	AI_Output (other, self, "DIA_Addon_Logan_How2_15_00"); //Co u ciebie s³ychaæ?
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_01"); //No có¿, przynajmniej jestem w œrodku. Lucia pêdzi naprawdê mocny bimber.
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_02"); //Esteban nie pozwala mi jednak wejœæ do kopalni. Przynajmniej na razie. Ale dosta³em kilka innych zadañ.
	AI_Output (other, self, "DIA_Addon_Logan_How2_15_03"); //No i? Co ci kaza³ robiæ?
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_04"); //Ktoœ próbowa³ zabiæ Estebana. Chce wiedzieæ, kto za tym stoi.
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_05"); //Esteban s¹dzi, ¿e w sprawê zamieszany jest Snaf. Mam mieæ na niego oko...

};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Attentat   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 9;
	condition   = DIA_Addon_Logan_Attentat_Condition;
	information = DIA_Addon_Logan_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Logan_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&& (Logan_Inside == TRUE)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Logan_Attentat_10_00");//A wiêc szukasz ludzi, którzy s¹ za to odpowiedzialni?
	AI_Output (self, other, "DIA_Addon_Logan_Attentat_10_01");//Nic o tym nie wiem. Sk¹d niby mia³em siê dowiedzieæ? Siedzia³em jeszcze w bagnie, gdy ca³a ta historia mia³a miejsce.
};
//---------------------------------------------------------------------
//	Info HI 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_HI   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_HI_Condition;
	information = DIA_Addon_Logan_HI_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Logan_HI_Condition()	
{
	if (Logan_Inside == FALSE)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_HI_Info()
{
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_00");//Patrzcie, pañstwo, nowa twarz.
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_01");//Zamierzasz tak staæ czy przyszed³eœ mi pomóc?
	
	if Npc_KnowsInfo (other, DIA_Addon_Franco_HI) 
	{
		AI_Output (other, self, "DIA_Addon_Logan_HI_15_02");//Franko mnie przys³a³. Mówi³, ¿e przyda ci siê pomoc. To o co chodzi?
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Logan_HI_15_03");//To zale¿y - jakiej pomocy ci trzeba?
	};
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_04");//B³otne wê¿e ostatnimi czasy trochê za bardzo siê do nas zbli¿aj¹. Pora zabiæ czêœæ z nich.
	
	Log_CreateTopic (Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Logan,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Logan,"Logan chce, ¿ebym zapolowa³ z nim na wê¿e b³otne.");
};
//---------------------------------------------------------------------
//	Info Why
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Why   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_Why_Condition;
	information = DIA_Addon_Logan_Why_Info;
	permanent   = FALSE;
	description	= "A co za to dostanê?";
};
FUNC INT DIA_Addon_Logan_Why_Condition()	
{
	if Npc_KnowsInfo (other, DIA_Addon_Logan_HI)
	&& (Logan_Inside == FALSE)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Why_Info()
{
	AI_Output (other, self, "DIA_Addon_Logan_Why_15_00"); //A co za to dostanê?
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_01"); //Franko pozwoli ci tu gniæ, jeœli nie bêdzie dla ciebie lepszego zastosowania.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_02"); //Chcesz wejœæ do obozu? No to musisz pomagaæ. Same s³owa nie przybli¿¹ ciê do celu.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_03"); //Poza tym mogê ci pokazaæ, jak patroszyæ te bestie.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_04"); //Nie s¹dzê jednak, ¿eby Franko wpuœci³ ciê do œrodka tylko dlatego, ¿e zabijesz parê wê¿y.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_05"); //Jest tu sporo ludzi, którzy ju¿ trochê czekaj¹.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_06"); //I lepiej bêdzie, jeœli nastêpn¹ osob¹, która wejdzie do obozu, bêdê ja...
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Logan mo¿e nauczyæ mnie zdejmowania futra, wyrywania pazurów i zêbów.");	
};
//---------------------------------------------------------------------
//	Info Lager
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Lager   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 3;
	condition   = DIA_Addon_Logan_Lager_Condition;
	information = DIA_Addon_Logan_Lager_Info;
	permanent   = FALSE;
	description	= "Czym jest obóz?";
};
FUNC INT DIA_Addon_Logan_Lager_Condition()	
{
	if Npc_KnowsInfo (other, DIA_Addon_Logan_Why)
	&& (Logan_Inside == FALSE)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Logan_Lager_15_00");//Czym jest obóz?
	AI_Output (self, other, "DIA_Addon_Logan_Lager_10_01");//Pytanie powinno brzmieæ: czym NIE jest obóz. Bez wê¿y, bez mokrych dziur... No wiesz, bez BAGNA.
	AI_Output (self, other, "DIA_Addon_Logan_Lager_10_02");//Zamiast tego maj¹ gorza³ê i z³oto. Z tego, co wiem, jest tam nawet jakaœ kobieta. Teraz rozumiesz?
};
//---------------------------------------------------------------------
//	Info von Franco geschickt (MISsion) 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_MIS   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 99;
	condition   = DIA_Addon_Logan_MIS_Condition;
	information = DIA_Addon_Logan_MIS_Info;
	permanent   = FALSE;
	description	= "ChodŸmy zabiæ parê b³otnych wê¿y.";
};
FUNC INT DIA_Addon_Logan_MIS_Condition()	
{	
	if Npc_KnowsInfo (other, DIA_Addon_Logan_HI)
	{
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_MIS_Info()
{
	
	AI_Output (other, self, "DIA_Addon_Logan_MIS_15_00");//ChodŸmy zabiæ parê b³otnych wê¿y.
	AI_Output (self, other, "DIA_Addon_Logan_MIS_10_01");//Wygl¹da na to, ¿e zrozumia³eœ, jak siê robi postêpy. Tak jak i... Cii. S³ysza³eœ? S³yszê je.
	AI_Output (other, self, "DIA_Addon_Logan_MIS_15_02");//Rozumiem. Co teraz zrobimy?
	AI_Output (self, other, "DIA_Addon_Logan_MIS_10_03");//Id¹. Na pewno maj¹ ochotê na przek¹skê. Zobaczymy, kto kogo bêdzie jad³. Dalej!
	
	Snd_Play ("SWA_Warn");
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"JAGD");
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HlpLogan = LOG_RUNNING;
	
	
	Wld_InsertNpc (MIS_Addon_Swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc (MIS_Addon_Swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc (MIS_Addon_Swampshark_03,"ADW_BANDIT_VP3_06");
	
};
//---------------------------------------------------------------------
//	Info Sumpfhaie TOT
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_tot   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_tot_Condition;
	information = DIA_Addon_Logan_tot_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Logan_tot_Condition()	
{	
	if Npc_IsDead (MIS_Addon_Swampshark_01)
	&& Npc_IsDead (MIS_Addon_Swampshark_02)
	&& Npc_IsDead (MIS_Addon_Swampshark_03)
	&& Npc_KnowsInfo (other,DIA_Addon_Logan_MIS)
	{
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_tot_Info()
{	 
	AI_Output (self, other, "DIA_Addon_Logan_tot_10_00");//Dobry b³otny w¹¿ to martwy b³otny w¹¿. To powinno byæ przestrog¹ dla pozosta³ych.
	AI_Output (other, self, "DIA_Addon_Logan_tot_15_01");//W porz¹dku, masz coœ jeszcze do zrobienia? Bo muszê ruszaæ dalej...
	AI_Output (self, other, "DIA_Addon_Logan_tot_10_02");//W tej chwili nic. Wiesz, kogo musisz poszukaæ, jeœli bêdziesz chcia³ siê czegoœ nauczyæ.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	B_CheckLog ();
	B_LogEntry (Topic_Addon_Franco,"Pomog³em Loganowi. Czas zobaczyæ, co s¹dzi o tym Franko.");
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	
};

///////////////////////////////////////////////////////////////////////
//	Info Lernen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Logan_Lern   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 100;
	condition   = DIA_Addon_Logan_Lern_Condition;
	information = DIA_Addon_Logan_Lern_Info;
	permanent   = FALSE;
	description = "Poka¿ mi, jak patroszyæ zwierzêta...";
};
FUNC INT DIA_Addon_Logan_Lern_Condition()
{	
 	if Npc_KnowsInfo (other, DIA_Addon_Logan_Why)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Lern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Logan_Lern_15_00");//Poka¿ mi, jak patroszyæ zwierzêta...
	AI_Output (self, other, "DIA_Addon_Logan_Lern_10_01");//Jeœli chcesz siê czegoœ dowiedzieæ o krwiopijcach, zapytaj lepiej Edgora.
	AI_Output (self, other, "DIA_Addon_Logan_Lern_10_02");//Je¿eli bêdziesz patroszy³ bagienne wê¿e czy jaszczurki, to mo¿e chcesz nauczyæ siê, jak je obdzieraæ ze skóry i wyrywaæ im zêby?
};
///////////////////////////////////////////////////////////////////////
//	Info Allgemeine Talente
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Logan_Allg   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 3;
	condition   = DIA_Addon_Logan_Allg_Condition;
	information = DIA_Addon_Logan_Allg_Info;
	permanent   = TRUE;
	description = "Chcê siê nauczyæ...";
};
FUNC INT DIA_Addon_Logan_Allg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Logan_Lern)
	&& ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Allg_Info()
{
	Info_ClearChoices (DIA_Addon_Logan_Allg);
	Info_AddChoice (DIA_Addon_Logan_Allg,DIALOG_BACK,DIA_Addon_Logan_Allg_BACK);
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Wyrywania zêbów",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Addon_Logan_Allg_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Wyrywania pazurów",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Addon_Logan_Allg_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Zdejmowania futra",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Addon_Logan_Allg_Fur);
	};
	
};
//------------------------------------------------------------------------------------------------
//			Allgemeine Talente
//------------------------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Logan_Allg_BACK()
{
	Info_ClearChoices (DIA_Addon_Logan_Allg);
};
FUNC VOID DIA_Addon_Logan_Allg_Teeth ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth);
};
FUNC VOID DIA_Addon_Logan_Allg_Claws ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws);
};
FUNC VOID DIA_Addon_Logan_Allg_Fur ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur);
};

//----------------------------------------------------------------------
var int Logan_Lohn;
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Hacker   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 9;
	condition   = DIA_Addon_Logan_Hacker_Condition;
	information = DIA_Addon_Logan_Hacker_Info;
	permanent   = TRUE;
	Description = "Co nowego?"; 
};
FUNC INT DIA_Addon_Logan_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Logan_Hacker_15_00"); //Co nowego?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_01"); //Hej, uda³o mi siê dziêki twojej pomocy! Dosta³em pozwolenie na wejœcie do kopalni!
	AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_02"); //Nie znam siê na wydobyciu z³ota, ale jakoœ sobie poradzê.
	
	if (Logan_Lohn == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_03"); //Opanowa³em ju¿ podstawy. Dobrze siê ustaw i wal tak mocno, jak mo¿esz!
		B_Upgrade_Hero_HackChance(10); 
		Logan_Lohn = TRUE;
	};
};
	


