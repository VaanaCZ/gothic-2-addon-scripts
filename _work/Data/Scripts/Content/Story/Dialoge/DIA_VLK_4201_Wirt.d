///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Wirt_EXIT   (C_INFO)
{
	npc         = VLK_4201_Wirt;
	nr          = 999;
	condition   = DIA_Wirt_EXIT_Condition;
	information = DIA_Wirt_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wirt_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wirt_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Wirt_PICKPOCKET (C_INFO)
{
	npc			= VLK_4201_Wirt;
	nr			= 900;
	condition	= DIA_Wirt_PICKPOCKET_Condition;
	information	= DIA_Wirt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Wirt_PICKPOCKET_Condition()
{
	C_Beklauen (60, 65);
};
 
FUNC VOID DIA_Wirt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wirt_PICKPOCKET);
	Info_AddChoice		(DIA_Wirt_PICKPOCKET, DIALOG_BACK 		,DIA_Wirt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wirt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wirt_PICKPOCKET_DoIt);
};

func void DIA_Wirt_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wirt_PICKPOCKET);
};
	
func void DIA_Wirt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wirt_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Wirt_Hallo   (C_INFO)
{
	npc         = VLK_4201_Wirt;
	nr          = 2;
	condition   = DIA_Wirt_Hallo_Condition;
	information = DIA_Wirt_Hallo_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Wirt_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Wirt_Hallo_Info()
{
	var int randy;
	randy = Hlp_Random (2);
	
	AI_Output (self, other,"DIA_Wirt_Hallo_14_00");//Hej, pojë blíž - dej si pauzu a pár loků dobâe chlazeného piva.
	
	if (self.aivar [AIV_TalkedToPlayer] == FALSE) 
	{
		AI_Output (self, other,"DIA_Wirt_Hallo_14_01");//Lord Andre objednal pár soudků piva, které točíme zdarma.
		AI_StopProcessInfos (self);
	}
	else if (randy == 0)
	{
		AI_Output (self, other,"DIA_Wirt_Hallo_14_02");//Není nad to, když si po práci dáš jednu pintu oroseného.
		AI_StopProcessInfos (self);
	}
	else if (randy == 1)
	{
		AI_Output (self, other,"DIA_Wirt_Hallo_14_03");//Paladinové dají všechno do poâádku, takže si klidnę ještę lokni a užij si to.
		
		B_GiveInvItems (self, other, ItFo_Beer,1);
		AI_StopProcessInfos (self);
	}
	else if (randy == 2)
	{
		AI_Output (self, other,"DIA_Wirt_Hallo_14_04");//O Khorinidu si âíkej, co chceš, ale náš 'Temný paladin' je prostę nejlepší z celé Myrtany.
		AI_StopProcessInfos (self);
	};
};

/*
	Wenn du ein Problem hast und es lässt sich lösen, dann denk nicht weiter drüber nach.
	Und wenn du es nicht lösen kannst, dann brauchst du auch nicht weiter drüber nachzudenken. 
*/


