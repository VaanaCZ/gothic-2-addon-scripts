// *********************************************************
// 			  				EXIT
// *********************************************************
var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int Vatras_MORE;

///////////////////////////////////////////////////////////////////////
//	Info KillerWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_KillerWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_KillerWarning_Condition;
	information	 = 	DIA_Addon_Vatras_KillerWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_KillerWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 3)
	&& (MadKillerCount < 7)
	&& (VatrasPissedOffForever == FALSE)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Vatras_KillerWarning_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_00"); //Beaucoup de rumeurs circulent sur vous dans Khorinis.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_01"); //On dit que vous êtes impliqué dans le meurtre d'un innocent.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_02"); //Si c'est vraiment le cas, je ne peux que vous prévenir, mon fils. 
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_03"); //Ne vous éloignez pas de l'équilibre et de la protection de notre monde ou vous auriez à en supporter les conséquences.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_04"); //Dites moi. Qu'est-ce que je peux faire pour vous ?
};

///////////////////////////////////////////////////////////////////////
//	Info LastWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_LastWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_LastWarning_Condition;
	information	 = 	DIA_Addon_Vatras_LastWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_LastWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 7)
	&& (VatrasPissedOffForever == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_LastWarning_Info ()
{
	B_LastWarningVatras ();
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_06"); //Qu'avez-vous à dire pour votre défense ?

	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Va te faire...", DIA_Addon_Vatras_LastWarning_Arsch );	 
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Je suis désolé. Je ne savais pas ce que je faisais.", DIA_Addon_Vatras_LastWarning_Reue );	 
};
func void DIA_Addon_Vatras_LastWarning_Arsch ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00"); //Allez vous faire voir !
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00"); //l n'y a nulle trace de remords dans vos propos.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01"); //Vous ne me laissez pas le choix.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff ();
};

func void DIA_Addon_Vatras_LastWarning_Reue ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00"); //Je suis désolé. Je ne savais pas ce que je faisais.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00"); //Je prierai pour vous en espérant que vous retrouviez la raison à nouveau.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01"); //Malheur à vous si j'entends parler d'un autre meurtre dans lequel vous avez trempé.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};

///////////////////////////////////////////////////////////////////////
//	Info PissedOf
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PissedOff		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_PissedOff_Condition;
	information	 = 	DIA_Addon_Vatras_PissedOff_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_PissedOff_Condition ()
{
	if (MadKillerCount > VatrasMadKillerCount)
	&& (Npc_KnowsInfo (other, DIA_Addon_Vatras_LastWarning))
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PissedOff_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_00"); //Vos mots sonnent aussi faux que vos actions.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_01"); //Vous ne cesserez donc pas vos meurtres inutiles.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_02"); //Vous ne me laissez pas le choix. 
	B_VatrasPissedOff ();
};

// ----------------------------
instance DIA_Vatras_EXIT   (C_INFO)
{
	npc         = VLK_439_Vatras;
	nr          = 999;
	condition   = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Vatras_EXIT_Info()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (Vatras_LaresExit == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_00"); //Attendez !
		if (Vatras_GehZuLares == TRUE) 
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_01"); //Si vous voyez Lares...
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_02"); //J'aimerais que vous me rendiez un petit service.
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_03"); //Allez au port. Vous trouverez un homme répondant au nom de Lares.
			Vatras_GehZuLares = TRUE;
		};	
			
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_04"); //Donnez-lui ce bijou et dites-lui qu'il doit être rendu. Il saura quoi en faire.
		CreateInvItems (self, ItMi_Ornament_Addon_Vatras, 1);									
		B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);	
		
		Vatras_LaresExit = TRUE;
	};
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
	
	if (Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine  (VLK_455_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_454_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_428_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_450_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_426_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_421_Valentino,"VATRASAWAY");	
		
		Vatras_SchickeLeuteWeg = FALSE;
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Vatras_PICKPOCKET (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 900;
	condition	= DIA_Vatras_PICKPOCKET_Condition;
	information	= DIA_Vatras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       
func INT DIA_Vatras_PICKPOCKET_Condition()
{
	C_Beklauen (91, 250);
};
func VOID DIA_Vatras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Vatras_PICKPOCKET);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_BACK 		,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Vatras_PICKPOCKET_DoIt);
};
func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};
func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};



// *********************************************************
// 			  				Hallo
// *********************************************************
instance DIA_Vatras_GREET		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Vatras_GREET_Condition;
	information	 = 	DIA_Vatras_GREET_Info;

	important	 =  TRUE;
};
func int DIA_Vatras_GREET_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GREET_Info ()
{
	AI_Output (self, other, "DIA_Vatras_GREET_05_00"); //Adanos soit avec vous.
	AI_Output (other, self, "DIA_Vatras_GREET_15_01"); //Qui êtes-vous ?
	AI_Output (self, other, "DIA_Vatras_GREET_05_02"); //Je suis Vatras, serviteur d'Adanos, le gardien de l'équilibre divin et terrestre.
	AI_Output (self, other, "DIA_Vatras_GREET_05_03"); //Que puis-je pour vous ?
};



// *********************************************************
// 		  				Brief abgeben
// *********************************************************
instance DIA_Addon_Vatras_Cavalorn		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Cavalorn_Condition;
	information	= DIA_Addon_Vatras_Cavalorn_Info;

	description	= "J'ai avec moi une lettre pour vous.";
};
func int DIA_Addon_Vatras_Cavalorn_Condition ()
{
	if 	(
			(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon_Sealed) >=1)
			&& (MIS_Addon_Cavalorn_Letter2Vatras == LOG_RUNNING)
		)
		||	(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon)>=1) 
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Cavalorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Cavalorn_15_00"); //J'ai avec moi une lettre pour vous.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_01"); //Pour moi ?
	
	if (SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon,1);
		AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_02"); //Oui, mais... elle a été ouverte. J'espère qu'elle n'est pas tombée entre de mauvaises mains.
	};

	B_UseFakeScroll();
	
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_03"); //Vraiment. C'est un message important que vous m'apportez là.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_04"); //Je me demande comment cette lettre est arrivée entre vos mains.
	
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Je l'ai prise à des bandits.", DIA_Addon_Vatras_Cavalorn_Bandit );

	if (MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "De la part de Cavalorn le chasseur.", DIA_Addon_Vatras_Cavalorn_Cavalorn );
	};

	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};
func void DIA_Addon_Vatras_Cavalorn_Bandit ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Bandit_15_00"); //Je l'ai prise à des bandits.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_01"); //(inquiet) Par Adanos. Ce n'est pas bon. Ce n'est pas bon du tout.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_02"); //Si ce que vous dites est vrai, nous avons un gros problème.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_03"); //Je dois m'en charger aussi vite que possible.
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};
func void DIA_Addon_Vatras_Cavalorn_Cavalorn ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00"); //Je le tiens de Cavalorn, le chasseur.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01"); //(surpris) Cavalorn ? Où est-il ?
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02"); //Il m'a dit de vous dire qu'il n'y arriverait pas et qu'il se dirige vers le point de ralliement. Si tant est que cela ait un sens.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03"); //Je vois que vous avez gagné la confiance de Cavalorn. Ça joue en votre faveur, mon fils.
	
	B_GivePlayerXP (XP_Addon_CavalornTrust);
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};

// ************************************************************
// 		Cavalorn Sent Me
// ************************************************************
var int Vatras_Why;
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CavalornSentMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_CavalornSentMe_Condition;
	information	= DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent	= FALSE;
	description	= "C'est Cavalorn qui m'envoie !";
};
func int DIA_Addon_Vatras_CavalornSentMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	&& (Vatras_Why == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CavalornSentMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_00"); //C'est Cavalorn qui m'envoie !
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_01"); //(rusé) Et que vous a-t-il dit ?
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_02"); //Il a dit que vous aviez un besoin urgent de bonnes volontés.
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_03"); //(sourit) Ah... Ainsi, voulez-vous vous joindre à nous, mon fils ?
};

