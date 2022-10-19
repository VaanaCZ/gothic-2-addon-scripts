///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gaan_EXIT   (C_INFO)
{
	npc         = BAU_961_Gaan;
	nr          = 999;
	condition   = DIA_Gaan_EXIT_Condition;
	information = DIA_Gaan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
var int DIA_Gaan_EXIT_oneTime;
FUNC INT DIA_Gaan_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_Gaan_EXIT_Info()
{
	AI_StopProcessInfos (self);
	if (DIA_Gaan_EXIT_oneTime == FALSE)
	{
	Npc_ExchangeRoutine	(self,"Start");
	DIA_Gaan_EXIT_oneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_MeetingIsRunning		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Gaan_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Gaan_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Gaan_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Gaan_MeetingIsRunning_One_time;
func void DIA_Addon_Gaan_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Gaan_MeetingIsRunning_One_time == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Gaan_MeetingIsRunning_03_00"); //Una cara nueva entre nosotros. Bienvenido al 'Anillo de Agua'.
		DIA_Addon_Gaan_MeetingIsRunning_One_time = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Gaan_MeetingIsRunning_03_01"); //Vatras quiere verte. Será mejor  que vayas a visitarlo ya.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_HALLO		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	3;
	condition	 = 	DIA_Gaan_HALLO_Condition;
	information	 = 	DIA_Gaan_HALLO_Info;

	description	 = 	"Aquí arriba tienes mucho espacio.";
};

func int DIA_Gaan_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Gaan_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_HALLO_15_00"); //Aquí arriba tienes mucho espacio.
	AI_Output			(self, other, "DIA_Gaan_HALLO_03_01"); //Está bastante bien. Pero si cruzas el desfiladero, no tardarás en cambiar de opinión.
	AI_Output			(self, other, "DIA_Gaan_HALLO_03_02"); //Si esta pequeña parcela te ha impresionado, ya verás cuando veas el Valle de las Minas.

};



///////////////////////////////////////////////////////////////////////
//	Info Wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	4;
	condition	 = 	DIA_Gaan_WASMACHSTDU_Condition;
	information	 = 	DIA_Gaan_WASMACHSTDU_Info;

	description	 = 	"¿Quién eres tú?";
};

func int DIA_Gaan_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Gaan_HALLO))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Gaan_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_WASMACHSTDU_15_00"); //¿Quién eres tú?
	AI_Output			(self, other, "DIA_Gaan_WASMACHSTDU_03_01"); //Me llamo Gaan. Soy cazador y trabajo para Bengar, el granjero de la pradera alta.
	AI_Output			(self, other, "DIA_Gaan_WASMACHSTDU_03_02"); //Me paso casi todo el día al aire libre, disfrutando al sol.
};

///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_Ranger		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Gaan_Ranger_Condition;
	information	 = 	DIA_Addon_Gaan_Ranger_Info;

	description	 = 	"¿Por qué estás tan serio?";
};

func int DIA_Addon_Gaan_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Gaan_HALLO))
	&& (SCIsWearingRangerRing == TRUE)
	&& (RangerMeetingRunning == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Gaan_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Gaan_Ranger_15_00"); //¿Por qué estás tan serio?
	AI_Output	(self, other, "DIA_Addon_Gaan_Ranger_03_01"); //Llevas nuestro anillo de aguamarina.
	AI_Output	(other, self, "DIA_Addon_Gaan_Ranger_15_02"); //¿Perteneces al 'Anillo de Agua'?
	AI_Output	(self, other, "DIA_Addon_Gaan_Ranger_03_03"); //En efecto. Me alegra ver caras nuevas entre los nuestros.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AufgabeBeimRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_AufgabeBeimRing		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Gaan_AufgabeBeimRing_Condition;
	information	 = 	DIA_Addon_Gaan_AufgabeBeimRing_Info;

	description	 = 	"¿Cuál es tu función dentro del 'Anillo de Agua'?";
};

func int DIA_Addon_Gaan_AufgabeBeimRing_Condition ()
{
	if ((Npc_KnowsInfo (other, DIA_Addon_Gaan_Ranger))
	|| (RangerMeetingRunning != 0))
	&& (Kapitel < 3)
		{
			return TRUE;
		};
};

