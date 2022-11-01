///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap1 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap1_EXIT_Condition;
	information = DIA_Marduk_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_JOB		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	condition	 = 	DIA_Marduk_JOB_Condition;
	information	 = 	DIA_Marduk_JOB_Info;
	permanent	 =	FALSE;	
	description	 = 	"Что ты делаешь здесь?";
};
func int DIA_Marduk_JOB_Condition ()
{
	return TRUE;
};
func void DIA_Marduk_JOB_Info ()
{
	AI_Output (other, self, "DIA_Marduk_JOB_15_00"); //Что ты делаешь здесь?
	AI_Output (self, other, "DIA_Marduk_JOB_05_01"); //Я готовлю паладинов к сражению против Зла.
};
///////////////////////////////////////////////////////////////////////
//	Info Arbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Arbeit		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 = 	3;
	condition	 = 	DIA_Marduk_Arbeit_Condition;
	information	 = 	DIA_Marduk_Arbeit_Info;
	permanent	 = 	FALSE;
	description	 = 	"Могу я сделать что-нибудь для тебя, мастер?";
};
func int DIA_Marduk_Arbeit_Condition ()
{	
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Marduk_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Arbeit_15_00"); //Могу я сделать что-нибудь для тебя, мастер?
	AI_Output (self, other, "DIA_Marduk_Arbeit_05_01"); //Для меня? Нет, мне не нужна твоя помощь. Лучше помолись за воинов Инноса, отправившихся в Долину Рудников.
	
	MIS_MardukBeten = LOG_RUNNING;
	B_StartOtherRoutine (Sergio,"WAIT");
	
	Log_CreateTopic (Topic_MardukBeten,LOG_MISSION);
	Log_SetTopicStatus (Topic_MardukBeten,LOG_RUNNING);
	B_LogEntry (Topic_MardukBeten,"У мастера Мардука нет заданий для меня. Он сказал, что мне лучше пойти помолиться за паладинов.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gebetet
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Gebetet		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 = 	3;
	condition	 = 	DIA_Marduk_Gebetet_Condition;
	information	 = 	DIA_Marduk_Gebetet_Info;
	permanent	 = 	FALSE;
	description	 = 	"Я помолился за паладинов.";
};
func int DIA_Marduk_Gebetet_Condition ()
{	
	if (MIS_MardukBeten == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, PC_PrayShrine_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Marduk_Gebetet_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Gebetet_15_00"); //Я помолился за паладинов.
	AI_Output (self, other, "DIA_Marduk_Gebetet_05_01"); //Это хорошо. А теперь возвращайся к своей работе.
	
	MIS_MardukBeten = LOG_SUCCESS;
	B_GivePlayerXP (XP_MardukBeten);
	B_StartOtherRoutine (Sergio,"START");
};
///////////////////////////////////////////////////////////////////////
//	Info Das Bцse
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Evil		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	condition	 = 	DIA_Marduk_Evil_Condition;
	information	 = 	DIA_Marduk_Evil_Info;
	permanent	 =	TRUE;
	description	 = 	"Что такое 'Зло'?";
};
func int DIA_Marduk_Evil_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Marduk_JOB)
	{
		return TRUE;
	};
};
func void DIA_Marduk_Evil_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Evil_15_00"); //Что такое 'Зло'?
	AI_Output (self ,other, "DIA_Marduk_Evil_05_01"); //Зло повсюду. Оно порождение Белиара, извечного противника Инноса.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_02"); //Это всепоглощающая тьма, которая пытается навсегда закрыть от нас Свет Инноса.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_03"); //Белиар - Повелитель Тьмы, Ненависти и Разрушений.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_04"); //Только те из нас, чьи сердца горят Святым Огнем Инноса, несут сияющий Свет Инноса в наш мир и изгоняют тьму.
};
///////////////////////////////////////////////////////////////////////
//	Info Paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Pal		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	condition	 = 	DIA_Marduk_Pal_Condition;
	information	 = 	DIA_Marduk_Pal_Info;
	permanent	 = 	FALSE;
	description	 = 	"Но в монастыре живут только маги и послушники.";
};
func int DIA_Marduk_Pal_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Marduk_JOB)
	{
		return TRUE;
	};
};
func void DIA_Marduk_Pal_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Pal_15_00"); //Но в монастыре живут только маги и послушники.
	AI_Output (self, other, "DIA_Marduk_Pal_05_01"); //Правильно. В отличие от нашей общины, которая чтит Слово Инноса...
	AI_Output (self, other, "DIA_Marduk_Pal_05_02"); //...паладины чтят превыше всего дела нашего Владыки.
	AI_Output (self, other, "DIA_Marduk_Pal_05_03"); //Мы все - представители Инноса, но паладины - его воины, идущие в бой с его именем на устах и прославляя его величие.
};
///////////////////////////////////////////////////////////////////////
//	Info BEFORETEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_BEFORETEACH		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 = 	3;
	condition	 = 	DIA_Marduk_BEFORETEACH_Condition;
	information	 = 	DIA_Marduk_BEFORETEACH_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ты можешь чему-нибудь научить меня?";
};
func int DIA_Marduk_BEFORETEACH_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Marduk_JOB)
	{
		return TRUE;
	};
};
func void DIA_Marduk_BEFORETEACH_Info ()
{
	AI_Output (other, self, "DIA_Marduk_BEFORETEACH_15_00"); //Ты можешь чему-нибудь научить меня?
	AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_01"); //Я эксперт в магии льда и грома. Я могу обучить тебя этим дисциплинам.
	
	if (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_02"); //Однако я обучаю только магов.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_TEACH		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 =  10;
	condition	 = 	DIA_Marduk_TEACH_Condition;
	information	 = 	DIA_Marduk_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Обучи меня (созданию рун).";
};
func int DIA_Marduk_TEACH_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Marduk_BEFORETEACH)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Marduk_TEACH_Info ()
{
		var int abletolearn;
		
		abletolearn = 0;
		
		AI_Output (other, self, "DIA_Marduk_TEACH_15_00"); //Обучи меня.

		Info_ClearChoices 	(DIA_Marduk_TEACH);
		Info_AddChoice 		(DIA_Marduk_TEACH,DIALOG_BACK,DIA_Marduk_TEACH_BACK);
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE) 
		{
			Info_AddChoice 		(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_Zap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Zap)),DIA_Marduk_TEACH_ZAP);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE)
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_Marduk_TEACH_Icebolt);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3) 
		&& (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE) 
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_IceCube, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceCube)) ,DIA_Marduk_TEACH_IceCube);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE) 
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_ChargeZap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeZap)) ,DIA_Marduk_TEACH_ThunderBall);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4) 
		&& (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE) 
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_LightningFlash, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightningFlash)) ,DIA_Marduk_TEACH_LightningFlash);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_IceWave, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceWave)) ,DIA_Marduk_TEACH_IceWave);
			abletolearn = (abletolearn +1);
		};
		if (abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Marduk_TEACH_05_01"); //Сейчас я не могу обучить тебя.
			Info_ClearChoices 	(DIA_Marduk_TEACH);
		};
	
};
FUNC VOID DIA_Marduk_TEACH_BACK()
{
	Info_ClearChoices 	(DIA_Marduk_TEACH);
};
///////////////////////////////////////////////////////////////////////
//	MAGIER ZAUBER 
///////////////////////////////////////////////////////////////////////
FUNC VOID DIA_Marduk_TEACH_ZAP()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Zap);	
};
FUNC VOID DIA_Marduk_TEACH_Icebolt()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
FUNC VOID DIA_Marduk_TEACH_LightningFlash()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightningFlash);	
};
FUNC VOID DIA_Marduk_TEACH_IceCube()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceCube);	
};
FUNC VOID DIA_Marduk_TEACH_ThunderBall()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeZap);	
};
FUNC VOID DIA_Marduk_TEACH_IceWave()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceWave);	
};


