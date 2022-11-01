// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Matteo_EXIT(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 999;
	condition	= DIA_Matteo_EXIT_Condition;
	information	= DIA_MAtteo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Matteo_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Matteo_PICKPOCKET (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 900;
	condition	= DIA_Matteo_PICKPOCKET_Condition;
	information	= DIA_Matteo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Matteo_PICKPOCKET_Condition()
{
	C_Beklauen (80, 150);
};
 
FUNC VOID DIA_Matteo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Matteo_PICKPOCKET);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_BACK 		,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
	
func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Matteo_Hallo(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_Hallo_Condition;
	information	= DIA_MAtteo_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Matteo_Hallo_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //Чем могу помочь?
};

// ************************************************************
// 			  				   Sell What 
// ************************************************************
INSTANCE DIA_Matteo_SellWhat(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_SellWhat_Condition;
	information	= DIA_MAtteo_SellWhat_Info;
	permanent	= FALSE;
	description = "Что ты продаешь?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //Что ты продаешь?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Я могу предложить все, что может понадобиться в твоих странствиях. Оружие, факелы, провизию... даже доспехи.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //У меня есть очень хороший экземпляр на складе.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Двойные усиленные доспехи из кожи снеппера - совсем новые. Тебе это интересно?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Лавка Маттео находится у южных ворот города. Он продает снаряжение, оружие и другие товары.");
		Knows_Matteo = TRUE;
	};
};

// *********************************************************
// 		  					TRADE 				
// *********************************************************
INSTANCE DIA_Matteo_TRADE (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 800;
	condition	= DIA_Matteo_TRADE_Condition;
	information	= DIA_Matteo_TRADE_Info;
	permanent	= TRUE;
	description = "Покажи мне свои товары.";
	Trade		= TRUE;
};                       
FUNC INT DIA_Matteo_TRADE_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};	
};

var int Matteo_TradeNewsPermanent;

FUNC VOID DIA_Matteo_TRADE_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Покажи мне свои товары.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //С тех пор, как наемники прикончили Лотара, инспекции паладинов стали значительно боле строгими.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //Я надеюсь, все успокоится, когда этого убийцу повесят.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Похоже, паладины действительно серьезно настроены на этот раз. Они даже сократили охрану на своем корабле.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //Это хорошо, что ты опять пополняешь свои запасы, кто знает, будет ли еще существовать этот город на следующей неделе.
	
		Matteo_TradeNewsPermanent = 2;
	};
};

// *********************************************************
// 		  					ARMOR 				
// *********************************************************

//-------------------------------------
	var int Matteo_LeatherBought;
//-------------------------------------

instance DIA_Matteo_LEATHER		(C_INFO)
{
	npc			 = 	VLK_416_Matteo;
	nr			 =  850;
	condition	 = 	DIA_Matteo_LEATHER_Condition;
	information	 = 	DIA_Matteo_LEATHER_Info;
	permanent	 = 	TRUE;
	description	 = 	"Купить кожаные доспехи. Защита: оружие 25, стрелы 20. (250 золота)";
};

func int DIA_Matteo_LEATHER_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	&& (Matteo_LeatherBought == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Matteo_LEATHER_Info ()
{
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //Хорошо, давай мне эти доспехи.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //Они тебе понравятся. (ухмыляется)

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //Эти доспехи стоят недешево - но они, определенно, стоят своих денег. Так что возвращайся, когда у тебя будет достаточно золота.
	};
};

// ************************************************************
// 			  				Paladine 			E1
// ************************************************************
INSTANCE DIA_Matteo_Paladine(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Paladine_Condition;
	information	= DIA_MAtteo_Paladine_Info;
	permanent	= FALSE;
	description = "Что ты знаешь о паладинах?";
};                       
FUNC INT DIA_Matteo_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Matteo_Paladine_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //Что ты знаешь о паладинах?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //С тех пор, как эти ублюдки прибыли в город, у меня от них одни проблемы.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //Последний раз, когда я шел в верхний квартал, стражники преградили мне дорогу и начали выяснять, что мне там нужно!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //И?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Конечно же, они пропустили меня!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //Да у меня уже была лавка в этом городе, когда эти напыщенные болваны еще пешком под стол ходили!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //А вчера эти ублюдки пришли и конфисковали половину моих товаров!
};

