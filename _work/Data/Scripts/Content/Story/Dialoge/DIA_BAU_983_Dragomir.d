

// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Dragomir_EXIT   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 999;
	condition   = DIA_Dragomir_EXIT_Condition;
	information = DIA_Dragomir_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos (self);
};						
						
// ***********************************************************
// 							Hello
// ***********************************************************
INSTANCE DIA_Dragomir_Hello   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 1;
	condition   = DIA_Dragomir_Hello_Condition;
	information = DIA_Dragomir_Hello_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Dragomir_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_TALK))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dragomir_Hello_Info()
{
	AI_Output (self,other,"DIA_Dragomir_Hello_12_00"); //Ti sei spinto così lontano da casa?
	AI_Output (self,other,"DIA_Dragomir_Hello_12_01"); //Qui fuori devi fare attenzione, specialmente quando sei da solo.
};		 
	
// ***********************************************************
// 							OutHere
// ***********************************************************
INSTANCE DIA_Dragomir_OutHere   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent   = FALSE;
	description = "Che ci fai qua fuori?";
};
FUNC INT DIA_Dragomir_OutHere_Condition()
{
	return TRUE;	
};
FUNC VOID DIA_Dragomir_OutHere_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_OutHere_15_00"); //Che ci fai qua fuori?
	AI_Output (self ,other,"DIA_Dragomir_OutHere_12_01"); //Beh, la taverna è troppo cara per me, per questo mi sono sistemato qui.
	AI_Output (self ,other,"DIA_Dragomir_OutHere_12_02"); //Pare che agli inquilini che c'erano prima non serva più.
};		 		

// ***********************************************************
// 							OutHere
// ***********************************************************
INSTANCE DIA_Dragomir_Settlers   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent   = FALSE;
	description = "Chi viveva in questo campo?";
};
FUNC INT DIA_Dragomir_Settlers_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dragomir_OutHere))
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Settlers_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Settlers_15_00"); //Chi viveva in questo campo?
	AI_Output (self ,other,"DIA_Dragomir_Settlers_12_01"); //Non ne ho idea, probabilmente si trattava di cacciatori. Suppongo che fosse diventato troppo pericoloso per loro starsene qui fuori.
};


// ***********************************************************
// 							Dangerous
// ***********************************************************
INSTANCE DIA_Dragomir_Dangerous   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent   = FALSE;
	description = "Non è troppo pericoloso qui fuori?";
};
FUNC INT DIA_Dragomir_Dangerous_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dragomir_OutHere))
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Dangerous_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Dangerous_15_00"); //Non è troppo pericoloso qui fuori?
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_01"); //Beh, non se sai come difenderti. La mia balestra si è rivelata utile già in parecchie occasioni.
	AI_Output (other,self ,"DIA_Dragomir_Dangerous_15_02"); //Non è poi così grande.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_03"); //Ma letale, se sai come usarla. Un tempo ne avevo una più grande, ma, ahimè, l'ho persa.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_04"); //Mi sono avventurato troppo a nord sulle montagne. C'è un grosso cerchio di pietre lì, con un altare sacrificale.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_05"); //Mentre ero a caccia di saprofaghi lassù, questi vili non morti sono spuntati fuori dal bosco e mi hanno attaccato.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_06"); //Tutto quello che ho potuto fare è stato scappare per salvarmi la vita.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_07"); //Mentre stavo correndo, la balestra mi è scivolata di mano. Scommetto che si trova ancora lì, vicino a quello strano cerchio di pietre a nord.

	Log_CreateTopic (TOPIC_DragomirsArmbrust, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust, LOG_RUNNING);
	B_LogEntry (TOPIC_DragomirsArmbrust,"Dragomir ha perso la sua balestra vicino a uno strano cerchio di pietra sulle montagne a nord."); 

	MIS_DragomirsArmbrust = LOG_RUNNING;
};

// ***********************************************************
// 							Armbrust
// ***********************************************************
INSTANCE DIA_Dragomir_Armbrust   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Armbrust_Info;
	permanent   = FALSE;
	description = "Tieni, ho trovato la tua balestra.";
};
FUNC INT DIA_Dragomir_Armbrust_Condition()
{
	if (MIS_DragomirsArmbrust == LOG_RUNNING)
	&& (Npc_HasItems (other,ItRw_DragomirsArmbrust_MIS))
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Armbrust_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Armbrust_15_00"); //Tieni, ho trovato la tua balestra.
	B_GiveInvItems (other, self, ItRw_DragomirsArmbrust_MIS, 1);					
	AI_Output (self ,other,"DIA_Dragomir_Armbrust_12_01"); //È vero, è proprio la mia. Non dirmi che sei andato lassù, fino al cerchio di pietre?
	AI_Output (other,self ,"DIA_Dragomir_Armbrust_15_02"); //Certamente!
	AI_Output (self ,other,"DIA_Dragomir_Armbrust_12_03"); //È stato davvero imprudente da parte tua, ma grazie lo stesso.
	AI_Output (self ,other,"DIA_Dragomir_Armbrust_12_04"); //Naturalmente sarai ricompensato per lo sforzo. Spero che questo basti.

	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	B_GivePlayerXP (XP_DragomirsArmbrust);
};

