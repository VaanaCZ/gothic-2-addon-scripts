// ************************************************************
// 			  				 Exit 
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Exit(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 999;
	condition	= DIA_Addon_AlligatorJack_Exit_Condition;
	information	= DIA_Addon_AlligatorJack_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;	
};
var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;
FUNC VOID DIA_Addon_AlligatorJack_Exit_Info()
{	
	
	if (MIS_KrokoJagd == LOG_SUCCESS)
	&& (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_00"); //Si vous me cherchez, vous me trouverez le plus souvent près de mon camp, devant la palissade.
	
		if (PIR_1354_Addon_Henry.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output (other ,self,"DIA_Addon_AlligatorJack_Exit_15_01"); //La palissade ?
			AI_Output (self ,other,"DIA_Addon_AlligatorJack_Exit_12_02"); //Marchez vers l'ouest en partant d'ici, et vous verrez ce que je veux dire.
		};
		
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine (self, "START");
		
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_AlligatorJack_PICKPOCKET (C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 900;
	condition	= DIA_Addon_AlligatorJack_PICKPOCKET_Condition;
	information	= DIA_Addon_AlligatorJack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_AlligatorJack_PICKPOCKET_Condition()
{
	C_Beklauen (100, 333);
};
 
FUNC VOID DIA_Addon_AlligatorJack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_AlligatorJack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_AlligatorJack_PICKPOCKET_DoIt);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_AlligatorJack_PICKPOCKET);
};
	
func void DIA_Addon_AlligatorJack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_AlligatorJack_PICKPOCKET);
};
// ************************************************************
// 			  		Hello
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Hello(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_Hello_Condition;
	information	= DIA_Addon_AlligatorJack_Hello_Info;
	permanent	= FALSE;
	Important	= TRUE;
};                       
FUNC INT DIA_Addon_AlligatorJack_Hello_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_AlligatorJack_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_00"); //Et qui êtes-vous, VOUS ? Vous ne ressemblez pas vraiment aux autres...
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Hello_15_01"); //Quels autres ?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_02"); //Eh bien, les mages qui traînent parmi les ruines là-bas.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_03"); //Vous êtes l'un de ceux-là, alors ?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Hello_12_04"); //Vous avez bien du courage, pour traîner tout seul dans les parages.
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information	 = 	DIA_Addon_AlligatorJack_WerBistDu_Info;

	description	 = 	"Qui êtes-vous ?";
};

func int DIA_Addon_AlligatorJack_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WerBistDu_15_00"); //Qui êtes-vous ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_01"); //Je suis sûr que vous avez déjà entendu parler de moi.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_02"); //(fièrement) Je suis Alligator Jack.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_03"); //Je suis la terreur de ces contrées ! L'un des plus dangereux pirates dans les parages !
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_04"); //Avec le cap'taine Greg, on a abordé plus de vaisseaux marchands que je ne pourrais compter.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_05"); //Vous avez devant vous une légende vivante !
};

///////////////////////////////////////////////////////////////////////
//	Info Vorschlag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Vorschlag		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Vorschlag_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Vorschlag_Info;

	description	 = 	"Connaissez-vous un type nommé Raven ?";
};

func int DIA_Addon_AlligatorJack_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_AlligatorJack_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_15_00"); //Connaissez-vous un type nommé Raven ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_01"); //Bien sûr. Il est le chef des bandits, à l'est d'ici.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_02"); //Qu'est-ce que vous avez à voir avec lui ?
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven et ses bandits se trouvent à l'est de la vallée.");
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "Je veux lui proposer mes services.", DIA_Addon_AlligatorJack_Vorschlag_join );
	Info_AddChoice	(DIA_Addon_AlligatorJack_Vorschlag, "Il faut que je le tue.", DIA_Addon_AlligatorJack_Vorschlag_tot );
};

