// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Maria_EXIT   (C_INFO)
{
	npc         = BAU_910_Maria;
	nr          = 999;
	condition   = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 1;
	condition	= DIA_Maria_Hallo_Condition;
	information	= DIA_Maria_Hallo_Info;
	permanent  	= FALSE;
	description = "Qui êtes-vous ?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //Qui êtes-vous ?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Je suis la femme d'Onar, Maria.
	AI_Output (self, other, "DIA_Maria_Hallo_17_02"); //Que venez-vous faire ici ?
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 2;
	condition	= DIA_Maria_Umsehen_Condition;
	information	= DIA_Maria_Umsehen_Info;
	permanent  	= FALSE;
	description = "Je voulais juste jeter un coup d'œil dans le coin...";
};

func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Je voulais juste jeter un coup d'œil...
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //Avec tous ces hommes à la ferme, je n'ai plus la paix dans cette maison.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //Ils n'arrêtent pas d'entrer et sortir.
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 3;
	condition	= DIA_Maria_Soeldner_Condition;
	information	= DIA_Maria_Soeldner_Info;
	permanent  	= FALSE;
	description = "Est-ce que les mercenaires vous dérangent ?";
};

func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //Les mercenaires vous embêtent-ils ?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Oh ! Oubliez ce que je viens de dire. On est beaucoup plus en sécurité depuis que ces gars sont arrivés.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //Au moins, c'est beaucoup plus sûr à la ferme depuis l'arrivée des mercenaires.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Quand nous étions tout seuls, la milice n'arrêtait pas de venir pour piller nos provisions.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Ils ont volé la plus grande partie de la récolte et ils ont pris des moutons. Et, en échange, ils n'ont rien fait pour nous.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //Certains de ces bandits nous ont même volés.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //Comprenez-moi bien soldat, je sais que vous n'êtes pas tous comme ça.
		};	
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 4;
	condition	= DIA_Maria_Mission_Condition;
	information	= DIA_Maria_Mission_Info;
	permanent  	= FALSE;
	description = "Alors que vous ont-ils volé ?";
};

func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //Que vous ont-ils volé ?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //De l'or et de l'argenterie. Ils m'ont même dérobé mon cadeau de mariage, une assiette en or.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //Je suis persuadée que maintenant elle prend la poussière dans le coffre d'un sale garde de la ville.
	};
	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 5;
	condition	= DIA_Maria_BringPlate_Condition;
	information	= DIA_Maria_BringPlate_Info;
	permanent  	= FALSE;
	description = "J'ai une assiette en or. Ne serait-ce pas la vôtre ?";
};

func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1);
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //J'ai une assiette en or avec moi. Ne serait-ce pas la vôtre ?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //Oui ! C'est celle-la ! Merci mille fois !
	
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP (XP_Maria_Teller);
};


// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------

instance DIA_Maria_Belohnung	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 6;
	condition	= DIA_Maria_Belohnung_Condition;
	information	= DIA_Maria_Belohnung_Info;
	permanent  	= TRUE;
	description = "Et au sujet de ma récompense ?";
};

func int DIA_Maria_Belohnung_Condition ()
{
	if (MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //Et en ce qui concerne ma récompense ?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //Vous travaillez pour mon mari en tant que mercenaire, n'est-ce pas ?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Exact.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //Combien mon mari vous paie-t-il ?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //Ce n'est pas assez. Allez lui dire de vous payer plus.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //Et vous pensez qu'il acceptera ?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //Il sait ce qui arrivera s'il ne le fait pas. Croyez-moi.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //Voulez-vous travailler comme mercenaire à la ferme ?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "Non, pas vraiment.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Oui.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Tenez, prenez ceci. Vous le méritez.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //Non, pas vraiment.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Alors prenez cet or en récompense. Vous l'avez bien gagné.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Oui.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //Très bien alors. Si vous travaillez ici, je veillerai à ce que vous ayez un salaire décent.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Revenez quand vous aurez parlé de votre salaire à mon mari.
	Info_ClearChoices (DIA_Maria_Belohnung);
};
		
// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 7;
	condition	= DIA_Maria_AboutOnar_Condition;
	information	= DIA_Maria_AboutOnar_Info;
	permanent  	= FALSE;
	description = "Parlez-moi d'Onar.";
};

func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, "DIA_Maria_AboutOnar_15_00"); //Parlez-moi d'Onar...
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //C'est un brave homme. Un peu ronchon et très impatient mais nous avons tous nos défauts.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //J'ai demandé à mon mari pourquoi il laissait les soldats de la ville le traiter de la sorte.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //'Fais quelque chose' lui ai-je dit.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Alors il a engagé les mercenaires. Maintenant j'ai l'impression de me retrouver au beau milieu d'une guerre.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //Mais nous SOMMES en guerre, n'est-ce pas ?
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 8;
	condition	= DIA_Maria_PERM_Condition;
	information	= DIA_Maria_PERM_Info;
	permanent  	= FALSE;
	description = "Il s'est passé quelque chose d'intéressant dans le coin ces derniers temps ?";
};

func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //S'est-il passé quelque chose d'intéressant récemment ?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //Les paladins sont passés par ici.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //Au début, on a cru qu'ils venaient nous attaquer mais ils se rendaient dans la Vallée des mines.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Wasili a chassé un voleur il y a quelques nuits. A part ça, tout est calme.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //C'est beaucoup plus calme dans le coin depuis que certains mercenaires sont partis.
	};
};
			

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maria_PICKPOCKET (C_INFO)
{
	npc			= BAU_910_Maria;
	nr			= 900;
	condition	= DIA_Maria_PICKPOCKET_Condition;
	information	= DIA_Maria_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen (60, 110);
};
 
FUNC VOID DIA_Maria_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maria_PICKPOCKET);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_BACK 		,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};
	
func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


			
			
			
			



	















