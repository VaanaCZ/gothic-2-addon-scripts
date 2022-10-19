///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_EXIT   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 999;
	condition   = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kardif_EXIT_Condition()
{
	if (Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Kardif_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Kardif_PICKPOCKET (C_INFO)
{
	npc			= VLK_431_Kardif;
	nr			= 900;
	condition	= DIA_Kardif_PICKPOCKET_Condition;
	information	= DIA_Kardif_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kardif_PICKPOCKET_Condition()
{
	C_Beklauen (55, 85);
};
 
FUNC VOID DIA_Kardif_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kardif_PICKPOCKET);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_BACK 		,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
	
func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hi		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hi_Condition;
	information	 = 	DIA_Kardif_Hi_Info;
	permanent    =  FALSE;
	description	 = 	"Qu'y a-t-il?";
};
func int DIA_Kardif_Hi_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hi_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hi_15_00"); //Comment ça va ?
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //Si vous voulez boire quelque chose, il faut passer commande.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif vend des boissons au pub du port.");
};	
	
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hallo		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hallo_Condition;
	information	 = 	DIA_Kardif_Hallo_Info;
	permanent    =  FALSE;
	description	 = 	"Je parie que vous entendez plein de choses...";
};
func int DIA_Kardif_Hallo_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Kardif_Hi)
	&& (Kardif_Deal == 0)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //Je parie que vous entendez des tas de choses...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //Et alors ? En quoi est-ce que cela vous regarde ?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //Tout ce qui se raconte m'intéresse généralement.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //Dans ce cas, j'espère que vous avez la bourse bien remplie.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Chaque information communiquée vous coûtera 10 pièces d'or.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, le propriétaire du pub du port, vend des informations.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Je ne vous en donnerai pas plus de 5 pour votre info.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Laissez tomber, j'aurai cette information ailleurs.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Très bien, d'accord.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //D'accord.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //Vous faites une affaire. (sourit) Je suis à votre service.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //Je ne vous donnerai pas plus de 5 pièces d'or par renseignement.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //Hein ? Mais vous voulez ma mort, ou quoi ? (réfléchit rapidement) Disons 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Non, ça va pas. Disons 6 !",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Très bien, 7 pièces d'or ! Ça me paraît honnête.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //N'en parlons plus, j'irai me renseigner ailleurs.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //D'accord, d'accord, je veux bien descendre jusqu'à 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Très bien, 7 pièces d'or ! Ça me paraît honnête.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Non, je n'ai pas autant besoin de cette information.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //7 pièces d'or ? Ça me semble honnête.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //(sourit) Voilà une sage décision. Bien, si vous voulez savoir quoi que ce soit, posez vos questions.
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //Je n'ai pas besoin de renseignements à ce point.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //Hé, attendez ! (soupire) Bon d'accord, 5 pièces d'or. Mais je n'irai pas plus bas !
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Pourquoi ne pas l'avoir dit tout de suite ?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //Pourquoi ne pas l'avoir dit tout de suite ?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //Je ne suis pas en forme, c'est tout. Mais bon, marché conclu.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //Non, ça ne marche pas comme ça. Disons 6.
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //Vous êtes un véritable escroc, vous savez ? Bon d'accord. Si vous insistez, disons 6 pièces d'or par renseignement.
	Kardif_Deal = 6;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TRADE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TRADE_Condition;
	information	 = 	DIA_Kardif_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Donnez-moi quelque chose à boire.";
};

func int DIA_Kardif_TRADE_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Kardif_TRADE_15_00"); //Donnez-moi quelque chose à boire.
};
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TradeInfo		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TradeInfo_Condition;
	information	 = 	DIA_Kardif_TradeInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"J'ai besoin d'informations.";
};

