
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14050_Addon_Merdarion_ADW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information = DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14050_Addon_Merdarion_ADW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Merdarion_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_ADW_PICKPOCKET);
};
*/
 ///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ADWHello_Condition;
	information	 = 	DIA_Addon_Merdarion_ADWHello_Info;

	description	 = 	"Comment ça se passe ?";
};

func int DIA_Addon_Merdarion_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Back ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_Back_15_00"); //J'en ai entendu assez.
	Info_ClearChoices	(DIA_Addon_Merdarion_ADWHello);
};
func void DIA_Addon_Merdarion_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_15_00"); //Comment progresse votre travail ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_01"); //(écoute) Ecoutez... c'est curieux, ne croyez-vous pas ?
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_15_02"); //Hmm...
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_03"); //Ces pierres de téléportation ne semblent pas fonctionner, néanmoins, on les entend clairement bourdonner.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_04"); //Bien qu'elles ne soient pas actives, elles dissimulent toujours une certaine forme d'énergie.

	Info_ClearChoices	(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Qu'est-ce qui alimente ces pierres de téléportation ?", DIA_Addon_Merdarion_ADWHello_reaktor );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Selon vous, que doit-on faire pour les activer ?", DIA_Addon_Merdarion_ADWHello_was );
};
func void DIA_Addon_Merdarion_ADWHello_was ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_was_15_00"); //Selon vous, que doit-on faire pour les activer ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_01"); //J'ai ma petite idée à ce propos... Il me faut simplement trouver une preuve à ma théorie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_02"); //Depuis plusieurs jours, j'ai l'étrange sentiment d'avoir déjà vu un édifice de ce type.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_03"); //Je suis persuadé que nous devons les alimenter avec une grande quantité d'énergie magique pour les remettre en service.
	
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Où avez-vous déjà vu ces pierres de téléportation ?", DIA_Addon_Merdarion_ADWHello_wo );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Qu'est-ce qui peut bien produire une énergie magique suffisante à cela...?", DIA_Addon_Merdarion_ADWHello_focus );
};
func void DIA_Addon_Merdarion_ADWHello_focus ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_00"); //Mais qui pourrait bien fournir une telle énergie magique...?
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_01"); //Je ne vois qu'une seule chose... une pierre de focalisation magique.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_02"); //Par cela, je veux dire l'une des cinq pierres de focalisation autrefois utilisées pour créer la Barrière magique dans la Vallée des mines.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_03"); //Aussi loin que je me souvienne, vous deviez vous les procurer pour nous, il y a de cela fort longtemps.
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_04"); //Oui. Je m'en souviens.
	
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Vous avez dit que vous vouliez la preuve de vos soupçons.", DIA_Addon_Merdarion_ADWHello_focusProof );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Où sont les pierres de focalisation, maintenant ?", DIA_Addon_Merdarion_ADWHello_focusWo );
};
func void DIA_Addon_Merdarion_ADWHello_focusWo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focusWo_15_00"); //Où sont les pierres de focalisation, maintenant ?
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_01"); //Elles m'ont été confiées. Je dois les conserver en sécurité jusqu'à ce que nous trouvions une autre manière de les utiliser.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_02"); //Si j'en crois mes yeux, l'heure est venue.
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "J'en ai assez entendu.", DIA_Addon_Merdarion_ADWHello_Back );
};
func void DIA_Addon_Merdarion_ADWHello_focusProof ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focusProof_15_00"); //Vous m'avez dit avoir besoin de preuves pour étayer vos théories.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_01"); //Une pierre de concentration magique doit être liée à ces pierres.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_02"); //Mais je ne sais pas comment les lier.
};
func void DIA_Addon_Merdarion_ADWHello_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_wo_15_00"); //Où avez-vous vu des pierres de téléportation semblables à celles-ci ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_01"); //Vous étiez dans la colonie pénitentiaire, vous aussi. N'avez-vous jamais remarqué ces pierres ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_02"); //Je suis absolument certain qu'elles doivent se trouver au même endroit, aujourd'hui encore.
};
func void DIA_Addon_Merdarion_ADWHello_reaktor ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_reaktor_15_00"); //Comment fonctionnent ces pierres de téléportation ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_01"); //Les bâtisseurs étaient un peuple très évolué.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_02"); //Ils utilisaient des propriétés magiques que nous n'avons jamais vues auparavant.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_03"); //Les bâtisseurs ont créé un réseau de pierres de téléportation leur permettant de se déplacer rapidement d'un endroit de la ville à un autre.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_04"); //Cette pierre constitue visiblement un élément central.
};

///////////////////////////////////////////////////////////////////////
//	Info FokusGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FokusGeben		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_FokusGeben_Condition;
	information	 = 	DIA_Addon_Merdarion_FokusGeben_Info;

	description	 = 	"Donnez-moi une pierre de focalisation.";
};

