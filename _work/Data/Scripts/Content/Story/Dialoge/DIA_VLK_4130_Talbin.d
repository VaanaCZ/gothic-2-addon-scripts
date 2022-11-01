///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talbin_EXIT   (C_INFO)
{
	npc         = VLK_4130_Talbin;
	nr          = 999;
	condition   = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talbin_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Talbin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
var int Talbin_Runs;
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_HALLO		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 5;
	condition	 = 	DIA_Talbin_HALLO_Condition;
	information	 = 	DIA_Talbin_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Talbin_HALLO_Condition ()
{
	if (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Talbin_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_00"); //¡Alto! ¡Detente donde estás!
	AI_Output			(other, self, "DIA_Talbin_HALLO_15_01"); //¡De acuerdo, no hay problema!
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_02"); //¡Vaya! Otro corderito perdido, ¿eh? Al principio te confundí con uno de esos malditos bastardos que vagan por la zona.
	AI_Output			(self, other, "DIA_Talbin_HALLO_07_03"); //Puedo ver que, probablemente, no eres uno de ellos. ¡Pareces bastante inofensivo!
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachtIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASMACHTIHR		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 6;
	condition	 = 	DIA_Talbin_WASMACHTIHR_Condition;
	information	 = 	DIA_Talbin_WASMACHTIHR_Info;

	description	 = 	"Pareces un cazador que no sabe lo que hacer con su tiempo.";
};

func int DIA_Talbin_WASMACHTIHR_Condition ()
{
	if (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WASMACHTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_15_00"); //Pareces un cazador que no sabe lo que hacer con su tiempo.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_01"); //¡Ja, ja! Sí, tienes razón en eso. Pero, ¿qué voy a hacer? ¡No puedo volver por el paso!
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_02"); //Así que me tengo que quedar aquí, haciendo lo que mejor sé.

	if ((Npc_IsDead(Engrom)) == FALSE)
	{
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_03"); //Aunque lo siento por mi colega Engrom.
	};

	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_07_04"); //Acércate a mi fuego y caliéntate.
	
	Info_ClearChoices	(DIA_Talbin_WASMACHTIHR);
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, DIALOG_BACK, DIA_Talbin_WASMACHTIHR_back );
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, "Pero parece que te las arreglas muy bien.", DIA_Talbin_WASMACHTIHR_gut );
	Info_AddChoice	(DIA_Talbin_WASMACHTIHR, "¿Eres un antiguo prisionero de la Barrera?", DIA_Talbin_WASMACHTIHR_strf );

};
func void DIA_Talbin_WASMACHTIHR_back ()
{
	Info_ClearChoices	(DIA_Talbin_WASMACHTIHR);
};

func void DIA_Talbin_WASMACHTIHR_strf ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_00"); //¿Eres un antiguo prisionero de la barrera?
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_01"); //¡No, no! ¿Qué te crees? En realidad quería hacerme rico aquí fuera.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_02"); //Alguien de por aquí me dijo que estos son los mejores terrenos de caza que hay.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_03"); //Buenas cosechas, no sé si me entiendes.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_04"); //¡La única cosa que puedes pillar aquí desde que esos orcos aparecieron es un mamporro en las narices si te aventuras demasiado lejos!
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_05"); //Y yo he permitido a esos imbéciles que se rían de mí.
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_06"); //¡Conozco a esos bufones!
};

func void DIA_Talbin_WASMACHTIHR_gut ()
{
	AI_Output			(other, self, "DIA_Talbin_WASMACHTIHR_gut_15_00"); //Pero parece que te las arreglas muy bien.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_01"); //Ya, claro... supongo que no puedo quejarme. A pesar de esos malditos orcos, las zonas junto al río son las menos peligrosas.
	AI_Output			(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_02"); //Parece que no se atreven a acercarse al agua. Mmm. Quizá es solo una coincidencia.
};


///////////////////////////////////////////////////////////////////////
//	Info SorryForEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_SORRYFORENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 7;
	condition	 = 	DIA_Talbin_SORRYFORENGROM_Condition;
	information	 = 	DIA_Talbin_SORRYFORENGROM_Info;

	description	 = 	"¿Por qué sientes lo de Engrom?";
};

