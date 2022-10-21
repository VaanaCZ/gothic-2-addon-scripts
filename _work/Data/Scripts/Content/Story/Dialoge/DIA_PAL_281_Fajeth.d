FUNC INT C_SnapperDeath()
{
	if  Npc_IsDead(NewMine_Snapper1) 
	&& 	Npc_IsDead(NewMine_Snapper2)
	&& 	Npc_IsDead(NewMine_Snapper3)
	&& 	Npc_IsDead(NewMine_Snapper4)
	&& 	Npc_IsDead(NewMine_Snapper5)
	&& 	Npc_IsDead(NewMine_Snapper6)
	&& 	Npc_IsDead(NewMine_Snapper7)
	&& 	Npc_IsDead(NewMine_Snapper8)
	{
		return TRUE;
	}; 

};
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fajeth_EXIT   (C_INFO)
{
	npc         = PAL_281_Fajeth;
	nr          = 999;
	condition   = DIA_Fajeth_EXIT_Condition;
	information = DIA_Fajeth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

/* 
	Seit einiger Zeit suchen wir in diesem verfluchten Gebiet eine Stelle, die noch erzhaltiges Gestein enthält, 
	nicht ständig von Orkpatroullien heimgesucht wird, wo die dauernden Drachenangriffe ausbleiben!
	Wir sind völlig verdreckt und ausgehungert, haben unzählige Kämpfe ausgetragen 
	und haben endlich hier den Funken einer Hoffnung gefunden bei diesem dreckigen Loch in der Erde dort drüben unseren praktisch unmöglichen Auftrag zu erledigen.
	Und da kommt einer wie du daher und besitzt die Frechheit uns zu sagen, wir seien überfällig! Entweder bist du völlig verrückt oder einfach nur unverschämt!
*/
///////////////////////////////////////////////////////////////////////	
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_First		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_First_Condition;
	information	 = 	DIA_Fajeth_First_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_First_Condition ()
{
	if (Garond.aivar[AIV_TalkedToPlayer] == FALSE) 
	{
			return TRUE;
	};
};
func void DIA_Fajeth_First_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_First_12_00"); //Qui êtes-vous et que faites-vous ici ?
	AI_Output (other, self, "DIA_Fajeth_First_15_01"); //Je voyage sur ordre du seigneur Hagen.
	AI_Output (self, other, "DIA_Fajeth_First_12_02"); //Dans ce cas, vous devriez essayer de rejoindre le château. C'est là que se trouve le commandant Garond, qui dirige notre expédition.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Hallo		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Hallo_Condition;
	information	 = 	DIA_Fajeth_Hallo_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_Hallo_Condition ()
{
	if (MIS_ScoutMine == LOG_RUNNING) 
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_00"); //D'où venez-vous ?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_01"); //Je suis ici sur ordre de Garond.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_02"); //Très bien. Nous avons grand besoin de renforts.
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_03"); //Je ne suis pas ici pour vous aider.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_04"); //Non ? Dans ce cas, pourquoi êtes-vous là ?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_05"); //Ma mission consiste à déterminer la quantité de minerai que vous avez extraite jusque-là.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_06"); //Votre présence est source de confiance pour mes hommes et moi-même, honoré magicien.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_07"); //Cela nous serait une grande aide que vous acceptiez d'utiliser vos pouvoirs divins pour nous prêter assistance.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Que puis-je faire pour vous ?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ma mission est plus urgente.",DIA_Fajeth_Hallo_KDFNein);	
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_08"); //Ma mission consiste à faire le maximum pour extraire le minerai et le protéger.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_09"); //Cela inclut le fait de réquisitionner des hommes, si nécessaire. Vous êtes au service d'Innos, aussi devez-vous obéir à mes ordres.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Que puis-je faire pour vous ?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"J'ai déjà des ordres que je tiens de Garond.",DIA_Fajeth_Hallo_MILNein);	
	}
	else //GIL_SLD
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_10"); //Ecoutez, j'ignore pourquoi Garond m'envoie un mercenaire, mais il ne l'a sans doute pas fait sans raison.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_11"); //Avant que je ne vous renvoie vers lui, vous allez accomplir une mission pour moi.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Tout a un prix.",DIA_Fajeth_Hallo_SLDJa);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Non, je n'ai pas le temps...",DIA_Fajeth_Hallo_SLDNein);	
	};
}; 
FUNC VOID DIA_Fajeth_Hallo_Tun () //Mission
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //Que puis-je pour vous ?
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //Cela fait plusieurs jours qu'une horde de saurinides tourne autour de notre campement. On dirait qu'ils attendent juste l'occasion de nous attaquer.
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //Je ne sais pas ce qu'ils attendent au juste mais, tant qu'ils seront là, nous n'aurons pas la paix.

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //Ce Fed est terrifié par ces sales bêtes, et son humeur négative se propage chez les autres détenus.
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //Qui faudrait-il que j'envoie pour se charger de cela ? Bilgon ? Lui aussi est dans un triste état.
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //Tengron ? Il sait se battre, d'accord, mais il n'est pas assez rusé.
	};
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //Il n'y a que vous qui puissiez vous charger de cette tâche. Traquez ces satanées bestioles et tuez-les.
	
	Wld_InsertNpc	(NewMine_Snapper7,"OW_PATH_333");	//Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc	(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc	(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");	

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic (TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FajethKillSnapper,LOG_RUNNING);
	B_LogEntry (TOPIC_FajethKillSnapper,"Fajeth m'a demandé de chasser les saurinides qui rôdent depuis des jours près du camp.");
	
	Info_ClearChoices (DIA_Fajeth_Hallo);
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
FUNC VOID DIA_Fajeth_Hallo_KDFNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //Ma mission prend le pas sur cette tâche. Je ne peux pas vous aider.
	AI_Output (self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //Je comprends, honoré magicien. Demandez-moi tout ce que vous voulez savoir.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
FUNC VOID DIA_Fajeth_Hallo_MILNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //J'ai déjà reçu des ordres de la part de Garond.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //Et vous les exécuterez dès que je vous renverrai au château.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //Mais en attendant, je ne veux rien vous entendre dire d'autres que 'A vos ordres', c'est bien compris ?
};
FUNC VOID DIA_Fajeth_Hallo_SLDJa ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //Tout s'achète. Payez-moi et j'y réfléchirai.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //Je ne suis pas habitué à faire affaire avec les mercenaires et je déteste marchander.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //Mais, pour preuve de ma bonne volonté, j'accepte de vous verser 100 pièces d'or si vous travaillez pour moi.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //C'est d'accord ?
	Fajeth_Pay = TRUE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Que puis-je faire pour vous ?",DIA_Fajeth_Hallo_Tun);	
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"Non, je n'ai pas le temps...",DIA_Fajeth_Hallo_SLDNein);	
};
FUNC VOID DIA_Fajeth_Hallo_SLDNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //Non. Je n'ai pas le temps de me charger de votre problème.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //Vous refusez de vous enrichir aussi facilement ? Je n'aurais jamais cru ça de la part d'un mercenaire.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //Comme vous n'avez pas l'intention de nous aider, je vous suggère de poser vos questions et de me débarrasser le plancher sans perdre un instant.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
///////////////////////////////////////////////////////////////////////	
//	Info Leader
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Leader		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Leader_Condition;
	information	 = 	DIA_Fajeth_Leader_Info;
	permanent 	 =  FALSE;
	description	 =  "J'ai tué le chef de meute.";
};
func int DIA_Fajeth_Leader_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER) 
  	&&  Npc_IsDead(NewMine_LeadSnapper) 
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
			return TRUE;
	};
};
func void DIA_Fajeth_Leader_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Leader_15_00"); //J'ai tué le chef de la meute.
	AI_Output (self, other, "DIA_Fajeth_Leader_12_01"); //Bien. Sans chef, ils sont nettement moins dangereux. Ils ne devraient plus s'en prendre à nous.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_Leader_12_02"); //Tenez, voici votre or, comme convenu.
		B_GiveInvItems (self, other, ItMi_Gold,100); 
	};
	
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
		
		
};
///////////////////////////////////////////////////////////////////////
//	Info SNAPPER_Killed
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_SNAPPER_KILLED		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_SNAPPER_KILLED_Condition;
	information	 = 	DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent	 = 	TRUE;
	description	 = 	"C'en est fait des saurinides.";
};

