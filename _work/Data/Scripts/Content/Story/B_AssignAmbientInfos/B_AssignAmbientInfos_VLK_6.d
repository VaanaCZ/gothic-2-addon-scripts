// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_6_EXIT_Condition;
	information	= DIA_VLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_JOIN_Condition;
	information	= DIA_VLK_6_JOIN_Info;
	permanent	= TRUE;
	description = "Как мне стать гражданином этого города?";
};                       

FUNC INT DIA_VLK_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //Как мне стать гражданином этого города?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //Ты хочешь осесть здесь? Сейчас? Когда все указывает на приближение конца света?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //Я не планировал остаться здесь навечно.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Хочешь совет? Тебе нужно бежать отсюда, и чем дальше, тем лучше. Но, впрочем, если ты настаиваешь, то можешь поговорить с кем-нибудь из влиятельных горожан.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_6_PEOPLE_Condition;
	information	= DIA_VLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "А где мне найти влиятельных граждан Хориниса?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //А где мне найти влиятельных граждан Хориниса?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Попробуй обратиться к кузнецу или плотнику в нижней части города. Там же ты найдешь и других уважаемых мастеров.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //К их словам здесь прислушиваются даже паладины и городская стража.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_6_LOCATION_Condition;
	information	= DIA_VLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Как мне научиться ориентироваться в городе?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //Как мне научиться ориентироваться в городе?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //Тебе кажется, что здесь не так-то просто найти дорогу? Даже указатели не всегда помогают?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Если у тебя все так плохо с ориентированием, тебе лучше спуститься в гавань - если ты найдешь путь туда - и поискать дом картографа.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //Он находится рядом с кабаком у причала. У Ибрагима наверняка найдется карта города для тебя.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_6_STANDARD_Condition;
	information	= DIA_VLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Что нового?";
};                       
func INT DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //Что новенького?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //С тех пор, как рухнул Барьер, город заполонили бандиты. Но паладины сидят сложа руки. Что они вообще тогда здесь делают, черт возьми?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Последнее время проблема с бандитами не стоит так остро. Похоже, кто-то, наконец, взялся за них.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Они отпустили этого грязного наемника, убившего паладина. По-моему, лучше его было все же повесить.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //Говорят, что один из наемников Онара убил паладина. Убийцу поймали и бросили за решетку. Скоро его повесят.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //Интересно, есть хоть доля правды в этих рассказах о драконах...
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //Говорят, что лорд Хаген собирает своих людей, чтобы освободить Долину Рудников. Наконец-то паладины зашевелились!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_6 (var c_NPC slf)
{
	DIA_VLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
