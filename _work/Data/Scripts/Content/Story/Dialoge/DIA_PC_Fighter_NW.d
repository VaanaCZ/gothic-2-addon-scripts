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
	description = "Wszystko w porz¹dku?";
};                       
FUNC INT DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_00"); //Wszystko w porz¹dku?
	if (MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_01"); //Uratowa³eœ mój ty³ek, kolego.
		AI_Output (self ,other,"DIA_GornNW_Add_12_02"); //Nigdy ci tego nie zapomnê.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_03"); //Milten mnie wyci¹gn¹³.
		AI_Output (self ,other,"DIA_GornNW_Add_12_04"); //Nigdy mu tego nie zapomnê.
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
	description = "Co bêdziesz teraz robi³?";
};                       
FUNC INT DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_WhatNext_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_05"); //Co bêdziesz teraz robi³?
	AI_Output (self ,other,"DIA_GornNW_Add_12_06"); //Najpierw zamierzam porz¹dnie siê najeœæ.
	AI_Output (other,self ,"DIA_GornNW_Add_15_07"); //A potem?
	AI_Output (self ,other,"DIA_GornNW_Add_12_08"); //Kto wie? Mo¿e wrócê do Kolonii?
	AI_Output (self ,other,"DIA_GornNW_Add_12_09"); //Ktoœ musi mieæ oko na orków. Nie chcemy chyba, ¿eby bez ostrze¿enia zapukali nam do drzwi, nie?
};
