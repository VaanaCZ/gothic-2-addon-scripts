
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

INSTANCE DIA_Jorgen_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP3_EXIT_Condition;
	information	= DIA_Jorgen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Jorgen_PICKPOCKET (C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 900;
	condition	= DIA_Jorgen_PICKPOCKET_Condition;
	information	= DIA_Jorgen_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jorgen_PICKPOCKET_Condition()
{
	C_Beklauen (59, 70);
};
 
FUNC VOID DIA_Jorgen_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jorgen_PICKPOCKET);
	Info_AddChoice		(DIA_Jorgen_PICKPOCKET, DIALOG_BACK 		,DIA_Jorgen_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jorgen_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jorgen_PICKPOCKET_DoIt);
};

func void DIA_Jorgen_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jorgen_PICKPOCKET);
};
	
func void DIA_Jorgen_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jorgen_PICKPOCKET);
};
//*********************************************************************
//	Info Hallo 
//*********************************************************************
INSTANCE DIA_Jorgen_Hallo   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 4;
	condition   = DIA_Jorgen_Hallo_Condition;
	information = DIA_Jorgen_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_Jorgen_Hallo_Condition()
{
	if (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Jorgen_Hallo_07_00"); //Eh ! Vous !

	if ((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_01"); //Je vois que vous faites partie du monastère.
		AI_Output (other,self ,"DIA_Jorgen_Hallo_15_02"); //Oui, pourquoi ?
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_03"); //Auriez-vous besoin d'un employé là-bas ?
	}
	else
	{
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_04"); //Hé, vous ! Vous êtes déjà allé au monastère ?
		AI_Output (other,self ,"DIA_Jorgen_Hallo_15_05"); //Peut-être bien. Pourquoi ?
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_06"); //Vous savez si les magiciens acceptent encore du monde ?
	};

	AI_Output (self ,other,"DIA_Jorgen_Hallo_07_07"); //Je ne sais plus vers où me tourner.
}; 

//*********************************************************************
//	Hast du einen Novizen hier vorbeirennen gesehen? 
//*********************************************************************
INSTANCE DIA_Jorgen_Novice   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 6;
	condition   = DIA_Jorgen_Novice_Condition;
	information = DIA_Jorgen_Novice_Info;
	permanent   = FALSE;
	description	= "Avez-vous vu passer un novice ?";
};

FUNC INT DIA_Jorgen_Novice_Condition()
{
	IF (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Novice_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Novice_15_00"); //Avez-vous vu passer un novice ?
	AI_Output (self ,other,"DIA_Jorgen_Novice_07_01"); //Oui, il est parti par là.
	AI_PointAt	(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output (self,other,"DIA_Jorgen_Novice_07_02"); //Il a sauté du pont et s'est mis à nager comme s'il avait un requin aux trousses.
	AI_StopPointAt(self);
}; 

//*********************************************************************
//	Wenn du ins Kloster willst, solltest du mir Milten reden. 
//*********************************************************************
INSTANCE DIA_Jorgen_Milten   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 5;
	condition   = DIA_Jorgen_Milten_Condition;
	information = DIA_Jorgen_Milten_Info;
	permanent   = FALSE;
	description	= "Si vous allez au monastère, vous devriez parler à Milten...";
};

FUNC INT DIA_Jorgen_Milten_Condition()
{
	if (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
	&& (MIS_OLDWORLD == LOG_SUCCESS)
	&& (MiltenNW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
			return TRUE;
	};
};

FUNC VOID DIA_Jorgen_Milten_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Milten_15_00"); //Si vous vous dirigez vers le monastère, allez voir Milten. Il devrait pouvoir vous aider.
	AI_Output (self ,other,"DIA_Jorgen_Milten_07_01"); //Vous croyez qu'ils pourraient m'accepter ?
	AI_Output (other,self ,"DIA_Jorgen_Milten_15_02"); //Peut-être... Encore qu'en vous voyant, j'ai du mal à vous imaginer en robe de novice...
	AI_Output (self ,other,"DIA_Jorgen_Milten_07_03"); //Assez d'inepties ! Je me moque bien de la robe d'initié ! Tout ce qui m'intéresse, c'est la tambouille. C'est soit ça, soit je vais me retrouver à manger l'écorce des arbres.
}; 

//*********************************************************************
//	DIA_Jorgen_Home
//*********************************************************************

INSTANCE DIA_Jorgen_Home   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 7;
	condition   = DIA_Jorgen_Home_Condition;
	information = DIA_Jorgen_Home_Info;

	description	= "D'où venez-vous ?";
};

FUNC INT DIA_Jorgen_Home_Condition()
{
	if (Kapitel >= 3) 
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Home_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Home_15_00"); //D'où venez-vous ?
	AI_Output (self ,other,"DIA_Jorgen_Home_07_01"); //J'étais autrefois capitaine d'un grand baleinier, mon garçon. La mer, c'est chez moi.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_02"); //Mais ma Magdalène a été coulée par les pirates il y a quelques mois de ça et depuis, je suis coincé ici.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_03"); //Je ne cherche qu'une chose, retourner en mer. Mais depuis que je suis là, aucun bateau n'est venu jeter l'ancre dans ce maudit port.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_04"); //En fait, le seul navire amarré à Khorinis est cette satanée galère de guerre du roi et elle n'accepte personne à son bord.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_05"); //Que voulez-vous que je fasse ? Il n'y a pas de travail pour moi en ville. Ce n'est pas faute de chercher pourtant !
	
}; 

//*********************************************************************
//	DIA_Jorgen_BeCarefull
//*********************************************************************
INSTANCE DIA_Jorgen_BeCarefull   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 8;
	condition   = DIA_Jorgen_BeCarefull_Condition;
	information = DIA_Jorgen_BeCarefull_Info;
	permanent   = TRUE;
	description	= "Vous feriez bien de quitter la route.";
};

