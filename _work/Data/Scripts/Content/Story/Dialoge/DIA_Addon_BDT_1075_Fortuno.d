///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_EXIT   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 999;
	condition   = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fortuno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1075_Addon_Fortuno;
	nr			= 900;
	condition	= DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information	= DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	C_Beklauen (10, 25);
};
 
FUNC VOID DIA_Addon_Fortuno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
	
func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Hi   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent   = TRUE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fortuno_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Fortuno_Geheilt_01 == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_Info()
{
	if (Fortuno_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_00");//(тревожно) Темное облако накрыло дом... ОН приближается...
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//С кровью... которая нужна, чтобы позвать его... ОН, кто видит меня... он видит меня... О, нет, уйди, уйди прочь...
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//С тобой все в порядке?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"Фортуно сошел с ума. Ему нужен 'зеленый послушник'.");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//Зеленый... зеленый послушник... Я не могу найти...
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Я вернусь позже... (КОНЕЦ)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Я могу тебе помочь?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Вот возьми эту болотную траву.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if Npc_HasItems (other, ItMi_Addon_Joint_01 ) >= 1
	{ 
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Вот, возьми этот 'Зеленый послушник'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//Я могу тебе помочь?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//Зеленый... зеленый послушник поможет послушнику...
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//Вот возьми эту болотную траву.
	
	if B_GiveInvItems (other, self,ItMi_Joint,1)
	{
		AI_UseItem (self, ItMI_Joint);
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01");//Не зеленый, не сильный, не зеленый, не сильный...
};
FUNC VOID DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00");//Вот, возьми этот 'Зеленый послушник'.
	
	if B_GiveInvItems (other, self,ItMi_Addon_Joint_01,1)
	{
		AI_UseItem (self, ItMI_Addon_Joint_01);
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01");//(приходя в себя) А-А-А-Х...
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//Моя голова... кто... я... Фортуно... Что случилось?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"'Зеленый послушник' помог Фортуно придти в себя.");
};


///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_wer   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent   = FALSE;
	description	= "Да, скажи мне, что с тобой случилось.";
};
FUNC INT DIA_Addon_Fortuno_wer_Condition()
{	
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_wer_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//Да, скажи мне, что с тобой случилось.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//Когда-то я принадлежал к Братству Спящих. Тогда все было в порядке.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//Да, все мы - осужденные преступники, но для нас, послушников, жизнь была беззаботной...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//Эй, я тоже был заключенным в Долине Рудников. Расскажи что-нибудь новенькое.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//Я... я ничего не помню. Тьма покрывает мою память...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//Ну же, сосредоточься. Что случилось? Когда ты пришел в себя?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//Ворон... Я помню только Ворона и... и темные залы.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//Что сделал Ворон? Что он сделал с тобой?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//(вздыхает) Мне жаль. Чувство такое, будто мой разум сам заключен в тюрьму. Я и сам этого не понимаю...
};
///////////////////////////////////////////////////////////////////////
//	Info FREE
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_FREE   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 5;
	condition   = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent   = FALSE;
	description	= "Должен же быть способ вернуть тебе память.";
};
FUNC INT DIA_Addon_Fortuno_FREE_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_wer)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//Должен же быть способ вернуть тебе память.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//Да... да, наверное, это возможно.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//Гуру знают различные способы изменять дух и волю.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//А ТЫ что-нибудь помнишь про это?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//Нет, я боюсь, это знание исчезло вместе с гуру...
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//Проклятье. Ладно, если есть способ освободить твой разум, я найду его.

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"Разум Фортуно прояснился, но он все еще ничего не помнит.");
};
///////////////////////////////////////////////////////////////////////
//	Info Herb
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Herb   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 99;
	condition   = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent   = FALSE;
	description	= "Тебе нужна еще болотная трава?";
};
FUNC INT DIA_Addon_Fortuno_Herb_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//Тебе нужна еще болотная трава?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//Да-а-а, определенно. Я куплю всю траву, которую ты мне принесешь.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//Я даже заплачу за нее больше, чем Фиск.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(отдать всю болотную траву)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(отдать 1 болотную траву)",DIA_Addon_Fortuno_Trade_1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Trade (kein Trade Modul!)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trade   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 100;
	condition   = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent   = TRUE;
	description	= "У меня есть болотная трава для тебя...";
};
FUNC INT DIA_Addon_Fortuno_Trade_Condition()
{	
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	&& Npc_KnowsInfo (other, DIA_Addon_Fortuno_Herb)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trade_15_00");//У меня есть болотная трава для тебя...
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
};
FUNC VOID DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems (other, Itpl_Swampherb);
	
	if B_GiveInvItems (other, self, ITPL_Swampherb, amount)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, amount * Value_SwampHerb);
	
	B_GivePlayerXP (amount * 10);
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_1()
{
	if B_GiveInvItems (other, self, ITPL_Swampherb, 1)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, Value_SwampHerb);
	
	B_GivePlayerXP (10);
	B_Fortuno_InfoManager();
};

///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trank   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 3;
	condition   = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent   = FALSE;
	description	= "У меня есть зелье для тебя...";
};
FUNC INT DIA_Addon_Fortuno_Trank_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	&&   Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE)
	&& ((Npc_HasItems (other, ItPo_Addon_Geist_01) >= 1)
	||  (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//У меня есть зелье, которое поможет тебе вспомнить.
	AI_Output (self, other, "DIA_Addon_Fortuno_Trank_13_01");//Я верю тебе.
	
	if (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1)//der richtige
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_02,1)
		{
			AI_UseItem (self, ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP (XP_Addon_Fortuno_02);
		
	}
	else
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_01,1)//der...дh...tцdliche
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
			AI_StopProcessInfos (self);
			AI_UseItem (self, ItPo_Addon_Geist_01);
		};
	};
};
///////////////////////////////////////////////////////////////////////
//	Info No more Secrets
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_more   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent   = FALSE;
	description	= "И?..";
};
FUNC INT DIA_Addon_Fortuno_more_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_more_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_00");//И?..
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//Ах! Я... Я снова помню! Теперь я понимаю... О, Аданос, что же я наделал?
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//Да, что ты наделал? И самое главное - что наделал Ворон?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//Я помог ему... заключить контракт. С НИМ. Ему были нужны различные зелья... Я варил их для него.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//Он пытался открыть портал и попасть в храм.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//Зачем? Что ему нужно в храме?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//Мощный артефакт... Он погребен вместе с тем, кто создал его. Великий воин, павший перед ЕГО мощью...
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//А потом?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//Мы не смогли открыть портал...
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//Но Ворон был УВЕРЕН, что он сможет сделать это, если раскопает гробницу жреца.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//Вот зачем он привел сюда рабов. Тех, кого он может заставить откопать древние силы, покоящиеся здесь.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//Гробница жреца?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//Место упокоения жреца Аданоса. Она находится в шахте.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//Еще я помню каменные таблички. Он считал, что они укажут ему путь.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//И когда он сумел расшифровать то, что на них написано, я ему стал не нужен.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//Он использовал на мне заклинания забвения... а ты освободил меня.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Ворону нужен мощный артефакт из храма Аданоса."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Ворону зачем-то понадобилась гробница жреца древней религии, которую он раскопал в шахте."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Ворон считает, что для осуществления его планов ему необходимы каменные таблички."); 
	
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Addon_Fortuno_03);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fortuno_Attentat   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 9;
	condition   = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fortuno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&&  Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//Нападение? Прости, я... отсутствовал... некоторое время. Я ничего про это не знаю.
};

