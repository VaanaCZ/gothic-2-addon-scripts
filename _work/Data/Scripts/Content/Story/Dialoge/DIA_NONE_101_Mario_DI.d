
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

	description	= "Here's your chance to prove your fighting abilities.";
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
	AI_Output (other,self ,"DIA_NONE_101_MARIO_DI_Job_15_00"); //Here's your chance to prove your fighting abilities.
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_Job_07_01"); //Slowly. Everything in its time.
	AI_Output (other,self ,"DIA_NONE_101_MARIO_DI_Job_15_02"); //Mmh. That's just what I'd expected from you.
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_Job_07_03"); //Just wait.
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
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_ambush_07_00"); //Come closer. So, my friend. Now show me what you've got.
	AI_Output (other,self ,"DIA_NONE_101_MARIO_DI_ambush_15_01"); //What do you mean by that?
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_ambush_07_02"); //Quite simple. The Master has had more than enough of you.
	AI_Output (self ,other,"DIA_NONE_101_MARIO_DI_ambush_07_03"); //I should have killed you sooner. But my friends and I will correct that mistake here and now.
	
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


