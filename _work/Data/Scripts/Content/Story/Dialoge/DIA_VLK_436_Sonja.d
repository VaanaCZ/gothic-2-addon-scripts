///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sonja_EXIT   (C_INFO)
{
	npc         = VLK_436_Sonja;
	nr          = 999;
	condition   = DIA_Sonja_EXIT_Condition;
	information = DIA_Sonja_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sonja_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sonja_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sonja_PICKPOCKET (C_INFO)
{
	npc			= VLK_436_Sonja;
	nr			= 900;
	condition	= DIA_Sonja_PICKPOCKET_Condition;
	information	= DIA_Sonja_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Sonja_PICKPOCKET_Condition()
{
	C_Beklauen (58, 70);
};
 
FUNC VOID DIA_Sonja_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sonja_PICKPOCKET);
	Info_AddChoice		(DIA_Sonja_PICKPOCKET, DIALOG_BACK 		,DIA_Sonja_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sonja_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sonja_PICKPOCKET_DoIt);
};

func void DIA_Sonja_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sonja_PICKPOCKET);
};
	
func void DIA_Sonja_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sonja_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Sonja_STANDARD		(C_INFO)
{
	npc			 = 	VLK_436_Sonja;
	condition	 = 	DIA_Sonja_STANDARD_Condition;
	information	 = 	DIA_Sonja_STANDARD_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Sonja_STANDARD_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (MIS_Andre_REDLIGHT != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Sonja_STANDARD_Info ()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Sonja_STANDARD_16_00"); //Allez voir Bromor si vous voulez vous amuser.
	}
	else if (other.guild == GIL_DJG)
	&& (Sonja_Says == FALSE)
	{
		AI_Output (self, other, "DIA_Sonja_STANDARD_16_01"); //Le problème, avec vous les hommes, c'est que vous préférez tuer de l'orque que faire des galipettes.
		Sonja_Says = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Sonja_STANDARD_16_02"); //Si vous voulez parler, trouvez une femme et mariez-vous.
	};
	AI_StopProcessInfos (self);
};


 