func int DIA_Fajeth_SNAPPER_KILLED_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	&& (C_SnapperDeath() == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_SNAPPER_KILLED_Info ()
{
 		
	AI_Output (hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //Je me suis chargé des saurinides.
	AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //Beau travail. Nous devrions être capable de nous occuper des autres créatures qui nous menacent.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //Vous avez bien mérité votre récompense. Voici les 100 pièces d'or prévues.
		B_GiveInvItems (self, other, ItmI_Gold,100); 
	};					
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
};
///////////////////////////////////////////////////////////////////////
//	Info Running
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Running		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Running_Condition;
	information	 = 	DIA_Fajeth_Running_Info;
	permanent	 =  TRUE;
	description  =  "Comment va le moral de vos hommes ?";
};

func int DIA_Fajeth_Running_Condition ()
{
	if  (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Running_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Running_15_00"); //Comment va le moral de vos hommes ?
	AI_Output (self, other, "DIA_Fajeth_Running_12_01"); //Vous voulez vraiment le savoir ? Ils sont tellement terrifiés qu'ils ne peuvent presque plus travailler.
	AI_Output (self, other, "DIA_Fajeth_Running_12_02"); //Occupez-vous de ces saurinides ou mes hommes vont finir par craquer !
};
///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_BELOHNUNG		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	3;	
	condition	 = 	DIA_Fajeth_BELOHNUNG_Condition;
	information	 = 	DIA_Fajeth_BELOHNUNG_Info;
	permanent	 =  FALSE;
	description	 = 	"Quelle quantité de minerai avez-vous extrait ?";
};