FUNC INT DIA_Jorgen_BeCarefull_Condition()
{
	if (Kapitel == 3) 
		&& (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_BeCarefull_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_BeCarefull_15_00"); //Vous feriez mieux de ne pas suivre la route.
	AI_Output (self ,other,"DIA_Jorgen_BeCarefull_07_01"); //Ne vous en faites pas, je me suis rendu compte que les environs étaient devenus bien plus dangereux au cours des derniers jours.
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

INSTANCE DIA_Jorgen_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP4_EXIT_Condition;
	information	= DIA_Jorgen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NeuHier
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_NEUHIER		(C_INFO)
{	
	npc		 	= 	VLK_4250_Jorgen;
	nr		 	= 	41;
	condition	= 	DIA_Jorgen_NEUHIER_Condition;
	information	= 	DIA_Jorgen_NEUHIER_Info;

	description	= 	"Comment ça se passe au monastère ?";
};

func int DIA_Jorgen_NEUHIER_Condition ()
{
	if (Kapitel >= 4)	
	{
		return TRUE;
	};
};

func void DIA_Jorgen_NEUHIER_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_NEUHIER_15_00"); //Comment ça se passe au monastère ?
	
	AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_01"); //Je suis en train de devenir fou ici !

	if (Npc_KnowsInfo(other, DIA_Jorgen_Milten))
	{
		AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_02"); //Mais merci du conseil. Milten a en effet pu m'aider à trouver une place ici.
		B_GivePlayerXP (XP_Ambient);
	};

	if (hero.guild != GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_03"); //Je me sens vraiment stupide au milieu de ces pères la vertu.
	};

	AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_04"); //Mais qu'y faire ? Je préfère mille fois faire ce que les novices me disent plutôt que mourir de faim en ville.
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM4		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	400;
	condition	 = 	DIA_Jorgen_PERM4_Condition;
	information	 = 	DIA_Jorgen_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Je pense que vous irez bien.";
};

func int DIA_Jorgen_PERM4_Condition ()
{
	if (Kapitel >= 4)	
		&&	(Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&	(Npc_KnowsInfo(other, DIA_Jorgen_NEUHIER))
		&& 	(JorgenIsCaptain == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Jorgen_PERM4_OneTime;
func void DIA_Jorgen_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_PERM4_15_00"); //Je pense que vous vous en tirerez.
	if (DIA_Jorgen_PERM4_OneTime == FALSE)
	&& (hero.guild != GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Jorgen_PERM4_07_01"); //Vous vous rendez compte qu'ils veulent que j'arrache les mauvaises herbes de leur jardin ? Si ça continue comme ça, je vais devenir maboule !
		DIA_Jorgen_PERM4_OneTime = TRUE;
	};
	
	AI_Output			(self, other, "DIA_Jorgen_PERM4_07_02"); //Ce dont j'ai besoin, c'est de planches qui grincent et qui tanguent sous mes pieds.
};

//#####################################################################
//##
//##
//##					KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Jorgen_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP5_EXIT_Condition;
	information	= DIA_Jorgen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	51;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Peut-être pourrai-je vous proposer un poste de capitaine.";
};

func int DIA_Jorgen_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_PyrokarClearDemonTower != LOG_SUCCESS)
		&& (Npc_KnowsInfo(other, DIA_Jorgen_Home))

		{
				return TRUE;
		};
};
var int DIA_Jorgen_BEMYCAPTAIN_OneTime;
func void DIA_Jorgen_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN_15_00"); //Je pourrais peut-être vous proposer un poste de capitaine de bateau...
	if (DIA_Jorgen_BEMYCAPTAIN_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_01"); //Vous ne vous payez pas ma tête, là ? Parce que si vous dites vrai, je suis on ne peut plus partant !
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_02"); //Mais, euh... Il y a juste un léger problème... Je crois bien que j'ai vidé la moitié du garde-manger des novices à moi tout seul...
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_03"); //Ces types sont fous de rage et ça m'étonnerait fort que le magicien en chef me laisse partir comme ça...
		DIA_Jorgen_BEMYCAPTAIN_OneTime = TRUE;
	};
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_04"); //Je regrette, mais je dois continuer de travailler pour Pyrokar le temps de payer ma dette.
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                                                                                                                                            
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                                                                                                                                          
    B_LogEntry (TOPIC_Captain,"Jorgen veut bien être mon capitaine mais je dois d'abord m'acquitter de ses dettes au monastère.");

};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	52;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN2_Info;

	description	 = 	"Je me suis occupé de votre note.";
};

