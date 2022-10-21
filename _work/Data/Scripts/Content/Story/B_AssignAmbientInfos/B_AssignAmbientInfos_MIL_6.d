// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_6_EXIT_Condition;
	information	= DIA_MIL_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_6_JOIN_Condition;
	information	= DIA_MIL_6_JOIN_Info;
	permanent	= TRUE;
	description = "What do I have to do to join the militia?";
};                       

FUNC INT DIA_MIL_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //What do I have to do to join the militia?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Go to Lord Andre and talk to him. Since the paladins have come to town, he's had the command over the entire militia.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //You can find him in the barracks. He's practically always there.
	};
};

// *************************************************************************
// 						MissingPeople
// *************************************************************************
instance DIA_Addon_MIL_6_MissingPeople		(C_INFO)
{
	nr		 = 	2;
	condition	 = 	DIA_Addon_MIL_6_MissingPeople_Condition;
	information	 = 	DIA_Addon_MIL_6_MissingPeople_Info;
	permanent	= TRUE;
	description	 = 	"I heard some citizens have disappeared.";
};

func int DIA_Addon_MIL_6_MissingPeople_Condition ()
{
	if (Kapitel == 1)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_MIL_6_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //I heard some citizens have disappeared.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //I've actually heard quite a few rumors of missing people lately.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //I can't for the life of me explain it.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //But we can't do more than keep our eyes open and do our sentry duty.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_6_PEOPLE_Condition;
	information	= DIA_MIL_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Tell me about these paladins.";
};                       

FUNC INT DIA_MIL_6_PEOPLE_Condition()
{
	IF (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Tell me about these paladins.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Since the paladins have arrived in Khorinis, they have retreated to the upper end of town.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //They're not letting anyone in there any more. Except for the citizens of the town and the militia, of course.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //There are also some paladins who guard the ship down at the harbor. But those are far from talkative.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_6_LOCATION_Condition;
	information	= DIA_MIL_6_LOCATION_Info;
	permanent	= TRUE;
	description = "What is there to know about this town?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //What is there to know about this town?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //The paladins now have control over the whole city. The entire militia reports to them.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre is commander of the militia - at the same time, he acts as the judge.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //If you should ever run afoul of the law, you'll have to justify yourself to him.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //But he is pretty lenient for all one hears. He usually lets people get away with a fine.
	
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_6_STANDARD_Condition;
	information	= DIA_MIL_6_STANDARD_Info;
	permanent	= TRUE;
	description = "What's new?";
};                       
func INT DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_STANDARD_15_00"); //What's new?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //More and more riffraff have been pouring into town lately.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Thefts are on the rise, and Lord Andre suspects that it's the work of a gang.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Not long ago, we turned the entire harbor district upside down, but we still haven't found a thing.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //It looks like we now have the bandit problem more or less under control. The raids have all but died off lately.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //It's getting worse and worse, what with all that riffraff coming to town. Last night I trailed a man in a black robe through the upper end of town.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //I'm sure he was up to no good. But when I followed him around the governor's house, he had simply disappeared. A strange character, that was ...
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //They say that Lord Hagen has hired mercenaries to fight against the dragons. I'm fine with that, I wouldn't want to fight a dragon myself.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //They say the dragons have been vanquished! Lord Hagen is collecting his forces to drive the remaining creatures from the Valley of Mines as well.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_6 (var c_NPC slf)
{
	DIA_MIL_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
