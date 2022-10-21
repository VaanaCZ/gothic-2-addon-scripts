
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_DiegoNW_EXIT(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 999;
	condition	= DIA_DiegoNW_EXIT_Condition;
	information	= DIA_DiegoNW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_DiegoNW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//######################################
//##
//##	Permanent Info
//##
//######################################


// ************************************************************
// 	  	  Wie laufen die Geschäfte? (perm)
// ************************************************************

INSTANCE DIA_DiegoNW_Perm(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 998;
	condition	= DIA_DiegoNW_Perm_Condition;
	information	= DIA_DiegoNW_Perm_Info;
	permanent	= TRUE;

	description = "Comment vont les affaires ?";
};                       
FUNC INT DIA_DiegoNW_Perm_Condition()
{
	if (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_00"); //Comment vont les affaires ?
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_01"); //Mal. Quelqu'un aurait dû me dire que tout était parti à vau-l'eau à Khorinis en mon absence.
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_02"); //Vraiment ? Moi, je l'ai toujours connue comme ça.
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_03"); //Vous auriez dû la voir il y a quelques années de ça. Sûr que vous vous y seriez plu.
};


//######################################
//##
//##	Kapitel 3
//##
//######################################

// ************************************************************
// 	  	  Ich brauche deine Hilfe.
// ************************************************************

INSTANCE DIA_DiegoNW_NeedHelp(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 1;
	condition	= DIA_DiegoNW_NeedHelp_Condition;
	information	= DIA_DiegoNW_NeedHelp_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_DiegoNW_NeedHelp_Condition()
{
	if (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_NeedHelp_Info()
{	
	if (Diego_IsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_01"); //Là, vous semblez complètement atterré.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_02"); //(rit) Vous croyiez que je m'étais fait avoir, n'est-ce pas ?
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_03"); //Je suis resté inconscient un moment. Mais, comme vous pouvez le voir, je suis toujours vivant.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_04"); //Ce qui est le plus important c'est que nous soyons tous les deux ici maintenant.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_05"); //Vous devez m'aider.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_11_00"); //C'est bien que vous soyez ici. Il faut que vous m'aidiez.
	};
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	
	if (DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	//	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Wer bist du?",DIA_DiegoNW_NeedHelp_WhoAreYou);//Joly:macht keinen Sinn. Ohne mit Diego gesprochen zu haben -> Kein DiegoNW !! Hauptstory Kapitel 2 OW!!!!
	};
	
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Quel genre de vêtements est-ce ?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Que faites-vous ici ?",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Qu'est-ce que cela signifie ?",DIA_DiegoNW_NeedHelp_Problem);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Plan_15_00"); //Que faites-vous ici ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_01"); //J'observe les gardes. Ils sont en alerte permanente.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_02"); //On dirait que je vais avoir du mal à passer.
};

FUNC VOID DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00"); //Qui êtes-vous ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01"); //C'est à cause de mes habits, sûrement. Les gardes ne me laisseront jamais entrer.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02"); //C'est pour ça que j'ai acheté ces fringues à un marchand en dehors de la ville. Vous me remettez maintenant ? C'est moi, Diego.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03"); //En taule, c'est moi qui vous ai appris comment survivre.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04"); //Vous n'avez quand même pas oublié tout ça, si ?
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05"); //Euh... que s'est-il passé, au juste ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06"); //C'est dingue ! Vous ne vous souvenez vraiment plus de rien !
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07"); //Ecoutez, je n'ai pas le temps de tout vous expliquer maintenant. Sachez juste ceci : on était amis, autrefois, et je vous ai sauvé la vie à plusieurs reprises.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08"); //Et maintenant c'est moi qui ai besoin de votre aide.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_00"); //Qu'est-ce que c'est que ces habits ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01"); //Je les ai achetés à un marchand, en dehors de la ville. Quand j'ai essayé d'entrer pour la première fois, les gardes ont refusé de me laisser passer.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02"); //Et puis, tout le monde n'a pas besoin de savoir d'où je viens.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_03"); //Vous n'avez pas tort.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04"); //C'est ainsi que je vois les choses. Mais je reste celui que j'étais, même si je me suis temporairement débarrassé de ma tenue des ombres.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05"); //Et j'ai de grandes ambitions pour cette ville.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_00"); //C'est-à-dire ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_01"); //Beaucoup de choses ont changé depuis mon départ. Il va me falloir retrouver mes repères.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_02"); //Quel est le problème ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_03"); //Je dois aller au haut quartier.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_04"); //Mais je ne suis pas un habitant de la ville et je n'ai pas de quoi acheter les gardes. Et c'est là que vous intervenez.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_05"); //Vous voulez que je vous prête de l'or ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_06"); //Pas du tout ! J'ai de l'or, même largement assez. Malheureusement, je ne l'ai pas sur moi.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_07"); //Il faudrait que vous alliez me le chercher.
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Je n'ai pas le temps.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Et qu’est-ce que j'ai à y gagner ?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Très bien, je vous aiderai.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00"); //Je n'ai pas de temps à perdre avec ça.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01"); //Hé ! Je croyais qu'on était amis ! C'est bien moi qui vous ai sauvé la mise quand on vous a balancé à la colonie, non ?
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02"); //Là, vous exagérez.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03"); //Vraiment ? Dans ce cas, pensez à ce qui se serait produit si je ne vous avais pas expliqué comment vous comporter à l'époque.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04"); //Les barons miniers vous auraient croqué au petit déjeuner et vous auriez croupi dans leurs mines jusqu'à ce que mort s'ensuive.

	MIS_HelpDiegoNW = LOG_FAILED;
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00"); //Et qu'est-ce que j'ai à y gagner ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01"); //Vous ai-je déjà demandé ce que j'attendais de vous en retour ? Jamais. On est amis, ça devrait suffire, non ?
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00"); //Très bien, j'accepte de vous aider.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01"); //Bon. Écoutez. Du temps où la Barrière était encore là, j'ai caché un petit trésor.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02"); //Cela fait un moment. Voilà pourquoi j'ai oublié de le prendre avec moi.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03"); //Et je ne peux absolument pas partir en ce moment.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03"); //Bref, en un mot comme en cent, il faudrait que vous alliez récupérer mon or dans la Vallée des mines.

	MIS_HelpDiegoNW = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"L'or de Diego est dans la Vallée des mines. Il en a besoin pour accéder au haut quartier et il m'a envoyé le chercher.");
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Que comptez-vous faire avec l'or ?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Où avez-vous trouvé tout cet or ?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Où est caché l'or ?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00"); //Qu'est-ce que vous comptez faire avec cet argent ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01"); //J'ai un compte à régler avec un marchand du haut quartier. Il faut que je commence par là.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02"); //Et après ma nouvelle carrière pourra débuter.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00"); //Où avez-vous trouvé tout cet or ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01"); //Suis-je donc le seul qui a pensé à mettre un peu d'argent de côté dans la Vallée des mines ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02"); //Je me suis mis quelques pépites dans la poche, des fois que nous arrivions à en sortir un jour...
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03"); //Tout le monde était tellement intéressé par ce minerai à cette époque que personne ne s'intéressait à l'or. 
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00"); //Où cet or est-il caché ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01"); //Sur la place d'échange, au-dessus de la mine abandonnée. Dans une sacoche en cuir.
	if (Diego_angekommen == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01"); //Gardez vos réflexions pour vous. Je sais bien que nous avons dû pratiquement passer devant.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02"); //Apportez-moi seulement la sacoche.
	};
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02"); //Mais prenez bien la bonne surtout. Ce serait trop bête d'aller jusque-là pour rien !
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03"); //Comment puis-je la reconnaître ?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04"); //Elle est pleine d'or, tout simplement.
					
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Je vais essayer de trouver votre or.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);		
	
	B_LogEntry (TOPIC_HelpDiegoNW,"L'or de Diego est quelque part sur la vieille place du marché d'où l'on envoyait les marchandises vers la colonie par un système de câble passant au-dessus de la mine abandonnée.");
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00"); //Je vais essayer de vous ramener ça.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01"); //(sourit) N'essayez pas, faite-le.

	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
};

