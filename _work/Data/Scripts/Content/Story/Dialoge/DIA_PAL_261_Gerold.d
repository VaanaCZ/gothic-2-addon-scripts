// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gerold_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_EXIT_Condition;
	information	= DIA_Gerold_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gerold_EXIT_Condition()
{
	if (Kapitel < 4)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gerold_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 	Wer sitzt im Kerker?
// ************************************************************
INSTANCE DIA_Gerold_Hallo (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Hallo_Condition;
	information	= DIA_Gerold_Hallo_Info;
	permanent	= FALSE;
	description = "Que gardez-vous ?";
};                       
FUNC INT DIA_Gerold_Hallo_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Hallo_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Hallo_15_00");//Qu'est-ce que vous gardez ?
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_01");//Les prisonniers.
	AI_Output	(other,self ,"DIA_Gerold_Hallo_15_02");//De qui s'agit-il ?
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_03");//Quelques détenus et un mercenaire, Gorn. Un vrai dur celui-là. Fort comme un taureau.
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_04");//Il a fallu quatre hommes pour le contenir.
};	
// ************************************************************
// 	Kerker
// ************************************************************
INSTANCE DIA_Gerold_Jail (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Jail_Condition;
	information	= DIA_Gerold_Jail_Info;
	permanent	= FALSE;
	description ="Pouvez-vous me laisser entrer dans le donjon ?";
};                       
FUNC INT DIA_Gerold_Jail_Condition()
{
	if (Kapitel == 2)
	&& Npc_KnowsInfo (other, DIA_Gerold_Hallo)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Jail_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Jail_15_00");//Pouvez-vous me laisser accéder au cachot ?
	AI_Output	(self ,other,"DIA_Gerold_Jail_12_01");//Non. Personne n'a le droit d'y entrer, et je dis bien personne. Aucune exception, même pour Milten ou pour vous.
	AI_Output	(self ,other,"DIA_Gerold_Jail_12_02");//Ce n'est pas une taverne où l'on peut aller et venir à son gré. Ne l'oubliez pas.
	
	KnowsAboutGorn = TRUE;  
};	
// ************************************************************
// 	Ausnahme
// ************************************************************
INSTANCE DIA_Gerold_Ausnahme (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Ausnahme_Condition;
	information	= DIA_Gerold_Ausnahme_Info;
	permanent	= FALSE;
	description ="Ne pouvez-vous pas faire une exception pour moi ?";
};                       
FUNC INT DIA_Gerold_Ausnahme_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerold_Jail))
	&& (Kapitel == 2)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Ausnahme_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Ausnahme_15_00");//Vous ne pouvez pas faire une exception pour moi ?
	AI_Output	(self ,other,"DIA_Gerold_Ausnahme_12_01");//Non.
};	
// ************************************************************
// 	Gold
// ************************************************************
INSTANCE DIA_Gerold_Gold (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Gold_Condition;
	information	= DIA_Gerold_Gold_Info;
	permanent	= FALSE;
	description ="Et si je vous donnais de l'or ?";
};                       
FUNC INT DIA_Gerold_Gold_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerold_Ausnahme))
	&& (Kapitel == 2)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Gold_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Gold_15_00");//Et si je vous offre de l'or ?
	AI_Output	(self ,other,"DIA_Gerold_Gold_12_01");//Hmm...
	AI_Output	(self ,other,"DIA_Gerold_Gold_12_02");//Non.
};		
// ************************************************************
// 	Deal mit Gerold um Brief reinzuschmuggeln
// ************************************************************
INSTANCE DIA_Gerold_Deal (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Deal_Condition;
	information	= DIA_Gerold_Deal_Info;
	permanent	= FALSE;
	description ="J'ai un message pour l'un des prisonniers.";
};                       

