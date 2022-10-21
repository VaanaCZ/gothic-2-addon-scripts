//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_Hi   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10023_Wache_Hi_Condition()
{	
	if (Npc_GetDistToNpc (self,other) <= 300)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Hey, where are you going? Do you want to go into this passage?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//Well sure, why not?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//There are even more slaves back there. As far as I'm concerned you can go in, but don't hit them so hard they can't work any more.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//After all, we certainly don't want them just sitting around. They have to dig for gold.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//I see. And who ordered that?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//That is a direct order from Bloodwyn.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//I thought Raven was the boss here.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//Right - but he gave the slaves to Bloodwyn. He doesn't have any more use for them.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Raven has no more use for the slaves. They now belong to Bloodwyn."); 
};
//---------------------------------------------------------------------
//	Info go
//---------------------------------------------------------------------
var int PrisonGuard_Rules;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_go   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent   = TRUE;
	description = "Let the slaves go!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//Let the slaves go!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//Listen. Bloodwyn is in command here. The slaves belong to him, so he has the right to set them free.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//Besides, Thorus also has a say in that. And what about you?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn and Thorus have the sole right to set the slaves free.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//Do YOU have any say?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"I've had a talk with Thorus.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(show Bloodwyn's head)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"I decide WHO goes into the mine.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//I decide WHO goes into the mine.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//You're doing Esteban's old job. Then you have ABSOLUTELY NO say here. Buzz off.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Here, is that enough?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//(gags) Put that away. I don't want to see THAT.
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//It would be better for you if you let the slaves go NOW.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//Wait a minute. Bloodwyn isn't the only one who has a say here. So long as I don't have an order from Thorus, no one will be set free.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"I've had a talk with Thorus.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//But you just said that the slaves belong to Bloodwyn.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//Yes, but I also said that I won't set anyone free without an order from Thorus.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//You're one of those guys who won't take a leak without orders, eh?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//Yes, but I also said...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//...all right, spare me the rest.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//I talked with Thorus. He ordered the slaves to be set free.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//Okay, if Thorus ordered it. But I have to ask myself why he decided on something like that...
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//...but you aren't being paid to ask questions.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//All right, all right. I'm obviously not needed here any more, so I'll go get me some stew.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
