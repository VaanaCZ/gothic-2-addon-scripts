// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_EXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_EXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos (self);

};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_FIRSTEXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_FIRSTEXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_StartOtherRoutine (Wulfgar,"START"); 
};




// ************************************************************
// 	  				   		Steckbrief
// ************************************************************
var int Andre_Steckbrief; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_Steckbrief()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //One of my men told that the bandits are circulating wanted posters with your face on them.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //He also says you denied that at first.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //So what is it all about?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //I don't know why those guys are looking for me...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //I hope for your sake that you're telling the truth.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //I cannot use anyone in the militia who doesn't have a clean record.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //Most of these bandits are former prisoners from the mining colony.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //I should hope that you didn't get involved in any way with those cutthroats!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //The merchant Canthar was here. He said that you are an escaped convict from the mining colony.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //I don't know whether that's the truth and I prefer not to ask you, but you should clear that matter up.
	
	B_RemoveNpc (Sarah);
	
			
	B_StartOtherRoutine (Canthar,"MARKTSTAND");
	AI_Teleport (Canthar,"NW_CITY_SARAH");
					
	if (Canthar_Sperre == FALSE)
	&& (Canthar_Pay == FALSE)
	{
		Canthar_Sperre = TRUE; 
	};
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
	
	Andre_CantharFalle = TRUE;
};

// ************************************************************
// 			Canthar Falle als INFO (niedrige Important)
// ************************************************************

INSTANCE DIA_Andre_CantharFalle (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 3;
	condition   = DIA_Andre_CantharFalle_Condition;
	information = DIA_Andre_CantharFalle_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_CantharFalle_Condition()
{
	if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	&& (Andre_CantharFalle == FALSE)
	{
		return TRUE;
	};
	
	if (Pablo_AndreMelden == TRUE)
	&& (!Npc_IsDead(Pablo))
	&& (Andre_Steckbrief == FALSE)
	{
		return TRUE;
	};
};

FUNC INT DIA_Andre_CantharFalle_Info()
{
	if (Andre_Steckbrief == FALSE)
	{
		B_Andre_Steckbrief();
	};
	
	if (Andre_CantharFalle == FALSE)
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	{
		B_Andre_CantharFalle();
	};
};

// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Andre_PMSchulden (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Andre_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Andre_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //Have you come to pay your penalty?

						
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};
						
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};

	if (B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //I had already asked myself if you would even dare to come here!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //Apparently, the charges against you have multiplied!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //I warned you! The penalty you have to pay now is higher!
			AI_Output (other, self, "DIA_Andre_PMAdd_15_00"); //How much?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Andre_LastPetzCounter);
		
			if (diff > 0)
			{
				Andre_Schulden = Andre_Schulden + (diff * 50);
			};
		
			if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Andre_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //You have severely disappointed me!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //Some new things have come up.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //Suddenly there is no one left who accuses you of murder.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //No one any longer remembers having seen you steal.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //There are no longer any witnesses that you were ever involved in a brawl.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //Apparently all the accusations against you have been cleared up.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //I don't know how that happened, but I'm warning you: don't play any games with me.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //In any case, I have decided to waive your debts.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //See to it that you don't get into any more trouble.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //I want one thing to be clear: you're going to have to pay the full amount of your penalty anyway.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //So, what is it?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"I haven't got enough gold!",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"How much was that again?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"I want to pay the penalty!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //How much was that again?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"I haven't got enough gold!",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"How much was that again?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"I want to pay the penalty!",DIA_Andre_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Andre_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Andre_PETZMASTER   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Andre_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_PETZMASTER_Info()
{
	Andre_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Andre noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //You must be the new fellow who has caused trouble here in the city.
	};
	
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};	
	
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};
	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //It is good that you have come to me before everything becomes even worse for you.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //Murder is a serious crime!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //To say nothing of the other things you have done.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //The watch have orders to execute every murderer on the spot.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //And most of the citizens will not tolerate a murderer in the city!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //I'm not interested in hanging you. We are at war and we need every man.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //But it will not be easy to make people feel better about you again.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //You could show your remorse by paying a penalty - naturally, it would have to be reasonably high.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //It is good that you have come! You are accused of theft! There are witnesses!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //I will not mention the other things I have heard.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //I will not tolerate such conduct in the city!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //You must pay a penalty in order to atone for your crime.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //It is one thing if you brawl with the rabble in the harbor ...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //But when you attack citizens, or the king's soldiers, I must bring you to justice.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //And that sheep thing wasn't really necessary either.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //If I let you get away with it, soon everyone here will do whatever he wishes.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //So, you will pay an appropriate penalty - and the matter will be forgotten.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //I have heard that you were after our sheep.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //You realize that I cannot let that go.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //You will have to pay compensation!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //How much?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"I haven't got enough gold!",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"I want to pay the penalty!",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //I want to pay the penalty!
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //Good! I shall see to it that everyone in the city learns of it - that will restore your reputation to some degree.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //I don't have enough gold.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //Then see to it that you acquire the gold as quickly as possible
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //And I'm warning you: if you add to your guilt, things will get worse for you.
	
	Andre_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// *********************************************************
