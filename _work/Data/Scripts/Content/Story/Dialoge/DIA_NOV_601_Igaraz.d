//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap1_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap1_EXIT_Condition;
	information = DIA_Igaraz_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Igaraz_Kap1_EXIT_Condition ()
{
	if (kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	ABSCHNITT 1  IM KLOSTER, SPIELER IST NOVIZE 
//**************************************************************************

//**************************************************************************
//	Info Hello
//**************************************************************************
INSTANCE DIA_Igaranz_Hello   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Hello_Condition;
	information = DIA_Igaraz_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Igaraz_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Hello_Info()
{
	if (other.guild == GIL_NOV)
	{
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_00"); //Что я могу сделать для тебя, брат?
	}
	else
	{
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_01"); //Что я могу сделать для тебя?
	};	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Igaraz_Wurst(C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr			= 2;
	condition	= DIA_Igaraz_Wurst_Condition;
	information	= DIA_Igaraz_Wurst_Info;
	permanent	= FALSE;
	description = "Я занимаюсь распределением колбасы.";
};                       

FUNC INT DIA_Igaraz_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Igaraz_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Igaraz_Wurst_15_00"); //Я раздаю колбасу.
	AI_Output (self, other, "DIA_Igaraz_Wurst_13_01"); //Ты работаешь на Горакса, да? Хорошо, тогда давай сюда эту колбасу.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
///////////////////////////////////////////////////////////////////////
//Wieso arbeitest Du nicht?
///////////////////////////////////////////////////////////////////////	
INSTANCE DIA_Igaranz_NotWork   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 3;
	condition   = DIA_Igaraz_NotWork_Condition;
	information = DIA_Igaraz_NotWork_Info;
	permanent   = FALSE;
	description	= "Почему ты не работаешь?";
};
FUNC INT DIA_Igaraz_NotWork_Condition()
{	
	if (Npc_GetDistToWP (self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild == GIL_NOV)
	{
			return TRUE;	
	};
};
FUNC VOID DIA_Igaraz_NotWork_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_NotWork_15_00"); //Почему ты не работаешь?
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_01"); //Мне позволено изучать учения Инноса. Я постигаю его мудрость.
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_02"); //Однажды он выберет меня - и тогда я пройду испытание магией и войду в Круг Огня.
};
///////////////////////////////////////////////////////////////////////
//Wer sind die Erwдhlten?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Igaranz_Choosen   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Choosen_Condition;
	information = DIA_Igaraz_Choosen_Info;
	permanent   = TRUE;
	description	= "Кто такие Избранные?";
};

FUNC INT DIA_Igaraz_Choosen_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_NotWork))
	&& (Npc_GetDistToWP (self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Choosen_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_15_00"); //Кто такие Избранные?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_01"); //Это послушники, которым Иннос предписал пройти испытание магией.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_02"); //Тот, кто проходит его, принимается в ряды Магов Огня.
	
	Info_ClearChoices (DIA_Igaranz_Choosen);
	Info_AddChoice 	(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Что такое Испытание Магией?",DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Как я могу стать Избранным?",DIA_Igaranz_Choosen_HowChoosen);
};	

FUNC VOID DIA_Igaranz_Choosen_back ()
{
	Info_ClearChoices (DIA_Igaranz_Choosen);
};

FUNC VOID DIA_Igaranz_Choosen_TestOfMagic ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_TestOfMagic_15_00"); //Что такое Испытание Магией?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01"); //Это испытание, которому Высший Совет подвергает всех избранных послушников.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02"); //Это задание, при выполнении которого проверяются вера и сообразительность послушника.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03"); //Все избранные послушники принимают в нем участие - но только один из них может успешно выполнить его.
};

FUNC VOID DIA_Igaranz_Choosen_HowChoosen ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_HowChoosen_15_00"); //Как я могу стать Избранным?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_HowChoosen_13_01"); //Ты не можешь влиять на это. Иннос самолично выбирает своих послушников, а Высший Совет объявляет его волю.
};
///////////////////////////////////////////////////////////////////////
//	Erzдhl mir was ьber Innos Lehren
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Igaranz_StudyInnos   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_StudyInnos_Condition;
	information = DIA_Igaraz_StudyInnos_Info;
	permanent   = FALSE;
	description	= "Как я могу начать изучать писания?";
};

