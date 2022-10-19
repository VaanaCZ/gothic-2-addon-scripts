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
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Que puis-je faire pour vous, mon fr�re ?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Les honorables combattants d'Innos restent rarement � vagabonder dans ces salles.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Que puis-je pour vous ?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(soup�onneux) Que faites-vous ici ?
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
	description	 = 	"Je suis venu lire les textes sacr�s.";
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
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //Je suis venu consulter les saintes �critures.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Je comprends. Si vous pouvez trouver un peu de temps malgr� vos �tudes, venez me voir.
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
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //Vous avez une t�che � me confier ?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Oui. Cela concerne ce fou d'Ignaz. Il vit � Khorinis et �tudie les breuvages magiques ainsi que les baumes de gu�rison. Il se consacre aussi aux sortil�ges.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //Et c'est ce qui m'inqui�te. Je me demande si sa magie est du go�t d'Innos.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Pour le savoir, j'ai besoin de quelques-uns de ses parchemins de sort.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Je veux que vous alliez en ville et que vous me rapportiez trois de ses parchemins.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Mais pas un mot � quiconque, est-ce clair ?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Bien s�r.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Voici 150 pi�ces d'or. Cela devrait suffire � couvrir vos d�penses.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Ma�tre Karras m'a envoy� en ville. Il veut que je lui trouve trois parchemins de sort qu'Ignaz fabrique et vend.");

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
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Bien jou�, mon jeune ami.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //Mais il est d�sormais temps que vous vous consacriez � vos �tudes.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Et prenez ce parchemin en r�compense.
	
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
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Il est de ma responsabilit� d'entra�ner les mages dans l'art des manifestations dimensionnelles.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Qu'est-ce que cela signifie ?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //Je leur apprends � convoquer des cr�atures ou des entit�s d'autres dimensions.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //On appelle g�n�ralement cela la convocation bien que ce mot ne permette pas de d�finir cet art.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //De plus, je poss�de quelques parchemins de sort tr�s int�ressants que Gorax n'a pas.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Mais je les r�serve exclusivement aux membres de l'ordre.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Ma�tre Karras peut me fournir des parchemins de sort au monast�re mais pour cela je dois �tre Magicien du feu.");
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
	description	 = 	"Apprenez-moi (Cr�ation de runes).";
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
	description	 = 	"Je veux apprendre le quatri�me Cercle de magie.";
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
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Je veux apprendre le 4�me Cercle de magie.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Bien. Tous les signes se sont manifest�s. Acc�dez d�sormais au 4�me Cercle pour que le pouvoir de cette magie p�n�tre en vous.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Vous avez parcouru un long chemin et la lumi�re d'Innos continuera � illuminer votre voie.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Ce n'est pas encore termin�.
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
	description	 = 	"Je veux apprendre le cinqui�me Cercle de magie.";
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
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Je veux apprendre le 5�me Cercle de magie.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //Alors p�n�trez dans le 5�me Cercle. Vous pourrez user d'une magie encore plus puissante.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //Utilisez-la avec sagesse, mon fr�re, car les t�n�bres et nos ennemis sont encore puissants.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //Je ne peux vous mener au 6�me Cercle de magie. Pyrokar en personne vous montrera la voie quand le temps sera venu.
			
			B_LogEntry (Topic_KlosterTeacher,"Ma�tre Pyrokar va me nommer au 6�me Cercle de magie.");
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
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Fr�re, vous ne pouvez vous permettre de perdre du temps. Vous devez traquer Pedro et ramener l'�il d'Innos au monast�re.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Si nous ne r�cup�rons pas l'�il, tout est perdu.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Que faites-vous ici ? Ne devriez-vous pas �tre en train de chercher ce tra�tre de Pedro ?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Plus tard. Je dois d'abord m'occuper de quelque chose.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Il n'ira pas tr�s loin.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Plus tard. Je dois d'abord m'occuper de quelque chose.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Avez-vous la moindre id�e de ce que cette perte signifie pour le monast�re ?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nul ne peut pr�voir ce que l'ennemi compte faire de l'amulette. Mais ce qui est s�r, c'est qu'il pr�pare quelque chose et que nous devons l'emp�cher.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Alors allez-y et d�busquez le voleur !

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Il n'ira pas bien loin.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //Je l'esp�re pour vous. S'il r�ussit � fuir pendant que vous perdez votre temps ici, je vous tra�nerai personnellement devant le tribunal.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //De quoi m'accuserez-vous ?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //De connivence avec l'ennemi. Il ne faut pas beaucoup d'imagination pour comprendre quelle est la punition pour un tel crime.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Maintenant, faites en sorte de ne plus perdre de temps sinon, � notre prochaine rencontre, vous aurez gros � perdre.

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
	description	 =	"J'ai rapport� l'�il d'Innos.";
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
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //Je vous ram�ne l'�il d'Innos.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //Je suis soulag� que vous ayez pu arracher l'�il d'Innos aux griffes de l'ennemi.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Mais le danger est toujours pr�sent. Le mal conspire et se montre particuli�rement agressif.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //Je l'avais d�j� compris tout seul.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Ne vous moquez pas de moi. La situation est grave, tr�s grave. Nous ne pouvons savoir � qui faire confiance.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //L'ennemi est d�j� parvenu � tenter le novice Pedro, il se peut qu'il r�ussisse avec d'autres.

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
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //J'ai r�ussi � d�couvrir quelque chose au sujet des Traqueurs.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //Et de quoi s'agit-il ?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Ils semblent �tre d'origine d�moniaque. Du moins ils sont, ou ils �taient, sous l'influence de d�mons.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Soyez prudent si vous les rencontrez.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //Ce n'est pas tr�s nouveau.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Je regrette mais je n'ai pas assez d'�l�ments pour vous fournir des informations plus pr�cises.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Mais si vous pouviez m'apporter quelque chose qui leur appartient...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras a besoin de quelque chose qui a �t� en contact direct avec les Traqueurs pour pouvoir poursuivre ses recherches."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Je verrai ce que je peux faire.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Le Dormeur serait-il m�l� � �a ?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"De quel mat�riel avez-vous besoin ?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Je travaille encore sur les interpr�tations des �l�ments concernant les Traqueurs.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //D�s que je saurai quelque chose, je vous en informerai imm�diatement.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //L'ennemi a de nombreux visages. Il est tr�s difficile de d�terminer lequel pr�sente le plus de danger pour le monast�re.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Se peut-il que le Dormeur soit m�l� � �a ?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //J'ai entendu parler de l'histoire du Dormeur. Mais je n'en sais pas assez pour pouvoir en tirer quoi que ce soit.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Il existe de nombreux d�mons et n'importe lequel d'entre eux peut �tre m�l� � cette histoire.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Voulez-vous que je vous am�ne un cadavre ?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //Non ! Etes-vous fou ? Ce serait bien trop dangereux de faire entrer au monast�re une entit� d�moniaque.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Des objets appartenant � ces �tres me suffiront.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Le r�sidu d'aura d�moniaque dont ils seront impr�gn�s me suffira pour rassembler assez d'�l�ments.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //De quel genre d'objet avez-vous besoin ?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Je l'ignore. Tout objet appartenant � ces �tres.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Voulez-vous que je vous ram�ne un corps ?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Je vais voir ce que je peux faire.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //Ce serait tr�s utile. Pendant ce temps, je vais continuer mes recherches.
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
	description = "J'ai l'Almanach des Poss�d�s.";
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
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //J'ai un Almanach des Poss�d�s. Peut-�tre que cela peut vous �tre utile.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Montrez-le moi.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Oui, tout � fait. Je vais examiner ce livre.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //Mais je suis d�j� s�r d'une chose.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //A mon avis, les Traqueurs sont une forme de vie pervertie par B�liar.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Ces �tres sont d'origine � la fois humaine et d�moniaque.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Cependant, j'ignore toujours si nous avons affaire � un cas de possession ou � une mutation physique.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Revenez plus tard. J'en saurai certainement davantage.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras a r�ussi � utiliser l'Almanach des Poss�d�s pour ses recherches. Je dois revenir le voir plus tard."); 
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

	description = "Avez-vous d�couvert quelque chose de neuf sur les Traqueurs ?";
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
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //Avez-vous trouv� autre chose sur les Traqueurs ?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Oui. Maintenant je sais ce qu'ils sont vraiment.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //Dites-moi tout !
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Ils �taient autrefois humains comme vous et moi. Ils ont commis l'abominable erreur de se consacrer � la magie impure d'un puissant archid�mon.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Sous l'influence de cet archid�mon et de drogues tr�s puissantes, ils sont devenus ses esclaves jusqu'� ne plus �tre que les ombres d'eux-m�mes.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Aujourd'hui, ils ne sont plus que les instruments du mal, sans volont� propre et ils ne cesseront jamais de traquer les fid�les d'Innos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Nous devons �tre prudents. Ils semblent encore fuir ces halls sacr�s d'Innos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Cependant, si leur pouvoir continue de cro�tre, j'ignore si nous serons encore � l'abri ici.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Merci. C'�tait tr�s instructif.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Vraiment ? Pour moi, cela ne fait que poser encore d'autres questions. Par exemple, qui �taient-ils avant et quel archid�mon les a ainsi transform�s ?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //J'ai ma petite id�e. Tout cela me rappelle la confr�rie du Dormeur. Je connais ces gens.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //J'esp�re que vous savez dans quoi vous mettez les pieds. Faites attention � vous, mon fr�re.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //Mais, naturellement. Voici votre almanach. Je n'en ai plus besoin.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Les recherches de Karras ont port� leurs fruits. Il semble y avoir un lien entre les Traqueurs et la confr�rie du Dormeur."); 
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

	description = "Y a-t-il un moyen de se prot�ger contre les attaques des Traqueurs ?";
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
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Est-il possible de se prot�ger des attaques mentales des Traqueurs ?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Oui. Une amulette pr�par�e avec une pierre d'un sol b�ni pourrait avoir un effet protecteur.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Malheureusement, je n'ai pas assez de ces pierres.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Certains de nos sanctuaires en sont constitu�s.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Tr�s bien. Je vais bien en trouver quelques-unes..
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Oui, faites donc �a. Mais ne pensez pas un instant � endommager nos sanctuaires, vous m'entendez ?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras peut me fournir une protection contre les attaques des Traqueurs. Il a besoin d'une pierre d'une terre b�nie. Certains lieux saints sont faits avec de telles pierres."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Aucune id�e. Je n'en sais pas suffisamment pour vous r�pondre. Reposez-moi la question plus tard.
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

	description = "J'ai une pierre issue d'un sol b�ni.";
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
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //J'ai quelques pierres d'un sol sanctifi�.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Bien. J'esp�re que tous les sanctuaires sont encore debout.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //Tr�s bien. Je vais pouvoir vous fabriquer une amulette de protection contre le sombre regard des Traqueurs.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Donnez-moi un peu de temps. Je vais me mettre au travail tout de suite.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras me remettra une amulette qui me prot�gera contre les attaques mentales des Traqueurs. Cela simplifiera grandement ma t�che."); 
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
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //J'ai termin�. Tenez, jetez un coup d'�il. Tout s'est bien pass�.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Portez-la toujours sur vous et les Traqueurs ne pourront vous entra�ner dans leur abysse mental.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Merci. C'�tait tr�s instructif.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras m'a donn� une amulette pour me prot�ger du regard noir des Traqueurs."); 
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


