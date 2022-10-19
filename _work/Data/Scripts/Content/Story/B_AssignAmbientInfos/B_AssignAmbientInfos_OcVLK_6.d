// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_6_EXIT_Condition;
	information	= DIA_OCVLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_6_PEOPLE_Condition;
	information	= DIA_OCVLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Кто командует здесь?";
};                       

FUNC INT DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_PEOPLE_15_00"); //Кто командует здесь?
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //Гаронд командует всем фортом - вернее, тем, что от него осталось.
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //Но сам он не предпринимает практически ничего. Ну, если только кто-либо из его людей не попадет в беду.
	if (Npc_IsDead (Engor) == FALSE)
	{
		AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //Если тебе нужно снаряжение, поговори с Энгором. Ты найдешь его в доме напротив дома Гаронда.
	};
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_6_LOCATION_Condition;
	information	= DIA_OCVLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Что ты можешь рассказать мне о ситуации в Долине Рудников?";
};                       

FUNC INT DIA_OCVLK_6_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_LOCATION_15_00"); //Что ты можешь рассказать мне о ситуации в Долине Рудников?
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_01"); //Меня беспокоит защитная стена орков. Я даже знать не хочу, что орки скрывают за ней.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_02"); //Сначала их было мало - они строили эту стену. А затем, однажды ночью, они приволокли осадные машины.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_03"); //Нам повезло, и мы смогли отразить эту атаку.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_04"); //За стеной лежит море. Если еще прибудут корабли с орками, у нас не будет ни единого шанса.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_6_STANDARD_Condition;
	information	= DIA_OCVLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Как дела?";
};                       
func INT DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_STANDARD_15_00"); //Как дела?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_01"); //Они говорили: 'Вступи в армию и у тебя не будет забот'. И вот как все вышло.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_02"); //Теперь под страхом смерти запрещено даже приближаться к запасам продовольствия. Гаронд, похоже, боится, что мы соберем манатки и свалим отсюда. (горькая усмешка)
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_03"); //Мы все здесь сдохнем от голода, если эти чертовы драконы не убьют нас раньше!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_04"); //Охотники на драконов. Не смеши меня! Они ничего не изменят.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_05"); //Говорят, что все драконы убиты! Теперь у нас появился шанс!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_06"); //Все из-за этой проклятой руды. Нам бы лучше выбросить все, что мы наковыряли здесь. Может, тогда орки оставят нас в покое.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_07"); //Эти дурацкие ящики, что они навалили перед входом, не смогут остановить орков!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_6 (var c_NPC slf)
{
	DIA_OCVLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