//							Hallo
// *********************************************************
instance DIA_Andre_Hallo		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Hallo_Condition;
	information	 = 	DIA_Andre_Hallo_Info;
	permanent 	 =  FALSE; 
	important    =  TRUE;
};
func int DIA_Andre_Hallo_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //Innos be with you, stranger! What brings you to me?
};



// *********************************************************
//					Nachricht für Lord Hagen
// *********************************************************
instance DIA_Andre_Message		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 1;
	condition	= DIA_Andre_Message_Condition;
	information	= DIA_Andre_Message_Info;
	permanent 	= FALSE; 
	description = "I carry an important message for Lord Hagen.";
};
func int DIA_Andre_Message_Condition ()
{
	if (Kapitel < 3)
	&& ((hero.guild == GIL_NONE)
	|| (hero.guild == GIL_NOV))
	{
		return TRUE;
	};	
};
func void DIA_Andre_Message_Info ()
{
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //I've got an important message for Lord Hagen.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //Well, you stand before one of his men. What is this about?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "That I must tell Lord Hagen myself.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "The hosts of orcs are led by DRAGONS!", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "It's about a sacred artifact - the Eye of Innos.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Lord Hagen receives only paladins or those who are in service to the paladins.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //It is beneath his dignity to waste his time with members of the common folk.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //It's about a sacred artifact - the Eye of Innos.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //The Eye of Innos - I have never heard of it. But that doesn't necessarily mean anything.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //If there truly is an artifact of this name, only the highest members of our order would know anything about it, in any case.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //That's why I have to talk to Lord Hagen himself.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //The hosts of orcs are led by DRA-
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //(interrupting) I KNOW that the armies of the orcs are growing ever stronger.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //You don't mean to tell me that THAT is what you wish to report to Lord Hagen.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //He would tear your head from your shoulders if you wasted his time with such stories.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //And I am sure that you are clever enough to know that for yourself.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //So, what is this really about?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //That I must tell Lord Hagen myself.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Suit yourself. But you should know one thing:
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_Paladine		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_Paladine_Condition;
	information	 = 	DIA_Andre_Paladine_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Why are you paladins in town?";	
};
func int DIA_Andre_Paladine_Condition ()
{	
	if (other.guild != GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //Why are you paladins in town?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //The goals of our mission are secret.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //I can only tell you that there is no danger for the citizens of the town.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //You need not worry.
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_PaladineAgain		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_PaladineAgain_Condition;
	information	 = 	DIA_Andre_PaladineAgain_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Why are you paladins in town?";	
};
func int DIA_Andre_PaladineAgain_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_PaladineAgain_Info ()
{
	if Npc_KnowsInfo (other,DIA_Andre_Paladine)
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //Will you tell me now why you paladins have come to Khorinis?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //Why are you paladins in town?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Now you belong to the city guard, therefore you are also subordinate to the paladins.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //Now I can take you into confidence.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //We have come on a mission from King Rhobar. With the collapse of the Barrier, the deliveries of ore have failed.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Therefore, we are getting the ore and bringing it to the mainland. With the ore, we shall forge new weapons and drive the orcs back.
	
	KnowsPaladins_Ore = TRUE;
};
// *********************************************************
//						AskToJoin
// *********************************************************
instance DIA_Andre_AskToJoin		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_AskToJoin_Condition;
	information	= DIA_Andre_AskToJoin_Info;
	permanent 	= FALSE; 
	description = "I want to take up service with the paladins!";
};
func int DIA_Andre_AskToJoin_Condition ()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Andre_AskToJoin_Info ()
{
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //I want to take up service with the paladins!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Good. I can well use every able man here. No matter what his reasons for joining us.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //If you place yourself in the service of the paladins, I shall help you get an audience with Lord Hagen.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //An honorable request.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //However, I have my orders only to accept citizens of the town in the militia.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //My commander is afraid that spies or saboteurs could sneak in.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //He wants to limit the risk this way.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Therefore, you must first be a citizen of the town - whether this rule makes sense or not is disputable, but orders are orders.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Before I can become a member of the city guard, I must be a citizen of the town.");
};

