//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "What are you doing here?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//What are you doing here?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Are you looking for something?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Plants - I'm looking for plants.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Usually, I look for plants.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Most of the stuff that grows here can be used for something.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//Many plants have healing properties and you can smoke swampweed reefers.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Before my time behind the Barrier I worked as an alchemist.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "Why did they put you behind the Barrier?";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Why did they put you behind the Barrier?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//I worked with mind-altering potions a lot.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//One evening, my master Ignaz drank my 'experiment' instead of his wine.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//That rendered him temporarily... eh... unpredictable, and since then he's been somewhat confused.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//(snidely) The mages had me thrown behind the Barrier for that. 'Research into forbidden knowledge' they called it.
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "What can you tell me about the camp?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //What can you tell me about the camp?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Not much. I have never been in there myself.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Only Raven's people were there from the beginning. All the others who came later, like me, have to wait until they need new people.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "Where did you come from?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Where did you come from?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //Well, the same way as you I suppose. With the pirates. Over the sea.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //The valley here is completely cut off. There's no connection over land.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(thoughtfully) Right.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "When do they need new people?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //When do they need new people?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //Well, when they're missing some in there.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //If a digger gets himself eaten by a minecrawler, they let one of us replace him.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //Sometimes they also kill each other. But they've been better about that lately.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Raven has controlled the access to the mine somehow, so that not everyone can get in at the same time.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //But I don't know exactly how that works. I've never been inside.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "About Fortuno...";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno is pretty confused and could use a potion to restore his memory.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? That's Raven's servant, no?
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//He was. Now he's just a wreck. And it's Raven's fault.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Raven? Until now, I thought a lot of him. Hm, all right. But here in the swamp, I can't brew any potions.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//I could brew the potion. There's an alchemist's bench in the camp. I just need the recipe.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//Be careful with this recipe. Brewing this potion is dangerous.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//If something goes wrong in the brewing or one of the ingredients isn't right, the potion will be deadly.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//I'll be careful.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel has given me a recipe for a potion. I can use it to help Fortuno remember. I should only brew the potion when I am familiar with all of the ingredients. Otherwise it is deadly.");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "Can you teach me something?";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//Can you teach me something?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//No time. I am here to get gold. And as long as I can't get into the camp, I make a living by selling my herbs.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//But if you need a few potions, I still have some.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"I can buy potions and plants from Miguel.");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};