func void 	B_AlligatorJack_Besser ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_00"); //J'ai une meilleure idée.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_01"); //Venez vous joindre à nous.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_02"); //Ça vous laissera le temps d'y réfléchir.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Besser_12_03"); //Quand vous aurez goûté notre rhum fait maison, tout vous semblera plutôt différent.
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Vorschlag);
};
func void DIA_Addon_AlligatorJack_Vorschlag_tot ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_tot_15_00"); //Il faut que je le tue.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_01"); //(rires) Quoi ? VOUS ? Vous allez faire ça ?!
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_02"); //Vous n'avez pas  l'impression que ce type est bien trop fort pour vous ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_03"); //Vous n'arriverez même pas à vous en approcher. Les bandits dont ils s'est entouré vous mettront en pièces avant que vous n'ayez le temps de bouger.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_04"); //Vous passerez même pas leur premier poste avancé !
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_05"); //Rien qu'à vous voir, ces bandits vont commencer à avoir des fourmillements dans les doigts !
	
	B_AlligatorJack_Besser ();
};
func void DIA_Addon_AlligatorJack_Vorschlag_join ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Vorschlag_join_15_00"); //Je veux lui proposer mes services.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_01"); //(sournois) Oh, vraiment ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_02"); //Mais vous ne m'avez pas du tout l'air d'être du genre à vouloir vous allier avec cette vermine...

	B_AlligatorJack_Besser ();
};

///////////////////////////////////////////////////////////////////////
//	Info BDTRuestung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_BDTRuestung		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information	 = 	DIA_Addon_AlligatorJack_BDTRuestung_Info;

	description	 = 	"J'ai besoin d'une armure de bandit";
};

func int DIA_Addon_AlligatorJack_BDTRuestung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_Vorschlag))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_15_00"); //Il me faut une armure de bandit.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_01"); //Qu'est-ce que vous allez faire de ÇA ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_02"); //Ça ne vous vaudra que des ennuis si vous êtes vu avec ça sur le dos !
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_03"); //Tout le monde vous prendra pour un bandit et essaiera de vous tuer !
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_04"); //Außer den Banditen SELBST vielleicht.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_05"); //Die werden dich höchstens noch für einen von ihnen halten.
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "Savez-vous où je pourrais trouver une armure de ce genre ?", DIA_Addon_AlligatorJack_BDTRuestung_wo );
	Info_AddChoice	(DIA_Addon_AlligatorJack_BDTRuestung, "Ça me convient... ", DIA_Addon_AlligatorJack_BDTRuestung_gut );
};
func void DIA_Addon_AlligatorJack_BDTRuestung_gut ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00"); //Ça me convient...
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01"); //Ah ? Pour ça, il faut que vous soyez suicidaire...
};
func void DIA_Addon_AlligatorJack_BDTRuestung_wo ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00"); //Savez-vous où je pourrais trouver une armure comme celle-là ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01"); //On en avait une autrefois, dans notre camp de pirates.
	//AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_02"); //Mmh ... Ich denke, die hatte genau deine Größe.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03"); //Mais je ne sais pas si elle y est encore.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Les pirates sont censés détenir une armure de bandit complète, mais Alligator Jack n'a pas pu me le confirmer."); 
	
	Info_ClearChoices	(DIA_Addon_AlligatorJack_BDTRuestung);
};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Greg		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Greg_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Greg_Info;

	description	 = 	"Le nom de votre capitaine est bien Greg ?";
};

func int DIA_Addon_AlligatorJack_Greg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_00"); //Le nom de votre capitaine est bien Greg ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_01"); //Exact. Le plus grand pirate qu'ait jamais enfanté la mer !
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_02"); //Je crois connaître votre capitaine. Je l'ai rencontré à Khorinis.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_03"); //(rires) Greg ? A Khorinis ? Foutaises !
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_04"); //Greg est en mer avec quelques gars, parti chercher des trésors !
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_05"); //La seule chose qui puisse amener Greg à Khorinis serait une galère de prisonniers du roi !
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_06"); //C'est l'un des hommes les plus recherchés de ce pays.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_Greg_12_07"); //Il n'irait jamais en ville de son plein gré, pour que la garde royale le jette dans une cellule !
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_Greg_15_08"); //Si vous le dites...
};

///////////////////////////////////////////////////////////////////////
//	Info PIRLager
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_PIRLager		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_PIRLager_Condition;
	information	 = 	DIA_Addon_AlligatorJack_PIRLager_Info;

	description	 = 	"Où est votre camp de pirates ?";
};