// ***********************************************************
// 							Kannst du mir was beibringen?
// ***********************************************************

//---------------------------------------
var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;
//---------------------------------------

INSTANCE DIA_Dragomir_Learn   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Learn_Condition;
	information = DIA_Dragomir_Learn_Info;
	permanent   = TRUE;
	description = "Puoi insegnarmi qualcosa?";
};
FUNC INT DIA_Dragomir_Learn_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dragomir_Dangerous))
	&& (Dragomir_TeachPlayer == FALSE)
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Learn_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Learn_15_00"); //Puoi insegnarmi qualcosa?
	
	if (other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output (self ,other,"DIA_Dragomir_Learn_12_01"); //Prima che possa insegnarti qualcosa, devi migliorare la tua destrezza.
	}
	else
	{
		AI_Output (self ,other,"DIA_Dragomir_Learn_12_02"); //Se puoi pagare. Come ti ho già detto, al momento mi servono soldi.
		AI_Output (other,self ,"DIA_Dragomir_Learn_15_03"); //Quanto vuoi?
		B_Say_Gold (self,other,Dragomir_TeachingCost);
		
		Info_ClearChoices (DIA_Dragomir_Learn);
		Info_AddChoice (DIA_Dragomir_Learn,"Forse più tardi.",DIA_Dragomir_Learn_Later);
		if (Npc_HasItems (other,ItMi_Gold) >= Dragomir_TeachingCost)
		{ 
			Info_AddChoice (DIA_Dragomir_Learn,"Ecco il tuo oro.",DIA_Dragomir_Learn_Here);
		};
	};	
};

FUNC VOID DIA_Dragomir_Learn_Later()
{
	AI_Output (other,self ,"DIA_Dragomir_Learn_Later_15_00"); //Forse più tardi.
	Info_ClearChoices (DIA_Dragomir_Learn);
};

FUNC VOID DIA_Dragomir_Learn_Here()
{
	AI_Output (other,self ,"DIA_Dragomir_Learn_Here_15_00"); //Ecco il tuo oro.
	B_GiveInvItems (other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output (self ,other,"DIA_Dragomir_Learn_Here_12_01"); //Bene, per quel che mi riguarda, possiamo cominciare anche subito.
	
	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Dragomir_Learn);
};

// ***********************************************************
// 							Teach
// ***********************************************************

//------------------------------------------------------------
var int DIA_Dragomir_Teach_permanent;
//------------------------------------------------------------

INSTANCE DIA_Dragomir_Teach   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Teach_Condition;
	information = DIA_Dragomir_Teach_Info;
	permanent   = TRUE;
	description = "Insegnami qualcosa.";
};
FUNC INT DIA_Dragomir_Teach_Condition()
{
	if (Dragomir_TeachPlayer == TRUE)
	&& (DIA_Dragomir_Teach_permanent == FALSE)
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Teach_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Teach_15_00"); //Insegnami qualcosa.
		
	Info_ClearChoices 	(DIA_Dragomir_Teach);
	Info_AddChoice 		(DIA_Dragomir_Teach,	DIALOG_BACK		,DIA_Dragomir_Teach_Back);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Dragomir_Teach_1H_1);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)	,DIA_Dragomir_Teach_1H_5);

};


func void DIA_Dragomir_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00"); //Non sono in grado di insegnarti altro. È ora che ti cerchi un altro maestro.
		DIA_Dragomir_Teach_permanent = TRUE;
		
	};
	Info_ClearChoices (DIA_Dragomir_Teach);
};

func void DIA_Dragomir_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 75);
	
	Info_ClearChoices 	(DIA_Dragomir_Teach);
	Info_AddChoice 		(DIA_Dragomir_Teach,	DIALOG_BACK		,DIA_Dragomir_Teach_Back);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Dragomir_Teach_1H_1);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)	,DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_1H_5 ()	
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 75);
	
	Info_ClearChoices 	(DIA_Dragomir_Teach);
	Info_AddChoice 		(DIA_Dragomir_Teach,	DIALOG_BACK		,DIA_Dragomir_Teach_Back);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Dragomir_Teach_1H_1);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)	,DIA_Dragomir_Teach_1H_5);
};	
	
	

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dragomir_PICKPOCKET (C_INFO)
{
	npc			= BAU_983_Dragomir;
	nr			= 900;
	condition	= DIA_Dragomir_PICKPOCKET_Condition;
	information	= DIA_Dragomir_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Dragomir_PICKPOCKET_Condition()
{
	C_Beklauen (47, 70);
};
 
FUNC VOID DIA_Dragomir_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dragomir_PICKPOCKET);
	Info_AddChoice		(DIA_Dragomir_PICKPOCKET, DIALOG_BACK 		,DIA_Dragomir_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dragomir_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dragomir_PICKPOCKET_DoIt);
};

func void DIA_Dragomir_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dragomir_PICKPOCKET);
};
	
func void DIA_Dragomir_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dragomir_PICKPOCKET);
};


	
	