// ************************************************************
// 		Tell Me About RING 		(Trigger für MIS_Waffenhändler)
// ************************************************************
instance DIA_Addon_Vatras_TellMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_TellMe_Condition;
	information	= DIA_Addon_Vatras_TellMe_Info;
	permanent	= TRUE;

	description	= "Parlez-moi de l'Anneau de l'eau.";
};
func int DIA_Addon_Vatras_TellMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_TellMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_15_00"); //Parlez-moi de l'Anneau de l'eau.

	if (!Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_01"); //(dans l'expectative) Et pourquoi ferais-je cela ?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_02"); //Comme vous n'êtes pas encore un membre de notre communauté, je ne peux bien sûr pas tout vous dire.
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_03"); //Mais je vous dirai ce que je sais.
		
		Info_ClearChoices (DIA_Addon_Vatras_TellMe);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, DIALOG_BACK, DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Que faites-vous exactement ?", DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Où sont les autres Mages de l'eau ?", DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Qui sont alors les membres de l'Anneau de l'eau ?", DIA_Addon_Vatras_TellMe_WerNoch);
	};
};
func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_TellMe);
};
func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Philo_15_00"); //Que faites-vous exactement ?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_01"); //Nous sommes entre l'ordre d'Innos et le chaos de Beliar.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_02"); //Si l'une des deux parties devait remporter haut la main, il s'en suivrait une perte totale de liberté ou le chaos absolu.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_03"); //Pour cette raison, nous maintenons l'équilibre entre les deux. C'est ce qui rend la vie possible dans ce monde.
	
	if (MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Et qu'est-ce que ça signifie, concrètement ?", DIA_Addon_Vatras_TellMe_Konkret);
	};
};
func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Konkret_15_00"); //(fronçant les sourcils) Et qu'est-ce que cela signifie concrètement ?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_01"); //La chute de la Barrière a engendré beaucoup de menaces.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_02"); //Les bandits en sont sans doute la manifestation la plus éclatante.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_03"); //Non seulement il est devenu presque impossible de voyager dans l'île sans se faire attaquer...
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_04"); //... Mais quelqu'un en ville protège les bandits !
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Add_05_00"); //Nous avons découvert que les bandits recevaient régulièrement des livraisons d'un marchand d'armes à Khorinis. 
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_05"); //Nous essayons de mettre la main sur de telles personnes pour les empêcher de mettre en péril la ville.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_06"); //Si vous trouvez quelque chose d'autre à ce sujet, faites-le moi savoir.
	MIS_Vatras_FindTheBanditTrader = LOG_RUNNING;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"Un marchand d'armes de la ville de Khorinis soutient l'action des bandits. Vatras souhaite que j'enquête sur cette affaire."); 
	B_LogEntry (TOPIC_Addon_BanditTrader,"Martin, le maître du cellier des paladins, enquête actuellement sur le marchand d'armes. Je le trouverai aux environs du port, là où les paladins entreposent leurs réserves."); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"L'Anneau de l'eau s'occupe du problème des bandits à Khorinis."); 
};
func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_OtherKdW_15_00"); //Où sont les autres Mages de l'eau ?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_01"); //Ils explorent les ruines d'une ancienne civilisation au nord-est de Khorinis.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_02"); //Nous pensons que dans ces ruines pourrait se trouver un passage allant jusqu'à une partie de l'île inexplorée.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Les autres Mages de l'eau explorent actuellement les ruines d'un culte ancien au nord-est de Khorinis. Celles-ci dissimulent peut-être un accès vers une région inconnue de Khorinis."); 

	Info_AddChoice (DIA_Addon_Vatras_TellMe, "Dites-m'en plus sur cet endroit inexploré.", DIA_Addon_Vatras_TellMe_Unexplored);
};
func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_00"); //Dites-m'en plus sur cet endroit inexploré.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_01"); //Si vous joindre à l'expédition vous intéresse, je peux vous envoyer à Saturas avec une lettre de recommandation.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_02"); //Vous ne pouvez participer que dans  la mesure où vous êtes des nôtres.
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_03"); //Bien sûr.
	B_LogEntry (TOPIC_Addon_KDW,"Vatras veut que j'intègre l'Anneau de l'eau avant de me joindre à l'expédition des Mages de l'eau."); 
};
func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_WerNoch_15_00"); //Qui sont alors les membres de l'Anneau de l'eau ?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_01"); //Je ne peux pas vous le dire tant que vous n'êtes pas membre de l'Anneau.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_02"); //Mais vous avez très certainement dû en rencontrer quelques-uns depuis.
};

