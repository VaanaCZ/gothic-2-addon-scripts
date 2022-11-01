///////////////////////////////////////////////////////////////////////
//	C_BragoBanditsDead 
///////////////////////////////////////////////////////////////////////

func int C_BragoBanditsDead ()
{
	if ( Npc_IsDead (Ambusher_1013) || (Bdt_1013_Away == TRUE) )
	&& (Npc_IsDead (Ambusher_1014)) 
	&& (Npc_IsDead (Ambusher_1015))
	{
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cavalorn_EXIT   (C_INFO)
{
	npc         = Bau_4300_Addon_Cavalorn;
	nr          = 999;
	condition   = DIA_Addon_Cavalorn_EXIT_Condition;
	information = DIA_Addon_Cavalorn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Cavalorn_PICKPOCKET (C_INFO)
{
	npc			= Bau_4300_Addon_Cavalorn;
	nr			= 900;
	condition	= DIA_Addon_Cavalorn_PICKPOCKET_Condition;
	information	= DIA_Addon_Cavalorn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait facile de lui voler son carquois de flèches)";
};                       

FUNC INT DIA_Addon_Cavalorn_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (25 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Cavalorn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Cavalorn_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Cavalorn_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Cavalorn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Cavalorn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Cavalorn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cavalorn_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 25)
	{
		
		B_GiveInvItems (self, other, ItRw_Arrow, 44);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Addon_Cavalorn_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Cavalorn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Cavalorn_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_MeetingIsRunning		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;
func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_MeetingIsRunning_08_00"); //Bienvenue dans l'Anneau, mon ami !
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Gaan_MeetingIsRunning_08_01"); //Vatras vous remettra votre prochaine mission.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_HALLO		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_HALLO_Condition;
	information	 = 	DIA_Addon_Cavalorn_HALLO_Info;

	description	 = 	"Vous avez un problème ?";
};

func int DIA_Addon_Cavalorn_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_15_00"); //Des ennuis ?
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_08_01"); //(irrité) Bon sang ! Je ne sais pas où ils se terrent tous... Vous en tuez un, et peu de temps après, ils sont tous de retour.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_08_02"); //(sournois) Attendez un peu... je vous connais. Vous êtes le type qui venait sans cesse me réclamer des flèches dans la Vallée des mines.
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Votre nom est Cavalorn, c'est ça ?", DIA_Addon_Cavalorn_HALLO_Ja );
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Je m'en souviens à peine...", DIA_Addon_Cavalorn_HALLO_weissNicht );

};
func void DIA_Addon_Cavalorn_HALLO_weissNicht ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_weissNicht_15_00"); //Je ne me souviens pas vraiment...?
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_weissNicht_08_01"); //Oh, arrêtez un peu. À l'époque, devant ma cabane construite sous les remparts de l'ancien camp, je vous ai appris à tirer à l'arc et à vous déplacer discrètement. Ça vous revient ?

};

func void DIA_Addon_Cavalorn_HALLO_Ja ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_Ja_15_00"); //Votre nom est Cavalorn, c'est ça ?
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Ja_08_01"); //Ah. Je vois que vous ne m'avez pas oublié... après tout ce que nous avons vécu dans cette maudite colonie,
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Ja_08_02"); //Où allez-vous comme ça ?
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Je n'ai pas d'objectif particulier.", DIA_Addon_Cavalorn_HALLO_keinZiel );
	Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "Retour à la Vallée des mines.", DIA_Addon_Cavalorn_HALLO_Bauern );

	if (Mil_310_Stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cavalorn_HALLO, "En ville.", DIA_Addon_Cavalorn_HALLO_Stadt );
	};
};
func void DIA_Addon_Cavalorn_HALLO_Stadt ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_HALLO_Stadt_15_00"); //En ville.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_01"); //(rit) Bien, bien ! En ville, hein ?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_02"); //Vous aurez peut-être quelques soucis avec les gardes. Ils ne laissent plus passer qui que ce soit depuis que le coin grouille de bandits.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_03"); //Il y a quelques jours, un ancien mentaliste de la Vallée des mines est passé dans le coin. Il m'a dit qu'il se rend sans arrêt à Khorinis.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_04"); //Il s'est rendu dans la vallée au pied de la grande tour. Il doit y avoir une entrée dans les parages, non loin des chutes d'eau.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_05"); //Peut-être devriez-vous parler à ce type.
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_Bauern_15_00"); //Retour à la Vallée des mines.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Bauern_08_01"); //(ébahi) Vraiment ? Hmm. J'aimerais bien vous suivre, mais je dois d'abord finir ce que j'ai à faire ici.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_Bauern_08_02"); //Lorsque vous serez dans la Vallée des mines, pourriez-vous aller voir si ma vieille cabane tient toujours debout ? J'aimerais y retourner, un jour.
	
	MIS_Addon_Cavalorn_TheHut = LOG_RUNNING;	
	Log_CreateTopic (TOPIC_Addon_CavalornTheHut, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_CavalornTheHut,"Cavalorn m'a demandé d'aller voir si sa vieille hutte, aux confins de la Vallée des mines, tient toujours debout. Si je me souviens bien, cette hutte se trouve sur les terres vallonnées à l'ouest de l'ancien camp. J'imagine qu'il a dû y laisser quelque chose.");
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_HALLO_keinZiel_15_00"); //Je n'ai pas d'objectif particulier.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_HALLO_keinZiel_08_01"); //Vous ne voulez pas me dire, hein ? A votre guise...

	Info_ClearChoices	(DIA_Addon_Cavalorn_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Beutel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Beutel		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_Beutel_Condition;
	information	 = 	DIA_Addon_Cavalorn_Beutel_Info;

	description	 = 	"J'ai été voir votre cabane dans la Vallée des mines.";
};

