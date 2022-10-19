// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_6_EXIT_Condition;
	information	= DIA_VLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_JOIN_Condition;
	information	= DIA_VLK_6_JOIN_Info;
	permanent	= TRUE;
	description = "How do I go about becoming a citizen of this town?";
};                       

FUNC INT DIA_VLK_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //How do I go about becoming a citizen of this town?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //You want to settle here? Now? When all the signs are pointing towards the end of the world?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //I wasn't planning on staying forever.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Well, if you want my advice, you should hotfoot it out of here as long as you still can. But if you insist, you should talk to one of the influential citizens here.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_6_PEOPLE_Condition;
	information	= DIA_VLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Who are the influential citizens of Khorinis?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //Who are the influential citizens of Khorinis?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Try the blacksmith or the carpenter in the lower part of town. You'll find a few other well-respected masters there, too.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //If anyone here besides the city guards and the paladins has anything to say, then it's these men.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_6_LOCATION_Condition;
	information	= DIA_VLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "How do I go about orienting myself in this city?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //How do I go about orienting myself in this city?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //It's not that easy finding your way around here, is it? Even the signposts don't always help.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //If you have a bad sense of direction, you had better go down to the harbor - assuming you can find your way there - and look for the cartographer's house.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //It's right next to the pub, at the quay. Brahim will certainly have a map of the city for you.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_6_STANDARD_Condition;
	information	= DIA_VLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "What's new?";
};                       
func INT DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //What's new?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Ever since they took the Barrier away, this town has been overrun with bandits. But the paladins don't do a thing. Why the hell are they even here then?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Lately, the bandit problem hasn't been so bad. It looks like someone has finally started to do something about it.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //They let the filthy mercenary who murdered that paladin go. It certainly wouldn't have been a bad idea to hang him instead.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //They say that one of Onar's mercenaries has killed a paladin. They have caught the fellow and thrown him in jail. Soon he will hang.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //I wonder if there is anything to those stories about dragons ...
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //They say that Lord Hagen is gathering his men to free the Valley of Mines. Finally things are moving!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_6 (var c_NPC slf)
{
	DIA_VLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
