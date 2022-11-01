// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bullco_EXIT   (C_INFO)
{
	npc         = SLD_807_Bullco;
	nr          = 999;
	condition   = DIA_Bullco_EXIT_Condition;
	information = DIA_Bullco_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bullco_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bullco_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		  					Hallo (PERM)
// ************************************************************
instance DIA_Bullco_Hallo		(C_INFO)
{
	npc			= SLD_807_Bullco;
	nr		 	= 1;
	condition	= DIA_Bullco_Hallo_Condition;
	information	= DIA_Bullco_Hallo_Info;
	permanent	= TRUE;
	description	= "Męli bysme si spolu promluvit...";
};

func int DIA_Bullco_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Bullco_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Bullco_HALLO_15_00"); //Męli bychom si promluvit.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Bullco_HALLO_06_01"); //Poslyš, vyhrál jsi! Teë mne nech na pokoji.
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_HALLO_06_02"); //Nevędęl bych o čem.
	};
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		  			Sylvio zu oft angequatscht 
// ************************************************************
instance DIA_Bullco_Quatscher (C_INFO)
{
	npc			= SLD_807_Bullco;
	nr		 	= 2;
	condition	= DIA_Bullco_Quatscher_Condition;
	information	= DIA_Bullco_Quatscher_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Bullco_Quatscher_Condition ()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Sylvio_angequatscht >= 2)
	{
		return TRUE;
	};
};

func void DIA_Bullco_Quatscher_Info ()
{
	AI_Output (self, other, "DIA_Bullco_Quatscher_06_00"); //Sylvio se nerad vybavuje. To bys teë snad už męl vędęt.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "PEE");
	B_Attack (self, other, AR_NONE, 1);
};

// ************************************************************
// 		  			Please Leave
// ************************************************************
var int Bullco_Leave_Day;
var int Bullco_scharf;
// ---------------------
instance DIA_Bullco_PleaseLeave (C_INFO)
{
	npc			= SLD_807_Bullco;
	nr		 	= 3;
	condition	= DIA_Bullco_PleaseLeave_Condition;
	information	= DIA_Bullco_PleaseLeave_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Bullco_PleaseLeave_Condition ()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
		|| (Sylvio_MenDefeated == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bullco_PleaseLeave_Info ()
{
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_00"); //Musíme si promluvit, ty a já.
	AI_Output (other, self, "DIA_Bullco_PleaseLeave_15_01"); //Co chceš?
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_02"); //Myslím, že nejlepší by bylo, kdyby se tu na farmę tvůj ksicht už neukázal.
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_03"); //Dohodnęme se, že od zítâka tę tu už nikdo neuvidí. Rozumíme si?

	Bullco_Leave_Day = B_GetDayPlus();	
	Bullco_scharf = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "PEE");
};

// ************************************************************
// 			  			Jeden Tag Wieder
// ************************************************************
var int Bullco_HitCounter;
// -----------------------

instance DIA_Bullco_DailyCheck (C_INFO)
{
	npc			= SLD_807_Bullco;
	nr		 	= 4;
	condition	= DIA_Bullco_DailyCheck_Condition;
	information	= DIA_Bullco_DailyCheck_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Bullco_DailyCheck_Condition ()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Bullco_scharf == TRUE)
	&& (Wld_GetDay() > Bullco_Leave_Day)
	{
		return TRUE;
	};
};

func void DIA_Bullco_DailyCheck_Info ()
{
	if (Bullco_HitCounter == 0)
	{
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_00"); //Ty jsi po tom všem ještę tady?
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_01"); //Myslel jsem, že jsme se domluvili na tom, že se potichu vypaâíš.
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_02"); //Opravdu jsi mę męl poslechnout.
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_03"); //To snad není pravda! Ten klacek je poâád tady!
	};
	
	Bullco_HitCounter = Bullco_HitCounter + 1;
	Bullco_Leave_Day == B_GetDayPlus();
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);		
};


// ************************************************************
// 			  			Ich werde NICHT gehen.
// ************************************************************

instance DIA_Bullco_WontLeave (C_INFO)
{
	npc			= SLD_807_Bullco;
	nr		 	= 5;
	condition	= DIA_Bullco_WontLeave_Condition;
	information	= DIA_Bullco_WontLeave_Info;
	permanent	= FALSE;
	description = "Neodejdu odtud!";
};

func int DIA_Bullco_WontLeave_Condition ()
{
	if (Bullco_scharf == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bullco_WontLeave_Info ()
{
	AI_Output (other, self, "DIA_Bullco_WontLeave_15_00"); //Neodejdu odtud!

	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Bullco_WontLeave_06_01"); //(povzdech) Âekl bych, že si o tom budeme muset znovu promluvit.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);		
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_WontLeave_06_02"); //(mrzutę) Jo, jasnę, bęž to âíct nękomu, koho to bude zajímat.
		Bullco_scharf = FALSE;
		AI_StopProcessInfos (self);
	};
};


// ************************************************************
// 			  			Pepes Schafe
// ************************************************************

instance DIA_Bullco_PepesSchafe (C_INFO)
{
	npc			= SLD_807_Bullco;
	nr		 	= 6;
	condition	= DIA_Bullco_PepesSchafe_Condition;
	information	= DIA_Bullco_PepesSchafe_Info;
	permanent	= FALSE;
	description = "Pâipomíná ti nęco jméno Pepe?";
};

func int DIA_Bullco_PepesSchafe_Condition ()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (Bullco_scharf == TRUE)
	&& (Onar_WegenPepe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bullco_PepesSchafe_Info ()
{
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_00"); //Pâipomíná ti nęco jméno Pepe?
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_01"); //Nerozumím sice tomu, o čem to vůbec kecáš, ale nelíbí se mi tvůj tón!
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_02"); //Męl jsi hlídat jeho ovce.
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_03"); //Proč se mám starat o jeho ovce?
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_04"); //Lee se o nę stará.
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_05"); //O co ti jde?
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_06"); //Jestli mę nepâestaneš štvát, dohlédnu na to, abys ty ovce zaplatil.
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_07"); //Takže pokud chceš dostat svoje peníze, nech mę teë na pokoji!
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_08"); //(nazlobenę) Ty, ty...
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_09"); //(chladnę) Ano?
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_10"); //(pro sebe) Ubohý malý červe...
	
	Bullco_scharf = FALSE;
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};



 
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_BullcoSLD_PICKPOCKET (C_INFO)
{
	npc			= SLD_807_Bullco;
	nr			= 900;
	condition	= DIA_BullcoSLD_PICKPOCKET_Condition;
	information	= DIA_BullcoSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_BullcoSLD_PICKPOCKET_Condition()
{
	C_Beklauen (56, 35);
};
 
FUNC VOID DIA_BullcoSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_BullcoSLD_PICKPOCKET);
	Info_AddChoice		(DIA_BullcoSLD_PICKPOCKET, DIALOG_BACK 		,DIA_BullcoSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_BullcoSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_BullcoSLD_PICKPOCKET_DoIt);
};

func void DIA_BullcoSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_BullcoSLD_PICKPOCKET);
};
	
func void DIA_BullcoSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_BullcoSLD_PICKPOCKET);
};