FUNC INT DIA_Igaraz_StudyInnos_Condition()
{
	if Npc_KnowsInfo (other,DIA_Igaranz_NotWork)
	&& (Npc_GetDistToWP (self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (Parlan_Erlaubnis == FALSE)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_StudyInnos_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_StudyInnos_15_00"); //Как я могу начать изучать писания?
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_01"); //Ты должен получить доступ в библиотеку.
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_02"); //Однако мастер Парлан даст тебе ключ, только когда ты выполнишь все его задания.
};
//**************************************************************************
//	ABSCHNITT 2  DIE PRЬFUNG DER MAGIE 
//**************************************************************************
///////////////////////////////////////////////////////////////////////
//	Info CHOOSEN
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_IMTHEMAN		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	2;
	condition	 = 	DIA_Igaraz_IMTHEMAN_Condition;
	information	 = 	DIA_Igaraz_IMTHEMAN_Info;
	important	 = 	TRUE;
};
func int DIA_Igaraz_IMTHEMAN_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_05") <= 3500) 
	&& (Npc_IsInState 	(self, ZS_Talk))
	&& (other.guild == GIL_NOV) 
	{
		return TRUE;
	};
};
func void DIA_Igaraz_IMTHEMAN_Info ()
{
	AI_Output (self, other, "DIA_Igaraz_IMTHEMAN_13_00"); //(гордо) Это свершилось. Иннос выбрал меня я приму участие в испытании магией.
};
///////////////////////////////////////////////////////////////////////
//	Info METOO
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_METOO		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	19;
	condition	 = 	DIA_Igaraz_METOO_Condition;
	information	 = 	DIA_Igaraz_METOO_Info;
	permanent	 =  FALSE;
	description	 = 	"Я тоже ...";
};
var int DIA_Igaraz_METOO_NOPERM ;