func int DIA_Addon_Cavalorn_Beutel_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_HALLO))
	&& ((Npc_HasItems (other,ItSe_ADDON_CavalornsBeutel))||(SC_OpenedCavalornsBeutel == TRUE))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_Beutel_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_00"); //J'ai été voir votre cabane dans la Vallée des mines.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_01"); //Elle tient toujours debout.
	if (MIS_Addon_Cavalorn_TheHut == LOG_RUNNING)
	{
		AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_02"); //Oui... et je sais aussi ce que vous vouliez y retrouver.
	};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_03"); //Vous l'avez trouvé ?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_04"); //Si vous voulez parler du sac qui contient des blocs de minerai... oui, je l'ai récupéré.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_05"); //Vous êtes un sacré renard, vous le savez, ça ?
	if (MIS_Addon_Cavalorn_TheHut == LOG_RUNNING)
	{
		AI_Output	(other, self, "DIA_Addon_Cavalorn_Beutel_15_06"); //Que pouviez-vous chercher d'autre dans cette vieille cabane ? Elle ne contient plus rien d'autre.
	};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Beutel_08_07"); //Vous avez le sac sur vous ? Je vous donnerai 100 pièces d'or si vous me le rendez.
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);

	if (Npc_HasItems (other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Certainement.", DIA_Addon_Cavalorn_Beutel_ja );
	}
	else if  (Npc_HasItems (other,ItMi_Nugget))
	{
		Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Non, mais j'ai un bloc de minerai sur moi.", DIA_Addon_Cavalorn_Beutel_jaerz );
	};
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Non.", DIA_Addon_Cavalorn_Beutel_no );
};
func void DIA_Addon_Cavalorn_Beutel_back ()
{
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	AI_Output	(self, other, "DIA_Addon_Cavalorn_back_08_00"); //J'espère que j'en verrai bientôt la couleur.
};
func void DIA_Addon_Cavalorn_Beutel_jaerz ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_jaerz_15_00"); //Non, mais j'ai un bloc de minerai sur moi.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_jaerz_08_01"); //Ça fera l'affaire.
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back );
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Pourquoi l'avoir laissé là-bas, pour commencer ?", DIA_Addon_Cavalorn_Beutel_why );
};
func void DIA_Addon_Cavalorn_Beutel_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_ja_15_00"); //Bien sûr.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_ja_08_01"); //Super !
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back );
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Pourquoi l'avoir laissé là-bas, pour commencer ?", DIA_Addon_Cavalorn_Beutel_why );
};

func void DIA_Addon_Cavalorn_Beutel_no ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_no_15_00"); //Non.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_no_08_01"); //Alors récupérez-le pour moi. Après tout, je serais moi-même prêt à retourner dans cette maudite vallée pour le retrouver.
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_no_15_02"); //J'en ai la larme à l'œil.
	Info_ClearChoices	(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back );
	Info_AddChoice	(DIA_Addon_Cavalorn_Beutel, "Pourquoi l'avoir laissé là-bas, pour commencer ?", DIA_Addon_Cavalorn_Beutel_why );
};