FUNC INT DIA_Gerold_Deal_Condition()
{
	
	IF 	 (MIS_RescueGorn == LOG_RUNNING)
	&&	 (Npc_HasItems (other,ItWr_LetterForGorn_MIS) >=1)
	&& 	 (Kapitel == 2)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Gerold_Deal_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_00");	//J'ai ici une note à l'attention de l'un des prisonniers. Pouvez-vous la lui transmettre ?
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_01");	//Hmm... je ne pense pas que cela pose le moindre problème. A qui s'adresse ce message ?
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_02");	//A Gorn.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_03");	//C'est un prisonnier très important. Je ne pense pas que Garond serait d'accord. Mais si vous y tenez vraiment, nous devrions pouvoir trouver un terrain d'entente.
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_04");	//Que voulez-vous ?
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_05");	//Nos rations de nourriture ne cessent de diminuer. J'aimerais bien faire un bon repas pour changer.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_06");	//Apportez-moi une bonne saucisse et une miche de pain frais, sans oublier du miel.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_07");	//Et une bouteille de vin pour accompagner le tout. Oui, cela devrait faire l'affaire. Vous devriez y arriver, non ? Revenez quand vous aurez tout.
	
	B_LogEntry (TOPIC_RescueGorn,"Si j'apporte à Gérold une saucisse, du pain, du vin et du miel, il transmettra le message à Gorn.");
};	
// ************************************************************
// 	Deal Stuff
// ************************************************************		  				   
INSTANCE DIA_Gerold_Stuff (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Stuff_Condition;
	information	= DIA_Gerold_Stuff_Info;
	permanent	= TRUE;
	description = "J'ai quelque chose pour vous...";
};
//-----------------------------------                       
var int DIA_Gerold_Stuff_permanent;
//-----------------------------------
FUNC INT DIA_Gerold_Stuff_Condition()
{
	IF (Npc_HasItems (other,ItWr_LetterForGorn_MIS) >=1 )
	&&	Npc_KnowsInfo (other,DIA_Gerold_Deal)
	&& (Kapitel == 2)
	&& (DIA_Gerold_Stuff_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Gerold_Stuff_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Stuff_15_00");	//J'ai quelque chose pour vous... la nourriture que vous m'avez demandée.
	
	
	//------------------HACK für deutliche Anzeige-------------------
	
	if (Npc_HasItems (other, ItFo_Honey) >= 1)
	&& (Npc_HasItems (other, ItFo_Bread) >= 1)
	&& (Npc_HasItems (other, ItFo_Wine) >= 1)
	&& (Npc_HasItems (other, ItFo_Sausage) >= 1)
	{
		 AI_PrintScreen ("Honig gegeben",	 -1, 34, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Brot gegeben",	 -1, 37, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Wein gegeben",     -1, 40, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Wurst gegeben",  	 -1, 43, FONT_ScreenSmall, 2);
			
		Npc_RemoveInvItems (other, ItFo_Honey,1);
		Npc_RemoveInvItems (other, ItFo_Bread,1);
		Npc_RemoveInvItems (other, ItFo_Wine,1);
		Npc_RemoveInvItems (other, ItFo_Sausage,1);	
	/*
	if (B_GiveInvItems (other,self,ItFo_Honey  ,1)
	&&  B_GiveInvItems (other,self,ItFo_Bread  ,1)
	&&  B_GiveInvItems (other,self,ItFo_Wine   ,1)
	&&  B_GiveInvItems (other,self,ItFo_Sausage,1))
	{
	*/
	
		AI_Output	(self ,other,"DIA_Gerold_Stuff_12_01");	//Bien. Donnez-moi ça. Vous avez le message ?
		AI_Output   (other,self ,"DIA_Gerold_Stuff_15_02"); //Oui, tenez. N'oubliez pas : il est pour Gorn.
		AI_Output 	(self ,other,"DIA_Gerold_Stuff_12_03"); //Revenez demain. D'ici là, il aura reçu le message.
		
		B_GiveInvItems (other,self ,ItWr_LetterForGorn_MIS,1); 
		DayContactGorn = Wld_GetDay();
		DIA_Gerold_Stuff_permanent = TRUE;
		
		B_LogEntry (TOPIC_RescueGorn,"Gérold a obtenu ce qu'il voulait et il s'occupera du message.");
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gerold_Stuff_12_04"); //Revenez quand vous aurez ce que je vous ai demandé.
	};
};
// ************************************************************
// 	Deal Antwort
// ************************************************************		  	
INSTANCE DIA_Gerold_Antwort (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Antwort_Condition;
	information	= DIA_Gerold_Antwort_Info;
	permanent	= TRUE;
	description = "Gorn a-t-il reçu le message ?";
};                       
//-------------------------------------
var int DIA_Gerold_Antwort_permanent; 
//-------------------------------------
FUNC INT DIA_Gerold_Antwort_Condition()
{	
	if (DIA_Gerold_Stuff_permanent == TRUE)
	&& (Kapitel == 2)
	&& (DIA_Gerold_Antwort_permanent == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Gerold_Antwort_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Antwort_15_00");//Est-ce que Gorn a reçu le message ?
	
	if (DayContactGorn < Wld_GetDay() )
	{
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_01");//Oui. Il m'a demandé de vous donner la réponse suivante...
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_02");//Et ?
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_03");//C'est à la porte sud.
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_04");//Il a ajouté autre chose ?
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_05");//Non. Aucune idée de ce qu'il a bien pu vouloir dire. Et vous ?
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_06");//Peut-être... mais ne vous tracassez pas pour si peu.
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_07");//Vous avez sans doute raison.
		
		
		GornsTreasure = TRUE;	
		DIA_Gerold_Antwort_permanent = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Gorn dit que son or se trouve à la porte sud.");
	}
	else
	{
		AI_Output	(self ,other,"DIA_Gerold_GornsAnswer_12_08");//Non, pas encore. Revenez plus tard.
	};
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 	Offizielle Freilassung
// ************************************************************		  	
INSTANCE DIA_Gerold_SetGornFree (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_SetGornFree_Condition;
	information	= DIA_Gerold_SetGornFree_Info;
	permanent	= FALSE;
	description = "Libérez Gorn.";
};                       

FUNC INT DIA_Gerold_SetGornFree_Condition()
{	
	if (Garond_Kerkerauf == TRUE)
	&& (Kapitel == 2)	
	{
		return TRUE;	
	};
};
 
FUNC VOID DIA_Gerold_SetGornFree_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_SetGornFree_15_00");//Libérez Gorn, sur ordre du commandant Garond.
	AI_Output	(self ,other,"DIA_Gerold_SetGornFree_12_01");//Je suis au courant. Tenez, voici la clé, vous pouvez entrer.

	CreateInvItems (self, ItKe_PrisonKey_MIS,1);
	B_GiveInvItems	(self,other,ItKe_PrisonKey_MIS,1);
	B_LogEntry (TOPIC_RescueGorn,"Gérold m'a donné la clef de la prison.");
};
// ************************************************************
// 	Perm
// ************************************************************
INSTANCE DIA_Gerold_Perm (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 900;
	condition	= DIA_Gerold_Perm_Condition;
	information	= DIA_Gerold_Perm_Info;
	permanent	= TRUE;
	description = "Vous ne dormez jamais ?";
};                       
FUNC INT DIA_Gerold_Perm_Condition()
{
	if (Kapitel < 4)
	&& Npc_KnowsInfo (other,DIA_Gerold_Gold)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Perm_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Perm_15_00");//Vous ne dormez jamais ?
	AI_Output	(self ,other,"DIA_Gerold_Perm_12_01");//Non. Innos lui-même me confère la force de n'avoir jamais besoin de sommeil.
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

INSTANCE DIA_Gerold_KAP4_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_KAP4_EXIT_Condition;
	information	= DIA_Gerold_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gerold_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////
//	Info AllesRuhig
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_KAP4_ALLESRUHIG		(C_INFO)
{
	npc		 = 	PAL_261_Gerold;
	nr		 = 	30;
	condition	 = 	DIA_Gerold_KAP4_ALLESRUHIG_Condition;
	information	 = 	DIA_Gerold_KAP4_ALLESRUHIG_Info;

	description	 = 	"Tout est calme ?";
};

func int DIA_Gerold_KAP4_ALLESRUHIG_Condition ()
{
	if (Kapitel >= 4)	
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Info ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_00"); //Tout est calme ?
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_01"); //Oui, très calme.
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_02"); //Mais ?
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_03"); //J'ai le ventre si creusé qu'on va finir par voir au travers. Garond a encore réduit nos rations.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_04"); //Si je ne fais pas un repas digne de ce nom, et vite, je vais finir par le mordre, notre bien-aimé commandant...

	Info_ClearChoices	(DIA_Gerold_KAP4_ALLESRUHIG);
	Info_AddChoice	(DIA_Gerold_KAP4_ALLESRUHIG, "Pas mon problème.", DIA_Gerold_KAP4_ALLESRUHIG_Nein );
	Info_AddChoice	(DIA_Gerold_KAP4_ALLESRUHIG, "Peut-être pourrai-je vous donner quelque chose ?", DIA_Gerold_KAP4_ALLESRUHIG_geben );
};
func void DIA_Gerold_KAP4_ALLESRUHIG_geben ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00"); //Peut-être que je pourrais vous donner quelque chose.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01"); //Vous êtes dingue, ou quoi ? Pas ici, surtout ! Il suffirait que quelqu'un nous voie pour que je me retrouve avec un tas de nouveaux amis, si vous voyez ce que je veux dire...
	if 	(Wld_IsTime	(23,10,08,00) == FALSE)
	{
		AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02"); //Venez me retrouver dans le temple des magiciens quand tout le monde se sera retiré pour la nuit.
	}
	else
	{
		AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03"); //Vite, suivez-moi jusqu'au temple des magiciens avant que tout le monde ne se réveille. Je ne tiens pas à attendre jusqu'à demain.
	};
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04"); //Il n'y a pour ainsi dire personne au temple à cette heure de la journée. Je vous attendrai là-bas.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05"); //Mais ne m'apportez pas du pain rassis ou de la viande avariée, c'est compris ?

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Food"); 

 	Log_CreateTopic (TOPIC_GeroldGiveFood, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GeroldGiveFood, LOG_RUNNING);
	B_LogEntry (TOPIC_GeroldGiveFood,"Garond a encore réduit les rations. Je ferais bien de donner quelque chose à manger à Gérold avant que sa faim ne le pousse à faire quelque chose de stupide. Je dois le rencontrer à la maison des magiciens du château quand tout le monde dormira."); 

	MIS_GeroldGiveFood = LOG_RUNNING;
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Nein ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00"); //Pas mon problème.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01"); //Evidemment ! Pas de risque que Garond réduise vos rations à vous...
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02"); //Même s'il ne l'admettra jamais, il est mort de trouille et persuadé que vous seul pouvez le sauver.

	AI_StopProcessInfos (self);
};