func int DIA_Igaraz_METOO_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_05") <= 3500)
	//&&  Npc_KnowsInfo (hero,DIA_Igaraz_IMTHEMAN)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Igaraz_METOO_Info ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_15_00"); //Я тоже - я потребовал прохождения Испытания Огнем.
	AI_Output (self, other, "DIA_Igaraz_METOO_13_01"); //ЧТО ты потребовал? Ты либо любимчик Инноса, либо сумасшедший.
	AI_Output (other, self, "DIA_Igaraz_METOO_15_02"); //Мне уже удалось много безумных вещей, и, возможно, удастся и это тоже...
	AI_Output (self, other, "DIA_Igaraz_METOO_13_03"); //Иннос поддерживает меня - и я пройду это испытание!
	

	Info_ClearChoices	 (DIA_Igaraz_METOO);
	Info_AddChoice 		 (DIA_Igaraz_METOO,DIALOG_BACK,DIA_Igaraz_METOO_BACK);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Может, нам лучше действовать вместе...",DIA_Igaraz_METOO_HELP);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"И как, еще ничего не нашел?",DIA_Igaraz_METOO_TELL);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Ты не видел Агона или Ульфа?",DIA_Igaraz_METOO_AGON);
};
FUNC VOID DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices	 (DIA_Igaraz_METOO);
};
FUNC VOID DIA_Igaraz_METOO_TELL ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_TELL_15_00"); //И как, еще ничего не нашел?
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_01"); //Так как у тебя все равно никаких шансов, я, пожалуй, скажу тебе:
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_02"); //Даже не пытайся искать около ферм - ты там ничего не найдешь.
};
FUNC VOID DIA_Igaraz_METOO_HELP ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_HELP_15_00"); //Может, нам лучше действовать вместе...
	AI_Output (self, other, "DIA_Igaraz_METOO_HELP_13_01"); //Забудь об этом. Я выполню это задание один. Ты мне будешь только обузой.
};
FUNC VOID DIA_Igaraz_METOO_AGON ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_AGON_15_00"); //Ты не видел Агона или Ульфа?
	AI_Output (self, other, "DIA_Igaraz_METOO_AGON_13_01"); //Мы разделились у таверны. Я пошел к фермам, а эти двое пошли вместе - но куда, я не знаю.
};
///////////////////////////////////////////////////////////////////////
//	Info ADD
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_ADD		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	23;
	condition	 = 	DIA_Igaraz_ADD_Condition;
	information	 = 	DIA_Igaraz_ADD_Info;
	permanent	 =  FALSE;
	description	 = 	"Ты знаешь что-нибудь о 'живой скале'?";
};
func int DIA_Igaraz_ADD_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_05") <= 3500) 
	&& (MIS_GOLEM == LOG_RUNNING) 
	&& (Npc_IsDead (Magic_Golem) == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Igaraz_Stein) == FALSE)
	&& Npc_KnowsInfo (other,DIA_Igaraz_METOO)
	{
		return TRUE;
	};
};
func void DIA_Igaraz_ADD_Info ()
{
	AI_Output (other, self, "DIA_Igaraz_Add_15_00"); //Ты знаешь что-нибудь о 'живой скале'?
	AI_Output (self, other, "DIA_Igaraz_Add_13_01"); //(хихикает) Нет! Тебе дал задание Серпентес?
	AI_Output (other, self, "DIA_Igaraz_Add_15_02"); //Да, а что?
	AI_Output (self, other, "DIA_Igaraz_Add_13_03"); //Я, кажется, догадываюсь, что он имел в виду...
	AI_Output (self, other, "DIA_Igaraz_Add_13_04"); //Ты будешь не первым, кто провалил это испытание...
	AI_Output (other, self, "DIA_Igaraz_Add_15_05"); //Где мне найти эту живую скалу?
	AI_Output (self, other, "DIA_Igaraz_Add_13_06"); //Просто иди по этой тропинке. Спустя некоторое время ты увидишь реку.
	AI_Output (self, other, "DIA_Igaraz_Add_13_07"); //Продолжай идти по тропинке в горы. Она должна быть где-то там.
	AI_Output (self, other, "DIA_Igaraz_Add_13_08"); //Если ты дойдешь до моста - значит, ты зашел слишком далеко.
	AI_Output (self, other, "DIA_Igaraz_Add_13_09"); //(смеется) ЕСЛИ тебе вообще удастся уйти далеко...
	AI_Output (self, other, "DIA_Igaraz_Add_13_10"); //Это все что я могу сказать тебе... (с сарказмом) Это ведь все же должно быть твое ИСПЫТАНИЕ!
};
///////////////////////////////////////////////////////////////////////
//	Info Perm Prьfung 
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_Pruefung		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	22;
	condition	 = 	DIA_Igaraz_Pruefung_Condition;
	information	 = 	DIA_Igaraz_Pruefung_Info;
	description	 =  "Выяснил что-нибудь новое?";
};
func int DIA_Igaraz_Pruefung_Condition ()
{	
	if (other.guild == GIL_NOV) 
	&& (Npc_HasItems (other, ItMi_Runeblank) < 1)
	&& (Npc_KnowsInfo (other,DIA_Igaraz_METOO))
	{
		return TRUE;
	};
};
func void DIA_Igaraz_Pruefung_Info ()
{
	AI_Output (other, self, "DIA_Igaraz_Pruefung_15_00"); //Выяснил что-нибудь новое?
	AI_Output (self, other, "DIA_Igaraz_Pruefung_13_01"); //Пока нет, но я продолжаю поиски.
	
	AI_StopProcessInfos (self); 
	
	if (Igaraz_Wait == FALSE) 
	{
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self,"CONTESTWAIT");
		Igaraz_Wait = TRUE;
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info Stein
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_Stein		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	1;
	condition	 = 	DIA_Igaraz_Stein_Condition;
	information	 = 	DIA_Igaraz_Stein_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE; 
};
func int DIA_Igaraz_Stein_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_66") <= 3500) 
	&& (other.guild == GIL_NOV) 
	&& (Npc_HasItems (other, ItMi_Runeblank) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Igaraz_Stein_Info ()
{
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_00"); //Эй, подожди. Нам нужно поговорить...
	AI_Output (other, self, "DIA_Igaraz_Seufz_15_01"); //Я так не думаю...
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_02"); //Я ждал этого испытания много лет. Иннос поддерживает меня и я ДОЛЖЕН пройти его.
	
	if Npc_KnowsInfo (other, DIA_Ulf_Abrechnung)
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_03"); //Где-то я уже это слышал.
	}
	else
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_04"); //Ты не первый, кто говорит это.
	};
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_05"); //Хватит болтать. Мне нужно то, что ты нашел. А тебе пришло время умереть!
	
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};