// ************************************************************
// 			  				Confiscated 			E2
// ************************************************************
INSTANCE DIA_Matteo_Confiscated(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Confiscated_Condition;
	information	= DIA_MAtteo_Confiscated_Info;
	permanent	= FALSE;
	description = "Паладины забрали твои товары?";
};                       
FUNC INT DIA_Matteo_Confiscated_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Confiscated_Info()
{	

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //Паладины забрали твои товары?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //Все, что у меня хранилось на заднем дворе.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //Они просто поставили стражника перед входом во двор.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //Мне еще повезло, что они не забрали все. Хотя бы доспехи оставили.
};

// ************************************************************
// 			  				HelpMeToOV 			E2
// ************************************************************
INSTANCE DIA_Matteo_HelpMeToOV(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeToOV_Condition;
	information	= DIA_MAtteo_HelpMeToOV_Info;
	permanent	= FALSE;
	description = "Ты можешь помочь мне попасть в верхний квартал?";
};                       
FUNC INT DIA_Matteo_HelpMeToOV_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeToOV_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //Ты можешь помочь мне попасть в верхний квартал?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //(ошеломленно) Что? А что тебе нужно ТАМ?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //У меня важное сообщение...
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //Так-так... А ты пытался пойти мимо стражников?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //(горький смех) Ох, забудь об этом!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //(смеется) Это так ТИПИЧНО для этих нищих!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //Я не понимаю, зачем мне даже пытаться.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //Возможно, ты прав.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //Я не знаю НАСКОЛЬКО важное у тебя сообщение - это меня не касается.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Но даже если ты скажешь им, что корабль, набитый орками, пришвартовался в гавани, они не пустят тебя.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Потому что у них есть ПРИКАЗ.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Похоже, это очень важно для тебя.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //(лукаво) Вопрос в том: НАСКОЛЬКО это важно для тебя?
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //На что ты намекаешь?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Я могу помочь тебе - я ведь, все же, один из самых влиятельных людей здесь.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Но это тебе обойдется в некоторую сумму.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "Так ты можешь помочь мне попасть в верхний квартал?";
};                       
FUNC INT DIA_Matteo_HelpMeNow_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeToOV))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeNow_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //Так ты можешь помочь мне попасть в верхний квартал?
	B_Matteo_Preis();
};

// ************************************************************
// 			  		LEHRLING als GILDE X
// ************************************************************
INSTANCE DIA_Matteo_LehrlingLater(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_LehrlingLater_Condition;
	information	= DIA_MAtteo_LehrlingLater_Info;
	permanent	= FALSE;
	description = "Помоги мне стать учеником одного из мастеров.";
};                       
FUNC INT DIA_Matteo_LehrlingLater_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func VOID DIA_Matteo_LehrlingLater_Info()
{	
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Помоги мне стать учеником одного из мастеров.
	B_Matteo_Preis();
};
	
// ************************************************************
// 			  		PriceOfHelp  (MISSION)			E4
// ************************************************************
INSTANCE DIA_Matteo_PriceOfHelp(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_PriceOfHelp_Condition;
	information	= DIA_MAtteo_PriceOfHelp_Info;
	permanent	= FALSE;
	description = "Что ты хочешь за свои услуги?";
};                       
FUNC INT DIA_Matteo_PriceOfHelp_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_PriceOfHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //Что ты хочешь за свои услуги?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 золотых монет.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Это все чертовски...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Ах ты, шельмец!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //Воспринимай это проще! Это не ТВОЕ золото я имею в виду.
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //А чье?
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //В принципе, это МОЕ золото.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Гритта, племянница плотника, уже давно не отдает мне долг.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //Но эта маленькая вертихвостка постоянно дефилирует в новых платьях - это означает, что деньги у нее есть.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //Я хочу, чтобы ты выбил из нее этот долг. Но мастер Торбен - плотник - тоже очень влиятельный человек.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Принеси мне эти деньги, и я помогу тебе.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Племянница плотника Торбена Гритта должна Маттео 100 золотых монет. Если я верну их ему, он поможет мне попасть в верхний квартал.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //Ах ты, шельмец!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //Это все чертовски...
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

