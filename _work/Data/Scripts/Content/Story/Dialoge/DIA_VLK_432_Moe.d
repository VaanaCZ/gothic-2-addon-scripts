///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Moe_EXIT   (C_INFO)
{
	npc         = VLK_432_Moe;
	nr          = 999;
	condition   = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Moe_PICKPOCKET (C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 900;
	condition	= DIA_Moe_PICKPOCKET_Condition;
	information	= DIA_Moe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Moe_PICKPOCKET_Condition()
{
	C_Beklauen (25, 30);
};
 
FUNC VOID DIA_Moe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Moe_PICKPOCKET);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_BACK 		,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
	
func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
// ************************************************************
// 			     Hallo
// ************************************************************
INSTANCE DIA_Moe_Hallo(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 2;
	condition	= DIA_Moe_Hallo_Condition;
	information	= DIA_Moe_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       

FUNC INT DIA_Moe_Hallo_Condition()
{	
	if (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_NOV)
	&& (Npc_RefuseTalk(self) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Moe_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //Hey, I don't know you. What do you want here? Are you headed for the pub?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"No, I'm not headed for the tavern ... (END)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Oh, so this is the watering hole ...",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Yes, do you mind?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //No, I'm not headed for the pub ...
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //Yeah, that's what I would have said. But that isn't important - and that's why we can get straight down to business.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Since you're new here, I'll make you an offer. You give me 50 gold pieces, and you can go.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //That's your entrance fee for the pub.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Let's find out what the militia thinks of that ...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Forget it, you won't get a single coin!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"All right. I'll pay.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"But I don't want to go to the tavern!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //But I don't want to go to the pub!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //You know, sooner or later, everyone wants to go into the pub. So you can pay right now - then you'll have it over with.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Oh, so this is the harbor watering hole. And there I was, taking it for the governor's palace.
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //Hey - cut out the bad jokes, runt, otherwise you'll be chewing the cobblestones.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"I see, I'll be forced to tan your hide ...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Are you trying to make trouble for me?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Calm down, all I want to do is drink a beer.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"But I don't want to go to the tavern!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //Yes, do you mind?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //You've got no business here, runt.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"I see, I'll be forced to tan your hide ...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Are you trying to make trouble for me?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Calm down, all I want to do is drink a beer.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //Let's find out what the militia thinks of that ...
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //(laughs) The militia isn't here. And do you know why they aren't here?
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //This here is the harbor district, runt. None of the militia will pick a fight with me down here.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //At the most, they go to the 'Red Lantern'. You see, it's just you and me. (filthy grin)
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //I see, I'll be forced to tan your hide in order to make any progress.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //You're welcome to try, runt. Show me what you got!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //Are you trying to make trouble for me?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //Sure, I'm a master at making trouble. So defend yourself, runt.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Calm down, all I want to do is drink a beer.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //Okay, but it'll cost you 50 gold pieces to get in. (grins)
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Forget it, you won't get a single coin!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"All right. I'll pay.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //All right, I'll pay.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //Great. And since this went so well, now you can give me the rest of what you've got on you.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Forget it, you won't get a single coin!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"OK, this is all I have.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //... but I don't have that much gold with me.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //That doesn't matter. Just give me everything you've got on you.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Forget it, you won't get a single coin!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"OK, this is all I have.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //... but I don't even have 10 gold pieces.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //Man, did I pick a live one.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //All right - sigh - you can go.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //Forget it, you won't get a single coin!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Then I'll take everything you have - as soon as you're lying on the ground in front of me.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //OK, this is all I have.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //All right, that's enough, then. Ever generous - that's me. (grins)
	AI_StopProcessInfos (self);
};
//************************************************
//	Das Hafenviertel
//************************************************

INSTANCE DIA_Moe_Harbor(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 998;
	condition	= DIA_Moe_Harbor_Condition;
	information	= DIA_Moe_Harbor_Info;
	permanent	= TRUE;
	description = "You know your way about the harbor, don't you?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //You know your way about the harbor, don't you?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Sure thing. Why?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"How's the shipping traffic?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"Why don't I see any militia?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"What kind of rumors are floating about?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //How's the shipping traffic?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //The only ship that's come here recently is the paladins' ship.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //It's over there behind the rocky ridge to the southwest.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //Why don't I see any militia?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //They don't dare come in here. We take care of things ourselves.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //What kind of rumors are floating about?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //Around here, we don't like people who ask too many questions. Especially not if they're strangers.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //Nothing - what could there be? Everything's quiet here.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //(contrived) It's bad. Times are hard and we're all trying to stay on the straight and narrow.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //Stop mocking me.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //How could you think something like that of me? I am deeply wounded.
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //Things are really hot. Lord Andre has been trying for a while to stick his nose into things that don't concern him.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //The swells will never understand the way things work down here.
		};
		
	}
	else if (Kapitel == 3)
	{
		if (Mis_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //We don't have anything to do with that business.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //What business?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //With that paladin they murdered up there. You really ought to worry about the mercenaries, instead of wasting your time down here.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //I know you didn't have anything to do with it, but the murder of the paladin has really frightened the fine gentlemen.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //If you want some advice among friends, get out of town. At least for a while.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Since it got out that the mercenaries didn't do in the paladin, the militia doesn't dare come in here at all.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //I think they're afraid of a few bloody noses. It's okay with me.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //There's absolutely nothing going on here.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //Finally those puffed-up paladins are leaving the harbor. It's about time.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LehmarGeldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Moe_LEHMARGELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_432_Moe;
	nr			 =  2;
	condition	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Moe_LEHMARGELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //Hey, you! Lehmar says hello.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};







