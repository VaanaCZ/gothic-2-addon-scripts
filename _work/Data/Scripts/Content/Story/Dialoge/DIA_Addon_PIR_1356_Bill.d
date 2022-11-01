// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bill_EXIT(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 999;
	condition	= DIA_Addon_Bill_EXIT_Condition;
	information	= DIA_Addon_Bill_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Bill_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bill_PICKPOCKET (C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 900;
	condition	= DIA_Addon_Bill_PICKPOCKET_Condition;
	information	= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};
 
FUNC VOID DIA_Addon_Bill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
	
func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello
// ************************************************************
INSTANCE DIA_Addon_Bill_Hello(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 1;
	condition	= DIA_Addon_Bill_Hello_Condition;
	information	= DIA_Addon_Bill_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Bill_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Bill_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //Ça se passe bien pour vous ?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Qu'est-ce qu'il se passe ? C'est Henry qui vous envoie ?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Dites-lui qu'il aura ses planches dès que j'aurai terminé.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //S'il n'a pas le temps d'attendre, il peut toujours venir les scier lui-même.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
INSTANCE DIA_Addon_Bill_Planks(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 2;
	condition	= DIA_Addon_Bill_Planks_Condition;
	information	= DIA_Addon_Bill_Planks_Info;

	description = "À quoi servent ces planches ?";
};                       
FUNC INT DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Bill_Planks_Info()
{	
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //À quoi servent ces planches ?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //On s'en sert pour la palissade, idiot !
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg s'est dit que ça serait une bonne idée de protéger le camp comme ça.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Si vous voulez mon avis, on pourrait s'épargner le travail.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Si ces bandits veulent nous attaquer, ce n'est pas cette ridicule palissade qui les arrêtera.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //On n'aurait jamais dû les laisser s'installer dans notre vallée.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Si j'avais su ça avant, je serai resté à Khorinis.
};
	
// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 4;
	condition	= DIA_Addon_Bill_Perm_Condition;
	information	= DIA_Addon_Bill_Perm_Info;
	permanent	= TRUE;
	description	= "Vous voulez un coup de main pour les scier ?";
};
func int DIA_Addon_Bill_Perm_Condition ()
{
	if (GregIsBack == FALSE)
	&& (Npc_WasInState (self, ZS_Saw))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Vous voulez un coup de main pour les scier ?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Nan, je peux le faire tout seul.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Ça ne fait pas longtemps que je suis ici et si je laisse les autres faire mon boulot, ça ne va pas me mener très loin, vous comprenez ?
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 5;
	condition	= DIA_Addon_Bill_Perm2_Condition;
	information	= DIA_Addon_Bill_Perm2_Info;
	permanent	= TRUE;
	description	= "Qu'est-ce que vous faites en ce moment ?";
};
func int DIA_Addon_Bill_Perm2_Condition ()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Qu'est-ce que vous faites en ce moment ?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Je fais une pause.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(jubilant) Francis m'a piqué mon boulot.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Qu'il scie donc des planches jusqu'à ce que les bras lui en tombent.
	};
};



// ************************************************************
// ***														***
// 					Die Angus und Hank Show
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 11;
	condition	= DIA_Addon_Bill_AngusnHank_Condition;
	information	= DIA_Addon_Bill_AngusnHank_Info;
	permanent	= FALSE;
	description = "Je cherche Angus et Hank.";
};                       
FUNC INT DIA_Addon_Bill_AngusnHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&&  Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bill_AngusnHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Je cherche Angus et Hank.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(soupire) Je ne sais pas du tout où ils sont. Les bandits ont sûrement eu leur peau.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Vous étiez amis, non ?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //Tout ce que je sais c'est qu'ils devaient rencontrer les bandits dans une grotte, pas très loin.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Quelque part à l'est du camp. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Je ne sais pas où exactement. Je n'y suis jamais allé.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Demandez plutôt à Alligator Jack. Il est toujours en vadrouille à l'extérieur du camp.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Le repaire d'Angus et de Hank se trouvait dans une grotte à l'est du camp. Alligator Jack en sait peut-être davantage à ce sujet.");
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 12;
	condition	= DIA_Addon_Bill_FoundFriends_Condition;
	information	= DIA_Addon_Bill_FoundFriends_Info;
	permanent	= FALSE;
	description = "J'ai retrouvé vos amis.";
};                       
FUNC INT DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_FoundFriends_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //J'ai retrouvé vos amis.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //Ah ? Et où sont-ils ?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Ils sont morts.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(haineux) Ce sont ces sales bandits qui ont fait le coup !
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //C'est possible.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Damnés pourceaux. Qu'ils grillent en enfer.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(à lui-même, haineux) Si seulement je connaissais la vermine qui a fait ça
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill était effondré lorsque je lui ai annoncé la mort d'Angus et de Hank. Il veut connaître les noms des meurtriers.");
};	

