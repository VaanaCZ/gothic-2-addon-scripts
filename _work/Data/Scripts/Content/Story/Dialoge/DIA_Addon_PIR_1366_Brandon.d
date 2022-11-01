// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Brandon_EXIT(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 999;
	condition	= DIA_Addon_Brandon_EXIT_Condition;
	information	= DIA_Addon_Brandon_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Brandon_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Brandon_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo 
// ************************************************************
INSTANCE DIA_Addon_Brandon_Hello(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 1;
	condition	= DIA_Addon_Brandon_Hello_Condition;
	information	= DIA_Addon_Brandon_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Brandon_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Brandon_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Brandon_Hello_04_00"); //Voyez-vous ça. Un blanc-bec.
	AI_Output (self ,other,"DIA_Addon_Brandon_Hello_04_01"); //Et un marin d'eau douce, en plus !
	AI_Output (self ,other,"DIA_Addon_Brandon_Hello_04_02"); //Vous avez l'air un peu maigrichon pour un pirate.
};

// ************************************************************
// 							PERM 
// ************************************************************
INSTANCE DIA_Addon_Brandon_AnyNews(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 99;
	condition	= DIA_Addon_Brandon_AnyNews_Condition;
	information	= DIA_Addon_Brandon_AnyNews_Info;
	permanent	= TRUE;
	description = "Des nouvelles ?";
};                       
FUNC INT DIA_Addon_Brandon_AnyNews_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Brandon_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_AnyNews_15_00"); //Du nouveau ?
	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output (self ,other,"DIA_Addon_Brandon_Alright_04_01"); //On peut le dire. Je suis blessé. Auriez-vous une potion de soins en trop ?
		}
		else
		{
			if (C_AllCanyonRazorDead() == FALSE)
			{
				AI_Output (self ,other,"DIA_Addon_Brandon_Alright_04_02"); //Bon alors ? On va les démolir, ces bêtes ou quoi ?
			}
			else //alle platt
			{
				AI_Output (self ,other,"DIA_Addon_Brandon_Alright_04_03"); //Quelle question ! Je crois qu'il ne reste pas une seule Lame dans tout ce fichu canyon.
			};
		};
	}
	else if (GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg))
	&& (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_AnyNews_04_04"); //Non, mais maintenant que Greg est revenu, j'espère que ça va changer.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_AnyNews_04_06"); //(conspirateur) Attendez une seconde.
		AI_PlayAni (self, "T_SEARCH");
		AI_Output (self ,other,"DIA_Addon_Brandon_AnyNews_04_07"); //(rit) Pas aussi loin que je puisse voir. C'est comme avant, pareil !
	};
};



