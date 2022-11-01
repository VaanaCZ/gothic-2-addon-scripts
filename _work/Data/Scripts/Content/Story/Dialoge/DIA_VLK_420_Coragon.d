///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Coragon_EXIT   (C_INFO)
{
	npc         = VLK_420_Coragon;
	nr          = 999;
	condition   = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Coragon_PICKPOCKET (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr			= 900;
	condition	= DIA_Coragon_PICKPOCKET_Condition;
	information	= DIA_Coragon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Coragon_PICKPOCKET_Condition()
{
	C_Beklauen (40, 45);
};
 
FUNC VOID DIA_Coragon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Coragon_PICKPOCKET);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_BACK 		,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};
	
func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};

// *********************************************************
// 							Hallo
// *********************************************************
instance DIA_Coragon_HALLO		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_HALLO_Condition;
	information	 = 	DIA_Coragon_HALLO_Info;
	permanent    =  FALSE;
	description	 = 	"Puis-je avoir un verre ?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Puis-je avoir quelque chose à boire ?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Si vous avez de l'or, vous pouvez manger ici si vous voulez.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Je peux acheter de la nourriture et des boissons à l'aubergiste Coragon.");
};

// *********************************************************
// 							Trade
// *********************************************************
instance DIA_Coragon_Trade		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_Trade_Condition;
	information	 = 	DIA_Coragon_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Montrez-moi vos marchandises.";
	trade 		 =  TRUE;
};
func int DIA_Coragon_Trade_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Trade_Info () //FIXME_FILER NOCH ESSEN IN INV
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Montrez-moi vos marchandises.
};

// *********************************************************
// 							WhatsUp
// *********************************************************
instance DIA_Coragon_WhatsUp	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  3;
	condition	 = 	DIA_Coragon_WhatsUp_Condition;
	information	 = 	DIA_Coragon_WhatsUp_Info;
	permanent    =  FALSE;
	description	 = 	"Et comment vont les affaires ?";
	
};
func int DIA_Coragon_WhatsUp_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_WhatsUp_Info ()
{
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //Comment vont les affaires ?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //Ah ne m'en parlez pas. Le seigneur André sert de la bière gratuitement sur la place de la potence.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Peu de gens viennent ici maintenant à part les riches du haut quartier.
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //En quoi vous dérangent-ils ?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //(rit) Certains de ces freluquets peuvent vraiment taper sur les nerfs.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Prenez ce Valentino, par exemple, je ne peux pas le voir.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Mais je ne peux pas me permettre de choisir mes clients. Un sou est un sou.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //Tout ce que j'avais réussi à épargner a été volé en même temps que toute mon argenterie.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Coragon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_420_Coragon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Coragon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Coragon_MissingPeople_Info;

	description	 = 	"Parlez-moi des personnes disparues en ville.";
};

func int DIA_Addon_Coragon_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Coragon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //Parlez-moi des personnes disparues en ville.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //° J'ai entendu dire que beaucoup avaient disparu près du port. Pas étonnant avec tout ce qui passe là-bas. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //° Même Thorben, qui est charpentier dans les bas quartiers de la ville, a perdu son apprenti.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //° Hakon, un des marchands sur la place du marché, racontait une histoire bien étrange. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //° Il disait qu'il y avait un type qu'il avait l'habitude de rencontrer tous les jours, et puis que soudain celui-ci a disparu de la circulation. Il est même allé voir la milice à ce propos. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //° Les gens de la ville sont tous très paniqués après cet incident. Je ne sais quoi en penser, tout cela semble absurde.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //° Khorinis est une ville hostile et hors les murs, de nombreux périls rôdent.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Si vous ne demeurez pas à l'intérieur des murs de la cité, vous risquez d'être attaqué par des bandits ou d'être mangé par des animaux  sauvages. C'est aussi simple que cela.  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Harkon, un commerçant de la place du marché, et le charpentier Thorben devraient tous deux savoir quelque chose à propos des personnes qui ont disparu."); 
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  4;
	condition	 = 	DIA_Coragon_Bestohlen_Condition;
	information	 = 	DIA_Coragon_Bestohlen_Info;
	permanent    =  FALSE;
	description	 = 	"Quelqu'un vous a volé ?";
	
};
func int DIA_Coragon_Bestohlen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Bestohlen_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Vous avez été dévalisé ?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //Oui, il y a quelque temps. C'était assez bondé cette nuit et je servais des tournées de bière.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Je ne me suis pas éloigné longtemps du comptoir mais juste assez pour ces bâtards.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //Je suis allé voir la milice à ce sujet. Mais ils n'ont rien trouvé du tout. Ils préfèrent se saouler à la bière aux frais de la princesse.
	
	MIS_Coragon_Silber = LOG_RUNNING;
};


// **************
// B_Coragon_Bier
// **************

var int Coragon_Bier;
// ------------------	
	
