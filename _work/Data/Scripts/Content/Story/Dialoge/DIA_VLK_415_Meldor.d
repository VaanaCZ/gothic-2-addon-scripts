// ***********************************************************
// 						 	EXIT
// ***********************************************************
INSTANCE DIA_Meldor_EXIT   (C_INFO)
{
	npc         = VLK_415_Meldor;
	nr          = 999;
	condition   = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 						 	Hallo
// ***********************************************************
instance DIA_Meldor_Hallo		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Hallo_Condition;
	information	= DIA_Meldor_Hallo_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Meldor_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Meldor_Hallo_07_00"); //Que voulez-vous ?
	AI_Output (other, self, "DIA_Meldor_Hallo_15_01"); //Je tenais à faire un tour dans le coin.
	AI_Output (self, other, "DIA_Meldor_Hallo_07_02"); //Où allez-vous au juste ?
};

// ***********************************************************
// 						 	Interessantes
// ***********************************************************
instance DIA_Meldor_Interessantes		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Interessantes_Condition;
	information	= DIA_Meldor_Interessantes_Info;
	permanent 	= FALSE;
	description	= "Qu'y a-t-il d'intéressant à voir ici ?";
};

func int DIA_Meldor_Interessantes_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Interessantes_15_00"); //Qu'y a-t-il d'intéressant à voir ici?
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_01"); //Il y a une maison de passe et un pub. Son propriétaire s'appelle Kardif. Si vous êtes à la recherche d'informations, c'est lui qu'il faut aller voir.
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_02"); //Avez-vous besoin d'argent au fait ?
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, le propriétaire du pub du port, vend des informations.");
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************
instance DIA_Meldor_Lehmar		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 3;
	condition	= DIA_Meldor_Lehmar_Condition;
	information	= DIA_Meldor_Lehmar_Info;
	permanent 	= FALSE;
	description	= "Vous en donnez ?";
};

func int DIA_Meldor_Lehmar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Lehmar_15_00"); //Pourquoi vous en donnez ?
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_01"); //(l'air de rien) Non, mais Lehmar le prêteur habite juste là.
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_02"); //Allez chez lui, je suis sûr qu'il acceptera de vous prêter un peu d'argent.
	Npc_ExchangeRoutine (self, "START");
};


// ***********************************************************
// 						 	Arbeitest
// ***********************************************************
instance DIA_Meldor_Arbeitest		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 4;
	condition	= DIA_Meldor_Arbeitest_Condition;
	information	= DIA_Meldor_Arbeitest_Info;
	permanent 	= FALSE;
	description	= "Travaillez-vous pour Lehmar ?";
};

func int DIA_Meldor_Arbeitest_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Arbeitest_15_00"); //Vous travaillez pour Lehmar ?
	AI_Output (self, other, "DIA_Meldor_Arbeitest_07_01"); //Vous comprenez vite vous.
};

// ***********************************************************
// 						 	InsOV
// ***********************************************************
instance DIA_Meldor_InsOV		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_InsOV_Condition;
	information	= DIA_Meldor_InsOV_Info;
	permanent 	= FALSE;
	description	= "En fait, je me rends au haut quartier...";
};

func int DIA_Meldor_InsOV_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info ()
{
	AI_Output (other, self, "DIA_Meldor_InsOV_15_00"); //En fait, je me rends au haut quartier.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_01"); //(sarcastique) Ben voyons ! Et moi, tel que vous me voyez, je saute dans le premier navire en partance pour la capitale car j'ai obtenu une audience auprès du roi.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_02"); //Sauf que les gens comme vous et moi n'ont plus le droit d'entrer dans le haut quartier depuis que les paladins sont là.
};

// ***********************************************************
// 						 	Citizen
// ***********************************************************
instance DIA_Meldor_Citizen		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 6;
	condition	= DIA_Meldor_Citizen_Condition;
	information	= DIA_Meldor_Citizen_Info;
	permanent 	= FALSE;
	description	= "Etes-vous citoyen de la ville ?";
};

