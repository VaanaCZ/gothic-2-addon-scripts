// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thekla_EXIT (C_INFO)
{
	npc         = BAU_913_Thekla;
	nr          = 999;
	condition   = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Thekla_HALLO		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 1;
	condition	= DIA_Thekla_HALLO_Condition;
	information	= DIA_Thekla_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Thekla_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Thekla_HALLO_17_00"); //Que faites-vous dans ma cuisine ?
};

// ************************************************************
// 			  				   Lecker
// ************************************************************
instance DIA_Thekla_Lecker		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 2;
	condition	= DIA_Thekla_Lecker_Condition;
	information	= DIA_Thekla_Lecker_Info;
	permanent 	= FALSE;
	description	= "Quelque chose sent tr�s bon ici !";
};

func int DIA_Thekla_Lecker_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //Il y a quelque chose qui sent tr�s bon ici.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //Oh ! Je vous vois venir ! Vous �tes comme tous les autres qui ne cessent de venir ici !
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Ils essayent d'abord de vous amadouer et puis quand on a besoin d'eux, il n'y a plus personne !
};

// ************************************************************
// 			  				   Hunger
// ************************************************************
var int Thekla_GaveStew;
// ---------------------

instance DIA_Thekla_Hunger		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 3;
	condition	= DIA_Thekla_Hunger_Condition;
	information	= DIA_Thekla_Hunger_Info;
	permanent 	= FALSE;
	description	= "Je suis affam� !";
};

func int DIA_Thekla_Hunger_Condition ()
{
	if (Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //Je suis affam� !
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //Je ne sers pas de repas aux vagabonds. Je ne donne � manger qu'� ceux qui travaillent.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //(m�prisante) Et � cette racaille de mercenaires, naturellement.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //Tenez, votre bouffe.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //On ne sert pas la milice ici.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //Comment pourrais-je refuser quoi que ce soit � un repr�sentant d'Innos ?
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	};
};

// ************************************************************
// 			  				   Arbeit
// ************************************************************

instance DIA_Thekla_Arbeit		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_Arbeit_Condition;
	information	= DIA_Thekla_Arbeit_Info;
	permanent 	= FALSE;
	description	= "Je cherche du travail.";
};

func int DIA_Thekla_Arbeit_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Arbeit_15_00"); //Je cherche du travail...
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //Vous voulez travailler � la ferme ?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //Seul Onar peut prendre la d�cision. La ferme lui appartient ainsi que toute la vall�e.
};

// ************************************************************
// 			  				   WannaJoin
// ************************************************************

instance DIA_Thekla_WannaJoin		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 5;
	condition	= DIA_Thekla_WannaJoin_Condition;
	information	= DIA_Thekla_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "En fait, j'envisageais de rejoindre les mercenaires...";
};

func int DIA_Thekla_WannaJoin_Condition ()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //En fait, j'envisageais de me joindre aux mercenaires.
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //Ainsi vous �tes encore un de ces gars de la colonie p�nitentiaire ?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //J'aurais d� m'en douter ! Laissez-moi tranquille ! Vous �tes suffisamment nombreux comme �a dans le coin !
};

// ************************************************************
// 			  				   Schlafen
// ************************************************************

instance DIA_Thekla_Schlafen		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 6;
	condition	= DIA_Thekla_Schlafen_Condition;
	information	= DIA_Thekla_Schlafen_Info;
	permanent 	= FALSE;
	description	= "J'ai besoin d'un endroit o� dormir.";
};

func int DIA_Thekla_Schlafen_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Schlafen_15_00"); //J'ai besoin d'un endroit o� dormir.
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Ne songez m�me pas � dormir dans ma cuisine. Allez vous trouver une place dans la grange.
};
		
// ************************************************************
// 			  				   Problem
// ************************************************************

instance DIA_Thekla_Problem		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Problem_Condition;
	information	= DIA_Thekla_Problem_Info;
	permanent 	= FALSE;
	description	= "Quel est votre probl�me avec les mercenaires ?";
};

func int DIA_Thekla_Problem_Condition ()
{
	if (kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Problem_15_00"); //Quel est votre probl�me avec les mercenaires ?
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //Ah ! Ces cr�tins me tapent sur les nerfs ! Surtout Sylvio et son gros copain Bullco.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Ces deux-l� restent assis dans leur coin depuis des jours et ils ne cessent de m'ennuyer.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //La soupe est trop chaude, la viande est trop dure, etc.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //Et pourquoi ne faites-vous rien pour r�gler le probl�me ?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //Et que suis-je cens�e faire, monsieur Je-Sais-Tout ? Les taper avec mon rouleau � p�tisserie ? Je peux le faire aux fermiers mais ces b�tards de mercenaires ripostent.
	};
};

// ************************************************************
// 			  				   Manieren
// ************************************************************

