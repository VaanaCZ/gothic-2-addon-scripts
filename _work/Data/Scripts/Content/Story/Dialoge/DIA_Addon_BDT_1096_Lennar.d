//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_EXIT   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 999;
	condition   = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent   = TRUE;
	description = "Už musím jít.";
};
FUNC INT DIA_Addon_Lennar_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_EXIT_Info()
{		
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lennar_PICKPOCKET (C_INFO)
{
	npc			= BDT_1096_Addon_Lennar;
	nr			= 900;
	condition	= DIA_Addon_Lennar_PICKPOCKET_Condition;
	information	= DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	C_Beklauen (65, 100);
};
 
FUNC VOID DIA_Addon_Lennar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
	
func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hi   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 1;
	condition   = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent   = FALSE;
	description	= "Zdravím.";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//Zdravím.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//Zdravím. Jsem Lennar. Vítej v kopáčským táboâe.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//Kopáčským? Já myslel, že tohle býval tábor banditů.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//To jo, ale banditi sem taky pâišli kopat. (pokrčí rameny) Takže co?
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Attentat   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 2;
	condition   = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent   = FALSE;
	description	= "K tomu pokusu o zavraždęní Estebana...";
};
FUNC INT DIA_Addon_Lennar_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //(naivnę) Ano?
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //Máš tušení, kdo za tím stojí?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //(nadšenę) Jasnę!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //(horečnatę) Já ti to âeknu! Vsadím se, že za tím vęzí Emilio!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //(horečnatę) Vždycky se do dolu hnal jak šílenec a kopal, co mu síly stačily.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //(potutelnę) Ale od toho útoku už jenom sedí na lavičce a nehne ani prstem.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //(vysvętluje) Je to jasný! Do dolu se dostane, jedinę když mu Esteban dá červenej kámen.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //(spiklenecky) Ale vsadím se, že se mu neodvažuje podívat do očí.

	B_LogEntry (Topic_Addon_Esteban, "Lennar podezírá Emilia, protože už k Estebanovi nepâišel.");
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Inspektor (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 3;
	condition   = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent   = FALSE;
	description	= "A co by Emilio z Estebanovy smrti męl?";
};
FUNC INT DIA_Addon_Lennar_Inspektor_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //A co by Emilio z Estebanovy smrti męl?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //Co já vím? Možná má v dole ŕákýho kámoše, kterej by se rád dostal na Estebanovo místo.
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //(pro sebe) Jo, to by dávalo smysl.
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Mine   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 4;
	condition   = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Lennar_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Ty pro mę vážnę máš červenej kámen.
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//Výbornę. Teë budu drtit ty zatracený šutry na prášek – už pâesnę vím, kam půjdu!
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//A ještę jedna vęc – když doluješ, dávej pozor, abys nedával moc SILNÝ rány. Jinak se ti krumpáč v tom zlatę zaklíní.
	
	B_Upgrade_Hero_HackChance(10);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Gold   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 5;
	condition   = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent   = FALSE;
	description = "Můžeš mę naučit, jak dolovat zlato?";
};
FUNC INT DIA_Addon_Lennar_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lennar_Hi)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //Můžeš mę naučit zlatokopectví?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //Určitę, ale až tę to naučím, budeš dolovat víc zlata.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //Právę proto se ptám.
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //Jasnę, ale když toho víc vydoluješ, bylo by fér se o to taky podęlit.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //No...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Taky mi ten podíl můžeš dát napâed. Âeknęme...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //tak padesát zlaăáků.
};

//---------------------------------------------------------------------
//	Train
//---------------------------------------------------------------------
var int Lennar_TeachGold;
// --------------------------------------------
INSTANCE DIA_Addon_Lennar_Train   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 6;
	condition   = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent   = TRUE;
	description = "Nauč mę dolovat zlato! (50 zlatých)";
};
FUNC INT DIA_Addon_Lennar_Train_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Lennar_Gold))
	&& (Lennar_TeachGold == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Train_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //Nauč mę dolovat zlato!
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //Dobâe. Když postupuješ dál, dávej pravidelný rány – nijak to nepâehánęj, ale zase u toho neusni.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //A taky nemlaă poâád do jednoho místa – snaž se to opracovávat tak, abys získal slušnej nugget.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Když to takhle budeš dęlat, za chvíli z tebe bude mistr.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //Napâed chci vidęt svůj podíl!
	};
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hacker   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 9;
	condition   = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent   = TRUE;
	Description = "Je všechno v poâádku?"; 
};
FUNC INT DIA_Addon_Lennar_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //Je všecko v poâádku?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Hezky pravidelnę – jen tak získáš pęknę velký nuggety!
};