//#####################################################################
//##
//##		Kapitel 2
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap2_EXIT_Condition;
	information = DIA_Marduk_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



//#####################################################################
//##
//##		Kapitel 3
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap3_EXIT_Condition;
	information = DIA_Marduk_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello Kap3 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap3_Hello   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 30;
	condition   = DIA_Marduk_Kap3_Hello_Condition;
	information = DIA_Marduk_Kap3_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Marduk_Kap3_Hello_Condition()
{
	if (Kapitel == 3)
	&& ((hero.guild == GIL_PAL)
	|| (hero.guild == GIL_DJG))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap3_Hello_Info()
{
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_00"); //Добро пожаловать, сын мой.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_01"); //С каких это пор ты стал паладином?
	};
	if (hero.Guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_02"); //Откуда ты пришел?
	};
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
	Info_AddChoice (DIA_Marduk_Kap3_Hello,"Это не твое дело.",DIA_Marduk_Kap3_Hello_NotYourConcern);
	
	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"Совсем недавно.",DIA_Marduk_Kap3_Hello_Soon);
	};
	if (hero.Guild == GIL_DJG)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"Я пришел с фермы.",DIA_Marduk_Kap3_Hello_DJG);
	};
	
};

FUNC VOID DIA_Marduk_Kap3_Hello_NotYourConcern ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00"); //Это не твое дело.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01"); //(ворчливо) Паладин всегда должен быть вежливым и скромным. Ты должен защищать тех, кто не может защитить себя сам.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02"); //(ворчливо) Это привилегия, и ты должен быть благодарен, что Иннос дает тебе такую возможность. Подумай об этом!
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03"); //(зло) Эх, раньше всякий сброд не пускали в монастырь. Твое поведение доказывает, что это были хорошие времена.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04"); //(предупреждающе) Я предупреждаю тебя, не стоит сеять тут смуту - ты будешь немедленно наказан. Мы не будем проявлять фальшивое великодушие.
	};	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_Soon ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_Soon_15_00"); //Совсем недавно.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_01"); //Тогда добро пожаловать. В этой битве нам нужны все, у кого есть мужество противостоять злу.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_02"); //Судьба всех нас лежит в руках людей вроде тебя. Да придаст тебе Иннос так необходимое тебе мужество.
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_DJG ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_DJG_15_00"); //Я пришел с фермы.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_01"); //Тогда добро пожаловать во имя гостеприимства. Надеюсь, ты оценишь его.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_02"); //Но не забывай, что ты в гостях, иначе у тебя будут большие проблемы.
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Paladine trainieren 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_TrainPals   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 32;
	condition   = DIA_Marduk_TrainPals_Condition;
	information = DIA_Marduk_TrainPals_Info;
	permanent   = TRUE;
	description = "Чему ты можешь обучить меня?";
};

