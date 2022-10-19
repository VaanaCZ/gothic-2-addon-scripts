///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap1 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap1_EXIT_Condition;
	information = DIA_Marduk_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_JOB		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	condition	 = 	DIA_Marduk_JOB_Condition;
	information	 = 	DIA_Marduk_JOB_Info;
	permanent	 =	FALSE;	
	description	 = 	"Quel est votre travail ici ?";
};
func int DIA_Marduk_JOB_Condition ()
{
	return TRUE;
};
func void DIA_Marduk_JOB_Info ()
{
	AI_Output (other, self, "DIA_Marduk_JOB_15_00"); //Quel est votre travail ici ?
	AI_Output (self, other, "DIA_Marduk_JOB_05_01"); //Je prépare les paladins pour leur combat contre le Mal.
};
///////////////////////////////////////////////////////////////////////
//	Info Arbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Arbeit		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 = 	3;
	condition	 = 	DIA_Marduk_Arbeit_Condition;
	information	 = 	DIA_Marduk_Arbeit_Info;
	permanent	 = 	FALSE;
	description	 = 	"Y a-t-il quelque chose que je puisse faire pour vous, maître ?";
};
func int DIA_Marduk_Arbeit_Condition ()
{	
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Marduk_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Arbeit_15_00"); //Y a-t-il quelque chose que je puisse faire pour vous, maître ?
	AI_Output (self, other, "DIA_Marduk_Arbeit_05_01"); //Pour moi ? Non, je n'ai pas besoin de votre aide. Allez plutôt prier pour les valeureux soldats d'Innos qui sont partis dans la Vallée des mines.
	
	MIS_MardukBeten = LOG_RUNNING;
	B_StartOtherRoutine (Sergio,"WAIT");
	
	Log_CreateTopic (Topic_MardukBeten,LOG_MISSION);
	Log_SetTopicStatus (Topic_MardukBeten,LOG_RUNNING);
	B_LogEntry (Topic_MardukBeten,"Maître Marduk n'a aucune tâche à me confier. Il m'a dit que je ferais mieux de prier pour les paladins.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gebetet
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Gebetet		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 = 	3;
	condition	 = 	DIA_Marduk_Gebetet_Condition;
	information	 = 	DIA_Marduk_Gebetet_Info;
	permanent	 = 	FALSE;
	description	 = 	"J'ai prié pour les paladins.";
};
func int DIA_Marduk_Gebetet_Condition ()
{	
	if (MIS_MardukBeten == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, PC_PrayShrine_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Marduk_Gebetet_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Gebetet_15_00"); //J'ai prié pour les paladins.
	AI_Output (self, other, "DIA_Marduk_Gebetet_05_01"); //Vous avez bien agi. Maintenant, retournez au travail.
	
	MIS_MardukBeten = LOG_SUCCESS;
	B_GivePlayerXP (XP_MardukBeten);
	B_StartOtherRoutine (Sergio,"START");
};
///////////////////////////////////////////////////////////////////////
//	Info Das Böse
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Evil		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	condition	 = 	DIA_Marduk_Evil_Condition;
	information	 = 	DIA_Marduk_Evil_Info;
	permanent	 =	TRUE;
	description	 = 	"Le 'Mal' ? De quoi s'agit-il ?";
};
func int DIA_Marduk_Evil_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Marduk_JOB)
	{
		return TRUE;
	};
};
func void DIA_Marduk_Evil_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Evil_15_00"); //Qu'est-ce que le 'Mal' ?
	AI_Output (self ,other, "DIA_Marduk_Evil_05_01"); //Le Mal est partout. C'est l'incarnation de Béliar, l'éternel adversaire d'Innos.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_02"); //Ce sont les ténèbres qui cherchent à masquer la lumière d'Innos pour toujours.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_03"); //Béliar est le seigneur des ténèbres, de la haine et de la destruction.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_04"); //Seuls ceux d'entre nous dans le cœur desquels brûle le feu sacré d'Innos, pourront porter la lumière d'Innos et bannir les ténèbres.
};
///////////////////////////////////////////////////////////////////////
//	Info Paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Pal		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	condition	 = 	DIA_Marduk_Pal_Condition;
	information	 = 	DIA_Marduk_Pal_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mais il n'y a que des magiciens et des novices qui vivent au monastère.";
};
func int DIA_Marduk_Pal_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Marduk_JOB)
	{
		return TRUE;
	};
};
func void DIA_Marduk_Pal_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Pal_15_00"); //Mais il n'y a que des magiciens et des novices dans le monastère.
	AI_Output (self, other, "DIA_Marduk_Pal_05_01"); //C'est vrai. Contrairement à notre communauté qui glorifie les Paroles d'Innos...
	AI_Output (self, other, "DIA_Marduk_Pal_05_02"); //... les paladins honorent les grands exploits de notre Seigneur.
	AI_Output (self, other, "DIA_Marduk_Pal_05_03"); //Nous sommes les représentants d'Innos mais les paladins sont les guerriers qui livrent bataille en Son nom et participent à Sa gloire.
};
///////////////////////////////////////////////////////////////////////
//	Info BEFORETEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_BEFORETEACH		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 = 	3;
	condition	 = 	DIA_Marduk_BEFORETEACH_Condition;
	information	 = 	DIA_Marduk_BEFORETEACH_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pouvez-vous m'enseigner autre chose ?";
};
func int DIA_Marduk_BEFORETEACH_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Marduk_JOB)
	{
		return TRUE;
	};
};
func void DIA_Marduk_BEFORETEACH_Info ()
{
	AI_Output (other, self, "DIA_Marduk_BEFORETEACH_15_00"); //Y a-t-il quelque chose que vous puissiez m'apprendre ?
	AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_01"); //Je suis expert dans la magie des glaces et du tonnerre. Je peux vous enseigner ce pouvoir.
	
	if (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_02"); //Cependant, je ne transmets mon savoir qu'aux magiciens.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_TEACH		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 =  10;
	condition	 = 	DIA_Marduk_TEACH_Condition;
	information	 = 	DIA_Marduk_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Apprenez-moi (Création de runes).";
};
func int DIA_Marduk_TEACH_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Marduk_BEFORETEACH)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Marduk_TEACH_Info ()
{
		var int abletolearn;
		
		abletolearn = 0;
		
		AI_Output (other, self, "DIA_Marduk_TEACH_15_00"); //Apprenez-moi.

		Info_ClearChoices 	(DIA_Marduk_TEACH);
		Info_AddChoice 		(DIA_Marduk_TEACH,DIALOG_BACK,DIA_Marduk_TEACH_BACK);
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE) 
		{
			Info_AddChoice 		(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_Zap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Zap)),DIA_Marduk_TEACH_ZAP);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE)
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_Marduk_TEACH_Icebolt);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3) 
		&& (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE) 
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_IceCube, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceCube)) ,DIA_Marduk_TEACH_IceCube);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE) 
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_ChargeZap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeZap)) ,DIA_Marduk_TEACH_ThunderBall);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4) 
		&& (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE) 
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_LightningFlash, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightningFlash)) ,DIA_Marduk_TEACH_LightningFlash);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_IceWave, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceWave)) ,DIA_Marduk_TEACH_IceWave);
			abletolearn = (abletolearn +1);
		};
		if (abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Marduk_TEACH_05_01"); //Pour le moment, je ne peux rien vous apprendre.
			Info_ClearChoices 	(DIA_Marduk_TEACH);
		};
	
};
FUNC VOID DIA_Marduk_TEACH_BACK()
{
	Info_ClearChoices 	(DIA_Marduk_TEACH);
};
///////////////////////////////////////////////////////////////////////
//	MAGIER ZAUBER 
///////////////////////////////////////////////////////////////////////
FUNC VOID DIA_Marduk_TEACH_ZAP()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Zap);	
};
FUNC VOID DIA_Marduk_TEACH_Icebolt()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
FUNC VOID DIA_Marduk_TEACH_LightningFlash()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightningFlash);	
};
FUNC VOID DIA_Marduk_TEACH_IceCube()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceCube);	
};
FUNC VOID DIA_Marduk_TEACH_ThunderBall()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeZap);	
};
FUNC VOID DIA_Marduk_TEACH_IceWave()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceWave);	
};


