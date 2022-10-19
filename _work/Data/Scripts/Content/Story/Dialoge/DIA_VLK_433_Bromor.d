///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bromor_EXIT   (C_INFO)
{
	npc         = VLK_433_Bromor;
	nr          = 999;
	condition   = DIA_Bromor_EXIT_Condition;
	information = DIA_Bromor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bromor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bromor_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GIRLS
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_GIRLS		(C_INFO)
{
	npc			 = 	VLK_433_Bromor;
	nr			 = 	2;
	condition	 = 	DIA_Bromor_GIRLS_Condition;
	information	 = 	DIA_Bromor_GIRLS_Info;
	permanent	 = 	FALSE;
	description	 = 	"Êtes-vous le patron de cet endroit ?";
};

func int DIA_Bromor_GIRLS_Condition ()
{	
	if (NpcObsessedByDMT_Bromor == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Bromor_GIRLS_Info ()
{
	//ADDON>
	AI_Output (other, self, "DIA_Addon_Bromor_GIRLS_15_00"); //Êtes-vous le patron de cet endroit ?
	//ADDON<

	//AI_Output (other, self, "DIA_Bromor_GIRLS_15_00"); //J'ai envie de m'amuser.
	//AI_Output (self, other, "DIA_Bromor_GIRLS_07_01"); //Deshalb bist du ja hergekommen.

	AI_Output (self, other, "DIA_Bromor_GIRLS_07_02"); //Je m'appelle Bromor. Cet établissement m'appartient, et voici mes filles. Je les aime bien.
	AI_Output (self, other, "DIA_Bromor_GIRLS_07_03"); //Si elles vous plaisent aussi, ça vous coûtera 50 pièces d'or.
	AI_Output (self, other, "DIA_Bromor_GIRLS_07_04"); //Et qu'il ne vous vienne surtout pas à l'idée de me faire des ennuis !
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bromor_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Bromor_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bromor_MissingPeople_Info;

	description	 = 	"Tout va bien avec vos filles ?";
};

func int DIA_Addon_Bromor_MissingPeople_Condition ()
{
	if (NpcObsessedByDMT_Bromor == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Bromor_GIRLS))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bromor_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bromor_MissingPeople_15_00"); //Tout va bien avec vos filles ?
	AI_Output	(self, other, "DIA_Addon_Bromor_MissingPeople_07_01"); //Évidemment. C'est une maison respectable, ici.
	AI_Output	(other, self, "DIA_Addon_Bromor_MissingPeople_15_02"); //(irrité) Euh... Je ne parlais pas de leur santé. Je voulais dire, sont-elles toutes présentes ? Ou certaines ont-elles disparu ?
	AI_Output	(self, other, "DIA_Addon_Bromor_MissingPeople_07_03"); //Oh. Oui. En réalité, une de mes filles est partie. Elle s'appelle Lucia.
	AI_Output	(self, other, "DIA_Addon_Bromor_MissingPeople_07_04"); //J'ai signalé sa disparition à la milice. Mais ils ont déclaré n'avoir retrouvé aucune trace d'elle.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Une prostituée appelée Lucia a disparu de la maison close près du port."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Lucia
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bromor_Lucia		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bromor_Lucia_Condition;
	information	 = 	DIA_Addon_Bromor_Lucia_Info;

	description	 = 	"Depuis combien de temps Lucia a-t-elle disparu ?";
};

func int DIA_Addon_Bromor_Lucia_Condition ()
{
	if (NpcObsessedByDMT_Bromor == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Bromor_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bromor_Lucia_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bromor_Lucia_15_00"); //Depuis combien de temps Lucia a-t-elle disparu ?
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_01"); //Depuis plusieurs jours. Je ne sais pas exactement.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_02"); //Je suppose qu'elle s'est tirée avec l'un de ses soupirants.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_03"); //Cette garce a décampé avec une partie de mes économies. C'était une écuelle dorée de grande valeur.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_04"); //Si je lui mets la main dessus, elle aura ce qu'elle mérite.
	AI_Output	(self, other, "DIA_Addon_Bromor_Lucia_07_05"); //Est-ce que ce sont vos oignons ? Essayez-vous de vous moquer de moi ou quoi ?

	Log_CreateTopic (TOPIC_Addon_BromorsGold, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BromorsGold,"Lucia la prostituée a dérobé une écuelle dorée à Bromor, son patron. Bromor veut récupérer son écuelle."); 

	MIS_Bromor_LuciaStoleGold = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info LuciaGold
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bromor_LuciaGold		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bromor_LuciaGold_Condition;
	information	 = 	DIA_Addon_Bromor_LuciaGold_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'ai retrouvé l'écuelle que Lucia vous avait volée.";
};

func int DIA_Addon_Bromor_LuciaGold_Condition ()
{
	if (NpcObsessedByDMT_Bromor == FALSE)
	&& (MIS_Bromor_LuciaStoleGold == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_BromorsGeld_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bromor_LuciaGold_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bromor_LuciaGold_15_00"); //J'ai retrouvé l'écuelle que Lucia vous avait volée.
	AI_Output	(self, other, "DIA_Addon_Bromor_LuciaGold_07_01"); //Fantastique ! Il était grand temps que je le retrouve.
	
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
	if (Bromor_Hausverbot == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Et qu'en est-il de la récompense ?", DIA_Addon_Bromor_LuciaGold_lohn );
	};
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Voici votre écuelle.", DIA_Addon_Bromor_LuciaGold_einfachgeben );
	if (DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Ne voulez-vous pas savoir ce qu'est devenue Lucia ?", DIA_Addon_Bromor_LuciaGold_lucia );
	};
};
func void DIA_Addon_Bromor_LuciaGold_einfachgeben ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00"); //Voici votre écuelle.
	B_GiveInvItems (other, self, ItMi_BromorsGeld_Addon,1);
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01"); //Merci. C'est très généreux de votre part. Vous désirez autre chose ?
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP (XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
};
var int DIA_Addon_Bromor_LuciaGold_lucia_OneTime;
func void DIA_Addon_Bromor_LuciaGold_lucia ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_lucia_15_00"); //Ne voulez-vous pas savoir ce qu'est devenue Lucia ?
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_lucia_07_01"); //Non. Pourquoi ? J'ai retrouvé mon écuelle, n'est-ce pas ?
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_lucia_07_02"); //Je me suis toujours débrouillé sans Lucia jusqu'à maintenant et ça continuera ainsi. Pourquoi souhaiterais-je la faire revenir ?
	DIA_Addon_Bromor_LuciaGold_lucia_OneTime = TRUE;
};
func void DIA_Addon_Bromor_LuciaGold_lohn ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_lohn_15_00"); //Et qu'en est-il de la récompense ?
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_lohn_07_01"); //Vous pouvez prendre du bon temps avec une de mes filles pour rien. Qu'en dites-vous ?

	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
	if (DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Ne voulez-vous pas savoir ce qu'est devenue Lucia ?", DIA_Addon_Bromor_LuciaGold_lucia );
	};	
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Ce n'est pas assez.", DIA_Addon_Bromor_LuciaGold_mehr );
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Marché conclu. Voici votre plat.", DIA_Addon_Bromor_LuciaGold_geben );
};
func void DIA_Addon_Bromor_LuciaGold_mehr ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_mehr_15_00"); //Ce n'est pas assez.
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_mehr_07_01"); //Contentez-vous de cela ou ne remettez plus les pieds ici.
	Info_AddChoice	(DIA_Addon_Bromor_LuciaGold, "Oubliez ça.", DIA_Addon_Bromor_LuciaGold_nein );
};
func void DIA_Addon_Bromor_LuciaGold_nein ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_nein_15_00"); //N'y pensez pas.
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_nein_07_01"); //Alors quittez mon établissement sur le champ, espèce de bâtard.
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_nein_07_02"); //Et n'imaginez même pas être servi ici à l'avenir.
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
	Bromor_Hausverbot = TRUE;
	Bromor_Pay = 0;
};
func void DIA_Addon_Bromor_LuciaGold_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Bromor_LuciaGold_geben_15_00"); //Marché conclu. Voici votre plat.
	B_GiveInvItems (other, self, ItMi_BromorsGeld_Addon,1);
	AI_Output			(self, other, "DIA_Addon_Bromor_LuciaGold_geben_07_01"); //Merci. Allez voir Nadja. Elle vous accompagnera à l'étage.
	Bromor_Pay = 1; 
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP (XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices	(DIA_Addon_Bromor_LuciaGold);
};