func void DIA_Addon_Gaan_AufgabeBeimRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Gaan_AufgabeBeimRing_15_00"); //¿Cuál es tu función dentro del 'Anillo de Agua'?
	AI_Output	(self, other, "DIA_Addon_Gaan_AufgabeBeimRing_03_01"); //Mantengo vigilada la entrada al paso, para ver quién entra y sale.
	AI_Output	(self, other, "DIA_Addon_Gaan_AufgabeBeimRing_03_02"); //Pero como los paladines han cerrado la puerta al paso, no ha habido mucho trasiego de gente.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Gaan_MissingPeople_Condition;
	information	 = 	DIA_Addon_Gaan_MissingPeople_Info;

	description	 = 	"¿Has oído hablar de esa gente desaparecida?";
};

func int DIA_Addon_Gaan_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Gaan_AufgabeBeimRing))
	&& (SC_HearedAboutMissingPeople == TRUE)
			{
				return TRUE;
			};
};

func void DIA_Addon_Gaan_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Gaan_MissingPeople_15_00"); //¿Has oído hablar de esa gente desaparecida?
	AI_Output	(self, other, "DIA_Addon_Gaan_MissingPeople_03_01"); //Claro que sí. Por eso tenemos que mantenernos alerta.
	AI_Output	(self, other, "DIA_Addon_Gaan_MissingPeople_03_02"); //Pero no sé lo suficiente para informarte, si quieres que te diga la verdad.
};

///////////////////////////////////////////////////////////////////////
//	Info wald
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WALD		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	5;
	condition	 = 	DIA_Gaan_WALD_Condition;
	information	 = 	DIA_Gaan_WALD_Info;

	description	 = 	"¿Qué tengo que saber del Valle de las Minas?";
};

func int DIA_Gaan_WALD_Condition ()
{
	return TRUE;
};

func void DIA_Gaan_WALD_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_WALD_15_00"); //¿Qué tengo que saber del Valle de las Minas?
	AI_Output			(self, other, "DIA_Gaan_WALD_03_01"); //Ni idea. Solo he echado un vistazo fugaz al valle. Parece bastante peligroso.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_02"); //Si cruzas el desfiladero, lo mejor es que no te apartes del camino.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_03"); //Puedes ir a través del gran cañón o por el camino del puente de piedra. Ése es más corto y seguro.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_04"); //Ten cuidado, ya que los orcos están por todas partes.
	AI_Output			(self, other, "DIA_Gaan_WALD_03_05"); //No quiero tener que arrastrarte hasta la herbolaria.

};

///////////////////////////////////////////////////////////////////////
//	Info sagitta
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_SAGITTA		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	7;
	condition	 = 	DIA_Gaan_SAGITTA_Condition;
	information	 = 	DIA_Gaan_SAGITTA_Info;

	description	 = 	"¿Herbolaria?";
};

func int DIA_Gaan_SAGITTA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Gaan_WALD))
		{
				return TRUE;
		};
};

func void DIA_Gaan_SAGITTA_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_SAGITTA_15_00"); //¿Herbolaria?
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_01"); //Se llama Sagitta. Es la curandera de los granjeros y del resto de la gente que vive fuera de la ciudad portuaria.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_02"); //Una mujer bastante peculiar.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_03"); //A nadie le gusta visitarla y a todos les gusta chismorrear sobre ella.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_04"); //Pero si estás enfermo, no hay mejor alivio que Sagitta y su cocina llena de hierbas medicinales.
	AI_Output			(self, other, "DIA_Gaan_SAGITTA_03_05"); //La encontrarás en el bosquecillo que hay más allá de la granja de Sekob.

};

///////////////////////////////////////////////////////////////////////
//	Info monster
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_MONSTER		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	8;
	condition	 = 	DIA_Gaan_MONSTER_Condition;
	information	 = 	DIA_Gaan_MONSTER_Info;

	description	 = 	"¿Qué aspecto tiene esta bestia peligrosa?";
};

