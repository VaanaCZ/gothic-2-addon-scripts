// ************************************************************
// 			Lares Patch 
// ************************************************************
instance DIA_Addon_Lares_Patch		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 99;
	condition	= DIA_Addon_Lares_Patch_Condition;
	information	= DIA_Addon_Lares_Patch_Info;
	description	= "(Ornament - St�ck zur�ckverlangen)";
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
	AI_Output (self, other, "DIA_Lares_HALLO_09_00"); //Je dois �tre dingue, mais... qu'est-ce que vous faites ici�?
	
	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output (self, other, "DIA_Lares_HALLO_09_01"); //Vous �tes venu A LA NAGE�?
		AI_Output (self, other, "DIA_Lares_HALLO_09_02"); //(�clate de rire) C'est vrai que c'est un moyen comme un autre de passer les garde des portes de la ville.
		B_GivePlayerXP (500); //wer's schafft...	
	};
			
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Nous sommes-nous d�j� rencontr�s ?",DIA_Lares_HALLO_NO);
	Info_AddChoice 		(DIA_Lares_HALLO,"H� ! Lares, vieille canaille...",DIA_Lares_HALLO_YES);
};
FUNC VOID DIA_Lares_HALLO_NO()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NO_15_00"); //On se conna�t�?
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_01"); //Vous ne vous souvenez pas de moi�? J'�tais au nouveau campement.
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_02"); //La liste de la mine... bon sang, quelle rigolade�! Vous vous souvenez de Lee�?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Bien s�r que je me souviens de Lee !",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee... ?",DIA_Lares_HALLO_NOIDEA);
};
FUNC VOID DIA_Lares_HALLO_YES()
{
	AI_Output (other, self, "DIA_Lares_HALLO_YES_15_00"); //H�, Lares�! Comment vous �tes arriv� ici, esp�ce de gredin�?
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_01"); //J'ai r�ussi � fuir la Vall�e des mines juste � temps, en compagnie de Lee et d'autres gars.
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_02"); //Vous vous souvenez de Lee, pas vrai�?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"Bien s�r que je me souviens de Lee !",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"Lee... ?",DIA_Lares_HALLO_NOIDEA);
};

// ------------------------------	
	func void B_Lares_AboutLee()
	{
		AI_Output (self, other, "B_Lares_AboutLee_09_00"); //Je suis parti de la colonie avec lui, juste apr�s la destruction de la Barri�re.
		AI_Output (self, other, "B_Lares_AboutLee_09_01"); //Lui et les autres gars travaillent d�sormais � la ferme d'Onar, le propri�taire terrien.
		AI_Output (self, other, "B_Lares_AboutLee_09_02"); //Il a pass� un accord avec le fermier�: ses hommes et lui d�fendent la ferme, en �change de quoi Onar les nourrit.
	};
// ------------------------------	

