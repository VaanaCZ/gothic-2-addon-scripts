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
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_00");//Proč mě budíš? Vsadím se, že ani nevíš proč, co?
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_01");//Ne – neříkej nic. Na omluvy už je stejně pozdě.
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_02");//Teď máš dvě možnosti. Buď se utkáš se mnou a s mojí Betty, nebo můžeš zkusit utéct.
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_08_03");//Na tvým místě bych radši zdrhnul.
	
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
	description = "Co se týče toho útoku...";
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
	AI_Output (other, self, "DIA_Addon_Skinner_Attentat_15_00");//Co se týče toho útoku...
	AI_Output (self, other, "DIA_Addon_Skinner_Attentat_08_01");//Co chceš?
	
	Info_ClearChoices (DIA_Addon_Skinner_Attentat);
	
	Info_AddChoice (DIA_Addon_Skinner_Attentat,"Zbavit se Estebana",DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA);
	Info_AddChoice (DIA_Addon_Skinner_Attentat,"Pronásledovat zrádce",DIA_Addon_Skinner_ATTENTAT_ADDON_PRO);
};
FUNC VOID DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA()
{
	AI_Output (other, self, "DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00");//Chci Estebana odklidit z cesty.
	AI_Output (self, other, "DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01");//Super.
	
	Judas_Counter = (Judas_Counter + 1);
	
	Info_ClearChoices (DIA_Addon_Skinner_Attentat);
};
FUNC VOID DIA_Addon_Skinner_ATTENTAT_ADDON_PRO()
{
	AI_Output (other, self, "DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00");//Chci vystopovat zrádce.
	AI_Output (self, other, "DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01");//Kurva.
	
	Info_ClearChoices (DIA_Addon_Skinner_Attentat);
};