func void DIA_Addon_Cavalorn_Beutel_why ()
{
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Beutel_why_15_00"); //Pourquoi l'avoir laissé là-bas, pour commencer ?
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_01"); //Je ne savais pas que le minerai était si précieux ici, à Khorinis.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_02"); //Un misérable morceau de minerai ne vous rapportait même pas un coin où dormir, dans la colonie pénitentiaire.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_03"); //Dans la ville portuaire, certains seront prêts à vous fracasser le crâne s'ils découvrent que vous avez du minerai sur vous.
};

///////////////////////////////////////////////////////////////////////
//	Info ErzGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_ErzGeben		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_ErzGeben_Condition;
	information	 = 	DIA_Addon_Cavalorn_ErzGeben_Info;

	description	 = 	"Donnez-moi 100 pièces d'or et je vous ramènerai votre minerai.";
};

func int DIA_Addon_Cavalorn_ErzGeben_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Beutel))
	&& ((Npc_HasItems (other,ItSe_ADDON_CavalornsBeutel))||(Npc_HasItems (other,ItMi_Nugget)))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_ErzGeben_15_00"); //Donnez-moi 100 pièces d'or et je vous ramènerai votre minerai.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ErzGeben_08_01"); //Marché conclu. Voilà pour vous.
	CreateInvItems (self, ItMi_Gold, 100);									
	B_GiveInvItems (self, other, ItMi_Gold, 100);		

	if (B_GiveInvItems (other, self, ItSe_ADDON_CavalornsBeutel,1) == FALSE)
		{
			B_GiveInvItems (other, self, ItMi_Nugget,1);
		};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ErzGeben_08_02"); //Vous êtes un véritable ami. Soyez remercié.
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_CavalornsBeutel);
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_WASMACHSTDU		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information	 = 	DIA_Addon_Cavalorn_WASMACHSTDU_Info;

	description	 = 	"Que faites-vous ici ?";
};

func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_HALLO))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_WASMACHSTDU_15_00"); //Que faites-vous ici ?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_WASMACHSTDU_08_01"); //Je me suis retranché ici à cause de ces maudits bandits. Sans leur intervention, je ne serais pas bloqué ici.
	
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Banditen		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Cavalorn_Banditen_Condition;
	information	 = 	DIA_Addon_Cavalorn_Banditen_Info;

	description	 = 	"Qu'est-ce que vous me dites à propos des bandits ?";
};

func int DIA_Addon_Cavalorn_Banditen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_WASMACHSTDU))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_Banditen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Banditen_15_00"); //Qu'est-ce que vous me dites à propos des bandits ?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_01"); //Vous avez passé les dernières semaines à dormir ?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Banditen_15_02"); //Heu...
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_03"); //Je vous parle de toute la vermine échappée de la colonie pénitentiaire qui s'est installée dans les parages. Ils pillent et égorgent à tout va.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_04"); //(soupire) Cela dit, j'ai même de la chance qu'ils ne m'aient pas tué. J'ai abaissé ma garde une seconde seulement, et ils m'ont assommé par derrière.
	
	if (C_BragoBanditsDead () == FALSE) 
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_Banditen_08_05"); //Je ne sais vraiment pas comment je vais pouvoir récupérer mes biens...
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_ARTEFAKT		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information	 = 	DIA_Addon_Cavalorn_ARTEFAKT_Info;

	description	 = 	"Vous avez été détroussé par les bandits ?";
};

func int DIA_Addon_Cavalorn_ARTEFAKT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Banditen))
	&& (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_ARTEFAKT_15_00"); //Vous avez été détroussé par les bandits ?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_01"); //(furieux) Oui. Ils m'ont passé à tabac et m'ont jeté en pâture aux gobelins.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_02"); //Ce qu'ils m'ont volé compte énormément à mes yeux. Une lettre et tout mon argent. Je dois absolument les récupérer.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_03"); //Mais sans quelqu'un pour me couvrir, il est hors de question que je me rende là-bas. Ces lâches...
};

///////////////////////////////////////////////////////////////////////
//	Info HELFEN
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_HELFEN		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_HELFEN_Condition;
	information	 = 	DIA_Addon_Cavalorn_HELFEN_Info;

	description	 = 	"Peut-être puis-je vous aider à résoudre le problème des bandits ?";
};

