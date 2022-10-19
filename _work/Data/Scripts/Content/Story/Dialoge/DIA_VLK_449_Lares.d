// ************************************************************
// 			Lares Patch 
// ************************************************************
instance DIA_Addon_Lares_Patch		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 99;
	condition	= DIA_Addon_Lares_Patch_Condition;
	information	= DIA_Addon_Lares_Patch_Info;
	description	= "(Ornament - Stück zurückverlangen)";
};
func int DIA_Addon_Lares_Patch_Condition ()
{
	if (Npc_HasItems  (self,ItMi_Ornament_Addon_Vatras))
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Patch_Info ()
{
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras,1);
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap1_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap1_EXIT_Condition;
	information	= DIA_Lares_Kap1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HaltsMaul
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_HaltsMaul		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_HaltsMaul_Condition;
	information	 = 	DIA_Addon_Lares_HaltsMaul_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Lares_HaltsMaul_Condition ()
{
	if (Lares_HaltsMaul == TRUE)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Lares_HaltsMaul_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_HaltsMaul_09_01"); //Je vous verrai plus tard au port.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lares_PICKPOCKET (C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 900;
	condition	= DIA_Lares_PICKPOCKET_Condition;
	information	= DIA_Lares_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Lares_PICKPOCKET_Condition()
{
	C_Beklauen (95, 350);
};
 
FUNC VOID DIA_Lares_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lares_PICKPOCKET);
	Info_AddChoice		(DIA_Lares_PICKPOCKET, DIALOG_BACK 			,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lares_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lares_PICKPOCKET);
};
	
func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lares_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Lares_HALLO		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Lares_HALLO_Condition;
	information	= DIA_Lares_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE; 
};
func int DIA_Lares_HALLO_Condition ()
{	
	if 	(RangerMeetingRunning == 0)//ADDON
		{
			return TRUE;
		};
};
func void DIA_Lares_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Lares_HALLO_09_00"); //Je dois être dingue, mais... qu'est-ce que vous faites ici ?
	
	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output (self, other, "DIA_Lares_HALLO_09_01"); //Vous êtes venu A LA NAGE ?
		AI_Output (self, other, "DIA_Lares_HALLO_09_02"); //(éclate de rire) C'est vrai que c'est un moyen comme un autre de passer les garde des portes de la ville.
		B_GivePlayerXP (500); //wer's schafft...	
	};
			
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Nous sommes-nous déjà rencontrés ?",DIA_Lares_HALLO_NO);
	Info_AddChoice 		(DIA_Lares_HALLO,"Hé ! Lares, vieille canaille...",DIA_Lares_HALLO_YES);
};
FUNC VOID DIA_Lares_HALLO_NO()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NO_15_00"); //On se connaît ?
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_01"); //Vous ne vous souvenez pas de moi ? J'étais au nouveau campement.
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_02"); //La liste de la mine... bon sang, quelle rigolade ! Vous vous souvenez de Lee ?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Bien sûr que je me souviens de Lee !",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee... ?",DIA_Lares_HALLO_NOIDEA);
};
FUNC VOID DIA_Lares_HALLO_YES()
{
	AI_Output (other, self, "DIA_Lares_HALLO_YES_15_00"); //Hé, Lares ! Comment vous êtes arrivé ici, espèce de gredin ?
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_01"); //J'ai réussi à fuir la Vallée des mines juste à temps, en compagnie de Lee et d'autres gars.
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_02"); //Vous vous souvenez de Lee, pas vrai ?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Bien sûr que je me souviens de Lee !",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee... ?",DIA_Lares_HALLO_NOIDEA);
};

// ------------------------------	
	func void B_Lares_AboutLee()
	{
		AI_Output (self, other, "B_Lares_AboutLee_09_00"); //Je suis parti de la colonie avec lui, juste après la destruction de la Barrière.
		AI_Output (self, other, "B_Lares_AboutLee_09_01"); //Lui et les autres gars travaillent désormais à la ferme d'Onar, le propriétaire terrien.
		AI_Output (self, other, "B_Lares_AboutLee_09_02"); //Il a passé un accord avec le fermier : ses hommes et lui défendent la ferme, en échange de quoi Onar les nourrit.
	};
// ------------------------------	

FUNC VOID DIA_Lares_HALLO_LEE()
{
	AI_Output (other, self, "DIA_Lares_HALLO_LEE_15_00"); //Bien sûr que je me souviens de Lee !
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};
FUNC VOID DIA_Lares_HALLO_NOIDEA()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NOIDEA_15_00"); //Lee ?
	AI_Output (self, other, "DIA_Lares_HALLO_NOIDEA_09_01"); //Ça n'a pas été rose tous les jours pour vous, hein ? Lee était le chef des mercenaires du nouveau campement.
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};



// ************************************************************
// ***														***
// 								ADDON
// ***														***
// ************************************************************

// ------------------------------------------------------------
// Vatras schickt mich 
// ------------------------------------------------------------
instance DIA_Addon_Lares_Vatras		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 1;
	condition	= DIA_Addon_Lares_Vatras_Condition;
	information	= DIA_Addon_Lares_Vatras_Info;

	description	= "C'est Vatras qui m'envoie.";
};
func int DIA_Addon_Lares_Vatras_Condition ()
{
	if (Vatras_GehZuLares == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Vatras_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Vatras_15_00"); //Vatras m'envoie. Il m'a dit de venir vous voir si j'avais besoin d'aide.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_01"); //(étonné) Vous avez donc déjà été voir Vatras. Vous avez dû faire bonne impression sur lui.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_02"); //Autrement il n'aurait certainement pas donné mon nom. Surtout depuis cette affaire de disparitions non élucidées.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_03"); //Dites-moi ce dont vous avez besoin.
	Lares_RangerHelp = TRUE;

	if (GregLocation == Greg_Farm1)
	{
		B_StartOtherRoutine	(Bau_974_Bauer,"GregInTaverne");
		GregLocation = Greg_Taverne;
		B_StartOtherRoutine	(Greg_NW,"Taverne");
	};
};

