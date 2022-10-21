// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Matteo_EXIT(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 999;
	condition	= DIA_Matteo_EXIT_Condition;
	information	= DIA_MAtteo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Matteo_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Matteo_PICKPOCKET (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 900;
	condition	= DIA_Matteo_PICKPOCKET_Condition;
	information	= DIA_Matteo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Matteo_PICKPOCKET_Condition()
{
	C_Beklauen (80, 150);
};
 
FUNC VOID DIA_Matteo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Matteo_PICKPOCKET);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_BACK 		,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
	
func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Matteo_Hallo(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_Hallo_Condition;
	information	= DIA_MAtteo_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Matteo_Hallo_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //Que puis-je pour vous ?
};

// ************************************************************
// 			  				   Sell What 
// ************************************************************
INSTANCE DIA_Matteo_SellWhat(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_SellWhat_Condition;
	information	= DIA_MAtteo_SellWhat_Info;
	permanent	= FALSE;
	description = "Que vendez-vous ?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //Qu'est-ce que vous vendez�?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Je peux vous offrir tout ce dont vous aurez besoin pour survivre en pleine nature�: armes, torches, provisions et m�me une armure.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //Il m'en reste une sp�ciale en stock.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Une armure en cuir de saurinide durci, constitu�e d'une double couche. Jamais port�e. �a vous int�resse�?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"La boutique de Matt�o se trouve pr�s de la porte sud de la ville. Il vend des �quipements, des armes et des provisions.");
		Knows_Matteo = TRUE;
	};
};

// *********************************************************
// 		  					TRADE 				
// *********************************************************
INSTANCE DIA_Matteo_TRADE (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 800;
	condition	= DIA_Matteo_TRADE_Condition;
	information	= DIA_Matteo_TRADE_Info;
	permanent	= TRUE;
	description = "Montrez-moi vos marchandises.";
	Trade		= TRUE;
};                       
FUNC INT DIA_Matteo_TRADE_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};	
};

var int Matteo_TradeNewsPermanent;

FUNC VOID DIA_Matteo_TRADE_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Montrez-moi vos marchandises.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //Depuis que les mercenaires ont tu� Lothar, les autres paladins se livrent � des inspections nettement plus pouss�es.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //J'esp�re que cela se calmera quand ils auront pendu l'assassin.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Cette fois on dirait que les paladins ne plaisantent plus. M�me les gardes du navire ont �t� retir�s de leur poste.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //Vous avez bien raison de venir vous approvisionner maintenant. Qui sait si la ville sera encore l� dans une semaine�?
	
		Matteo_TradeNewsPermanent = 2;
	};
};

// *********************************************************
// 		  					ARMOR 				
// *********************************************************

//-------------------------------------
	var int Matteo_LeatherBought;
//-------------------------------------

instance DIA_Matteo_LEATHER		(C_INFO)
{
	npc			 = 	VLK_416_Matteo;
	nr			 =  850;
	condition	 = 	DIA_Matteo_LEATHER_Condition;
	information	 = 	DIA_Matteo_LEATHER_Info;
	permanent	 = 	TRUE;
	description	 = 	"Acheter armure de cuir. Protection : Armes 25, Fl�ches 20. (250 pi�ces d'or)";
};

func int DIA_Matteo_LEATHER_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	&& (Matteo_LeatherBought == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Matteo_LEATHER_Info ()
{
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //Tr�s bien, donnez-moi l'armure.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //(sourit) Vous allez l'adorer.

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //Elle co�te un prix non n�gligeable, bien s�r, mais elle le vaut amplement. Revenez quand vous aurez de quoi payer.
	};
};

// ************************************************************
// 			  				Paladine 			E1
// ************************************************************
INSTANCE DIA_Matteo_Paladine(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Paladine_Condition;
	information	= DIA_MAtteo_Paladine_Info;
	permanent	= FALSE;
	description = "Que savez-vous au sujet des paladins ?";
};                       
FUNC INT DIA_Matteo_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Matteo_Paladine_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //Que savez-vous au sujet des paladins�?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //Je n'ai que des ennuis depuis que ces pourris sont arriv�s en ville.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //La derni�re fois que je suis all� dans le haut quartier, les gardes m'ont arr�t� � l'entr�e pour me demander ce que je venais y faire�!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //Et ?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Ils m'ont laiss� passer heureusement�!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //Je poss�dais d�j� ma boutique en ville alors que ces cr�tins pompeux en �taient encore r�duits � chasser les cochons avec leurs �p�es en bois�!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //Et pas plus tard qu'hier, ces enfoir�s sont venus confisquer la moiti� de ma marchandise�!
};

