///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cedric_EXIT   (C_INFO)
{
	npc         = PAL_216_Cedric;
	nr          = 999;
	condition   = DIA_Cedric_EXIT_Condition;
	information = DIA_Cedric_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cedric_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cedric_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Cedric_Hallo		(C_INFO)
{
	npc		 	 = 	PAL_216_Cedric;
	nr			 =  2;
	condition	 = 	DIA_Cedric_Hallo_Condition;
	information	 = 	DIA_Cedric_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Cedric_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Cedric_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Cedric_Hallo_12_00"); //Sono Cedric il maestro di spada, paladino del re.
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Cedric_CanTeach		(C_INFO)
{
	npc			 = 	PAL_216_Cedric;
	nr			 = 	5;
	condition	 = 	DIA_Cedric_CanTeach_Condition;
	information	 = 	DIA_Cedric_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Vorresti addestrarmi?";
};
func int DIA_Cedric_CanTeach_Condition ()
{	
	if (Cedric_Teach1H == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Cedric_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Cedric_CanTeach_15_00"); //Puoi addestrarmi?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Cedric_CanTeach_12_01"); //Posso allenarti nel combattimento con le armi a una mano.
		Cedric_Teach1H = TRUE;
		B_LogEntry (TOPIC_CityTeacher,"Il paladino Cedric pu� insegnarmi a combattere con armi a una mano.");
	}
	else
	{
		AI_Output (self, other, "DIA_Cedric_CanTeach_12_02"); //Alleno solamente i paladini.
	};
	
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Cedric_Teach(C_INFO)
{
	npc			= PAL_216_Cedric;
	nr			= 100;
	condition	= DIA_Cedric_Teach_Condition;
	information	= DIA_Cedric_Teach_Info;
	permanent	= TRUE;
	description = "Voglio essere addestrato.";
};                       
//----------------------------------
var int DIA_Cedric_Teach_permanent;
//----------------------------------
FUNC INT DIA_Cedric_Teach_Condition()
{
	if (Cedric_Teach1H == TRUE)
	&& (DIA_Cedric_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Cedric_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Cedric_Teach_15_00"); //Voglio essere addestrato.
	
	if (other.HitChance[NPC_TALENT_1H] >= 90)
	{
		AI_Output (self,other,"DIA_DIA_Cedric_Teach_12_01"); //Hai gi� imparato tutto sul combattimento con la spada. Non posso insegnarti nient'altro.
	}
	else
	{
		Info_ClearChoices 	(DIA_Cedric_Teach);
		Info_AddChoice 		(DIA_Cedric_Teach,	DIALOG_BACK		,DIA_Cedric_Teach_Back);
		Info_AddChoice		(DIA_Cedric_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Cedric_Teach_2H_1);
		Info_AddChoice		(DIA_Cedric_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Cedric_Teach_2H_5);
	};
};
FUNC VOID DIA_Cedric_Teach_Back ()
{
	Info_ClearChoices (DIA_Cedric_Teach);
};

FUNC VOID DIA_Cedric_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 90);
	
	Info_ClearChoices 	(DIA_Cedric_Teach);
	Info_AddChoice 		(DIA_Cedric_Teach,	DIALOG_BACK		,DIA_Cedric_Teach_Back);
	Info_AddChoice		(DIA_Cedric_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Cedric_Teach_2H_1);	
	Info_AddChoice		(DIA_Cedric_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Cedric_Teach_2H_5);	
};

FUNC VOID DIA_Cedric_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 90);
	
	Info_ClearChoices 	(DIA_Cedric_Teach);
	Info_AddChoice 		(DIA_Cedric_Teach,	DIALOG_BACK		,DIA_Cedric_Teach_Back);
	Info_AddChoice		(DIA_Cedric_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Cedric_Teach_2H_1);	
	Info_AddChoice		(DIA_Cedric_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Cedric_Teach_2H_5);	
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cedric_PICKPOCKET (C_INFO)
{
	npc			= PAL_216_Cedric;
	nr			= 900;
	condition	= DIA_Cedric_PICKPOCKET_Condition;
	information	= DIA_Cedric_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Cedric_PICKPOCKET_Condition()
{
	C_Beklauen (37, 55);
};
 
FUNC VOID DIA_Cedric_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cedric_PICKPOCKET);
	Info_AddChoice		(DIA_Cedric_PICKPOCKET, DIALOG_BACK 		,DIA_Cedric_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cedric_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cedric_PICKPOCKET_DoIt);
};

func void DIA_Cedric_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cedric_PICKPOCKET);
};
	
func void DIA_Cedric_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cedric_PICKPOCKET);
};


