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
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_00");//Po co mnie obudziłeś? Założę się, że nawet nie wiesz....
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_01");//Nie, nie odpowiadaj. Za późno na wymówki.
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_02");//Masz teraz dwie możliwości. Walczyć ze mną i moją Betty... albo spróbować ucieczki.
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_03");//Ja na twoim miejscu próbowałbym uciekać...
	
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
	description = "A co do próby zabójstwa...";
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
	AI_Output (other, self, "DIA_Addon_Skinner_Attentat_15_00");//A co do próby zabójstwa...
	AI_Output (self, other, "DIA_Addon_Skinner_Attentat_08_01");//Czego ode mnie chcesz?
	
	Info_ClearChoices (DIA_Addon_Skinner_Attentat);
	
	Info_AddChoice (DIA_Addon_Skinner_Attentat,"Chcę się pozbyć Estebana.",DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA);
	Info_AddChoice (DIA_Addon_Skinner_Attentat,"Zabiję zdrajcę.",DIA_Addon_Skinner_ATTENTAT_ADDON_PRO);
};
FUNC VOID DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA()
{
	AI_Output (other, self, "DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00");//Chcę się pozbyć Estebana.
	AI_Output (self, other, "DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01");//Znakomicie.
	
	Judas_Counter = (Judas_Counter + 1);
	
	Info_ClearChoices (DIA_Addon_Skinner_Attentat);
};
FUNC VOID DIA_Addon_Skinner_ATTENTAT_ADDON_PRO()
{
	AI_Output (other, self, "DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00");//Zabiję zdrajcę.
	AI_Output (self, other, "DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01");//Cholera.
	
	Info_ClearChoices (DIA_Addon_Skinner_Attentat);
};