// ************************************************************
// 			  				Confiscated 			E2
// ************************************************************
INSTANCE DIA_Matteo_Confiscated(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Confiscated_Condition;
	information	= DIA_MAtteo_Confiscated_Info;
	permanent	= FALSE;
	description = "Les paladins ont confisqu� vos affaires ?";
};                       
FUNC INT DIA_Matteo_Confiscated_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Confiscated_Info()
{	

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //Les paladins se sont saisis de votre marchandise�?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //De tout ce que j'avais dans la cour, oui.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //Ils se sont content�s de placer un �criteau � l'entr�e de la cour.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //Avec un peu de chance, ils ne me prendront pas tout. Ils devraient au moins me laisser l'armure...
};

// ************************************************************
// 			  				HelpMeToOV 			E2
// ************************************************************
INSTANCE DIA_Matteo_HelpMeToOV(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeToOV_Condition;
	information	= DIA_MAtteo_HelpMeToOV_Info;
	permanent	= FALSE;
	description = "Pouvez-vous m'aider � acc�der au haut quartier ?";
};                       
FUNC INT DIA_Matteo_HelpMeToOV_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeToOV_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //Pouvez-vous m'aider � acc�der au haut quartier�?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //(�bahi) Quoi ? Qu'est-ce que vous avez � y faire ?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //J'ai un message important...
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //Eh bien, eh bien... avez-vous essay� de franchir les gardes�?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //(rire amer) A votre avis�?
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //(�clate de rire) Cela ne m'�tonne pas d'eux�! Les sales mendiants�!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //Ce n'est m�me pas la peine d'essayer.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //Vous avez sans doute raison.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //J'ignore si votre message est important ou non, et cela ne me regarde pas.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Mais m�me si vous disiez qu'un navire regorgeant d'orques venait de jeter l'ancre au port, ils vous chasseraient.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Parce qu'ils ont des ORDRES.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Cela a vraiment l'air important � vos yeux.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //(rus�) Toute la question est bien �videmment de savoir � quel point c'est important pour vous...
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //O� vous voulez en venir�?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Je devrais pouvoir vous aider... ne suis-je pas l'un des hommes les plus influents de la ville apr�s tout�?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Mais cela ne sera pas gratuit.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "Donc vous pouvez m'aider � acc�der au haut quartier ?";
};                       
FUNC INT DIA_Matteo_HelpMeNow_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeToOV))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeNow_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //Alors, pouvez-vous m'aider � acc�der au haut quartier�?
	B_Matteo_Preis();
};

// ************************************************************
// 			  		LEHRLING als GILDE X
// ************************************************************
INSTANCE DIA_Matteo_LehrlingLater(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_LehrlingLater_Condition;
	information	= DIA_MAtteo_LehrlingLater_Info;
	permanent	= FALSE;
	description = "Aidez-moi � devenir l'apprenti d'un des ma�tres.";
};                       
FUNC INT DIA_Matteo_LehrlingLater_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func VOID DIA_Matteo_LehrlingLater_Info()
{	
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Alors, pouvez-vous m'aider � acc�der au haut quartier�?
	B_Matteo_Preis();
};
	
// ************************************************************
// 			  		PriceOfHelp  (MISSION)			E4
// ************************************************************
INSTANCE DIA_Matteo_PriceOfHelp(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_PriceOfHelp_Condition;
	information	= DIA_MAtteo_PriceOfHelp_Info;
	permanent	= FALSE;
	description = "Que voulez-vous en �change de votre aide ?";
};                       
FUNC INT DIA_Matteo_PriceOfHelp_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_PriceOfHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //Que voulez-vous en �change de votre aide�?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 pi�ces d'or.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Cela fait vraiment beaucoup...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Esp�ce de requin !", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //Du calme�! Ce n'est pas VOTRE or qui m'int�resse...
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //Mais ?
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //En fait, il s'agit m�me du mien.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Gritta, la ni�ce du charpentier, me doit de l'argent depuis une �ternit�.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //Et la petite garce a sans cesse de nouveaux v�tements. Autrement dit, elle a de quoi se les acheter.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //J'aimerais bien r�cup�rer mon d� en lui donnant une bonne le�on, mais ma�tre Thorben, le charpentier, est un homme tr�s influent.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Ramenez-moi mon argent et je vous aiderai.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Gritta, la ni�ce du charpentier Thorben, doit 100 pi�ces d'or � Matt�o. Si je lui r�cup�re cette somme, il m'aidera � acc�der au haut quartier.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //Esp�ce de requin�!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //C'est une sacr�e somme�!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

