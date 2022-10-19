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

	description	 = 	"Jak se vede?";
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
	AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_00"); //Jak se vede?

	if ( Bennet_IsOnBoard == LOG_SUCCESS)
	&& (Npc_IsDead(Bennet_DI)	==	FALSE)
		{
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_01"); //Tos s sebou Benneta MUSEL brát, chlape?
			AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_02"); //V èem je problém?
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_03"); //Ále, vlastnê nic. Jen si udêlej, co musíš, a pak odsud zmizni, jo?
		}
	else
		{
			if (DIA_Wolf_DI_HALLO_OneTime == FALSE)
				{
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_04"); //Tahle kovárna není zrovna nejlepší, ale myslím, že ji trochu vyzkouším.
					B_GivePlayerXP (XP_Ambient);
					DIA_Wolf_DI_HALLO_OneTime = TRUE;
					AI_StopProcessInfos (self);
					Npc_ExchangeRoutine	(self,"SmithDI");
				}
			else
				{
					AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_05"); //Mohl bys mi ukout nêjakou zbroj?
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_06"); //Je mi líto, chlape, ale s tímhle náâadím nic nepoâídím. To bude muset poèkat, až dorazíme na pevninu.
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

	description = "Vycviè mê prosím v boji na dálku.";
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
	AI_Output (other,self ,"DIA_Wolf_DI_Training_15_00"); //Vycviè mê prosím v boji na dálku.
	AI_Output (self ,other,"DIA_Wolf_DI_Training_08_01"); //V jakém konkrétnê?
	
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_1_08_00"); //Luk je narozdíl od kuše dost neskladný, a proto vyžaduje spoustu místa. Vždycky si proto dávej pozor, abys mêl pâi boji okolo sebe dostatek volného prostoru.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_5_08_00"); //Pâi výstâelu ti musí têtiva v prstech klouzat - když ji budeš držet kâeèovitê, mùžeš tím šíp úplnê vychýlit z dráhy.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00"); //Pâi stâelbê z kuše musíš stát absolutnê v klidu. Kohoutek je proto tâeba maèkat velmi pomalu a opatrnê.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00"); //Chytrý kušiník si také všímá, odkud zrovna vane vítr, a nesnaží se stâílet pâímo proti nêmu.
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
	
	description = 	"Je všechno v poâádku?";
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
	AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_00"); //Je všechno v poâádku?
	AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_01"); //Jasnê. A co ty? Bylo to drsné, co?

	if (DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_02"); //Kam teë pùjdeš?
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_03"); //Kamkoliv, jen ne zpátky. Khorinidu už mám plné zuby.
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_04"); //Mnê je taky jedno, kam poplujeme, jenom když odsud koneènê vypadneme.
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


