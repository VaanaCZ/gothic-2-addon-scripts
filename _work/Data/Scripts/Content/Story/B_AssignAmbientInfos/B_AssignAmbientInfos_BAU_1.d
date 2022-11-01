// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_1_EXIT_Condition;
	information	= DIA_BAU_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_1_JOIN_Condition;
	information	= DIA_BAU_1_JOIN_Info;
	permanent	= TRUE;
	description = "Расскажи мне подробнее об этих наемниках.";
};                       

FUNC INT DIA_BAU_1_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_JOIN_15_00"); //Расскажи мне подробнее об этих наемниках.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_01"); //Я могу только посоветовать держаться от них подальше.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_02"); //Если одному из них не понравится твое лицо, он может не раздумывая заехать тебе по носу.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_03"); //Конечно, после этого ты можешь пожаловаться Ли, но нос-то уже будет сломан.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_1_PEOPLE_Condition;
	information	= DIA_BAU_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Кто командует здесь?";
};                       

FUNC INT DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_PEOPLE_15_00"); //Кто заправляет здесь?
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_01"); //Это ферма Онара. Здесь он принимает все решения.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_02"); //Позволь мне дать тебе совет: не ввязывайся в драку с его наемниками. С этими парнями шутить не стоит.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_03"); //Сильвио - это вообще отъявленный бандит. Но их предводитель, Ли, вполне нормальный парень.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_1_LOCATION_Condition;
	information	= DIA_BAU_1_LOCATION_Info;
	permanent	= TRUE;
	description = "А что здесь есть интересного?";
};                       

FUNC INT DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_LOCATION_15_00"); //А что здесь есть интересного?
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_01"); //Здесь только поля и фермы. И горстка наемников. Но почти все они находятся на востоке, на ферме Онара.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_02"); //К северу располагается ферма Секоба, но туда они заглядывают, только чтобы собрать ренту.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_03"); //На юге находится проход к ферме Бенгара.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_1_STANDARD_Condition;
	information	= DIA_BAU_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Что нового?";
};                       
func INT DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_STANDARD_15_00"); //Что новенького?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_01"); //Онар нанял наемников, чтобы те защищали его от городского ополчения. Если бы не наемники, они отняли бы у нас все, до последней овцы!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_02"); //Немного. Как всегда, одни и те же проблемы. Ополчение, орки и полевые хищники.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_03"); //Странные дела творятся здесь. Несколько дней назад я видел фигуру в черном. Это был не человек.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_04"); //Здесь все чаще и чаще появляются орки. Иногда мне кажется, что вместо каждого убитого орка появляются еще двое.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_05"); //Паладины идут в Долину Рудников. Что это все значит? Здесь никого не останется, кто держал бы ополчение в узде.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_1 (var c_NPC slf)
{
	DIA_BAU_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
