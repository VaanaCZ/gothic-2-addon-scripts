// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bones_EXIT(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 999;
	condition	= DIA_Addon_Bones_EXIT_Condition;
	information	= DIA_Addon_Bones_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bones_PICKPOCKET (C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 900;
	condition	= DIA_Addon_Bones_PICKPOCKET_Condition;
	information	= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen (75, 104);
};
 
FUNC VOID DIA_Addon_Bones_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
	
func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //I'm sorry. I've got no time right now.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //I've got some training to do.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "The canyon awaits.";
};                       
FUNC INT DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bones_Anheuern_Info()
{	
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //The canyon awaits.
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Bones_Hello(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Hello_Condition;
	information	= DIA_Addon_Bones_Hello_Info;
	permanent	= FALSE;
	description = "How's it going?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //How's it going?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //I can't complain. It's a bit boring, but at least I don't have to work.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //I'm preparing for the next task that Greg has given me.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //What task?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //I mustn't say.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //No offense, kid. But I've worked hard for the privilege and I don't want to lose it again.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen? 
// ************************************************************
INSTANCE DIA_Addon_Bones_Train(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Train_Condition;
	information	= DIA_Addon_Bones_Train_Info;
	permanent	= FALSE;
	description = "Can you teach me something?";
};                       
FUNC INT DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //Can you teach me something?
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
INSTANCE DIA_Addon_Bones_Teacher(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Teacher_Condition;
	information	= DIA_Addon_Bones_Teacher_Info;
	permanent	= FALSE;
	description = "Who around here can teach me something?";
};                       
FUNC INT DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Bones_Teacher_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Who around here can teach me something?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry and Morgan are leading our raiding troops.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //They can teach you how to be a better fighter.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Henry's people all use two-handed weapons.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan prefers the faster one-handed weapons.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Who else?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Beats me, I've never been interested in anything else.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //But I'm sure that Alligator Jack or Samuel could still show you a trick or two.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was weißt du über Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "Can you tell me something about Francis?";
};                       
FUNC INT DIA_Addon_Bones_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Bones_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //Can you tell me something about Francis?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //Look around you. The only ones working are Henry and his boys.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan spends all day in bed, or guzzling booze.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //No such nonsense with Greg. If you don't toe the line, he'll kick you in the butt, and that's that.
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_WantArmor_Condition;
	information	= DIA_Addon_Bones_WantArmor_Info;
	permanent	= TRUE;
	description = "Give me that bandit's armor.";
};                       
FUNC INT DIA_Addon_Bones_WantArmor_Condition()
{
	if (Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Bones_WantArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Give me that bandit's armor.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //I'm not that crazy. Greg will have my head.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //He explicitly stated that no-one will get that armor unless he orders it.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //I can't give it to you. Especially not now that he's come back.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bones won't give me the armor without permission from Greg."); 
};

//*********************************************************
//	Du sollst mir die Rüstung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "You're supposed to give me the bandit's armor. Orders from Greg.";
};                       
FUNC INT DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_GiveArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //You're supposed to give me the bandit's armor. Orders from Greg.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //From Greg? Whew, I already thought I'd have to go after all.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //This spy job in the bandits' camp is nothing short of a suicide mission.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //I'd rather have Greg heap his chores on me than get myself killed by those bandits.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //(irritated) The armor.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //Oh yeah, right, here it is.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Just be careful. Those bandits are a bad lot.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"The order from Greg seems to work wonders. I have the bandit armor!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

