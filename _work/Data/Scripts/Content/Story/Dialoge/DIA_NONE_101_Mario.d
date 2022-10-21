
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_None_101_Mario_EXIT   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 999;
	condition   = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Was machst du hier? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_Job (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 4;
	condition   = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent   = TRUE;
	description	= "Que faites-vous ici ?";
};

FUNC INT DIA_None_101_Mario_Job_Condition()
{
	if (Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == FALSE)
	&& (Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe)== FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_Job_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_Job_15_00"); //Que faites-vous ici ?
	AI_Output (self ,other,"DIA_None_101_Mario_Job_07_01"); //J'espère que je n'aurai pas à attendre longtemps un navire sur lequel je pourrai me faire engager.
	AI_Output (self ,other,"DIA_None_101_Mario_Job_07_02"); //Toute cette attente me porte sur les nerfs.
};

//*********************************************************************
//	Du suchst doch Leute? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_YouNeedMe   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 4;
	condition   = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_None_101_Mario_YouNeedMe_Condition()
{
	if (Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output (self ,other,"DIA_None_101_Mario_YouNeedMe_07_00"); //J'ai entendu dire que vous cherchiez un équipage pour votre bateau...
	AI_Output (other,self ,"DIA_None_101_Mario_YouNeedMe_15_01"); //Et ?
	AI_Output (self ,other,"DIA_None_101_Mario_YouNeedMe_07_02"); //Je suis partant !
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	
	B_LogEntry (TOPIC_Crew,"Au pub du port, Mario, un ancien marin, s'est adressé à moi. Il veut venir à bord du navire.");
};

//*********************************************************************
//	Warum sollte ich dich mitnehmen? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_WhyNeedYou   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 5;
	condition   = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent   = FALSE;
	description	= "Pourquoi devrais-je vous emmener avec moi ?";
};

FUNC INT DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_WhyNeedYou_15_00"); //Pourquoi devrais-je vous emmener avec moi ?
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_01"); //Parce que vous avez besoin de moi, tout simplement.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_02"); //Je suis... enfin, j'étais autrefois lieutenant dans la marine royale.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_03"); //J'ai servi à bord du Roi Rhobar et de la Fierté de Myrtana.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_04"); //Lors de la bataille de l'archipel oriental, j'ai envoyé seul plus d'une vingtaine d'orques auprès de Béliar.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyNeedYou_07_05"); //Malheureusement, nous n'étions pas assez nombreux et il nous a fallu nous replier après la perte de notre vaisseau-amiral.

};

//*********************************************************************
//	Wieso bist du dann hier? 
//*********************************************************************
INSTANCE DIA_None_101_Mario_WhyHere   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 7;
	condition   = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent   = FALSE;
	description	= "Alors pourquoi êtes-vous ici ?";
};

FUNC INT DIA_None_101_Mario_WhyHere_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_WhyHere_15_00"); //Que faites-vous ici, dans ce cas ?
	AI_Output (self ,other,"DIA_None_101_Mario_WhyHere_07_01"); //La flotte a été défaite et les coffres sont vides.
	AI_Output (self ,other,"DIA_None_101_Mario_WhyHere_07_02"); //A mon retour à la vie civile, je me suis retrouvé dans ce trou et je suis à la recherche d'un nouveau navire.
};

//*********************************************************************
//	Was kannst du?
//*********************************************************************
INSTANCE DIA_None_101_Mario_Abilities   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 8;
	condition   = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent   = FALSE;
	description	= "Que pouvez-vous faire ?";
};

FUNC INT DIA_None_101_Mario_Abilities_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_Abilities_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_Abilities_15_00"); //Que savez-vous faire ?
	AI_Output (self ,other,"DIA_None_101_Mario_Abilities_07_01"); //J'ai été formé à l'abordage et au combat rapproché, et je sais également tirer au canon.
	AI_Output (self ,other,"DIA_None_101_Mario_Abilities_07_02"); //Je parie que je pourrais vous enseigner deux ou trois petites choses en chemin...

	B_LogEntry (TOPIC_Crew,"Mario semble bien connaître le combat naval. Il devrait pouvoir m'apprendre une ou deux choses.");
};

//*********************************************************************
//	Was verlangst du?
//*********************************************************************
INSTANCE DIA_None_101_Mario_YourPrice   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 9;
	condition   = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent   = FALSE;
	description	= "Pourquoi le demandez-vous ?";
};

FUNC INT DIA_None_101_Mario_YourPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_YourPrice_15_00"); //Que demandez-vous au juste ?
	AI_Output (self ,other,"DIA_None_101_Mario_YourPrice_07_01"); //Que voulez-vous que je demande ? Je serais déjà bien assez content de partir d'ici...
	AI_Output (self ,other,"DIA_None_101_Mario_YourPrice_07_02"); //Une couchette en échange de mes bras. Vous me prenez avec vous et je vous aide.
};

