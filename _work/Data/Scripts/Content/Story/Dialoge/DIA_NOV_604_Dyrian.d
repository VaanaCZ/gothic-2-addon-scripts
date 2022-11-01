//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Dyrian_EXIT   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 999;
	condition   = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Dyrian_Hello   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_Hello_Condition()
{
	if  (Npc_IsInState (self, ZS_Talk))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	&&  (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Hello_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Hello_13_00"); //(triste) Que me voulez-vous ?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Dyrian_Wurst(C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr			= 3;
	condition	= DIA_Dyrian_Wurst_Condition;
	information	= DIA_Dyrian_Wurst_Info;
	permanent	= FALSE;
	description = "Je suis occupé à distribuer les saucisses.";
};                       

FUNC INT DIA_Dyrian_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dyrian_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Dyrian_Wurst_15_00"); //Je suis occupé à distribuer des saucisses.
	AI_Output (self, other, "DIA_Dyrian_Wurst_13_01"); //Merci. J'espère que ce n'est pas la dernière saucisse à laquelle j'aurai droit par ici...
	
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
//	Was machst Du hier? 
//**************************************************************************
INSTANCE DIA_Dyrian_Job   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent   = FALSE;
	description = "Que faites-vous ici ?";
};
FUNC INT DIA_Dyrian_Job_Condition()
{	
	if Npc_KnowsInfo (hero,DIA_Dyrian_Hello)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Job_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Job_15_00"); //Que faites-vous ici ?
	AI_Output (self ,other,"DIA_Dyrian_Job_13_01"); //J'ai transgressé les préceptes de notre communauté.
	AI_Output (self ,other,"DIA_Dyrian_Job_13_02"); //Et maintenant, j'attends la décision du Haut Conseil, qui doit se prononcer sur le fait que je puisse rester ou non au monastère.
};
//**************************************************************************
//	Wieso sollst Du das Kloster denn verlassen?
//**************************************************************************

INSTANCE DIA_Dyrian_WhatDone   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent   = FALSE;
	description = "Dites-moi ce qui s'est passé.";
};
FUNC INT DIA_Dyrian_WhatDone_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dyrian_Job))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_WhatDone_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_WhatDone_15_00"); //Dites-moi ce qui s'est passé.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_01"); //Alors que je faisais le ménage, j'ai pris un livre dans les quartiers des magiciens pour pouvoir le lire plus tard.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_02"); //Maître Hyglas s'en est tout de suite aperçu, bien sûr, et il m'a immédiatement interrogé à ce sujet.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_03"); //J'étais tellement terrifié à l'idée d'être puni que j'ai menti. Mais, plus tard, il m'a pris sur le fait alors que j'étais en train de lire le livre dans ma chambre.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_04"); //Il s'est mis en colère et a prévenu le Haut Conseil sans attendre. Celui-ci est actuellement en train de délibérer pour décider si je peux ou non rester.
};