// ************************************************************
// 			  				WoGritta 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoGritta(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_WoGritta_Condition;
	information	= DIA_MAtteo_WoGritta_Info;
	permanent	= FALSE;
	description = "Где мне найти эту Гритту?";
};                       
FUNC INT DIA_Matteo_WoGritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (Gritta.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoGritta_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //Где мне найти эту Гритту?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Как я уже говорил - она племянница плотника - его дом находится ниже про улице, справа от кузницы.
};

// ************************************************************
// 			  				GoldRunning 			E5
// ************************************************************
INSTANCE DIA_Matteo_GoldRunning(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 500;
	condition	= DIA_Matteo_GoldRunning_Condition;
	information	= DIA_MAtteo_GoldRunning_Info;
	permanent	= TRUE;
	description = "Вот твои 100 золотых!";
};                       
FUNC INT DIA_Matteo_GoldRunning_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& ( Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_GoldRunning_Info()
{	
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //Вот твои 100 золотых!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //На этом золоте кровь Гритты! Я не говорил, что нужно убивать ее!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //Я не хочу иметь никакого отношения к этому делу. Ты можешь забыть о нашей сделке! Не хочу даже вспоминать об этом!
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos	(self);
		return;
	};
	
	// FUNC

	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		if (Npc_HasItems(Gritta, itmi_gold) < 100)
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //И? Были какие-нибудь проблемы?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Ничего такого, о чем стоило бы говорить.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //Хорошо! Ты выполнил свою часть сделки.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //Ты хочешь заплатить за нее? Хм - я бы предпочел, чтобы ты выколотил эти деньги из нее!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Но все же - 100 золотых есть 100 золотых.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Ты выполнил свою часть сделки.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //У тебя проблемы со счетом? Я не вижу 100 золотых монет.
	};
};

// ************************************************************
// 		  				Stimme abgeben		E5 - PERM
// ************************************************************

instance DIA_Matteo_Zustimmung(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_Zustimmung_Condition;
	information	= DIA_MAtteo_Zustimmung_Info;
	permanent	= TRUE;
	description = "Помоги мне стать учеником одного из мастеров!";
};          
var int   DIA_Matteo_Zustimmung_perm;          
FUNC INT DIA_Matteo_Zustimmung_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& ( (MIS_Matteo_Gold == LOG_RUNNING) || (MIS_Matteo_Gold == LOG_SUCCESS) )
	&& (Player_IsApprentice == APP_NONE)
	&& (DIA_Matteo_Zustimmung_perm == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Zustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //Помоги мне стать учеником одного из мастеров!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //Не волнуйся, я выполню свои обещания.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //Другие мастера услышат от меня о тебе только хорошее.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Маттео даст мне свое одобрение, если я захочу стать учеником другого мастера.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Всему своя очередь. Сначала выполни свою часть сделки и принеси мне золото!
	};
};

// ************************************************************
// 			  				HowCanYouHelp 			E4
// ************************************************************
INSTANCE DIA_Matteo_HowCanYouHelp (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_HowCanYouHelp_Condition;
	information	= DIA_MAtteo_HowCanYouHelp_Info;
	permanent	= FALSE;
	description = "Как ИМЕННО ты собираешься помочь мне?";
};                       
FUNC INT DIA_Matteo_HowCanYouHelp_Condition()
{	
	if ((Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater)))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HowCanYouHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //Как ИМЕННО ты собираешься помочь мне?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //Это просто. Я использую свое влияние, чтобы убедить других здешних мастеров взять тебя в ученики.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //Став учеником, ты автоматически станешь и гражданином города и сможешь попасть в верхний квартал. Помимо этого, ты сможешь что-нибудь заработать.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Маттео может помочь мне стать учеником одного из мастеровых.");
};	

