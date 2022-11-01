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
	description	= "Tu ed io dovremmo fare due chiacchiere...";
};

func int DIA_Bullco_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Bullco_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Bullco_HALLO_15_00"); //Tu ed io dovremmo fare due chiacchiere...
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Bullco_HALLO_06_01"); //Ascolta, hai vinto! Ora lasciami in pace.
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_HALLO_06_02"); //Non saprei.
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
	AI_Output (self, other, "DIA_Bullco_Quatscher_06_00"); //A Silvio non piace che gli si parli. Dovresti averlo capito ormai.
	
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
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_00"); //Dobbiamo parlare, tu e io.
	AI_Output (other, self, "DIA_Bullco_PleaseLeave_15_01"); //Che vuoi?
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_02"); //Penso che la cosa migliore sarebbe se non mostrassi più la tua faccia qui alla fattoria.
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_03"); //Fai in modo di essere sparito per domani. Ci siamo capiti?

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
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_00"); //Sei ancora qui, dopo tutto...
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_01"); //Pensavo avessimo deciso che te ne saresti andato in pace.
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_02"); //Avresti dovuto ascoltarmi.
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_03"); //Non posso crederci! Il ragazzo è ancora qui!
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
	description = "NON me ne andrò di qui!";
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
	AI_Output (other, self, "DIA_Bullco_WontLeave_15_00"); //NON me ne andrò di qui!

	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Bullco_WontLeave_06_01"); //(sospira) Penso che dovremo discuterne nuovamente.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);		
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_WontLeave_06_02"); //(brontolando) Sì, sì, vai a dirlo a qualcuno a cui importi.
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
	description = "Ti dice niente il nome Pepe?";
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
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_00"); //Ti dice niente il nome Pepe?
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_01"); //Non capisco una parola di quello che stai dicendo, ma non mi piace il tuo tono!
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_02"); //Dovresti sorvegliare le sue pecore.
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_03"); //Che m'importa delle sue pecore?
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_04"); //A Lee importa.
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_05"); //Dove vuoi arrivare?
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_06"); //Se mi farai innervosire, farò in modo che tu debba pagarla per le pecore.
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_07"); //Quindi se sei interessato nella tua paga, lasciami in pace d'ora in poi!
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_08"); //(furioso) Tu, tu...
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_09"); //(calmo) Sì?
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_10"); //(tra sé) Ignobile ladruncolo...
	
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