// *********************************************************
// 		  				Wanna JOIN (+ Ex-Segen)
// *********************************************************
instance DIA_Addon_Vatras_WannaBeRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_WannaBeRanger_Condition;
	information	= DIA_Addon_Vatras_WannaBeRanger_Info;

	description	= "Je veux faire parti de l'Anneau de l'eau !";
};
func int DIA_Addon_Vatras_WannaBeRanger_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WannaBeRanger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_00"); //Je veux faire parti de l'Anneau de l'eau !
	
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_01"); //Vraiment ? Cela veut dire que vous avez déjà rempli la première condition.
		AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_02"); //Qu'entendez-vous par là ?
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_03"); //Je veux dire qu'il doit y avoir quelqu'un parmi nous qui vous fait confiance. Autrement vous n'en auriez même pas entendu parler.
	};
	
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_04"); //Mais je ne sais rien du tout sur vous...
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_03"); //Ich will dich wohl segnen, Fremder, aber ich kenne dich nicht. Erzähle mir was über dich.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_04"); //Qu'est-ce que vous voulez savoir ?
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_05"); //Vous pourriez par exemple me dire d'où vous êtes originaire et pourquoi vous êtes venu à Khorinis.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_06"); //Je suis porteur d'un message d'une grande importance pour le chef des paladins.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_07"); //Quel est ce message ?
		
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Les dragons sont arrivés...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Il va bientôt se passer des choses terribles.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00"); //Alors même que nous parlons, une grande armée est en train de se rassembler sous les ordres de dragons déterminés à conquérir le pays tout entier.
	
	if (Vatras_First == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01"); //Si cela est exact, l'équilibre en sera fortement perturbé. Qui vous en a parlé ?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02"); //(réfléchit) Des dragons ? Vous me parlez là de créatures qui ne sont mentionnées que dans les légendes. Comment savez-vous cela ?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Oh ! J'ai entendu des rumeurs...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Xardas le magicien me l'a dit…",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_LIE_15_00"); //Il va se passer des choses affreuses.
	
	if (Vatras_First == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_01"); //(en colère) Ah-ha ! Et qui vous a dit ça ?
	}
	else 
 	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_02"); //Des choses affreuses, hein ? Comment le savez-vous ?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Oh ! J'ai entendu des rumeurs...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Xardas le magicien me l'a dit…",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = 2;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00"); //C'est Xardas le magicien qui me l'a dit. Il m'a chargé de prévenir les paladins.
	
	if (Vatras_Second == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01"); //Je connais cet homme. C'est un sage et un maître de la magie. Et vous, d'où venez-vous ?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02"); //Le nécromancien ? Il est donc toujours en vie... (réfléchit) Et vous dites que c'est lui qui vous envoie ? Mais alors, qui êtes-vous vraiment ?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Je suis juste un aventurier venu du sud...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Je suis un ancien détenu...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_LIE_15_00"); //J'ai entendu quelques rumeurs...
	
	if (Vatras_Second == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_01"); //(agacé) Vous souvenez-vous au moins d'où vous venez ?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_02"); //Ah-ha ! Et c'est pour cette raison que vous avez accompli ce voyage. Mais qui êtes-vous vraiment ?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Je suis un aventurier venu du sud...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Je suis un ancien détenu...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = 2;
};
func VOID B_Vatras_INFLUENCE_REPEAT()
{
	//RAUS wegen ADDON
	//AI_Output (other, self, "DIA_Vatras_INFLUENCE_REPEAT_15_00"); //Und, gibst du mir jetzt deinen Segen?	
	
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_01"); //Gut, fassen wir mal zusammen:
	
	if (Vatras_Third == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_02"); //Vous êtes un ancien prisonnier...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_03"); //Vous êtes un aventurier originaire du sud...
	};
	if (Vatras_Second  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_04"); //... à qui Xardas le nécromancien a dit que...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_05"); //... ayant entendu des rumeurs selon lesquelles...
	};
	if (Vatras_First  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_06"); //... les dragons ont décidé de conquérir le pays...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_07"); //... des choses affreuses vont se produire...
	};
		
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_08"); //Et vous êtes là pour prévenir les paladins.
	if (Vatras_First   == TRUE)
	&& (Vatras_Second  == TRUE)
	&& (Vatras_Third   == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_09"); //Tout cela paraît peu probable, et pourtant vous ne mentez pas.
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_10"); //Je me dois donc de considérer que vos motifs sont honorables.
		
		AI_Output (self, other, "DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11"); //Je veux vous donner une chance de rejoindre l'Anneau de l'eau.
		
		Info_ClearChoices  (DIA_Addon_Vatras_WannaBeRanger);
	}
	else 
	{
		AI_Output (self, other, "DIA_Vatras_Add_05_00"); //J'ai l'impression que vous ne me dites pas tout.
		AI_Output (self, other, "DIA_Vatras_Add_05_01"); //Si vous avez peur que je raconte à tout le monde ce que vous pourriez me dire, permettez-moi de vous rassurer.
		AI_Output (self, other, "DIA_Vatras_Add_05_02"); //J'ai prêté serment de garder tous les secrets que me révèlent mes ouailles.
		if (Wld_IsTime(05,05,20,10))
		{
			AI_Output (other, self, "DIA_Vatras_Add_15_03"); //Et les gens qui nous entourent ?
			AI_Output (self, other, "DIA_Vatras_Add_05_04"); //Ne vous en faites pas, ils ont déjà bien du mal à comprendre la moitié de mes sermons.
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_05"); //Bon, reprenons au début. Quelle est la teneur de votre message ?
		
		//ADDON - SC kann nicht mehr versagen!
		//Vatras_Chance = TRUE; 
		Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Les dragons sont arrivés...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Il va bientôt se passer des choses terribles.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
	
	//else-Fall raus - Addon
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_13"); //Ich habe dir jetzt zweimal die Chance gegeben, mir die Wahrheit zu sagen - aber du willst es anscheinend nicht. Ich werde dir meinen Segen nicht geben.
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00"); //Je suis un ancien prisonnier de la colonie pénitentiaire de Khorinis.
	Vatras_Third = TRUE;
	
	B_Vatras_INFLUENCE_REPEAT();
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_LIE_15_00"); //Je suis un aventurier venu du sud.
	Vatras_Third = FALSE;
		
	B_Vatras_INFLUENCE_REPEAT();
}; 
// ************************************************************
// 			  			How to JOIN
// ************************************************************
// ------------------------------------------------------------
// Was muß ich tun?
// ------------------------------------------------------------
instance DIA_Addon_Vatras_HowToJoin	(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_HowToJoin_Condition;
	information	= DIA_Addon_Vatras_HowToJoin_Info;

	description	= "Que dois-je faire pour rejoindre l'Anneau ?";
};
func int DIA_Addon_Vatras_HowToJoin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_HowToJoin_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_00"); //Que dois-je faire pour rejoindre l'Anneau ?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_01"); //Vous devez savoir que vous prenez une grande responsabilité en rejoignant l'Anneau.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_02"); //Je ne laisse pas n'importe qui nous rejoindre juste parce qu'une personne vient nous trouver et nous le demande.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_03"); //Si vous désirez rejoindre l'Anneau, vous allez devoir prouver que vous êtes l'un des nôtres.
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_04"); //Et cela veut dire ?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_05"); //Avant de laisser un jeune homme rejoindre nos rangs, il doit avoir accompli une grande action pour l'Anneau.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_06"); //Seulement à ce moment-là je commencerai à considérer votre aide dans le maintien de l'équilibre des forces sur cette île.
	
	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Alors, quel exploit dois-je accomplir pour vous convaincre ?", DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "J'ai libéré beaucoup de personnes. La Barrière n'existe plus.", DIA_Addon_Vatras_HowToJoin_FreedMen );
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "J'ai vaincu le dormeur. Cela ne vous suffit pas ?!", DIA_Addon_Vatras_HowToJoin_Sleeper );
};
func void DIA_Addon_Vatras_HowToJoin_Sleeper ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_Sleeper_15_00"); //J'ai vaincu le Dormeur. Cela ne vous suffit pas ?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_01"); //On entend tellement d'histoires de nos jours.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_02"); //Dont cette histoire au sujet de l'exil de la bête appelé Dormeur.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_03"); //On ne m'a pas dit que c'était l'œuvre d'un seul homme, bien que mes yeux me disent que vous êtes convaincu d'en être l'auteur.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_04"); //C'est un peu perturbant, mais je ne suis pas sûr que mes sens ne me trompent pas parfois.
};
func void DIA_Addon_Vatras_HowToJoin_FreedMen ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00"); //J'ai libéré beaucoup de personnes. La Barrière n'existe plus.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01"); //Même si vous pouvez vraiment prétendre en être responsable...
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02"); //Le grand événement dans la vallée des mines n'a pas seulement libéré les Mages de l'eau et les citoyens honnêtes.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03"); //Mais tous les criminels de tout le pays errent dans Khorinis maintenant, harcelant la population.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04"); //Les bandits se sont déjà emparés de larges parcelles de terrain hors de la ville. Il est devenu quasiment impossible de quitter la ville et d'en revenir sain et sauf.
};
func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00"); //Alors quel exploit dois-je accomplir pour vous convaincre ?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01"); //Khorinis doit faire face à une grande énigme en ce moment.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02"); //Le nombre de disparus en ville semble augmenter presque chaque jour.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03"); //Si vous pouvez m'expliquer ce qu'il leur est arrivé, vous aurez votre place au sein de l'Anneau de l'eau.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras ne me laissera intégrer l'Anneau de l'eau que si je découvre où se trouvent les personnes disparues."); 

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_RUNNING;
	SC_HearedAboutMissingPeople = TRUE;

	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04"); //Cependant...
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05"); //Oui ?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06"); //... vous devriez apporter d'abord votre message aux paladins.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07"); //Je considère que c'est une affaire de la plus haute importance.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08"); //Parlez au seigneur Hagen.
	
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras m'a demandé de porter un message important au seigneur Hagen."); 

	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
};
// ------------------------------------------------------------
// Hilf mir bei GILDE!
// ------------------------------------------------------------
instance DIA_Addon_Vatras_GuildBypass (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_GuildBypass_Condition;
	information	= DIA_Addon_Vatras_GuildBypass_Info;

	description	= "Mais le seigneur Hagen ne va pas me recevoir !";
};
func int DIA_Addon_Vatras_GuildBypass_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_GuildBypass_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_15_00"); //Mais le seigneur Hagen ne va pas me recevoir !
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_01"); //Si, il vous recevra, ça ne fait aucun doute. Dès que vous serez membre d'une puissante communauté.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_02"); //L'Anneau a de très importantes relations.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_03"); //Nous allons vous aider pour que vous délivriez votre message aussi vite que possible.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_04"); //Vous devriez parler de cela à Lares en qui j'ai confiance. Il vous aidera.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Pour obtenir une audience avec le seigneur Hagen, je dois rejoindre l'une des puissantes communautés de Khorinis."); 
	

	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Je le ferai.", DIA_Addon_Vatras_GuildBypass_BACK );
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Quelle communauté dois-je rejoindre ?", DIA_Addon_Vatras_GuildBypass_WhichGuild);
};
func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_BACK_15_00"); //Je le ferai.
	Vatras_GehZuLares = TRUE;
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
};
func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00"); //Quelle communauté dois-je rejoindre ?
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01"); //Il n'y a que trois communautés qui ont assez d'influence.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02"); //La milice de la ville, le monastère des Magiciens du feu et la troupe de mercenaires sur la ferme du propriétaire terrien.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03"); //C'est votre choix, fiston.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04"); //Lares peut certainement vous aider dans cette difficile décision. Parlez-en-lui.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Les puissantes communautés comprennent notamment les MAGES DU FEU, la MILICE et les MERCENAIRES de la ferme du propriétaire terrien."); 
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Je le ferai.", DIA_Addon_Vatras_GuildBypass_BACK );
};
// ------------------------------------------------------------
// Ranger NOW 	(MissingPeople ist hier schon Succes!!!)
// ------------------------------------------------------------
instance DIA_Addon_Vatras_NowRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_NowRanger_Condition;
	information	= DIA_Addon_Vatras_NowRanger_Info;
	permanent	= TRUE;

	description	= "Je suis prêt à joindre l'Anneau de l'eau !";
};
func int DIA_Addon_Vatras_NowRanger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (SC_IsRanger == FALSE)
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_NowRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_00"); //Je suis prêt à joindre l'Anneau de l'eau !
	AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_01"); //Alors vous avez transmis votre message au seigneur Hagen ?
	
	if (Kapitel >= 2) //Pass-Schlüssel von Hagen
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_02"); //Oui.
		if (MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_NowRanger_15_03"); //Mais il m'a envoyé à la vallée des mines afin que je prouve mes dires.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_04"); //C'est à vous de décider ce que vous voulez faire après.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_05"); //C'était primordial pour moi qu'il ait le message. Maintenant c'est à lui d'agir ou d'attendre vos preuves.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_06"); //En ce qui vous concerne...
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_07"); //Bien.
		};
		
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_08"); //Vous nous avez prouvé que vous nous êtes indispensable. Vous serez l'un de nos enfants et parcourrez  le monde en notre nom afin d'accomplir la volonté d'Adanos.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_09"); //Je vous confie cet Anneau de l'eau. Puisse-t-il vous aider à trouver vos alliés et, avec eux maintenir l'équilibre de ce monde.
		CreateInvItems (self, ItRi_Ranger_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Addon, 1);		
		if (hero.guild == GIL_KDF)
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_10"); //Vous êtes le premier Magicien du feu parmi nos enfants. J'en suis extrêmement ravi.
		};
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_11"); //Puisse Adanos vous protéger. Et maintenant allez rencontrer vos frères.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_12"); //Ils vous attendront dans la taverne de 'La Harpie Morte' et vous accepteront en tant que membre de notre communauté.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_13"); //Vous connaissez certainement cette taverne. Elle se trouve sur la route de la ferme d'Onar.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_14"); //N'oubliez pas de porter votre anneau, afin que vos frères vous reconnaissent comme l'un des leurs.
		
		B_LogEntry (TOPIC_Addon_RingOfWater,"Je fais maintenant partie de l'Anneau de l'eau. Je suis prêt à aller rencontrer mes frères à la Taverne de la harpie morte."); 

		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
		B_GivePlayerXP (XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_15"); //Non. Non pas encore.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_16"); //Dépêchez-vous. Allez le voir. Je pense que votre message est très important !
	};
};
// ------------------------------------------------------------
// NACH RangerMeeting
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CloseMeeting		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_CloseMeeting_Condition;
	information	= DIA_Addon_Vatras_CloseMeeting_Info;
	description = "Les frères de l'Anneau m'envoient à vous.";
};
func int DIA_Addon_Vatras_CloseMeeting_Condition ()
{
	if (Lares_TakeFirstMissionFromVatras == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CloseMeeting_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_CloseMeeting_15_00"); //Les frères de l'Anneau m'envoient à vous.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_01"); //Bien ! je vous attendais !
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_02"); //Je vais vous envoyer avec les autres Mages de l'eau passer le portail.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_03"); //Vous allez suivre la trace de l'ancien baron du minerai Raven et comprendre pourquoi il a enlevé les citoyens de Khorinis.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_04"); //Ici nous devons continuer à essayer de nous arranger de la menace que fait peser les bandits.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_05"); //Apportez cette lettre à Saturas. Il vous dira quoi faire à partir de maintenant.
	if (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_CloseMeeting_05_08"); //Lares vous conduira à lui s'il n'a pas déjà donné le bijou.
	};
	CreateInvItems (self, ItWr_Vatras2Saturas_FindRaven, 1);									
	B_GiveInvItems (self, other, ItWr_Vatras2Saturas_FindRaven, 1);	
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_06"); //Puisse Adanos vous guider.
		
	B_LogEntry (TOPIC_Addon_KDW,"Vatras m'a remis une lettre que je dois porter à Saturas. Je dois traverser le portail avec les autres Mages de l'eau, puis suivre la trace du baron du minerai déchu."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Sklaven,"Je dois découvrir pourquoi Raven a capturé les citoyens de Khorinis."); 


	RangerMeetingRunning = LOG_SUCCESS; //Joly:Muss hier stehen!Sonst Chaos mit Rangern! -> Meeting
	B_SchlussMitRangerMeeting ();
	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// 			  			Missing People