func int DIA_Addon_AlligatorJack_PIRLager_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_00"); //Où est votre camp de pirates ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_01"); //Vous voyez le passage dans la grotte, là-bas ? Empruntez-le et continuez vers l'ouest, tôt ou tard, vous atteindrez notre plage.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_02"); //C'est là que se trouvent nos cabanes en bois.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_03"); //Je peux vous y amener, mais à condition que vous me rendiez d'abord un service.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_04"); //Et qu'est-ce que ce sera ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_05"); //Je dois trouver de la viande pour les gars avant de rentrer au camp.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_06"); //Vous m'avez tout l'air d'être un costaud...
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_07"); //J'aurais bien besoin de votre aide pour aller chasser. Intéressé ?

	Log_CreateTopic (TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_RatHunt,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RatHunt,"Alligator Jack a besoin d'aide à la chasse.");

};

///////////////////////////////////////////////////////////////////////
//	Info WasJagen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WasJagen		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_WasJagen_Condition;
	information	 = 	DIA_Addon_AlligatorJack_WasJagen_Info;

	description	 = 	"Qu'est-ce que vous chassez ?";
};

func int DIA_Addon_AlligatorJack_WasJagen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_00"); //Qu'est-ce que vous chassez ?
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_01"); //Habituellement, des alligators. Mais ce n'est pas fameux, en ragoût.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_02"); //Et de toutes façons, il n'en reste plus un seul dans les parages.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_03"); //Alors je prends ce que je trouve : des rats des marais.
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_04"); //Quoi ?!
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_05"); //La plupart des bestioles dans cette région ont goût de vieilles chaussettes, ou leur chair est aussi coriace que la cuirasse d'un alligator.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_06"); //Ces gros rats des marais sont à peu près la seule espèce comestible.

	B_LogEntry (TOPIC_Addon_RatHunt,"La seule chose qui soit même vaguement comestible dans ce coin est une espèce de rat des marais.");
};

// ************************************************************
//				Pirates
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_Pirates(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_Pirates_Condition;
	information	= DIA_Addon_AlligatorJack_Pirates_Info;
	permanent	= FALSE;
	description	= "Dites-m'en davantage sur vous autres pirates.";
};                       
FUNC INT DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_PIRLager))
		{
			return TRUE;
		};
};

FUNC VOID DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Pirates_15_00"); //Dites-m'en davantage sur vous autres pirates.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_01"); //Ça fait des années qu'on vit ici. Avant la guerre, tout le monde nous connaissait, d'ici jusqu'au continent.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_02"); //La vue de notre drapeau suffisait à semer la terreur parmi les équipages des vaisseaux marchands.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_03"); //Mais cette époque est désormais révolue. Cela fait des semaines qu'on n'a pas vu le moindre vaisseau marchand.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_04"); //Notre cap'taine Greg est parti essayer d'en aborder un autre.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_05"); //Et nous autres, on reste au camp à se tourner les pouces en attendant qu'il revienne.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Pirates_12_06"); //J'espère qu'il ramènera tout un tas de butin.
};


// ************************************************************
// 			  			Lass uns jagen gehen
// ************************************************************
INSTANCE DIA_Addon_AlligatorJack_LetsGoHunting(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 5;
	condition	= DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information	= DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent	= TRUE;
	description = "Allons chasser.";
};                       
FUNC INT DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if (MIS_KrokoJagd == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_WasJagen)) 
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00"); //Allons chasser.
	AI_Output (self,other ,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01"); //Bien. A deux personnes, ce sera du gâteau.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02"); //Vous êtes prêt ?
	
	Info_ClearChoices (DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"Non, pas encore.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice (DIA_Addon_AlligatorJack_LetsGoHunting,"Oui.",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};
const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;
FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00"); //Oui.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01"); //Parfait. Restez derrière moi, alors.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self, "HUNT1");
		
		
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc (Swamprat ,"ADW_PIRATECAMP_WATERHOLE_07");

	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc (Swamprat ,"ADW_CANYON_TELEPORT_PATH_06");
		
	AlligatorJack_JagdStart = AlligatorJack_Inter1;
	
	MIS_KrokoJagd = LOG_RUNNING;
};

