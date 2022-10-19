// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_EXIT_Condition;
	information	= DIA_Lester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_Hello (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Hello_Condition;
	information	= DIA_Lester_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       
FUNC INT DIA_Lester_Hello_Condition()
{	
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Hello_Info()
{	
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//Is that YOU? - Really! Man, am I glad to see you!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "Do I know you?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lester! How did you get here?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lester! How did you get here?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//That was a crazy escape. After the barrier exploded, I wandered around the area for a while in total confusion.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Then I spent days fighting my way through these woods until I finally found this valley here.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten and Gorn are still in the Valley of Mines. At least, I think so.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//Am I supposed to know you?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Hello? Anyone home? I risked my neck so you could get that weird stone.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//You owe me something ... This time you should remember THAT.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//You still remember Diego, Milten and Gorn?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten and WHO?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Sure. What about them?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Sure. What about them?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//As far as I know, they should have survived the destruction of the barrier.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//I have no idea where they are now - those three are probably still hanging around in the Valley of Mines.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//If you run into them, let me know.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten and WHO?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Don't tell me you can't remember any of that. The focus stones - the troll - the water mages' enormous pile of ore?
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//I'm not so sure ...
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//That'll come back. It took me a while to get my head straight, too.
};
// ************************************************************
// 		  				  Was ist passiert?		//E1
// ************************************************************
INSTANCE DIA_Lester_WhatHappened (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_WhatHappened_Condition;
	information	= DIA_Lester_WhatHappened_Info;
	permanent	= FALSE;
	description = "What happened?";
};                       
FUNC INT DIA_Lester_WhatHappened_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_WhatHappened_Info()
{	
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//What happened?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//After the Sleeper was defeated, the entire Brotherhood lost their minds.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Without their master, they were all just empty husks.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//And you? What about you?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//It was the same for me. I had nightmares and even hallucinations. But once my head was more or less clear again, I ran for it.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//Once I thought I saw a huge black shadow pounce on a group of fugitives and burn them all up in a giant cloud of fire.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//At that moment, I really thought a dragon had come to kill me.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Did you see anything else?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//No - I took to my heels and ran!
};
// ************************************************************
// 		  				   Minental		 		//E1 
// ************************************************************
INSTANCE DIA_Lester_MineColony (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_MineColony_Condition;
	information	= DIA_Lester_MineColony_Info;
	permanent	= FALSE;
	description = "How long have you been hiding out in this valley?";
};                       
FUNC INT DIA_Lester_MineColony_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_MineColony_Info()
{	
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//How long have you been hiding out in this valley?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//I don't know exactly. A week, maybe. But there's one more thing:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//When I came here in the evening, I took a look up on the mountain - there were only a few trees there.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//And when I looked the next morning, that tower was there. I could have sworn it wasn't there before. Since then I haven't left the valley.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//You mean Xardas' tower? I knew he was powerful, but creating a tower just like that ...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Xardas the necromancer? He lives in that tower? I don't know if I like that ...
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Don't worry, he's the one who rescued me from the Sleeper's temple. He's on our side.
};
///////////////////////////////////////////////////////////////////////
//	Info SEND_XARDAS
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_SEND_XARDAS		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_SEND_XARDAS_Condition;
	information	 = 	DIA_Lester_SEND_XARDAS_Info;
	permanent	 = 	FALSE;
	description	 = 	"You need to tell Xardas about the shadow ...";
};
func int DIA_Lester_SEND_XARDAS_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Lester_WhatHappened)
	&& Npc_KnowsInfo (other,DIA_Lester_MineColony)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_SEND_XARDAS_Info ()
{
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //You need to tell Xardas about the shadow, it could be important.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //You don't think it was my imagination? You mean there was really a ...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //... dragon. Yes.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //You're getting into the thick of it again, am I right?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //I shouldn't say in the thick of it ... not yet.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //(sighs) Well good, if it's so important, then I'll go see him - but not now.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //For the moment, I'm going to rest. I'm still exhausted after the escape from the penal colony.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //I think you've got big plans. I'll see you later at Xardas'.
	
	AI_StopProcessInfos (self);
	
	//wird bei LOLO zu Xardas gebeamt
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_STADT		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_STADT_Condition;
	information	 = 	DIA_Addon_Lester_STADT_Info;

	description	 = 	"I'm headed for KHORINIS! What do you know about the city?";
};