// ************************************************************
// 						Ring des Wassers
// ************************************************************
// ------------------------------------------------------------
// WhatAreYouGuys
// ------------------------------------------------------------
instance DIA_Addon_Lares_WhatAreYouGuys		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 6;
	condition	= DIA_Addon_Lares_WhatAreYouGuys_Condition;
	information	= DIA_Addon_Lares_WhatAreYouGuys_Info;

	description	 = 	"Quelle sorte d'affaires faites-vous donc avec Vatras ?";
};
func int DIA_Addon_Lares_WhatAreYouGuys_Condition ()
{
	if (Lares_RangerHelp == TRUE)
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_WhatAreYouGuys_Info ()
{	
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_00"); //Quelle sorte d'affaires faites-vous donc avec Vatras ?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_01"); //J'ai passé un petit accord avec les Mages de l'eau, vous voyez.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_02"); //Quelle sorte d'accord ?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_03"); //Nous travaillons pour eux et ils font en sorte que notre passé à la colonie pénitentiaire ne nous pose aucun problème.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_04"); //Vous êtes en train de parler de l'Anneau de l'eau ?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_05"); //Vous en avez entendu parler ?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_06"); //Vatras m'en a parlé.
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_07"); //Vous auriez dû le dire de suite.

	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Lares fait partie de l'Anneau de l'eau." ); 
};
// ------------------------------------------------------------
// Ranger
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ranger		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_Ranger_Condition;
	information	= DIA_Addon_Lares_Ranger_Info;

	description	= "Dites m'en plus sur l'Anneau de l'eau.";
};
func int DIA_Addon_Lares_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_00"); //Dites m'en plus sur l'Anneau de l'eau.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_01"); //L'Anneau est aux Mages de l'eau ce que les paladins sont aux Magiciens du feu.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_02"); //Mais à la différence des paladins, nous opérons dans l'ombre.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_03"); //L'Anneau est une arme puissante dans le combat contre les dangers menaçant les gens de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_04"); //Mais cela ne fonctionnera qu'aussi longtemps que l'identité de ceux appartenant à l'Anneau de l'eau sera tenue secrète.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_05"); //Gardez cela pour vous !
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_06"); //Certainement.
	B_LogEntry (TOPIC_Addon_RingOfWater,"L'Anneau de l'eau est aux Mages de l'eau ce que les paladins sont aux Magiciens du feu. Mais l'Anneau opère dans l'ombre. Nul n'en connaît les membres, et ainsi, l'étendue de sa puissance demeure secrète." ); 
};
// ------------------------------------------------------------
// Info WannaBeRanger
// ------------------------------------------------------------
instance DIA_Addon_Lares_WannaBeRanger		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_WannaBeRanger_Condition;
	information	= DIA_Addon_Lares_WannaBeRanger_Info;

	description	= "Je veux rejoindre l'Anneau de l'eau...";
};
func int DIA_Addon_Lares_WannaBeRanger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ranger))
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_WannaBeRanger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_15_00"); //Je veux rejoindre l'Anneau de l'eau...
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_09_01"); //Ça ne me pose pas de problème. Mais la décision concernant votre acceptation ou non n'est que du seul ressort des Mages de l'eau.
	
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 


	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Je vois.", DIA_Addon_Lares_WannaBeRanger_BACK );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Qu'est-ce que ça fait d'appartenir à l'Anneau ?", DIA_Addon_Lares_WannaBeRanger_HowIsIt );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Qu'avez-vous fait pour impressionner les Mages de l'eau ?", DIA_Addon_Lares_WannaBeRanger_AboutYou );
};
func void DIA_Addon_Lares_WannaBeRanger_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_BACK_15_00"); //Je vois.
	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
};
func void DIA_Addon_Lares_WannaBeRanger_AboutYou ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00"); //Qu'avez-vous fait pour impressionner les Mages de l'eau ?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01"); //Je les ai longtemps protégés quand nous vivions encore derrière la Barrière.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02"); //(sourit) Et ils ont de nombreuses raisons de m'être reconnaissant.
};
func void DIA_Addon_Lares_WannaBeRanger_HowIsIt ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00"); //Qu'est-ce que ça fait d'appartenir à l'Anneau ?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01"); //Nous sommes très différents des autres communautés dont vous pouvez faire parti ici à Khorinis.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02"); //Une fois que vous êtes l'un des nôtres, nous ne vous demandons rien allant à l'encontre de ce que vous êtes prêt à faire.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03"); //La seule chose que nous exigeons de vous c'est de vous montrer discret.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04"); //Nous œuvrons en secret et nous ne voulons pas que les étrangers sachent qui sont nos membres.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05"); //Nous garderons un œil sur vous. On doit avoir un œil sur tout.
};
// ------------------------------------------------------------
// Info RingBack (Bin jetzt dabei)
// ------------------------------------------------------------
func void B_Lares_Geheimtreffen()
{
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_07"); //Nous allons tenir une réunion secrète prochainement dans la taverne d'Orlan.
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_08"); //Rejoignez-nous dès que vous pourrez. Nous vous donnerons votre équipement à ce moment.
};
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_RingBack_Condition;
	information	 = 	DIA_Addon_Lares_RingBack_Info;

	description	 = 	"J'appartiens maintenant à l'Anneau de l'eau.";
};
func int DIA_Addon_Lares_RingBack_Condition ()
{
	if (SC_IsRanger == TRUE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	&& (((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B")<1000) )||((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08")<1000)))
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_RingBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_00"); //J'appartiens maintenant à l'Anneau de l'eau.
	
	if (Lares_GotRingBack == FALSE) 
	&& (SC_GotLaresRing == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_01"); //Fantastique. Pouvez-vous alors me rendre mon anneau d'aigue-marine ?
		
		if (B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_02"); //Certainement. Le voici.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_03"); //J'espère qu'il vous a été utile. Je suis ravi de savoir que vous êtes maintenant l'un des nôtres.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP (XP_Ambient);
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_04"); //Hum. Je ne l'ai pas sur moi là.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_05"); //Ne faites pas n'importe quoi avec ! J'en ai encore besoin.
		};
	};

	AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_06"); //Je pense que vous voulez votre équipement maintenant. Alors faites attention.
	B_Lares_Geheimtreffen();
	
	B_LogEntry (TOPIC_Addon_RingOfWater, "Lares m'a invité à assister à l'assemblée secrète de l'Anneau dans la taverne d'Orlan."); 
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
};
// ------------------------------------------------------------
// Info RingBack2
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack2		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_RingBack2_Condition;
	information	= DIA_Addon_Lares_RingBack2_Info;

	description	= "Voici votre anneau d'aigue-marine.";
};
func int DIA_Addon_Lares_RingBack2_Condition ()
{
	if (Npc_HasItems (other,ItRi_Ranger_Lares_Addon))
	&& (Lares_GotRingBack == FALSE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_RingBack2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack2_15_00"); //Voici votre anneau d'aigue-marine.
	B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1);
	AI_Output	(self, other, "DIA_Addon_Lares_RingBack2_09_01"); //Vous avez de la chance. Je  pensais que vous l'aviez perdu.
	B_GivePlayerXP (XP_Ambient);
	Lares_GotRingBack = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Geduld
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Geduld		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 =  2;
	condition	 = 	DIA_Addon_Lares_Geduld_Condition;
	information	 = 	DIA_Addon_Lares_Geduld_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Lares_Geduld_Condition ()
{
	if (RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES")>200)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_Geduld_Info ()
{ 
	AI_Output	(self, other, "DIA_Addon_Lares_Geduld_09_01"); //Vous devez attendre encore un peu. Tout le monde n'est pas encore arrivé.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 						RANGER MEETING
// ************************************************************
instance DIA_Addon_Lares_GetRangerArmor		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_GetRangerArmor_Condition;
	information	= DIA_Addon_Lares_GetRangerArmor_Info;
	important	= TRUE;
};
func int DIA_Addon_Lares_GetRangerArmor_Condition ()
{
	if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
	&& ((Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES")<200))
	&& (RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_GetRangerArmor_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_00"); //Très bien, mon jeune ami. Nous sommes venus ensemble ici pour fêter votre intronisation à l'Anneau de l'eau.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_01"); //Les garçons présents ouvriront l'œil à partir d'aujourd'hui.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_02"); //Évidemment, d'autres appartiennent aussi à l'Anneau de l'eau, soyez prudent.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_03"); //Que vous nous rendiez service ou que vous fassiez du grabuge, nous le saurons.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_04"); //Je vous donne l'armure de notre communauté.
	CreateInvItem	(hero, ITAR_RANGER_Addon);
	AI_EquipArmor	(hero, ITAR_RANGER_Addon);	
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_05"); //Portez-la dignement, mais jamais en ville ou dans les autres lieux habités.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_06"); //Souvenez-vous que nous ne devons pas être exposés. Par conséquent, personne ne doit savoir qui sont les membres de l'Anneau de l'eau.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_07"); //Personne ne parle de l'Anneau de l'eau. C'est notre première règle. Appliquez-la strictement.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_08"); //D'autres questions ?
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "Je dois y aller.", DIA_Addon_Lares_GetRangerArmor_end );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "Quelle aide pouvez-vous m'offrir ?", DIA_Addon_Lares_GetRangerArmor_Learn );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "Qu'en est-il des armes ?", DIA_Addon_Lares_GetRangerArmor_weapons );

};
func void DIA_Addon_Lares_GetRangerArmor_weapons ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_weapons_15_00"); //Qu'en est-il des armes ?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_01"); //L'arme de l'Anneau est le bâton, mais chacun utilise l'arme avec laquelle il est le plus à l'aise.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_02"); //Voici l'un de nos bâtons, je n'ai jamais bien su comment l'utiliser, peut-être réussirez-vous à vous en servir.
	CreateInvItems (self, ItMw_RangerStaff_Addon, 1);									
	B_GiveInvItems (self, other, ItMw_RangerStaff_Addon, 1);		
};
func void DIA_Addon_Lares_GetRangerArmor_end ()
{
	B_MakeRangerReadyToLeaveMeetingALL ();
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_end_15_00"); //Je dois y aller.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_01"); //Bien, ne les laissez pas vous attraper.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_02"); //Maintenant allez directement voir Vatras et il vous assignera votre première tâche.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_03"); //Frères de l'Anneau. Retournons maintenant à nos tâches.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_04"); //Les attaques de bandits continuent. Nous devons faire en sorte que cette menace cesse.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_05"); //Adanos, maintiens l'équilibre du monde.
	Lares_TakeFirstMissionFromVatras = TRUE;

	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, DIALOG_ENDE, DIA_Addon_Lares_GetRangerArmor_weiter );
};
func void DIA_Addon_Lares_GetRangerArmor_weiter () 
{
	AI_StopProcessInfos (self);
	B_RangerMeetingParking ();
	B_LogEntry (TOPIC_Addon_RingOfWater,"Mon armure m'a été remise lors de l'assemblée secrète dans la taverne d'Orlan. Je dois maintenant aller voir Vatras, qui me confiera ma première mission en tant que membre de l'Anneau." ); 
};

func void DIA_Addon_Lares_GetRangerArmor_Learn ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_Learn_15_00"); //Quelle aide pouvez-vous m'offrir ?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_01"); //Je peux vous montrer comment améliorer votre déxtérité.

	if ((Npc_IsDead(SLD_805_Cord))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_02"); //Si vous avez besoin d'aide pour le maniement des armes de corps à corps, demandez à Cord. C'est une fine lame.
	};
	if ((Npc_IsDead(BAU_961_Gaan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_03"); //Gaan sera ravi de vous montrer comment éviscérer correctement les bêtes.
	};	
	if ((Npc_IsDead(Mil_350_Addon_Martin))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_04"); //Martin peut vous en dire plus sur les paladins.
	};	
	if ((Npc_IsDead(Bau_4300_Addon_Cavalorn))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_05"); //Cavalorn vous apprendra la discrétion, le combat à une main et le tir à l'arc.
	};
	if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_06"); //Orlan aura toujours une chambre et un lit bien chaud pour vous.
	};
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_07"); //Et pour tout ce qui a trait à la magie, demandez à Vatras.
};



