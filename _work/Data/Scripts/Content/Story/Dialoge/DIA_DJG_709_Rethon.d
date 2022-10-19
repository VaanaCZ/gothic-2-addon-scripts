///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rethon_EXIT   (C_INFO)
{
	npc         = DJG_709_Rethon;
	nr          = 999;
	condition   = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_HALLO		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	5;
	condition	 = 	DIA_Rethon_HALLO_Condition;
	information	 = 	DIA_Rethon_HALLO_Info;

	description	 = 	"Que faites-vous ici ?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //Que faites-vous ici ?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //Je me pr�pare au combat, qu'est-ce que vous croyez ?
};


 ///////////////////////////////////////////////////////////////////////
//	Info Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_KAMPF		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_KAMPF_Condition;
	information	 = 	DIA_Rethon_KAMPF_Info;

	description	 = 	"Contre qui voulez-vous vous battre ?";
};

func int DIA_Rethon_KAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_KAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //Contre qui voulez-vous vous battre ?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //Je pensais m'en prendre aux paladins pour leur botter les fesses.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Imb�cile. Contre les dragons, naturellement. Qu'est-ce que vous croyez ?
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_PALADINE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_PALADINE_Condition;
	information	 = 	DIA_Rethon_PALADINE_Info;

	description	 = 	"Cela ne d�range pas les paladins que vous soyez ici ?";
};

func int DIA_Rethon_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //�a n'ennuie pas les paladins que vous soyez ici ?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Absurde. Ils ont d'autres probl�mes. La plupart d'entre eux sont d�j� heureux d'�tre en vie.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //Leur moral n'est pas au beau fixe. �a causera leur perte.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Regardez-moi ces �p�es �br�ch�es qu'ils tentent de r�parer pour aller se battre.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Tout soldat raisonnable d�serterait sur le champ.

};


///////////////////////////////////////////////////////////////////////
//	Info WoGruppe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_WOGRUPPE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	7;
	condition	 = 	DIA_Rethon_WOGRUPPE_Condition;
	information	 = 	DIA_Rethon_WOGRUPPE_Info;

	description	 = 	"Vous �tes-vous s�par� de votre groupe ?";
};

func int DIA_Rethon_WOGRUPPE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_WOGRUPPE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //Vous avez quitt� votre groupe ?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //Mon groupe ? Je n'ai pas de groupe. Je collectionne les troph�es.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Si je rentre chez moi sans troph�e, je n'aurai aucune raison d'�tre venu. Alors je n'ai besoin de personne.
};


///////////////////////////////////////////////////////////////////////
//	Info drachengesehen
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_DRACHENGESEHEN		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	8;
	condition	 = 	DIA_Rethon_DRACHENGESEHEN_Condition;
	information	 = 	DIA_Rethon_DRACHENGESEHEN_Info;

	description	 = 	"Avez-vous d�j� pos� les yeux sur un dragon ?";
};

func int DIA_Rethon_DRACHENGESEHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_KAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rethon_DRACHENGESEHEN_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //Avez-vous d�j� pos� les yeux sur un dragon ?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //Non. Je veux achever de pr�parer mon arme avant d'y aller.
};

///////////////////////////////////////////////////////////////////////
//	Info Angst
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_ANGST		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	9;
	condition	 = 	DIA_Rethon_ANGST_Condition;
	information	 = 	DIA_Rethon_ANGST_Info;

	description	 = 	"Ne craignez-vous pas que quelqu'un vous coiffe au poteau ?";
};

func int DIA_Rethon_ANGST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_WOGRUPPE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_ANGST_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //Ne craignez-vous pas que quelqu'un agisse avant vous ?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //Quoi ? Qui ? Sylvio ?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Votre patron croit vraiment pouvoir r�ussir, hein ?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //Je ne suis pas un des gars de Sylvio. Je travaille pour moi.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //Oh ! Tr�s bien alors. Oubliez ce que j'ai dit.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //Avez-vous vu les individus path�tiques qui l'accompagnent ?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio pourra s'estimer heureux s'il s'en tire vivant.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //Non, il ne pourra pas. Il est mort.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Tant pis.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Vous ne semblez pas l'appr�cier.", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "Alors o� est Sylvio maintenant ?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "Sylvio �tait ici ?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //Sylvio �tait ici ?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //Dans le ch�teau vous voulez dire ? Oui. Il �tait l�. Mais il n'est pas rest� longtemps.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Il a parl� � quelques personnes puis il est reparti.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Vous ne semblez pas l'appr�cier beaucoup.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //Qu'entendez-vous par l� ? Je ne suis pas particuli�rement fier de le conna�tre.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio n'a pas d'ami. Il a besoin de gens qui le suivent sans se poser de question.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //Je ne mange pas de ce pain-l�. Je travaille seul.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //Alors o� est Sylvio maintenant ?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //Les paladins ont parl� d'un dragon des glaces � l'ouest. C'est cens� �tre le plus puissant et le plus dangereux de tous.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //Vous auriez d� voir cette lueur dans le regard de Sylvio quand il a entendu �a.

	B_LogEntry (TOPIC_DRACHENJAGD,"R�thon, le chasseur de dragon, a marmonn� quelque chose au sujet d'un dragon des glaces."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio �tait au ch�teau puis il est parti � la recherche du dragon des glaces.");

};



///////////////////////////////////////////////////////////////////////
//	Info meineWaffe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_MEINEWAFFE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	10;
	condition	 = 	DIA_Rethon_MEINEWAFFE_Condition;
	information	 = 	DIA_Rethon_MEINEWAFFE_Info;

	description	 = 	"Pouvez-vous m'aider � am�liorer mes armes ?";
};

func int DIA_Rethon_MEINEWAFFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_MEINEWAFFE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //Pouvez-vous m'aider � am�liorer mes armes ?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //Am�liorer ? Il vaut mieux acheter quelque chose de neuf et jeter ce truc que vous avez.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //J'ai peut-�tre quelque chose pour vous. �a vous int�resse ?
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_TRADE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	11;
	condition	 = 	DIA_Rethon_TRADE_Condition;
	information	 = 	DIA_Rethon_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	
	description	 = 	"Que pouvez-vous me vendre ?";
};

func int DIA_Rethon_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_MEINEWAFFE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //Que pouvez-vous me vendre ?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Regardez � quel point j'en suis arriv�. Maintenant je vends mes armes � un paladin.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //Je n'ai pas grand-chose pour un magicien mais vous pouvez tout de m�me jeter un coup d'�il.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //Je crois que j'ai ce qu'il vous faut, camarade.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rethon_PICKPOCKET (C_INFO)
{
	npc			= DJG_709_Rethon;
	nr			= 900;
	condition	= DIA_Rethon_PICKPOCKET_Condition;
	information	= DIA_Rethon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen (78, 230);
};
 
FUNC VOID DIA_Rethon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rethon_PICKPOCKET);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_BACK 		,DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};
	
func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};