func int DIA_Addon_Cavalorn_HELFEN_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_ARTEFAKT))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	&& (C_BragoBanditsDead () == FALSE)//Joly:VORSICHT!!!!!muss als letztes Stehen
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_HELFEN_15_00"); //Peut-être puis-je vous aider à résoudre le problème des bandits ?

	if (Npc_HasEquippedArmor(other) == FALSE)
	&& (hero.guild == GIL_NONE) 
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_01"); //(sournois) Peut-être... mais à en juger par votre apparence, cela fait sûrement quelques semaines que vous n'avez pas tenu une épée digne de ce nom.
	};
	
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_02"); //Eh bien... quoi qu'il en soit, je n'ai guère le choix. Je n'ai plus le temps de me montrer difficile.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_03"); //Alors écoutez-moi bien. Si vous suivez ce sentier, vous trouverez une de ces infectes fosses dans  lesquelles les bandits aiment à se terrer.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_04"); //Ce sont ces types qui m'ont dérobé mes biens.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_HELFEN_08_05"); //Faites-moi signe lorsque vous serez prêt, et nous irons retrouver cette vermine.
	
	MIS_Addon_Cavalorn_KillBrago = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillBrago, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KillBrago,"Les bandits qui rôdent autour du campement de Cavalorn lui ont dérobé un bien précieux. Il veut que nous les affrontions ensemble."); 

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info AUSRUESTUNG
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_AUSRUESTUNG		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information	 = 	DIA_Addon_Cavalorn_AUSRUESTUNG_Info;

	description	 = 	"Il me faut de meilleurs armes.";
};

func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition ()
{
	if 	(MIS_Addon_Cavalorn_KillBrago != 0)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_00"); //Il me faut de meilleurs armes.
		
		if (C_BragoBanditsDead () == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_01"); //Ces crapules ne m'ont pas laissé grand-chose.
		};
		
	AI_Output	(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_02"); //Je peux vous donner le couteau de Wolf. Cela suffira, pour l'instant ?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_03"); //Vous appelez ça un couteau ?

	CreateInvItems (self, ItMW_Addon_Knife01, 1);									
	B_GiveInvItems (self, other, ItMW_Addon_Knife01, 1);					
	 
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_04"); //Et pour les soins ?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_05"); //Il me reste encore 2 potions de soins. Ça vous intéresse ?
	AI_Output	(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_06"); //Bien sûr. Donnez-les moi.
	
	CreateInvItems (self, ItPo_Health_01, 2);									
	B_GiveInvItems (self, other, ItPo_Health_01, 2);					

};

///////////////////////////////////////////////////////////////////////
//	Info LETSKILLBANDITS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_LETSKILLBANDITS		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information	 = 	DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;

	description	 = 	"Allons nous frotter un peu à ces types.";
};

func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition ()
{
	if (MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	&& (C_BragoBanditsDead () == FALSE)	//Joly:VORSICHT!!!!!muss als letztes Stehen
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00"); //Allons nous frotter un peu à ces types.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01"); //Bien sûr. Mais veillez à ce qu'aucun d'eux ne me frappe dans le dos, compris ?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02"); //Ils vont avoir une mauvaise surprise...
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"KillBandits");

	if (Bdt_1013_Away == FALSE)
	{
		Ambusher_1013.aivar[AIV_EnemyOverride] = FALSE;
	};
	Ambusher_1014.aivar[AIV_EnemyOverride] = FALSE;
	Ambusher_1015.aivar[AIV_EnemyOverride] = FALSE;
};

func void B_Addon_Cavalorn_VatrasBrief ()
{
	
	if (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_00"); //Ensuite, je pourrai enfin accomplir ma mission. J'ai déjà perdu bien trop de temps.
		AI_Output	(other, self, "DIA_Addon_Cavalorn_VatrasBrief_15_01"); //Quel genre de mission...?
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_02"); //(pour lui-même) Ah ouais... Je dois d'abord rentrer dans la ville, puis...
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_03"); //(soupire) Je ne sais pas comment je vais pouvoir accomplir tout cela dans les temps.
		AI_Output	(other, self, "DIA_Addon_Cavalorn_VatrasBrief_15_04"); //(sèchement) Et moi ?
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_05"); //(hésitant) Hmm. Pourquoi pas. Vous pourriez porter la lettre à la ville.
	};
	
	AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_06"); //Cela me laisserait plus de temps pour m'occuper de mon matériel.

	if (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_07"); //L'un des bandits doit garder la lettre dans sa poche.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_08"); //Portez-la à Vatras, le Mage de l'eau, lorsque vous serez dans la ville. Vous le trouverez dans le temple d'Adanos. Il y prêche à longueur de journée.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_09"); //Dites-lui que je n'ai pas pu accomplir la mission.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_10"); //Et s'il vous demande où je me trouve, dites-lui que je suis en route vers le point de rencontre, d'accord ?
		B_LogEntry (TOPIC_Addon_KDW,"Le Mage de l'eau Vatras se trouve au port de Khorinis. Il prêche dans le temple d'Adanos de cette ville."); 
	};
	
	if (Npc_HasEquippedArmor(other) == FALSE)
	&& (hero.guild == GIL_NONE) 
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_11"); //Oh - une chose encore. Commencez par vous acheter une tenue correcte auprès des fermiers.
		AI_Output	(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_12"); //Dans le cas contraire, vous risqueriez d'être pris pour un bandit? Voici quelques pièces.
		CreateInvItems (self, ItMi_Gold, 50);									
		B_GiveInvItems (self, other, ItMi_Gold, 50);	
	};
	
	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;

	if (MIS_Addon_Cavalorn_Letter2Vatras == 0)
	{
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_RUNNING;
	};

	Npc_ExchangeRoutine	(self,"Start");
	B_GivePlayerXP (XP_Addon_Cavalorn_KillBrago);
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);

	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