//***********************************************
//	Ok, ich werde dir doch helfen.
//***********************************************

INSTANCE DIA_DiegoNW_HelpYou(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 30;
	condition	= DIA_DiegoNW_HelpYou_Condition;
	information	= DIA_DiegoNW_HelpYou_Info;
	permanent	= FALSE;
	description	= "Très bien, après tout je vous aiderai.";
};                       
FUNC INT DIA_DiegoNW_HelpYou_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (MIS_HElpDiegoNW == LOG_FAILED) 
	&& (Diego_IsOnBOard != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_HelpYou_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_00"); //D'accord, j'accepte de vous aider.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_01"); //Je le savais.
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_02"); //Bien, parlons affaires.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_03"); //Très bien. J'ai caché un trésor dans la Vallée des mines et je voudrais que vous alliez le chercher à ma place.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_06"); //Pendant ce temps, je resterai là et je préparerai tout.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();

	MIS_HelpDiegoNW = LOG_RUNNING;
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"L'or de Diego est dans la Vallée des mines. Il en a besoin pour accéder au haut quartier et il m'a envoyé le chercher.");
};

//***********************************************
//	Ich habe dein Gold gefunden!
//***********************************************

INSTANCE DIA_DiegoNW_HaveYourGold(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 31;
	condition	= DIA_DiegoNW_HaveYourGold_Condition;
	information	= DIA_DiegoNW_HaveYourGold_Info;
	permanent	= TRUE;
	description	= "J'ai trouvé votre or !";
};            

