// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //Hey, what happened down there?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //I flattened Franco.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //So? Then now it's YOUR job to make sure the lazy dogs do their work every day.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //Hey, I'm not here to be bothered with the hunters. I want to enter the camp.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //Forget it. You did in Franco - now you're the leader. So do your job.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //If I'm the leader, then I decide who goes in next.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //And I decided that I'M next.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //(laughs) It isn't that easy. We haven't asked for ANYONE, so NO one gets in.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //Thorus can send a new leader for the hunters, then there will be a vacancy inside for me.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //(laughs) You don't give up, do you? Okay, then move your butt inside.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //Thorus will make sure that the hunters won't have to live without a leader.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //What are you waiting for? And get yourself a pickaxe.
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //Hey, what do you want? I can't imagine you have a permit for the camp.
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //Franco sent me. He wants to know if anyone is needed in the camp.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //Yeah, we need someone. Another one of the guys kicked the bucket yesterday.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //That idiot tangled with Esteban.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //Who is Esteban?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //The leader of the lower camp. He decides who gets into the mine.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //So tell Franco that Thorus wants a new man. Got it?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"Thorus needs a new man for the camp. Franco will be interested.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? THE Thorus?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? Never heard of him...",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //Hey, slow down! You aren't getting in there - so beat it!
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //Thorus? THE Thorus?
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //Yes. THE Thorus. THE man who calls for new people.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //The man who decides if and when a new guy gets out of the swamp and into the camp.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //You aren't trying to tell me that you know him from earlier?
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //Well... yes...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //Listen - EVERYONE knows Thorus.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //Nevertheless, you aren't getting in - and I WON'T give him a message!
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //Thorus? Never heard of him...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //Oh man, you don't know him? He was the chief of the guards in the Old Camp.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //He's the man everybody trusts.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //He calls for new people, and he decides if and when a new man gets into the camp.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //If you live long enough, you'll get to know him.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //One more step and it'll be your last!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //Some people never learn...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "I'm the new man.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //I'm the new man.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //Hey, don't try to fool me. It's still Franco who decides which of you gets into the camp.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "Franco sent me...";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //Franco sent me...
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //He did not. So beat it, otherwise I'll break your bones...
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "Everything under control?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //Everything under control?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //Everything is fine here - as long as no one tries to get in who SHOULDN'T.
	
	AI_StopProcessInfos (self);
};