func int DIA_Jorgen_BEMYCAPTAIN2_Condition ()
{
	if (MIS_PyrokarClearDemonTower == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_BEMYCAPTAIN2_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_00"); //J'ai réglé votre note. Vous êtes libre.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_01"); //C'est vrai ? Comment avez-vous fait ?
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_02"); //Vous n'aimeriez pas le savoir.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_03"); //Bah, ça ne m'intéresse pas vraiment, c'est vrai. Mais merci mille fois !

	if (SCGotCaptain == FALSE)
	{
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_04"); //Et votre offre tient toujours ? Vous avez encore besoin de moi ?
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_05"); //Super ! Fichons vite le camp d'ici !
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"RausAusKloster");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	53;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN3_Info;

	description	 = 	"Soyez mon capitaine.";
};

func int DIA_Jorgen_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_00"); //Je vous veux comme capitaine.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_01"); //C'est un honneur pour moi, mais est-ce que vous avez au moins un bateau et un équipage ?
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_02"); //A mon avis, il nous faut au moins cinq hommes.
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_03"); //Bien. Je vais voir ce que je peux faire. Attendez-moi au port.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_04"); //A vos ordres, monsieur.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JorgenIsCaptain = TRUE;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	59;
	condition	 = 	DIA_Jorgen_LOSFAHREN_Condition;
	information	 = 	DIA_Jorgen_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Etes-vous prêt à me conduire sur l'île ?";
};

func int DIA_Jorgen_LOSFAHREN_Condition ()
{
	if (JorgenIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_LOSFAHREN_15_00"); //Etes-vous prêt à m'amener à l'île ?

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_01"); //Certainement ! Donnez-moi cette carte.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_02"); //Parfait. Et maintenant, il ne reste plus qu'à lever l'ancre.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_03"); //Vérifiez votre équipement. Une fois en mer, pas question de faire demi-tour.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_04"); //Une fois cela fait, allez vous coucher. Votre lit a été préparé dans la cabine du capitaine. Bonne nuit.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_05"); //Il vous faut un bateau, un équipage constitué d'au minimum cinq hommes, et une carte marine qui me permettra de naviguer.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_06"); //Nous ne lèverons pas l'ancre tant que nous n'aurons pas tout le nécessaire.
	AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	59;
	condition	 = 	DIA_Jorgen_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jorgen_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Comment allez-vous ?";
};

func int DIA_Jorgen_PERM5_NOTCAPTAIN_Condition ()
{
	if	(Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JorgenIsCaptain == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven;
func void DIA_Jorgen_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_PERM5_NOTCAPTAIN_15_00"); //Comment allez-vous ?

	if 	(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06")<1000)  
	{
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_01"); //Bien. On ne vit pas mal ici.
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_02"); //Evidemment, les tâches qu'on me confie restent stupides, comme le fait de garder les moutons, mais elles sont moins abrutissantes que celles qui m'étaient réservées au monastère.

		if (DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven == FALSE)
		{
		B_GivePlayerXP (XP_Ambient);
		DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven = TRUE;
		};
	AI_StopProcessInfos (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_03"); //Il va me falloir trouver un nouvel endroit où vivre. Je verrai bien où les vents de l'existence me pousseront la prochaine fois.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"RausAusKloster");
	};
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


INSTANCE DIA_Jorgen_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP6_EXIT_Condition;
	information	= DIA_Jorgen_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};












































