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
	description = "¿Todo va bien?";
};                       
FUNC INT DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_00"); //¿Todo va bien?
	if (MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_01"); //Me has salvado el pellejo, tío.
		AI_Output (self ,other,"DIA_GornNW_Add_12_02"); //Nunca lo olvidaré.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_03"); //Milten me sacó del apuro.
		AI_Output (self ,other,"DIA_GornNW_Add_12_04"); //Nunca lo olvidaré.
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
	description = "¿Qué planes tienes ahora?";
};                       
FUNC INT DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_WhatNext_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_05"); //¿Qué quieres hacer ahora?
	AI_Output (self ,other,"DIA_GornNW_Add_12_06"); //En primer lugar, creo que me voy a zampar algo.
	AI_Output (other,self ,"DIA_GornNW_Add_15_07"); //¿Y luego?
	AI_Output (self ,other,"DIA_GornNW_Add_12_08"); //Quién sabe... a lo mejor vuelvo a la colonia minera.
	AI_Output (self ,other,"DIA_GornNW_Add_12_09"); //Alguien debería vigilar a los orcos. Si no lo hacemos, el día menos pensado se plantan en nuestras puertas.
};
