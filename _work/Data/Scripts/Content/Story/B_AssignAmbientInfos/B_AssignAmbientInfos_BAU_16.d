// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_16_EXIT_Condition;
	information	= DIA_BAU_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_16_JOIN_Condition;
	information	= DIA_BAU_16_JOIN_Info;
	permanent	= TRUE;
	description = "Расскажи мне подробнее об этих наемниках!";
};                       

FUNC INT DIA_BAU_16_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_16_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_JOIN_15_00"); //Расскажи мне подробнее об этих наемниках!
	AI_Output (self, other, "DIA_BAU_16_JOIN_16_01"); //Они слоняются без дела по ферме, дерутся иногда и думают, что это забавно.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_16_PEOPLE_Condition;
	information	= DIA_BAU_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "Кто командует здесь?";
};                       

FUNC INT DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_PEOPLE_15_00"); //Кто заправляет здесь?
	AI_Output (self, other, "DIA_BAU_16_PEOPLE_16_01"); //Наемники, конечно.
	AI_Output (self, other, "DIA_BAU_16_PEOPLE_16_02"); //Онар платит им, но большую часть времени они делают, что им захочется.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_16_LOCATION_Condition;
	information	= DIA_BAU_16_LOCATION_Info;
	permanent	= TRUE;
	description = "Что ты можешь рассказать мне об этом квартале?";
};                       

FUNC INT DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_LOCATION_15_00"); //Что ты можешь рассказать интересного об этой местности?
	AI_Output (self, other, "DIA_BAU_16_LOCATION_16_01"); //Здесь есть три фермы. Ферма Онара на востоке, а Секоба на севере долины.
	AI_Output (self, other, "DIA_BAU_16_LOCATION_16_02"); //Отсюда в горы на юго-западе, ведет каменная лестница. Там находится ферма Бенгара.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_16_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_16_STANDARD_Condition;
	information	= DIA_BAU_16_STANDARD_Info;
	permanent	= TRUE;
	description = "Что нового?";
};                       
func INT DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_STANDARD_15_00"); //Что новенького?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_01"); //Солдаты из города больше не забирают наш скот и урожай! Мы больше не играем в эти игры. Теперь мы способны защитить себя!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_02"); //Говорят, что в Долине Рудников собирается армия зла. Скоро они будут здесь.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_03"); //Я слышала, что в Долине Рудников появились драконы. Но мне не очень-то верится в это.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_04"); //Кое-кто из наемников ушел отсюда. Я даже не знаю, хорошо это или плохо.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_05"); //Паладины отправились в Долину Рудников - интересно, зачем?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_16 (var c_NPC slf)
{
	DIA_BAU_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_16_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