///////////////////////////////////////////////////////////////////////
//	Info bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_Pay		(C_INFO)
{
	npc			 = 	VLK_433_Bromor;
	nr			 = 	2;
	condition	 = 	DIA_Bromor_Pay_Condition;
	information	 = 	DIA_Bromor_Pay_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux m'amuser un peu (donner 50 pièces d'or).";
};

func int DIA_Bromor_Pay_Condition ()
{	
	if (Bromor_Pay == FALSE)
	&& (Bromor_Hausverbot == FALSE)//ADDON
	&& Npc_KnowsInfo (other,DIA_Bromor_GIRLS)
	&& (NpcObsessedByDMT_Bromor == FALSE)
	&& (Npc_IsDead (Nadja) == FALSE)
	{	
		return TRUE;
	};
};

var int DIA_Bromor_Pay_OneTime;
func void DIA_Bromor_Pay_Info ()
{
	AI_Output (other, self, "DIA_Bromor_Pay_15_00"); //J'ai envie de m'amuser.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other, "DIA_Bromor_Pay_07_01"); //Bien. (sourit) Préparez-vous à vivre des heures inoubliables.
		AI_Output (self, other, "DIA_Bromor_Pay_07_02"); //Montez avec Nadja et amusez-vous bien !
	
		if (DIA_Bromor_Pay_OneTime == FALSE)
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};
	
		Bromor_Pay = 1; 
	}
	else
	{
		AI_Output (self, other, "DIA_Bromor_Pay_07_03"); //Je déteste qu'on se moque de moi. Si vous n'avez pas de quoi payer, fichez-moi le camp d'ici !
	};
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_DOPE		(C_INFO)
{
	npc			 = 	VLK_433_Bromor;
	nr			 = 	3;
	condition	 = 	DIA_Bromor_DOPE_Condition;
	information	 = 	DIA_Bromor_DOPE_Info;
	permanent	 =  FALSE;
	description	 = 	"Puis-je avoir des marchandises 'spéciales' ?";
};

