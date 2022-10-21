// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Richter_EXIT(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 999;
	condition	= DIA_Richter_EXIT_Condition;
	information	= DIA_Richter_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Richter_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Richter_Hello(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 4;
	condition	= DIA_Richter_Hello_Condition;
	information	= DIA_Richter_Hello_Info;
	permanent	= FALSE;
	description = "Que faites-vous ici ?";
};                       

FUNC INT DIA_Richter_Hello_Condition()
{
	if (MIS_Lee_JudgeRichter == 0)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Richter_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Hello_15_00"); //Que faites-vous ici ?
	AI_Output (self ,other,"DIA_Richter_Hello_10_01"); //Pourquoi m'adressez-vous la parole ? Et qui êtes-vous d'abord ?
	AI_Output (other,self ,"DIA_Richter_Hello_15_02"); //Eh bien, euh...
	AI_Output (self ,other,"DIA_Richter_Hello_10_03"); //On se connaît ?
	
	Info_ClearChoices (DIA_Richter_Hello);
	Info_AddChoice (DIA_Richter_Hello,"Pas que je me souvienne.",DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice (DIA_Richter_Hello,"Peut-être.",DIA_Richter_Hello_MayBe);
};

FUNC VOID DIA_Richter_Hello_DontThinkSo ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_DontThinkSo_15_00"); //Pas que je sache, non.
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_01"); //C'est drôle, j'aurais pourtant juré vous avoir déjà rencontré quelque part...
	AI_Output (self ,other,"DIA_Richter_Hello_DontThinkSo_10_02"); //Sans importance. Vous êtes sans doute une de ces raclures de caniveau. Vous vous ressemblez tous.
};

FUNC VOID DIA_Richter_Hello_MayBe ()
{
	AI_Output (other,self ,"DIA_Richter_Hello_MayBe_15_00"); //Peut-être, en effet.
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_01"); //Ne jouez pas au malin ! Vous savez à qui vous parlez ?
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_02"); //Surveillez votre ton !
	AI_Output (self ,other,"DIA_Richter_Hello_MayBe_10_03"); //Et maintenant, hors de ma vue !
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Perm 
// ************************************************************

INSTANCE DIA_Richter_Perm(C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 800;
	condition	= DIA_Richter_Perm_Condition;
	information	= DIA_Richter_Perm_Info;
	permanent	= TRUE;
	description = "Qu'y a-t-il?";
};                       

FUNC INT DIA_Richter_Perm_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter == LOG_RUNNING))
	&& (SCIstRichtersLakai == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Richter_Perm_15_00"); //Comment ça se passe ?

	if (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG ))
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_01"); //Débarrassez-moi le plancher avant que j'appelle la garde, sale mercenaire !
		AI_Output (other,self ,"DIA_Richter_Perm_15_02"); //Du calme. Je ne suis pas là pour vous voler, je cherche du travail.
		AI_Output (self ,other,"DIA_Richter_Perm_10_03"); //Ah. Vous voudriez que je vous engage, alors ? Cela change tout...
		AI_Output (self ,other,"DIA_Richter_Perm_10_04"); //Mais il y a un problème, hélas. J'ignore si je peux vous faire confiance. Il va vous falloir me démontrer votre loyauté.
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Richter_Perm_10_05"); //Je croyais vous avoir fait comprendre que je ne voulais avoir aucun contact avec vous.
		AI_Output (other,self ,"DIA_Richter_Perm_15_06"); //Vous ne me l'avez pas dit clairement.
		AI_Output (self ,other,"DIA_Richter_Perm_10_07"); //Maintenant, si. J'espère que vous avez enfin compris.
	};
};

// ************************************************************
// 			  				   RichtersLakai 
// ************************************************************

INSTANCE DIA_Richter_RichtersLakai (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_RichtersLakai_Condition;
	information	= DIA_Richter_RichtersLakai_Info;

	description = "Mettez-moi à l'épreuve.";
};                       

