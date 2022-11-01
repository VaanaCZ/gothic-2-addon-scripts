///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP1_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello 		(C_INFO)
{
	npc			= KDF_503_Karras;
	nr          = 1;
	condition	= DIA_Karras_Hello_Condition;
	information	= DIA_Karras_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
func int DIA_Karras_Hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Karras_Hello_Info ()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //Que puis-je faire pour vous, novice ?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Que puis-je faire pour vous, mon frère ?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Les honorables combattants d'Innos restent rarement à vagabonder dans ces salles.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Que puis-je pour vous ?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(soupçonneux) Que faites-vous ici ?
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Mission_Condition;
	information	 = 	DIA_Karras_Mission_Info;
	permanent    =  FALSE;
	description	 = 	"Je suis venu lire les textes sacrés.";
};
func int DIA_Karras_Mission_Condition ()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Mission_Info ()
{
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //Je suis venu consulter les saintes écritures.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Je comprends. Si vous pouvez trouver un peu de temps malgré vos études, venez me voir.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //Il y a une autre affaire pour laquelle je pourrais avoir besoin d'un novice discret.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Aufgabe_Condition;
	information	 = 	DIA_Karras_Aufgabe_Info;
	permanent    =  FALSE;
	description	 = 	"Vous avez une mission pour moi ?";
};
func int DIA_Karras_Aufgabe_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Karras_Mission)
	{
		return TRUE;
	};
};
func void DIA_Karras_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //Vous avez une tâche à me confier ?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Oui. Cela concerne ce fou d'Ignaz. Il vit à Khorinis et étudie les breuvages magiques ainsi que les baumes de guérison. Il se consacre aussi aux sortilèges.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //Et c'est ce qui m'inquiète. Je me demande si sa magie est du goût d'Innos.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Pour le savoir, j'ai besoin de quelques-uns de ses parchemins de sort.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Je veux que vous alliez en ville et que vous me rapportiez trois de ses parchemins.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Mais pas un mot à quiconque, est-ce clair ?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Bien sûr.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Voici 150 pièces d'or. Cela devrait suffire à couvrir vos dépenses.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Maître Karras m'a envoyé en ville. Il veut que je lui trouve trois parchemins de sort qu'Ignaz fabrique et vend.");

	B_GiveInvItems (self, other, ItMi_Gold,150);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Success_Condition;
	information	 = 	DIA_Karras_Success_Info;
	permanent    =  FALSE;
	description	 = 	"Voici les parchemins de sort que vous vouliez.";
};
func int DIA_Karras_Success_Condition ()
{	
	if (MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems (other, ItSc_Charm) >= 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_Success_Info ()
{
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Voici les parchemins de sort que vous vouliez.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Bien joué, mon jeune ami.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //Mais il est désormais temps que vous vous consacriez à vos études.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Et prenez ce parchemin en récompense.
	
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP (XP_KarrasCharm);
	B_GiveInvItems (other, self, ItSc_Charm,3);
	B_GiveInvItems (self, other, ItSc_SumWolf,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Trade_Condition;
	information	 = 	DIA_Karras_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Montrez-moi vos marchandises.";
	trade		 =  TRUE; 
};
func int DIA_Karras_Trade_Condition ()
{	
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Karras_Trade_15_00"); //Montrez-moi vos marchandises.
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_JOB_Condition;
	information	 = 	DIA_Karras_JOB_Info;
	permanent    =  FALSE;
	description	 = 	"En quoi consiste exactement votre travail ?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //En quoi consiste exactement votre travail ?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Il est de ma responsabilité d'entraîner les mages dans l'art des manifestations dimensionnelles.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Qu'est-ce que cela signifie ?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //Je leur apprends à convoquer des créatures ou des entités d'autres dimensions.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //On appelle généralement cela la convocation bien que ce mot ne permette pas de définir cet art.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //De plus, je possède quelques parchemins de sort très intéressants que Gorax n'a pas.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Mais je les réserve exclusivement aux membres de l'ordre.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Maître Karras peut me fournir des parchemins de sort au monastère mais pour cela je dois être Magicien du feu.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr 			 =  10;
	condition	 = 	DIA_Karras_TEACH_Condition;
	information	 = 	DIA_Karras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Apprenez-moi (Création de runes).";
};

func int DIA_Karras_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Karras_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //Apprenez-moi.
	
		Info_ClearChoices   (DIA_Karras_TEACH);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
		{
			Info_AddChoice 		(DIA_Karras_TEACH,B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)),DIA_Karras_TEACH_SUMGOBL);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
		{
			Info_AddChoice	    (DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Karras_TEACHSummonWolf);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Karras_TEACH_SummonSkeleton);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Karras_TEACH_SummonGolem);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Karras_TEACH_SummonDemon);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};
		if 	(abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //Pour le moment, je ne peux rien vous apprendre.
		}
		else
		{
			Info_AddChoice 		(DIA_Karras_TEACH,DIALOG_BACK,DIA_Karras_TEACH_BACK);
		};

};
FUNC VOID DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices   (DIA_Karras_TEACH);
};
FUNC VOID DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};
FUNC VOID DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);	
};
FUNC VOID DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE4_Condition;
	information	 = 	DIA_Karras_CIRCLE4_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux apprendre le quatrième Cercle de magie.";
};
func int DIA_Karras_CIRCLE4_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE4_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Je veux apprendre le 4ème Cercle de magie.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Bien. Tous les signes se sont manifestés. Accédez désormais au 4ème Cercle pour que le pouvoir de cette magie pénètre en vous.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Vous avez parcouru un long chemin et la lumière d'Innos continuera à illuminer votre voie.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Ce n'est pas encore terminé.
	};
};
/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE5_Condition;
	information	 = 	DIA_Karras_CIRCLE5_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux apprendre le cinquième Cercle de magie.";
};
func int DIA_Karras_CIRCLE5_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE5_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Je veux apprendre le 5ème Cercle de magie.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //Alors pénétrez dans le 5ème Cercle. Vous pourrez user d'une magie encore plus puissante.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //Utilisez-la avec sagesse, mon frère, car les ténèbres et nos ennemis sont encore puissants.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //Je ne peux vous mener au 6ème Cercle de magie. Pyrokar en personne vous montrera la voie quand le temps sera venu.
			
			B_LogEntry (Topic_KlosterTeacher,"Maître Pyrokar va me nommer au 6ème Cercle de magie.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //Le temps n'est pas encore venu.
	};
};
//#####################################################################
//##
//##		Kapitel 2
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP2_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##		Kapitel 3
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_ChasePedro_Condition;
	information	 = 	DIA_Karras_ChasePedro_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};