func int DIA_Kardif_TradeInfo_Condition ()
{
	if (Kardif_OneQuestion == FALSE)
	&& (Kardif_Deal > 0)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_TradeInfo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //J'ai besoin de renseignements.

	Kardif_OneQuestion = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
FUNC VOID B_SayKardifZuwenigGold()
{
	AI_Output (self,other, "B_SayKardifZuwenigGold_14_00");//Revenez quand vous aurez de quoi payer.
};
instance DIA_Kardif_Buerger		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Buerger_Condition;
	information	 = 	DIA_Kardif_Buerger_Info;
	permanent    =  TRUE;
	description	 = 	"Qui fait partie des membres influents de la ville ?";
};
//-------------------------------------------
var int DIA_Kardif_Buerger_permanent;
//-------------------------------------------
func int DIA_Kardif_Buerger_Condition ()
{	
	if (DIA_Kardif_Buerger_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Buerger_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //Qui sont les citoyens influents de la ville ?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //Vous n'en trouverez pas dans le quartier du port. Ici, il n'y a qu'un seul homme puissant : Lehmar.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //Le prêteur sur gages n'est pas populaire, mais il est riche et beaucoup de gens influents lui doivent de l'argent.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //Les marchands et les artisans aussi ont beaucoup d'influence. Trop, si vous voulez mon avis.
		
		
		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

// *****************************************************
//						Lehmar
// *****************************************************

instance DIA_Kardif_Lehmar	(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lehmar_Condition;
	information	 = 	DIA_Kardif_Lehmar_Info;
	permanent    =  TRUE;
	description	 = 	"Qui a des dettes envers Lehmar ?";
};
//-------------------------------------------
var int DIA_Kardif_Lehmar_permanent;
//-------------------------------------------
func int DIA_Kardif_Lehmar_Condition ()
{	
	if (DIA_Kardif_Lehmar_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Buerger_permanent == TRUE) //(Knows perm Info)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lehmar_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //Qui doit de l'argent à Lehmar ?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //(éclate de rire) Si vous voulez le savoir, jetez un œil à son grand livre.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //Evidemment, il sera peut-être difficile de le consulter sans que Lehmar s'en aperçoive.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //Pour autant que je sache, ce dernier le garde toujours sur lui.
		
		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};



///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Arbeit		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Arbeit_Condition;
	information	 = 	DIA_Kardif_Arbeit_Info;
	permanent    =  TRUE;
	description	 = 	"Où puis-je trouver du travail ?";
};
//-------------------------------------------
var int DIA_Kardif_Arbeit_permanent;
//-------------------------------------------
func int DIA_Kardif_Arbeit_Condition ()
{	
	if (DIA_Kardif_Arbeit_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Arbeit_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //Où puis-je trouver du travail ?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //Vous ne risquez pas d'en trouver au port. Pour ça, il faut aller trouver les artisans du bas quartier.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //Sinon si vous savez vous battre, il y a aussi la possibilité d'aller défier Alrik. Il se bat pour de l'argent, derrière l'entrepôt.
			
	DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Kardif_MissingPeople		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Addon_Kardif_MissingPeople_Condition;
	information	 = 	DIA_Addon_Kardif_MissingPeople_Info;
	permanent    =  TRUE;
	description	 = 	"Que savez-vous des citoyens disparus ?";
};
//-------------------------------------------
var int DIA_Addon_Kardif_MissingPeople_permanent;
//-------------------------------------------
func int DIA_Addon_Kardif_MissingPeople_Condition ()
{	
	if (DIA_Addon_Kardif_MissingPeople_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Kardif_MissingPeople_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //Que savez-vous des citoyens disparus ?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //Tout ce que je sais c'est des gens se sont volatilisés ces derniers jours.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //On dit que c'est particulièrement mal famé ici dans le port. Peut-être vous devriez demander aux alentours.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //Il y a eu aussi des cas dans le bas quartier.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //Si vous voulez en savoir plus, vous devriez parler à Coragon.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //Il tient un pub dans les bas quartiers de la ville, et il a probablement entendu parler d'une ou deux choses.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //Halvor, le premier poissonnier, en bas vers le quai, sait sans doute quelque chose. Beaucoup de gens le fréquentent.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kardif m'a conseillé de m'adresser à Coragon, le propriétaire de la taverne de la basse-ville, et à Halvor, le pêcheur du port, au sujet des personnes disparues."); 

		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Lernen		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lernen_Condition;
	information	 = 	DIA_Kardif_Lernen_Info;
	permanent    =  TRUE;
	description	 = 	"Qui peut m'enseigner des techniques ici ?";
};
//-------------------------------------------
var int DIA_Kardif_Lernen_permanent;
//-------------------------------------------
func int DIA_Kardif_Lernen_Condition ()
{	
	if (DIA_Kardif_Lernen_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lernen_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //Qui prodigue son enseignement ici ?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //Il y a plusieurs personnes compétentes dans le quartier du port.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //Carl le forgeron est particulièrement musclé. Il devrait pouvoir vous apprendre à devenir plus fort.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //Alrik connaît le combat sur le bout des doigts et Lares est un sacré filou. Lui aussi traîne sur le port.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //Et si vous êtes assez dingue pour aller voir le vieil Ignaz, il connaît l'alchemine... la chim... enfin, les potions, quoi.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //Où puis-je trouver tous ces gens ?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //(grogne) Le roi aura gagné sa guerre contre les orques avant que j'aie finie de vous l'expliquer.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //Promenez-vous dans le quartier du port et vous finirez bien par les trouver. Et si jamais vous avez du mal à vous y retrouver, allez acheter une carte chez Brahim.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //Lui, vous ne pouvez pas le rater : sa hutte se trouve juste à côté de mon pub. (se parle tout seul) J'aurais dû le faire payer double, celui-là...
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"Carl, le forgeron du port, peut m'aider à devenir plus fort.");
		B_LogEntry (Topic_CityTeacher,"Lares peut m'aider à améliorer ma dextérité.");
		B_LogEntry (Topic_CityTeacher,"Alrik peut m'entraîner au combat avec des armes à une main. Il traîne derrière l'entrepôt du quartier du port.");
		B_LogEntry (Topic_CityTeacher,"Ignaz peut me montrer des recettes de potions. Il vit dans le quartier du port.");
	
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Brahim dessine et vend des cartes près du port.");
		
		
	DIA_Kardif_Lernen_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk_Condition;
	information	 = 	DIA_Kardif_Diebeswerk_Info;
	permanent    =  TRUE;
	description	 = 	"Y a-t-il des boulots 'spéciaux' à faire ?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk_Condition ()
{	
	if (DIA_Kardif_Diebeswerk_permanent == FALSE)
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	//&& (other.guild == GIL_NONE) 
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //Est-ce que je peux trouver du travail... 'spécial' pour gagner de l'argent facilement par ici ?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //Quelque chose de spécial, vous dites ? Hmm...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //Allez voir Nagur. Il pourra peut-être vous aider...
	
		DIA_Kardif_Diebeswerk_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk2		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk2_Condition;
	information	 = 	DIA_Kardif_Diebeswerk2_Info;
	permanent    =  TRUE;
	description	 = 	"Avez-vous quelque chose de 'spécial' à me faire faire ?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk2_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk2_Condition ()
{	
	if (DIA_Kardif_Diebeswerk2_permanent == FALSE)
	&& (DIA_Kardif_Diebeswerk_permanent == TRUE) //andere Info
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	&& (other.guild != GIL_KDF) 
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk2_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //Est-ce que vous avez quelque chose de 'spécial' à me faire faire ?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //En effet, oui. Mais je pense que cela ne vous intéressera que si vous avez des talents extrêmement... disons, variés.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //Qu'est-ce que vous avez à m'offrir ?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //Eh bien... Zuris, le vendeur de potions de la place du marché, a un invité spécial en ce moment : Daron, le Magicien du feu.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //Et ?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //Il a fait fabriquer un coffre sur mesure par Thorben le charpentier.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //On dit que ce Daron aurait amené des tas de choses intéressantes avec lui. Mais vous ne le tenez pas de moi bien sûr.
		
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's ich will doch keine Info kaufen 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Zurueck		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Zurueck_Condition;
	information	 = 	DIA_Kardif_Zurueck_Info;
	permanent    =  TRUE;
	description	 = 	DIALOG_BACK;
};
func int DIA_Kardif_Zurueck_Condition ()
{	
	if (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Zurueck_Info ()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices (DIA_Kardif_Zurueck);
};
///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DOPE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_DOPE_Condition;
	information	 = 	DIA_Kardif_DOPE_Info;
	permanent    =  TRUE;
	description	 = 	"Où puis-je acheter de l'herbe ici ?";
};
var int DIA_Kardif_DOPE_perm;
func int DIA_Kardif_DOPE_Condition ()
{
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&&  (DIA_Kardif_DOPE_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_DOPE_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //Où puis-je trouver de l'herbe par ici ?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //Certainement pas ici ! Je ne veux rien avoir à faire avec ce genre de chose !
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //Certainement pas ici !
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //Admettons, mais où ?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //Si j'étais vous, j'irai voir Meldor. Il passe ses journées à fumer après tout.
		
		DIA_Kardif_DOPE_perm = TRUE;
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Paket		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  3;
	condition	 = 	DIA_Kardif_Paket_Condition;
	information	 = 	DIA_Kardif_Paket_Info;
	permanent	 =  TRUE;
	description	 = 	"Que savez-vous au sujet d 'un paquet d'herbes des marais ?";
};
var int DIA_Kardif_Paket_perm;
func int DIA_Kardif_Paket_Condition ()
{
	if 	(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Paket_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Paket_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Paket_15_00"); //Auriez-vous entendu parler d'un paquet d'herbe des marais ?
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //Le possesseur de ce paquet doit être un homme riche... et sans doute très détendu.
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //N'essayez pas de me faire marcher ! Vous savez quelque chose, alors crachez-le !
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //D'accord, d'accord... Un type est entré dans mon pub, l'autre jour... Un mercenaire...
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //Il m'a dit qu'il voulait vendre un paquet d'herbe des marais sur le port, mais il était complètement défoncé, alors... C'est tout ce que je sais.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"Kardif s'est entretenu avec un mercenaire. Ce dernier avait un paquet d'herbes des marais à vendre.");
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info SendAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_SENDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_SENDATTILA_Condition;
	information	 = 	DIA_Kardif_SENDATTILA_Info;
	important	 = 	TRUE;
};

func int DIA_Kardif_SENDATTILA_Condition ()
{
	if (MIS_ThiefGuild_sucked == TRUE)
	|| (Diebesgilde_Okay >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kardif_SENDATTILA_Info ()
{
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //Hé, vous ! Venez voir ici. J'ai quelque chose pour vous.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //J'ai reçu la visite d'un type qui souhaitait vous parler.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //Comme vous n'étiez pas là, il m'a demandé de vous remettre un message.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //Il souhaite vous parler. Vous le trouverez derrière la poissonnerie d'Halvor.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //Ce renseignement est gratuit, mais c'est l'exception qui confirme la règle. Pour tout le reste, il vous faudra payer.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //A quoi ce type ressemblait ?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //Je peux vous le dire, mais ce n'est plus gratuit, mon ami. (sourit)
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Chaque information communiquée vous coûtera 10 pièces d'or.
		Kardif_Deal = 10;
	};
	Wld_InsertNpc (VLK_494_Attila, "NW_CITY_ENTRANCE_01");
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Kerl		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_Kerl_Condition;
	information	 = 	DIA_Kardif_Kerl_Info;
	permanent    =  TRUE;
	description	 = 	"A quoi ressemblait ce type ?";
};
//----------------------------------
var int DIA_Kardif_Kerl_permanent;
//----------------------------------
func int DIA_Kardif_Kerl_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kardif_SENDATTILA)
	&& (Attila.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //A quoi ce type ressemblait ?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //Eh bien, il était plutôt grand et fort et avait la peau sombre. Il n'avait pas d'uniforme, mais il semblait plutôt... menaçant.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //Et son visage ?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //Son visage ? Disons que, quand il m'a regardé, j'ai été bien content qu'il ne soit pas venu pour moi.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //Son regard m'a flanqué la trouille. Mais je pense que vous devriez aller le voir. Ça risque d'être très intéressant.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_05"); //Toute la question étant de savoir pour qui, bien sûr...
		
		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DEFEATEDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_DEFEATEDATTILA_Condition;
	information	 = 	DIA_Kardif_DEFEATEDATTILA_Info;
	permanent    =  FALSE;
	description	 = 	"Ce bâtard a essayé de me tuer !";
};

func int DIA_Kardif_DEFEATEDATTILA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info ()
{
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //Ce pourri a essayé de me tuer !
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //Et alors, c'est de ma faute ? Je n'ai fait que vous remettre son message !
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //Et si vous vous êtes fait un ennemi, il doit bien y avoir une raison, non ?

	B_GivePlayerXP (XP_Kardif_Blame4Attila);
	
	B_KillNpc	(Attila);
	Npc_RemoveInvItem	(Attila, ItMi_OldCoin);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Zeichen   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 2;
	condition   = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent   = FALSE;
	description = "(Faire le signe de reconnaissance des voleurs)";
};

FUNC INT DIA_Kardif_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//Ah, vous êtes en cheville avec le gang ? Très bien. Dans ce cas, j'ai quelque chose pour vous.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//(à mi-voix) Si vous avez besoin de crochets, venez me voir. Il m'en reste encore quelques-uns. Demandez-moi juste quelque chose à boire.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
};

//###########################
//##
//##	Kapitel 5
//##
//###########################

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Crew   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 51;
	condition   = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent   = FALSE;
	description = "J'ai encore besoin de quelques marins.";
};

FUNC INT DIA_Kardif_Crew_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Crew_Info()
{
	AI_Output (other,self , "DIA_Kardif_Crew_15_00");//Je cherche encore quelques marins.
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//Le moment est mal choisi, mon ami. Vous n'en trouverez pas suffisamment dans toute la ville. La plupart d'entre eux sont partis.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//Mais avec un bon capitaine, il ne devrait pas être trop difficile de trouver quelques jeunes qui en veulent et d'en faire des marins compétents.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//Où puis-je trouver un capitaine ?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//Ce n'est pas à moins qu'il faut le demander. Je suis juste gérant de pub.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"Kardif m'a envoyé voir le vieux Jack. Il devrait pouvoir m'aider.");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//Allez parler au vieux Jack. Il traîne sur ce port depuis une éternité et sait tout ce qu'il y a à savoir sur la mer.
	};
};




