///////////////////////////////////////////////////////////////////////
//	Info BragoKilled
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_BragoKilled		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_BragoKilled_Condition;
	information	 = 	DIA_Addon_Cavalorn_BragoKilled_Info;

	important	 = 	TRUE;
};

func int DIA_Addon_Cavalorn_BragoKilled_Condition ()
{
	if 	(Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT")<500) 
	&& 	(MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING)
	&&	(C_BragoBanditsDead () == TRUE)//Joly:VORSICHT!!!!!muss als letztes Stehen
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Cavalorn_BragoKilled_08_00"); //Bon, une bonne chose de faite. Ha ! Ils n'auraient jamais dû me chercher des crosses.
	
	B_Addon_Cavalorn_VatrasBrief ();
	
};

///////////////////////////////////////////////////////////////////////
//	Info PCKilledBrago
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_PCKilledBrago		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information	 = 	DIA_Addon_Cavalorn_PCKilledBrago_Info;

	description	 = 	"Les bandits ne sont plus qu'un souvenir.";
};

func int DIA_Addon_Cavalorn_PCKilledBrago_Condition ()
{
	if 	(MIS_Addon_Cavalorn_KillBrago == 0)
	&&  (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Banditen))
	&&	(C_BragoBanditsDead () == TRUE) 	//Joly:VORSICHT!!!!!muss als letztes Stehen
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_PCKilledBrago_15_00"); //Les bandits ne sont plus qu'un souvenir.

	B_Addon_Cavalorn_VatrasBrief ();

};

///////////////////////////////////////////////////////////////////////
//	Info JUNGS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_JUNGS		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cavalorn_JUNGS_Condition;
	information	 = 	DIA_Addon_Cavalorn_JUNGS_Info;

	description	 = 	"Intéressante, cette armure que vous portez là...";
};

