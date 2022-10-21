// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Wambo_EXIT(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 999;
	condition	= DIA_Wambo_EXIT_Condition;
	information	= DIA_Wambo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wambo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wambo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wambo_PICKPOCKET (C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 900;
	condition	= DIA_Wambo_PICKPOCKET_Condition;
	information	= DIA_Wambo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(It would be risky to steal his key)";
};                       

FUNC INT DIA_Wambo_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_04) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= 40)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Wambo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wambo_PICKPOCKET);
	Info_AddChoice		(DIA_Wambo_PICKPOCKET, DIALOG_BACK 		,DIA_Wambo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wambo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wambo_PICKPOCKET_DoIt);
};

func void DIA_Wambo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_04, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Wambo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Wambo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wambo_PICKPOCKET);
};
//*************************************************************
//		Was machst du hier?
//*************************************************************
INSTANCE DIA_Wambo_Job(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 5;
	condition	= DIA_Wambo_Job_Condition;
	information	= DIA_Wambo_Job_Info;
	permanent	= FALSE;
	description = "What are you doing here?";
};                       

FUNC INT DIA_Wambo_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wambo_Job_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Job_15_00"); //What are you doing here?
	AI_Output (self ,other,"DIA_Wambo_Job_03_01"); //I make sure that nobody enters the houses.
	AI_Output (self ,other,"DIA_Wambo_Job_03_02"); //Explicit order from Lord Hagen. And don't even think about violating this order!
};
//*************************************************************
//		Wie ist die Lage?
//*************************************************************
INSTANCE DIA_Wambo_Situation(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 10;
	condition	= DIA_Wambo_Situation_Condition;
	information	= DIA_Wambo_Situation_Info;
	permanent	= TRUE;
	description = "How are things?";
};                       

FUNC INT DIA_Wambo_Situation_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Wambo_Job))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Wambo_Situation_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Situation_15_00"); //How are things?
	AI_Output (self ,other,"DIA_Wambo_Situation_03_01"); //At the moment, everything is quiet.
};
//*************************************************************
//		Ramirez
//*************************************************************
INSTANCE DIA_Wambo_Ramirez(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 5;
	condition	= DIA_Wambo_Ramirez_Condition;
	information	= DIA_Wambo_Ramirez_Info;
	permanent	= FALSE;
	description = "I come from our mutual friend Ramirez.";
};                       

FUNC INT DIA_Wambo_Ramirez_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Ramirez_Viertel))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Wambo_Ramirez_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Ramirez_15_00"); //I come from our mutual friend Ramirez.
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_01"); //Oh? That Ramirez is a little rat. And he's no friend of mine. Never mind. Did you bring me anything?
	AI_Output (other,self ,"DIA_Wambo_Ramirez_15_02"); //That depends on what it is you want.
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_03"); //(quietly) Okay, I'll tell you how it works. You pay 250 gold pieces. Then I won't be here at night.
	AI_Output (self ,other,"DIA_Wambo_Ramirez_03_04"); //If you're too conspicuous anyway and I happen to be in the area, the deal is off.
};
//*************************************************************
//	Deal
//*************************************************************
INSTANCE DIA_Wambo_Deal(C_INFO)
{
	npc			= Mil_316_Wambo;
	nr			= 5;
	condition	= DIA_Wambo_Deal_Condition;
	information	= DIA_Wambo_Deal_Info;
	permanent	= TRUE;
	description = "(Pay 250 gold)";
};                       
//-----------------------------------
var int DIA_Wambo_Deal_permanent;
//-----------------------------------
FUNC INT DIA_Wambo_Deal_Condition()
{
	if Npc_KnowsInfo (other,DIA_Wambo_Ramirez)
	&& (DIA_Wambo_Deal_permanent == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Wambo_Deal_Info()
{	
	AI_Output (other,self ,"DIA_Wambo_Deal_15_00"); //I've got your money ...
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{
		AI_Output (self ,other,"DIA_Wambo_Deal_03_01"); //All right, then I'll disappear in the evening from now on.
		AI_Output (self ,other,"DIA_Wambo_Deal_03_02"); //And remember - if you cause trouble around me, I don't know you.
		
		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self, "DRINK");
	}
	else
	{
		AI_Output (other,self ,"DIA_Wambo_Deal_15_03"); //... but not with me right now.
		AI_Output (self ,other,"DIA_Wambo_Deal_03_04"); //I can't stand it when somebody tries to make a fool out of me. So get the gold.
		AI_StopProcessInfos (self);
	};
};
