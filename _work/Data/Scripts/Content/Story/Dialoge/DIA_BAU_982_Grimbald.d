///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Grimbald_EXIT   (C_INFO)
{
	npc         = BAU_982_Grimbald;
	nr          = 999;
	condition   = DIA_Grimbald_EXIT_Condition;
	information = DIA_Grimbald_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Grimbald_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_HALLO		(C_INFO)
{
	npc		 = 	BAU_982_Grimbald;
	nr		 = 	3;
	condition	 = 	DIA_Grimbald_HALLO_Condition;
	information	 = 	DIA_Grimbald_HALLO_Info;

	description	 = 	"Attendez-vous quelqu'un ?";
};

func int DIA_Grimbald_HALLO_Condition ()
{
	return TRUE;
};
var int Grimbald_PissOff;

func void DIA_Grimbald_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_15_00"); //Attendez-vous quelqu'un ?
	
	if 	(
		(Npc_IsDead(Grimbald_Snapper1))
		&& (Npc_IsDead(Grimbald_Snapper2))
		&& (Npc_IsDead(Grimbald_Snapper3)))
			{
				AI_Output			(self, other, "DIA_Grimbald_HALLO_07_01"); //Je chasse. Cela me semble évident.
				Grimbald_PissOff = TRUE;
			}
			else
			{
				AI_Output			(self, other, "DIA_Grimbald_HALLO_07_02"); //Plus maintenant. Vous êtes là non ?
				
				Info_ClearChoices	(DIA_Grimbald_HALLO);
				Info_AddChoice	(DIA_Grimbald_HALLO, "J'ai des choses dont je dois m'occuper.", DIA_Grimbald_HALLO_nein );
				Info_AddChoice	(DIA_Grimbald_HALLO, "Que voulez-vous faire ?", DIA_Grimbald_HALLO_Was );
				Info_AddChoice	(DIA_Grimbald_HALLO, "Pourquoi moi ?", DIA_Grimbald_HALLO_ich );
			};
};

func void DIA_Grimbald_HALLO_ich ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_ich_15_00"); //Pourquoi moi ?
	AI_Output			(self, other, "DIA_Grimbald_HALLO_ich_07_01"); //Vous avez l'air fort. Je pourrais avoir besoin de quelqu'un comme vous.
};

func void DIA_Grimbald_HALLO_Was ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_Was_15_00"); //Que voulez-vous faire ?
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_07_01"); //Je veux chasser les saurinides là-bas mais je crois qu'ils sont trop nombreux pour moi.

	Info_AddChoice	(DIA_Grimbald_HALLO, "Comptez pas sur moi pour ça.", DIA_Grimbald_HALLO_Was_neinnein );
	Info_AddChoice	(DIA_Grimbald_HALLO, "Très bien. Je vous aiderai. Après vous.", DIA_Grimbald_HALLO_Was_ja );
};
func void DIA_Grimbald_HALLO_Was_neinnein ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_Was_neinnein_15_00"); //Comptez pas sur moi pour ça.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_neinnein_07_01"); //Alors dégage, lâche.
	Grimbald_PissOff = TRUE;
	Info_ClearChoices	(DIA_Grimbald_HALLO);
};

func void DIA_Grimbald_HALLO_Was_ja ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_Was_ja_15_00"); //Très bien. Je vais vous aider. Passez en premier.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_ja_07_01"); //Bien sûr. Mais ne vous approchez pas trop du troll noir là-bas. Il vous mettrait en pièces, compris ?
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_ja_07_02"); //Et que la honte vous ronge si vous vous dégonflez.
	B_StartOtherRoutine	(self,"Jagd");
	AI_StopProcessInfos (self);
};

func void DIA_Grimbald_HALLO_nein ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_nein_15_00"); //J'ai d'autres choses à faire.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_nein_07_01"); //Ne dites pas n'importe quoi. Que pouvez-vous donc avoir à faire d'aussi important en pleine nature ?
};

