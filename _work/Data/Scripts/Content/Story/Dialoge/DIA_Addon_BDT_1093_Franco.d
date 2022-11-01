///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Franco_EXIT   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 999;
	condition   = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_EXIT_Info()
{
	if (Franco_Exit == FALSE)
	&& (MIS_HlpLogan == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");//Ne vous égarez pas, ou vous finirez dans l'estomac d'un requin.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Franco_PICKPOCKET (C_INFO)
{
	npc			= BDT_1093_Addon_Franco;
	nr			= 900;
	condition	= DIA_Franco_PICKPOCKET_Condition;
	information	= DIA_Franco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Il serait extrêmement risqué de lui dérober son amulette)";
};                       

FUNC INT DIA_Franco_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)
	&& (Npc_HasItems (self,ItAm_Addon_Franco) >= 1))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Franco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Franco_PICKPOCKET);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_BACK 		,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItAm_Addon_Franco, 1);
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Franco_PICKPOCKET);
		
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX]	= 196; //boah ey, ist ja ein super trick!
		self.attribute[ATR_HITPOINTS] 		= 196;
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
		
		
	};
};
	
func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Franco_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HI   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 1;
	condition   = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Franco_HI_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Franco_HI_Info()
{	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Si je rends service à Franco, il me laissera entrer dans le camp.");
	
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_00");//Hé, que faites-vous ici ? Vous voulez rentrer dans le camp ?
	AI_Output (other,self,"DIA_Addon_Franco_HI_15_01");//Oui, je suis...
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_02");//Je me fiche de savoir qui vous êtes. Mon nom est Franco, et c'est moi qui commande ici.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_03");//Si vous faites du bon travail ici, je vous laisserai rentrer dans le camp.
	
	if (Ramon_News == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Franco_HI_08_04");//Ramon, le garde posté devant la porte, vous dira si de nouvelles personnes sont demandées à l'intérieur du camp. Allez-le-lui demander.
		B_LogEntry (Topic_Addon_Franco,"Je suis censé demander à Ramon, le garde posté devant la porte, s'ils ont besoin de nouvelles recrues à l'intérieur du camp.");
	};
};
//---------------------------------------------------------------------
//	Info Mission SumpfHai
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Hai   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 2;
	condition   = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent   = FALSE;
	description = "Thorus a besoin d'un nouvel homme.";
};
FUNC INT DIA_Addon_Franco_Hai_Condition()
{	
	if (Ramon_News == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Hai_Info()
{	
	
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_00");//Thorus a besoin d'une nouvelle recrue.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_01");//Bien. Je m'en occupe.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_02");//Attendez un instant - et moi, alors ?
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_03");//Vous n'avez encore rien fait.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_04");//J'ai fait beaucoup de choses, seulement vous n'en savez rien du tout !
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_05");//Bien, alors vous voulez une chance ? Vous aurez une chance. Allez voir Logan. Il a quelques soucis avec les requins des marais.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_06");//Aidez-le à éliminer ces bestioles et vous pourrez rentrer dans le camp.
	
	B_LogEntry (Topic_Addon_Franco,"Franco veut que j'aille aider Logan avant de me laisser accéder au camp.");
};
//---------------------------------------------------------------------
//	Info Logan Wo?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Wo   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 3;
	condition   = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent   = FALSE;
	description = "Où puis-je trouver ce Logan ?";
};
FUNC INT DIA_Addon_Franco_Wo_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	&& (!Npc_IsDead (Logan))
	&& (MIS_HlpLogan == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Wo_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Wo_15_00");//Où puis-je trouver ce Logan ?
	AI_Output (self,other,"DIA_Addon_Franco_Wo_08_01");//Lorsque vous vous trouvez face à l'entrée du camp, suivez le mur de pierres vers la gauche. Ensuite, enfoncez-vous un peu dans le marais.
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Logan tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tot   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 5;
	condition   = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent   = FALSE;
	description = "Logan est mort.";
};
FUNC INT DIA_Addon_Franco_tot_Condition()
{	
	if (MIS_HlpLogan != LOG_SUCCESS)
	&&  Npc_IsDead (Logan)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tot_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tot_15_00");//Logan est mort.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_01");//Damnation ! Il était le meilleur de nos chasseurs... c'est une mauvaise nouvelle.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_02");//Quoi qu'il en soit, j'ai déjà envoyé quelqu'un d'autre à l'intérieur du camp.
	
	if (MIS_HlpLogan == LOG_RUNNING)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};