FUNC VOID DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00"); //Non, pas encore.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01"); //Dépêchez-vous, alors !
	
	Info_ClearChoices (DIA_Addon_AlligatorJack_LetsGoHunting);
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter1		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Inter1)
	&& Npc_GetDistToWP (self,"ADW_PIRATECAMP_WAY_16") <= 500  
		{
			return TRUE;
		};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00"); //Le vallon.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01"); //On devrait y trouver quelques-unes de ces bestioles.
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02"); //Suivez-moi.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};


///////////////////////////////////////////////////////////////////////
//	Info Das habe ich befürchtet
///////////////////////////////////////////////////////////////////////

instance DIA_Addon_AlligatorJack_TheHunt		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_TheHunt_Condition;
	information	 = 	DIA_Addon_AlligatorJack_TheHunt_Info;
	permanent 	 = 	FALSE;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_TheHunt_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Kessel)
	&& (Npc_GetDistToWP (self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info ()
{
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_00"); //Je craignais cela.
	AI_Output 	(other ,self, "DIA_Addon_AlligatorJack_TheHunt_15_01"); //Quoi ?!
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_02"); //Cette poignée de bêtes ne représente que la moitié de ce qu'il me faut.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_03"); //Il va falloir qu'on descende dans le canyon.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_04"); //Faites attention, les profondeurs du canyon sont très dangereuses.
	AI_Output	(self,other , "DIA_Addon_AlligatorJack_TheHunt_12_05"); //Si vous tenez à votre vie, restez tout près de moi.
	
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_10");

	Info_ClearChoices (DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"Et qu'y a-t-il dans le canyon, au juste ?!",DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice (DIA_Addon_AlligatorJack_TheHunt,"Parfait, allons-y.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Enough ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00"); //Qu'y a-t-il au juste, dans le canyon ?
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01"); //On évite cet endroit à tout prix, lorsque c'est possible.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02"); //C'est là que rôdent les lames. Sacrées bestioles, celles-là. Ne vous en approchez pas, si vous voulez vivre.
};

FUNC VOID DIA_Addon_AlligatorJack_TheHunt_Running ()
{
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00"); //Parfait, allons-y.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01"); //Bien. A deux personnes, ce sera du gâteau.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter2		(C_INFO)
{
	npc		 = 	PIR_1352_Addon_AlligatorJack;
	nr		 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information	 = 	DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Inter2)
	&& (Npc_GetDistToWP (self,"ADW_PIRATECAMP_WAY_16") <= 500)
	&& (GregIsBack == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00"); //Venez.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};

///////////////////////////////////////////////////////////////////////
//	Info Das ist jetzt aber genug
///////////////////////////////////////////////////////////////////////

instance DIA_Addon_AlligatorJack_HuntEnd		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information	 = 	DIA_Addon_AlligatorJack_HuntEnd_Info;
	permanent 	 = 	FALSE;
	important	 = 	TRUE;

};

func int DIA_Addon_AlligatorJack_HuntEnd_Condition ()
{
	if (AlligatorJack_JagdStart == AlligatorJack_Canyon)
	&& (Npc_GetDistToWP (self,"ADW_CANYON_TELEPORT_PATH_06") <= 500)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info ()
{
	if (AlligatorJack_KrokosKilled == 0)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00"); //Dites, vous pouvez me dire pourquoi je vous ai emmené ?
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01"); //Vous n'avez pas tué un seul rat des marais !
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02"); //Bah. Peut-être que vous pouvez m'être utile d'une autre manière.
		
	}
	else if AlligatorJack_KrokosKilled == 1
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03"); //Bien joué ! On a bien besoin de quelqu'un comme vous !
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04"); //Vous avez tué une de ces bestioles dès votre première chasse. Pas mal !
	}
	else	//mehr als 1!!
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05"); //Vous êtes un bon chasseur...
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06"); //Bon sang ! Si vous continuez comme ça, la prochaine fois, je resterai au camp !
	};
	
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_07"); //Tenez, portez cette viande de rat des marais à ce vieux fainéant de Morgan.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_08"); //Vous le trouverez dans notre camp.
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_09"); //Il est sûrement vautré quelque part sur la plage. Il attend cette viande.
	
	if (PIR_1354_Addon_Henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_10"); //Henry garde généralement l'entrée du camp, au cas où des bandits rôderaient dans les parages.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_11"); //S'il refuse de vous laisser entrer, dites-lui que c'est moi qui vous envoie.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_12"); //Peut-être que ça le rendra un peu plus sociable.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_PassHenry_12_13"); //Henry est parfois un peu trop zélé... et légèrement tyrannique, aussi.
	};
	
	MIS_AlligatorJack_BringMeat = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BringMeat,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BringMeat,"Alligator Jack m'a remis 10 morceaux de viande. Je dois les apporter à Morgan.");

	B_LogEntry (TOPIC_Addon_RatHunt,"La chasse fut un succès. Nous avons pris plusieurs rats des marais.");
	
	B_GiveInvItems (self ,other,ItFoMuttonRaw,10);
	MIS_KrokoJagd = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_KrokoJagd);
};


