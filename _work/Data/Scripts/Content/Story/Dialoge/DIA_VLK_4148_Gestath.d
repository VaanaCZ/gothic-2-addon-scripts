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
		AI_Output			(self, other, "DIA_Gestath_EXIT_09_00"); //(sarcasticamente) Bella armatura!
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

	description	 = 	"Cosa succede?";
};

func int DIA_Gestath_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_15_00"); //Come va?
	AI_Output			(self, other, "DIA_Gestath_HALLO_09_01"); //(seccamente) Coraggioso a venire fin qui. Ti sei perso, eh?
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices	(DIA_Gestath_HALLO);
	Info_AddChoice	(DIA_Gestath_HALLO, "Cosa c’è da vedere, qui?", DIA_Gestath_HALLO_waszusehen );
	Info_AddChoice	(DIA_Gestath_HALLO, "Cosa stai facendo, quassù?", DIA_Gestath_HALLO_was );
};
func void DIA_Gestath_HALLO_plate ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_plate_15_00"); //Che bella armatura che indossi.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_09_01"); //Certo. Difficile da trovare. È fatta di scaglie di scavaragno. Me l'ha costruita un tipo di nome Wolf.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_09_02"); //Ero detenuto qui nella colonia, gli ho dato un paio di scaglie di scavaragno e pochi giorni dopo era terminata. Il tipo è in gamba.

	Wolf_ProduceCrawlerArmor = TRUE;
	
	Info_AddChoice	(DIA_Gestath_HALLO, DIALOG_BACK, DIA_Gestath_HALLO_Back );
	Info_AddChoice	(DIA_Gestath_HALLO, "Dov’è questo lupo, adesso?", DIA_Gestath_HALLO_plate_woWolf );
};
func void DIA_Gestath_HALLO_plate_woWolf ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_plate_woWolf_15_00"); //Dov’è questo lupo, adesso?
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_01"); //È da un po' che non lo vedo. In passato ha fatto il mercenario per la colonia.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_02"); //Suppongo che sia ancora in giro con i ragazzi.
};

func void DIA_Gestath_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_was_15_00"); //Cosa stai facendo, quassù?
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_01"); //Sono qui per far soldi.
	AI_Output			(other, self, "DIA_Gestath_HALLO_was_15_02"); //Qui, nel bel mezzo del nulla?
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_03"); //Sono un cacciatore, specializzato in casi difficili.
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_04"); //Lucertole di fuoco, scavaragni, draghi squartatori... Qualsiasi cosa cui nessuno darebbe la caccia. È così che faccio soldi.
	
	Info_AddChoice	(DIA_Gestath_HALLO, "Che bella armatura che indossi.", DIA_Gestath_HALLO_plate );
};

func void DIA_Gestath_HALLO_waszusehen ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_waszusehen_15_00"); //Cosa c’è da vedere, qui?
	AI_Output			(self, other, "DIA_Gestath_HALLO_waszusehen_09_01"); //Un po' di lucertole di fuoco, orchi e non so cos'altro. Non mi sono avventurato troppo in là.
	AI_Output			(self, other, "DIA_Gestath_HALLO_waszusehen_09_02"); //E ti consiglio di fare altrettanto: le cose che vivono lassù non sembrano per niente amichevoli.
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

	description	 = 	"Sai anche sgozzare i draghi?";
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
	AI_Output			(other, self, "DIA_Gestath_Drachen_15_00"); //Sai anche sgozzare i draghi?
	if (Kapitel < 4)
	{
		AI_Output			(self, other, "DIA_Gestath_Drachen_09_01"); //(ride) Richiedimelo più avanti, quando sarai pronto per qualcosa del genere, va bene?
	}
	else
	{	
		AI_Output			(self, other, "DIA_Gestath_Drachen_09_02"); //Certo, perché no?
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
	description	 = 	"Insegnami a sgozzare gli animali.";
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
	AI_Output			(other, self, "DIA_Gestath_TEACHHUNTING_15_00"); //Insegnami a sgozzare gli animali.
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
						AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_01"); //Perché no? Perché non ne ho voglia in questo momento.
						DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
					}
				else
					{
						AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_02"); //Che cosa vuoi sapere?
					};
	
				Info_AddChoice		(DIA_Gestath_TEACHHUNTING, DIALOG_BACK, DIA_Gestath_TEACHHUNTING_BACK);
			
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Lingua di fuoco",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)),  DIA_Gestath_TEACHHUNTING_FireTongue);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Rimuovi le scaglie di scavaragno",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  DIA_Gestath_TEACHHUNTING_CrawlerPlate	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Rimuovi la mandibola",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Gestath_TEACHHUNTING_Mandibles	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Corno del drago squartatore",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
				};
				
				if (Gestath_DragonTrophy == TRUE)
				{	
					if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
					{ 
						Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Rimuovi le scaglie di drago.",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  DIA_Gestath_TEACHHUNTING_DragonScale);
					};
					if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
					{ 
						Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Raccogli il sangue di drago.",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)),  DIA_Gestath_TEACHHUNTING_DragonBlood);
					};
				};			
			}
			else
			{
				AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_03"); //Al momento non so cos'altro insegnarti.
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
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_FireTongue_09_00"); //La lingua di una lucertola di fuoco si taglia con un colpo netto di coltello, mentre la tieni ferma con l'altra mano.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00"); //Per recuperare le scaglie di scavaragni dal dorso delle creature, serve un coltello robusto.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_Mandibles_09_00"); //Le mandibole di un razziatore dei campi e di uno scavaragno sono alloggiate in fondo alla scatola cranica. Ci vuole un po' per estrarle.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00"); //Il posto migliore per segare il corno di un drago squartatore dal cranio è in mezzo alla fronte. Usa un coltello robusto.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DragonScale_09_00"); //Le scaglie di drago sono molto robuste, ma proprio quando credi di non farcela, si staccano dal dorso della creatura.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DragonBlood_09_00"); //Il posto migliore da cui prendere il sangue è la parte sottostante. Cerca un punto morbido e bucalo con un coltello molto affilato.
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








 








