///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jora_EXIT   (C_INFO)
{
	npc         = VLK_408_Jora;
	nr          = 999;
	condition   = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent   = TRUE;
	description = "Je dois y aller !";
};

FUNC INT DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jora_EXIT_Info()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //H�! Et mon argent�?
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_Sperre_Condition;
	information	 = 	DIA_Jora_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Jora_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self,ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Jora_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Vous �tes un prisonnier de la colonie mini�re�! Il est hors de question que je vous vende quoi que ce soit�!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	700;
	condition	 = 	DIA_Jora_WAREZ_Condition;
	information	 = 	DIA_Jora_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Montrez-moi vos marchandises.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Montrez-moi vos marchandises.
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET		(C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 1;
	condition	= DIA_Jora_GREET_Condition;
	information	= DIA_Jora_GREET_Info;
	permanent 	= FALSE;
	important	= TRUE;
};
func int DIA_Jora_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GREET_Info ()
{
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Innos soit avec vous, �tranger. Si vous cherchez des articles de voyage, vous avez frapp� � la bonne porte.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Mais je vous pr�viens�: si vous avez l'intention de vous servir sans payer, j'appelle la garde�!
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //H�, un instant�! Est-ce que j'ai l'air d'un voleur�?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //(m�prisant) Bah�! Vous ne seriez pas le premier � me d�valiser aujourd'hui...

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora vend des armes de toutes sortes sur la place du march�.");
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Bestohlen_Condition;
	information	 = 	DIA_Jora_Bestohlen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Quelqu'un vous a vol� ?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //Quelqu'un vous a vol�?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //Je ne peux pas le prouver, car il �tait vraiment tr�s fort. Il m'a dit s'appeler Rengaru, mais quant � savoir s'il s'agit de son vrai nom...
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //Cela fait plusieurs jours qu'il tra�ne sur la place du march�.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //Chaque soir, il prend une cuite � la taverne du bout de la rue. Et je parie qu'il se la paye avec mon argent !
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //J'ai juste d�tourn� les yeux un instant et ma bourse avait disparu.
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //Ecoutez, si vous reprenez mon or � ce Rengaru, je vous dirai tout ce que je sais.
};


// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_HolDeinGold_Condition;
	information	 = 	DIA_Jora_HolDeinGold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Je pourrais vous ramener votre or.";
};
func int DIA_Jora_HolDeinGold_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};
func void DIA_Jora_HolDeinGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //Je peux aller r�cup�rer votre or, si vous voulez.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //(m�fiant) Oh�? Et pourquoi feriez-vous �a�?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"Je veux une part de l'or en r�compense !",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Je recherche des pistes pouvant me mener � la guilde des voleurs.", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Cela d�pend� Pouvez-vous m'aider � acc�der au haut quartier ?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //�a d�pend. Pouvez-vous m'aider � entrer au haut quartier�?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //(�clate de rire) Vous ne vous adressez pas � la bonne personne. Comme la plupart des marchands de la place du march�, je n'habite pas en ville.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Si vous voulez vous introduire au haut quartier, allez voir les marchands r�sidents.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //Je recherche la guilde des voleurs.
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Il se peut que je sois capable de vous aider...
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Je vais voir ce que je peux faire.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Combien y avait-il d'or dans la bourse ?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Pourquoi n'avez-vous pas fait appel � la garde ?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //Je veux une partie de l'or en guise de r�compense.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Commencez par me ramener ma bourse et nous discuterons de votre r�compense.
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Je vais voir ce que je peux faire.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Combien y avait-il d'or dans la bourse ?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Pourquoi n'avez-vous pas fait appel � la garde ?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //Pourquoi n'avez-vous pas appel� la garde�?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Elle ne peut intervenir que lorsqu'un voleur est pris la main dans le sac.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //Et quand je me suis rendu compte de la disparition de ma bourse, ce pourri �tait d�j� parti�!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //Quelle somme y avait-il � l'int�rieur�?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 pi�ces d'or. Ce n'est pas rien vu la conjoncture actuelle.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //Je verrai ce que je peux faire.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //M�fiez-vous�! Si vous le frappez, la milice s'en m�lera.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //Depuis quelque temps, la situation ne cesse d'empirer et, depuis qu'ils sont en ville, les paladins sont particuli�rement s�v�res avec ceux qui troublent l'ordre public.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Il va vous falloir trouver autre chose.
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //Je n'y manquerai pas.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "Un certain Rengaru a vol� le marchand Jora. Il passe ses journ�es sur la place du march�.");
	B_LogEntry (TOPIC_Jora, "Je dois retrouver l'or de Jora pour le lui rendre.");
	B_LogEntry (TOPIC_JoraDieb, "Rengaru a vol� le marchand Jora. Si je l�appr�hende, il y aura peut-�tre une r�compense.");

	Info_ClearChoices 	(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_WegenDieb_Condition;
	information	 = 	DIA_Jora_WegenDieb_Info;
	permanent	 = 	TRUE;
	description	 = 	"A propos du voleur...";
};
func int DIA_Jora_WegenDieb_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_WegenDieb_Info ()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //A propos de votre voleur...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Oui�? Alors, comment �a se passe�? Vous l'avez attrap�? Et surtout, est-ce que vous avez mon or�?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Eh bien� Il a eu un accident fatal.",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"Oui, je l'ai arr�t�.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Il a r�ussi � fuir.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"J'y travaille !",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //Pas encore, mais j'y travaille.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //Alors, veillez � me ramener mon or�!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Il m'a �chapp�.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //Et mon or�? Il a fil� avec�?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Je l'ai eu, oui. Il aura tout le temps de r�fl�chir � la port�e de son acte en prison.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //Et mon or�?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //Eh bien... il a eu un accident mortel.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //Au moins, il ne volera plus personne�! La justice divine a frapp�.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //O� est mon or�?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zur�ckbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voici les 50 pi�ces d'or qu'il vous a vol�es.";
};

