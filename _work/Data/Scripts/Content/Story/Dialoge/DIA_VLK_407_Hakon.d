///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hakon_EXIT   (C_INFO)
{
	npc         = VLK_407_Hakon;
	nr          = 999;
	condition   = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Sperre		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Sperre_Condition;
	information	 = 	DIA_Hakon_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Hakon_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	{
		return TRUE;
	};
	//return FALSE;
};
func void DIA_Hakon_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Hakon_Sperre_12_00"); //Beat it, convict! Canthar told me what a nasty bastard you are!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Hallo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 =  3;
	condition	 = 	DIA_Hakon_Hallo_Condition;
	information	 = 	DIA_Hakon_Hallo_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Hakon_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Hallo_Info ()
{
	AI_Output (self ,other,"DIA_Hakon_Add_12_00"); //I am Hakon, the weapons dealer.
	AI_Output (self ,other,"DIA_Hakon_Add_12_01"); //Every man should carry a weapon these days. Especially when venturing outside of the city walls.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Hakon sells weapons at the marketplace.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Trade		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	99;
	condition	 = 	DIA_Hakon_Trade_Condition;
	information	 = 	DIA_Hakon_Trade_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Show me your wares.";
};
func int DIA_Hakon_Trade_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Hakon_Trade_15_00"); //Show me your wares.
	
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self,other,"DIA_Hakon_Trade_12_01"); //It is an honor to me that a representative of our holy church should show an interest in my wares.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Hakon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_407_Hakon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Hakon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Hakon_MissingPeople_Info;

	description	 = 	"What do you know about the disappearances of the citizens of Khorinis?";
};

func int DIA_Addon_Hakon_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Hakon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //What do you know about the disappearances of the citizens of Khorinis?
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //I have seen many pass through the eastern city gate.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //Some of those who came I had never seen before in my life, and many of those who went out never came back.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //But what happened the other day was really quite strange.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //There was this fellow who came here - I think his name is Joe. He bragged that he would soon come into some serious money.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //He claimed that he knew how to get into one of the city towers where the militia keep their arms.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //I haven't seen him since, even though I used to bump into him around the same time every day.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //I reported this to the militia. I thought that maybe he'd been caught and throughn into the dungeon.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //But Lord Andre had no idea what I was talking about. He didn't even know the fellow.

	Log_CreateTopic (TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Joe,"Halon, a trader from Khorinis, says that a man named Joe has simply vanished without a trace. He claims that Joe knows how to get into one of the city towers where the militia keep their arms."); 

	B_GivePlayerXP (XP_Ambient);
};

// ********************************************************
// 						OutOfTown
// ********************************************************
instance DIA_Hakon_OutOfTown		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_OutOfTown_Condition;
	information	 = 	DIA_Hakon_OutOfTown_Info;
	permanent	 = 	FALSE;
	description	 = 	"Tell me more about the area around the city.";
};
func int DIA_Hakon_OutOfTown_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_OutOfTown_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_02"); //Tell me more about the area around the city.
	AI_Output (self ,other,"DIA_Hakon_Add_12_03"); //It's gotten bloody dangerous out there.
	AI_Output (self ,other,"DIA_Hakon_Add_12_04"); //Because of the bandits, for one thing, and also on account of wild beasts.
	AI_Output (self ,other,"DIA_Hakon_Add_12_05"); //Even the animals don't seem to get enough to eat in these crappy times.
	AI_Output (self ,other,"DIA_Hakon_Add_12_06"); //They're venturing closer to the city all the time.
};

// ********************************************************
// 						Paladine
// ********************************************************
instance DIA_Hakon_Paladine		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	3;
	condition	 = 	DIA_Hakon_Paladine_Condition;
	information	 = 	DIA_Hakon_Paladine_Info;
	permanent	 = 	FALSE;
	description	 = 	"Do you know anything about the paladins?";
};
func int DIA_Hakon_Paladine_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Paladine_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_07"); //Do you know anything about the paladins?
	AI_Output (self ,other,"DIA_Hakon_Add_12_08"); //Yes! Those guys are ruining my business!
	AI_Output (self ,other,"DIA_Hakon_Add_12_09"); //All you can buy in this entire town is a short sword, at most.
	AI_Output (self ,other,"DIA_Hakon_Add_12_10"); //They've helped themselves to anything that's longer than a foot and a half.
	AI_Output (self ,other,"DIA_Hakon_Add_12_11"); //(sarcastically) In return, I now get to live in the hotel free of charge - ha!
};