// *********************************************************
//						About Miliz
// *********************************************************
instance DIA_Andre_AboutMiliz (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	5;
	condition	 = 	DIA_Andre_AboutMiliz_Condition;
	information	 = 	DIA_Andre_AboutMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"What should I expect with the militia?";
};

func int DIA_Andre_AboutMiliz_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_ABOUTMILIZ_Info ()
{
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //What should I expect with the militia?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Let me make one thing clear. To be a soldier of the militia means much more than strolling through the city in a uniform.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //It is a dirty and even a bloody job. Once you are one of us, a great deal of work will be waiting for you.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //But it is worth it. Besides the pay, you might someday have the chance of becoming a holy warrior of Innos.
};
			
///////////////////////////////////////////////////////////////////////
//	Info MartinEmpfehlung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MartinEmpfehlung		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information	 = 	DIA_Addon_Andre_MartinEmpfehlung_Info;

	description	 = 	"Look, I've got this letter of recommendation from your provisions master.";
};

func int DIA_Addon_Andre_MartinEmpfehlung_Condition ()
{
	if (Npc_HasItems (other,ItWr_Martin_MilizEmpfehlung_Addon))
	&& (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //Look, I've got this letter of recommendation from your provisions master.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //(disbelieving) What? Show me.
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //(impressed) Well, I'll be ...! This must have cost you quite an effort. It's no easy feat to get something like this out of Martin.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //All right. I'm convinced. If Martin vouches for you, I shall let you join. Let me know when you're ready.
	Andre_Knows_MartinEmpfehlung = TRUE;
};

// *********************************************************
//						Alternative			//e2
// *********************************************************
instance DIA_Andre_Alternative (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_Alternative_Condition;
	information	= DIA_Andre_Alternative_Info;
	permanent 	= FALSE; 
	description = "Isn't there a faster way to join you?";
};
func int DIA_Andre_Alternative_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Alternative_Info ()
{
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //Isn't there a faster way to join you?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Mmh (stops short) - you're really serious about this, aren't you?
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Good, listen. I have a problem. If you solve it for me, I shall see to it that you are accepted into the militia.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //But the most important thing is: you must not breathe a word of it to anyone!
	
	
};

// *********************************************************
//						GuildOfThieves			//e3
// *********************************************************
instance DIA_Andre_GuildOfThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_GuildOfThieves_Condition;
	information	= DIA_Andre_GuildOfThieves_Info;
	permanent 	= FALSE; 
	description = "What's your problem?";
};
func int DIA_Andre_GuildOfThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
};
func void DIA_Andre_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_GuildOfThieves_15_00"); //What's your problem?
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //Recently there have been a number of thefts in the city. Thus far, we have not been able to capture anyone, the thieves are simply too skillful.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //The scum know their business. I am sure that we're dealing with an organized gang.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //It would not amaze me if there were a thieves' guild in Khorinis. Find the  leaders of the gang and hunt them down.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //Then I shall see to it that you are accepted into the militia - regardless of whether or not you are a citizen.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //But you must say nothing about our agreement!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"There is another way to be accepted into the city guard, and that is to find and eliminate the thieves' guild in Khorinis.");
	
};

// *********************************************************
//						WhereThieves			//e4
// *********************************************************
instance DIA_Andre_WhereThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_WhereThieves_Condition;
	information	= DIA_Andre_WhereThieves_Info;
	permanent 	= FALSE; 
	description = "Where should I start looking for the thieves?";
};
func int DIA_Andre_WhereThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhereThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //Where should I start looking for the thieves?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //If I knew that, I would go there myself!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //I can only tell you this much: We recently turned the entire harbor district upside-down and found nothing, absolutely nothing.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //The people there are not very talkative, particularly if you wear the armor of a paladin.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //But you are an outsider, they will not distrust you so quickly.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //You could ask around the harbor first. But be careful. If the people there realize that you are working for the paladins, you will learn NOTHING!
	
	B_LogEntry (TOPIC_BecomeMIL,"If I'm going to find the thieves' guild, I'd better start listening around in the harbor district.");
};