// ************************************************************
// ------------------------------------------------------------
// MissingPeople PERM
// ------------------------------------------------------------
var int MISSINGPEOPLEINFO[20];
// ------------------------------------------------------------
instance DIA_Addon_Vatras_MissingPeople (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_MissingPeople_Condition;
	information	= DIA_Addon_Vatras_MissingPeople_Info;
	permanent	= TRUE;
	description	= "A propos des disparus...";
};
func int DIA_Addon_Vatras_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};
var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;
func void DIA_Addon_Vatras_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_15_00"); //Concernant les disparus...
	AI_Output (self, other, "DIA_Addon_Vatras_MissingPeople_05_01"); //Oui ?
	
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice (DIA_Addon_Vatras_MissingPeople, DIALOG_BACK, DIA_Addon_Vatras_MissingPeople_BACK);
	if (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Je sais où ils se trouvent !", DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Laissez-moi vous dire ce que j'ai découvert...", DIA_Addon_Vatras_MissingPeople_Report);
	};
	
	if (DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Où dois-je commencer à les chercher ?", DIA_Addon_Vatras_MissingPeople_Wo);
	};
};
func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
};
func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HintMissingPeople_Wo_15_00"); //Où dois-je commencer à les chercher ?
	AI_Output (self, other, "DIA_Addon_Vatras_HintMissingPeople_Wo_05_01"); //La plupart des gens ont disparu près du port. C'est probablement là où vous devriez commencer vos recherches.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"La plupart des personnes ont disparu aux environs du port de Khorinis. C'est là que je dois commencer mes recherches."); 
	
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};
func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_00"); //Je vais vous dire ce que je sais...
	
	 if ((MIS_Akil_BringMissPeopleBack != 0)
	 || (MIS_Bengar_BringMissPeopleBack != 0))
	 &&	(MISSINGPEOPLEINFO[1] == FALSE)
	 {
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_01"); //Les fermiers ont également perdu des gens.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[1] = TRUE;
	 };
	
	if ((Elvrich_GoesBack2Thorben == TRUE)
	|| (Elvrich_SCKnowsPirats == TRUE)
	|| (SC_KnowsDexterAsKidnapper == TRUE))
	&& (MISSINGPEOPLEINFO[2] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_02"); //J'ai découvert que les bandits sont responsables des disparitions ici.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[2] = TRUE;
	};

	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[3] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_03"); //Elvrich, l'apprenti du Maître Thorben, m'a dit que les bandits avaient emmené les personnes enlevées hors de Khorinis par bateau.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	
	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[4] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_04"); //Des pirates sont impliqués dans cette affaire d'une manière ou d'une autre. Je n'ai pas encore réussi à bien comprendre leur rôle.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[4] = TRUE;
	};	
	
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (MISSINGPEOPLEINFO[5] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_05"); //J'ai sauvé Elvrich des mains des bandits.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	&& (MISSINGPEOPLEINFO[6] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_06"); //Les bandits ont emmené une fille du nom de Lucia.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	
	if ((Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
	|| (MIS_LuciasLetter == LOG_SUCCESS))
	&& (MISSINGPEOPLEINFO[7] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_07"); //Lucia, la fille qui a été enlevée par les bandits, a décidé de se joindre à eux.
		if (MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_08"); //Il semble qu'elle ne l'ait pas fait de son propre chef.
		};
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[7] = TRUE;
	};
		
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (MISSINGPEOPLEINFO[8] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_09"); //Le chef des bandits s'appelle Dexter. C'est lui le responsable de ces enlèvements.
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_10"); //Je connais Dexter du temps où j'étais en colonie pénitentiaire. Il travaillait pour le compte du baron du minerai Gomez à cette époque.
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_11"); //Il se souviendra très certainement de vous. Vous devez être prudent.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[8] = TRUE;
	};

	if (Vatras_MissingPeopleReports != 0)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_12"); //Je pense que vous êtes sur la bonne piste. Continuez.
		var int XP_Vatras_MissingPeopleReports;
		XP_Vatras_MissingPeopleReports = (XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports );
		B_GivePlayerXP (XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_13"); //Qu'avez-vous découvert ?
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_14"); //Rien d'important jusqu'à présent.
	};
};
func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_00"); //Je sais où se trouvent les disparus.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_01"); //Qu'avez-vous découvert ?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_02"); //Un homme du nom de Raven les a conduits vers un endroit éloigné de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_03"); //Qu'est-ce qui vous rend si sûr ?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_04"); //J'ai lu ses ordres. Les bandits de la région travaillent pour lui.
	if (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	{	
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_05"); //Ici.
		B_UseFakeScroll ();
	};
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_06"); //Bien. Bon travail. Je craignais que nous ne devions nous résoudre à ne jamais savoir.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Vatras_WhereAreMissingPeople);
};
// ------------------------------------------------------------
// Gefangene befreit
// ------------------------------------------------------------
instance DIA_Addon_Vatras_Free (C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Vatras_Free_Condition;
	information	 = 	DIA_Addon_Vatras_Free_Info;
	permanent	 =  FALSE;
	description	 = 	"Les disparus sont rentrés chez eux !";
};
func int DIA_Addon_Vatras_Free_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Free_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Free_15_00"); //Les disparus sont revenus.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_01"); //Oui vous avez réussi. Leur voyage a eu un épilogue heureux.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_02"); //Mais notre voyage doit continuer. Partez sous la protection d'Adanos.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_03"); //(priant) Adanos, bénit cet homme. Éclaire son chemin et donne-lui la  force de faire face à tous les dangers.
	
	B_RaiseAttribute (other, ATR_MANA_MAX, 3);
	other.attribute[ATR_MANA]	   = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	
	Snd_Play ("Levelup");
	
	// ***Mike** Auskommentiert, weil FALSCHE funktion - bitte Rücksprache, bevor du's wieder änderst
	//var string concatText;
	//concatText = ConcatStrings (NAME_Bonus_ManaMax,IntToString (4));
	//PrintScreen (concatText, -1,-1,FONT_ScreenSmall,2); 
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_Waffen (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Waffen_Condition;
	information	= DIA_Addon_Vatras_Waffen_Info;
	permanent 	= TRUE;
	description = "A propos de ce marchand d'armes...";
};
func int DIA_Addon_Vatras_Waffen_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_15_00"); //Concernant le marchand d'armes...
	
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
	Info_AddChoice (DIA_Addon_Vatras_Waffen, DIALOG_BACK, DIA_Addon_Vatras_Waffen_BACK);
	if (Fernando_ImKnast == TRUE)
	|| (Fernando_HatsZugegeben == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Je connais le marchand  qui a vendu les armes aux bandits.", DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Que savez-vous du marchand d'armes, pour l'instant ?", DIA_Addon_Vatras_Waffen_ToMartin);
	};
};
func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
};
func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_ToMartin_15_00"); //Que savez-vous sur le marchand d'armes ?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_01"); //Demandez cela à  Martin,  le maître du cellier des paladins. Il devrait pouvoir vous en dire plus.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_02"); //Il était chargé de démasquer le marchand d'armes.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_03"); //Vous trouverez Martin dans le quartier du port. Si vous apercevez un amas de caisses, de provisions et des paladins, Martin n'est pas loin.
		
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_00"); //Je connais le marchand  qui a vendu les armes aux bandits.
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_01"); //Son nom est Fernando.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_02"); //Très bien. Est-ce que Martin a pris les mesures nécessaires pour qu'il cesse ses livraisons ?
	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_Waffen_Success_15_03"); //Oui. Martin veillera à qu'il ne puisse plus quitter le donjon.
		AI_Output	(self, other, "DIA_Addon_Vatras_Waffen_Success_05_04"); //Bien joué, fiston.

		if (Npc_KnowsInfo (other, DIA_ADDON_Vatras_WannaBeRanger))
		&& (SC_IsRanger == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_05"); //(avec insolence) Est-ce que cela veut dire que vous allez me laisser rejoindre l'Anneau de l'eau maintenant ?
			AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_06"); //(sourit) Cela ne fait pas parti de notre accord – et vous le savez.
		};
		
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_07"); //Puisse Adanos éclairer votre chemin.
		
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_CaughtFernando_15_09"); //Pas encore.
		AI_Output	(self, other, "DIA_Addon_Vatras_CaughtFernando_05_10"); //Alors hâtez-vous et rendez-lui compte avec diligence. Cela doit cesser dès maintenant.
	};
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_WISP (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_WISP_Condition;
	information	= DIA_Addon_Vatras_WISP_Info;

	description = "Y-a-t-il quelque chose qui pourrait m'aider dans ma recherche ?";
};
func int DIA_Addon_Vatras_WISP_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader != 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WISP_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_WISP_15_00"); //Y-a-t-il quelque chose qui pourrait m'aider dans ma recherche ?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_01"); //Vous êtes un jeune homme bien  obstiné. En fait, je pensais bien à quelque chose qui pourrait vous faciliter la tâche.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_02"); //Je vais vous donner cette amulette en minerai. Vous en aurez certainement l'usage.
	CreateInvItems (self, ItAm_Addon_WispDetector, 1);									
	B_GiveInvItems (self, other, ItAm_Addon_WispDetector, 1);
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_03"); //C'est une amulette de lueurs spectrales.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_04"); //Il y en a très peu. La lueur spectrale qui habite cette amulette a des pouvoirs très spéciaux.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_05"); //Cela peut vous aider à trouver des choses qui normalement ne se voient pas à l'œil nu.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_06"); //Vous l'appelez simplement en portant l'amulette.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_07"); //Si elle perd de son pouvoir ou si ce n'est pas trouvable, enfilez-la à nouveau et ce que vous cherchez réapparaîtra.
	
	B_LogEntry (TOPIC_Addon_BanditTrader,"Vatras m'a remis une 'amulette de la lueur spectrale' afin de m'aider à retrouver le marchand d'armes."); 
	Log_CreateTopic (TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned); 
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned_NF); 

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_08"); //La lueur spectrale est capable de détecter les armes.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_09"); //Elle peut vous être d'une grande aide dans votre enquête sur les livraisons d'armes aux bandits.
	};

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_10"); //Prenez-en soin et elle ne vous laissera jamais tomber.

	Info_ClearChoices (DIA_Addon_Vatras_WISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Merci ! J'en prendrai grand soin.", DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Est-ce que la lueur spectrale a d'autres pouvoirs ?", DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Une lueur spectrale dans une amulette ?", DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;	
};
func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Thanks_15_00"); //Merci ! J'en prendrai grand soin.
	Info_ClearChoices (DIA_Addon_Vatras_WISP);
};
func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_MoreWISP_15_00"); //Est-ce que la lueur spectrale a d'autres pouvoirs ?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_01"); //Faire plus que rechercher les armes de corps à corps ? Non à moins que vous ne lui appreniez.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_02"); //Je crois que Riordian sait comment faire pour leur apprendre. C'est l'un de nôtres. Pour le moment, il est en voyage avec Saturas.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_03"); //Il peut peut-être vous en dire plus.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Addon_BanditTrader,"La lueur spectrale ne sert pas uniquement à retrouver des armes de combat... Le Mage des eaux Riordian lui a appris à rechercher bien d'autres choses également."); 
	};
};
func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WISPDETECTOR_was_15_00"); //Une lueur spectrale dans une amulette ?
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_01"); //Les lueurs spectrales sont des créatures admirables. Ils ne sont que pure énergie magique.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_02"); //Elles sont liées au minerai magique dans ce monde. C'est de là qu'elles tirent leur origine et leur force.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_03"); //Je ne suis pas surpris que vous n'ayez jamais entendu parler d'elles. Elles n'apparaissent qu'aux personnes portant le minerai auquel elles appartiennent.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_04"); //Les lueurs spectrales vivant dans la nature ont été forcées de quitter leurs sources. Ils attaquent tout le monde qui les approche.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_05"); //Rien ne peut aider ces pauvres créatures. Vous feriez mieux de ne pas vous en approcher.
};