instance DIA_Thekla_Manieren		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Manieren_Condition;
	information	= DIA_Thekla_Manieren_Info;
	permanent 	= FALSE;
	description	= "Vous voulez que je leur enseigne les bonnes mani�res ?";
};

func int DIA_Thekla_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thekla_Problem)) 
	&& (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //Voulez-vous que je leur apprenne les bonnes mani�res ?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Vous feriez mieux d'�viter, ch�ri. D'apr�s ce que je sais, Sylvio a une armure magique. Il ne peut �tre vaincu.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //Et en ce qui concerne Bullco ?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Ce type est aussi fort qu'un b�uf. Jusqu'� pr�sent, il a �tal� tous ceux qui leur ont cherch� des noises, � lui ou � Sylvio.
};
		
// ************************************************************
// 			  				  After Fight
// ************************************************************

instance DIA_Thekla_AfterFight (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_AfterFight_Condition;
	information	= DIA_Thekla_AfterFight_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Thekla_AfterFight_Condition ()
{
	if (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info ()
{
	if (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //Vous avez bien fait de donner � Bullco ce qu'il m�ritait, ch�ri.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //Cela a d� �tre �puisant de molester ce gros porc.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //Vous vous �tes pris une sacr�e racl�e, ch�ri.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //Je ne vous avais pas pr�venu ? Maintenant vous savez ce que je voulais dire.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Je suis heureux de voir que �a vous amuse.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //Ne faites pas cette t�te-l�. Vous n'�tes pas le premier � vous faire rosser par cette vermine.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Tenez, mangez un morceau pour reprendre des forces.
	B_GiveInvItems (self, other, ItFo_XPStew, 1);	
	Thekla_GaveStew = TRUE;
};

// ************************************************************
// 			  				 PaketSuccess 
// ************************************************************
instance DIA_Thekla_SagittaPaket (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_SagittaPaket_Condition;
	information	= DIA_Thekla_SagittaPaket_Info;
	permanent 	= TRUE;
	description	= "Voici le paquet de Sagitta.";
};

func int DIA_Thekla_SagittaPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_TheklasPaket))
	&& (MIS_Thekla_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info ()
{
	B_GiveInvItems (other, self, ItMi_TheklasPaket, 1);
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //Voici le paquet de Sagitta.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //Merci beaucoup. Apr�s tout, vous savez vous rendre utile.
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_TheklasPaket);		
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;
// ------------------------

instance DIA_Thekla_PERM		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 900;
	condition	= DIA_Thekla_PERM_Condition;
	information	= DIA_Thekla_PERM_Info;
	permanent	= TRUE;
	description	= "Puis-je avoir encore un peu de votre rago�t ?";
};
func int DIA_Thekla_PERM_Condition()
{
	if (Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //Puis-je avoir encore un peu de rago�t ?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //Je n'en ai pas pour l'instant.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //M�me pas un tout petit peu ?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //Non.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //Puis-je l�cher le plat alors ?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //Vous allez arr�ter oui !
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Si vous aimez tant mon rago�t, il va falloir le m�riter.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //Quoi ?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Allez voir Sagitta, la gu�risseuse qui vit derri�re la ferme de S�kob, et ramenez-moi un paquet de ses herbes.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Si vous me rapportez les herbes, je vous ferai du rago�t.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Si j'apporte � Th�kla les herbes de la gu�risseuse Sagitta, elle me cuisinera un autre civet. Sagitta vit derri�re la ferme de S�kob.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //Tr�s bien, je vais �tre gentille. Tenez. Comme �a vous ne mourrez pas de faim sous mes yeux.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //H� h� h� ! Ne soyez pas aussi avide ! Je vous le ferai savoir quand j'aurai autre chose � vous faire faire.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //Et ALORS vous aurez encore du rago�t, compris ?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //J'ai entendu dire que vous aviez aid� Bennet � sortir de prison. Beau travail, mon gar�on.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Ces b�tards de miliciens ont mis Bennet au trou.
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Rendez-moi service et faites-le sortir de l�, voulez-vous ? Pendant ce temps je vais vous pr�parer un d�licieux rago�t.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //Je n'en ai plus. Revenez plus tard.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Vous �tes toujours affam�, n'est pas ? A quoi passez-vous donc vos journ�es ?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //Je me suis occup� de quelques dragons.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //Oh ! Alors je crois qu'il est l'heure de d�guster un bon vieux rago�t revigorant.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //�a y est. Plus de rago�t.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //Pas d'herbes, pas de rago�t, compris ?
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thekla_PICKPOCKET (C_INFO)
{
	npc			= BAU_913_Thekla;
	nr			= 900;
	condition	= DIA_Thekla_PICKPOCKET_Condition;
	information	= DIA_Thekla_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Thekla_PICKPOCKET_Condition()
{
	C_Beklauen (53, 60);
};
 
FUNC VOID DIA_Thekla_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thekla_PICKPOCKET);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_BACK 		,DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};
	
func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};























