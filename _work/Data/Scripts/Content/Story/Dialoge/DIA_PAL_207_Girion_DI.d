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

	description	 = 	"Tout va bien ?";
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
	AI_Output			(other, self, "DIA_Girion_DI_Hallo_15_00"); //Tout va bien ?

	if (ORkSturmDI == TRUE)
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_01"); //Faut-il que les orques soient courageux pour oser m'affronter...
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_02"); //Vous n'auriez jamais dû commettre l'erreur de défier un paladin de la garde royale...
		}
	else if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_03"); //Je crois, oui. Aurez-vous besoin de longtemps pour mener votre mission sur la falaise ?
		}
	else
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_04"); //Ne me traitez pas comme un imbécile ! Faites ce qui doit être fait et remettez-moi le navire !
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
	description = "Entraînez-moi et nous pourrons tous partir d'ici plus vite !";
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
	AI_Output (other,self 	,"DIA_Girion_DI_Teach_15_00"); //Entraînez-moi et nous partirons plus vite d'ici.
	AI_Output (self ,other 	,"DIA_Girion_DI_Teach_08_01"); //On dirait que je n'ai guère le choix...
	
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
			AI_Output (self ,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00"); //Ne levez jamais trop les coudes, cela nuit à votre précision.
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
			AI_Output (self ,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00"); //Faites des mouvements d'assouplissement avec votre bras gauche avant de tirer. De cette manière, vous viserez bien mieux.
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
			AI_Output (self ,other,"DIA_Girion_DI_Teach_1H_1_08_00"); //Votre lame doit fendre l'air tel un roseau par grand vent.
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
			AI_Output (self ,other,"DIA_Girion_DI_Teach_1H_5_08_00"); //Servez-vous toujours de votre force de manière réfléchie. Courir aveuglément vers l'adversaire n'a jamais été un gage de succès.
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
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00"); //Ne serrez pas votre arme trop fort si vous voulez toucher votre cible.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00"); //N'oubliez pas de parer. Mais la meilleure défense reste toujours l'esquive.
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

	description	 = 	"J'ai l'anneau d'un chef de guerre orque.";
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
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_15_00"); //J'ai un anneau de chef de guerre orque.

	if (DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_08_01"); //Je pense que le seigneur Hagen en aura l'utilité.
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE;
	};

	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_08_02"); //Donnez-le moi, je le remettrai au seigneur Hagen.

	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice	(DIA_Girion_DI_OrcEliteRing, "Je préfère le garder.", DIA_Girion_DI_OrcEliteRing_behalten );
	Info_AddChoice	(DIA_Girion_DI_OrcEliteRing, "Tenez, prenez-le.", DIA_Girion_DI_OrcEliteRing_geben );
};
func void DIA_Girion_DI_OrcEliteRing_geben ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_geben_15_00"); //Tenez, prenez-le
	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_geben_08_01"); //Merci. De toute façon je ne pense pas que vous en ayez l'utilité.
	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
	B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Girion_DI_OrcEliteRing_behalten ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_behalten_15_00"); //Je préfère le garder.
	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_behalten_08_01"); //Comme vous voulez. De toute façon il ne vous servira à rien.
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
	
	description = 	"On peut appareiller maintenant.";
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
	AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_00"); //Nous pouvons larguer les amarres maintenant.
	AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_01"); //Pas trop tôt ! Je commençais à penser que j'allais prendre racine sur cette falaise...

	if (DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_02"); //Remettez-moi immédiatement le commandement du navire.
			AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_03"); //Nous ne sommes pas encore à Khorinis. Et pour être honnête, je n'ai pas vraiment envie d'y retourner.
			AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_04"); //J'y suis resté bien assez longtemps.
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_05"); //C'est bien ce que je pensais. Mais ce n'est pas le lieu ni le moment pour régler cette affaire. Nous en reparlerons en mer.
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_06"); //Et alors ? Cela ne m'empêche pas d'être heureux de vous revoir en un seul morceau.
			
			if (hero.guild == GIL_PAL)
			{
				AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_07"); //Vous êtes un vrai guerrier d'Innos. Je n'éprouve plus le moindre doute à ce sujet et je suis heureux de vous avoir de notre côté.
			}
			else
			{
				AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_08"); //Même si vous êtes un gredin, vous avez eu un comportement honorable quand il le fallait.
			};
			
			DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
		};

	AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_09"); //Très bien. Allez voir le capitaine, qu'il nous fasse sortir d'ici.
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