FUNC VOID DIA_Lares_HALLO_LEE()
{
	AI_Output (other, self, "DIA_Lares_HALLO_LEE_15_00"); //Bien s�r que je me souviens de Lee�!
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};
FUNC VOID DIA_Lares_HALLO_NOIDEA()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NOIDEA_15_00"); //Lee�?
	AI_Output (self, other, "DIA_Lares_HALLO_NOIDEA_09_01"); //�a n'a pas �t� rose tous les jours pour vous, hein�? Lee �tait le chef des mercenaires du nouveau campement.
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
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_01"); //(�tonn�) Vous avez donc d�j� �t� voir Vatras. Vous avez d� faire bonne impression sur lui.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_02"); //Autrement il n'aurait certainement pas donn� mon nom. Surtout depuis cette affaire de disparitions non �lucid�es.
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
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_01"); //J'ai pass� un petit accord avec les Mages de l'eau, vous voyez.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_02"); //Quelle sorte d'accord ?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_03"); //Nous travaillons pour eux et ils font en sorte que notre pass� � la colonie p�nitentiaire ne nous pose aucun probl�me.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_04"); //Vous �tes en train de parler de l'Anneau de l'eau ?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_05"); //Vous en avez entendu parler ?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_06"); //Vatras m'en a parl�.
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_07"); //Vous auriez d� le dire de suite.

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
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_02"); //Mais � la diff�rence des paladins, nous op�rons dans l'ombre.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_03"); //L'Anneau est une arme puissante dans le combat contre les dangers mena�ant les gens de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_04"); //Mais cela ne fonctionnera qu'aussi longtemps que l'identit� de ceux appartenant � l'Anneau de l'eau sera tenue secr�te.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_05"); //Gardez cela pour vous !
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_06"); //Certainement.
	B_LogEntry (TOPIC_Addon_RingOfWater,"L'Anneau de l'eau est aux Mages de l'eau ce que les paladins sont aux Magiciens du feu. Mais l'Anneau op�re dans l'ombre. Nul n'en conna�t les membres, et ainsi, l'�tendue de sa puissance demeure secr�te." ); 
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
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_09_01"); //�a ne me pose pas de probl�me. Mais la d�cision concernant votre acceptation ou non n'est que du seul ressort des Mages de l'eau.
	
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 


	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Je vois.", DIA_Addon_Lares_WannaBeRanger_BACK );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Qu'est-ce que �a fait d'appartenir � l'Anneau ?", DIA_Addon_Lares_WannaBeRanger_HowIsIt );
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
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01"); //Je les ai longtemps prot�g�s quand nous vivions encore derri�re la Barri�re.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02"); //(sourit) Et ils ont de nombreuses raisons de m'�tre reconnaissant.
};
func void DIA_Addon_Lares_WannaBeRanger_HowIsIt ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00"); //Qu'est-ce que �a fait d'appartenir � l'Anneau ?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01"); //Nous sommes tr�s diff�rents des autres communaut�s dont vous pouvez faire parti ici � Khorinis.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02"); //Une fois que vous �tes l'un des n�tres, nous ne vous demandons rien allant � l'encontre de ce que vous �tes pr�t � faire.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03"); //La seule chose que nous exigeons de vous c'est de vous montrer discret.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04"); //Nous �uvrons en secret et nous ne voulons pas que les �trangers sachent qui sont nos membres.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05"); //Nous garderons un �il sur vous. On doit avoir un �il sur tout.
};
// ------------------------------------------------------------
// Info RingBack (Bin jetzt dabei)
// ------------------------------------------------------------
func void B_Lares_Geheimtreffen()
{
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_07"); //Nous allons tenir une r�union secr�te prochainement dans la taverne d'Orlan.
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_08"); //Rejoignez-nous d�s que vous pourrez. Nous vous donnerons votre �quipement � ce moment.
};
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_RingBack_Condition;
	information	 = 	DIA_Addon_Lares_RingBack_Info;

	description	 = 	"J'appartiens maintenant � l'Anneau de l'eau.";
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
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_00"); //J'appartiens maintenant � l'Anneau de l'eau.
	
	if (Lares_GotRingBack == FALSE) 
	&& (SC_GotLaresRing == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_01"); //Fantastique. Pouvez-vous alors me rendre mon anneau d'aigue-marine ?
		
		if (B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_02"); //Certainement. Le voici.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_03"); //J'esp�re qu'il vous a �t� utile. Je suis ravi de savoir que vous �tes maintenant l'un des n�tres.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP (XP_Ambient);
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_04"); //Hum. Je ne l'ai pas sur moi l�.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_05"); //Ne faites pas n'importe quoi avec ! J'en ai encore besoin.
		};
	};

	AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_06"); //Je pense que vous voulez votre �quipement maintenant. Alors faites attention.
	B_Lares_Geheimtreffen();
	
	B_LogEntry (TOPIC_Addon_RingOfWater, "Lares m'a invit� � assister � l'assembl�e secr�te de l'Anneau dans la taverne d'Orlan."); 
	
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
	AI_Output	(self, other, "DIA_Addon_Lares_Geduld_09_01"); //Vous devez attendre encore un peu. Tout le monde n'est pas encore arriv�.
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
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_00"); //Tr�s bien, mon jeune ami. Nous sommes venus ensemble ici pour f�ter votre intronisation � l'Anneau de l'eau.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_01"); //Les gar�ons pr�sents ouvriront l'�il � partir d'aujourd'hui.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_02"); //�videmment, d'autres appartiennent aussi � l'Anneau de l'eau, soyez prudent.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_03"); //Que vous nous rendiez service ou que vous fassiez du grabuge, nous le saurons.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_04"); //Je vous donne l'armure de notre communaut�.
	CreateInvItem	(hero, ITAR_RANGER_Addon);
	AI_EquipArmor	(hero, ITAR_RANGER_Addon);	
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_05"); //Portez-la dignement, mais jamais en ville ou dans les autres lieux habit�s.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_06"); //Souvenez-vous que nous ne devons pas �tre expos�s. Par cons�quent, personne ne doit savoir qui sont les membres de l'Anneau de l'eau.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_07"); //Personne ne parle de l'Anneau de l'eau. C'est notre premi�re r�gle. Appliquez-la strictement.
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
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_01"); //L'arme de l'Anneau est le b�ton, mais chacun utilise l'arme avec laquelle il est le plus � l'aise.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_02"); //Voici l'un de nos b�tons, je n'ai jamais bien su comment l'utiliser, peut-�tre r�ussirez-vous � vous en servir.
	CreateInvItems (self, ItMw_RangerStaff_Addon, 1);									
	B_GiveInvItems (self, other, ItMw_RangerStaff_Addon, 1);		
};
func void DIA_Addon_Lares_GetRangerArmor_end ()
{
	B_MakeRangerReadyToLeaveMeetingALL ();
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_end_15_00"); //Je dois y aller.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_01"); //Bien, ne les laissez pas vous attraper.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_02"); //Maintenant allez directement voir Vatras et il vous assignera votre premi�re t�che.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_03"); //Fr�res de l'Anneau. Retournons maintenant � nos t�ches.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_04"); //Les attaques de bandits continuent. Nous devons faire en sorte que cette menace cesse.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_05"); //Adanos, maintiens l'�quilibre du monde.
	Lares_TakeFirstMissionFromVatras = TRUE;

	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, DIALOG_ENDE, DIA_Addon_Lares_GetRangerArmor_weiter );
};
func void DIA_Addon_Lares_GetRangerArmor_weiter () 
{
	AI_StopProcessInfos (self);
	B_RangerMeetingParking ();
	B_LogEntry (TOPIC_Addon_RingOfWater,"Mon armure m'a �t� remise lors de l'assembl�e secr�te dans la taverne d'Orlan. Je dois maintenant aller voir Vatras, qui me confiera ma premi�re mission en tant que membre de l'Anneau." ); 
};

