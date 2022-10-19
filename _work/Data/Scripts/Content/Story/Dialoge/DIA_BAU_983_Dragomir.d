

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
	AI_Output (self,other,"DIA_Dragomir_Hello_12_00"); //Vous voyagez loin de chez vous ?
	AI_Output (self,other,"DIA_Dragomir_Hello_12_01"); //Vous devez �tre prudent ici, surtout si vous �tes tout seul.
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
	description = "Que faites-vous ici ?";
};
FUNC INT DIA_Dragomir_OutHere_Condition()
{
	return TRUE;	
};
FUNC VOID DIA_Dragomir_OutHere_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_OutHere_15_00"); //Que faites-vous ici ?
	AI_Output (self ,other,"DIA_Dragomir_OutHere_12_01"); //La taverne est trop ch�re pour moi, c'est pour �a que je me suis install� ici.
	AI_Output (self ,other,"DIA_Dragomir_OutHere_12_02"); //Ceux qui vivaient ici n'ont pas l'air d'en avoir besoin.
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
	description = "Qui vivait dans ce campement ?";
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
	AI_Output (other,self ,"DIA_Dragomir_Settlers_15_00"); //Qui vivait dans ce campement ?
	AI_Output (self ,other,"DIA_Dragomir_Settlers_12_01"); //Aucune id�e, certainement des chasseurs. Je suppose que c'est devenu trop dangereux pour eux.
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
	description = "Ce n'est pas trop dangereux dans le coin ?";
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
	AI_Output (other,self ,"DIA_Dragomir_Dangerous_15_00"); //N'est-ce pas trop dangereux dans le coin ?
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_01"); //Pas si vous pouvez vous d�fendre. Mon arbal�te a eu l'occasion � plusieurs reprises de faire ses preuves.
	AI_Output (other,self ,"DIA_Dragomir_Dangerous_15_02"); //Elle n'est pas si grosse.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_03"); //Mais mortelle si vous savez vous en servir. J'en avais une plus grosse mais je l'ai perdue.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_04"); //Je me suis aventur� trop au nord dans les montagnes. Il y a l�-bas un grand cercle de pierre avec un autel sacrificiel.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_05"); //Alors que j'y chassais des charognards, de viles cr�atures mortes-vivantes ont jailli des bois et m'ont attaqu�.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_06"); //Tout ce que j'ai pu faire, c'est fuir.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_07"); //Alors que je courais, j'ai laiss� tomber l'arbal�te. Je parierais qu'elle est encore pr�s de cet �trange cercle de pierre au nord.

	Log_CreateTopic (TOPIC_DragomirsArmbrust, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust, LOG_RUNNING);
	B_LogEntry (TOPIC_DragomirsArmbrust,"Dragomir a perdu son arbal�te dans un �trange cercle de pierres dans les montagnes du nord."); 

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
	description = "Tenez. J'ai retrouv� votre arbal�te.";
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
	AI_Output (other,self ,"DIA_Dragomir_Armbrust_15_00"); //Tenez. J'ai retrouv� votre arbal�te.
	B_GiveInvItems (other, self, ItRw_DragomirsArmbrust_MIS, 1);					
	AI_Output (self ,other,"DIA_Dragomir_Armbrust_12_01"); //C'est effectivement la mienne. Ne me dites pas que vous �tes all� au cercle de pierre ?
	AI_Output (other,self ,"DIA_Dragomir_Armbrust_15_02"); //Et si !
	AI_Output (self ,other,"DIA_Dragomir_Armbrust_12_03"); //C'�tait t�m�raire de votre part. mais merci tout de m�me.
	AI_Output (self ,other,"DIA_Dragomir_Armbrust_12_04"); //Naturellement, je veux vous r�compenser. J'esp�re que ce sera assez.

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
	description = "Pouvez-vous m'enseigner quelque chose ?";
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
	AI_Output (other,self ,"DIA_Dragomir_Learn_15_00"); //Pouvez-vous m'apprendre quelque chose ?
	
	if (other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output (self ,other,"DIA_Dragomir_Learn_12_01"); //Avant d'apprendre quoi que ce soit, vous devez augmenter votre dext�rit�.
	}
	else
	{
		AI_Output (self ,other,"DIA_Dragomir_Learn_12_02"); //Si vous pouvez payer. Comme je l'ai d�j� dit en ce moment je suis un peu � court d'argent.
		AI_Output (other,self ,"DIA_Dragomir_Learn_15_03"); //Combien voulez-vous ?
		B_Say_Gold (self,other,Dragomir_TeachingCost);
		
		Info_ClearChoices (DIA_Dragomir_Learn);
		Info_AddChoice (DIA_Dragomir_Learn,"Peut-�tre plus tard.",DIA_Dragomir_Learn_Later);
		if (Npc_HasItems (other,ItMi_Gold) >= Dragomir_TeachingCost)
		{ 
			Info_AddChoice (DIA_Dragomir_Learn,"Voici votre or.",DIA_Dragomir_Learn_Here);
		};
	};	
};

FUNC VOID DIA_Dragomir_Learn_Later()
{
	AI_Output (other,self ,"DIA_Dragomir_Learn_Later_15_00"); //Peut-�tre plus tard.
	Info_ClearChoices (DIA_Dragomir_Learn);
};

FUNC VOID DIA_Dragomir_Learn_Here()
{
	AI_Output (other,self ,"DIA_Dragomir_Learn_Here_15_00"); //Voici votre argent.
	B_GiveInvItems (other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output (self ,other,"DIA_Dragomir_Learn_Here_12_01"); //Bien, nous pouvons commencer tout de suite.
	
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
	description = "Apprenez-moi quelque chose.";
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
	AI_Output (other,self ,"DIA_Dragomir_Teach_15_00"); //Apprenez-moi quelque chose.
		
	Info_ClearChoices 	(DIA_Dragomir_Teach);
	Info_AddChoice 		(DIA_Dragomir_Teach,	DIALOG_BACK		,DIA_Dragomir_Teach_Back);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Dragomir_Teach_1H_1);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)	,DIA_Dragomir_Teach_1H_5);

};


func void DIA_Dragomir_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00"); //Je ne peux rien vous apprendre d'autre. Il est temps que vous alliez chercher un autre professeur.
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


	
	
