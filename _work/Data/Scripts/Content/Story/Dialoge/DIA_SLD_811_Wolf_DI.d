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

	description	 = 	"Comment ça va ?";
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
	AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_00"); //Comment ça se passe ?

	if ( Bennet_IsOnBoard == LOG_SUCCESS)
	&& (Npc_IsDead(Bennet_DI)	==	FALSE)
		{
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_01"); //Il vous fallait vraiment prendre Bennet avec vous ?
			AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_02"); //Quel est le problème ?
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_03"); //Rien, tout va bien. Faites ce que vous avez à faire et tirez-vous d'ici, compris ?
		}
	else
		{
			if (DIA_Wolf_DI_HALLO_OneTime == FALSE)
				{
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_04"); //Cette forge n'est pas terrible, mais je veux bien essayer.
					B_GivePlayerXP (XP_Ambient);
					DIA_Wolf_DI_HALLO_OneTime = TRUE;
					AI_StopProcessInfos (self);
					Npc_ExchangeRoutine	(self,"SmithDI");
				}
			else
				{
					AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_05"); //Pouvez-vous me fabriquer une armure ?
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_06"); //Je regrette, mon vieux, mais pas avec ces outils-là. Il vous faudra attendre qu'on ait rallié le continent.
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

	description = "Formez-moi au combat à longue distance.";
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
	AI_Output (other,self ,"DIA_Wolf_DI_Training_15_00"); //Entraînez-moi au combat à distance.
	AI_Output (self ,other,"DIA_Wolf_DI_Training_08_01"); //Quel genre de combat à distance ?
	
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_1_08_00"); //Contrairement à l'arbalète, l'arc est une arme exigeant beaucoup d'espace. Il vous faudra toujours prendre ce facteur en considération au combat.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_5_08_00"); //Laissez bien filez la corde lorsque vous la lâchez. Un doigt qui traîne et votre flèche partira n'importe où.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00"); //Ne faites surtout pas de gestes brusques en tirant à l'arbalète. C'est pour ça qu'il faut toujours actionner le mécanisme lentement et de manière régulière.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00"); //Un bon tireur se sert du vent et évite autant que possible de tirer face au vent.
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
	
	description = 	"Tout va bien ?";
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
	AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_00"); //Tout va bien ?
	AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_01"); //Oui, et pour vous ? C'était pas de la tarte, hein ?

	if (DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_02"); //Où comptez-vous aller, maintenant ?
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_03"); //N'importe où du moment que je ne retourne pas sur mes pas. J'en ai plus qu'assez de Khorinis.
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_04"); //Pour moi, toutes les destinations se valent, du moment qu'on part loin d'ici.
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


