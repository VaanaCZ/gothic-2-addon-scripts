
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornOW_EXIT(C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 999;
	condition	= DIA_GornOW_EXIT_Condition;
	information	= DIA_GornOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_GornOW_Hello (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_Hello_Condition;
	information	= DIA_GornOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_Hello_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_GornOW_Hello_Info()
{	

	VAR C_NPC Milten;
	Milten			= Hlp_GetNpc(PC_Mage_OW);
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Basta de holgazanear. ¡Eres libre!
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //Ya era hora de que alguien me sacara de aquí.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//Sin embargo, no me esperaba que fueses tú. Me alegro un montón de verte.
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//(Sonríe de oreja a oreja) Garond dice que comes demasiado y que lo estás arruinando el presupuesto.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Ahora que lo dices, me vendrían bien un par de cervezas. Vámonos. Estoy harto de esta celda.
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Espera, tengo algo que podría venirte bien.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //En la celda he encontrado esta armadura. La debió esconder algún preso.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //A mí me está demasiado pequeña, pero a ti podría valerte...
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //¡Gracias! Te veo en casa de Milten...
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//Vale, nos vemos en casa de Milten.
	};
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_06");	//Seguro.
	
	AI_StopProcessInfos (self);
	
	Npc_ExchangeRoutine	(self,"FREE"); 
	B_StartOtherRoutine (Milten,"GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP (XP_RescueGorn);
};

// ************************************************************
// 			Bei Milten
// ************************************************************
INSTANCE DIA_GornOW_MetMilten (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 2;
	condition	= DIA_GornOW_MetMilten_Condition;
	information	= DIA_GornOW_MetMilten_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_GornOW_MetMilten_Condition()
{
	if (Mis_RescueGorn == LOG_SUCCESS)
	&& (Npc_GetDistToWP	(self,"OC_MAGE_LIBRARY_IN") <=	500) 
	&&  Npc_IsInState (self, ZS_Talk)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_GornOW_MetMilten_Info()
{	
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//Mira, ya he holgazaneado lo suficiente. Ya es hora de que vea algo distinto a este valle.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//¿Cómo has cruzado el paso?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//Hay un sendero que cruza la mina abandonada.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//Bien. Esperaré al momento adecuado y me largaré.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//¿Dónde vas a ir?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//Me he enterado de que Lee sigue vivo. Quiero volver a asociarme con él.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//En ese caso, ve a la granja de Onar. Lee y sus muchachos están allí. Necesita hombres válidos como tú.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//Voy a hacerlo. Iré a ver qué tal les va.
	};
};	

// ************************************************************
// 	Perm Kap.2
// ************************************************************
INSTANCE DIA_GornOW_SeeYou (C_INFO)
{
	npc			= PC_Fighter_OW;
	nr			= 900;
	condition	= DIA_GornOW_SeeYou_Condition;
	information	= DIA_GornOW_Seeyou_Info;
	permanent	= TRUE;
	description = "Volveremos a vernos.";
};                       
FUNC INT DIA_GornOW_SeeYou_Condition()
{
	if Npc_KnowsInfo (other,DIA_GornOW_MetMilten)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_GornOW_SeeYou_Info()
{	
	AI_Output	(other,self ,"DIA_GornOW_SeeYou_15_00");//Volveremos a vernos.
	AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//Cuenta con ello.
	
	/*
	if (other.guild == GIL_KDF)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	}
	else //SLD
	{
		AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//
	};
	*/
	AI_StopProcessInfos (self);
};	
