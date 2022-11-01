///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Oric_EXIT   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 999;
	condition   = DIA_Oric_EXIT_Condition;
	information = DIA_Oric_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Oric_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_HALLO		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_HALLO_Condition;
	information	 = 	DIA_Oric_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"Каковы твои обязанности?";
};

func int DIA_Oric_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Oric_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Oric_HALLO_15_00"); //Каковы твои обязанности?
	AI_Output (self, other, "DIA_Oric_HALLO_11_01"); //Я офицер-стратег короля, и в настоящее время подчиняюсь достопочтенному командующему Гаронду.
	AI_Output (self, other, "DIA_Oric_HALLO_11_02"); //Мы последние паладины, оставшиеся здесь, в замке. Все остальные ушли либо пали на поле боя.
	AI_Output (self, other, "DIA_Oric_HALLO_11_03"); //Это наш долг, чтобы эта экспедиция завершилась успешно. И мы добьемся этого. Клянусь Инносом - мы добьемся этого.

};

///////////////////////////////////////////////////////////////////////
//	Info Bruder
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Bruder		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_Bruder_Condition;
	information	 = 	DIA_Oric_Bruder_Info;
	permanent	 =  FALSE;
	description	 = 	"У меня есть известие для тебя.";
};

func int DIA_Oric_Bruder_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Jergan_Burg)
	&& Npc_KnowsInfo (other, DIA_Oric_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Oric_Bruder_Info ()
{
	AI_Output (other, self, "DIA_Oric_Bruder_15_00"); //У меня есть известие для тебя.
	AI_Output (self, other, "DIA_Oric_Bruder_11_01"); //Что за известие?
	AI_Output (other, self, "DIA_Oric_Bruder_15_02"); //Твой брат мертв. Он погиб у Прохода.
	AI_Output (self, other, "DIA_Oric_Bruder_11_03"); //(бормочет)... мой брат...
	AI_Output (self, other, "DIA_Oric_Bruder_11_04"); //Иннос подвергает меня суровым испытаниям. Но он погиб как его слуга...
	AI_Output (self, other, "DIA_Oric_Bruder_11_05"); //Эта новость - стрела, пронзившая мое сердце. Я буду искать новые силы в молитвах.
	OricBruder = TRUE;
	
	B_GivePlayerXP (XP_Ambient);
};

	
//*****************************************
//	Minen Auftrag
//*****************************************

INSTANCE DIA_Oric_ScoutMine   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 1;
	condition   = DIA_Oric_ScoutMine_Condition;
	information = DIA_Oric_ScoutMine_Info;
	permanent   = FALSE;
	description = "Я отправляюсь к шахтам.";
};

FUNC INT DIA_Oric_ScoutMine_Condition()
{
	if 	(MIS_ScoutMine == LOG_RUNNING)
	&&	(Kapitel < 3)
	&& 	(Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&&  (Fajeth_Ore == FALSE)
	&&  (Marcos_Ore == FALSE)
	&&  (Silvestro_Ore == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_ScoutMine_Info()
{
	AI_Output (other,self ,"DIA_Oric_ScoutMine_15_00"); //Я отправляюсь к шахтам.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_01"); //Будь острожен. Это нелегкая задача. Прежде всего, найди паладинов. Они возглавляют эти три группы.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_02"); //Если тебе нужно больше информации, поговори с Парсивалем.
};	
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Perm		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	99;
	condition	 = 	DIA_Oric_Perm_Condition;
	information	 = 	DIA_Oric_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"Как ситуация?";
};

func int DIA_Oric_Perm_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Oric_Perm_Info ()
{
	
	AI_Output (other, self, "DIA_Oric_Perm_15_00"); //Как обстановка?
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_01"); //Ты должен найти старателей и выяснить, сколько у них руды. А там будет видно, как и когда мы сможем покинуть эту долину.
	}
	else if (MIS_ScoutMine == LOG_SUCCESS)
 	{
		AI_Output (self, other, "DIA_Oric_Perm_11_02"); //Ситуация накалилась до предела. Но мы не отступим. Иннос всегда с нами. Он выведет нас из этой долины.
	}
	else //noch nicht angenommen
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_03"); //Твое появление здесь вселяет в нас надежду.
		AI_Output (self, other, "DIA_Oric_Perm_11_04"); //Ты нужен нам. Иди, поговори с Гарондом - он все объяснит тебе.
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Oric_KAP3_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP3_EXIT_Condition;
	information	= DIA_Oric_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Oric_KAP4_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP4_EXIT_Condition;
	information	= DIA_Oric_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*****************************************
//	Kann ich irgendwie helfen?
//*****************************************

INSTANCE DIA_Oric_IAmBack   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_IAmBack_Condition;
	information = DIA_Oric_IAmBack_Info;

	description = "Я уже вернулся.";
};

FUNC INT DIA_Oric_IAmBack_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_HALLO))
		{
				return TRUE;
		};
};

