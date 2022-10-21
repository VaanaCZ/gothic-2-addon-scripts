///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talbin_EXIT   (C_INFO)
{
	npc         = VLK_4130_Talbin;
	nr          = 999;
	condition   = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talbin_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Talbin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
var int Talbin_Runs;
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_HALLO		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 5;
	condition	 = 	DIA_Talbin_HALLO_Condition;
	information	 = 	DIA_Talbin_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Talbin_HALLO_Condition ()
{
	if (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Talbin_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_00"); //Halte ! Pas un pas de plus !
	AI_Output			(other, self, "DIA_Talbin_HALLO_15_01"); //D'accord, pas de problème.
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_02"); //Encore une brebis égarée, hein ? De prime abord, je vous ai pris pour un de ces sales types qui hantent les environs.
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_03"); //Mais je vois bien que je me suis trompé, vous avez bien trop l'air inoffensif.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachtIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASMACHTIHR		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 6;
	condition	 = 	DIA_Talbin_WASMACHTIHR_Condition;
	information	 = 	DIA_Talbin_WASMACHTIHR_Info;

	description	 = 	"Vous avez l'air d'un chasseur qui ne sait pas quoi faire de son temps.";
};

func int DIA_Talbin_WASMACHTIHR_Condition ()
{
	if (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WASMACHTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_15_00"); //Vous me faites penser à un chasseur ne sachant pas quoi faire de son temps.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_01"); //Ha, ha, ha ! Vous n'avez pas tort. Mais que voulez-vous que je fasse, vu que je ne peux pas franchir le col...
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_02"); //Alors, je reste là, à faire ce que je sais faire.

	if ((Npc_IsDead(Engrom)) == FALSE)
	{
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_03"); //Mais je suis désolé pour mon ami Engrom.
	};

	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_04"); //Approchez ! Venez vous réchauffer auprès de mon feu.
	
	Info_ClearChoices	(DIA_Talbin_WASMACHTIHR);
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, DIALOG_BACK, DIA_Talbin_WASMACHTIHR_back );
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, "Ça semble aller pour vous pourtant.", DIA_Talbin_WASMACHTIHR_gut );
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, "Etes-vous un ancien prisonnier de la Barrière ?", DIA_Talbin_WASMACHTIHR_strf );

};
func void DIA_Talbin_WASMACHTIHR_back ()
{
	Info_ClearChoices	(DIA_Talbin_WASMACHTIHR);
};

func void DIA_Talbin_WASMACHTIHR_strf ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_00"); //Vous êtes un ancien prisonnier de la Barrière ?
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_01"); //Non, non ! Qu'allez-vous pensez là ? Je suis venu ici volontairement, afin de m'enrichir.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_02"); //On m'a dit qu'il n'y avait pas de meilleur terrain pour la chasse.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_03"); //Parfait pour se remplir les poches, si vous voyez ce que je veux dire...
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_04"); //Sauf que, depuis que les orques sont là, il n'y a rien à espérer, sauf des coups si on approche trop d'eux.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_05"); //Quand je pense que je me suis laissé embobiner par ces crétins...
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_06"); //Hé ! Mais je les connais, ces idiots !
};

func void DIA_Talbin_WASMACHTIHR_gut ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_gut_15_00"); //Vous semblez pourtant vous en sortir...
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_01"); //Bah, j'imagine que je n'ai pas à me plaindre. Malgré ces satanés orques, les environs de la rivière sont moins dangereux que le reste de la région.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_02"); //C'est à croire qu'ils n'aiment pas approcher de l'eau. Mais bon, il doit s'agir d'une coïncidence.
};


///////////////////////////////////////////////////////////////////////
//	Info SorryForEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_SORRYFORENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 7;
	condition	 = 	DIA_Talbin_SORRYFORENGROM_Condition;
	information	 = 	DIA_Talbin_SORRYFORENGROM_Info;

	description	 = 	"Pourquoi êtes-vous désolé pour Engrom ?";
};