// ************************************************************
// 							Teleporter
// ************************************************************
instance DIA_Addon_Lares_Teleportstation		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_Teleportstation_Condition;
	information	 = 	DIA_Addon_Lares_Teleportstation_Info;

	description	 = 	"Avez-vous déjà utilisé une pierre de téléportation ?";
};
func int DIA_Addon_Lares_Teleportstation_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)//SC war schon bei den Wassermagiern
	&& (SCUsed_TELEPORTER == TRUE)			//SC hat schon mal einen Teleporter benutzt
	&& (MIS_Lares_BringRangerToMe != 0) 				//hat Aquamarinring von Lares bekommen. -> für Orlan
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Teleportstation_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_00"); //Avez-vous déjà utilisé une pierre de téléportation ?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_01"); //Non, mais j'en ai entendu parler. Les Mages de l'eau ne sont pas encore très au fait de ces choses.
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_02"); //J'ai déjà essayé.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_03"); //(rit) Évidemment. Cela ne vous effraie pas quand même ?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_04"); //Bien. Si vous voulez utiliser cela, allez demander à Orlan, le tenancier qu'il vous laisse entrer dans sa grotte fermée.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_05"); //Je pense qu'il a caché une des pierres de téléportation pour les Mages de l'eau près de sa taverne.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_06"); //Sortez par la porte est de la ville et suivez tout simplement le chemin. Vous ne pouvez pas le rater.
	
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Lares m'a dit qu'Orlan a dissimulé une pierre de téléportation non loin de sa taverne."); 
	Orlan_Hint_Lares = TRUE;
};



// ************************************************************
// 							Ornament
// ************************************************************
// ------------------------------------------------------------
// Ornament von Vatras
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ornament		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_Ornament_Condition;
	information	= DIA_Addon_Lares_Ornament_Info;

	description	= "Vatras m'a remis ce bijou pour vous.";
};
func int DIA_Addon_Lares_Ornament_Condition ()
{
	if (Npc_HasItems (other,ItMi_Ornament_Addon_Vatras))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Ornament_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Ornament_15_00"); //Vatras m'a donné ce bijou pour que je vous l'apporte. Il a dit qu'il doit être rendu.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_01"); //(soupire) Naturellement, je dois me débrouiller, comme d'habitude. J'aurais dû m'en douter.
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_02"); //Je dois traverser la moitié de l'île pour le rapporter aux Mages de l'eau.
};
// ------------------------------------------------------------
// Ornament BringJob
// ------------------------------------------------------------
instance DIA_Addon_Lares_OrnamentBringJob		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_OrnamentBringJob_Condition;
	information	= DIA_Addon_Lares_OrnamentBringJob_Info;

	description = "Je peux me charger du bijou à votre place !";
};
func int DIA_Addon_Lares_OrnamentBringJob_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ornament))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_OrnamentBringJob_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_OrnamentBringJob_15_00"); //Je peux me charger du bijou à votre place !
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_01"); //(songeur) Hum. Je pense qu'il faudrait mieux que je l'apporte moi-même. Mais vous pouvez m'accompagner.
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_02"); //Le problème c'est que je ne peux pas partir d'ici pour le moment. Je dois surveiller le port.
	
	B_LogEntry (TOPIC_Addon_KDW,"J'ai porté le bijou que m'a confié Vatras à Lares. Il veut l'apporter lui-même aux Mages de l'eau. Je devrais l'accompagner."); 
	
	MIS_Addon_Lares_Ornament2Saturas = LOG_RUNNING;
};
// ------------------------------------------------------------
// Hol Ablösung
// ------------------------------------------------------------
instance DIA_Addon_Lares_YourMission		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_YourMission_Condition;
	information	= DIA_Addon_Lares_YourMission_Info;
	permanent 	= TRUE;
	description = "Que faites-vous au juste dans le port ?";
};
func int DIA_Addon_Lares_YourMission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ornament))
	&& (MIS_Lares_BringRangerToMe == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_YourMission_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_YourMission_15_00"); //Que faites-vous au juste dans le port ?
	
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_01"); //Je ne peux pas en parler.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_02"); //Vatras aurait ma tête...
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_03"); //Je fais ce que nous faisons tous. j'accomplis les tâches données par les Mages de l'eau.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_04"); //Certains disparus étaient des pêcheurs. Ils ont disparu avec leur navire.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_05"); //C'est pourquoi je me tiens là, regardant le port. Peut-être que quelque chose se reproduira.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_06"); //Mais vous pouvez m'aider.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_07"); //Écoutez. Je vais vous donner mon anneau d'aigue-marine. Cela signifie que celui qui le porte appartient à l'Anneau de l'eau.
		
		CreateInvItems (self, ItRi_Ranger_Lares_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Lares_Addon, 1);
		SC_GotLaresRing = TRUE;		
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_08"); //Si vous portez mon anneau, les autres sauront que vous agissez sous mes ordres.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_09"); //Trouvez quelqu'un pour me remplacer afin que je puisse ramener le bijou.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_10"); //Chacun de nous, à tour de rôle, surveille la place du marché. Mais je ne sais pas à qui est le tour.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_11"); //Vous devriez parler à ceux qui se tiennent par ici. Dès que la bonne personne verra que vous portez mon anneau aigue-marine, il vous le fera savoir
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_12"); //Dites-lui de veiller à ce que quelqu'un prenne ma relève au port.

		B_LogEntry (TOPIC_Addon_RingOfWater,"Lares m'a remis sa bague d'aigue-marine - l'emblème secret de l'Anneau. Lorsque je le porterai, les autres membres de l'Anneau se dévoileront à moi."); 

		Log_CreateTopic (TOPIC_Addon_BringRangerToLares, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BringRangerToLares,"Lares ne peut quitter le port. Je dois me présenter sur la place du marché en portant sa bague d'aigue-marine et tenter de trouver quelqu'un qui puisse remplir sa mission pour lui."); 

		MIS_Lares_BringRangerToMe = LOG_RUNNING;
	};
};
// ------------------------------------------------------------
// Baltram Abloese
// ------------------------------------------------------------
instance DIA_Addon_Lares_BaltramAbloese		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_BaltramAbloese_Condition;
	information	 = 	DIA_Addon_Lares_BaltramAbloese_Info;

	description	 = 	"J'ai parlé à Baltram.";
};
func int DIA_Addon_Lares_BaltramAbloese_Condition ()
{
	if (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	&& (Baltram_Exchange4Lares == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_BaltramAbloese_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_BaltramAbloese_15_00"); //J'ai parlé à Baltram. Il va trouver quelqu'un pour vous remplacer.
	AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_01"); //Ah. Très bien. Nous pouvons donc enfin partir d'ici.
	if (SC_IsRanger == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_02"); //Vous feriez mieux de garder mon anneau d'aigue-marine à partir de maintenant.
		
		if (Npc_KnowsInfo (other, DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_03"); //(sourit) Je pense que cela sera commode pour vous.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_04"); //(sourit) Qui sait, vous aurez peut-être envie de vous joindre à nous...
		};
	};
	MIS_Lares_BringRangerToMe = LOG_SUCCESS;
	Lares_CanBringScToPlaces = TRUE;
};



// ************************************************************
// 						Missing People
// ************************************************************
// ------------------------------------------------------------
// About Missing People
// ------------------------------------------------------------
var int Lares_PeopleMissing_PERM;
// ------------------------------------------------------------
instance DIA_Addon_Lares_PeopleMissing		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 3;
	condition	= DIA_Addon_Lares_PeopleMissing_Condition;
	information	= DIA_Addon_Lares_PeopleMissing_Info;
	permanent 	= TRUE;
	description	= "A propos de ces disparus...";
};
func int DIA_Addon_Lares_PeopleMissing_Condition ()
{
	if (Lares_RangerHelp == TRUE)
	&& (Lares_PeopleMissing_PERM == FALSE)
	&& ((SC_IsRanger == FALSE)||(MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_PeopleMissing_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_15_00"); //Concernant les disparus...
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice (DIA_Addon_Lares_PeopleMissing, DIALOG_BACK, DIA_Addon_Lares_PeopleMissing_BACK);
	if (MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "J'ai pu secourir certains des disparus.", DIA_Addon_Lares_PeopleMissing_SAVED );
	}
	else if (MIS_Lares_BringRangerToMe != 0)
	&& (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Je sais ce que sont devenus les disparus.", DIA_Addon_Lares_PeopleMissing_Success );
	}
	else
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Ça ne relève pas de la compétence de la milice ?", DIA_Addon_Lares_PeopleMissing_MIL );
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Dites-moi ce que vous savez.", DIA_Addon_Lares_PeopleMissing_TellMe );
	};
};
func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_TellMe_15_00"); //Dites-moi ce que vous savez.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_01"); //Le premier fut William, un des pêcheurs de Khorinis. Un jour il n'est tout simplement pas revenu.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_02"); //D'abord nous avons cru qu'un de ces monstres marins l'avait englouti lui et son bateau.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_03"); //Mais peu de temps après, d'autres personnes ont commencé à disparaître en ville et dans les environs. On a l'impression que les événements sont le fruit du hasard.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_04"); //Tout le monde reste perplexe. Parti comme c'est parti, on va devoir attendre de tomber sur un indice.

		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	SC_HearedAboutMissingPeople = TRUE;
};
func void DIA_Addon_Lares_PeopleMissing_MIL()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_MIL_15_00"); //N'est-ce pas une affaire pour la milice ?
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_01"); //La milice ne peut pas grand-chose si vous voulez mon avis.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_02"); //Ils ne vont jamais réussir à faire la lumière là-dessus. Les disparus semblent s'être évaporés dans les airs.
};
func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_00"); //Je sais ce qu'il est advenu de tous les disparus !
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_01"); //(surpris) Vraiment.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_02"); //L'ancien baron du minerai Raven les a fait enlever.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_03"); //En êtes-vous certain ? Dans ce cas, nous devons les faire sortir de là.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_04"); //J'y travaille.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_05"); //D'accord. Mais vous savez que si vous avez besoin de moi...
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_06"); //.... je saurai où vous trouver. Compris.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_SAVED ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_SAVED_15_00"); //J'ai réussi à sauver des disparus.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_SAVED_09_01"); //Je savais que vous réussiriez. Je peux donc maintenant retourner vaquer à mes occupations.
	B_GivePlayerXP (XP_Ambient);
	Lares_PeopleMissing_PERM = TRUE;
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};



