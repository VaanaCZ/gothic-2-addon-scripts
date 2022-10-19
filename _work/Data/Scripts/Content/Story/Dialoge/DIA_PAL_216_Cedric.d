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
	AI_Output (self, other, "DIA_Cedric_Hallo_12_00"); //Jsem Cedric, mistr me�e, kr�lovsk� paladin.
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
	description	 = 	"Mohl bys m� cvi�it?";
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
	AI_Output (other, self, "DIA_Cedric_CanTeach_15_00"); //M��e� m� u�it?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Cedric_CanTeach_12_01"); //M��u t� tr�novat v boji s jednoru�n�mi zbran�mi.
		Cedric_Teach1H = TRUE;
		B_LogEntry (TOPIC_CityTeacher,"Paladin Cedric m� nau�� zach�zet s jednoru�n�mi zbran�mi.");
	}
	else
	{
		AI_Output (self, other, "DIA_Cedric_CanTeach_12_02"); //U��m pouze paladiny.
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
	description = "Chci, abys m� u�il.";
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
	AI_Output (other,self ,"DIA_Cedric_Teach_15_00"); //Chci, abys m� u�il.
	
	if (other.HitChance[NPC_TALENT_1H] >= 90)
	{
		AI_Output (self,other,"DIA_DIA_Cedric_Teach_12_01"); //O boji s me�em u� v� �pln� v�echno. U� t� nem�m co nau�it.
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