func int DIA_Talbin_SORRYFORENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& ((Npc_IsDead(Engrom)) == FALSE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Kapitel <= 3)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_SORRYFORENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_SORRYFORENGROM_15_00"); //Pourquoi êtes-vous désolé pour Engrom ?
	AI_Output			(self, other, "DIA_Talbin_SORRYFORENGROM_07_01"); //Parce qu'il m'a suivi sans poser de questions.
	AI_Output			(self, other, "DIA_Talbin_SORRYFORENGROM_07_02"); //Et maintenant, nous sommes dans de beaux draps. Comme quoi la cupidité ne paye pas.
};


///////////////////////////////////////////////////////////////////////
//	Info WasJagdIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASJAGDIHR		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 8;
	condition	 = 	DIA_Talbin_WASJAGDIHR_Condition;
	information	 = 	DIA_Talbin_WASJAGDIHR_Info;

	description	 = 	"Que chassez-vous près de la rivière ?";
};

func int DIA_Talbin_WASJAGDIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WASJAGDIHR_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WASJAGDIHR_15_00"); //Qu'est-ce que vous chassez à proximité de la rivière ?
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_01"); //Quelle question ! Promenez-vous un peu dans le coin et vous verrez par vous-même. Des guetteurs, bien sûr.
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_02"); //Ces sales bêtes ne sont pas faciles à attraper, mais leur goût n'en est que meilleur.
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_03"); //De temps en temps, il m'arrive de tomber sur un charognard, et je ne dis pas non.
};

///////////////////////////////////////////////////////////////////////
//	Info EngromAngry
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_ENGROMANGRY		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 9;
	condition	 = 	DIA_Talbin_ENGROMANGRY_Condition;
	information	 = 	DIA_Talbin_ENGROMANGRY_Info;

	description	 = 	"Je crois que votre copain est un peu tendu !";
};

func int DIA_Talbin_ENGROMANGRY_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
			&& (Npc_KnowsInfo(other, DIA_Talbin_SORRYFORENGROM))
			&& ((Npc_IsDead(Engrom)) == FALSE)
			&& (Talbin_FollowsThroughPass == 0)
			&& (Kapitel <= 3)
			&& (Talbin_Runs == FALSE)
		)
		{
				return TRUE;
		};
};

func void DIA_Talbin_ENGROMANGRY_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_ENGROMANGRY_15_00"); //J'ai l'impression que votre copain est un peu stressé.
	AI_Output			(self, other, "DIA_Talbin_ENGROMANGRY_07_01"); //Laissez tomber, d'accord ? Ne le provoquez pas davantage ou il va finir par me faire la peau. Je ne peux rien au fait que nous soyons ici.
	AI_Output			(self, other, "DIA_Talbin_ENGROMANGRY_07_02"); //Un jour, je me ferai pardonner !
};


// ************************************************************
// 			  			  ASK TEACHER 
// ************************************************************

INSTANCE DIA_Talbin_AskTeacher (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr          = 10;
	condition	= DIA_Talbin_AskTeacher_Condition;
	information	= DIA_Talbin_AskTeacher_Info;

	description = "Pouvez-vous m'apprendre des choses sur la chasse ?";
};                       

FUNC INT DIA_Talbin_AskTeacher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASJAGDIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
	{
				return TRUE;
		};
};

FUNC VOID DIA_Talbin_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00"); //Pouvez-vous m'apprendre l'art de la chasse ?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01"); //Je vois. Ça vous plaît, maintenant, hein ? D'accord, mais ce ne sera pas gratuit.
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02"); //Que voulez-vous en échange ?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03"); //Est-ce que vous auriez autre chose à manger que de la viande de guetteur ? Un peu de fromage, peut-être ? Oh, oui, bonne idée. J'en meurs d'envie.
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04"); //Je verrai ce que je peux faire.
		
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Talbin peut m'apprendre à éviscérer les animaux.");
};


// ************************************************************
// 			  			  PAY TEACHER 
// ************************************************************

INSTANCE DIA_Talbin_PayTeacher (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr          = 11;
	condition	= DIA_Talbin_PayTeacher_Condition;
	information	= DIA_Talbin_PayTeacher_Info;
	permanent	= TRUE;
	description = "Voici votre fromage. Allez-vous m'apprendre ce que je veux maintenant ?";
};                       

var int DIA_Talbin_PayTeacher_noPerm;

