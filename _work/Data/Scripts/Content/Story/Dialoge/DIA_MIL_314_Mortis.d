///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mortis_EXIT   (C_INFO)
{
	npc         = Mil_314_Mortis;
	nr          = 999;
	condition   = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Hallo		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Hallo_Condition;
	information	 = 	DIA_Mortis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Mortis_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Mortis_Hallo_13_00"); //What do you want? Peck isn't here. So you can't get anything. Come back later.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Waffe		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Waffe_Condition;
	information	 = 	DIA_Mortis_Waffe_Info;
	permanent    =  FALSE;
	description  =  "Where is Peck?";
};

func int DIA_Mortis_Waffe_Condition ()
{	
	if (MIS_Andre_Peck == LOG_RUNNING)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Waffe_15_00"); //Where's Peck?
	AI_Output (self, other, "DIA_Mortis_Waffe_13_01"); //You just started with us, huh? Well then, welcome to the team.
	AI_Output (self, other, "DIA_Mortis_Waffe_13_02"); //Peck's been in the city a really long time. I bet he's hanging around that sweet Vanja in the Red Lantern.
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Paket		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Paket_Condition;
	information	 = 	DIA_Mortis_Paket_Info;
	permanent    =  FALSE;
	description  =  "What do you know about that package of weed?";
};

func int DIA_Mortis_Paket_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Paket_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Paket_15_00"); //What do you know about that package of weed?
	AI_Output (self, other, "DIA_Mortis_Paket_13_01"); //Hm ... the last time I was in the harbor tavern, I heard how Kardif and some other guy were talking about it.
	AI_Output (other, self, "DIA_Mortis_Paket_15_02"); //Who was the other guy?
	AI_Output (self, other, "DIA_Mortis_Paket_13_03"); //No idea. But he said he'd found the best storage place for his herbs - then the two of them laughed like drunken orcs.
	
	B_LogEntry (TOPIC_WAREHOUSE,"Mortis heard the landlord Kardif and some other man talking about the package in the dockside pub. They were discussing where to store it.");
};
///////////////////////////////////////////////////////////////////////
//	Info Redlight
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Redlight		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Redlight_Condition;
	information	 = 	DIA_Mortis_Redlight_Info;
	permanent    =  FALSE;
	description  =  "What do you know about the harbor district?";
};

func int DIA_Mortis_Redlight_Condition ()
{	
	if (MIS_ANDRE_REDLIGHT == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Redlight_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Redlight_15_00"); //What do you know about the harbor district? I want to find the one who's selling the swampweed.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_01"); //Weeell, the guys down there really don't talk much, and they're guaranteed not to say anything to one of the city guard.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_02"); //If you want to learn anything down there, you should, no you HAVE to take off your armor.
	AI_Output (other, self, "DIA_Mortis_Redlight_15_03"); //All right, and then?
	AI_Output (self, other, "DIA_Mortis_Redlight_13_04"); //The tavern and the brothel are probably the best places for you to go. If you're going to learn anything, then you'll learn it there.
	
	B_LogEntry (TOPIC_REDLIGHT,"Mortis reckons if I want to buy swampweed in the harbor district, I'd better not wear any armor. The tavern and the brothel are the best places to try.");
};
///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_CanTeach		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  5;
	condition	 = 	DIA_Mortis_CanTeach_Condition;
	information	 = 	DIA_Mortis_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"I want to get stronger.";
};

func int DIA_Mortis_CanTeach_Condition ()
{	
	if (Mortis_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Mortis_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_CanTeach_15_00"); //I want to get stronger.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_01"); //Got it. If you've got enough experience, I can help you with your training.
		Mortis_TeachSTR = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_02"); //Of course you do. But so long as you aren't one of us or a paladin, I won't help you.
	};
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Mortis, the city guardsman, can help me train my strength.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Teach		(C_INFO)
{
	npc		  	 = 	Mil_314_Mortis;
	nr			 = 	100;
	condition	 = 	DIA_Mortis_Teach_Condition;
	information	 = 	DIA_Mortis_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"I want to get stronger.";
};
func int DIA_Mortis_Teach_Condition ()
{	
	if (Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Mortis_Teach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Teach_15_00"); //I want to get stronger.
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
};
func void DIA_Mortis_Teach_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output (self, other, "DIA_Mortis_Teach_13_00"); //You're strong enough. If you want to train more, go somewhere else.
	};
	Info_ClearChoices (DIA_Mortis_TEACH);
};
func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_TEACH_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};
func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mortis_PICKPOCKET (C_INFO)
{
	npc			= Mil_314_Mortis;
	nr			= 900;
	condition	= DIA_Mortis_PICKPOCKET_Condition;
	information	= DIA_Mortis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Mortis_PICKPOCKET_Condition()
{
	C_Beklauen (38, 60);
};
 
FUNC VOID DIA_Mortis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mortis_PICKPOCKET);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_BACK 		,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};
	
func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};


