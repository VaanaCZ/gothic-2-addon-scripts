// ************************************************************
// 	  				   EXIT 
// ************************************************************

INSTANCE DIA_Torlof_DI_KAP3_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof_DI;
	nr			= 999;
	condition	= DIA_Torlof_DI_KAP3_EXIT_Condition;
	information	= DIA_Torlof_DI_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Torlof_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Torlof_DI_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*********************************************************************
//	Info Hallo 
//*********************************************************************
INSTANCE DIA_Torlof_DI_Hallo   (C_INFO)
{
	npc         = SLD_801_Torlof_DI;
	nr          = 4;
	condition   = DIA_Torlof_DI_Hallo_Condition;
	information = DIA_Torlof_DI_Hallo_Info;
	permanent	 = 	TRUE;

	description = "¿Todo tranquilo?";

};

FUNC INT DIA_Torlof_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
			return TRUE;
		};
};

FUNC VOID DIA_Torlof_DI_Hallo_Info()
{
	AI_Output (other,self ,"DIA_Torlof_DI_Hallo_15_00"); //¿Todo tranquilo?

	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Torlof_DI_Hallo_01_01"); //Por ahora sí, pero podría cambiar en un instante. Ten cuidado.
	}
	else
	{
		AI_Output (self ,other,"DIA_Torlof_DI_Hallo_01_02"); //Si esos miserables orcos se quedan donde están, no veo ningún problema.
		B_StartOtherRoutine	(Torlof_DI,"Start");
	};
	AI_StopProcessInfos (self);
}; 

//*******************************************
//	TeachPlayer
//*******************************************

INSTANCE DIA_Torlof_DI_Teach (C_INFO)
{
	npc			= SLD_801_Torlof_DI;
	nr			= 150;
	condition	= DIA_Torlof_DI_Teach_Condition;
	information	= DIA_Torlof_DI_Teach_Info;
	permanent	= TRUE;
	description = "¡Quiero mejorar mis características!";
};                       

FUNC INT DIA_Torlof_DI_Teach_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
			return TRUE;
		};
};
 
FUNC VOID DIA_Torlof_DI_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_DI_Teach_15_00"); //¡Quiero mejorar mis características!
	
	Info_ClearChoices (DIA_Torlof_DI_Teach); 
	Info_AddChoice		(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1		, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5		, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1					, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5					, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Torlof_DI_Teach_STR_5);
};

FUNC VOID DIA_Torlof_DI_Teach_Back ()
{
	Info_ClearChoices (DIA_Torlof_DI_Teach);
};

FUNC VOID DIA_Torlof_DI_Teach_DEX_1 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);	
	Info_ClearChoices (DIA_Torlof_DI_Teach); 
	Info_AddChoice		(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1					, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5					, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Torlof_DI_Teach_STR_5);
};

FUNC VOID DIA_Torlof_DI_Teach_DEX_5 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	Info_ClearChoices (DIA_Torlof_DI_Teach); 
	Info_AddChoice		(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5		, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1					, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5					, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Torlof_DI_Teach_STR_5);
};


FUNC VOID DIA_Torlof_DI_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);	
	Info_ClearChoices (DIA_Torlof_DI_Teach); 
	Info_AddChoice		(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1		, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1					, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5					, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Torlof_DI_Teach_STR_5);
};

FUNC VOID DIA_Torlof_DI_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	Info_ClearChoices (DIA_Torlof_DI_Teach); 
	Info_AddChoice		(DIA_Torlof_DI_Teach, DIALOG_BACK, DIA_Torlof_DI_Teach_Back);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX1		, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR1					, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_DI_Teach, B_BuildLearnString(PRINT_LearnSTR5					, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Torlof_DI_Teach_STR_5);
};


///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	SLD_801_Torlof_DI;
	nr			 = 	4;
	condition	 = 	DIA_Torlof_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Torlof_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"He eliminado al enemigo.";

};

func int DIA_Torlof_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};
func void DIA_Torlof_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Torlof_DI_UndeadDragonDead_15_00"); //He eliminado al enemigo.
	AI_Output			(self ,other, "DIA_Torlof_DI_UndeadDragonDead_01_01"); //No esperaba otra cosa. ¿Qué te parece? ¿Podemos irnos ya?

	Info_ClearChoices	(DIA_Torlof_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Torlof_DI_UndeadDragonDead, "Necesitaré otro minuto o dos.", DIA_Torlof_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Torlof_DI_UndeadDragonDead, "Sí. Se terminó. Vamos.", DIA_Torlof_DI_UndeadDragonDead_over );
	
};
func void DIA_Torlof_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Torlof_DI_UndeadDragonDead_moment_15_00"); //Necesitaré otro par de minutos.
	AI_Output			(self, other, "DIA_Torlof_DI_UndeadDragonDead_moment_01_01"); //¡Rápido!
	AI_StopProcessInfos (self);
};

func void DIA_Torlof_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Torlof_DI_PICKPOCKET (C_INFO)
{
	npc			= SLD_801_Torlof_DI;
	nr			= 900;
	condition	= DIA_Torlof_DI_PICKPOCKET_Condition;
	information	= DIA_Torlof_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Torlof_DI_PICKPOCKET_Condition()
{
	C_Beklauen (76, 120);
};
 
FUNC VOID DIA_Torlof_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Torlof_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Torlof_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Torlof_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Torlof_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Torlof_DI_PICKPOCKET_DoIt);
};

func void DIA_Torlof_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Torlof_DI_PICKPOCKET);
};
	
func void DIA_Torlof_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Torlof_DI_PICKPOCKET);
};
