///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro;
	nr          = 999;
	condition   = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_WELCOME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 =  1;
	condition	 = 	DIA_Pedro_WELCOME_Condition;
	information	 = 	DIA_Pedro_WELCOME_Info;
	important	 = 	TRUE;
};
func int DIA_Pedro_WELCOME_Condition ()
{
	return TRUE;
};
func void DIA_Pedro_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_00"); //Bienvenue au monastère d'Innos, étranger.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //Je suis le frère Pedro, humble serviteur d'Innos et gardien de la porte de notre monastère sacré.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //Que puis-je pour vous ?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Pedro_Wurst(C_INFO)
{
	npc         = NOV_600_Pedro;
	nr			= 2;
	condition	= DIA_Pedro_Wurst_Condition;
	information	= DIA_Pedro_Wurst_Info;
	permanent	= FALSE;
	description = "Tenez, prenez une saucisse, frère.";
};                       

FUNC INT DIA_Pedro_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pedro_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //Tenez, voilà une saucisse pour vous, frère.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //C'est très aimable à vous d'avoir pensé à moi. En général, tout le monde m'oublie.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //Vous auriez pu m'en donner une autre.
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //N'y pensez même pas. Si je le faisais, il ne m'en resterait pas assez.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //Hé ! Une saucisse... personne ne s'en rendra compte. Et vous aurez quelque chose en échange : je connais un endroit où poussent les orties de feu.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //Si vous en amenez à Néoras, il vous donnera sûrement la clef de la bibliothèque. Alors, qu'est-ce que vous en dites ?
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Pedro_Wurst);
	Info_AddChoice (DIA_Pedro_Wurst,"D'accord, une autre saucisse.",DIA_Pedro_Wurst_JA);
	Info_AddChoice (DIA_Pedro_Wurst,"Non, oubliez ça.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //Très bien, prenez-en une autre.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //Merci. Vous trouverez des orties de feu de l'autre côté du pont, sur la gauche et la droite.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //Non, n'y songez pas.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //Vous voulez être en bons termes avec Gorax, hein ? C'est toujours la même chose avec les nouveaux novices...
	
	Info_ClearChoices (DIA_Pedro_Wurst);
};
///////////////////////////////////////////////////////////////////////
//	Info EINLASS
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EINLASS		(C_INFO)
{
	npc			= 	NOV_600_Pedro;
	condition	= 	DIA_Pedro_EINLASS_Condition;
	information	= 	DIA_Pedro_EINLASS_Info;
	permanent	=	FALSE;
	description	= 	"Je veux entrer au monastère.";
};
func int DIA_Pedro_EINLASS_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Pedro_Welcome)
	{
		return TRUE;
	};
};
func void DIA_Pedro_EINLASS_Info ()
{
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //Je voudrais entrer au monastère.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //Seuls les serviteurs d'Innos ont le droit d'entrer dans le monastère.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //Si vous voulez prier Innos, faites-le à l'un des sanctuaires érigés en bord de route. Vous y trouverez toute la tranquillité nécessaire.
};
///////////////////////////////////////////////////////////////////////
//	Info TEMPEL
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_TEMPEL		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_TEMPEL_Condition;
	information	 = 	DIA_Pedro_TEMPEL_Info;
	permanent 	 =  FALSE;
	description	 = 	"Que dois-je faire pour être accepté au monastère ?";
};
//-----------------------------------

//-----------------------------------
func int DIA_Pedro_TEMPEL_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Pedro_EINLASS))
	&& (hero.guild != GIL_NOV)
	{	
		return TRUE;
	};	
};
func void DIA_Pedro_TEMPEL_Info ()
{	
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //Que faut-il faire pour être accepté au sein du monastère ?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //Vous avez déjà choisi votre voie, vous ne pourrez pas être accepté par le monastère.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //Si vous voulez faire partie de la confrérie d'Innos, vous devez apprendre les règles du monastère et leur obéir.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Außerdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //De plus, nous exigeons de chaque nouveau novice un présent en hommage à Innos.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //Un mouton et 1000 pièces d'or.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //Cela fait beaucoup d'or.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //C'est la preuve que vous voulez vraiment commencer une nouvelle vie en tant que serviteur d'Innos. Une fois que vous aurez été accepté dans nos rangs, toutes vos transgressions passées vous seront pardonnées.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //Mais réfléchissez bien au fait qu'une fois que vous aurez pris la décision de servir Innos, il vous sera impossible de revenir en arrière.
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Pour devenir novice au monastère d'Innos, j'ai besoin d'un mouton et de beaucoup d'or.");
 	};
};

//*********************************************************************
//	ADDON Statuette
//*********************************************************************
instance DIA_Addon_Pedro_Statuette (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Info;
	permanent	 = 	FALSE;
	description	 = 	"J'ai sur moi cette statuette...";
};
func int DIA_Addon_Pedro_Statuette_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Pedro_Rules))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //J'ai cette statuette avec moi. Je pense qu'au monastère elle doit leur manquer.
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //Puis-je entrer maintenant ?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //Bien, grâce à ces circonstances vraiment exceptionnelles, vous êtes libre de devenir novice.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Pedro le novice m'a autorisé à entrer dans le monastère parce que je détenais la statuette manquante. Je devrais la remettre à quelqu'un dans le monastère."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //Je suis désolé mais je ne peux pas vous laisser entrer même avec cette pierre précieuse.
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //Vous avez déjà décidé de prendre un autre chemin. Le chemin du monastère vous est fermé.
	};
};

