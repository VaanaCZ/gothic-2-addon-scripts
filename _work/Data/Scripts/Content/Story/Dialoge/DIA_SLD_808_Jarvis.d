// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //Hey! Don't I know you from somewhere?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //It's possible. I was in the colony, too.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Right ... what do you want?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "How are things?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //How's the situation?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Right now we've got real trouble. Two factions are building up among us mercenaries.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio and his people doubt that Lee is following the right plan.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "How come there are two factions?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //How come there are two factions?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //Most of us came out of the colony with Lee back then.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //But some of the mercenaries hooked up with us later.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //They didn't come from the colony, but were farther south fighting the orcs.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //Somehow they got wind that Lee needed people. Their leader was Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //He agreed that Lee was in charge, but now he's trying to stir up the mercenaries against him and his plan.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //A lot of Lee's people don't think that it's a big problem. But I know guys like Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //He'll go to extremes to realize his ideas.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "Do you know what Lee's intentions are?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //Do you know what Lee's intentions are?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee wants us to wait and starve the paladins in the city.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //He is planning to get us all away from the island. And Innos knows, I've got nothing against getting away from here.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //I don't really know how he's planning to go about it, but I trust him. He's led us well so far.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "Do you know what Sylvio is planning?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //Do you know what Sylvio is planning?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Sylvio found out that some of the paladins have moved out to the old colony.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //He says the rest of the paladins wouldn't dare to attack us here and wants to take advantage of the situation.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Plunder the small farms, waylay the militia patrols outside the city, hold up travelers, things like that.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //But Lee thinks that would be the worst thing we could do in our situation.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "I want to become a mercenary!";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //I want to become a mercenary!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //I'm not sure that's a good idea ...
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //Where's the problem?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //Well, I either have to vote for you or against you.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //And in the situation we're in, I'll only vote for you if I can be sure that you're on Lee's side!
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "So what should I do?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //So what should I do?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //Simple. Beat up a few of Sylvio's boys! That way both sides will know exactly where you stand.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //And if you stick to the rules for a duel, you'll even win the respect of the others.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis wants me to knock a couple of Sylvio's guys down, then he'll give me his vote.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "What are the rules for a duel?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //What are the rules for a duel?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //Go to Torlof and let him explain it, if you're interested.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //Just so we understand each other: I don't care if you stick to the rules or not. Just as long as the boys wind up out cold in the mud!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"And I don't even need to stick to the duelling rules ...");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "Which of the mercenaries are Sylvio's men?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Which of the mercenaries are Sylvio's men?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //There are six men. First of all, Sylvio himself and his right hand man, Bullco.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //Then there's Rod, Sentenza, Fester and Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //The rest of the people are either neutral or on Lee's side.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Sylvio's men are Sylvio himself, his lieutenant Bullco, Rod, Sentenza, Fester and Raoul.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "How many of Sylvio's people should I defeat?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //How may of Sylvio's people should I defeat?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //If you knock three of them to the ground, then you've proven which side you're on.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Whom you choose is your business.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Just one little hint: This isn't about proving your courage. Don't go up against Sylvio himself - he'll make mincemeat out of you.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"It's quite enough if I just knock down three of Sylvio's men. I'd better not tackle Sylvio himself though.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "How many of Sylvio's men are still on my list?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //How many of Sylvio's men are still on my list?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //I have bested Bullco.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //I heard. Not bad.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod looks a little worse for the wear.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza was trying to squeeze some gold out of me - not a smart idea.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //I knocked out Sentenza.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester tried to take me for a ride - that was his mistake.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester got what was coming to him.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //And as to Raoul ...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //I went to see Raoul ...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //And?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //He was badly in need of a proper licking.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //You haven't knocked down any of Sylvio's men so far.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Good - keep it up.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //I expect you to rough up at least three of them.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //That's enough, that's enough.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //You really whupped every single one of them, eh?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //I'm impressed - if Lee asks me, I can vote for you without hesitation.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Jarvis will vote for me if I want to join the mercenaries.");
	};
};


// ###############################
// ##							##
// 			Höhere Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "Any news?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Any news?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Now you are one of us. That's good.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //You made the wrong choice, you could have been one of us.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //Lately, Sylvio's people have been really subdued. (dirty laugh)
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Sylvio is finally gone. After he heard about the dragons, he and some of his boys headed for the mining colony.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //He probably thought there is more to be had there.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Nothing, all's quiet so far. I can't wait to see how this all turns out.
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





