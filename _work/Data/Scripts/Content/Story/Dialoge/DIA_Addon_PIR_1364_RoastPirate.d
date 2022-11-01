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
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_06_00"); //Ah, la chaleur du feu donne soif.
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_06_01"); //Hé, avez-vous du tafia ?
	
	Log_CreateTopic (TOPIC_Addon_RoastGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_RoastGrog,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RoastGrog,"Le pirate au coin du feu a vraiment besoin d'un tafia.");
	
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	Info_AddChoice (DIA_Addon_RoastPirate_GimmeGrog,"Non, je n'en ai pas.",DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny);

	if (Npc_HasItems (other,ItFo_addon_Grog) >= 1)
	{
		Info_AddChoice (DIA_Addon_RoastPirate_GimmeGrog,"Tenez, goûtez ça.",DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog);
	};	
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny()
{
	AI_Output (other,self ,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00"); //Non, je n'en ai pas.
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00"); //Aah, je crois bien que je vais mourir de soif.
	
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog()
{
	AI_Output (other,self ,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00"); //Tenez, prenez-en une gorgée.
	B_GiveInvItems (other,self ,ItFo_Addon_Grog,1);
	AI_Output (self ,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01"); //Merci, mon vieux !
	B_UseItem (self,ItFo_Addon_Grog);
	PIR_1364_Grog = TRUE;
	Info_ClearChoices (DIA_Addon_RoastPirate_GimmeGrog);
	B_LogEntry (TOPIC_Addon_RoastGrog,"Le tafia semble lui avoir évité de mourir de soif.");
	
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

	description	= "Quoi de neuf ?";
};
func int DIA_Addon_RoastPirate_SeichtesWasser_Condition ()
{
	return TRUE;
};
func void DIA_Addon_RoastPirate_SeichtesWasser_Info ()
{
	AI_Output	(other, self, "DIA_Addon_PIR_6_SeichtesWasser_15_00"); //Que se passe-t-il ?
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_01"); //Je dois m'occuper de cet équipage de gloutons.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_02"); //C'est pour ça que je passe mes jours et mes nuits à suer devant des casseroles brûlantes.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_03"); //Je ferais mieux de passer la plage et le bord de mer au peigne fin pour trouver des épaves échouées.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_04"); //La semaine dernière, un gros navire marchand s'est drossé contre les récifs au large.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_05"); //Et toutes ses bonnes marchandises sont en train de s'échouer sur la plage.
	AI_Output	(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_06"); //Je souhaite vraiment que quelqu'un vienne me remplacer rapidement.
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
	description = "Que pouvez-vous me dire à propos de Francis ?";
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
	AI_Output (other,self ,"DIA_Addon_PIR_6_FRANCIS_15_00"); //Que pouvez-vous me dire à propos de Francis ?
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_01"); //Francis ? Il joue au capitaine. Mais attendez un peu que Greg revienne.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_02"); //Il ira se cacher sous un rocher comme le vulgaire asticot qu'il est.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_04"); //Il nous fait un numéro, si vous voulez savoir. Et je parie qu'il s'en met plein les poches.
	AI_Output (self ,other,"DIA_Addon_PIR_6_Francis_06_05"); //Je ne vous ai rien dit. Tant qu'il n'y a pas de preuves, n'allez parler de ça à personne.
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
	description = "Et à part ça ?";
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
	AI_Output (other,self ,"DIA_Addon_Matt_Job_15_00"); //Autre chose ?
	
	var int randy;
	randy = Hlp_Random (3);
	
	if (GregIsBack == TRUE)
	{
		if (randy == 0)
		&& (!Npc_IsDead(Francis))
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_02"); //Si j'étais Greg, je balancerais Francis dans le marais.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_03"); //Maintenant que Greg est revenu, les bandits vont réfléchir à deux fois avant de s'attaquer à nous.
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_01"); //Il y a plus de travail depuis que Greg est revenu, mais au moins on est payé correctement.
		};
	}
	else
	{
		if (randy == 0)
		&& (!Npc_IsDead(Francis))
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_06"); //Francis est complètement nul. Tout part à vau-l'eau depuis qu'il dirige le camp.
		}
		else if (randy == 1)
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_05"); //Qu'ils viennent donc attaquer, ces bandits. Ils ne vont pas comprendre ce qui leur arrive.
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_PIR_6_Chef_06_04"); //Si Greg ne tarde pas à revenir. Je veux  reprendre enfin la mer.
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
	description = "Vous êtes supposé m'aider.";
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
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_01"); //Vous êtes supposé m'aider.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_03"); //Ordre de Greg.
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
	description	= "Venez avec moi.";
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
	AI_Output	(other, self, "DIA_Addon_RoastPirate_ComeOn_15_00"); //Venez avec moi.
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
	description = "Je n'ai plus besoin de vous.";
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
	AI_Output (other,self ,"DIA_Addon_RoastPirate_GoHome_15_00"); //Je n'ai plus besoin de vous.
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


		