FUNC INT DIA_DiegoNW_HaveYourGold_Condition()
{
	if ((OpenedDiegosBag == TRUE)
	|| (Npc_HasItems (other,ItSe_DiegosTreasure_Mis) >=1))
	&& (MIS_HelpDiegoNW == LOG_RUNNING)
	&& (Diego_IsOnBOard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID B_DIEGONW_DIEGOSREVENGE ()
{
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_05"); //Parfait ! Gerbrandt peut maintenant commencer à numéroter ses abattis.
};

var int DiegosRevenge;

FUNC VOID DIA_DiegoNW_HaveYourGold_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_HaveYourGold_15_00"); //J'ai trouvé votre or.
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_01"); //Excellent ! Montrez-moi ça.
	
	IF (Npc_HasItems (other,ItSe_DiegosTreasure_Mis) >=1)
	{
		B_GiveInvItems (other,self ,ItSe_DiegosTreasure_Mis,1);
		B_DIEGONW_DIEGOSREVENGE ();
		DiegosRevenge = TRUE;
	}
	else if (Npc_HasItems (other,ItMi_Gold < DiegosTreasure))
	{
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_02"); //Mais il n'y a pas tout ! Vous ne me faites pas confiance, ou quoi ? J'ai besoin de la totalité !
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_03"); //Si mon plan fonctionne, il en restera bien assez pour vous après.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_04"); //Veillez bien à tout me ramener, c'est important.
	}
	else
	{
		B_GiveInvItems (other,self ,ItMi_Gold,DiegosTreasure);
		B_DIEGONW_DIEGOSREVENGE ();
		DiegosRevenge = TRUE;
	};	
	
	if (Npc_IsDead (Gerbrandt) == FALSE)
	&& (DiegosRevenge == TRUE)
	{
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_06"); //Ecoutez, il faut encore que je m'occupe des gardes.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_07"); //Il faudrait que vous apportiez cette lettre à Gerbrandt, l'un des marchands du haut quartier.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_08"); //Dites-lui bonjour de ma part. Je vous retrouve devant chez lui.

		CreateInvItems (self ,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems (self,other,ItWr_DiegosLetter_MIS,1);
		
		B_StartOtherRoutine (Gerbrandt,"WaitForDiego");
		
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_RUNNING;
		B_GivePlayerXP (XP_HelpDiegoNW);

		Log_CreateTopic (TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_DiegosResidence,LOG_RUNNING);
		B_LogEntry (TOPIC_DiegosResidence,"Diego m'a remis une lettre pour le marchand Gerbrandt.");
		
		AI_StopProcessInfos (self);
	};		
		
	
};


//***********************************************
//	Ich habe den Brief abgeliefert.
//***********************************************

INSTANCE DIA_DiegoNW_DeliveredLetter(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 30;
	condition	= DIA_DiegoNW_DeliveredLetter_Condition;
	information	= DIA_DiegoNW_DeliveredLetter_Info;
	permanent	= FALSE;
	description	= "J'ai remis la lettre.";
};
                       
