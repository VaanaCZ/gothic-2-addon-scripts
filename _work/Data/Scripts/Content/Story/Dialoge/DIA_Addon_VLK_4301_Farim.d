///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"You're a fisherman?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //You're a fisherman?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //(cynically) Now how did you ever guess that?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Can't you simply leave me alone?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Don't take it personally, but I haven't been too happy with the militia lately.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Don't take it personally, but I haven't been too happy lately. It's that militia.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"Trouble with the militia?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //Trouble with the militia?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Those bastards keep coming here and taking whatever they want.
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //Last week they made off with my entire catch. 'It's for a good cause,' they said.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //I know that everybody's got to fend for himself since the farmers have stopped trading.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //And, of course, sometimes people just go hungry. Small wonder that they're snatching the fish from right under my nose.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //But if they keep doing this, I won't even have enough to feed myself.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Give me all your fish.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Maybe I can help you.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Have you talked to the paladins about this?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //Have you talked to the paladins about this?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //(laughs) Are you joking? Do you really think they'd be interested if a poor devil like me has his problems with the militia?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Give me all your fish.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //(angrily) I just KNEW it. Another of those scumbags.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //You're too late, I'm afraid. Your friends were here yesterday, and they took everything.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //Well. I guess you had better leave now.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Maybe I can help you.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //I don't know. I suppose you'd have to know somebody from the militia who has connections to the paladins.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //The paladins will hardly buy the fish from me.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //I shall see what I can do.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Farim the fisher has a problem with the militia. They take so much fish from him that he doesn't have enough to live on. I should find someone in the militia with influence on the paladins who can help him."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"I know how to resolve your trouble with the militia.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //I know how to resolve your trouble with the militia.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //And how would that be?

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //I'm not here often enough to keep a constant vigil on your fish.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //But I know somebody who can do just that.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Martin, the provisions master of the paladins, wants to hear your story about the militia and the fish.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //And you think he can make the militia leave me alone?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //At least that's what he said.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Great. Thank you. I cannot give you much. But wait ...
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //I found this strange blue stone on one of the islands off the coast of Khorinis.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //I don't think it's worth a whole lot, but someone like you will certainly find a use for it.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"Can you tell me something about the missing people?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //Can you tell me something about the missing people?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //My friend William started hanging out with a bunch of shady characters. And where did it get him?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //One day he simply didn't show up for work, and that's the last we saw of him.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"Your buddy William has disappeared?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //Your buddy William has disappeared?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //So he has. He's a fisherman, but a little too big for his boots, I should add.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //He should have stayed well away from that bunch.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "What bastards would those be?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "He'll surface again.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "What's he been up to?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "When did you last see him?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //What's he been up to?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William had some shady dealings with those crooks.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //I think it was all about contraband that he sold to the bastards.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //What bastards would those be?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //I don't know who they are or what their business is here in Khorinis.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //I only know the place where they met up with William.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //I just happened to see William there when I was fishing in the bay.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Where exactly is that meeting place?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Where exactly is that meeting place?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //There's a bay opposite the harbor, north of here.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //You can only reach it by boat, or swim.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //There's a beach there, and a small fishing camp. That's where I saw them.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"The fisherman Farim laments the loss of his pal William. Farim says that William frequently met with some cutthroats in a bay north of the harbor."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "I think I've heard enough.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //When did you last see him?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Only a few days ago.

	Info_AddChoice	(DIA_Addon_Farim_William, "Maybe he just went out to sea to fish?", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Maybe he just went out to sea to fish?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //That's not very likely. His boat is still moored in the harbor.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //He'll surface again.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //I don't think so. He's been gone for too long already.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //I'm afraid that I'll be dragging his body from the sea at some point.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //I think I've heard enough.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Spare yourself the effort. I don't believe you'll find him.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"So, how are the fish biting?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //So, how are the fish biting?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Stop pretending you're interested.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //I've seen better times. Too little to live on, too much to die.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //There you are again!
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //Have you heard news of my buddy William, then?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //He's dead.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //(sighs) Yeah, that's what I'd been expecting.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Thanks for coming back here to tell me.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //I'll go down to the pub and drink up his share of our last catch - that's what he would have wanted ...
};