//################################################
//##
//##	Kapitel 2
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap2_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap2_EXIT_Condition;
	information = DIA_Igaraz_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap2_EXIT_Condition()
{
	if (kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//################################################
//##
//##	Kapitel 3
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap3_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap3_EXIT_Condition;
	information = DIA_Igaraz_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap3_EXIT_Condition()
{
	if (kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//**************************************************************************
//	Info TalkAboutBabo
//**************************************************************************
INSTANCE DIA_Igaranz_TalkAboutBabo   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_TalkAboutBabo_Condition;
	information = DIA_Igaraz_TalkAboutBabo_Info;
	permanent   = FALSE;
	description = "Нам нужно поговорить о Бабо.";
};
FUNC INT DIA_Igaraz_TalkAboutBabo_Condition()
{
	if (MIS_BabosDocs == LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_TalkAboutBabo_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_TalkAboutBabo_15_00"); //Нам нужно поговорить о Бабо.
	AI_Output (self ,other,"DIA_Igaranz_TalkAboutBabo_13_01"); //(сдержанно) Да, в чем дело?
};

//**************************************************************************
//	Du hast etwas was Babo gehцrt
//**************************************************************************
INSTANCE DIA_Igaranz_BabosBelongings   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BabosBelongings_Condition;
	information = DIA_Igaraz_BabosBelongings_Info;
	permanent   = FALSE;
	description = "У тебя есть кое-что принадлежащее Бабо.";
};
FUNC INT DIA_Igaraz_BabosBelongings_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_TalkAboutBabo))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_BabosBelongings_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_00"); //У тебя есть кое-что принадлежащее Бабо.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_01"); //И что бы это могло быть?
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_02"); //Несколько листков бумаги. Бабо хотел бы получить их назад.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_03"); //(насмешливо) Да? Надо же! Могу представить. Вынужден огорчить, я предпочел бы оставить их у себя. Похоже, тут налицо противоречие интересов.
};

//**************************************************************************
//	Wo hast du die Papiere?
//**************************************************************************
INSTANCE DIA_Igaranz_WhereDocs   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_WhereDocs_Condition;
	information = DIA_Igaraz_WhereDocs_Info;
	permanent   = FALSE;
	description = "Где эти бумаги?";
};
FUNC INT DIA_Igaraz_WhereDocs_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_WhereDocs_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_00"); //Где эти бумаги?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_01"); //(лукаво) Ну, конечно же, я не держу их при себе. Боюсь, ничем не могу помочь.
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_02"); //Где они?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_03"); //Я запер их в сундуке. А ключ от него тебе никогда не получить.
};

//**************************************************************************
//	Was soll Babo fьr dich tun?
//**************************************************************************
INSTANCE DIA_Igaranz_BabosJob   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BabosJob_Condition;
	information = DIA_Igaraz_BabosJob_Info;
	permanent   = FALSE;
	description = "Что Бабо должен делать для тебя?";
};
FUNC INT DIA_Igaraz_BabosJob_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_BabosJob_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_00"); //Что Бабо должен делать для тебя?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_01"); //Если бы я знал, что этот слизняк наложит в штаны из-за нескольких кустов болотной травы, я бы давно позаботился, чтобы кто-нибудь другой занял его место в монастырском саду.
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_02"); //Он должен выращивать болотную траву?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_03"); //Конечно. Так как она больше не поступает из-за Барьера, цена на травку в городе выросла втрое.
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_04"); //Мы могли бы хорошо заработать на этом. Но Бабо отказывается сотрудничать.
};

