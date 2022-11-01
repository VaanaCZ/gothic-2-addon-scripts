///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Vino_EXIT   (C_INFO)
{
	npc         = BAU_952_Vino;
	nr          = 999;
	condition   = DIA_Vino_EXIT_Condition;
	information = DIA_Vino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Vino_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Vino_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//							Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_HALLO		(C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 1;
	condition	= DIA_Vino_HALLO_Condition;
	information	= DIA_Vino_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
	
};
func int DIA_Vino_HALLO_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Vino_HALLO_15_00"); //Et comment va le travail ?
	AI_Output (self, other, "DIA_Vino_HALLO_05_01"); //Comme toujours. Beaucoup à faire, pas assez d'argent et, si la malchance continue, les orques arriveront demain et brûleront notre ferme.
	
	if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_HALLO_05_02"); //Les paladins du roi occupent toute la ville. Mais je doute qu'ils daignent bouger leur postérieur pour venir ici quand les orques attaqueront.
		};
};

///////////////////////////////////////////////////////////////////////
//						Suche Arbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_SeekWork		(C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 1;
	condition	= DIA_Vino_SeekWork_Condition;
	information	= DIA_Vino_SeekWork_Info;
	permanent 	= FALSE;
	description	= "Puis-je vous aider ? Je cherche du travail.";
	
};
func int DIA_Vino_SeekWork_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW)
	||  Npc_KnowsInfo (other, DIA_Lobart_KLEIDUNG))
	&& (!Npc_IsDead (Lobart))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Vino_SeekWork_15_00"); //Puis-je vous aider ? Je cherche du travail.

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_01"); //Vous vous y connaissez en travaux des champs ?
		AI_Output (other, self, "DIA_Vino_SeekWork_15_02"); //Qu'y a-t-il à savoir ?
		AI_Output (self, other, "DIA_Vino_SeekWork_05_03"); //Ah ! Dans ce cas... Je crois qu'on s'en sortira, merci.
		
		if (!Npc_IsDead(Lobart))
		{
			AI_Output (self, other, "DIA_Vino_SeekWork_05_04"); //Si vous voulez travailler pour Lobart en tant que journalier, je me dois de vous mettre en garde. Il paie très mal.
		
			if ( (Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == TRUE) || (Npc_HasItems (lobart, itar_bau_l) > 0) )
			&& (Lobart_Kleidung_Verkauft == FALSE)
			&& ( (Npc_KnowsInfo (other, DIA_Lobart_KLEIDUNG)) || (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW)) )
			{
				AI_Output (other, self, "DIA_Vino_SeekWork_15_05"); //Il m'a proposé de me vendre des vêtements propres à bas prix si je l'aidais à la ferme.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_06"); //Hum. Je n'ai rien à vous faire faire mais vous pourriez apporter à boire pour mes gars et moi.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_07"); //Dégotez-moi une bouteille de vin et je dirai à Lobart que vous m'avez bien aidé (rire moqueur).
				
				MIS_Vino_Wein = LOG_RUNNING;
				
				Log_CreateTopic (TOPIC_Vino,LOG_MISSION);
				Log_SetTopicStatus (TOPIC_Vino,LOG_RUNNING);
				B_LogEntry (TOPIC_Vino,"Si j'apporte à Vino une bouteille de vin, il dira à Lobart que je l'ai aidé.");
				
			}
			else
			{	
				AI_Output (self, other, "DIA_Vino_SeekWork_05_08"); //Mais je ne vous ai rien dit, compris ?
			};
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_09"); //Je ne pense pas. Quelqu'un de votre rang n'accepterait jamais de faire les basses besognes que je pourrais lui confier.
	};
};

///////////////////////////////////////////////////////////////////////
//						Wein bringen
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_BringWine		(C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 1;
	condition	= DIA_Vino_BringWine_Condition;
	information	= DIA_Vino_BringWine_Info;
	permanent 	= FALSE;
	description	= "Voici votre vin.";
	
};
func int DIA_Vino_BringWine_Condition ()
{
	if (MIS_Vino_Wein == LOG_RUNNING)
	&& (Npc_HasItems (other, itfo_wine) > 0)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_BringWine_Info ()
{
	AI_Output (other, self, "DIA_Vino_BringWine_15_00"); //Voici votre vin.
	B_GiveInvItems (other,self, itfo_wine, 1);
	AI_Output (self, other, "DIA_Vino_BringWine_05_01"); //Je préfère ne pas vous demander où vous l'avez eu, hein ? (rires) Qu'importe d'ailleurs.
	if (!Npc_IsDead (Lobart))
	{
		AI_Output (self, other, "DIA_Vino_BringWine_05_02"); //Merci tout de même.

		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_BringWine_05_03"); //Je ne dirai que du bien de vous à Lobart.
		};
	};
	
	MIS_Vino_Wein = LOG_SUCCESS;
	B_GivePlayerXP(XP_VinoWein);
	
	
};