///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Angus		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Angus_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Angus_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Connaissez-vous Angus et son collègue Hank ?";

};

func int DIA_Addon_AlligatorJack_Angus_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bill_AngusnHank)	== TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Addon_AlligatorJack_Angus_Info ()
{
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_00"); //Connaissez-vous Angus et son collègue Hank ?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_03"); //Ça fait un moment que je ne les ai pas vus.
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_04"); //En ce qui me concerne, ça ne me dérangerait pas qu'ils ne rentrent jamais au camp.
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Angus_15_05"); //Pourquoi ?
	AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Angus_12_06"); //Bah, ces crétins passaient leur temps à traîner autour du lac, en faisant peur au gibier.
};

///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Lake		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Lake_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Lake_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Autour de quel lac rôdent-ils ?";
};

func int DIA_Addon_AlligatorJack_Lake_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_Angus) == TRUE)
	&& (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info ()
{
	AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_00"); //Quelle sorte de lac, au juste ?!

	if (MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_01"); //Vous vous souvenez de notre chasse ?
		AI_Output	(other,self , "DIA_Addon_AlligatorJack_Lake_15_02"); //Ouais.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_03"); //Le lac dans le vallon. En général, ils traînaient toujours là-bas.
	}
	else
	{
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_04"); //Le lac au fond du grand vallon.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_05"); //Marchez vers l'est en partant de notre camp. Vous ne pouvez pas manquer le vallon.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_06"); //Beaucoup de petites cascades s'y déversent.
		AI_Output 	(self ,other, "DIA_Addon_AlligatorJack_Lake_12_07"); //Mais attention - si vous vous retrouvez à marcher sur du sable sec, vous avez manqué le lac et êtes entré dans le canyon.
	};
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"La grotte devrait se trouver dans le vallon à l'est du camp, tout près du lac.");
};
	
///////////////////////////////////////////////////////////////////////
//	Info kannst du mir was beibringen?
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_CanLearn		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_CanLearn_Condition;
	information	 = 	DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent 	 = 	TRUE;
	description	 = 	"Pouvez-vous m'enseigner quelque chose ?";

};

