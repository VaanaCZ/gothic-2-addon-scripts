
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kjorn_EXIT   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 999;
	condition   = DIA_Kjorn_EXIT_Condition;
	information = DIA_Kjorn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Kjorn_Hello   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_Hello_Condition;
	information = DIA_Kjorn_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;	
};

FUNC INT DIA_Kjorn_Hello_Condition()
{
	IF (Npc_GetDistToNpc (self,hero) < 300)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_Hello_Info()
{
	AI_Output	(self ,other,"DIA_Kjorn_Hello_06_00"); //Eh ! Venez ici !
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_01"); //Que voulez-vous ?
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_02"); //Cette vallée est un endroit dangereux. Et sans le bon équipement vous serez mort avant d'avoir eu le temps de dire ouf.
	AI_Output	(other,self ,"DIA_Kjorn_Hello_15_03"); //Je présume que VOUS avez le bon équipement.
	AI_Output 	(self ,other,"DIA_Kjorn_Hello_06_04"); //Vous avez deviné. Et je peux même vous le vendre.
};

//*********************************************************************
//	Info TRADE 
//*********************************************************************
INSTANCE DIA_Kjorn_TRADE   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 4;
	condition   = DIA_Kjorn_TRADE_Condition;
	information = DIA_Kjorn_TRADE_Info;
	Trade		= TRUE;
	permanent   = TRUE;
	description	= "Qu'avez-vous à m'offrir ?";
				
};

FUNC INT DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv (self);
	AI_Output	(other,self ,"DIA_Kjorn_TRADE_15_00"); //Qu'avez-vous à me proposer ?

};

//*********************************************************************
//	Verkaufst du auch Informationen? 
//*********************************************************************
INSTANCE DIA_Kjorn_SellInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_SellInfos_Condition;
	information = DIA_Kjorn_SellInfos_Info;
	permanent   = FALSE;
	description	= "Vendez-vous également des informations ?";
				
};

FUNC INT DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kjorn_SellInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_SellInfos_15_00"); //Vendez-vous aussi des informations ?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_01"); //Ça dépend. Contre la bonne somme d'argent, je vous dirai tout ce que je sais.
	AI_Output 	(other,self ,"DIA_Kjorn_SellInfos_15_02"); //Combien voulez-vous ?
	AI_Output 	(self ,other,"DIA_Kjorn_SellInfos_06_03"); //Hum... difficile à dire. Mais je pense que 50 pièces d'or pour chaque information me paraît raisonnable.
};

//*********************************************************************
//	Ich brauche Infos über.. 
//*********************************************************************
INSTANCE DIA_Kjorn_BuyInfos   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent   = TRUE;
	description	= "J'ai besoin d'informations.";
				
};

FUNC INT DIA_Kjorn_BuyInfos_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Kjorn_SellInfos))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_BuyInfos_15_00"); //J'ai besoin d'informations.
	AI_Output 	(self ,other,"DIA_Kjorn_BuyInfos_06_01"); //50 pièces d'or !
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	Info_AddChoice (DIA_Kjorn_BuyInfos,"C'est trop cher pour moi.",DIA_Kjorn_BuyInfos_HoldMoney);	
	
	IF (Npc_HasItems (other,ItMi_Gold) >=50)
	{	
		Info_AddChoice (DIA_Kjorn_BuyInfos,"Oui, tenez.",DIA_Kjorn_BuyInfos_GiveMoney);
	};	
};

FUNC VOID DIA_Kjorn_BuyInfos_HoldMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //C'est trop cher pour moi.
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_GiveMoney ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //Oui, tenez.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //Maintenant, dites-moi...
	
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
	
	//----- Zurück -----
	
	Info_AddChoice (DIA_Kjorn_BuyInfos,DIALOG_BACK,DIA_Kjorn_BuyInfos_Back);
	
	//----- Die Drachen -----
	
	if KjornToldDragon == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... au sujet des dragons.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if KjornToldDragon == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... plus d'informations sur les dragons.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	
	//----- Das Minental -----
	
	if KjornToldColony == 0
	{	
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... au sujet de la Vallée des mines.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if KjornToldColony == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... plus d'informations sur la Vallée des mines.",DIA_Kjorn_BuyInfos_Colony2);
	};
	
	//----- die Burg -----
	
	if KJornToldOldCamp == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... au sujet du château.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	
	//----- Die Orks -----
	
	if KjornToldOrks == 0
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... au sujet des orques.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if KjornToldOrks == 1
	{
		Info_AddChoice	(DIA_Kjorn_BuyInfos,"... plus d'informations sur les orques.",DIA_Kjorn_BuyInfos_Orks2);
	};	
	
};

//------ Zurück -----

FUNC VOID DIA_Kjorn_BuyInfos_Back ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Back_15_00"); //J'ai changé d'avis, rendez-moi mon argent.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Back_06_01"); //Comme vous voulez...
	
	B_GiveInvItems (self,other,ItMi_Gold,50);
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Drachen -----

