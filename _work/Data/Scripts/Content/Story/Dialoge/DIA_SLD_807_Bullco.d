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
	description	= "Jest co�, o czym powinni�my pogada�...";
};

func int DIA_Bullco_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Bullco_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Bullco_HALLO_15_00"); //Jest co�, o czym powinni�my pogada�...
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Bullco_HALLO_06_01"); //Wygra�e�! A teraz id� sobie.
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_HALLO_06_02"); //Nic o tym nie wiem.
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
	AI_Output (self, other, "DIA_Bullco_Quatscher_06_00"); //Silvio nie lubi, jak si� do niego rozmawia. Do tej pory powiniene� to ju� wiedzie�.
	
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
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_00"); //Ty i ja musimy pogada�.
	AI_Output (other, self, "DIA_Bullco_PleaseLeave_15_01"); //Czego chcesz?
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_02"); //My�l�, �eby� nie pokazywa� si� na farmie.
	AI_Output (self, other, "DIA_Bullco_PleaseLeave_06_03"); //Jutro ma ci� tu nie by�. Rozumiesz?

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
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_00"); //Dalej tu jeste�...
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_01"); //Chyba ustalili�my, �e nie b�d� ci� zatrzymywa�.
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_02"); //Naprawd� trzeba by�o mnie s�ucha�.
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_DailyCheck_06_03"); //Nie wierz�! Ten kole�ka wci�� tu jest!
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
	description = "NIE zamierzam st�d odej��!";
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
	AI_Output (other, self, "DIA_Bullco_WontLeave_15_00"); //NIE zamierzam st�d odej��!

	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Bullco_WontLeave_06_01"); //No to chyba b�dziemy gadali o tym jeszcze raz.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);		
	}
	else
	{
		AI_Output (self, other, "DIA_Bullco_WontLeave_06_02"); //Taak, taak, id� to powiedz komu�, kogo to obchodzi.
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
	description = "Czy imi� Pepe co� ci m�wi?";
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
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_00"); //Czy imi� Pepe co� ci m�wi?
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_01"); //Nie rozumiem, co gadasz, ale nie widzi mi si�, jak to gadasz.
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_02"); //Mia�e� pilnowa� jego owiec.
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_03"); //A co mnie obchodz� jego owce?
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_04"); //Lee obchodz�.
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_05"); //No i...?
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_06"); //Je�li dalej b�dziesz mnie wkurza�, zadbam o to, �eby� musia� zap�aci� za te owce.
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_07"); //Wi�c je�li interesuje ci� twoje wynagrodzenie, to daj mi spok�j!
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_08"); //Ty, ty....
	AI_Output (other, self, "DIA_Bullco_PepesSchafe_15_09"); //Tak?
	AI_Output (self, other, "DIA_Bullco_PepesSchafe_06_10"); //Ty wstr�tna kreaturo...
	
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