func int DIA_Talbin_SORRYFORENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& ((Npc_IsDead(Engrom)) == FALSE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Kapitel <= 3)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_SORRYFORENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_SORRYFORENGROM_15_00"); //¿Por qué sientes lo de Engrom?
	AI_Output			(self, other, "DIA_Talbin_SORRYFORENGROM_07_01"); //Porque simplemente me siguió sin preguntar nada.
	AI_Output			(self, other, "DIA_Talbin_SORRYFORENGROM_07_02"); //Y ahora nos hemos metido en este jaleo. La avaricia rompe el saco...
};


///////////////////////////////////////////////////////////////////////
//	Info WasJagdIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASJAGDIHR		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 8;
	condition	 = 	DIA_Talbin_WASJAGDIHR_Condition;
	information	 = 	DIA_Talbin_WASJAGDIHR_Info;

	description	 = 	"¿Qué estás cazando aquí junto al río?";
};

func int DIA_Talbin_WASJAGDIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WASJAGDIHR_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WASJAGDIHR_15_00"); //¿Qué estás cazando aquí junto al río?
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_01"); //¡Qué pregunta! Date un paseo por la orilla del río y ya verás lo que estoy cazando. ¡Merodeadores, por supuesto!
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_02"); //Esas cosas no son fáciles de pillar, pero luego saben mucho mejor.
	AI_Output			(self, other, "DIA_Talbin_WASJAGDIHR_07_03"); //De vez en cuando, también me encuentro con un carroñero. ¡Y tampoco le hago ascos!
};

///////////////////////////////////////////////////////////////////////
//	Info EngromAngry
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_ENGROMANGRY		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 9;
	condition	 = 	DIA_Talbin_ENGROMANGRY_Condition;
	information	 = 	DIA_Talbin_ENGROMANGRY_Info;

	description	 = 	"¡Creo que tu colega está un poco agobiado!";
};

func int DIA_Talbin_ENGROMANGRY_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
			&& (Npc_KnowsInfo(other, DIA_Talbin_SORRYFORENGROM))
			&& ((Npc_IsDead(Engrom)) == FALSE)
			&& (Talbin_FollowsThroughPass == 0)
			&& (Kapitel <= 3)
			&& (Talbin_Runs == FALSE)
		)
		{
				return TRUE;
		};
};

func void DIA_Talbin_ENGROMANGRY_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_ENGROMANGRY_15_00"); //¡Creo que tu colega está un poco agobiado!
	AI_Output			(self, other, "DIA_Talbin_ENGROMANGRY_07_01"); //Ya vale. No le provoques más, o me cortará el cuello. En este momento no hay nada que pueda hacer acerca de nuestra situación aquí.
	AI_Output			(self, other, "DIA_Talbin_ENGROMANGRY_07_02"); //¡Ya lo arreglaré algún día!
};


// ************************************************************
// 			  			  ASK TEACHER 
// ************************************************************

INSTANCE DIA_Talbin_AskTeacher (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr          = 10;
	condition	= DIA_Talbin_AskTeacher_Condition;
	information	= DIA_Talbin_AskTeacher_Info;

	description = "¿Qué me puedes enseñar acerca de la caza?";
};                       

FUNC INT DIA_Talbin_AskTeacher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASJAGDIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
	{
				return TRUE;
		};
};

FUNC VOID DIA_Talbin_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00"); //¿Puedes enseñarme algo del arte de cazar?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01"); //¡Ya veo! Así que ahora le has cogido el punto. ¡Pero te va a costar!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02"); //¿Qué quieres a cambio?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03"); //¿No tendrás algo para comer que no sea carne de merodeador? Quizá un buen trozo de queso. Sí, un buen trozo de queso. Moriría por un buen trozo...
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04"); //Veré lo que puedo hacer.
		
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Talbin puede enseñarme a destripar animales.");
};


// ************************************************************
// 			  			  PAY TEACHER 
// ************************************************************

INSTANCE DIA_Talbin_PayTeacher (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr          = 11;
	condition	= DIA_Talbin_PayTeacher_Condition;
	information	= DIA_Talbin_PayTeacher_Info;
	permanent	= TRUE;
	description = "Aquí tienes tu queso. ¿Me enseñarás ahora?";
};                       

var int DIA_Talbin_PayTeacher_noPerm;

