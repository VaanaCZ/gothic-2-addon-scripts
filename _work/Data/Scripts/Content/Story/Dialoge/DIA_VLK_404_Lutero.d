// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Lutero_EXIT(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 999;
	condition	= DIA_Lutero_EXIT_Condition;
	information	= DIA_Lutero_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Lutero_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_Lutero_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
	
	if (Lutero_Krallen == LOG_RUNNING)
	&& (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE)
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
	
};
//************************************************************
//	Hallo
//************************************************************
INSTANCE DIA_Lutero_Hallo(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Hallo_Condition;
	information	= DIA_Lutero_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lutero_Hallo_Condition()
{	
	if ((other.guild != GIL_NONE)
	|| (other.guild != GIL_NOV)) 	
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Hallo_Info()
{	
	AI_Output (self ,other,"DIA_Lutero_Hallo_13_00"); //Je me nomme Lutero. Je vends et j'achète toutes sortes de choses.
	AI_Output (other ,self,"DIA_Lutero_Hallo_15_01"); //Quelles marchandises avez-vous à proposer ?
	AI_Output (self ,other,"DIA_Lutero_Hallo_13_02"); //Je me spécialise dans les marchandises rares et inhabituelles. Et jusqu'à aujourd'hui, mes clients sont toujours ressortis satisfaits de ma boutique.
	
	Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, "Lutéro vend des objets rares dans le haut quartier."); 
};
//************************************************************
//	GetLost
//************************************************************
INSTANCE DIA_Lutero_GetLost(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_GetLost_Condition;
	information	= DIA_Lutero_GetLost_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lutero_GetLost_Condition()
{	
	if ((other.guild == GIL_NONE)
	|| (other.guild == GIL_NOV)) 	
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_GetLost_Info()
{	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Lutero_GetLost_13_00"); //Débarrassez-moi le plancher ! Vous n'avez donc rien à faire ? Dans ce cas, allez vous trouver du travail... mais ailleurs !
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_GetLost_13_01"); //Qu'est-ce que vous voulez, novice ? Vous ne devriez pas être au monastère ?
	};
	AI_StopProcessInfos (self);
};
//************************************************************
//	Snapper
//************************************************************
INSTANCE DIA_Lutero_Snapper(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Snapper_Condition;
	information	= DIA_Lutero_Snapper_Info;
	permanent	= FALSE;
	description = "Recherchez-vous quelque chose de particulier ?";
};                       

FUNC INT DIA_Lutero_Snapper_Condition()
{	
	if (other.guild != GIL_NONE)
	&& (other.guild != GIL_NOV) 	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Snapper_Info()
{	
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_00"); //Est-ce que vous êtes à la recherche d'un objet particulier ?
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_01"); //Oui. A l'heure actuelle, j'ai besoin de griffes de saurinide.
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_02"); //Mais pas de n'importe quelles griffes. Il faut qu'elles aient appartenu à l'un d'entre eux qui a déjà tué plusieurs humains, ou quelque chose du même genre.
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_03"); //Où trouve-t-on des saurinides ?
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_04"); //Il y en a quelques-uns sur l'île, mais la plupart vivent dans la Vallée des mines.
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_05"); //Qu'est-ce que j'y gagne ?
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_06"); //Je pourrais vous trouver une pierre runique...
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_07"); //Je pourrais vous procurer un anneau d'invincibilité...
	};
	AI_Output (other ,self,"DIA_Lutero_Hello_15_08"); //Je verrai ce que je peux faire.
	
	Log_CreateTopic (Topic_Lutero,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lutero,LOG_RUNNING);
	B_LogEntry (Topic_Lutero,"Le marchand Lutéro recherche les griffes d'un saurinide particulièrement puissant.");
	
	Lutero_Krallen = LOG_RUNNING;
};
//************************************************************
//	Kralle abliefern
//************************************************************
INSTANCE DIA_Lutero_Kralle(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Kralle_Condition;
	information	= DIA_Lutero_Kralle_Info;
	permanent	= FALSE;
	description = "J'ai des griffes spéciales de saurinide.";
};                       

FUNC INT DIA_Lutero_Kralle_Condition()
{	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	&& (Npc_KnowsInfo (other, DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Kralle_Info()
{	
	AI_Output (other ,self,"DIA_Lutero_Kralle_15_00"); //J'ai les griffes de saurinide que vous cherchiez.
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	AI_Output (self ,other,"DIA_Lutero_Kralle_13_01"); //Mon client sera heureux de l'apprendre.
	B_GiveInvItems (other, self, ItAt_ClawLeader,1);
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_02"); //Je n'ai pas la pierre runique ici, mais je sais où elle se trouve.
		AI_Output (self ,other,"DIA_Lutero_Hello_13_03"); //Partez en direction de l'auberge. A un moment, vous passerez sous un pont.
		AI_Output (self ,other,"DIA_Lutero_Hello_13_04"); //Un ami à moi a déposé une pierre runique dans un coffre caché au fond d'une grotte. En voici la clé.
		B_GiveInvItems (self, other, ITKE_RUNE_MIS,1); 
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_05"); //Voici l'anneau que je vous avais promis.
		B_GiveInvItems (self, other, ItRi_Prot_Total_01,1);
	};
};
//************************************************************
//	Trade
//************************************************************
INSTANCE DIA_Lutero_Trade(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Trade_Condition;
	information	= DIA_Lutero_Trade_Info;
	permanent	= TRUE;
	description = "Montrez-moi vos marchandises.";
	trade		= TRUE;
};                       
FUNC INT DIA_Lutero_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Lutero_Hallo)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Trade_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Lutero_Trade_15_00"); //Montrez-moi vos marchandises.
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lutero_PICKPOCKET (C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 900;
	condition	= DIA_Lutero_PICKPOCKET_Condition;
	information	= DIA_Lutero_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lutero_PICKPOCKET_Condition()
{
	C_Beklauen (58, 65);
};
 
FUNC VOID DIA_Lutero_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lutero_PICKPOCKET);
	Info_AddChoice		(DIA_Lutero_PICKPOCKET, DIALOG_BACK 		,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lutero_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lutero_PICKPOCKET);
};
	
func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lutero_PICKPOCKET);
};