func int DIA_Addon_Merdarion_FokusGeben_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_FokusGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_FokusGeben_15_00"); //Donnez-moi une pierre de focalisation. Je vais essayer de faire fonctionner les pierres de téléportation.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FokusGeben_06_01"); //Bien. Mais prenez soin de la pierre, vous m'avez compris ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_FokusGeben_06_02"); //Saturas mettra ma tête à prix si nous les égarons.
	CreateInvItems (self, ItMi_Focus, 1);									
	B_GiveInvItems (self, other, ItMi_Focus, 1);			
	
	Log_CreateTopic (TOPIC_Addon_TeleportsADW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsADW,"Le Mage de l'eau Merdarion m'a remis l'une des pierres de focalisation ancestrales ayant autrefois servi à créer la Barrière magique dans la Vallée des mines. Je dois essayer d'activer l'une des pierres de téléportation."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FirstFocus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FirstFocus		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_FirstFocus_Condition;
	information	 = 	DIA_Addon_Merdarion_FirstFocus_Info;

	description	 = 	"J'ai activé l'une des pierres de téléportation.";
};

func int DIA_Addon_Merdarion_FirstFocus_Condition ()
{
	if (TriggeredTeleporterADW != 0)
		{
			return TRUE;
		};
};
var int Merdarion_GotFocusCount;
func void DIA_Addon_Merdarion_FirstFocus_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_FirstFocus_15_00"); //J'ai activé l'une des pierres de téléportation.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_01"); //Je vois... Ainsi, j'avais raison.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_02"); //J'en ai parlé aux autres.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_03"); //Nous voudrions que vous tentiez d'activer toutes les pierres de téléportation.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_04"); //Le fait de pouvoir nous déplacer rapidement d'un quartier de la ville à l'autre faciliterait immensément nos recherches.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_05"); //Voici une autre pierre de focalisation.
	CreateInvItems (self, ItMi_Focus, 1);									
	B_GiveInvItems (self, other, ItMi_Focus, 1);		
	Merdarion_GotFocusCount = 1;
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_06"); //Activez-les toutes, si vous le pouvez.
	AI_Output	(other, self, "DIA_Addon_Merdarion_FirstFocus_15_07"); //J'essaierai.
	B_GivePlayerXP (XP_Addon_ActivatedTeleportStone);
	B_LogEntry (TOPIC_Addon_TeleportsADW,"Merdarion m'a remis une nouvelle pierre de focalisation. Je dois tenter d'activer toutes les pierres de téléportation. Il me remettra prochainement une nouvelle pierre de focalisation, dès que la pierre de téléportation aura été activée."); 
};

///////////////////////////////////////////////////////////////////////
//	Info ActivateTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ActivateTeleports		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'ai activé une autre pierre de téléportation.";
};
func int DIA_Addon_Merdarion_ActivateTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_FirstFocus))
	&&	(TriggeredTeleporterADW > Merdarion_GotFocusCount)
	&& (Merdarion_GotFocusCount < 6)
			{
				return TRUE;
			};
};

var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

func void DIA_Addon_Merdarion_ActivateTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_00"); //J'ai activé une nouvelle pierre de téléportation.

	if (SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_01"); //Donnez-moi une nouvelle pierre de focalisation.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_02"); //Bien sûr. Tenez.
		CreateInvItems (self, ItMi_Focus, 1);									
		B_GiveInvItems (self, other, ItMi_Focus, 1);		
	};
	
	if (DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_03"); //Cela n'a pas été trop difficile ?
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_04"); //Tout dépend de ce que vous entendez par là. J'aurais bien besoin d'un peu d'aide.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_05"); //Je peux vous donner de l'or - cela vous sera-t-il utile ?
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_06"); //Ça ne fera pas de mal.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_07"); //Voyons voir...
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	
	if (SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_08"); //Vous avez réussi - fantastique ! Je ne peux que vous féliciter pour votre travail.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_09"); //Elles fonctionnent toutes à nouveau. C'est impressionnant, vous ne trouvez pas ?
	};
	
	AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_10"); //Voici quelques pièces d'or.
	B_GivePlayerXP (XP_Addon_ActivatedTeleportStone);
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);		
	Merdarion_GotFocusCount = (Merdarion_GotFocusCount + 1);
	
	if (Merdarion_GotFocusCount >= 1)
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
 	&& (MIS_Saturas_LookingForHousesOfRulers == 0)
 	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_11"); //Oh, à ce propos... Avant que je n'oublie, Saturas souhaite vous parler.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_12"); //Allez le voir dès que possible.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachMana
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_PreTeachMana		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information	 = 	DIA_Addon_Merdarion_ADW_PreTeachMana_Info;

	description	 = 	"Pouvez-vous m'enseigner votre connaissance de la magie ?";
};
func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_ADWHello))
		{
			return TRUE;
		};
};
func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADW_PreTeachMana_15_00"); //Pouvez-vous m'enseigner votre connaissance de la magie ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADW_PreTeachMana_06_01"); //Je peux vous aider à accroître votre puissance magique.
	Merdarion_Addon_TeachMana = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher,"Merdarion peut augmenter mon mana."); 
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH_MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDW_14050_Addon_Merdarion_ADW;
	nr 			 =  99;
	condition	 = 	DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information	 = 	DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux augmenter mon pouvoir magique.";
};
var int Merdarion_ADW_Empty;
func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition ()
{	
		if (Merdarion_ADW_Empty == FALSE)
		&& (Merdarion_Addon_TeachMana == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00"); //Je souhaite accroître ma puissance magique.
		
		Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
		Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
		Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)  
	{
		AI_Output (self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00"); //Votre demande dépasse mes capacités.
		AI_Output (self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01"); //Je ne peux rien vous apprendre de plus.
		Merdarion_ADW_Empty = TRUE;
	};
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH);
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
	Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH);
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
	Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};












