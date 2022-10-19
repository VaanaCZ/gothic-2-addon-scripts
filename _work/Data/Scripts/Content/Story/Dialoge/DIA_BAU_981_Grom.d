///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Grom_EXIT   (C_INFO)
{
	npc         = BAU_981_Grom;
	nr          = 999;
	condition   = DIA_Grom_EXIT_Condition;
	information = DIA_Grom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Grom_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Grom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Grom_HALLO		(C_INFO)
{
	npc		 = 	BAU_981_Grom;
	nr		 = 	3;
	condition	 = 	DIA_Grom_HALLO_Condition;
	information	 = 	DIA_Grom_HALLO_Info;

	description	 = 	"Everything all right?";
};

func int DIA_Grom_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_15_00"); //Everything all right?
	AI_Output			(self, other, "DIA_Grom_HALLO_08_01"); //Ah, an unfamiliar wanderer. I am very busy, so what do you want?

	Info_ClearChoices	(DIA_Grom_HALLO);
	Info_AddChoice	(DIA_Grom_HALLO, "What interesting things are there to see here?", DIA_Grom_HALLO_waszusehen );
	Info_AddChoice	(DIA_Grom_HALLO, "What are you doing here?", DIA_Grom_HALLO_was );
};

func void DIA_Grom_HALLO_waszusehen ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_waszusehen_15_00"); //What interesting things are there to see here?
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_01"); //Interesting is well put. If you go deeper into the woods here, you will run into some very evil fellows.
	AI_Output			(self, other, "DIA_Grom_HALLO_waszusehen_08_02"); //They're about ten feet tall, hairy, and in a really bad mood. So don't go there if you're not strong enough for them.
};

func void DIA_Grom_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Grom_HALLO_was_15_00"); //What are you doing here?
	AI_Output			(self, other, "DIA_Grom_HALLO_was_08_01"); //Well, the things a woodcutter and hunter usually does.
	Info_AddChoice	(DIA_Grom_HALLO, DIALOG_BACK, DIA_Grom_HALLO_BACK );
};

func void DIA_Grom_HALLO_BACK ()
{
	Info_ClearChoices	(DIA_Grom_HALLO);
};

// ************************************************************
// 			  			  ASK TEACHER 
// ************************************************************

INSTANCE DIA_Grom_AskTeacher (C_INFO)
{
	npc			= BAU_981_Grom;
	nr          = 10;
	condition	= DIA_Grom_AskTeacher_Condition;
	information	= DIA_Grom_AskTeacher_Info;

	description = "Can you teach me something about hunting?";
};                       

FUNC INT DIA_Grom_AskTeacher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Grom_HALLO))
	{
				return TRUE;
		};
};

FUNC VOID DIA_Grom_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00"); //Can you teach me something about hunting?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01"); //Sure. But first get me something decent to eat. I'm dying of hunger out here.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02"); //I want a bottle of milk, a loaf of bread and a fat ham, then I'll teach you what you want.
	Log_CreateTopic (TOPIC_GromAskTeacher, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher, LOG_RUNNING);
	B_LogEntry (TOPIC_GromAskTeacher,"Grom the hunter will teach me what he knows if I get him a bottle of milk, a loaf of bread and ham."); 
};


// ************************************************************
// 			  			  PAY TEACHER 
// ************************************************************

INSTANCE DIA_Grom_PayTeacher (C_INFO)
{
	npc			= BAU_981_Grom;
	nr          = 11;
	condition	= DIA_Grom_PayTeacher_Condition;
	information	= DIA_Grom_PayTeacher_Info;
 
 	description = "Here's the food you wanted.";
};                       

FUNC INT DIA_Grom_PayTeacher_Condition()
{
	if	(Npc_KnowsInfo (other, DIA_Grom_AskTeacher))
		&& (Npc_HasItems (other,Itfo_Milk))
		&& (Npc_HasItems (other,Itfo_Bread))
		&& (Npc_HasItems (other,Itfo_Bacon))
			{
				return TRUE;
			};
};
FUNC VOID DIA_Grom_PayTeacher_Info()
{
	B_GiveInvItems (other, self, Itfo_Milk, 1);
	B_GiveInvItems (other, self, Itfo_Bread, 1);
	B_GiveInvItems (other, self, Itfo_Bacon, 1);
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00"); //Here's the food you wanted.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01"); //Fantastic. And now?
	Grom_TeachAnimalTrophy = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Grom_TEACHHUNTING		(C_INFO)
{
	npc		     = 	BAU_981_Grom;
	nr           =  12;
	condition	 = 	DIA_Grom_TEACHHUNTING_Condition;
	information	 = 	DIA_Grom_TEACHHUNTING_Info;
	permanent	 =  TRUE;
	description	 = 	"Teach me how to hunt.";
};

func int DIA_Grom_TEACHHUNTING_Condition ()
{
	if (Grom_TeachAnimalTrophy == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Grom_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Grom_TEACHHUNTING_15_00"); //Teach me how to hunt.
		if 	(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			)
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_01"); //What do you want to learn?
		

			Info_AddChoice		(DIA_Grom_TEACHHUNTING, DIALOG_BACK, DIA_Grom_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Skin",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Grom_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Remove teeth",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Grom_TEACHHUNTING_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Remove heart",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Grom_TEACHHUNTING_Heart);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Remove mandibles",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Grom_TEACHHUNTING_Mandibles	);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			{ 
				Info_AddChoice	(DIA_Grom_TEACHHUNTING, B_BuildLearnString ("Shadowbeast horn",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Grom_TEACHHUNTING_ShadowHorn	);
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_08_02"); //I can't teach you anything you don't already know.
		};
};

func void DIA_Grom_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Fur_08_00"); //Cut a slit in the animal's legs so that you can strip the skin off. Do that from front to back, not the other way around.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Teeth ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Teeth_08_00"); //When removing the teeth you have to take special care that they don't break when they come away from the skull.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Heart ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Heart_08_00"); //You remove the heart of the animal with a deft cut in the chest. But it's usually only worth it with special animals or magical beings.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_Mandibles_08_00"); //The mandibles of a minecrawler or field raider have to be removed with a very strong metal lever. They are lodged very deeply in the animal's skull.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_ShadowHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Grom_TEACHHUNTING_ShadowHorn_08_00"); //To take off a shadowbeast horn, brace yourself against the skull with all your might, pulling on the horn and cutting the thing out with a hard blade.
		};
	Info_ClearChoices	(DIA_Grom_TEACHHUNTING);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Grom_PICKPOCKET (C_INFO)
{
	npc			= BAU_981_Grom;
	nr			= 900;
	condition	= DIA_Grom_PICKPOCKET_Condition;
	information	= DIA_Grom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Grom_PICKPOCKET_Condition()
{
	C_Beklauen (75, 40);
};
 
FUNC VOID DIA_Grom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Grom_PICKPOCKET);
	Info_AddChoice		(DIA_Grom_PICKPOCKET, DIALOG_BACK 		,DIA_Grom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Grom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Grom_PICKPOCKET_DoIt);
};

func void DIA_Grom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Grom_PICKPOCKET);
};
	
func void DIA_Grom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Grom_PICKPOCKET);
};











