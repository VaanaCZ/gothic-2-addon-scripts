//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_EXIT   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 999;
	condition   = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lucia_PICKPOCKET (C_INFO)
{
	npc			= BDT_1091_Addon_Lucia;
	nr			= 900;
	condition	= DIA_Addon_Lucia_PICKPOCKET_Condition;
	information	= DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80_Female;
};                       
FUNC INT DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	C_Beklauen (80, 100);
};
 
FUNC VOID DIA_Addon_Lucia_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
	
func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Hi   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent   = FALSE;
	description = "Как дела?";
};
FUNC INT DIA_Addon_Lucia_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Hi_15_00");//Как дела?
	AI_Output (self, other, "DIA_Addon_Lucia_Hi_16_01");//Послушай. Если тебе нужна еда, спроси у Снафа. А если ты хочешь выпить, то ты обратился к нужному человеку.
};
//---------------------------------------------------------------------
//	Info was
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_was   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent   = FALSE;
	description = "И что же вы здесь пьете?";
};
FUNC INT DIA_Addon_Lucia_was_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_was_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_was_15_00");//И что же вы здесь пьете?
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_01");//Ну, пива у нас немного. Пиво на остров привозят только паладины.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_02");//И пожалуй, это единственная хорошая вещь, которую они привозят...
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_03");//Так что обычно мы пьем крепкие напитки. У меня есть самогон, грог и белый ром.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_04");//Хм-м... Тебе стоит попробовать вот это. Я взяла рецепт у Сэмюэля. Надо признать, он действительно знает свое дело.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"У Люсии я могу купить выпивку.");
};
//---------------------------------------------------------------------
//	Info Khorinis
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Khorinis   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent   = FALSE;
	description = "Ты из Хориниса, верно?";
};
FUNC INT DIA_Addon_Lucia_Khorinis_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Bromor_Lucia)
	|| (Nadja_GaveLuciaInfo == TRUE)
	|| Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Khorinis_15_00");//Ты из Хориниса, верно?
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_01");//Ох, не напоминай. Жизнь у меня там была незавидная.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_02");//Пока в город приходили корабли с заключенными, там еще можно было как-то прожить.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_03");//Но потом... (смеется) Нет, спасибо. Может быть, это из-за того, что мы на острове... Ладно, в любом случае, с той жизнью покончено.

	if (MIS_LuciasLetter != 0)
	|| (SC_KnowsLuciaCaughtByBandits != 0)
	|| (Nadja_GaveLuciaInfo != 0)
	{
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_06"); //С Элврихом я порвала!
		AI_Output (other,self , "DIA_Addon_Lucia_Khorinis_15_04"); //Почему?
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_05"); //Он трус! Когда бандиты утащили меня, он даже не попытался мне помочь.
		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP (XP_Ambient);
	};
	TOPIC_END_Lucia = TRUE;
};
//---------------------------------------------------------------------
//	Info Jetzt
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Jetzt   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent   = FALSE;
	description = "Что ты собираешься делать дальше?";
};
FUNC INT DIA_Addon_Lucia_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Khorinis)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Jetzt_15_00");//Что ты собираешься делать?
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_01");//Посмотрим. Пока я остаюсь здесь, со Снафом, Фиском и остальными.
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_02");//Ты уже видел Торуса? О Иннос, вот это мужчина!
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_03");//(смеется) Извини... давай вернемся к твоему вопросу... Цели у меня пока нет. Просто плыву по течению.
};
//---------------------------------------------------------------------
//	Info Paladine
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Paladine   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent   = FALSE;
	description = "Ты не очень-то любишь паладинов, верно?";
};
FUNC INT DIA_Addon_Lucia_Paladine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_15_00");//Ты не очень-то любишь паладинов, верно?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_01");//Этих фанатиков-убийц, которым платят маги огня? Нет, не люблю.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_02");//Лорд Хаген и его громилы заняли город, и все ползают перед ними на брюхе.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_03");//А мне это не по душе. Я не собиралась ждать, пока они не закроют Красную Лампу и не посадят меня за решетку.
	
	if (Npc_GetTrueGuild (other) != GIL_SLD)
	&& (Npc_GetTrueGuild (other) != GIL_DJG)
	{
		Info_ClearChoices (DIA_Addon_Lucia_Paladine);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Закончить разговор",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Но паладины сражаются во имя Инноса, который выбирает своих воинов.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Паладины - это воины Инноса. Они не убийцы.",DIA_Addon_Lucia_Paladine_MURDER);
		
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WAHL_15_00");//Но паладины сражаются во имя Инноса, который выбирает своих воинов.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_01");//Я верю, что люди сами выбирают свой путь.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_02");//А твои слова удивляют меня. Ты говоришь, как один из них.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Ты когда-нибудь кого-нибудь убивала?",DIA_Addon_Lucia_Paladine_KILL);
};
FUNC VOID DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_KILL_15_00");//Ты когда-нибудь кого-нибудь убивала?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_01");//Нет, и очень этому рада.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_02");//Давай прекратим говорить о таких серьезных вещах.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_03");//Лучше выпьем и будем наслаждаться каждым моментом жизни, данной нам богами.
	
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WEIB_15_00");//Ты отвергаешь Инноса, падшая девица?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_01");//Нет, что ты! Просто некоторые люди злоупотребляют его именем.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_02");//Но я ни на секунду не сомневалась в божественном великолепии Инноса.
};
FUNC VOID DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_MURDER_15_00");//Паладины - это воины Инноса. Они не убийцы.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_01");//И что с того? На их мечах кровь - так же, как на мечах бандитов и пиратов.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_02");//Единственное отличие в том, что они убивают именем Инноса, потому что хотят выжить.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Ты отвергаешь Инноса, падшая девица?",DIA_Addon_Lucia_Paladine_WEIB);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Attentat   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 9;
	condition   = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Lucia_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Lucia_Attentat_16_00");//Ничего.
};
//---------------------------------------------------------------------
//	Info Trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Trade   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 99;
	condition   = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = "Дай мне что-нибудь выпить.";
};
FUNC INT DIA_Addon_Lucia_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Trade_15_00");//Дай мне что-нибудь выпить.
	B_GiveTradeInv(self);
};
//---------------------------------------------------------------------
//	Info lernen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_lernen   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 19;
	condition   = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent   = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};
FUNC INT DIA_Addon_Lucia_lernen_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_lernen_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_lernen_15_00");//Ты можешь меня чему-нибудь обучить?
	AI_Output (self, other, "DIA_Addon_Lucia_lernen_16_01");//(смеется) С радостью. Я могу помочь тебе увеличить ловкость.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Люсия может помочь мне стать более ловким.");	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lucia_TEACH		(C_INFO)
{
	npc		  	 = 	BDT_1091_Addon_Lucia;
	nr			 = 	101;
	condition	 = 	DIA_Addon_Lucia_TEACH_Condition;
	information	 = 	DIA_Addon_Lucia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Я хочу стать более ловким.";
};
func int DIA_Addon_Lucia_TEACH_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_lernen)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lucia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lucia_TEACH_15_00"); //Я хочу стать более ловким.
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
};
func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_TEACH);
};
func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};
func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};



