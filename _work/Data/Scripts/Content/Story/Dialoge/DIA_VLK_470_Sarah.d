///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sarah_EXIT   (C_INFO)
{
	npc         = VLK_470_Sarah;
	nr          = 999;
	condition   = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sarah_PICKPOCKET (C_INFO)
{
	npc			= VLK_470_Sarah;
	nr			= 900;
	condition	= DIA_Sarah_PICKPOCKET_Condition;
	information	= DIA_Sarah_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Sarah_PICKPOCKET_Condition()
{
	C_Beklauen (57, 60);
};
 
FUNC VOID DIA_Sarah_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sarah_PICKPOCKET);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_BACK 		,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};
	
func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Greet
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Greet		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  1;
	condition	 = 	DIA_Sarah_Greet_Condition;
	information	 = 	DIA_Sarah_Greet_Info;
	permanent 	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Sarah_Greet_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Greet_Info ()
{
	AI_Output (self, other, "DIA_Sarah_Add_16_07"); //Ah, vous revoilà !
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_HALLO		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	condition	 = 	DIA_Sarah_HALLO_Condition;
	information	 = 	DIA_Sarah_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Comment vont les affaires ?";
};

func int DIA_Sarah_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Sarah_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Sarah_HALLO_15_00"); //Comment vont les affaires ?
	AI_Output (self, other, "DIA_Sarah_HALLO_16_01"); //Quand les paladins sont arrivés, j'ai tout d'abord cru que ce serait bénéfique pour le commerce...
	AI_Output (self, other, "DIA_Sarah_HALLO_16_02"); //Mais ils ont chargé Harad de forger toutes leurs armes, et ni Hakon ni moi-même ne leur vendons quoi que ce soit.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_03"); //Comme si cela ne suffisait pas, les fermiers ne nous livrent plus en nourriture et les prix flambent.
	AI_Output (self, other, "DIA_Sarah_Add_16_00"); //Certes, les paladins payent ma note d'hôtel, mais c'est une bien piètre consolation...

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Sarah vend des armes sur la place du marché.");	
};
///////////////////////////////////////////////////////////////////////
//	Info Bauern
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Bauern		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  2;
	condition	 = 	DIA_Sarah_Bauern_Condition;
	information	 = 	DIA_Sarah_Bauern_Info;
	permanent	 =  FALSE;
	description	 = 	"Quel est le problème avec les fermiers ?";
};

func int DIA_Sarah_Bauern_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_HALLO)
	{
			return TRUE;
	};
};
func void DIA_Sarah_Bauern_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Bauern_15_00"); //Quel est le problème, avec les fermiers ?
	AI_Output (self, other, "DIA_Sarah_Bauern_16_01"); //Ils refusent de nous livrer.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_02"); //Et maintenant que les bateaux n'arrivent plus, la ville dépend bien sûr totalement de la nourriture livrée par les fermiers.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_03"); //Onar, le plus grand fermier de la région, a engagé des mercenaires afin de protéger son exploitation des gardes de la ville, sans quoi ces derniers iraient se servir chez lui sans lui demander son avis.
	AI_Output (self, other, "DIA_Sarah_Add_16_01"); //Mais les mercenaires ne se contentent pas de garder la ferme d'Onar.
	AI_Output (self, other, "DIA_Sarah_Add_16_02"); //Ils se rendent également aux autres fermes afin d'intimider les petits fermiers.
	AI_Output (self, other, "DIA_Sarah_Add_16_03"); //Je les ai vus faire quand je suis passée devant la ferme d'Akil. Je n'aimerais pas être à la place de ce dernier.
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  3;
	condition	 = 	DIA_Sarah_AkilsHof_Condition;
	information	 = 	DIA_Sarah_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Où puis-je trouver la ferme d'Akil ?";
};

func int DIA_Sarah_AkilsHof_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_Bauern)
	{
		return TRUE;
	};
};
func void DIA_Sarah_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Sarah_AkilsHof_15_00"); //Où se trouve la ferme d'Akil ?
	AI_Output (self, other, "DIA_Sarah_Add_16_04"); //Sortez de la ville par la porte est et prenez la route de droite. Vous finirez par arriver à un escalier.
	AI_Output (self, other, "DIA_Sarah_Add_16_05"); //Empruntez-le pour atteindre la ferme d'Akil.
	AI_Output (self, other, "DIA_Sarah_Add_16_06"); //Mais je vous déconseille d'y aller maintenant... les mercenaires doivent encore s'y trouver.
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Trade		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_Trade_Condition;
	information	 = 	DIA_Sarah_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 =	TRUE;
	description	 = 	"Montrez-moi vos marchandises.";
};

func int DIA_Sarah_Trade_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	&& (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Sarah_Trade_15_00"); //Montrez-moi vos marchandises.
	
	Sarah_WaffenGesehen = TRUE;
	
};
///////////////////////////////////////////////////////////////////////
//	Info ImKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_IMKNAST		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_IMKNAST_Condition;
	information	 = 	DIA_Sarah_IMKNAST_Info;
	permanent	 = 	TRUE;
	important 	 =  TRUE;
};

func int DIA_Sarah_IMKNAST_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)	
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Sarah_IMKNAST_Info ()
{
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_00"); //Vous ? Vous osez revenir ici ? Il m'est impossible de le prouver, mais je suis sûre que vous avez joué un rôle dans ce sale tour !
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_01"); //C'est votre faute si je suis ici, à vous et à ce maudit Canthar ! Puisse Innos vous châtier tous les deux !
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Success		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  4;
	condition	 = 	DIA_Sarah_Success_Condition;
	information	 = 	DIA_Sarah_Success_Info;
	permanent 	 =  FALSE;
	description	 = 	"Canthar essayait de vous escroquer...";
};

func int DIA_Sarah_Success_Condition ()
{	
	if (Canthar_Ausgeliefert == TRUE)
	//|| (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Success_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Success_15_00"); //Oui voulait vous tendre un piège afin de s'emparer de votre emplacement, mais je l'ai dénoncé aux gardes.
	AI_Output (self, other, "DIA_Sarah_Success_16_01"); //Alors, vous vous êtes fait un dangereux ennemi. Je connais cet ignoble individu depuis longtemps, et il a toujours cherché à me voler mon emplacement.
	AI_Output (self, other, "DIA_Sarah_Success_16_02"); //Prenez cette arme en guise de remerciement de ma part.
	
	B_GivePlayerXP (XP_CantharImKnast);
	B_GiveInvItems (self, other, ItMw_Piratensaebel,1);
	
};
	
	  
	  
	   