//#####################################################################
//##
//##		Kapitel 2
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap2_EXIT_Condition;
	information = DIA_Marduk_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



//#####################################################################
//##
//##		Kapitel 3
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap3_EXIT_Condition;
	information = DIA_Marduk_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello Kap3 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap3_Hello   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 30;
	condition   = DIA_Marduk_Kap3_Hello_Condition;
	information = DIA_Marduk_Kap3_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Marduk_Kap3_Hello_Condition()
{
	if (Kapitel == 3)
	&& ((hero.guild == GIL_PAL)
	|| (hero.guild == GIL_DJG))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap3_Hello_Info()
{
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_00"); //Bienvenue, mon fils.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_01"); //Depuis quand êtes-vous l'un des paladins ?
	};
	if (hero.Guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_02"); //D'où venez-vous ?
	};
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
	Info_AddChoice (DIA_Marduk_Kap3_Hello,"Cela ne vous regarde pas.",DIA_Marduk_Kap3_Hello_NotYourConcern);
	
	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"Seulement pour un bref moment.",DIA_Marduk_Kap3_Hello_Soon);
	};
	if (hero.Guild == GIL_DJG)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"Je viens des fermes.",DIA_Marduk_Kap3_Hello_DJG);
	};
	
};

FUNC VOID DIA_Marduk_Kap3_Hello_NotYourConcern ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00"); //Cela ne vous concerne pas.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01"); //(réprimande) Un paladin devrait toujours être poli et modeste. Il est de votre devoir de protéger ceux qui sont sans défense.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02"); //(réprimande) C'est un privilège et vous devriez remercier Innos de vous en offrir l'opportunité. Réfléchissez-y !
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03"); //(en colère) Il fut un temps où la plèbe ne pouvait entrer au monastère. Vous êtes la preuve que c'était une bonne mesure.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04"); //(avertissement) Je vous préviens, ne manigancez rien ici ou vous serez puni immédiatement. Nous ne saurions faire preuve d'indulgence.
	};	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_Soon ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_Soon_15_00"); //Juste un court instant.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_01"); //Alors je vous souhaite la bienvenue. Au cours de ce combat, nous aurons besoin de tous ceux qui sont prêts à affronter le Mal.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_02"); //Notre destin dépend de gens comme vous. Qu'Innos vous accorde le courage dont vous avez besoin.
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_DJG ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_DJG_15_00"); //Je viens des fermes.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_01"); //Alors je vous offre l'hospitalité et vous souhaite la bienvenue. J'espère que vous apprécierez.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_02"); //N'abusez pas de votre statut d'invité ou vous aurez de gros problèmes.
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Paladine trainieren 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_TrainPals   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 32;
	condition   = DIA_Marduk_TrainPals_Condition;
	information = DIA_Marduk_TrainPals_Info;
	permanent   = TRUE;
	description = "Que pouvez-vous m'enseigner ?";
};