//*********************************************************************
//	Die Reise kann gefährlich werden.
//*********************************************************************
INSTANCE DIA_None_101_Mario_CouldBeDangerous   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 10;
	condition   = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent   = FALSE;
	description	= "Le voyage peut être dangereux.";
};

FUNC INT DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YourPrice))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_CouldBeDangerous_15_00"); //Le voyage pourrait être dangereux...
	AI_Output (self ,other,"DIA_None_101_Mario_CouldBeDangerous_07_01"); //Je suis habitué au danger. Et en mer, il est toujours présent.
	AI_Output (self ,other,"DIA_None_101_Mario_CouldBeDangerous_07_02"); //La prochaine tempête peut dévaster le navire, sans compter les monstres marins qui n'attendent que l'occasion de l'entraîner par le fond.
	AI_Output (self ,other,"DIA_None_101_Mario_CouldBeDangerous_07_03"); //Sans parler pas des galères orques. Croyez-moi, je n'ai peur de rien. De toute façon, un marin craintif est un marin mort.
};

//*********************************************************************
//	Kein Bedarf!
//*********************************************************************
INSTANCE DIA_None_101_Mario_DontNeedYou   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 13;
	condition   = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent   = FALSE;
	description	= "Je n'ai nul besoin de vous.";
};

FUNC INT DIA_None_101_Mario_DontNeedYou_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_DontNeedYou_15_00"); //Vous ne me seriez d'aucune utilité.
	AI_Output (self ,other,"DIA_None_101_Mario_DontNeedYou_07_01"); //Je suis le meilleur marin que vous pourrez trouver ici.
	AI_Output (self ,other,"DIA_None_101_Mario_DontNeedYou_07_02"); //A vous voir, je dirais que vous ne savez rien de la navigation.
	AI_Output (self ,other,"DIA_None_101_Mario_DontNeedYou_07_03"); //Alors, réfléchissez-y à deux fois avant de faire confiance à qui que ce soit.
};

//*********************************************************************
//	Gute Leute kann ich immer brauchen.
//*********************************************************************
INSTANCE DIA_None_101_Mario_NeedGoodMen   (C_INFO)
{
	npc         = NONE_101_MARIO;
	nr          = 2;
	condition   = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent   = FALSE;
	description	= "J'ai toujours besoin de personnes compétentes.";
};

FUNC INT DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if (Npc_KnowsInfo (other,DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output (other,self ,"DIA_None_101_Mario_NeedGoodMen_15_00"); //Les gens compétents sont toujours utiles.
	AI_Output (self ,other,"DIA_None_101_Mario_NeedGoodMen_07_01"); //Très bien. Je vous retrouve au navire.
	
	B_GivePlayerXP (XP_Crewmember_Success);
	
	Mario_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	AI_StopProcessInfos (self);
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_LeaveMyShip		(C_INFO)
{
	npc			 = 	NONE_101_MARIO;
	nr			 = 11;
	condition	 = 	DIA_Mario_LeaveMyShip_Condition;
	information	 = 	DIA_Mario_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Après tout, je n'ai nul besoin de vous.";
};
func int DIA_Mario_LeaveMyShip_Condition ()
{	
	if (Mario_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Mario_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Mario_LeaveMyShip_15_00"); //Finalement, je n'ai pas besoin de vous.
	AI_Output			(self, other, "DIA_Mario_LeaveMyShip_07_01"); //Comme vous voudrez. Vous savez où me trouver si vous changez d'avis.
	
	Mario_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_StillNeedYou		(C_INFO)
{
	npc			 = 	NONE_101_MARIO;
	nr			 = 	11;
	condition	 = 	DIA_Mario_StillNeedYou_Condition;
	information	 = 	DIA_Mario_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Après tout, vous pouvez m'être utile.";
};
func int DIA_Mario_StillNeedYou_Condition ()
{	
	if((Mario_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (Mario_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Mario_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Mario_StillNeedYou_15_00"); //Finalement, j'ai besoin de vous.
	
	if (Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Mario_StillNeedYou_07_01"); //Je le savais ! Je vous rejoins à bord du bateau.
		
		Mario_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
		AI_StopProcessInfos (self);
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Mario_StillNeedYou_07_02"); //Vous n'avez pas le droit de me traiter de la sorte ! Je vais vous massacrer !
	
		AI_StopProcessInfos (self);
		
		B_Attack	(self,other,AR_NONE,1); 
	};	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MARIO_PICKPOCKET (C_INFO)
{
	npc			= NONE_101_MARIO;
	nr			= 900;
	condition	= DIA_MARIO_PICKPOCKET_Condition;
	information	= DIA_MARIO_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_MARIO_PICKPOCKET_Condition()
{
	C_Beklauen (71, 220);
};
 
FUNC VOID DIA_MARIO_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MARIO_PICKPOCKET);
	Info_AddChoice		(DIA_MARIO_PICKPOCKET, DIALOG_BACK 		,DIA_MARIO_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MARIO_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_MARIO_PICKPOCKET);
};
	
func void DIA_MARIO_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MARIO_PICKPOCKET);
};