FUNC VOID DIA_Oric_IAmBack_Info()
{
	AI_Output (other,self ,"DIA_Oric_IAmBack_15_00"); //Я уже вернулся.
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_01"); //Я уже не надеялся, что мы еще когда-нибудь увидим тебя после того, что произошло, когда ты был здесь несколько дней назад.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_02"); //Я приветствую тебя от имени нашего ордена.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_03"); //Я виду, ты слал магом. Мое почтение.
	};
	
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_04"); //Возможно, твое появление - добрый знак.
};

//***********************************************
//	Kann ich helfen?
//***********************************************

INSTANCE DIA_Oric_CanHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_CanHelp_Condition;
	information = DIA_Oric_CanHelp_Info;

	description = "Могу я чем-нибудь помочь?";
};

FUNC INT DIA_Oric_CanHelp_Condition()
{
	if 	(Kapitel >= 4)
	&&	(Npc_KnowsInfo (other,DIA_Oric_IAmBack))
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_15_00"); //Могу я чем-нибудь помочь?
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_01"); //В настоящий момент, похоже, мы сделали все, что было возможно.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_02"); //Впрочем, есть кое-что. Кое-что очень важное, что ты мог бы сделать для нас за пределами этих стен.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_03"); //Мы планируем отрубить змею голову.
	
	Info_ClearChoices (DIA_Oric_CanHelp);
	Info_AddChoice (DIA_Oric_CanHelp,"Я думаю, тебе лучше поискать кого-нибудь еще. ",DIA_Oric_CanHelp_NotYourMan); 
	Info_AddChoice (DIA_Oric_CanHelp,"Что ты хочешь этим сказать?",DIA_Oric_CanHelp_WhatYouMean);

};

FUNC VOID DIA_Oric_CanHelp_NotYourMan ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_NotYourMan_15_00"); //Я думаю, тебе лучше поискать кого-нибудь еще.
	AI_Output (self ,other,"DIA_Oric_CanHelp_NotYourMan_11_01"); //Я не могу выделить ни одного человека - ты наша единственная надежда.
};

FUNC VOID DIA_Oric_CanHelp_WhatYouMean ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_00"); //Что ты хочешь сказать этим?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_01"); //Мы знаем одного из их предводителей. Его зовут Хош-Пак.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_02"); //Он один из самых влиятельных шаманов орков.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_03"); //А какова в этом моя роль?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_04"); //Убей его.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_05"); //Ты шутишь!?

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_06"); //Ты единственный, кого мы можем выделить для этого дела. Все остальные рыцари нужны здесь.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_07"); //Мне нелегко просить тебя об этом, мастер. Но ты как нельзя лучше подходишь для этого задания.
	}
	else
	{	
		AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_08"); //Ты ведь хочешь помочь нам, разве нет? Ну, тогда...
	};
	
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_09"); //Палатка Хош-Пака находится за осадным кругом, на утесе к югу отсюда.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_10"); //Ее даже видно из этих окон.
	

	Info_ClearChoices (DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};

//***********************************************
//	Ich brauche noch Ausrьstung.
//***********************************************

INSTANCE DIA_Oric_NeedStuff   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 6;
	condition   = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;

	description = "Мне нужно снаряжение.";
};

