///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Engardo_EXIT   (C_INFO)
{
	npc         = SLD_841_Engardo;
	nr          = 999;
	condition   = DIA_Engardo_EXIT_Condition;
	information = DIA_Engardo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Engardo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Engardo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Engardo_HALLO		(C_INFO)
{
	npc			 = 	SLD_841_Engardo;
	nr			 = 	4;
	condition	 = 	DIA_Engardo_HALLO_Condition;
	information	 = 	DIA_Engardo_HALLO_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Engardo_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};	
};
//-----------------------------------
var int Chance;
//-----------------------------------
func void DIA_Engardo_HALLO_Info ()
{
	Akils_SLDStillthere = TRUE;
	if (Chance == FALSE)
	{
		AI_Output (self, other, "DIA_Engardo_HALLO_13_00"); //Hé, bouffon ! Vous vous êtes perdu ou quoi ? Retournez planter des navets dans votre champ.
		Chance = 1;
		AI_StopProcessInfos (self);
	}
	else if (Chance == 1) 
	{	
		AI_Output (self, other, "DIA_Engardo_HALLO_13_01"); //Vous êtes au mauvais endroit au mauvais moment.
		AI_Output (self, other, "DIA_Engardo_HALLO_13_02"); //Alors, si vous voulez continuer à vivre, tirez-vous sans attendre, c'est compris ?
		Chance = 2;
		AI_StopProcessInfos (self);
	}
	else if (Chance == 2)
	{
		AI_Output (self, other, "DIA_Engardo_HALLO_13_03"); //Vous avez un problème d'audition ou vous cherchez à mourir ? (implacable) En tout cas, c'est trop tard maintenant...
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_SuddenEnemyInferno, 1);
		
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Engardo_PICKPOCKET (C_INFO)
{
	npc			= SLD_841_Engardo;
	nr			= 900;
	condition	= DIA_Engardo_PICKPOCKET_Condition;
	information	= DIA_Engardo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Engardo_PICKPOCKET_Condition()
{
	C_Beklauen (34, 45);
};
 
FUNC VOID DIA_Engardo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Engardo_PICKPOCKET);
	Info_AddChoice		(DIA_Engardo_PICKPOCKET, DIALOG_BACK 		,DIA_Engardo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Engardo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Engardo_PICKPOCKET_DoIt);
};

func void DIA_Engardo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Engardo_PICKPOCKET);
};
	
func void DIA_Engardo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Engardo_PICKPOCKET);
};






