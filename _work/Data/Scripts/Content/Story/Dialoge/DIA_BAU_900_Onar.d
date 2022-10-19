// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Onar_EXIT   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 999;
	condition   = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Onar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				Hallo 
// ************************************************************
INSTANCE DIA_Onar_Hallo (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Onar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_Hallo_Info()
{
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //Who let you in here?!
	AI_Output (self, other, "DIA_Onar_Hallo_14_01"); //What are you doing here on my farm?!
};

// ************************************************************
// 			  				PERM 
// ************************************************************
INSTANCE DIA_Onar_PERM (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent   = TRUE;
	description = "Everything all right here on the farm?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //Everything all right here on the farm?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //I don't see how that's any of your business. You don't belong on the farm!
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //I certainly hope so! That's what I'm paying you for after all!
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //You had better go to Torlof and ask him if he has work for you.
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Yeah, sure. You just go and hunt your dragons.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //You sanctimonious bastards from the monastery aren't welcome here!
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //Our hospitality does not extend to the troops of the king.
	};
};

// ************************************************************
// 			  				Work 
// ************************************************************
INSTANCE DIA_Onar_Work (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent   = FALSE;
	description = "I want to work for you!";
};
FUNC INT DIA_Onar_Work_Condition()
{
	if (Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_Work_Info()
{
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //I want to work for you!
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //I don't need a farmhand right now.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //My people see to everything else.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //You have no business here in the house, so get out!
};


// ************************************************************
// 			  				WorkAsSld
// ************************************************************
INSTANCE DIA_Onar_WorkAsSld (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent   = FALSE;
	description = "I want to work here as a mercenary!";
};
FUNC INT DIA_Onar_WorkAsSld_Condition()
{
	if (Lee_SendToOnar == FALSE)
	&& (Onar_WegenSldWerden == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Onar_Work))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WorkAsSld_Info()
{
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //I want to work here as a mercenary!
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //You? A mercenary? Don't make me laugh! If you were any good as a mercenary, Lee would have told me about you.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_02"); //Now get yourself out of here, pronto!
	Onar_WegenSldWerden = TRUE;
};

// ************************************************************
// 			  				Aufstand
// ************************************************************
INSTANCE DIA_Onar_Aufstand (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 3;
	condition   = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent   = FALSE;
	description = "You're revolting against the city, or so I've heard?";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //You're revolting against the city, or so I've heard?
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //Now listen up. I inherited this farm and this land from my father.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //And he inherited it from HIS father.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //I'm not going to allow that greedy imbecile of a king to make off with all that just in order to feed his useless armies.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //The war with the orcs has been going on forever. And where do we stand? On the edge of defeat.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //No - I prefer to defend my farm myself! The money that I save this way can pay for my own army.
};

// ************************************************************
// 			  				WegenPepe
// ************************************************************
INSTANCE DIA_Onar_WegenPepe (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 4;
	condition   = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent   = FALSE;
	description = "Thanks to Bullco, you now have a few sheep less.";
};
FUNC INT DIA_Onar_WegenPepe_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenPepe_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Thanks to Bullco, you now have a few sheep less.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //What are you talking about? Who is Bullco?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //One of the mercenaries.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //How would that interest me? If he's been after my sheep, he'll have to answer to Lee.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //So why are you bugging me with such trivial details?
	Onar_WegenPepe = TRUE;
};

// ************************************************************
// 			  				WegenSekob
// ************************************************************
INSTANCE DIA_Onar_WegenSekob (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 5;
	condition   = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent   = FALSE;
	description = "I've come about Sekob's rent ...";
};
FUNC INT DIA_Onar_WegenSekob_Condition()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenSekob_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //I've come about Sekob's rent ...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //What the hell do you want here? Take the money to Torlof.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //How the devil would that be YOUR business?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //I want to become a mercenary. Collecting the rent is my test.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //But Sekob has no money. I even beat him up.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //He said it was because of the poor harvest ...
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //(yelling) You nitwit! Did you think he just carries that money around? He's hidden it somewhere!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //Do you know how much rain we have here? Bad harvest my ass.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //Go and beat that money out of him somehow.
	Onar_WegenSekob = TRUE;
};


