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

	description	 = 	"¿Va todo bien?";
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
	AI_Output			(other, self, "DIA_Girion_DI_Hallo_15_00"); //¿Va todo bien?

	if (ORkSturmDI == TRUE)
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_01"); //Los orcos son muy valientes si se atreven a enfrentarse a mí.
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_02"); //Tendrían que pensarse dos veces lo de desafiar a un paladín de la guardia real.
		}
	else if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_03"); //Opino igual. ¿Te llevará mucho tu misión en este acantilado?
		}
	else
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_04"); //No me trates como a un idiota. Haz lo que tienes que hacer y cédeme el barco.
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
	description = "¡Entréname y podré irme antes de aquí!";
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
	AI_Output (other,self 	,"DIA_Girion_DI_Teach_15_00"); //Entréname y podremos salir antes de aquí.
	AI_Output (self ,other 	,"DIA_Girion_DI_Teach_08_01"); //Parece que no tengo opción.
	
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
			AI_Output (self ,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00"); //No apoyes nunca los codos. Agarrota la puntería y hace que el arma se gire.
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
			AI_Output (self ,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00"); //Deja suelto el brazo antes de un disparo. De esa manera serás más flexible al apuntar.
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
			AI_Output (self ,other,"DIA_Girion_DI_Teach_1H_1_08_00"); //Tu hoja debe cortar el aire como un junco corta el aire.
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
			AI_Output (self ,other,"DIA_Girion_DI_Teach_1H_5_08_00"); //Utiliza siempre la fuerza calculada. Nunca triunfarás si te lanzas a ciegas contra el oponente.
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
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00"); //No cojas el asta con tanta fuerza y alcanzarás el objetivo.
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
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00"); //No te olvides de parar golpes. De todas maneras, la mejor defensa es esquivar el golpe del enemigo.
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

	description	 = 	"Tengo un anillo de los señores de la guerra orcos.";
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
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_15_00"); //Tengo un anillo de los señores de la guerra orcos.

	if (DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_08_01"); //Sospecho que lord Hagen podrá hacer algo con eso.
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE;
	};

	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_08_02"); //Dámelo. Se lo llevaré a lord Hagen.

	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice	(DIA_Girion_DI_OrcEliteRing, "Preferiría quedármelo.", DIA_Girion_DI_OrcEliteRing_behalten );
	Info_AddChoice	(DIA_Girion_DI_OrcEliteRing, "Tómalo.", DIA_Girion_DI_OrcEliteRing_geben );
};
func void DIA_Girion_DI_OrcEliteRing_geben ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_geben_15_00"); //Tómalo.
	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_geben_08_01"); //Gracias. De todas maneras no creo que te sirva de nada.
	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
	B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Girion_DI_OrcEliteRing_behalten ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_behalten_15_00"); //Preferiría quedármelo.
	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_behalten_08_01"); //Lo que quieras. De todas maneras, no te sirve para nada.
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
	
	description = 	"Podemos irnos ya.";
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
	AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_00"); //Podemos irnos ya.
	AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_01"); //Ya era hora, creía que iba a echar raíces en esta colina.

	if (DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_02"); //Ahora, cédeme el mando de la nave, inmediatamente.
			AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_03"); //Todavía no estamos en Khorinis y, si te soy sincero, no me hace mucha ilusión volver.
			AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_04"); //Ya he estado allí demasiado tiempo.
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_05"); //Opino igual. Pero este no es el momento ni el lugar para solucionar esto. Hablaremos cuando volvamos a estar en alta mar.
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_06"); //Bueno, de todas maneras, me alegro de que hayas vuelto a bordo de una pieza.
			
			if (hero.guild == GIL_PAL)
			{
				AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_07"); //Eres un verdadero guerrero de Innos. Ya no me queda duda. Estoy contento de tenerte de nuestro lado.
			}
			else
			{
				AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_08"); //Incluso siendo un canalla, al final actúas de manera honorable.
			};
			
			DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
		};

	AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_09"); //De acuerdo. Ahora vayamos a que el capitán nos saque de aquí.
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


