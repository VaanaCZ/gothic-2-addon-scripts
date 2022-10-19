// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Pepe_EXIT   (C_INFO)
{
	npc         = BAU_912_Pepe;
	nr          = 999;
	condition   = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Pepe_Hallo (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 1;
	condition	= DIA_Pepe_Hallo_Condition;
	information	= DIA_Pepe_Hallo_Info;
	permanent	= FALSE;
	description	= "Que faites-vous ici ?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //Que faites-vous ici ?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //(ennuyé) Je garde les moutons ! (en soupirant) Et si possible, j'évite les ennuis.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Ce n'est pas toujours le cas, hein ?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //Nan ! Surtout avec les mercenaires. Je suis vraiment content de me retrouver aux pâturages même si ça peut être dangereux ici.
	};
};

// ************************************************************
// 								Danger
// ************************************************************
instance DIA_Pepe_Danger (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 2;
	condition	= DIA_Pepe_Danger_Condition;
	information	= DIA_Pepe_Danger_Info;
	permanent 	= FALSE;
	description	= "Qu'y a-t-il de si dangereux dans les pâturages ?";
};
func int DIA_Pepe_Danger_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};
func void DIA_Pepe_Danger_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Qu'y a-t-il de si dangereux dans les pâturages ?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Il y a une petite meute de loups qui erre dans le coin. En ce moment, ces foutues bestioles bouffent chaque jour un de mes moutons.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Il y a quelques jours, j'avais au moins deux fois plus de moutons. J'ose même pas imaginer ce que me fera Onar quand il le découvrira.
};

// ************************************************************
// 								WhyNotSLD
// ************************************************************
instance DIA_Pepe_WhyNotSLD	(C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 3;
	condition	= DIA_Pepe_WhyNotSLD_Condition;
	information	= DIA_Pepe_WhyNotSLD_Info;
	PERMANENT 	= FALSE;
	description	= "Parlez des loups aux mercenaires. Ils bossent pour vous, non ?";
};
func int DIA_Pepe_WhyNotSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	&& ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
func void DIA_Pepe_WhyNotSLD_Info ()
{
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //Pourquoi ne prévenez-vous pas les mercenaires, pour les loups ? Je pensais qu'ils travaillaient pour vous.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Oui, je sais. C'est ce que j'aurais dû faire. Mais je ne l'ai pas fait.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //Et maintenant, avec autant de moutons en moins, j'ai peur de le dire à qui que ce soit.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Mais vous venez de me le dire...
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //(irrité) Je le regrette déjà.
};

// ************************************************************
// 								KillWolves
// ************************************************************
instance DIA_Pepe_KillWolves (C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr			= 4;
	condition	= DIA_Pepe_KillWolves_Condition;
	information	= DIA_Pepe_KillWolves_Info;
	permanent 	= FALSE;
	description	= "Et si je tuais ces loups ?";
};
func int DIA_Pepe_KillWolves_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	{
		return TRUE;
	};
};
func void DIA_Pepe_KillWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //Et si je tuais les loups ?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //(moqueur) Tout seul ? Ha ! Ha ! J'ai du mal à le croire. Je préfère me fier aux clochettes des moutons.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Laissez tomber. Ce n'était qu'une suggestion. Je vais voir les gars et leur demander ce qu'ils en pensent...
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //(effrayé) Attendez une minute. D'accord, d'accord ! Hum... Vous êtes le meilleur et vous pouvez vous faire une bonne centaine de loups... pas de problème !
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Ils se terrent dans la forêt, près du pâturage. Je pense qu'ils ne sont que quatre...
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Les moutons de Pepe sont menacés par quatre loups. Je dois les chasser.");
};

// ************************************************************
// 								KilledWolves
// ************************************************************
instance DIA_Pepe_KilledWolves		(C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_KilledWolves_Condition;
	information	 = 	DIA_Pepe_KilledWolves_Info;
	permanent	 = 	TRUE;
	description	 = 	"J'en ai terminé avec les loups.";
};
func int DIA_Pepe_KilledWolves_Condition ()
{
	if  (MIS_Pepe_KillWolves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Pepe_KilledWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Je me suis occupé des loups...

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //(ébahi) Vous avez réussi ! Grâces en soient rendues à Innos !
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Mais je ne sais toujours pas comment avouer à Onar que de nombreux moutons ont disparu.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //(à lui-même) Tout ça, c'est la faute de Bullco !

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //Cessez de me prendre pour un imbécile. Toutes les bêtes ne sont pas mortes.
	};
};

