//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_EXIT   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 999;
	condition   = DIA_Addon_Patrick_EXIT_Condition;
	information = DIA_Addon_Patrick_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Hi   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Hi_Condition;
	information = DIA_Addon_Patrick_Hi_Info;
	permanent   = FALSE;
	description = "I've been sent by the Water Mages. I've come to free you.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//I've been sent by the Water Mages. I've come to free you.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(warily) Really? And why should I believe you?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Do you want to get out of here, or not?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Of course I want to get out - but ...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Vatras sent me. If that's not enough for you, you can all rot in this hole for all I care.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(hastily) All right, I believe you.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(baffled) Really? Wow, that went faster than I thought. Okay, now all we need is a plan.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Trying to flee poses a great risk. William tried, and he bought it.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//The prisoners are peasants and workers - they trust me, but they won't dare to mount an escape.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"What do you want me to do - get you a pardon from Raven?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Will I have to kill all the bandits before you'll budge at all?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//But that can't be the plan.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Just see to it that the guards don't attack us, and then we'll get out of here.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Okay, I'll handle that. Tell the others to get ready.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"The slaves will not dare attempt to escape. I have to find a way to let them leave the camp unmolested.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//What do you want me to do - get you a pardon from Raven?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(grinning) Not a bad idea.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//Will I have to kill all the bandits before you'll budge at all?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(scared) But that would be insane!
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};

//---------------------------------------------------------------------
//	ready
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_ready   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_ready_Condition;
	information = DIA_Addon_Patrick_ready_Info;
	permanent   = FALSE;
	description = "All's well, you can make yourselves scarce.";
};
FUNC INT DIA_Addon_Patrick_ready_Condition()
{	
	if (Ready_Togo == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Patrick_Hi))
	
	|| (Npc_IsDead (PrisonGuard)
	&&  Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Thorus_Answer)) 
	
	|| (Npc_IsDead (Thorus)
	&&  Npc_IsDead (Bloodwyn)
	&&  Npc_IsDead (PrisonGuard))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_ready_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//All's well, you can make yourselves scarce.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Great. I know a cave in the swamp where we can gather for now. But then what?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Leave the swamp towards the south-west. The Water Mages have set up their camp near the ruins of the old temple.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//They're going to show you the way out of this valley.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Thanks, thank you so much. (commencing) We are all very deeply ...
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_05");//Never mind.
	
	Sklaven_Flucht = TRUE; 
	B_GivePlayerXP (XP_Addon_Flucht);
	
	AI_StopProcessInfos (self);
	
	//AI_UseMob			(self,"ORE",-1);

	Npc_ExchangeRoutine (self,"FLUCHT");
	
	B_StartOtherRoutine (Telbor, "FLUCHT");
	B_StartOtherRoutine (Tonak, "FLUCHT");
	B_StartOtherRoutine (Pardos,"FLUCHT");
	B_StartOtherRoutine (Monty,"FLUCHT");	
	
	B_StartOtherRoutine (Buddler_1,"WORK");
	B_StartOtherRoutine (Buddler_2,"WORK");
	B_StartOtherRoutine (Buddler_3,"WORK");
	
	B_RemoveNpc (STRF_1128_Addon_Sklave);
	B_RemoveNpc (STRF_1129_Addon_Sklave);
	B_RemoveNpc (STRF_1130_Addon_Sklave);
	
	B_RemoveNpc (STRF_1136_Addon_Sklave);
	B_RemoveNpc (STRF_1137_Addon_Sklave);
	B_RemoveNpc (STRF_1138_Addon_Sklave);
	B_RemoveNpc (STRF_1139_Addon_Sklave);
	B_RemoveNpc (STRF_1140_Addon_Sklave);
	
	
};
//---------------------------------------------------------------------
//	Killer
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Killer   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Killer_Condition;
	information = DIA_Addon_Patrick_Killer_Info;
	permanent   = FALSE;
	description = "The guard is done for, you can go now.";
};
FUNC INT DIA_Addon_Patrick_Killer_Condition()
{	
	if Npc_IsDead (PrisonGuard)
	&& (Ready_Togo == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Patrick_Hi))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_Killer_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//The guard is done for, you can go now.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//And what happens once we leave the mine? The other guards will slaughter us then. No, that's too risky.
};
//---------------------------------------------------------------------
//	Hoehle
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Hoehle   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Hoehle_Condition;
	information = DIA_Addon_Patrick_Hoehle_Info;
	permanent   = TRUE;
	description = "Don't you want to leave?";
};
FUNC INT DIA_Addon_Patrick_Hoehle_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_BL_HOEHLE_04") <= 1000)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//Don't you want to leave?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Of course we do. We're only waiting for the right moment.
};



	
	