FUNC INT DIA_DiegoNW_DeliveredLetter_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (MIS_DiegosResidence == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_Info()
{
		
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_00"); //J'ai apporté votre lettre à Gerbrandt.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_01"); //Très bien. Comment l'a-t-il prise ?
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_02"); //Il m'a semblé très choqué et il s'est excusé sans perdre un instant.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_03"); //(satisfait) Ça, je veux bien le croire.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_04"); //Je crains qu'il me faille commencer par meubler mon nouveau domicile. Si ma mémoire est bonne, Gerbrandt a un goût affreux.
	  
	B_GivePlayerXP (XP_DiegoHasANewHome);

	Wld_AssignRoomToGuild ("reich01",		GIL_PUBLIC);

	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"Alors comment avez-vous fait ?",DIA_DiegoNW_DeliveredLetter_YourTrick);	
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"Alors, la maison est à vous ?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_Gerbrandt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00"); //Qu'est-ce que c'est que cette histoire à propos de Gerbrandt ?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01"); //Ça fait bien trop longtemps qu'il mène la grande vie.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02"); //Lui vivait dans le luxe et l'opulence, tandis que moi, je bouffais du ragoût d'insectes.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03"); //J'ignore où il a bien pu partir, mais ce que je sais, c'est qu'il ne reviendra jamais à Khorinis. J'y veillerai.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04"); //Si vous le cherchez, essayez dans le quartier du port.
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00"); //Cette maison est à vous ?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01"); //Oui, de la cave au grenier, meubles inclus.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02"); //Et après plusieurs années passées à vivre dans des quartiers pour le moins spartiates, j'attends avec délectation ma première nuit dans un lit à baldaquin.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03"); //Et, en guise de petit déjeuner, je pense que je prendrai un peu d'excellent jambon, arrosé d'un grand cru.
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04"); //Vous ne vous en faites pas, vous.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05"); //Ça, c'est clair !
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00"); //Comment avez-vous réussi ?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01"); //Pensiez-vous que Gerbrandt s'était enrichi de façon honnête ?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02"); //Bien évidemment, il ne s'est jamais sali les mains lui-même puisqu'il avait quelqu'un pour se charger des basses besognes à sa place.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03"); //Mais cette période m'a permis de beaucoup apprendre. Et puis, au bout du compte, il s'est débarrassé de moi. Sans doute craignait-il que j'en sache trop.
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04"); //Vous ne m'aviez jamais parlé de ça.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05"); //Vous ne me l'aviez pas demandé.
	
	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,DIALOG_BACK,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"Et ma part ?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"Et en ce qui concerne Gerbrandt ?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
}; 

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{

	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00"); //Et ma part ?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01"); //On dirait que vous n'avez pas oublié tout ce que je vous ai appris, finalement.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02"); //Mais vous avez raison, je n'y serais pas arrivé sans vous. Tenez, voici votre part.
	
	CreateInvItems (self ,ItMi_Gold,500);
	B_GiveInvItems (self,other,ItMi_Gold,500);
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
};


// ************************************************************
// 	  	  Kannst du mir was beibringen?
// ************************************************************

//---------------------------
var int Diego_Teach;
//---------------------------

INSTANCE DIA_DiegoNW_CanYouTeach(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 995;
	condition	= DIA_DiegoNW_CanYouTeach_Condition;
	information	= DIA_DiegoNW_CanYouTeach_Info;
	permanent	= TRUE;

	description = "Pouvez-vous m'enseigner quelque chose ?";
};                       
FUNC INT DIA_DiegoNW_CanYouTeach_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_CanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_CanYouTeach_15_00"); //Pouvez-vous m'apprendre quelque chose ?
	if (Npc_KnowsInfo (other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_01"); //Bien sûr. Prévenez-moi quand vous serez prêt.
		
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_02"); //J'ai d'abord une affaire à régler.
	};
};



// ************************************************************
// 	  	  Bring mir was bei.
// ************************************************************

//-----------------------
var int DiegoNW_Merke_DEX;
//-------------------------

INSTANCE DIA_DiegoNW_Teach(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 995;
	condition	= DIA_DiegoNW_Teach_Condition;
	information	= DIA_DiegoNW_Teach_Info;
	permanent	= TRUE;

	description = "Apprenez-moi quelque chose.";
};                       
FUNC INT DIA_DiegoNW_Teach_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_Teach_15_00"); //Apprenez-moi.
	AI_Output (self ,other,"DIA_DiegoNW_Teach_11_01"); //Je peux vous apprendre à devenir plus agile.
	
	DiegoNW_Merke_Dex = other.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if (DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_DiegoNW_Teach_BACK_11_00"); //Vous êtes déjà plus agile. Continuez comme ça !
	};
	Info_ClearChoices	(DIA_DiegoNW_Teach);
};

