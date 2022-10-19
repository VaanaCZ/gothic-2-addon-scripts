//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_EXIT   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 999;
	condition   = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Emilio_PICKPOCKET (C_INFO)
{
	npc			= BDT_10015_Addon_Emilio;
	nr			= 900;
	condition	= DIA_Addon_Emilio_PICKPOCKET_Condition;
	information	= DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	C_Beklauen (76, 112);
};
 
FUNC VOID DIA_Addon_Emilio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
	
func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Hi   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Emilio_Hi_Info;
	permanent   = FALSE;
	description	= "Vous m'avez tout l'air d'un mineur.";
};
FUNC INT DIA_Addon_Emilio_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Hi_15_00");//Vous m'avez tout l'air d'un mineur.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Hi_10_01");//Je suis un mineur. J'ai travaill� comme un damn�, la derni�re fois que je suis descendu � la mine.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//----------------------------------------------------------------------
//	Info Gold
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Gold   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 2;
	condition   = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent   = FALSE;
	description	= "Que devient l'or extrait de la mine ?";
};
FUNC INT DIA_Addon_Emilio_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Gold_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Gold_15_00");//Que devient l'or extrait de la mine ?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_01");//Thorus le rassemble et le distribue ensuite. Aucun de nous n'est autoris� � garder ce qu'il extrait de la mine.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_02");//Tout le monde re�oit une part de l'or - ainsi, m�me les chasseurs et les gardes re�oivent leur part.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_03");//�a me convient. Depuis que nous appliquons ce r�glement, les morts sont moins nombreux et les mineurs gagnent toujours mieux leur vie que les types qui montent la garde dehors.
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Stein   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 3;
	condition   = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent   = FALSE;
	description	= "A quoi servent ces pierres rouges ?";
};
FUNC INT DIA_Addon_Emilio_Stein_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Stein_15_00");//A quoi servent ces pierres rouges ?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_01");//C'est une id�e qu'ont eu Thorus et Esteban.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_02");//Thorus s'occupe de la distribution de l'or, et Esteban organise le travail des ouvriers dans la mine.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_03");//Bien s�r, Esteban veut �viter d'avoir � courir voir Thorus � chaque fois qu'il envoie quelqu'un � la mine.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_04");//C'est la raison pour laquelle il nous remet l'une de ces tablettes de pierre rouge, pour que Thorus nous laisse rentrer. C'est une sorte de laissez-passer.
};
//---------------------------------------------------------------------
//	Info Attentat 
//---------------------------------------------------------------------
var int Emilio_Switch;

INSTANCE DIA_Addon_Emilio_Attentat   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 4;
	condition   = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent   = TRUE;
	description	= "Que savez-vous de l'attaque ?";
};
FUNC INT DIA_Addon_Emilio_Attentat_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio)) 
	&& (Npc_IsDead (Senyan))
	{
		return FALSE;		//selbe Condition wie 'Hilf mir...'
	}
	else if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
FUNC VOID DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Emilio_Attentat_15_00"); //Que savez-vous de l'attaque ?
	if (Emilio_Switch == 0)
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_01"); //(effray�) H� mon gars, j'y suis pour rien du tout, moi !
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_02"); //(effray�) RIEN DU TOUT !
		Emilio_Switch = 0;
	};
};

//----------------------------------------------------------------------
//	Info Senyan 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Senyan   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Emilio_Senyan_Condition()
{	
	if Npc_IsDead (Senyan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Senyan_Info()
{	
	if (Senyan_Called == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_00");//(interrogatif) Dites-moi... Pourquoi est-ce que Senyan a cri� 'Regardez un peu qui est l� ?'
		AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_01");//(s�chement) Des dettes impay�es.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_02"); //Vous avez tu� Senyan !
	};
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_03");//�a vous pose un probl�me ?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_04");//(rapidement) Non non, pas du tout, aucun probl�me !
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_05");//Bien au contraire. (avec m�pris) Cette ordure travaillait pour Esteban.
	
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry (Topic_Addon_Esteban, "Emilio ne soutient pas la cause d'Esteban.");
};