// ************************************************************
// 								Hilfe
// ************************************************************
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung;
// ------------------------------------------------------------
instance DIA_Addon_Lares_RangerHelp		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_RangerHelp_Condition;
	information	= DIA_Addon_Lares_RangerHelp_Info;
	permanent	= TRUE;
	description	= "J'ai besoin de votre aide.";
};
func int DIA_Addon_Lares_RangerHelp_Condition ()
{
	if 
	(
		   (Lares_RangerHelp == TRUE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	)
	|| (Npc_IsInState (Moe, ZS_Attack))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_RangerHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RangerHelp_15_00"); //J'ai besoin de votre aide.
	AI_Output	(self, other, "DIA_Addon_Lares_RangerHelp_09_01"); //Et à quoi précisément étiez-vous en train de penser ?
	
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice (DIA_Addon_Lares_RangerHelp, DIALOG_BACK, DIA_Addon_Lares_RangerHelp_nix );
	
	if (Npc_IsInState (Moe, ZS_Attack))
	{
		Info_AddChoice (DIA_Addon_Lares_RangerHelp, "Ce type me fatigue !", DIA_Addon_Lares_RangerHelp_Moe);
	};
		
	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "J'ai besoin d'une meilleur arme.", DIA_Addon_Lares_RangerHelp_waffe );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Pourquoi pas une meilleure armure ?", DIA_Addon_Lares_RangerHelp_ruestung );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "J'ai besoin d'argent.", DIA_Addon_Lares_RangerHelp_geld );
	};
};
func void DIA_Addon_Lares_RangerHelp_ruestung ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_00"); //Pourquoi pas une meilleure armure ?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_01"); //Hum. Matteo vend des armures. Mais il vous fera probablement payer le prix fort.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_02"); //Il y a bien un moyen pour que vous l'obteniez à bon prix, si vous n'avez pas peur d'en découdre avec la milice...
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_03"); //Qu'entendez-vous par là ?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_04"); //Il y a un entrepôt près de chez Matteo. Mais toutes les marchandises ont été confisquées par la milice.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_05"); //Allez voir Zuris sur la place du marché et trouvez-vous un sort de sommeil. Puis vous pourrez envoyer les gardes rejoindre les bras de Morphée.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_06"); //Je suis certain que vous trouverez une armure digne de ce nom dans la réserve de Matteo.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_waffe_15_00"); //J'ai besoin d'une meilleur arme.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_waffe_09_01"); //Je ne peux rien faire pour cela, j'en suis navré. Avez-vous essayé la place du marché ?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_geld ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_geld_15_00"); //J'ai besoin d'argent.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_01"); //Nous en avons tous besoin. Désolé, mais je n'ai rien à vous donner. Mais Lehmar le prêteur sur gage m'est redevable.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_02"); //Allez le voir et empruntez-lui l'argent dont vous avez besoin. Je me charge du reste. Vous trouverez Lehmar dans le quartier du port, aux limites de la ville.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld = TRUE;
	RangerHelp_LehmarKohle = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
};
func void DIA_Addon_Lares_RangerHelp_nix ()
{
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
};
// ------------------------------------------------------------
// Moe
// ------------------------------------------------------------
func void DIA_Addon_Lares_RangerHelp_Moe()
{
	AI_Output (other, self, "DIA_Addon_Lares_Moe_15_00"); //Ce type m'importune...
	AI_Output (self, other, "DIA_Addon_Lares_Moe_09_01"); //Pas pour longtemps...
	Info_ClearChoices (DIA_Addon_Lares_RangerHelp);
	AI_StopProcessInfos (self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Moe, AR_GuardStopsFight, 0);
};



// ************************************************************
// ***														***
// 							Gothic II
// ***														***
// ************************************************************



// ************************************************************
// 			  			Paladine und GILDE
// ************************************************************
// ------------------------------------------------------------
// Paladine
// ------------------------------------------------------------
instance DIA_Lares_Paladine	(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	4;
	condition	 = 	DIA_Lares_Paladine_Condition;
	information	 = 	DIA_Lares_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"Je dois à tout prix parler aux paladins !";
};
func int DIA_Lares_Paladine_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Lares_Paladine_15_00"); //Il faut absolument que je parle aux paladins.
	AI_Output (self, other, "DIA_Lares_Paladine_09_01"); //Qu'est-ce que vous attendez d'eux ?
	AI_Output (other, self, "DIA_Lares_Paladine_15_02"); //Ils ont en leur possession une puissante amulette, l'Œil d'Innos. J'ai besoin de l'avoir.
	AI_Output (self, other, "DIA_Lares_Paladine_09_03"); //Et vous croyez qu'ils vont vous la donner comme ça ? Vous n'accèderez jamais au haut quartier de la ville.
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		AI_Output (other, self, "DIA_Lares_Paladine_15_04"); //Je trouverai bien un moyen...
		AI_Output (self, other, "DIA_Lares_Paladine_09_05"); //Oh, bien sûr ! A condition de lécher les bottes des citoyens ou de jouer les larbins pour la milice...
	};
	
	//AI_Output (other, self, "DIA_Lares_Alternative_15_00"); //Hab' ich eine Alternative?
	//AI_Output (self, other, "DIA_Lares_Alternative_09_01"); //Wenn ich du wäre, würde ich zu Onars Hof gehen und mit Lee reden.
	//AI_Output (self, other, "DIA_Lares_Alternative_09_02"); //Ich bin mir sicher, wir finden einem Weg, dich ins obere Viertel zu bringen.
};	

// ------------------------------------------------------------
// 			  			Warum Paladine hier?
// ------------------------------------------------------------
instance DIA_Lares_WhyPalHere		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	4;
	condition	 = 	DIA_Lares_WhyPalHere_Condition;
	information	 = 	DIA_Lares_WhyPalHere_Info;
	permanent    =  FALSE;
	description	 = 	"Savez-vous pourquoi les paladins sont ici ?";
};
func int DIA_Lares_WhyPalHere_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		if (Npc_KnowsInfo (other, DIA_Lares_Paladine))
		|| (RangerHelp_gildeMIL == TRUE)
		|| (RangerHelp_gildeSLD == TRUE)
		|| (RangerHelp_gildeKDF == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Lares_WhyPalHere_Info ()
{
	AI_Output (other, self, "DIA_Lares_WhyPalHere_15_00"); //Savez-vous ce que les paladins font ici ?
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_01"); //Personne ne sait au juste. Beaucoup de gens pensent que c'est à cause des orques, mais j'ai l'impression que la raison est tout autre.
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_02"); //Ça a probablement quelque chose à voir avec l'ancienne colonie pénitentiaire.
};	

// ------------------------------------------------------------
// 			  			Guild Bypass
// ------------------------------------------------------------
instance DIA_Addon_Lares_Gilde (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Lares_Gilde_Condition;
	information	 = 	DIA_Addon_Lares_Gilde_Info;
	permanent    =  TRUE;
	description	 = 	"Vatras a dit que vous pouviez m'aider à rejoindre la communauté.";
};
func int DIA_Addon_Lares_Gilde_Condition ()
{	
	if (Lares_RangerHelp == TRUE)
	&& (other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Gilde_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_15_00"); //Vatras a dit que vous pouviez m'aider à rejoindre la communauté.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_01"); //(rit) Marre d'être donné perdant ?
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_02"); //Très bien. je vois ce que vous voulez dire.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_03"); //Je peux jouer de mon influence sur les mercenaires si vous voulez rejoindre Lee.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_04"); //Et je suis sûr que nous pouvons trouver un moyen de vous faire rentrer rapidement dans le monastère.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_05"); //Mais la chose la plus simple serait que vous rejoignez la milice.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_06"); //Quelle communauté préférez-vous ?
		
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "J'y réfléchirai...", DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Les Magiciens du feu.", DIA_Addon_Lares_Gilde_KDF );
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Les mercenaires.", DIA_Addon_Lares_Gilde_SLD );	
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "La milice.", DIA_Addon_Lares_Gilde_MIL );
};
func void DIA_Addon_Lares_Gilde_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_BACK_15_00"); //Je dois y réfléchir...
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_SLD ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_SLD_15_00"); //Les mercenaires.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_01"); //Je suis sûr que Lee vous acceptera.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_01"); //Mais d'abord vous devrez passer une épreuve.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_02"); //Allez parler à Cord à la ferme de Onar.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_02"); //Il peut vous aider dans votre épreuve.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_03"); //Dites-lui que je vous ai pris 'sous mon aile'. Il comprendra.
	RangerHelp_gildeSLD = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpSLD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Lares m'a informé que le mercenaire Cord pourrait faciliter mon arrivée sur la ferme du propriétaire terrien."); 
	
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_MIL_15_00"); //La milice.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_01"); //(amusé) Oui. J'imagine que ça vous plairait hein ? Expliquer la loi tout en fouillant dans les poches.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_02"); //Les paladins ont entreposé leurs provisions près du port. Leur maître du cellier est un très bon ami.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_03"); //Il peut peut-être faire quelque chose pour vous. Son nom est Martin.

	Log_CreateTopic (TOPIC_Addon_RangerHelpMIL, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Lares m'a dit que Martin, le maître du cellier, m'aiderait à intégrer rapidement la milice. Je le trouverai probablement sur le port, là où se trouvent les greniers à provisions des paladins."); 
	
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_KDF ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_KDF_15_00"); //Les Magiciens du feu.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_01"); //(rit) Je parie que Vatras n'avait pas prévu cela ou il ne vous aurait pas envoyé jusqu'à moi.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_02"); //Rejoindre le monastère coûte cher.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_03"); //Ces garçons ne vous laisseront pas rentrer à moins que vous ne leur payiez un droit de passage.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_04"); //Et le seul qui puisse faire quelque chose est Vatras en personne. Vous devriez retourner lui parler à ce sujet.

	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Lares m'a appris que Vatras connaît un moyen facile d'entrer dans le monastère."); 

	RangerHelp_gildeKDF = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};