func void DIA_Addon_Lares_GetRangerArmor_Learn ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_Learn_15_00"); //Quelle aide pouvez-vous m'offrir ?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_01"); //Je peux vous montrer comment am�liorer votre d�xt�rit�.

	if ((Npc_IsDead(SLD_805_Cord))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_02"); //Si vous avez besoin d'aide pour le maniement des armes de corps � corps, demandez � Cord. C'est une fine lame.
	};
	if ((Npc_IsDead(BAU_961_Gaan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_03"); //Gaan sera ravi de vous montrer comment �visc�rer correctement les b�tes.
	};	
	if ((Npc_IsDead(Mil_350_Addon_Martin))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_04"); //Martin peut vous en dire plus sur les paladins.
	};	
	if ((Npc_IsDead(Bau_4300_Addon_Cavalorn))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_05"); //Cavalorn vous apprendra la discr�tion, le combat � une main et le tir � l'arc.
	};
	if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_06"); //Orlan aura toujours une chambre et un lit bien chaud pour vous.
	};
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_07"); //Et pour tout ce qui a trait � la magie, demandez � Vatras.
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

	description	 = 	"Avez-vous d�j� utilis� une pierre de t�l�portation ?";
};
func int DIA_Addon_Lares_Teleportstation_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)//SC war schon bei den Wassermagiern
	&& (SCUsed_TELEPORTER == TRUE)			//SC hat schon mal einen Teleporter benutzt
	&& (MIS_Lares_BringRangerToMe != 0) 				//hat Aquamarinring von Lares bekommen. -> f�r Orlan
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Teleportstation_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_00"); //Avez-vous d�j� utilis� une pierre de t�l�portation ?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_01"); //Non, mais j'en ai entendu parler. Les Mages de l'eau ne sont pas encore tr�s au fait de ces choses.
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_02"); //J'ai d�j� essay�.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_03"); //(rit) �videmment. Cela ne vous effraie pas quand m�me ?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_04"); //Bien. Si vous voulez utiliser cela, allez demander � Orlan, le tenancier qu'il vous laisse entrer dans sa grotte ferm�e.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_05"); //Je pense qu'il a cach� une des pierres de t�l�portation pour les Mages de l'eau pr�s de sa taverne.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_06"); //Sortez par la porte est de la ville et suivez tout simplement le chemin. Vous ne pouvez pas le rater.
	
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Lares m'a dit qu'Orlan a dissimul� une pierre de t�l�portation non loin de sa taverne."); 
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
	AI_Output (other, self, "DIA_Addon_Lares_Ornament_15_00"); //Vatras m'a donn� ce bijou pour que je vous l'apporte. Il a dit qu'il doit �tre rendu.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_01"); //(soupire) Naturellement, je dois me d�brouiller, comme d'habitude. J'aurais d� m'en douter.
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_02"); //Je dois traverser la moiti� de l'�le pour le rapporter aux Mages de l'eau.
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

	description = "Je peux me charger du bijou � votre place !";
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
	AI_Output	(other, self, "DIA_Addon_Lares_OrnamentBringJob_15_00"); //Je peux me charger du bijou � votre place !
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_01"); //(songeur) Hum. Je pense qu'il faudrait mieux que je l'apporte moi-m�me. Mais vous pouvez m'accompagner.
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_02"); //Le probl�me c'est que je ne peux pas partir d'ici pour le moment. Je dois surveiller le port.
	
	B_LogEntry (TOPIC_Addon_KDW,"J'ai port� le bijou que m'a confi� Vatras � Lares. Il veut l'apporter lui-m�me aux Mages de l'eau. Je devrais l'accompagner."); 
	
	MIS_Addon_Lares_Ornament2Saturas = LOG_RUNNING;
};
// ------------------------------------------------------------
// Hol Abl�sung
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
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_02"); //Vatras aurait ma t�te...
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_03"); //Je fais ce que nous faisons tous. j'accomplis les t�ches donn�es par les Mages de l'eau.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_04"); //Certains disparus �taient des p�cheurs. Ils ont disparu avec leur navire.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_05"); //C'est pourquoi je me tiens l�, regardant le port. Peut-�tre que quelque chose se reproduira.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_06"); //Mais vous pouvez m'aider.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_07"); //�coutez. Je vais vous donner mon anneau d'aigue-marine. Cela signifie que celui qui le porte appartient � l'Anneau de l'eau.
		
		CreateInvItems (self, ItRi_Ranger_Lares_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Lares_Addon, 1);
		SC_GotLaresRing = TRUE;		
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_08"); //Si vous portez mon anneau, les autres sauront que vous agissez sous mes ordres.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_09"); //Trouvez quelqu'un pour me remplacer afin que je puisse ramener le bijou.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_10"); //Chacun de nous, � tour de r�le, surveille la place du march�. Mais je ne sais pas � qui est le tour.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_11"); //Vous devriez parler � ceux qui se tiennent par ici. D�s que la bonne personne verra que vous portez mon anneau aigue-marine, il vous le fera savoir
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_12"); //Dites-lui de veiller � ce que quelqu'un prenne ma rel�ve au port.

		B_LogEntry (TOPIC_Addon_RingOfWater,"Lares m'a remis sa bague d'aigue-marine - l'embl�me secret de l'Anneau. Lorsque je le porterai, les autres membres de l'Anneau se d�voileront � moi."); 

		Log_CreateTopic (TOPIC_Addon_BringRangerToLares, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BringRangerToLares,"Lares ne peut quitter le port. Je dois me pr�senter sur la place du march� en portant sa bague d'aigue-marine et tenter de trouver quelqu'un qui puisse remplir sa mission pour lui."); 

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

	description	 = 	"J'ai parl� � Baltram.";
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
	AI_Output (other, self, "DIA_Addon_Lares_BaltramAbloese_15_00"); //J'ai parl� � Baltram. Il va trouver quelqu'un pour vous remplacer.
	AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_01"); //Ah. Tr�s bien. Nous pouvons donc enfin partir d'ici.
	if (SC_IsRanger == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_02"); //Vous feriez mieux de garder mon anneau d'aigue-marine � partir de maintenant.
		
		if (Npc_KnowsInfo (other, DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_03"); //(sourit) Je pense que cela sera commode pour vous.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_04"); //(sourit) Qui sait, vous aurez peut-�tre envie de vous joindre � nous...
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
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "�a ne rel�ve pas de la comp�tence de la milice ?", DIA_Addon_Lares_PeopleMissing_MIL );
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
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_01"); //Le premier fut William, un des p�cheurs de Khorinis. Un jour il n'est tout simplement pas revenu.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_02"); //D'abord nous avons cru qu'un de ces monstres marins l'avait englouti lui et son bateau.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_03"); //Mais peu de temps apr�s, d'autres personnes ont commenc� � dispara�tre en ville et dans les environs. On a l'impression que les �v�nements sont le fruit du hasard.
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
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_02"); //Ils ne vont jamais r�ussir � faire la lumi�re l�-dessus. Les disparus semblent s'�tre �vapor�s dans les airs.
};
func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_00"); //Je sais ce qu'il est advenu de tous les disparus !
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_01"); //(surpris) Vraiment.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_02"); //L'ancien baron du minerai Raven les a fait enlever.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_03"); //En �tes-vous certain ? Dans ce cas, nous devons les faire sortir de l�.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_04"); //J'y travaille.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_05"); //D'accord. Mais vous savez que si vous avez besoin de moi...
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_06"); //.... je saurai o� vous trouver. Compris.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_SAVED ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_SAVED_15_00"); //J'ai r�ussi � sauver des disparus.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_SAVED_09_01"); //Je savais que vous r�ussiriez. Je peux donc maintenant retourner vaquer � mes occupations.
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
	AI_Output	(self, other, "DIA_Addon_Lares_RangerHelp_09_01"); //Et � quoi pr�cis�ment �tiez-vous en train de penser ?
	
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
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_02"); //Il y a bien un moyen pour que vous l'obteniez � bon prix, si vous n'avez pas peur d'en d�coudre avec la milice...
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_03"); //Qu'entendez-vous par l� ?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_04"); //Il y a un entrep�t pr�s de chez Matteo. Mais toutes les marchandises ont �t� confisqu�es par la milice.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_05"); //Allez voir Zuris sur la place du march� et trouvez-vous un sort de sommeil. Puis vous pourrez envoyer les gardes rejoindre les bras de Morph�e.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_06"); //Je suis certain que vous trouverez une armure digne de ce nom dans la r�serve de Matteo.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_waffe_15_00"); //J'ai besoin d'une meilleur arme.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_waffe_09_01"); //Je ne peux rien faire pour cela, j'en suis navr�. Avez-vous essay� la place du march� ?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_geld ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_geld_15_00"); //J'ai besoin d'argent.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_01"); //Nous en avons tous besoin. D�sol�, mais je n'ai rien � vous donner. Mais Lehmar le pr�teur sur gage m'est redevable.
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
	description	 = 	"Je dois � tout prix parler aux paladins !";
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
	AI_Output (self, other, "DIA_Lares_Paladine_09_01"); //Qu'est-ce que vous attendez d'eux�?
	AI_Output (other, self, "DIA_Lares_Paladine_15_02"); //Ils ont en leur possession une puissante amulette, l'�il d'Innos. J'ai besoin de l'avoir.
	AI_Output (self, other, "DIA_Lares_Paladine_09_03"); //Et vous croyez qu'ils vont vous la donner comme �a�? Vous n'acc�derez jamais au haut quartier de la ville.
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		AI_Output (other, self, "DIA_Lares_Paladine_15_04"); //Je trouverai bien un moyen...
		AI_Output (self, other, "DIA_Lares_Paladine_09_05"); //Oh, bien s�r�! A condition de l�cher les bottes des citoyens ou de jouer les larbins pour la milice...
	};
	
	//AI_Output (other, self, "DIA_Lares_Alternative_15_00"); //Hab' ich eine Alternative?
	//AI_Output (self, other, "DIA_Lares_Alternative_09_01"); //Wenn ich du w�re, w�rde ich zu Onars Hof gehen und mit Lee reden.
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
	AI_Output (other, self, "DIA_Lares_WhyPalHere_15_00"); //Savez-vous ce que les paladins font ici�?
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_01"); //Personne ne sait au juste. Beaucoup de gens pensent que c'est � cause des orques, mais j'ai l'impression que la raison est tout autre.
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_02"); //�a a probablement quelque chose � voir avec l'ancienne colonie p�nitentiaire.
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
	description	 = 	"Vatras a dit que vous pouviez m'aider � rejoindre la communaut�.";
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
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_15_00"); //Vatras a dit que vous pouviez m'aider � rejoindre la communaut�.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_01"); //(rit) Marre d'�tre donn� perdant ?
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_02"); //Tr�s bien. je vois ce que vous voulez dire.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_03"); //Je peux jouer de mon influence sur les mercenaires si vous voulez rejoindre Lee.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_04"); //Et je suis s�r que nous pouvons trouver un moyen de vous faire rentrer rapidement dans le monast�re.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_05"); //Mais la chose la plus simple serait que vous rejoignez la milice.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_06"); //Quelle communaut� pr�f�rez-vous ?
		
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "J'y r�fl�chirai...", DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Les Magiciens du feu.", DIA_Addon_Lares_Gilde_KDF );
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Les mercenaires.", DIA_Addon_Lares_Gilde_SLD );	
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "La milice.", DIA_Addon_Lares_Gilde_MIL );
};
func void DIA_Addon_Lares_Gilde_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_BACK_15_00"); //Je dois y r�fl�chir...
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_SLD ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_SLD_15_00"); //Les mercenaires.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_01"); //Je suis s�r que Lee vous acceptera.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_01"); //Mais d'abord vous devrez passer une �preuve.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_02"); //Allez parler � Cord � la ferme de Onar.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_02"); //Il peut vous aider dans votre �preuve.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_03"); //Dites-lui que je vous ai pris 'sous mon aile'. Il comprendra.
	RangerHelp_gildeSLD = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpSLD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Lares m'a inform� que le mercenaire Cord pourrait faciliter mon arriv�e sur la ferme du propri�taire terrien."); 
	
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_MIL_15_00"); //La milice.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_01"); //(amus�) Oui. J'imagine que �a vous plairait hein ? Expliquer la loi tout en fouillant dans les poches.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_02"); //Les paladins ont entrepos� leurs provisions pr�s du port. Leur ma�tre du cellier est un tr�s bon ami.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_03"); //Il peut peut-�tre faire quelque chose pour vous. Son nom est Martin.

	Log_CreateTopic (TOPIC_Addon_RangerHelpMIL, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Lares m'a dit que Martin, le ma�tre du cellier, m'aiderait � int�grer rapidement la milice. Je le trouverai probablement sur le port, l� o� se trouvent les greniers � provisions des paladins."); 
	
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_KDF ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_KDF_15_00"); //Les Magiciens du feu.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_01"); //(rit) Je parie que Vatras n'avait pas pr�vu cela ou il ne vous aurait pas envoy� jusqu'� moi.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_02"); //Rejoindre le monast�re co�te cher.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_03"); //Ces gar�ons ne vous laisseront pas rentrer � moins que vous ne leur payiez un droit de passage.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_04"); //Et le seul qui puisse faire quelque chose est Vatras en personne. Vous devriez retourner lui parler � ce sujet.

	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Lares m'a appris que Vatras conna�t un moyen facile d'entrer dans le monast�re."); 

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
	Info_AddChoice (DIA_Lares_AboutSld, "Pourquoi n'�tes-vous pas avec Lee et ses mercenaires ?", DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice (DIA_Lares_AboutSld, "Dites-m'en davantage sur les mercenaires...", DIA_Lares_AboutSld_Sld);
	Info_AddChoice (DIA_Lares_AboutSld, "Comment trouver la ferme du propri�taire terrien ?", DIA_Lares_AboutSld_WayToOnar); 
};
func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices (DIA_Lares_AboutSld);
};
func void DIA_Lares_AboutSld_Sld()
{	
	AI_Output (other,self,  "DIA_Lares_AboutSld_15_00"); //Parlez-moi encore des mercenaires.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_01"); //Eh bien, si vous �tes aussi costaud que vous l'�tiez � l'�poque, ils ne devraient pas vous poser de probl�mes.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_02"); //La plupart d'entre eux ne sont que des ruffians. Si vous n'�tes pas capable de leur tenir t�te, vous n'irez pas loin dans la vie.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_03"); //(�clate de rire) Si vous �tes du genre trouillard, vous n'avez pas la moindre chance avec eux.
};	
func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output (other, self, "DIA_Lares_WhyInCity_15_00"); //Pourquoi n'�tes-vous pas avec Lee et ses mercenaires�?
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_01"); //Mais je suis avec eux�! Je ne suis pas � la ferme, c'est tout.
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_02"); //Disons que je constitue notre avant-poste en ville. C'est qu'on ne voudrait pas que le bateau s'en aille sans nous...
	//AI_Output (self, other, "DIA_Lares_WhyInCity_09_03"); //Warum bist DU in die Stadt gekommen?
	Lares_WorkForLee = TRUE;
	
	Info_AddChoice (DIA_Lares_AboutSld, "De quel navire parliez-vous ?", DIA_Lares_AboutSld_Schiff);
};
func void DIA_Lares_AboutSld_Schiff()
{	
	AI_Output (other,self , "DIA_Lares_Schiff_15_00"); //De quel bateau voulez-vous parler�?
	AI_Output (self, other, "DIA_Lares_Schiff_09_01"); //Il est amarr� au port de haute mer, derri�re les falaises. Lee et quelques-uns de ses gars ont vraiment envie de s'en aller d'ici.
	AI_Output (self, other, "DIA_Lares_Schiff_09_02"); //Mais �a m'�tonnerait que �a se fasse tout de suite...
	AI_Output (other,self , "DIA_Lares_Schiff_15_03"); //Pourquoi ?
	AI_Output (self, other, "DIA_Lares_Schiff_09_04"); //Posez la question � Lee si vous allez le voir. C'est qu'il a des plans, le chef...
};
func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output (other,self, "DIA_Lares_WegZumHof_15_00"); //O� se trouve la ferme du propri�taire terrien�?
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_00"); //C'est tr�s simple. Vous quittez le port par la porte est et puis vous suivez le chemin jusqu'� l'est.
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_01"); //Je peux vous y emmener si vous le souhaitez.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_01"); //Ich kann dich hinbringen, wenn du willst. Hab sowieso schon zu lange hier rumgehangen.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_02"); //Hier im Hafen gibt es zwar f�r gew�hnlich keine Miliz, aber ich muss ja nicht riskieren, dass einer von ihnen Verdacht sch�pft ...
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
	AI_Output (other, self, "DIA_Lares_GuildOfThieves_15_00"); //Vous avez entendu parler d'une guilde de voleurs en ville�?
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_01"); //D�cid�ment, vous posez de ces questions...
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_02"); //Bien s�r qu'il y a une guilde de voleurs ici�! Comme dans toutes les grandes villes.
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_03"); //Et tous les voleurs � la tire et autres receleurs de Khorinis sont s�rement en cheville avec elle.
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
	description	 = 	"Savez-vous o� je peux trouver la guilde des voleurs ?";
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
	AI_Output (other, self, "DIA_Lares_WhereGuildOfThieves_15_00"); //Savez-vous o� je peux trouver la guilde des voleurs�?
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_01"); //(�clate de rire) Ne le prenez surtout pas mal, mais m�me si je le savais, je ne vous le dirais pas.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_02"); //Ces gens-l� ont tendance � se montrer tr�s susceptibles quand on les d�nonce vous savez...
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_03"); //Si vous voulez avoir affaire � eux, je vous conseille d'�tre extr�mement prudent.
};
// ------------------------------------------------------------
// Meersalz Schl�ssel
// ------------------------------------------------------------
instance DIA_Lares_GotKey (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	16;
	condition	 = 	DIA_Lares_GotKey_Condition;
	information	 = 	DIA_Lares_GotKey_Info;
	permanent    =  FALSE;
	description	 = 	"J'ai cette clef. Elle a �t� rong�e par l'eau sal�e...";
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
	AI_Output (other, self, "DIA_Lares_GotKey_15_00"); //J'ai cette cl� attaqu�e par le sel de mer...
	AI_Output (self, other, "DIA_Lares_GotKey_09_01"); //Alors ?
	AI_Output (other,self, "DIA_Lares_GotKey_15_02"); //Je pense qu'elle devrait me permettre d'acc�der au repaire de la guilde des voleurs.
	AI_Output (self, other, "DIA_Lares_GotKey_09_03"); //C'est peut-�tre la cl� des �gouts...
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
	description	 = 	"O� puis-je trouver les �gouts ?";
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
	AI_Output (other,self, "DIA_Lares_Kanalisation_15_00"); //O� se trouve l'entr�e des �gouts�?
	AI_Output (self, other, "DIA_Lares_Kanalisation_09_01"); //Comment voulez-vous que je sache�? Normalement, ils doivent se vider dans l'oc�an.
};