//**************************************************************************
//	Kann ich dir irgendwie helfen?
//**************************************************************************
INSTANCE DIA_Dyrian_CanHelp   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent   = TRUE;
	description = "Puis-je vous être utile d'une manière ou d’une autre ?";
};
FUNC INT DIA_Dyrian_CanHelp_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Job)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_CanHelp_15_00"); //Puis-je faire quoi que ce soit pour vous ?
	AI_Output (self ,other,"DIA_Dyrian_CanHelp_13_01"); //Non. Mon destin est entre les mains d'Innos et des magiciens.
};
//**************************************************************************
//	SC hat die Prüfung des Feuers angenommen und mit Hyglas gesprochen
//**************************************************************************
INSTANCE DIA_Dyrian_Scroll   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dyrian_Scroll_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	||	(MIS_RUNE == LOG_RUNNING)
	||	(MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_Scroll_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_00"); //Hé, vous avez vraiment demandé à passer l'Epreuve du feu ?
	AI_Output (other,self ,"DIA_Dyrian_Scroll_15_01"); //Oui, et j'ai bien l'intention de la réussir.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_02"); //Bien. Dans ce cas, je peux peut-être vous aider en vous remettant un parchemin magique. Il contient un sort de Sommeil. Ça vous intéresse ?

	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"Non, je n'ai pas besoin de votre aide.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"Que voulez-vous en échange ?",DIA_Dyrian_Scroll_How);
	Info_AddChoice (DIA_Dyrian_Scroll,"Qu'est-ce que je peux en faire ?",DIA_Dyrian_Scroll_What);
};
FUNC VOID DIA_Dyrian_Scroll_What ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_00"); //A quoi pourrait-il me servir ?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_01"); //Ce sort vous permet d'endormir les gens pendant quelque temps, mais uniquement si votre volonté est supérieure à la leur.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_02"); //Cela peut vous être très utile si quelqu'un se met en travers de votre chemin...
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_03"); //Et comment savoir si ma volonté est supérieure à celle de mon adversaire ?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_04"); //Inutile d'essayer contre les magiciens. Par contre, vous devriez pouvoir endormir la plupart des novices.
};
FUNC VOID DIA_Dyrian_Scroll_No ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_No_15_00"); //Non, je n'ai pas besoin de votre aide.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_No_13_01"); //Si vous changez d'avis n'hésitez pas à revenir me voir.
	Info_ClearChoices (DIA_Dyrian_Scroll);
};
FUNC VOID DIA_Dyrian_Scroll_How ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_How_15_00"); //Que voulez-vous en échange ?
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_01"); //Tout magicien a droit de faire un vœu.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_02"); //Si jamais vous passiez l'Epreuve du feu avec succès, vous pourriez demander à ce que j'aie le droit de demeurer au monastère.
	
	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"Non, je n'ai pas besoin de votre aide.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"Très bien, donnez-moi le parchemin du sort.",DIA_Dyrian_Scroll_Yes);
	
};
FUNC VOID DIA_Dyrian_Scroll_Yes ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_Yes_15_00"); //Très bien, donnez-moi ce parchemin.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_Yes_13_01"); //Bonne chance pour l'Epreuve. Puisse Innos vous aider.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
	Log_CreateTopic (Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus (Topic_DyrianDrin,LOG_RUNNING);
	B_LogEntry (Topic_DyrianDrin,"Dyrian m'a donné un parchemin de Sommeil. En échange, il veut que je m'arrange pour qu'il soit autorisé à rester au monastère si je deviens magicien.");
	Info_ClearChoices (DIA_Dyrian_Scroll);
	
};
//**************************************************************************
//	Doch Scroll nehmen
//**************************************************************************
INSTANCE DIA_Dyrian_Doch   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent   = TRUE;
	description = "J'ai changé d'avis. Donnez-moi le sort de Sommeil.";
};
FUNC INT DIA_Dyrian_Doch_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Scroll)
	&& (MIS_HelpDyrian != LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Doch_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Doch_15_00"); //J'ai changé d'avis. Donnez-moi votre sort de Sommeil.
	AI_Output (self ,other,"DIA_Dyrian_Doch_13_01"); //Bien. Si vous réussissez l'Epreuve, vous pourrez faire en sorte que j'aie le droit de rester au monastère.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
};
//*****************************************************************************
//			SC trifft Dyrian, nach Aufnahme und der ist noch im KLoster
//*****************************************************************************
INSTANCE DIA_Dyrian_HelloAgain   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_HelloAgain_Condition()
{
	if  Npc_IsInState (self, ZS_Talk)
	&& (other.guild == GIL_KDF)
	&& (MIS_HelpDyrian == LOG_SUCCESS)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HelloAgain_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_00"); //(joyeux) Merci ! Vous m'avez sauvé !
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_01"); //(effrayé) Oh, pardonnez-moi, maître ! Je ne voulais pas...
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_02"); //(respectueux) Merci de m'avoir accordé le droit de rester au monastère. Ma vie sera différente désormais.
	
	B_GivePlayerXP (XP_Ambient); 	
	AI_StopProcessInfos (self); 
};

