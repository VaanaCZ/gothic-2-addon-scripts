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

	description	 = 	"¿Qué tal va todo?";
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
	AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_00"); //¿Cómo va todo?

	if ( Bennet_IsOnBoard == LOG_SUCCESS)
	&& (Npc_IsDead(Bennet_DI)	==	FALSE)
		{
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_01"); //¿Te tienes que traer TAMBIÉN a Bennet?
			AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_02"); //¿Pasa algo?
			AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_03"); //Ah, nada. No pasa nada. Haz tu trabajo y luego vete, ¿vale?
		}
	else
		{
			if (DIA_Wolf_DI_HALLO_OneTime == FALSE)
				{
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_04"); //La forja no es la mejor, pero haré lo que pueda.
					B_GivePlayerXP (XP_Ambient);
					DIA_Wolf_DI_HALLO_OneTime = TRUE;
					AI_StopProcessInfos (self);
					Npc_ExchangeRoutine	(self,"SmithDI");
				}
			else
				{
					AI_Output			(other, self, "DIA_Wolf_DI_HALLO_15_05"); //¿Puedes hacerme alguna armadura?
					AI_Output			(self, other, "DIA_Wolf_DI_HALLO_08_06"); //Lo siento, hombre, con estas herramientas, no. Habrá que esperar a que lleguemos a tierra firme.
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

	description = "Entréname en el combate a distancia.";
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
	AI_Output (other,self ,"DIA_Wolf_DI_Training_15_00"); //Entréname en el combate a distancia.
	AI_Output (self ,other,"DIA_Wolf_DI_Training_08_01"); //¿De qué tipo?
	
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_1_08_00"); //A diferencia de la ballesta, el arco es más aparatoso y necesita mucho espacio. Asegúrate de tener el suficiente en una batalla.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_BOW_5_08_00"); //Cuando dispares, deja que la cuerda se deslice entre tus dedos. Un dedo mal puesto puede fastidiar la trayectoria de la flecha.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00"); //Intenta no moverte mucho cuando dispares una ballesta. Debes pulsar el gatillo con cuidado.
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
		AI_Output (self ,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00"); //Un tirador inteligente se aprovecha del viento y nunca intenta disparar en su contra.
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
	
	description = 	"¿Va todo bien?";
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
	AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_00"); //¿Va todo bien?
	AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_01"); //Claro. ¿Qué tal tú? Ha sido duro, ¿eh?

	if (DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Wolf_DI_UndeadDragonDead_15_02"); //¿Dónde irás ahora?
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_03"); //A cualquier sitio menos de vuelta. Estoy harto de Khorinis.
			AI_Output			(self ,other, "DIA_Wolf_DI_UndeadDragonDead_08_04"); //A mí me da igual dónde vayamos. Siempre que sea lejos de aquí.
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