FUNC INT DIA_Talbin_PayTeacher_Condition()
{
	if 	(
		(Npc_KnowsInfo (other, DIA_Talbin_AskTeacher))
		&& (DIA_Talbin_PayTeacher_noPerm == FALSE)
		&& (Talbin_FollowsThroughPass == 0)
		&& (Talbin_Runs == FALSE)
		)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Talbin_PayTeacher_Info()
{
	if (B_GiveInvItems (other, self, itfo_Cheese, 1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00"); //Aquí tienes tu queso. ¿Me enseñarás ahora?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01"); //¿De verdad tienes? Oh, tío, hace años que no comía algo así. Gracias. Esto, sobre... oh, claro. ¡Por supuesto!
		Talbin_TeachAnimalTrophy = TRUE;
		DIA_Talbin_PayTeacher_noPerm = TRUE;
	}
	else	//SC hat keinen Käse
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02"); //¡No tengo queso en este momento!
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03"); //Habría sido demasiado bueno para ser cierto. ¡Avísame cuando tengas un poco!
	};
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_TEACHHUNTING		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 12;
	condition	 = 	DIA_Talbin_TEACHHUNTING_Condition;
	information	 = 	DIA_Talbin_TEACHHUNTING_Info;
	permanent	= TRUE;
	description	 = 	"¿Qué puedes enseñarme?";
};

func int DIA_Talbin_TEACHHUNTING_Condition ()
{
	if (Talbin_TeachAnimalTrophy == TRUE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_TEACHHUNTING_15_00"); //¿Qué puedes enseñarme?
		if 	(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			)
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_07_01"); //¿Qué es lo que quieres saber?
		

			Info_AddChoice		(DIA_Talbin_TEACHHUNTING, DIALOG_BACK, DIA_Talbin_TEACHHUNTING_BACK);
		
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Arrancar garras",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Talbin_TEACHHUNTING_Claws);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Despellejar",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Talbin_TEACHHUNTING_Fur);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Cuerno de bestia de sombra",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Talbin_TEACHHUNTING_ShadowHorn);
			};
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
			{ 
				Info_AddChoice	(DIA_Talbin_TEACHHUNTING, B_BuildLearnString ("Extraer corazón",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)),  DIA_Talbin_TEACHHUNTING_Heart);
			};

		}
		else
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_07_02"); //Tendré que defraudarte. Ya sabes todo lo que podría enseñarte. Pero aún así, ¡gracias de nuevo por el queso!
		};
};

func void DIA_Talbin_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

// ------ Klauen hacken ------
func void DIA_Talbin_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_00"); //Arrancar garras es muy sencillo. Sujeta la garra directamente por la articulación y apriétala contra el suelo.
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_01"); //Luego coge tu navaja y corta cuidadosamente la garra.
		};

		Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Talbin_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_00"); //La forma más rápida de despellejar a un merodeador es hacer un corte a lo largo de su vientre...
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_01"); //… y luego estirar de sus patas traseras, arrancando la piel de una pieza, desde atrás hacia delante.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Shadowhorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00"); //Los cuernos de bestia de sombra son muy duros y pueden usarse para crear estatuas o herramientas.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};
func void DIA_Talbin_TEACHHUNTING_Heart ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Heart))
		{
			AI_Output			(self, other, "DIA_Talbin_TEACHHUNTING_Heart_07_00"); //Los corazones de seres mágicos son muy escasos y difíciles de obtener. Ten cuidado cuando lo intentes, especialmente con cualquier clase de gólem.
		};
	Info_ClearChoices	(DIA_Talbin_TEACHHUNTING);
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Talbin_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP3_EXIT_Condition;
	information	= DIA_Talbin_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Talbin_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP4_EXIT_Condition;
	information	= DIA_Talbin_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Kap4_Wasneues
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASNEUES		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 13;
	condition	 = 	DIA_Talbin_KAP4_WASNEUES_Condition;
	information	 = 	DIA_Talbin_KAP4_WASNEUES_Info;

	description  =  "¿Has visto a alguien acercarse por aquí?";
};

func int DIA_Talbin_KAP4_WASNEUES_Condition ()
{
	if 	(Kapitel >= 4)
		&& (Talbin_FollowsThroughPass == 0)
		&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_KAP4_WASNEUES_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_KAP4_WASNEUES_15_00"); //¿Has visto a alguien acercarse por aquí?
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASNEUES_07_01"); //Sí. ¡Ha habido unos tipos muy graciosos que andaban últimamente por aquí! Se pavonean con armaduras elegantes y actuando con importancia.
};

