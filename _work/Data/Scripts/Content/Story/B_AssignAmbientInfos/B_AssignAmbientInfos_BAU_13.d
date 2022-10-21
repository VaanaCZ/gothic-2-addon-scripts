// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_13_EXIT_Condition;
	information	= DIA_BAU_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_13_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_13_JOIN_Condition;
	information	= DIA_BAU_13_JOIN_Info;
	permanent	= TRUE;
	description = "Расскажи мне подробнее об этих наемниках!";
};                       

FUNC INT DIA_BAU_13_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_JOIN_15_00"); //Расскажи мне подробнее об этих наемниках!
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_01"); //Если у тебя с ними какие-то проблемы, иди к Ли. Мы, фермеры, всегда так делаем. Он держит своих людей в ежовых рукавицах.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_02"); //Если кто-то из них ведет себя неправильно, он рискует нарваться на неприятности.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_13_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_13_PEOPLE_Condition;
	information	= DIA_BAU_13_PEOPLE_Info;
	permanent	= TRUE;
	description = "Кто командует здесь?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_PEOPLE_15_00"); //Кто заправляет здесь?
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_01"); //Если тебе интересно мое мнение - то наемники. Конечно, Онар платит им, но только Иннос знает, сколько еще они будут повиноваться его приказам.
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_02"); //Я не хотел бы оказаться в его шкуре, если до наемников вдруг дойдет, что без него можно обойтись.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_13_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_13_LOCATION_Condition;
	information	= DIA_BAU_13_LOCATION_Info;
	permanent	= TRUE;
	description = "Что ты можешь рассказать мне об этом квартале?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_LOCATION_15_00"); //Что ты можешь сказать об этом районе?
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_01"); //Здесь есть три фермы. Ферма Онара к востоку и Секоба к северу в конце долины.
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_02"); //На юго-западе есть проход на высокогорное плато. Там находится ферма Бенгара.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_13_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_13_STANDARD_Condition;
	information	= DIA_BAU_13_STANDARD_Info;
	permanent	= TRUE;
	description = "Что нового?";
};                       
func INT DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_13_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_STANDARD_15_00"); //Что новенького?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_01"); //Войска из города больше не забирают наш урожай и скот! Они не захотели играть в эту игру, когда мы начали защищаться!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_02"); //Паладинов из города не волнует судьба фермеров. Если нападут орки, мы будем брошены на произвол судьбы.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_03"); //Драконы! Ходят слухи, что в Долине Рудников появились драконы. Они скоро доберутся до Прохода!
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_04"); //Говорят, даже, что бандиты с гор направились в Долину Рудников. Ну, по мне - так это слишком опасно.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_05"); //Когда налоги будут снижены, и нам будут достойно платить за нашу работу, тогда мы опять будем торговать с городом.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_13 (var c_NPC slf)
{
	DIA_BAU_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
