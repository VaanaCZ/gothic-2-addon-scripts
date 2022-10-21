//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//You know the rule. No one goes into the mine without a red stone tablet.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Forget the mine - I have to see Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Even then. We have rules here and they apply to everyone. Even to you.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Go back. If you try to enter the upper square without permission, the other guards will kill you. THOSE are the rules.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//If you have a problem with that, go talk to Esteban. He's responsible for the camp.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "It's important that I get to Raven...";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//It's important that I get to Raven...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//Oh, yeah? Do you really think you can make it through to him?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//His guards have orders not to let ANYONE in. You'd be dead before you even saw him.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//So knock that idea out of your head.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven is the leader of the bandits. I will have to get some of them out of the way in order to get to him."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "Don't you remember me? From the Old Camp...";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Don't you remember me? From the Old Camp...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//You were one of the prisoners?! Maybe you were one of my guards. And? Does that make us allies now?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//No, it doesn't.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Maybe you're the guy who brought down the Barrier - maybe you also killed my pals.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//So what?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Those times are over.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//You want in? Then get yourself a red stone and don't waste my time.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "Come on, let me in. For old times' sake.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //Come on, let me in. For old times' sake.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Let me explain something to you. Do you know why I'm still alive?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Because I've always been loyal to my people.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //I don't have to agree with everything Raven does. But I'll stick to the rules. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //And so will you!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(firmly) No!
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "I have a stone tablet for you here...";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//I have a stone tablet for you here...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//You don't have the right stone. Only the red ones are important.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "I have a red stone tablet here...";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//I have a red stone tablet here...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//Okay.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//You killed Esteban - so YOU will do his job now.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//They have a few problems with minecrawlers in the mine.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Three diggers have bought it already. It's your job to provide replacements.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//And when can I finally get into the damned mine?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Do your job - afterwards you can do what you want.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Since I have taken over Esteban's job, I'm supposed to send three diggers to the mine.");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "I sent out three guys.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//I sent out three guys.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//All right. Then as far as I'm concerned you can go in.

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "Hey, what's with your armor? Where can I get armor like that?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Hey, what's with your armor? Where can I get armor like that?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//You can't. This armor is reserved for Raven's guard.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//I hardly think there's an entrance exam for new candidates. But the ultimate decision isn't mine, it's Raven's.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "How are the prisoners?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//How are the prisoners?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Mmh, they've done their job. As far as I know, they're supposed to be digging gold now.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//And if they escape...?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//...Bloodwyn will send his guards after them. But I hardly think they would be crazy enough to try to escape.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//Unless...
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//Unless, what?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//...someone else put them up to it. But I don't know anyone stupid enough to do that... at least, so long as Bloodwyn is here.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//What are you planning?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//What??
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Now you've cleared Bloodwyn out of the way, too. I'm just asking myself who's next. Raven? Or me?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Are you afraid?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//I'm not afraid of a fight. But I am afraid of the consequences of your actions.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//This camp is the only thing we have left.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//It may not have always run to perfection, but it DOES run.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//And with every person you kill, another piece of our community breaks up.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//We are bandits. Outcasts, lawbreakers, desperados.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Wherever we go, we're hunted, locked up and killed.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//There is no better place for us than this, no better time than now.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//What are you getting at?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//These men need someone to lead them. Who should that be? You? You, who is constantly roaming from place to place?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "Then you take over the leadership of the camp.";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Then you take over the leadership of the camp.
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//Okay, but what about Raven?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Raven will soon have other worries. I'll take care of him.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Oh, yes, and make sure that the prisoners can leave the camp in peace.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//All right. I shall take care of all the guards out here.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn is dead, and Thorus will make sure that the slaves can leave the camp."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Now I'll talk to the 'slave guard' again, then Patrick and his boys can take off."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"Since the 'slave guard' is finished, Patrick can now leave with his boys."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "I did it. Raven is finished.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//I did it. Raven is finished.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//That means you've given Beliar a swift kick.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Then you'll be moving on?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//My job in this valley is done. I could use a few days' rest.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(laughs) Yeah, you're constantly on the move, aren't you? (seriously) Have a good journey.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Who knows, maybe we'll run into each other again.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Who knows. There will be lots of gates and passages for you to go through. And you're bound to find me on one of them...
	
	AI_StopProcessInfos (self);
	
};