// ------------------------------------------------------------
// 			  					About Sld
// ------------------------------------------------------------
var int Lares_WorkForLee;
var int Lares_WayToOnar;
// ------------------------------------------------------------
instance DIA_Lares_AboutSld (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	10;
	condition	 = 	DIA_Lares_AboutSld_Condition;
	information	 = 	DIA_Lares_AboutSld_Info;
	permanent    =  TRUE;
	description	 = 	"Dites-m'en davantage sur Lee et ses mercenaires...";
};
func int DIA_Lares_AboutSld_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Lares_WayToOnar == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_AboutSld_Info ()
{
	AI_Output (other,self,  "DIA_ADDON_Lares_AboutSld_15_00"); //Dites-m'en plus sur Lee et ses mercenaires...
	AI_Output (self, other, "DIA_ADDON_Lares_AboutSld_09_01"); //Que voulez-vous savoir ?
	
	Info_ClearChoices (DIA_Lares_AboutSld);
	Info_AddChoice (DIA_Lares_AboutSld, DIALOG_BACK, DIA_Lares_AboutSld_BACK);
	Info_AddChoice (DIA_Lares_AboutSld, "Pourquoi n'êtes-vous pas avec Lee et ses mercenaires ?", DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice (DIA_Lares_AboutSld, "Dites-m'en davantage sur les mercenaires...", DIA_Lares_AboutSld_Sld);
	Info_AddChoice (DIA_Lares_AboutSld, "Comment trouver la ferme du propriétaire terrien ?", DIA_Lares_AboutSld_WayToOnar); 
};
func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices (DIA_Lares_AboutSld);
};
func void DIA_Lares_AboutSld_Sld()
{	
	AI_Output (other,self,  "DIA_Lares_AboutSld_15_00"); //Parlez-moi encore des mercenaires.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_01"); //Eh bien, si vous êtes aussi costaud que vous l'étiez à l'époque, ils ne devraient pas vous poser de problèmes.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_02"); //La plupart d'entre eux ne sont que des ruffians. Si vous n'êtes pas capable de leur tenir tête, vous n'irez pas loin dans la vie.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_03"); //(éclate de rire) Si vous êtes du genre trouillard, vous n'avez pas la moindre chance avec eux.
};	
func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output (other, self, "DIA_Lares_WhyInCity_15_00"); //Pourquoi n'êtes-vous pas avec Lee et ses mercenaires ?
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_01"); //Mais je suis avec eux ! Je ne suis pas à la ferme, c'est tout.
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_02"); //Disons que je constitue notre avant-poste en ville. C'est qu'on ne voudrait pas que le bateau s'en aille sans nous...
	//AI_Output (self, other, "DIA_Lares_WhyInCity_09_03"); //Warum bist DU in die Stadt gekommen?
	Lares_WorkForLee = TRUE;
	
	Info_AddChoice (DIA_Lares_AboutSld, "De quel navire parliez-vous ?", DIA_Lares_AboutSld_Schiff);
};
func void DIA_Lares_AboutSld_Schiff()
{	
	AI_Output (other,self , "DIA_Lares_Schiff_15_00"); //De quel bateau voulez-vous parler ?
	AI_Output (self, other, "DIA_Lares_Schiff_09_01"); //Il est amarré au port de haute mer, derrière les falaises. Lee et quelques-uns de ses gars ont vraiment envie de s'en aller d'ici.
	AI_Output (self, other, "DIA_Lares_Schiff_09_02"); //Mais ça m'étonnerait que ça se fasse tout de suite...
	AI_Output (other,self , "DIA_Lares_Schiff_15_03"); //Pourquoi ?
	AI_Output (self, other, "DIA_Lares_Schiff_09_04"); //Posez la question à Lee si vous allez le voir. C'est qu'il a des plans, le chef...
};
func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output (other,self, "DIA_Lares_WegZumHof_15_00"); //Où se trouve la ferme du propriétaire terrien ?
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_00"); //C'est très simple. Vous quittez le port par la porte est et puis vous suivez le chemin jusqu'à l'est.
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_01"); //Je peux vous y emmener si vous le souhaitez.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_01"); //Ich kann dich hinbringen, wenn du willst. Hab sowieso schon zu lange hier rumgehangen.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_02"); //Hier im Hafen gibt es zwar für gewöhnlich keine Miliz, aber ich muss ja nicht riskieren, dass einer von ihnen Verdacht schöpft ...
	Lares_WayToOnar = TRUE;
};	



