//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Wait a minute.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//Is there a problem?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Minecrawlers. Lots and lots of minecrawlers. We've run into a nest here.
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "Why don't we attack the crawlers?";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//Why don't we attack the crawlers?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//I asked that, too. But the guards had 'more important things' to do.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//Bloodwyn has left it to me to remove this problem.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//I don't suppose you're planning to fight the crawlers.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//Why should I? So that we can get at the gold in the cave?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Bloodwyn will just take most of it for himself anyway. And I'm not risking my neck for the little bit I'd get.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//If YOU want to fight the crawlers - don't let me stop you. Only - don't lure them all out here, okay?
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "Can you tell me more about Bloodwyn?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//Can you tell me more about Bloodwyn?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Yes. He's a gold-hungry bastard. He inspects every new vein and every nugget.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//He can't go too far out of his way for gold. But we don't mean shit to him.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//And otherwise?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//He thinks he's the greatest and can't stand it if someone is better off than he is. Okay - I wouldn't go up against him, even so.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Just stay out of his way and don't provoke him - unless you want him to get furious and lose control...
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn will definitely leave the temple when he finds out that a new gold vein has been found in the mine.");
	B_LogEntry (Topic_Addon_Tempel,"When Bloodwyn is annoyed, he loses control. That will certainly be useful to me."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "The crawlers are history.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//So, that should be it. The crawlers are finished.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn is already on the way. That's what you wanted, isn't it?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//I mean, you slaughtered the crawlers so Bloodwyn would come here. So, whatever you're planning, do it NOW.
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//You sure showed that bum. Nice work.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//Then I'll take a look around the cave.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//Wow, man, there sure is a lot of gold here.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//To get to the chunks up there, we'd actually need a ladder.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//But since the fall of the Barrier, nobody's been using ladders any more... it's really too bad...
};




