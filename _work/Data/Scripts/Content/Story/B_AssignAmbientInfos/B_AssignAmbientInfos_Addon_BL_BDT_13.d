// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BL_BDT_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_BL_BDT_13_EXIT_Condition;
	information	= DIA_Addon_BL_BDT_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_BL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_13_EXIT_Info()
{	
	BDT_13_Nerver = 0;
	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 									Chef
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Chef(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_BL_BDT_13_Chef_Condition;
	information	= DIA_Addon_BL_BDT_13_Chef_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_Chef_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_BL_BDT_13_Chef_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_Chef_15_00");//Qui est le responsable ici ?
	
	if (RavenIsDead == TRUE)
	{
		if Npc_IsDead (Thorus)
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_13_Chef_13_01");//(jubile) Notre puissant seigneur Thorus. Il fera de nous des hommes riches !
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_13_Chef_13_02");//Notre puissant chef... heu... j'en sais rien, en fait.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Chef_13_03");//(jubile) Notre puissant seigneur Raven. Il fera de nous des hommes riches !
			
	};
};
// *************************************************************************
// 									Lager
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Lager(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_13_Lager_Condition;
	information	= DIA_Addon_BL_BDT_13_Lager_Info;
	permanent	= TRUE;
	description = "Que savez-vous sur le camp ?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_Lager_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_BL_BDT_13_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_Lager_15_00");//Que savez-vous sur le camp ?
	AI_Output (self, other, "DIA_Addon_BL_BDT_13_Lager_13_01");//Allez voir Snaf si vous cherchez des informations. Notre gros cuistot sait un sacré paquet de choses sur tout le monde !
	AI_Output (self, other, "DIA_Addon_BL_BDT_13_Lager_13_02");//Si vous voulez acheter quelque chose, allez voir Fisk. Il arrive à dégotter toutes sortes de trucs.
};
// *************************************************************************
// 								News
// *************************************************************************
instance DIA_Addon_BL_BDT_13_News(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_BL_BDT_13_News_Condition;
	information	= DIA_Addon_BL_BDT_13_News_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_13_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_News_15_00");//Quelles nouvelles ?
	
	if (RavenIsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_01");//Raven est mort. Maintenant, on n'a plus AUCUNE chance de quitter cette île !
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_02");//Les pirates ont mis les voiles et quitté l'île.
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_03");//Maintenant, il ne reste que quelques imbéciles assis sur la plage, et ils n'ont aucun navire digne de ce nom.
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_04");//Je doute même que Beliar sache comment nous faire quitter ce caillou.
	};
};
// *************************************************************************
// 									Gold
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Gold(C_INFO)
{
	nr			= 5;
	condition	= DIA_Addon_BL_BDT_13_Gold_Condition;
	information	= DIA_Addon_BL_BDT_13_Gold_Info;
	permanent	= TRUE;
	description = "Comment puis-je gagner beaucoup d'or rapidement ?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_Gold_Condition()
{	
	if (MIS_Send_Buddler != LOG_RUNNING)
	|| (MIS_Send_Buddler != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_13_Gold_Info()
{	
	BDT_13_Nerver = (BDT_13_Nerver +1);
	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_Gold_15_00");//Comment puis-je gagner beaucoup d'or rapidement ?
	
	if (BDT_13_Nerver <= 2)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_01");//Bonne question. C'est la raison pour laquelle chacun de nous est là, non ?
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_02");//Arrangez-vous simplement pour que Thorus vous remette une pierre rouge. Ensuite, vous pourrez aller creuser dans la mine.
	}
	else if (BDT_13_Kill == FALSE)
	{
		BDT_13_Nerver = 0;
		BDT_13_Kill = TRUE;
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_03");//Hé, tu cherches les ennuis, ou quoi ? Dégage !
		AI_StopProcessInfos (self);
	}
	else 
	{
		BDT_13_Nerver = 0;
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_04");//Fini de jouer, maintenant !
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);
	};
};
FUNC VOID B_AssignAmbientInfos_Addon_BL_BDT_13 (var c_NPC slf)
{
	DIA_Addon_BL_BDT_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Chef.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Lager.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_News.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Gold.npc					= Hlp_GetInstanceID(slf);
};
