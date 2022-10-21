///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Wolf_DI_EXIT   (C_INFO)
{
	npc         = SLD_811_Wolf_DI;
	nr          = 999;
	condition   = DIA_Wolf_DI_EXIT_Condition;
	information = DIA_Wolf_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wolf_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wolf_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_DI_HALLO		(C_INFO)
{
	npc		 = 	SLD_811_Wolf_DI;
	nr		 = 	4;
	condition	 = 	DIA_Wolf_DI_HALLO_Condition;
	information	 = 	DIA_Wolf_DI_HALLO_Info;
	permanent	 = 	TRUE;

	description	 = 	"Come va?";
};

func int DIA_Wolf_DI_HALLO_Condition ()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};
var int DIA_Wolf_DI_HALLO_OneTime;
func void DIA_Wolf_DI_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_00"); //Come va?

	if ( Bennet_IsOnBoard == LOG_SUCCESS)
	&& (Npc_IsDead(Bennet_DI)	==	FALSE)
		{
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_01"); //Dovevi PROPRIO prendere Bennet a bordo, amico?
			AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_02"); //Qual è il problema?
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_03"); //Ah, niente. È tutto a posto. Fai il tuo lavoro a poi andiamocene da qui, d'accordo?
		}
	else
		{
			if (DIA_Wolf_DI_HALLO_OneTime == FALSE)
				{
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_04"); //La fucina non è delle migliori, ma ci proverò.
					B_GivePlayerXP (XP_Ambient);
					DIA_Wolf_DI_HALLO_OneTime = TRUE;
					AI_StopProcessInfos (self);
					Npc_ExchangeRoutine	(self,"SmithDI");
				}
			else
				{
					AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_05"); //Puoi fabbricarmi delle armature?
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_06"); //Mi dispiace, amico. Non con questi attrezzi. Dovrai aspettare fino a quando non saremo sulla terraferma.
				};
		};
};

// ************************************************************
// 	  	  Training
// ************************************************************

INSTANCE DIA_Wolf_DI_Training (C_INFO)
{
	npc			= SLD_811_Wolf_DI;
	nr			= 10;
	condition	= DIA_Wolf_DI_Training_Condition;
	information	= DIA_Wolf_DI_Training_Info;
	permanent	 = 	TRUE;

	description = "Addestrami per i combattimenti a lunga distanza.";
};                       
FUNC INT DIA_Wolf_DI_Training_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Wolf_DI_Training_Info()
{	
	AI_Output (other,self ,"DIA_Wolf_DI_Training_15_00"); //Addestrami per i combattimenti a lunga distanza.
	AI_Output (self ,other,"DIA_Wolf_DI_Training_08_01"); //Di che tipo?
	
	Info_ClearChoices 	(DIA_Wolf_DI_Training);
	Info_AddChoice	  	(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))		,DIA_Wolf_DI_Training_CROSSBOW_5);
	
};

//***************************************************************************
// BOGEN
//***************************************************************************
// ------ 1% Waffentalent ------
func void DIA_Wolf_DI_Training_BOW_1()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 90))
	{
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_1_08_00"); //Contrariamente alla balestra, l'arco è molto voluminoso e richiede un sacco di spazio. Assicurati sempre di averne abbastanza in battaglia.
	};
	Info_ClearChoices 	(DIA_Wolf_DI_Training);
	Info_AddChoice	  	(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))		,DIA_Wolf_DI_Training_CROSSBOW_5);
	

};

// ------ 5% Waffentalent ------
func void DIA_Wolf_DI_Training_BOW_5()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 90))
	{
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_5_08_00"); //Fai scivolare la corda tra le dita quando spari. Un dito impigliato scombussolerà la traiettoria della freccia.
	};
	Info_ClearChoices 	(DIA_Wolf_DI_Training);
	Info_AddChoice	  	(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))		,DIA_Wolf_DI_Training_CROSSBOW_5);
	

};

//***************************************************************************
// Armbrust
//***************************************************************************
// ------ 1% Waffentalent ------

func void DIA_Wolf_DI_Training_CROSSBOW_1()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 100))
	{
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00"); //Cerca di non muoverti quando spari con la balestra. È per questo che dovresti sempre premere il grilletto con cautela.
	};
	Info_ClearChoices 	(DIA_Wolf_DI_Training);
	Info_AddChoice	  	(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))		,DIA_Wolf_DI_Training_CROSSBOW_5);
	
};

// ------ 5% Waffentalent ------
func void DIA_Wolf_DI_Training_CROSSBOW_5()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 100))
	{
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00"); //Un tiratore attento fa sempre buon uso del vento e cerca di non sparare mai contro di esso.
	};
	Info_ClearChoices 	(DIA_Wolf_DI_Training);
	Info_AddChoice	  	(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))			,DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice		(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5	, 		B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))		,DIA_Wolf_DI_Training_CROSSBOW_5);
	
};
// ------ Back ------
func void DIA_Wolf_DI_Training_BACK ()
{
	Info_ClearChoices (DIA_Wolf_DI_Training);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	SLD_811_Wolf_DI;
	nr			 = 	2;
	condition	 = 	DIA_Wolf_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Wolf_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"Va tutto bene?";
};

func int DIA_Wolf_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Wolf_DI_UndeadDragonDead_OneTime;
func void DIA_Wolf_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_00"); //Va tutto bene?
	AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_01"); //Certo, e tu? È stata dura, eh?

	if (DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_02"); //Dove andrai ora?
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_03"); //Dovunque tranne tornare indietro. Ne ho veramente avuto abbastanza di Khorinis.
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_04"); //Per me è lo stesso dove navigheremo. Fintanto che sarà lontano da qui.
			DIA_Wolf_DI_UndeadDragonDead_OneTime = TRUE;
		};
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wolf_DI_PICKPOCKET (C_INFO)
{
	npc			= SLD_811_Wolf_DI;
	nr			= 900;
	condition	= DIA_Wolf_DI_PICKPOCKET_Condition;
	information	= DIA_Wolf_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Wolf_DI_PICKPOCKET_Condition()
{
	C_Beklauen (32, 45);
};
 
FUNC VOID DIA_Wolf_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wolf_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Wolf_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Wolf_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wolf_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wolf_DI_PICKPOCKET_DoIt);
};

func void DIA_Wolf_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wolf_DI_PICKPOCKET);
};
	
func void DIA_Wolf_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wolf_DI_PICKPOCKET);
};


