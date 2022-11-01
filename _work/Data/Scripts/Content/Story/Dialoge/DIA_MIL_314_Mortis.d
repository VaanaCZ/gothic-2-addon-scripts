///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mortis_EXIT   (C_INFO)
{
	npc         = Mil_314_Mortis;
	nr          = 999;
	condition   = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Hallo		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Hallo_Condition;
	information	 = 	DIA_Mortis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Mortis_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Mortis_Hallo_13_00"); //Que voulez-vous ? Peck n'est pas ici. Vous ne pouvez donc rien avoir. Revenez plus tard.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Waffe		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Waffe_Condition;
	information	 = 	DIA_Mortis_Waffe_Info;
	permanent    =  FALSE;
	description  =  "Où est Peck ?";
};

func int DIA_Mortis_Waffe_Condition ()
{	
	if (MIS_Andre_Peck == LOG_RUNNING)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Waffe_15_00"); //Où est Peck ?
	AI_Output (self, other, "DIA_Mortis_Waffe_13_01"); //Vous venez de vous engager, hein ? Alors bienvenue à bord.
	AI_Output (self, other, "DIA_Mortis_Waffe_13_02"); //Cela fait très longtemps que Peck est en ville. Je suis sûr qu'il traîne avec la jolie Vanja à la Lanterne Rouge.
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Paket		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Paket_Condition;
	information	 = 	DIA_Mortis_Paket_Info;
	permanent    =  FALSE;
	description  =  "Que savez-vous au sujet du paquet d'herbes ?";
};

func int DIA_Mortis_Paket_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Paket_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Paket_15_00"); //Que savez-vous au sujet de cette livraison d'herbes ?
	AI_Output (self, other, "DIA_Mortis_Paket_13_01"); //Hum... la dernière fois que je suis allé dans le quartier du port, j'ai entendu Kardif et un autre type en parler.
	AI_Output (other, self, "DIA_Mortis_Paket_15_02"); //Qui était cet autre type ?
	AI_Output (self, other, "DIA_Mortis_Paket_13_03"); //Aucune idée. Mais il disait qu'il avait trouvé la meilleure planque possible pour son herbe. Puis ils se sont mis à rire comme des orques ivres.
	
	B_LogEntry (TOPIC_WAREHOUSE,"Dans le pub des docks, Mortis a entendu Kardif et un autre homme parler du paquet. Ils discutaient de l'endroit où l'entreposer.");
};
///////////////////////////////////////////////////////////////////////
//	Info Redlight
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Redlight		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Redlight_Condition;
	information	 = 	DIA_Mortis_Redlight_Info;
	permanent    =  FALSE;
	description  =  "Que savez-vous au sujet du quartier du port ?";
};

func int DIA_Mortis_Redlight_Condition ()
{	
	if (MIS_ANDRE_REDLIGHT == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Redlight_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Redlight_15_00"); //Que savez-vous du quartier du port ? Je veux trouver celui qui vend les herbes des marais.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_01"); //Houlà ! Les types là-bas parlent pas beaucoup. Et il est certain qu'ils ne diront rien à un garde de la ville.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_02"); //Si vous voulez apprendre quoi que ce soit là-bas, vous devriez, non, vous devez retirer votre armure.
	AI_Output (other, self, "DIA_Mortis_Redlight_15_03"); //D'accord et ensuite ?
	AI_Output (self, other, "DIA_Mortis_Redlight_13_04"); //La taverne et le bordel sont les meilleurs endroits où aller. Si vous voulez apprendre quelque chose, c'est là-bas que vous l'apprendrez.
	
	B_LogEntry (TOPIC_REDLIGHT,"Mortis estime que si je veux acheter de l'herbe des marais dans le quartier du port, je ferais mieux de ne pas porter d'armure. Les meilleurs endroits pour essayer sont la maison close et la taverne.");
};
///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_CanTeach		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  5;
	condition	 = 	DIA_Mortis_CanTeach_Condition;
	information	 = 	DIA_Mortis_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Je veux me muscler.";
};

func int DIA_Mortis_CanTeach_Condition ()
{	
	if (Mortis_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Mortis_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_CanTeach_15_00"); //Je veux augmenter ma force.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_01"); //Compris. Si vous avez assez d'expérience, je peux vous aider à vous entraîner.
		Mortis_TeachSTR = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_02"); //Bien entendu. Mais tant que vous n'êtes pas l'un des nôtres ou un paladin, je ne vous aiderai pas.
	};
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Mortis, un garde de la ville, peut m'entraîner pour augmenter ma force.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Teach		(C_INFO)
{
	npc		  	 = 	Mil_314_Mortis;
	nr			 = 	100;
	condition	 = 	DIA_Mortis_Teach_Condition;
	information	 = 	DIA_Mortis_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux me muscler.";
};
func int DIA_Mortis_Teach_Condition ()
{	
	if (Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Mortis_Teach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Teach_15_00"); //Je veux augmenter ma force.
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
};
func void DIA_Mortis_Teach_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output (self, other, "DIA_Mortis_Teach_13_00"); //Vous êtes suffisamment fort. Si vous voulez vous entraîner encore plus, allez ailleurs.
	};
	Info_ClearChoices (DIA_Mortis_TEACH);
};
func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_TEACH_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};
func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mortis_PICKPOCKET (C_INFO)
{
	npc			= Mil_314_Mortis;
	nr			= 900;
	condition	= DIA_Mortis_PICKPOCKET_Condition;
	information	= DIA_Mortis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Mortis_PICKPOCKET_Condition()
{
	C_Beklauen (38, 60);
};
 
FUNC VOID DIA_Mortis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mortis_PICKPOCKET);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_BACK 		,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};
	
func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};