// ************************************************************
// 			  			Lee schickt mich 
// ************************************************************
INSTANCE DIA_Onar_LeeSentMe   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 6;
	condition   = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent   = FALSE;
	description = "Lee sent me. I want to work here as a mercenary!";
};
FUNC INT DIA_Onar_LeeSentMe_Condition()
{
	if (Lee_SendToOnar == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_LeeSentMe_Info()
{
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Lee sent me. I want to work here as a mercenary!
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //He has already talked to me.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //I already didn't think much of you the first time you asked me.
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //But if Lee thinks you'll do, then I'm willing to give you a chance.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //He's the one responsible for you. So, suit yourself.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //But no fooling around here! Leave the farmers and the maids alone and, above all, don't nab anything, capisce?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //For everything else, talk to Lee.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //All WE need to discuss now is your pay.

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar has given me his approval. Now nothing can stop me joining the mercenaries.");
};



// ************************************************************
// 			  			Sold verhandeln
// ************************************************************
var int Onar_SOLD_Day;
var int Onar_SOLD_XP;
// -------------------

INSTANCE DIA_Onar_HowMuch   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 7;
	condition   = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent   = FALSE;
	description = "So how about my pay?";
};
FUNC INT DIA_Onar_HowMuch_Condition()
{
	if (Onar_Approved == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_HowMuch_Info()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //So how about my pay?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //Well, let's see ...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //I don't think too much of you.
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //You're not the sharpest knife in the drawer. That's obvious from that thing with Sekob.
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //You've already caused trouble here on the farm more than once.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //And you're constantly after me with all kinds of bullshit.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Let me think ...
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //What do you say?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "Sounds all right!", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "That's not a whole lot ...", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "Per day?", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //Per day?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //What did you think? Per week? You're really none too bright.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //So move your butt over here and come get your money.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //I'm not going to carry it after you.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //That's not a whole lot ...
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Of course, you're welcome to work for me for free instead.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //Anyway, this is all you'll get!
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"I can collect my pay from Onar every day.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //Sounds all right!
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //I think so too. Now go see Lee.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"I can collect my pay from Onar every day.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_CollectGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 8;
	condition   = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent   = TRUE;
	description = "Pay me my wages!";
};
FUNC INT DIA_Onar_CollectGold_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_CollectGold_Info()
{
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //Pay me my wages!
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //I pay for mercenaries, not dragon hunters.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //You don't take care of the assignments given to you!
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //I have asked Torlof how you're doing. And he says that it takes you forever to complete a job.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //I don't waste money on layabouts.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //You'll go a few weeks without pay for now! Maybe you'll learn your lesson then.
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //I've heard that you messed up. First go to Lee and settle the matter.
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //Are you out of your mind?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //First work for me for a day. You'll get your next pay tomorrow then.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //Where were you yesterday?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //Where have you been for the last couple of days?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //You never showed up here.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //Who knows where you've been hanging out.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag später...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //(contritely) Oh well. Here's your pay.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //What? You've done nothing but hang around all day when you didn't sleep!
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //I'm not paying you for that!
		};
		
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_MariaGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 9;
	condition   = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent   = FALSE;
	description = "Maria thinks that I'm not getting enough.";
};
FUNC INT DIA_Onar_MariaGold_Condition()
{
	if (Maria_MehrGold == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_MariaGold_Info()
{
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //Maria thinks that I'm not getting enough.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //What?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //She said you should pay me better.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //(griping) That woman has to stick her nose into everything.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //Did she say how much?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //No.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //All right, beginning with your next pay you'll get an extra 10 gold pieces.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //But not a coin more, understood?
	
	SOLD = SOLD + 10;
};	


// ************************************************************
// 			  				WannaSheep
// ************************************************************
var int Onar_SellSheep;
// --------------------

instance DIA_Onar_WannaSheep	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_WannaSheep_Condition;
	information	 = 	DIA_Onar_WannaSheep_Info;
	permanent	 = 	TRUE;
	description	 = 	"I want to buy a sheep!";
};
func int DIA_Onar_WannaSheep_Condition ()
{	
	if (Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Onar_WannaSheep_Info ()
{
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //I want to buy a sheep!
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //What are you doing here then? See a sheep anywhere?
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //I ...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //If you want to buy a sheep, go out the pasture. It's to the right of my house.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Have Pepe sell you one.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Pepe is dead, I'm afraid.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //Oh! In that case... leave 200 gold pieces here with me, and go get yourself a sheep from the pasture.
		
		Onar_SellSheep = TRUE;
	};
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
instance DIA_Onar_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_BuyLiesel_Condition;
	information	 = 	DIA_Onar_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Here you are, 200 gold pieces. Give me a sheep.";
};
func int DIA_Onar_BuyLiesel_Condition ()
{	
	if (Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Onar_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Here you are, 200 gold pieces. Give me a sheep.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //You can get yourself one from the pasture.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //One or the other of those sheep is bound to follow you. Most of them answer to the name of Betsy.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //You don't even have that much gold. Don't waste my precious time.
	};
};
