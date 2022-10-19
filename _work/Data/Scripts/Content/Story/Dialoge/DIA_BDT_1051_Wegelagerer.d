//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_1051_Wegelagerer_EXIT   (C_INFO)
{
	npc         = BDT_1051_Wegelagerer;
	nr          = 999;
	condition   = DIA_1051_Wegelagerer_EXIT_Condition;
	information = DIA_1051_Wegelagerer_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
var int BDT_1051_Wegelagerer_Angriff;

FUNC INT DIA_1051_Wegelagerer_EXIT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_1051_Wegelagerer_Question))
		|| (BDT_1051_Wegelagerer_Angriff == TRUE))

		{
				return TRUE;
		};
};
FUNC VOID DIA_1051_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (BDT_1051_Wegelagerer_Angriff == TRUE)
	{
			self.aivar[AIV_EnemyOverride] = FALSE; 
			BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Was machst ihr hier?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_1051_Wegelagerer_Hello   (C_INFO)
{
	npc         = BDT_1051_Wegelagerer;
	nr          = 4;
	condition   = DIA_Wegelagerer_Hello_Condition;
	information = DIA_Wegelagerer_Hello_Info;
	permanent   = FALSE;
	description = "Что ты делаешь здесь?";
};

FUNC INT DIA_Wegelagerer_Hello_Condition()
{
	if (BDT_1051_Wegelagerer_Angriff == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Wegelagerer_Hello_Info()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Hello_15_00"); //Что вы делаете здесь?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Hello_07_01"); //Что тебе нужно?
};

///////////////////////////////////////////////////////////////////////
//	Ich suche einen Novizen.
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_1051_Wegelagerer_Novice   (C_INFO)
{
	npc         = BDT_1051_Wegelagerer;
	nr          = 4;
	condition   = DIA_Wegelagerer_Novice_Condition;
	information = DIA_Wegelagerer_Novice_Info;
	permanent   = FALSE;
	description = "Я ищу послушника.";
};

FUNC INT DIA_Wegelagerer_Novice_Condition()
{
	if (MIS_Novizenchase == LOG_RUNNING)
		&& (MIS_SCKnowsInnosEyeIsBroken  == FALSE)
		&& (BDT_1051_Wegelagerer_Angriff == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Wegelagerer_Novice_Info()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Novice_15_00"); //Я ищу послушника.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Novice_07_01"); //Очень интересно. Мы тоже кое-кого ищем.

	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Novice,"Кого вы ищете?",DIA_1051_Wegelagerer_Question_Novice_Who);
	
};

///////////////////////////////////////////////////////////////////////
//	War nur ne Frage.
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_1051_Wegelagerer_Question   (C_INFO)
{
	npc         = BDT_1051_Wegelagerer;
	nr          = 4;
	condition   = DIA_Wegelagerer_Question_Condition;
	information = DIA_Wegelagerer_Question_Info;
	permanent   = FALSE;
	description = "Я просто спросил.";
};

FUNC INT DIA_Wegelagerer_Question_Condition()
{
	if (Npc_KnowsInfo (other,DIA_1051_Wegelagerer_Hello))
		&& (BDT_1051_Wegelagerer_Angriff == FALSE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Wegelagerer_Question_Info()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_15_00"); //Я просто спросил.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_01"); //Понятно. Но что ТЫ делаешь здесь?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_02"); //Ладно. Это наша дорога, и мы не любим, когда кто-то беспокоит нас здесь.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	if (MIS_Novizenchase == LOG_RUNNING)
		&& (MIS_SCKnowsInnosEyeIsBroken  == FALSE)
	{
		Info_AddChoice (DIA_1051_Wegelagerer_Question,"Я ищу послушника.",DIA_1051_Wegelagerer_Question_Novice);
	};	
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Это не твое дело.",DIA_1051_Wegelagerer_Question_MyConcern);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Я просто любуюсь природой.",DIA_1051_Wegelagerer_Question_LookAround);
};

FUNC VOID DIA_1051_Wegelagerer_Question_Novice ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_15_00"); //Я ищу послушника.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_07_01"); //Очень интересно. Мы тоже кое-кого ищем.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Кого вы ищете?",DIA_1051_Wegelagerer_Question_Novice_Who);

};	

FUNC VOID DIA_1051_Wegelagerer_Question_Novice_Who ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_Who_15_00"); //И кого же?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_Who_07_01"); //Тебя!
	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);

};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_15_00"); //Это не ваше дело.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_07_01"); //Что ты хочешь этим сказать? Ты нарываешься на неприятности?
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Нет, ничего. Не надо никаких неприятностей.",DIA_1051_Wegelagerer_Question_MyConcern_No);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Если вам так угодно.",DIA_1051_Wegelagerer_Question_MyConcern_Yes);
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_No ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_No_15_00"); //Нет, ничего. Не надо никаких неприятностей.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_No_07_01"); //Понятно, в штаны наложил. А теперь проваливай.
	
	AI_StopProcessInfos (self); //Joly: Ausweg ohne angegriffen zu werden!!!!!!!!!
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_Yes ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00"); //Если вам так угодно.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01"); //Хо-хо, какой наглец.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02"); //Сейчас мы заткнем твою пасть.

	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
};

FUNC VOID DIA_1051_Wegelagerer_Question_LookAround ()
{
	AI_Output	(other,self ,"DIA_1051_Wegelagerer_Question_LookAround_15_00"); //Я просто любуюсь природой.
	AI_Output 	(self ,other,"DIA_1051_Wegelagerer_Question_LookAround_07_01"); //Любуйся дальше, только к нам больше не приставай.
	
	AI_StopProcessInfos (self); //Joly: Ausweg ohne angegriffen zu werden!!!!!!!!!
};

///////////////////////////////////////////////////////////////////////
//	Info Angriff
///////////////////////////////////////////////////////////////////////
instance DIA_Wegelagerer_ANGRIFF		(C_INFO)
{
	npc		 = 	BDT_1051_Wegelagerer;
	nr		 = 	2;
	condition	 = 	DIA_Wegelagerer_ANGRIFF_Condition;
	information	 = 	DIA_Wegelagerer_ANGRIFF_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Wegelagerer_ANGRIFF_Condition ()
{
		var C_NPC Pal;
		Pal = Hlp_GetNpc (BDT_1052_Wegelagerer);

		if 	(Npc_RefuseTalk(self) == FALSE)
			&& ((BDT_1051_Wegelagerer_Angriff == TRUE)	|| (C_NpcIsDown(Pal)))
				{
					return TRUE;
				};
};

func void DIA_Wegelagerer_ANGRIFF_Info ()
{
	AI_Output			(self, other, "DIA_Wegelagerer_ANGRIFF_07_00"); //Сейчас ты получишь.

	AI_StopProcessInfos (self);

	Npc_SetRefuseTalk (self,40);

	self.aivar[AIV_EnemyOverride] = FALSE; 
	BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE; 
};



