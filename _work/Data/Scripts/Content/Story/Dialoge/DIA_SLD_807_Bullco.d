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
	description	= "Wir beide sollten uns mal unterhalten ...";
};

func int DIA_Bullco_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Bullco_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Bullco_HALLO_15_00"); //Wir beide sollten uns mal unterhalten ...
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Bullco_HALLO_06_01"); //Hör zu, du hast gewonnen! Jetzt lass mich in Ruhe!
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_HALLO_06_02"); //Ich wüsste nicht, worüber!
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
	AI_Output (self, other, "DIA_Bullco_Quatscher_06_00"); //Sylvio mag es nicht, wenn man ihn anspricht. Hast du das immer noch nicht kapiert?
	
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
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_00"); //Wir beide müssen uns mal unterhalten.
	AI_Output (other, self, "DIA_Bullco_PleaseLeave_15_01"); //Was willst du?
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_02"); //Ich denke, es wird das Beste sein, wenn du dich auf dem Hof nicht mehr blicken lässt.
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_03"); //Sieh zu, dass du hier bis morgen verschwunden bist. Wir haben uns verstanden?

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
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_00"); //Du bist ja immer noch hier ...
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_01"); //Ich dachte, wir hätten uns darauf geeinigt, dass ich dich in Frieden ziehen lasse.
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_02"); //Du hättest besser auf mich hören sollen.
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_03"); //Ich glaub's ja nicht! Der Kerl ist immer noch hier!
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
	description = "Ich werde NICHT von hier weggehen!";
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
	AI_Output (other, self, "DIA_Bullco_WontLeave_15_00"); //Ich werde NICHT von hier weggehen!

	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Bullco_WontLeave_06_01"); //(seufzt) Na dann müssen wir noch mal darüber reden!
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);		
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_WontLeave_06_02"); //(brummig) Ja, ja, erzähl das jemandem, den es interessiert ...
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
	description = "Sagt dir der Name Pepe etwas?";
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
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_00"); //Sagt dir der Name Pepe etwas?
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_01"); //Ich kapier zwar kein Wort von dem, was du da faselst, aber dein Ton gefällt mir nicht!
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_02"); //Du hättest auf seine Schafe aufpassen sollen.
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_03"); //Was interessieren mich seine Schafe?
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_04"); //Lee interessieren sie.
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_05"); //Worauf willst du hinaus?
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_06"); //Wenn du mir weiter auf den Keks gehst, werde ich dafür sorgen, dass du die Schafe bezahlen musst.
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_07"); //Wenn du also auf deinen Sold Wert legst, lass mich in Zukunft zufrieden!
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_08"); //(zornig) Du, du ...
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_09"); //(ruhig) Ja?
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_10"); //(zu sich selbst) Mieser kleiner Penner ...
	
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