// ********************************************************
// 						WoWaffen
// ********************************************************
instance DIA_Hakon_WoWaffen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_WoWaffen_Condition;
	information	 = 	DIA_Hakon_WoWaffen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Where do you get your weapons from?";
};
func int DIA_Hakon_WoWaffen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Hakon_WoWaffen_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_12"); //Where do you get your weapons from?
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_13"); //Nowhere! Harad has been my supplier up to now.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_14"); //Harad the smith has been my supplier up to now.
	};
	AI_Output (self ,other,"DIA_Hakon_Add_12_15"); //Now all he does is make stuff for the paladins.
	AI_Output (self ,other,"DIA_Hakon_Add_12_16"); //He works for those guys day and night like a madman, without pay. He thinks it's his duty.
	AI_Output (self ,other,"DIA_Hakon_Add_12_17"); //All I can offer you now is my remaining stock ...
};

// ********************************************************
// 						HaradBandits
// ********************************************************
instance DIA_Hakon_HaradBandits		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_HaradBandits_Condition;
	information	 = 	DIA_Hakon_HaradBandits_Info;
	permanent	 = 	FALSE;
	description	 = 	"Harad told me about the attack by bandits ...";
};
func int DIA_Hakon_HaradBandits_Condition ()
{
	if (Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_HaradBandits_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_18"); //Harad told me about the attack by bandits ...
	AI_Output (self ,other,"DIA_Hakon_Add_12_19"); //Oh? And?
	AI_Output (other, self,"DIA_Hakon_Add_15_20"); //He'll give me his approval to be accepted as an apprentice if I hunt down the bandits.
	AI_Output (self ,other,"DIA_Hakon_Add_12_21"); //(laughs) Good old Harad. That must be his way of saying he's sorry that he can't produce any weapons for me at the moment.
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Banditen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Banditen_Condition;
	information	 = 	DIA_Hakon_Banditen_Info;
	permanent	 = 	FALSE;
	description	 = 	"What do you know about the bandits?";
};
func int DIA_Hakon_Banditen_Condition ()
{
	if (Npc_KnowsInfo (hero, DIA_Hakon_HaradBandits))
	|| (Npc_KnowsInfo (hero, DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};
func void DIA_Hakon_Banditen_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_15_00"); //What do you know about the bandits?
	AI_Output (self, other, "DIA_Hakon_Banditen_12_01"); //What do I know about them? They robbed me on my way to the city!
	AI_Output (self, other, "DIA_Hakon_Banditen_12_02"); //And I'm not the only one. They've been up to their tricks for quite a while.
	AI_Output (self, other, "DIA_Hakon_Banditen_12_03"); //The militia tried to track them down, but without any success.

	MIS_HakonBandits = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HakonBanditen,LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen,"Hakon the weapons dealer was robbed by bandits outside the city." );
};


///////////////////////////////////////////////////////////////////////
//	WIEVIEL
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wieviel		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Wieviel_Condition;
	information	 = 	DIA_Hakon_Wieviel_Info;
	permanent	 = 	FALSE;
	description	 = 	"I'll deal with it ...";
};
func int DIA_Hakon_Wieviel_Condition ()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wieviel_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //I'll deal with it ...
	AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //What, YOU want to take on the bandits? By yourself? You're quite a good fighter, huh?
	AI_Output (other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //How much is the matter worth to you?
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_25"); //(slyly) You want to get in Harad's good books, don't you?
		AI_Output (self ,other,"DIA_Hakon_Add_12_26"); //I don't think I should have to pay you for this ...
	}
	else
	{
		AI_Output (self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //That's a dangerous business.
		AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //Well, it's all right with me. I'll pay you 100 gold pieces if you defeat the bandits.
		MIS_HakonBanditsPay = TRUE;
	};
	
	Info_ClearChoices (DIA_Hakon_Banditen);
};

///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Miliz		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_Miliz_Condition;
	information	 = 	DIA_Hakon_Miliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"Do you know who in the militia took part in the search?";
};