// ************************************************************
// 		  			Important f�r andere Gilden
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
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_00"); //Vous �tes dans la milice maintenant�?
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_01"); //(�clate de rire) C'est � mourir de rire�! Un ancien prisonnier membre de la milice�!
		}
		else //GIL_PAL
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_02"); //Ainsi, vous faites d�sormais partie des paladins du roi.
		};
	
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_03"); //(malicieux) Il n'y a que vous pour r�ussir un truc dans ce genre.
	
		if (Lares_WorkForLee == TRUE)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_04"); //(inquiet) Vous n'allez pas me d�noncer, si�?
			AI_Output (other,self , "DIA_Lares_OtherGuild_15_05"); //Mais vous me connaissez...
		};
	};
	
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_06"); //Je ne comprends pas. Vous avez d�cid� d'entrer au monast�re�? Comment c'est l�-bas�?
		AI_Output (other,self , "DIA_Lares_OtherGuild_15_07"); //Diff�rent.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_08"); //�a, je veux bien le croire�!
	};
		
	if (other.guild == GIL_SLD) 
	|| (other.guild == GIL_DJG)
	{
		//AI_Output (self, other, "DIA_Lares_OtherGuild_09_09"); //Ich hab geh�rt, du bist aufgenommen worden.
		AI_Output (self, other, "DIA_Addon_Lares_OtherGuild_09_00"); //J'ai appris que vous aviez accept� de rejoindre Lee.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_10"); //F�licitations.
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

	description	 = 	"Pouvez-vous m'aider � traverser la for�t dense, � l'est d'ici ?";
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
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_00"); //Pouvez-vous m'aider � traverser ces bois profonds � l'est ?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_01"); //D'accord. Mais pourquoi voulez-vous aller l�-bas ?
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_02"); //Nefarius m'a donn� l'ordre de trouver d'autres bijoux.
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_03"); //L'un des endroits o� je suis cens� chercher se trouve au milieu des bois.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_04"); //Je vois. Et c'est trop dangereux pour que vous y alliez seul, pas vrai ?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_05"); //Pas de probl�me. Faites-moi savoir quand vous voulez partir.

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
	description	 = 	"Tr�s bien, allons-y.";
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
		AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_03"); //Je ne peux pas partir d'ici tant que nous n'en savons pas plus sur les disparus ou tant que quelqu'un ne m'a pas relev� de mes fonctions.
	}
	else if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING) //bleibt am Hafen w�hrend RangerMeeting
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
			AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_04"); //O� ?
			
			
			Info_ClearChoices	(DIA_Lares_GoNow);
			Info_AddChoice	(DIA_Lares_GoNow, DIALOG_BACK, DIA_Lares_GoNow_warte );
		
			if (Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS)
			{
				Info_AddChoice	(DIA_Lares_GoNow, "� la ferme d'Onar.", DIA_Lares_GoNow_Onar );
			};
		
			if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) && (Lares_Angekommen == FALSE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "R�cup�rons l'anneau de Vatras", DIA_Lares_GoNow_Maya );
			};
			
			if ((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "� travers la for�t imp�n�trable � l'est.", DIA_Lares_GoNow_Forest );
			};
	};		
};