// ************************************************************
// ***														***
// 			  			Teach STR und DEX
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Wanna Learn
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_WannaLearn (C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 11;
	condition	= DIA_Addon_Brandon_WannaLearn_Condition;
	information	= DIA_Addon_Brandon_WannaLearn_Info;

	description = "Pouvez-vous m'enseigner quelque chose ?";
};                       
FUNC INT DIA_Addon_Brandon_WannaLearn_Condition()
{
	return TRUE;
};
func void DIA_Addon_Brandon_WannaLearn_Info()
{
	AI_Output (other, self,"DIA_Addon_Brandon_WannaLearn_15_00"); //Pouvez-vous m'apprendre quelque chose ?
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_01"); //Vous apprendre quelque chose ? Bien sûr ! Je peux vous apprendre à devenir plus fort et à améliorer votre dextérité.
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_02"); //Mais pourquoi le ferais-je ?
	AI_Output (other,self ,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00"); //Parce que je vous paye un verre ?
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_03"); //(sourit) Pas mal, petit. C'est bien vu.
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_04"); //Mais ne vous fatiguez pas à me rapporter de la bibine à deux sous.
	MIS_Brandon_BringHering = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry		(Topic_Addon_PIR_Teacher,Log_Text_Addon_BrandonTeach);
	
	Log_CreateTopic (TOPIC_Addon_BrandonBooze,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BrandonBooze,LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_BrandonBooze,"Je dois payer un coup à boire à Brandon. Ensuite seulement, il sera prêt à me former.");
};

// ------------------------------------------------------------
// 						Hole Grog
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_HoleGrog (C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 12;
	condition	= DIA_Addon_Brandon_HoleGrog_Condition;
	information	= DIA_Addon_Brandon_HoleGrog_Info;

	description = "Je vais vous chercher du tafia.";
};                       
FUNC INT DIA_Addon_Brandon_HoleGrog_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};
func void DIA_Addon_Brandon_HoleGrog_Info()
{
	AI_Output (other,self ,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00"); //Je vais vous chercher du tafia.
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_01"); //Vous voulez m'empoisonner ?
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_02"); //Je ne touche pas à ça ! Vous savez ce qu'il ya dedans ?
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_03"); //Le vieux Samuel a de meilleures bouteilles ! C'est ça que je veux !
	if (Player_KnowsSchnellerHering == TRUE)
	{
		AI_Output (other,self ,"DIA_Addon_Brandon_Hello_15_05"); //Vous voulez parler de son Hareng Pressé ?
		AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_04"); //Voilà. C'est exactement ça.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_05"); //Vous avez déjà essayé la recette spéciale de Samuel ?
		AI_Output (other,self ,"DIA_Addon_Brandon_Hello_15_07"); //Non, pas encore.
		AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_06"); //Vous devriez. Il ne faut pas rater ça !
	};
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_08"); //J'adore cette recette !
	
	B_LogEntry (TOPIC_Addon_BrandonBooze,"Un simple tafia ne suffit pas à Brandon. Il demande un 'Hareng pressé'. Seul Samuel possède cette boisson.");
};
// ------------------------------------------------------------
// 					Schnellen Hering geben
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_SchnellerHering (C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 13;
	condition	= DIA_Addon_Brandon_SchnellerHering_Condition;
	information	= DIA_Addon_Brandon_SchnellerHering_Info;

	description = "Goûtez-moi ce Hareng pressé !";
};                       
FUNC INT DIA_Addon_Brandon_SchnellerHering_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Brandon_WannaLearn))
	&& (Npc_HasItems (other, ItFo_Addon_SchnellerHering) > 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Brandon_SchnellerHering_Info()
{
	AI_Output (other,self ,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00"); //Voilà.
	B_GiveInvItems (other, self, ItFo_Addon_Schnellerhering, 1);
	B_UseItem (self, ItFo_Addon_Schnellerhering);
	AI_Output (self ,other,"DIA_Addon_Brandon_GiveGrog_04_01"); //Ahh ! Ça vous glisse au fond de la cale comme du feu liquide !
	
	B_LogEntry (TOPIC_Addon_BrandonBooze,"J'ai donné cet affreux tord-boyaux à Brandon. Maintenant, il est prêt à me former.");
	
	MIS_Brandon_BringHering = LOG_SUCCESS;
	B_GivePlayerXP (XP_AMBIENT);
};


// ------------------------------------------------------------
// 			 Bring mir was bei! 
// ------------------------------------------------------------
var int	Brandon_Merke_Str;
var int	Brandon_Merke_Dex;
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_TeachPlayer(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 777;
	condition	= DIA_Addon_Brandon_TeachPlayer_Condition;
	information	= DIA_Addon_Brandon_TeachPlayer_Info;
	permanent	= TRUE;
	description = "Apprenez-moi quelque chose !";
};                       
FUNC INT DIA_Addon_Brandon_TeachPlayer_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Brandon_TeachPlayer_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_TeachPlayer_15_00"); //Apprenez-moi quelque chose !
	
	Brandon_Merke_Str = other.attribute[ATR_STRENGTH];
	Brandon_Merke_Dex = other.attribute[ATR_DEXTERITY];
	
	if MIS_Brandon_BringHering == LOG_SUCCESS
	{
		Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TeachPlayer_04_01"); //Vous deviez m'apportez une boisson digne de ce nom, jeune homme !
	};
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_Back()
{
	if other.attribute[ATR_STRENGTH] > Brandon_Merke_Str
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00"); //C'est bon ! Vous êtes déjà un peu plus fort.
	};
	
	if other.attribute[ATR_DEXTERITY] > Brandon_Merke_Dex
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01"); //Plus votre dextérité est bonne, plus vous avez de chance de toucher vos adversaires.
	};
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_DEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);	
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_DEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);	
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_STR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_STR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);	
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Brandon_Anheuern(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 11;
	condition	= DIA_Addon_Brandon_Anheuern_Condition;
	information	= DIA_Addon_Brandon_Anheuern_Info;
	permanent	= FALSE;
	description = "Vous êtes supposé m'aider.";
};                       
FUNC INT DIA_Addon_Brandon_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Brandon_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_FollowMe_15_00"); //Vous êtes supposé m'aider.
	AI_Output (self ,other,"DIA_Addon_Brandon_Anheuern_04_01"); //Première nouvelle. Qui a dit ça ?
	AI_Output (other,self ,"DIA_Addon_Brandon_FollowMe_15_02"); //C'est Greg qui le dit. On va aller chasser les Lames dans le canyon.
	AI_Output (self ,other,"DIA_Addon_Brandon_Anheuern_04_03"); //(sourit) Il se passe enfin quelque chose !
	AI_Output (self ,other,"DIA_Addon_Brandon_Anheuern_04_04"); //Alors, allons-y tout de suite. Plus vite on aura réglé leur compte à ces bestioles, plus vite on sera rentrés.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Brandon_ComeOn(C_INFO)
{
	npc			= 	PIR_1366_Addon_Brandon;
	nr		 	= 	12;
	condition	= 	DIA_Addon_Brandon_ComeOn_Condition;
	information	= 	DIA_Addon_Brandon_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Venez avec moi.";
};
func int DIA_Addon_Brandon_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Brandon_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Brandon_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Brandon_Weiter_15_00"); //Venez avec moi.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_ComeOn_04_02"); //On ne pourrait pas revenir un peu en arrière ?
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_ComeOn_04_01"); //Je suis là !
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_GoHome(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 13;
	condition	= DIA_Addon_Brandon_GoHome_Condition;
	information	= DIA_Addon_Brandon_GoHome_Info;
	permanent	= TRUE;
	description = "Je n'ai plus besoin de vous.";
};                       
FUNC INT DIA_Addon_Brandon_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Brandon_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_DontNeedYou_15_00"); //Je n'ai plus besoin de vous.
	AI_Output (self ,other,"DIA_Addon_Brandon_GoHome_04_01"); //D'accord. Pas de problème.
	AI_Output (self ,other,"DIA_Addon_Brandon_GoHome_04_02"); //On pourrait prendre un verre ensemble un de ces soirs.

	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_TooFar(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 14;
	condition	= DIA_Addon_Brandon_TooFar_Condition;
	information	= DIA_Addon_Brandon_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Brandon_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Brandon_TooFar_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Brandon_TooFar_04_00"); //Ça suffit comme ça ! Vous voulez décimer toute l'île ?
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TooFar_04_01"); //On retourne au camp.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TooFar_04_02"); //Je retourne au camp.	
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};







