///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rethon_EXIT   (C_INFO)
{
	npc         = DJG_709_Rethon;
	nr          = 999;
	condition   = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_HALLO		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	5;
	condition	 = 	DIA_Rethon_HALLO_Condition;
	information	 = 	DIA_Rethon_HALLO_Info;

	description	 = 	"What are you doing here?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //What are you doing here?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //I'm getting ready to fight, what else?
};


 ///////////////////////////////////////////////////////////////////////
//	Info Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_KAMPF		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_KAMPF_Condition;
	information	 = 	DIA_Rethon_KAMPF_Info;

	description	 = 	"Who do you want to fight against?";
};

func int DIA_Rethon_KAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_KAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //Who do you want to fight against?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //I thought I'd drop in on the paladins and kick their fat asses.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Idiot. Against the dragons, of course. What did you think?
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_PALADINE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_PALADINE_Condition;
	information	 = 	DIA_Rethon_PALADINE_Info;

	description	 = 	"Don't the paladins mind you being here?";
};

func int DIA_Rethon_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //Don't the paladins mind you being here?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Nonsense. They have entirely different problems. Most of them are glad to still be alive.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //The boys' morale isn't the best. That will be their downfall.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //I mean, just look at those nicked blades they're fixing to go into battle with.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Any reasonable warrior would desert immediately.

};


///////////////////////////////////////////////////////////////////////
//	Info WoGruppe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_WOGRUPPE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	7;
	condition	 = 	DIA_Rethon_WOGRUPPE_Condition;
	information	 = 	DIA_Rethon_WOGRUPPE_Info;

	description	 = 	"Have you separated from your group?";
};

func int DIA_Rethon_WOGRUPPE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_WOGRUPPE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //Have you separated from your group?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //My group? I don't have a group. I'm a trophy collector.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //If I go home without a trophy, then I won't know what I came for. So, I can't use anybody else.
};


///////////////////////////////////////////////////////////////////////
//	Info drachengesehen
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_DRACHENGESEHEN		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	8;
	condition	 = 	DIA_Rethon_DRACHENGESEHEN_Condition;
	information	 = 	DIA_Rethon_DRACHENGESEHEN_Info;

	description	 = 	"Have you set eyes on a dragon yet?";
};

func int DIA_Rethon_DRACHENGESEHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_KAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rethon_DRACHENGESEHEN_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //Have you set eyes on a dragon yet?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //No. I want to get my weapons in shape before I set off.
};

///////////////////////////////////////////////////////////////////////
//	Info Angst
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_ANGST		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	9;
	condition	 = 	DIA_Rethon_ANGST_Condition;
	information	 = 	DIA_Rethon_ANGST_Info;

	description	 = 	"Aren't you afraid that somebody might beat you to it?";
};

func int DIA_Rethon_ANGST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_WOGRUPPE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_ANGST_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //Aren't you afraid that somebody might beat you to it?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //What? Who? Sylvio?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Your boss really thinks he can make a killing here, huh?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //I'm not one of Sylvio's people. I work for myself.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //Oh. All right, then. Forget I said anything.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //Have you seen the pathetic figures he's got with him?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio can be glad if he gets out of here alive.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //No, he won't. He's dead.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Fine with me.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "You don't seem to like him.", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "So where is Sylvio now?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "Sylvio was here?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //Sylvio was here?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //Here in the castle, you mean? Yeah, he was. But only for a short time.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //He chatted with a few people here and then set out again.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //You don't seem to like him.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //What do you mean, like? I'm not particularly proud that I know him.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio doesn't have any friends. He needs people who follow him no matter what.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //That's not for me. I work alone.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //So where is Sylvio now?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //The paladins here mentioned an ice dragon in the west. It's supposed to be the most dangerous and powerful of them all.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //You should have seen the gleam in Sylvio's eye when he heard that. One guess where he went.

	B_LogEntry (TOPIC_DRACHENJAGD,"Rethon the Dragon Hunter mumbled something about an ice dragon."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio was in the castle and then set off to find an ice dragon.");

};



///////////////////////////////////////////////////////////////////////
//	Info meineWaffe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_MEINEWAFFE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	10;
	condition	 = 	DIA_Rethon_MEINEWAFFE_Condition;
	information	 = 	DIA_Rethon_MEINEWAFFE_Info;

	description	 = 	"Can you help me improve my weapons?";
};

func int DIA_Rethon_MEINEWAFFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_MEINEWAFFE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //Can you help me improve my weapons?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //Improve? Better to buy something new and throw away the junk you're carrying around.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //Maybe I've got something for you. Interested?
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_TRADE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	11;
	condition	 = 	DIA_Rethon_TRADE_Condition;
	information	 = 	DIA_Rethon_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	
	description	 = 	"What can you sell me?";
};

func int DIA_Rethon_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_MEINEWAFFE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //What can you sell me?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Man, look at how low I've sunk. Now I'm even selling my weapons to a paladin.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //I don't really have much for a magician, but you can take a look anyway.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //I think I've got what you want, mate.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rethon_PICKPOCKET (C_INFO)
{
	npc			= DJG_709_Rethon;
	nr			= 900;
	condition	= DIA_Rethon_PICKPOCKET_Condition;
	information	= DIA_Rethon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen (78, 230);
};
 
FUNC VOID DIA_Rethon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rethon_PICKPOCKET);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_BACK 		,DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};
	
func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};