//---------------------------------------------------------------------
//	Info Logan Success HAISUCCESS
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HaiSuccess   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 6;
	condition   = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent   = FALSE;
	description = "J'aidais Logan...";
};
FUNC INT DIA_Addon_Franco_HaiSuccess_Condition()
{	
	if (MIS_HlpLogan == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_HaiSuccess_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_00");//J'ai aidé Logan...
	
	if Npc_IsDead (Logan)
	{
		AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_01");//...mais il n'a pas survécu.
	};
	AI_Output (self,other,"DIA_Addon_Franco_HaiSuccess_08_02");//Bien, alors vous avez combattu les requins des marais - vous nous serez utile... du moins, plus utile que la plupart des types ici.
	B_GivePlayerXP (XP_Addon_HlpLogan);
	
	B_LogEntry (Topic_Addon_Franco,"J'ai aidé Logan, mais ça n'a pas suffi pour que Franco me laisse accéder au camp.");
};

//---------------------------------------------------------------------
//	Mis 2 (Edgor)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Mis2 (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 7;
	condition   = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent   = FALSE;
	description = "Alors, je peux rentrer dans le camp, maintenant ?";
};
FUNC INT DIA_Addon_Franco_Mis2_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	|| (Npc_KnowsInfo (other, DIA_Addon_Franco_tot))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Mis2_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_MIS2_15_00");//Alors, je peux rentrer dans le camp, maintenant ?
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_01");//Ecoutez - j'ai besoin de vous pour une nouvelle mission.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_02");//Il y a quelques jours, j'ai envoyé Edgor dans le marais.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_03");//Il devait me ramener une ancienne tablette de pierre - mais depuis, personne ne l'a revu.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_04");//Allez voir ce qu'il fait, et ramenez-moi cette satanée tablette de pierre ?
	
	MIS_HlpEdgor = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Stoneplate,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Stoneplate,"Franco me demande de ramener une tablette de pierre qu'Edgor devait lui rapporter. Désormais, c'est à moi de m'en charger.");
	
	B_LogEntry (Topic_Addon_Franco,"Franco veut que j'aide Edgor avant de me permettre de rentrer dans le camp.");
};

//---------------------------------------------------------------------
//	Info Logan While
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_While   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 8;
	condition   = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent   = FALSE;
	description = "Et l'or ?";
};
FUNC INT DIA_Addon_Franco_While_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_HaiSuccess))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_While_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_While_15_00");//Et l'or ?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_01");//Quoi ? Que dites-vous ?
	AI_Output (other,self,"DIA_Addon_Franco_While_15_02");//Est-ce que je toucherai quelque chose en contrepartie de mon travail ici, dans le marais ?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_03");//(très amical) Vous voulez de l'or ? Bien sûr, combien voulez-vous ? Cinquante pépites d'or ? Cent ? Je vous donnerai tout l'or que vous pouvez porter...
	AI_Output (self,other,"DIA_Addon_Franco_While_08_04");//(fort) Pour qui vous prenez-vous ? Vous essayez de m'énerver ?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_05");//Maintenant, dégagez d'ici et allez faire quelque chose de votre journée ? Dans le cas contraire, vous ne toucherez pas la moindre pépite d'or ?
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info WOEDGOR
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_WOEDGOR   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 9;
	condition   = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent   = TRUE;
	description = "Alors OU puis-je trouver cet Edgor ?";
};
FUNC INT DIA_Addon_Franco_WOEDGOR_Condition()
{	
	if (MIS_HlpEdgor == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Addon_Stone_04 ) < 1)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_WOEDGOR_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_15_00"); //(soupire) Alors, où puis-je trouver cet Edgor ?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_08_01"); //Vous voulez connaître le chemin le plus rapide, ou le chemin le plus sûr ?
	
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Je prendrai le chemin le plus rapide." ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Indiquez-moi le chemin le plus facile." ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output (self,other,"DIA_Addon_Franco_There_08_00"); //Ce marais est empli de vieilles ruines. Il est sûrement en train de se la couler douce quelque part à l'intérieur d'un bâtiment abandonné...
	AI_Output (self,other,"DIA_Addon_Franco_There_08_01"); //J'imagine qu'il a eu l'intelligence d'allumer un feu de bois. Ça devrait vous permettre de le repérer facilement.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //Indiquez-moi le chemin le plus facile.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //Suivez le chemin jusqu'à la grande porte. Vous devriez y trouver Sancho.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //Là, tournez à gauche et suivez les marches.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //Je prendrai le chemin le plus rapide.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //Bien. D'ici, traversez les marches vers la gauche et enfoncez-vous dans le marais.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};