// ********************************************************
// 			  			  STONEPLATES
// *********************************************************
// ---------------------------------------------------------
// About Stoneplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_Stoneplate (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_Stoneplate_Condition;
	information	= DIA_Addon_Vatras_Stoneplate_Info;

	description	= "J'ai sur moi cette tablette de pierre...";
};

func int DIA_Addon_Vatras_Stoneplate_Condition ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Stoneplate_15_00"); //J'ai cette tablette de pierre. Pouvez-vous m'en dire plus ?
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_01"); //Ce sont des artefacts d'anciennes civilisations sur lesquelles nous avions fait des recherches pendant un moment.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_02"); //Il en existe de plusieurs sortes. Certains comportent des informations ayant trait à l'histoire des  peuples anciens.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_03"); //Et c'est le genre de choses qui m'intéresse. Apportez-moi tout ce que vous pourrez trouver.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_04"); //Je vous récompenserai comme il se doit.

	Log_CreateTopic (TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Stoneplates, LogText_Addon_VatrasTrade); 
	
	Log_CreateTopic (TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, LogText_Addon_VatrasTrade);

};
// ---------------------------------------------------------
// Sell Stonplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_SellStonplate		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_SellStonplate_Condition;
	information	= DIA_Addon_Vatras_SellStonplate_Info;
	permanent 	= TRUE;
	description	= "J'ai d'autres tablettes de pierre pour vous...";
};
func int DIA_Addon_Vatras_SellStonplate_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_Stoneplate))
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_SellStonplate_Info ()
{
	var int anzahl; anzahl = Npc_HasItems (other, ItWr_StonePlateCommon_Addon);
	
	if (anzahl == 1)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_SellStonplate_15_00"); //J'ai une autre tablette de pierre pour vous...
	}
	else 
	{
		//Fixme Joly --> Hier SC-output "Hier.." oder ähnliche --Mike
	};
	
	B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, anzahl);
		
	AI_Output	(self, other, "DIA_Addon_Vatras_SellStonplate_05_01"); //Fantastique !
	
	if (anzahl >= 10)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_02"); //Je vais augmenter votre pouvoir magique !
		B_RaiseAttribute	(other, ATR_MANA_MAX, anzahl);
		Npc_ChangeAttribute	(other, ATR_MANA, anzahl);
	}
	else if (anzahl >= 5)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_04"); //Prenez donc quelques parchemins de sort pour récompense...
		B_GiveInvItems (self, other, ItSc_InstantFireball, anzahl);
	}
	else // 1-4 Plates --> 2-5 Tränke
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_03"); //Prenez donc quelques potions pour récompense...
		B_GiveInvItems (self, other, ItPo_Health_03, anzahl+1);
	};
	
	B_GivePlayerXP (XP_Addon_VatrasStonplate * anzahl);
};

// *********************************************************
// 			  			KLOSTER BYPASS
// *********************************************************
var int Vatras_SentToDaron;
// -----------------------------
instance DIA_Addon_Vatras_GuildHelp		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_GuildHelp_Condition;
	information	 = 	DIA_Addon_Vatras_GuildHelp_Info;

	description	 = 	"Lares m'a dit que vous m'aideriez à entrer dans le monastère des Magiciens du feu.";
};

func int DIA_Addon_Vatras_GuildHelp_Condition ()
{
	if (RangerHelp_gildeKDF == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_00"); //Lares a dit que vous pouviez m'aider à rentrer dans le monastère des Magiciens du feu.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_01"); //C'est votre choix ? La Voie du feu ?
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_02"); //Oui. Je veux devenir Magicien du feu.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_03"); //Autant que je sache, ils acceptent volontiers des novices dans leur monastère. Alors pourquoi avez-vous besoin de moi ?

	if (SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_04"); //Le novice devant le monastère veut me faire payer un droit de passage. Un mouton et pas mal d'or.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_05"); //Lares a mentionné le fait qu'ils demandaient à quiconque voulait rentrer dans le monastère le paiement d'un droit de passage.
	};	
	
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_06"); //Je ne suis pas à même de vous garantir l'accès au monastère. Je suis un Magicien de l'eau, comme vous le savez. Mais je connais bien Daron le Magicien du feu.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_07"); //Il passe la majeure partie de son temps sur la place du marché, à faire l'aumône pour son église.
	Vatras_SentToDaron = TRUE;
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_08"); //Mais j'ai entendu dire qu'il n'était pas seulement en ville pour récolter des fonds.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_09"); //Il m'a parlé d'une statuette qui lui a été dérobée.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_10"); //Elle avait une valeur très importante pour lui. Il vous permettra très certainement de rentrer dans le monastère si vous lui rapportez.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_11"); //Bien sûr si vous décidez de rejoindre le Cercle de feu, vous pouvez toujours être membre de l'Anneau.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_12"); //Si vous vous en montrez digne, bien sûr.
	MIS_Addon_Vatras_Go2Daron = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron, le Magicien du feu de la place du marché, m'aidera à rentrer dans le monastère si je parviens à retrouver la statuette qui lui a été dérobée."); 
};


// ************************************************************
// ***														***
//							Gothic II 
// ***														***
// ************************************************************

// ============================================================
// MORE 	(Wegen der alten Scheiße...)
// ============================================================
instance DIA_Vatras_MORE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	998;
	condition	 = 	DIA_Vatras_MORE_Condition;
	information	 = 	DIA_Vatras_MORE_Info;
	permanent    =  TRUE;
	description	 = 	"(plus)";
};
func int DIA_Vatras_MORE_Condition ()
{
	if (Vatras_MORE == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MORE_Info ()
{
	Vatras_MORE = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info INFLUENCE (SEGEN)
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INFLUENCE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	92;
	condition	 = 	DIA_Vatras_INFLUENCE_Condition;
	information	 = 	DIA_Vatras_INFLUENCE_Info;
	permanent    =  FALSE;
	description	 = 	"Je vous demande votre bénédiction.";
};
func int DIA_Vatras_INFLUENCE_Condition ()
{
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	}; 
};
func void DIA_Vatras_INFLUENCE_Info ()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_00"); //Je viens vous demander votre bénédiction.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_01"); //Et pourquoi devrais-je vous la donner, étranger ?
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_02"); //Je voudrais devenir l'apprenti de l'un des artisans du bas quartier.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_11"); //Allez avec la bénédiction d'Adanos, mon fils.
	Snd_Play ("LevelUp");
	B_GivePlayerXP (XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry (TOPIC_Thorben,"Vatras, le Magicien des eaux, m'a béni.");
};

///////////////////////////////////////////////////////////////////////
//	Info WoKdF
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_WoKdF (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  93;
	condition	 = 	DIA_Vatras_WoKdF_Condition;
	information	 = 	DIA_Vatras_WoKdF_Info;
	permanent    =  FALSE;
	description	 = 	"Où puis-je trouver un prêtre d'Innos ?";		
};