//---------------------------------
	var int Marduk_TrainPals_permanent;
//---------------------------------
FUNC INT DIA_Marduk_TrainPals_Condition()
{
	if (hero.guild == GIL_PAL)
	&& (Marduk_TrainPals_permanent == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_TrainPals_Info()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_00"); //Чему ты можешь обучить меня?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_01"); //Естественно, я не могу обучить тебя боевым искусствам.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_02"); //Но я могу, впрочем, донести сущность Инноса и его дары до тебя.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_03"); //Кроме того, я мои обязанности входит подготовить тебя к Освящению Меча.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_04"); //А магии?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_05"); //Здесь мы учим только нашей магии. Ты должен изучать магию паладинов в городе.
	
	Info_ClearChoices (DIA_Marduk_TrainPals); 
	Info_AddChoice (DIA_Marduk_TrainPals,"Может быть, позже.",DIA_Marduk_TrainPals_Later);
	Info_AddChoice (DIA_Marduk_TrainPals,"Что ты хочешь этим сказать?",DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice (DIA_Marduk_TrainPals,"Что такое Освящение Меча?",DIA_Marduk_TrainPals_Blessing);
};

FUNC VOID DIA_Marduk_TrainPals_Later()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Later_15_00"); //Может быть, позже.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Later_05_01"); //Добро пожаловать в любое время.
	
	Info_ClearChoices (DIA_Marduk_TrainPals);
};

