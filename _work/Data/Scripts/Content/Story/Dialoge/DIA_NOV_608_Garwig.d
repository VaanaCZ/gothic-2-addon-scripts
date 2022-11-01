//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Garwig_EXIT   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 999;
	condition   = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Garwig_Wurst(C_INFO)
{
	npc         = Nov_608_Garwig;
	nr			= 3;
	condition	= DIA_Garwig_Wurst_Condition;
	information	= DIA_Garwig_Wurst_Info;
	permanent	= FALSE;
	description = "Aimeriez-vous une saucisse ?";
};                       

FUNC INT DIA_Garwig_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garwig_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Garwig_Wurst_15_00"); //Voulez-vous une saucisse ?
	AI_Output (self, other, "DIA_Garwig_Wurst_06_01"); //Ah, délicieux ! Merci beaucoup, frère.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Hello   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 3;
	condition   = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Garwig_Hello_Condition()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garwig_Hello_Info()
{
	AI_Output (self ,other,"DIA_Garwig_Hello_06_00"); //Innos soit avec vous. Je ne vous ai jamais vu auparavant... Vous êtes nouveau ?
	AI_Output (other ,self,"DIA_Garwig_Hello_15_01"); //Oui, je viens juste de me joindre à vous.
	AI_Output (self ,other,"DIA_Garwig_Hello_06_02"); //Dans ce cas, j'espère que vous prendrez vite vos marques. Si je peux vous être d'une quelconque utilité faites-le moi savoir.
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Room   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 5;
	condition   = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent   = FALSE;
	description	= "C'est quoi cette pièce ?";
};
FUNC INT DIA_Garwig_Room_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Garwig_Room_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Room_15_00"); //Dans quelle pièce sommes-nous ?
	AI_Output (self ,other,"DIA_Garwig_Room_06_01"); //C'est ici que sont entreposées les saintes reliques du monastère.
	AI_Output (other,self ,"DIA_Garwig_Room_15_02"); //Quelles reliques ?
	AI_Output (self ,other,"DIA_Garwig_Room_06_03"); //Le Marteau d'Innos et le Bouclier du Feu, les plus importantes reliques de l'Eglise d'Innos en dehors de la capitale.
};
//**************************************************************************
//	Info Hammer 
//**************************************************************************
INSTANCE DIA_Garwig_Hammer  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 99;
	condition   = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent   = TRUE;
	description	= "Parlez-moi du marteau.";
};
FUNC INT DIA_Garwig_Hammer_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Hammer_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Hammer_15_00"); //Parlez-moi du marteau...
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_01"); //Il s'agit du marteau sacré d'Innos. C'est grâce à lui que saint Rhobar a tué la Sentinelle de pierre.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_02"); //Les textes sacrés racontent que la Sentinelle de pierre était invulnérable. Elle se dressait, aussi indestructible qu'une tour, et les armes de ses adversaires venaient se briser sur sa peau de roche.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_03"); //Mais, en prononçant le nom d'Innos, Rhobar s'est rué sur elle et l'a fracassée d'un seul coup de ce marteau.
};
//**************************************************************************
//	Info Schild 
//**************************************************************************
INSTANCE DIA_Garwig_Shield  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 98;
	condition   = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent   = FALSE;
	description	= "Parlez-moi du bouclier.";
};
FUNC INT DIA_Garwig_Shield_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Shield_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Shield_15_00"); //Parlez-moi du bouclier...
	AI_Output (self ,other,"DIA_Garwig_Shield_06_01"); //Le Bouclier de Feu était au bras de Dominique lors de la bataille des Iles méridionales.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_02"); //Mais nul ne doit plus jamais le porter. C'est pour cette raison que nous l'avons cloué au mur.
};
//**************************************************************************
//	Info Auge Innos
//**************************************************************************
INSTANCE DIA_Garwig_Auge  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 4;
	condition   = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent   = FALSE;
	description	= "L'Œil d'Innos est-il aussi gardé ici ?";
};
FUNC INT DIA_Garwig_Auge_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garwig_Room)
	&& (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Auge_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Auge_15_00"); //L'Œil d'Innos se trouve-t-il ici lui aussi ?
	AI_Output (self ,other,"DIA_Garwig_Auge_06_01"); //Bien sûr que non ! Quelle étrange idée. Nul ne sait où se trouve cet artefact divin.
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_SLEEP		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	23;
	condition	 = 	DIA_Garwig_SLEEP_Condition;
	information	 = 	DIA_Garwig_SLEEP_Info;
	permanent	 = 	TRUE;
	description	 = 	"Que faites-vous ici ?";
};
func int DIA_Garwig_SLEEP_Condition ()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
func void DIA_Garwig_SLEEP_Info ()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_15_00"); //Que faites-vous ici ?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_06_01"); //Je suis le gardien des artefacts sacrés.
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice 		(DIA_Garwig_SLEEP,DIALOG_BACK,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Voulez-vous que je vous relève un moment ?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Quels sont les artefacts qui sont gardés ?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Vous ne dormez jamais ?",DIA_Garwig_SLEEP_NEVER);
};
FUNC VOID DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
};
FUNC VOID DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_EXCHANGE_15_00"); //Voulez-vous que je vous remplace quelque temps ?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_01"); //S'agit-il d'une épreuve ? Les mages vous envoient me tester, n'est-ce pas ? Je le savais !
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_02"); //Mais je ne faillirai pas à ma tâche. Dites aux mages que je suis ferme comme le roc et que je résiste à toutes les tentations, car je suis digne de mon poste de gardien.
};
FUNC VOID DIA_Garwig_SLEEP_THIEF()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_THIEF_15_00"); //Pourquoi les artefacts sont-ils défendus ? Y a-t-il des raisons de craindre que quelqu'un cherche à s'en emparer ?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_01"); //Quelle surprenante idée ! D'où la sortez-vous ?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_02"); //Les serviteurs d'Innos sont les seuls qui aient le droit de pénétrer dans le monastère, et aucun fidèle ne ferait jamais cela.
};
FUNC VOID DIA_Garwig_SLEEP_NEVER()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_NEVER_15_00"); //Vous ne dormez jamais ?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_01"); //Quelle idée saugrenue ! Bien sûr que non ! C'est Innos lui-même qui me confère le pouvoir de ne jamais avoir à dormir.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_02"); //Sinon comment pourrais-je m'acquitter de ma mission sacrée de gardien des reliques ?
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice (DIA_Garwig_SLEEP,"Vous ne dormez VRAIMENT jamais ?",DIA_Garwig_SLEEP_AGAIN);
};
FUNC VOID DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_AGAIN_15_00"); //C'est vrai ? Vous ne dormez vraiment jamais ?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_01"); //Non. Un gardien qui s'endort à son poste manque à son devoir.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_02"); //Mais je ne faillirai pas moi, car ma force et mon endurance me viennent directement d'Innos, et jamais je ne ressentirai la fatigue.
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info THIEF Der Hammer ist nicht mehr da
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_THIEF		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_THIEF_Condition;
	information	 = 	DIA_Garwig_THIEF_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Garwig_THIEF_Condition ()
{	
	if  (Npc_IsInState (self, ZS_Talk))
	&&  (Npc_HasItems (hero, Holy_Hammer_MIS) == 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_THIEF_Info ()
{		
					
	if (Hammer_Taken == TRUE) 
	{ 
		AI_Output (self, other, "DIA_Garwig_THIEF_06_00"); //(fou de rage) Voleur ! Vous faites honte non seulement à vous-même mais à l'ensemble de ce monastère !
		AI_Output (self, other, "DIA_Garwig_THIEF_06_01"); //Vous allez devoir faire pénitence pour vous faire pardonner ce sacrilège ! Mais pour commencer... rendez-moi ce marteau !
		
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_THIEF_06_02"); //(désespéré) Le marteau a disparu ! Comment cela a-t-il bien pu se produire ?
		AI_Output (self, other, "DIA_Garwig_THIEF_06_03"); //J'ai failli. Innos ne manquera pas de me punir.
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Hammer zurückbringen (immer wenn Spieler den Hammer hat)
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_Abgeben		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_Abgeben_Condition;
	information	 = 	DIA_Garwig_Abgeben_Info;
	permanent	 = 	TRUE;
	description	 =  "Je vais ramener le marteau.";
};
func int DIA_Garwig_Abgeben_Condition ()
{	
	if (Npc_HasItems (other, Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Garwig_Abgeben_15_00"); //Je vous ramène le marteau.
	
	if (Hammer_Taken == TRUE)
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_01"); //Vous n'êtes qu'un sale voleur !
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_02"); //Ainsi, c'est donc vous qui l'aviez pris...
	};
	AI_Output (self, other, "DIA_Garwig_Abgeben_06_03"); //Mais ce n'est pas à moi de vous juger. Innos se chargera de faire justice lui-même et de vous faire payer votre crime !
	
	B_GiveInvItems (other,self, Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garwig_PICKPOCKET (C_INFO)
{
	npc			= Nov_608_Garwig;
	nr			= 900;
	condition	= DIA_Garwig_PICKPOCKET_Condition;
	information	= DIA_Garwig_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Garwig_PICKPOCKET_Condition()
{
	C_Beklauen (52, 80);
};
 
FUNC VOID DIA_Garwig_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garwig_PICKPOCKET);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_BACK 		,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};
	
func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};















