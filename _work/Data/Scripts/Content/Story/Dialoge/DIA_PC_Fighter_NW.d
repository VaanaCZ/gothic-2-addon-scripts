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
	description = "Tout va bien ?";
};                       
FUNC INT DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_00"); //Tout va bien ?
	if (MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_01"); //Vous m�avez sauv� la vie, mon vieux.
		AI_Output (self ,other,"DIA_GornNW_Add_12_02"); //Je ne l�oublierai jamais.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_GornNW_Add_12_03"); //Milten m�a tir� de l�.
		AI_Output (self ,other,"DIA_GornNW_Add_12_04"); //Je ne l�oublierai jamais.
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
	description = "Que comptez-vous faire maintenant ?";
};                       
FUNC INT DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};
FUNC VOID DIA_GornNW_WhatNext_Info()
{	
	AI_Output (other,self ,"DIA_GornNW_Add_15_05"); //Que voulez-vous faire, maintenant ?
	AI_Output (self ,other,"DIA_GornNW_Add_12_06"); //Je crois que je vais commencer par me remplir la panse.
	AI_Output (other,self ,"DIA_GornNW_Add_15_07"); //Et apr�s ?
	AI_Output (self ,other,"DIA_GornNW_Add_12_08"); //Je ne sais pas... Peut-�tre que je retournerai � la colonie mini�re...
	AI_Output (self ,other,"DIA_GornNW_Add_12_09"); //Il vaut mieux que quelqu�un tienne les orques � l��il, sans quoi ils risquent de d�barquer chez nous sans pr�venir.
};
