// ************************************************************
// 	  				   			EXIT 
// ************************************************************

INSTANCE DIA_GornNW_KAP3_EXIT(C_INFO)
{
	npc			= PC_Fighter_NW_vor_DJG;
	nr			= 999;
	condition	= DIA_GornNW_KAP3_EXIT_Condition;
	information	= DIA_GornNW_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_GornNW_KAP3_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  	  						Hallo
// ************************************************************

INSTANCE DIA_GornNW_Hallo (C_INFO)
{
	npc			= PC_Fighter_NW_vor_DJG;
	nr			= 1;
	condition	= DIA_GornNW_Hallo_Condition;
	information	= DIA_GornNW_Hallo_Info;
	permanent	= FALSE;
	description = "Alles klar bei dir?";
};                       
FUNC INT DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_00"); //Alles klar bei dir?
	if (MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_01"); //Du hast meinen Arsch gerettet, Mann.
		AI_Output (self ,other,"DIA_GornNW_Add_12_02"); //Das vergess ich dir nie.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_03"); //Milten hat mich rausgehauen.
		AI_Output (self ,other,"DIA_GornNW_Add_12_04"); //Das vergesse ich ihm nie.
	};
};

// ************************************************************
// 	  	  						WhatNext
// ************************************************************

INSTANCE DIA_GornNW_WhatNext (C_INFO)
{
	npc			= PC_Fighter_NW_vor_DJG;
	nr			= 1;
	condition	= DIA_GornNW_WhatNext_Condition;
	information	= DIA_GornNW_WhatNext_Info;
	permanent	= TRUE;
	description = "Was willst du jetzt machen?";
};                       
FUNC INT DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_WhatNext_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_05"); //Was willst du jetzt machen?
	AI_Output (self ,other,"DIA_GornNW_Add_12_06"); //Ich denke, ich werde mir erst mal den Bauch vollschlagen.
	AI_Output (other,self ,"DIA_GornNW_Add_15_07"); //Und dann?
	AI_Output (self ,other,"DIA_GornNW_Add_12_08"); //Mal sehen... Vielleicht geh ich in die Minenkolonie zurück.
	AI_Output (self ,other,"DIA_GornNW_Add_12_09"); //Jemand sollte ein Auge auf die Orks werfen - sonst stehen sie plötzlich ohne Warnung alle hier vor der Tür.
};
