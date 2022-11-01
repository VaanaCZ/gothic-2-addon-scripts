//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_EXIT   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 999;
	condition   = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tom_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Tom_PICKPOCKET (C_INFO)
{
	npc			= BDT_1080_Addon_Tom;
	nr			= 900;
	condition	= DIA_Addon_Tom_PICKPOCKET_Condition;
	information	= DIA_Addon_Tom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Tom_PICKPOCKET_Condition()
{
	C_Beklauen (40, 52);
};
 
FUNC VOID DIA_Addon_Tom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
	
func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_HI   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 1;
	condition   = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent   = FALSE;
	description = "Pourquoi est-ce que vous vous isolez ici ?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //Pourquoi est-ce que vous vous isolez ici ?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //J'ai des soucis. En ce moment, je ne me porterai que mieux si personne ne me voit à l'intérieur du camp.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //Que se passe-t-il ?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //J'avais d'excellentes relations avec certains pirates, voyez-vous.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Je retrouvais souvent les gars à l'extérieur du camp pour faire des affaires avec eux.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //Ha ! J'ai acheté de la marchandise pour la moitié du camp. 'Tom, trouve-moi ci - Tom, trouve-moi ça'.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //Et ensuite, ce fumier d'Esteban est venu s'occuper de ça.
};
//---------------------------------------------------------------------
//	Info Juan
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Juan   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 2;
	condition   = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent   = FALSE;
	description = "Que s'est-il passé ?";
};
FUNC INT DIA_Addon_Tom_Juan_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Juan_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Juan_15_00"); //Que s'est-il passé ?
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban a envoyé Juan - l'un de ses gros bras. Ce fumier nous a tendu une embuscade.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //J'étais sur le point de conclure une affaire avec les pirates lorsqu'il est sorti de l'ombre et m'a mis à terre en deux coups !
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //Bon sang, ce type est rapide ! Mais pas assez rapide... j'ai pu lui échapper.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Ainsi, le responsable du meurtre de Hank et Angus n'est autre que Juan... Il leur a tendu une embuscade et, le moment venu, les a assassinés.");
};

//---------------------------------------------------------------------
//	Info Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Esteban   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 3;
	condition   = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent   = FALSE;
	description = "Et depuis l'embuscade, vous vous cachez ici ?";
};
FUNC INT DIA_Addon_Tom_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_Juan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Esteban_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //Et depuis l'embuscade, vous vous cachez ici ?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //D'abord, je suis rentré au camp pour informer à Fisk, Huno et les autres qu'ils pouvaient oublier leurs marchandises...
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //...et que c'était de la faute d'Esteban.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Mais si Esteban découvre que j'ai informé les autres qu'il était responsable de ce problème, je suis mort.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_04"); //Voilà pourquoi je ne peux retourner au camp.
	
	Tom_tells = TRUE;
};

//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Dead   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 4;
	condition   = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent   = FALSE;
	description = "Esteban est mort.";
};
FUNC INT DIA_Addon_Tom_Dead_Condition()
{	
	if (Npc_IsDead (Esteban))
	&& (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Dead_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Esteban est mort.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //Vraiment ? Bon sang, EXCELLENTE nouvelle !
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //Qui lui a réglé son compte ?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //(malicieusement) Disons que c'était quelqu'un que vous connaissez...
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Merci de m'avoir prévenu. Maintenant, je peux retourner au camp...
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"LAGER");
};

//---------------------------------------------------------------------
// PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_PERM   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 5;
	condition   = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent   = TRUE;
	description = "Et à part ça ?";
};
FUNC INT DIA_Addon_Tom_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_PERM_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //Autre chose ?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Maintenant, je vais pouvoir boire un coup de liqueur de Lucia en toute quiétude.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //Maintenant, je vais enfin pouvoir retourner au camp !
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //Sinon ? Sinon, je resterai ici, à compter les rochers...
		};
	};
};




