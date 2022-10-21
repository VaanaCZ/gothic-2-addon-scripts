// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Khaled_EXIT (C_INFO)
{
	npc         = SLD_823_Khaled;
	nr          = 999;
	condition   = DIA_Khaled_EXIT_Condition;
	information = DIA_Khaled_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Khaled_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Khaled_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				Hallo 
// ************************************************************
var int Khaled_weiter;

instance DIA_Khaled_Hallo		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 1;
	condition	= DIA_Khaled_Hallo_Condition;
	information	= DIA_Khaled_Hallo_Info;
	permanent	= TRUE;
	description	= "Everything all right with you?";
};

func int DIA_Khaled_Hallo_Condition ()
{
	if (Khaled_weiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Khaled_Hallo_15_00"); //Everything fine with you?
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	{
		AI_Output (self, other, "DIA_Khaled_Hallo_11_01"); //So - you want to join us, then? Do you even have a decent weapon?
		Khaled_weiter = TRUE;
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Khaled is a weapons dealer.");
	}
	else
	{
		AI_Output (self, other, "DIA_Khaled_Hallo_11_02"); //If it's something important, go talk to Lee. Otherwise, leave me alone.
		AI_StopProcessInfos (self);
	};	
};

// ************************************************************
// 			  				TRADE 
// ************************************************************
instance DIA_Khaled_TRADE		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 700;
	condition	= DIA_Khaled_TRADE_Condition;
	information	= DIA_Khaled_TRADE_Info;
	permanent	= TRUE;
	description	= "What weapons do you have to offer?";
	trade		= TRUE;
};

func int DIA_Khaled_TRADE_Condition ()
{
	if (Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Khaled_TRADE_15_00"); //What weapons do you have to offer?
	B_GiveTradeInv (self);
	AI_Output (self, other, "DIA_Khaled_TRADE_11_01"); //Only the best. Just take a look at them.
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************
instance DIA_Khaled_WannaJoin		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 10;
	condition	= DIA_Khaled_WannaJoin_Condition;
	information	= DIA_Khaled_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Would you mind if I joined you?";
};

func int DIA_Khaled_WannaJoin_Condition ()
{
	if (Khaled_weiter == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Khaled_WannaJoin_15_00"); //Would you mind if I joined you?
	AI_Output (self, other, "DIA_Khaled_WannaJoin_11_01"); //Once you have passed the test, I shall vote for you.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Khaled_WannaJoin_15_02"); //I passed it already.
		AI_Output (self, other, "DIA_Khaled_WannaJoin_11_03"); //Well, that's all right then.
	};
};

// ************************************************************
// 			  				Woher 
// ************************************************************
instance DIA_Khaled_Woher		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 3;
	condition	= DIA_Khaled_Woher_Condition;
	information	= DIA_Khaled_Woher_Info;
	permanent	= FALSE;
	description	= "How did you end up with the mercenaries?";
};

func int DIA_Khaled_Woher_Condition ()
{
	if (Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Woher_Info ()
{
	AI_Output (other, self, "DIA_Khaled_Woher_15_00"); //How did you end up with the mercenaries?
	AI_Output (self, other, "DIA_Khaled_Woher_11_01"); //I came with Sylvio from the south. We belonged to an army of mercenaries which fought against the orcs.
};

// ************************************************************
// 			  				AboutSylvio 
// ************************************************************
instance DIA_Khaled_AboutSylvio		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 4;
	condition	= DIA_Khaled_AboutSylvio_Condition;
	information	= DIA_Khaled_AboutSylvio_Info;
	permanent	= FALSE;
	description	= "What's your opinion of Sylvio?";
};

func int DIA_Khaled_AboutSylvio_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutSylvio_Info ()
{
	AI_Output (other, self, "DIA_Khaled_AboutSylvio_15_00"); //What's your opinion of Sylvio?
	AI_Output (self, other, "DIA_Khaled_AboutSylvio_11_01"); //He's a dangerous fellow! And many of the mercenaries who came with him this far listen to what he says. Better not pick a fight with him.
};

// ************************************************************
// 			  				AboutLee 
// ************************************************************
instance DIA_Khaled_AboutLee		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 5;
	condition	= DIA_Khaled_AboutLee_Condition;
	information	= DIA_Khaled_AboutLee_Info;
	permanent	= FALSE;
	description	= "What do you think of Lee?";
};

func int DIA_Khaled_AboutLee_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutLee_Info ()
{
	AI_Output (other, self, "DIA_Khaled_AboutLee_15_00"); //What's your opinion of Lee?
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_01"); //I think that the only thing Lee is really interested in is getting away from this island.
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_02"); //He wants to go to the mainland. Seems to have a bone to pick with someone there ...
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_03"); //At any rate, he does a far better job than Sylvio ever could.
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_04"); //Moreover, he's a good leader. Most of the time we can do whatever we want here.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Khaled_PICKPOCKET (C_INFO)
{
	npc			= SLD_823_Khaled;
	nr			= 900;
	condition	= DIA_Khaled_PICKPOCKET_Condition;
	information	= DIA_Khaled_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Khaled_PICKPOCKET_Condition()
{
	C_Beklauen (78, 85);
};
 
FUNC VOID DIA_Khaled_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Khaled_PICKPOCKET);
	Info_AddChoice		(DIA_Khaled_PICKPOCKET, DIALOG_BACK 		,DIA_Khaled_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Khaled_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Khaled_PICKPOCKET_DoIt);
};

func void DIA_Khaled_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Khaled_PICKPOCKET);
};
	
func void DIA_Khaled_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Khaled_PICKPOCKET);
};























