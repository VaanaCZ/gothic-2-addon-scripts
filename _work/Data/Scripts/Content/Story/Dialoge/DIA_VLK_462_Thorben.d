// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //You have murdered my Gritta. I shall never forgive you. Out of my sight, you murderer!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //Ah! A fresh face. You're not from Khorinis, are you?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //This is not a good time for travelers. Bandits everywhere, no work, and now the farmers have risen up, too.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //What winds have blown you here?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "I'm looking for work.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //I'm looking for work.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //Do you know anything about carpentry?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //The only thing I can make out of wood is a fire.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //And what about locks?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //Weeell ...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //I'm sorry, but I can't use you if you know nothing about my trade.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //And I have no money to pay for an apprentice.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben won't have me as his apprentice.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "What if I want to start an apprenticeship with one of the other masters here?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //What if I want to start an apprenticeship with one of the other masters here?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //All right, I shall give you my approval.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //But you had better get yourself the blessing of the gods first.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Say, are you a man of faith?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "Well, if you mean, do I say my prayers regularly ...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Yes. A most humble servant, Master Thorben.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Then go to Vatras, the priest of Adanos, and have him give you his blessing.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //He will tell you where you can find a priest of Innos. You should get his blessing, too.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Once you have received the blessing of the gods, I shall vote for you.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben will give his approval, if a priest of Adanos and a priest of Innos give me their blessing.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Yes. A most humble servant, Master Thorben.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //Well, if you mean, do I say my prayers regularly ...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //I see!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //A man who does not ply his trade with the blessing of the gods will never receive my approval.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Ask the gods for forgiveness for your transgressions.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "How about your approval, Master?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //How about your approval, Master?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Has Vatras given you his blessing?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Yes.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //And did you also get the blessing of a priest of Innos?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Yes, I did.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //Then you shall have my blessing as well. No matter what path you decide to take - take pride in doing a good job, my boy!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Thorben will give his approval if I want to start work as an apprentice.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //No. Not yet ...
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //You know my terms. You should only ply your trade with the blessing of the gods.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Not yet ...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //Then I don't know why you're asking me again. You know my terms.
	};
};

