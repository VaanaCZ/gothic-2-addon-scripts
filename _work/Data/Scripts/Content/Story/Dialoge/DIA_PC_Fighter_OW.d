
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
	
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_00");	//Enough of this lounging about - you're free!
	AI_Output 	(self ,other,"DIA_GornOW_Hello_12_01"); //It's about time somebody got me out of here.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_02");	//I certainly hadn't expected it to be you, though. It's damn good to see you.
	AI_Output	(other,self ,"DIA_GornOW_Hello_15_03");	//(grins) Garond says you eat too much and he can no longer afford to feed you.
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_04");	//Now that you mention it, I could stand a couple of beers. Let's get out of here, I've seen enough of this cell.
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other,"DIA_GornOW_Add_12_00"); //Wait, I've still got something here that you can really use.
		AI_Output (self ,other,"DIA_GornOW_Add_12_01"); //I found this armor here in the cell. Some prisoner must have hidden it here.
		B_GiveInvItems (self, other, itar_sld_M, 1);
		AI_Output (self ,other,"DIA_GornOW_Add_12_02"); //It's too small for me, but it might fit you ...
		AI_Output (other,self ,"DIA_GornOW_Add_15_03"); //Thanks! I'll see you at Milten's ...
	}
	else
	{
		AI_Output 	(other,self ,"DIA_GornOW_Hello_15_05");	//OK, see you at Milten's.
	};
	AI_Output	(self ,other,"DIA_GornOW_Hello_12_06");	//Sure thing.
	
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
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_00");//Listen - I've loafed around here long enough. It's time I saw something other than this valley.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_01");//How did you get over the pass?
	AI_Output (other, self,"DIA_GornOW_MetMilten_15_02");//There is a path through the abandoned mine.
	AI_Output (self ,other,"DIA_GornOW_MetMilten_12_03");//Good. I'll wait for the right moment and then I'm out of here.
	
	if (other.guild != GIL_SLD)
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_04");//Where will you go then?
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_05");//I heard that Lee is still alive. I want to join up with him again.
	}
	else
	{
		AI_Output (other, self,"DIA_GornOW_MetMilten_15_06");//Then go to Onar's Farm. Lee and his boys are there. He needs good men such as you.
		AI_Output (self ,other,"DIA_GornOW_MetMilten_12_07");//I'll do that. I'll go check out how they're doing there.
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
	description = "We'll meet again.";
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
	AI_Output	(other,self ,"DIA_GornOW_SeeYou_15_00");//We'll meet again.
	AI_Output	(self ,other,"DIA_GornOW_SeeYou_12_01");//You can count on it.
	
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