FUNC VOID DIA_Marduk_TrainPals_Meaning()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_00"); //Что ты хочешь сказать этим?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_01"); //Когда Иннос покидал наш мир, он оставил человечеству частицу своей божественной силы.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_02"); //Только немногим из людей позволено использовать его силу и нести в мир правосудие от его имени.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_03"); //А что ты хочешь донести до меня?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_04"); //Я могу наставить тебя на правильный путь, чтобы ты познал сущность Инноса и следовал по этому пути.
};

FUNC VOID DIA_Marduk_TrainPals_Blessing()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Blessing_15_00"); //Что такое Освящение Меча?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_01"); //Освящение Меча - это один из самых священных ритуалов паладинов.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_02"); //Во время этой церемонии святая сила Инноса протекает через меч паладина и придает мечу невообразимую силу.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_03"); //Меч, освященный таким образом, - самое ценное, что есть у паладина, и он не расстается с ним до конца своих дней.

	Marduk_TrainPals_permanent = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Schwertweihe 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_SwordBlessing   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 33;
	condition   = DIA_Marduk_SwordBlessing_Condition;
	information = DIA_Marduk_SwordBlessing_Info;
	permanent   = TRUE;
	description = "Я хочу освятить мой меч.";
};
FUNC INT DIA_Marduk_SwordBlessing_Condition()
{
	if (Marduk_TrainPals_permanent == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_SwordBlessing_Info()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_15_00"); //Я хочу освятить мой меч.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_01"); //Если ты твердо решил сделать этот шаг, тебе сначала нужно найти магический меч.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_02"); //Затем ты должен вернуться в эту часовню и молиться.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_03"); //Во время молитвы и после разумного пожертвования нашему Владыке Инносу ты должен попросить у Инноса благоволения и помощи в битве против Зла.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_04"); //Если Иннос будет благосклонен к тебе, твой меч в тот же момент будет освящен нашим Владыкой.
	
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
	Info_AddChoice (DIA_Marduk_SwordBlessing,DIALOG_BACK,DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Что за пожертвование?",DIA_Marduk_SwordBlessing_Donation); 
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Где мне найти магический меч?",DIA_Marduk_SwordBlessing_OreBlade);
};

FUNC VOID DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
};

FUNC VOID DIA_Marduk_SwordBlessing_Donation ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_Donation_15_00"); //Что за пожертвование?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_01"); //Ну, учитывая милость, что будет оказана тебе, суммы в 5000 монет будет более чем достаточно.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_02"); //Конечно, ты можешь пожертвовать больше.
};

FUNC VOID DIA_Marduk_SwordBlessing_OreBlade ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_00"); //Где мне найти магический меч?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01"); //Попробуй поговорить в городе с кузнецом Гарадом.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02"); //Он обеспечивает паладинов магическими клинками, пока они находятся на острове.
	if (Npc_IsDead (HARAD) == TRUE)
	{
		AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_03"); //Гарад мертв.
		AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04"); //Мне очень жаль, но тогда тебе придется ждать возвращения на материк вместе с другими паладинами.
	}; 
};

///////////////////////////////////////////////////////////////////////
//	Info PERM Kap3 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap3_PERM   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 39;
	condition   = DIA_Marduk_Kap3_PERM_Condition;
	information = DIA_Marduk_Kap3_PERM_Info;
	permanent   = TRUE;
	description = "Есть новости?";
};
FUNC INT DIA_Marduk_Kap3_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap3_PERM_Info()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_00"); //Есть новости?
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_01"); //Да, врагу удалось внедрить предателя в наши ряды.
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_02"); //Он украл Глаз Инноса, один из самых важных наших артефактов. И это только вершина айсберга.
		//Joly:AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_03"); //Чт ты имеешь в виду?
	};
	
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_04"); //(озабоченно) Враг, по-видимому, уже вошел в город.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_05"); //Чт ты имеешь в виду?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_06"); //Один из паладинов, Лотар, был убит на улице.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_07"); //(зло) Прямо средь бела дня! Это зашло слишком далеко, но я боюсь, что это только начало.
	
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,DIALOG_BACK,DIA_Marduk_Kap3_PERM_BAck);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,"Что будет теперь?",DIA_Marduk_Kap3_PERM_AndNow);
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Беннет не виновен.",DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}	
	else
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Убийца был пойман?",DIA_Marduk_Kap3_PERM_Murderer);
	};
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Куда побежал вор?",DIA_Marduk_Kap3_PERM_thief);
	}; 
};