///////////////////////////////////////////////////////////////////////
//						will in die Stadt 
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_ToTheCity (C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 3;
	condition	= DIA_Vino_ToTheCity_Condition;
	information	= DIA_Vino_ToTheCity_Info;
	permanent 	= FALSE;
	description	= "Je me rends en ville.";
};

func int DIA_Vino_ToTheCity_Condition ()
{
	if (hero.guild == GIL_NONE)
		{
				return TRUE;
		};
};

func void DIA_Vino_ToTheCity_Info ()
{
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_00"); //Je me rends en ville.
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_01"); //Et ?
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_02"); //Pouvez-vous me dire quoi que ce soit d'intéressant au sujet de la ville ?
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_03"); //Nan. Mais Maleth va en ville de temps en temps. Peut-être que lui saura... je veux dire des choses qui peuvent vous intéresser.
};


///////////////////////////////////////////////////////////////////////
//								Gerüchte (PERM)
///////////////////////////////////////////////////////////////////////

// --------------------------
	var int Vino_Gossip_Orks;
	var int Vino_Gossip_Bugs;
// --------------------------

instance DIA_Vino_PERM (C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 10;
	condition	= DIA_Vino_PERM_Condition;
	information	= DIA_Vino_PERM_Info;
	permanent 	= TRUE;
	description	= "Y a-t-il des nouvelles intéressantes ?";
};
func int DIA_Vino_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Vino_HALLO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_PERM_Info ()
{
	AI_Output (other, self, "DIA_Vino_PERM_15_00"); //Y a-t-il des nouvelles intéressantes ?
	
	if (Vino_Gossip_Orks == FALSE)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_01"); //Je jurerais avoir vu un orque à la lisière des bois, il y a deux jours.
		AI_Output (self, other, "DIA_Vino_PERM_05_02"); //Depuis, je garde un œil ouvert la nuit.
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
	}
	else if (Vino_Gossip_Bugs == FALSE)
	&& 		(MIS_AndreHelpLobart == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_03"); //Ces grosses bestioles purulentes deviennent véritablement nuisibles. Il y en a partout et elles dévorent tout si vous ne faites pas attention.
		AI_Output (self, other, "DIA_Vino_PERM_05_04"); //Il y a quelques jours, j'étais allongé dans l'herbe, en train de rêvasser. J'allais m'assoupir quand je me suis rendu compte qu'une de ces saletés s'était attaquée à ma chaussure !
		AI_Output (self, other, "DIA_Vino_PERM_05_05"); //Vous auriez dû voir comment j'ai détalé. Depuis je n'arrive plus à dormir tranquille.
		Vino_Gossip_Bugs = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_06"); //A part ce que je vous ai déjà dit ? Non.
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Vino_KAP3_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP3_EXIT_Condition;
	information	= DIA_Vino_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMTAMSTART
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_DMTAMSTART		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	31;
	condition	 = 	DIA_Vino_DMTAMSTART_Condition;
	information	 = 	DIA_Vino_DMTAMSTART_Info;
	permanent	 = 	TRUE;

	description	 = 	"Comment ça va pour vous ?";
};

