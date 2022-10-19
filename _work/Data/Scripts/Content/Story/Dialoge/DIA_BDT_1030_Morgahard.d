///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Morgahard_EXIT   (C_INFO)
{
	npc         = BDT_1030_Morgahard;
	nr          = 999;
	condition   = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_HALLO		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_HALLO_Condition;
	information	 = 	DIA_Morgahard_HALLO_Info;

	description	 = 	"Vous êtes Morgahard.";
};

func int DIA_Morgahard_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_00"); //Vous êtes Morgahard.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //Comment connaissez-vous mon nom ?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //Le juge vous recherche. Vous vous êtes évadé de prison.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //Que lui avez-vous fait alors ? Vous lui avez volé sa besace ?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //Pas la sienne. Celle du gouverneur. Mais pour le compte du juge.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //Après qu'on s'en soit pris au gouverneur, il a refusé de partager avec nous et nous a fait arrêter.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //On ne voulait pas finir pendus, alors nous nous sommes enfuis.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //On pensait qu'ils ne nous retrouveraient jamais. Il semble qu'on se soit trompés.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "Arrêtez de geindre et tirez votre arme.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Que pouvons-nous faire contre le juge ?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Le juge m'a ordonné de vous tuer.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"J'ai trouvé Morgahard, le chef des fugitifs."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //Le juge m'a ordonné de vous tuer.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //Oui, bien sûr. C'est pourquoi vous êtes ici, n'est-ce pas ?

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //Que pouvons-nous faire contre le juge ?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //Rien. Il règne sur le haut quartier comme une araignée au centre de sa toile.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //Je ne dirais pas ça. Il nous faut juste une preuve de sa culpabilité dans cette affaire du gouverneur.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //Une preuve, dites-vous ? J'en ai une. Mais qui écouterait un criminel ?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Donnez-moi cette preuve et je veillerai à ce que plus personne ne vous traque.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //Vraiment ? Très bien. Tenez, prenez cette lettre. Elle porte la signature du juge.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //Même si cela ne change rien à ma culpabilité, elle devrait suffire pour prouver qu'il était complice.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard m'a donné l'ordre du juge. Ce papier prouve que le juge est responsable du vol perpétré contre le gouverneur Larius. Je crois que c'est le genre de choses que Lee voulait que je trouve."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //Arrêtez de vous plaindre et tirez votre épée. Nous allons en terminer maintenant.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //Ça me va. De toute manière, je n'ai plus rien à perdre.
	AI_StopProcessInfos (self);
	MorgahardSucked = TRUE;
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_Perm_Condition;
	information	 = 	DIA_Morgahard_Perm_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Morgahard_Perm_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Morgahard_HALLO))
	&& (MorgahardSucked == FALSE)

		{
			return TRUE;
		};	
};

func void DIA_Morgahard_Perm_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //Ce sale porc de juge. Un jour, je le tuerai.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm2		(C_INFO)
{
	npc			 = 	BDT_1030_Morgahard;
	nr			 = 	3;
	condition	 = 	DIA_Morgahard_Perm2_Condition;
	information	 = 	DIA_Morgahard_Perm2_Info;
	important	 = 	TRUE;
	Permanent	 = 	TRUE;

};
func int DIA_Morgahard_Perm2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (MorgahardSucked == TRUE)
		{
			return TRUE;
		};	
};
func void DIA_Morgahard_Perm2_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //Pourquoi ne pas tout simplement disparaître ?
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Morgahard_PICKPOCKET (C_INFO)
{
	npc			= BDT_1030_Morgahard;
	nr			= 900;
	condition	= DIA_Morgahard_PICKPOCKET_Condition;
	information	= DIA_Morgahard_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Morgahard_PICKPOCKET_Condition()
{
	C_Beklauen (73, 45);
};
 
FUNC VOID DIA_Morgahard_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_BACK 		,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};
	
func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};


