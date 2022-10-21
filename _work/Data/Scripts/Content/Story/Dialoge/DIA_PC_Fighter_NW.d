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
	description = "Va tutto bene?";
};                       
FUNC INT DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_00"); //Tutto a posto?
	if (MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_01"); //Mi hai salvato la pelle, amico.
		AI_Output (self ,other,"DIA_GornNW_Add_12_02"); //Non lo dimenticherò mai.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_03"); //Milten mi ha fatto uscire.
		AI_Output (self ,other,"DIA_GornNW_Add_12_04"); //Non lo dimenticherò mai.
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
	description = "Quali sono i tuoi piani, adesso?";
};                       
FUNC INT DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_WhatNext_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_05"); //Cosa intendi fare ora?
	AI_Output (self ,other,"DIA_GornNW_Add_12_06"); //Penso che asseconderò il mio stomaco.
	AI_Output (other,self ,"DIA_GornNW_Add_15_07"); //E poi?
	AI_Output (self ,other,"DIA_GornNW_Add_12_08"); //Chi lo sa... Forse tornerò alla colonia mineraria.
	AI_Output (self ,other,"DIA_GornNW_Add_12_09"); //Qualcuno dovrà pur tener d'occhio gli orchi, altrimenti si presenteranno alla porta senza alcun avvertimento.
};
