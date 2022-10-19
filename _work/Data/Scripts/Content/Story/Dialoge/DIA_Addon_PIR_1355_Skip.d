// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //What have we here, crossing the path of old Skip again?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //(exaggerated) I know you!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //The bay near the city, remember?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip! Right?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //(proudly) I see I made a lasting impression.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //But I've seen your mug ELSEWHERE in the meantime ...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //But of course!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //Oh well. Not a great likeness, but it's certainly YOU.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Don't let it get to you. My own wanted poster looks just as daft.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "I've got a package for you, from Baltram.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //I've got a package for you, from Baltram.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //(grinning) That guy must be really keen on our rum if he sends his goods after us all the way HERE.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Here, give him these 2 bottles of rum. I quaffed the third one while I was waiting for him.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "What are you doing here?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //What are you doing here?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //I've just come back from Khorinis and now I'm waiting for Greg to return.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "I saw Greg in Khorinis.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //I saw Greg in Khorinis.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //Really? Damn! Something must have gone wrong then.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //He should have been here with our ship some time ago.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //(pensively) I suppose I should go back to Khorinis and wait for him there ...
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //(sighs) But certainly not today. I only just arrived here.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "Can you take me to Khorinis?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //Can you take me to Khorinis?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //No way. I'm not leaving now. I'll find myself a decent swig of grog first.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Are you out of your mind? We've lost our SHIP, man!
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //I'm not taking our last boat out for a spin just because you're too lazy to get your butt over to Khorinis BY YOURSELF!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //For the last time: NO!
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "What can you tell me about the bandits?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //What can you tell me about the bandits?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //The bandits?! They're ATTACKING us!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Why do you think we're building this palisade?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //We brought those scumbags over here ourselves.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //We used to trade with them. Boy, let me tell you, they've got more gold than they'll ever know what to do with!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //They were prepared to pay any price for a bottle of rum.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //But those times are past. It's war now!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //What happened?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Those bastards hadn't paid for their last shipment.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //So I went there to see what had become of our gold.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //But when I got to the swamp, the swine attacked me!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //And that's not all. They killed Angus and Hank! Two of our best people.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Just stay away from that swamp, I tell you.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //They'll go after anyone who doesn't look as shabby as they do.
	
	
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "I need bandit's armor.";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //I need bandit's armor.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //You want to go in there? Are you insane? 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Once those guys find out you're not one of them, you're sausage meat!
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //Do you have any idea where I could find armor like that?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //(sighs) You don't give up easily, do you? All right. We used to have a suit.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Greg's probably still got it somewhere up in his hut.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Maybe you can buy it from him when he gets back ...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip assumes that the armor is in Greg's hut."); 
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "Can you tell me how to get into Greg's hut?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //Can you tell me how to get into his hut?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Whoa there! Not so fast!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //You weren't thinking of ransacking Greg's stuff, were you?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //When he left, he gave the key to Francis and told him not to let ANYONE into his hut.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis has the key to Greg's hut. He has been ordered to let no one in there."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "What can you tell me about Francis?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //What can you tell me about Francis?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //Francis is our treasurer.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //The Captain trusts him. That's probably why he left him in command.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //But none of the boys here really take him seriously.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //If you want to know more, talk to Samuel.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //He's got his still in the little cave north of here.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //There isn't a soul in this camp Samuel DOESN'T know all kinds of things about ...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"I should talk to Samuel. Maybe he can help me."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Have you ever met Raven?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Have you ever met Raven?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Certainly. When I was with Henry, up at the gate, I watched Raven place some of his boys at the tower to the south.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //Just a stone's throw from our camp. (laughs) I guess they're supposed to spy on us.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //I've also seen how he treats his people when they don't do his bidding.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //He'll make short shrift of anyone who doesn't obey his orders to the letter.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Mark my words: stay well away from Raven.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Tell me more about Angus and Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Tell me more about Angus and Hank.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus and Hank were supposed to meet with some bandits in front of the camp.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //They were carrying all kinds of supplies. Everything those bastards had ordered from us.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Forged steel and lock picks and whatnot. 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //But they never came back. The bandit swine must have done away with them!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan and Bill went out to look for them - without any success.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill was pretty devastated. They were both friends of his.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //He's still young, these things really get to him.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //The rest of us took it in our stride. The goods we can afford to lose. (sighs) But the grog they were carrying ...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //(angry) We're talking at least 20 bottles!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip has allegedly lost 20 bottles of grog to the bandits. He wants them back.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus and Hank were supposed to meet with a couple of bandits. They were never seen again.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"The search for Morgan and Bill remains unsuccessful.");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "About Angus and Hank ...";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //About Angus and Hank ...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //What?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //I found them.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //They're dead.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //(to himself) Dead as doornails - poor devils!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //Well, it was only to be expected.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //You should tell Bill if you haven't done so yet.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //But break it to him gently - he's still young.
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "I know who murdered Angus and Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //I know who murdered Angus and Hank.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //Good for you. They're both dead. So who cares now?
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //No pirate ever got rich through vengeance.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Just as long as I have my grog back.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //I don't care who murdered them. What about my grog?!
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "Here's your 20 bottles.";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //About that grog ...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Here's your 20 bottles.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //You're missing 20 bottles, right?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Yes, damnit. My entire stock.
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Here's your 20 bottles.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip has his 20 bottles of grog back and is happy.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //What? Really? Just like that?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //Weeell ...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //Okay. I'll pay for them.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Haven't you got anything more interesting than gold?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Mmh. Let's see. I've got this ring here.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //I won it gambling in a filthy dockside pub years ago.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //Back then, the guy told me it was magic. No idea whether that's true.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Maybe you want that instead of money?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Give me the money.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Give me the ring.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Give me the ring.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Here you are.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Give me the money.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //All right.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "Have you got anything to sell?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Have you got anything to sell?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //If you want to trade, go to Garett. He's in charge of our supplies.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "You're supposed to help me.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //You're supposed to help me.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //With what?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //The canyon awaits.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //I see you're taking some of the lads along. Good thing! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //You'd better bring some of the boys!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //That canyon is dangerous as hell!
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Come with me.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Come with me.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Wait. Let's go back into the canyon first ...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //Let's go!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "I no longer need you.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //I no longer need you.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //Well, that was that, then. You'll find me in the camp.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //This is far enough!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //If you insist on going further, count us out!
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //If you insist on going further, count me out!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //If we lose track of each other, let's meet up here at the watering hole.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Let's move on!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Orcs! I hate those things!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Looks like we got all of the razors.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //We could roam around a little longer if you want to.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Just as long as we stay in the canyon. 
	
	AI_StopProcessInfos (self); 
};


