///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gestath_EXIT   (C_INFO)
{
	npc         = VLK_4148_Gestath;
	nr          = 999;
	condition   = DIA_Gestath_EXIT_Condition;
	information = DIA_Gestath_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Gestath_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gestath_EXIT_Info()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	if (Hlp_IsItem (heroArmor, ITAR_DJG_Crawler) == TRUE)
	{
		AI_Output			(self, other, "DIA_Gestath_EXIT_09_00"); //(pince-sans-rire) Chouette armure...
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_HALLO		(C_INFO)
{
	npc		 = 	VLK_4148_Gestath;
	nr		 = 	3;
	condition	 = 	DIA_Gestath_HALLO_Condition;
	information	 = 	DIA_Gestath_HALLO_Info;

	description	 = 	"Qu'y a-t-il?";
};

func int DIA_Gestath_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_15_00"); //Comment ça se passe ?
	AI_Output			(self, other, "DIA_Gestath_HALLO_09_01"); //(pince-sans-rire) C'est courageux de votre part d'être venu ici. Vous vous êtes perdu, j'imagine...
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices	(DIA_Gestath_HALLO);
	Info_AddChoice	(DIA_Gestath_HALLO, "Qu'y a-t-il à voir par ici ?", DIA_Gestath_HALLO_waszusehen );
	Info_AddChoice	(DIA_Gestath_HALLO, "Que faites-vous ici ?", DIA_Gestath_HALLO_was );
};
func void DIA_Gestath_HALLO_plate ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_plate_15_00"); //Sacrée armure que vous avez là.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_09_01"); //Oui. Difficile de se la procurer. Elle est faite de plaques de foreurs des mines. C'est un certain Wolf qui me l'a fabriquée.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_09_02"); //Autrefois, j'étais prisonnier ici, à la colonie. Je lui ai amené quelques plaques de foreurs des mines et, quelques jours plus tard, l'armure était terminée. C'est un type bien.

	Wolf_ProduceCrawlerArmor = TRUE;
	
	Info_AddChoice	(DIA_Gestath_HALLO, DIALOG_BACK, DIA_Gestath_HALLO_Back );
	Info_AddChoice	(DIA_Gestath_HALLO, "Où se trouve ce Wolf ?", DIA_Gestath_HALLO_plate_woWolf );
};
func void DIA_Gestath_HALLO_plate_woWolf ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_plate_woWolf_15_00"); //Où est ce Wolf désormais ?
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_01"); //Cela fait quelque temps que je ne l'ai pas vu. A l'époque, il était mercenaire ici, à la colonie.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_02"); //J'imagine qu'il n'a pas changé de métier.
};

func void DIA_Gestath_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_was_15_00"); //Qu'est-ce que vous faites ici ?
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_01"); //Je gagne ma vie.
	AI_Output			(other, self, "DIA_Gestath_HALLO_was_15_02"); //Ici, au milieu de nulle part ?
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_03"); //Je suis chasseur et je me spécialise dans les cas... disons, difficiles.
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_04"); //Lézards de feu, foreurs des mines, draco-saurinides... bref, tout ce que les autres refusent de chasser. Ça me permet de gagner ma vie.
	
	Info_AddChoice	(DIA_Gestath_HALLO, "Vous portez une sacrée armure.", DIA_Gestath_HALLO_plate );
};

func void DIA_Gestath_HALLO_waszusehen ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_waszusehen_15_00"); //Qu'y a-t-il à voir ici ?
	AI_Output			(self, other, "DIA_Gestath_HALLO_waszusehen_09_01"); //Des lézards de feu, des orques et je ne sais quoi d'autre. Plus loin dans les hautes plaines, je ne sais pas. Je n'y suis jamais allé.
	AI_Output			(self, other, "DIA_Gestath_HALLO_waszusehen_09_02"); //Et je vous déconseille d'ailleurs d'essayer. Les bestioles qui y vivent ont l'air tout sauf amicales.
};