FUNC INT DIA_Talbin_PayTeacher_Condition()
{
	if 	(
		(Npc_KnowsInfo (other, DIA_Talbin_AskTeacher))
		&& (DIA_Talbin_PayTeacher_noPerm == FALSE)
		&& (Talbin_FollowsThroughPass == 0)
		&& (Talbin_Runs == FALSE)
		)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Talbin_PayTeacher_Info()
{
	if (B_GiveInvItems (other, self, itfo_Cheese, 1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00"); //Voici votre fromage. Et maintenant, vous voulez bien me faire profiter de votre enseignement ?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01"); //C'est vrai, vous en avez ? Oh, la vache, ça fait une éternité que je n'en ai pas mangé. Merci. Euh, et qu'est-ce que... oh, oui, bien sûr...
		Talbin_TeachAnimalTrophy = TRUE;
		DIA_Talbin_PayTeacher_noPerm = TRUE;
	}
	else	//SC hat keinen Käse
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02"); //Je n'ai pas de fromage pour le moment.
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03"); //Ç'aurait été trop beau pour être vrai. Prévenez-moi quand vous en aurez.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_TEACHHUNTING		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 12;
	condition	 = 	DIA_Talbin_TEACHHUNTING_Condition;
	information	 = 	DIA_Talbin_TEACHHUNTING_Info;
	permanent	= TRUE;
	description	 = 	"Que pouvez-vous m'enseigner ?";
};

func int DIA_Talbin_TEACHHUNTING_Condition ()
{
	if (Talbin_TeachAnimalTrophy == TRUE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_TEACHHUNTING_15_00"); //Que pouvez-vous m'apprendre ?
		if 	(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			)
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_07_01"); //Qu'est-ce que vous voulez savoir ?
		

			Info_AddChoice		(DIA_Talbin_TEACHHUNTING, DIALOG_BACK, DIA_Talbin_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Retirer les griffes",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Talbin_TEACHHUNTING_Claws);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Ecorchage",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Talbin_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Corne de bête des ombres",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Talbin_TEACHHUNTING_ShadowHorn);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Retirer le cœur",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Talbin_TEACHHUNTING_Heart);
			};

		}
		else
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_07_02"); //Désolé de vous décevoir, mais vous savez déjà tout ce que j'aurais pu vous apprendre. Merci quand même pour le fromage !
		};
};

func void DIA_Talbin_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

// ------ Klauen hacken ------
func void DIA_Talbin_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_00"); //Récupérer les griffes des animaux est simple : il suffit d'attraper la griffe à l'articulation et de l'appuyer par terre.
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_01"); //Puis, sortez votre couteau et servez-vous en pour découper les griffes.
		};

		Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Talbin_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_00"); //Le meilleur moyen de dépecer un guetteur consiste à faire une longue entaille sur toute la longueur de son ventre.
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_01"); //Cela fait, tirez la peau au niveau des pattes arrière et elle viendra d'un seul coup.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Shadowhorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00"); //Les cornes de bêtes des ombres sont très dures et servent à la fabrication de statues ou d'outils.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};
func void DIA_Talbin_TEACHHUNTING_Heart ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Heart_07_00"); //Un cœur de créature magique est une chose très rare et il est extrêmement difficile de s'en procurer. Méfiez-vous si vous essayez, surtout avec un golem.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
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

INSTANCE DIA_Talbin_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP3_EXIT_Condition;
	information	= DIA_Talbin_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP3_EXIT_Info()
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

INSTANCE DIA_Talbin_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP4_EXIT_Condition;
	information	= DIA_Talbin_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Kap4_Wasneues
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASNEUES		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 13;
	condition	 = 	DIA_Talbin_KAP4_WASNEUES_Condition;
	information	 = 	DIA_Talbin_KAP4_WASNEUES_Info;

	description  =  "Avez-vous vu quelqu'un venir ici ?";
};

func int DIA_Talbin_KAP4_WASNEUES_Condition ()
{
	if 	(Kapitel >= 4)
		&& (Talbin_FollowsThroughPass == 0)
		&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_KAP4_WASNEUES_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_KAP4_WASNEUES_15_00"); //Avez-vous vu qui que ce soit venir par ici ?
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASNEUES_07_01"); //Oui. Il y a des individus bizarres par ici. Ils se pavanent dans leur belle armure et se comportent comme s'ils étaient les maîtres du monde.
};