// ------------------------------------------------------------
// 						Ich kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "Je sais qui a tué Angus et Hank.";
};
func int DIA_Addon_Bill_JuanMurder_Condition ()
{
	if (MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_JuanMurder_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //Je sais qui a tué Angus et Hank.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(excité) Qui ? Qui l'a fait ?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //Il s'appelle Juan. Il fait partie des bandits.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Vous devez régler son compte à ce salopard, vous entendez ?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Il ne doit pas s'en tirer comme ça.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Je dois tuer Juan afin de venger les morts d'Angus et Hank.");
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 14;
	condition	= DIA_Addon_Bill_KilledEsteban_Condition;
	information	= DIA_Addon_Bill_KilledEsteban_Info;

	description = "Juan, c'est du passé.";
};                       
FUNC INT DIA_Addon_Bill_KilledEsteban_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead (Juan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_KilledEsteban_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan, c'est du passé.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(avidement) Et ? Il a souffert ?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Laisse tomber, petit !
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(soupire) Oh, d'accord. Du moment que vous avez tué ce porc.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan n'est plus. Bill était très heureux de l'apprendre.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Bill_KillAngusMurder);
	
};



// ************************************************************
// ***														***
//							Pick Pocket
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis		(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr		 	= 21;
	condition	= DIA_Addon_Bill_Khorinis_Condition;
	information	= DIA_Addon_Bill_Khorinis_Info;

	description	= "Vous êtes déjà allé à Khorinis ?";
};
func int DIA_Addon_Bill_Khorinis_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //Vous êtes déjà allé à Khorinis ?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Oui, je m'en sortais en volant à la tire et en magouillant.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Mais quand les bateaux ont été moins nombreux à venir, les affaires se sont gâtées.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //Au bout d'un moment, j'en ai eu assez d'être pouchassé par la milice pour quelques miettes de pain.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //C'est à ce moment-là que j'ai rejoint Greg. Et me voilà coincé ici.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(soupire) Je passe mes journées à scier des planches pour une palissade qui ne servira à rien.
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 22;
	condition	= DIA_Addon_Bill_TeachPlayer_Condition;
	information	= DIA_Addon_Bill_TeachPlayer_Info;
	
	description	= "Pouvez-vous m'enseigner quelque chose ?";
};
func int DIA_Addon_Bill_TeachPlayer_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_TeachPlayer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Pouvez-vous m'apprendre quelque chose ?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //Je peux vous apprendre à faire les poches des gens sans vous faire remarquer.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Mais il faut être assez habile, sinon, ça n'est même pas la peine d'essayer.

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 23;
	condition	= DIA_Addon_Bill_LearnTalent_Condition;
	information	= DIA_Addon_Bill_LearnTalent_Info;
	permanent 	= TRUE;
	description	= "Montrez-moi comment voler à la tire. (10 PA)";
};
func int DIA_Addon_Bill_LearnTalent_Condition ()
{
	if (Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_LearnTalent_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Montrez-moi comment faire les poches.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man für Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //D'abord, il faut que votre victime se sente parfaitement en confiance.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //J'allais voir les gens et je papotais avec eux. Ça marchait très bien.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //Ensuite vous pouvez voler quelque chose, mais faites bien attention qu'ils ne remarquent rien.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Autre chose ?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Si. Entraînez votre dextérité. Plus vous serez habile, plus vous aurez de chance de reconnaître une bonne occasion quand elle se présente.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //Et plus vite vous pourrez délester votre victime de son bien sans vous faire prendre !
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //C'est tout - en théorie, du moins.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Laissez tomber ! Vous n'êtes pas assez habile !
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Soit vous augmentez votre dextérité, soit vous cherchez un meilleur prof.
	};
};