///////////////////////////////////////////////////////////////////////
//	Info WaswolltenDJG
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASWOLLTENDJG		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr          = 14;
	condition	 = 	DIA_Talbin_KAP4_WASWOLLTENDJG_Condition;
	information	 = 	DIA_Talbin_KAP4_WASWOLLTENDJG_Info;

	description	 = 	"¿Qué buscaban esos tipos graciosos por aquí?";
};

func int DIA_Talbin_KAP4_WASWOLLTENDJG_Condition ()
{
if 	(Npc_KnowsInfo(other, DIA_Talbin_KAP4_WASNEUES))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASWOLLTENDJG_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_KAP4_WASWOLLTENDJG_15_00"); //¿Qué buscaban esos tipos graciosos por aquí?
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_01"); //Me interrogaron sobre provisiones y equipo. Tío, ¡si casi no tengo ni para mí!
	AI_Output			(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_02"); //Hablaban de matar dragones y cosas así. Dios sabe de dónde venían esos tipos, ¡pero no parecían muy dignos de confianza!

	if (Kapitel == 4)
	{
		B_LogEntry (TOPIC_Dragonhunter,"Algunos de los cazadores de dragones van por donde Talbin, el cazador."); 
	};
};



///////////////////////////////////////////////////////////////////////
//	Info woEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_WOENGROM_Condition;
	information	 = 	DIA_Talbin_WOENGROM_Info;

	description	 = 	"¿Ahora estás solo aquí?";
};

func int DIA_Talbin_WOENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (EngromIsGone == TRUE)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_WOENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WOENGROM_15_00"); //¿Ahora estás solo aquí?
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_01"); //Sí. Mi colega Engrom se ha largado. Ayer dijo que estaba teniendo una visión: alguien que le hablaba suavemente.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_02"); //Yo no oí nada. Solo pensé para mí mismo que se había pasado de rosca...
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_03"); //… y, de repente, se largó. No tengo ni idea de dónde se fue.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_04"); //Si ves a Engrom por alguna parte, dile que todavía me debe una piel de merodeador, el muy bastardo.

	if (Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
		{
	AI_Output			(other, self, "DIA_Talbin_WOENGROM_15_05"); //Pero tenía la impresión de que no quería largarse de aquí hasta que los orcos hubieran desaparecido.
	AI_Output			(self, other, "DIA_Talbin_WOENGROM_07_06"); //Como ya dije, algo no va bien con él.
		};
	MIS_Tabin_LookForEngrom = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FoundEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_FOUNDENGROM		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	16;
	condition	 = 	DIA_Talbin_FOUNDENGROM_Condition;
	information	 = 	DIA_Talbin_FOUNDENGROM_Info;

	description	 = 	"Encontré a tu amigo Engrom.";
};

func int DIA_Talbin_FOUNDENGROM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_WOENGROM))
	&& ((NpcObsessedByDMT_Engrom == TRUE)||(Npc_HasItems (other,ItAt_TalbinsLurkerSkin)) ) 
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_FOUNDENGROM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_00"); //Encontré a tu amigo Engrom.
	AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_01"); //¿Sí? ¿Dónde está?


	if (Npc_IsDead(Engrom))
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_02"); //Está muerto.
	}
	else	
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_03"); //No creo que vuelvas a verle otra vez.
	};

	if (B_GiveInvItems (other, self, ItAt_TalbinsLurkerSkin,1))
	{
	AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_04"); //Toma. Encontré esta piel de merodeador sobre él.
	};	

	if (hero.guild ==GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_05"); //Los buscadores han tomado posesión de él.
		AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_06"); //¿Los buscadores? ¿Quiénes se supone que son esos?
		AI_Output			(other, self, "DIA_Talbin_FOUNDENGROM_15_07"); //Esbirros de los reinos inferiores. Son los líderes reales de los orcos.
	};	

	AI_Output			(self, other, "DIA_Talbin_FOUNDENGROM_07_08"); //Por Innos. Debo salir de aquí, aunque me mate. ¡Ahora o nunca!
	AI_StopProcessInfos (self);	

	Log_CreateTopic (TOPIC_Talbin_Runs, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Talbin_Runs, LOG_RUNNING);
	B_LogEntry (TOPIC_Talbin_Runs,"Talbin, el cazador del valle de las minas, corrió hacia el paso como si le persiguiera un enjambre de moscas de sangre. Creo que iba hacia Khorinis."); 

	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"FleePass");
	Wld_InsertNpc	(Snapper, "START");
	Talbin_Runs = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOHIN		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	17;
	condition	 = 	DIA_Talbin_WOHIN_Condition;
	information	 = 	DIA_Talbin_WOHIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Dónde irás?";
};