// ************************************************************
// 			  			GuildOfThieves
// ************************************************************
// ------------------------------------------------------------
// About Thieves
// ------------------------------------------------------------
instance DIA_Lares_GuildOfThieves (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	14;
	condition	 = 	DIA_Lares_GuildOfThieves_Condition;
	information	 = 	DIA_Lares_GuildOfThieves_Info;
	permanent    =  FALSE;
	description	 = 	"Savez-vous quoi que ce soit au sujet d'une guilde de voleurs en ville ?";
};
func int DIA_Lares_GuildOfThieves_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Lares_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Lares_GuildOfThieves_15_00"); //Vous avez entendu parler d'une guilde de voleurs en ville ?
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_01"); //Décidément, vous posez de ces questions...
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_02"); //Bien sûr qu'il y a une guilde de voleurs ici ! Comme dans toutes les grandes villes.
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_03"); //Et tous les voleurs à la tire et autres receleurs de Khorinis sont sûrement en cheville avec elle.
};	
// ------------------------------------------------------------
// Wo finden?
// ------------------------------------------------------------
instance DIA_Lares_WhereGuildOfThieves (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	15;
	condition	 = 	DIA_Lares_WhereGuildOfThieves_Condition;
	information	 = 	DIA_Lares_WhereGuildOfThieves_Info;
	permanent    =  FALSE;
	description	 = 	"Savez-vous où je peux trouver la guilde des voleurs ?";
};
func int DIA_Lares_WhereGuildOfThieves_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_GuildOfThieves))
	&& (DG_gefunden == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_WhereGuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Lares_WhereGuildOfThieves_15_00"); //Savez-vous où je peux trouver la guilde des voleurs ?
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_01"); //(éclate de rire) Ne le prenez surtout pas mal, mais même si je le savais, je ne vous le dirais pas.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_02"); //Ces gens-là ont tendance à se montrer très susceptibles quand on les dénonce vous savez...
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_03"); //Si vous voulez avoir affaire à eux, je vous conseille d'être extrêmement prudent.
};
// ------------------------------------------------------------
// Meersalz Schlüssel
// ------------------------------------------------------------
instance DIA_Lares_GotKey (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	16;
	condition	 = 	DIA_Lares_GotKey_Condition;
	information	 = 	DIA_Lares_GotKey_Info;
	permanent    =  FALSE;
	description	 = 	"J'ai cette clef. Elle a été rongée par l'eau salée...";
};
func int DIA_Lares_GotKey_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_WhereGuildOfThieves))
	&& (Npc_HasItems (other, ItKe_ThiefGuildKey_MIS))
	&& (DG_gefunden == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_GotKey_Info ()
{
	AI_Output (other, self, "DIA_Lares_GotKey_15_00"); //J'ai cette clé attaquée par le sel de mer...
	AI_Output (self, other, "DIA_Lares_GotKey_09_01"); //Alors ?
	AI_Output (other,self, "DIA_Lares_GotKey_15_02"); //Je pense qu'elle devrait me permettre d'accéder au repaire de la guilde des voleurs.
	AI_Output (self, other, "DIA_Lares_GotKey_09_03"); //C'est peut-être la clé des égouts...
};
// ------------------------------------------------------------
// Kanalisation
// ------------------------------------------------------------
instance DIA_Lares_Kanalisation (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	17;
	condition	 = 	DIA_Lares_Kanalisation_Condition;
	information	 = 	DIA_Lares_Kanalisation_Info;
	permanent    =  FALSE;
	description	 = 	"Où puis-je trouver les égouts ?";
};
func int DIA_Lares_Kanalisation_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_GotKey))
	&& (DG_gefunden == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_Kanalisation_Info ()
{
	AI_Output (other,self, "DIA_Lares_Kanalisation_15_00"); //Où se trouve l'entrée des égouts ?
	AI_Output (self, other, "DIA_Lares_Kanalisation_09_01"); //Comment voulez-vous que je sache ? Normalement, ils doivent se vider dans l'océan.
};

// ************************************************************
// 		  			Important für andere Gilden
// ************************************************************
instance DIA_Lares_OtherGuild (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	1;
	condition	 = 	DIA_Lares_OtherGuild_Condition;
	information	 = 	DIA_Lares_OtherGuild_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lares_OtherGuild_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (other.guild != GIL_NONE)
	&& (SC_IsRanger == FALSE)//ADDON
	{
		return TRUE;
	};
};
func void DIA_Lares_OtherGuild_Info ()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_00"); //Vous êtes dans la milice maintenant ?
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_01"); //(éclate de rire) C'est à mourir de rire ! Un ancien prisonnier membre de la milice !
		}
		else //GIL_PAL
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_02"); //Ainsi, vous faites désormais partie des paladins du roi.
		};
	
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_03"); //(malicieux) Il n'y a que vous pour réussir un truc dans ce genre.
	
		if (Lares_WorkForLee == TRUE)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_04"); //(inquiet) Vous n'allez pas me dénoncer, si ?
			AI_Output (other,self , "DIA_Lares_OtherGuild_15_05"); //Mais vous me connaissez...
		};
	};
	
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_06"); //Je ne comprends pas. Vous avez décidé d'entrer au monastère ? Comment c'est là-bas ?
		AI_Output (other,self , "DIA_Lares_OtherGuild_15_07"); //Différent.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_08"); //Ça, je veux bien le croire !
	};
		
	if (other.guild == GIL_SLD) 
	|| (other.guild == GIL_DJG)
	{
		//AI_Output (self, other, "DIA_Lares_OtherGuild_09_09"); //Ich hab gehört, du bist aufgenommen worden.
		AI_Output (self, other, "DIA_Addon_Lares_OtherGuild_09_00"); //J'ai appris que vous aviez accepté de rejoindre Lee.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_10"); //Félicitations.
	};
};



// ************************************************************
// ***														***
// 							Die Latscherei
// ***														***
// ************************************************************
instance DIA_Addon_Lares_Forest (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	9;
	condition	 = 	DIA_Addon_Lares_Forest_Condition;
	information	 = 	DIA_Addon_Lares_Forest_Info;

	description	 = 	"Pouvez-vous m'aider à traverser la forêt dense, à l'est d'ici ?";
};
func int DIA_Addon_Lares_Forest_Condition ()
{	
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Forest_info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_00"); //Pouvez-vous m'aider à traverser ces bois profonds à l'est ?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_01"); //D'accord. Mais pourquoi voulez-vous aller là-bas ?
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_02"); //Nefarius m'a donné l'ordre de trouver d'autres bijoux.
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_03"); //L'un des endroits où je suis censé chercher se trouve au milieu des bois.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_04"); //Je vois. Et c'est trop dangereux pour que vous y alliez seul, pas vrai ?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_05"); //Pas de problème. Faites-moi savoir quand vous voulez partir.

	RangerHelp_OrnamentForest = TRUE;
};


// ------------------------------------------------------------
// Lass uns gehen...
// ------------------------------------------------------------
instance DIA_Lares_GoNow (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	10;
	condition	 = 	DIA_Lares_GoNow_Condition;
	information	 = 	DIA_Lares_GoNow_Info;
	permanent    =  TRUE;
	description	 = 	"Très bien, allons-y.";
};
func int DIA_Lares_GoNow_Condition ()
{	
	if (
		(Lares_WayToOnar == TRUE)
	 	|| (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	 	|| (RangerHelp_OrnamentForest == TRUE)
	 	)
	 	&& ((LaresGuide_ZumPortal == 0)||(LaresGuide_ZumPortal == 8))
	 	&& ((LaresGuide_ZuOnar == FALSE) || (LaresGuide_ZuOnar == LOG_SUCCESS))
	 	&& ((LaresGuide_OrnamentForest == 0)||(LaresGuide_OrnamentForest == 3))
		&& (Kapitel < 3)
			{
				return TRUE;
			};
};

func void DIA_Lares_GoNow_GoingConditions ()
{	
 	AI_Output (self, other, "DIA_Lares_GoNow_09_01"); //D'accord. Suivez-moi.
	AI_StopProcessInfos (self);
	
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	if (Npc_KnowsInfo (other, DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk (Moe,30);
	};
};

func void DIA_Lares_GoNow_Info ()
{
	AI_Output (other, self, "DIA_Lares_GoNow_15_00"); //Okay, lass uns gehen.
	
	if (Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_03"); //Je ne peux pas partir d'ici tant que nous n'en savons pas plus sur les disparus ou tant que quelqu'un ne m'a pas relevé de mes fonctions.
	}
	else if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING) //bleibt am Hafen während RangerMeeting
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
			AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_04"); //Où ?
			
			
			Info_ClearChoices	(DIA_Lares_GoNow);
			Info_AddChoice	(DIA_Lares_GoNow, DIALOG_BACK, DIA_Lares_GoNow_warte );
		
			if (Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS)
			{
				Info_AddChoice	(DIA_Lares_GoNow, "À la ferme d'Onar.", DIA_Lares_GoNow_Onar );
			};
		
			if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) && (Lares_Angekommen == FALSE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Récupérons l'anneau de Vatras", DIA_Lares_GoNow_Maya );
			};
			
			if ((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "À travers la forêt impénétrable à l'est.", DIA_Lares_GoNow_Forest );
			};
	};		
};