FUNC INT DIA_Richter_RichtersLakai_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter != 0))
	&& (SCIstRichtersLakai == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_RichtersLakai_Info()
{	
	AI_Output (other,self ,"DIA_Richter_RichtersLakai_15_00"); //Mettez-moi à l'épreuve.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_01"); //Hmm... d'accord. Apportez-moi le Marteau Sacré des Magiciens du Feu. Ils le gardent quelque part dans la cave de leur monastère.
	AI_Output (self ,other,"DIA_Richter_RichtersLakai_10_02"); //Si vous y arrivez, je vous engagerai peut-être comme garde du corps.
	
	Info_ClearChoices	(DIA_Richter_RichtersLakai);
	Info_AddChoice	(DIA_Richter_RichtersLakai, "Vous voulez que je vole les magiciens ? Vous êtes cinglé !", DIA_Richter_RichtersLakai_nein );
	Info_AddChoice	(DIA_Richter_RichtersLakai, "Très bien.", DIA_Richter_RichtersLakai_ja );
	
	B_LogEntry (TOPIC_RichterLakai,"Le juge ne me fait pas confiance. Je dois lui prouver ma loyauté. Pour cela, il faut que je vole le marteau sacré dans la cave du monastère des Magiciens du feu."); 

	MIS_Richter_BringHolyHammer = LOG_RUNNING;
};
func void DIA_Richter_RichtersLakai_nein ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_nein_15_00"); //Vous voudriez que je vole les magiciens ? Vous êtes dingue ou quoi ?
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_nein_10_01"); //Si c'est comme ça, fichez-moi le camp et cessez de me faire perdre mon temps !
	AI_StopProcessInfos (self);
};

func void DIA_Richter_RichtersLakai_ja ()
{
	AI_Output			(other, self, "DIA_Richter_RichtersLakai_ja_15_00"); //Très bien.
	AI_Output			(self, other, "DIA_Richter_RichtersLakai_ja_10_01"); //Bien. Mais n'oubliez pas, si jamais ils vous attrapent, on ne se connaît pas.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				   KillMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KillMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KillMorgahard_Condition;
	information	= DIA_Richter_KillMorgahard_Info;

	description =	"Voici le marteau sacré des magiciens.";
};                       

FUNC INT DIA_Richter_KillMorgahard_Condition()
{
	if (Npc_HasItems (other,Holy_Hammer_MIS))
	&& (MIS_Richter_BringHolyHammer == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KillMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KillMorgahard_15_00"); //Voilà le Marteau Sacré des magiciens.
	B_GiveInvItems (other, self, Holy_Hammer_MIS,1);
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_01"); //Vous m'impressionnez. Vous voulez vraiment que je vous engage, hein ? Tenez, voici votre paye.
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_02"); //Bien. Si c'est comme ça, j'ai une autre tâche à vous confier.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_03"); //Il y a quelques jours, plusieurs prisonniers se sont évadés de prison.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_04"); //Ces fils de garce ont fui vers les montagnes, en direction de la tour de Xardas.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_05"); //Leur chef s'appelle Morgahad. Je veux que vous le supprimiez.
	AI_Output (self ,other,"DIA_Richter_KillMorgahard_10_06"); //Faites vite, avant qu'ils ne disparaissent.
	
	Wld_InsertNpc	(BDT_1030_Morgahard,"REICH"); 
	Wld_InsertNpc	(BDT_1031_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1032_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1033_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1034_Fluechtling,"REICH"); 
	Wld_InsertNpc	(BDT_1035_Fluechtling,"REICH"); 

	B_InitNpcGlobals ();

	B_GivePlayerXP (XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry (TOPIC_RichterLakai,"Des prisonniers ont échappé au juge. Je dois les traquer et tuer leur chef MORGAHARD. Ils se cachent dans les montagnes quelque part dans la direction de la nouvelle tour de Xardas."); 
	MIS_Richter_KillMorgahard = LOG_RUNNING;
	AI_StopProcessInfos (self);
};	

// ************************************************************
// 	  KilledMorgahard 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahard (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahard_Condition;
	information	= DIA_Richter_KilledMorgahard_Info;

	description =	"Morgahard est mort.";
};                       

