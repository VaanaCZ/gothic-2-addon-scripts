// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Ah, a customer - what can I do for you?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "I'm looking for a room.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //I'm looking for a room.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //You're in the right place, then.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //One of the paladins told me that I could spend the night here for free ...
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //What does it cost to spend the night?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Absolutely nothing.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //The paladins are responsible for the lodging of all travelers.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //So can I stay the night here for free?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Yes, yes.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Just go up the stairs.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //We still have one or two beds free.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "Why do the paladins pay for everything?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Why do the paladins pay for everything?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //I don't know what that's all about either.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //For one thing, I think they want to get all the poor suckers off the streets so they don't make any mischief.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //And for another, they want to get on the good side of the traveling traders.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Now that the farmers are rebelling, we have to rely on the traders for provisions.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //Besides, I think they want to improve the morale in the city a bit.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre has even arranged for free beer to be given out at the gallows square.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "Who's staying here at the moment?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //Who's staying here at the moment?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Almost all of them are traveling traders from the market.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Aha.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //Don't even think of messing with their stuff! I don't want any trouble here!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "I have a few questions about the city ...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //I have a few questions about the city ...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Where can I buy something around here?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Tell me about the town.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Where can I buy something around here?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //The market is directly in front of the door. You should be able to find everything there.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //There are a few more shops and craftsmen on the other side of town. Most of them are near the other city gate.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //Also, there's a fishmonger in the harbor district. His shop is directly at the harbor. He's easy to find.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Tell me about the town.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis is one of the wealthiest cities within the kingdom, even if it doesn't look like it at the moment.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //But since the orc war started, trade has almost come to a complete standstill. The king has requisitioned the entire merchant fleet for military service,
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //which means that hardly any ships come into the harbor now. So, the supply of goods is very scarce now, and many citizens of the town are very worried.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nobody really knows what the future will bring. There's basically nothing we can do but wait and see what happens. It's not like we can change anything.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht´s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "What's up?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //How's it going?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //You don't look like you care about other people's worries in the least.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Yeah, sure, I do.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"That depends.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Not really.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Not really.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //That's what I'm saying. Everyone here thinks of no one but himself. So what do you want?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //That depends.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //That depends on how much there is to be had, you mean.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //I can't use the likes of you around here.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Yeah, sure.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //What do you know, the world is full of surprises. I cleared out some of my stuff recently and sold a stack of old maps to Brahim, the cartographer down by the harbor.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Unfortunately, I noticed that I'm missing a document.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //I assume it must have slipped in among the papers.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Could you perhaps get it back for me?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hanna's missing a document. Seems it disappeared at the harbor, where the cartographer Brahim is."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"I'm not an errand boy.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"What's in it for me?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"I'll see what I can do.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //I'm not an errand boy.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //I see - the problems of a common woman are too profane for you. Then I guess I'll have to take care to it myself.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //What's in it for me?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //A-ha, I knew it - you're really no better than the rabble down at the harbor.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //So what is it you're asking of a poor woman?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Never mind.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"You could be a little nice to me.",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Gold.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Never mind.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //At least you have a shred of decency left. If you get the document back for me, I'll give you 75 gold pieces.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //You could be a little nice to me.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //But that's outrageous. I ... get out of here! You boorish lout!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Gold.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Filthy lucre is more than I can offer you. Oh well - it'll be worth 50 gold pieces to me.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //If you manage to get the document back, I'll give you 50 gold pieces.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //I'll see what I can do.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //You're so sweet. I wish you much luck!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //If you bring the paper back to me, I'll give you a reward.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftstück?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Did you mean this document?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //Did you mean this document?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Yes, that's exactly it. Thank you.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //What's my reward?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Not so fast. Here's your money.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Where ... do you come from?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //I found something interesting in your cellar ...
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //What were you doing in my cellar?!
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //You know damn well!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(coldly) I don't know what you're talking about ...
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(distrustful) Look at you! Where do you come from? Hm?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //(embarrassed) I...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(laughs) I know!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(conspiratorially) You don't have to tell me. I know everything.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Just don't even think of stealing anything here, got it?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //We can't afford drawing attention to the hotel.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "Look what book I have here!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Look what book I have here!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //Lehmar's ledger. How did you get hold of that?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //Well...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //If Lehmar doesn't have it any more, that's a good thing. But I'd rather have it myself ...
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Here - take the book.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Here - take the book.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Thanks.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Take this as a reward.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //What is this you've you given me?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //It is a key to the gate of wealth.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Everything all right in the hideout?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //I haven't seen any of them in quite a while.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //I should go down there when I get the chance and check up on things.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Yes. But you'd better not talk about it ...
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //Did you know about the thieves' hideout?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(smirks) I don't know what you're talking about ...
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //The militia was here ... Somebody betrayed the hideout!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //They couldn't pin anything on me, but Cassia and her people are dead!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //I'm sure it was YOU...
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //I bought this here especially for you.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //It cost me a lot of money. But you're worth it, you swine ...
};	

	