// ************************************************************
// 		Was weißt du über Schlösser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "So you know a lot about locks?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //So you know a lot about locks?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //What good is a fine chest without a fine lock?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //I make my own locks. That way, I can at least be sure that I haven't built my chests that sturdy for nothing.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //A poorly made lock is easy to break. And there are plenty of thieves about in Khorinis. Especially lately!
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "I've got Lehmar's ledger right here ...";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //I've got Lehmar's ledger right here ...
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //(suspiciously) Where did you get that?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //That shouldn't interest you so much as the fact that your name is in it.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Give it to me!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //What will you give me, then?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //I have no money to spare and can give you nothing but my heartfelt gratitude.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schlösser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "Can you teach me how to pick locks?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //Can you teach me how to pick locks?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //If it weren't for you, I'd be paying Lehmar for the rest of my life.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //I shall teach you what you want to know.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //You have brought me the 100 gold pieces. That was very decent of you.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //I am almost embarrassed, but I must ask even more of you.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //If I cannot pay back my debt to Lehmar soon, he's going to send his thugs after me.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Give me another 100 gold pieces, and I shall instruct you.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "How much do you charge?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Fine. Here are 100 gold pieces.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //You have paid Gritta's debt with Matteo. You seem to be a decent fellow. I shall teach you what you want to know.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //However, I cannot do it for free. I still have a mountain of debts, and I need the money.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //How much do you charge?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 gold pieces.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "How much do you charge?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Fine. Here are 200 gold pieces.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Hmm ... I don't know whether you can be trusted or not.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //For all I know, you might be one of those layabouts who only come to town to empty the chests of honest people.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //I'm not going to teach you anything before I'm convinced that you are an honest fellow.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Fine. Here are 200 gold pieces.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //This money will really help me. We can start as soon as you're ready.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //You're still a few coins short of 200. I need that money.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Fine. Here are 100 gold pieces.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //In that case, we can start whenever you're ready.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Hey, you're still a few coins short of 100.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Maybe later ...

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schlösser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("Teach me how to pick a lock!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Teach me how to pick a lock!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //All you need is a lock pick. If you move it carefully left and right in the lock, you can unbolt the mechanism.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //But if you move it too much or too fast in the wrong direction, it will snap right off.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //The more adept you become, the fewer lock picks you are going to need. That's all there is to it, really.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "Can you sell me some lock picks?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //Can you sell me some lock picks?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //If I have any left...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //Well, all right. But they won't be of any use to you as long as you don't know how they work.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"The carpenter Thorben sells lockpicks."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"Have you had an apprentice before?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //Have you had an apprentice before?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Yes, and not too long ago.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //And? What happened?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //His name is Elvrich. He's my nephew.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //I was quite pleased with him, actually, but one day he simply didn't show up for work.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich, the apprentice to Thorben the carpenter, has vanished."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Have you reported that to the militia?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "How long has it been since you saw him?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Where is Elvrich now?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //How long has it been since you saw him?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //I guess it must be about 2 weeks.
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //Where is Elvrich now?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //How would I know? He kept hanging around that filthy brothel by the harbor.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //I wouldn't be surprised if he's still warming the bed of some whore down there.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //Have you reported that to the militia?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Of course I have. They were supposed to catch him and see to it that the lazy-bones does his work. But I already regret that.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //He can do whatever he wants. Sooner or later he'll realize that he'll get nowhere in Khorinis without a decent job.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //(cynically) Is that so?
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"Elvrich will work for you again from now on.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Elvrich will work for you again from now on.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //I can only hope that he won't disappear again when the next little tart waves her skirts at him.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Take this gold as a reward for bringing back my apprentice.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "What do you know about the paladins?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //What do you know about the paladins?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //Not much. They arrived by ship two weeks ago from the mainland.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Since then, they have withdrawn to the upper end of town.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Nobody here really knows exactly why they have come.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Many are afraid of an attack by the orcs.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //I suppose, however, that they are here to quell the farmers' rebellion.
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Do you know anything about the peasants' rebellion?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //Do you know anything about the peasants' rebellion?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Rumor has it that Onar the landowner has hired mercenaries to keep the King's troops from breathing down his neck.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //He was probably tired of having to throw his harvest along with his livestock at paladins and militia.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //All we notice of this in town is that the food prices keep rising.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //Onar's farm lies far to the east of here. We wouldn't know if there's any fighting going on there.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //If you want to know more, ask the merchants in the marketplace. They get around the island more than I do.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "I've come about Gritta ...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //I've come about Gritta ...
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //My niece? What's your business with her? This isn't about money, is it?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //She owes 100 gold pieces to the merchant Matteo.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Tell me this isn't true. Ever since that little piece of work moved in with me, I've had nothing but trouble!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //She's in debt with practically every single merchant in town.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //I had to borrow 200 gold pieces from Lehmar the moneylender just to settle her debts! And now this!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta should be in the house.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //Go ahead, ask her. But I can tell you this: she doesn't have a SINGLE gold piece.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //We shall see ...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "Your niece had 100 gold pieces.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Your niece had 100 gold pieces.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //WHAT? The brazen little serpent - that was MY gold! She took it from my chest.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Give it back to me! I have to pay off Lehmar first. Matteo can get his money later!

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "I've already given Matteo his gold!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "No. Matteo will get his money back from me.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Here's your gold.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //From what I know of this little viper, I'm sure she'll run straight to the city guard and accuse you, too!
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //I shall see to it that the matter is settled.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //I've already given Matteo his gold!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //Damn! Oh well - a debt is a debt. At least you didn't keep the money. I guess I should thank you for that.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //No. Matteo will get his money back from me.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //You're getting me into a right old mess that way. Lehmar is not terribly generous when it comes to debts.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //But at least you are planning to pay my niece's debts. I guess I ought to thank you for that.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Here's your gold.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //Thanks! Now I have at least part of the money I owe Lehmar.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //I can't believe she had the audacity to take my gold!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