func void DIA_Lares_GoNow_Maya ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Maya_15_00"); //Récupérons l'anneau de Vatras
	LaresGuide_ZumPortal = 1;
	Npc_ExchangeRoutine (self, "GUIDEPORTALTEMPEL1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Onar ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Onar_15_00"); //À la ferme d'Onar.
	LaresGuide_ZuOnar = TRUE;
	Npc_ExchangeRoutine (self, "GUIDE");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Forest ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Forest_15_00"); //À travers la forêt impénétrable à l'est.
	LaresGuide_OrnamentForest = 1;
	Npc_ExchangeRoutine (self, "GUIDEMEDIUMWALD1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_warte ()
{
	Info_ClearChoices	(DIA_Lares_GoNow);
};

// ************************************************************
// 			  					Angekommen 
// ************************************************************
instance DIA_Lares_GUIDE		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	1;
	condition	 = 	DIA_Lares_GUIDE_Condition;
	information	 = 	DIA_Lares_GUIDE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lares_GUIDE_Condition ()
{	
	if (LaresGuide_ZuOnar == TRUE)
	&& Hlp_StrCmp 	 (Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05")
	{
		return TRUE;
	};
};
func void DIA_Lares_GUIDE_Info ()
{
	if Lares_Guide > (Wld_GetDay()-2)
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_00"); //Nous y voilà.
	}
	else
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_01"); //Ah, vous voilà ! Je commençais à craindre que vous ayez fini dans le ventre des loups...
	};
	AI_Output (self, other, "DIA_Lares_GUIDE_09_02"); //Vous devriez pouvoir vous débrouiller seul à partir d'ici. Moi, il faut que je retourne en ville. Il me reste encore quelques petites choses à régler...
	AI_Output (self, other, "DIA_Lares_GUIDE_09_03"); //Suivez la route, et n'oubliez surtout pas de leur tenir tête. Tout ira bien si vous ne vous laissez pas marcher sur les pieds.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	Npc_ExchangeRoutine (self,"START");
	LaresGuide_ZuOnar = LOG_SUCCESS; //Joly: schluss mit Onar guide
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter1		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInter1_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInter1_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInter1_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11")
	&& (LaresGuide_ZumPortal == 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInter1_Info ()
{
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_00"); //Maintenant que nous ne sommes plus en ville et que nous sommes à l'abri des oreilles indiscrètes, laissez-moi vous en dire un peu plus.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_01"); //Nous allons à présent rendre ce bijou que vous m'avez apporté à Saturas. Vous vous souvenez de Saturas, n'est-ce pas ?
	
	
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Certainement.", DIA_Addon_Lares_ArrivedPortalInter1_ja );
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Saturas ? Qui est-ce ?", DIA_Addon_Lares_ArrivedPortalInter1_wer );

	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2 ()
{
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00"); //Nous, les gars de l'ancien Nouveau Camp, entretenons toujours de bonnes relations avec les Mages de l'eau.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01"); //Même Lee protègera encore les Mages de l'eau de n'importe quel danger si c'est en son pouvoir.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02"); //Afin de garder contact avec les Mages de l'eau, je suis en ville la plupart du temps, travaillant conjointement avec Vatras.
	B_MakeRangerReadyForMeeting (self);
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03"); //Et c'est l'armure qui est remise à chacun de nous par les Mages de l'eau. Les membres de l'Anneau de l'eau ont porté de telles armures bien avant la  guerre des orques.
	
	if (Cavalorn_RangerHint == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04"); //Quel rôle joue Cavalorn là-dedans ? Il ne faisait pas parti du Nouveau Camp, autant que je sache.
		AI_Output (self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05"); //Vous avez raison, notre communauté s'est agrandie. Je ne sais même pas combien nous sommes à présent.
	};

	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06"); //Mais continuons. Je veux m'éloigner plus de la ville. Nous en pourrons en parler plus tard.
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00"); //Saturas ? Qui est-ce ?
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01"); //Il était le chef des Mages de l'eau dans le Nouveau Camp, à l'époque où la Barrière nous encerclait encore.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02"); //Lee et moi avions fait un pacte en ce temps-là avec les Mages de l'eau. Avec nos puissances unies nous avons été victorieux contre l'ancien camp.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00"); //Certainement. Il était le chef des Mages de l'eau dans le Nouveau camp.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02")
	&& (LaresGuide_ZumPortal == 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00"); //Qu'est-ce qui ne va pas ? Vous tenez le coup ?
	
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
	&& ((Npc_GetDistToWP(Erol,"NW_TAVERN_TO_FOREST_03")<1000))
	&& ((Npc_IsDead(Erol))==FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01"); //Ce type là-bas a maille à partir avec les bandits.
		AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02"); //(d'un air narquois) Tant pis pour lui, mais nous n'avons pas le temps pour cela maintenant.
	};
	
	LaresGuide_ZumPortal = 3;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter2		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14")
	&& (LaresGuide_ZumPortal == 3)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00"); //Ne vous effondrez pas maintenant.
	LaresGuide_ZumPortal = 4;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter2		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInter2_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInter2_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58")
	&& (LaresGuide_ZumPortal == 4)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInter2_Info ()
{
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_00"); //Les Mages de l'eau sont dans tous leurs états. Ils sont en train de fouiller au nord-est depuis des semaines. Personne ne sait ce qu'ils peuvent bien chercher.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_01"); //Tout a commencé quand la terre s'est mise à trembler exactement comme aux pires heures de la Barrière.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_02"); //D'horribles créatures de pierre sont sortis des entrailles de la terre, massacrant tout ceux qui se trouvaient  à moins de 100 pieds d'eux.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_03"); //Les Mages de l'eau ont pris les choses en main et ont détruit ces créatures hostiles. Et maintenant ils creusent là, cherchant une explication à ces phénomènes étranges.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_04"); //Mais vous vous rendrez bientôt compte par vous-même.

	LaresGuide_ZumPortal = 5;
	B_LogEntry (TOPIC_Addon_KDW,"Lares m'a parlé du site de fouilles des Mages. Ils enquêtent apparemment sur des événements étranges : des séismes se sont produits, et d'étranges créatures de pierre émergent du sol."); 
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter3
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter3		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) 	
	&& (LaresGuide_ZumPortal == 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00"); //Pouvons-nous encore continuer ?
	LaresGuide_ZumPortal = 6;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter4
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter4		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02")
	&& (LaresGuide_ZumPortal == 6)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00"); //Bon. Cela peut devenir plus dangereux par ici.
	LaresGuide_ZumPortal = 7;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortal		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortal_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortal_Info;
	important	 = 	TRUE;

};
func int DIA_Addon_Lares_ArrivedPortal_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41")
	&& (LaresGuide_ZumPortal == 7)
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_ArrivedPortal_Info ()
{
	B_MakeRangerReadyToLeaveMeeting (self);
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_00"); //Nous sommes là.
 	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_01"); //Voici, prenez le bijou. Les Mages de l'eau doivent être là quelque part. Apportez-le leur.
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);					
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_02"); //Si jamais vous rencontriez des bêtes à l'intérieur de ce trou dans le sol et qu'il semble qu'elles soient bien trop nombreuses pour vous, courez jusqu'à Saturas.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_03"); //Il se chargera des bêtes. Je dois y aller.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_04"); //Et une dernière chose : N'envisagez même pas de flâner avec ce bijou. Rendez-vous directement chez Saturas.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_05"); //À bientôt.
	
	B_LogEntry (TOPIC_Addon_KDW,"Lares m'a remis ce bijou. Il veut que je le remette à Saturas, le Mage de l'eau."); 
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"START");
	LaresGuide_ZumPortal = 8; //Joly: schluss mit guide Portal
	
	Lares_Angekommen = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	ALBERN
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Albern	(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 1;
	condition	= DIA_Addon_Lares_Albern_Condition;
	information	= DIA_Addon_Lares_Albern_Info;
	important	= TRUE;
};
func int DIA_Addon_Lares_Albern_Condition ()
{
	if (Lares_Angekommen == TRUE)
	&& (Npc_GetDistToWP (self, "NW_TROLLAREA_RUINS_41") > 1000)
	&& (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Albern_Info()
{
	AI_Output (self, other, "DIA_Addon_Lares_Albern_09_00"); //(sévère) Assez plaisanté ! Rapportez ce bijou à Saturas !
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GOFORESTPRE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFORESTPRE		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_GOFORESTPRE_Condition;
	information	 = 	DIA_Addon_Lares_GOFORESTPRE_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_GOFORESTPRE_Condition ()
{
	if Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") 
	&& (LaresGuide_OrnamentForest == 1)
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_GOFORESTPRE_ja ()
{
	B_MakeRangerReadyForMeeting (self);
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_ja_15_00"); //Oui.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_ja_09_01"); //Très bien, mon ami. Alors suivez-moi. Ça va saigner.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2; 
};
func void DIA_Addon_Lares_GOFORESTPRE_nein ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_nein_15_00"); //Non. Vous pouvez y aller.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_nein_09_01"); //Je pense que l'affaire s'est résolue d'elle-même ? Très bien. À bientôt.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"Start");
	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit Guide
};

func void DIA_Addon_Lares_GOFORESTPRE_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_00"); //Voulez-vous toujours aller dans les bois avec moi ?
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_01"); //Avez-vous pensé à vous rendre dans les bois ? Vous voulez vraiment y aller ?
 	};
	Info_ClearChoices	(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "Non. Vous pouvez y aller.", DIA_Addon_Lares_GOFORESTPRE_nein );
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "Oui.", DIA_Addon_Lares_GOFORESTPRE_ja );
};


///////////////////////////////////////////////////////////////////////
//	Info GOFOREST
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFOREST		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_GOFOREST_Condition;
	information	 = 	DIA_Addon_Lares_GOFOREST_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Lares_GOFOREST_Condition ()
{
	if Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_FOREST_PATH_62") 
	&& (LaresGuide_OrnamentForest == 2)
	&& (Npc_IsDead(Stoneguardian_Ornament))
	{
		if (ORNAMENT_SWITCHED_FOREST == FALSE)
		&& (Npc_IsInState (self,ZS_Talk))
			{
				return TRUE;
			};	
		if (ORNAMENT_SWITCHED_FOREST == TRUE)
			{
				return TRUE;
			};
	};
};

func void DIA_Addon_Lares_GOFOREST_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{	
		B_MakeRangerReadyToLeaveMeeting (self);
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_00"); //Là. Vous devriez être capable de faire le reste par vous-même. Je m'en retourne alors.
	 	AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine (self,"START");
	 	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit guide Forest!
 	}
 	else
 	{
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_01"); //Dépêchez-vous. Je ne tiens pas à rester ici plus longtemps que nécessaire.
	 	AI_StopProcessInfos (self);
 	};
};

///////////////////////////////////////////////////////////////////////
//	Info PortalInterWEITER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_PortalInterWEITER		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_PortalInterWEITER_Condition;
	information	 = 	DIA_Addon_Lares_PortalInterWEITER_Info;
	permanent	 = 	TRUE;

	description	 = 	"Continuons.";
};

func int DIA_Addon_Lares_PortalInterWEITER_Condition ()
{
	if (LaresGuide_ZumPortal != 0)
	&& (LaresGuide_ZumPortal != 8)//Joly: schluss mit guide Portal
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_PortalInterWEITER_Info ()
{
	if (LaresGuide_ZumPortal == 4)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_00"); //Cessez de jacasser.
	}
	else if (LaresGuide_ZumPortal == 6)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_01"); //(irrité) Oui, oui.
	};

	AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_02"); //Continuons.
	
	if (LaresGuide_ZumPortal == 7)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_03"); //Restez un peu en retrait.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_04"); //Restez bien derrière moi.
	};
		
	AI_StopProcessInfos (self);

	if (LaresGuide_ZumPortal == 2)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL2");
	}
	else if	(LaresGuide_ZumPortal == 3)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL3");
	}
	else if	(LaresGuide_ZumPortal == 4)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL4");
	}
	else if	(LaresGuide_ZumPortal == 5)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL5");
	}
	else if	(LaresGuide_ZumPortal == 6)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL6");
	}
	else if	(LaresGuide_ZumPortal == 7)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPELEND");
	};
};

