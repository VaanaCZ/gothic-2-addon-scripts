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
	description = "(Es wäre schwierig seine Spruchrolle zu stehlen)";
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

	description	 = 	"Occupé ?";
};

func int DIA_Addon_Merdarion_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Hallo_15_00"); //Comment progresse votre travail ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //Ces cryptes sont pour moi un immense mystère. Il m'est difficile d'imaginer que personne n'était censé les découvrir...
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //Nous avons pu en dégager l'entrée sans grande difficulté.
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
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //J'essaie de découvrir où mène ce portail circulaire.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //De plus, j'aide Nefarius à rechercher le bijou manquant.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //Notre seule certitude est que ce portail mène vers une autre région de l'île, encore inconnue de nous.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //(réfléchit) Je ne me souviens pas avoir entendu parler ou lu quoi que ce soit à ce sujet...
	
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
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //J'admets que c'est quelque peu... risqué.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //Mais nous devons impérativement en découvrir le lien avec ces séismes constants.
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

	description	 = 	"Que savez-vous de ces séismes ?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //Que savez-vous de ces séismes ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //Ils sont déclenchés par quelque chose de l'autre côté du portail.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //Cette force est probablement celle qui déclenche l'éveil des sentinelles de pierre.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //Mais ce n'est pas mon travail. Saturas et Cronos sauront vous en dire davantage à ce sujet.
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

	description	 = 	"Mais qu'espérez-vous trouver là-bas ?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //Que pensez-vous trouver, de l'autre côté ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //Je n'en suis pas vraiment certain.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //Je suppose qu'une structure semblable à celle-ci doit se trouver de l'autre de côté du portail, ainsi qu'un portail équivalent à celui-ci.
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //Pouvez-vous m'enseigner quelque chose à propos de la magie ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //Lorsque nous aurons franchi le portail, je serai à votre disposition.
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

	description	 = 	"Quel est le moyen le plus rapide de rentrer à la ville ?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //Quel est le moyen le plus rapide de rentrer à la ville ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //Je vous recommande de repartir par le chemin que vous avez emprunté pour vous rendre ici.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //(réfléchit) Mais vous pouvez également... Non. C'est trop risqué.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //Dites toujours.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //Eh bien... les bâtisseurs de ces salles disposaient de leur propre moyen de déplacement.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //Si je comprends bien, ils étaient capables de se téléporter.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //Je ne vois pas ce que cela a de spécial...
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //Les pierres de téléportation que nous avons découvertes ici, à Khorinis, sont tout à fait spéciales.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //Il semblerait que la pierre de téléportation dans ces salles mène à la ville portuaire.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //Toutefois, aucun de nous n'a encore eu le courage de l'utiliser.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Et si je tentais de l'utiliser ?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Où est la pierre de téléportation ?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //Où est cette pierre de téléportation ?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //Dans la salle du bassin se trouve une porte, derrière laquelle je l'ai enfermée ?
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Donnez-moi la clef. Je veux voir cette chose de plus près.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //Et si je tentais de l'utiliser ?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //Aucune idée. Nous n'en savons pas assez sur elle. Il est tout à fait possible que vous n'y surviviez pas.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //Donnez-moi la clef. Je veux voir cette pierre de plus près.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //(incertain) Vraiment ? Je vous avertis, je n'en prendrai pas la responsabilité !
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //Donnez-la moi.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //Si vous voulez... Tenez, la voici.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Merdarion m'a remis la clef d'une porte verrouillée aux confins des cryptes du portail. Derrière celle-ci se trouve une pierre de téléportation qui devrait me permettre de regagner le port."); 

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

	description	 = 	"Où sont les autres pierres de téléportation ?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //Où sont les autres pierres de téléportation ?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //A ce jour, nous n'en avons trouvé qu'une autre, quelque part dans la ville de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //Près de la Taverne de la harpie morte
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Une autre pierre de téléportation se trouve près de la Taverne de la harpie morte."); 
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

	description	 = 	"Les pierres de téléportation semblent fonctionner correctement.";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //Les pierres de téléportation semblent fonctionner à merveille...
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //Vous l'avez fait ? Vous l'avez vraiment utilisée ?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //Oui. Visiblement, elles fonctionnent toujours.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //(fasciné) Incroyable. Je regarderai cela de plus près, tout à l'heure.
};


