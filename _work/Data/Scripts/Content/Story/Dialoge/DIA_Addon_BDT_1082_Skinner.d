///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skinner_EXIT   (C_INFO)
{
	npc         = BDT_1082_Addon_Skinner;
	nr          = 999;
	condition   = DIA_Addon_Skinner_EXIT_Condition;
	information = DIA_Addon_Skinner_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skinner_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skinner_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Skinner_PICKPOCKET (C_INFO)
{
	npc			= BDT_1082_Addon_Skinner;
	nr			= 900;
	condition	= DIA_Addon_Skinner_PICKPOCKET_Condition;
	information	= DIA_Addon_Skinner_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Skinner_PICKPOCKET_Condition()
{
	C_Beklauen (100, 200);
};
 
FUNC VOID DIA_Addon_Skinner_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skinner_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skinner_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skinner_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skinner_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skinner_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skinner_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Wache_02_PICKPOCKET);
};
	
func void DIA_Addon_Skinner_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Wache_02_PICKPOCKET);
	B_Say (self, self, "$AWAKE");
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skinner_Hi   (C_INFO)
{
	npc         = BDT_1082_Addon_Skinner;
	nr          = 2;
	condition   = DIA_Addon_Skinner_Hi_Condition;
	information = DIA_Addon_Skinner_Hi_Info;
	permanent   = TRUE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Skinner_Hi_Condition()
{	
	if  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Skinner_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_00");//Why did you wake me, eh? I bet you don't even know...
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_01");//No - don't say anything. It's too late for excuses.
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_02");//Now you have two choices. You can fight me and my Betty. Or you can try to run away.
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_03");//In your place, I'd run...
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Attentat
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skinner_Attentat   (C_INFO)
{
	npc         = BDT_1082_Addon_Skinner;
	nr          = 9;
	condition   = DIA_Addon_Skinner_Attentat_Condition;
	information = DIA_Addon_Skinner_Attentat_Info;
	permanent   = FALSE;
	description = "About the attack...";
};
FUNC INT DIA_Addon_Skinner_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Skinner_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Skinner_Attentat_15_00");//About the attack...
	AI_Output (self, other, "DIA_Addon_Skinner_Attentat_08_01");//What do you want?
	
	Info_ClearChoices (DIA_Addon_Skinner_Attentat);
	
	Info_AddChoice (DIA_Addon_Skinner_Attentat,"Get rid of Esteban",DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA);
	Info_AddChoice (DIA_Addon_Skinner_Attentat,"Hunt down the traitor",DIA_Addon_Skinner_ATTENTAT_ADDON_PRO);
};
FUNC VOID DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA()
{
	AI_Output (other, self, "DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00");//I want to get Esteban out of the way.
	AI_Output (self, other, "DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01");//Super.
	
	Judas_Counter = (Judas_Counter + 1);
	
	Info_ClearChoices (DIA_Addon_Skinner_Attentat);
};
FUNC VOID DIA_Addon_Skinner_ATTENTAT_ADDON_PRO()
{
	AI_Output (other, self, "DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00");//I want to track down the traitor.
	AI_Output (self, other, "DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01");//Shit.
	
	Info_ClearChoices (DIA_Addon_Skinner_Attentat);
};