//---------------------------------------------------------------------
//	Info tafel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tafel   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 10;
	condition   = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent   = FALSE;
	description = "Voici la tablette de pierre.";
};
FUNC INT DIA_Addon_Franco_tafel_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04 ) >= 1)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tafel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tafel_15_00");//Voici la tablette de pierre.
	B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
	
	AI_Output (self,other,"DIA_Addon_Franco_tafel_08_01");//Bien, très bien ! Raven sera content de vous.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HlpEdgor);
	
	B_LogEntry (Topic_Addon_Franco,"J'ai rapporté à Franco la tablette de pierre qu'il voulait.");
};

//---------------------------------------------------------------------
//	JemandAnderen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_JemandAnderen   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 11;
	condition   = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent   = FALSE;
	description = "Et le camp ? Puis-je enfin y entrer, maintenant ?";
};
FUNC INT DIA_Addon_Franco_JemandAnderen_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_tafel))
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_JemandAnderen_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_JemandAnderen_15_00");//Et le camp ? Puis-je enfin y entrer, maintenant ?
	
	if !Npc_IsDead (Logan)
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_01");//Non, je viens d'y envoyer Logan. Son nom était avant le vôtre, sur la liste.
		
		Logan_Inside = TRUE;
		AI_Teleport (Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine (Logan,"LAGER");
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_02");//Non, j'y ai déjà envoyé quelqu'un d'autre.
	};
	
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_03");//Et pour l'instant, le camp n'a besoin de personne d'autre.
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_04");//De plus, j'ai vraiment besoin de vous ici, (sourit) maintenant que Logan n'est plus des nôtres ?
		
	B_LogEntry (Topic_Addon_Franco,"Franco refuse de me laisser rentrer dans le camp. Je crois que je vais devoir régler une fois pour toutes le problème Franco...");
};

//---------------------------------------------------------------------
//	Info Fight
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Fight   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 12;
	condition   = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent   = TRUE;
	description = "Envoyez-moi au camp MAINTENANT !";
};
FUNC INT DIA_Addon_Franco_Fight_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_Fight_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Fight_15_00"); //Envoyez-moi au camp MAINTENANT !
	AI_Output (self,other,"DIA_Addon_Franco_Fight_08_01"); //(dangereusement amical) Et si je dis non ?
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Alors j'attendrai encore un peu..." ,DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Alors, vous le regretterez, tout simplement." ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Duel_15_00"); //Alors, vous le regretterez, tout simplement.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Duel_08_01"); //Vous me menacez ? VOUS ? Vous voulez me menacer ? Il est temps de vous donner une leçon...
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Nothing_15_00"); //Alors, j'attendrai un peu...
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Nothing_08_01"); //(moqueur) Exactement.
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info Fight2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Pig   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 13;
	condition   = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent   = TRUE;
	description = "Ordure ! Je vais vous tuer !";
};
FUNC INT DIA_Addon_Franco_Pig_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Pig_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Pig_15_00");//Ordure ! Je vais vous tuer !
	AI_Output (self,other,"DIA_Addon_Franco_Pig_08_01");//(tendu) Misérable petit vermisseau, vous voulez vous mesurer à moi ? Attendez voir
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




