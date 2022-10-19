///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rangar_EXIT   (C_INFO)
{
	npc         = MIL_321_Rangar;
	nr          = 999;
	condition   = DIA_Rangar_EXIT_Condition;
	information = DIA_Rangar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rangar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rangar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rangar_PICKPOCKET (C_INFO)
{
	npc			= MIL_321_Rangar;
	nr			= 900;
	condition	= DIA_Rangar_PICKPOCKET_Condition;
	information	= DIA_Rangar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait facile de lui voler la clef)";
};                       

FUNC INT DIA_Rangar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_02) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rangar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rangar_PICKPOCKET);
	Info_AddChoice		(DIA_Rangar_PICKPOCKET, DIALOG_BACK 		,DIA_Rangar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rangar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rangar_PICKPOCKET_DoIt);
};

func void DIA_Rangar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_02, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Rangar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Rangar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rangar_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rangar_Hallo   (C_INFO)
{
	npc         = MIL_321_Rangar;
	nr          = 2;
	condition   = DIA_Rangar_Hallo_Condition;
	information = DIA_Rangar_Hallo_Info;
	permanent   = FALSE;
	description = "Eh ! Quoi de neuf ?";
};

FUNC INT DIA_Rangar_Hallo_Condition()
{
	if ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<500) == FALSE)
	&& ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03")<500) == FALSE)
		{
			return TRUE;
		};
};

FUNC VOID DIA_Rangar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Rangar_Hallo_15_00");//Hé ! Comment ça va ?
	AI_Output (self, other, "DIA_Rangar_Hallo_07_01");//Tant que les paladins n'ont pas d'autre mission pour moi, je suis libre de boire quelques verres ici. Que demander de plus ? (sourire)
	AI_Output (other, self, "DIA_Rangar_Hallo_15_02");//Vous travaillez pour les paladins ?
	AI_Output (self, other, "DIA_Rangar_Hallo_07_03");//Oui. Je leur fais des rapports sur ce qui se passe en ville. Mais tout est calme, en ce moment.
};
///////////////////////////////////////////////////////////////////////
//	Info Ork
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rangar_Ork   (C_INFO)
{
	npc         = MIL_321_Rangar;
	nr          = 3;
	condition   = DIA_Rangar_Ork_Condition;
	information = DIA_Rangar_Ork_Info;
	permanent   = FALSE;
	description = "Comment ça se passe avec les orques ?";
};

FUNC INT DIA_Rangar_Ork_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Rangar_Hallo)
	&& ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<500) == FALSE)
	&& ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03")<500) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rangar_Ork_Info()
{
	AI_Output (other, self, "DIA_Rangar_Ork_15_00");//Comment ça se passe, avec les orques ?
	AI_Output (self, other, "DIA_Rangar_Ork_07_01");//Inutile de vous en faire. La garde, dont je fais partie, et les paladins contrôlent la situation.
	AI_Output (self, other, "DIA_Rangar_Ork_07_02");//Rentrez chez vous et laissez-nous faire notre travail. Nous veillons sur la ville et ses habitants... *hic*
};
///////////////////////////////////////////////////////////////////////
//	Info Ork
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rangar_Bier   (C_INFO)
{
	npc         = MIL_321_Rangar;
	nr          = 4;
	condition   = DIA_Rangar_Bier_Condition;
	information = DIA_Rangar_Bier_Info;
	permanent   = TRUE;
	description = "Voulez-vous une autre bière ?";
};