//**************************************************************************
//	Wieviel willst du fьr die Papiere haben?
//**************************************************************************
INSTANCE DIA_Igaranz_Price   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_Price_Condition;
	information = DIA_Igaraz_Price_Info;
	permanent   = FALSE;
	description = "Сколько ты хочешь за эти бумаги?";
};
FUNC INT DIA_Igaraz_Price_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Price_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_Price_15_00"); //Сколько ты хочешь за эти бумаги?
	AI_Output (self ,other,"DIA_Igaranz_Price_13_01"); //(смеется) Ха, вообще-то говоря, они практически бесценны. Очень редко можно встретить что-нибудь подобное.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_02"); //Но у меня нет желания рисковать своим будущим из-за нескольких золотых.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_03"); //300 монет, и ты можешь делать с этими бумагами все, что захочешь.
};

//**************************************************************************
//	Ich will die Papiere kaufen.
//**************************************************************************
INSTANCE DIA_Igaranz_BuyIt   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BuyIt_Condition;
	information = DIA_Igaraz_BuyIt_Info;
	permanent   = FALSE;
	description = "Я хочу купить эти бумаги.";
};
FUNC INT DIA_Igaraz_BuyIt_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_Price))
	&& (Npc_HasItems (other,ItMi_Gold)>=300)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_BuyIt_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_BuyIt_15_00"); //Я хочу купить эти бумаги.
	AI_Output (self ,other,"DIA_Igaranz_BuyIt_13_01"); //Послушай, я сейчас не могу отлучиться. Я дам тебе ключ от моего сундука. В нем все равно больше ничего нет.
	
	B_GiveInvItems (other,self,ItMi_Gold,300);
	B_GiveInvItems (self,other,ItKe_IgarazChest_mis,1);
};

//****************************************************
//	Taschendiebstahl
//***************************************************

INSTANCE DIA_Igaraz_PICKPOCKET (C_INFO)
{
	npc			= Nov_601_Igaraz;
	nr			= 900;
	condition	= DIA_Igaraz_PICKPOCKET_Condition;
	information	= DIA_Igaraz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Украсть этот ключ будет легко)";
};                       

FUNC INT DIA_Igaraz_PICKPOCKET_Condition()
{
	if (MIS_BaBosDocs == LOG_RUNNING) 
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItKe_IgarazChest_mis) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Igaraz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Igaraz_PICKPOCKET);
	Info_AddChoice		(DIA_Igaraz_PICKPOCKET, DIALOG_BACK 		,DIA_Igaraz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Igaraz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Igaraz_PICKPOCKET_DoIt);
};

func void DIA_Igaraz_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ItKe_IgarazChest_mis, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Igaraz_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft fьhrt zu NEWS!
	};
};
	
func void DIA_Igaraz_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_Igaraz_PICKPOCKET);
};
	
//################################################
//##
//##	Kapitel 4
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap4_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap4_EXIT_Condition;
	information = DIA_Igaraz_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap4_EXIT_Condition()
{
	if (kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//################################################
//##
//##	Kapitel 5
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap5_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap5_EXIT_Condition;
	information = DIA_Igaraz_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap5_EXIT_Condition()
{
	if (kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	Info Perm
//**************************************************************************
INSTANCE DIA_Igaranz_Perm   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Perm_Condition;
	information = DIA_Igaraz_Perm_Info;
	permanent   = FALSE;
	description	= "У тебя есть что-нибудь интересное для меня?";
};
FUNC INT DIA_Igaraz_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	&& (MIS_BabosDocs != LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Perm_Info()
{
	AI_Output (other ,self,"DIA_Igaranz_Perm_15_00"); //У тебя есть что-нибудь интересное для меня?
	AI_Output (self ,other,"DIA_Igaranz_Perm_13_01"); //Хмм... нет.
	
	AI_StopProcessInfos(self); 
		
};




