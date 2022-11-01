var int Edgor_Exiteinmal;

INSTANCE DIA_Addon_Edgor_EXIT   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 999;
	condition   = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_MIS2)
	&& (Edgor_Exiteinmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //Был рад познакомиться...
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Edgor_PICKPOCKET (C_INFO)
{
	npc			= BDT_1074_Addon_Edgor;
	nr			= 900;
	condition	= DIA_Addon_Edgor_PICKPOCKET_Condition;
	information	= DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	C_Beklauen (10, 7);
};
 
FUNC VOID DIA_Addon_Edgor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	B_Say (self, self, "$AWAKE");
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
	
func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Hi   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent   = FALSE;
	description = "Как дела?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //Как дела?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Ты хочешь узнать, как у меня дела? Я тебе расскажу, как у меня дела.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Сначала какие-то пираты привезли меня сюда в шторм. Я облевал всю их посудину.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //Затем Ворон запер шахту, потому что какие-то идиоты слишком сильно хотят золота.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //А затем Франко стал командиром охотников и убивает всякого, кто против него.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Я бы сказал, что дела идут отвратительно.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//---------------------------------------------------------------------
//	Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Franco (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent   = FALSE;
	description = "Как Франко сделался старшим?";
};
FUNC INT DIA_Addon_Edgor_Franco_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Franco_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //Как Франко сделался старшим?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Очень просто. Убил Флетчера, который был командиром до него.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Флетчер был свой парень. А Франко просто загонял нас.
};	

//---------------------------------------------------------------------
//	Info MIS2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_MIS2   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent   = FALSE;
	description = "Франко послал меня по поводу этой каменной таблички...";
};
FUNC INT DIA_Addon_Edgor_MIS2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Франко послал меня по поводу этой каменной таблички. Ты ее нашел?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //Приятель, я даже не пытался ее искать. Все, что я знаю, - это то, что она должна быть где-то в том старом здании на болоте.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //А мой внутренний голос говорит мне: 'Эдгор, сторонись старых зданий, стоящих на болоте'.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Я не собираюсь рисковать своей шкурой ради этого раздолбая Франко!
	
	B_LogEntry (Topic_Addon_Stoneplate,"Эдгор не собирается искать каменную табличку. Он говорит, что она находится в каком-то старом строении на болотах.");
};
//---------------------------------------------------------------------
//	Info Wegbeschreibung
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Weg   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent   = FALSE;
	description = "А где находится это старое здание?";
};
FUNC INT DIA_Addon_Edgor_Weg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Edgor_MIS2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Weg_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //А где находится это старое здание?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Обойди слева тот большой камень. Через некоторое время увидишь другой большой камень.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Его надо обойти слева... или справа, я уже не помню - это было слишком давно.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Но развалины должны быть на небольшом возвышении. И они совсем заросли растениями.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Может быть, тебе повезет и ты не найдешь их...
};
//---------------------------------------------------------------------
//	Info Found
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Found   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent   = FALSE;
	description = "Я нашел каменную табличку!";
};
FUNC INT DIA_Addon_Edgor_Found_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04) >= 1)
	&& !Npc_IsDead (Franco)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Found_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//(радостно) Я нашел каменную табличку!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//(скучно) Правда? Ты смелый парень.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//(скучно) Тогда ты наверняка заработал себе пропуск в лагерь. (зевает)
};
//---------------------------------------------------------------------
//	Info Teach
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Teach   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent   = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};
FUNC INT DIA_Addon_Edgor_Teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//Можешь научить меня кое-чему?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//Я многое знаю про кровавых мух. Я ненавижу этих гадкий тварей даже больше, чем я ненавижу Франко!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Но я знаю, как отрывать от них жала и крылья, от их мертвых тушек. (с оттенком безумия) Да! Отрывать от них...
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//Кроме того, я знаю, как выделять секрет из оторванных жал.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Если хочешь, я могу научить тебя всей этой фигне.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Конечно, я ничего не буду делать бесплатно...
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"О кровавых мухах Эдгору известно все.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Мне нужно золото. Меня интересуют только монеты, не самородки.
};
//---------------------------------------------------------------------
//	Info Train (Bloodflys)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_TrainStart   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent   = TRUE;
	description = "Кровавые мухи...";
};
FUNC INT DIA_Addon_Edgor_Start_Condition()
{	
	if (Edgor_Teach == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Start_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//По поводу кровавых мух...
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Что бы ты хотел узнать?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Жало кровавой мухи (5 LP, 100 золота)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Крылья кровавой мухи (5 LP, 100 золота)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Секрет из жала (1,  100 золота)",DIA_Addon_Edgor_TrainStart_GIFT);
	};
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Sting()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Как оторвать жало от мухи?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Переверни дохлую тварь на брюхо и разрежь ее крест-накрест. Схвати внутренности и разрежь ткани вдоль всей спины.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//После этого ты сможешь выдернуть жало резким движением.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Wing()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//А как отделить крылья?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//Схвати их одной рукой. Другой просто отрежь их по внешней стороне кожи.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_GIFT()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if (other.lp >= 1)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Как добыть секрет из жала кровавой мухи?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Разрежь верхний слой жала вдоль - тогда лечебный секрет и вытечет.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//Это совершенно безопасный способ высосать его из жала -  или использовать его для лечебного зелья.
			
			other.lp = (other.lp - 1);
			Knows_Bloodfly = TRUE; 
			PrintScreen (PRINT_ADDON_KNOWSBF, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};		


