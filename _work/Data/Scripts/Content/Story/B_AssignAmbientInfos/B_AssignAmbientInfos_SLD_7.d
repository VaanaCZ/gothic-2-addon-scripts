// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_7_EXIT_Condition;
	information	= DIA_SLD_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_7_JOIN_Condition;
	information	= DIA_SLD_7_JOIN_Info;
	permanent	= TRUE;
	description = "I want to join you!";
};                       

FUNC INT DIA_SLD_7_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //I want to join you!
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //I heard you really gave it to the militia. We could use someone like you here!
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //I don't imagine collecting the rent from a few farmers is particularly difficult, but if Onar wants to pay you for it, it's fine with me.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //You? Once Torlof puts you to the test, you've had it, you weenie!
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_7_PEOPLE_Condition;
	information	= DIA_SLD_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Who's in charge here?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //Who's in charge here?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Lee is our boss. Torlof is his right hand. Most of the men follow him because he was their leader back in the colony.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //And then there's Sylvio. He came out of the mountains with his men after Lee arrived.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //He and his people are only a small part of the mercenaries - but they make a lot of trouble. Those guys are playing their own game.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //And Sylvio is a dirty sumbitch - so be careful when you meet him.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_7_LOCATION_Condition;
	information	= DIA_SLD_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Tell me about the farm.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Tell me about the farm.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Onar hired us to guard his possessions.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //So don't even think about stealing anything or beating up the farmers, otherwise you'll be in trouble with us, got it?
	};
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_7_STANDARD_Condition;
	information	= DIA_SLD_7_STANDARD_Info;
	permanent	= TRUE;
	description = "What's new?";
};                       
func INT DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //What's new?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Ever since you joined us, the farm has been quiet - no militia.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //Not much, here with us. But ask in the city, I think they're running out of grub. (laughs)
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //Dragons in the Valley of Mines! I wouldn't like to be in the paladins' shoes right now.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //I guess the king will give Lord Hagen a swift kick in the ass when he comes back empty-handed because of the dragons.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //Can't your paladins handle the dragons? That figures - fighting is a job for real men, after all.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //That thing with Bennet was downright decent of you. Sylvio's boiling with rage. He'd have preferred to storm the city and smash everything to bits.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //He's always trying to force Lee into the defensive, and Bennet provided a handy excuse.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //I don't know why you helped Bennet, but believe me, it was better for the city.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //That thing with Bennet is a bad deal. Maybe we should listen to Sylvio after all, and attack the city.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //What are you planning to do with Bennet? Oh well, I don't really want to know, you'll find out soon enough what it leads to.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //I thought you were headed for the valley, too. Together with Sylvio.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //None of us would mind much if Sylvio stayed in the valley. FOREVER!
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //It was pretty brave of you to show up here all alone.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //But I don't care, as long as you're not trying to collect any taxes.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Boy, I can't stand it any more. Sheep, pastures and trees. I want to finally get out of here.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_7 (var c_NPC slf)
{
	DIA_SLD_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
