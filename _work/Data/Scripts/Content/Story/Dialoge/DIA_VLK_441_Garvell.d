///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Garvell_EXIT   (C_INFO)
{
	npc         = VLK_441_Garvell;
	nr          = 999;
	condition   = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garvell_PICKPOCKET (C_INFO)
{
	npc			= VLK_441_Garvell;
	nr			= 900;
	condition	= DIA_Garvell_PICKPOCKET_Condition;
	information	= DIA_Garvell_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait un jeu d'enfant de lui voler sa bourse.)";
};                       

FUNC INT DIA_Garvell_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket25) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garvell_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garvell_PICKPOCKET);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_BACK 		,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 10)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket25, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Garvell_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garvell_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_GREET		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_GREET_Condition;
	information	 = 	DIA_Garvell_GREET_Info;
	description	 = 	"Que faites-vous ici ?";
};
func int DIA_Garvell_GREET_Condition ()
{	
	if (Wld_IsTime (05,00,19,00))
	{	
			return TRUE;
	};
};
func void DIA_Garvell_GREET_Info ()
{
	AI_Output (other, self, "DIA_Garvell_GREET_15_00"); //Que faites-vous ici ?
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Je construis un bateau car j'ai l'intention de partir d'ici le plus rapidement possible.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Mais à en juger par l'avancement des travaux, j'ai l'impression que je n'en verrai jamais le bout.
};
///////////////////////////////////////////////////////////////////////
//	Info eilig
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_eilig		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_eilig_Condition;
	information	 = 	DIA_Garvell_eilig_Info;
	description	 = 	"Pourquoi êtes-vous aussi pressé ?";
};
func int DIA_Garvell_eilig_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_eilig_Info ()
{
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //Pourquoi tant de précipitation ?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Les orques incendieront bientôt la ville.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //Qu'est-ce qui vous fait croire ça ?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //Vous n'avez pas remarqué les paladins qui cavalent dans tous les sens ? Pourquoi sont-ils là à votre avis ?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Parce qu'ils savent que les orques vont bientôt nous attaquer, je vous le dis ! Et ça ne sera pas beau à voir !
};

///////////////////////////////////////////////////////////////////////
//	Info Schiff
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Schiff		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_Schiff_Condition;
	information	 = 	DIA_Garvell_Schiff_Info;
	description	 = 	"Pourquoi ne pouvez-vous pas terminer votre navire ?";
};
func int DIA_Garvell_Schiff_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_Schiff_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //Pourquoi ne pensez-vous pas terminer votre bateau ?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //(dédaigneux) Bah, nous avons des tas de problèmes. La coque n'est pas stable et il nous manque encore un grand nombre de planches.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Mais je n'ai pas de quoi acheter les matériaux manquants et le bois de la dernière livraison était rongé par les termites.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //En plus, mes gars sont incapables de travailler en équipe : l'un d'eux veut construire un bateau qui aille vite, tandis que l'autre se préoccupe juste de la figure de proue !
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //Comme si on n'avait pas mieux à faire !
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //Il y a aussi un de mes hommes qui ne s'est tout simplement pas présenté de nouveau à son travail. Je commence à avoir peur que cela ne retarde encore plus la construction.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Garvell_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_441_Garvell;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Garvell_MissingPeople_Condition;
	information	 = 	DIA_Addon_Garvell_MissingPeople_Info;

	description	 = 	"Il vous manque un employé ?";
};

