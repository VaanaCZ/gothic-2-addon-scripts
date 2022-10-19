///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_DI_XIT   (C_INFO)
{
	npc         = PAL_207_Girion_DI;
	nr          = 999;
	condition   = DIA_Girion_DI_EXIT_Condition;
	information = DIA_Girion_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Girion_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Girion_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_Hallo		(C_INFO)
{
	npc			 = 	PAL_207_Girion_DI;
	nr			 = 	2;
	condition	 = 	DIA_Girion_DI_Hallo_Condition;
	information	 = 	DIA_Girion_DI_Hallo_Info;
	PERMANENT 	 =  TRUE;

	description	 = 	"Everything all right?";
};
func int DIA_Girion_DI_Hallo_Condition ()
{	
	if (Npc_IsDead(UndeadDragon)== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Girion_DI_Hallo_Info ()
{
	AI_Output			(other, self, "DIA_Girion_DI_Hallo_15_00"); //Everything all right?

	if (ORkSturmDI == TRUE)
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_01"); //The orcs are truly brave to set themselves against me.
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_02"); //They really should know better than to challenge a paladin of the royal guard.
		}
	else if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_03"); //I think so. Will you need long for your mission here on this cliff?
		}
	else
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_04"); //Don't treat me like an idiot. Do what must be done and then surrender the ship to me.
		};
};

//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Girion_DI_Teach(C_INFO)
{
	npc			= PAL_207_Girion_DI;
	nr			= 5;
	condition	= DIA_Girion_DI_Teach_Condition;
	information	= DIA_Girion_DI_Teach_Info;
	permanent	= TRUE;
	description = "Train me, and we'll all be able to leave here faster!";
};                       

FUNC INT DIA_Girion_DI_Teach_Condition()
{
	if (Npc_IsDead(UndeadDragon)== FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Girion_DI_Teach_Info()
{	
	AI_Output (other,self 	,"DIA_Girion_DI_Teach_15_00"); //Train me, the faster we will be able to leave here.
	AI_Output (self ,other 	,"DIA_Girion_DI_Teach_08_01"); //I seem to have no other choice.
	
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};
//***************************************************************************
// ARMBRUST
//***************************************************************************
// ------ 1% Waffentalent ------
func void DIA_Girion_DI_Teach_CROSSBOW_1()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 90)
	{
			AI_Output (self ,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00"); //Never prop up your elbows. That makes your aim much too stiff and you will inevitably twist your weapon.
	};
	
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

// ------ 5% Waffentalent ------
func void DIA_Girion_DI_Teach_CROSSBOW_5()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 90)
	{
			AI_Output (self ,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00"); //Always loosen your left arm before a shot. That way you are more flexible when aiming.
	};
	
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};
FUNC VOID DIA_Girion_DI_Teach_1H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 90))
	{
			AI_Output (self ,other,"DIA_Girion_DI_Teach_1H_1_08_00"); //Your blade must slice through the air like a reed in the wind.
	};
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Girion_DI_Teach_1H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 90))
	{
			AI_Output (self ,other,"DIA_Girion_DI_Teach_1H_5_08_00"); //Always use your strength with calculation. Running blindly at your opponent has never yet led to success.
	};
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Girion_DI_Teach_2H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00"); //Don't hold the shaft so tightly, then your blow will hit its mark.
	};
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Girion_DI_Teach_2H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00"); //Don't forget to parry. But the best defense is always to dodge your opponent's blow.
	};
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Girion_DI_Teach_Back ()
{
	Info_ClearChoices (DIA_Girion_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info OrcEliteRing
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_OrcEliteRing		(C_INFO)
{
	npc			 = 	PAL_207_Girion_DI;
	nr          = 	99;	
	condition	 = 	DIA_Girion_DI_OrcEliteRing_Condition;
	information	 = 	DIA_Girion_DI_OrcEliteRing_Info;
	permanent	 = 	TRUE;

	description	 = 	"I have a ring from the orcish warlords.";
};

func int DIA_Girion_DI_OrcEliteRing_Condition ()
{	
	if  (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
				return TRUE;
		};
};

var int DIA_Girion_DI_OrcEliteRing_OneTime;
func void DIA_Girion_DI_OrcEliteRing_Info ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_15_00"); //I have a ring from the orcish warlords.

	if (DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_08_01"); //I suspect that Lord Hagen will be able to do something with that.
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE;
	};

	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_08_02"); //Give it to me. I shall deliver it to Lord Hagen.

	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice	(DIA_Girion_DI_OrcEliteRing, "I'd rather keep it to myself.", DIA_Girion_DI_OrcEliteRing_behalten );
	Info_AddChoice	(DIA_Girion_DI_OrcEliteRing, "Here, take it.", DIA_Girion_DI_OrcEliteRing_geben );
};
func void DIA_Girion_DI_OrcEliteRing_geben ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_geben_15_00"); //Here, take it.
	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_geben_08_01"); //Thanks. I don't think you have much use for it anyway.
	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
	B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Girion_DI_OrcEliteRing_behalten ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_behalten_15_00"); //I'd rather keep it to myself.
	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_behalten_08_01"); //Suit yourself. You can't do anything with it anyway.
	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	PAL_207_Girion_DI;
	nr			 = 	2;
	condition	 = 	DIA_Girion_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Girion_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"We can cast off now.";
};

func int DIA_Girion_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Girion_DI_UndeadDragonDead_OneTime;
func void DIA_Girion_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_00"); //We can cast off now.
	AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_01"); //It's about time. I thought for sure I would rot here on this cliff.

	if (DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_02"); //Now surrender the ship to me immediately.
			AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_03"); //We're not in Khorinis yet. And, to be honest, I'm not terribly keen on going back to Khorinis.
			AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_04"); //I've been there long enough.
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_05"); //I thought as much. But this is neither the time nor the place to straighten this out. We shall discuss this again at sea.
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_06"); //So what. I'm glad to have you back on board in one piece, nevertheless.
			
			if (hero.guild == GIL_PAL)
			{
				AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_07"); //You are a true warrior of Innos. I have no more doubt of that. I am glad to have you on our side.
			}
			else
			{
				AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_08"); //Even if you are a rascal, in the end you acted with righteousness.
			};
			
			DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
		};

	AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_09"); //All right. Now go to the captain and let him navigate us out of here.
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Girion_DI_PICKPOCKET (C_INFO)
{
	npc			= PAL_207_Girion_DI;
	nr			= 900;
	condition	= DIA_Girion_DI_PICKPOCKET_Condition;
	information	= DIA_Girion_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Girion_DI_PICKPOCKET_Condition()
{
	C_Beklauen (71, 260);
};
 
FUNC VOID DIA_Girion_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Girion_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Girion_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Girion_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Girion_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Girion_DI_PICKPOCKET_DoIt);
};

func void DIA_Girion_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Girion_DI_PICKPOCKET);
};
	
func void DIA_Girion_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Girion_DI_PICKPOCKET);
};


