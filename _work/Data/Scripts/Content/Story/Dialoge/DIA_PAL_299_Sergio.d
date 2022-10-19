///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sergio_EXIT   (C_INFO)
{
	npc         = PAL_299_Sergio;
	nr          = 999;
	condition   = DIA_Sergio_EXIT_Condition;
	information = DIA_Sergio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Sergio_EXIT_Info()
{
	if (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)  // Nur wenn Sergio in der Kapelle ist M.F.  
	{
		AI_Output (self, other,"DIA_Sergio_EXIT_04_00");//May Innos illuminate your path.
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WELCOME		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr 			 =  5;
	condition	 = 	DIA_Sergio_WELCOME_Condition;
	information	 = 	DIA_Sergio_WELCOME_Info;
	important	 = 	TRUE;
};

func int DIA_Sergio_WELCOME_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other, DIA_Sergio_Isgaroth) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Sergio_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Sergio_WELCOME_04_00"); //Innos be with you, what can I do for you?
};
///////////////////////////////////////////////////////////////////////
//	Info Isgaroth
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Isgaroth		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Isgaroth_Condition;
	information	 = 	DIA_Sergio_Isgaroth_Info;
	permanent	 =  FALSE;
	important	 =  TRUE;
};
func int DIA_Sergio_Isgaroth_Condition ()
{	
	if Npc_KnowsInfo (hero,PC_PrayShrine_Paladine)
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (Kapitel == 1)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Isgaroth_Info ()
{
	AI_Output (self, other, "DIA_Sergio_Isgaroth_04_00"); //You have prayed for my brethren. I want to thank you for that. Tell me what I can do for you.
	
	Info_ClearChoices (DIA_Sergio_Isgaroth);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"What about a little donation?",DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"Let me share your fighting experience.",DIA_Sergio_Isgaroth_XP);
};	
FUNC VOID DIA_Sergio_Isgaroth_Spende()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_Spende_15_00"); //What about a little donation?
	AI_Output (self, other, "DIA_Sergio_Isgaroth_Spende_04_01"); //May this gold be of use to you.
	
	B_GiveInvItems (self,other, ItMi_Gold,100);
	Info_ClearChoices (DIA_Sergio_Isgaroth);
};
FUNC VOID DIA_Sergio_Isgaroth_XP()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_XP_15_00"); //Let me share your fighting experience.
	AI_Output (self, other, "DIA_Sergio_Isgaroth_XP_04_01"); //When you fight, always make sure that no one can attack you from behind.
	
	other.HitChance[NPC_TALENT_2H] = (other.HitChance[NPC_TALENT_2H] + 2);
	PrintScreen	(PRINT_Learn2H, -1, -1, FONT_ScreenSmall, 2);
	Info_ClearChoices (DIA_Sergio_Isgaroth);
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Aufgabe		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_Aufgabe_Condition;
	information	 = 	DIA_Sergio_Aufgabe_Info;
	description	 = 	"I need access to the library.";
};
func int DIA_Sergio_Aufgabe_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other,DIA_Sergio_Isgaroth))
	{	
		return TRUE;
	};
};
func void DIA_Sergio_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Aufgabe_15_00"); //I need access to the library.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_01"); //Well, I cannot grant you access. For that you must first fulfill your tasks.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_02"); //But I can help you. Go to Master Isgaroth and talk to him. I have heard that he needs help and would go to him - but I pass this task on to you.
	
	Sergio_Sends = TRUE;
	Wld_InsertNpc (BlackWolf,"NW_PATH_TO_MONASTER_AREA_01"); //ist richtig geschrieben! 
	
	Log_CreateTopic (Topic_IsgarothWolf,LOG_MISSION);
	Log_SetTopicStatus	 (Topic_IsgarothWolf,LOG_RUNNING);
	B_LogEntry (Topic_IsgarothWolf,"Master Isgaroth needs help at the shrine. I should look him up.");
};	