func int DIA_Vatras_WoKdF_Condition ()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Vatras_Segen == TRUE)
	&& (Vatras_SentToDaron == FALSE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_WoKdF_Info ()
{
	AI_Output (other, self, "DIA_Vatras_WoKdF_15_00"); //Où puis-je trouver un prêtre d'Innos ?
	AI_Output (self, other, "DIA_Vatras_WoKdF_05_01"); //Je vous conseille d'aller voir sur la place du marché. Vous devriez y trouver un émissaire du monastère.
};

///////////////////////////////////////////////////////////////////////
//	Info Spende
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Spende (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  94;
	condition	 = 	DIA_Vatras_Spende_Condition;
	information	 = 	DIA_Vatras_Spende_Info;
	permanent    =  TRUE;
	description	 = 	"Je veux faire une offrande à Adanos !";
};

func int DIA_Vatras_Spende_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Spende_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Spende_15_00"); //Je souhaite faire une donation à l'Eglise d'Adanos.
	AI_Output (self, other, "DIA_Vatras_Spende_05_01"); //Une donation faite à l'Eglise d'Adanos réparerait une partie des péchés que vous avez commis, mon fils.
	AI_Output (self, other, "DIA_Vatras_Spende_05_02"); //Combien pouvez-vous donner ?
	
	Info_ClearChoices   (DIA_Vatras_Spende);
	Info_AddChoice 		(DIA_Vatras_Spende, "Je n'ai rien à donner pour l'instant...", DIA_Vatras_Spende_BACK);
	if (Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "J'ai 50 pièces d'or...", DIA_Vatras_Spende_50);
	};
	if (Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "J'ai 100 pièces d'or...",	DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output (other, self, "DIA_Vatras_Spende_BACK_15_00"); //Je ne peux rien donner pour le moment.
	AI_Output (self, other, "DIA_Vatras_Spende_BACK_05_01"); //Ce n'est pas un problème. Vous pouvez toujours faire une promesse de don, mon fils.
	Info_ClearChoices   (DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output (other, self, "DIA_Vatras_Spende_50_15_00"); //J'ai 50 pièces d'or...
	AI_Output (self, other, "DIA_Vatras_Spende_50_05_01"); //Au nom d'Adanos, merci, mon fils. Votre or sera distribué à ceux qui en ont grand besoin.
	B_GiveInvItems (other, self, Itmi_Gold, 50);
	Info_ClearChoices   (DIA_Vatras_Spende);
};
	
func void DIA_Vatras_Spende_100()
{
	AI_Output (other, self, "DIA_Vatras_Spende_100_15_00"); //J'ai 100 pièces d'or...
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_01"); //Au nom d'Adanos, merci pour votre grande générosité.
	Snd_Play ("LevelUp");
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_02"); //Puisse la route que vous suivez être bénie par Adanos !
	B_GiveInvItems (other, self, ITmi_Gold, 100);
	Vatras_Segen = TRUE;
	Info_ClearChoices   (DIA_Vatras_Spende);
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Thorben,"Vatras, le Magicien des eaux, m'a béni.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_CanTeach		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  95;
	condition	 = 	DIA_Vatras_CanTeach_Condition;
	information	 = 	DIA_Vatras_CanTeach_Info;
	permanent    =  FALSE;
	description	 = 	"Pouvez-vous m'enseigner quelque chose sur la magie ?";
};

func int DIA_Vatras_CanTeach_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_CanTeach_15_00"); //Pouvez-vous m'enseigner quelque chose au sujet de la magie ?
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_01"); //Seuls les Elus d'Innos ou d'Adanos ont le droit de pratiquer la magie runique.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_02"); //Mais le commun des mortels peut également faire appel à la magie grâce aux parchemins.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_03"); //Je peux vous montrer comment développer et canaliser vos pouvoirs magiques.
	
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Vatras, le Magicien des eaux, peut m'aider à augmenter mon pouvoir magique.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Teach		(C_INFO)
{
	npc		  	 = 	VLK_439_Vatras;
	nr			 = 	100;
	condition	 = 	DIA_Vatras_Teach_Condition;
	information	 = 	DIA_Vatras_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux augmenter mon pouvoir magique.";
};
func int DIA_Vatras_Teach_Condition ()
{	
	if (Vatras_TeachMANA == TRUE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Teach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Teach_15_00"); //Je veux augmenter mon pouvoir magique.
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
};
func void DIA_Vatras_Teach_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output (self, other, "DIA_Vatras_Teach_05_00"); //Vos pouvoirs magiques sont désormais tels que je n'ai plus rien à vous enseigner.
	};
	Info_ClearChoices (DIA_Vatras_TEACH);
};
func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_TEACH_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info GODS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_GODS		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	98;	//Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_GODS_Condition;
	information	 = 	DIA_Vatras_GODS_Info;
	permanent	 =  TRUE;
	description	 = 	"Parlez-moi des divinités.";
};

func int DIA_Vatras_GODS_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GODS_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_15_00"); //Parlez-moi des dieux.
	AI_Output			(self, other, "DIA_Vatras_GODS_05_01"); //Que voulez-vous savoir, au juste ?
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK);
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi d'Innos.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi d'Adanos.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi de Béliar.",DIA_Vatras_GODS_BELIAR); 		 
	 		 
};
FUNC VOID DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices (DIA_Vatras_GODS); 
};
FUNC VOID DIA_Vatras_GODS_INNOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_INNOS_15_00"); //Parlez-moi d'Innos.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_01"); //Très bien. (prêche) Innos est le premier dieu et le plus grand de tous. C'est lui qui a créé le soleil et le monde.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_02"); //Il commande à la lumière et au feu dont il a fait don à l'humanité. Il est la loi et la justice.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_03"); //Les Magiciens du feu sont ses prêtres, les paladins ses guerriers.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi d'Innos.",DIA_Vatras_GODS_INNOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi d'Adanos.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi de Béliar.",DIA_Vatras_GODS_BELIAR); 	
	
};
FUNC VOID DIA_Vatras_GODS_ADANOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_ADANOS_15_00"); //Parlez-moi d'Adanos.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_01"); //Adanos est le dieu du centre. Il est la balance de la justice, le gardien de l'équilibre entre Innos et Béliar.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_02"); //Il commande aux forces du changement et le don qu'il nous a fait est l'eau des océans, lacs et cours d'eau.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_03"); //Ses prêtres sont les Mages de l'eau et je suis moi aussi son serviteur.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 	
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi d'Innos.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi d'Adanos.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi de Béliar.",DIA_Vatras_GODS_BELIAR); 	

};
FUNC VOID DIA_Vatras_GODS_BELIAR()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_BELIAR_15_00"); //Parlez-moi de Béliar.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_01"); //Béliar est le dieu de la mort, de la destruction et de tout ce qui est contraire à l'ordre naturel.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_02"); //Il livre une guerre éternelle à Innos, mais Adanos préserve l'équilibre entre les deux.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_03"); //Rares sont les humains qui répondent à l'appel de Béliar, mais ce dernier confère une grande force à ceux qui le font.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi d'Innos.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi d'Adanos.",DIA_Vatras_GODS_ADANOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Parlez-moi de Béliar.",DIA_Vatras_GODS_BELIAR); 			 
	
};
///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HEAL		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	99;	//Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_HEAL_Condition;
	information	 = 	DIA_Vatras_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Pouvez-vous me soigner ?";
};

func int DIA_Vatras_HEAL_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_HEAL_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HEAL_15_00"); //Pouvez-vous me soigner ?
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_01"); //(implorant) Soigne ce corps blessé, ô Adanos ! Délivre-le des blessures qui l'accablent et insuffle-lui un regain de vie !
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_02"); //Vous n'avez pas besoin de soins pour le moment.
	};	
};

// ********************************************************************
// 							Isgaroth Mission
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MISSION		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MISSION_Condition;
	information	= DIA_Vatras_MISSION_Info;
	
	important	= TRUE;
};
func int DIA_Vatras_MISSION_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Kapitel == 2)
	
	{
		return TRUE;
	};
};
func void DIA_Vatras_MISSION_Info ()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_10"); //J'ai un message à l'intention de maître Isgaroth. Il garde le temple devant le monastère.
	AI_Output (self, other, "DIA_Vatras_MISSION_05_01"); //Chargez-vous de le lui apporter à ma place et vous pourrez choisir la récompense que vous voudrez.
	
	Info_ClearChoices   (DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Pas maintenant.",DIA_Vatras_MISSION_NO);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Bien sûr.",DIA_Vatras_MISSION_YES);
};
FUNC VOID B_SayVatrasGo()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_13"); //Bien. Allez voir maître Isgaroth sans perdre une minute.
};
func VOID DIA_Vatras_MISSION_YES()
{
	AI_Output (other, self, "DIA_Vatras_MISSION_YES_15_00"); //D'accord, j'accepte.
	AI_Output (self, other, "DIA_Vatras_Add_05_11"); //Bien. Dans ce cas, apportez-lui le message et choisissez l'un de ces parchemins.
	AI_Output (self, other, "DIA_Vatras_Add_05_12"); //Je vous donnerai votre récompense quand vous aurez remis le message à son destinataire.
	
	B_GiveInvItems (self, hero, ItWr_VatrasMessage,1); 
	MIS_Vatras_Message = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Botschaft,LOG_RUNNING);
	B_LogEntry (TOPIC_Botschaft,"Vatras m'a remis un message pour maître Isgaroth. Il se trouve au sanctuaire devant le monastère.");
	
	Info_ClearChoices 	(DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Je prendrai le sort de Lumière.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Je choisis le sort de Soin.",DIA_Vatras_MISSION_HEAL);	
	Info_AddChoice 		(DIA_Vatras_MISSION,"Donnez-moi la Flèche de glace.",DIA_Vatras_MISSION_ICE);	
};
FUNC VOID DIA_Vatras_MISSION_NO ()
{	
	//AI_Output	(other, self, "DIA_Vatras_MISSION_NO_15_00"); //Such dir einen anderen Laufburschen, alter Mann!
	AI_Output (other, self, "DIA_ADDON_Vatras_MISSION_NO_15_00"); //Pas maintenant !
	AI_Output (self, other, "DIA_ADDON_Vatras_MISSION_NO_05_01"); //Pas de problème. j'enverrai quelqu'un d'autre.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_HEAL()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_HEAL_15_00"); //Je choisis le sort de soin.
	 B_SayVatrasGo();
	 
	B_GiveInvItems (self, hero,ItSc_LightHeal ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_ICE()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_ICE_15_00"); //Donnez-moi la Flèche de glace.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Icebolt ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_LIGHT()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_LIGHT_15_00"); //Je prends le sort de Lumière.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Light ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
///////////////////////////////////////////////////////////////////////
//	Info MESSAGE_SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MESSAGE_SUCCESS		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information	= DIA_Vatras_MESSAGE_SUCCESS_Info;
	
	description	= "J'ai remis votre message.";
};

