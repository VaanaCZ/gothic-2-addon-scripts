
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14030_Addon_Myxir_ADW;
	nr          = 999;
	condition   = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Myxir_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14030_Addon_Myxir_ADW;
	nr			= 900;
	condition	= DIA_Addon_Myxir_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Myxir_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Myxir_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Myxir_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Myxir_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Myxir_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Myxir_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Myxir_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_ADWHello_Condition;
	information	 = 	DIA_Addon_Myxir_ADWHello_Info;

	description	 = 	"De nouvelles découvertes ?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //De nouvelles découvertes ?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //Les bâtisseurs de ces vestiges me fascinent !
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Il est vraiment triste que leur langue soit aussi morte qu'eux.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //(réfléchit) Même la puissance de leurs rituels et invocations n'a pu les sauver.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //Invocations ?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Les bâtisseurs entretenaient des liens très étroits avec le monde des esprits.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Si j'ai bien compris, ils pensaient qu'ils étaient constamment en relation avec leurs ancêtres.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Ils organisaient régulièrement des invocations et des rituels afin de demander conseil ou aide aux esprits.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Comment se déroulaient ces invocations d'esprits ?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Les morts-vivants que j'ai rencontrés n'avaient jamais grand-chose à dire.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //Comment se déroulaient ces invocations d'esprits ?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Les veilleurs des morts connaissaient des formules spéciales, dont ils se servaient pour apaiser les esprits.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Toutefois, les descriptions retrouvées ici sont peu claires. Je n'obtiens que rarement une réponse claire à mes questions.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //Les morts-vivants que j'ai rencontrés n'avaient jamais grand-chose à dire.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Les bâtisseurs ne créaient pas des morts-vivants dénués d'âme, tels des zombies ou d'autres créatures malveillantes.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //Ces esprits étaient ceux de grands guerriers, de prêtres et de chefs puissants.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Je n'ai, pour l'instant, aucun doute au sujet de leur existence.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_PermADW		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Myxir_PermADW_Condition;
	information	 = 	DIA_Addon_Myxir_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"Si je rencontre un spectre, je vous le ferai savoir.";
};
func int DIA_Addon_Myxir_PermADW_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Si je rencontre un spectre, je vous le ferai savoir.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //(rires) Oui, j'insiste !
};
///////////////////////////////////////////////////////////////////////
//	Info GeistTafel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistTafel		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistTafel_Condition;
	information	 = 	DIA_Addon_Myxir_GeistTafel_Info;

	description	 = 	"Saturas m'envoie ici.";
};

func int DIA_Addon_Myxir_GeistTafel_Condition ()
{
	if (Saturas_RiesenPlan == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistTafel_Info ()
{
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Saturas m'envoie ici.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Raven a pénétré dans le temple et en a condamné la porte de l'intérieur.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //Saturas pense qu'il tient sa connaissance du temple d'un spectre !
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //(sidéré) Par Adanos !
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Il a dû invoquer le grand prêtre Khardimon afin de lui demander comment entrer dans le temple.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //Selon les écrits dont je dispose, son tombeau se trouvait dans les grottes sous la forteresse.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //Vous allez devoir procéder de la même manière.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Mais vous ne pouvez plus demander conseil à Khardimon...
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //Le tombeau du prince guerrier Quarhodron se trouve apparemment à l'ouest de la vallée.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Vous allez devoir vous y rendre... et éveiller Quarhodron.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //Ces inscriptions indiquent de quelle manière un fidèle d'Adanos peut invoquer un esprit.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //Vous croyez que cela marchera vraiment ?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //J'ai lu bien des théories fumeuses à ce sujet...
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //...à commencer par les écrits d'Y'Berion, le fondateur de la Confrérie du Dormeur.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Toutefois, j'ai toute confiance en chaque ligne de ces écrits.
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Vous êtes vraiment sérieux ?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Pourquoi Quarhodron ? Pourquoi pas le grand prêtre Khardimon ?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "La Confrérie du dormeur n'a pas colporté que des mensonges...", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //Pourquoi Quarhodron ? Pourquoi pas le grand prêtre Khardimon ?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Raven a profané le tombeau de Khardimon avec son invocation. Cela, nous pouvons en être certains.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Nous allons devoir rechercher un autre esprit.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //La Confrérie du Dormeur n'a pas colporté QUE des rumeurs. Le Dormeur existait vraiment.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //Toutefois, ce n'étaient pas leurs mensonges qui leur faisaient perdre toute crédibilité, mais l'essence même de leurs écrits.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //Ils étaient plus confus que crédibles. Ils dénotaient la consommation excessive d'herbe des marais dont cette confrérie faisait usage.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //Or, le caractère sérieux et réservé des mots inscrits sur cette tablette de pierre me convainquent que cet homme n'y a écrit que la stricte vérité.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //Vous êtes vraiment sérieux ?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Je compte bien explorer chaque possibilité.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Même si nous n'avons qu'une chance infime de rencontrer l'un des bâtisseurs, nous devons la saisir.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Raven y est parvenu, après tout.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "En admettant que je veuille invoquer ce spectre...", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Admettons que je veuille invoquer ce spectre - que dois-je faire ?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Trouvez le tombeau de Quarhodron à l'ouest de la vallée.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Son spectre peut être invoqué grâce aux formules des veilleurs des morts, tenez, les voici.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //C'est tout. Désormais, il ne vous reste plus qu'à rechercher le tombeau.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //Bonne chance, mon fils !

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir m'a demandé d'éveiller le spectre de l'ancien prince guerrier Quarhodron afin de lui demander conseil. Il m'a remis un document contenant une formule que je dois lire à haute voix sur la tombe de Quarhodron, à l'ouest d'ici."); 

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
};

///////////////////////////////////////////////////////////////////////
//	Info GeistPerm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistPerm		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistPerm_Condition;
	information	 = 	DIA_Addon_Myxir_GeistPerm_Info;

	description	 = 	"Qu'avez-vous dit, au sujet du prince guerrier Quarhodron ?";
};

func int DIA_Addon_Myxir_GeistPerm_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistPerm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //Qu'avez-vous dit, au sujet du prince guerrier Quarhodron ?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Vous allez devoir localiser son tombeau et invoquer son spectre en prononçant les formules consacrées des veilleurs des morts.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //J'ai noté ces formules pour vous. Il vous suffira de les lire à haute voix.
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Myxir_TalkedToGhost_Info;

	description	 = 	"J'ai parlé à Quarhodron.";
};
func int DIA_Addon_Myxir_TalkedToGhost_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	&& (SC_TalkedToGhost == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //J'ai parlé à Quarhodron.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //(emballé) Ainsi, vous avez vraiment pu l'éveiller et le ramener du royaume des morts ?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //C'est incroyable. Ces bâtisseurs ne cessent de m'impressionner.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Qui sait ce qu'ils auraient pu accomplir s'ils existaient encore aujourd'hui...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //Qu'a dit le spectre ?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Il m'a remis une clef qui me permettra d'accéder au temple d'Adanos.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Alors allez immédiatement en parler à Saturas. Il sera certainement intéressé par vos découvertes.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Je devrais aller voir Saturas et lui dire que j'ai éveillé Quarhodron."); 
	};
};

///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Apprenez-moi cette langue.";
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition ()
{
	if (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)	
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_ADW_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();

	if (DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach); 
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};	
	
	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,DIALOG_BACK,DIA_Addon_Myxir_ADW_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1 ()
{
	if (B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};

















