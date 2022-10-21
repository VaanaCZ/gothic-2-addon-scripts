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

	description	 = 	"Wie steht's?";
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
	AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_00"); //Wie steht's?

	if ( Bennet_IsOnBoard == LOG_SUCCESS)
	&& (Npc_IsDead(Bennet_DI)	==	FALSE)
		{
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_01"); //Musstest du unbedingt Bennet mitnehmen, Mann?
			AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_02"); //Wo ist das Problem?
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_03"); //Ach, gar nichts. Ist schon gut. Erledige deine Aufgaben und dann schnell weg hier, ok?
		}
	else
		{
			if (DIA_Wolf_DI_HALLO_OneTime == FALSE)
				{
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_04"); //Die Schmiede ist zwar nicht die beste, aber ich denke, ich probier sie mal aus.
					B_GivePlayerXP (XP_Ambient);
					DIA_Wolf_DI_HALLO_OneTime = TRUE;
					AI_StopProcessInfos (self);
					Npc_ExchangeRoutine	(self,"SmithDI");
				}
			else
				{
					AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_05"); //Kannst du mir eine Rüstung bauen?
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_06"); //Ne, Mann. Nicht mit diesen Mitteln. Damit müssen wir schon noch warten, bis wir auf dem Festland sind.
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

	description = "Trainiere mich im Fernkampf.";
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
	AI_Output (other,self ,"DIA_Wolf_DI_Training_15_00"); //Trainiere mich im Fernkampf.
	AI_Output (self ,other,"DIA_Wolf_DI_Training_08_01"); //In welcher Kategorie?
	
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_1_08_00"); //Im Gegensatz zur Armbrust ist der Bogen sehr sperrig und braucht viel Platz. Sorge immer dafür, dass du im Kampf auch genug davon hast.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_5_08_00"); //Lass die Sehne durch deine Finger gleiten, wenn du schießt. Ein verkrampfter Finger verfälscht die Flugbahn des Pfeils.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00"); //Versuche, beim Schuss die Armbrust nicht zu verwackeln. Deswegen betätige den Abzug immer sehr vorsichtig.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00"); //Ein cleverer Schütze bedient sich der Tragkraft des Windes und versucht, nicht gegen ihn zu schießen.
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
	
	description = 	"Alles gut überstanden?";
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
	AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_00"); //Alles gut überstanden?
	AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_01"); //Sicher. Und du? War ein dicker Brocken, was?

	if (DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_02"); //Wo willst du jetzt hingehen?
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_03"); //Bloß nicht wieder zurück. Von Khorinis habe ich endgültig die Schnauze voll.
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_04"); //Ist mir völlig egal, wohin wir segeln. Hauptsache weg hier.
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