//---------------------------------
	var int Marduk_TrainPals_permanent;
//---------------------------------
FUNC INT DIA_Marduk_TrainPals_Condition()
{
	if (hero.guild == GIL_PAL)
	&& (Marduk_TrainPals_permanent == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_TrainPals_Info()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_00"); //Que pouvez-vous m'apprendre ?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_01"); //Naturellement, je ne peux vous apprendre vos techniques de combat.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_02"); //Cependant, je peux vous initier à l'essence d'Innos et à ses dons.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_03"); //De plus, il est de mon devoir de vous préparer à la Consécration de l'épée.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_04"); //Et la magie ?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_05"); //Ici, nous n'enseignons que notre magie. Vous devez aller en ville pour apprendre la magie des paladins.
	
	Info_ClearChoices (DIA_Marduk_TrainPals); 
	Info_AddChoice (DIA_Marduk_TrainPals,"Peut-être plus tard.",DIA_Marduk_TrainPals_Later);
	Info_AddChoice (DIA_Marduk_TrainPals,"Qu'entendez-vous par cela ?",DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice (DIA_Marduk_TrainPals,"Qu'est-ce que la Consécration de l'épée ?",DIA_Marduk_TrainPals_Blessing);
};

FUNC VOID DIA_Marduk_TrainPals_Later()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Later_15_00"); //Peut-être plus tard.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Later_05_01"); //Vous serez toujours le bienvenu ici.
	
	Info_ClearChoices (DIA_Marduk_TrainPals);
};