// *********************************************************
//						WhatToDo			//e4
// *********************************************************
instance DIA_Andre_WhatToDo (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 3;
	condition	= DIA_Andre_WhatToDo_Condition;
	information	= DIA_Andre_WhatToDo_Info;
	permanent 	= FALSE; 
	description = "What should I do once I've found one of the thieves?";
};
func int DIA_Andre_WhatToDo_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhatToDo_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //What should I do once I've found one of the thieves?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //If it is a matter of a lackey, a henchman or some small fry, it would be best if you avoid a fight.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //Come rather to me and report. I shall then see to it that the fellow winds up behind bars.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //The city guard could intervene in an open battle and you would not have the opportunity of explaining to them what is going on.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //Furthermore, there is a bounty for every rotten apple you put behind bars.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //However, if you locate the leaders' hideout - well - then you probably won't be able to avoid a fight.
	
	B_LogEntry (TOPIC_BecomeMIL,"If I catch a henchman of the thieves' guild, I should take him straight to Lord Andre. To eliminate the thieves' guild, I must find their hideout.");
};

// *********************************************************
//					Verbrecher ausliefern		//e4
// *********************************************************
	
instance DIA_Andre_Auslieferung		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	200;
	condition	 = 	DIA_Andre_Auslieferung_Condition;
	information	 = 	DIA_Andre_Auslieferung_Info;
	permanent    =  TRUE;
	description	 = 	"I've come to collect the bounty for a criminal.";
};

func int DIA_Andre_Auslieferung_Condition ()
{	
	if (Rengaru_Ausgeliefert == FALSE)
	|| (Halvor_Ausgeliefert == FALSE)
	|| (Nagur_Ausgeliefert == FALSE)
	|| (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};	
};

