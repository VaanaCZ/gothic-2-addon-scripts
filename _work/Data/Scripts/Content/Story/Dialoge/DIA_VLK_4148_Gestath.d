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
		AI_Output			(self, other, "DIA_Gestath_EXIT_09_00"); //Niez³a zbroja!
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

	description	 = 	"Co s³ychaæ?";
};

func int DIA_Gestath_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_15_00"); //Jak leci?
	AI_Output			(self, other, "DIA_Gestath_HALLO_09_01"); //Przyjœcie tutaj jest prawdziwym aktem odwagi. Pewnie siê zgubi³eœ, co?
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices	(DIA_Gestath_HALLO);
	Info_AddChoice	(DIA_Gestath_HALLO, "Jest tu coœ wartego zobaczenia?", DIA_Gestath_HALLO_waszusehen );
	Info_AddChoice	(DIA_Gestath_HALLO, "Co tutaj robisz?", DIA_Gestath_HALLO_was );
};
func void DIA_Gestath_HALLO_plate ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_plate_15_00"); //Niez³a zbroja.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_09_01"); //Taak. Ciê¿ko coœ takiego dostaæ. Jest zrobiona z pancerza pe³zacza. Zrobi³ j¹ dla mnie pewien cz³owiek imieniem Wilk.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_09_02"); //Wtedy by³em wiêŸniem w Kolonii. Da³em mu kilka ³usek pe³zacza, a parê dni póŸniej zbroja by³a ju¿ gotowa. Facet jest w porz¹dku.

	Wolf_ProduceCrawlerArmor = TRUE;
	
	Info_AddChoice	(DIA_Gestath_HALLO, DIALOG_BACK, DIA_Gestath_HALLO_Back );
	Info_AddChoice	(DIA_Gestath_HALLO, "Gdzie teraz przebywa Wilk?", DIA_Gestath_HALLO_plate_woWolf );
};
func void DIA_Gestath_HALLO_plate_woWolf ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_plate_woWolf_15_00"); //Gdzie teraz przebywa Wilk?
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_01"); //Nie widzia³em go od czasu, kiedy by³ najemnikiem w Kolonii.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_02"); //Przypuszczam, ¿e wci¹¿ obraca siê w tym samym towarzystwie.
};

func void DIA_Gestath_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_was_15_00"); //Co tutaj robisz?
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_01"); //Zarabiam.
	AI_Output			(other, self, "DIA_Gestath_HALLO_was_15_02"); //W takim miejscu?
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_03"); //Jestem myœliwym. Specjalizujê siê w trudnych zadaniach.
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_04"); //Ogniste jaszczury, pe³zacze, zêbacze... Jednym s³owem - wszystko, na co nikt inny nie zechcia³by zapolowaæ.
	
	Info_AddChoice	(DIA_Gestath_HALLO, "Niez³a zbroja.", DIA_Gestath_HALLO_plate );
};

func void DIA_Gestath_HALLO_waszusehen ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_waszusehen_15_00"); //Jest tu coœ wartego zobaczenia?
	AI_Output			(self, other, "DIA_Gestath_HALLO_waszusehen_09_01"); //Trochê ognistych jaszczurów, orków i cholera wie, czego jeszcze. Nie by³em jeszcze na wy¿ynach.
	AI_Output			(self, other, "DIA_Gestath_HALLO_waszusehen_09_02"); //Nie radzê jednak próbowaæ. Stworzenia, które ¿yj¹ tam na górze, nie wygl¹daj¹ zbyt przyjaŸnie.
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

	description	 = 	"Potrafisz oprawiaæ smoki?";
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
	AI_Output			(other, self, "DIA_Gestath_Drachen_15_00"); //Potrafisz oprawiaæ smoki?
	if (Kapitel < 4)
	{
		AI_Output			(self, other, "DIA_Gestath_Drachen_09_01"); //Kiedyœ, kiedy nabierzesz doœwiadczenia, mo¿e nawet nauczê ciê tej sztuki!
	}
	else
	{	
		AI_Output			(self, other, "DIA_Gestath_Drachen_09_02"); //Jasne.
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
	description	 = 	"Naucz mnie sprawiaæ zwierzêta.";
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
	AI_Output			(other, self, "DIA_Gestath_TEACHHUNTING_15_00"); //Naucz mnie sprawiaæ zwierzêta.
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
						AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_01"); //Czemu nie? I tak mam chwilowo dosyæ wra¿eñ.
						DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
					}
				else
					{
						AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_02"); //Co chcesz wiedzieæ?
					};
	
				Info_AddChoice		(DIA_Gestath_TEACHHUNTING, DIALOG_BACK, DIA_Gestath_TEACHHUNTING_BACK);
			
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Jêzyk ognistego jaszczura",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)),  DIA_Gestath_TEACHHUNTING_FireTongue);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Usuñ p³yty pancerza pe³zacza",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  DIA_Gestath_TEACHHUNTING_CrawlerPlate	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Usuñ ¿uwaczkê",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Gestath_TEACHHUNTING_Mandibles	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Róg smoczego zêbacza",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
				};
				
				if (Gestath_DragonTrophy == TRUE)
				{	
					if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
					{ 
						Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Usuñ smocze ³uski",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  DIA_Gestath_TEACHHUNTING_DragonScale);
					};
					if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
					{ 
						Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Zbieraj smocz¹ krew",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)),  DIA_Gestath_TEACHHUNTING_DragonBlood);
					};
				};			
			}
			else
			{
				AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_03"); //Nie wiem, czego jeszcze móg³bym ciê nauczyæ.
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
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_FireTongue_09_00"); //Musisz przytrzymaæ jêzyk ognistego jaszczura rêk¹. Teraz odcinasz go jednym sprawnym ruchem.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00"); //¯eby zerwaæ pancerze pe³zaczy, potrzebujesz naprawdê ostrego no¿a.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_Mandibles_09_00"); //¯uwaczki przytwierdzone s¹ doœæ mocno do czaszki polnej bestii lub pe³zacza. Usuniêcie ich wymaga trochê wysi³ku.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00"); //Aby odci¹æ zêbaczowi jego róg, potrzebujesz naprawdê mocnego no¿a. Wbij go w sam czubek g³owy.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DragonScale_09_00"); //Smocze ³uski s¹ naprawdê trudne do wyrwania, ale te na plecach s¹ stosunkowo p³ytko osadzone.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DragonBlood_09_00"); //Krew naj³atwiej spuœcisz, przecinaj¹c brzuch lub gard³o zwierzêcia ostrym no¿em.
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








 