FUNC INT DIA_Richter_KilledMorgahard_Condition()
{
	if (Npc_IsDead(Morgahard))
	&& (MIS_Richter_KillMorgahard == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahard_Info()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahard_15_00"); //Morgahad est mort.
	AI_Output (self ,other,"DIA_Richter_KilledMorgahard_10_01"); //Bien joué ! Voici votre récompense.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);					
	B_GivePlayerXP (XP_KillMorgahard);
	B_LogEntry (TOPIC_RichterLakai,"La mort de Morgahard a semblé amuser le juge. Grand bien lui fasse. Je ne dois pas perdre de vue la mission de Lee."); 
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};

// ************************************************************
// 	  KilledMorgahardPERM 
// ************************************************************

INSTANCE DIA_Richter_KilledMorgahardPERM (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_KilledMorgahardPERM_Condition;
	information	= DIA_Richter_KilledMorgahardPERM_Info;
	permanent	 = 	TRUE;

	description =	"Puis-je faire autre chose pour vous ?";
};                       

FUNC INT DIA_Richter_KilledMorgahardPERM_Condition()
{
	if (MIS_Richter_KillMorgahard == LOG_SUCCESS)
	&& (MIS_RichtersPermissionForShip == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_KilledMorgahardPERM_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_KilledMorgahardPERM_15_00"); //Y a-t-il autre chose que je puisse faire pour vous ?
	AI_Output (self ,other,"DIA_Richter_KilledMorgahardPERM_10_01"); //Pas pour le moment. Plus tard, peut-être...
};

// ************************************************************
// 		 PermissionForShip 
// ************************************************************

INSTANCE DIA_Richter_PermissionForShip (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_PermissionForShip_Condition;
	information	= DIA_Richter_PermissionForShip_Info;

	description =	"Donnez-moi une autorisation écrite pour le navire des paladins.";
};                       

FUNC INT DIA_Richter_PermissionForShip_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Richter_PermissionForShip_Info ()
{	
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_00"); //Remettez-moi une autorisation écrite permettant de monter à bord du navire des paladins.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_01"); //(éclate de rire) Vous avez perdu la tête, ou quoi ? Qu'est-ce que vous voulez ?
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_02"); //Vous m'avez très bien entendu. Donnez-moi cette autorisation ou je vous livre à la milice.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_03"); //(s'emporte) Je ne laisserai personne me faire chanter, et surtout pas vous ! Je vais vous jeter en pâture aux loups, espèce de sale racaille !
	AI_Output (other,self ,"DIA_Richter_PermissionForShip_15_04"); //Morgahad a agressé le gouverneur sur votre ordre et je suis en possession d'un document qui le prouve.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_05"); //(s'emporte) Aaaahhh !
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_06"); //Vous allez le regretter ! Nul ne peut me faire chanter impunément.
	AI_Output (self ,other,"DIA_Richter_PermissionForShip_10_07"); //Voilà votre autorisation. Et maintenant, partez. Je m'occuperai de votre cas plus tard.
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
	B_LogEntry (TOPIC_Ship,"La lettre d'autorisation devrait me permettre de prendre possession du navire. Je me demande ce que Lee dira."); 
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP (XP_RichtersPermissionForShip);
};

// ************************************************************
// 		 perm2 
// ************************************************************

INSTANCE DIA_Richter_perm2 (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 2;
	condition	= DIA_Richter_perm2_Condition;
	information	= DIA_Richter_perm2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};                       

FUNC INT DIA_Richter_perm2_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Richter_perm2_Info ()
{	
	AI_Output (self ,other,"DIA_Richter_perm2_10_00"); //Hors de ma vue !
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Richter_PICKPOCKET (C_INFO)
{
	npc			= Vlk_402_Richter;
	nr			= 900;
	condition	= DIA_Richter_PICKPOCKET_Condition;
	information	= DIA_Richter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait facile de lui voler la clef)";
};                       

FUNC INT DIA_Richter_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Richter) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Richter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Richter_PICKPOCKET);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_BACK 		,DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Richter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Richter, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Richter_PICKPOCKET);
};