func void DIA_Andre_Auslieferung_Info ()
{
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //I've come to collect the bounty for a criminal.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"I'll come back later (BACK)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru stole from the merchant Jora.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Halvor sells stolen goods.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur has killed Baltram's messenger.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Canthar is trying to get rid of Sarah!",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sarah is selling weapons to Onar.",DIA_Andre_Auslieferung_Sarah);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{	
	//Rengaru in den Knast beamen
	AI_Teleport			(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengaru stole from the merchant Jora. He tried to skedaddle, but I caught him.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Good, my men have already picked him up. He won't be stealing from anyone else in the near future.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Here is your money.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE; 
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	B_StartOtherRoutine (Rengaru,"PRISON");	
};

func void DIA_Andre_Auslieferung_Halvor()
{
	//Halvor in den Knast beamen
	AI_Teleport			(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor is a fence. He sells the goods that the bandits steal from the merchants.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //So he's behind it. My men will lock him up at once.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //I don't think he'll create any difficulties. I shall give you your bounty now.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Halvor,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	//Nagur in den Knast beamen
	AI_Teleport			(Nagur,"NW_CITY_HABOUR_KASERN_NAGUR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur has killed Baltram's messenger. He tried to use me as his new messenger in order to intercept Akil's shipment.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //That fellow will get his just punishment. I shall have him locked up immediately.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Here, take the bounty that you are entitled to.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE; 
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	//Canthar in den Knast beamen
	AI_Teleport			(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //Canthar the merchant is trying to get rid of Sarah!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //Sarah? The weapons merchant in the marketplace?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //I was supposed to foist a letter on Sarah which claimed that she's supplying weapons to Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //I see. I shall gladly pay the bounty for that bastard. He is already as good as behind bars.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Canthar,"KNAST"); 
	
	MIS_Canthars_KomproBrief  = LOG_FAILED;
	B_CheckLog ();
	
	Canthar_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};
func void DIA_Andre_Auslieferung_Sarah()
{
	//Sarah in den Knast beamen
	AI_Teleport			(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	//Canthar zum markt beamen
	AI_Teleport			(Canthar,"NW_CITY_SARAH"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sarah is selling weapons to Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //Sarah? The weapons merchant in the marketplace? Do you have proof of that?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //She has a letter in her pocket which details the delivery of arms to him.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //She won't get away with that. I shall have her arrested.
	
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Sarah,"KNAST"); 
	
	B_StartOtherRoutine (Canthar,"MARKTSTAND"); 
	
	Sarah_Ausgeliefert = TRUE;
	
	MIS_Canthars_KomproBrief  = LOG_SUCCESS;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

// *********************************************************
//					Diebesgilde Running
// *********************************************************
	
instance DIA_Andre_DGRunning (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	4;
	condition	 = 	DIA_Andre_DGRunning_Condition;
	information	 = 	DIA_Andre_DGRunning_Info;
	permanent    =  TRUE;
	description	 = 	"About the thieves' guild ...";
};

func int DIA_Andre_DGRunning_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info ()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //About the thieves' guild ...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //You can forget the business. I have sent a few men down into the sewers.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //The thieves' guild is now merely a sad chapter in the history of this city.
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;
		
		if (MIS_CassiaKelche == LOG_RUNNING)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};
		if (MIS_RamirezSextant == LOG_RUNNING)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};
		return;
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_08_03"); //Yes?
	
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "I'm working on it ...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "I hunted them all down!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "I found the hideout of the thieves' guild!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //I'm working on it ...
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //All right. I shall give you a bit more time to fulfill your mission.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //Good! Keep me informed.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //I found the hideout of the thieves' guild!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //Where?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //In the sewers below the city.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //What? We have sealed off the sewers ...
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //It looks like that didn't keep them from spreading out down there.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //Have you hunted down the criminals?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //I hunted them all down!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //You have done the city a great service.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //If you are still interested in a position with the militia, let me know.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //You have fulfilled your duty, as is proper for a servant of Innos and a soldier of the king.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //You are entitled to the bounty for the bandits. Here, take it.
	B_GiveInvItems (self, other, itmi_gold, (Kopfgeld*3));
	
	Info_ClearChoices(DIA_Andre_DGRunning);
};
	
// *********************************************************
//						JOIN Miliz			
// *********************************************************
instance DIA_Andre_JOIN	(C_INFO) 
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	100;
	condition	 = 	DIA_Andre_JOIN_Condition;
	information	 = 	DIA_Andre_JOIN_Info;
	permanent    =  TRUE;
	description	 = 	"I'm ready to join the militia!";
};

func int DIA_Andre_JOIN_Condition ()
{
	if (hero.guild == GIL_NONE) 
	&& (Npc_KnowsInfo (other,  DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info ()
{
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //I'm ready to join the militia!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Martin, the provisions master, vouches for you and has even recommended you. That alone is enough for me.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //I shall keep my part of the agreement and accept you into the militia, even though you are not a citizen of the town.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //But don't tell the whole world about it! The fewer people who learn about this exception, the less I shall have to justify myself afterwards.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //Then you are a citizen of Khorinis?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //The blacksmith has taken me on as an apprentice.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //Harad? I know him. He works for us. He is a good man.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //I am the alchemist's apprentice!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //We don't exactly have a lot of scholars in the militia. Perhaps your abilities could be of great use to us.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //I don't know much about the alchemist. But people say he is an honorable man.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //Bosper the bowyer has taken me on as his apprentice.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //Then you also know something about living in the wild? That is good, because the militia has assignments not just within the city walls.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //We can certainly use people who know their way around in the wilderness.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //And the bowyer is an important man in the city.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //If he vouches for you, there is nothing standing in the way of your acceptance into the militia.
		
		// ------- Außerdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //Furthermore, you have managed to rid us of the thieves' guild. I would have accepted you for that alone.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //That may be - but you are still not a citizen of this town and I have my orders.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //You can join us if you wish. But your decision will be final.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Once you wear the armor of the militia, you cannot simply take it off and no longer belong to us.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //Are you prepared to fight together with us for Innos and the king?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"I'm not quite sure yet ...",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"I'm ready!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //I'm ready!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //Then so shall it be. Welcome to the militia.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Here is your armor.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //Wear it with pride and dignity.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //I'm not quite sure yet ...
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //As long as you still have doubts about your decision, I cannot accept you into the militia.
	
	Info_ClearChoices (DIA_Andre_JOIN);
};
	
// *********************************************************
//					Endlich zu Lord Hagen?
// *********************************************************

instance DIA_Andre_LORDHAGEN		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_LORDHAGEN_Condition;
	information	 = 	DIA_Andre_LORDHAGEN_Info;
	permanent	 = 	FALSE;
	description	 = 	"Can I finally see Lord Hagen now?";
};
func int DIA_Andre_LORDHAGEN_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_LORDHAGEN_Info ()
{
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //Can I finally see Lord Hagen now?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //You are now in the service of the paladins. They will let you in. But you had better have something important to say.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //Don't worry, I do ...
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //Remember that you are meeting the chief paladin. Behave yourself accordingly. You represent not only yourself now, but the entire militia.
};
// *********************************************************
//				Waffe
// *********************************************************
instance DIA_Andre_Waffe		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Waffe_Condition;
	information	 = 	DIA_Andre_Waffe_Info;
	permanent	 = 	FALSE;
	description	 = 	"Will I get a weapon, too?";
};
func int DIA_Andre_Waffe_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //Will I get a weapon, too?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Of course. Peck usually takes care of that. But it occurs to me that I haven't seen him for quite a while.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Find out where he's hiding and bring him here. Then he will give you a weapon.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //And if you want to sleep, you can lie down in one of the beds in the bunkhouse.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck's somewhere in town. If I take him back to the barracks, I can get a weapon from him.");
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_PECK		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_PECK_Condition;
	information	 = 	DIA_Andre_FOUND_PECK_Info;
	permanent	 =  FALSE;
	description	 = 	"I've managed to track down Peck.";
};

func int DIA_Andre_FOUND_PECK_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Peck_FOUND_PECK)
	&& (MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_IsDead (Peck) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_PECK_Info ()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //I've managed to track down Peck.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Yes, he is already back at his post and going about his duty. Where did you find him?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"He crossed my path ...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"In the 'Red Lantern'...",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //He crossed my path in town.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //All right, then go to him and get yourself a weapon.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //He was in the 'Red Lantern'.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //So, he's hanging around with the girls instead of doing his duty.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //I believe I shall have a few words with him.
	
	B_GivePlayerXP 		(XP_FoundPeck*2);
	MIS_Andre_Peck = LOG_SUCCESS;
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};




// ################################################
// ###											###
// 				_NACH_  MILIZ-AUFNAHME
// ###											###
// ################################################

FUNC VOID B_AndreSold ()
{
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Here is your pay.
	B_GiveInvItems (self, other, itmi_Gold, Andre_Sold); 
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIRSTMISSION		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIRSTMISSION_Condition;
	information	 = 	DIA_Andre_FIRSTMISSION_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Do you have an assignment for me?";
};
func int DIA_Andre_FIRSTMISSION_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIRSTMISSION_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //Have you got an assignment for me?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //Lately there has been an increase in the sale of swampweed in the city.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //We cannot allow this stuff to catch on.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //Otherwise, everyone here will start smoking and no longer be able to work, let alone wield a weapon.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //Particularly now that there is the danger of a possible attack by orcs or mercenaries.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //I suspect that the mercenaries are behind it. I bet they are bringing the stuff into the city.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //What is there to do?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, one of our men, heard in the harbor pub that a package of swampweed has arrived somewhere in the harbor district.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Look around down there and bring me the package.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"A package of swampweed has arrived at the harbor. Mortis got wind of it in the pub there. I've got to find that package and take it to Lord Andre.");
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info FOUND_STUFF
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_STUFF		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_STUFF_Condition;
	information	 = 	DIA_Andre_FOUND_STUFF_Info;
	permanent	 =  TRUE;
	description	 = 	"About the package ...";
};
func int DIA_Andre_FOUND_STUFF_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_STUFF_Info ()
{
	
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_15_00"); //About the package ...
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //Have you found it?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Yes, here it is.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"I threw it into the harbor basin.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output	(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //Not so far.
	};
};
FUNC VOID DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //Yes, here it is.
	B_GiveInvItems (other, self,ItMi_HerbPaket,1);
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Good work. We shall guard the weed securely.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //I threw it into the harbor basin.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //So? Well, the main thing is that it can no longer fall into the wrong hands.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP (XP_Warehouse_Super);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
};	
	