instance DIA_Addon_Pedro_Statuette_Abgeben (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent	 = 	FALSE;
	description	 = 	"Puis-je vous remettre la statuette ?";
};
func int DIA_Addon_Pedro_Statuette_Abgeben_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (Npc_KnowsInfo (other,DIA_Addon_Pedro_Statuette))
	&& (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //Puis-je vous remettre la statuette ?
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //Bien sûr, j'en prendrai soin. Merci pour votre générosit
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};
///////////////////////////////////////////////////////////////////////
//	Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_Rules		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_Rules_Condition;
	information	 = 	DIA_Pedro_Rules_Info;
	permanent	 = 	FALSE;
	description	 = 	"A quelles règles devez-vous vous soumettre ?";
};
func int DIA_Pedro_Rules_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Pedro_Tempel)
	{
		return TRUE;
	};
};
func void DIA_Pedro_Rules_Info ()
{
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //Quelles sont les règles que vous devez suivre ?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //Innos est le dieu de la Vérité et de la Loi. Il nous est donc formellement interdit de mentir ou de commettre le moindre crime.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //Si jamais vous volez l'un des nôtres ou vous rendez coupable d'une transgression vis-à-vis de l'un de nos frères, vous devrez en payer le prix.
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //Innos est également le dieu de l'Autorité et du Feu.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //En tant que novice, vous devrez donc respect et obéissance à tous les Magiciens du feu.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //Je vois.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //De plus, il sera de votre devoir de vous charger de tout le travail devant être accompli à l'intérieur du monastère, pour le bien de la communauté.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //Si vous vous sentez prêt à suivre ses règles et si vous avez de quoi faire votre offrande à Innos, nous sommes d'accord pour vous accepter au sein du monastère en tant que novice.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_AUFNAHME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	condition	 = 	DIA_Pedro_AUFNAHME_Condition;
	information	 = 	DIA_Pedro_AUFNAHME_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Je veux devenir novice.";
};
var int DIA_Pedro_AUFNAHME_NOPERM;
func int DIA_Pedro_AUFNAHME_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pedro_Rules)
	&& (DIA_Pedro_AUFNAHME_NOPERM == FALSE)
	{
		return TRUE;
	};
};
func void B_DIA_Pedro_AUFNAHME_Choice ()
{
		Info_ClearChoices (DIA_Pedro_AUFNAHME);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Je vais encore réfléchir.",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Oui, je veux vouer ma vie au service d'Innos.",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //Je souhaiterais devenir novice.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //Vous avez déjà choisi votre voie et celle de la magie vous est désormais interdite.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	//ADDON>
	else if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output (self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //Est-ce vraiment ce que vous souhaitez ? Vous devez savoir que vous ne pourrez pas faire demi-tour.
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	//<ADDON
	else if (hero.guild == GIL_NONE )
	&& (Npc_HasItems (hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 1000)
	{
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //Je vois que vous avez apporté l'offrande requise. Si vous le souhaitez vraiment, vous pouvez désormais devenir novice.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //Mais ayez bien à l'esprit qu'il vous sera par la suite impossible de faire machine arrière, alors, réfléchissez bien avant de prendre votre décision. Cette voie est-elle vraiment celle que vous voulez suivre ?
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //Vous n'avez pas amené l'offrande requise.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //Oui, je veux consacrer mon existence à servir Innos.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //En ce cas, soyez le bienvenu, frère. Voici la clé du monastère.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //C'est à vous d'ouvrir la porte afin de montrer que votre décision a été prise librement.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //Vous voilà désormais novice. Portez cette robe en signe de votre appartenance à la confrérie.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //Une fois à l'intérieur du monastère, allez trouver Parlan. C'est lui qui se chargera de vous à partir de maintenant.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //Mes transgressions passées sont-elles pardonnées ?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //Pas encore. Allez voir le père Parlan. Il vous bénira et vous lavera de vos péchés.
	
	CreateInvItems 		(self,ItKe_Innos_MIS,1);
	B_GiveInvItems 		(self, hero, ItKe_Innos_MIS,1); 
	
	CreateInvItems 		(other,ITAR_NOV_L,1);
	AI_EquipArmor		(other,ITAR_NOV_L);		   
	
	other.guild = GIL_NOV;
	Npc_SetTrueGuild (other, GIL_NOV);
	
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP (XP_AufnahmeNovize);
	
	//ADDON>
 	if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
 	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE; //Joly: nix mehr mit Liesel
	};
	//ADDON<
	
	Wld_AssignRoomToGuild ("Kloster02",GIL_KDF);
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pedro_AUFNAHME_NO()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //Je vais y réfléchir.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //Revenez quand vous serez prêt.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erzähl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"Parlez-moi de la vie au monastère.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //Parlez-moi de la vie au monastère.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //Nous vivons au monastère afin de servir Innos. Nous autres novices, nous travaillons et nous étudions les textes sacrés chaque fois que nous en avons l'occasion.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_02"); //Les magiciens nous surveillent tout en explorant les arts magiques.
}; 




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pedro_PICKPOCKET (C_INFO)
{
	npc			= NOV_600_Pedro;
	nr			= 900;
	condition	= DIA_Pedro_PICKPOCKET_Condition;
	information	= DIA_Pedro_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Pedro_PICKPOCKET_Condition()
{
	C_Beklauen (45, 60);
};
 
FUNC VOID DIA_Pedro_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pedro_PICKPOCKET);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_BACK 		,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};
	
func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};