func int DIA_Bromor_DOPE_Condition ()
{	
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (NpcObsessedByDMT_Bromor == FALSE)
	&& (Bromor_Hausverbot == FALSE)//ADDON
	{
		return TRUE;
	};
};
func void DIA_Bromor_DOPE_Info ()
{
	AI_Output (other, self, "DIA_Bromor_DOPE_15_00"); //Est-ce que je peux avoir quelque chose de 'spécial' ici ?
	AI_Output (self, other, "DIA_Bromor_DOPE_07_01"); //Toutes mes filles sont très spéciales. (sourit)
	AI_Output (self, other, "DIA_Bromor_DOPE_07_02"); //Si vous avez de quoi payer, vous pouvez monter avec Nadja.
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_Obsession		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	30;
	condition	 = 	DIA_Bromor_Obsession_Condition;
	information	 = 	DIA_Bromor_Obsession_Info;

	description	 = 	"Allez-vous bien ?";
};

func int DIA_Bromor_Obsession_Condition ()
{
	if (Kapitel >= 3)
	&& (NpcObsessedByDMT_Bromor == FALSE)
	&& (hero.guild == GIL_KDF)
		{
				return TRUE;
		};
};

var int DIA_Bromor_Obsession_GotMoney;

func void DIA_Bromor_Obsession_Info ()
{
	B_NpcObsessedByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_Heilung		(C_INFO)
{
	npc		 = 	VLK_433_Bromor;
	nr		 = 	55;
	condition	 = 	DIA_Bromor_Heilung_Condition;
	information	 = 	DIA_Bromor_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous êtes possédé !";
};

func int DIA_Bromor_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Bromor == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Bromor_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Bromor_Heilung_15_00"); //Vous avez perdu la raison.
	AI_Output			(self, other, "DIA_Bromor_Heilung_07_01"); //Quoi ? Qu'est-ce que vous me racontez là ? Fichez-moi le camp !
	B_NpcClearObsessionByDMT (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bromor_PICKPOCKET (C_INFO)
{
	npc			= VLK_433_Bromor;
	nr			= 900;
	condition	= DIA_Bromor_PICKPOCKET_Condition;
	information	= DIA_Bromor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait risqué de lui voler sa clef)";
};                       

FUNC INT DIA_Bromor_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKE_Bromor) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Bromor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bromor_PICKPOCKET);
	Info_AddChoice		(DIA_Bromor_PICKPOCKET, DIALOG_BACK 		,DIA_Bromor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bromor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bromor_PICKPOCKET_DoIt);
};

func void DIA_Bromor_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems (self, other, ItKE_Bromor, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices (DIA_Bromor_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel (); 
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Bromor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bromor_PICKPOCKET);
};







