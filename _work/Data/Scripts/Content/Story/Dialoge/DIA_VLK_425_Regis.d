///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Hey, you're new in town, huh?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Yes, and what about you?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //I've come from the mainland, and now I'm hanging about here. I'm almost out of gold, so all I can do now is join the militia, I guess.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //But I don't want to do that. I won't be slaughtered by those orcs on the King's behalf.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"What can you tell me about the militia?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //What can you tell me about the militia?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //One of the paladins has taken command. A certain Lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //He's trying to mobilize half the city in case the orcs attack.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //But you need to be a citizen of the town in order to be admitted.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //As far as I know, if you're not a citizen, you can train anyway, but you won't be officially admitted.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"What else can you tell me about Lord Andre?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //What else can you tell me about Lord Andre?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //He has taken over the position of judge as well.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //If you cause any trouble in this town, you're going to have to answer to him.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //I was once in a brawl with a citizen.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //He went crying to Lord Andre and ratted me out.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //That little matter cost me 50 gold pieces.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //I was lucky that it happened at night, or others would have witnessed it.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //The more people complain about you in this town, the higher your penalty will be.
};

// ****************************************************
// 					Prügelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Who did you fight with?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //Who did you fight with?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //With a fellow named Valentino. He often hangs out in the pub near the temple.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //I'm not usually a violent person. But THAT guy needed his face rearranged in the worst way ...
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"I met Valentino ...";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //I met Valentino ...
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //And?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //I gave him a sound beating ...
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //(laughs) He deserved it ...
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Here - I found this ring on him when our little disagreement had been settled.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //(grinning) You're welcome to pass it on to the next person who beats him up ...
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Has anything exciting happened?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //Has anything exciting happened?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //You could say that.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //They robbed Bosper the bowyer. What a brazen thing to do, I tell you!
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //The fellow just ambled into the shop in broad daylight and grabbed himself a bow.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //And Bosper right after him, hollering 'Stop right there, you rogue!' But the thief was too fast.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //And then an honest finder actually brought that stolen bow back to Bosper.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //That's odd - you'd think it's everyone for himself in times like these, but this man just drops in and returns that bow.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //Oh well, all's quiet. I suppose that when the orcs come, we can't fail to notice ...
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //They actually found out that the mercenary is innocent, and they had to let him go.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen must be beside himself with rage.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //The entire city is abuzz with it. Do you remember Lothar, the paladin?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Maybe.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Anyway, he's dead. Murdered out in the street. They're blaming the mercenaries, of course.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"I'm trying to find a crew for a sea voyage.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //I'm trying to find a crew for a sea voyage.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //I can't help you with that. You should probably have a look around the harbor, or maybe in the pub.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //If there are any sailors left here, you'll probably find them there.

};