func int DIA_Vino_DMTAMSTART_Condition ()
{
	if (Kapitel == 3)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
var int DIA_Vino_DMTAMSTART_OneTime;
func void DIA_Vino_DMTAMSTART_Info ()
{
	AI_Output			(other, self, "DIA_Vino_DMTAMSTART_15_00"); //Et comment ça va pour vous ?
	
	if (FoundVinosKellerei == TRUE)
	&& (DIA_Vino_DMTAMSTART_OneTime == FALSE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_01"); //C'est la merde. La milice a trouvé ma distillerie cachée.
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_02"); //J'espère que personne ne découvrira qu'elle m'appartenait.
		B_GivePlayerXP (XP_AmbientKap3);
		DIA_Vino_DMTAMSTART_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_03"); //Ces bâtards avec les capuchons noirs sont partout. Quelqu'un devrait leur claquer le beignet.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Obesessed
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_Obesessed		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	32;
	condition	 = 	DIA_Vino_Obesessed_Condition;
	information	 = 	DIA_Vino_Obesessed_Info;
	permanent	 = 	TRUE;

	description	 = 	"Qu'est-ce qui ne va pas ?";
};

func int DIA_Vino_Obesessed_Condition ()
{
	if 	(NpcObsessedByDMT_Vino == FALSE)
	&& (Kapitel >= 3)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Vino_Obesessed_Info ()
{
	if (Npc_IsDead(DMT_Vino1))
	&& (Npc_IsDead(DMT_Vino2))
	&& (Npc_IsDead(DMT_Vino3))
	&& (Npc_IsDead(DMT_Vino4))
	{
	B_NpcObsessedByDMT (self);
	}
	else
	{
	AI_Output			(other, self, "DIA_Vino_Obesessed_15_00"); //Qu'est-ce qui ne va pas ?
	AI_Output			(self, other, "DIA_Vino_Obesessed_05_01"); //(il murmure) Fichez le camp ou ils vont me tuer.
	AI_StopProcessInfos (self);
	DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
	DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
	DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
	DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_Heilung		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	55;
	condition	 = 	DIA_Vino_Heilung_Condition;
	information	 = 	DIA_Vino_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous n'êtes plus vous-même.";
};

func int DIA_Vino_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Vino == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& ((Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07")<4000) == FALSE)
	 {
				return TRUE;
	 };
};
var int DIA_Vino_Heilung_oneTime;
func void DIA_Vino_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Vino_Heilung_15_00"); //Vous n'êtes pas vous-même.
	AI_Output			(self, other, "DIA_Vino_Heilung_05_01"); //Ma tête... Je ne peux plus le supporter.

	if (DIA_Vino_Heilung_oneTime == FALSE)
	{
		AI_Output			(other, self, "DIA_Vino_Heilung_15_02"); //Vous devriez aller au monastère. Pyrokar, le plus grand des Magiciens du feu, pourrait vous aider.
		AI_Output			(self, other, "DIA_Vino_Heilung_05_03"); //Vous croyez ? Très bien, je vais essayer.
		B_NpcClearObsessionByDMT (self);
		B_StartOtherRoutine  (Vino,"Kloster"); 
		
		B_LogEntry (TOPIC_DEMENTOREN,"Vino est possédé. Je l'ai envoyé au monastère pour être soigné. J'espère qu'il y arrivera en un seul morceau."); 
	
		B_GivePlayerXP (XP_VinoFreeFromDMT);
		DIA_Vino_Heilung_oneTime = TRUE;
	};
};


//#####################################################################
//##
//##	
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Vino_KAP4_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP4_EXIT_Condition;
	information	= DIA_Vino_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};



///////////////////////////////////////////////////////////////////////
//	Info perm4Obsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_PERM4OBSESSED		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	41;
	condition	 = 	DIA_Vino_PERM4OBSESSED_Condition;
	information	 = 	DIA_Vino_PERM4OBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"Comment allez-vous ?";
};

func int DIA_Vino_PERM4OBSESSED_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (NpcObsessedByDMT_Vino == TRUE) 
	&& (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07")<4000)
	{
		return TRUE;
	};
};

var int DIA_Vino_PERM4OBSESSED_XP_oneTime;

func void DIA_Vino_PERM4OBSESSED_Info ()
{
	AI_Output			(other, self, "DIA_Vino_PERM4OBSESSED_15_00"); //Comment allez-vous ?
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_01"); //Je vais déjà mieux. Je crois que les gars là-bas peuvent m'aider. Mais j'ai encore la tête qui tourne.

	if (DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_02"); //Mais je dois dire que leur vin est le meilleur que j'ai jamais bu.
	B_GivePlayerXP (XP_Ambient);
	DIA_Vino_PERM4OBSESSED_XP_oneTime = TRUE; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm45und6
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_PERM45UND6		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	42;
	condition	 = 	DIA_Vino_PERM45UND6_Condition;
	information	 = 	DIA_Vino_PERM45UND6_Info;
	permanent	 = 	TRUE;

	description	 = 	"Des nouvelles ?";
};

func int DIA_Vino_PERM45UND6_Condition ()
{
	if (Kapitel >= 4)	
	&& (hero.guild != GIL_KDF)
	&& (NpcObsessedByDMT_Vino == FALSE) 
		{
			return TRUE;
		};
};

func void DIA_Vino_PERM45UND6_Info ()
{
	AI_Output			(other, self, "DIA_Vino_PERM45UND6_15_00"); //Des nouvelles ?

	if (hero.guild == GIL_PAL)
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_01"); //Le nombre d'orques dans la région ne cesse de croître de manière inquiétante.
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_02"); //Vous autres les paladins, vous allez les massacrer, n'est-ce pas ?
	}
	else	//hero.guild == GIL_DJG
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_03"); //Je crains que bientôt nous devions abandonner nos fermes pour nous joindre à vous, les mercenaires, à la ferme d'Onar.
	};
	
	if (FoundVinosKellerei == TRUE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_04"); //Malheureusement, la milice a découvert ma distillerie. J'espère que je ne me ferai pas attraper.
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Vino_KAP5_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP5_EXIT_Condition;
	information	= DIA_Vino_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Vino_KAP6_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP6_EXIT_Condition;
	information	= DIA_Vino_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Vino_PICKPOCKET (C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 900;
	condition	= DIA_Vino_PICKPOCKET_Condition;
	information	= DIA_Vino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Vino_PICKPOCKET_Condition()
{
	C_Beklauen (34, 60);
};
 
FUNC VOID DIA_Vino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Vino_PICKPOCKET);
	Info_AddChoice		(DIA_Vino_PICKPOCKET, DIALOG_BACK 		,DIA_Vino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Vino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Vino_PICKPOCKET_DoIt);
};

func void DIA_Vino_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Vino_PICKPOCKET);
};
	
func void DIA_Vino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Vino_PICKPOCKET);
};























































