
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Opolos_Kap1_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap1_EXIT_Condition;
	information = DIA_Opolos_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//		Hello
//*********************************************************************
INSTANCE DIA_Opolos_Hello   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 1;
	condition   = DIA_Opolos_Hello_Condition;
	information = DIA_Opolos_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Opolos_Hello_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_Hello_Info()
{
	AI_Output (self ,other,"DIA_Opolos_Hello_12_00"); //Bonjour. J'imagine que c'est vous le nouveau...
	AI_Output (self ,other,"DIA_Opolos_Hello_12_01"); //Je suis Opolos. C'est moi qui garde les moutons.
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Opolos_Wurst(C_INFO)
{
	npc         = NOV_605_Opolos;
	nr			= 2;
	condition	= DIA_Opolos_Wurst_Condition;
	information	= DIA_Opolos_Wurst_Info;
	permanent	= FALSE;
	description = "J'ai cette saucisse d'agneau...";
};                       

FUNC INT DIA_Opolos_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Opolos_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Opolos_Wurst_15_00"); //J'ai l� une saucisse d'agneau...
	AI_Output (self, other, "DIA_Opolos_Wurst_12_01"); //Splendide�! J'adore �a�!
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//*********************************************************************
//		Seit wann bist Du hier?
//*********************************************************************
INSTANCE DIA_Opolos_HowLong   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 1;
	condition   = DIA_Opolos_HowLong_Condition;
	information = DIA_Opolos_HowLong_Info;
	permanent   = FALSE;
	description	= "Depuis combien de temps �tes-vous au monast�re ?";
};
FUNC INT DIA_Opolos_HowLong_Condition()
{
	if Npc_KnowsInfo (hero, DIA_Opolos_Hello)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_HowLong_Info()
{
	AI_Output (other,self ,"DIA_Opolos_HowLong_15_00"); //Depuis quand �tes-vous au monast�re�?
	AI_Output (self ,other,"DIA_Opolos_HowLong_12_01"); //�a fait trois ans que je suis ici, mais je n'ai pas encore eu l'occasion d'�tudier. J'aimerais bien pourtant...
	AI_Output (other,self ,"DIA_Opolos_HowLong_15_02"); //Et pourquoi ?
	AI_Output (self ,other,"DIA_Opolos_HowLong_12_03"); //Mon travail consiste � garder les moutons, pas � �tudier les textes sacr�s.
	AI_Output (self ,other,"DIA_Opolos_HowLong_12_04"); //Et tant que p�re Parlan de m'aura pas lib�r� de mon devoir, je n'aurai pas le droit de me rendre � la biblioth�que.
	
	MIS_HelpOpolos = LOG_RUNNING;
	Log_CreateTopic (Topic_OpolosStudy,LOG_MISSION);
	Log_SetTopicStatus (Topic_OpolosStudy,LOG_RUNNING);
	B_LogEntry (Topic_OpolosStudy,"Opolos garde les moutons. Il aimerait pouvoir �tudier les manuscrits de la biblioth�que.");
};
//*********************************************************************
//		Auf was muss ich hier im Kloster achten?
//*********************************************************************
INSTANCE DIA_Opolos_Monastery   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_Monastery_Condition;
	information = DIA_Opolos_Monastery_Info;
	permanent   = FALSE;
	description	= "Comment dois-je me comporter au monast�re ?";
};
FUNC INT DIA_Opolos_Monastery_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Opolos_Hello)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Monastery_Info()
{
	AI_Output (other,self ,"DIA_Opolos_Monastery_15_00"); //Comment faut-il se comporter au monast�re�?
	AI_Output (self ,other,"DIA_Opolos_Monastery_12_01"); //Il ne faut jamais mentir aux magiciens ni commettre la moindre transgression contre les fr�res de la communaut�.
	AI_Output (self ,other,"DIA_Opolos_Monastery_12_02"); //Et respectez la propri�t� de tous. Si vous allez � l'encontre de ces r�gles, p�re Parlan vous en fera payer le prix.
	AI_Output (self ,other,"DIA_Opolos_Monastery_12_03"); //Sinon, je vous conseille de faire attention � Agon. Soyez prudent si vous ne voulez pas finir comme Babo.
};
//*********************************************************************
//		Kannst du mir was beibringen?
//*********************************************************************
INSTANCE DIA_Opolos_beibringen   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_beibringen_Condition;
	information = DIA_Opolos_beibringen_Info;
	permanent   = FALSE;
	description	= "Pouvez-vous m'enseigner quelque chose ?";
};
FUNC INT DIA_Opolos_beibringen_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Opolos_Hello)
	&& ((other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_beibringen_Info()
{
	AI_Output (other,self ,"DIA_Opolos_beibringen_15_00"); //Y a-t-il quelque chose que vous pouvez m'apprendre ?
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_01"); //Bien s�r. Autrefois, je cognais souvent les autres. Je peux vous montrer comment se muscler les bras.
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_02"); //Mais j'aimerais bien en savoir davantage sur les potions, surtout magiques.
	AI_Output (other,self ,"DIA_Opolos_beibringen_15_03"); //En quoi puis-je vous aider pour cela�?
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_04"); //Si vous travaillez pour N�oras, vous aurez sans doute l'occasion 'd'emprunter' l'une de ses recettes pendant quelque temps.
	AI_Output (self ,other,"DIA_Opolos_beibringen_12_05"); //Je vous ferai profiter de mes conseils si vous me l'amenez afin que je puisse y jeter un �il.
	
	Log_CreateTopic (Topic_OpolosRezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosRezept,LOG_RUNNING);
	B_LogEntry (Topic_OpolosRezept,"Opolos veut jeter un rapide coup d'�il � une recette pour cr�er des potions de mana. Travaillant pour N�oras, je devrais pouvoir l'emprunter.");
};
//*********************************************************************
// rezept
//*********************************************************************
INSTANCE DIA_Opolos_rezept   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_rezept_Condition;
	information = DIA_Opolos_rezept_Info;
	permanent   = TRUE;
	description	= "Au sujet de la recette...";
};
//-----------------------------------
var int DIA_Opolos_rezept_permanent;
//-----------------------------------
FUNC INT DIA_Opolos_rezept_Condition()
{	
	if Npc_KnowsInfo (hero, DIA_Opolos_beibringen)
	&& (other.guild == GIL_NOV)
	&& (DIA_Opolos_rezept_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_rezept_Info()
{
	if (Npc_HasItems (other, ItWr_Manarezept) >= 1)
	{
		AI_Output (other,self ,"DIA_Opolos_rezept_15_00"); //J'ai la recette que vous vouliez.
		AI_Output (self ,other,"DIA_Opolos_rezept_12_01"); //Bien. Laissez-moi la lire.
		B_UseFakeScroll ();
		AI_Output (self ,other,"DIA_Opolos_rezept_12_02"); //Ah-ha�! Hmm... oui... je vois... eh bien, voyez-vous �a...
		B_UseFakeScroll ();
		AI_Output (self ,other,"DIA_Opolos_rezept_12_03"); //Parfait. Merci beaucoup. Si vous voulez, vous pouvez vous entra�ner avec moi.
		
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		
		Opolos_Rezept = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
		
		Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry (Topic_KlosterTeacher,"Opolos peut m'aider � devenir plus fort.");

	}
	else if (MIS_NEORASRezept == LOG_SUCCESS)
	{
		AI_Output (other,self ,"DIA_Opolos_rezept_15_04"); //J'ai d�j� ramen� la recette � N�oras.
		AI_Output (self ,other,"DIA_Opolos_rezept_12_05"); //Oh, mince�! Je ne pourrai sans doute jamais �tudier ici. Bon, j'accepte quand m�me de vous entra�ner.
		
		Opolos_Rezept = LOG_FAILED;
		
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		
		Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry (Topic_KlosterTeacher,"Opolos peut m'aider � devenir plus fort.");
	}
	else 
	{
		AI_Output (other,self ,"DIA_Opolos_rezept_15_06"); //J'y reviendrai plus tard.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH_STR
///////////////////////////////////////////////////////////////////////
instance DIA_Opolos_TEACH_STR		(C_INFO)
{
	npc			 = 	NOV_605_Opolos;
	nr 			 =  99;
	condition	 = 	DIA_Opolos_TEACH_STR_Condition;
	information	 = 	DIA_Opolos_TEACH_STR_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux me muscler.";
};
func int DIA_Opolos_TEACH_STR_Condition ()
{	
	if (hero.guild == GIL_KDF
	||  hero.guild == GIL_NOV) 
	&& (Opolos_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Opolos_TEACH_STR_Info ()
{
		AI_Output (other, self, "DIA_Opolos_TEACH_STR_15_00"); //Je souhaite devenir plus fort.
		
		Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
		Info_AddChoice 		(DIA_Opolos_TEACH_STR,DIALOG_BACK,DIA_Opolos_TEACH_STR_BACK);		
		Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Opolos_TEACH_STR_1);
		Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Opolos_TEACH_STR_5);
};
FUNC VOID DIA_Opolos_TEACH_STR_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_MED)  
	{
		AI_Output (self, other, "DIA_Opolos_TEACH_STR_12_00"); //Vous �tes tr�s fort maintenant. Je n'ai rien d'autre � vous apprendre.
	};
	
	Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
};
FUNC VOID DIA_Opolos_TEACH_STR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
	Info_AddChoice 		(DIA_Opolos_TEACH_STR,DIALOG_BACK,DIA_Opolos_TEACH_STR_BACK);		
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Opolos_TEACH_STR_1);
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Opolos_TEACH_STR_5);
};
FUNC VOID DIA_Opolos_TEACH_STR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices   (DIA_Opolos_TEACH_STR);	
	Info_AddChoice 		(DIA_Opolos_TEACH_STR,DIALOG_BACK,DIA_Opolos_TEACH_STR_BACK);		
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Opolos_TEACH_STR_1);
	Info_AddChoice		(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Opolos_TEACH_STR_5);
};
//*********************************************************************
//		Wer ist Agon?
//*********************************************************************
INSTANCE DIA_Opolos_Agon   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 4;
	condition   = DIA_Opolos_Agon_Condition;
	information = DIA_Opolos_Agon_Info;
	permanent   = FALSE;
	description	= "Qui sont Agon et Babo ?";
};
FUNC INT DIA_Opolos_Agon_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Opolos_Monastery))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Agon_Info()
{
	AI_Output (other,self ,"DIA_Opolos_Agon_15_00"); //Qui sont Agon et Babo�?
	AI_Output (self ,other,"DIA_Opolos_Agon_12_01"); //Agon s'occupe du jardin d'herbes ar�matiques. C'est un novice lui aussi mais il se comporte comme s'il �tait l'Elu.
	AI_Output (self ,other,"DIA_Opolos_Agon_12_02"); //Babo est arriv� au monast�re peu de temps avant vous. Au d�but, il a aid� Agon � s'occuper du jardin...
	AI_Output (self ,other,"DIA_Opolos_Agon_12_03"); //Mais ils ont d� se disputer et, depuis, Babo est condamn� � balayer la cour.
	AI_Output (other,self ,"DIA_Opolos_Agon_15_04"); //Savez-vous ce qui s'est pass�?
	AI_Output (self ,other,"DIA_Opolos_Agon_12_05"); //Pas vraiment. Il faudra le leur demander � eux. Mais la parole d'Agon a plus de poids que celle de n'importe quel autre novice car c'est le neveu du gouverneur.
};
///////////////////////////////////////////////////////////////////////
//	Info SHEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Opolos_LIESEL		(C_INFO)
{
	npc			 = 	NOV_605_Opolos;
	nr			 =  2;
	condition	 = 	DIA_Opolos_LIESEL_Condition;
	information	 = 	DIA_Opolos_LIESEL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Regardez, j'ai amen� Betsy.";
};
func int DIA_Opolos_LIESEL_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (Liesel_Giveaway == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Opolos_LIESEL_Info ()
{
	
	
	AI_Output (other, self, "DIA_Opolos_LIESEL_15_00"); //J'ai Betsy avec moi. Puis-je vous la confier�?
	
	Npc_PerceiveAll (self);
	
	if  Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 800)
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = ZS_MM_AllScheduler; 
		
		Liesel_Giveaway = TRUE;
		AI_Output (self, hero, "DIA_Opolos_LIESEL_12_01"); //Bien s�r. Belle b�te. Je vais m'occuper d'elle.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (other, self, "DIA_Opolos_Add_15_00"); //Hmm... j'ai l'impression que je l'ai perdue. Je reviendrai plus tard.
	};
	
	
	
};
//*********************************************************************
//	Wegen der  Biblothek... 
//*********************************************************************
INSTANCE DIA_Opolos_Biblothek   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 98;
	condition   = DIA_Opolos_Biblothek_Condition;
	information = DIA_Opolos_Biblothek_Info;
	permanent   = TRUE;
	description	= "A propos de la biblioth�que...";
};
FUNC INT DIA_Opolos_Biblothek_Condition()
{
	if (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other, DIA_Opolos_HowLong)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_Biblothek_Info()
{
	AI_Output (other ,self,"DIA_Opolos_Biblothek_15_00"); //A propos de la biblioth�que...
	
	if (Parlan_Erlaubnis == FALSE)
	{
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_01"); //C'est la pi�ce ferm�e � cl� sur la gauche, � proximit� de la grande porte.
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_02"); //Mais vous n'obtiendrez la cl� que si p�re Parlan d�cide que vous �tes digne d'�tudier l�.
	}
	else
	{
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_03"); //Esp�ce de veinard�! Vous avez eu la cl� de la biblioth�que alors que vous venez d'arriver�!
		AI_Output (self ,other,"DIA_Opolos_Biblothek_12_04"); //Profitez de votre chance insolente pour �tudier les textes sacr�s.
	};
	
	
	AI_StopProcessInfos (self);
};
//*********************************************************************
//		Sc hat Opolos das Studieren erm�glicht (Kap. 2)
//*********************************************************************
INSTANCE DIA_Opolos_HelloAgain   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 2;
	condition   = DIA_Opolos_HelloAgain_Condition;
	information = DIA_Opolos_HelloAgain_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Opolos_HelloAgain_Condition()
{
	if (other.guild == GIL_KDF)
	&& (MIS_HelpOpolos == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_HelloAgain_Info()
{
	AI_Output (self ,other,"DIA_Opolos_HelloAgain_12_00"); //Merci de m'avoir aid�. Je vais tout faire pour profiter de cette occasion d'apprendre.
	AI_Output (self ,other,"DIA_Opolos_HelloAgain_12_01"); //Mais j'imagine que vous n'avez pas le temps de parler � un humble novice, ma�tre.
	
	B_GivePlayerXP (XP_Ambient); 
	AI_StopProcessInfos (self);
};

//*********************************************************************
//		Sc hat Opolos zum Einkaufen geschickt (Kap. 2)
//*********************************************************************
INSTANCE DIA_Opolos_HowIsIt   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 3;
	condition   = DIA_Opolos_HowIsIt_Condition;
	information = DIA_Opolos_HowIsIt_Info;
	permanent   = TRUE;
	description	= "Comment �a va ?";
};
FUNC INT DIA_Opolos_HowIsIt_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Opolos_HowIsIt_Info()
{
	AI_Output (other,self ,"DIA_Opolos_HowIsIt_15_00"); //Comment �a se passe ?
	
	if (MIS_HelpOpolos == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Opolos_HowIsIt_12_01"); //On ne peut mieux�! Tout est merveilleux depuis que j'ai le droit d'�tudier.
	}
	else
	{
		AI_Output (self ,other,"DIA_Opolos_HowIsIt_12_02"); //Je m'acquitte loyalement de toutes les t�ches qui me sont confi�es, ma�tre.
		AI_Output (self ,other,"DIA_Opolos_HowIsIt_12_03"); //Chaque jour, Innos me propose de nouveaux d�fis et je continue de travailler afin de m'am�liorer sans cesse.
	};
	
	AI_StopProcessInfos (self);
};

//##########################################
//##
//##	Kapitel 2
//##
//##########################################

INSTANCE DIA_Opolos_Kap2_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap2_EXIT_Condition;
	information = DIA_Opolos_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##########################################
//##
//##	Kapitel 3
//##
//##########################################

INSTANCE DIA_Opolos_Kap3_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap3_EXIT_Condition;
	information = DIA_Opolos_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*************************************************************
//	Was amchen die Schafe?
//************************************************************

INSTANCE DIA_Opolos_Kap3_PERM   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 39;
	condition   = DIA_Opolos_Kap3_PERM_Condition;
	information = DIA_Opolos_Kap3_PERM_Info;
	permanent   = TRUE;
	description = "Comment vont les moutons ?";
};
FUNC INT DIA_Opolos_Kap3_PERM_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap3_PERM_Info()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_15_00"); //Comment vont les moutons�?
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_12_01"); //A votre avis�? Ils passent leur temps � brouter.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_12_02"); //J'aimerais bien savoir ce qui se passe au dehors. Les magiciens ont l'air tr�s nerveux...

	Info_ClearChoices (DIA_Opolos_Kap3_PERM);
	Info_AddChoice (DIA_Opolos_Kap3_PERM,DIALOG_BACK,DIA_Opolos_Kap3_PERM_BACK);
	Info_AddChoice (DIA_Opolos_Kap3_PERM,"Il y a des dragons dans la Vall�e des mines.",DIA_Opolos_Kap3_PERM_DRAGONS);
	Info_AddChoice (DIA_Opolos_Kap3_PERM,"Des �trangers en robe noire r�dent dans le pays.",DIA_Opolos_Kap3_PERM_DMT);
	
	if (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Opolos_Kap3_PERM,"Pedro nous a trahis.",DIA_Opolos_Kap3_PERM_PEDRO);
	};
};