FUNC INT DIA_Oric_NeedStuff_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NeedStuff_Info()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_15_00"); //Мне нужно снаряжение.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_01"); //У нас мало что осталось, чем мы могли бы поделиться с тобой.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_02"); //Ну, я могу предложить тебе вот это.
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
	Info_AddChoice (DIA_Oric_NeedStuff,"или 1 эликсира ловкости",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice (DIA_Oric_NeedStuff,"или 1 эликсира силы",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice (DIA_Oric_NeedStuff,"или 3 эликсира маны",DIA_Oric_NeedStuff_Mana);	
	Info_AddChoice (DIA_Oric_NeedStuff,"3 лечебных эликсира",DIA_Oric_NeedStuff_Health); 
};

FUNC VOID DIA_Oric_NeedStuff_Health ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Health_15_00"); //Я возьму эти лечебные зелья.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Health_11_01"); //Хороший выбор. Надеюсь, они помогут тебе.
	
	CreateInvItems (self,ItPo_Health_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Mana ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Mana_15_00"); //Я возьму эти зелья маны.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Mana_11_01"); //Надеюсь, они помогут тебе. Да хранит тебя Иннос.
	
	CreateInvItems (self,ItPo_Mana_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Strength ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Strength_15_00"); //Я возьму эликсир силы.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Strength_11_01"); //Вот, он наверняка пригодится тебе. Я желаю тебе удачи.

	CreateInvItems (self,ItPo_Perm_STR,1);
	B_GiveInvItems (self ,other,ItPo_Perm_STR,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Dexterity ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Dexterity_15_00"); //Я возьму эликсир ловкости.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Dexterity_11_01"); //Пусть всегда твои стрелы летят точно в цель. Вот, держи.

	CreateInvItems (self,ItPo_Perm_DEX,1);
	B_GiveInvItems (self ,other,ItPo_Perm_DEX,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

//***********************************************
//	ich werde keinen feigen Mord begehen.
//***********************************************

INSTANCE DIA_Oric_NoMurder   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 7;
	condition   = DIA_Oric_NoMurder_Condition;
	information = DIA_Oric_NoMurder_Info;

	description = "Я не буду убивать Хош-Пака таким подлым образом.";
};

FUNC INT DIA_Oric_NoMurder_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NoMurder_Info()
{
	AI_Output (other,self ,"DIA_Oric_NoMurder_15_00"); //Я не буду убивать Хош-Пака таким подлым образом.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_01"); //Ты хотя бы представляешь себе, насколько тяжело наше положение?
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_02"); //Нас осаждают превосходящие силы орков. Наши запасы уже на исходе.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_03"); //Если мы не сможем доставить эту руду на корабль, орки превратят в руины все наше королевство.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_04"); //Все, ради чего мы живем, пойдет прахом.
};

//***********************************************
//	Ich werde dir helfen
//***********************************************

INSTANCE DIA_Oric_WillHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 5;
	condition   = DIA_Oric_WillHelp_Condition;
	information = DIA_Oric_WillHelp_Info;
	permanent   = FALSE;
	description = "Хорошо. Я убью Хош-Пака.";
};

FUNC INT DIA_Oric_WillHelp_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	MIS_KillHoshPak == FALSE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_WillHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_WillHelp_15_00"); //Хорошо. Я убью Хош-Пака.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_01"); //Я рад слышать это.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_02"); //Палатка Хош-Пака находится на небольшом утесе. Ты, должно быть, уже видел его раньше.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_03"); //Этот утес стоит неподалеку от дороги, ведущей к нашей шахте. В тени огромной горы.
	
	Log_CreateTopic (TOPIC_KillHoshPak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak, LOG_RUNNING);
	B_LogEntry (TOPIC_KillHoshPak,"Орик хочет, чтобы я убил шамана орков Хош-Пака. Его палатка находится на небольшом утесе недалеко от задней части замка."); 

	MIS_KillHoshPak = LOG_RUNNING;
};

//***********************************************
//	Hosh-Pak ist tot!
//***********************************************

INSTANCE DIA_Oric_HoshDead   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 8;
	condition   = DIA_Oric_HoshDead_Condition;
	information = DIA_Oric_HoshDead_Info;
	permanent   = FALSE;
	description = "Хош-Пак мертв!";
};

FUNC INT DIA_Oric_HoshDead_Condition()
{
	if 	(Npc_IsDead (Hosh_Pak))
	&& 	(MIS_KillHoshPak == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_HoshDead_Info()
{
	AI_Output (other,self ,"DIA_Oric_HoshDead_15_00"); //Хош-Пак мертв!
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_01"); //Отлично, это обязательно посеет хаос в рядах орков. Может быть, у нас все еще есть какие-то шансы.
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_02"); //Я думаю, это позволит нам получить передышку, по крайней мере, на неделю.
	
	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillHosh_Pak);
};



//***********************************************
//	Irgendwelche Neuigkeiten?
//***********************************************

INSTANCE DIA_Oric_AnyNews   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 9;
	condition   = DIA_Oric_AnyNews_Condition;
	information = DIA_Oric_AnyNews_Info;
	permanent	 = 	TRUE;

	description = "Есть новости?";
};

