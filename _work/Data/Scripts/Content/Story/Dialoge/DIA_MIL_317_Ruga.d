///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ruga_EXIT   (C_INFO)
{
	npc         = Mil_317_Ruga;
	nr          = 999;
	condition   = DIA_Ruga_EXIT_Condition;
	information = DIA_Ruga_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ruga_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ruga_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ruga_PICKPOCKET (C_INFO)
{
	npc			= Mil_317_Ruga;
	nr			= 900;
	condition	= DIA_Ruga_PICKPOCKET_Condition;
	information	= DIA_Ruga_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Tento klíč půjde ukrást snadno.)";
};                       

FUNC INT DIA_Ruga_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_03) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Ruga_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ruga_PICKPOCKET);
	Info_AddChoice		(DIA_Ruga_PICKPOCKET, DIALOG_BACK 		,DIA_Ruga_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ruga_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ruga_PICKPOCKET_DoIt);
};

func void DIA_Ruga_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_03, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Ruga_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Ruga_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ruga_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_Hallo		(C_INFO)
{
	npc		 	 = 	Mil_317_Ruga;
	nr			 =  2;
	condition	 = 	DIA_Ruga_Hallo_Condition;
	information	 = 	DIA_Ruga_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Ruga_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Ruga_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Ruga_Hallo_15_00"); //Co tady děláš?
	AI_Output (self, other, "DIA_Ruga_Hallo_11_01"); //Cvičím chlapy v zacházení s kuší a pomáhám jim být trochu obratnější.
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Ruga, příslušník městské gardy, mi vylepší obratnost a naučí mě používat kuši. Musím ale nejdříve vstoupit do královských služeb.");
};
///////////////////////////////////////////////////////////////////////
//	Info Train
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_Train		(C_INFO)
{
	npc			 = 	Mil_317_Ruga;
	nr			 = 	5;
	condition	 = 	DIA_Ruga_Train_Condition;
	information	 = 	DIA_Ruga_Train_Info;
	permanent	 = 	TRUE;
	description	 = 	"Mohl bys mě cvičit?";
};

func int DIA_Ruga_Train_Condition ()
{
	if (Ruga_TeachCrossbow == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Ruga_Train_Info ()
{
	AI_Output (other, self, "DIA_Ruga_Train_15_00"); //Mohl bys mě cvičit?
	
	if (hero.guild == GIL_MIL)
	|| (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ruga_Train_11_01"); //Jasná páka. Jestli jsi dostatečně zkušený, pomohu ti.
		AI_Output (self, other, "DIA_Ruga_Train_11_02"); //A pamatuj, obratnost a boj na dálku k sobě patří jako šipka a kuše. Jedno...
		AI_Output (other, self, "DIA_Ruga_Train_15_03"); //nemá význam bez druhého. Chápu.
	
		Ruga_TeachCrossbow = TRUE;
		Ruga_TeachDEX 	   = TRUE;
	}
	else if ((hero.guild == GIL_SLD)
	|| 		 (hero.guild == GIL_DJG))
	{
		AI_Output (self, other, "DIA_Ruga_Train_11_04"); //Táhni mi z očí, (opovržlivě) žoldáku.
		AI_StopProcessInfos (self);
	}
	else 
	{	 
		AI_Output (self, other, "DIA_Ruga_Train_11_05"); //Ne, mohu cvičit jen muže v královských službách. Nikoho jiného.
		AI_Output (self, other, "DIA_Ruga_Train_11_06"); //Ale vždycky se nám hodí dobří chlapi. Takže pokud by ses chtěl přidat k domobraně, běž si promluvit s lordem Andrem.
	};     
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Ruga_Teach(C_INFO)
{
	npc			= Mil_317_Ruga;
	nr			= 100;
	condition	= DIA_Ruga_Teach_Condition;
	information	= DIA_Ruga_Teach_Info;
	permanent	= TRUE;
	description = "Ukaž mi, jak používat kuši.";
};                       
//-------------------------------------
var int DIA_Ruga_Teach_permanent;
//------------------------------------- 
FUNC INT DIA_Ruga_Teach_Condition()
{
	if (Ruga_TeachCrossbow == TRUE)
	&& (DIA_Ruga_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Ruga_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Ruga_Teach_15_00"); //Ukaž mi, jak používat kuši.

	Info_ClearChoices 	(DIA_Ruga_Teach);
	Info_AddChoice 		(DIA_Ruga_Teach,	DIALOG_BACK		,DIA_Ruga_Teach_Back);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))			,DIA_Ruga_Teach_1H_1);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))		,DIA_Ruga_Teach_1H_5);
};