func int DIA_Gaan_MONSTER_Condition ()
{
	if 	(
		(MIS_Gaan_Snapper == LOG_RUNNING)	
		&&((Npc_IsDead(Gaans_Snapper))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Gaan_MONSTER_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_MONSTER_15_00"); //¿Qué aspecto tiene esta bestia peligrosa?
	AI_Output			(self, other, "DIA_Gaan_MONSTER_03_01"); //No lo sé con seguridad. Hasta ahora, solo la he oído gruñir y escarbar. Pero he visto lo que puede hacer.
	AI_Output			(self, other, "DIA_Gaan_MONSTER_03_02"); //Ni siquiera los lobos están a salvo. La bestia le arrancó la cabeza a uno.

};

///////////////////////////////////////////////////////////////////////
//	Info monster
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WASZAHLSTDU		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	9;
	condition	 = 	DIA_Gaan_WASZAHLSTDU_Condition;
	information	 = 	DIA_Gaan_WASZAHLSTDU_Info;

	description	 = 	"¿Cuánto me pagarías si matara a la bestia?";
};

func int DIA_Gaan_WASZAHLSTDU_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Gaan_MONSTER))
		&&((Npc_IsDead(Gaans_Snapper))== FALSE)
		)
			{
					return TRUE;
			};
}; 

func void DIA_Gaan_WASZAHLSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_WASZAHLSTDU_15_00"); //¿Cuánto me pagarías si matara a la bestia?
	AI_Output			(self, other, "DIA_Gaan_WASZAHLSTDU_03_01"); //A la persona que la matara le daría todo lo que pudiera permitirme.
	//AI_Output			(self, other, "DIA_Gaan_WASZAHLSTDU_03_02"); //30 Goldmünzen? 
	//Auskommentiert, weil "?" ist auch so gesprochen worden - kommt nicht gut
	B_Say_Gold   (self,other,30);
	MIS_Gaan_Deal = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info wohermonster
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WOHERMONSTER		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	10;
	condition	 = 	DIA_Gaan_WOHERMONSTER_Condition;
	information	 = 	DIA_Gaan_WOHERMONSTER_Info;

	description	 = 	"¿De dónde viene esa bestia repugnante?";
};

func int DIA_Gaan_WOHERMONSTER_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Gaan_MONSTER))
		&&((Npc_IsDead(Gaans_Snapper))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Gaan_WOHERMONSTER_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_WOHERMONSTER_15_00"); //¿De dónde viene esa bestia repugnante?
	AI_Output			(self, other, "DIA_Gaan_WOHERMONSTER_03_01"); //De fuera del bosque. Tal vez del Valle de las Minas, pero no lo sé a ciencia cierta.
	AI_Output			(self, other, "DIA_Gaan_WOHERMONSTER_03_02"); //Nunca he estado en el Valle de las Minas.
 
};


///////////////////////////////////////////////////////////////////////
//	Info MonsterTot
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_MONSTERTOT		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 11;
	condition	 = 	DIA_Gaan_MONSTERTOT_Condition;
	information	 = 	DIA_Gaan_MONSTERTOT_Info;
	important	 = 	TRUE;
};

func int DIA_Gaan_MONSTERTOT_Condition ()
{
	if 	((Npc_IsDead(Gaans_Snapper))== TRUE) 
	&& 	(RangerMeetingRunning != LOG_RUNNING)
			{
					return TRUE;
			};
};

func void DIA_Gaan_MONSTERTOT_Info ()
{
	AI_Output			(self, other, "DIA_Gaan_MONSTERTOT_03_00"); //Supongo que ese animal terrible ha muerto.
	AI_Output			(self, other, "DIA_Gaan_MONSTERTOT_03_01"); //Por fin puedo cazar tranquilo.
	

	if (MIS_Gaan_Deal == LOG_RUNNING)
		{
			AI_Output			(self, other, "DIA_Gaan_MONSTERTOT_03_02");	//Aquí tienes el dinero que te prometí.

			CreateInvItems (self, ItMi_Gold, 30);									
			B_GiveInvItems (self, other, ItMi_Gold, 30);					
		};
	
	MIS_Gaan_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_Gaan_WaldSnapper);
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  			  ASK TEACHER 
// ************************************************************