///////////////////////////////////////////////////////////////////////
//	Info Jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_Jagd		(C_INFO)
{
	npc		 = 	BAU_982_Grimbald;
	nr		 = 	3;
	condition	 = 	DIA_Grimbald_Jagd_Condition;
	information	 = 	DIA_Grimbald_Jagd_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pouvez-vous m'apprendre à chasser ?";
};

func int DIA_Grimbald_Jagd_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Grimbald_HALLO))
	&& (Grimbald_TeachAnimalTrophy == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Grimbald_Jagd_Info ()
{
	AI_Output			(other, self, "DIA_Grimbald_Jagd_15_00"); //Pouvez-vous m'apprendre à chasser ?
	if 	((Npc_IsDead(Grimbald_Snapper1))
		&& (Npc_IsDead(Grimbald_Snapper2))
		&& (Npc_IsDead(Grimbald_Snapper3)))
		|| (Grimbald_PissOff == FALSE)
	{
		AI_Output			(self, other, "DIA_Grimbald_Jagd_07_01"); //Hum. Très bien. Vous ne m'avez pas vraiment été d'une grande aide mais ne soyons pas trop dur.
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Grimbald_Jagd_07_02"); //Bien sûr, mais ce n'est pas gratuit.
		B_Say_Gold (self, other, 200);
	
		Info_ClearChoices	(DIA_Grimbald_Jagd);
		Info_AddChoice	(DIA_Grimbald_Jagd, "Je vais y réfléchir.", DIA_Grimbald_Jagd_zuviel );
		Info_AddChoice	(DIA_Grimbald_Jagd, "Très bien.", DIA_Grimbald_Jagd_ja );
	};
};

func void DIA_Grimbald_Jagd_ja ()
{
	AI_Output			(other, self, "DIA_Grimbald_Jagd_ja_15_00"); //Très bien, voici votre argent.

		if (B_GiveInvItems (other, self, ItMi_Gold,200))
		{
			AI_Output			(self, other, "DIA_Grimbald_Jagd_ja_07_01"); //Bien. Alors dites-moi quand vous voudrez que je vous apprenne quelque chose.
			Grimbald_TeachAnimalTrophy = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Grimbald_Jagd_ja_07_02"); //Apportez-moi l'argent et je vous enseignerai ce que vous voulez.
		};
	Info_ClearChoices	(DIA_Grimbald_Jagd);
};  

func void DIA_Grimbald_Jagd_zuviel ()
{
	AI_Output			(other, self, "DIA_Grimbald_Jagd_zuviel_15_00"); //Je vais y réfléchir.
	AI_Output			(self, other, "DIA_Grimbald_Jagd_zuviel_07_01"); //Si vous le dites.
	Info_ClearChoices	(DIA_Grimbald_Jagd);
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_TEACHHUNTING		(C_INFO)
{
	npc		     = 	BAU_982_Grimbald;
	nr           =  12;
	condition	 = 	DIA_Grimbald_TEACHHUNTING_Condition;
	information	 = 	DIA_Grimbald_TEACHHUNTING_Info;
	permanent	 =  TRUE;
	description	 = 	"Apprenez-moi à chasser.";
};

func int DIA_Grimbald_TEACHHUNTING_Condition ()
{
	if (Grimbald_TeachAnimalTrophy == TRUE)
		{
				return TRUE;
		};
};
var int DIA_Grimbald_TEACHHUNTING_OneTime;
func void DIA_Grimbald_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Grimbald_TEACHHUNTING_15_00"); //Apprenez-moi à chasser.
	if (DIA_Grimbald_TEACHHUNTING_OneTime == FALSE)
	{
		B_StartOtherRoutine	(self,"JagdOver");
		DIA_Grimbald_TEACHHUNTING_OneTime = TRUE;
	};
	
	if 		(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
			)
			{
				AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_07_01"); //Que voulez-vous savoir exactement ?
	
				Info_AddChoice		(DIA_Grimbald_TEACHHUNTING, DIALOG_BACK, DIA_Grimbald_TEACHHUNTING_BACK);
			
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Dard de mouche sanguine",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Grimbald_TEACHHUNTING_BFSting);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Ailes de mouche sanguine",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Grimbald_TEACHHUNTING_BFWing	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Retirer les griffes",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Grimbald_TEACHHUNTING_Claws	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Retirer les mandibules",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Grimbald_TEACHHUNTING_Mandibles);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Retirer les plaques de foreur",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
				};
			}
			else
			{
				AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_07_02"); //Vous savez déjà tout ce que je peux vous apprendre.
			};
};

