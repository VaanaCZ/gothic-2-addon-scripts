///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cronos_EXIT   (C_INFO)
{
	npc         = KDW_1401_Addon_Cronos_NW;
	nr          = 999;
	condition   = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Hallo		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Hallo_Condition;
	information	 = 	DIA_Addon_Cronos_Hallo_Info;

	description	 = 	"Я могу тебя побеспокоить?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Я могу тебя побеспокоить?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(удивлено) Это ТЫ? Не думал, что мне еще когда-нибудь доведется увидеть твое лицо.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Ты храбрец, если решил здесь показаться. Некоторое время назад мы были готовы заживо содрать с  тебя кожу.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //К счастью для тебя, с того времени прошло уже несколько недель, так что мы немного успокоились.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WasMachstdu		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_WasMachstdu_Condition;
	information	 = 	DIA_Addon_Cronos_WasMachstdu_Info;

	description	 = 	"Что ты делаешь здесь?";
};

func int DIA_Addon_Cronos_WasMachstdu_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_WasMachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Что ты здесь делаешь?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //Моя задача - выяснить как можно больше об охранниках храма.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Непростая задача, скажу я тебе. Свойства этих каменных стражей мне совершенно незнакомы.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Они могут стоять, совершенно не подавая признаков жизни, а через секунду уже нападать на тебя, как одержимые.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Я еще не определил силу, которая приводит их в движение, но в одном у меня сомнений нет: природа этой силы магическая.
};
///////////////////////////////////////////////////////////////////////
//	Info Waechter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Waechter		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Waechter_Condition;
	information	 = 	DIA_Addon_Cronos_Waechter_Info;

	description	 = 	"Расскажи мне о каменных стражах.";
};

func int DIA_Addon_Cronos_Waechter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_Waechter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Расскажи мне о каменных стражах.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //Многого я сказать пока не могу. К сожалению, нам пришлось их уничтожить. Теперь они не опасны.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Когда мы только пришли сюда, они напали на нас.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Лишь объединенными силами нам удалось их победить. Боюсь, за порталом нас ждут новые стражи.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Должен быть способ закрыть источник их силы, чтобы они оставались лишь безжизненными статуями.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_NW_Trade		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_NW_Trade_Condition;
	information	 = 	DIA_Addon_Cronos_NW_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Ты можешь продать мне какие-нибудь припасы?";
};

func int DIA_Addon_Cronos_NW_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Ты можешь продать мне какие-нибудь припасы?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Почему бы и нет? Если я правильно помню, мы с тобой уже вели дела.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Итак, что тебе нужно?

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