///////////////////////////////////////////////////////////////////////
//	Info WaswolltenDJG
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASWOLLTENDJG		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 14;
	condition	 = 	DIA_Talbin_KAP4_WASWOLLTENDJG_Condition;
	information	 = 	DIA_Talbin_KAP4_WASWOLLTENDJG_Info;

	description	 = 	"Que voulaient ces 'drôles de types' ?";
};

func int DIA_Talbin_KAP4_WASWOLLTENDJG_Condition ()
{
if 	(Npc_KnowsInfo(other, DIA_Talbin_KAP4_WASNEUES))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASWOLLTENDJG_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_KAP4_WASWOLLTENDJG_15_00"); //Qu'est-ce qu'ils voulaient ?
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_01"); //Ils m'ont demandé si j'avais des provisions et de l'équipement à leur fournir... alors que j'en ai à peine assez pour moi !
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_02"); //Ils n'arrêtaient pas de répéter qu'ils venaient tuer des dragons. J'ignore d'où ils viennent, mais ils n'inspirent guère confiance.

	if (Kapitel == 4)
	{
		B_LogEntry (TOPIC_Dragonhunter,"Des chasseurs de dragons ont fait halte chez Talbin le chasseur."); 
	};
};



///////////////////////////////////////////////////////////////////////
//	Info woEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_WOENGROM_Condition;
	information	 = 	DIA_Talbin_WOENGROM_Info;

	description	 = 	"Etes-vous seul ?";
};

func int DIA_Talbin_WOENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (EngromIsGone == TRUE)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WOENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WOENGROM_15_00"); //Vous êtes seul, pour le moment ?
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_01"); //Oui. Mon ami Engrom a décidé de partir. Hier, il m'a dit qu'il venait d'avoir une vision et qu'il avait entendu quelqu'un lui parler à mi-voix.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_02"); //Moi, je n'ai rien entendu du tout. Je me suis dit qu'il avait perdu la boule...
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_03"); //Et c'est là que je me suis aperçu qu'il avait disparu. J'ignore où il est allé.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_04"); //Si jamais vous croisez Engrom, rappelez-lui qu'il me doit encore une peau de guetteur, le saligaud.

	if (Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
		{
	AI_Output			(other, self, "DIA_Talbin_WOENGROM_15_05"); //J'avais pourtant l'impression qu'il ne voulait pas bouger d'ici tant qu'il y avait des orques dans le secteur...
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_06"); //Je vous l'ai dit, il y a quelque chose qui ne tourne pas rond chez lui.
		};
	MIS_Tabin_LookForEngrom = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FoundEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_FOUNDENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	16;
	condition	 = 	DIA_Talbin_FOUNDENGROM_Condition;
	information	 = 	DIA_Talbin_FOUNDENGROM_Info;

	description	 = 	"J'ai trouvé votre copain Engrom.";
};

func int DIA_Talbin_FOUNDENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WOENGROM))
	&& ((NpcObsessedByDMT_Engrom == TRUE)||(Npc_HasItems (other,ItAt_TalbinsLurkerSkin)) ) 
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_FOUNDENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_00"); //J'ai retrouvé votre ami Engrom.
	AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_01"); //Ah oui ? Où est-il ?


	if (Npc_IsDead(Engrom))
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_02"); //Il est mort.
	}
	else	
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_03"); //Je ne pense pas que vous le reverrez un jour.
	};

	if (B_GiveInvItems (other, self, ItAt_TalbinsLurkerSkin,1))
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_04"); //Tenez, j'ai trouvé cette peau de guetteur sur lui.
	};	

	if (hero.guild ==GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_05"); //Les Traqueurs ont pris possession de lui.
		AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_06"); //Les Traqueurs ? Qui c'est ça ?
		AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_07"); //Des serviteurs de l'au-delà. Ce sont eux les vrais maîtres des orques.
	};	

	AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_08"); //Par Innos ! Il faut que je file d'ici même si je dois y laisser la vie. C'est maintenant ou jamais !
	AI_StopProcessInfos (self);	

	Log_CreateTopic (TOPIC_Talbin_Runs, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Talbin_Runs, LOG_RUNNING);
	B_LogEntry (TOPIC_Talbin_Runs,"Talbin, le chasseur de la Vallée des mines, a franchi le col comme s'il avait un essaim de mouches sanguines à ses trousses. Je pense qu'il se rend à Khorinis."); 

	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"FleePass");
	Wld_InsertNpc	(Snapper, "START");
	Talbin_Runs = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOHIN		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	17;
	condition	 = 	DIA_Talbin_WOHIN_Condition;
	information	 = 	DIA_Talbin_WOHIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Où irez-vous ?";
};