FUNC VOID DIA_Opolos_Kap3_PERM_BACK()
{
	Info_ClearChoices (DIA_Opolos_Kap3_PERM);
};

var int Opolos_Dragons;

FUNC VOID DIA_Opolos_Kap3_PERM_DRAGONS()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00"); //Il y a des dragons dans la Vall�e des mines. Ils assi�gent les troupes du roi avec l'arm�e des orques.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01"); //Des dragons�? Et moi qui pensais qu'ils n'existaient que dans les histoires qui font peur...
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02"); //Oh, vous pouvez me croire, ils existent bel et bien...
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03"); //Mais les paladins du roi vont s'en charger, n'est-ce pas�?
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04"); //Nous verrons bien.
	
	if (Opolos_Dragons == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		Opolos_Dragons = TRUE;
	};	
};

var int Opolos_DMT;

FUNC VOID DIA_Opolos_Kap3_PERM_DMT()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DMT_15_00"); //Des �trangers en robe noire r�dent dans la r�gion.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DMT_12_01"); //Que voulez-vous dire�? Quel genre d'�trangers�?
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DMT_15_02"); //Nul ne sait d'o� ils viennent. Ils portent de longues robes noires et se dissimulent le visage.
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_DMT_15_03"); //Apparemment, il s'agirait de magiciens... ou, du moins, ils sont capables de faire appel � la magie.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_DMT_12_04"); //Voil� qui a l'air tr�s inqui�tant, mais je suis persuad� que le Haut Conseil r�soudra le probl�me.
	
	if (Opolos_DMT == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		Opolos_DMT = TRUE;
	};	
};