func int DIA_Jora_BringGold_Condition ()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_BringGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Voici les 50 pi�ces d'or qu'il vous a vol�es.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //Innos soit lou�! La justice n'a pas disparu dans cette ville�!
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //H�, il n'y a pas 50 pi�ces d'or�! Vous essayez vous aussi de me voler�?
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------

instance DIA_Jora_GHDgInfo (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_GHDgInfo_Condition;
	information	 = 	DIA_Jora_GHDgInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Que savez-vous au sujet de la guilde des voleurs ?";
};

func int DIA_Jora_GHDgInfo_Condition ()
{
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GHDgInfo_Info ()
{
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //Que savez-vous au sujet de la guilde des voleurs�?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //Bon, �coutez... vous n'avez jamais entendu ce que je m'appr�te � vous dire, c'est bien compris�?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //Des individus louches fr�quentent le pub des quais.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //Je parie que le propri�taire aurait des choses � vous apprendre.
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Si vous avez l'intention de remonter jusqu'aux voleurs, c'est � lui que vous devriez aller parler.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //Par exemple, faites semblant de pr�parer un mauvais coup. Peut-�tre qu'il tombera dans le panneau.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Mais faites tr�s attention, ces gens-l� ne rigolent pas�!
		
		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Belohnung_Condition;
	information	 = 	DIA_Jora_Belohnung_Info;
	permanent	 = 	FALSE;
	description	 = 	"Je veux une part de l'or en r�compense !";
};

func int DIA_Jora_Belohnung_Condition ()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Jora_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //Je veux une partie de l'or en guise de r�compense.
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Mais je vous ai d�j� donn� une tr�s bonne piste�!
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //Cela devrait vous suffire comme r�compense.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Si c'est de l'or que vous voulez, coincez les voleurs et allez chercher la r�compense offerte par le seigneur Andr�.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //Veillez m'excuser, mes clients m'attendent.
	};
	AI_StopProcessInfos (self); 
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_AlriksSchwert_Condition;
	information	 = 	DIA_Jora_AlriksSchwert_Info;
	permanent	 = 	FALSE;
	description	 = 	"Alrik dit que vous avez son �p�e...";
};
func int DIA_Jora_AlriksSchwert_Condition ()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_AlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik dit que vous avez son �p�e.
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //Vous voulez parler du type d�penaill� qui m'a offert son arme en �change de quelques torches et morceaux de viande�?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //En effet.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //J'ai toujours l'�p�e.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //Combien en voulez-vous�?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //Eh bien, pour vous...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //Bah, apr�s tout�! Tenez, prenez-la. Vous m'avez bien aid� � r�cup�rer mon or, alors...
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //Pour vous, ce sera 50 pi�ces d'or.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //(bougon) Je ne l'ai plus. Du diable si je sais o� elle peut se trouver maintenant.
	};
};


// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BUYAlriksSchwert_Condition;
	information	 = 	DIA_Jora_BUYAlriksSchwert_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voici 50 pi�ces d'or. Donnez-moi l'�p�e d'Alrik.";
};
func int DIA_Jora_BUYAlriksSchwert_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};
func void DIA_Jora_BUYAlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Voici 50 pi�ces d'or. Remettez-moi l'�p�e d'Alrik.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - f�r 50 Goldst�cke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Tenez. (content de lui) �a, c'est ce qu'on appelle une bonne affaire�!
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //Vous n'avez pas assez d'or. Mais ne vous en faites pas, je vais garder l'�p�e quelque temps encore. Revenez plus tard.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jora_PICKPOCKET (C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 900;
	condition	= DIA_Jora_PICKPOCKET_Condition;
	information	= DIA_Jora_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen (31, 45);
};
 
FUNC VOID DIA_Jora_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jora_PICKPOCKET);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_BACK 		,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};
	
func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};