func int DIA_Talbin_WOHIN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_FOUNDENGROM))
	&& (Talbin_FollowsThroughPass == 0)
		
		{
				return TRUE;
		};
};

func void DIA_Talbin_WOHIN_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_15_00"); //Où comptez-vous aller ?

		if (Npc_GetDistToWP(self,"START")<1000) 
		{
			AI_Output			(self, other, "DIA_Talbin_WOHIN_07_01"); //Faites-moi franchir le col, je vous en prie !
		
			Info_ClearChoices	(DIA_Talbin_WOHIN);
			Info_AddChoice	(DIA_Talbin_WOHIN, "Je n'ai pas de temps à vous consacrer.", DIA_Talbin_WOHIN_ );
			Info_AddChoice	(DIA_Talbin_WOHIN, "Allez-y et traversez.", DIA_Talbin_WOHIN_durch );
			Info_AddChoice	(DIA_Talbin_WOHIN, "Très bien.", DIA_Talbin_WOHIN_ok );
		}
		else
		{
		AI_Output			(self, other, "DIA_Talbin_WOHIN_07_02"); //Il faut absolument que je m'en aille et que je franchisse le col ! Hors de mon chemin !
		AI_StopProcessInfos (self);
		};


};
func void DIA_Talbin_WOHIN_ok ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_ok_15_00"); //Très bien.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_ok_07_01"); //Merci. Allez-y, je vous suis.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"IntoPass");
	Talbin_FollowsThroughPass = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;	//Joly: eh nur so lange, bis der SC durch den Levelchange geht!

};

func void DIA_Talbin_WOHIN_durch ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_durch_15_00"); //Avancez et vous franchirez le col.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_durch_07_01"); //Il fait tellement noir ici qu'il est hors de question que j'y aille tout seul.

};

func void DIA_Talbin_WOHIN_ ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_schwein_15_00"); //Je n'ai pas de temps à perdre avec vous.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_schwein_07_01"); //Vous préférez me laisser mourir ici ? Vous grillerez en enfer pour ça !
	Talbin_FollowsThroughPass = LOG_OBSOLETE;
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_VERSCHWINDE		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_VERSCHWINDE_Condition;
	information	 = 	DIA_Talbin_VERSCHWINDE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Hé !";
};

func int DIA_Talbin_VERSCHWINDE_Condition ()
{
	if (Talbin_FollowsThroughPass == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_VERSCHWINDE_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_VERSCHWINDE_15_00"); //Hé !
	AI_Output			(self, other, "DIA_Talbin_VERSCHWINDE_07_01"); //Tirez-vous ! Je suis capable de me débrouiller sans vous, sale vermine !
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Talbin_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP5_EXIT_Condition;
	information	= DIA_Talbin_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP5_EXIT_Info()
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


INSTANCE DIA_Talbin_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP6_EXIT_Condition;
	information	= DIA_Talbin_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Talbin_PICKPOCKET (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 900;
	condition	= DIA_Talbin_PICKPOCKET_Condition;
	information	= DIA_Talbin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Talbin_PICKPOCKET_Condition()
{
	C_Beklauen (40, 25);
};
 
FUNC VOID DIA_Talbin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Talbin_PICKPOCKET);
	Info_AddChoice		(DIA_Talbin_PICKPOCKET, DIALOG_BACK 		,DIA_Talbin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Talbin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Talbin_PICKPOCKET_DoIt);
};

func void DIA_Talbin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Talbin_PICKPOCKET);
};
	
func void DIA_Talbin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Talbin_PICKPOCKET);
};