func int DIA_Karras_ChasePedro_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Frère, vous ne pouvez vous permettre de perdre du temps. Vous devez traquer Pedro et ramener l'Œil d'Innos au monastère.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Si nous ne récupérons pas l'Œil, tout est perdu.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Que faites-vous ici ? Ne devriez-vous pas être en train de chercher ce traître de Pedro ?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Plus tard. Je dois d'abord m'occuper de quelque chose.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Il n'ira pas très loin.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Plus tard. Je dois d'abord m'occuper de quelque chose.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Avez-vous la moindre idée de ce que cette perte signifie pour le monastère ?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nul ne peut prévoir ce que l'ennemi compte faire de l'amulette. Mais ce qui est sûr, c'est qu'il prépare quelque chose et que nous devons l'empêcher.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Alors allez-y et débusquez le voleur !

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Il n'ira pas bien loin.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //Je l'espère pour vous. S'il réussit à fuir pendant que vous perdez votre temps ici, je vous traînerai personnellement devant le tribunal.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //De quoi m'accuserez-vous ?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //De connivence avec l'ennemi. Il ne faut pas beaucoup d'imagination pour comprendre quelle est la punition pour un tel crime.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Maintenant, faites en sorte de ne plus perdre de temps sinon, à notre prochaine rencontre, vous aurez gros à perdre.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_NeedInfo_Condition;
	information	 = 	DIA_Karras_NeedInfo_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_Karras_NeedInfo_Condition ()
{	
	if (Npc_KnowsInfo  (other ,DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Karras_NeedInfo_Info ()
{
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //Vous savez tout ce que vous avez besoin de savoir. Maintenant mettez-vous en route !
	
	AI_StopProcessInfos (self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	1;	//damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition	 = 	DIA_Karras_InnosEyeRetrieved_Condition;
	information	 = 	DIA_Karras_InnosEyeRetrieved_Info;
	permanent	 = 	FALSE;
	description	 =	"J'ai rapporté l'Œil d'Innos.";
};

func int DIA_Karras_InnosEyeRetrieved_Condition ()
{	
	if	(KAPITEL == 3)
	&& 	(MIS_NOVIZENCHASE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Karras_InnosEyeRetrieved_Info ()
{
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //Je vous ramène l'Œil d'Innos.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //Je suis soulagé que vous ayez pu arracher l'Œil d'Innos aux griffes de l'ennemi.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Mais le danger est toujours présent. Le mal conspire et se montre particulièrement agressif.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //Je l'avais déjà compris tout seul.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Ne vous moquez pas de moi. La situation est grave, très grave. Nous ne pouvons savoir à qui faire confiance.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //L'ennemi est déjà parvenu à tenter le novice Pedro, il se peut qu'il réussisse avec d'autres.

	B_GivePlayerXP (XP_AMBIENT);
};
	
///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_Perm   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 5;
	condition   = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent   = TRUE;
	description = "Vos recherches avancent ?";
};
FUNC INT DIA_Karras_KAP3_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
		{
			return TRUE;
		};	
};
FUNC VOID DIA_Karras_KAP3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_00"); //Comment se passent vos recherches ?

	if (MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF)
	{
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //J'ai réussi à découvrir quelque chose au sujet des Traqueurs.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //Et de quoi s'agit-il ?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Ils semblent être d'origine démoniaque. Du moins ils sont, ou ils étaient, sous l'influence de démons.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Soyez prudent si vous les rencontrez.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //Ce n'est pas très nouveau.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Je regrette mais je n'ai pas assez d'éléments pour vous fournir des informations plus précises.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Mais si vous pouviez m'apporter quelque chose qui leur appartient...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras a besoin de quelque chose qui a été en contact direct avec les Traqueurs pour pouvoir poursuivre ses recherches."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Je verrai ce que je peux faire.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Le Dormeur serait-il mêlé à ça ?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"De quel matériel avez-vous besoin ?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Je travaille encore sur les interprétations des éléments concernant les Traqueurs.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Dès que je saurai quelque chose, je vous en informerai immédiatement.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //L'ennemi a de nombreux visages. Il est très difficile de déterminer lequel présente le plus de danger pour le monastère.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Se peut-il que le Dormeur soit mêlé à ça ?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //J'ai entendu parler de l'histoire du Dormeur. Mais je n'en sais pas assez pour pouvoir en tirer quoi que ce soit.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Il existe de nombreux démons et n'importe lequel d'entre eux peut être mêlé à cette histoire.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Voulez-vous que je vous amène un cadavre ?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //Non ! Etes-vous fou ? Ce serait bien trop dangereux de faire entrer au monastère une entité démoniaque.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Des objets appartenant à ces êtres me suffiront.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Le résidu d'aura démoniaque dont ils seront imprégnés me suffira pour rassembler assez d'éléments.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //De quel genre d'objet avez-vous besoin ?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Je l'ignore. Tout objet appartenant à ces êtres.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Voulez-vous que je vous ramène un corps ?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Je vais voir ce que je peux faire.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //Ce serait très utile. Pendant ce temps, je vais continuer mes recherches.
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************

INSTANCE DIA_Karras_HaveBook   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent   = FALSE;
	description = "J'ai l'Almanach des Possédés.";
};
FUNC INT DIA_Karras_HaveBook_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems (hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
var int KarrasGotResearchDMTBook_Day;
FUNC VOID DIA_Karras_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //J'ai un Almanach des Possédés. Peut-être que cela peut vous être utile.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Montrez-le moi.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Oui, tout à fait. Je vais examiner ce livre.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //Mais je suis déjà sûr d'une chose.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //A mon avis, les Traqueurs sont une forme de vie pervertie par Béliar.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Ces êtres sont d'origine à la fois humaine et démoniaque.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Cependant, j'ignore toujours si nous avons affaire à un cas de possession ou à une mutation physique.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Revenez plus tard. J'en saurai certainement davantage.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras a réussi à utiliser l'Almanach des Possédés pour ses recherches. Je dois revenir le voir plus tard."); 
	KarrasGotResearchDMTBook_Day = Wld_GetDay(); 
	B_GivePlayerXP (XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************

INSTANCE DIA_Karras_ResearchDMTEnd   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent   = TRUE;

	description = "Avez-vous découvert quelque chose de neuf sur les Traqueurs ?";
};
FUNC INT DIA_Karras_ResearchDMTEnd_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //Avez-vous trouvé autre chose sur les Traqueurs ?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Oui. Maintenant je sais ce qu'ils sont vraiment.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //Dites-moi tout !
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Ils étaient autrefois humains comme vous et moi. Ils ont commis l'abominable erreur de se consacrer à la magie impure d'un puissant archidémon.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Sous l'influence de cet archidémon et de drogues très puissantes, ils sont devenus ses esclaves jusqu'à ne plus être que les ombres d'eux-mêmes.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Aujourd'hui, ils ne sont plus que les instruments du mal, sans volonté propre et ils ne cesseront jamais de traquer les fidèles d'Innos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Nous devons être prudents. Ils semblent encore fuir ces halls sacrés d'Innos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Cependant, si leur pouvoir continue de croître, j'ignore si nous serons encore à l'abri ici.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Merci. C'était très instructif.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Vraiment ? Pour moi, cela ne fait que poser encore d'autres questions. Par exemple, qui étaient-ils avant et quel archidémon les a ainsi transformés ?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //J'ai ma petite idée. Tout cela me rappelle la confrérie du Dormeur. Je connais ces gens.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //J'espère que vous savez dans quoi vous mettez les pieds. Faites attention à vous, mon frère.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //Mais, naturellement. Voici votre almanach. Je n'en ai plus besoin.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Les recherches de Karras ont porté leurs fruits. Il semble y avoir un lien entre les Traqueurs et la confrérie du Dormeur."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //J'y travaille. Revenez plus tard.
	};
};

//********************************************************************
//	Prot_BlackEye	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_Prot_BlackEye   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent   = TRUE;

	description = "Y a-t-il un moyen de se protéger contre les attaques des Traqueurs ?";
};
FUNC INT DIA_Karras_Prot_BlackEye_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Est-il possible de se protéger des attaques mentales des Traqueurs ?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Oui. Une amulette préparée avec une pierre d'un sol béni pourrait avoir un effet protecteur.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Malheureusement, je n'ai pas assez de ces pierres.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Certains de nos sanctuaires en sont constitués.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Très bien. Je vais bien en trouver quelques-unes..
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Oui, faites donc ça. Mais ne pensez pas un instant à endommager nos sanctuaires, vous m'entendez ?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras peut me fournir une protection contre les attaques des Traqueurs. Il a besoin d'une pierre d'une terre bénie. Certains lieux saints sont faits avec de telles pierres."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Aucune idée. Je n'en sais pas suffisamment pour vous répondre. Reposez-moi la question plus tard.
	};
};

