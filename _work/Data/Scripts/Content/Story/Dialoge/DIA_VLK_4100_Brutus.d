
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Brutus_EXIT   (C_INFO)
{
	npc         = VLK_4100_Brutus;
	nr          = 999;
	condition   = DIA_Brutus_EXIT_Condition;
	information = DIA_Brutus_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE ;
};

FUNC INT DIA_Brutus_EXIT_Condition()
{	
	if (Kapitel < 3)
	{
			return TRUE;
	};
};
FUNC VOID DIA_Brutus_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Brutus ist ToughGuy 
///////////////////////////////////////////////////////////////////////
//	Info AFTER_FIGHT 
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_AFTER_FIGHT		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	1;
	condition	 = 	DIA_Brutus_AFTER_FIGHT_Condition;
	information	 = 	DIA_Brutus_AFTER_FIGHT_Info;
	permanent	 = 	TRUE;
	important	 =  TRUE;
};

func int DIA_Brutus_AFTER_FIGHT_Condition ()
{	
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& Npc_IsInState (self, ZS_Talk)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_AFTER_FIGHT_Info ()
{

	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (other, self, "DIA_Brutus_AFTER_FIGHT_15_00"); //Alors, vous avez encore toutes vos dents ?
		AI_Output (self, other, "DIA_Brutus_AFTER_FIGHT_06_01"); //Vous êtes un dur, vous ! Je n'aimerais pas devoir vous affronter sur le champ de bataille.
	}
	else if  (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output (other, self, "DIA_Brutus_AFTER_FIGHT_15_02"); //J'ai l'impression que vous m'avez cassé toutes les côtes.
		AI_Output (self, other, "DIA_Brutus_AFTER_FIGHT_06_03"); //Et pourtant, je ne vous ai pas frappé fort. Bah, ce n'est pas grave. J'aime bien les types qui savent encaisser les coups.
		
		if (Brutus_einmalig == FALSE)
		{
			AI_Output (self, other, "DIA_Brutus_AFTER_FIGHT_06_04"); //Tenez, cette potion devrait vous remettre sur pieds. Et vous verrez, elle est également excellente pour le transit intestinal.
		
			CreateInvItems (self, ItPo_Health_01,1);
			B_GiveInvItems (self, hero, ItPo_Health_01,1); 
			Brutus_einmalig = TRUE;
		};
	}
	else //Cancel
	{
		AI_Output (self, other, "DIA_Brutus_AFTER_FIGHT_06_05"); //Je n'ai rien contre le fait de me battre, mais quand je commence un combat, je vais jusqu'au bout.
	};
	// ------ AIVAR resetten ------
	self.aivar[AIV_LastFightComment] = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info PRISONER
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_PRISONER		(C_INFO)
{
	npc		     = 	VLK_4100_Brutus;
	nr		     = 	2;
	condition	 = 	DIA_Brutus_PRISONER_Condition;
	information	 = 	DIA_Brutus_PRISONER_Info;
	description	 = 	"Quel est votre travail ici ?";
};

func int DIA_Brutus_PRISONER_Condition ()
{	
	if (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_PRISONER_Info ()
{
	AI_Output (other, self, "DIA_Brutus_PRISONER_15_00"); //Quel est votre travail ici ?
	AI_Output (self, other, "DIA_Brutus_PRISONER_06_01"); //Mon travail ? J'entraîne les hommes et je leur apprends comment avoir des muscles durs comme l'acier.
	AI_Output (self, other, "DIA_Brutus_PRISONER_06_02"); //Je m'occupe également des prisonniers. Je suis un peu leur second père à ces bâtards.
	AI_Output (self, other, "DIA_Brutus_PRISONER_06_03"); //Mais ma véritable spécialité, c'est de les faire parler. Et croyez-moi, je m'y connais pour ça.
	AI_Output (other, self, "DIA_Brutus_PRISONER_15_04"); //Ça a l'air chouette.
	AI_Output (self, other, "DIA_Brutus_PRISONER_06_05"); //Mais les têtes de pioche que j'ai actuellement comme pensionnaires n'ont pas grand-chose à dire de toute façon.
	
	if (MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Brutus_PRISONER_06_06"); //Et je n'ai pas le droit de toucher à Gorn.
		
		KnowsAboutGorn = TRUE; 
	};
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_PERM		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 =  90;
	condition	 = 	DIA_Brutus_PERM_Condition;
	information	 = 	DIA_Brutus_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Des nouvelles ?";
};

func int DIA_Brutus_PERM_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Brutus_PRISONER) 
	&& (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_PERM_Info ()
{
	AI_Output (other, self, "DIA_Brutus_PERM_15_00"); //Du nouveau ?
	AI_Output (self, other, "DIA_Brutus_PERM_06_01"); //Tout a l'air calme. Je n'ai pas de nouveaux prisonniers... personne que je pourrais aider à s'exprimer... dommage.
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Kasse
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_Kasse		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	2;
	condition	 = 	DIA_Brutus_Kasse_Condition;
	information	 = 	DIA_Brutus_Kasse_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pouvez-vous m'entraîner ?";
};

func int DIA_Brutus_Kasse_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Brutus_PRISONER) 
	&& (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_Kasse_Info ()
{
	AI_Output (other, self, "DIA_Brutus_Kasse_15_00"); //Pouvez-vous m'entraîner ?
	AI_Output (self, other, "DIA_Brutus_Kasse_06_01"); //Bien sûr. Je peux vous aider à devenir plus fort, mais le reste, c'est payant.
	AI_Output (other, self, "DIA_Brutus_Kasse_15_02"); //Combien voulez-vous ?
	AI_Output (self, other, "DIA_Brutus_Kasse_06_03"); //Hmm... vous n'arrêtez pas de sortir du château, pas vrai ? Alors, voilà ce que je vous propose...
	AI_Output (self, other, "DIA_Brutus_Kasse_06_04"); //Dren, mon assistant, a filé lors de la dernière attaque. Quel dégonflé !
	AI_Output (self, other, "DIA_Brutus_Kasse_06_05"); //Mais le vrai problème, c'est qu'il n'est pas parti les mains vides. Il a emporté notre cassette avec lui.
	AI_Output (other, self, "DIA_Brutus_Kasse_15_06"); //Quelle cassette ?
	AI_Output (self, other, "DIA_Brutus_Kasse_06_07"); //Eh bien, nous avons un coffret dans lequel nous rangeons tout ce que nous... euh, obtenons au fur et à mesure.
	AI_Output (self, other, "DIA_Brutus_Kasse_06_08"); //Il y avait une coquette somme à l'intérieur : 200 pièces d'or, ainsi que quelques bijoux précieux.
	AI_Output (self, other, "DIA_Brutus_Kasse_06_09"); //Si vous me ramenez l'or, non seulement vous pourrez garder les bijoux, mais je vous entraînerai.
	
	Log_CreateTopic (TopicBrutusKasse,LOG_MISSION);
	Log_SetTopicStatus (TopicBrutusKasse,LOG_RUNNING);
	B_LogEntry (TopicBrutusKasse,"Le partenaire de Brutus, Den, est parti avec 200 pièces d'or et des bijoux. Si je lui apporte 200 pièces d'or");
};
///////////////////////////////////////////////////////////////////////
//	Info Wo ist Den?
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_Den		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	2;
	condition	 = 	DIA_Brutus_Den_Condition;
	information	 = 	DIA_Brutus_Den_Info;
	permanent	 = 	FALSE;
	description	 = 	"Savez-vous où allait Den ?";
};

func int DIA_Brutus_Den_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Brutus_Kasse) 
	&& (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_Den_Info ()
{
	AI_Output (other, self, "DIA_Brutus_Den_15_00"); //Savez-vous où Dren comptait aller ?
	AI_Output (self, other, "DIA_Brutus_Den_06_01"); //Le plus loin possible. A mon avis, il a dû essayer de franchir le col.
	AI_Output (other, self, "DIA_Brutus_Den_15_02"); //Merci, vous m'êtes d'un grand secours.
	AI_Output (self, other, "DIA_Brutus_Den_06_03"); //Que voulez-vous que je vous dise d'autre ? Je n'ai aucune idée de l'endroit où il est allé.
	
	B_LogEntry (TopicBrutusKasse,"Den voulait essayer de franchir le col.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_Gold		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	2;
	condition	 = 	DIA_Brutus_Gold_Condition;
	information	 = 	DIA_Brutus_Gold_Info;
	permanent	 = 	TRUE;
	description	 = 	"J'ai quelque chose pour vous (donner 200 pièces d'or).";
};

func int DIA_Brutus_Gold_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Brutus_Kasse) 
	&& (NpcObsessedByDMT_Brutus == FALSE)
	&& (Brutus_TeachSTR == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_Gold_Info ()
{
	AI_Output (other, self, "DIA_Brutus_Gold_15_00"); //J'ai quelque chose pour vous.
	
	if B_GiveInvItems (other,self,Itmi_Gold,200)
	{
		AI_Output (self, other, "DIA_Brutus_Gold_06_01"); //Excellent ! Si vous voulez, je peux vous entraîner.
		Brutus_TeachSTR = TRUE;
		Log_CreateTopic	(TOPIC_Teacher_OC, LOG_NOTE);
		B_LogEntry		(TOPIC_Teacher_OC, "Brutus peut m'aider à devenir plus fort.");
		B_GivePlayerXP  (XP_Ambient);
	}
	else 
	{
		AI_Output (self, other, "DIA_Brutus_Gold_06_02"); //Ramenez-moi mes 200 pièces d'or, d'accord ? Je me moque de l'endroit où vous les trouverez, du moment que le compte y est.
	};
};
//*******************************************
//	TechPlayer
//*******************************************
INSTANCE DIA_Brutus_Teach(C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 7;
	condition	= DIA_Brutus_Teach_Condition;
	information	= DIA_Brutus_Teach_Info;
	permanent	= TRUE;
	description = "Je veux devenir plus fort.";
};                       

FUNC INT DIA_Brutus_Teach_Condition()
{
	if (Brutus_TeachSTR == TRUE)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Brutus_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Brutus_Teach_15_00"); //Je souhaite devenir plus fort.

	Info_ClearChoices (DIA_Brutus_Teach);
	Info_AddChoice		(DIA_Brutus_Teach, DIALOG_BACK, DIA_Brutus_Teach_Back);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Brutus_Teach_STR_1);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Brutus_Teach_STR_5);
};

FUNC VOID DIA_Brutus_Teach_Back ()
{
	Info_ClearChoices (DIA_Brutus_Teach);
};

FUNC VOID DIA_Brutus_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices 	(DIA_Brutus_Teach);
	Info_AddChoice		(DIA_Brutus_Teach, DIALOG_BACK, DIA_Brutus_Teach_Back);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Brutus_Teach_STR_1);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Brutus_Teach_STR_5);
};

