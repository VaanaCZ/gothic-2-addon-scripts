// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BL_BDT_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_BL_BDT_1_EXIT_Condition;
	information	= DIA_Addon_BL_BDT_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_BL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 									Chef
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Chef(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_BL_BDT_1_Chef_Condition;
	information	= DIA_Addon_BL_BDT_1_Chef_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_Chef_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Chef_15_00");//Qui est le responsable ici ?
	
	if (RavenIsDead == TRUE)
	{
		if Npc_IsDead (Thorus)
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_01");//Tant de commandants vont et viennent, ici... on finit par perdre le fil, au bout du compte.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_02");//Je crois que Thorus est notre commandant, maintenant.
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_03");//Raven est notre commandant. C'est lui qui nous a menés ici et nous a ordonné de construire ce camp.
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_04");//Il contrôle la mine, sinon ça fait déjà longtemps que ces chiens enragés se seraient entretués pour s'accaparer l'or qu'elle contient.
	};
};
// *************************************************************************
// 									Lager (nicht perm!)
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_1_Lager_Condition;
	information	= DIA_Addon_BL_BDT_1_Lager_Info;
	permanent	= FALSE;
	description = "Que savez-vous sur le camp ?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Lager_Condition()
{	
	if ((Sklaven_Flucht == FALSE)
	|| !Npc_IsDead (Raven))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager_15_00");//Que savez-vous du camp ?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_01");//Lorsque la présence d'une mine d'or sur ces terres a commencé à être connue, il m'est avis que ces bouseux ont dû semer une sacrée pagaille.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_02");//Raven a éliminé les plus virulents et a évincé les autres de la mine.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_03");//Depuis, plus personne n'est autorisé à accéder à la partie haute du camp. Il a même fait venir des prisonniers ici pour exploiter la mine.
	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};
// *************************************************************************
// 									Lager2
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager2(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_1_Lager2_Condition;
	information	= DIA_Addon_BL_BDT_1_Lager2_Info;
	permanent	= TRUE;
	description = "Pouvez-vous m'en apprendre davantage sur le camp ?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Lager2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BL_BDT_1_Lager)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Lager2_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager2_15_00");//Que savez-vous sur le camp ?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_01");//Si vous attaquez quelqu'un, tout le monde vous sautera à la gorge.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_02");//A moins, évidemment, que vous n'ayez une bonne raison de vous battre avec quelqu'un... en quel cas, personne ne s'impliquera.
};
// *************************************************************************
// 								News
// *************************************************************************
instance DIA_Addon_BL_BDT_1_News(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_BL_BDT_1_News_Condition;
	information	= DIA_Addon_BL_BDT_1_News_Info;
	permanent	= TRUE;
	description = "Quelque chose de nouveau ?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_News_15_00");//Du nouveau ?
	
	if (RavenIsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_01");//Raven est mort. Qu'allons-nous faire, maintenant ?
	};
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_02");//Les pirates refusent de nous ramener sur le continent parce que les dernières cargaisons ne leur ont pas été payées.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_03");//On devrait en embrocher un ou deux. Après, je suis sûr que les autres nous ramèneraient sans faire d'histoires.
};
// *************************************************************************
// 									Sklaven
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Sklaven(C_INFO)
{
	nr			= 5;
	condition	= DIA_Addon_BL_BDT_1_Sklaven_Condition;
	information	= DIA_Addon_BL_BDT_1_Sklaven_Info;
	permanent	= TRUE;
	description = "Que savez-vous des prisonniers ?";
};  
FUNC INT DIA_Addon_BL_BDT_1_Sklaven_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BL_BDT_1_Lager)
	&& ((Sklaven_Flucht == FALSE)
	|| (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Sklaven_Info()
{	
	 
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_00");//Que savez-vous des prisonniers ?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_01");//Raven cherche à exhumer quelque chose. Au début, faisait creuser les bandits, mais trop d'hommes sont morts.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_02");//C'est pour ça qu'il a fait venir des prisonnier - s'ils crèvent, ça n'a aucune importance.
	
	if (BDT_1_Ausbuddeln == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_03");//Mais qu'est-ce que Raven veut exhumer ?
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_04");//J'en sais rien, mais en tout cas, ça vaut bien plus que tout l'or du monde !
		BDT_1_Ausbuddeln = TRUE;
	};
};
FUNC VOID B_AssignAmbientInfos_Addon_BL_BDT_1 (var c_NPC slf)
{
	DIA_Addon_BL_BDT_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Chef.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager.npc				= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_News.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Sklaven.npc				= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager2.npc				= Hlp_GetInstanceID(slf);
};




