
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NONE_101_MARIO_DI_EXIT   (C_INFO)
{
	npc         = NONE_101_MARIO_DI;
	nr          = 999;
	condition   = DIA_NONE_101_MARIO_DI_EXIT_Condition;
	information = DIA_NONE_101_MARIO_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NONE_101_MARIO_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NONE_101_MARIO_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
// perm 
//*********************************************************************
INSTANCE DIA_NONE_101_MARIO_DI_Job (C_INFO)
{
	npc         = NONE_101_MARIO_DI;
	nr          = 4;
	condition   = DIA_NONE_101_MARIO_DI_Job_Condition;
	information = DIA_NONE_101_MARIO_DI_Job_Info;
	permanent   = TRUE;

	description	= "Voici votre chance de prouver vos capacités de combattant.";
};

FUNC INT DIA_NONE_101_MARIO_DI_Job_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	&& (ORkSturmDI == FALSE)
		{
			return TRUE;
		};
};

FUNC VOID DIA_NONE_101_MARIO_DI_Job_Info()
{
	AI_Output (other,self ,"DIA_NONE_101_MARIO_DI_Job_15_00"); //Voilà votre chance de montrer que vous savez vous battre.
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_Job_07_01"); //Du calme, chaque chose en son temps.
	AI_Output (other,self ,"DIA_NONE_101_MARIO_DI_Job_15_02"); //Hmm… Je m'attendais à une telle réponse de votre part.
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_Job_07_03"); //Attendez.
};

//*********************************************************************
// ambush 
//*********************************************************************
INSTANCE DIA_NONE_101_MARIO_DI_ambush (C_INFO)
{
	npc         = NONE_101_MARIO_DI;
	nr          = 4;
	condition   = DIA_NONE_101_MARIO_DI_ambush_Condition;
	information = DIA_NONE_101_MARIO_DI_ambush_Info;
	important	 = 	TRUE;
};

FUNC INT DIA_NONE_101_MARIO_DI_ambush_Condition()
{
	if (ORkSturmDI == TRUE)
		{
			return TRUE;
		};
};

FUNC VOID DIA_NONE_101_MARIO_DI_ambush_Info()
{
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_ambush_07_00"); //Approchez-vous un peu. Bien. Et maintenant, montrez-moi de quoi vous êtes capable.
	AI_Output (other,self ,"DIA_NONE_101_MARIO_DI_ambush_15_01"); //Qu'entendez-vous par là ?
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_ambush_07_02"); //C'est simple. Le maître en a plus qu'assez de vous.
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_ambush_07_03"); //J'aurais dû vous tuer plus tôt, mais mes amis et moi-même allons rectifier cette erreur sans attendre.
	
	Info_ClearChoices	(DIA_NONE_101_MARIO_DI_ambush);
	Info_AddChoice	(DIA_NONE_101_MARIO_DI_ambush, DIALOG_ENDE, DIA_NONE_101_MARIO_DI_ambush_ambush );
	B_GivePlayerXP (XP_Mario_Ambush);
	MIS_Mario_Ambush = LOG_SUCCESS;
};

func void DIA_NONE_101_MARIO_DI_ambush_ambush ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	Skeleton_Mario1.aivar[AIV_EnemyOverride] 	= FALSE;
	Skeleton_Mario2.aivar[AIV_EnemyOverride] 	= FALSE;
	Skeleton_Mario3.aivar[AIV_EnemyOverride] 	= FALSE;
	Skeleton_Mario4.aivar[AIV_EnemyOverride] 	= FALSE;
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MARIO_DI_PICKPOCKET (C_INFO)
{
	npc			= NONE_101_MARIO_DI;
	nr			= 900;
	condition	= DIA_MARIO_DI_PICKPOCKET_Condition;
	information	= DIA_MARIO_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_MARIO_DI_PICKPOCKET_Condition()
{
	C_Beklauen (71, 110);
};
 
FUNC VOID DIA_MARIO_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MARIO_DI_PICKPOCKET);
	Info_AddChoice		(DIA_MARIO_DI_PICKPOCKET, DIALOG_BACK 		,DIA_MARIO_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MARIO_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MARIO_DI_PICKPOCKET_DoIt);
};

func void DIA_MARIO_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_MARIO_DI_PICKPOCKET);
};
	
func void DIA_MARIO_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MARIO_DI_PICKPOCKET);
};