var int Opolos_Pedro;

FUNC VOID DIA_Opolos_Kap3_PERM_PEDRO()
{
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_PEDRO_15_00"); //Pedro nous a trahis.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01"); //Je l'avais entendu dire, mais j'ignorais que vous �tiez au courant vous aussi. C'est pour cela que je n'en ai pas parl�.
	AI_Output (self ,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02"); //Est-ce que l'ennemi est plus fort que nous�? Enfin, je veux dire... avons-nous une chance de l'emporter�?
	AI_Output (other,self ,"DIA_Opolos_Kap3_PERM_PEDRO_15_03"); //Nous ne sommes pas encore morts.
	
	if (Opolos_Pedro == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		Opolos_Pedro = TRUE;
	};
};
//##########################################
//##
//##	Kapitel 4
//##
//##########################################

INSTANCE DIA_Opolos_Kap4_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999; 
	condition   = DIA_Opolos_Kap4_EXIT_Condition;
	information = DIA_Opolos_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##########################################
//##
//##	Kapitel 5
//##
//##########################################

INSTANCE DIA_Opolos_Kap5_EXIT   (C_INFO)
{
	npc         = NOV_605_Opolos;
	nr          = 999;
	condition   = DIA_Opolos_Kap5_EXIT_Condition;
	information = DIA_Opolos_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Opolos_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Opolos_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Opolos_PICKPOCKET (C_INFO)
{
	npc			= NOV_605_Opolos;
	nr			= 900;
	condition	= DIA_Opolos_PICKPOCKET_Condition;
	information	= DIA_Opolos_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Opolos_PICKPOCKET_Condition()
{
	C_Beklauen (54, 70);
};
 
FUNC VOID DIA_Opolos_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Opolos_PICKPOCKET);
	Info_AddChoice		(DIA_Opolos_PICKPOCKET, DIALOG_BACK 		,DIA_Opolos_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Opolos_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Opolos_PICKPOCKET_DoIt);
};

func void DIA_Opolos_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Opolos_PICKPOCKET);
};
	
func void DIA_Opolos_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Opolos_PICKPOCKET);
};