func int DIA_Hakon_Miliz_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Miliz_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Miliz_15_00"); //Do you know who of the militia took part in the search?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_01"); //The fellow's name is Pablo. He and a few others went looking for the bandits. But they didn't find them.
	AI_Output (other, self, "DIA_Hakon_Miliz_15_02"); //Do you know where I can find Pablo?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_03"); //He patrols around the city. You'll find him either at the temple square or in the lower part of town.
	
	B_LogEntry(TOPIC_HakonBanditen,"Pablo, the city guardsman, was involved in the fruitless search for the bandits." );
};
///////////////////////////////////////////////////////////////////////
//	Info Wo
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_Wo_Condition;
	information	 = 	DIA_Hakon_Wo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Where did they hold you up?";
};

func int DIA_Hakon_Wo_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wo_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Wo_15_00"); //Where did they hold you up?
	AI_Output (self, other, "DIA_Hakon_Wo_12_01"); //Near Akil's farm. Just go out the city gate from here and follow the road to the right.
	AI_Output (self, other, "DIA_Hakon_Wo_12_02"); //After a while, you'll get to a few steps. The bastards came from there. I bet they have their hideout back there in the woods.
};
///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Success		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Success_Condition;
	information	 = 	DIA_Hakon_Success_Info;
	permanent	 = 	FALSE;
	description	 = 	"I took care of the bandits.";
};

func int DIA_Hakon_Success_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	&& (Npc_IsDead (Bandit_1))
	&& (Npc_IsDead (Bandit_2))
	&& (Npc_IsDead (Bandit_3))
	
	{
		return TRUE;
	};
};
func void DIA_Hakon_Success_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Success_15_00"); //I took care of the bandits.
	AI_Output (self ,other,"DIA_Hakon_Add_12_27"); //Really? Anyone could say that. Do you have proof?
	AI_Output (other, self,"DIA_Hakon_Add_15_28"); //(sighs) Should I go back and cut off their heads?
	AI_Output (self ,other,"DIA_Hakon_Add_12_29"); //(hastily) No - I don't think that will be necessary. I believe you.
	AI_Output (self, other, "DIA_Hakon_Success_12_01"); //You have done the merchants and the city a great service.
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_30"); //Harad will be content - I think.
	};
		
	if (MIS_HakonBanditsPay == TRUE)
	{	
		AI_Output (self, other, "DIA_Hakon_Success_12_02"); //Here is the money you were promised.
		B_GiveInvItems (self, other, ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Hakon_Bandits); 
	
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Hakon_Minenanteil (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 3;
	condition	= DIA_Hakon_Minenanteil_Condition;
	information	= DIA_Hakon_Minenanteil_Info;
	permanent	= FALSE;
	description = "Where did you get those mining shares you're selling?";
};   
                    
FUNC INT DIA_Hakon_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hakon_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Hakon_Minenanteil_15_00"); //Where did you get those mining shares you're selling?
	AI_Output (self, other, "DIA_Hakon_Minenanteil_12_01"); //Sorry, but I can't tell you. It's too dangerous for me.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hakon_PICKPOCKET (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 900;
	condition	= DIA_Hakon_PICKPOCKET_Condition;
	information	= DIA_Hakon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Hakon_PICKPOCKET_Condition()
{
	C_Beklauen (45, 65);
};
 
FUNC VOID DIA_Hakon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hakon_PICKPOCKET);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_BACK 		,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};
	
func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};


// ************************************************************
// 			  				Kapitel2
// ************************************************************

INSTANCE DIA_Hakon_Kapitel2 (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 5;
	condition	= DIA_Hakon_Kapitel2_Condition;
	information	= DIA_Hakon_Kapitel2_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Hakon_Kapitel2_Condition()
{
	if (Kapitel >= 2)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hakon_Kapitel2_Info()
{	
	AI_Output (self ,other,"DIA_Hakon_Add_12_22"); //There you are again!
	AI_Output (self ,other,"DIA_Hakon_Add_12_23"); //Harad has finally finished that damn assignment for the paladins.
	AI_Output (self ,other,"DIA_Hakon_Add_12_24"); //That means that I can now offer you some new weapons. Are you interested?
};
