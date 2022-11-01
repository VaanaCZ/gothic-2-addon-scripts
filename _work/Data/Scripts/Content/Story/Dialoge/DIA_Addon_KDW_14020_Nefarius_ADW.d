
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Nefarius_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14020_Addon_Nefarius_ADW;
	nr          = 999;
	condition   = DIA_Addon_Nefarius_ADW_EXIT_Condition;
	information = DIA_Addon_Nefarius_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Nefarius_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Nefarius_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Nefarius_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14020_Addon_Nefarius_ADW;
	nr			= 900;
	condition	= DIA_Addon_Nefarius_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Nefarius_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Nefarius_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Nefarius_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Nefarius_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Nefarius_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Nefarius_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Nefarius_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Nefarius_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Nefarius_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Nefarius_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Nefarius_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Nefarius_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14020_Addon_Nefarius_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_ADWHello_Condition;
	information	 = 	DIA_Addon_Nefarius_ADWHello_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Nefarius_ADWHello_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};
};
func void DIA_Addon_Nefarius_ADWHello_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_00"); //Je suis immensément soulagé de voir que vous êtes arrivé ici sans incident.
	AI_Output	(other, self, "DIA_Addon_Nefarius_ADWHello_15_01"); //Comment avez-vous pu arriver ici avant moi ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_02"); //Nous avons traversé une étrange dimension... Qui sait quels étranges détours vous avez empruntés.
	AI_Output	(other, self, "DIA_Addon_Nefarius_ADWHello_15_03"); //Et maintenant ? Puis-je emprunter le portail à nouveau ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_04"); //Nous sommes venus ici directement. Visiblement, il fonctionne très bien.
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_05"); //Bien évidemment, je vous ferai savoir si je soupçonne un éventuel dysfonctionnement.
};

///////////////////////////////////////////////////////////////////////
//	Info Neues
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_Neues		(C_INFO)
{
	npc		 = 	KDW_14020_Addon_Nefarius_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_Neues_Condition;
	information	 = 	DIA_Addon_Nefarius_Neues_Info;

	description	 = 	"Qu'avez-vous fait ici, jusque maintenant ?";
};

func int DIA_Addon_Nefarius_Neues_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Nefarius_Neues_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_Neues_15_00"); //Qu'avez-vous fait ici, jusque maintenant ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_01"); //J'étudie l'histoire des bâtisseurs, et je tente de comprendre la raison qui les a poussés à refermer le portail.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_02"); //Il semblerait réellement qu'ils aient voulu dissimuler la ville engloutie aux yeux du reste du monde.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_03"); //De terribles événements se sont produits ici, voici plusieurs siècles. Ce peuple a été frappé par un mal atroce.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_04"); //Une terrible guerre civile a fait rage dans les rues de la ville peu avant son déclin, à en croire leurs écrits.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_05"); //Les rues de la ville étaient à feu et à sang, et le destin de la ville a finalement été scellé par un raz-de-marée.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_06"); //Les rares habitants ayant survécu à cet enfer ont scellé cette partie de l'île dans l'espoir d'y enfermer le chaos qui y régnait.
	
	Info_ClearChoices	(DIA_Addon_Nefarius_Neues);
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Que pensez-vous trouver ici ?", DIA_Addon_Nefarius_Neues_find );
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Et nous, pauvres imbéciles, avons rouvert ce portail.", DIA_Addon_Nefarius_Neues_auf );
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Qu'est-ce qui a pu inquiéter les bâtisseurs à ce point ?", DIA_Addon_Nefarius_Neues_was );
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Avez-vous dit que ces terres ont été inondées ?", DIA_Addon_Nefarius_Neues_flut );
};
func void DIA_Addon_Nefarius_Neues_find ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_find_15_00"); //Que croyez-vous que nous trouverons ici ?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_find_05_01"); //Cela, je ne peux que le supposer. Vous devriez aller parler à Saturas.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_find_05_02"); //Il a une certaine idée sur la question.
	
	Log_CreateTopic (TOPIC_Addon_Flut, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Flut, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Flut,"Nefarius m'a conseillé de parler à Saturas de la ville engloutie."); 

	
	NefariusADW_Talk2Saturas = TRUE;
};
func void DIA_Addon_Nefarius_Neues_flut ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_flut_15_00"); //Avez-vous dit que ces terres ont été inondées ?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_flut_05_01"); //Adanos lui-même est apparu ici afin de mettre un terme à la démence qui s'était emparée de la ville.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_flut_05_02"); //Il a anéanti la ville, corps et biens.
};
func void DIA_Addon_Nefarius_Neues_was ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_was_15_00"); //Qu'avaient fait les bâtisseurs ?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_01"); //L'un des leurs s'est voué au mal. C'était un grand guerrier, appelé Quarhodron.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_02"); //Au retour d'une bataille victorieuse aux pieds des remparts protégeant la ville, il a ramené avec lui le mal responsable de son déclin.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_03"); //Tous ses lieutenants ont rapidement à cette démence, commençant alors à se battre avec le peuple.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_04"); //La guerre civile qui s'en est suivie a anéanti la ville.
};
func void DIA_Addon_Nefarius_Neues_auf ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_auf_15_00"); //Et nous, pauvres imbéciles, avons rouvert ce portail.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_auf_05_01"); //Je ne suis guère enthousiaste à cette perspective, croyez-moi.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_auf_05_02"); //Mais avions-nous le choix ?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_auf_05_03"); //Si nous ne parvenons pas à arrêter ce qui se produit ici, Khorinis connaîtra exactement le même destin que celui qui a autrefois frappé les bâtisseurs de cette ville ancienne.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_PermADW		(C_INFO)
{
	npc		 = 	KDW_14020_Addon_Nefarius_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Nefarius_PermADW_Condition;
	information	 = 	DIA_Addon_Nefarius_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"Le voyage à travers le portail est-il sûr ?";
};
func int DIA_Addon_Nefarius_PermADW_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Nefarius_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_PermADW_15_00"); //Le voyage à travers le portail est-il sûr ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_PermADW_05_01"); //Pour l'instant, je n'ai nulle réserve à émettre.
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_PreTeach		(C_INFO)
{
	npc		 = 	KDW_14020_Addon_Nefarius_ADW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Nefarius_PreTeach_Condition;
	information	 = 	DIA_Addon_Nefarius_PreTeach_Info;

	description	 = 	"Pourriez-vous me prodiguer votre connaissance de la magie ?";
};