FUNC VOID DIA_Marduk_Kap3_PERM_BAck ()
{
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);	
};

FUNC VOID DIA_Marduk_Kap3_PERM_AndNow ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_00"); //Что будет теперь?
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01"); //Мы будем преследовать вора, куда бы он не побежал. Мы найдем его, и он понесет заслуженное наказание.
		AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_02"); //Для этого сначала нужно знать, кто этот вор.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03"); //Мы скоро выясним это. И не важно, сколько времени на это понадобится, но мы найдем его.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04"); //Клянусь Инносом.
	}
	else
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05"); //Убийство, а тем более паладина, несомненно, одно из самых тяжелых преступлений.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06"); //Убийца наверняка будет приговорен к смерти.
	};
};

FUNC VOID DIA_Marduk_Kap3_PERM_BennetisNotGuilty ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00"); //Беннет не виновен. Свидетель солгал.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01"); //Откуда ты это знаешь?
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02"); //Я нашел доказательства.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03"); //Иногда мне кажется, что предательство и жадность - наши самые величайшие враги.
};

FUNC VOID DIA_Marduk_Kap3_PERM_Murderer ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_00"); //Убийца был пойман?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01"); //По счастью, да. Им оказался один из головорезов с фермы Онара.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_02"); //Кто?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03"); //Я не знаю его имени. Но среди наемников, определенно, есть личности, от которых можно ожидать подобного.
};

FUNC VOID DIA_Marduk_Kap3_PERM_thief ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_thief_15_00"); //Куда побежал вор?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_01"); //Я не знаю, он выбежал из ворот как одержимый и исчез.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_02"); //Не важно, где он скрывается, под каким камнем он спрятался, гнев Инноса поразит его и выжжет его черное сердце.
};

//#####################################################################
//##
//##		Kapitel 4
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap4_EXIT_Condition;
	information = DIA_Marduk_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM Kap4U5 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap4U5_PERM   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 49;
	condition   = DIA_Marduk_Kap4U5_PERM_Condition;
	information = DIA_Marduk_Kap4U5_PERM_Info;
	permanent   = TRUE;
	description = "Есть новости?";
};
FUNC INT DIA_Marduk_Kap4U5_PERM_Condition()
{
	if (Kapitel == 4)
	|| (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap4U5_PERM_Info()
{
	AI_Output (other,self ,"DIA_Marduk_Kap4U5_PERM_15_00"); //Есть новости?
	AI_Output (self ,other,"DIA_Marduk_Kap4U5_PERM_05_01"); //Нет, о, боже, ситуация все еще очень критическая.
};

//#####################################################################
//##
//##		Kapitel 5
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap5_EXIT_Condition;
	information = DIA_Marduk_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Marduk_PICKPOCKET (C_INFO)
{
	npc			= KDF_505_Marduk;
	nr			= 900;
	condition	= DIA_Marduk_PICKPOCKET_Condition;
	information	= DIA_Marduk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Marduk_PICKPOCKET_Condition()
{
	C_Beklauen (36, 40);
};
 
FUNC VOID DIA_Marduk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Marduk_PICKPOCKET);
	Info_AddChoice		(DIA_Marduk_PICKPOCKET, DIALOG_BACK 		,DIA_Marduk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Marduk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Marduk_PICKPOCKET_DoIt);
};

func void DIA_Marduk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Marduk_PICKPOCKET);
};
	
func void DIA_Marduk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Marduk_PICKPOCKET);
};


