// ************************************************************
// 								Exit
// ************************************************************
instance DIA_Addon_RoastPirate_EXIT(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 999;
	condition	= DIA_Addon_RoastPirate_EXIT_Condition;
	information	= DIA_Addon_RoastPirate_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_Addon_RoastPirate_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_RoastPirate_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Diese Hitze
// ************************************************************
var int PIR_1364_Grog;
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_GimmeGrog(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 1;
	condition	= DIA_Addon_RoastPirate_GimmeGrog_Condition;
	information	= DIA_Addon_RoastPirate_GimmeGrog_Info;
	permanent	= TRUE;
	Important 	= TRUE;
};                       
func INT DIA_Addon_RoastPirate_GimmeGrog_Condition()
{
	if (Npc_IsInState (self,ZS_Talk) == TRUE)
	&& (Npc_WasInState (self,ZS_Roast_Scavenger) == TRUE)
	&& (PIR_1364_Grog == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_Info()
{	
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_06_00"); //Жар костра вызывает у меня жажду.
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_06_01"); //У тебя не найдется для меня грога?
	
	Log_CreateTopic (TOPIC_Addon_RoastGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_RoastGrog,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RoastGrog,"Пирату у костра нужен грог.");
	
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	Info_AddChoice (DIA_Addon_RoastPirate_GimmeGrog,"Нет.",DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny);

	if (Npc_HasItems (other,ItFo_addon_Grog) >= 1)
	{
		Info_AddChoice (DIA_Addon_RoastPirate_GimmeGrog,"Вот, глотни.",DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog);
	};	
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny()
{
	AI_Output (other,self ,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00"); //Нет.
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00"); //Проклятье! Умираю от жажды...
	
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog()
{
	AI_Output (other,self ,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00"); //Вот, глотни.
	B_GiveInvItems (other,self ,ItFo_Addon_Grog,1);
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01"); //Спасибо, приятель!
	B_UseItem (self,ItFo_Addon_Grog);
	PIR_1364_Grog = TRUE;
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	B_LogEntry (TOPIC_Addon_RoastGrog,"Грог не дал пирату умереть от жажды.");
	
	Npc_ExchangeRoutine (self, "START");
	
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 					Hallo 2 	(Was machst du?)
// ************************************************************
instance DIA_Addon_RoastPirate_SeichtesWasser	(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr		 	= 2;
	condition	= DIA_Addon_RoastPirate_SeichtesWasser_Condition;
	information	= DIA_Addon_RoastPirate_SeichtesWasser_Info;

	description	= "Как дела?";
};
func int DIA_Addon_RoastPirate_SeichtesWasser_Condition ()
{
	return TRUE;
};
func void DIA_Addon_RoastPirate_SeichtesWasser_Info ()
{
	AI_Output	(other, self, "DIA_Addon_PIR_6_SeichtesWasser_15_00"); //Как дела?
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_01"); //Я должен обслуживать всю эту прожорливую толпу.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_02"); //И поэтому мне приходится целый день стоять здесь, умирая от жары.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_03"); //Я бы лучше побродил по берегу в поисках добычи.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_04"); //На той неделе у берега разбился о рифы торговый корабль.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_05"); //И теперь добро с него выносит на пляж.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_06"); //Очень надеюсь, что кто-нибудь меня скоро сменит.
};

// ************************************************************
// 							Francis	
// ************************************************************
instance DIA_Addon_RoastPirate_Francis(C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 3;
	condition	= DIA_Addon_RoastPirate_Francis_Condition;
	information	= DIA_Addon_RoastPirate_Francis_Info;
	permanent	= FALSE;
	description = "Что ты мне можешь сказать о Фрэнсисе?";
};                       
func INT DIA_Addon_RoastPirate_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};
func VOID DIA_Addon_RoastPirate_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_PIR_6_FRANCIS_15_00"); //Что ты мне можешь сказать о Фрэнсисе?
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_01"); //О Фрэнсисе? Он ведет себя так, будто он - наш капитан. Но ничего, вот вернется Грег...
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_02"); //Фрэнсис сразу же забьется в свой темный угол.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_04"); //Этот червяк обманывает всех и каждого. Уверен, он даже сам у себя крадет.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_05"); //Но я тебе этого не говорил. И до тех пор, пока у тебя не будет доказательств, не стоит его обвинять.
};	

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Addon_RoastPirate_PERM (C_INFO)
{
	npc 		= PIR_1364_Addon_Pirat;
	nr			= 99;
	condition	= DIA_Addon_RoastPirate_PERM_Condition;
	information	= DIA_Addon_RoastPirate_PERM_Info;
	permanent	= TRUE;
	description = "Что-нибудь еще?";
};                       
func INT DIA_Addon_RoastPirate_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_RoastPirate_SeichtesWasser))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_RoastPirate_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_Job_15_00"); //Что-нибудь еще?
	
	var int randy;
	randy = Hlp_Random (3);
	
	if (GregIsBack == TRUE)
	{
		if (randy == 0)
		&& (!Npc_IsDead(Francis))
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_02"); //На месте Грега я бы отправил Фрэнсиса на болото.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_03"); //После возвращения Грега бандиты дважды подумают, прежде чем нападать на нас.
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_01"); //После возвращения Грега у нас стало больше работы, но нам хотя бы платят за нее нормально.
		};
	}
	else
	{
		if (randy == 0)
		&& (!Npc_IsDead(Francis))
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_06"); //Фрэнсис - полный неудачник. С тех пор как он начал командовать, все катится под гору.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_05"); //Пусть эти бандиты нападают. Они даже не поймут, что с ними произошло.
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_04"); //Надеюсь, что Грег скоро вернется. Я соскучился по открытому морю.
		};
	};
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_RoastPirate_Anheuern(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr			= 11;
	condition	= DIA_Addon_RoastPirate_Anheuern_Condition;
	information	= DIA_Addon_RoastPirate_Anheuern_Info;
	permanent	= FALSE;
	description = "Ты должен мне помочь.";
};                       
FUNC INT DIA_Addon_RoastPirate_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_RoastPirate_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_01"); //Ты должен мне помочь.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_03"); //Приказ Грега.
	B_Say(self, other, "$ABS_GOOD");
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_ComeOn(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr		 	= 12;
	condition	= DIA_Addon_RoastPirate_ComeOn_Condition;
	information	= DIA_Addon_RoastPirate_ComeOn_Info;
	permanent	= TRUE;
	description	= "Пойдем со мной.";
};
func int DIA_Addon_RoastPirate_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_RoastPirate_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_RoastPirate_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_RoastPirate_ComeOn_15_00"); //Пойдем со мной.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos (self);
	}
	else
	{
		B_Say(self, other, "$ABS_GOOD");
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_RoastPirate_GoHome(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr			= 13;
	condition	= DIA_Addon_RoastPirate_GoHome_Condition;
	information	= DIA_Addon_RoastPirate_GoHome_Info;
	permanent	= TRUE;
	description = "Ты мне больше не нужен.";
};                       
FUNC INT DIA_Addon_RoastPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_RoastPirate_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_RoastPirate_GoHome_15_00"); //Ты мне больше не нужен.
	B_Say(self, other, "$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_RoastPirate_TooFar(C_INFO)
{
	npc			= PIR_1364_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_RoastPirate_TooFar_Condition;
	information	= DIA_Addon_RoastPirate_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_RoastPirate_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_RoastPirate_TooFar_Info()
{	
	B_Say(self, other, "$RUNAWAY");
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};


		