func void DIA_Grimbald_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_BFSting_07_00"); //Ce n'est vraiment pas difficile de retirer le dard d'une mouche sanguine. Il faut juste trouver la base et enfoncer votre couteau.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_BFWing_07_00"); //Soit vous arrachez les ailes, soit vous les détachez avec un couteau tranchant.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_Claws_07_00"); //Il y a différents moyens de retirer des griffes. Pour certains animaux, il faut forcer alors qu'avec d'autres un simple couteau permet de les couper.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_Mandibles_07_00"); //Les foreurs des mines et les fléaux des champs ont de puissantes mandibules que vous pouvez ôter de la tête de l'animal d'un coup sec et puissant.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00"); //Les plaques des foreurs des mines sont étroitement collées au corps de l'animal mais vous pouvez les retirer avec un objet tranchant.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};


///////////////////////////////////////////////////////////////////////
//	Info NovChase
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_NovChase		(C_INFO)
{
	npc		 = 	BAU_982_Grimbald;
	nr		 = 	3;
	condition	 = 	DIA_Grimbald_NovChase_Condition;
	information	 = 	DIA_Grimbald_NovChase_Info;

	description	 = 	"Avez-vous vu un novice passer par ici ?";

};

func int DIA_Grimbald_NovChase_Condition ()
{
	if (MIS_NOVIZENCHASE == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Grimbald_NovChase_Info ()
{
	AI_Output			(other, self, "DIA_Grimbald_NovChase_15_00"); //Avez-vous vu un novice passer par ici ?
	AI_Output			(self, other, "DIA_Grimbald_NovChase_07_01"); //De singuliers individus sont passés par ici aujourd'hui dont deux types vers l'arche de pierre là-haut.
	AI_Output			(self, other, "DIA_Grimbald_NovChase_07_02"); //Je les ai vus il y a quelques temps et un novice des Magiciens du feu les accompagnait.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Trolltot
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_Trolltot		(C_INFO)
{
	npc		 = 	BAU_982_Grimbald;
	nr		 = 	3;
	condition	 = 	DIA_Grimbald_Trolltot_Condition;
	information	 = 	DIA_Grimbald_Trolltot_Info;
	important	 = 	TRUE;

};

func int DIA_Grimbald_Trolltot_Condition ()
{
	if (Npc_IsDead(Troll_Black))
		{
				return TRUE;
		};
};

func void DIA_Grimbald_Trolltot_Info ()
{
	AI_Output			(self, other, "DIA_Grimbald_Trolltot_07_00"); //Le troll noir est mort. Bien joué. J'ignorais qu'on pouvait tuer ces choses. Je n'oublierai pas ça.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Grimbald_PICKPOCKET (C_INFO)
{
	npc			= BAU_982_Grimbald;
	nr			= 900;
	condition	= DIA_Grimbald_PICKPOCKET_Condition;
	information	= DIA_Grimbald_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Grimbald_PICKPOCKET_Condition()
{
	C_Beklauen (85, 250);
};
 
FUNC VOID DIA_Grimbald_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Grimbald_PICKPOCKET);
	Info_AddChoice		(DIA_Grimbald_PICKPOCKET, DIALOG_BACK 		,DIA_Grimbald_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Grimbald_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Grimbald_PICKPOCKET_DoIt);
};

func void DIA_Grimbald_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Grimbald_PICKPOCKET);
};
	
func void DIA_Grimbald_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Grimbald_PICKPOCKET);
};


