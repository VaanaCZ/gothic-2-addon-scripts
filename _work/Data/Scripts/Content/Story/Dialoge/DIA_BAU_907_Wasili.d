// ************************************************************
// 							EXIT
// ************************************************************
INSTANCE DIA_Wasili_EXIT   (C_INFO)
{
	npc         = BAU_907_Wasili;
	nr          = 999;
	condition   = DIA_Wasili_EXIT_Condition;
	information = DIA_Wasili_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wasili_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wasili_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 							Hallo
// ************************************************************
instance DIA_Wasili_HALLO (C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr          = 1;
	condition	= DIA_Wasili_HALLO_Condition;
	information	= DIA_Wasili_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Wasili_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};

func void DIA_Wasili_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Wasili_HALLO_01_00"); //Ne songez même pas à toucher quoi que ce soit ici sinon vous risquez de gros ennuis, compris ?
};


// ************************************************************
// 								Job
// ************************************************************
instance DIA_Wasili_Job (C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr          = 1;
	condition	= DIA_Wasili_Job_Condition;
	information	= DIA_Wasili_Job_Info;
	permanent 	= FALSE;
	description	= "Quel est votre travail ?";
};

func int DIA_Wasili_Job_Condition ()
{
	return TRUE;
};

func void DIA_Wasili_Job_Info ()
{
	AI_Output (other, self, "DIA_Wasili_Job_15_00"); //En quoi consiste votre travail ?
	AI_Output (self, other, "DIA_Wasili_Job_01_01"); //Onar veut que je passe la journée à surveiller ses affaires.
	AI_Output (self, other, "DIA_Wasili_Job_01_02"); //Il craint que des choses ne disparaissent. A sa place, je m'inquiéterais aussi.
	AI_Output (self, other, "DIA_Wasili_Job_01_03"); //La plupart des mercenaires qu'il a engagés sont d'anciens détenus de la colonie pénitentiaire.
	AI_Output (self, other, "DIA_Wasili_Job_01_04"); //Si on ne fait pas attention, ils seraient capables de se faire la belle avec tout ce qui n'est pas rivé au sol.
};


// ************************************************************
// 								Sammler
// ************************************************************
instance DIA_Wasili_Sammler	(C_INFO)
{
	npc			= BAU_907_Wasili;
	nr		 	= 4;
	condition	= DIA_Wasili_Sammler_Condition;
	information	= DIA_Wasili_Sammler_Info;
	permanent 	= FALSE;
	description	= "Il y a un sacré bric-à-brac ici.";
};

func int DIA_Wasili_Sammler_Condition ()
{
	return TRUE;
};