func void DIA_Lares_GoNow_Maya ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Maya_15_00"); //R�cup�rons l'anneau de Vatras
	LaresGuide_ZumPortal = 1;
	Npc_ExchangeRoutine (self, "GUIDEPORTALTEMPEL1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Onar ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Onar_15_00"); //� la ferme d'Onar.
	LaresGuide_ZuOnar = TRUE;
	Npc_ExchangeRoutine (self, "GUIDE");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Forest ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Forest_15_00"); //� travers la for�t imp�n�trable � l'est.
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
		AI_Output (self, other, "DIA_Lares_GUIDE_09_00"); //Nous y voil�.
	}
	else
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_01"); //Ah, vous voil�! Je commen�ais � craindre que vous ayez fini dans le ventre des loups...
	};
	AI_Output (self, other, "DIA_Lares_GUIDE_09_02"); //Vous devriez pouvoir vous d�brouiller seul � partir d'ici. Moi, il faut que je retourne en ville. Il me reste encore quelques petites choses � r�gler...
	AI_Output (self, other, "DIA_Lares_GUIDE_09_03"); //Suivez la route, et n'oubliez surtout pas de leur tenir t�te. Tout ira bien si vous ne vous laissez pas marcher sur les pieds.
	
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
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_00"); //Maintenant que nous ne sommes plus en ville et que nous sommes � l'abri des oreilles indiscr�tes, laissez-moi vous en dire un peu plus.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_01"); //Nous allons � pr�sent rendre ce bijou que vous m'avez apport� � Saturas. Vous vous souvenez de Saturas, n'est-ce pas ?
	
	
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Certainement.", DIA_Addon_Lares_ArrivedPortalInter1_ja );
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Saturas ? Qui est-ce ?", DIA_Addon_Lares_ArrivedPortalInter1_wer );

	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2 ()
{
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00"); //Nous, les gars de l'ancien Nouveau Camp, entretenons toujours de bonnes relations avec les Mages de l'eau.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01"); //M�me Lee prot�gera encore les Mages de l'eau de n'importe quel danger si c'est en son pouvoir.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02"); //Afin de garder contact avec les Mages de l'eau, je suis en ville la plupart du temps, travaillant conjointement avec Vatras.
	B_MakeRangerReadyForMeeting (self);
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03"); //Et c'est l'armure qui est remise � chacun de nous par les Mages de l'eau. Les membres de l'Anneau de l'eau ont port� de telles armures bien avant la  guerre des orques.
	
	if (Cavalorn_RangerHint == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04"); //Quel r�le joue Cavalorn l�-dedans ? Il ne faisait pas parti du Nouveau Camp, autant que je sache.
		AI_Output (self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05"); //Vous avez raison, notre communaut� s'est agrandie. Je ne sais m�me pas combien nous sommes � pr�sent.
	};

	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06"); //Mais continuons. Je veux m'�loigner plus de la ville. Nous en pourrons en parler plus tard.
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00"); //Saturas ? Qui est-ce ?
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01"); //Il �tait le chef des Mages de l'eau dans le Nouveau Camp, � l'�poque o� la Barri�re nous encerclait encore.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02"); //Lee et moi avions fait un pacte en ce temps-l� avec les Mages de l'eau. Avec nos puissances unies nous avons �t� victorieux contre l'ancien camp.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00"); //Certainement. Il �tait le chef des Mages de l'eau dans le Nouveau camp.
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
		AI_Output	(other, self, "DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01"); //Ce type l�-bas a maille � partir avec les bandits.
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
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_00"); //Les Mages de l'eau sont dans tous leurs �tats. Ils sont en train de fouiller au nord-est depuis des semaines. Personne ne sait ce qu'ils peuvent bien chercher.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_01"); //Tout a commenc� quand la terre s'est mise � trembler exactement comme aux pires heures de la Barri�re.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_02"); //D'horribles cr�atures de pierre sont sortis des entrailles de la terre, massacrant tout ceux qui se trouvaient  � moins de 100 pieds d'eux.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_03"); //Les Mages de l'eau ont pris les choses en main et ont d�truit ces cr�atures hostiles. Et maintenant ils creusent l�, cherchant une explication � ces ph�nom�nes �tranges.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_04"); //Mais vous vous rendrez bient�t compte par vous-m�me.

	LaresGuide_ZumPortal = 5;
	B_LogEntry (TOPIC_Addon_KDW,"Lares m'a parl� du site de fouilles des Mages. Ils enqu�tent apparemment sur des �v�nements �tranges : des s�ismes se sont produits, et d'�tranges cr�atures de pierre �mergent du sol."); 
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
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_00"); //Nous sommes l�.
 	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_01"); //Voici, prenez le bijou. Les Mages de l'eau doivent �tre l� quelque part. Apportez-le leur.
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);					
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_02"); //Si jamais vous rencontriez des b�tes � l'int�rieur de ce trou dans le sol et qu'il semble qu'elles soient bien trop nombreuses pour vous, courez jusqu'� Saturas.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_03"); //Il se chargera des b�tes. Je dois y aller.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_04"); //Et une derni�re chose : N'envisagez m�me pas de fl�ner avec ce bijou. Rendez-vous directement chez Saturas.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_05"); //� bient�t.
	
	B_LogEntry (TOPIC_Addon_KDW,"Lares m'a remis ce bijou. Il veut que je le remette � Saturas, le Mage de l'eau."); 
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
	AI_Output (self, other, "DIA_Addon_Lares_Albern_09_00"); //(s�v�re) Assez plaisant� ! Rapportez ce bijou � Saturas !
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
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_ja_09_01"); //Tr�s bien, mon ami. Alors suivez-moi. �a va saigner.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2; 
};
func void DIA_Addon_Lares_GOFORESTPRE_nein ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_nein_15_00"); //Non. Vous pouvez y aller.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_nein_09_01"); //Je pense que l'affaire s'est r�solue d'elle-m�me ? Tr�s bien. � bient�t.
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
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_01"); //Avez-vous pens� � vous rendre dans les bois ? Vous voulez vraiment y aller ?
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
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_00"); //L�. Vous devriez �tre capable de faire le reste par vous-m�me. Je m'en retourne alors.
	 	AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine (self,"START");
	 	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit guide Forest!
 	}
 	else
 	{
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_01"); //D�p�chez-vous. Je ne tiens pas � rester ici plus longtemps que n�cessaire.
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
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_01"); //(irrit�) Oui, oui.
	};

	AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_02"); //Continuons.
	
	if (LaresGuide_ZumPortal == 7)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_03"); //Restez un peu en retrait.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_04"); //Restez bien derri�re moi.
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
	AI_Output (self, other, "DIA_Addon_Lares_DEX_Add_09_01"); //�videmment. Je peux vous aider � devenir plus fort et � am�liorer votre dext�rit� si vous le souhaitez.

	Lares_TeachDEX = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Lares peut m'aider � am�liorer ma force et ma dext�rit�.");
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
		AI_Output (self, other, "DIA_Lares_TEACH_BACK_09_00"); //Vous �tes d�j� plus agile qu'avant.
	};
	if (other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_Lares_TEACH_BACK_Add_09_00"); //(appr�ciateur) Bien. Votre force a augment�.
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
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_01"); //En g�n�ral, tout ce qu'il y a de nouveau, ou presque, c'est � vous qu'on le doit. Bennet a �t� rel�ch�. Il est retourn� � la ferme.
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_02"); //Allez le voir, je crois qu'il aimerait bien vous remercier en personne.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_03"); //�a, on peut le dire�! Les paladins ont arr�t� Bennet, notre forgeron.
		
		if (MIS_RescueBennet == LOG_RUNNING)
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_04"); //Je me le suis laiss� dire en effet. Sale affaire...
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_05"); //�a, c'est s�r�!
		}
		else
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_06"); //Comment est-ce arriv�?
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_07"); //Bennet �tait en ville pour acheter des provisions, il n'est jamais revenu.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_08"); //Si vous voulez en savoir davantage, demandez � Hodges, il �tait en ville avec Bennet.
			
			MIS_RescueBennet = LOG_RUNNING;
		};
	};
};