func int DIA_Vatras_MESSAGE_SUCCESS_Condition ()
{	
	if (MIS_Vatras_Message == LOG_RUNNING)
	&& (Vatras_Return == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MESSAGE_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Vatras_MESSAGE_SUCCESS_15_00"); //J'ai délivré votre message.
	AI_Output (self, other, "DIA_Vatras_Add_05_14"); //Je vous remercie. Et maintenant, prenez votre récompense.
	
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	
	Info_ClearChoices (DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 oseille royale",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"Anneau de compétence",DIA_Vatras_MESSAGE_SUCCESS_Ring);	
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 pépite de minerai",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems (self, hero,ItPl_Perm_Herb ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems (self, hero,ItRi_Dex_01 ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems (self, hero,ItMI_Nugget ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

////////////////////////// Geht weg //////////////////////////////////
const int kurz = 0;
const int lang = 1;

var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg (var int dauer)
{
	// EXIT IF
	
	if (Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	
	//FUNC
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500)
	&& (Npc_WasInState (self, ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP (self);
		
		AI_Output (self, other, "DIA_Vatras_Add_05_06"); //Ecoutez tous ! Je dois partir ailleurs.
		if (dauer == kurz)
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_07"); //Cela ne prendra pas longtemps et je vous raconterai la fin de l'histoire à mon retour.
		}
		else //lang
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_08"); //J'ignore si je reviendrai. Si vous voulez connaître la fin de l'histoire, lisez les textes sacrés.
			
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_09"); //Adanos soit avec vous !
		
		B_TurnToNpc (self, other);
	};
	
	Vatras_SchickeLeuteWeg = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info AbloesePre
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AbloesePre		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AbloesePre_Condition;
	information	 = 	DIA_Addon_Vatras_AbloesePre_Info;

	description	 = 	"J'ai un problème avec l'Œil d'Innos.";
};

func int DIA_Addon_Vatras_AbloesePre_Condition ()
{
	if ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE))
	&& (Kapitel == 3)
	&& (VatrasCanLeaveTown_Kap3 == FALSE)
	&& (RavenIsDead == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Vatras_AbloesePre_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_00"); //J'ai un problème avec l'Oeil d'Innos. Je sollicite votre aide.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_01"); //Et est-ce que votre problème m'obligera à quitter la ville ?
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_02"); //Je ne sais pas. Probablement.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_03"); //J'attends depuis des jours d'être relevé. Les autres Mages de l'eau devraient être revenus de Khorinis depuis un bon moment.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_04"); //Si vous voyez au moins l'un d'eux en ville venir me relever de mes fonctions, je serai en mesure de vous aider à résoudre votre problème.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Vatras ne pourra m'aider à résoudre mon problème avec l'Œil d'Innos tant qu'aucun autre Mage de l'eau ne le remplacera dans ses tâches dans la ville."); 
};

///////////////////////////////////////////////////////////////////////
//	Info AddonSolved
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AddonSolved		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AddonSolved_Condition;
	information	 = 	DIA_Addon_Vatras_AddonSolved_Info;

	description	 = 	"Quelqu'un est là pour prendre votre relève.";
};

func int DIA_Addon_Vatras_AddonSolved_Condition ()
{
	 if (RavenIsDead == TRUE)
	 {
		return TRUE;
	 };
};

func void DIA_Addon_Vatras_AddonSolved_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_00"); //Quelqu'un est là pour prendre votre relève.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_01"); //Est-ce que les affaires au-delà des montagnes du nord-est se sont arrangées ?
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_02"); //Oui. Raven est mort et la menace a été détournée.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_03"); //Ça c'est vraiment un bonne nouvelle. Maintenant espérons que de pareilles choses ne se renouvelleront plus.

	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_04"); //Maintenant je peux vous aider à résoudre votre petit problème.
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_05"); //Il semble me souvenir qu'il s'agit de l'Oeil d'Innos, n'est-ce pas ?
	};
	VatrasCanLeaveTown_Kap3 = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info InnoseyeKaputt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INNOSEYEKAPUTT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information	 = 	DIA_Vatras_INNOSEYEKAPUTT_Info;

	description	 = 	"L'Œil d'Innos est brisé.";
};

func int DIA_Vatras_INNOSEYEKAPUTT_Condition ()
{
		if 	(	(Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE)	)
		&& (Kapitel == 3)
		&& (VatrasCanLeaveTown_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info ()
{
	if (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_00"); //Je viens de la part de Pyrokar.
	}
	else if (MIS_Xardas_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_01"); //Je viens de la part de Xardas.
	};

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);

	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_02"); //L'Œil d'Innos a été brisé.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_03"); //Je sais. Des novices fort affectés me l'ont déjà appris.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_04"); //Les Traqueurs ont utilisé le Cercle du soleil des Magiciens du feu afin de détruire l'Œil d'Innos.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_05"); //Il faut reconnaître que c'est bien joué de la part de l'ennemi.

	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Les rumeurs se répandent vite en ville.", DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten );

	if (hero.guild == GIL_KDF)
	&& (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Pourquoi Pyrokar m'envoie-t-il à vous en particulier ?", DIA_Vatras_INNOSEYEKAPUTT_warumdu );
	};
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Que va-t-il advenir de l'Œil maintenant ?", DIA_Vatras_INNOSEYEKAPUTT_Auge );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00"); //Que va-t-il advenir de l'Œil désormais ?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01"); //Il est impératif de le reconstituer. Mais cela ne sera pas chose aisée, je le crains.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02"); //La monture a été cassée en deux. Je pense toutefois qu'un bon artisan devrait pouvoir la réparer.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03"); //Mais le vrai problème n'est pas là. C'est plutôt la pierre précieuse qui m'inquiète.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04"); //Elle est ternie, comme sans vie. L'ennemi semble savoir exactement quoi faire pour l'affaiblir.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Où puis-je trouver un forgeron capable de réparer la monture ?", DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Comment la gemme peut-elle récupérer son pouvoir ?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00"); //Comment la gemme peut-elle récupérer son pouvoir ?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01"); //Je ne vois qu'une seule façon de procéder : l'union des trois divinités suprêmes devrait produire l'effet désiré.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02"); //Un rituel d'inversion préparé avec soin et exécuté à l'endroit où la gemme a été détruite devrait lui rendre son feu intérieur.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03"); //Le problème, c'est qu'il va falloir amener un représentant terrestre de chacun des trois dieux en cet endroit.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04"); //De plus, il faut au moins trois doses d'herbe des marais pour pouvoir accomplir le rituel.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Qui peuvent bien être ces trois représentants mortels des dieux ?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Où puis-je trouver cette herbe des marais ?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00"); //Où puis-je trouver cette herbe des marais ?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01"); //J'ai entendu parler d'une rebouteuse du nom de Sagitta vivant dans les bois. Elle est censée en vendre.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02"); //Mais vous pouvez également essayer d'en trouver au port.
	

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00"); //Qui peuvent bien être ces trois représentants terrestres des dieux ?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01"); //Je représenterai moi-même Adanos.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02"); //Pyrokar, maître des Magiciens du feu, est le mieux placé pour représenter Innos.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03"); //Par contre, je ne vois personne qui fasse l'affaire pour Béliar. Il faudrait un pratiquant de la magie noire...

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "De la magie noire ? Et Xardas ?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00"); //La magie noire ? Pourquoi pas Xardas alors ?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01"); //Excellente idée ! Cela pourrait marcher.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02"); //Mais je me demande comment vous allez bien pouvoir faire pour nous regrouper tous les trois au même endroit.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03"); //Je vois déjà la tête de Pyrokar quand il apprendra qu'il lui faut coopérer avec Xardas...

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Je dois y aller.", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter );
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00"); //Où puis-je trouver un artisan capable de réparer la monture de l'Œil ?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01"); //Renseignez-vous aux alentours. Il doit bien y avoir quelqu'un qui sait réparer les bijoux.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00"); //Pourquoi Pyrokar m'a-t-il envoyé vers vous ?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01"); //Je me doutais que cela se produirait un jour ou l'autre.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02"); //Pyrokar se croit tellement supérieur et invulnérable qu'il en vient parfois à commettre des erreurs.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03"); //C'est ce qui explique qu'il n'ait pas pris les précautions nécessaires pour protéger l'Œil.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04"); //Je pense qu'inconsciemment, il compte sur les pouvoirs que me confère Adanos.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05"); //Je n'ose imaginer ce qui se produirait si je n'étais pas disponible.

};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00"); //Les nouvelles vont vite dans cette ville.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01"); //Et c'est une bonne chose, car l'ennemi n'est pas du genre à se reposer sur ses lauriers.

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00"); //Je dois y aller.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01"); //Je m'en vais aussi afin de préparer la cérémonie du Cercle du soleil.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02"); //Dites à Xardas et à Pyrokar de venir ici. Et n'oubliez surtout pas de me ramener l'herbe des marais ! Je compte sur vous.
	
	B_LogEntry (TOPIC_INNOSEYE, "Vatras veut effectuer un rituel au Cercle du soleil pour 'guérir' l'Œil. Je dois persuader Xardas et Pyrokar d'y participer. Je dois aussi trouver un forgeron qui peut réparer l'amulette.");

	MIS_RitualInnosEyeRepair = LOG_RUNNING;
	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine	(self,"RITUALINNOSEYEREPAIR");

	
	// ------ Zuhörer weg -------
		B_Vatras_Geheweg (kurz);
	// --------------------------
	
	//Joly: Weg mit den Ritualdementoren!!!!!

	DMT_1201.aivar[AIV_EnemyOverride] = TRUE;	//Joly: Damit sie erstmal nicht die Welt entvölkern, ohne Zutun des Spielers!!!!!
	DMT_1202.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1203.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1204.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1205.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1206.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1207.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1208.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1209.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1210.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1211.aivar[AIV_EnemyOverride] = TRUE;

	B_StartOtherRoutine (DMT_1201 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1202 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1203 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1204 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1205 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1206 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1207 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1208 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1209 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1210 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1211 ,"AfterRitual");
};
///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_RitualInnosEyeRepair		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_RitualInnosEyeRepair_Condition;
	information	 = 	DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent	 = 	TRUE;

	description	 = 	"Où en est-on avec l'Œil d'Innos ?";
};

func int DIA_Vatras_RitualInnosEyeRepair_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_RitualInnosEyeRepair_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_RitualInnosEyeRepair_15_00"); //Comment ça se passe pour l'Œil d'Innos ?
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_01"); //N'oubliez pas : seul un rituel d'inversion exécuté au Cercle du soleil, conjointement avec Xardas et Pyrokar pourra reconstituer l'Œil.
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_02"); //Et pensez surtout à apporter l'Œil une fois que vous aurez fait réparer sa monture !
};

