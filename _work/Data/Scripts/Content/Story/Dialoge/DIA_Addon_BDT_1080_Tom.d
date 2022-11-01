//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_EXIT   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 999;
	condition   = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tom_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Tom_PICKPOCKET (C_INFO)
{
	npc			= BDT_1080_Addon_Tom;
	nr			= 900;
	condition	= DIA_Addon_Tom_PICKPOCKET_Condition;
	information	= DIA_Addon_Tom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Tom_PICKPOCKET_Condition()
{
	C_Beklauen (40, 52);
};
 
FUNC VOID DIA_Addon_Tom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
	
func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_HI   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 1;
	condition   = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent   = FALSE;
	description = "Почему ты торчишь здесь?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //Почему ты торчишь здесь?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //У меня проблемы. В данный момент мне лучше не показываться в лагере.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //Что не так?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //У меня были хорошие отношения с пиратами, понимаешь?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Я всегда встречал ребят возле лагеря и торговал с ними.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //Я отоварил половину лагеря! 'Том, принеси мне то, Том, принеси мне это'.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //А потом вмешался этот ублюдок Эстебан.
};
//---------------------------------------------------------------------
//	Info Juan
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Juan   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 2;
	condition   = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent   = FALSE;
	description = "Что произошло?";
};
FUNC INT DIA_Addon_Tom_Juan_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Juan_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Juan_15_00"); //Что случилось?
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Эстебан послал одного из своих ребят - Хуана. Этот мерзавец устроил нам засаду.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //Я как раз собирался заключить сделку с пиратами, когда он выскочил из темноты и сбил меня с ног двумя ударами!
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //Этот парень очень быстр! Но недостаточно быстр. Мне удалось убежать от него.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Хэнка и Ангуса подстерег и убил Хуан.");
};

//---------------------------------------------------------------------
//	Info Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Esteban   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 3;
	condition   = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent   = FALSE;
	description = "И с тех пор ты сидишь здесь?";
};
FUNC INT DIA_Addon_Tom_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_Juan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Esteban_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //И с тех пор ты сидишь здесь?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Сначала я зашел в лагерь и сказал Фиску, Хуно и другим, что они могут забыть про свои заказы.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //И что виноват Эстебан.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //И если Эстебан узнает, что это я сказал всем, что ОН виноват, я могу прощаться с жизнью.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_04"); //Поэтому я и не могу вернуться в лагерь.
	
	Tom_tells = TRUE;
};

//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Dead   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 4;
	condition   = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent   = FALSE;
	description = "Эстебан мертв.";
};
FUNC INT DIA_Addon_Tom_Dead_Condition()
{	
	if (Npc_IsDead (Esteban))
	&& (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Dead_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Эстебан мертв.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //Правда? Приятель, вот это УДАЧА!
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //Кто сделал это?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //(игриво) Ну, скажем, некто, кого ты знаешь...
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Спасибо, что пришел ко мне. Теперь я могу вернуться в лагерь...
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"LAGER");
};

//---------------------------------------------------------------------
// PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_PERM   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 5;
	condition   = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent   = TRUE;
	description = "Что еще?";
};
FUNC INT DIA_Addon_Tom_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_PERM_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //Что еще?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Теперь я могу спокойно пить варево Люсии.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //Теперь я, наконец, могу показаться в лагере!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //А иначе бы я сидел тут и считал камни...
		};
	};
};