func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //Voici, prenez ceci comme une récompense.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //Une bière vraiment spéciale. C'est mon dernier tonnelet.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //C'est vraiment la dernière goutte !
	};
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_BringSilber	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  5;
	condition	 = 	DIA_Coragon_BringSilber_Condition;
	information	 = 	DIA_Coragon_BringSilber_Info;
	permanent    =  FALSE;
	description	 = 	"J'ai votre argenterie.";
	
};
func int DIA_Coragon_BringSilber_Condition ()
{	
	if (MIS_Coragon_Silber == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_CoragonsSilber) >= 8)
	{
		return TRUE;
	};
};
func void DIA_Coragon_BringSilber_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //J'ai votre argenterie.
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //Vraiment !
	B_GivePlayerXP (XP_CoragonsSilber);
	B_Coragon_Bier();
	
	MIS_Coragon_Silber = LOG_SUCCESS;
};

// *********************************************************
// 					Lehmars Schuldenbuch
// *********************************************************
instance DIA_Coragon_Schuldenbuch	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  6;
	condition	 = 	DIA_Coragon_Schuldenbuch_Condition;
	information	 = 	DIA_Coragon_Schuldenbuch_Info;
	permanent    =  FALSE;
	description	 = 	"Regardez ce que j'ai là...";
	
};
func int DIA_Coragon_Schuldenbuch_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Schuldenbuch_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //Regardez un peu ce que j'ai là...
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Hum ? (surpris) Mais c'est le grand livre de Lehmar !
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Que comptez-vous en faire ?
};


// *********************************************************
// 					Schuldenbuch geben
// *********************************************************
instance DIA_Coragon_GiveBook (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  7;
	condition	 = 	DIA_Coragon_GiveBook_Condition;
	information	 = 	DIA_Coragon_GiveBook_Info;
	permanent    =  FALSE;
	description	 = 	"Voici le livre.";
	
};
func int DIA_Coragon_GiveBook_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_GiveBook_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Voici votre livre.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //Merci ! Vous avez sauvé ma peau. Lehmar peut devenir assez mauvais.
	B_GivePlayerXP (XP_Schuldenbuch);
	B_Coragon_Bier();
};


// *********************************************************
// 							ToOV
// *********************************************************
instance DIA_Coragon_ToOV (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  9;
	condition	 = 	DIA_Coragon_ToOV_Condition;
	information	 = 	DIA_Coragon_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"Que dois-je faire pour avoir accès au haut quartier ?";
	
};
func int DIA_Coragon_ToOV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	&& (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Coragon_ToOV_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //Que faut-il faire pour accéder au haut quartier ?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Vous devez être citoyen de cette ville. Allez chercher du travail.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //De préférence dans les bas quartiers auprès des artisans. Cela fera de vous un citoyen.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //Et bien, si ce n'est pas suffisant, allez voir le seigneur André à la caserne.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Il vous laissera peut-être entrer dans la milice. Eux aussi peuvent accéder au haut quartier.
};


// *********************************************************
// 							Valentino
// *********************************************************
instance DIA_Coragon_Valentino (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  8;
	condition	 = 	DIA_Coragon_Valentino_Condition;
	information	 = 	DIA_Coragon_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Quel est le problème avec ce Valentino ?";
	
};
func int DIA_Coragon_Valentino_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Valentino_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //En quoi ce Valentino vous gêne-t-il ?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Il est affreusement riche et n'a nul besoin de travailler. En plus, il s'en vante auprès de tout le monde.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Que vous vouliez l'écouter ou non.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Il boit beaucoup et reste jusqu'à la fermeture. Puis, dès l'aurore, il repart en titubant vers le haut quartier.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //C'est pareil chaque jour.
	
	
};

// *********************************************************
// 						Zeche - Important
// *********************************************************
instance DIA_Coragon_News (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 1;
	condition	= DIA_Coragon_News_Condition;
	information	= DIA_Coragon_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
	
};
func int DIA_Coragon_News_Condition ()
{	
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if (Regis_Ring == TRUE)
		{	
			return TRUE;
		};
	};
};
func void DIA_Coragon_News_Info ()
{
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //Valentino ne pouvait pas payer son addition la nuit dernière.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Il racontait qu'il avait été volé, et qu'il me payerait plus tard... Incroyable !
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //Et juste après ça, il était en train de pavoiser en disant combien d'argent il avait.
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //Puis en mettant sa main dans sa poche, il a fait une tête bizarre. Il a dit qu'il avait été volé...
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //Et alors, qu'avez-vous fait ?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //Et bien, je lui ai botté le cul, quoi d'autre ?
};

// *********************************************************
// 						Ring geben
// *********************************************************
instance DIA_Coragon_Ring (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 10;
	condition	= DIA_Coragon_Ring_Condition;
	information	= DIA_Coragon_Ring_Info;
	permanent   = FALSE;
	description = "Tenez, prenez cet anneau.";
	
};
func int DIA_Coragon_Ring_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_News))
	&& (Npc_HasItems (other, ItRi_ValentinosRing) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Ring_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Tenez, prenez cet anneau.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Quoi ? Je ne comprends pas...
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //Il appartenait à Valentino.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //Vous n'aurez qu'à le donner à la prochaine personne qui lui tannera le cuir.

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























