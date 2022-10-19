///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap1_EXIT_Condition;
	information = DIA_Gorax_KAp1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gorax_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gorax_PICKPOCKET (C_INFO)
{
	npc			= KDF_508_Gorax;
	nr			= 888;
	condition	= DIA_Gorax_PICKPOCKET_Condition;
	information	= DIA_Gorax_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait difficile de lui voler sa clef)";
};                       

FUNC INT DIA_Gorax_PICKPOCKET_Condition()
{
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff))
	{
		return 1;
	};
};
FUNC VOID DIA_Gorax_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gorax_PICKPOCKET);
	Info_AddChoice		(DIA_Gorax_PICKPOCKET, DIALOG_BACK 		,DIA_Gorax_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gorax_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gorax_PICKPOCKET_DoIt);
};

func void DIA_Gorax_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems (self,ItKe_KlosterSchatz,1);
		B_GiveInvItems (self, other, ItKe_KlosterSchatz, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_Gorax_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Gorax_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gorax_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info HELP
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_HELP		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 = 	2;
	condition	 = 	DIA_Gorax_HELP_Condition;
	information	 = 	DIA_Gorax_HELP_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gorax_HELP_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Gorax_HELP_Info ()
{
	AI_Output (self, other, "DIA_Gorax_HELP_14_00"); //Puis-je vous être utile ?
};
///////////////////////////////////////////////////////////////////////
//	Info GOLD
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_GOLD		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  2;
	condition	 = 	DIA_Gorax_GOLD_Condition;
	information	 = 	DIA_Gorax_GOLD_Info;
	permanent	 = 	TRUE;
	description	 = 	"J'ai ramené un tas d'or.";
};
//-----------------------------------
var int DIA_Gorax_GOLD_perm;
//-----------------------------------
func int DIA_Gorax_GOLD_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)//ADDON
	{
		return TRUE;
	};
};
func void DIA_Gorax_GOLD_Info ()
{
	AI_Output (other, self, "DIA_Gorax_GOLD_15_00"); //Je vous apporte beaucoup d'or.
	
	if (Npc_HasItems (other, ItMi_Gold) >= Summe_Kloster)
	{
		AI_Output (self, other, "DIA_Gorax_GOLD_14_01"); //(impatient) Ah ! Vous apportez votre offrande pour Innos. Voilà qui est bien mon fils.
		AI_Output (self, other, "DIA_Gorax_GOLD_14_02"); //Selon la volonté d'Innos, j'userai de votre don pour le plus grand bien du monastère.
	
		DIA_Gorax_GOLD_perm = TRUE; //WICHTIG
		B_GiveInvItems (other, self, ItMi_Gold, Summe_Kloster);
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_14_02"); //Qu'avez-vous fait de cet or ? Vous l'avez dépensé ? Allez en chercher et revenez !
	};
	
};

///////////////////////////////////////////////////////////////////////
//	Info DaronsStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gorax_DaronsStatue		(C_INFO)
{
	npc		 = 	KDF_508_Gorax;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Gorax_DaronsStatue_Condition;
	information	 = 	DIA_Addon_Gorax_DaronsStatue_Info;
	permanent	 = 	TRUE;

	description	 = 	"Tenez, j'ai ici la statuette que Daron devait apporter au monastère.";
};

func int DIA_Addon_Gorax_DaronsStatue_Condition ()
{
	if (other.guild == GIL_NOV)
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)//ADDON
	{
		return TRUE;
	};
};