func int DIA_Addon_Garvell_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Garvell_Schiff)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{	
			return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //Il vous manque un employé ?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Oui. Son nom est Monty. Il s'est évaporé dans la nature.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Ce gros porc mène sans doute la belle vie quelque part dans une ferme. Je n'aurai jamais dû le payer d'avance.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell se plaint de son ouvrier Monty, qui ne vient plus travailler sur sa ferme depuis plusieurs jours. Garvell pense que Monty se la coule douce avec les fermiers."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "J'ai entendu dire que d'autres personnes étaient aussi portées disparues.", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Quand avez-vous vu pour la dernière fois Monty ?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //J'ai entendu dire que d'autres personnes étaient aussi portées disparues.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //C'est bien ce que je dis, le mal est à l'œuvre.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Farim le pêcheur m'a raconté quelque chose de similaire. Son pote William n'est plus là non plus.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Je parie que les orques sont derrière tout cela.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Farim le pêcheur semble savoir quelque chose sur la disparition de son ami William."); 
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK );

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Où puis-je trouver Farim ?", DIA_Addon_Garvell_MissingPeople_Farim );
	};
};
func void DIA_Addon_Garvell_MissingPeople_BACK ()
{
	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
};
func void DIA_Addon_Garvell_MissingPeople_Farim ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //Où puis-je trouver Farim ?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //Il est pêcheur. Je crois que sa cabane se trouve près du magasin d'approvisionnement des paladins. Mais je n'en suis pas sûr.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"La cabane de Farim se trouve près du grenier à provisions des paladins."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //Quand avez-vous vu pour la dernière fois Monty ?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //(en colère) Il n'a pas daigné se montrer au travail depuis au moins deux jours.
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnMonty
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_ReturnMonty		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_ReturnMonty_Condition;
	information	 = 	DIA_Garvell_ReturnMonty_Info;
	description	 = 	"Et maintenant comment ça se passe ?";
};
func int DIA_Garvell_ReturnMonty_Condition ()
{	
	if (Npc_GetDistToWP (Monty_NW, "NW_CITY_HABOUR_WERFT_IN_01") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_ReturnMonty_Info ()
{
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //Et maintenant comment ça se passe ?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //Monty est revenu ! il est occupé à étudier les plans.
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Peut-être pouvons-nous finir le navire maintenant...
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_MISSION		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_MISSION_Condition;
	information	 = 	DIA_Garvell_MISSION_Info;
	permanent    =  FALSE;
	description	 = 	"Puis-je vous être utile d'une manière ou d’une autre ?";
};

func int DIA_Garvell_MISSION_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_eilig)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Garvell_MISSION_Info ()
{
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //Puis-je vous donner un coup de main ?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //Oui. Essayez de découvrir ce que fabriquent les paladins. J'aimerais bien savoir ce qu'ils font ici.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //Il faut également que je sache si les orques vont nous attaquer et à quelle distance de la ville ils se trouvent.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //L'un d'eux a été aperçu juste en dehors de la ville.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Ramenez-moi toutes les informations que vous pourrez dégoter.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Il faut que je sache de combien de temps nous disposons pour finir notre bateau.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell veut des informations sur les orques et il veut savoir pourquoi les paladins sont en ville.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Bien. Si vous apprenez quoi que ce soit d'autre, tenez-moi au courant.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Merci du renseignement. On dirait que nous avons tout le temps que nous voulons pour construire notre bateau alors.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Orks		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	3;
	condition	 = 	DIA_Garvell_Orks_Condition;
	information	 = 	DIA_Garvell_Orks_Info;
	permanent    =  FALSE;
	description	 = 	"J'ai des informations sur les orques.";
};
func int DIA_Garvell_Orks_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Orks_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //J'ai des informations au sujet des orques.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //Je vous écoute.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Ils ont attaqué la Vallée des mines et on dirait qu'ils ont l'intention d'y rester.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Afin de ne pas prendre de risque, les paladins gardent le col.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Paladine		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_Paladine_Condition;
	information	 = 	DIA_Garvell_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"Je sais pourquoi les paladins sont ici.";
};
func int DIA_Garvell_Paladine_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (KnowsPaladins_Ore == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //Je connais la raison de la présence des paladins.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //C'est vrai ? Dites !
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Les paladins sont ici pour le minerai magique de la Vallée des mines, non parce qu'ils craignent que les orques attaquent la ville.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //Ils comptent retourner sur le continent dès qu'ils auront récupéré le minerai.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Ork vor der Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_City		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	4;
	condition	 = 	DIA_Garvell_City_Condition;
	information	 = 	DIA_Garvell_City_Info;
	permanent    =  FALSE;
	description	 = 	"Quant aux orques hors de la ville...";
};
func int DIA_Garvell_City_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 2)
	{
		return TRUE;
	};
};
func void DIA_Garvell_City_Info ()
{
	AI_Output (other, self, "DIA_Garvell_City_15_00"); //Quant à l'orque qui a été aperçu non loin de la ville...
	AI_Output (self, other, "DIA_Garvell_City_04_01"); //Oui ?
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //Ne vous faites aucun souci à son sujet, la garde va s'en occuper.
	

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Perm		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	13;
	condition	 = 	DIA_Garvell_Perm_Condition;
	information	 = 	DIA_Garvell_Perm_Info;
	permanent    =  TRUE;
	description	 = 	"Que se passe-t-il au port ?";
};
func int DIA_Garvell_Perm_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_MISSION)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Perm_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //Que se passe-t-il au port ?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Les orques se font de plus en plus menaçants et vous me posez des questions sur le port ?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Je voulais juste...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //Le plus gros problème à l'heure actuelle, c'est qu'il n'y a pas assez de bateaux au port pour évacuer toute la population.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //En fait, il n'y a même qu'un seul et unique bateau, et il appartient aux paladins. Sûr qu'ils ne nous laisseront pas le prendre pour nous enfuir.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Regardez autour de vous et vous verrez qu'il ne se passe rien ici.
	};
};