///////////////////////////////////////////////////////////////////////
//	Info FIND_DEALER
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIND_DEALER		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIND_DEALER_Condition;
	information	 = 	DIA_Andre_FIND_DEALER_Info;
	permanent	 =  FALSE;
	description	 = 	"Have you got another job for me?";
};

func int DIA_Andre_FIND_DEALER_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	&& (Npc_IsDead (Borka)== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIND_DEALER_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_00"); //Have you got another job for me?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //You have taken the package of swampweed out of circulation - good.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //But I would like to know who is distributing the stuff among the people.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //It must be someone in the harbor district.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //If someone regularly came from outside the city, he would have been caught some time ago.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //What exactly am I to do?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //Find the dealer and get him to sell you some weed. That will not be easy, but we cannot arrest him otherwise.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Talk to Mortis, he knows the harbor district. Perhaps he can help you.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"I've got to find the guy who's selling swampweed in the harbor district. I've got to get him to sell me some weed. Mortis can help me with that.");
};
///////////////////////////////////////////////////////////////////////
//	Info REDLIGHT_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_REDLIGHT_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information	 = 	DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent	 =  TRUE;
	description	 = 	"About that weed ...";
};
func int DIA_Andre_REDLIGHT_SUCCESS_Condition ()
{
	if  (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_REDLIGHT_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //About that weed ...
	
	if (Npc_IsDead (Borka) == TRUE)
	|| (Undercover_Failed == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //I do not believe that we will learn anything in the harbor district now.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Not since that bouncer is dead.
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //This girl from the Red Lantern, Nadja, is dead. Must have been some freak accident.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //You were not discreet enough.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //I know who's selling the weed in town. It's Borka, the doorman at the Red Lantern.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //Indeed? Do we have proof?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //He sold me some swampweed.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //Fine, that's enough for us. I shall have him arrested at once.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //... I'm still working on it.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Good, remember that you must get the fellow to do business with you.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info HilfBauerLobart
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_HILFBAUERLOBART		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 =  3;
	condition	 = 	DIA_Andre_HILFBAUERLOBART_Condition;
	information	 = 	DIA_Andre_HILFBAUERLOBART_Info;
	description	 = 	"Have you got another assignment for me?";
};
func int DIA_Andre_HILFBAUERLOBART_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_HILFBAUERLOBART_Info ()
{
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //Have you got another assignment for me?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Lobart the turnip farmer has problems in his fields.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //If we help him, it will solidify his relationship with the city. So go to him and see what is wrong.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andre's sent me to Lobart's farm. I've got to help Lobart get his farm sorted out again."); 
	
	
	MIS_AndreHelpLobart = LOG_RUNNING;

	Wld_InsertNpc		(Lobarts_Giant_Bug1, 			"NW_FARM1_FIELD_06"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug2, 			"NW_FARM1_FIELD_06");
	
	Wld_InsertNpc		(Lobarts_Giant_Bug3, 			"NW_FARM1_FIELD_05"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug4, 			"NW_FARM1_FIELD_05"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug5, 			"NW_FARM1_FIELD_04"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug6, 			"NW_FARM1_FIELD_04"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug7, 			"NW_FARM1_FIELD_03"); 
	
	
	B_StartOtherRoutine (Vino,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer2,"BUGSTHERE");
	
	AI_StopProcessInfos (self);	
};

///////////////////////////////////////////////////////////////////////
//	Info LOBART_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_LOBART_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_LOBART_SUCCESS_Condition;
	information	 = 	DIA_Andre_LOBART_SUCCESS_Info;
	description	 = 	"I've helped Lobart.";
};
func int DIA_Andre_LOBART_SUCCESS_Condition ()
{	
	if (MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_LOBART_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //I've helped Lobart.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //Excellent. If Lobart is happy, then he will continue to sell his turnips to the city.
	B_GivePlayerXP (XP_LobartBugs);
	B_AndreSold ();
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople		(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople_Condition;
	information	= DIA_Addon_Andre_MissingPeople_Info;

	description	= "What about the missing people?";
};
func int DIA_Addon_Andre_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //What about the missing people?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //What about them?
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //Shouldn't we try to find them?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Lord Hagen gave me orders to protect the town and the surrounding farms.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //That means that we're taking care of the people who are still HERE.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //The militia patrols the streets at night. That's all I can do.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //And YOU will take care of the tasks I give you, understood?
	
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople2	(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople2_Condition;
	information	= DIA_Addon_Andre_MissingPeople2_Info;

	description	= "About the missing people...";
};
func int DIA_Addon_Andre_MissingPeople2_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild != GIL_MIL)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //About those missing people ...
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //Just leave me alone with THAT. I've got other problems.
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_ReturnedMissingPeople		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Info;

	description	 = 	"I've been able to rescue some of the missing people.";
};

func int DIA_Addon_Andre_ReturnedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	&& (MIS_Addon_Andre_MissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //I've been able to rescue some of the missing people.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //And here I was, wondering where the hell you've been all this time!
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //You're a member of the militia! You were not given orders for such an action!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //But ...
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //How many people did you find?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //All those who were still alive ...
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //All?! I ... Er ...
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //I am so proud of you! And I'm glad that I let you join us.
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //That was a grand deed.

	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Andre_MissingPeople);
};



