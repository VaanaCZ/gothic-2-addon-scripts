//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Alors, c'est vous le type qui est entré dans le camp à coups d'épée...
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//Les nouvelles vont vite...
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franco était un sacré dur. Personne n'osait se mesurer à lui. Personne - sauf vous !
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Mettons les choses au clair : si vous essayez de me faire la même chose, je vous tuerai.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "Je veux entrer dans la mine !";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//Je veux entrer dans la mine !
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(sourit) Bien sûr. Dans ce cas, vous êtes venu voir la bonne personne.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Parce que tous ceux qui vont creuser dans la mine ont le droit de garder un bon paquet d'or.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//Et c'est moi qui distribue les pierres rouges dont vous aurez besoin si vous voulez que Thorus vous laisse passer.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "Donnez-moi l'une de ces pierres rouges.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Donnez-moi l'une de ces pierres rouges.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//Soit, mais elles ne sont pas gratuites.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Normalement, je demande une part de l'or que gagnent les gars qui descendent à la mine.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//(hésitant) Qu'est-ce que vous savez de l'extraction d'or, hm ?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//Vous avez sûrement appris quelques tours, non ?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Vous ne me semblez pas savoir grand-chose à ce sujet...
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(avec mépris) Si je vous donne une pierre rouge, ce ne sera pas pour vos aptitudes de mineur...
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//Non, j'ai une autre mission pour vous...
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "Quelle sorte de mission ?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//Quelle sorte de mission ?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//L'un des bandits a essayé de me tuer. Mais au lieu de ça, mes gardes l'ont tué, LUI.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Il voulait votre place, je suppose ?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//Il était idiot ! De gros bras, mais pas de cerveau. Seul, il n'aurait jamais eu l'idée de m'attaquer.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//Non, il exécutait un contrat - c'est quelqu'un d'autre qui l'a envoyé...
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//Alors, vous voulez que je découvre le commanditaire du meurtre...
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Celui qui m'a envoyé cet assassin doit le payer. Trouvez-le... et je vous laisserai entrer dans la mine.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Senyan m'envoie à vous à propos de cette affaire.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan ? Il travaille pour moi, accessoirement... Je lui ai déjà dit de garder les yeux ouverts.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Quelqu'un a tenté d'assassiner Esteban. Je suis censé découvrir le responsable de cette attaque.");

};
//--------------------------------------------------------------------
//	Info Attentäter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "Comment dois-je m'y prendre ?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//Comment dois-je m'y prendre ?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//Tout le monde dans le camp est au courant... alors vous pouvez jouer cartes sur table.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Essayez de découvrir qui est avec moi et qui ne l'est pas... et ne laissez pas les gars vous prendre pour un imbécile !
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Allez parler avec Snaf. Ce gros cuistot entend dire bien des choses...
	
	B_LogEntry (Topic_Addon_Esteban, "Pour retrouver l'agresseur, je vais devoir parler à toutes les personnes dans le camp afin de déterminer leur allégeance... Je vais commencer par Snaf, car il est toujours à l'affût de ce qui se dit.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "Il me faut une armure plus solide.";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Il me faut une meilleure armure.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Pourquoi ? Vous en avez déjà une. Celle-la suffira pour l'instant !
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Si vous accomplissez votre mission, nous en reparlerons...
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "A propos de la mission...";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//A propos de la mission...
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Ecoutez, j'ai autre chose à faire.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//Je me suis dit que vous voudriez sûrement découvrir le commanditaire de l'attaque...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//Qui est-ce ?! Dites-moi vite, que mes gardes aillent lui tordre le cou...
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//C'est Fisk, le marchand, qui a commandité cette attaque. En ce moment, il est au bar et ne se doute de rien...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA !!! Bien joué, mon garçon. Mes gardes vont s'occuper de son cas.
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Vous l'avez entendu, les gars. Allez régler son compte à Fisk.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Revenez me voir lorsque vous aurez découvert qui est le responsable.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "Et maintenant, que va-t-il se passer ?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//Et maintenant, que va-t-il se passer ?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//Que va-t-il se passer ? Je vais vous dire ce qu'il va se passer.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fisk connaîtra une mort brutale et douloureuse. Et tout le monde dans le camp en sera informé.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//Ça leur servira d'avertissement.
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "Puis-je avoir une pierre rouge, mainenant ?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//Puis-je avoir une pierre rouge, mainenant ?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Vous avez fait du bon travail. Quelqu'un comme vous n'a rien à faire dans la mine.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Vous me serez beaucoup plus utile ici. Vous resterez au camp et continuerez à travailler pour moi.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "Je vais y réfléchir.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//J'y réfléchirai...
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Vous oubliez à qui vous parlez. C'est moi qui commande ici, et vous ferez exactement ce que je vous dis.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//Et je vous dis, vous travaillerez pour moi et personne d'autre. Est-ce clair ?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "Vous vous moquez de moi ?";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Vous vous moquez de moi ? Il n'a jamais été question que je travaille pour vous.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//Rares sont ceux qui reçoivent une offre comme celle-ci. Mais si elle ne vous convient pas, vous êtes libre de quitter le camp...
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//Et si vous teniez parole et me donniez une pierre rouge ?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hé - un mot de plus et mes gardes vous règleront votre compte, à vous aussi.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(sourit) Quels gardes...?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Quoi... Ah, je vois... vous essayez de vous en tirer comme ça... Attendez un peu.
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "Donnez-moi la pierre MAINTENANT, ou je la prendrai moi-même !";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //Donnez-moi la pierre MAINTENANT, ou je la prendrai moi-même !
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Ah, comme ça, vous voulez mourir. A votre guise ! Je vais vous rendre service en vous soulageant de votre stupidité !
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