func void DIA_Wasili_Sammler_Info ()
{
	AI_Output (other, self, "DIA_Wasili_Sammler_15_00"); //Il y a un sacré bric-à-brac ici.
	AI_Output (self, other, "DIA_Wasili_Sammler_01_01"); //Oui et presque tout a de la valeur. Onar ne conserve que des objets de valeur.
	AI_Output (self, other, "DIA_Wasili_Sammler_01_02"); //Un homme modeste comme moi peut difficilement se permettre un tel luxe. Je me raccroche à d'autres choses.
	AI_Output (other, self, "DIA_Wasili_Sammler_15_03"); //Lesquelles ?
	AI_Output (self, other, "DIA_Wasili_Sammler_01_04"); //Je collectionne les vieilles pièces.
	
	MIS_Wasili_BringOldCoin = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FirstOldCoin
///////////////////////////////////////////////////////////////////////
instance DIA_Wasili_FirstOldCoin		(C_INFO)
{
	npc		 = 	BAU_907_Wasili;
	nr		 = 	5;
	condition	 = 	DIA_Wasili_FirstOldCoin_Condition;
	information	 = 	DIA_Wasili_FirstOldCoin_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'ai une vieille pièce.";
};

var int Wasili_BringOldCoin_NoMore;
func int DIA_Wasili_FirstOldCoin_Condition ()
{
	if (MIS_Wasili_BringOldCoin == LOG_RUNNING)
	&& (WasilisOldCoinOffer == 0)
	&& (Npc_HasItems (other,ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE)
		{
				return TRUE;
		};
};
var int WasilisOldCoinOffer;
var int FirstOldCoin_angebotenXP_OneTime;
var int DIA_Wasili_FirstOldCoin_mehr_OneTime;
func void DIA_Wasili_FirstOldCoin_Info ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_15_00"); //J'en ai une sur moi.
	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_01"); //Hum. Montrez-la moi.
	};

	B_GiveInvItems (other, self, ItMi_OldCoin,1);

	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_02"); //Oh ! Ça ne vaut pas grand-chose sur le marché.
	};

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_03"); //Je vous en donne une pièce d'or. Elle ne vaut pas plus.
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_04"); //Vous savez combien je vous en propose. Une pièce d'or, pas plus.
	};
	
	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Non, je pense que je vais la garder.", DIA_Wasili_FirstOldCoin_nein );
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Je ne pense pas. Et que dites-vous de 2 ?", DIA_Wasili_FirstOldCoin_mehr );
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Marché conclu.", DIA_Wasili_FirstOldCoin_ok );

	IF (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
	B_GivePlayerXP (XP_BringOldCoin);
	FirstOldCoin_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Wasili_FirstOldCoin_ok ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_ok_15_00"); //Marché conclu.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_01"); //Bien.

	if (WasilisOldCoinOffer == 2)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_02"); //Voici 2 pièces d'or.
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_03"); //Si vous en trouvez d'autres, vous savez où ME trouver.
		WasilisOldCoinOffer = 1;	
	};

	CreateInvItems (self, ItMi_Gold, WasilisOldCoinOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	WasilisOldCoinOffer);

	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_mehr ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_mehr_15_00"); //Ce n'est pas assez. Et si on disait 2 pièces ?

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_01"); //Rien à faire ! Je ne suis pas cinglé ! Fichez le camp !
		DIA_Wasili_FirstOldCoin_mehr_OneTime = TRUE;
		B_GiveInvItems (self, other, ItMi_OldCoin,1);
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_02"); //Arrh ! Bon, d'accord. 2 pièces d'or pour chaque vieille pièce que vous m'apportez. C'est ma dernière offre.
		WasilisOldCoinOffer =	2;
		Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Dans ce cas, 3 me paraît raisonnable.", DIA_Wasili_FirstOldCoin_ZumTeufel );
	};
};

func void DIA_Wasili_FirstOldCoin_nein ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_nein_15_00"); //Nan, je crois que je vais les garder.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_nein_01_01"); //Elles n'ont aucune valeur pour vous. Vous reviendrez.
	B_GiveInvItems (self, other, ItMi_OldCoin,1);
	WasilisOldCoinOffer = 0;
	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_ZumTeufel ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_ZumTeufel_15_00"); //Dans ce cas, il me semble que la somme de 3 pièces d'or serait honnête.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ZumTeufel_01_01"); //Allez au diable, saligaud.
	AI_StopProcessInfos (self);
	Wasili_BringOldCoin_NoMore = TRUE;
	WasilisOldCoinOffer = 0;
};

///////////////////////////////////////////////////////////////////////
//	Info BringOldCoin
///////////////////////////////////////////////////////////////////////

instance DIA_Wasili_BringOldCoin		(C_INFO)
{
	npc		 = 	BAU_907_Wasili;
	nr		 = 	5;
	condition	 = 	DIA_Wasili_BringOldCoin_Condition;
	information	 = 	DIA_Wasili_BringOldCoin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Voulez-vous d'autres vieilles pièces ?";
};

