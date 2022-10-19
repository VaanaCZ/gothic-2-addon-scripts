// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Ah, un client�! Que puis-je pour vous�?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "Je cherche une chambre.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //Je suis � la recherche d'un endroit o� dormir.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //Dans ce cas, vous avez frapp� � la bonne porte.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Un des paladins m'a dit que je pouvais dormir ici gratuitement...
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Combien pour une nuit ?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Absolument rien.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Les paladins ont � charge le logement de tous les voyageurs.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //Cela veut dire que je peux dormir ici sans payer�?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Mais oui.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Montez � l'�tage.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Il nous reste encore un ou deux lits de libres.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "Pourquoi est-ce que les paladins paient pour tout ?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Pourquoi les paladins payent-ils tout�?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //A vrai dire, je ne le sais pas non plus.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Pour commencer, je crois qu'ils veulent s'assurer que les pauvres diables ne tra�nent plus dans les rues et ne leur causent pas d'ennuis.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //Et cela leur permet �galement de se mettre les voyageurs dans leur poche.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Comme les fermiers sont en train de se rebeller, nous sommes oblig�s de nous tourner vers les marchands pour obtenir les provisions dont nous avons besoin.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //Et puis, je crois que les paladins font tout leur possible pour am�liorer le moral des habitants de la ville.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Le seigneur Andr� a m�me fait en sorte que l'on serve de la bi�re gratuitement sur la place de la potence.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "Qui demeure ici en ce moment ?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //Qui loge chez vous en ce moment�?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Presque tous mes clients sont des marchands ambulants qui vendent leurs articles au march�.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Ah-ha�!
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //Ne touchez surtout pas � leurs affaires, vous m'entendez�? Je ne veux pas d'ennuis ici�!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "J'ai quelques questions au sujet de la ville...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //J'aurais quelques questions � vous poser au sujet de la ville...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"O� puis-je acheter des choses dans le coin ?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Parlez-moi de la ville.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //O� puis-je faire des achats par ici�?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //Le march� se trouve juste de l'autre c�t� de la porte. Vous devriez pouvoir y trouver tout ce que vous cherchez.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Il y a aussi quelques �choppes et artisans de l'autre c�t� de la ville. La plupart d'entre eux sont situ�s pr�s de l'autre porte.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //Sans oublier le marchand de poisson du quartier du port. Impossible de le manquer, sa boutique donne directement sur le port.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Parlez-moi de la ville...
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis est l'une des villes les plus riches du royaume, m�me si on ne le dirait pas � l'heure actuelle.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Mais le commerce a pour ainsi dire cess� depuis le d�but de la guerre contre les orques. Le roi a r�quisitionn� la totalit� des navires marchands pour les int�grer � sa flotte de guerre,
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //ce qui signifie que notre port ne voit plus arriver le moindre bateau. Nous ne recevons donc presque plus de provisions et beaucoup d'habitants se font du souci.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nul ne sait de quoi demain sera fait, d'autant que nous ne pouvons rien faire d'autre qu'attendre. Nous ne sommes pas en position de faire �voluer la situation.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht�s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "Qu'y a-t-il?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //Comment �a se passe ?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Vous ne donnez pas l'impression de vous pr�occuper des ennuis des autres.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Oui, bien s�r.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"�a d�pend.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Pas vraiment.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Pas vraiment.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //C'est bien ce que je disais. Chacun ne pense qu'� soi-m�me, ici. Alors, qu'est-ce que vous voulez�?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //�a d�pend...
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //�a d�pend de combien vous avez � y gagner ?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Quelqu'un comme vous ne m'est d'aucune utilit�.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Oui, bien s�r.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //La vie est pleine de surprises, vous savez. Il y a quelque temps, j'ai fait du vide dans mon grenier et j'ai vendu tout un tas de vieilles cartes � Brahim, le cartographe du port.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Malheureusement, je me suis rendu compte peu de temps apr�s que j'avais perdu un papier important.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //J'imagine qu'il a d� se glisser au milieu des cartes.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Vous voulez bien aller le rechercher pour moi�?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Il manque un document � Hanna. Il aurait disparu au port o� se trouve le cartographe Brahim."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Je ne suis pas un coursier.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"Et qu�est-ce que j'ai � y gagner ?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Je vais voir ce que je peux faire.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Je ne suis pas un gar�on de courses.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Je vois. Les soucis d'une femme comme une autre sont bien trop triviaux pour vous. Il va me falloir m'en charger moi-m�me j'imagine...

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //Et qu'est-ce que j'ai � y gagner ?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Ah, je le savais�! Vous ne valez pas mieux que la racaille qui tra�ne au port�!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Alors, qu'est-ce que vous allez exiger de la vieille femme que je suis�?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Laissez tomber.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Vous pourriez �tre gentille avec moi.",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"De l'or.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Laissez tomber.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Au moins, il vous reste un minimum de d�cence. Ramenez-moi ce document et je vous remettrai 75 pi�ces d'or.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Vous pourriez vous montrer gentille avec moi...
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //Je... comment osez-vous�! Fichez-moi le camp, esp�ce de rustre�!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //De l'or.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Ne vous attendez pas � vous enrichir avec moi. Bah, ce papier vaut bien 50 pi�ces d'or...
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Je vous donnerai 50 pi�ces d'or si vous me ramenez ce document.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Je verrai ce que je peux faire.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //Vous �tes vraiment gentil. Bonne chance�!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Je vous r�compenserai si vous me ramenez ce papier.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftst�ck?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Vous voulez parler de ce document ?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //C'est de ce document dont vous vouliez parler ?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Oui, c'est celui-l�. Merci.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //O� est ma r�compense�?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Pas si vite�! Tenez, voici votre argent.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //D'o�... d'o� sortez-vous�?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //J'ai trouv� quelque chose d'int�ressant dans votre cave...
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //Que faisiez-vous dans ma cave�?
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //Vous le savez tr�s bien�!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(glaciale) J'ignore de quoi vous voulez parler.
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(m�fiante) Regardez-vous�! D'o� sortez-vous donc, hein�?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //(embarrass�) Eh bien, euh...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(�clate de rire) Je sais�!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(en apart�) Inutile de me le dire, d'accord�? J'ai compris.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Mais ne volez rien ici, c'est bien compris�?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //Il ne faut surtout pas attirer l'attention sur notre �tablissement.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "Regardez le livre que j'ai ici !";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Regardez le livre que j'ai l�.
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //Le grand livre de Lehmar�? Comment vous l'�tes-vous procur�?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //Eh bien...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //Si Lehmar ne l'a plus, c'est d�j� une bonne chose en soi. Mais je pr�f�rerais l'avoir en ma possession...
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Tenez, prenez le livre.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Tenez, prenez-le.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Merci.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Prenez ceci en guise de r�compense.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //Qu'est-ce que vous venez de me donner�?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //Une cl� permettant d'ouvrir la porte de la richesse.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Tout va bien dans la cachette�?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //Cela fait quelque temps que je ne les ai pas vus.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Il serait bon que j'aille y faire un tour afin de v�rifier que tout va bien quand j'aurai le temps.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Oui, mais je pr�f�rerais que vous n'en parliez pas.
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //Vous �tes au courant pour la cachette des voleurs�?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(sourit) Je ne vois vraiment pas de quoi vous voulez parler.
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //La milice est venue�! Quelqu'un a parl� pour la cachette�!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Les miliciens n'ont pas pu m'accuser, mais Cassia et ses hommes sont morts�!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Je suis s�re que c'est vous le responsable�!
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //J'ai achet� ceci juste pour vous.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Cela m'a co�t� cher, mais vous le m�ritez bien, esp�ce de sale type...
};	

	