FUNC VOID DIA_Kjorn_BuyInfos_Dragon1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon1_15_00"); //Parlez-moi des dragons.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01"); //Les dragons sont anciens et terriblement puissants. Autrefois, ils étaient des milliers à vivre dans le monde.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02"); //Mais cela fait au moins cent ans qu'on n'en a pas vus.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03"); //Leur sang est aussi chaud que de l'huile bouillante. S'ils croisent votre regard, votre cœur se transforme en pierre. Enfin, c'est ce que j'ai entendu dire...
	
	KjornToldDragon = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Dragon2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Dragon2_15_00"); //Dites-m'en plus au sujet des dragons.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01"); //Mais tous les dragons ne sont pas pareils.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02"); //Certains peuvent recouvrir toute la région d'une glace épaisse de plusieurs pieds.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03"); //D'autres préfèrent vivre dans des marais ou dans des volcans.
	
	B_LogEntry (TOPIC_DRACHENJAGD,"Kjorn, le chasseur de dragon, pense qu'il existe différentes espèces de dragons. Certains préfèrent le froid, d'autres les endroits humides et d’autres encore le feu."); 

	KjornToldDragon = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Das Minental -----

FUNC VOID DIA_Kjorn_BuyInfos_Colony1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony1_15_00"); //Parlez-moi de la Vallée des mines.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_01"); //La Vallée des mines de Khorinis est réputée dans tout le pays pour son minerai magique.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_02"); //C'est uniquement dans ces montagnes que l'on peut trouver le minerai magique.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_03"); //Une arme forgée avec ce minerai est indestructible et peut percer l'armure la plus résistante.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony1_06_04"); //Il y a encore quelques semaines, la vallée était entourée d'une barrière magique. Elle était impénétrable et personne ne pouvait en sortir.

	KjornToldColony = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Colony2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Colony2_15_00"); //Dites-m'en plus au sujet de la Vallée des mines.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_01"); //Ces derniers jours, la vallée a beaucoup changé.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_02"); //Quand les orques sont arrivés, d'autres créatures horribles sont apparues. Des créatures comme on n'en avait jamais vu dans la région.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_03"); //On dit qu'il reste encore quelques chasseurs solitaires mais je ne sais même pas s'ils sont encore en vie.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Colony2_06_04"); //On dirait que toutes les créatures de Béliar se sont réunies dans cette vallée.
	
	KjornToldColony = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//----- Die Burg -----

FUNC VOID DIA_Kjorn_BuyInfos_OldCamp1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //Parlez-moi du château.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //Il se trouve à peu près au centre de la Vallée des mines.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //Quand la vallée était encore une prison, les barons du minerai y contrôlaient le trafic de minerai.
	
	KjornToldOldCamp = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};


//----- Die Orks -----

FUNC VOID DIA_Kjorn_BuyInfos_Orks1 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks1_15_00"); //Parlez-moi des orques.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_01"); //Les orques ne sont pas là depuis longtemps. Tout au moins ceux réunis devant le château.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_02"); //Mais je me pose des questions sur la manière dont ils sont organisés. Généralement, les orques attaquent aveuglément sans se poser de question.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks1_06_03"); //Eux, ils prennent leur temps. Ils attendent mais on ne sait pas quoi.
	
	KjornToldOrks = 1;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

FUNC VOID DIA_Kjorn_BuyInfos_Orks2 ()
{
	AI_Output (other,self ,"DIA_Kjorn_BuyInfos_Orks2_15_00"); //Dites-m'en plus au sujet des orques.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_01"); //Ils sont dirigés par des guerriers d'élite. Ces derniers sont très forts et portent de lourdes armures. Ils sont presque impossibles à vaincre.
	AI_Output (self ,other,"DIA_Kjorn_BuyInfos_Orks2_06_02"); //J'ai vu l'un d'entre eux abattre un chêne d'un coup de hache.
	
	KjornToldOrks = 2;
	Info_ClearChoices (DIA_Kjorn_BuyInfos);
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kjorn_AllDragonsDead   (C_INFO)
{
	npc         = DJG_710_Kjorn;
	nr          = 5;
	condition   = DIA_Kjorn_AllDragonsDead_Condition;
	information = DIA_Kjorn_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "J'ai tué tous les dragons !";
				
};

FUNC INT DIA_Kjorn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kjorn_AllDragonsDead_15_00"); //J'ai tué tous les dragons !
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_01"); //(rires) C'est ça et moi je suis un paladin.
	AI_Output 	(self ,other,"DIA_Kjorn_AllDragonsDead_06_02"); //Vous en avez peut-être tué un, mais tous... j'en doute. Allez raconter ça à quelqu'un d'autre.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kjorn_PICKPOCKET (C_INFO)
{
	npc			= DJG_710_Kjorn;
	nr			= 900;
	condition	= DIA_Kjorn_PICKPOCKET_Condition;
	information	= DIA_Kjorn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kjorn_PICKPOCKET_Condition()
{
	C_Beklauen (47, 75);
};
 
FUNC VOID DIA_Kjorn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_BACK 		,DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kjorn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};
	
func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kjorn_PICKPOCKET);
};