//********************************************************************
//	KarrasBlessedStone	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_KarrasBlessedStone   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;

	description = "J'ai une pierre issue d'un sol béni.";
};
FUNC INT DIA_Karras_KarrasBlessedStone_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_HasItems (other,ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING)
	{
		return TRUE;
	};	
};
var int KarrasMakesBlessedStone_Day;
FUNC VOID DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //J'ai quelques pierres d'un sol sanctifié.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Bien. J'espère que tous les sanctuaires sont encore debout.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //Très bien. Je vais pouvoir vous fabriquer une amulette de protection contre le sombre regard des Traqueurs.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Donnez-moi un peu de temps. Je vais me mettre au travail tout de suite.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras me remettra une amulette qui me protègera contre les attaques mentales des Traqueurs. Cela simplifiera grandement ma tâche."); 
	B_GivePlayerXP (XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos (self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************

INSTANCE DIA_Karras_ItAm_Prot_BlackEye_Mis   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent	 = 	TRUE;

	description = "Et au sujet de l'amulette de protection que vous m'avez promise ?";
};
var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
FUNC INT DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //Qu'en est-il de l'amulette de protection que vous m'avez promise.
	
	if (KarrasMakesBlessedStone_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //J'ai terminé. Tenez, jetez un coup d'œil. Tout s'est bien passé.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Portez-la toujours sur vous et les Traqueurs ne pourront vous entraîner dans leur abysse mental.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Merci. C'était très instructif.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras m'a donné une amulette pour me protéger du regard noir des Traqueurs."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Patience. J'y travaille encore.
	};
};

//#####################################################################
//##
//##		Kapitel 4
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit	
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP4_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##		Kapitel 5
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP5_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Karras_PICKPOCKET (C_INFO)
{
	npc			= KDF_503_Karras;
	nr			= 900;
	condition	= DIA_Karras_PICKPOCKET_Condition;
	information	= DIA_Karras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen (49, 35);
};
 
FUNC VOID DIA_Karras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Karras_PICKPOCKET);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_BACK 		,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};
	
func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};


