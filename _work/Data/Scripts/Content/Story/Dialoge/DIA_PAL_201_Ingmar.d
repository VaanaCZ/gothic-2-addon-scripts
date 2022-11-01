///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ingmar_EXIT   (C_INFO)
{
	npc         = Pal_201_Ingmar;
	nr          = 999;
	condition   = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ingmar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Hallo		(C_INFO)
{
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  2;
	condition	 = 	DIA_Ingmar_Hallo_Condition;
	information	 = 	DIA_Ingmar_Hallo_Info;
	permanent    =  TRUE;
	important	 = 	TRUE;
};
//------------------------------------
var int DIA_Ingmar_Hallo_permanent;
//------------------------------------
func int DIA_Ingmar_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Ingmar_Hallo_permanent == FALSE)
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Hallo_Info ()
{
	if (EnterOW_Kapitel2 == FALSE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_00"); //Selon les rapports que j'ai reçus, la Vallée des mines est un lieu plutôt dangereux.
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_01"); //Equipez-vous en conséquence avant votre départ.
	}
	else if (MIS_OLDWORLD == LOG_SUCCESS)
	&& 		(LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_02"); //La situation de la Vallée des mines est plus que préoccupante, mais nous allons nous organiser pour tirer nos hommes de ce mauvais pas et récupérer le minerai.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_03"); //Je pensais que vous veniez voir le seigneur Hagen. Je vous conseille de le faire sans attendre.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Krieg mit den Orks 
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Krieg		(C_INFO)
{
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  99;
	condition	 = 	DIA_Ingmar_Krieg_Condition;
	information	 = 	DIA_Ingmar_Krieg_Info;
	permanent    =  FALSE;
	description	 =  "Quelle est la situation sur le continent ?";
};
func int DIA_Ingmar_Krieg_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Krieg_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_Krieg_15_00"); //Quelle est la situation sur le continent ?
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_01"); //Nous n'avons pas encore gagné, même si nos troupes ont commencé à repousser les orques.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_02"); //Mais de petits groupes d'orques se rassemblent un peu partout dans l'espoir de disperser notre armée.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_03"); //Ils combattent sans foi et sans honneur, nous sommes donc sûrs de l'emporter à la fin.
};	

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_CanTeach		(C_INFO)
{ 
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  100;
	condition	 = 	DIA_Ingmar_CanTeach_Condition;
	information	 = 	DIA_Ingmar_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Pouvez-vous m'apprendre quelque chose ?";
};

func int DIA_Ingmar_CanTeach_Condition ()
{	
	if (Ingmar_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Ingmar_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_CanTeach_15_00"); //Pouvez-vous me faire profiter de votre enseignement ?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_01"); //Je peux vous apprendre comment vous muscler les bras afin de manier vos armes avec davantage d'efficacité.
			Ingmar_TeachSTR = TRUE;
			B_LogEntry (TOPIC_CityTeacher,"Le paladin Ingmar peut m'aider à devenir plus fort.");
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_02"); //Je n'enseigne qu'aux membres de notre ordre.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Teach		(C_INFO)
{
	npc		  	 = 	Pal_201_Ingmar;
	nr			 = 	6;
	condition	 = 	DIA_Ingmar_Teach_Condition;
	information	 = 	DIA_Ingmar_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux me muscler.";
};
func int DIA_Ingmar_Teach_Condition ()
{	
	if (Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Teach_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_Teach_15_00"); //Je souhaite devenir plus fort.
	
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
};
func void DIA_Ingmar_Teach_BACK()
{
	if (other.attribute [ATR_STRENGTH] >= T_MAX)
	{
		AI_Output (self, other, "DIA_Ingmar_Teach_06_00"); //Vous êtes aussi fort qu'un troll. Je n'ai plus rien à vous apprendre.
	};
	Info_ClearChoices (DIA_Ingmar_TEACH);
};
func void DIA_Ingmar_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_TEACH_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
	
};
func void DIA_Ingmar_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
	
}; 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Ingmar_KAP3_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP3_EXIT_Condition;
	information	= DIA_Ingmar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Ingmar_KAP4_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP4_EXIT_Condition;
	information	= DIA_Ingmar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

	
///////////////////////////////////////////////////////////////////////
//	Info Orkelite
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_ORKELITE		(C_INFO)
{
	npc		 = 	Pal_201_Ingmar;
	nr		 = 	40;
	condition	 = 	DIA_Ingmar_ORKELITE_Condition;
	information	 = 	DIA_Ingmar_ORKELITE_Info;

	description	 = 	"Les orques préparent une offensive majeure.";
};

func int DIA_Ingmar_ORKELITE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)) || (Hagen_SawOrcRing == TRUE))
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