///////////////////////////////////////////////////////////////////////
//	Info Beginn
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_BEGINN		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	31;
	condition	 = 	DIA_Vatras_BEGINN_Condition;
	information	 = 	DIA_Vatras_BEGINN_Info;

	description	 = 	"J'ai fait tout ce que vous m'avez demandé de faire.";
};

func int DIA_Vatras_BEGINN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_GetDistToWP(self,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Xardas,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Pyrokar,	"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
		&& (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Vatras_BEGINN_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_00"); //J'ai fait ce que vous m'aviez demandé. Voici l'Œil réparé.
	B_GivePlayerXP (XP_RitualInnosEyeRuns);

	B_GiveInvItems 		(other, self, ItMi_InnosEye_Broken_MIS, 1);
	Npc_RemoveInvItem 	(self, ItMi_InnosEye_Broken_MIS);

	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_01"); //Plus rien ne manque pour accomplir le rituel désormais.
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_02"); //Et l'herbe des marais ?
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_03"); //Ah, oui ! Vous avez les trois doses requises ?
	
	if (B_GiveInvItems (other, self, ItPL_SwampHerb,3))
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_04"); //Oui. Les voici.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_05"); //Excellent !
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_06"); //Non, hélas.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_07"); //Bon. Dans ce cas, il va nous falloir nous en passer.
	};
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_08"); //Je suis fier de vous. Mais maintenant, écartez-vous pour nous laisser accomplir la cérémonie. Puissent nos esprits s'unir.
 	
	Info_ClearChoices	(DIA_Vatras_BEGINN);
	Info_AddChoice	(DIA_Vatras_BEGINN, DIALOG_ENDE, DIA_Vatras_BEGINN_los );

};
func void DIA_Vatras_BEGINN_los ()
{
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 	
 	Npc_ExchangeRoutine	(self,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk (self,60);

	RitualInnosEyeRuns = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info augeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_AUGEGEHEILT_Condition;
	information	 = 	DIA_Vatras_AUGEGEHEILT_Info;
	important	 = 	TRUE;
};

func int DIA_Vatras_AUGEGEHEILT_Condition ()
{
	if (Kapitel == 3)
		&& (RitualInnosEyeRuns == LOG_RUNNING)
		&& (Npc_RefuseTalk(self) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Vatras_AUGEGEHEILT_Info ()
{
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_00"); //Voilà, c'est terminé : nous avons réussi à contrer le plan de notre ennemi en reconstituant l'Œil.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_01"); //Je laisse Pyrokar vous expliquer comment faire appel à son pouvoir.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_02"); //J'espère que je vous reverrai une fois que vous aurez mené à bien votre mission. Au revoir.
 	
 	B_LogEntry (TOPIC_INNOSEYE, "L'Œil a été 'guéri'. Pyrokar va me le remettre pour que je parte à la chasse aux dragons.");
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 
 	RitualInnosEyeRuns = LOG_SUCCESS;
 	MIS_RitualInnosEyeRepair = LOG_SUCCESS;	
 
	B_StartOtherRoutine   (Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine   (Xardas, "RitualInnosEyeRepair");
	
	B_StartOtherRoutine  (VLK_455_Buerger,"START");
	B_StartOtherRoutine  (VLK_454_Buerger,"START");
	B_StartOtherRoutine  (VLK_428_Buergerin,"START");
	B_StartOtherRoutine  (VLK_450_Buerger,"START");
	B_StartOtherRoutine  (VLK_426_Buergerin,"START");
	B_StartOtherRoutine  (VLK_421_Valentino,"START");
};



///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_PERMKAP3		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_PERMKAP3_Condition;
	information	 = 	DIA_Vatras_PERMKAP3_Info;

	description	 = 	"Merci de m'avoir aidé à restaurer l'Œil d'Innos.";
};

func int DIA_Vatras_PERMKAP3_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_PERMKAP3_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_PERMKAP3_15_00"); //Merci de m'avoir aidé en reconstituant l'Œil d'Innos.
	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_01"); //Ne me remerciez pas trop vite. Pour vous, le plus dur reste à faire.

	if (MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_02"); //Allez parler à Pyrokar, il vous expliquera tout le reste.
	};

	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_03"); //J'espère vous revoir en un seul morceau, mon fils.

};

///////////////////////////////////////////////////////////////////////
//	Info HildaKrank
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HILDAKRANK		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	34;
	condition	 = 	DIA_Vatras_HILDAKRANK_Condition;
	information	 = 	DIA_Vatras_HILDAKRANK_Info;

	description	 = 	"Hilda, la femme de Lobart, est malade.";
};

func int DIA_Vatras_HILDAKRANK_Condition ()
{
	if (MIS_HealHilda == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Vatras_GREET))
		{
				return TRUE;
		};
};

func void DIA_Vatras_HILDAKRANK_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HILDAKRANK_15_00"); //Hilda, la femme de Lobart, est malade.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_01"); //Quoi ? Encore ? Elle devrait prendre un peu plus soin d'elle !
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_02"); //Si le prochain hiver est rigoureux, elle ne le passera jamais. Très bien, je vais lui donner de quoi faire tomber la fièvre.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_03"); //Oh, tant que vous y êtes, vous ne pourriez pas lui apporter ce remède ?
	CreateInvItems (self, ItPo_HealHilda_MIS, 1);									
	B_GiveInvItems (self, other, ItPo_HealHilda_MIS, 1);					
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_OBSESSION		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	35;
	condition	 = 	DIA_Vatras_OBSESSION_Condition;
	information	 = 	DIA_Vatras_OBSESSION_Info;

	description	 = 	"J'ai un étrange sentiment d'agitation.";
};

func int DIA_Vatras_OBSESSION_Condition ()
{
	if (SC_IsObsessed == TRUE)
	&& (SC_ObsessionTimes < 1)
		{
				return TRUE;
		};
};

func void DIA_Vatras_OBSESSION_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_OBSESSION_15_00"); //Je me sens anxieux.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_01"); //C'est vrai que vous n'avez pas l'air bien. Vous avez été soumis trop longtemps au regard noir des Traqueurs.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_02"); //Je peux certes soigner votre corps, mais seul le monastère pourra purifier votre âme. Allez voir Pyrokar, il vous aidera.
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_Vatras_AllDragonsDead(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 59;
	condition	= DIA_Vatras_AllDragonsDead_Condition;
	information	= DIA_Vatras_AllDragonsDead_Info;
	description = "Les dragons ne sèmeront plus le chaos.";
};                       
FUNC INT DIA_Vatras_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vatras_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_00"); //Les dragons ne feront plus de ravages.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_01"); //Je savais que vous nous reviendriez sain et sauf, mais il vous reste encore à affronter votre plus terrible adversaire.
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_02"); //Je sais.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_03"); //Dans ce cas, équipez-vous et venez me trouver si vous avez besoin d'aide. Et ne vous séparez jamais de l'Œil d'Innos, vous m'entendez ? Qu'Adanos vous bénisse.
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_KnowWhereEnemy_Condition;
	information	 = 	DIA_Vatras_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Je sais où se trouve notre ennemi.";
};
func int DIA_Vatras_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Vatras_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Vatras_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_00"); //Je sais où se trouve l'ennemi.
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_01"); //Alors ne perdons pas de temps. Lancez-vous à sa recherche avant qu'il ne s'en prenne à nous.
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_02"); //Voulez-vous m'accompagner ?
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_03"); //J'y ai longuement réfléchi et je n'ai jamais été aussi sûr de moi, mon ami.
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                    	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                    	
	B_LogEntry (TOPIC_Crew,"Etonnamment, Vatras m'a proposé de m'accompagner au cours de mon voyage. Un homme ayant ses compétences et son expérience me sera d'une grande aide.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Vatras_KnowWhereEnemy_15_04"); //J'ai déjà trop de gens sur ma liste, et j'ai bien peur de ne pas avoir de place pour vous.
		AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_05"); //Alors faites de la place. Vous avez besoin de moi.
	}
	else 
	{
		Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Je vais y réfléchir encore un peu.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Je considère comme un honneur de vous avoir à mes côtés.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_Yes_15_00"); //Ce sera un honneur pour moi que de vous avoir à mes côtés. Retrouvez-moi au port.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01"); //Ne perdez pas de temps. L'ennemi ne dort jamais, mon ami.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg (lang);
	
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_No_15_00"); //Il faut que j'y réfléchisse encore un peu.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_No_05_01"); //Comme vous voudrez. Revenez me trouver si vous changez d'avis.

	Vatras_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_LeaveMyShip		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_LeaveMyShip_Condition;
	information	 = 	DIA_Vatras_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Vous feriez mieux de rester ici. La ville a besoin de vous.";
};
func int DIA_Vatras_LeaveMyShip_Condition ()
{	
	if (Vatras_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_LeaveMyShip_15_00"); //Il vaudrait peut être mieux que vous restiez ici. La ville a besoin de vous.
	AI_Output			(self, other, "DIA_Vatras_LeaveMyShip_05_01"); //Vous avez peut-être raison. Et pourtant, vous savez que je suis prêt à vous accompagner si vous le souhaitez.
	
	Vatras_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"PRAY"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_StillNeedYou_Condition;
	information	 = 	DIA_Vatras_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Venez avec moi sur l'île de l'ennemi.";
};

func int DIA_Vatras_StillNeedYou_Condition ()
{	
	if ((Vatras_IsOnBOard == LOG_OBSOLETE)	
	|| (Vatras_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Vatras_StillNeedYou_15_00"); //Venez avec moi jusqu'à l'île de l'ennemi.
	AI_Output	(self, other, "DIA_Vatras_StillNeedYou_05_01"); //Voilà une sage décision. J'espère que vous allez vous y tenir cette fois-ci.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg (lang);
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PISSOFFFOREVVER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PISSOFFFOREVVER		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition ()
{
	if (VatrasPissedOffForever == TRUE)
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info ()
{
	B_VatrasPissedOff ();
	AI_StopProcessInfos (self);  Vatras_MORE = FALSE;
};


