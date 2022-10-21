
// ************************************************************
// 	  				   EXIT 
// ************************************************************

INSTANCE DIA_Gorn_DI_KAP5_EXIT(C_INFO)
{
	npc			= PC_Fighter_DI;
	nr			= 999;
	condition	= DIA_Gorn_DI_KAP5_EXIT_Condition;
	information	= DIA_Gorn_DI_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gorn_DI_KAP5_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gorn_DI_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  	  Hallo
// ************************************************************

INSTANCE DIA_Gorn_DI_Hallo (C_INFO)
{
	npc			= PC_Fighter_DI;
	nr			= 2;
	condition	= DIA_Gorn_DI_Hallo_Condition;
	information	= DIA_Gorn_DI_Hallo_Info;
	permanent	 = 	TRUE;

	description = "Tout est en ordre ?";
};                       

FUNC INT DIA_Gorn_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon)== FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Gorn_DI_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_Gorn_DI_Hallo_15_00"); //Tout est en ordre ?

	if (ORkSturmDI == FALSE)
		{
			AI_Output (self ,other,"DIA_Gorn_DI_Hallo_12_01"); //Jusqu’à maintenant, oui. N’oubliez pas, je veux me battre.
		}
	else
		{
			AI_Output (self ,other,"DIA_Gorn_DI_Hallo_12_02"); //Il y a d’autres orques dans le coin ? Envoyez les moi, je commence juste à être chaud...
		};
};

 
//**************************************
//			Ich will trainieren
//**************************************

INSTANCE DIA_Gorn_DI_Teach(C_INFO)
{
	npc			= PC_Fighter_DI;
	nr			= 10;
	condition	= DIA_Gorn_DI_Teach_Condition;
	information	= DIA_Gorn_DI_Teach_Info;
	permanent	= TRUE;
	
	description = "J'ai besoin de m'entraîner.";
};                       

FUNC INT DIA_Gorn_DI_Teach_Condition()
{
	if (Npc_IsDead(UndeadDragon)== FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gorn_DI_Teach_Info()
{	
	AI_Output (other, self , 	"DIA_Gorn_DI_Teach_15_00"); //J’ai besoin d’entraînement.
	AI_Output (self, other, 	"DIA_Gorn_DI_Teach_12_01"); //Ça ne peut pas vous faire de mal...
	
	Info_ClearChoices 	(DIA_Gorn_DI_Teach);
	Info_AddChoice 		(DIA_Gorn_DI_Teach,	DIALOG_BACK		,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Gorn_DI_Teach_2H_1);
};

FUNC VOID DIA_Gorn_DI_Teach_2H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00"); //Eh bien, je vous ai connu meilleur que ça...
	};
	Info_ClearChoices 	(DIA_Gorn_DI_Teach);
	Info_AddChoice 		(DIA_Gorn_DI_Teach,	DIALOG_BACK		,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Gorn_DI_Teach_2H_1);
};

FUNC VOID DIA_Gorn_DI_Teach_2H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00"); //Tenez votre arme plus haut. Votre garde ne gênerait pas un aveugle qui voudrait vous donner un coup de canne.
	};
	Info_ClearChoices 	(DIA_Gorn_DI_Teach);
	Info_AddChoice 		(DIA_Gorn_DI_Teach,	DIALOG_BACK		,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Gorn_DI_Teach_2H_1);
};

FUNC VOID DIA_Gorn_DI_Teach_Back ()
{
	Info_ClearChoices (DIA_Gorn_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Gorn_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	PC_Fighter_DI;
	nr			 = 	2;
	condition	 = 	DIA_Gorn_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Gorn_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"Vous êtes resté sur le navire ?";
};

func int DIA_Gorn_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Gorn_DI_UndeadDragonDead_OneTime;
func void DIA_Gorn_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Gorn_DI_UndeadDragonDead_15_00"); //Vous êtes resté à bord du bateau ?
	AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_01"); //Oui. Qu’est-ce qu’on ferait s’il n’était plus là ?

	if (DIA_Gorn_DI_UndeadDragonDead_OneTime == FALSE)
		{
			if (hero.guild == GIL_DJG)
			{
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_02"); //Et maintenant ?
				AI_Output			(other ,self, "DIA_Gorn_DI_UndeadDragonDead_15_03"); //On ne fait plus rien. Je veux juste rentrer chez moi.
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_04"); //(éclate de rire) Chez vous ? Où est-ce ? Que je sache, vous n’avez pas de foyer, si ?
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_05"); //Ce que je vous propose, c’est d’entrer dans la prochaine taverne et de boire jusqu’à en perdre connaissance.
				AI_Output			(other ,self, "DIA_Gorn_DI_UndeadDragonDead_15_06"); //Hmm... voilà un programme alléchant...
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_07"); //Hé ! Reprenez-vous, d’accord ? C’est terminé.
			};
			DIA_Gorn_DI_UndeadDragonDead_OneTime = TRUE;
		};
	
	if (Npc_KnowsInfo(other, DIA_Biff_DI_plunder))
			{
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_08"); //Il faut que quelqu’un prévienne Biff, sans quoi il va pourrir sur cette île.

				if (Npc_IsDead(Biff_DI)== FALSE)
					{
						AI_Output			(other ,self, "DIA_Gorn_DI_UndeadDragonDead_15_09"); //Il finira bien par venir ici.
					};
			};			
	
	AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_10"); //Il n’y a plus rien pour nous ici. Dites au capitaine de faire évacuer le navire.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_DI_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_DI;
	nr			= 900;
	condition	= DIA_Fighter_DI_PICKPOCKET_Condition;
	information	= DIA_Fighter_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_DI_PICKPOCKET_Condition()
{
	C_Beklauen (10, 45);
};
 
FUNC VOID DIA_Fighter_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_DI_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_DI_PICKPOCKET);
};
	
func void DIA_Fighter_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_DI_PICKPOCKET);
};


