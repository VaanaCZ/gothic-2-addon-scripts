// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bill_EXIT(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 999;
	condition	= DIA_Addon_Bill_EXIT_Condition;
	information	= DIA_Addon_Bill_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Bill_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bill_PICKPOCKET (C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 900;
	condition	= DIA_Addon_Bill_PICKPOCKET_Condition;
	information	= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};
 
FUNC VOID DIA_Addon_Bill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
	
func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello
// ************************************************************
INSTANCE DIA_Addon_Bill_Hello(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 1;
	condition	= DIA_Addon_Bill_Hello_Condition;
	information	= DIA_Addon_Bill_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Bill_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Bill_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //How are things going with you?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //What's up? Did Henry send you here?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Tell him he'll get his planks as soon as I'm done.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //If he can't wait that long, he's welcome to saw them himself.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
INSTANCE DIA_Addon_Bill_Planks(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 2;
	condition	= DIA_Addon_Bill_Planks_Condition;
	information	= DIA_Addon_Bill_Planks_Info;

	description = "What are all these planks for?";
};                       
FUNC INT DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Bill_Planks_Info()
{	
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //What are all these planks for?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //We use them for the palisade, you dimwit.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg thought it would be a good idea to secure our camp this way.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //We can save ourselves the work, if you ask me.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //If the bandits are really planning to attack us, this ridiculous palisade isn't going to stop them.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //We should never have tolerated them in our valley in the first place.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //If I had known all this in advance, I'd have stayed in Khorinis.
};
	
// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 4;
	condition	= DIA_Addon_Bill_Perm_Condition;
	information	= DIA_Addon_Bill_Perm_Info;
	permanent	= TRUE;
	description	= "Can I help you saw?";
};
func int DIA_Addon_Bill_Perm_Condition ()
{
	if (GregIsBack == FALSE)
	&& (Npc_WasInState (self, ZS_Saw))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Can I help you saw?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Nah, I can handle this by myself.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //I joined up here not long ago, and letting others do my work won't get me anywhere, if you get my drift.
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 5;
	condition	= DIA_Addon_Bill_Perm2_Condition;
	information	= DIA_Addon_Bill_Perm2_Info;
	permanent	= TRUE;
	description	= "What are you doing now?";
};
func int DIA_Addon_Bill_Perm2_Condition ()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //What are you doing now?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //I'm taking a break.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(gloating) Francis got my old job.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Let him saw planks until his arms fall off.
	};
};



// ************************************************************
// ***														***
// 					Die Angus und Hank Show
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 11;
	condition	= DIA_Addon_Bill_AngusnHank_Condition;
	information	= DIA_Addon_Bill_AngusnHank_Info;
	permanent	= FALSE;
	description = "I'm looking for Angus and Hank.";
};                       
FUNC INT DIA_Addon_Bill_AngusnHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&&  Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bill_AngusnHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //I'm looking for Angus and Hank.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(sighs) I've no idea where they are - the bandits must have got them.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //You were friends with them, weren't you?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //All I know is that they were going to meet up with the bandits in a cave not far from here.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //It must be somewhere outside of our camp, to the east. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //I don't know where exactly. I've never been there myself.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Maybe you should ask Alligator Jack about this. He's always roaming around outside the camp.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus and Hank had a cave east of the camp. Alligator Jack may know more about it.");
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 12;
	condition	= DIA_Addon_Bill_FoundFriends_Condition;
	information	= DIA_Addon_Bill_FoundFriends_Info;
	permanent	= FALSE;
	description = "I found your friends.";
};                       
FUNC INT DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_FoundFriends_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //I found your friends.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //And? Where are they?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //They're dead.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(hatefully) Those damned bandits did this!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //It's possible.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Those cursed swine. May they roast in hell.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(to himself, hatefully) If only I knew the name of the lowlife who did this ...
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill was completely done in when I told him about the death of Angus and Hank. He wants the names of the murderers.");
};	

// ------------------------------------------------------------
// 						Ich kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "I know who murdered Angus and Hank.";
};
func int DIA_Addon_Bill_JuanMurder_Condition ()
{
	if (MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_JuanMurder_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //I know who murdered Angus and Hank.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(excitedly) Who? Who did it?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //His name is Juan, he's one of the bandits.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //You've got to do that bastard in, do you hear me?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //He must not get away with this.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"I am supposed to kill Juan, as a revenge for Angus and Hank.");
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 14;
	condition	= DIA_Addon_Bill_KilledEsteban_Condition;
	information	= DIA_Addon_Bill_KilledEsteban_Info;

	description = "Juan is history.";
};                       
FUNC INT DIA_Addon_Bill_KilledEsteban_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead (Juan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_KilledEsteban_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan is history.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(eagerly) And? Did he suffer?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Come off it, kid!
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(sighs) Oh well. Just as long as you killed the swine.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan is finished. Bill was very pleased.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Bill_KillAngusMurder);
	
};



// ************************************************************
// ***														***
//							Pick Pocket
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis		(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr		 	= 21;
	condition	= DIA_Addon_Bill_Khorinis_Condition;
	information	= DIA_Addon_Bill_Khorinis_Info;

	description	= "You've been to Khorinis?";
};
func int DIA_Addon_Bill_Khorinis_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //You've been to Khorinis?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Yes, I kept myself afloat there picking pockets and doing a little swindle or two.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //But when ever fewer ships came in, business got worse and worse.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //At some point, I got tired of being on the run from the militia for a few crusts of bread.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //That's when I joined Greg. Now I'm stuck here.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(sighs) Sawing all day to build a palisade that's of no use to anyone.
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 22;
	condition	= DIA_Addon_Bill_TeachPlayer_Condition;
	information	= DIA_Addon_Bill_TeachPlayer_Info;
	
	description	= "Can you teach me something?";
};
func int DIA_Addon_Bill_TeachPlayer_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_TeachPlayer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Can you teach me something?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //Well, I could show you how to pick other people's pockets unnoticed.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //But you should be fairly dexterous, or you can just forget it.

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 23;
	condition	= DIA_Addon_Bill_LearnTalent_Condition;
	information	= DIA_Addon_Bill_LearnTalent_Info;
	permanent 	= TRUE;
	description	= "Show me how to pick pockets. (10 LP)";
};
func int DIA_Addon_Bill_LearnTalent_Condition ()
{
	if (Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_LearnTalent_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Show me how to pick pockets.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man für Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //First, you need to make your intended victim feel completely safe.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //I used to walk up to people and chat to them. That worked like a charm.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //Then you can take a snatch, but make sure they don't notice a thing.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Anything else?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Yes, keep training your dexterity. The more dexterous you are, the more chances you'll recognize.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //And the sooner you can relieve your victim of his stuff without getting CAUGHT!
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //That's all - in theory, at least.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Forget it! You're not nimble enough!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //You'll have to become more dexterous first, or find a better teacher.
	};
};