func int DIA_Addon_Cavalorn_JUNGS_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_HALLO))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_JUNGS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_JUNGS_15_00"); //Intéressante, cette armure que vous portez là... Vous ne faites plus partie des Ombres ?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_JUNGS_08_01"); //Les Ombres ? Elles n'existent plus depuis la chute de la Barrière.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_JUNGS_08_02"); //Dès l'instant où on a enfin pu quitter la Vallée des mines, je n'avais plus aucune raison de rester liées à elles.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_JUNGS_08_03"); //Maintenant, je travaille pour les Mages de l'eau. J'appartiens à l'Anneau de l'eau.
	
	SC_KnowsRanger = TRUE;

	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Cavalorn m'a indiqué qu'il appartient à une communauté qui se fait appeler l'Anneau de l'eau."); 

	Cavalorn_RangerHint = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Ring
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Ring		(C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 5;
	condition	= DIA_Addon_Cavalorn_Ring_Condition;
	information	= DIA_Addon_Cavalorn_Ring_Info;
	permanent 	= FALSE;
	description	= "Parlez-moi un peu de l'Anneau de l'eau !";
};
func int DIA_Addon_Cavalorn_Ring_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};
func void DIA_Addon_Cavalorn_Ring_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_Ring_15_00"); //Dites-m'en davantage sur l'Anneau de l'eau.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_01"); //Je n'ai pas vraiment le droit d'en parler...
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_02"); //Je peux simplement vous recommander de vous adresser à Vatras. Il est le représentant des Mages de l'eau de Khorinis.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_03"); //La meilleure chose serait encore d'aller lui parler. Dites-lui que vous venez de ma part.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Ring_08_04"); //Peut-être vous acceptera-t-il parmi nous. Nous avons grand besoin de nouvelles recrues de bonne volonté...
	B_LogEntry (TOPIC_Addon_RingOfWater,"Le Mage de l'eau Vatras pourra certainement m'en apprendre davantage sur l'Anneau de l'eau."); 
};
///////////////////////////////////////////////////////////////////////
//	Gegner
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Feinde (C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 6;
	condition	= DIA_Addon_Cavalorn_Feinde_Condition;
	information	= DIA_Addon_Cavalorn_Feinde_Info;
	permanent 	= FALSE;
	description	= "Mais vous et les vôtres étiez autrefois des ennemis des Mages de l'eau, non ?";
};
func int DIA_Addon_Cavalorn_Feinde_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};
func void DIA_Addon_Cavalorn_Feinde_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_Feinde_15_00"); //Mais vous et les vôtres étiez autrefois des ennemis des Mages de l'eau, non ?
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_01"); //Ces jours de démence sont désormais passés. Il n'y a plus ni 'nouveau camp', ni 'ancien camp'.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_02"); //Maintenant que la colonie pénitentiaire n'existe plus, chacun se bat pour sa propre survie.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_03"); //La plupart des anciens prisonniers sont toujours traqués comme des bêtes, à l'heure qu'il est.
	AI_Output (self, other, "DIA_Addon_Cavalorn_Feinde_08_04"); //Les Mages de l'eau ont pu faire commuer ma peine, et je suis maintenant libre de me déplacer à ma guise.
};
///////////////////////////////////////////////////////////////////////
//	Wo KdW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_KdWTask (C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 6;
	condition	= DIA_Addon_Cavalorn_KdWTask_Condition;
	information	= DIA_Addon_Cavalorn_KdWTask_Info;
	permanent 	= FALSE;
	description	= "Que font les Mages de l'eau maintenant ?";
};
func int DIA_Addon_Cavalorn_KdWTask_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_JUNGS))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Cavalorn_KdWTask_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_KdWTask_15_00"); //Que font les Mages de l'eau maintenant ?
	AI_Output (self, other, "DIA_Addon_Cavalorn_KdWTask_08_01"); //Ils préparent quelque chose d'important. Ç'a à voir avec une région inexplorée de cette île.
	AI_Output (other, self, "DIA_Addon_Cavalorn_KdWTask_15_02"); //Une région inexplorée ? Où peut-elle bien se trouver ?
	AI_Output (self, other, "DIA_Addon_Cavalorn_KdWTask_08_03"); //Je ne peux vous en dire plus. Allez parler à Vatras, à Khorinis.
};	

///////////////////////////////////////////////////////////////////////
//	Info BroughtLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_BroughtLetter		(C_INFO)
{
	npc		 = 	BAU_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information	 = 	DIA_Addon_Cavalorn_BroughtLetter_Info;

	description	 = 	"J'ai remis votre lettre à Vatras.";
};

func int DIA_Addon_Cavalorn_BroughtLetter_Condition ()
{
	if (MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_JUNGS))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_BroughtLetter_15_00"); //J'ai remis votre lettre à Vatras.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_BroughtLetter_08_01"); //Je n'en attendais pas moins. Soyez remercié.
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Ornament		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cavalorn_Ornament_Condition;
	information	 = 	DIA_Addon_Cavalorn_Ornament_Info;

	description	 = 	"Vous cherchez quelque chose ?";
};

func int DIA_Addon_Cavalorn_Ornament_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_HALLO))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_00"); //Vous recherchez quelque chose, semble-t-il ?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_01"); //Est-ce si évident ? Oui, les Mages de l'eau m'ont ordonné de rechercher un bijou depuis longtemps disparu.
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_02"); //C'est intéressant. J'ai reçu ce même ordre de Nefarius.

	if (SC_KnowsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_03"); //Vous appartenez donc à l'Anneau de l'eau.
		if (SC_IsRanger == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_04"); //Oui.
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_05"); //Pas encore, mais j'y travaille.
		};
	};
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_06"); //Vous m'en voyez ravi. Cela m'évitera de remplir cette mission en solitaire.
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Ornament_15_07"); //Avez-vous déjà trouvé un fragment du bijou ?
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_08"); //J'ai découvert l'endroit dans lequel nous devrions pouvoir en trouver un.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_09"); //Ce cercle de pierre pourrait être l'un des édifices dont m'a parlé Nefarius.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Ornament_08_10"); //Désormais, il nous suffit de trouver le mécanisme que nous avons pour mission de rechercher.
};
///////////////////////////////////////////////////////////////////////
//	Info Triggered
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Triggered		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_Triggered_Condition;
	information	 = 	DIA_Addon_Cavalorn_Triggered_Info;

	description	 = 	"J'ai activé le mécanisme.";
};