// ************************************************************
// 			  				WoGritta 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoGritta(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_WoGritta_Condition;
	information	= DIA_MAtteo_WoGritta_Info;
	permanent	= FALSE;
	description = "O� puis-je trouver cette Gritta ?";
};                       
FUNC INT DIA_Matteo_WoGritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (Gritta.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoGritta_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //O� puis-je trouver cette Gritta�?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Comme je vous l'ai dit, c'est la ni�ce du charpentier. Celui-ci habite dans cette rue. C'est la derni�re maison � droite avant la forge.
};

// ************************************************************
// 			  				GoldRunning 			E5
// ************************************************************
INSTANCE DIA_Matteo_GoldRunning(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 500;
	condition	= DIA_Matteo_GoldRunning_Condition;
	information	= DIA_MAtteo_GoldRunning_Info;
	permanent	= TRUE;
	description = "Voici vos 100 pi�ces d'or !";
};                       
FUNC INT DIA_Matteo_GoldRunning_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& ( Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_GoldRunning_Info()
{	
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //Voil� vos 100 pi�ces d'or.
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //Cet or est macul� du sang de Gritta�! Je ne vous ai jamais dit de la tuer�!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //Je n'ai rien � voir avec cette histoire�! Oubliez notre accord et ne l'�voquez plus jamais en ma pr�sence, c'est compris�? Plus jamais�!
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos	(self);
		return;
	};
	
	// FUNC

	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		if (Npc_HasItems(Gritta, itmi_gold) < 100)
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //Alors, vous a-t-elle caus� des ennuis�?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Pas vraiment...
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //Bien. Vous avez respect� votre part du march�.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //Vous voulez me rembourser � sa place�? Hmm... j'aurais pr�f�r� que vous la forciez � payer...
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Mais bon... 100 pi�ces d'or, c'est 100 pi�ces d'or.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Vous avez respect� votre part du march�.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //Le calcul n'est manifestement pas votre point fort. Vous n'avez pas 100 pi�ces d'or.
	};
};

// ************************************************************
// 		  				Stimme abgeben		E5 - PERM
// ************************************************************

instance DIA_Matteo_Zustimmung(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_Zustimmung_Condition;
	information	= DIA_MAtteo_Zustimmung_Info;
	permanent	= TRUE;
	description = "Aidez-moi � devenir l'apprenti d'un des ma�tres.";
};          
var int   DIA_Matteo_Zustimmung_perm;          
FUNC INT DIA_Matteo_Zustimmung_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& ( (MIS_Matteo_Gold == LOG_RUNNING) || (MIS_Matteo_Gold == LOG_SUCCESS) )
	&& (Player_IsApprentice == APP_NONE)
	&& (DIA_Matteo_Zustimmung_perm == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Zustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //Aidez-moi � devenir l'apprenti d'un des ma�tres.
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //Ne vous en faites pas, je respecterai ma part du march�.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //Les autres ma�tres n'entendront que des compliments sur vous de ma part.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Matt�o me donnera son accord si je veux devenir l'apprenti d'un autre ma�tre.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Une chose � la fois. Commencez d'abord par remplir votre part du march� en me ramenant mon or.
	};
};

// ************************************************************
// 			  				HowCanYouHelp 			E4
// ************************************************************
INSTANCE DIA_Matteo_HowCanYouHelp (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_HowCanYouHelp_Condition;
	information	= DIA_MAtteo_HowCanYouHelp_Info;
	permanent	= FALSE;
	description = "Comment pouvez-vous m'aider EXACTEMENT ?";
};                       
FUNC INT DIA_Matteo_HowCanYouHelp_Condition()
{	
	if ((Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater)))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HowCanYouHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //Comment pouvez-vous m'aider, au juste�?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //C'est tr�s simple, je ferai usage de mon influence pour que l'un des ma�tres artisans vous prenne comme apprenti.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //Cela vous permettra de devenir citoyen, et donc d'avoir acc�s au haut quartier... tout en gagnant de l'argent.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Matt�o peut m'aider � �tre accept� comme apprenti par un autre ma�tre artisan.");
};	

