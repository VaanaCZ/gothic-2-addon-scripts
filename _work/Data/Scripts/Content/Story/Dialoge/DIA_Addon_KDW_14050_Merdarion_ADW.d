
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14050_Addon_Merdarion_ADW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information = DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14050_Addon_Merdarion_ADW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wдre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Merdarion_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_ADW_PICKPOCKET);
};
*/
 ///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ADWHello_Condition;
	information	 = 	DIA_Addon_Merdarion_ADWHello_Info;

	description	 = 	"Как дела?";
};

func int DIA_Addon_Merdarion_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Back ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_Back_15_00"); //Я услышал достаточно.
	Info_ClearChoices	(DIA_Addon_Merdarion_ADWHello);
};
func void DIA_Addon_Merdarion_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_15_00"); //Как дела?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_01"); //(прислушиваясь) Слушай... Любопытно, да?
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_15_02"); //Хм-м...
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_03"); //Эти телепортационные камни, видимо, не работают, но все еще слышно, как они гудят.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_04"); //Хотя они неактивны, в них еще осталась какая-то энергия.

	Info_ClearChoices	(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Где эти телепорты черпают энергию?", DIA_Addon_Merdarion_ADWHello_reaktor );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Как ты думаешь, как их можно активировать?", DIA_Addon_Merdarion_ADWHello_was );
};
func void DIA_Addon_Merdarion_ADWHello_was ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_was_15_00"); //Как ты думаешь, как их можно активировать?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_01"); //У меня есть одна идея. Только мне нужно убедиться, что мое подозрение верно.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_02"); //У меня несколько дней назад было ощущение, что я уже видел похожую штуку.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_03"); //Я полагаю, что нам нужно передать им внушительное количество магической энергии, чтобы заставить их снова работать.
	
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Где ты видел такие телепортационные камни раньше?", DIA_Addon_Merdarion_ADWHello_wo );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Что может дать достаточное количество магической энергии?..", DIA_Addon_Merdarion_ADWHello_focus );
};
func void DIA_Addon_Merdarion_ADWHello_focus ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_00"); //Что может дать достаточное количество магической энергии?..
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_01"); //Мне приходит в голову только одна идея. Магическая фокусировка.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_02"); //Я имею в виду один из пяти фокусирующих камней, которые были использованы при создании магического Барьера в Долине Рудников.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_03"); //Насколько я знаю, некоторое время назад ты вернул их нам.
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_04"); //Да, я помню.
	
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Ты сказал, что тебе нужно убедиться, что твое подозрение верно.", DIA_Addon_Merdarion_ADWHello_focusProof );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "И где фокусирующие камни сейчас?", DIA_Addon_Merdarion_ADWHello_focusWo );
};
func void DIA_Addon_Merdarion_ADWHello_focusWo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focusWo_15_00"); //И где фокусирующие камни сейчас?
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_01"); //Они были доверены мне. Я должен хранить их, пока им не найдется другое использование.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_02"); //Похоже, что время пришло.
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Я услышал достаточно.", DIA_Addon_Merdarion_ADWHello_Back );
};
func void DIA_Addon_Merdarion_ADWHello_focusProof ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focusProof_15_00"); //Ты сказал, что тебе нужно убедиться, что твое подозрение верно.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_01"); //Магический фокус может быть связан с этими камнями.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_02"); //Но я не знаю где.
};
func void DIA_Addon_Merdarion_ADWHello_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_wo_15_00"); //Где ты видел такие телепортационные камни раньше?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_01"); //Ты тоже был в исправительной колонии. Неужели ты никогда их не замечал?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_02"); //Я совершенно уверен, что их все еще можно там найти.
};
func void DIA_Addon_Merdarion_ADWHello_reaktor ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_reaktor_15_00"); //Что эти камни делают?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_01"); //Зодчие были очень развитой нацией.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_02"); //Они использовали такие свойства магии, которых мы никогда не видели.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_03"); //Сеть телепортационных камней была построена, чтобы зодчие могли быстро перемещаться из одного города в другой.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_04"); //ЭТОТ камень, очевидно, является центральным.
};

///////////////////////////////////////////////////////////////////////
//	Info FokusGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FokusGeben		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_FokusGeben_Condition;
	information	 = 	DIA_Addon_Merdarion_FokusGeben_Info;

	description	 = 	"Дай мне фокусирующий камень.";
};

func int DIA_Addon_Merdarion_FokusGeben_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_FokusGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_FokusGeben_15_00"); //Дай мне фокусирующий камень. Я попробую заставить телепортеры работать.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FokusGeben_06_01"); //Хорошо. Но будь осторожен, слышишь меня?
	AI_Output	(self, other, "DIA_Addon_Merdarion_FokusGeben_06_02"); //Сатурас снимет с меня голову, если мы их потеряем.
	CreateInvItems (self, ItMi_Focus, 1);									
	B_GiveInvItems (self, other, ItMi_Focus, 1);			
	
	Log_CreateTopic (TOPIC_Addon_TeleportsADW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsADW,"Маг воды Мердарион дал мне один из старых камней фокусировки, которые использовались для создания Барьера вокруг Долины Рудников. С его помощью я могу попробовать активировать какой-нибудь телепорт."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FirstFocus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FirstFocus		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_FirstFocus_Condition;
	information	 = 	DIA_Addon_Merdarion_FirstFocus_Info;

	description	 = 	"Я активировал один из телепортационных камней.";
};