func void DIA_Gestath_HALLO_Back ()
{
	Info_ClearChoices	(DIA_Gestath_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachen
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_Drachen		(C_INFO)
{
	npc		 = 	VLK_4148_Gestath;
	nr		 = 	3;
	condition	 = 	DIA_Gestath_Drachen_Condition;
	information	 = 	DIA_Gestath_Drachen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Savez-vous dépecer les dragons ?";
};
var int Gestath_DragonTrophy;

func int DIA_Gestath_Drachen_Condition ()
{
	if (Gestath_DragonTrophy == FALSE)
	&& (Gestath_TeachAnimalTrophy == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Gestath_Drachen_Info ()
{
	AI_Output			(other, self, "DIA_Gestath_Drachen_15_00"); //Vous savez aussi comment vider un dragon ?
	if (Kapitel < 4)
	{
		AI_Output			(self, other, "DIA_Gestath_Drachen_09_01"); //(éclate de rire) Demandez-le moi plus tard, quand vous serez prêt à essayer d'accord ?
	}
	else
	{	
		AI_Output			(self, other, "DIA_Gestath_Drachen_09_02"); //Hmm... Oui. Pourquoi pas ?
		Gestath_DragonTrophy = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_TEACHHUNTING		(C_INFO)
{
	npc		     = 	VLK_4148_Gestath;
	nr           =  12;
	condition	 = 	DIA_Gestath_TEACHHUNTING_Condition;
	information	 = 	DIA_Gestath_TEACHHUNTING_Info;
	permanent	 =  TRUE;
	description	 = 	"Apprenez-moi à dépecer les animaux.";
};

func int DIA_Gestath_TEACHHUNTING_Condition ()
{
	if (Gestath_TeachAnimalTrophy == TRUE)
		{
				return TRUE;
		};
};

var int DIA_Gestath_TEACHHUNTING_OneTime;
func void DIA_Gestath_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Gestath_TEACHHUNTING_15_00"); //Apprenez-moi à vider les animaux.
	if 	(
			(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
			||	(
				(Gestath_DragonTrophy == TRUE)
				&&	(
					(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
					||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
					)
				)
		)
			{
				if (DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
					{
						AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_01"); //Pourquoi pas ? J'en ai suffisamment en ce moment.
						DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
					}
				else
					{
						AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_02"); //Qu'est-ce que vous voulez savoir ?
					};
	
				Info_AddChoice		(DIA_Gestath_TEACHHUNTING, DIALOG_BACK, DIA_Gestath_TEACHHUNTING_BACK);
			
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Langue de feu",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)),  DIA_Gestath_TEACHHUNTING_FireTongue);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Retirer les plaques de foreur",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  DIA_Gestath_TEACHHUNTING_CrawlerPlate	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Retirer les mandibules",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Gestath_TEACHHUNTING_Mandibles	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Corne de draco-saurinide",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
				};
				
				if (Gestath_DragonTrophy == TRUE)
				{	
					if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
					{ 
						Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Retirer écailles de dragon",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  DIA_Gestath_TEACHHUNTING_DragonScale);
					};
					if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
					{ 
						Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Extraire sang de dragon",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)),  DIA_Gestath_TEACHHUNTING_DragonBlood);
					};
				};			
			}
			else
			{
				AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_03"); //En ce moment, je ne vois pas ce que je pourrais vous apprendre.
			};
};

func void DIA_Gestath_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_FireTongue))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_FireTongue_09_00"); //Tenez la langue d'un lézard de feu dans une main en la tirant autant que faire se peut et maniez le couteau de l'autre pour la trancher d'un coup sec.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00"); //Il faut un couteau solide pour faire sauter les plaques de foreur des mines.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_Mandibles_09_00"); //Les mandibules des foreurs des mines et des fléaux des champs sont profondément enfoncées dans leur crâne et il n'est pas aisé de les en extraire.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00"); //Il vaut mieux couper au niveau de la partie haute du front pour détacher la corne d'un draco-saurinide, mais attention à ce que votre couteau soit bien résistant.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DragonScale_09_00"); //Les écailles de dragon sont particulièrement récalcitrantes. En règle générale, elles finissent par céder au moment où on commence à être persuadé qu'on ne les aura jamais.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DragonBlood_09_00"); //Le ventre est le meilleur endroit où prélever le sang. Plantez votre couteau d'un coup après avoir choisi un endroit où la peau n'est pas trop épaisse.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gestath_PICKPOCKET (C_INFO)
{
	npc			= VLK_4148_Gestath;
	nr			= 900;
	condition	= DIA_Gestath_PICKPOCKET_Condition;
	information	= DIA_Gestath_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Gestath_PICKPOCKET_Condition()
{
	C_Beklauen (81, 350);
};
 
FUNC VOID DIA_Gestath_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gestath_PICKPOCKET);
	Info_AddChoice		(DIA_Gestath_PICKPOCKET, DIALOG_BACK 		,DIA_Gestath_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gestath_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gestath_PICKPOCKET_DoIt);
};

func void DIA_Gestath_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gestath_PICKPOCKET);
};
	
func void DIA_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gestath_PICKPOCKET);
};








 