// ************************************************************
// 			  				WoAlsLehrling 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoAlsLehrling (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_WoAlsLehrling_Condition;
	information	= DIA_MAtteo_WoAlsLehrling_Info;
	permanent	= FALSE;
	description = "Alors o� puis-je devenir apprenti ?";
};                       
FUNC INT DIA_Matteo_WoAlsLehrling_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoAlsLehrling_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //O� dois-je aller pour devenir apprenti�?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //Chez n'importe quel ma�tre de la rue principale.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //Autrement dit, Harad le forgeron, Bosper le fabricant d'arcs, Thorben le charpentier ou Constantino l'alchimiste.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Vous arriverez bien � vous faire accepter par l'un d'eux.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Mais il est important que les autres ma�tres soient d'accord. Telle a toujours �t� la coutume � Khorinis.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Je peux commencer � travailler comme apprenti de Bosper le fabricant d'arcs, d'Harad le forgeron, de Thorben le charpentier ou de Constantino l'alchimiste.");
	B_LogEntry (Topic_Lehrling,"Avant de pouvoir devenir apprenti, je dois obtenir l'accord des autres ma�tres.");
};
// ************************************************************
// 			  				WieZustimmung 			E6
// ************************************************************
INSTANCE DIA_Matteo_WieZustimmung (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 5;
	condition	= DIA_Matteo_WieZustimmung_Condition;
	information	= DIA_MAtteo_WieZustimmung_Info;
	permanent	= FALSE;
	description = "Comment obtenir l'approbation des autres ma�tres ?";
};                       
FUNC INT DIA_Matteo_WieZustimmung_Condition()
{	
	if ( Npc_KnowsInfo (other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo (other,DIA_Matteo_WarumNichtBeiDir) )
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WieZustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //Comment puis-je obtenir l'approbation des autres ma�tres�?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //Il vous faudra les convaincre, ce qui signifie que vous devrez aller leur parler.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Mais il suffit que l'un d'eux soit contre pour que vous ne deveniez jamais apprenti. Alors, attention � ce que vous dites�!
	
	B_LogEntry (Topic_Lehrling,"Pour obtenir leur approbation, je dois leur prouver ma valeur.");
};	

// ************************************************************
// 			  				WarumNichtBeiDir 			E5
// ************************************************************
INSTANCE DIA_Matteo_WarumNichtBeiDir (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_WarumNichtBeiDir_Condition;
	information	= DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent	= FALSE;
	description = "Pourquoi ne pas m'engager comme apprenti ?";
};                       
FUNC INT DIA_Matteo_WarumNichtBeiDir_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WarumNichtBeiDir_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //Pourquoi ne me prenez-vous pas comme apprenti, vous�?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //Je voudrais bien, mais les autres ma�tres ne seront jamais d'accord.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //Je viens de prendre un autre apprenti il y a peu.
};	

// ************************************************************
// 			  				Andere M�glichkeie 			E5
// ************************************************************
INSTANCE DIA_Matteo_OtherWay (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_OtherWay_Condition;
	information	= DIA_MAtteo_OtherWay_Info;
	permanent	= FALSE;
	description = "Y a-t-il un autre moyen d'acc�der au haut quartier ?";
};                       
FUNC INT DIA_Matteo_OtherWay_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_OtherWay_Info()
{	
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //Existe-t-il un autre moyen d'acc�der au haut quartier�?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Peut-�tre. Je vais y r�fl�chir et je vous le dirai si une id�e me vient.
};	

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Matteo_Minenanteil (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_Minenanteil_Condition;
	information	= DIA_MAtteo_Minenanteil_Info;

	description = "Vous avez des concessions mini�res dans vos marchandises.";
};   
                    
FUNC INT DIA_Matteo_Minenanteil_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Matteo_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Vous proposez des concessions mini�res au milieu de vos marchandises. Qui vous les a vendues�?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //(nerveux) Des concessions mini�res�? �a alors�! D'o� peuvent-elles bien venir�? Je ne savais m�me pas que j'en avais, votre honneur.
	B_GivePlayerXP (XP_Ambient);
};	





