var int Gerold_FoodCounter;
///////////////////////////////////////////////////////////////////////
//	Info Food
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_FOOD		(C_INFO)
{
	npc		 = 	PAL_261_Gerold;
	nr		 = 	31;
	condition	 = 	DIA_Gerold_FOOD_Condition;
	information	 = 	DIA_Gerold_FOOD_Info;
	important	 = 	TRUE;
};

func int DIA_Gerold_FOOD_Condition ()
{
	if (Npc_GetDistToWP(self,"OC_MAGE_IN")<500) 
		&& (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Gerold_MoreFood ()
{
	Info_ClearChoices	(DIA_Gerold_FOOD);

	if (Gerold_FoodCounter > 8)
	{
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_00"); //Ça suffit amplement. Avec tout ça, j'ai de quoi faire pour quelque temps.
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_01"); //Tenez, voici tout mon argent. Ce n'est pas comme si je pouvais acheter quoi que ce soit ici de toute façon.
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_02"); //Bon, il vaut mieux que j'y aille avant que quelqu'un ne nous voie.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"Start");
		MIS_GeroldGiveFood = LOG_SUCCESS;
		B_GivePlayerXP (XP_GeroldGiveFood);	
		CreateInvItems 		(self, ItMi_Gold, 450);									
		B_GiveInvItems 		(self, other, ItMi_Gold, 450);					
	}
	else
	{
		if (Gerold_FoodCounter == 0)
			{
				Info_AddChoice	(DIA_Gerold_FOOD, "Je n'ai rien pour l'instant.", DIA_Gerold_FOOD_nichts );
			}
		else
			{
				Info_AddChoice	(DIA_Gerold_FOOD, "C'est tout ce que j'ai.", DIA_Gerold_FOOD_kaese_nichtmehr );
				if (Gerold_FoodCounter < 5)
				{
					AI_Output			(self, other, "DIA_Gerold_MoreFood_12_03"); //Donnez-moi ça. Vous en avez davantage ?
				}
				else
				{
					AI_Output			(self, other, "DIA_Gerold_MoreFood_12_04"); //Oui. Encore, encore !
				};
			};
			
		if Npc_HasItems (other,ItFo_FishSoup)
				|| Npc_HasItems (other,ItFo_Stew)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Donner de la soupe)", DIA_Gerold_FOOD_Suppe );
			};
		if Npc_HasItems (other,ItFoMutton)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Donner de la viande)", DIA_Gerold_FOOD_fleisch );
			};
		if Npc_HasItems (other,ItFo_Bacon)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Donner du jambon)", DIA_Gerold_FOOD_schinken );
			};
		if Npc_HasItems (other,ItFo_Cheese)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Donner du fromage)", DIA_Gerold_FOOD_kaese );
			};
		if Npc_HasItems (other,ItFo_Sausage)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Donner une saucisse)", DIA_Gerold_FOOD_Wurst );
			};
			Gerold_FoodCounter = (Gerold_FoodCounter +1);
	};
};