FUNC VOID DIA_Brutus_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices 	(DIA_Brutus_Teach);
	Info_AddChoice		(DIA_Brutus_Teach, DIALOG_BACK, DIA_Brutus_Teach_Back);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Brutus_Teach_STR_1);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR5		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Brutus_Teach_STR_5);
	
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

INSTANCE DIA_Brutus_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 999;
	condition	= DIA_Brutus_KAP3_EXIT_Condition;
	information	= DIA_Brutus_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brutus_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brutus_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info DuSchonWieder
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_DUSCHONWIEDER		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	30;
	condition	 = 	DIA_Brutus_DUSCHONWIEDER_Condition;
	information	 = 	DIA_Brutus_DUSCHONWIEDER_Info;
	permanent	 = 	TRUE;
	description	 = 	"Vous avez torturé quelqu'un aujourd'hui ?";
};

func int DIA_Brutus_DUSCHONWIEDER_Condition ()
{
	if (Kapitel == 3)	
		&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Brutus_DUSCHONWIEDER_Info ()
{
	AI_Output (other, self, "DIA_Brutus_DUSCHONWIEDER_15_00"); //Alors, vous avez torturé beaucoup de gens aujourd'hui ?
	AI_Output (self, other, "DIA_Brutus_DUSCHONWIEDER_06_01"); //Vous ne voyez pas que je suis occupé ? Revenez plus tard.

	B_NpcClearObsessionByDMT (self);
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

INSTANCE DIA_Brutus_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 999;
	condition	= DIA_Brutus_KAP4_EXIT_Condition;
	information	= DIA_Brutus_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brutus_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brutus_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Warumnichtarbbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_WARUMNICHTARBBEIT		(C_INFO)
{
	npc		 = 	VLK_4100_Brutus;
	nr		 = 	40;
	condition	 = 	DIA_Brutus_WARUMNICHTARBBEIT_Condition;
	information	 = 	DIA_Brutus_WARUMNICHTARBBEIT_Info;

	description	 = 	"Pourquoi n'êtes-vous pas au travail ?";
};

func int DIA_Brutus_WARUMNICHTARBBEIT_Condition ()
{
	if (Kapitel >= 4)
		&& (NpcObsessedByDMT_Brutus == FALSE)
		&& (MIS_OCGateOpen == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Brutus_WARUMNICHTARBBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Brutus_WARUMNICHTARBBEIT_15_00"); //Pourquoi n'êtes-vous pas au travail ?
	AI_Output			(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_01"); //(affolé) Mais c'est dégoûtant !
	AI_Output			(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_02"); //Vous avez vu ma chambre ? Il y a de la vermine partout !
	AI_Output			(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_03"); //J'ignore qui vivait là auparavant, mais moi, il est hors de question que j'y retourne !
	AI_Output			(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_04"); //Je déteste ces sales bêtes ! Et cessez de sourire comme un idiot !

	Log_CreateTopic (TOPIC_BrutusMeatbugs, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusMeatbugs, LOG_RUNNING);
	B_LogEntry (TOPIC_BrutusMeatbugs,"Brutus, le tortionnaire du château, dit que la vermine inoffensive dans sa salle de torture lui donne la chair de poule. C'est un type vraiment costaud."); 

};


///////////////////////////////////////////////////////////////////////
//	Info Meatbugsweg
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_MEATBUGSWEG		(C_INFO)
{
	npc		 = 	VLK_4100_Brutus;
	nr		 = 	31;
	condition	 = 	DIA_Brutus_MEATBUGSWEG_Condition;
	information	 = 	DIA_Brutus_MEATBUGSWEG_Info;
	
	description	 = 	"La vermine est partie.";
};

func int DIA_Brutus_MEATBUGSWEG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brutus_WARUMNICHTARBBEIT))
		&& (Npc_IsDead(Meatbug_Brutus1))
		&& (Npc_IsDead(Meatbug_Brutus2))
		&& (Npc_IsDead(Meatbug_Brutus3))
		&& (Npc_IsDead(Meatbug_Brutus4))
		&& (Kapitel >= 4)
		&& (NpcObsessedByDMT_Brutus == FALSE)
		&& (MIS_OCGateOpen == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Brutus_MEATBUGSWEG_Info ()
{
	AI_Output			(other, self, "DIA_Brutus_MEATBUGSWEG_15_00"); //La vermine a disparu. Vous pouvez retourner nettoyer vos instruments de torture sans être dérangé.
	AI_Output			(self, other, "DIA_Brutus_MEATBUGSWEG_06_01"); //Vous êtes sûr qu'il n'en reste pas dans les coins ?
	AI_Output			(other, self, "DIA_Brutus_MEATBUGSWEG_15_02"); //Oui.
	AI_Output			(self, other, "DIA_Brutus_MEATBUGSWEG_06_03"); //Bon, d'accord. Tenez, prenez cet or en gage de remerciement de ma part.
	AI_Output			(other, self, "DIA_Brutus_MEATBUGSWEG_15_04"); //Vous allez me faire pleurer !

	TOPIC_END_BrutusMeatbugs = TRUE;
	
	B_GivePlayerXP (XP_BrutusMeatbugs);
	B_NpcClearObsessionByDMT (self);

	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					

	Npc_ExchangeRoutine	(self,"Start");  
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_PERM4		(C_INFO)
{
	npc		 = 	VLK_4100_Brutus;
	nr		 = 	32;
	condition	 = 	DIA_Brutus_PERM4_Condition;
	information	 = 	DIA_Brutus_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Etes-vous fou ?";
};

func int DIA_Brutus_PERM4_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Brutus_MEATBUGSWEG))
	 	||(MIS_OCGateOpen == TRUE))
	 	&& (NpcObsessedByDMT_Brutus == FALSE)
	 {
				return TRUE;
	 };
};

func void DIA_Brutus_PERM4_Info ()
{

	if 	(
			(MIS_OCGateOpen == TRUE) 
			|| ((hero.guild == GIL_KDF)&& (Kapitel >= 5))
		)
		{						
			B_NpcObsessedByDMT (self);
		}
		else 
 		{
			AI_Output			(other, self, "DIA_Brutus_PERM4_15_00"); //Vous allez bien ?
			AI_Output			(self, other, "DIA_Brutus_PERM4_06_01"); //(inquiet) Vous êtes vraiment sûr qu'il n'y a plus de vermine ?
			AI_Output			(other, self, "DIA_Brutus_PERM4_15_02"); //Regardez ! Il en reste derrière vous !
			AI_Output			(self, other, "DIA_Brutus_PERM4_06_03"); //(s'emporte) Quoi ?
		
			B_NpcClearObsessionByDMT (self);
			
			
			Npc_SetTarget 		(self, other);
			
			self.aivar[AIV_INVINCIBLE] = FALSE; //HACK, weil durch AI_StartState (böse) Flag nicht zurückgesetzt wird 
			other.aivar[AIV_INVINCIBLE] = FALSE;
			
			AI_StartState 		(self, ZS_Flee, 0, "");
		 };		
};	

///////////////////////////////////////////////////////////////////////
//	Info bessen
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_BESSEN		(C_INFO)
{
	npc		 = 	VLK_4100_Brutus;
	nr		 = 	55;
	condition	 = 	DIA_Brutus_BESSEN_Condition;
	information	 = 	DIA_Brutus_BESSEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous êtes possédé !";
};

func int DIA_Brutus_BESSEN_Condition ()
{
 	if (NpcObsessedByDMT_Brutus == TRUE)
 		&& (NpcObsessedByDMT == FALSE)
	 {
				return TRUE;
	 };
};

func void DIA_Brutus_BESSEN_Info ()
{
	AI_Output			(other, self, "DIA_Brutus_BESSEN_15_00"); //Vous êtes possédé !

	if (hero.guild == GIL_KDF)
		||(hero.guild == GIL_PAL)
	{
	AI_Output			(other, self, "DIA_Brutus_BESSEN_15_01"); //Allez vous faire soigner au monastère.
	AI_Output			(self, other, "DIA_Brutus_BESSEN_06_02"); //Dans mon état, personne ne peut rien pour moi. Allez-vous en.
	B_NpcClearObsessionByDMT (self);
	}
	else
	{
	AI_Output			(other, self, "DIA_Brutus_BESSEN_15_03"); //Quelqu'un doit bien pouvoir vous aider à exorciser ces démons.
	AI_Output			(self, other, "DIA_Brutus_BESSEN_06_04"); //(hurle) Non !
	B_NpcClearObsessionByDMT (self);
		
	Npc_SetTarget 		(self, other);
	
	self.aivar[AIV_INVINCIBLE] = FALSE; //HACK, weil durch AI_StartState (böse) Flag nicht zurückgesetzt wird 
	other.aivar[AIV_INVINCIBLE] = FALSE;
			
	AI_StartState 		(self, ZS_Flee, 0, "");	
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 5 und 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Brutus_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 999;
	condition	= DIA_Brutus_KAP5_EXIT_Condition;
	information	= DIA_Brutus_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brutus_KAP5_EXIT_Condition()
{
	if (Kapitel >= 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brutus_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Brutus_PICKPOCKET (C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 900;
	condition	= DIA_Brutus_PICKPOCKET_Condition;
	information	= DIA_Brutus_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Brutus_PICKPOCKET_Condition()
{
	C_Beklauen (14, 35);
};
 
FUNC VOID DIA_Brutus_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Brutus_PICKPOCKET);
	Info_AddChoice		(DIA_Brutus_PICKPOCKET, DIALOG_BACK 		,DIA_Brutus_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Brutus_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Brutus_PICKPOCKET_DoIt);
};

func void DIA_Brutus_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Brutus_PICKPOCKET);
};
	
func void DIA_Brutus_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Brutus_PICKPOCKET);
};





