func int DIA_Addon_AlligatorJack_CanLearn_Condition ()
{
	if (AlligatorJack_Addon_TeachPlayer == FALSE)
	{
		if ((Npc_KnowsInfo (other,DIA_Addon_AlligatorJack_HuntEnd) == TRUE)
		|| (GregIsBack == TRUE))
		{
			return TRUE;
		};	
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info ()
{
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_CanLearn_15_00"); //Pouvez-vous m'apprendre quelque chose ?
	
	if MIS_KrokoJagd > LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_01"); //Bien sûr ! Je suis un bon chasseur, et je peux vous montrer comment dépecer des animaux et arracher leurs dents.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_02"); //Je vous apprendrai comment faire, si vous le souhaitez.
		
		Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry		(Topic_Addon_PIR_Teacher,"Alligator Jack peut me montrer comment retirer la peau ou les dents d'animaux. De plus, il peut également m'enseigner des techniques d'archerie.");
		
		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_03"); //Mais d'abord, prouvez-moi que vous êtes prêt à chasser.
		AI_Output (self ,other,"DIA_Addon_AlligatorJack_CanLearn_12_04"); //Lorsqu'on aura été chassé ensemble, j'accepterai peut-être.
	};
};
///////////////////////////////////////////////////////////////////////
FUNC VOID B_AJ_Teach()
{
	Info_ClearChoices (DIA_Addon_AlligatorJack_Teach);
		
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach,DIALOG_BACK,DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5) ,DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice (DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))	 ,DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("Dépecer des animaux",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)),  DIA_Addon_AlligatorJack_Teach_FUR);
	Info_AddChoice	(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString ("Arracher des dents",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Addon_AlligatorJack_Teach_Teeth);
};
///////////////////////////////////////////////////////////////////////
//	Info Unterrichte mich!
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Teach		(C_INFO)
{
	npc			 = 	PIR_1352_Addon_AlligatorJack;
	nr			 = 	5;
	condition	 = 	DIA_Addon_AlligatorJack_Teach_Condition;
	information	 = 	DIA_Addon_AlligatorJack_Teach_Info;
	permanent 	 = 	TRUE;
	description	 = 	"Apprenez- moi !";
};
func int DIA_Addon_AlligatorJack_Teach_Condition ()
{
	if (AlligatorJack_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func void DIA_Addon_AlligatorJack_Teach_Info ()
{
	AI_Output	(other,self ,"DIA_Addon_AlligatorJack_Teach_15_00"); //Montrez-moi comment faire !
	AI_Output 	(self ,other,"DIA_Addon_AlligatorJack_Teach_12_01"); //Que vous-vous apprendre ?
		
	B_AJ_Teach();

	//Wird nicht mehr gebraucht M.F. 
	//AI_Output 	(self ,other,"DIA_Addon_AlligatorJack_Teach_12_02"); //Ich kann dir nichts mehr beibringen.
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_Back ()
{
	Info_ClearChoices	(DIA_Addon_AlligatorJack_Teach);
};
func void DIA_Addon_AlligatorJack_Teach_Bow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 75);
	B_AJ_Teach();
};
func void DIA_Addon_AlligatorJack_Teach_Bow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 75);
	B_AJ_Teach();
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_FUR()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ReptileSkin] == FALSE)
	{
		if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ReptileSkin))
		{
			AI_Output (self, other, "DIA_Addon_AlligatorJack_Teach_Fur_12_00"); //Commencez toujours à découper au niveau du ventre, ou la qualité de la viande en souffrira.
		};
	}
	else
	{
		B_Say (self, other, "$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};
FUNC VOID DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{
		 B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth);
	}
	else
	{
		B_Say (self, other, "$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
func void B_AlliJack_AlliKlar()
{
	AI_Output (self ,other,"DIA_Addon_AlligatorJack_Anheuern_12_01"); //Bien, bien.
};
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_Anheuern(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 11;
	condition	= DIA_Addon_AlligatorJack_Anheuern_Condition;
	information	= DIA_Addon_AlligatorJack_Anheuern_Info;
	permanent	= FALSE;
	description = "Allons chasser.";
};                       
FUNC INT DIA_Addon_AlligatorJack_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_AlligatorJack_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_Anheuern_15_00"); //Allons chasser.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos (self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_ComeOn(C_INFO)
{
	npc			= 	PIR_1352_Addon_AlligatorJack;
	nr		 	= 	12;
	condition	= 	DIA_Addon_AlligatorJack_ComeOn_Condition;
	information	= 	DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Venez avec moi.";
};
func int DIA_Addon_AlligatorJack_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_AlligatorJack_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_AlligatorJack_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_AlligatorJack_KommMit_15_00"); //Venez.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
		AI_StopProcessInfos (self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_AlligatorJack_GoHome(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 13;
	condition	= DIA_Addon_AlligatorJack_GoHome_Condition;
	information	= DIA_Addon_AlligatorJack_GoHome_Info;
	permanent	= TRUE;
	description = "Je n'ai plus besoin de vous.";
};                       
FUNC INT DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_AlligatorJack_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_AlligatorJack_DontNeedYou_15_00"); //Je n'ai plus besoin de vous.
	B_AlliJack_AlliKlar();

	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_AlligatorJack_TooFar(C_INFO)
{
	npc			= PIR_1352_Addon_AlligatorJack;
	nr			= 14;
	condition	= DIA_Addon_AlligatorJack_TooFar_Condition;
	information	= DIA_Addon_AlligatorJack_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_AlligatorJack_TooFar_Info()
{	
	B_Say(self, other, "$RUNAWAY");
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};






	




	






