//----------------------------------------------------------------------
//	Info Jetzt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Jetzt   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 5;
	condition   = DIA_Addon_Emilio_Jetzt_Condition;
	information = DIA_Addon_Emilio_Jetzt_Info;
	permanent   = FALSE;
	description	= "Pourquoi n'�tes vous pas � la mine, en ce moment ?";
};
FUNC INT DIA_Addon_Emilio_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Jetzt_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_Jetzt_15_00"); //Pourquoi n'�tes vous pas � la mine, en ce moment ?
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_01"); //(peu s�r de lui) Je suis rest� � la mine aussi longtemps que je pouvais, et j'ai travaill� comme un damn�, jusqu'� l'�puisement. Maintenant, j'ai besoin de quelques jours de repos.
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_02"); //(soupire, peu s�r de lui) Avant de recevoir ma prochaine pierre rouge...
};

//----------------------------------------------------------------------
//	Info VonEmilio
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_VonEmilio (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 6;
	condition   = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent   = FALSE;
	description	= "Lennar m'a appris une chose ou deux sur vous...";
};
FUNC INT DIA_Addon_Emilio_VonEmilio_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_VonEmilio_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_00"); //Lennar m'a racont� quelques petites choses sur vous...
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_01"); //Lennar ? Ce type est un cr�tin. Vous avez bien d� vous en rendre compte.
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_02"); //Il m'a dit que vous n'�tes pas retourn� � la mine depuis l'attaque.
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_03"); //(intimid�) Je... je ne sais rien !
	
	if (!Npc_IsDead (Senyan))
	{	
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_04"); //Vous collaborez avec ce rat de Senyan !
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_05"); //Vous �tes tous les deux de m�che avec Esteban ! Je sais exactement de quoi vous parliez, tout � l'heure !
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_06"); //Jamais Esteban ne s'est inqui�t� de notre sort. Pourquoi aurais-je confiance en ses hommes ?
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_07"); //Laissez-moi tranquille !
		AI_StopProcessInfos(self);
	};
	B_LogEntry (Topic_Addon_Esteban, "Emilio pense que Lennar est idiot.");
};
//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_HilfMir (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 7;
	condition   = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent   = FALSE;
	description	= "Aidez-moi � trouver la personne qui a organis� l'attaque !";
};
FUNC INT DIA_Addon_Emilio_HilfMir_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio))
	&& (Npc_IsDead (Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_HilfMir_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_00"); //Aidez-moi � trouver la personne qui a organis� l'attaque !
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_01"); //Non ! Je ne veux pas �tre m�l� � �a !
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_02"); //Si un cr�tin comme Lennar remarque que votre comportement est �trange, il ne faudra gu�re longtemps � Esteban pour s'en rendre compte...
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_03"); //(se tortille) Je... merde ! Je vous donnerai un nom. Rien de plus.
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_04"); //J'�coute...
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_05"); //Huno... allez voir Huno. Il doit savoir quelque chose sur cette affaire.
	Emilio_TellAll = TRUE;
	
	B_LogEntry (Topic_Addon_Esteban, "Emilio a fini par cracher un nom : Huno.");
};

//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_GegenEsteban (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 8;
	condition   = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent   = FALSE;
	description	= "Qu'avez-vous contre Esteban, au juste ?";
};
FUNC INT DIA_Addon_Emilio_GegenEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_GegenEsteban_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_GegenEsteban_15_00"); //Qu'avez-vous contre Esteban, au juste ?
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_01"); //Cette ordure ne pense qu'� l'argent !
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_02"); //Tous les deux ou trois jours, l'un des n�tres se fait d�vorer par un foreur.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_03"); //Mais Esteban refuse d'envoyer des guerriers dans la mine.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_04"); //Et pourquoi ? Ces types font partie de la 'garde rapproch�e de Raven', et Esteban a les foies de leur demander quoi que ce soit !
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_05"); //Il pr�f�re nous regarder nous faire tuer !
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Mine   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Emilio_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Mine_10_00");//Alors, d�sormais, vous �tes le chef ici. Bon, je vais me mettre en route.
	
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
	
	
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Hacker   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent   = TRUE;
	Description = "Comment �a se passe ?"; 
};
FUNC INT DIA_Addon_Emilio_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Emilio_Hacker_15_00"); //Comment �a va ?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Emilio_Hacker_10_01"); //Je trime comme un damn�... mais au moins, j'ai la chance de ne pas m'�tre fait bouffer par un foreur...
};