func int DIA_Addon_Lester_STADT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_STADT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //I'm on my way to Khorinis! What do you know about the town?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Khorinis? Well, it's a seaport, nothing special.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Why do you ask?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //I must go and see the paladins who are said to be in town.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //(laughs) Really? Hah. They won't even let you into the town, and certainly not to where the paladins are.
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_Vorschlag		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_Vorschlag_Condition;
	information	 = 	DIA_Addon_Lester_Vorschlag_Info;

	description	 = 	"Do you have any suggestions how I could get into town?";
};

func int DIA_Addon_Lester_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lester_STADT))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //Do you have any suggestions how I could get into town?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //I certainly do. I worked for an old alchemist named Constantino some time ago.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //He has great influence in the city, and he's instructed the guards at the gate to let anyone through who can sell him rare herbs.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //So it's quite easy, really. You collect a large bunch of the plants that grow here all over the place, and then you pretend you're working for Constantino, and in you go.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //But don't collect just a mix of this and that. The guards aren't all that bright, and they know nothing about alchemy.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //The bundle needs to look good to them if you want to get through.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //I think that 10 specimens of the same kind of plant should do the trick.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Thanks for the hint.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester says that I can get past the city guards carrying 10 plants of the same kind, as long as I tell them that they are for the old alchemist Constantino."); 
	
	MIS_Addon_Lester_PickForConstantino = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info PASSAGEPLANTSSUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;

	description	 = 	"The thing with the plants for Constantino worked like a charm.";
};

