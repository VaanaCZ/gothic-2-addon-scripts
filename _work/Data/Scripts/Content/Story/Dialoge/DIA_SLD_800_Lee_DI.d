///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lee_DI_EXIT   (C_INFO)
{
	npc         = SLD_800_Lee_DI;
	nr          = 999;
	condition   = DIA_Lee_DI_EXIT_Condition;
	information = DIA_Lee_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lee_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lee_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_Hallo		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_Hallo_Condition;
	information	 = 	DIA_Lee_DI_Hallo_Info;

	description	 = 	"¿De qué trabajo te harás cargo?";
};
func int DIA_Lee_DI_Hallo_Condition ()
{	
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Lee_DI_Hallo_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DI_Hallo_15_00"); //¿De qué trabajo te harás cargo?
	AI_Output			(self, other, "DIA_Lee_DI_Hallo_04_01"); //Alguien tiene que vigilar el barco. Me quedaré aquí y me aseguraré de que cuando vuelvas, todo esté en orden.
	
};

///////////////////////////////////////////////////////////////////////
//	Info PERM6
///////////////////////////////////////////////////////////////////////

instance DIA_Lee_DI_PERM6		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_PERM6_Condition;
	information	 = 	DIA_Lee_DI_PERM6_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Qué tal está el barco?";
};

func int DIA_Lee_DI_PERM6_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lee_DI_Hallo))
	&& (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Lee_DI_PERM6_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DI_PERM6_15_00"); //¿Qué tal está el barco?

	if (ORkSturmDI == FALSE)
	{
		AI_Output			(self, other, "DIA_Lee_DI_PERM6_04_01"); //No te preocupes. Lo tengo todo bajo control.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_DI_PERM6_04_02"); //Todo va bien. Esos miserables orcos pueden venir cuando quieran. Si lo hacen, se llevarán una buena paliza.
	};
	
	AI_StopProcessInfos (self);
};
 
//**************************************
//			Ich will trainieren
//**************************************

INSTANCE DIA_Lee_DI_Teach(C_INFO)
{
	npc			= SLD_800_Lee_DI;
	nr			= 10;
	condition	= DIA_Lee_DI_Teach_Condition;
	information	= DIA_Lee_DI_Teach_Info;
	permanent	= TRUE;
	
	description = "Necesito entrenamiento.";
};                       

FUNC INT DIA_Lee_DI_Teach_Condition()
{
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};
 
FUNC VOID DIA_Lee_DI_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Lee_DI_Teach_15_00"); //Necesito entrenamiento.
	AI_Output (self,other ,"DIA_Lee_DI_Teach_04_01"); //¿Qué es lo que quieres entrenar?
	
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
};

FUNC VOID DIA_Lee_DI_Teach_1H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100))
	{
			AI_Output (self ,other,"DIA_Lee_DI_Teach_1H_1_04_00"); //Tu defensa es lamentable, pero tendrá que servir.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_1H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100))
	{
			AI_Output (self ,other,"DIA_Lee_DI_Teach_1H_5_04_00"); //Tus muñecas están demasiado agarrotadas. Tienes que sostener el arma con más suavidad.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_2H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00"); //Recuerda en todo momento que la estocada sale de la cadera, no de las muñecas.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_2H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00"); //El golpe más poderoso no sirve de nada si no se acierta a nada. Utiliza la fuerza con inteligencia.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_Back ()
{
	Info_ClearChoices (DIA_Lee_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Lee_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"Ahora podemos seguir nuestro camino.";
};

func int DIA_Lee_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Lee_DI_UndeadDragonDead_OneTime;
func void DIA_Lee_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_00"); //Ahora podemos seguir nuestro camino. El enemigo ha muerto.
	AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_01"); //Muy bien. Entonces dile al capitán que leve anclas.

	if (DIA_Lee_DI_UndeadDragonDead_OneTime == FALSE)
	&& (hero.guild == GIL_DJG)
		{
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_02"); //Me llevarás al continente, ¿verdad?
			AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_03"); //Sí. Khorinis sobrevivirá sin ti.
			//AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_04"); //Dann kann ich dem König endlich meine lang ersehnte Aufwartung machen. Er ist schon zu lange vor mir davon gelaufen.
			AI_Output (self ,other, "DIA_Lee_Add_04_26"); //Entonces por fin podré realizar la visita de cortesía al Rey que he esperado tanto tiempo.
			AI_Output (self ,other, "DIA_Lee_Add_04_27"); //Llevo mucho tiempo esperando este momento...
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_05"); //¿Qué te parece? ¿No debía ser recompensada mi paciencia?
			AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_06"); //La paciencia y unas buenas razones.
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_07"); //(Se ríe) Sí. No funcionará sin una fuerza armada. Ha sido un honor combatir a tu lado.
			DIA_Lee_DI_UndeadDragonDead_OneTime = TRUE;
		};

	AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_08"); //Que nuestros caminos se vuelvan a cruzar después de esta aventura.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lee_DI_PICKPOCKET (C_INFO)
{
	npc			= SLD_800_Lee_DI;
	nr			= 900;
	condition	= DIA_Lee_DI_PICKPOCKET_Condition;
	information	= DIA_Lee_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Lee_DI_PICKPOCKET_Condition()
{
	C_Beklauen (110, 570);
};
 
FUNC VOID DIA_Lee_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lee_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Lee_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Lee_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lee_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lee_DI_PICKPOCKET_DoIt);
};

func void DIA_Lee_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lee_DI_PICKPOCKET);
};
	
func void DIA_Lee_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lee_DI_PICKPOCKET);
};


