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
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_00"); //Bienvenue au monast�re d'Innos, �tranger.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //Je suis le fr�re Pedro, humble serviteur d'Innos et gardien de la porte de notre monast�re sacr�.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //Que puis-je pour vous�?
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
	description = "Tenez, prenez une saucisse, fr�re.";
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
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //Tenez, voil� une saucisse pour vous, fr�re.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //C'est tr�s aimable � vous d'avoir pens� � moi. En g�n�ral, tout le monde m'oublie.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //Vous auriez pu m'en donner une autre.
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //N'y pensez m�me pas. Si je le faisais, il ne m'en resterait pas assez.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //H�! Une saucisse... personne ne s'en rendra compte. Et vous aurez quelque chose en �change�: je connais un endroit o� poussent les orties de feu.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //Si vous en amenez � N�oras, il vous donnera s�rement la clef de la biblioth�que. Alors, qu'est-ce que vous en dites�?
	
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
	Info_AddChoice (DIA_Pedro_Wurst,"Non, oubliez �a.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //Tr�s bien, prenez-en une autre.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //Merci. Vous trouverez des orties de feu de l'autre c�t� du pont, sur la gauche et la droite.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //Non, n'y songez pas.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //Vous voulez �tre en bons termes avec Gorax, hein�? C'est toujours la m�me chose avec les nouveaux novices...
	
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
	description	= 	"Je veux entrer au monast�re.";
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
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //Je voudrais entrer au monast�re.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //Seuls les serviteurs d'Innos ont le droit d'entrer dans le monast�re.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //Si vous voulez prier Innos, faites-le � l'un des sanctuaires �rig�s en bord de route. Vous y trouverez toute la tranquillit� n�cessaire.
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
	description	 = 	"Que dois-je faire pour �tre accept� au monast�re ?";
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
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //Que faut-il faire pour �tre accept� au sein du monast�re�?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //Vous avez d�j� choisi votre voie, vous ne pourrez pas �tre accept� par le monast�re.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //Si vous voulez faire partie de la confr�rie d'Innos, vous devez apprendre les r�gles du monast�re et leur ob�ir.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Au�erdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //De plus, nous exigeons de chaque nouveau novice un pr�sent en hommage � Innos.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //Un mouton et 1000 pi�ces d'or.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //Cela fait beaucoup d'or.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //C'est la preuve que vous voulez vraiment commencer une nouvelle vie en tant que serviteur d'Innos. Une fois que vous aurez �t� accept� dans nos rangs, toutes vos transgressions pass�es vous seront pardonn�es.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //Mais r�fl�chissez bien au fait qu'une fois que vous aurez pris la d�cision de servir Innos, il vous sera impossible de revenir en arri�re.
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Pour devenir novice au monast�re d'Innos, j'ai besoin d'un mouton et de beaucoup d'or.");
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
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //J'ai cette statuette avec moi. Je pense qu'au monast�re elle doit leur manquer.
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //Puis-je entrer maintenant ?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //Bien, gr�ce � ces circonstances vraiment exceptionnelles, vous �tes libre de devenir novice.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Pedro le novice m'a autoris� � entrer dans le monast�re parce que je d�tenais la statuette manquante. Je devrais la remettre � quelqu'un dans le monast�re."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //Je suis d�sol� mais je ne peux pas vous laisser entrer m�me avec cette pierre pr�cieuse.
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //Vous avez d�j� d�cid� de prendre un autre chemin. Le chemin du monast�re vous est ferm�.
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
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //Bien s�r, j'en prendrai soin. Merci pour votre g�n�rosit
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
	description	 = 	"A quelles r�gles devez-vous vous soumettre ?";
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
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //Quelles sont les r�gles que vous devez suivre�?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //Innos est le dieu de la V�rit� et de la Loi. Il nous est donc formellement interdit de mentir ou de commettre le moindre crime.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //Si jamais vous volez l'un des n�tres ou vous rendez coupable d'une transgression vis-�-vis de l'un de nos fr�res, vous devrez en payer le prix.
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //Innos est �galement le dieu de l'Autorit� et du Feu.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //En tant que novice, vous devrez donc respect et ob�issance � tous les Magiciens du feu.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //Je vois.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //De plus, il sera de votre devoir de vous charger de tout le travail devant �tre accompli � l'int�rieur du monast�re, pour le bien de la communaut�.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //Si vous vous sentez pr�t � suivre ses r�gles et si vous avez de quoi faire votre offrande � Innos, nous sommes d'accord pour vous accepter au sein du monast�re en tant que novice.
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
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Je vais encore r�fl�chir.",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Oui, je veux vouer ma vie au service d'Innos.",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //Je souhaiterais devenir novice.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //Vous avez d�j� choisi votre voie et celle de la magie vous est d�sormais interdite.
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
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //Je vois que vous avez apport� l'offrande requise. Si vous le souhaitez vraiment, vous pouvez d�sormais devenir novice.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //Mais ayez bien � l'esprit qu'il vous sera par la suite impossible de faire machine arri�re, alors, r�fl�chissez bien avant de prendre votre d�cision. Cette voie est-elle vraiment celle que vous voulez suivre�?
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //Vous n'avez pas amen� l'offrande requise.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //Oui, je veux consacrer mon existence � servir Innos.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //En ce cas, soyez le bienvenu, fr�re. Voici la cl� du monast�re.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //C'est � vous d'ouvrir la porte afin de montrer que votre d�cision a �t� prise librement.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //Vous voil� d�sormais novice. Portez cette robe en signe de votre appartenance � la confr�rie.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //Une fois � l'int�rieur du monast�re, allez trouver Parlan. C'est lui qui se chargera de vous � partir de maintenant.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //Mes transgressions pass�es sont-elles pardonn�es�?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //Pas encore. Allez voir le p�re Parlan. Il vous b�nira et vous lavera de vos p�ch�s.
	
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
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //Je vais y r�fl�chir.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //Revenez quand vous serez pr�t.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erz�hl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"Parlez-moi de la vie au monast�re.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //Parlez-moi de la vie au monast�re.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //Nous vivons au monast�re afin de servir Innos. Nous autres novices, nous travaillons et nous �tudions les textes sacr�s chaque fois que nous en avons l'occasion.
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