// ************************************************************
// 			  				WoAlsLehrling 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoAlsLehrling (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_WoAlsLehrling_Condition;
	information	= DIA_MAtteo_WoAlsLehrling_Info;
	permanent	= FALSE;
	description = "А к кому я могу поступить в ученики?";
};                       
FUNC INT DIA_Matteo_WoAlsLehrling_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoAlsLehrling_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //А к кому я могу поступить в ученики?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //К любому мастеру на этой улице.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //Это может быть кузнец Гарад, мастер-лучник Боспер, плотник Торбен или алхимик  Константино.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Один из них обязательно возьмет тебя.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Но важно, чтобы с этим были согласны другие мастера. Таков обычай Хориниса.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Я могу стать учеником мастера-лучника Боспера, кузнеца Гарада, плотника Торбена или алхимика Константино.");
	B_LogEntry (Topic_Lehrling,"Прежде чем я стану учеником, я должен получить одобрение других мастеров.");
};
// ************************************************************
// 			  				WieZustimmung 			E6
// ************************************************************
INSTANCE DIA_Matteo_WieZustimmung (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 5;
	condition	= DIA_Matteo_WieZustimmung_Condition;
	information	= DIA_MAtteo_WieZustimmung_Info;
	permanent	= FALSE;
	description = "Как мне получить одобрение других мастеров?";
};                       
FUNC INT DIA_Matteo_WieZustimmung_Condition()
{	
	if ( Npc_KnowsInfo (other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo (other,DIA_Matteo_WarumNichtBeiDir) )
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WieZustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //Как мне получить одобрение других мастеров?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //Ты просто должен убедить их. Иди и поговори с ними.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Но если хотя бы двое из них будут против тебя, тебе не поступить в ученики! Так что постарайся понравиться им!
	
	B_LogEntry (Topic_Lehrling,"Я смогу получить одобрение мастеров, только если я проявлю себя с лучшей стороны перед ними.");
};	

// ************************************************************
// 			  				WarumNichtBeiDir 			E5
// ************************************************************
INSTANCE DIA_Matteo_WarumNichtBeiDir (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_WarumNichtBeiDir_Condition;
	information	= DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent	= FALSE;
	description = "А почему ТЫ не возьмешь меня в ученики?";
};                       
FUNC INT DIA_Matteo_WarumNichtBeiDir_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WarumNichtBeiDir_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //А почему ТЫ не возьмешь меня в ученики?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //Я бы взял - но другие мастера не согласятся.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //Я только недавно взял еще одного ученика.
};	

// ************************************************************
// 			  				Andere Mцglichkeie 			E5
// ************************************************************
INSTANCE DIA_Matteo_OtherWay (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_OtherWay_Condition;
	information	= DIA_MAtteo_OtherWay_Info;
	permanent	= FALSE;
	description = "А есть другой способ попасть в верхний квартал?";
};                       
FUNC INT DIA_Matteo_OtherWay_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_OtherWay_Info()
{	
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //А есть другой способ попасть в верхний квартал?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Возможно... если я что-нибудь придумаю, я дам тебе знать.
};	

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Matteo_Minenanteil (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_Minenanteil_Condition;
	information	= DIA_MAtteo_Minenanteil_Info;

	description = "У тебя среди других товаров есть и акции горнодобывающей компании.";
};   
                    
FUNC INT DIA_Matteo_Minenanteil_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Matteo_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Я вижу, у тебя среди других товаров есть и акции горнодобывающей компании. Кто продал их тебе?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //(нервно) Акции? Ох. И откуда они взялись? Понятия не имею, где я взял их. Клянусь, ваша честь.
	B_GivePlayerXP (XP_Ambient);
};	





