func void DIA_Gerold_FOOD_Info ()
{
	AI_Output			(self, other, "DIA_Gerold_FOOD_12_00"); //Tenez. Bon, et maintenant ? Vous avez quelque chose à manger pour moi ?

	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_nichts ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_nichts_15_00"); //Je n'ai rien pour le moment.
	AI_Output			(self, other, "DIA_Gerold_FOOD_nichts_12_01"); //Vous commencez par m'en parler tant et plus, et maintenant, vous essayez de me flouer ?
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Npc_ExchangeRoutine	(self,"Start"); 
	MIS_GeroldGiveFood = LOG_FAILED;
	B_GivePlayerXP (XP_Ambient);
};


func void DIA_Gerold_FOOD_kaese_nichtmehr ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_kaese_nichtmehr_15_00"); //C'est tout ce que je possède.
	AI_Output			(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_01"); //Et vous voudriez que je le croie ? D'accord, c'est déjà mieux que rien. Tenez, voici un peu d'or en échange.
	CreateInvItems 		(self, ItMi_Gold, 50);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 50);					
	AI_Output			(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_02"); //Bon, il faut que je retourne à mon poste.
	AI_StopProcessInfos (self);
	
	var int XP_GeroldGiveFoodLow;
	var int Teiler;
	
	if (Gerold_FoodCounter < 4)
		{
			Teiler = 3;
		}
	else
		{
			Teiler = 2;
		};
	
	XP_GeroldGiveFoodLow = (XP_GeroldGiveFood/Teiler);
	
	Npc_ExchangeRoutine	(self,"Start");
	MIS_GeroldGiveFood = LOG_OBSOLETE;
	B_GivePlayerXP (XP_GeroldGiveFoodLow);	
};