func int DIA_Addon_Cavalorn_Triggered_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ornament))
	&& (ORNAMENT_SWITCHED_FARM == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_Triggered_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_Triggered_15_00"); //J'ai essayé d'activer le mécanisme. Cela n'a eu aucun effet.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_01"); //Dans ce cas, les fermiers de Lobart avaient raison.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_02"); //Ils m'ont informé que l'un d'eux s'était déjà risqué à jouer avec l'une des pierres dans les environs.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_03"); //Alors, une sentinelle de pierre est apparue de nulle part et les a attaqués.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_04"); //Les fermiers ont appelé la milice, et les miliciens ont appelé les paladins qui se sont rendus sur place et ont anéanti le monstre.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_Triggered_08_05"); //J'ai déjà fouillé ce secteur en long et en large... S'il y avait un ornement ici, il est maintenant aux mains des paladins.
	
	Info_ClearChoices	(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice	(DIA_Addon_Cavalorn_Triggered, "Alors l'un de nous devra se rendre dans la haute ville.", DIA_Addon_Cavalorn_Triggered_Pal );
	Info_AddChoice	(DIA_Addon_Cavalorn_Triggered, "Alors je vais me rendre auprès d'eux et leur demander de me rendre le bijou.", DIA_Addon_Cavalorn_Triggered_OBack );
};
func void B_Cavalorn_Triggered_Wohin ()
{
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Triggered_Wohin_08_00"); //Je vais maintenant me mettre en route pour Khorinis. Nous nous reverrons auprès de Vatras.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Stadt");
	
	Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Ornament,"Les paladins dans le haut quartier de la ville détiennent l'un des fragments manquants du bijou."); 

	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_RUNNING;
	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack ()
{
	AI_UnequipArmor	(self);
	CreateInvItems (self, ITAR_BAU_L, 1);	
	Npc_RemoveInvItems	(self, ITAR_RANGER_Addon,	Npc_HasItems (self, ITAR_RANGER_Addon ) );
	Npc_RemoveInvItems	(self, ITAR_Fake_RANGER,	Npc_HasItems (self, ITAR_Fake_RANGER ) );
	AI_EquipBestArmor (self); 
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Triggered_OBack_15_00"); //Dans ce cas, je vais aller les voir et leur demander de me rendre le bijou.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Triggered_OBack_08_01"); //Bien.
	B_Cavalorn_Triggered_Wohin ();
};

func void DIA_Addon_Cavalorn_Triggered_Pal ()
{
	AI_UnequipArmor	(self);
	CreateInvItems (self, ITAR_BAU_L, 1);	
	Npc_RemoveInvItems	(self, ITAR_RANGER_Addon,	Npc_HasItems (self, ITAR_RANGER_Addon ) );
	Npc_RemoveInvItems	(self, ITAR_Fake_RANGER,	Npc_HasItems (self, ITAR_Fake_RANGER ) );
	AI_EquipBestArmor (self); 
	AI_Output			(other, self, "DIA_Addon_Cavalorn_Triggered_Pal_15_00"); //Alors l'un de nous devra se rendre dans la haute ville.
	AI_Output			(self, other, "DIA_Addon_Cavalorn_Triggered_Pal_08_01"); //Je n'ai pas le temps de m'occuper de cela. Vous devrez vous en charger.
	B_Cavalorn_Triggered_Wohin ();
};

///////////////////////////////////////////////////////////////////////
//	Info GotOrnaFromHagen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_GotOrnaFromHagen		(C_INFO)
{
	npc		 = 	Bau_4300_Addon_Cavalorn;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information	 = 	DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;

	description	 = 	"J'ai obtenu le bijou manquant de la main du seigneur Hagen.";
};

