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
	description = "Jsi v po��dku?";
};                       
FUNC INT DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_00"); //Jsi v po��dku?
	if (MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_01"); //Zachr�nils mi krk, chlape.
		AI_Output (self ,other,"DIA_GornNW_Add_12_02"); //Nikdy na to nezapomenu.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_03"); //Milten m� z toho dostal.
		AI_Output (self ,other,"DIA_GornNW_Add_12_04"); //Nikdy na to nezapomenu.
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
	description = "Co chce� d�lat?";
};                       
FUNC INT DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_WhatNext_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_05"); //Co bude� d�lat te�?
	AI_Output (self ,other,"DIA_GornNW_Add_12_06"); //Mysl�m, �e se ze v�eho nejd��v po��dn� nadl�bnu.
	AI_Output (other,self ,"DIA_GornNW_Add_15_07"); //A pak?
	AI_Output (self ,other,"DIA_GornNW_Add_12_08"); //Kdo v�... Mo�n� se vr�t�m do t�a�sk� kolonie.
	AI_Output (self ,other,"DIA_GornNW_Add_12_09"); //N�kdo by m�l d�vat pozor na sk�ety - jinak se objev� u na�eho prahu bez jedin�ho varov�n�.
};