FUNC VOID DIA_Marduk_TrainPals_Meaning()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_00"); //Qu'entendez-vous par ça ?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_01"); //Quand Innos a quitté notre monde, il a fait don à l'humanité d'une partie de ses pouvoirs divins.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_02"); //Seuls quelques-uns d'entre nous peuvent utiliser ce pouvoir divin et faire régner la justice en Son nom.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_03"); //Et à quoi exactement voulez-vous m'initier ?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_04"); //Je peux vous montrer le bon chemin à suivre pour reconnaître l'essence d'Innos et ainsi vous engager sur ses pas.
};

FUNC VOID DIA_Marduk_TrainPals_Blessing()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Blessing_15_00"); //Qu'est-ce que la Consécration de l'épée ?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_01"); //C'est un des rituels les plus sacrés des paladins.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_02"); //Au cours de cette cérémonie, le pouvoir divin d'Innos pénètre dans l'épée du paladin et lui confère d'incroyables pouvoirs.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_03"); //Une épée consacrée est le bien le plus précieux d'un paladin. Il la gardera toute sa vie.

	Marduk_TrainPals_permanent = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Schwertweihe 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_SwordBlessing   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 33;
	condition   = DIA_Marduk_SwordBlessing_Condition;
	information = DIA_Marduk_SwordBlessing_Info;
	permanent   = TRUE;
	description = "Je veux consacrer mon épée.";
};
FUNC INT DIA_Marduk_SwordBlessing_Condition()
{
	if (Marduk_TrainPals_permanent == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_SwordBlessing_Info()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_15_00"); //Je veux faire consacrer mon épée.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_01"); //Si vous êtes déterminé, il vous faudra d'abord une arme magique.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_02"); //Puis, vous devrez faire retraite à la chapelle et prier.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_03"); //Au cours de votre prière, et après une offrande raisonnable à notre Seigneur Innos, vous Lui demanderez de vous accorder Sa grâce et de vous guider dans votre combat contre le Mal.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_04"); //Si Innos vous apprécie, votre épée sera consacrée.
	
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
	Info_AddChoice (DIA_Marduk_SwordBlessing,DIALOG_BACK,DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Quel genre de donation ?",DIA_Marduk_SwordBlessing_Donation); 
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Où puis-je avoir une épée magique ?",DIA_Marduk_SwordBlessing_OreBlade);
};

FUNC VOID DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
};

FUNC VOID DIA_Marduk_SwordBlessing_Donation ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_Donation_15_00"); //Quel genre d'offrande ?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_01"); //Disons que, considérant la grâce qui vous sera accordée, une somme de 5 000 pièces d'or me paraît raisonnable.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_02"); //Naturellement, vous pouvez donner plus.
};

FUNC VOID DIA_Marduk_SwordBlessing_OreBlade ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_00"); //Où puis-je trouver une épée magique ?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01"); //Essayez en ville chez Harad le forgeron.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02"); //Il fournit aux paladins des épées magiques tant qu'ils sont sur l'île.
	if (Npc_IsDead (HARAD) == TRUE)
	{
		AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_03"); //Harad est mort.
		AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04"); //Je le regrette. Alors il vous faudra attendre de retourner sur le continent avec les autres paladins.
	}; 
};

///////////////////////////////////////////////////////////////////////
//	Info PERM Kap3 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap3_PERM   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 39;
	condition   = DIA_Marduk_Kap3_PERM_Condition;
	information = DIA_Marduk_Kap3_PERM_Info;
	permanent   = TRUE;
	description = "Des nouvelles ?";
};
FUNC INT DIA_Marduk_Kap3_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap3_PERM_Info()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_00"); //Des nouvelles ?
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_01"); //Oui, l'ennemi est parvenu à infiltrer un traître dans nos halls sacrés.
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_02"); //Il a volé l'Œil d'Innos, notre artefact le plus important. Et ce n'est que la partie émergée de l'iceberg.
		//Joly:AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_03"); //Que voulez-vous dire ?
	};
	
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_04"); //(inquiet) L'ennemi est, apparemment, déjà entré dans la ville.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_05"); //Que voulez-vous dire ?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_06"); //Un des paladins, Lothar, a été assassiné en pleine rue.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_07"); //(en colère) En plein jour ! C'est allé trop loin mais je crains que ce ne soit que le début.
	
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,DIALOG_BACK,DIA_Marduk_Kap3_PERM_BAck);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,"Que va-t-il se passer maintenant ?",DIA_Marduk_Kap3_PERM_AndNow);
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Bennet est innocent.",DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}	
	else
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"L'assassin a-t-il été capturé ?",DIA_Marduk_Kap3_PERM_Murderer);
	};
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Où est allé le voleur ?",DIA_Marduk_Kap3_PERM_thief);
	}; 
};

