//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//So you're the fellow who fought his way into camp.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//That got around fast...
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franco was a tough nut. No one messed with him. No one - except you.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Just to make it clear, if you try the same shit with me, I'll kill you.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "I want into the mine!";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//I want into the mine!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(grins) Of course you do. Then you're in the right place with me.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Because everyone who digs in the mine gets to keep a hefty share of the gold.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//And I hand out the red stones you need, so that Thorus will let you in.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "Give me one of those red stones.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Give me one of those red stones.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//Okay, but they aren't free.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Normally, I demand a share of the gold the boys get for digging.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//(appraisingly) How much do you know about mining gold, hm?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//You've probably learned a few tricks, right?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//You don't appear to know a whole lot about it...
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(snidely) If I give you a red stone, it won't be because you're such a great digger.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//No, I have another job for you...
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "What sort of job?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//What sort of job?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//One of the bandits planned to kill me. But instead, my guards killed HIM.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//He was hot for your job, huh?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//He was an idiot! A thug without a brain. He never would have got the idea to attack me on his own.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//No, he was only fulfilling a contract - someone else sent him...
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//So I'm supposed to find out who was behind it.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Whoever sent me this assassin will pay for it. Find him - and I'll let you into the mine.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Senyan sent me to you about this business.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? He also works for me. I told him he should keep his eyes open.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "There was an attempt on Esteban's life. I'm supposed to find out who is behind it.");

};
//--------------------------------------------------------------------
//	Info Attentäter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "How should I go about it?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//How should I go about it?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//Everyone here in the camp knows about it. So you're playing with all your cards on the table.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Try to find out who is on my side and who isn't and don't let the boys make a fool of you!
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Talk to Snaf. That fat cook picks up a lot.
	
	B_LogEntry (Topic_Addon_Esteban, "In order to find the person responsible, I should talk to all the people in camp and find out whose side they are on. Snaf is a good place to go because he hears a lot.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "I need better armor.";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //I need better armor.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Why? You already have some. That's good enough for you for now!
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //If you complete your assignement, we'll talk about it again...
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "About the assignment...";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//About the assignment...
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Listen, I have other things I have to take care of.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//I thought you might be interested in knowing who was behind the attack...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//Who is it? Tell me his name so my guards can wring his neck...
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//The trader Fisk is behind it. At the moment, he's sitting in the bar unsuspecting and drinking...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA! Well done, kid. My guards will take care of him.
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//You heard him, boys. Go get Fisk.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Come back when you've found out who the guy is.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "And what happens next?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//And what happens next?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//What happens next? I'll tell you what happens.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fisk will die a painful death. And everyone in the camp will find out about it.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//That will be a warning to all of them.
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "Do I get a red stone now?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//Do I get a red stone now?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//You did your job well. Someone like you has no business in the mine.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//I can use you much better out here. You will stay in the camp and continue working for me.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "I'll think about it.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//I'll think about it.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//You're forgetting who you're talking to. I'm in charge here and you will do exactly what I say.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//And I say, you will work for me and no one else. Is that clear?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "Are you trying to pull my leg?";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Are you trying to play me for a fool? There was never a question of me working for you.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//It isn't everyone who gets an offer like this. But if you don't want it, you're free to leave the camp...
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//How about if you keep your word and give me a red stone?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hey - one more word and my guards will have to hurt you, too.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(grins) What guards...?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//What...? Ah, I see... you're trying to pull a fast one, just wait...
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "Give me the stone NOW or I'll get it myself!";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //Give me the stone NOW or I'll get it myself!
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Oh, you've got a death wish. All right, I'll do you a favor and put you out of your stupidity!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