// ************************************************************
// 			  				  LEHRER
// ************************************************************
// ------------------------------------------------------------
// Wanna Learn
// ------------------------------------------------------------
instance DIA_Lares_DEX		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	20;
	condition	 = 	DIA_Lares_DEX_Condition;
	information	 = 	DIA_Lares_DEX_Info;
	permanent 	 =  FALSE;
	description	 = 	"Pouvez-vous m'enseigner quelque chose ?";
};
func int DIA_Lares_DEX_Condition ()
{	
	return TRUE;
};
func void DIA_Lares_DEX_Info ()
{
	AI_Output (other, self, "DIA_Lares_DEX_15_00"); //Pouvez-vous m'apprendre quelque chose ?
	AI_Output (self, other, "DIA_Addon_Lares_DEX_Add_09_01"); //Évidemment. Je peux vous aider à devenir plus fort et à améliorer votre dextérité si vous le souhaitez.

	Lares_TeachDEX = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Lares peut m'aider à améliorer ma force et ma dextérité.");
};
// ------------------------------------------------------------
// 			  				   TEACH 
// ------------------------------------------------------------
var int Lares_MerkeDEX;
var int Lares_MerkeSTR;
//-----------------------------------
instance DIA_Lares_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_449_Lares;
	nr			 = 	20;
	condition	 = 	DIA_Lares_TEACH_Condition;
	information	 = 	DIA_Lares_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Apprenez-moi quelque chose.";
};
func int DIA_Lares_TEACH_Condition ()
{	
	if (Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lares_TEACH_Info ()
{
	//AI_Output (other, self, "DIA_Lares_TEACH_15_00"); //Ich will geschickter werden!
	AI_Output (other,self ,"DIA_Addon_Lares_Teach_15_00"); //Apprenez-moi quelque chose.
	
	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Lares_MerkeSTR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACH_BACK()
{
	if (other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output (self, other, "DIA_Lares_TEACH_BACK_09_00"); //Vous êtes déjà plus agile qu'avant.
	};
	if (other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_Lares_TEACH_BACK_Add_09_00"); //(appréciateur) Bien. Votre force a augmenté.
	};
	
	Info_ClearChoices (DIA_Lares_TEACH);
};
func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACHSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACHSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};


//#################################
//##
//##	Kapitel 2
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap2_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap2_EXIT_Condition;
	information	= DIA_Lares_Kap2_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#################################
//##
//##	Kapitel 3
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap3_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap3_EXIT_Condition;
	information	= DIA_Lares_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		Gibt's was Neues?			 
// ************************************************************
INSTANCE DIA_Lares_AnyNews(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 5;
	condition	= DIA_Lares_AnyNews_Condition;
	information	= DIA_Lares_AnyNews_Info;
	permanent	= TRUE;
	description = "Des nouvelles ?";
};                       
FUNC INT DIA_Lares_AnyNews_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Lares_AnyNews_15_00"); //Des nouvelles ?
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_01"); //En général, tout ce qu'il y a de nouveau, ou presque, c'est à vous qu'on le doit. Bennet a été relâché. Il est retourné à la ferme.
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_02"); //Allez le voir, je crois qu'il aimerait bien vous remercier en personne.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_03"); //Ça, on peut le dire ! Les paladins ont arrêté Bennet, notre forgeron.
		
		if (MIS_RescueBennet == LOG_RUNNING)
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_04"); //Je me le suis laissé dire en effet. Sale affaire...
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_05"); //Ça, c'est sûr !
		}
		else
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_06"); //Comment est-ce arrivé ?
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_07"); //Bennet était en ville pour acheter des provisions, il n'est jamais revenu.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_08"); //Si vous voulez en savoir davantage, demandez à Hodges, il était en ville avec Bennet.
			
			MIS_RescueBennet = LOG_RUNNING;
		};
	};
};

// ************************************************************
// 		Hast du was von Bennet gehört?			 
// ************************************************************
INSTANCE DIA_Lares_NewsAboutBennet(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 6;
	condition	= DIA_Lares_NewsAboutBennet_Condition;
	information	= DIA_Lares_NewsAboutBennet_Info;
	permanent	= FALSE;
	description = "Des nouvelles de Bennet ?";
};                       
FUNC INT DIA_Lares_NewsAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_NewsAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_00"); //Des nouvelles de Bennet ?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_01"); //Apparemment, il aurait été emmené à la caserne et enfermé au cachot.
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_02"); //Comment peut-on le sortir de là ?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_03"); //Je n'en ai pas la moindre idée. Il m'est impossible d'accéder à sa cellule afin de lui parler.
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_04"); //Tout ce que je peux faire, c'est écouter ce qui se dit, mais il n'y a grand-chose à apprendre par ici.
};

//#################################
//##
//##	Kapitel 4
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap4_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap4_EXIT_Condition;
	information	= DIA_Lares_Kap4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************
//	Wieso bist du nicht auf Drachenjagd?
//****************************************

INSTANCE DIA_Lares_Kap4_PERM(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 6;
	condition	= DIA_Lares_Kap4_PERM_Condition;
	information	= DIA_Lares_Kap4_PERM_Info;
	permanent	= TRUE;
	description = "Pourquoi n'êtes-vous pas en train de chasser les dragons ?";
};                       
FUNC INT DIA_Lares_Kap4_PERM_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lares_Kap4_PERM_15_00"); //Pourquoi n'êtes-vous pas en train de chasser les dragons ?
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_01"); //Ce n'est pas mon truc. Je préfère laisser ça aux autres.
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_02"); //Oh, que non. L'air marin, c'est de ça dont j'ai besoin en ce moment.
};

//#################################
//##
//##	Kapitel 5
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap5_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap5_EXIT_Condition;
	information	= DIA_Lares_Kap5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************
//	Lares anheuern
//****************************************************************

///////////////////////////////////////////////////////////////////////
//	Hast du Lust diese Insel zu verlassen?
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lares_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Voudriez-vous quitter cette île ?";
};
func int DIA_Lares_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lares_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_00"); //Ça vous dirait de quitter cette île ?
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_01"); //Plus que tout au monde. Qu'est-ce que vous avez en tête ?
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_02"); //J'ai appris où se cachait le chef des dragons. Il se trouve sur une île située non loin d'ici.
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_03"); //J'ai l'intention d'y aller afin de nous débarrasser de lui une bonne fois pour toutes.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_04"); //Hé, super ! Si je peux vous être d'une quelconque utilité, j'en suis.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_05"); //Vous n'auriez pas besoin qu'on vous apprenne à devenir plus agile ou à manier les armes à une main en cours de voyage ?
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lares_KnowWhereEnemy_15_06"); //L'équipage est déjà au complet, mais je vous contacterai si la situation évolue.
	}
	else 
	{
		Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"Je n'ai nul besoin de vous.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"Je savais que je pouvais compter sur vous.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lares_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_00"); //Je savais que je pouvais compter sur vous.
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_01"); //Le rassemblement est prévu au bateau.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02"); //Vous êtes un homme d'action, vous. Ça me plaît. A plus tard.
	
	Lares_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
};

FUNC VOID DIA_Lares_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_No_15_00"); //Je vous remercie de votre offre, mais je n'ai pas besoin de vous.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_No_09_01"); //J'imagine que vous savez de quoi vous avez besoin. Si vous souhaitez en reparler, vous savez où me trouver.

	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard	 = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard	 = LOG_FAILED;
	};	
	Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_LeaveMyShip		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_LeaveMyShip_Condition;
	information	 = 	DIA_Lares_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Il est préférable que vous ne veniez pas.";
};
func int DIA_Lares_LeaveMyShip_Condition ()
{	
	if (Lares_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lares_LeaveMyShip_15_00"); //Il serait préférable que vous ne veniez pas.
	AI_Output			(self, other, "DIA_Lares_LeaveMyShip_09_01"); //Comme vous voudrez. Mais à l'avenir, réfléchissez avant de promettre n'importe quoi aux gens.
	
	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard	 = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard	 = LOG_FAILED;
	};				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_StillNeedYou_Condition;
	information	 = 	DIA_Lares_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Le voyage vous intéresse-t-il encore ?";
};
func int DIA_Lares_StillNeedYou_Condition ()
{	
	if ((Lares_IsOnBOard == LOG_OBSOLETE)		
	|| (Lares_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lares_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lares_StillNeedYou_15_00"); //Ça vous intéresse toujours de me suivre ?
	
	if (Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_01"); //En temps normal, je ne laisse personne me traiter de la sorte, mais comme vous êtes des nôtres, ça ira pour cette fois.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_02"); //Je vous retrouve au bateau.
		
		Lares_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_03"); //Ne le prenez pas mal, mais je pense que vous aviez raison finalement.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_04"); //Il est préférable que je reste ici.
		
		AI_StopProcessInfos (self);
	};	
};


























