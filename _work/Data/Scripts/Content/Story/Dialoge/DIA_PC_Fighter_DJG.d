
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornDJG_EXIT(C_INFO)
{
	npc		= PC_Fighter_DJG;
	nr		= 999;
	condition	= DIA_GornDJG_EXIT_Condition;
	information	= DIA_GornDJG_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornDJG_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_STARTCAMP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_STARTCAMP_Condition;
	information	 = 	DIA_GornDJG_STARTCAMP_Info;

	description	 = 	"I see you have joined the dragon hunters.";
};

func int DIA_GornDJG_STARTCAMP_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_STARTCAMP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //I see you have joined the dragon hunters.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //I followed Sylvio into the Valley of Mines, because I know my way around here best and wanted to get a clear picture of the situation.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //I'll tell you what. Something's definitely brewing here. I've never seen so many orcs in one place in all my life.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //It wouldn't amaze me if Garond and the paladins in the castle had all fled or been slain by now.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "I'll see you around.", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "What are you planning to do now?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //What are your plans now?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //I'll follow the boys here to the Valley of Mines first, and then take off later.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //I really have to find out what the orcs are planning.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //I'll see you around.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //Look out for yourself.
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HALLO		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HALLO_Condition;
	information	 = 	DIA_GornDJG_HALLO_Info;

	description	 = 	"So this is where you're holed up!";
};

func int DIA_GornDJG_HALLO_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1500) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //So this is where you holed up!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //You aren't so easy to kill yourself, eh?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"Have you caught anything yet?";
};

func int DIA_GornDJG_WHATSUP_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATSUP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //Have you caught anything yet?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //I'm still waiting. I think there may be something to be had up there in the old rock ruins. There are lights up there at night, and I can hear screams.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Maybe Lester?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "A dragon?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn is at the foot of the high plain to the old rock fortress. That way he can watch the high plain and the orc barrier."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //Maybe it's Lester who has returned to his old ruin on the rock?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //Can't be. As far as I know, Lester doesn't live up there any more.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //A dragon?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Very likely. The high plain up there is guarded like the King's damn treasury. Alas, it's the only way to the fortress.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //As if the dragons weren't bad enough already. They seem to have a few more monsters in tow.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"According to Gorn, there's a dragon in the old rock fortress."); 
	
	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
};

///////////////////////////////////////////////////////////////////////
//	Info WhatMonsters
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATMONSTERS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATMONSTERS_Condition;
	information	 = 	DIA_GornDJG_WHATMONSTERS_Info;

	description	 = 	"What kind of monsters would those be?";
};

func int DIA_GornDJG_WHATMONSTERS_Condition ()
{
	if (GornDJG_WhatMonsters == TRUE)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATMONSTERS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //What kind of monsters would those be?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //I couldn't quite make them out properly, but they walk upright and have scaly skin. They move over the rocks like snappers that have gotten a whiff of prey.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //I can hear them snuffling and snorting clear down here. I think they've taken over the whole plain up there.

};


///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WAHTABOUTORCS_Condition;
	information	 = 	DIA_GornDJG_WAHTABOUTORCS_Info;

	description	 = 	"What about the orcs?";
};

func int DIA_GornDJG_WAHTABOUTORCS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //What about the orcs?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //I've been watching them for quite a while. The barricade they set up down there must be hiding something. I suspect that crowds of them have already gathered back there.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //You mean, even MORE than are here already?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //It wouldn't amaze me if they tore down their palisade one evening and flooded across the land. I've got a bad feeling about this.
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //If that happens, I'll have to go back and warn Lee. He wants to get off the island anyway. By then, it'll be high time.

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"Can you help me get into the fortress?";
};

func int DIA_GornDJG_HELPKILLDRACONIANS_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATMONSTERS))
		&& (Npc_KnowsInfo(other, DIA_GornDJG_WAHTABOUTORCS))
		&& ((Npc_IsDead(RockDragon))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //Can you help me get into the fortress?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //I don't really know. I'm afraid the orcs will attack just at the very moment I look away.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //That's paranoid!
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //Can't be helped. I'd never forgive myself if I came too late, you see? On the other hand ...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //Whatever! Why else am I here? Let's charge the plain and fight our way clear to the fortress.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //A little exercise can't hurt. Besides, I want to get a closer look at those beasts up there.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //Let me know when you're ready!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn wants to help me to get to the rock fortress over the high plain."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht´s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"Let's attack!";
};

func int DIA_GornDJG_LOSGEHTS_Condition ()
{
if (Npc_KnowsInfo(other, DIA_GornDJG_HELPKILLDRACONIANS))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_LOSGEHTS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //Let's attack!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Just like old times, eh? But I'll tell you something: This is my battle. This time I'm going in front!

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"RunToRockRuinBridge"); 
};




///////////////////////////////////////////////////////////////////////
//	Info BisHierhin
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_BISHIERHIN		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_BISHIERHIN_Condition;
	information	 = 	DIA_GornDJG_BISHIERHIN_Info;
	important	 = 	TRUE;
};

func int DIA_GornDJG_BISHIERHIN_Condition ()
{
	if (Npc_GetDistToWP(self,"LOCATION_19_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_BISHIERHIN_Info ()
{
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //It was child's play. So, my friend, you'll have to take care of the rest. Make it hot for them! I'll go back and keep an eye on the orcs.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //No Problem. See you around!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //I should hope so!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn went back to his lookout post. He wants to keep watching the orcs."); 

	B_GivePlayerXP (XP_GornDJGPlateauClear);
 	
 	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info DragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_DRAGONDEAD		(C_INFO)
{
	npc		 	 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_DRAGONDEAD_Condition;
	information	 = 	DIA_GornDJG_DRAGONDEAD_Info;

	description	 = 	"The rock dragon is dead!";	
};

func int DIA_GornDJG_DRAGONDEAD_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATSUP))
		&& (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1000)
		&&  ((Npc_IsDead(RockDragon))== TRUE)
		)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_DRAGONDEAD_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //The rock dragon is dead!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //I don't hear any more screams! Were you up in the rock fortress?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //Yes!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //Ha ha! I thought as much. Wherever you show up, there won't be one stone left standing.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //What are you going to do now?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //I'll stick around for a while and then make my way back to Lee. Maybe we'll meet again there!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //I'm getting sick of this damned area. It's time we finally got out of this country.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //See you later!
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_DJG_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_DJG;
	nr			= 900;
	condition	= DIA_Fighter_DJG_PICKPOCKET_Condition;
	information	= DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	C_Beklauen (10, 35);
};
 
FUNC VOID DIA_Fighter_DJG_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};
	
func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};











