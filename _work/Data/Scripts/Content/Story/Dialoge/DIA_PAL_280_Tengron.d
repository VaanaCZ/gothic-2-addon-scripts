///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Tengron_EXIT   (C_INFO)
{
	npc         = Pal_280_Tengron;
	nr          = 999;
	condition   = DIA_Tengron_EXIT_Condition;
	information = DIA_Tengron_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Tengron_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Tengron_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_First		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	2;
	condition	 = 	DIA_Tengron_First_Condition;
	information	 = 	DIA_Tengron_First_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tengron_First_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_ScoutMine != LOG_RUNNING)
	&& (MIS_ScoutMine != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Tengron_First_Info ()
{
	AI_Output (self, other, "DIA_Tengron_First_07_00"); //Que faites-vous ici ?
	AI_Output (other, self, "DIA_Tengron_First_15_01"); //Je suis ici sur ordre du seigneur Hagen.
	AI_Output (self, other, "DIA_Tengron_First_07_02"); //Vous devez absolument essayer d'atteindre le château pour vous entretenir avec le commandant Garond.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HALLO		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	2;
	condition	 = 	DIA_Tengron_HALLO_Condition;
	information	 = 	DIA_Tengron_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tengron_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_ScoutMine == LOG_RUNNING)
	|| (MIS_ScoutMine == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Tengron_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Tengron_HALLO_07_00"); //Innos vous garde ! Avez-vous des nouvelles du château ? Pouvons-nous attendre des renforts dans un avenir proche ?
	
	if (Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output (other, self, "DIA_Tengron_HALLO_15_01"); //Je viens chercher des nouvelles, pas vous en apporter.
		AI_Output (self, other, "DIA_Tengron_HALLO_07_02"); //Alors, parlez à Fajeth. C'est lui qui nous dirige. Mais si vous avez des nouvelles du château, donnez-les moi.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_News		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	7;
	condition	 = 	DIA_Tengron_News_Condition;
	information	 = 	DIA_Tengron_News_Info;
	permanent 	 =  FALSE;
	description	 = 	"A propos des nouvelles...";
};

func int DIA_Tengron_News_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_News_Info ()
{
	AI_Output (other, self, "DIA_Tengron_News_15_00"); //Pour ce qui est des nouvelles...
	AI_Output (self, other, "DIA_Tengron_News_07_01"); //Oui. Quelle est la situation au château ?
	AI_Output (other, self, "DIA_Tengron_News_15_02"); //Il est toujours assiégé par les orques et sans défense contre les attaques des dragons.
	AI_Output (self, other, "DIA_Tengron_News_07_03"); //Malédiction ! Pourvu que les nôtres puissent tenir !
	AI_Output (self, other, "DIA_Tengron_News_07_04"); //Ecoutez, j'ai un ami au château. Il s'appelle Udar et nous nous connaissons depuis longtemps. Nous avons livré de nombreuses batailles côte à côte.
	AI_Output (self, other, "DIA_Tengron_News_07_05"); //Je voudrais que vous lui ameniez cet anneau afin qu'il le garde pour moi. Dites-lui que je le récupérerai à mon retour.
	
	Info_ClearChoices (DIA_Tengron_News);
	
	Info_AddChoice (DIA_Tengron_News,"Je n'ai pas le temps.",DIA_Tengron_News_No);
	Info_AddChoice (DIA_Tengron_News,"Pas de problème...",DIA_Tengron_News_Yes);
};
FUNC VOID DIA_Tengron_News_No()
{
	AI_Output (other, self, "DIA_Tengron_News_No_15_00"); //Je n'ai pas de temps à perdre avec ça.
	AI_Output (self, other, "DIA_Tengron_News_No_07_01"); //Je comprends.
	
	Info_ClearChoices (DIA_Tengron_News);
};
FUNC VOID DIA_Tengron_News_Yes()
{
	AI_Output (other, self, "DIA_Tengron_News_Yes_15_00"); //Pas de problème. Je remettrai l'anneau à Udar dès mon retour au château.
	AI_Output (self, other, "DIA_Tengron_News_Yes_07_01"); //Bien. La magie de l'anneau lui conférera un regain de force. Et n'oubliez surtout pas de lui dire que je viendrai le récupérer.
	
	B_GiveInvItems (self,other,ItRi_Tengron,1);
	Info_ClearChoices (DIA_Tengron_News);
	
	Log_CreateTopic (Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus (Topic_TengronRing,LOG_RUNNING);
	B_LogEntry (Topic_TengronRing,"Tengron m'a donné un anneau que je dois remettre à Udar au château.");
};
///////////////////////////////////////////////////////////////////////
//	Info Situation
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_Situation		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	70;
	condition	 = 	DIA_Tengron_Situation_Condition;
	information	 = 	DIA_Tengron_Situation_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quelle est la situation ici ?";
};
func int DIA_Tengron_Situation_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};
func void DIA_Tengron_Situation_Info ()
{
	AI_Output (other, self, "DIA_Tengron_Situation_15_00"); //Quelle est la situation, ici ?
	AI_Output (self, other, "DIA_Tengron_Situation_07_01"); //Nous sommes encerclés par les monstres et nous n'avons pour ainsi dire pas extrait de minerai. Et comme si ça ne suffisait pas, nous avons déjà perdu beaucoup d'hommes.
	AI_Output (self, other, "DIA_Tengron_Situation_07_02"); //J'ignore combien de temps nous pourrons tenir, mais nous ne baisserons pas les bras !
};
///////////////////////////////////////////////////////////////////////
//	Info NeedYourHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HELP		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	9;
	condition	 = 	DIA_Tengron_HELP_Condition;
	information	 = 	DIA_Tengron_HELP_Info;
	permanent 	 =  FALSE;
	description	 = 	"Je pourrais avoir besoin d'aide..."; 
};
func int DIA_Tengron_HELP_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	&&  Npc_KnowsInfo(other, DIA_Tengron_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Tengron_HELP_Info ()
{
	AI_Output (other, self, "DIA_Tengron_HELP_15_00"); //J'aurais besoin de votre aide. Fajeth veut que je chasse les lézards, et...
	AI_Output (self, other, "DIA_Tengron_HELP_07_01"); //Fajeth est le seul habilité à me donner des ordres et il m'a dit de garder le site minier. Alors, c'est ce que je vais continuer à faire.
	AI_Output (self, other, "DIA_Tengron_HELP_07_02"); //Peut-être que quelqu'un d'autre acceptera de vous aider.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Tengron_PICKPOCKET (C_INFO)
{
	npc			= Pal_280_Tengron;
	nr			= 900;
	condition	= DIA_Tengron_PICKPOCKET_Condition;
	information	= DIA_Tengron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Tengron_PICKPOCKET_Condition()
{
	C_Beklauen (32, 50);
};
 
FUNC VOID DIA_Tengron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Tengron_PICKPOCKET);
	Info_AddChoice		(DIA_Tengron_PICKPOCKET, DIALOG_BACK 		,DIA_Tengron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Tengron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Tengron_PICKPOCKET_DoIt);
};

func void DIA_Tengron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Tengron_PICKPOCKET);
};
	
func void DIA_Tengron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Tengron_PICKPOCKET);
};