FUNC VOID DIA_Ruga_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 90)
	{
		AI_Output(self,other,"DIA_Ruga_Teach_11_00"); //Už není nic, co bych tě mohl naučit. Je načase, aby sis našel nového učitele.
		DIA_Ruga_Teach_permanent = TRUE;
		
	};
	Info_ClearChoices (DIA_Ruga_Teach);
};

FUNC VOID DIA_Ruga_Teach_1H_1 ()
{
	 B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 90);
	
	Info_ClearChoices 	(DIA_Ruga_Teach);
	Info_AddChoice 		(DIA_Ruga_Teach,	DIALOG_BACK		,DIA_Ruga_Teach_Back);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,DIA_Ruga_Teach_1H_1);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Ruga_Teach_1H_5);
	
};
FUNC VOID DIA_Ruga_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 90);
	
	Info_ClearChoices 	(DIA_Ruga_Teach);
	Info_AddChoice 		(DIA_Ruga_Teach,	DIALOG_BACK		,DIA_Ruga_Teach_Back);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))				,DIA_Ruga_Teach_1H_1);
	Info_AddChoice		(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Ruga_Teach_1H_5);
	
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_TEACHDEX		(C_INFO)
{
	npc		  	 = 	Mil_317_Ruga;
	nr			 = 	101;
	condition	 = 	DIA_Ruga_TEACHDEX_Condition;
	information	 = 	DIA_Ruga_TEACHDEX_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtěl bych být o něco obratnější.";
};
//------------------------------------
var int DIA_Ruga_TEACHDEX_permanent;
//------------------------------------
func int DIA_Ruga_TEACHDEX_Condition ()
{	
	if (Ruga_TeachDEX == TRUE)
	&& (DIA_Ruga_TEACHDEX_permanent == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Ruga_TEACHDEX_Info ()
{
	AI_Output (other, self, "DIA_Ruga_TEACHDEX_15_00"); //Chtěl bych být o něco obratnější.
	
	Info_ClearChoices   (DIA_Ruga_TEACHDEX);
	Info_AddChoice 		(DIA_Ruga_TEACHDEX, DIALOG_BACK, DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Ruga_TEACHDEX_1);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Ruga_TEACHDEX_5);
	
};
func void DIA_Ruga_TEACHDEX_BACK()
{
	if (other.attribute[ATR_DEXTERITY] >= T_LOW)
	{
		AI_Output (self, other, "DIA_Ruga_TEACHDEX_11_00"); //To je vše, co tě můžu naučit. Jestli chceš být ještě obratnější, najdi si jiného učitele.
		DIA_Ruga_TEACHDEX_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Ruga_TEACHDEX);
};
func void DIA_Ruga_TEACHDEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Ruga_TEACHDEX);
	
	Info_AddChoice 		(DIA_Ruga_TEACHDEX, DIALOG_BACK, DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Ruga_TEACHDEX_1);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Ruga_TEACHDEX_5);
	
	
};
func void DIA_Ruga_TEACHDEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Ruga_TEACHDEX);
	
	Info_AddChoice 		(DIA_Ruga_TEACHDEX, DIALOG_BACK, DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Ruga_TEACHDEX_1);
	Info_AddChoice		(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Ruga_TEACHDEX_5);
	
	
};
 