func void DIA_Addon_Gorax_DaronsStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Gorax_DaronsStatue_15_00"); //J'ai avec moi la statuette que Daron devait porter au monastère.
	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	{
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_01"); //(soupire) C'est très embarrassant qu'un objet de cette valeur nous soit rapporté par un aspirant novice.
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_02"); //Néanmoins, cela confirme votre détermination à servir Innos.
		
		//-----------PATCH M.F.----------------------
		if B_GiveInvItems (other, self, ItMi_LostInnosStatue_Daron,1)
		{
			Npc_RemoveInvItems (self, ItMi_LostInnosStatue_Daron,1);
		};
		
		
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_03"); //Je suis votre obligé, jeune novice.
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_ReturnedLostInnosStatue_Daron);
		DIA_Gorax_GOLD_perm = TRUE; //WICHTIG
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_04"); //La statuette ? Je ne vois pas de statuette. Apportez-la moi et je croirais peut-être à votre histoire.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_SLEEP		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  4;
	condition	 = 	DIA_Gorax_SLEEP_Condition;
	information	 = 	DIA_Gorax_SLEEP_Info;
	description	 = 	"Je cherche un endroit où dormir.";
};
func int DIA_Gorax_SLEEP_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE)
	&& (other.guild == GIL_NOV) 
	{
		return TRUE;
	};
};
func void DIA_Gorax_SLEEP_Info ()
{
	AI_Output (other, self, "DIA_Gorax_SLEEP_15_00"); //Je cherche un endroit où dormir.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_01"); //Il y a un lit vacant derrière la prochaine porte. Le premier sur la droite, près de l'entrée. Vous pouvez dormir là.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_02"); //Vous pouvez ranger vos affaires dans l'un des coffres libres.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_03"); //Et rappelez-vous bien que vous n'avez rien à faire dans les chambres à coucher des magiciens. Et vous n'avez pas le droit d'entrer dans la bibliothèque si on ne vous en a pas donné la permission.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  3;
	condition	 = 	DIA_Gorax_Aufgabe_Condition;
	information	 = 	DIA_Gorax_Aufgabe_Info;
	permanent	 =  FALSE;
	description	 = 	"Avez-vous une mission à me confier ?";
};
func int DIA_Gorax_Aufgabe_Condition ()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Gorax_Aufgabe_15_00"); //Avez-vous une tâche à me confier ?
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_01"); //Vous autres les novices, vous avez beaucoup travaillé ces derniers temps. Et ceux qui travaillent beaucoup doivent manger beaucoup.
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_02"); //Je vous confie la clef de la réserve. Vous y trouverez des saucisses. Distribuez-les équitablement entre les novices !
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_03"); //Une fois que vous aurez fait ça, revenez me voir.
	 
	CreateInvItems (self, ItKe_KlosterStore,1); 
	B_GiveInvItems (self, other, ItKe_KlosterStore,1);
	MIS_GoraxEssen = LOG_RUNNING; 
	
	Log_CreateTopic (Topic_GoraxEssen,LOG_MISSION);
	Log_SetTopicStatus (Topic_GoraxEssen,LOG_RUNNING);
	B_LogEntry (Topic_GoraxEssen,"Maître Gorax veut que je partage les saucisses d'agneau du garde-manger entre les novices. A part moi, il y a treize autres novices au monastère.");
};
///////////////////////////////////////////////////////////////////////
//	Info Würste verteilt
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Wurst		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  2;
	condition	 = 	DIA_Gorax_Wurst_Condition;
	information	 = 	DIA_Gorax_Wurst_Info;
	permanent	 =  TRUE;
	description	 = 	"J'ai distribué les saucisses (tâche terminée).";
};
func int DIA_Gorax_Wurst_Condition ()
{
	if (MIS_GoraxEssen == LOG_RUNNING)
	&& (Mob_HasItems ("WURSTTRUHE",ItFo_SchafsWurst) == 0)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Wurst_Info ()
{
	AI_Output (other, self, "DIA_Gorax_Wurst_15_00"); //J'ai distribué les saucisses.
	
	if (Wurst_Gegeben >= 13)
	{
		AI_Output (self, other, "DIA_Gorax_Wurst_14_01"); //Et vous l'avez fait de manière équitable. Prenez ces parchemins de guérison et retournez au travail.
		
		MIS_GoraxEssen = LOG_SUCCESS; 
		B_GivePlayerXP (XP_GoraxEssen);
		B_GiveInvItems (self, other, ItSc_LightHeal,2);
	}
	else 
	{
		AI_Output (self, other, "DIA_Gorax_Wurst_14_02"); //Vraiment ? Alors vous n'avez pas dû faire beaucoup d'effort pour vous acquitter de votre tâche.
		AI_Output (self, other, "DIA_Gorax_Wurst_14_03"); //Soit vous avez mangé les saucisses vous-même, soit vous en avez donné plus à certains.
		AI_Output (self, other, "DIA_Gorax_Wurst_14_04"); //Ecoutez, puisque vous êtes nouveau, et uniquement pour cette raison, je veux bien passer l'éponge. Rappelez-vous-en novice !
		
		MIS_GoraxEssen = LOG_FAILED; 
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe 2
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Aufgabe2		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  3;
	condition	 = 	DIA_Gorax_Aufgabe2_Condition;
	information	 = 	DIA_Gorax_Aufgabe2_Info;
	permanent	 =  FALSE;
	description	 = 	"Avez-vous une autre tâche à me confier ?";
};
func int DIA_Gorax_Aufgabe2_Condition ()
{
	if ((MIS_GoraxEssen == LOG_SUCCESS)
	|| (MIS_GoraxEssen == LOG_FAILED))
	&& (Npc_IsDead (Orlan) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Aufgabe2_Info ()
{
	AI_Output (other, self, "DIA_Gorax_Aufgabe2_15_00"); //Avez-vous une autre tâche à me confier ?
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_01"); //Oui. Comme vous le savez, nous produisons un excellent vin que nous vendons.
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_02"); //Orlan, le propriétaire de l'auberge 'La Harpie Morte' m'en a commandé. Nous nous sommes mis d'accord pour un prix de 240 pièces d'or.
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_03"); //Apportez-lui ces bouteilles mais ne le laissez pas vous arnaquer.
	 
	B_GiveInvItems (self, other, ItFo_Wine,12);
	MIS_GoraxWein = LOG_RUNNING; 
	
	Log_CreateTopic (Topic_GoraxWein,LOG_MISSION);
	Log_SetTopicStatus (Topic_GoraxWein,LOG_RUNNING);
	B_LogEntry (Topic_GoraxWein,"Maître Gorax veut que j'apporte à Orlan, le propriétaire de l'auberge, douze bouteilles de vin. Le prix est de 240 pièces d'or.");
};
///////////////////////////////////////////////////////////////////////
//	Info Orlan
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Orlan		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  3;
	condition	 = 	DIA_Gorax_Orlan_Condition;
	information	 = 	DIA_Gorax_Orlan_Info;
	permanent	 =  TRUE;
	description	 = 	"Je suis allé voir Orlan.";
};
//----------------------------------
var int DIA_Gorax_Orlan_permanent;
//-----------------------------------
func int DIA_Gorax_Orlan_Condition ()
{
	if (MIS_GoraxWein == LOG_RUNNING)
	&& Npc_KnowsInfo (other, DIA_Orlan_Wein)
	&& (DIA_Gorax_Orlan_permanent == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Orlan_Info ()
{
	if (Npc_HasItems (other, ItmI_Gold) >= 100)
	{
		AI_Output (other, self, "DIA_Gorax_Orlan_15_00"); //Je suis allé voir Orlan.
		AI_Output (self, other, "DIA_Gorax_Orlan_14_01"); //Et avez-vous obtenu les 240 pièces d'or ?
	
		DIA_Gorax_Orlan_permanent = TRUE;
		Info_ClearChoices (DIA_Gorax_Orlan);
	
		Info_AddChoice (DIA_Gorax_Orlan,"Je me suis fait avoir ! (Donner 100 pièces d'or)",DIA_Gorax_Orlan_100);
		Info_AddChoice (DIA_Gorax_Orlan,"J'ai l'or. (Donner 240 pièces d'or)",DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_14_02"); //Qu'avez-vous fait de cet or ? Vous l'avez dépensé ? Allez en chercher et revenez !
		
	};
};
FUNC VOID DIA_Gorax_Orlan_100 ()
{
	AI_Output (other, self, "DIA_Gorax_Orlan_100_15_00"); //Il m'a arnaqué !
	AI_Output (self, other, "DIA_Gorax_Orlan_100_14_01"); //Vous lui avez vendu les bouteilles moins cher ? Oh non ! Pourquoi diable est-ce que je vous ai envoyé, vous ?
	AI_Output (self, other, "DIA_Gorax_Orlan_100_14_02"); //Vous êtes vraiment un bon à rien. Hors de ma vue !
	
	B_GiveInvItems (other, self, ItMI_Gold, 100);
	
	MIS_GoraxWein = LOG_FAILED;
	 
	Info_ClearChoices (DIA_Gorax_Orlan);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Gorax_Orlan_240 ()
{
	AI_Output (other, self, "DIA_Gorax_Orlan_240_15_00"); //J'ai votre or.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 240)	
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_240_14_01"); //Excellent. Vous êtes très utile. Prenez ce parchemin de soin en récompense. Et maintenant, allez vous trouver quelque chose à faire.
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP (XP_Goraxwein);			
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_240_14_02"); //Mais vous avez déjà dépensé une partie de l'argent, n'est-ce pas ? Vous êtes un bon à rien, fichez le camp !
		MIS_GoraxWein = LOG_FAILED; 
		B_GiveInvItems (other, self, ItMI_Gold, Npc_HasItems (other, ItmI_Gold));
	};
	
	Info_ClearChoices (DIA_Gorax_Orlan);
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_JOB		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  35;
	condition	 = 	DIA_Gorax_JOB_Condition;
	information	 = 	DIA_Gorax_JOB_Info;
	permanent	 =  FALSE;
	description	 = 	"Quel est votre travail ici ?";
};
func int DIA_Gorax_JOB_Condition ()
{
	return TRUE;
};
func void DIA_Gorax_JOB_Info ()
{
	AI_Output (other, self, "DIA_Gorax_JOB_15_00"); //Quel est votre travail ici ?
	AI_Output (self, other, "DIA_Gorax_JOB_14_01"); //Mes tâches sont nombreuses et variées. Non seulement je suis régisseur mais je suis aussi trésorier.
	AI_Output (self, other, "DIA_Gorax_JOB_14_02"); //De plus, je supervise les réserves de vin ainsi que les réserves de nourriture du monastère.
	AI_Output (self, other, "DIA_Gorax_JOB_14_03"); //Donc, si vous avez besoin de quelque chose vous pourrez l'obtenir auprès de ma personne en échange d'une modeste contribution.
	
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Maître Gorax peut me fournir tout ce dont j'ai besoin au monastère.");
};
///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_TRADE		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  99;
	condition	 = 	DIA_Gorax_TRADE_Condition;
	information	 = 	DIA_Gorax_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 =  TRUE;
	description	 = 	"J'ai besoin de quelques petits trucs...";
};
func int DIA_Gorax_TRADE_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Gorax_JOB)
	{
		return TRUE;
	};
};
func void DIA_Gorax_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Gorax_TRADE_15_00"); //J'ai besoin de quelques petites choses...
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP für KDF
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_KDF		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  5;
	condition	 = 	DIA_Gorax_KDF_Condition;
	information	 = 	DIA_Gorax_KDF_Info;
	permanent 	 =  FALSE;
	description	 = 	"J'ai besoin d'un nouvel endroit où dormir.";
};
func int DIA_Gorax_KDF_Condition ()
{
	if (other.guild == GIL_KDF) 
	{
		return TRUE;
	};
};
func void DIA_Gorax_KDF_Info ()
{
	AI_Output (other, self, "DIA_Gorax_KDF_15_00"); //J'ai besoin d'un nouvel endroit où dormir.
	AI_Output (self, other, "DIA_Gorax_KDF_14_01"); //Il y a une chambre libre sur la droite. Prenez la clef. Vous y trouverez tout ce dont vous avez besoin.
	
	B_GiveInvItems (self, other,ItKe_KDFPlayer,1);
	Wld_InsertItem (ItPo_Perm_Mana,"FP_ITEM_KDFPLAYER");
};
//########################################################################
//##
//##		Kapitel 2
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap2_EXIT_Condition;
	information = DIA_Gorax_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap2_EXIT_Condition()
{
	if (kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gorax_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//########################################################################
//##
//##		Kapitel 3
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap3_EXIT_Condition;
	information = DIA_Gorax_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap3_EXIT_Condition()
{
	if (kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gorax_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info KillPedro
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_KILLPEDRO		(C_INFO)
{
	npc		 = 	KDF_508_Gorax;
	nr		 = 	3;
	condition	 = 	DIA_Gorax_KILLPEDRO_Condition;
	information	 = 	DIA_Gorax_KILLPEDRO_Info;
	important	 = 	TRUE;
};

func int DIA_Gorax_KILLPEDRO_Condition ()
{
	if (Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void DIA_Gorax_KILLPEDRO_Info ()
{
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_00"); //Attendez, mercenaire. Je dois vous parler.
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_15_01"); //Que voulez-vous ?
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_02"); //Le monastère est dans une situation très délicate.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_03"); //En ce moment, plus personne ne se fait confiance. Et puis, ce qui est arrivé avec Pedro, c'est extrêmement... (gulps)
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_04"); //J'ai une mission pour vous, qui m'a été confiée par les plus hautes autorités. Vous n'êtes pas membre de la Confrérie du feu et vous êtes donc le seul à pouvoir résoudre ce problème.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_05"); //Mais je vous préviens, si je vous confie cette mission, vous serez obligé de la mener à bien. Une fois que vous saurez de quoi il s'agit, vous n'aurez plus le choix. Vous me comprenez ?
	
	Info_ClearChoices	(DIA_Gorax_KILLPEDRO);
	Info_AddChoice	(DIA_Gorax_KILLPEDRO, "Oubliez ça. C'est trop dangereux.", DIA_Gorax_KILLPEDRO_nein );
	Info_AddChoice	(DIA_Gorax_KILLPEDRO, "Dites-moi ce que vous voulez.", DIA_Gorax_KILLPEDRO_ja );
};
func void DIA_Gorax_KILLPEDRO_nein ()
{
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_nein_15_00"); //Laissez tomber. C'est trop risqué pour moi.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_nein_14_01"); //Très bien. Dans ce cas, oubliez tout ce que j'ai dit.
	AI_StopProcessInfos (self);
};

func void DIA_Gorax_KILLPEDRO_ja ()
{
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_ja_15_00"); //Dites-moi ce que vous voulez.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_01"); //Très bien. Alors écoutez bien, car je ne le répéterai pas.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_02"); //Serpentes veut que vous tuiez Pedro pour sa trahison quand vous le retrouverez.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_03"); //Vous serez payé dès que votre mission sera accomplie.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_04"); //Je n'ai rien dit et vous n'avez rien entendu, compris ?

 	B_LogEntry (TOPIC_TraitorPedro, "Gorax m'a dit que Serpentes voulait que je tue le traître Pedro si je croisais son chemin.");
	
	B_GivePlayerXP (XP_Gorax_KILLPEDRO_GotMission);
	MIS_Gorax_KillPedro = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

//########################################################################
//##
//##		Kapitel 4
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap4_EXIT_Condition;
	information = DIA_Gorax_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap4_EXIT_Condition()
{
	if (kapitel == 4)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gorax_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//########################################################################
//##
//##		Kapitel 5
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap5_EXIT_Condition;
	information = DIA_Gorax_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap5_EXIT_Condition()
{
	if (kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gorax_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};




 






