FUNC INT DIA_Oric_AnyNews_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_AnyNews_Info()
{

	AI_Output (other,self ,"DIA_Oric_AnyNews_15_00"); //Есть новости?
	
	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_01"); //Ты имеешь в виду, кроме того, что орки вторглись в замок?
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_02"); //Да. Ты наш герой. Уничтожить всех драконов разом - это воистину героический подвиг. Я потрясен!
	}
	else if (MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_03"); //Орки, похоже, выбиты из колеи смертью Хош-Пака.
	}
	else
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_04"); //Орков становится все больше и больше. Мне это не нравится.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_DragonPlettBericht		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	3;
	condition	 = 	DIA_Oric_DragonPlettBericht_Condition;
	information	 = 	DIA_Oric_DragonPlettBericht_Info;
	permanent	 = 	TRUE;
	description	 = 	"Мне нужна информация о драконах.";
};

func int DIA_Oric_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	&& (MIS_AllDragonsDead == FALSE)
	{
		return TRUE;
	};
};

var int Oric_SwampdragonInfo_OneTime;
var int Oric_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Oric_DragonCounter;
var int Oric_FirstQuestion;
func void DIA_Oric_DragonPlettBericht_Info ()
{
	AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_00"); //Мне нужна информация о драконах.
	
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_01"); //Я уже убил одного из них. Ты можешь сказать мне, где нужно искать других?
	}
	else if (MIS_KilledDragons != 0) 
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_02"); //У меня есть чувство, что я пока нашел не всех драконов. Может, я что-то упустил?
	};
	
	if ((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE))
	&& 	((Oric_SwampdragonInfo_OneTime == FALSE)
		||	(Oric_RockdragonInfo_OneTime == FALSE)
		||	(Oric_FiredragonInfo_OneTime == FALSE)
		||	(Oric_IcedragonInfo_OneTime == FALSE))
	{
		if ((Npc_IsDead(Swampdragon))== FALSE)
		&& (Oric_SwampdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_03"); //Несколько дней назад к западу от нашего замка появилось большое болото. Это довольно подозрительно, тебе так не кажется?
			B_LogEntry (TOPIC_DRACHENJAGD,"Орик дал мне повод к размышлению: За последние несколько дней к западу от замка образовалось большое болото. Он считает это очень подозрительным."); 
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(Rockdragon))==FALSE)
		&& (Oric_RockdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_04"); //На юге находится крепость в скалах, далеко за вулканом.
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_05"); //Наши разведчики докладывают, что эта крепость хорошо охраняется. Может быть, один из них скрывается там.
			B_LogEntry (TOPIC_DRACHENJAGD,"Разведчики паладинов сообщили Орику, что крепость в скалах за вулканом на юге хорошо охраняется. Орик подозревает, что дракон находится там."); 
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(FireDragon))==FALSE)
		&& (Oric_FiredragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_06"); //После прошлого нападения драконов, один из них, по слухам, полетел в направлении вулкана на юге. Тебе стоит поискать его там.
			B_LogEntry (TOPIC_DRACHENJAGD,"По-видимому, последнего дракона, нападавшего на замок в Долине рудников, видели неподалеку от вулкана."); 
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(IceDragon))==FALSE)
		&& (Oric_IcedragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_07"); //На западе находится обширная ледяная долина. Я не удивлюсь, если один из драконов скрывается там.
			B_LogEntry (TOPIC_DRACHENJAGD,"Согласно информации, полученной от Орика, заснеженный район на западе может быть логовом дракона."); 
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_08"); //В настоящий момент мне нечего сказать тебе.
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Oric_KAP5_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP5_EXIT_Condition;
	information	= DIA_Oric_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Oric_KAP6_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP6_EXIT_Condition;
	information	= DIA_Oric_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Oric_PICKPOCKET (C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 900;
	condition	= DIA_Oric_PICKPOCKET_Condition;
	information	= DIA_Oric_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Украсть этот свиток будет чертовски сложно)";
};                       

FUNC INT DIA_Oric_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (85 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Oric_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Oric_PICKPOCKET);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_BACK 		,DIA_Oric_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Oric_PICKPOCKET_DoIt);
};

func void DIA_Oric_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 85)
	{
		B_GiveInvItems (self, other, ITSc_PalRepelEvil, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Oric_PICKPOCKET);
	}
	else
	{	
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Oric_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Oric_PICKPOCKET);
};