INSTANCE DIA_Gaan_AskTeacher (C_INFO)
{
	npc			= BAU_961_Gaan;
	nr          = 10;
	condition	= DIA_Gaan_AskTeacher_Condition;
	information	= DIA_Gaan_AskTeacher_Info;

	description = "¿Qué me puedes enseñar acerca de la caza?";
};                       

FUNC INT DIA_Gaan_AskTeacher_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gaan_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00"); //¿Qué me puedes enseñar acerca de la caza?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01"); //Claro. Por 100 monedas de oro puedo enseñarte a destripar los animales que caces.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02"); //Las pieles y los otros trofeos alcanzan buenos precios en el mercado.
		
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Gaan puede enseñarme a despellejar animales.");
};


// ************************************************************
// 			  			  PAY TEACHER 
// ************************************************************

INSTANCE DIA_Gaan_PayTeacher (C_INFO)
{
	npc			= BAU_961_Gaan;
	nr          = 11;
	condition	= DIA_Gaan_PayTeacher_Condition;
	information	= DIA_Gaan_PayTeacher_Info;
	permanent	= TRUE;
	description = "Ten. 100 monedas de oro a cambio de que me enseñes a destripar animales.";
};                       

var int DIA_Gaan_PayTeacher_noPerm;

FUNC INT DIA_Gaan_PayTeacher_Condition()
{
	if 	(Npc_KnowsInfo (other, DIA_Gaan_AskTeacher))
		&& (DIA_Gaan_PayTeacher_noPerm == FALSE)
			{
				return TRUE;
			};
};

FUNC VOID DIA_Gaan_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00"); //Ten. 100 monedas de oro a cambio de que me enseñes a destripar animales.

	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01"); //Gracias. Así se habla.
		Gaan_TeachPlayer = TRUE;
		DIA_Gaan_PayTeacher_noPerm = TRUE;
	}
	else	
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02"); //Pídemelo luego, cuando tengas dinero.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_TEACHHUNTING		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr          = 12;
	condition	 = 	DIA_Gaan_TEACHHUNTING_Condition;
	information	 = 	DIA_Gaan_TEACHHUNTING_Info;
	permanent	= TRUE;
	description	 = 	"¿Qué puedes enseñarme?";
};

func int DIA_Gaan_TEACHHUNTING_Condition ()
{
	if (Gaan_TeachPlayer == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Gaan_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Gaan_TEACHHUNTING_15_00"); //¿Qué puedes enseñarme?
	if 	(
			(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			||((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE) && (MIS_Gaan_Snapper == LOG_SUCCESS))
		)
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_03_01"); //Depende de lo que quieras saber.

			Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Sacar dientes",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Gaan_TEACHHUNTING_Teeth);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Arrancar garras",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Gaan_TEACHHUNTING_Claws);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Despellejar",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Gaan_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Aguijón de mosca de sangre",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Gaan_TEACHHUNTING_BFSting);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Alas de mosca de sangre",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Gaan_TEACHHUNTING_BFWing);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
			&& (MIS_Gaan_Snapper == LOG_SUCCESS)
			{ 
				Info_AddChoice	(DIA_Gaan_TEACHHUNTING, B_BuildLearnString ("Cuerno de dragón chasqueador",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  DIA_Gaan_TEACHHUNTING_DrgSnapperHorn);
			};
		}
		else
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_03_02"); //Ahora mismo, no puedo enseñarte nada que no sepas. Lo siento.
		};
};

func void DIA_Gaan_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
};

// ------ Klauen hacken ------
func void DIA_Gaan_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_00"); //A los animales no les gusta entregar sus garras. El cuchillo hay que manejarlo con precisión.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_01"); //Cruza un poco las manos. Luego, separa la garra de un fuerte tirón.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_02"); //Los mercaderes siempre aceptan los pagos en garras.
		
		};

		Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
		Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
		
};