func int DIA_Fajeth_BELOHNUNG_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	|| (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_BELOHNUNG_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //Dites-moi, quelle quantité de minerai avez-vous extrait à ce jour ?
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //Vous pouvez dire à Garond que nous n'avons réussi à extraire que deux coffres de minerai.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //Les attaques constantes que nous subissons font que nous avons perdu beaucoup d'hommes.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //Si Garond nous envoie des renforts, nous extrairons davantage de minerai.
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //Je vois. Je lui ferai passer le message.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //Bien. Dans ce cas, c'est à vous de jouer. Pour notre part, nous tiendrons aussi longtemps que nous le pourrons.
	
	Fajeth_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Les mineurs de Fajeth ont extrait DEUX caisses de minerai.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Perm2		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Perm2_Condition;
	information	 = 	DIA_Fajeth_Perm2_Info;
	permanent	 =  TRUE;
	description  =  "Où en est la production de minerai ?";
};

func int DIA_Fajeth_Perm2_Condition ()
{
	if  Npc_KnowsInfo (other,DIA_Fajeth_BELOHNUNG)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Perm2_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Perm2_15_00"); //Comment va la production de minerai ?
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_01"); //Mal. Nous n'avançons pas.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_02"); //Quand nous sommes arrivés, tout allait bien mais depuis, nous n'extrayons plus rien d'intéressant.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_03"); //Mais nous ne laisserons pas tomber... du moins, pas tant que je donnerai les ordres, ici.
};
//#####################################################################
//##
//##
//##							KAPITEL 3 und höher
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Erzabbau
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_ERZABBAU		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr			 = 	11;
	condition	 = 	DIA_Fajeth_ERZABBAU_Condition;
	information	 = 	DIA_Fajeth_ERZABBAU_Info;
	permanent	 = 	TRUE;
	description	 = 	"Comment se passe l'extraction du minerai ?";
};

func int DIA_Fajeth_ERZABBAU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Fajeth_BELOHNUNG))
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_00"); //Comment va l'extraction de minerai ?
	
	if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_01"); //C'est plus calme ici. Je me demande bien pourquoi...
		AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_02"); //Les dragons sont morts.
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_03"); //J'espère que je serai bientôt relevé. Je commence à devenir fou ici.
	}
	else 
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_04"); //Mal, comme vous pouvez vous en rendre compte par vous-même.
	};
};





// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fajeth_PICKPOCKET (C_INFO)
{
	npc			= PAL_281_Fajeth;
	nr			= 900;
	condition	= DIA_Fajeth_PICKPOCKET_Condition;
	information	= DIA_Fajeth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Fajeth_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Fajeth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fajeth_PICKPOCKET);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_BACK 		,DIA_Fajeth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fajeth_PICKPOCKET_DoIt);
};

func void DIA_Fajeth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};
	
func void DIA_Fajeth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};