func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition ()
{
	if (MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //The thing with the plants for Constantino worked like a charm. It got me past the city guards.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //Just like I said. You should listen to me once in a while, my friend.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 		  		Perm	
// ************************************************************
INSTANCE DIA_Lester_Perm (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Perm_Condition;
	information	= DIA_Lester_Perm_Info;
	permanent	= TRUE;
	description = "What do you know about the area?";
};                       
FUNC INT DIA_Lester_Perm_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_LESTER") <= 2000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Perm_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//What do you know about the area?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//If you keep going down that way, you'll come to a farm. The city starts a little way beyond that.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//But be careful, there's not just wolves and rats hanging around here, there's goblins and bandits too!
};
// ************************************************************
// 		  		Sleep
// ************************************************************
INSTANCE DIA_Lester_Sleep (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Sleep_Condition;
	information	= DIA_Lester_Sleep_Info;
	permanent	= TRUE;
	description = "Are you still exhausted?";
};                       
FUNC INT DIA_Lester_Sleep_Condition()
{
	if  (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_IN1_31") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Sleep_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Are you still exhausted?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//And how. (yawns) I told Xardas everything. Now I'm going to sleep for a while. Like, a day or ...
	AI_Output	(self, other,"DIA_Lester_Sleep_13_02");	//... two ... or longer.
	
	AI_StopProcessInfos (self);
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Lester_KAP3_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP3_EXIT_Condition;
	information	= DIA_Lester_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BACKINTOWN
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_BACKINTOWN		(C_INFO) 
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_BACKINTOWN_Condition;
	information	 = 	DIA_Lester_BACKINTOWN_Info;
	important	 = 	TRUE;
};
func int DIA_Lester_BACKINTOWN_Condition ()
{	
	if (Npc_GetDistToWP (self, "LEVELCHANGE") <= 500) 
		&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_BACKINTOWN_Info ()
{
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //Hey, you're finally back! You have to go see Xardas right away, there's a problem.
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //That I certainly believe.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //All hell's broken loose since you left.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Talk to Xardas, he's waiting for you!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas gave me this rune for you. It'll help you get to him faster. We'll meet again there.
	
	CreateInvItems 		(self,ItRu_TeleportXardas,1);
	B_GiveInvItems 		(self,other,ItRu_TeleportXardas,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");	//Joly: Lester geht wieder zurück in sein Tal!
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_PERM3		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	900;
	condition	 = 	DIA_Lester_PERM3_Condition;
	information	 = 	DIA_Lester_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"You don't look all that hot.";
};

func int DIA_Lester_PERM3_Condition ()
{
	if (Kapitel >= 3)
	&& (Lester_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

var int DIA_Lester_PERM3_OneTime;
func void DIA_Lester_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //You don't look all that hot.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //I don't feel all that hot either, man. I'm totally wiped out, and I've got a constant headache.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Every time one of those black hoods shows up it gets worse.
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //And I can tell you exactly why.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Yeah? I don't think I want to know.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //These black hoods - or the Seekers, as we magicians call them - used to be the followers of a powerful archdemon. Does that ring a bell?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Mmh. No. Unless you're trying to tell me that ...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //Yes, exactly. The Seekers used to be followers of the Sleeper. The renegade sect crackpots from the Swamp Camp.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //They're your people, Lester. The former Brotherhood of the Sleeper. Now they are nothing but soulless minions of evil.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //I had a notion, but I hoped it wasn't true. Do you mean he came back? Is the Sleeper here again?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Good question. All I know for sure is that I need to stop the Seekers before they become too powerful.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //I don't like it, but I suppose you're right. I'm sorry, but all this crap is getting to my head.
					B_LogEntry (TOPIC_DEMENTOREN,"My suspicions have been confirmed. Even Lester has no doubts that the Seekers are the Sleepers' followers from the old swamp camp."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //The headaches are still there, but hopefully the problem will have been dealt with soon.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //One way or another.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //My headaches are getting almost unbearable. And now these lizard people are constantly attacking me, too. I've got to ask myself where they all come from.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //These headaches just won't stop. There's something brewing.
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //(sighs) I think I'll have a rest first.
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Lester_KAP4_EXIT(C_INFO)
{
	npc		= PC_Psionic;
	nr		= 999;
	condition	= DIA_Lester_KAP4_EXIT_Condition;
	information	= DIA_Lester_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Lester_KAP5_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP5_EXIT_Condition;
	information	= DIA_Lester_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info XardasWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_XARDASWEG		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_XARDASWEG_Condition;
	information	 = 	DIA_Lester_XARDASWEG_Info;

	description	 = 	"Where's Xardas?";
};

func int DIA_Lester_XARDASWEG_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_00"); //Where's Xardas?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //He's gone, and he left these demonic beings behind in his tower.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //I think he doesn't want anyone sniffing around his tower in his absence.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Where did he go?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //He didn't say that. He only asked me to give you this letter from him.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //I read it. Sorry. I was curious.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //And?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //No idea, I didn't understand a word, man. But one thing's clear to me: we won't see him again any time soon.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //I think things just got too hot for him and he headed for the hills.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas has vanished. Lester gave me a letter Xardas left for me."); 
};


///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lester_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"I found out where the enemy is hiding.";
};
func int DIA_Lester_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lester_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lester_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //I found out where the enemy is hiding.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Don't ask me why, but I feel like I should go with you.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //What do you mean by that?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //I can't explain it, but I know that I'll only learn the answer if I come along with you.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //I'm sorry, but the ship's already full.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Maybe it is, maybe my fate is meaningless compared to the events that are ahead of us.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //You know what you have to do. Stand up against evil - don't worry about me.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //I'm not important.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"I can't take you along.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Then come with me and get your answers!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Then come with me and get your answers!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //I'll meet you at the harbor. I'll go down there once I'm ready.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Hurry up, our time is short.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};

FUNC VOID DIA_Lester_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //I can't take you along.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //I understand. I probably won't be any great help to you.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //No matter who you take along - make sure you can trust them.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //And take care of yourself.

	Lester_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_LeaveMyShip_Condition;
	information	 = 	DIA_Lester_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"I've got no more room for you after all.";
};
func int DIA_Lester_LeaveMyShip_Condition ()
{	
	if (Lester_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lester_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //I've got no more room for you after all.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //I understand you. I'd probably do the same in your situation.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //If you need me, I'll help you. You know where to find me.
	
	Lester_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_StillNeedYou_Condition;
	information	 = 	DIA_Lester_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"I need a friend to help me.";
};
func int DIA_Lester_StillNeedYou_Condition ()
{	
	if ((Lester_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lester_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //I need a friend to help me.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //I knew it! We'll see this thing through together, just like before.
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Evil had better watch out. We're breathing down its neck.
		
		self.flags 		 = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //I think it's better if I stay here after all. Good luck.
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6 //auf der Dracheninsel ->Neue Instanz!!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lester_KAP6_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP6_EXIT_Condition;
	information	= DIA_Lester_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_PC_Psionic_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 900;
	condition	= DIA_PC_Psionic_PICKPOCKET_Condition;
	information	= DIA_PC_Psionic_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_PC_Psionic_PICKPOCKET_Condition()
{
	C_Beklauen (76, 20);
};
 
FUNC VOID DIA_PC_Psionic_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_BACK 		,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};
	
func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};




































