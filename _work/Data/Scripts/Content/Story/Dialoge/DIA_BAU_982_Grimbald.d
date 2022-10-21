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

	description	 = 	"¿Esperas a alguien?";
};

func int DIA_Grimbald_HALLO_Condition ()
{
	return TRUE;
};
var int Grimbald_PissOff;

func void DIA_Grimbald_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_15_00"); //¿Esperas a alguien?
	
	if 	(
		(Npc_IsDead(Grimbald_Snapper1))
		&& (Npc_IsDead(Grimbald_Snapper2))
		&& (Npc_IsDead(Grimbald_Snapper3)))
			{
				AI_Output			(self, other, "DIA_Grimbald_HALLO_07_01"); //Estoy cazando. Debería resultar evidente.
				Grimbald_PissOff = TRUE;
			}
			else
			{
				AI_Output			(self, other, "DIA_Grimbald_HALLO_07_02"); //Ya no. Ya has llegado, ¿no?
				
				Info_ClearChoices	(DIA_Grimbald_HALLO);
				Info_AddChoice	(DIA_Grimbald_HALLO, "Tengo cosas que hacer.", DIA_Grimbald_HALLO_nein );
				Info_AddChoice	(DIA_Grimbald_HALLO, "¿Qué tramas?", DIA_Grimbald_HALLO_Was );
				Info_AddChoice	(DIA_Grimbald_HALLO, "¿Por qué yo?", DIA_Grimbald_HALLO_ich );
			};
};

func void DIA_Grimbald_HALLO_ich ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_ich_15_00"); //¿Por qué yo?
	AI_Output			(self, other, "DIA_Grimbald_HALLO_ich_07_01"); //Pareces fuerte. Me vendría bien un tipo como tú.
};

func void DIA_Grimbald_HALLO_Was ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_Was_15_00"); //¿Qué tramas?
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_07_01"); //Quiero cazar a los chasqueadores ahí arriba, pero es posible que haya demasiados para que lo haga solo.

	Info_AddChoice	(DIA_Grimbald_HALLO, "No cuentes conmigo.", DIA_Grimbald_HALLO_Was_neinnein );
	Info_AddChoice	(DIA_Grimbald_HALLO, "De acuerdo, te ayudaré. Tú primero.", DIA_Grimbald_HALLO_Was_ja );
};
func void DIA_Grimbald_HALLO_Was_neinnein ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_Was_neinnein_15_00"); //No cuentes conmigo.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_neinnein_07_01"); //Entonces lárgate, cobarde.
	Grimbald_PissOff = TRUE;
	Info_ClearChoices	(DIA_Grimbald_HALLO);
};

func void DIA_Grimbald_HALLO_Was_ja ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_Was_ja_15_00"); //De acuerdo, te ayudaré. Tú primero.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_ja_07_01"); //Desde luego. Pero no te acerques demasiado al troll negro. Te haría pedazos.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_ja_07_02"); //Y pobre de ti si te amilanas.
	B_StartOtherRoutine	(self,"Jagd");
	AI_StopProcessInfos (self);
};

func void DIA_Grimbald_HALLO_nein ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_nein_15_00"); //Tengo cosas que hacer.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_nein_07_01"); //No digas tonterías. ¿Qué puedes tener que hacer por aquí que sea tan importante?
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

	description	 = 	"¿Me enseñas a cazar?";
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
	AI_Output			(other, self, "DIA_Grimbald_Jagd_15_00"); //¿Me enseñas a cazar?
	if 	((Npc_IsDead(Grimbald_Snapper1))
		&& (Npc_IsDead(Grimbald_Snapper2))
		&& (Npc_IsDead(Grimbald_Snapper3)))
		|| (Grimbald_PissOff == FALSE)
	{
		AI_Output			(self, other, "DIA_Grimbald_Jagd_07_01"); //Um. Muy bien. Por ahora no me has sido muy útil, pero no quiero ser duro.
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Grimbald_Jagd_07_02"); //Por supuesto, pero va a salirte caro.
		B_Say_Gold (self, other, 200);
	
		Info_ClearChoices	(DIA_Grimbald_Jagd);
		Info_AddChoice	(DIA_Grimbald_Jagd, "Me lo pensaré.", DIA_Grimbald_Jagd_zuviel );
		Info_AddChoice	(DIA_Grimbald_Jagd, "De acuerdo.", DIA_Grimbald_Jagd_ja );
	};
};