// ************************************************************
// 					Was hast du über Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_Bullco_Condition;
	information	 = 	DIA_Pepe_Bullco_Info;
	permanent	 = 	FALSE;
	description	 = 	"Qu'avez-vous dit au sujet de Bullco ?";
};
func int DIA_Pepe_Bullco_Condition ()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (!Npc_IsDead(Bullco))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Bullco_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //Qu'avez-vous dit au sujet de Bullco ?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //C'est un des mercenaires. C'était son boulot de surveiller les pâturages.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Mais au lieu de ça, lui et son copain Sylvio traînent toute la journée autour de Thékla dans la cuisine.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //C'est la faute de ce bâtard si je ne suis pas payé depuis des semaines à cause des moutons disparus.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Ce que j'aimerais pouvoir lui mettre mon poing dans la figure pour ça. Mais personne n'a l'ombre d'une chance contre lui. Ce type est un tueur.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Bullco aurait dû mieux s'occuper des moutons de Pepe. Pepe veut que quelqu'un lui donne ce qu'il mérite.");
};

// ************************************************************
// 						Bullco geschlagen
// ************************************************************
instance DIA_Pepe_BullcoDefeated (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_BullcoDefeated_Condition;
	information	 = 	DIA_Pepe_BullcoDefeated_Info;
	permanent	 = 	FALSE;
	description	 = 	"Bullco a eu ce qui lui pendait au nez.";
};
func int DIA_Pepe_BullcoDefeated_Condition ()
{
	if (MIS_Pepe_KickBullco == LOG_RUNNING)
	{
		if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Pepe_BullcoDefeated_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullco a eu ce qu'il méritait. Je lui ai donné une leçon.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Ce porc le méritait.

	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP (XP_KickBullco);
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Pepe_PERM		(C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr		 	= 6;
	condition	= DIA_Pepe_PERM_Condition;
	information	= DIA_Pepe_PERM_Info;
	permanent	= TRUE;
	description	= "Comment allez-vous ? Et comment vont vos moutons ?";
};

func int DIA_Pepe_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info ()
{
	AI_Output (other, self, "DIA_Pepe_PERM_15_00"); //Comment allez-vous et comment vont vos moutons ?

	if (kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //Je vais bien et les moutons aussi. Tout au moins ceux qui restent.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Bien. Mais les loups vont revenir un de ces jours. Et cette fois-ci, ils seront plus nombreux !
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //J'ai entendu des choses étranges. De sinistres individus seraient venus chez Sékob. Ils assiègent sa maison.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //J'ai entendu dire que des brigands se seraient installés chez Lobart. Quelqu'un devrait faire quelque chose.
	};
};

// ************************************************************
// 			  					Liesel 
// ************************************************************
instance DIA_Pepe_Liesel		(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	7;
	condition	 = 	DIA_Pepe_Liesel_Condition;
	information	 = 	DIA_Pepe_Liesel_Info;
	permanent	 = 	FALSE;
	description	 = 	"Puis-je vous acheter un mouton ?";
};
func int DIA_Pepe_Liesel_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Pepe_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Liesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //Puis-je vous acheter un mouton ?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Quand vous voulez, si vous avez assez d'argent. Un mouton coûte 100 pièces d'or.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Si vous payez, vous pouvez prendre un mouton. Mais vous devez bien le traiter.
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	8;
	condition	 = 	DIA_Pepe_BuyLiesel_Condition;
	information	 = 	DIA_Pepe_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voici 100 pièces d'or. Donnez-moi un mouton.";
};
func int DIA_Pepe_BuyLiesel_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Pepe_LIESEL))
	{
		return TRUE;
	};
};
func void DIA_Pepe_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Tenez, voici 100 pièces d'or. Donnez-moi un mouton.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Bien. Prenez Betsy, vous la trouverez dans les pâturages.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Dites-lui juste de vous suivre. Elle est plutôt intelligente pour une brebis. Traitez-la bien !
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Encore ? D'accord. Prenez Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Betsy ? Mais le dernier mouton s'appelait aussi Betsy...
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Tous les moutons s'appellent Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Sauf les béliers bien entendu.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //Et quel est leur nom ?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Bruce.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Vous n'avez pas assez d'or. Je ne peux vous donner un mouton pour moins.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pepe_PICKPOCKET (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 900;
	condition	= DIA_Pepe_PICKPOCKET_Condition;
	information	= DIA_Pepe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Pepe_PICKPOCKET_Condition()
{
	C_Beklauen (15, 25);
};
 
FUNC VOID DIA_Pepe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pepe_PICKPOCKET);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_BACK 		,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};
	
func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};