func int DIA_Addon_Nefarius_PreTeach_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_PreTeach_15_00"); //Pourriez-vous me prodiguer votre connaissance de la magie ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_PreTeach_05_01"); //Je peux vous enseigner la création des runes, et Cronos pourra vous vendre les formules nécessaires à leur utilisation.
	AI_Output	(self, other, "DIA_Addon_Nefarius_PreTeach_05_02"); //Il emporte toujours ses livres runiques avec lui.
	
	Nefarius_Addon_TeachRunes = TRUE;
	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_NefariusTeach); 
};

//*********************************************
// Runen
//*********************************************

INSTANCE DIA_Addon_Nefarius_ADW_Runen (C_INFO)
{
	npc			= KDW_14020_Addon_Nefarius_ADW;
	nr			= 99;
	condition	= DIA_Addon_Nefarius_ADW_Runen_Condition;
	information	= DIA_Addon_Nefarius_ADW_Runen_Info;
	permanent	= TRUE;
	description = "Instruisez-moi (création des runes)";
};                       

FUNC INT DIA_Addon_Nefarius_ADW_Runen_Condition()
{
	if (Nefarius_Addon_TeachRunes == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Info()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	  (DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"6ème Cercle de magie",DIA_Addon_Nefarius_ADW_Runen_6);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"5ème Cercle de magie",DIA_Addon_Nefarius_ADW_Runen_5);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"4ème Cercle de magie",DIA_Addon_Nefarius_ADW_Runen_4);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"3ème Cercle de magie",DIA_Addon_Nefarius_ADW_Runen_3);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"2ème Cercle de magie",DIA_Addon_Nefarius_ADW_Runen_2);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
	{ 
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"1er Cercle de magie",DIA_Addon_Nefarius_ADW_Runen_1);
	};
};
//**********************************************************
// BACK
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_BACK()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
};
//**********************************************************
// Erster Kreis 
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_1 ()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if	(PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton);
	};
	if (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_LightHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightHeal)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Zap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Zap)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap);
	};
	if (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Firebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firebolt)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt);
	};
	if (PLAYER_TALENT_RUNES [SPL_LIGHT] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_LIGHT, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LIGHT)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT);
	};
};

//**********************************************************
// Zweiter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_2()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball);
	};
	if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf);
	};
	if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST);
	};
	if (PLAYER_TALENT_RUNES [SPL_Sleep] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Sleep, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Sleep)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep);
	};
	
//------------- Addon ----------------------

	if (PLAYER_TALENT_RUNES [SPL_Whirlwind] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Whirlwind, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Whirlwind)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind);
	};
	if (PLAYER_TALENT_RUNES [SPL_ICELANCE] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_ICELANCE, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ICELANCE)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE);
	};	
	
};

//**********************************************************
// Dritter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_3()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_MediumHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MediumHeal)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_ChargeZap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeZap)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall);
	};
	if (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Firestorm, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firestorm)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton);
	};
	if (PLAYER_TALENT_RUNES [SPL_Fear] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Fear, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Fear)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear);
	};
	if (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_IceCube, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceCube)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube);
	};
	
//------------------ Addon -------------------

	if (PLAYER_TALENT_RUNES [SPL_Thunderstorm] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Thunderstorm, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Thunderstorm)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm);
	};
	if (PLAYER_TALENT_RUNES [SPL_Geyser] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Geyser, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Geyser)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser);
	};	
};

//**********************************************************
// Vierter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_4()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	
	if (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem);
	};
	if (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_DestroyUndead, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_DestroyUndead)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead);
	};
	
	if (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_LightningFlash, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightningFlash)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash);
	};
	if (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_ChargeFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeFireball)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball);
	};
	
	if (PLAYER_TALENT_RUNES [SPL_Waterfist] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Waterfist, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Waterfist)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist);
	};
};

//**********************************************************
// Fünfter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_5()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	
	if (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_IceWave, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceWave)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon);
	};
	if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_FullHeal)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Pyrokinesis, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Pyrokinesis)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

//**********************************************************
// Sechster Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_6()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath);
	};
	if (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink);
	};
};

//##########################################################
//			LERNEN
//##########################################################


//********	Kreis 1 **********
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LIGHT);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firebolt);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Zap);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightHeal);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};

//******* Kreis 2 **********

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Whirlwind);
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ICELANCE);
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Sleep);		
};

//*********** Kreis 3 **********

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Thunderstorm);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Geyser);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MediumHeal);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Fear);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceCube);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeZap);		
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firestorm);	
};

//************** Kreis 4 *********

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightningFlash);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Waterfist);		
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);		
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes (self, other, SPL_DestroyUndead);		
};

//*********** Kreis 5 ************

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis);		
};

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceWave);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_FullHeal);	
};

//************* Kreis 6 ************

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};