func void DIA_Gerold_FOOD_kaese ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_kaese_15_00"); //Un morceau de fromage bien crémeux, ça vous dirait ?
	B_GiveInvItems (other,self , ItFo_Cheese, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_Wurst ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_Wurst_15_00"); //Une saucisse ?
	B_GiveInvItems (other,self , ItFo_Sausage, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_schinken ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_schinken_15_00"); //Je pourrais vous donner ce jambon...
	B_GiveInvItems (other,self , ItFo_Bacon, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_fleisch ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_fleisch_15_00"); //Un morceau de viande ?
	B_GiveInvItems (other,self , ItFoMutton, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_Suppe ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_Suppe_15_00"); //Une bonne soupe vous ferait le plus grand bien, vous ne croyez pas ?

	if (B_GiveInvItems (other, self, ItFo_FishSoup,1))
		{
		}
		else
		{
			B_GiveInvItems (other,self , ItFo_Stew, 1);
		};
	DIA_Gerold_MoreFood ();
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_PERM4		(C_INFO)
{
	npc		 = 	PAL_261_Gerold;
	nr		 = 	41;
	condition	 = 	DIA_Gerold_PERM4_Condition;
	information	 = 	DIA_Gerold_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Toujours faim ?";
};

func int DIA_Gerold_PERM4_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Gerold_KAP4_ALLESRUHIG))
		{
				return TRUE;
		};
};

func void DIA_Gerold_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Gerold_PERM4_15_00"); //Vous avez encore faim ?
	
	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_01"); //Si les orques nous attaquent de nouveau, même un ventre plein ne m'aidera pas...
	}
	else if (MIS_GeroldGiveFood == LOG_SUCCESS)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_02"); //C'est une blague ? J'ai la panse qui va exploser ! Encore merci !
	}
	else if (MIS_GeroldGiveFood == LOG_OBSOLETE)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_03"); //Oui, mais merci de votre aide.
	}
	else
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Gerold_PERM4_12_04"); //Tout va bien, maître.
		}
		else
		{
			AI_Output			(self, other, "DIA_Gerold_PERM4_12_05"); //Fichez le camp !
		};
	};
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Gerold_KAP5_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_KAP5_EXIT_Condition;
	information	= DIA_Gerold_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gerold_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Gerold_KAP6_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_KAP6_EXIT_Condition;
	information	= DIA_Gerold_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gerold_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gerold_PICKPOCKET (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 900;
	condition	= DIA_Gerold_PICKPOCKET_Condition;
	information	= DIA_Gerold_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Gerold_PICKPOCKET_Condition()
{
	C_Beklauen (71, 170);
};
 
FUNC VOID DIA_Gerold_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gerold_PICKPOCKET);
	Info_AddChoice		(DIA_Gerold_PICKPOCKET, DIALOG_BACK 		,DIA_Gerold_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gerold_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gerold_PICKPOCKET_DoIt);
};

func void DIA_Gerold_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gerold_PICKPOCKET);
};
	
func void DIA_Gerold_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gerold_PICKPOCKET);
};















































