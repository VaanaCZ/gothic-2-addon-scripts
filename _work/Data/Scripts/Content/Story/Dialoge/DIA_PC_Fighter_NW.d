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
	description = "Wszystko w porz�dku?";
};                       
FUNC INT DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_00"); //Wszystko w porz�dku?
	if (MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_01"); //Uratowa�e� m�j ty�ek, kolego.
		AI_Output (self ,other,"DIA_GornNW_Add_12_02"); //Nigdy ci tego nie zapomn�.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_03"); //Milten mnie wyci�gn��.
		AI_Output (self ,other,"DIA_GornNW_Add_12_04"); //Nigdy mu tego nie zapomn�.
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
	description = "Co b�dziesz teraz robi�?";
};                       
FUNC INT DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_WhatNext_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_05"); //Co b�dziesz teraz robi�?
	AI_Output (self ,other,"DIA_GornNW_Add_12_06"); //Najpierw zamierzam porz�dnie si� naje��.
	AI_Output (other,self ,"DIA_GornNW_Add_15_07"); //A potem?
	AI_Output (self ,other,"DIA_GornNW_Add_12_08"); //Kto wie? Mo�e wr�c� do Kolonii?
	AI_Output (self ,other,"DIA_GornNW_Add_12_09"); //Kto� musi mie� oko na ork�w. Nie chcemy chyba, �eby bez ostrze�enia zapukali nam do drzwi, nie?
};