FUNC VOID DIA_Marduk_Kap3_PERM_BAck ()
{
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);	
};

FUNC VOID DIA_Marduk_Kap3_PERM_AndNow ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_00"); //Que va-t-il se passer maintenant ?
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01"); //Nous allons poursuivre le voleur où qu'il aille. Nous le traquerons et nous veillerons à ce qu'il soit puni.
		AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_02"); //Pour ça, nous devons d'abord savoir qui est le voleur.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03"); //Nous le découvrirons bientôt. Et quel que soit le temps que ça nous prendra, nous le retrouverons.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04"); //Je le jure, par Innos.
	}
	else
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05"); //Le meurtre, d'un paladin de surcroît, est certainement l'un des crimes les plus vils qui soient.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06"); //Le meurtrier sera certainement condamné à mort.
	};
};

FUNC VOID DIA_Marduk_Kap3_PERM_BennetisNotGuilty ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00"); //Bennet est innocent. Le témoin a menti.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01"); //Comment savez-vous ça ?
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02"); //J'ai trouvé une preuve.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03"); //Quelquefois j'ai l'impression que la trahison et la cupidité sont nos plus grands ennemis.
};

FUNC VOID DIA_Marduk_Kap3_PERM_Murderer ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_00"); //Le meurtrier a-t-il été capturé ?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01"); //Heureusement, oui. C'est un de ces coupeurs de gorge de la ferme d'Onar.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_02"); //Qui ?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03"); //Je ne connais pas son nom. Mais il y a certainement plusieurs de ces mercenaires capables d'un tel méfait.
};

FUNC VOID DIA_Marduk_Kap3_PERM_thief ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_thief_15_00"); //Où le voleur est-il parti ?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_01"); //Je l'ignore. Il a couru vers les portes comme s'il était possédé puis il a disparu.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_02"); //Quel que soit l'endroit où il se cache, la colère d'Innos le frappera et consumera son âme damnée.
};

//#####################################################################
//##
//##		Kapitel 4
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap4_EXIT_Condition;
	information = DIA_Marduk_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM Kap4U5 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap4U5_PERM   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 49;
	condition   = DIA_Marduk_Kap4U5_PERM_Condition;
	information = DIA_Marduk_Kap4U5_PERM_Info;
	permanent   = TRUE;
	description = "Des nouvelles ?";
};
FUNC INT DIA_Marduk_Kap4U5_PERM_Condition()
{
	if (Kapitel == 4)
	|| (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap4U5_PERM_Info()
{
	AI_Output (other,self ,"DIA_Marduk_Kap4U5_PERM_15_00"); //Des nouvelles ?
	AI_Output (self ,other,"DIA_Marduk_Kap4U5_PERM_05_01"); //Non, hélas non. La situation est toujours critique.
};

//#####################################################################
//##
//##		Kapitel 5
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap5_EXIT_Condition;
	information = DIA_Marduk_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Marduk_PICKPOCKET (C_INFO)
{
	npc			= KDF_505_Marduk;
	nr			= 900;
	condition	= DIA_Marduk_PICKPOCKET_Condition;
	information	= DIA_Marduk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Marduk_PICKPOCKET_Condition()
{
	C_Beklauen (36, 40);
};
 
FUNC VOID DIA_Marduk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Marduk_PICKPOCKET);
	Info_AddChoice		(DIA_Marduk_PICKPOCKET, DIALOG_BACK 		,DIA_Marduk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Marduk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Marduk_PICKPOCKET_DoIt);
};

func void DIA_Marduk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Marduk_PICKPOCKET);
};
	
func void DIA_Marduk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Marduk_PICKPOCKET);
};