// ------ Fell abziehen ------
func void DIA_Gaan_TEACHHUNTING_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Teeth_03_00"); //Lo más fácil es arrancar los dientes. Primero, pasa el cuchillo alrededor de los dientes.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Teeth_03_01"); //Luego, da un hábil tirón para separarlos del cráneo.
	
			
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Fell abziehen ------
func void DIA_Gaan_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Fur_03_00"); //La mejor manera de arrancar el pellejo es hacer un corte profundo a lo largo de los cuartos traseros.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_Fur_03_01"); //Después, está chupado tirar de la piel de atrás adelante.
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Blutfliegenstachel ------
func void DIA_Gaan_TEACHHUNTING_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFSting_03_00"); //Estas moscas tienen un punto blando en el dorso.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFSting_03_01"); //Si lo aprietas, el aguijón sobresaldrá y podrás desprenderlo con el cuchillo.
			
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};
// ------ Blutfliegenflügel ------
func void DIA_Gaan_TEACHHUNTING_BFWing ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFWing_03_00"); //La mejor manera de arrancar las alas a una mosca de sangre es dando un tajo con un cuchillo afilado, cerca del cuerpo.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_BFWing_03_01"); //Procura no dañar el tejido delicado de las alas. Si no lo haces con cuidado, perderán su valor.

		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};
// ------ DrgSnapperHorn ------
func void DIA_Gaan_TEACHHUNTING_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn))
		{
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00"); //Ahora que este chasqueador crecidito está muerto, puedo enseñarte a arrancarle el cuerno.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01"); //Hunde el cuchillo en la frente del animal y haz palanca hacia arriba con cuidado.
			AI_Output			(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02"); //Si no se suelta del cráneo, clava un segundo cuchillo desde el otro lado.
	
			
			CreateInvItems (Gaans_Snapper, ItAt_DrgSnapperHorn, 1); //falls der Snapper ihm gerade vor den Füssen liegt!!
		};

	Info_ClearChoices	(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice		(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};


///////////////////////////////////////////////////////////////////////
//	Info jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_JAGD		(C_INFO)
{
	npc		 = 	BAU_961_Gaan;
	nr		 = 	80;
	condition	 = 	DIA_Gaan_JAGD_Condition;
	information	 = 	DIA_Gaan_JAGD_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Qué tal va la caza?";
};

func int DIA_Gaan_JAGD_Condition ()
{
	return TRUE;
};

func void B_WasMachtJagd ()
{
	AI_Output			(other, self, "DIA_Gaan_JAGD_15_00"); //¿Qué tal va la caza?
};

func void DIA_Gaan_JAGD_Info ()
{
	B_WasMachtJagd ();

	if ((Npc_IsDead(Gaans_Snapper))== FALSE)
		{
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_01"); //El último animal que cacé fue una rata gorda. No es muy prometedor, y tampoco beneficia al negocio.
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_02"); //Hay una bestia bufadora que lleva varios días rondando por la zona.
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_03"); //No solo mata todo lo que se mueve, sino que también afecta a mi trabajo.
			Log_CreateTopic (TOPIC_GaanSchnaubi, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GaanSchnaubi, LOG_RUNNING);
			B_LogEntry (TOPIC_GaanSchnaubi,"Esa ruidosa criatura está causándole problemas a Gaan, el cazador. A menos que derrote a la bestia, no irá a cazar más."); 
			MIS_Gaan_Snapper = LOG_RUNNING;
		}
	else if (Kapitel >= 3)
		{
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_04"); //Esto es una locura. Mientras tanto, decenas de estos animales bufadores han llegado por el desfiladero.
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_05"); //Dadas las circunstancias, cada vez es más difícil cazar aquí arriba.
		}
	else
		{
			AI_Output			(self, other, "DIA_Gaan_JAGD_03_06"); //No me quejo.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gaan_PICKPOCKET (C_INFO)
{
	npc			= BAU_961_Gaan;
	nr			= 900;
	condition	= DIA_Gaan_PICKPOCKET_Condition;
	information	= DIA_Gaan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Gaan_PICKPOCKET_Condition()
{
	C_Beklauen (23, 35);
};
 
FUNC VOID DIA_Gaan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gaan_PICKPOCKET);
	Info_AddChoice		(DIA_Gaan_PICKPOCKET, DIALOG_BACK 		,DIA_Gaan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gaan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gaan_PICKPOCKET_DoIt);
};

func void DIA_Gaan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gaan_PICKPOCKET);
};
	
func void DIA_Gaan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gaan_PICKPOCKET);
};