func int DIA_Talbin_WOHIN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_FOUNDENGROM))
	&& (Talbin_FollowsThroughPass == 0)
		
		{
				return TRUE;
		};
};

func void DIA_Talbin_WOHIN_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_15_00"); //¿Dónde irás?

		if (Npc_GetDistToWP(self,"START")<1000) 
		{
			AI_Output			(self, other, "DIA_Talbin_WOHIN_07_01"); //Llévame por el paso. ¡¡Por favor!!
		
			Info_ClearChoices	(DIA_Talbin_WOHIN);
			Info_AddChoice	(DIA_Talbin_WOHIN, "No tengo tiempo para ti.", DIA_Talbin_WOHIN_ );
			Info_AddChoice	(DIA_Talbin_WOHIN, "Tú adelántate y cruza.", DIA_Talbin_WOHIN_durch );
			Info_AddChoice	(DIA_Talbin_WOHIN, "De acuerdo.", DIA_Talbin_WOHIN_ok );
		}
		else
		{
		AI_Output			(self, other, "DIA_Talbin_WOHIN_07_02"); //Debo salir de aquí, a través del paso. ¡Aparta de mi camino!
		AI_StopProcessInfos (self);
		};


};
func void DIA_Talbin_WOHIN_ok ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_ok_15_00"); //De acuerdo.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_ok_07_01"); //Gracias. Cuando cruces, simplemente te seguiré.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"IntoPass");
	Talbin_FollowsThroughPass = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;	//Joly: eh nur so lange, bis der SC durch den Levelchange geht!

};

func void DIA_Talbin_WOHIN_durch ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_durch_15_00"); //Tú adelántate y cruza.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_durch_07_01"); //Ahí dentro está tan oscuro... No me voy a quedar solo ahí de ninguna forma.

};

func void DIA_Talbin_WOHIN_ ()
{
	AI_Output			(other, self, "DIA_Talbin_WOHIN_schwein_15_00"); //No tengo tiempo para ti.
	AI_Output			(self, other, "DIA_Talbin_WOHIN_schwein_07_01"); //Dejadme aquí para que me pudra. ¡Arderás en el infierno por esto!
	Talbin_FollowsThroughPass = LOG_OBSOLETE;
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_VERSCHWINDE		(C_INFO)
{
	npc		 = 	VLK_4130_Talbin;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_VERSCHWINDE_Condition;
	information	 = 	DIA_Talbin_VERSCHWINDE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Eh.";
};

func int DIA_Talbin_VERSCHWINDE_Condition ()
{
	if (Talbin_FollowsThroughPass == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Talbin_VERSCHWINDE_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_VERSCHWINDE_15_00"); //Eh.
	AI_Output			(self, other, "DIA_Talbin_VERSCHWINDE_07_01"); //Piérdete. Puedo seguir sin ti, ¡escoria!
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Talbin_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP5_EXIT_Condition;
	information	= DIA_Talbin_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Talbin_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 999;
	condition	= DIA_Talbin_KAP6_EXIT_Condition;
	information	= DIA_Talbin_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Talbin_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Talbin_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Talbin_PICKPOCKET (C_INFO)
{
	npc			= VLK_4130_Talbin;
	nr			= 900;
	condition	= DIA_Talbin_PICKPOCKET_Condition;
	information	= DIA_Talbin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Talbin_PICKPOCKET_Condition()
{
	C_Beklauen (40, 25);
};
 
FUNC VOID DIA_Talbin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Talbin_PICKPOCKET);
	Info_AddChoice		(DIA_Talbin_PICKPOCKET, DIALOG_BACK 		,DIA_Talbin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Talbin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Talbin_PICKPOCKET_DoIt);
};

func void DIA_Talbin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Talbin_PICKPOCKET);
};
	
func void DIA_Talbin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Talbin_PICKPOCKET);
};