func void DIA_Grimbald_Jagd_ja ()
{
	AI_Output			(other, self, "DIA_Grimbald_Jagd_ja_15_00"); //De acuerdo. Ten el dinero.

		if (B_GiveInvItems (other, self, ItMi_Gold,200))
		{
			AI_Output			(self, other, "DIA_Grimbald_Jagd_ja_07_01"); //Bien. Cuando quieras aprender algo, dímelo.
			Grimbald_TeachAnimalTrophy = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Grimbald_Jagd_ja_07_02"); //Si me traes el dinero, te enseñaré algo.
		};
	Info_ClearChoices	(DIA_Grimbald_Jagd);
};  

func void DIA_Grimbald_Jagd_zuviel ()
{
	AI_Output			(other, self, "DIA_Grimbald_Jagd_zuviel_15_00"); //Me lo pensaré.
	AI_Output			(self, other, "DIA_Grimbald_Jagd_zuviel_07_01"); //Si tú lo dices.
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
	description	 = 	"Enséñame a cazar.";
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
	AI_Output			(other, self, "DIA_Grimbald_TEACHHUNTING_15_00"); //Enséñame a cazar.
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
				AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_07_01"); //¿Qué es lo que quieres saber?
	
				Info_AddChoice		(DIA_Grimbald_TEACHHUNTING, DIALOG_BACK, DIA_Grimbald_TEACHHUNTING_BACK);
			
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Aguijón de mosca de sangre",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Grimbald_TEACHHUNTING_BFSting);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Alas de mosca de sangre",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Grimbald_TEACHHUNTING_BFWing	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Arrancar garras",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Grimbald_TEACHHUNTING_Claws	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Quitar mandíbulas",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Grimbald_TEACHHUNTING_Mandibles);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Quitar placas de reptador",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
				};
			}
			else
			{
				AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_07_02"); //Ya sabes todo lo que podía enseñarte.
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
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_BFSting_07_00"); //Arrancar el aguijón de una mosca de sangre no tiene nada de particular. Solo hay que encontrar la base y dar un tajo firme con el cuchillo.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_BFWing_07_00"); //Las alas de la mosca de sangre puedes arrancarlas o cortarlas con un cuchillo afilado.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_Claws_07_00"); //Hay varios métodos para extraer las garras. En el caso de algunos animales, hace falta dar un fuerte golpe, y en otros, basta con cortarlas con un cuchillo.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_Mandibles_07_00"); //Los reptadores de la mina y los incursores de campo tienen fuertes mandíbulas se pueden arrancar de la cabeza de un tirón enérgico.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00"); //Las placas de los reptadores de la mina están bien fijas a los cuerpos de las bestias, pero se pueden desprender con un objeto afilado y contundente.
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

	description	 = 	"¿Has visto pasar por aquí a un novicio?";

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
	AI_Output			(other, self, "DIA_Grimbald_NovChase_15_00"); //¿Has visto pasar por aquí a un novicio?
	AI_Output			(self, other, "DIA_Grimbald_NovChase_07_01"); //Por aquí pasa mucha gente peculiar, como esos dos payasos que están en el arco de piedra.
	AI_Output			(self, other, "DIA_Grimbald_NovChase_07_02"); //Hace un tiempo les acompañaba un novicio de los Magos del Fuego.
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
	AI_Output			(self, other, "DIA_Grimbald_Trolltot_07_00"); //El troll negro ha muerto. Muy bien. Pensaba que era imposible matarlos. No se me olvidará.
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