//##########################################
//##
//##	Kapitel 3
//##
//##########################################


func void B_Andre_GotoLordHagen()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //You had better go directly to him.
};

// *********************************************************
// 						BerichtDrachen
// *********************************************************

instance DIA_Andre_BerichtDrachen		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachen_Condition;
	information	 = 	DIA_Andre_BerichtDrachen_Info;
	permanent	 =	FALSE;
	description	 = 	"I was in the Valley of Mines and saw the dragons!";
};
func int DIA_Andre_BerichtDrachen_Condition ()
{	
	if (EnterOW_Kapitel2 == TRUE)
	&& (MIS_OLDWORLD != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachen_Info ()
{
	//AI_Output (other, self,"DIA_Andre_Add_15_12"); //Lord Hagen hat mich auf eine Mission ins Minental geschickt! Ich soll direkt aufbrechen.
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //I was in the Valley of Mines and saw the dragons!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //I have a letter from Commander Garond that confirms everything I said.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //That'll interest Lord Hagen!
	B_Andre_GotoLordHagen();
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_BennetInPrison		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_BennetInPrison_Condition;
	information	 = 	DIA_Andre_BennetInPrison_Info;
	permanent	 =	TRUE;
	description	 = 	"What about Bennet, the blacksmith?";
};
func int DIA_Andre_BennetInPrison_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_BennetInPrison_Info ()
{
	AI_Output (other, self, "DIA_Andre_BennetInPrison_15_00"); //What about Bennet, the blacksmith?
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //You mean the mercenary? He is sitting in jail where he belongs.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //Can I talk to him?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Certainly, just go in. But if you try to help him escape, you will be in for it.
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_Cornelius_Liar		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Cornelius_Liar_Condition;
	information	 = 	DIA_Andre_Cornelius_Liar_Info;
	permanent	 =	TRUE;
	description	 = 	"I think that Cornelius is lying.";
};
func int DIA_Andre_Cornelius_Liar_Condition ()
{	
	if (Cornelius_ThreatenByMilSC == TRUE)
	&& (CorneliusFlee != TRUE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Cornelius_Liar_Info ()
{
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //I think that Cornelius is lying.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //Are you sure?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"No.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Yes.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //No.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //Then you should not announce your suspicion so loudly.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Cornelius is an influential man. He can make your life hell if he wants to.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //As long as you have no proof, I cannot help you.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Yes.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //What proof do you have?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //I've read his diary! They bribed him. Everything was just a bunch of lies.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //If that is really so, you must go to Lord Hagen immediately.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Show him the diary. He will take care of the rest.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Ehhm, well, I think ...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //I need proof, not suppositions. Get the proof, then I can do something for you.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //Until then, you should think carefully about what you say.
	};
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

// ******************************************************
//						Als Paladin
// ******************************************************

instance DIA_Andre_Paladin		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Paladin_Condition;
	information	 = 	DIA_Andre_Paladin_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};
func int DIA_Andre_Paladin_Condition ()
{	
	if (other.guild == GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladin_Info ()
{
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //So now you are a paladin! Congratulations!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //I thought from the beginning that you wouldn't stay with the militia long.
};

// ******************************************************
//						PERM
// ******************************************************

instance DIA_Andre_PERM		(C_INFO)
{
	npc			 = Mil_311_Andre;
	nr 			 = 100;
	condition	 = DIA_Andre_PERM_Condition;
	information	 = DIA_Andre_PERM_Info;
	permanent	 = TRUE;
	description	 = "How's the situation in town?";
};
func int DIA_Andre_PERM_Condition ()
{	
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_PERM_Info ()
{
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //How's the situation in town?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //Everything is under control.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Carry out your assignments.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //From now on you report directly to Lord Hagen. Go speak to him.
	};
};


// ###################
//		  Kap 5
// ###################

// *********************************************************
// 						BerichtDrachenTot
// *********************************************************

instance DIA_Andre_BerichtDrachenTot		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachenTot_Condition;
	information	 = 	DIA_Andre_BerichtDrachenTot_Info;
	permanent	 =	FALSE;
	description	 = 	"I have killed all the dragons in the Valley of Mines!";
};
func int DIA_Andre_BerichtDrachenTot_Condition ()
{	
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachenTot_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //I have killed all the dragons in the Valley of Mines!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //If that is true, you must tell Lord Hagen about it.
	B_Andre_GotoLordHagen();
};

// *********************************************************
// 						BerichtTorAuf
// *********************************************************

instance DIA_Andre_BerichtTorAuf (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtTorAuf_Condition;
	information	 = 	DIA_Andre_BerichtTorAuf_Info;
	permanent	 =	FALSE;
	description	 = 	"The castle in the Valley of Mines has been stormed by the orcs!";
};
func int DIA_Andre_BerichtTorAuf_Condition ()
{	
	if (Kapitel == 5)
	&& (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Andre_BerichtDrachenTot))
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtTorAuf_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //The castle in the Valley of Mines has been stormed by the orcs!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //No! Lord Hagen must hear of this.
	B_Andre_GotoLordHagen();
};





