//*****************************************************************************
//			Wie gehts? //Info für Magier Success 
//*****************************************************************************
func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output (other,self ,"DIA_Dyrian_HowIsIt_15_00"); //Comment ça se passe ?
};

INSTANCE DIA_Dyrian_HowIsIt   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent   = TRUE;
	description = "Comment ça va ?";
};
FUNC INT DIA_Dyrian_HowIsIt_Condition()
{
	if Npc_KnowsInfo (other,DIA_Dyrian_HelloAgain)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_01"); //Bien. J'aime vraiment ce travail, maître.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Wie gehts? //Info für alle anderen 
//*****************************************************************************
INSTANCE DIA_Dyrian_other   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent   = TRUE;
	description = "Comment ça va ?";
};
FUNC INT DIA_Dyrian_other_Condition()
{
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_NONE)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_02"); //Je remercie Innos de pouvoir continuer à vivre au monastère.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Dyrian steht in Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_Kneipe   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent   = TRUE;
	description = "Comment ça va ?";
};
FUNC INT DIA_Dyrian_Kneipe_Condition()
{
	if  (MIS_HelpDyrian == LOG_FAILED)
	&&  (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Kneipe_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_15_00"); //Comment ça se passe ?
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_01"); //C'est vous qui me demandez ça ? Tous mes espoirs reposaient sur vous et vous m'avez laissé tomber !
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_02"); //Maintenant, il ne me reste plus que la boisson... et c'est votre faute !
	
	Info_ClearChoices (DIA_Dyrian_Kneipe);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Tenez, 5 pièces d'or pour vous.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Je peux tout expliquer.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Faites attention à ce que vous dites.",DIA_Dyrian_Kneipe_ShutUp);
		
};

FUNC VOID DIA_Dyrian_Kneipe_Gold ()
{
	AI_Output	(other,self ,"DIA_Dyrian_Kneipe_Gold_15_00"); //Tenez, voici 5 pièces d'or pour vous.
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_01"); //(nerveux) 5 pièces d'or ? Vous me donnez 5 pièces d'or pour vous faire pardonner d'avoir détruit ma vie ?
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_02"); //C'est tout votre or que je vais prendre, oui !
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 0); 
};

FUNC VOID DIA_Dyrian_Kneipe_CanExplain ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_CanExplain_15_00"); //Je peux tout vous expliquer.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_01"); //Gardez vos excuses !
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_02"); //Vous mentez chaque fois que vous ouvrez la bouche ! Laissez-moi tranquille !
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Dyrian_Kneipe_ShutUp ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_ShutUp_15_00"); //Hé ! Attention à ce que vous dites !
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_01"); //Allez-y, menacez-moi... pour tout le bien que ça vous fera...
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_02"); //Tout le monde saura que vous n'êtes qu'un sale hypocrite... dès que j'aurai fini cette bouteille...
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_03"); //Hors de ma vue, vous me dégoûtez !

	AI_StopProcessInfos (self);
};
//*****************************************************************************
//			Wie gehts? //Info nachher Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_nachher   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent   = TRUE;
	description = "Qu'y a-t-il?";
};
FUNC INT DIA_Dyrian_nachher_Condition()
{
	if  Npc_KnowsInfo (other,DIA_Dyrian_Kneipe)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_nachher_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_nachher_15_00"); //Quoi de neuf ?
	AI_Output (self ,other,"DIA_Dyrian_nachher_13_01"); //Aaah, laissez-moi tranquille ! Je ne veux plus rien avoir à faire avec vous !
	AI_StopProcessInfos (self);	
};
 
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dyrian_PICKPOCKET (C_INFO)
{
	npc			= NOV_604_Dyrian;
	nr			= 900;
	condition	= DIA_Dyrian_PICKPOCKET_Condition;
	information	= DIA_Dyrian_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Dyrian_PICKPOCKET_Condition()
{
	C_Beklauen (10, 15);
};
 
FUNC VOID DIA_Dyrian_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_BACK 		,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};
	
func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};


