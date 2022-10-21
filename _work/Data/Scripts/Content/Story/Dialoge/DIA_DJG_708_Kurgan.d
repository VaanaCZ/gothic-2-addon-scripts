
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kurgan_EXIT   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 999;
	condition   = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (Biff,400);	//Joly: Damit Biff nicht sofort am Anfang Kohle einfordert.
};

//************************************************************************
//	Hello
//************************************************************************
instance DIA_Kurgan_HELLO		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_HELLO_Condition;
	information	= 	DIA_Kurgan_HELLO_Info;

	important	= 	TRUE;
};

func int DIA_Kurgan_HELLO_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info ()
{
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //Hey, you! Fellows like you should watch where they're going.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //What are you trying to tell me?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //I mean that the air out here isn't good for your health. The place is just swarming with orcs and monsters.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //Not to mention the dragons. It's just a well-intentioned warning.
	B_LogEntry (TOPIC_Dragonhunter,"A group of Dragon Hunters received me at the entrance to the Valley of Mines. The guys are heavily armed, but I'm afraid they won't make much of an impression on the dragons.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"Can you tell me anything I don't know already?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //Can you tell me anything I don't know already?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //I can give you a good piece of advice, and it's even free.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //We can't use anyone here who faints dead away at the slightest dragon fart.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //Go home, this is a job for real men.
	
};

//**************************************************************************
//	Bist du hier der Anführer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"Are you the boss here?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //Are you the boss here?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //Do I look like it? Certainly not. We don't need any self-important jerk ordering us around.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //When Sylvio tried to act like he was the boss, we showed him and his buddies what we thought of that.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //There was a brawl. In the end, they left on their own.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //I hope Sylvio wound up in the soup kettle of some orc.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen töten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"So you want to kill dragons?";

};

func int DIA_Kurgan_KillDragon_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kurgan_Leader))
		{
				return TRUE;
		};
};
var int Kurgan_KillDragon_Day;
func void DIA_Kurgan_KillDragon_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //(mocking) So you want to kill dragons?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //Smart ass. So do you know how to bring down a dragon?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //Do you think the beast will just sit there quietly while you chop off its head?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //Something like that takes good planning and decisive action.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //I see. And how are you going to go about that?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //First we'll scout out where we can find the beasts.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Only then will we think about the best way to attack.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "I'd love to watch you do that, but I've got to be on my way.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "How are you going to get past the orcs?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "I think you won't even find a blind sheep.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //I think you won't even find a blind sheep.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //What? Do you want me to push in your stupid face?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //How are you going to get past the orcs?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //We'll worry about those details later.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //I'd love to watch you do that, but I've got to be on my way.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //Get yourself back over the pass. Otherwise you may end up missing a limb or two.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info SEENDRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Kurgan_SEENDRAGON		(C_INFO)
{
	npc		 = 	DJG_708_Kurgan;
	condition	 = 	DIA_Kurgan_SEENDRAGON_Condition;
	information	 = 	DIA_Kurgan_SEENDRAGON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Have you seen a dragon yet?";
};

func int DIA_Kurgan_SEENDRAGON_Condition ()
{
	if (Kurgan_KillDragon_Day<=(Wld_GetDay()-2))
		{
				return TRUE;
		};
};

func void DIA_Kurgan_SEENDRAGON_Info ()
{
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //Have you seen a dragon yet?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Not so far. But the beasts can't hide forever.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kurgan_AllDragonsDead   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 5;
	condition   = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "The dragons are dead.";
				
};

FUNC INT DIA_Kurgan_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //The dragons are dead.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ha, who's supposed to have killed them then? The paladins?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //I did.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //(laughs) Hah. You don't believe that yourself. Quit yanking my chain.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kurgan_PICKPOCKET (C_INFO)
{
	npc			= DJG_708_Kurgan;
	nr			= 900;
	condition	= DIA_Kurgan_PICKPOCKET_Condition;
	information	= DIA_Kurgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kurgan_PICKPOCKET_Condition()
{
	C_Beklauen (34, 120);
};
 
FUNC VOID DIA_Kurgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_BACK 		,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};
	
func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};




