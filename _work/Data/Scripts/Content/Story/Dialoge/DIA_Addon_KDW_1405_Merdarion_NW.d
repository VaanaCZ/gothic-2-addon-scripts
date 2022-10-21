///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_EXIT   (C_INFO)
{
	npc         = KDW_1405_Addon_Merdarion_NW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1405_Addon_Merdarion_NW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re schwierig seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Hallo		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Hallo_Condition;
	information	 = 	DIA_Addon_Merdarion_Hallo_Info;

	description	 = 	"Occup� ?";
};

func int DIA_Addon_Merdarion_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Hallo_15_00"); //Comment progresse votre travail ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //Ces cryptes sont pour moi un immense myst�re. Il m'est difficile d'imaginer que personne n'�tait cens� les d�couvrir...
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //Nous avons pu en d�gager l'entr�e sans grande difficult�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //Les personnes sont tellement prises par leur travail quotidien que personne n'avait encore pris le temps de se pencher sur ces structures.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //Je n'ai aucune autre explication.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Aufgabe		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Aufgabe_Condition;
	information	 = 	DIA_Addon_Merdarion_Aufgabe_Info;

	description	 = 	"Quel est votre travail ici ?";
};

func int DIA_Addon_Merdarion_Aufgabe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Aufgabe_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Aufgabe_15_00"); //Que recherchez-vous ici ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //J'essaie de d�couvrir o� m�ne ce portail circulaire.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //De plus, j'aide Nefarius � rechercher le bijou manquant.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //Notre seule certitude est que ce portail m�ne vers une autre r�gion de l'�le, encore inconnue de nous.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //(r�fl�chit) Je ne me souviens pas avoir entendu parler ou lu quoi que ce soit � ce sujet...
	
	Npc_ExchangeRoutine (self, "START");
	B_StartOtherRoutine (Cronos_NW, "START");
	
	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry (TOPIC_Addon_KDW,"Nefarius recherche un bijou disparu."); 
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info DaDurch
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_DaDurch		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_DaDurch_Condition;
	information	 = 	DIA_Addon_Merdarion_DaDurch_Info;

	description	 = 	"Voulez-vous vraiment franchir le portail ?";
};

func int DIA_Addon_Merdarion_DaDurch_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_DaDurch_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //Voulez-vous vraiment franchir le portail ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //Bien entendu. En admettant que nous puissions retrouver le bijou manquant, cela dit.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //J'admets que c'est quelque peu... risqu�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //Mais nous devons imp�rativement en d�couvrir le lien avec ces s�ismes constants.
};
///////////////////////////////////////////////////////////////////////
//	Info Bedrohung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Bedrohung		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Bedrohung_Condition;
	information	 = 	DIA_Addon_Merdarion_Bedrohung_Info;

	description	 = 	"Que savez-vous de ces s�ismes ?";
};

func int DIA_Addon_Merdarion_Bedrohung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_DaDurch))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Bedrohung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //Que savez-vous de ces s�ismes ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //Ils sont d�clench�s par quelque chose de l'autre c�t� du portail.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //Cette force est probablement celle qui d�clenche l'�veil des sentinelles de pierre.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //Mais ce n'est pas mon travail. Saturas et Cronos sauront vous en dire davantage � ce sujet.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasdahinter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Wasdahinter2		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information	 = 	DIA_Addon_Merdarion_Wasdahinter2_Info;

	description	 = 	"Mais qu'esp�rez-vous trouver l�-bas ?";
};

func int DIA_Addon_Merdarion_Wasdahinter2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //Que pensez-vous trouver, de l'autre c�t� ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //Je n'en suis pas vraiment certain.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //Je suppose qu'une structure semblable � celle-ci doit se trouver de l'autre de c�t� du portail, ainsi qu'un portail �quivalent � celui-ci.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //Pour ce qui est du reste... nous verrons lorsque nous arriverons sur place.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_PERM		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Merdarion_PERM_Condition;
	information	 = 	DIA_Addon_Merdarion_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pouvez-vous m'enseigner quelque chose sur la magie ?";
};

func int DIA_Addon_Merdarion_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //Pouvez-vous m'enseigner quelque chose � propos de la magie ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //Lorsque nous aurons franchi le portail, je serai � votre disposition.
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Teleportstein		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Teleportstein_Condition;
	information	 = 	DIA_Addon_Merdarion_Teleportstein_Info;

	description	 = 	"Quel est le moyen le plus rapide de rentrer � la ville ?";
};

func int DIA_Addon_Merdarion_Teleportstein_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
	&& (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //Quel est le moyen le plus rapide de rentrer � la ville ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //Je vous recommande de repartir par le chemin que vous avez emprunt� pour vous rendre ici.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //(r�fl�chit) Mais vous pouvez �galement... Non. C'est trop risqu�.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //Dites toujours.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //Eh bien... les b�tisseurs de ces salles disposaient de leur propre moyen de d�placement.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //Si je comprends bien, ils �taient capables de se t�l�porter.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //Je ne vois pas ce que cela a de sp�cial...
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //Les pierres de t�l�portation que nous avons d�couvertes ici, � Khorinis, sont tout � fait sp�ciales.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //Il semblerait que la pierre de t�l�portation dans ces salles m�ne � la ville portuaire.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //Toutefois, aucun de nous n'a encore eu le courage de l'utiliser.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Et si je tentais de l'utiliser ?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "O� est la pierre de t�l�portation ?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //O� est cette pierre de t�l�portation ?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //Dans la salle du bassin se trouve une porte, derri�re laquelle je l'ai enferm�e ?
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Donnez-moi la clef. Je veux voir cette chose de plus pr�s.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //Et si je tentais de l'utiliser ?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //Aucune id�e. Nous n'en savons pas assez sur elle. Il est tout � fait possible que vous n'y surviviez pas.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //Donnez-moi la clef. Je veux voir cette pierre de plus pr�s.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //(incertain) Vraiment ? Je vous avertis, je n'en prendrai pas la responsabilit� !
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //Donnez-la moi.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //Si vous voulez... Tenez, la voici.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Merdarion m'a remis la clef d'une porte verrouill�e aux confins des cryptes du portail. Derri�re celle-ci se trouve une pierre de t�l�portation qui devrait me permettre de regagner le port."); 

	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
};

///////////////////////////////////////////////////////////////////////
//	Info WHereOtherTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_WHereOtherTeleports		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Info;

	description	 = 	"O� sont les autres pierres de t�l�portation ?";
};

func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //O� sont les autres pierres de t�l�portation ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //A ce jour, nous n'en avons trouv� qu'une autre, quelque part dans la ville de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //Pr�s de la Taverne de la harpie morte
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Une autre pierre de t�l�portation se trouve pr�s de la Taverne de la harpie morte."); 
};

///////////////////////////////////////////////////////////////////////
//	Info TeleportsteinSuccess
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_TeleportsteinSuccess		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Info;

	description	 = 	"Les pierres de t�l�portation semblent fonctionner correctement.";
};

func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
	&& (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info ()
{
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //Les pierres de t�l�portation semblent fonctionner � merveille...
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //Vous l'avez fait ? Vous l'avez vraiment utilis�e ?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //Oui. Visiblement, elles fonctionnent toujours.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //(fascin�) Incroyable. Je regarderai cela de plus pr�s, tout � l'heure.
};


