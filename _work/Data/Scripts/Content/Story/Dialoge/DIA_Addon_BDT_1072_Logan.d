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
	description = "Przyjd� p�niej...";
};
FUNC INT DIA_Addon_Logan_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Logan_EXIT_Info()
{		
	AI_Output (other,self,"DIA_Addon_Logan_EXIT_15_00");//Przyjd� p�niej...
	
	if ((!MIS_HlpLogan == LOG_RUNNING)
	|| ( !MIS_HlpLogan == LOG_SUCCESS))
	&& (Logan_Inside == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Logan_EXIT_10_01");//Tak, uciekaj. B�d� tu sta� i zatrzymam ka�dego, kto spr�buje si� zbli�y�.
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
	AI_Output (self, other, "DIA_Addon_BDT_1072_Logan_Mine_10_00");//Uda�o ci si�, co? W porz�dku, dobrze, �e mi pomagasz.
	
	
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
	description	= "Co u ciebie s�ycha�?";
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
	AI_Output (other, self, "DIA_Addon_Logan_How2_15_00"); //Co u ciebie s�ycha�?
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_01"); //No c�, przynajmniej jestem w �rodku. Lucia p�dzi naprawd� mocny bimber.
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_02"); //Esteban nie pozwala mi jednak wej�� do kopalni. Przynajmniej na razie. Ale dosta�em kilka innych zada�.
	AI_Output (other, self, "DIA_Addon_Logan_How2_15_03"); //No i? Co ci kaza� robi�?
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_04"); //Kto� pr�bowa� zabi� Estebana. Chce wiedzie�, kto za tym stoi.
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_05"); //Esteban s�dzi, �e w spraw� zamieszany jest Snaf. Mam mie� na niego oko...

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
	AI_Output (self, other, "DIA_Addon_Logan_Attentat_10_00");//A wi�c szukasz ludzi, kt�rzy s� za to odpowiedzialni?
	AI_Output (self, other, "DIA_Addon_Logan_Attentat_10_01");//Nic o tym nie wiem. Sk�d niby mia�em si� dowiedzie�? Siedzia�em jeszcze w bagnie, gdy ca�a ta historia mia�a miejsce.
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
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_00");//Patrzcie, pa�stwo, nowa twarz.
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_01");//Zamierzasz tak sta� czy przyszed�e� mi pom�c?
	
	if Npc_KnowsInfo (other, DIA_Addon_Franco_HI) 
	{
		AI_Output (other, self, "DIA_Addon_Logan_HI_15_02");//Franko mnie przys�a�. M�wi�, �e przyda ci si� pomoc. To o co chodzi?
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Logan_HI_15_03");//To zale�y - jakiej pomocy ci trzeba?
	};
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_04");//B�otne w�e ostatnimi czasy troch� za bardzo si� do nas zbli�aj�. Pora zabi� cz�� z nich.
	
	Log_CreateTopic (Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Logan,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Logan,"Logan chce, �ebym zapolowa� z nim na w�e b�otne.");
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
	description	= "A co za to dostan�?";
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
	AI_Output (other, self, "DIA_Addon_Logan_Why_15_00"); //A co za to dostan�?
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_01"); //Franko pozwoli ci tu gni�, je�li nie b�dzie dla ciebie lepszego zastosowania.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_02"); //Chcesz wej�� do obozu? No to musisz pomaga�. Same s�owa nie przybli�� ci� do celu.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_03"); //Poza tym mog� ci pokaza�, jak patroszy� te bestie.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_04"); //Nie s�dz� jednak, �eby Franko wpu�ci� ci� do �rodka tylko dlatego, �e zabijesz par� w�y.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_05"); //Jest tu sporo ludzi, kt�rzy ju� troch� czekaj�.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_06"); //I lepiej b�dzie, je�li nast�pn� osob�, kt�ra wejdzie do obozu, b�d� ja...
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Logan mo�e nauczy� mnie zdejmowania futra, wyrywania pazur�w i z�b�w.");	
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
	description	= "Czym jest ob�z?";
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
	AI_Output (other, self, "DIA_Addon_Logan_Lager_15_00");//Czym jest ob�z?
	AI_Output (self, other, "DIA_Addon_Logan_Lager_10_01");//Pytanie powinno brzmie�: czym NIE jest ob�z. Bez w�y, bez mokrych dziur... No wiesz, bez BAGNA.
	AI_Output (self, other, "DIA_Addon_Logan_Lager_10_02");//Zamiast tego maj� gorza�� i z�oto. Z tego, co wiem, jest tam nawet jaka� kobieta. Teraz rozumiesz?
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
	description	= "Chod�my zabi� par� b�otnych w�y.";
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
	
	AI_Output (other, self, "DIA_Addon_Logan_MIS_15_00");//Chod�my zabi� par� b�otnych w�y.
	AI_Output (self, other, "DIA_Addon_Logan_MIS_10_01");//Wygl�da na to, �e zrozumia�e�, jak si� robi post�py. Tak jak i... Cii. S�ysza�e�? S�ysz� je.
	AI_Output (other, self, "DIA_Addon_Logan_MIS_15_02");//Rozumiem. Co teraz zrobimy?
	AI_Output (self, other, "DIA_Addon_Logan_MIS_10_03");//Id�. Na pewno maj� ochot� na przek�sk�. Zobaczymy, kto kogo b�dzie jad�. Dalej!
	
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
	AI_Output (self, other, "DIA_Addon_Logan_tot_10_00");//Dobry b�otny w�� to martwy b�otny w��. To powinno by� przestrog� dla pozosta�ych.
	AI_Output (other, self, "DIA_Addon_Logan_tot_15_01");//W porz�dku, masz co� jeszcze do zrobienia? Bo musz� rusza� dalej...
	AI_Output (self, other, "DIA_Addon_Logan_tot_10_02");//W tej chwili nic. Wiesz, kogo musisz poszuka�, je�li b�dziesz chcia� si� czego� nauczy�.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	B_CheckLog ();
	B_LogEntry (Topic_Addon_Franco,"Pomog�em Loganowi. Czas zobaczy�, co s�dzi o tym Franko.");
	
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
	description = "Poka� mi, jak patroszy� zwierz�ta...";
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
	AI_Output (other, self, "DIA_Addon_Logan_Lern_15_00");//Poka� mi, jak patroszy� zwierz�ta...
	AI_Output (self, other, "DIA_Addon_Logan_Lern_10_01");//Je�li chcesz si� czego� dowiedzie� o krwiopijcach, zapytaj lepiej Edgora.
	AI_Output (self, other, "DIA_Addon_Logan_Lern_10_02");//Je�eli b�dziesz patroszy� bagienne w�e czy jaszczurki, to mo�e chcesz nauczy� si�, jak je obdziera� ze sk�ry i wyrywa� im z�by?
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
	description = "Chc� si� nauczy�...";
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
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Wyrywania z�b�w",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Addon_Logan_Allg_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Wyrywania pazur�w",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Addon_Logan_Allg_Claws);
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
	AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_01"); //Hej, uda�o mi si� dzi�ki twojej pomocy! Dosta�em pozwolenie na wej�cie do kopalni!
	AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_02"); //Nie znam si� na wydobyciu z�ota, ale jako� sobie poradz�.
	
	if (Logan_Lohn == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_03"); //Opanowa�em ju� podstawy. Dobrze si� ustaw i wal tak mocno, jak mo�esz!
		B_Upgrade_Hero_HackChance(10); 
		Logan_Lohn = TRUE;
	};
};
	


