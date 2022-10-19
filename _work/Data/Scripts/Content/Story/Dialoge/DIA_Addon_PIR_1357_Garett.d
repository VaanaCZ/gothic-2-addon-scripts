// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Garett_EXIT(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 999;
	condition	= DIA_Addon_Garett_EXIT_Condition;
	information	= DIA_Addon_Garett_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Garett_PICKPOCKET (C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 900;
	condition	= DIA_Addon_Garett_PICKPOCKET_Condition;
	information	= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen (36, 55);
};
 
FUNC VOID DIA_Addon_Garett_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
	
func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
INSTANCE DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Anheuern_Condition;
	information	= DIA_Addon_Garett_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Anheuern_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Don't even think about asking me to join your raiding troop.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //What do you think the other boys will do once I'm gone, huh?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //When I come back, there won't be ONE full crate left in my hut!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //I'll just stay here and guard our supplies.
};

// ************************************************************
// 	 				   Hello 
// ************************************************************
INSTANCE DIA_Addon_Garett_Hello(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Hello_Condition;
	information	= DIA_Addon_Garett_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Hello_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //What have we here? A fresh face. And not one of those filthy bandits, I hope.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //I'm Garett. If there's anything you need, ask me first.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //I can get you almost anything. Wine, weapons, and other stuff you might need.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Except for booze - if it's a decent drink you want, go see Samuel.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	
};

// ************************************************************
// 	 				  		Samuel 
// ************************************************************
INSTANCE DIA_Addon_Garett_Samuel(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 2;
	condition	= DIA_Addon_Garett_Samuel_Condition;
	information	= DIA_Addon_Garett_Samuel_Info;
	permanent	= FALSE;
	description = "Who's Samuel?";
};                       
FUNC INT DIA_Addon_Garett_Samuel_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Samuel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //Who's Samuel?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //He's our moonshiner. He's got his cave on the beach, a little distance from the camp.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //You can't miss it, just walk north.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //You'll be well advised to keep yourself supplied with grog.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Some of the boys here aren't very fond of greenhorns at all, if you get my drift.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //A decent swig of grog can work wonders for you!

	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
INSTANCE DIA_Addon_Garett_Warez(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Warez_Condition;
	information	= DIA_Addon_Garett_Warez_Info;

	description = "Where do you get your supplies?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Where do you get your supplies?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Skip always brings loads of stuff from Khorinis when he visits there.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Until recently, he used to sell some of it directly to the bandits.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //But since we've been at war with the bandits, I'm the one who ends up with all the stuff now.
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
INSTANCE DIA_Addon_Garett_Bandits(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Bandits_Condition;
	information	= DIA_Addon_Garett_Bandits_Info;

	description = "What do you know about the bandits?";
};                       
FUNC INT DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Garett_Bandits_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //What do you know about the bandits?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //You'd better ask Skip about that.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //He's been through quite a lot with that bunch, let me tell you.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg has given orders to do away with any bandit who shows up near the camp.
};



// ************************************************************
// ***														***
// 						Greg + Kompass
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg 
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Greg(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 4;
	condition	= DIA_Addon_Garett_Greg_Condition;
	information	= DIA_Addon_Garett_Greg_Info;
	permanent	= FALSE;
	description = "Your Captain Greg. What's he like?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //Your Captain Greg. What's he like?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //He's a tough old bastard, and no doubt about it.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //And greedy to the bone.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //He makes Francis, our treasurer, pay out not a penny more than what it takes to prevent a mutiny.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //And if one of us ever gets his hands on something REALLY valuable, he'll inevitably take it for himself.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //I once took a compass from a royal frigate.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //That bastard Greg made me hand it over, of course.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Bah. He probably buried it somewhere, just like the rest of his treasures.
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Tips(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 5;
	condition	= DIA_Addon_Garett_Tips_Condition;
	information	= DIA_Addon_Garett_Tips_Info;

	description = "Where might Greg have buried that compass?";
};                       
FUNC INT DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Tips_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Where might Greg have buried that compass?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Greg once told me that Death himself watches over my compass. Then he laughed.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Anything else?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //There's a beach at the southern coast. It can only be reached by sea.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Greg is said to have been there often. Maybe you'll find something there.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //I once went there to see what I might find myself, but the area is teeming with monsters.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //If you really want to give it a try, don't forget to bring a pick.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg has taken a valuable compass from Garret. Garret suspects that he buried it somewhere on the southern beach.");
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 6;
	condition	= DIA_Addon_Garett_GiveKompass_Condition;
	information	= DIA_Addon_Garett_GiveKompass_Info;
	permanent	= FALSE;
	description = "Here's your compass.";
};                       
FUNC INT DIA_Addon_Garett_GiveKompass_Condition()
{
	if (Npc_HasItems (other,ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Addon_Garett_GiveKompass_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Here's your compass.
	
	//Patch m.f. - weil Händler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //(happily) Yes, that's it. I never thought I'd see it again.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //Thanks, man!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //This time Greg WON'T get hold of it again ...
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //Here, take this belt in return. It's my most valuable piece.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //You bought this belt from me, remember?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //And you paid a lot for it - (hastily) not that it wasn't worth it. Here - take back your gold.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret was very pleased that I brought his compass back.");
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP (XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis 
// ************************************************************
INSTANCE DIA_Addon_Garett_Francis(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 7;
	condition	= DIA_Addon_Garett_Francis_Condition;
	information	= DIA_Addon_Garett_Francis_Info;
	permanent	= FALSE;
	description = "What can you tell me about Francis?";
};                       
FUNC INT DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Francis_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //What can you tell me about Francis?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg put him in command while he's gone.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //But Francis is a total failure as a leader!
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //He can't even get Morgan to stir his lazy ass out of bed.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Henry and his boys are the only ones doing anything around here.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //The others are just enjoying themselves instead of working.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //I can only hope that Greg will come back soon.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //He'll give them all a good swift kick in the ass.
	};
};

// ************************************************************
// 								PERM
// ************************************************************
INSTANCE DIA_Addon_Garett_PERM   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 99;
	condition   = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent   = TRUE;
	description = "Anything new?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Anything new?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Nothing ever happens any more since Greg left.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Now that Greg has come back, things are starting to look up around here.
	};
};

// ************************************************************
// 								Trade
// ************************************************************
INSTANCE DIA_Addon_Garett_Trade   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 888;
	condition   = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent   = TRUE;
	description = DIALOG_TRADE;
	trade		= TRUE;
};
FUNC INT DIA_Addon_Garett_Trade_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; 	Garett_Random = Hlp_Random (3); 
	if Garett_Random == 0
	{
		B_Say (other,self,"$TRADE_1");
	}
	else if Garett_Random == 1
	{
		B_Say (other,self,"$TRADE_2");
	}
	else
	{
		B_Say (other,self,"$TRADE_3");
	};	
		
	B_GiveTradeInv (self);
	
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
};