func int DIA_Addon_Merdarion_FirstFocus_Condition ()
{
	if (TriggeredTeleporterADW != 0)
		{
			return TRUE;
		};
};
var int Merdarion_GotFocusCount;
func void DIA_Addon_Merdarion_FirstFocus_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_FirstFocus_15_00"); //Я активировал один из телепортационных камней.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_01"); //Да, я вижу. Значит, я был прав.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_02"); //Я поговорил с другими об этом.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_03"); //Мы хотим, чтобы ты попытался активировать все остальные телепортационные камни.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_04"); //Если мы сможем быстро перемещаться из одной части города в другую, нам это очень  поможет исследованиях, .
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_05"); //Вот еще один фокусирующий камень.
	CreateInvItems (self, ItMi_Focus, 1);									
	B_GiveInvItems (self, other, ItMi_Focus, 1);		
	Merdarion_GotFocusCount = 1;
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_06"); //Активируй их все, если сумеешь.
	AI_Output	(other, self, "DIA_Addon_Merdarion_FirstFocus_15_07"); //Я постараюсь.
	B_GivePlayerXP (XP_Addon_ActivatedTeleportStone);
	B_LogEntry (TOPIC_Addon_TeleportsADW,"Мердарион дал мне еще один камень фокусировки. Я должен постараться активировать все телепорты. Мердарион будет снабжать меня новыми камнями по мере включения телепортов."); 
};

///////////////////////////////////////////////////////////////////////
//	Info ActivateTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ActivateTeleports		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent	 = 	TRUE;

	description	 = 	"Я активировал еще один телепортационный камень.";
};
func int DIA_Addon_Merdarion_ActivateTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_FirstFocus))
	&&	(TriggeredTeleporterADW > Merdarion_GotFocusCount)
	&& (Merdarion_GotFocusCount < 6)
			{
				return TRUE;
			};
};

var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

func void DIA_Addon_Merdarion_ActivateTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_00"); //Я активировал еще один телепортационный камень.

	if (SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_01"); //Дай мне следующий фокусирующий камень.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_02"); //Конечно, пожалуйста.
		CreateInvItems (self, ItMi_Focus, 1);									
		B_GiveInvItems (self, other, ItMi_Focus, 1);		
	};
	
	if (DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_03"); //Это было сложно?
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_04"); //Как посмотреть. Я бы не отказался от помощи.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_05"); //Я могу дать тебе немного золота, это поможет?
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_06"); //Явно не помешает.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_07"); //Посмотрим...
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	
	if (SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_08"); //Ты проделал отличную работу. Мне остается только поздравить тебя.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_09"); //Теперь они все работают. Впечатляющее зрелище, правда?
	};
	
	AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_10"); //Вот несколько золотых монет.
	B_GivePlayerXP (XP_Addon_ActivatedTeleportStone);
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);		
	Merdarion_GotFocusCount = (Merdarion_GotFocusCount + 1);
	
	if (Merdarion_GotFocusCount >= 1)
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
 	&& (MIS_Saturas_LookingForHousesOfRulers == 0)
 	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_11"); //Да, и кстати, пока я не забыл - Сатурас хотел поговорить с тобой.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_12"); //Ты должен найти его как можно скорее.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachMana
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_PreTeachMana		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information	 = 	DIA_Addon_Merdarion_ADW_PreTeachMana_Info;

	description	 = 	"Ты можешь повысить мои магические способности?";
};
func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_ADWHello))
		{
			return TRUE;
		};
};
func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADW_PreTeachMana_15_00"); //Ты можешь повысить мои магические способности?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADW_PreTeachMana_06_01"); //Я могу увеличить количество твоей магической энергии.
	Merdarion_Addon_TeachMana = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher,"Мердарион может увеличить мою магическую энергию."); 
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH_MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDW_14050_Addon_Merdarion_ADW;
	nr 			 =  99;
	condition	 = 	DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information	 = 	DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Я хочу повысить свои магические способности.";
};
var int Merdarion_ADW_Empty;
func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition ()
{	
		if (Merdarion_ADW_Empty == FALSE)
		&& (Merdarion_Addon_TeachMana == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00"); //Я хочу увеличить мою магическую энергию.
		
		Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
		Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
		Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)  
	{
		AI_Output (self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00"); //То, что ты просишь, выходит за рамки моих способностей.
		AI_Output (self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01"); //Ты уже знаешь все, чему бы я тебя мог научить.
		Merdarion_ADW_Empty = TRUE;
	};
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH);
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
	Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH);
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
	Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};