func void DIA_Ingmar_ORKELITE_Info ()
{

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_00"); //Les orques préparent une offensive d'envergure.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_01"); //Vraiment ? Voilà qui est très intéressant. Et comment l'avez-vous appris ?

	if (TalkedTo_AntiPaladin == TRUE)
	{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_02"); //Je leur ai parlé.
	};

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_03"); //Certains de leurs chefs rôdent dans les environs.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_04"); //Hmm... voilà une stratégie qui me paraît bien différente de celles qu'ils emploient habituellement...

	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Vous feriez bien de trouver un moyen de vous en débarrasser.", DIA_Ingmar_ORKELITE_loswerden );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Que devrions-nous faire maintenant ?", DIA_Ingmar_ORKELITE_wasTun );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Qu'est-ce que cela signifie ?", DIA_Ingmar_ORKELITE_wieso );

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Ingmar a été très intéressé par le récit concernant les guerriers d'élite orques."); 

	MIS_KillOrkOberst = LOG_RUNNING;
};
func void DIA_Ingmar_ORKELITE_loswerden ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_loswerden_15_00"); //Vous avez intérêt à trouver le moyen de vous débarrasser d'eux.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_loswerden_06_01"); //Il suffirait pour cela que nous disposions de davantage de renseignements. Je vais envoyer quelqu'un en éclaireur dans les environs.
	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wieso_15_00"); //Qu'est-ce que cela signifie ?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_01"); //Si vous dites vrai, ça veut dire qu'ils espèrent nous affaiblir en envoyant leurs meilleurs guerriers nous attaquer de l'intérieur.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_02"); //En général, chaque horde d'orques est dirigée par un seul chef de guerre. Il est rare que l'on en voie plusieurs en même temps.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_03"); //S'ils agissent ainsi, ce n'est pas sans raison. Leurs chefs sont au cœur de leur stratégie guerrière. Le plus souvent ils sont entourés de leurs guerriers.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_04"); //Il est donc extrêmement difficile de les approcher sans avoir à affronter au moins une trentaine de guerriers.
	
	B_LogEntry (TOPIC_OrcElite,"Ingmar a mentionné quelque chose au sujet des seigneurs de guerre orques."); 
};

func void DIA_Ingmar_ORKELITE_wasTun ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wasTun_15_00"); //Que convient-il de faire ?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_01"); //Quand on les croise en nombre aussi réduit, il s'agit généralement d'un groupe de maraudeurs dirigé par le plus puissant d'entre eux.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_02"); //Le plus grand chef de guerre établit son quartier général dans une grotte d'où il envoie ses troupes au combat.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_03"); //Si nous pouvions nous emparer de lui, cela nous conférerait un avantage certain.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_04"); //Les chefs orques aiment se trouver à proximité de l'ennemi. Je vous conseille donc de chercher cette grotte non loin de la ville.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_05"); //Des orques ont été repérés aux alentours de la ferme de Lobart. Peut-être devriez-vous commencer là-bas...

	B_LogEntry (TOPIC_OrcElite,"Selon Ingmar, je devrais trouver le colonel orque dans une caverne, près de la ferme de Lobart. Ingmar veut que je le trouve et que je l'élimine."); 
	
	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
};


///////////////////////////////////////////////////////////////////////
//	Info Hauptquartier
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_HAUPTQUARTIER		(C_INFO)
{
	npc			 = 	Pal_201_Ingmar;
	nr			 = 	41;
	condition	 = 	DIA_Ingmar_HAUPTQUARTIER_Condition;
	information	 = 	DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent	 =  FALSE;
	description	 = 	"J'ai réussi à localiser le quartier général des orques.";
};

func int DIA_Ingmar_HAUPTQUARTIER_Condition ()
{
	if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst))
	&& (Npc_KnowsInfo(other, DIA_Ingmar_ORKELITE))
		{
				return TRUE;
		};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_HAUPTQUARTIER_15_00"); //J'ai trouvé le quartier général des orques et leur principal chef de guerre est mort.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_01"); //Voilà une excellente nouvelle ! Cela devrait les tenir occupés pour un temps.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_02"); //Pas mal. Si nous avions davantage de chevaliers de qualité, la bataille qui s'annonce ne serait qu'une formalité.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_03"); //Tenez. Prenez cet or et faites-en usage pour vous acheter un meilleur équipement.

	B_GivePlayerXP (XP_KilledOrkOberst);
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	MIS_KillOrkOberst = LOG_SUCCESS;
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Ingmar_KAP5_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP5_EXIT_Condition;
	information	= DIA_Ingmar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Ingmar_KAP6_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP6_EXIT_Condition;
	information	= DIA_Ingmar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ingmar_PICKPOCKET (C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 900;
	condition	= DIA_Ingmar_PICKPOCKET_Condition;
	information	= DIA_Ingmar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait presque impossible de voler son parchemin)";
};                       

FUNC INT DIA_Ingmar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (105 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Ingmar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ingmar_PICKPOCKET);
	Info_AddChoice		(DIA_Ingmar_PICKPOCKET, DIALOG_BACK 		,DIA_Ingmar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ingmar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ingmar_PICKPOCKET_DoIt);
};

func void DIA_Ingmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 105)
	{
		B_GiveInvItems (self, other, ITWr_Manowar, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Ingmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Ingmar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ingmar_PICKPOCKET);
};






