FUNC INT DIA_Rangar_Bier_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Rangar_Hallo)
	&& ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<500) == FALSE)
	&& ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03")<500) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rangar_Bier_Info()
{
	AI_Output (other, self, "DIA_Rangar_Bier_15_00");//Est-ce qu'une autre bière vous dirait ?
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		if (Knows_Paladins == FALSE)
		{
			AI_Output (self, other, "DIA_Rangar_Bier_07_01");//Ahhhh ! Rien ne vaut une bonne bière bien fraîche...
			CreateInvItems (self, ItFo_Booze,1);
			B_UseItem (self, ItFo_Booze);
			AI_Output (other, self, "DIA_Rangar_Bier_15_02");//Vous étiez en train de me parler des orques...
			AI_Output (self, other, "DIA_Rangar_Bier_07_03");//Ah, oui, c'est vrai. Les orques ne représentent pas la moindre menace pour la ville.
			AI_Output (self, other, "DIA_Rangar_Bier_07_04");//Ils sont coincés dans la vallée des Mines et les paladins tiennent le col.
			AI_Output (self, other, "DIA_Rangar_Bier_07_05");//Même un insecte ne passerait pas.
			
			Knows_Paladins = 1;
			Info_ClearChoices (DIA_Rangar_Bier);
		}
		else if (Knows_Paladins == 1) 
		&& (Knows_Ork == TRUE)
		{
			AI_Output (self, other, "DIA_Rangar_Bier_07_06");//Je ne dirais pas non si vous m'offriez une petite chope...
			CreateInvItems (self, ItFo_Booze,1);
			B_UseItem (self, ItFo_Booze);
			AI_Output (other, self, "DIA_Rangar_Bier_15_07");//Un orque aurait été aperçu en dehors de la ville...
			AI_Output (self, other, "DIA_Rangar_Bier_07_08");//Oui, bien sûr. L'orque terriblement dangereux qui se trouve en dehors de la ville. Un vrai monstre. Sûr qu'il va bientôt nous attaquer.
			AI_Output (self, other, "DIA_Rangar_Bier_07_09");//Ecoutez, si cet orque approche un peu trop, on lui bottera le cul. Pigé ?
			AI_Output (other, self, "DIA_Rangar_Bier_15_10");//Je vois.
			Knows_Paladins = 2;
			Info_ClearChoices (DIA_Rangar_Bier);
		}
		else 
		{
			AI_Output (self, other, "DIA_Rangar_Bier_07_11");//La bière amère, c'est celle que je préfère.
			CreateInvItems (self, ItFo_Booze,1);
			B_UseItem (self, ItFo_Booze);
			AI_Output (self, other, "DIA_Rangar_Bier_07_12");//Vous savez, c'est rare, les gens qui acceptent de vous offrir à boire. Vous êtes quelqu'un de bien.
			Info_ClearChoices (DIA_Rangar_Bier);
		};
		
	}
	else 
	{
		AI_Output (self, other, "DIA_Rangar_Bier_07_13");//Bien sûr que je veux une autre bière. Offrez-la moi.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Erwischt
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Rangar_Erwischt		(C_INFO)
{
	npc		 = 	MIL_321_Rangar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Rangar_Erwischt_Condition;
	information	 = 	DIA_Addon_Rangar_Erwischt_Info;

	description	 = 	"Que faites-vous là ?";
};

var int DIA_Addon_Rangar_Erwischt_OneTime;

func int DIA_Addon_Rangar_Erwischt_Condition ()
{
	if ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<500))
	&& (DIA_Addon_Rangar_Erwischt_OneTime == FALSE)
	&& (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Rangar_Erwischt_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Rangar_Erwischt_15_00"); //Que faites-vous là ?
	AI_Output	(self, other, "DIA_Addon_Rangar_Erwischt_07_01"); //(se sentant pris) Huum. Je… euh… Ça ne vous regarde pas. Fichez le camp.
	AI_Output	(other, self, "DIA_Addon_Rangar_Erwischt_15_02"); //Martin va être ravi d'apprendre qui fouille dans ses affaires quand il n'est pas là.
	AI_Output	(self, other, "DIA_Addon_Rangar_Erwischt_07_03"); //(hautain) Faites ce que vous voulez. Je serai déjà loin, mon petit bonhomme.
	B_GivePlayerXP (XP_Addon_Martin_GotRangar);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	SC_GotRangar = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info nachhaken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Rangar_nachhaken		(C_INFO)
{
	npc		 = 	MIL_321_Rangar;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Rangar_nachhaken_Condition;
	information	 = 	DIA_Addon_Rangar_nachhaken_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous croyez vraiment vous en tirer comme ça ?";
};

func int DIA_Addon_Rangar_nachhaken_Condition ()
{
	if (SC_GotRangar == TRUE)
	&& (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Rangar_nachhaken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Rangar_nachhaken_15_00"); //Vous croyez vraiment vous en tirer comme ça ?
	AI_Output	(self, other, "DIA_Addon_Rangar_nachhaken_07_01"); //(indifférent) Ne faites pas tant d'histoires pour un chapardage sans conséquences.
};