func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition ()
{
	if (Lord_Hagen_GotOrnament == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00"); //J'ai obtenu le bijou manquant de la main du seigneur Hagen.
	AI_Output	(self, other, "DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01"); //Vous voyez ? J'étais persuadé que les paladins le détenaient.
	B_GivePlayerXP (XP_Ambient);
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
};

// ************************************************************
// 			  				WannaLearn
// ************************************************************
instance DIA_Addon_Cavalorn_WannaLearn (C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 7;
	condition	= DIA_Addon_Cavalorn_WannaLearn_Condition;
	information	= DIA_Addon_Cavalorn_WannaLearn_Info;
	permanent 	= FALSE;
	description	= "Pouvez-vous m'enseigner quelque chose ?";
};

func int DIA_Addon_Cavalorn_WannaLearn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Hallo))
	&& (C_BragoBanditsDead () == TRUE)//Joly:VORSICHT!!!!!muss als letztes Stehen
		{
			return TRUE;
		};
};

func void DIA_Addon_Cavalorn_WannaLearn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_WannaLearn_15_00"); //Pouvez-vous m'apprendre quelque chose ?
	AI_Output (self, other, "DIA_Addon_Cavalorn_WannaLearn_08_01"); //Bien sûr... vous le savez. Bon sang, ils vous ont vraiment vidé de tout...
	AI_Output (self, other, "DIA_Addon_Cavalorn_WannaLearn_08_02"); //Vous ne vous souvenez vraiment plus de rien ?
	
	Cavalorn_Addon_TeachPlayer = TRUE;
	Log_CreateTopic (Topic_OutTeacher,LOG_NOTE);
	B_LogEntry (Topic_OutTeacher, LogText_Addon_Cavalorn_Teach);
};

// ************************************************************
// 			  				TEACH
// ************************************************************
var int Addon_Cavalorn_Merke_Bow;
var int Addon_Cavalorn_Merke_1h;
// ------------------------------------------------------

instance DIA_Addon_Cavalorn_TEACH (C_INFO)
{
	npc		 	= BAU_4300_Addon_Cavalorn;
	nr		 	= 8;
	condition	= DIA_Addon_Cavalorn_TEACH_Condition;
	information	= DIA_Addon_Cavalorn_TEACH_Info;
	permanent 	= TRUE;
	description	= "Je veux que vous m'enseigniez toutes vos compétences.";
};

func int DIA_Addon_Cavalorn_TEACH_Condition ()
{
	if (Cavalorn_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func VOID DIA_Addon_Cavalorn_TEACH_Choices ()
{
	Info_ClearChoices (DIA_Addon_Cavalorn_Teach);
	Info_AddChoice (DIA_Addon_Cavalorn_Teach, DIALOG_BACK, DIA_Addon_Cavalorn_Teach_Back);

	if (Npc_GetTalentSkill (other,NPC_TALENT_SNEAK) == FALSE) 
			{
				Info_AddChoice		(DIA_Addon_Cavalorn_Teach, B_BuildLearnString("Discrétion"	, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1))		,DIA_Addon_Cavalorn_Teach_Sneak);
			};

	Info_AddChoice (DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	 ,DIA_Addon_Cavalorn_Teach_Bow_1);
	Info_AddChoice (DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5) ,DIA_Addon_Cavalorn_Teach_Bow_5);
	Info_AddChoice (DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))	 ,DIA_Addon_Cavalorn_Teach_1H_1);
	Info_AddChoice (DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)*5)	 ,DIA_Addon_Cavalorn_Teach_1H_5);
	
};
func void DIA_Addon_Cavalorn_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Addon_Cavalorn_TEACH_15_00"); //Je veux que vous m'enseigniez toutes vos compétences.
	AI_Output (self, other, "DIA_Addon_Cavalorn_TEACH_08_01"); //Bien sûr. Que voulez-vous apprendre ?
	
	Addon_Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Addon_Cavalorn_Merke_1h =  other.HitChance[NPC_TALENT_1H];
	
	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_Sneak ()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
		{
			AI_Output			(self, other, "DIA_Addon_Cavalorn_Teach_Sneak_08_00"); //Si vous portez des semelles souples, vous avez plus de chances de vous approcher de vos adversaires sans vous faire remarquer.
		};

	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_BOW_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 90);
	
	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_BOW_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 90);
	
	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 30);
	
	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 30);

	DIA_Addon_Cavalorn_TEACH_Choices ();
};

FUNC VOID DIA_Addon_Cavalorn_Teach_Back ()
{
	if (Addon_Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	|| (Addon_Cavalorn_Merke_1h  < other.HitChance[NPC_TALENT_1H])
	{
		AI_Output (self ,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00"); //C'est mieux? Vous avez oublié bien des choses depuis cette époque, mais ça vous reviendra.
	};

	Info_ClearChoices (DIA_Addon_Cavalorn_Teach);
};

















