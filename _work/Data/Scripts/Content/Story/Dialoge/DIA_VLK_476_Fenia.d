///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fenia_EXIT   (C_INFO)
{
	npc         = VLK_476_Fenia;
	nr          = 999;
	condition   = DIA_Fenia_EXIT_Condition;
	information = DIA_Fenia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fenia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fenia_EXIT_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Fenia_EXIT_17_00"); //Приветствую, мистер Паладин.
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Fenia_EXIT_17_01"); //Удачной тебе дороги, о, достопочтенный маг.
	};
	
	AI_StopProcessInfos (self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fenia_PICKPOCKET (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 900;
	condition	= DIA_Fenia_PICKPOCKET_Condition;
	information	= DIA_Fenia_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Fenia_PICKPOCKET_Condition()
{
	C_Beklauen (50, 75);
};
 
FUNC VOID DIA_Fenia_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fenia_PICKPOCKET);
	Info_AddChoice		(DIA_Fenia_PICKPOCKET, DIALOG_BACK 		,DIA_Fenia_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fenia_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fenia_PICKPOCKET_DoIt);
};

func void DIA_Fenia_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fenia_PICKPOCKET);
};
	
func void DIA_Fenia_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fenia_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fenia_Hallo   (C_INFO)
{
	npc         = VLK_476_Fenia;
	nr          = 3;
	condition   = DIA_Fenia_Hallo_Condition;
	information = DIA_Fenia_Hallo_Info;
	important	 = 	TRUE;
};

FUNC INT DIA_Fenia_Hallo_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Fenia_Hallo_Info()
{
		if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Fenia_Hallo_17_00"); //Ты выглядишь уставшим. Давно не спал, да?
			AI_Output			(other, self, "DIA_Fenia_Hallo_15_01"); //Слишком давно, я бы сказал.
		};
	AI_Output			(self, other, "DIA_Fenia_Hallo_17_02"); //Подойди поближе, не робей. У меня ты найдешь все, что тебе нужно!
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Феня торгует едой по пути в гавань.");
};


///////////////////////////////////////////////////////////////////////
//	Info Handeln
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_HANDELN		(C_INFO)
{
	npc			 = 	VLK_476_Fenia;
	nr			 = 	10;
	condition	 = 	DIA_Fenia_HANDELN_Condition;
	information	 = 	DIA_Fenia_HANDELN_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Покажи мне свои товары.";
};

func int DIA_Fenia_HANDELN_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Fenia_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fenia_HANDELN_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Fenia_HANDELN_15_00"); //Покажи мне свои товары.
};

///////////////////////////////////////////////////////////////////////
//	Info Infos
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Infos		(C_INFO)
{
	npc			 = 	VLK_476_Fenia;
	nr			 = 	10;
	condition	 = 	DIA_Fenia_Infos_Condition;
	information	 = 	DIA_Fenia_Infos_Info;
	permanent 	 =  FALSE;
	description	 = 	"Ты сказала, у тебя есть все, что мне нужно. Это включает информацию?";
};

func int DIA_Fenia_Infos_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Fenia_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fenia_Infos_Info ()
{
	AI_Output			(other, self, "DIA_Fenia_Infos_15_00"); //Ты сказала, у тебя есть все, что мне нужно. Это включает информацию?
	AI_Output			(self, other, "DIA_Fenia_Infos_17_01"); //Конечно. Что ты хочешь узнать?
};

///////////////////////////////////////////////////////////////////////
//	MoreTraders
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_MoreTraders (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 11;
	condition	= DIA_Fenia_MoreTraders_Condition;
	information	= DIA_Fenia_MoreTraders_Info;
	permanent 	= FALSE;
	description	= "Есть здесь, в порту, другие торговцы?";
};

func int DIA_Fenia_MoreTraders_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};
func void DIA_Fenia_MoreTraders_Info ()
{
	AI_Output			(other, self, "DIA_Fenia_Infos_haendler_15_00"); //Есть здесь, в порту, другие торговцы?
	AI_Output			(self, other, "DIA_Fenia_Infos_haendler_17_01"); //Если ты пойдешь налево вдоль причала, то увидишь Халвора, моего мужа. Он торгует рыбой.
	AI_Output			(self, other, "DIA_Fenia_Infos_haendler_17_02"); //А если пойдешь в другую сторону, там живет Ибрагим, картограф.
};

///////////////////////////////////////////////////////////////////////
//	OV
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_OV (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 13;
	condition	= DIA_Fenia_OV_Condition;
	information	= DIA_Fenia_OV_Info;
	permanent 	= FALSE;
	description	= "Ты знаешь кого-нибудь из верхнего квартала?";
};

func int DIA_Fenia_OV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Fenia_OV_Info ()
{
	AI_Output			(other, self, "DIA_Fenia_Infos_oberesViertel_15_00"); //Ты знаешь кого-нибудь из верхнего квартала?
	AI_Output			(self, other, "DIA_Fenia_Infos_oberesViertel_17_01"); //(смеется) Если бы я кого-нибудь там знала, я бы здесь не стояла, малыш.
};

///////////////////////////////////////////////////////////////////////
//	Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Interesting (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 14;
	condition	= DIA_Fenia_Interesting_Condition;
	information	= DIA_Fenia_Interesting_Info;
	permanent 	= FALSE;
	description	= "На что интересное стоит обратить внимание в порту?";
};

func int DIA_Fenia_Interesting_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};
func void DIA_Fenia_Interesting_Info ()
{
	AI_Output (other, self, "DIA_Fenia_Infos_interessantes_15_00"); //На что интересное стоит обратить внимание в порту?
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_01"); //Ну... Если ты ищешь приключений, иди в кабак Кардифа у причала. Там всегда что-нибудь затевается.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_02"); //Ты вряд ли пропустишь его. Парень, стоящий перед входом туда, обязательно привлечет твое внимание к нему.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_03"); //Кроме того, в порту стоит большой корабль паладинов. Королевская военная галера. На это действительно стоит посмотреть.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_04"); //Ты увидишь ее, если пойдешь влево вдоль причала, а затем пройдешь под большой скалой.
};

///////////////////////////////////////////////////////////////////////
//	Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Aufregend (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 15;
	condition	= DIA_Fenia_Aufregend_Condition;
	information	= DIA_Fenia_Aufregend_Info;
	permanent 	= FALSE;
	description	= "Ничего интересного не было?";
};

func int DIA_Fenia_Aufregend_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};
func void DIA_Fenia_Aufregend_Info ()
{
	AI_Output (other, self, "DIA_Fenia_Add_15_00"); //Ничего интересного не было?
	AI_Output (self, other, "DIA_Fenia_Add_17_01"); //Было. И совсем недавно.
	AI_Output (self, other, "DIA_Fenia_Add_17_02"); //Здесь пробежал вор. Он, похоже, украл лук где-то в нижней части города.
	AI_Output (self, other, "DIA_Fenia_Add_17_03"); //Конечно, как всегда ополчение прибыло слишком поздно.
	AI_Output (self, other, "DIA_Fenia_Add_17_04"); //Ему удалось сбежать от них - он прыгнул в море и был таков.
};