// ************************************************************
// 		Hast du was von Bennet geh�rt?			 
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
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_00"); //Des nouvelles de Bennet�?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_01"); //Apparemment, il aurait �t� emmen� � la caserne et enferm� au cachot.
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_02"); //Comment peut-on le sortir de l�?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_03"); //Je n'en ai pas la moindre id�e. Il m'est impossible d'acc�der � sa cellule afin de lui parler.
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_04"); //Tout ce que je peux faire, c'est �couter ce qui se dit, mais il n'y a grand-chose � apprendre par ici.
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
	description = "Pourquoi n'�tes-vous pas en train de chasser les dragons ?";
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
	AI_Output (other,self ,"DIA_Lares_Kap4_PERM_15_00"); //Pourquoi n'�tes-vous pas en train de chasser les dragons�?
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_01"); //Ce n'est pas mon truc. Je pr�f�re laisser �a aux autres.
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_02"); //Oh, que non. L'air marin, c'est de �a dont j'ai besoin en ce moment.
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
	description	 = 	"Voudriez-vous quitter cette �le ?";
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
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_00"); //�a vous dirait de quitter cette �le�?
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_01"); //Plus que tout au monde. Qu'est-ce que vous avez en t�te�?
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_02"); //J'ai appris o� se cachait le chef des dragons. Il se trouve sur une �le situ�e non loin d'ici.
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_03"); //J'ai l'intention d'y aller afin de nous d�barrasser de lui une bonne fois pour toutes.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_04"); //H�, super�! Si je peux vous �tre d'une quelconque utilit�, j'en suis.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_05"); //Vous n'auriez pas besoin qu'on vous apprenne � devenir plus agile ou � manier les armes � une main en cours de voyage�?
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lares_KnowWhereEnemy_15_06"); //L'�quipage est d�j� au complet, mais je vous contacterai si la situation �volue.
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
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_01"); //Le rassemblement est pr�vu au bateau.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02"); //Vous �tes un homme d'action, vous. �a me pla�t. A plus tard.
	
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
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_No_09_01"); //J'imagine que vous savez de quoi vous avez besoin. Si vous souhaitez en reparler, vous savez o� me trouver.

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
	description	 = 	"Il est pr�f�rable que vous ne veniez pas.";
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
	AI_Output			(other, self, "DIA_Lares_LeaveMyShip_15_00"); //Il serait pr�f�rable que vous ne veniez pas.
	AI_Output			(self, other, "DIA_Lares_LeaveMyShip_09_01"); //Comme vous voudrez. Mais � l'avenir, r�fl�chissez avant de promettre n'importe quoi aux gens.
	
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
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_StillNeedYou_Condition;
	information	 = 	DIA_Lares_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Le voyage vous int�resse-t-il encore ?";
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
	AI_Output			(other, self, "DIA_Lares_StillNeedYou_15_00"); //�a vous int�resse toujours de me suivre�?
	
	if (Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_01"); //En temps normal, je ne laisse personne me traiter de la sorte, mais comme vous �tes des n�tres, �a ira pour cette fois.
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
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_04"); //Il est pr�f�rable que je reste ici.
		
		AI_StopProcessInfos (self);
	};	
};


