func int DIA_Meldor_Citizen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Citizen_15_00"); //Vous êtes citoyen de la ville ?
	AI_Output (self, other, "DIA_Meldor_Citizen_07_01"); //Si vous voulez savoir si j'habite ici, la réponse est oui, mais cela ne suffit pas pour avoir le droit d'aller au haut quartier.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_02"); //Seuls les snobs peuvent y accéder, ainsi que les marchands et artisans du bas quartier.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_03"); //Les habitants du quartier du port n'ont pour ainsi dire aucun poids à Khorinis. La milice ne patrouille même pas ici.

};
// ***********************************************************
// 						 Smoke
// ***********************************************************
instance DIA_Meldor_Smoke		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_Smoke_Condition;
	information	= DIA_Meldor_Smoke_Info;
	permanent 	= FALSE;
	description	= "Savez-vous où je peux acheter de l'herbe ?";
};

func int DIA_Meldor_Smoke_Condition ()
{	
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Meldor_Smoke_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Meldor_Smoke_15_00"); //Savez-vous où je peux acheter de l'herbe ?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_01"); //(vous dévisage) Pas la moindre idée.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_02"); //Si j'étais vous, j'essayerais à la Lanterne Rouge.
	};
};

// ***********************************************************
// 						 	PERM
// ***********************************************************
var int Meldor_DGNews;
// --------------------

instance DIA_Meldor_PERM		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 7;
	condition	= DIA_Meldor_PERM_Condition;
	information	= DIA_Meldor_PERM_Info;
	permanent 	= TRUE;
	description	= "Il s'est passé quelque chose d'intéressant dans le coin ces derniers temps ?";
};

func int DIA_Meldor_PERM_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info ()
{
	AI_Output (other, self, "DIA_Meldor_PERM_15_00"); //Il s'est passé quelque chose de notable récemment ?
	
	if (Kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_01"); //Il n'y a pas longtemps, la garde a fouillé le quartier du port de fond en comble.
		AI_Output (self, other, "DIA_Meldor_PERM_07_02"); //Apparemment, un vol avait été commis. C'est vrai qu'on ne les compte plus récemment, surtout dans les quartiers plus chics.
		AI_Output (self, other, "DIA_Meldor_PERM_07_03"); //Et les pauvres bougres qui habitent le quartier du port ont manifestement été jugés coupables de tout.
	}
	else if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	&&		(Meldor_DGNews == FALSE)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_04"); //Je me suis laissé dire qu'une bande de voleurs avaient été découverts dans les égouts et qu'ils avaient été tués jusqu'au dernier.
		Meldor_DGNews = TRUE;
	}
	else if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_05"); //On dit qu'il y aurait des dragons dans la Vallée des mines. Je me demande quand les paladins vont partir d'ici pour aller les combattre...
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_06"); //Il paraît que tous les dragons sont morts. Quelqu'un a dû faire le ménage avec un balai en acier renforcé...
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_07"); //Non.
	};
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************

instance DIA_Meldor_VonLehmar		(C_INFO)
{
	npc			 = 	VLK_415_Meldor;
	nr			 =  1;
	condition	 = 	DIA_Meldor_VonLehmar_Condition;
	information	 = 	DIA_Meldor_VonLehmar_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Meldor_VonLehmar_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Meldor_VonLehmar_Info ()
{
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_00"); //Hé, attendez !
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_01"); //J'ai un message à vous remettre, de la part de Lehmar.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Meldor_PICKPOCKET (C_INFO)
{
	npc			= VLK_415_Meldor;
	nr			= 900;
	condition	= DIA_Meldor_PICKPOCKET_Condition;
	information	= DIA_Meldor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Meldor_PICKPOCKET_Condition()
{
	C_Beklauen (34, 55);
};
 
FUNC VOID DIA_Meldor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Meldor_PICKPOCKET);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_BACK 		,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
	
func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
