// ------ 1 Geschick -----
func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);

	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

// ------ 5 Geschick ------
func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

//######################################
//##
//##	Kapitel 5
//##
//######################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_KnowWhereEnemy_Condition;
	information	 = 	DIA_DiegoNW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Je vais quitter Khorinis.";
};

func int DIA_DiegoNW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_DiegoNW_KnowWhereEnemy_15_00"); //Je vais quitter Khorinis.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_01"); //Voilà une sage décision. J'aimerais bien pouvoir vous accompagner. Cette ville a trop changé et l'époque où il était possible de s'y enrichir rapidement est révolue.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_02"); //Je peux vous apprendre à devenir plus agile, mais aussi à tirer à l'arc et à crocheter les serrures.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_03"); //Sinon, je suis sûr que vous auriez bien besoin d'un bon voleur.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry (TOPIC_Crew,"Naturellement, Diego veut venir. A son point de vue, plus vite il quittera Khorinis, mieux ce sera. Il peut me montrer comment améliorer ma dextérité et m'entraîner au maniement de l'arc. Il peut aussi m'apprendre comment crocheter les serrures.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_DiegoNW_KnowWhereEnemy_15_04"); //Je vais y réfléchir. Pour le moment, mon équipage est au complet.
		AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_05"); //Prenez votre temps. Je ne vais nulle part.
	}
	else 
	{
		Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"Peut-être vous ferai-je savoir quand le temps sera venu.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"Vous ne voulez pas venir ?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_DiegoNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00"); //Pourquoi ne viendriez-vous pas avec moi ? Nous pourrions nous rejoindre au port.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01"); //Hmm... vous avez raison, Khorinis est un trou paumé. Je vous accompagne.
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02"); //Attendez, je serai prêt dans un instant.
		AI_SetWalkmode 	(self, NPC_WALK);		
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_Wait (self ,1);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03"); //Je suis prêt. Je vous rejoins au bateau.
	
	
	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};

	Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
};

FUNC VOID DIA_DiegoNW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_No_15_00"); //Je vous tiendrai au courant quand le moment sera venu.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01"); //Faites. Et peut-être même que je vous accompagnerai. Qui sait ?

	Diego_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_LeaveMyShip_Condition;
	information	 = 	DIA_DiegoNW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Veillez sur la ville.";
};
func int DIA_DiegoNW_LeaveMyShip_Condition ()
{	
	if (Diego_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_DiegoNW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_00"); //Prenez soin de la ville.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_01"); //C'est vrai, vous n'avez plus besoin de moi ? Bon. Mais n'oubliez pas de venir me dire bonjour quand vous serez de passage, hein ?
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_02"); //Vous croyez que nous nous reverrons un jour ?
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_03"); //Je n'oublierai jamais votre tête le jour où on s'est rencontrés, quand Bullit venait de vous balancer à terre.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_04"); //Personne ne peut vous battre. Sûr qu'on se reverra ! Prenez bien soin de vous surtout.
	
	
	Diego_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_StillNeedYou_Condition;
	information	 = 	DIA_DiegoNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Revenez. Je veux que vous m'accompagniez.";
};

func int DIA_DiegoNW_StillNeedYou_Condition ()
{	
	if ((Diego_IsOnBOard == LOG_OBSOLETE)	
	|| (Diego_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_DiegoNW_StillNeedYou_15_00"); //Revenez. J'aimerais que vous m'accompagniez.
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_01"); //Eh bien, qu'est devenue votre détermination, mon ami ? Je veux bien vous accompagner, mais décidez-vous.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_StillNeedYou_11_02"); //Attendez, je serai prêt dans un instant.
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_03"); //Très bien, on peut y aller.
	
	AI_StopProcessInfos (self);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thief_NW_PICKPOCKET (C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 900;
	condition	= DIA_Thief_NW_PICKPOCKET_Condition;
	information	= DIA_Thief_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Thief_NW_PICKPOCKET_Condition()
{
	C_Beklauen (120, 600);
};
 
FUNC VOID DIA_Thief_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Thief_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thief_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thief_NW_PICKPOCKET);
};
	
func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thief_NW_PICKPOCKET);
};


