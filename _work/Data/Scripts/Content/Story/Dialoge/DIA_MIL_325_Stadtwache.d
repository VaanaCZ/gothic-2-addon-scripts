// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Mil_325_Miliz_EXIT (C_INFO)
{
	npc			= Mil_325_Miliz;
	nr			= 999;
	condition	= DIA_Mil_325_Miliz_EXIT_Condition;
	information	= DIA_Mil_325_Miliz_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Mil_325_Miliz_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Mil_325_Miliz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string Mil_325_Checkpoint	= "NW_CITY_MERCHANT_PATH_03";	//WP in Matteos Lager
// -----------------------------------------------------------

instance DIA_Mil_325_Miliz_FirstWarn (C_INFO)
{
	npc			= Mil_325_Miliz;
	nr			= 1;
	condition	= DIA_Mil_325_Miliz_FirstWarn_Condition;
	information	= DIA_Mil_325_Miliz_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Mil_325_Miliz_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_325_Checkpoint) < 650) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_325_Miliz_FirstWarn_12_00"); //HALT!
	AI_Output (self, other,"DIA_Mil_325_Miliz_FirstWarn_12_01"); //Das Warenlager darf nicht betreten werden.

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_325_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Mil_325_Miliz_SecondWarn (C_INFO)
{
	npc			= Mil_325_Miliz;
	nr			= 2;
	condition	= DIA_Mil_325_Miliz_SecondWarn_Condition;
	information	= DIA_Mil_325_Miliz_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_325_Miliz_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_325_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_325_Miliz_SecondWarn_12_00"); //Hörst du schlecht? Einen Schritt weiter und ich hack dich in Stücke!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Mil_325_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Mil_325_Miliz_Attack (C_INFO)
{
	npc			= Mil_325_Miliz;
	nr			= 3;
	condition	= DIA_Mil_325_Miliz_Attack_Condition;
	information	= DIA_Mil_325_Miliz_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_325_Miliz_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_325_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Mil_325_Miliz_Attack_12_00"); //Das war ein Fehler!
	
	AI_StopProcessInfos	(self);		
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};


// ************************************************************
// 							Bestechung!
// ************************************************************

INSTANCE DIA_Mil_325_Miliz_Pass (C_INFO)
{
	npc			= Mil_325_Miliz;
	nr			= 5;
	condition	= DIA_Mil_325_Miliz_Pass_Condition;
	information	= DIA_Mil_325_Miliz_Pass_Info;
	permanent	= FALSE;
	description	= "Ich gehöre zur Armee des Königs. Ich will mich ausrüsten!";
};                       

FUNC INT DIA_Mil_325_Miliz_Pass_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	&& ( (other.guild == GIL_MIL) || (other.guild == GIL_PAL) )
	{
		return TRUE;
	};
};
	
func void DIA_Mil_325_Miliz_Pass_Info()
{
	AI_Output (other, self,"DIA_Mil_325_Miliz_Pass_15_00"); //Ich gehöre zur Armee des Königs. Ich will mich ausrüsten!
	AI_Output (self, other,"DIA_Mil_325_Miliz_Pass_12_01"); //Hast du den Befehl dazu?
	
	Info_ClearChoices (DIA_Mil_325_Miliz_Pass);
	Info_AddChoice (DIA_Mil_325_Miliz_Pass, "Nein.", DIA_Mil_325_Miliz_Pass_No);
	Info_AddChoice (DIA_Mil_325_Miliz_Pass, "Klar.", DIA_Mil_325_Miliz_Pass_Yes);
};

func void DIA_Mil_325_Miliz_Pass_Yes()
{
	AI_Output (other, self,"DIA_Mil_325_Miliz_Pass_Yes_15_00"); //Klar.
	AI_Output (self, other,"DIA_Mil_325_Miliz_Pass_Yes_12_01"); //Gut, kannst reingehen!
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices (DIA_Mil_325_Miliz_Pass);
	AI_StopProcessInfos (self);
};

func void DIA_Mil_325_Miliz_Pass_No()
{
	AI_Output (other, self,"DIA_Mil_325_Miliz_Pass_No_15_00"); //Nein.
	AI_Output (self, other,"DIA_Mil_325_Miliz_Pass_No_12_01"); //Dann mach, dass du wegkommst.
	Info_ClearChoices (DIA_Mil_325_Miliz_Pass);
	AI_StopProcessInfos (self);
};


// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_Mil_325_Miliz_PERM (C_INFO)
{
	npc			= Mil_325_Miliz;
	nr			= 5;
	condition	= DIA_Mil_325_Miliz_PERM_Condition;
	information	= DIA_Mil_325_Miliz_PERM_Info;
	permanent	= TRUE;
	description	= "Warum darf das Lager nicht betreten werden?";
};                       

FUNC INT DIA_Mil_325_Miliz_PERM_Condition()
{	
	return TRUE;
};
	
func void DIA_Mil_325_Miliz_PERM_Info()
{
	AI_Output (other, self,"DIA_Mil_325_Miliz_PERM_15_00"); //Warum darf das Lager nicht betreten werden?
	AI_Output (self, other,"DIA_Mil_325_Miliz_PERM_12_01"); //Der ehrenwerte Lord Hagen hat die Ware für die Armee des Königs beschlagnahmt.
};






