func int DIA_Wasili_BringOldCoin_Condition ()
{
	if (WasilisOldCoinOffer > 0)
	&& (Npc_HasItems (other,ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE)
		{
				return TRUE;
		};
};

var int OldCoinCounter;

func void DIA_Wasili_BringOldCoin_Info ()
{
	AI_Output			(other, self, "DIA_Wasili_BringOldCoin_15_00"); //Vous êtes intéressé par quelques vieilles pièces ?
	AI_Output			(self, other, "DIA_Wasili_BringOldCoin_01_01"); //Bien sûr. Vous en avez encore ?

	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;

	OldCoinCount = Npc_HasItems(other, ItMi_OldCoin);


		if (OldCoinCount == 1)
			{
				AI_Output		(other, self, "DIA_Wasili_BringOldCoin_15_02"); //Une.
				B_GivePlayerXP (XP_BringOldCoin);
				B_GiveInvItems (other, self, ItMi_OldCoin,1);
				OldCoinCounter = OldCoinCounter + 1;
			}
		else
			{
				AI_Output		(other, self, "DIA_Wasili_BringOldCoin_15_03"); //Quelques-unes.
	
				B_GiveInvItems (other, self, ItMi_OldCoin,  OldCoinCount);
	
				XP_BringOldCoins = (OldCoinCount * XP_BringOldCoin);
				OldCoinCounter = (OldCoinCounter + OldCoinCount); 
	
				B_GivePlayerXP (XP_BringOldCoins);
			};

	AI_Output			(self, other, "DIA_Wasili_BringOldCoin_01_04"); //Merci. Voici votre argent. Apportez-moi toutes celles que vous trouverez.

	OldCoinGeld	= (OldCoinCount * WasilisOldCoinOffer);

	CreateInvItems (self, ItMi_Gold, OldCoinGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OldCoinGeld);
};


// ************************************************************
// 								PERM
// ************************************************************
instance DIA_Wasili_PERM	(C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr		 	= 900;
	condition	= DIA_Wasili_PERM_Condition;
	information	= DIA_Wasili_PERM_Info;
	permanent	= TRUE;
	description	= "Quelqu'un a-t-il déjà tenté de voler quelque chose ?";
};

func int DIA_Wasili_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Wasili_Job))
		{
				return TRUE;
		};
};

func void DIA_Wasili_perm_Info ()
{
	AI_Output (other, self, "DIA_Wasili_PERM_15_00"); //Quelqu'un a-t-il déjà essayé de voler quelque chose ?

	if (Kapitel <= 2)
	{
		if (PETZCOUNTER_Farm_Theft > 0)
		{
			AI_Output (self, other, "DIA_Wasili_PERM_01_01"); //Vous voulez dire à part vous ?
		};
		AI_Output (self, other, "DIA_Wasili_PERM_01_02"); //Quelques-uns, mais je les ai tous attrapés.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Wasili_PERM_01_03"); //Il y a quelques nuits, un des mercenaires s'est introduit dans la maison.
		AI_Output (self, other, "DIA_Wasili_PERM_01_04"); //Il avait une robe noire avec une capuche et je n'ai pas pu voir de qui il s'agissait.
		AI_Output (self, other, "DIA_Wasili_PERM_01_05"); //Mais je l'ai fait fuir.
	};
	
	if (kapitel == 4)
	{
		AI_Output (self, other, "DIA_Wasili_perm_01_06"); //Non. Pas ces derniers temps.
	};
	
	if (kapitel >= 5)
	{
		AI_Output (self, other, "DIA_Wasili_perm_01_07"); //Les mercenaires semblent être prêts à lever le camp.
		AI_Output (self, other, "DIA_Wasili_perm_01_08"); //Cela ne m'étonnerait pas que Lee et ses gars quittent l'île pendant la nuit.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wasili_PICKPOCKET (C_INFO)
{
	npc			= BAU_907_Wasili;
	nr			= 900;
	condition	= DIA_Wasili_PICKPOCKET_Condition;
	information	= DIA_Wasili_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Wasili_PICKPOCKET_Condition()
{
	C_Beklauen (55, 90);
};
 
FUNC VOID DIA_Wasili_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wasili_PICKPOCKET);
	Info_AddChoice		(DIA_Wasili_PICKPOCKET, DIALOG_BACK 		,DIA_Wasili_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wasili_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wasili_PICKPOCKET_DoIt);
};

func void DIA_Wasili_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wasili_PICKPOCKET);
};
	
func void DIA_Wasili_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wasili_PICKPOCKET);
};


