// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_8_EXIT_Condition;
	information	= DIA_VLK_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_8_JOIN_Condition;
	information	= DIA_VLK_8_JOIN_Info;
	permanent	= TRUE;
	description = "I want to become a citizen of this town!";
};                       

FUNC INT DIA_VLK_8_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //I want to become a citizen of this town!
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //And why are you telling me that? Go to one of the master craftsmen in the lower part of the city. Maybe, if you're lucky, one of them is looking for an apprentice.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //Otherwise, you'll have to go to the governor and have yourself registered as a citizen.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //But right now, you can forget that. The governor isn't in charge any more, since the paladins came.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //And their leader, Lord Hagen, is guaranteed not to have time for things like that.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_8_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_8_PEOPLE_Condition;
	information	= DIA_VLK_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Who are the most important citizens in this town?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //Who are the most important citizens in this town?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //Besides the paladins ... the master craftsmen in the lower part of town. They are all very important.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_8_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_8_LOCATION_Condition;
	information	= DIA_VLK_8_LOCATION_Info;
	permanent	= TRUE;
	description = "What interesting things are there to see here?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //What interesting things are there to see here?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //The big ship that the paladins came in is in the harbor. It's an enormous boat! You have to take a look at it.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //But I can't imagine that they'll let you on board. The paladins guard the ship like the crown jewels.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //No wonder. It's also the only sea-worthy vessel anchored anywhere far and wide.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_8_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_8_STANDARD_Condition;
	information	= DIA_VLK_8_STANDARD_Info;
	permanent	= TRUE;
	description = "What's new?";
};                       
func INT DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_STANDARD_15_00"); //What's new?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //Everyone has been worried lately.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //It's not enough that the paladins have made themselves at home here, now people are constantly disappearing in the strangest fashion.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //It's about time the militia finally did something about it.
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
		SC_HearedAboutMissingPeople = TRUE;
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Everyone is waiting for the paladins to announce why they're really here. I suspect it's because of the orcs. They're sure to attack soon!
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //The paladins may have the blessing of Innos, but when the orc hordes show up here, that's it for us.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //They say the paladins are only here to get all the ore on the island. For the war on the mainland, they say.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //Do you know what that means? The king doesn't give a damn if we all die miserably when the orcs attack.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //I'll make sure that I'm on the ship when the paladins weigh anchor.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //They say the orcs are riding here on dragons that are as big as half the city! We don't stand a chance!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_07"); //People are saying that the dragons have been defeated. Could it be true?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_8 (var c_NPC slf)
{
	DIA_VLK_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