///////////////////////////////////////////////////////////////////////
//	Info WHAT
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHAT		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_WHAT_Condition;
	information	 = 	DIA_Sergio_WHAT_Info;
	description	 = 	"What are you doing here?";
};
func int DIA_Sergio_WHAT_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	{	
		return TRUE;
	};
};
func void DIA_Sergio_WHAT_Info ()
{
	AI_Output (other, self, "DIA_Sergio_WHAT_15_00"); //What are you doing here?
	AI_Output (self, other, "DIA_Sergio_WHAT_04_01"); //I am praying to Innos that he strengthen my arm and my will.
	AI_Output (self, other, "DIA_Sergio_WHAT_04_02"); //Thus, I am armed against all dangers and shall destroy all his enemies in order to do him honor.
	AI_Output (other, self, "DIA_Sergio_WHAT_15_03"); //What enemies?
	AI_Output (self, other, "DIA_Sergio_WHAT_04_04"); //All those who oppose the will of Innos. Whether they be human born or summoned creature.
};
///////////////////////////////////////////////////////////////////////
//	Info Babo
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Babo		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_Babo_Condition;
	information	 = 	DIA_Sergio_Babo_Info;
	description	 = 	"Can you go through a few exercises with Babo?";
};
func int DIA_Sergio_Babo_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other, DIA_Babo_Anliegen)
	{	
		return TRUE;
	};
};
func void DIA_Sergio_Babo_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Babo_15_00"); //Can you go through a few exercises with Babo?
	AI_Output (self, other, "DIA_Sergio_Babo_04_01"); //Why doesn't he ask me himself?
	AI_Output (other, self, "DIA_Sergio_Babo_15_02"); //I think he's shy.
	AI_Output (self, other, "DIA_Sergio_Babo_04_03"); //I see. Good, if it means so much to him, I shall train with him every morning for two hours. We begin at 5 o'clock. Tell him that.
	
	Npc_ExchangeRoutine (self, "TRAIN");
	B_StartOtherRoutine (Babo,"TRAIN");

	B_LogEntry (Topic_BaboTrain, "Sergio has agreed to train with Babo for two hours every morning from now on."); 
};
///////////////////////////////////////////////////////////////////////
//	Info WHY
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHY		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  4;
	condition	 = 	DIA_Sergio_WHY_Condition;
	information	 = 	DIA_Sergio_WHY_Info;
	description	 = 	"Why aren't you with the other paladins?";
};
func int DIA_Sergio_WHY_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Sergio_WELCOME)
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		return TRUE;
	};
};
func void DIA_Sergio_WHY_Info ()
{
	AI_Output (other, self, "DIA_Sergio_WHY_15_00"); //Why aren't you with the other paladins?
	AI_Output (self, other, "DIA_Sergio_WHY_04_01"); //It may seem unusual that I am here, however we paladins also serve the magicians, for they preach the will of Innos.
	AI_Output (self, other, "DIA_Sergio_WHY_04_02"); //We paladins are warriors in the name of Innos. His will is our law. At the moment, I am waiting for new orders from the magicians.

};
///////////////////////////////////////////////////////////////////////
//	Info ORDERS
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_ORDERS		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_ORDERS_Condition;
	information	 = 	DIA_Sergio_ORDERS_Info;
	permanent	 =  TRUE;
	description	 = 	"And do you already have new orders?";
};
func int DIA_Sergio_ORDERS_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Sergio_WHY)
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE) 
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		return TRUE;
	};
};
func void DIA_Sergio_ORDERS_Info ()
{
	AI_Output (other, self, "DIA_Sergio_ORDERS_15_00"); //And do you already have new orders?
	AI_Output (self, other, "DIA_Sergio_ORDERS_04_01"); //Until then I still have time to find strength in prayer.
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Start
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Start		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_Start_Condition;
	information	 = 	DIA_Sergio_Start_Info;
	permanent	 =  FALSE;
	description	 = 	"You are to escort me to the pass.";
};
func int DIA_Sergio_Start_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&&	(Sergio_Follow == TRUE)
	&&  (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Start_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Start_15_00"); //You are to escort me to the pass.
	AI_Output (self, other, "DIA_Sergio_Start_04_01"); //Good, then I shall do that. I know the way, so follow me.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;  
	self.npctype = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine (self,"GUIDE"); 
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Guide		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_Guide_Condition;
	information	 = 	DIA_Sergio_Guide_Info;
	permanent	 =  TRUE;
	description	 = 	"What's up?";
};
func int DIA_Sergio_Guide_Condition ()
{	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE) 
	&& (Npc_GetDistToWP (self,"NW_TO_PASS_01") > 1000)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Guide_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Guide_15_00"); //How's it going?
	AI_Output (self, other, "DIA_Sergio_Guide_04_01"); //I shall take you to the pass. But the dangerous part of the journey only begins there.
	AI_Output (self, other, "DIA_Sergio_Guide_04_02"); //But let us waste no time. We need to be on our way.
	
	AI_StopProcessInfos (self);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Ende
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Ende		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Ende_Condition;
	information	 = 	DIA_Sergio_Ende_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Sergio_Ende_Condition ()
{	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE) 
	&& (Npc_GetDistToWP (self,"NW_TO_PASS_01") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Ende_Info ()
{
	AI_Output (self, other, "DIA_Sergio_Ende_04_00"); //We are there. Whatever awaits you in the Valley of the Mines, I hope that you find your way back.
	AI_Output (other, self, "DIA_Sergio_Ende_15_01"); //Don't fear - I shall return.
	AI_Output (self, other, "DIA_Sergio_Ende_04_02"); //Go with Innos. May he always protect you.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE; 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START"); 
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Perm		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Perm_Condition;
	information	 = 	DIA_Sergio_Perm_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Sergio_Perm_Condition ()
{	
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Perm_Info ()
{
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Sergio_Perm_04_00"); //For Innos, Brother. If you have come to learn something about the Consecration of the Sword, then ask Marduk.
	}
	else
	{
		AI_Output (self, other, "DIA_Sergio_Perm_04_01"); //I have heard of you. You are the fellow from the farms who was in the Valley of Mines. My respects.
	};
	AI_StopProcessInfos (self);
	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sergio_PICKPOCKET (C_INFO)
{
	npc			= PAL_299_Sergio;
	nr			= 900;
	condition	= DIA_Sergio_PICKPOCKET_Condition;
	information	= DIA_Sergio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Sergio_PICKPOCKET_Condition()
{
	C_Beklauen (78, 85);
};
 
FUNC VOID DIA_Sergio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sergio_PICKPOCKET);
	Info_AddChoice		(DIA_Sergio_PICKPOCKET, DIALOG_BACK 		,DIA_Sergio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sergio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sergio_PICKPOCKET_DoIt);
};

func void DIA_Sergio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sergio_PICKPOCKET);
};
	
func void DIA_Sergio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sergio_PICKPOCKET);
};




 









