// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_NW_EXIT(C_INFO)
{
	npc			= PIR_1300_Addon_Greg_NW;
	nr			= 999;
	condition	= DIA_Addon_Greg_NW_EXIT_Condition;
	information	= DIA_Addon_Greg_NW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_NW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
	PlayerTalkedToGregNW	= TRUE;
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//1. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info HalloW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Greg_NW_Hallo_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_Hallo_Condition ()
{
	if (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Hallo_Info ()
{

	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_00"); //Psst. Eh, tú. Ven.
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Hallo_15_01"); //¿Qué ocurre?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_02"); //¿Vas a la ciudad? Y se te ve ocupado.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_03"); //(falso) Mira, me pareces un tipo inteligente. Veo que llegarás lejos en la vida.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_04"); //No te dejas engañar por nadie, eso se ve a leguas.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_05"); //Dime, no te importaría ganarte un par de monedas, ¿verdad?

	PlayerTalkedToGregNW	= TRUE;
	SC_MeetsGregTime = 1; //Joly: erste Mal getroffen.

	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Me tengo que ir.", DIA_Addon_Greg_NW_Hallo_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Déjate de tonterías. Dime qué quieres.", DIA_Addon_Greg_NW_Hallo_schleim );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "No tienes aspecto de tener mucho oro.", DIA_Addon_Greg_NW_Hallo_vorsicht );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "¿Te escondes de alguien?", DIA_Addon_Greg_NW_Hallo_hide );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "¿Por qué?", DIA_Addon_Greg_NW_Hallo_ja );

};

func void DIA_Addon_Greg_NW_Hallo_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_weg_15_00"); //Me tengo que ir.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_weg_01_01"); //(molesto) Así que no piensas ayudarme. Lo recordaré, amigo. Nos volveremos a ver.

	AI_StopProcessInfos (self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_ja_15_00"); //¿Por qué no?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_01"); //Tendrás que perdonar a este viejo marinero ignorante, soy nuevo en esta zona y no conozco bien las normas.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_02"); //Tendré que aprender por las malas que los forasteros no son bien recibidos en esta ciudad portuaria.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_03"); //(compadeciéndose a sí mismo exageradamente) Ahora me quedaré aquí, sin saber cómo entrar en la ciudad.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_04"); //Tengo pendiente un asunto de suma importancia y mi cliente no admite retrasos, ¿entiendes?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_05"); //Me ayudarás a encontrar el modo de superar a la guardia de la ciudad, ¿verdad?
	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	
	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Ese tipo raro con parche quiere entrar en la ciudad portuaria. Debo encontrar el modo de que supere a los guardias de la ciudad."); 
	
	MIS_Addon_Greg_BringMeToTheCity = LOG_RUNNING;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_vorsicht_15_00"); //No tienes aspecto de tener mucho oro.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_01"); //(exageradamente modesto) Bueno, claro, no me muevo por los mismos círculos que tú.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_02"); //Pero no rechazarás mi modesta contribución a tu indudable gran fortuna, ¿verdad?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_03"); //Bien, ¿qué me dices? ¿Puedo contar contigo?

};

func void DIA_Addon_Greg_NW_Hallo_schleim ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_schleim_15_00"); //Déjate de tonterías. Dime qué quieres.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_01"); //¿Ves? A eso me refiero.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_02"); //Nadie consigue nada contigo sólo con buenas palabras.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_03"); //Lo sabía. Estoy tratando con un hueso duro de roer.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_04"); //Eres comerciante, así que estarás interesado en ganarte algo de dinero, ¿verdad?
};

func void DIA_Addon_Greg_NW_Hallo_hide ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_hide_15_00"); //¿Te escondes de alguien?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_01"); //Claro que no. Qué estupidez. Disfruto agazapado entre los árboles, para que el viento no me dé en la cara.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_02"); //¿Y qué me dices de ti? ¿Te interesa el trabajo?
};

///////////////////////////////////////////////////////////////////////
//	Info Stadtwachen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Stadtwachen		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information	 = 	DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Sobre los guardias de la ciudad…";
};

func int DIA_Addon_Greg_NW_Stadtwachen_Condition ()
{
	if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Stadtwachen_15_00"); //Sobre los guardias de la ciudad
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Stadtwachen_01_01"); //¿Sí? ¿Alguna idea?
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Tengo que meditar al respecto.", DIA_Addon_Greg_NW_Stadtwachen_nochnicht );

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "¿Y qué hay del soborno?", DIA_Addon_Greg_NW_Stadtwachen_geld );
	};

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE)
	&& (Npc_HasItems (other,ItWr_Passierschein))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Tengo un pase para la ciudad.", DIA_Addon_Greg_NW_Stadtwachen_Schein );
	};
	
	if (MIS_Addon_Lester_PickForConstantino != 0)
	&& (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Podrías entrar en la ciudad como recolector de hierba.", DIA_Addon_Greg_NW_Stadtwachen_constantino );
	};

	IF	((Npc_HasItems (other,ItAr_BAU_L)) || (Npc_HasItems (other,ItAr_BAU_M)))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Deberían dejarte pasar si llevas esta ropa de granjero.", DIA_Addon_Greg_NW_Stadtwachen_klamotten );
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00"); //Deberían dejarte pasar si llevas esta ropa de granjero.

	if (Npc_HasItems (other,ItAr_BAU_L))
	{
		B_GiveInvItems 		(other, self, ItAr_BAU_L,1);
	}
	else //ITAR_BAU_M
	{
		B_GiveInvItems 		(other, self, ITAR_BAU_M,1);
	};

	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01"); //Justo lo que necesito. Eh, sabía que podía contar contigo.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02"); //(maliciosamente) Nadie me molestará disfrazado como un paleto local, jaja.

	if (Npc_HasItems (self,ItAr_BAU_L))
	{
		AI_EquipArmor 		(self,ItAr_BAU_L);
	}
	else //ITAR_BAU_M
	{
		AI_EquipArmor 		(self,ITAR_BAU_M);
	};
	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03"); //Excelente. Lo has hecho muy bien. Aquí tienes tu recompensa.
	
	CreateInvItems (self, ItMi_Gold, 50);									
	B_GiveInvItems (self, other, ItMi_Gold, 50);	
	B_GivePlayerXP (XP_Greg_NW_GiveBauArmor);				
	
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04"); //(molesto) ¿Qué? ¿50 míseras monedas de oro? No hablarás en serio.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05"); //(condescendiente) El oro no lo es todo, amigo. Acéptalo de momento.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06"); //Me da la impresión de que pronto volveremos a vernos.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07"); //¿Y quién sabe? Quizá te devuelva el favor. Cuídate.
	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Markt");

	B_LogEntry (TOPIC_Addon_Greg_NW,"Le he dado ropa de granjero. Con ella, podrá pasar por delante de los guardias."); 

	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};
func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00"); //Tendré que pensarlo antes.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01"); //(serio) Muy bien. Pero date prisa. No tengo tiempo que perder.
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Greg_NW_Stadtwachen_Schein ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00"); //Tengo un pase para la ciudad.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01"); //(cínico) Ah, ya veo. ¿Se supone que debo fingir que soy ciudadano de la ciudad o qué?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02"); //(molesto) Mírame a los ojos, chico. Nadie va a tragárselo.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_constantino ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00"); //Podrías entrar en la ciudad como recolector de hierba.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01"); //(molesto) ¿Qué? ¿Tengo pinta de ir recogiendo flores por el bosque?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_geld ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_geld_15_00"); //¿Y qué hay del soborno?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_geld_01_01"); //(bruscamente) Si eso funcionara conmigo, ya lo habría intentado.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PERM		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_PERM_Condition;
	information	 = 	DIA_Addon_Greg_NW_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Una cosa más...";
};
func int DIA_Addon_Greg_NW_PERM_Condition ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)||(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};
func void DIA_Addon_Greg_NW_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PERM_15_00"); //Una cosa más
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_01"); //(arrogante) Escucha, chaval. Tengo cosas importantes que hacer.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_02"); //(amenazante) Ya volveremos a hablar, ¿de acuerdo?
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//2. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info MeetGregSecondTime
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_MeetGregSecondTime		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_00"); //Mira quién ha venido.

	if (MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_01"); //El chico granjero.
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_02"); //El tipo que pasó de mí descaradamente. Volvemos a encontrarnos, ¿eh?
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_03"); //(enfadado) Creía que querías ayudarme. Y en vez de eso, te largaste.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_04"); //Pensabas que me quedaría aquí para siempre, ¿verdad?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_05"); //Pues ahora verás. Ayúdate tú, porque nadie más lo hará. No pienso dejar que esto quede impune.
	};

	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_06"); //Llegas justo a tiempo.
	SC_SawGregInTaverne = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_wer		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_wer_Condition;
	information	 = 	DIA_Addon_Greg_NW_wer_Info;

	description	 = 	"¿Y tú quién eres?";
};

func int DIA_Addon_Greg_NW_wer_Condition ()
{
	if (GregLocation >= Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_wer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_wer_15_00"); //¿Y tú quién eres?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_01"); //Eso no te concierne.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_02"); //Si quisiera decirte quién soy, ya lo hubiera hecho, ¿lo captas?

	
};

///////////////////////////////////////////////////////////////////////
//	Info was
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_was		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_was_Condition;
	information	 = 	DIA_Addon_Greg_NW_was_Info;

	description	 = 	"¿Qué quieres de mí?";
};

func int DIA_Addon_Greg_NW_was_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func VOID B_Greg_Search_Dexter ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_00"); //Estoy buscando a alguien. No hay rastro de él en la ciudad y estos perdedores de aquí tampoco tienen ni idea.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_01"); //Es delgado, de pelo oscuro y suele llevar armadura roja.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_02"); //Por lo que sé, era prisionero en la colonia. Creo que su nombre empieza por D.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"El tipo del parche busca a alguien cuyo nombre empiece por 'D'."); 

	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_00"); //¿Qué quieres de mí?

	if (MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_01"); //¿Aún tienes problemas con los guardias de la ciudad?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_was_01_02"); //(amenazante) Yo te DARÉ problemas, granuja.
	};	

	B_Greg_Search_Dexter ();

	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Hablas de Diego.", DIA_Addon_Greg_NW_was_Diego );

	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_was, "¿No se llamará Dexter?", DIA_Addon_Greg_NW_was_Dexter );
	};
	
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "No conozco a nadie que concuerde con esa descripción.", DIA_Addon_Greg_NW_was_no );
};

func void DIA_Addon_Greg_NW_was_GregUnsicher ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_00"); //Puede ser que se llame así. No estoy seguro.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_01"); //Probablemente lo sepa cuando lo vea, no antes.
};

func void DIA_Addon_Greg_NW_was_UnNun ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_UnNun_15_00"); //¿Algo más?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_01"); //(enfadado) Sí, bocazas. Hay algo más.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_02"); //Necesito armas. Necesito provisiones. Algo de oro tampoco me vendría mal.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "No puedo ayudarte.", DIA_Addon_Greg_NW_was_NoHelp );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "¿Provisiones? Estás en una taberna.", DIA_Addon_Greg_NW_was_Orlan );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "¿Armas? Los mercenarios tienen armas.", DIA_Addon_Greg_NW_was_SLD );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Toma, 10 monedas de oro.", DIA_Addon_Greg_NW_was_HierGold );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "¿No has encontrado un mercader de armas en la ciudad?", DIA_Addon_Greg_NW_was_Waffenhaendler );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "¿Oro? Todos queremos oro.", DIA_Addon_Greg_NW_was_Gold );
};

func void DIA_Addon_Greg_NW_was_NoHelp ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_NoHelp_15_00"); //No puedo ayudarte.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_01"); //(enfadado) Será que no QUIERES.
	
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_02"); //Es la segunda vez que me dejas colgado.
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_03"); //Déjame darte un buen consejo: procura que no volvamos a encontrarnos.
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_04"); //Lo recordaré. Cuenta con ello.
	};	
	
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Start");
};

func void DIA_Addon_Greg_NW_was_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_00"); //¿Oro? Todos queremos oro.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_01"); //Podría ser. ¿Y tú qué harías con él? Beberte lo que pillaras en la taberna o gastártelo en el burdel, o eso creo yo.
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_02"); //¿Y tú tienes un plan mejor?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_03"); //(enfadado) Vergüenza te daría hablar si supieras lo que he hecho.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_04"); //Así que no hables tanto o tendré que cerrarte esa bocaza.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Waffenhaendler_15_00"); //¿No has encontrado un mercader de armas en la ciudad?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Waffenhaendler_01_01"); //¡No hablarás en serio! No tienen nada bueno.
};

func void DIA_Addon_Greg_NW_was_HierGold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_HierGold_15_00"); //Toma, 10 monedas de oro.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_01"); //(ríe) Maldito desgraciado, guárdate lo tuyo. Tengo una idea mejor.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_02"); //¡Hay una cueva cerca de aquí! Yo ya he estado en ese lugar y he enterrado mis cosas en varios sitios.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_03"); //La cueva es demasiado peligrosa para ir yo solo. Necesitaría que me ayudaras.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Le he ofrecido oro al tipo del parche, pero no lo quiere. Se supone que debo seguirle a su cueva."); 

	MIS_Addon_Greg_RakeCave = LOG_RUNNING;
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_SLD_15_00"); //¿Armas? Los mercenarios tienen armas.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_01"); //Interesante. He oído que el granjero Onar ha contratado a los chicos.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_02"); //(ríe) No está mal para ese lobo de mar.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_03"); //No es mala idea. Debería hacerles una visita.
};
func void DIA_Addon_Greg_NW_was_Orlan ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Orlan_15_00"); //¿Provisiones? Estás en una taberna.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Orlan_01_01"); //Ese estúpido camarero no va a decirte nada a menos que pagues por ello.
};

func void DIA_Addon_Greg_NW_was_no ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_no_15_00"); //No conozco a nadie que concuerde con esa descripción.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_no_01_01"); //Debería habérmelo imaginado.
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Diego ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Diego_15_00"); //Hablas de Diego.
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Dexter ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Dexter_15_00"); //¿No se llamará Dexter?
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveLos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCaveLos		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Info;

	description	 = 	"Vayamos a visitar la cueva.";
};

func int DIA_Addon_Greg_NW_RakeCaveLos_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveLos_15_00"); //Vayamos a visitar la cueva.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveLos_01_01"); //Ven conmigo.
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"RakeCave");
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveThere
///////////////////////////////////////////////////////////////////////
	func void B_Greg_GoNow()
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_03"); //(ordenando) ¿A qué esperas? Métete y saca todo.
	};
// --------------------------------------------------------------------

instance DIA_Addon_Greg_NW_RakeCaveThere		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_RakeCaveThere_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_00"); //Muy bien, amigo. Aquí está la cueva.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_01"); //Y aquí tienes una pica.
	B_GiveInvItems (self, other, itmw_2h_Axe_L_01, 1); //Spitzhacke	
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_02"); //He enterrado mis cosas ahí dentro. El lugar está marcado con una X.
	B_Greg_GoNow();
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveThere_15_04"); //¿Y qué pasa contigo?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_05"); //Alguien tiene que cubrirnos las espaldas. Y ahora, adentro.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Quiere que busque sus cosas en la cueva. Lo enterró todo y marcó el lugar con una cruz. Me ha dado una pica para la misión. "); 

	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay(); 
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCavePlundered
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCavePlundered		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition ()
{
	if ((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay()-2)) || (RAKEPLACE[Greg_FirstSecret] == TRUE))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_01_00"); //¿Por qué has tardado tanto? ¿Has encontrado algo?
	
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "Sí. He encontrado una bolsita de oro.", DIA_Addon_Greg_NW_RakeCavePlundered_gold );
	};
	Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "No.", DIA_Addon_Greg_NW_RakeCavePlundered_No );
};
func void DIA_Addon_Greg_NW_RakeCavePlundered_No ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00"); //No.
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01"); //Me tomas el pelo, ¿no es así?
		AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02"); //(haciéndose el inocente) No había nada DENTRO.
	};	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03"); //Mierda. Lo sabía. Esos buitres me han vuelto a coger la delantera.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04"); //Oh, vaya. Tranquilo, amigo. Tengo que irme. Nos vemos.
	AI_StopProcessInfos (self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Start");
};
var int B_Greg_RakePlaceBriefing_OneTime;
func void B_Greg_RakePlaceBriefing ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_00"); //Veamos. En el pequeño lago con las dos cascadas hay una isleta, allí debería haber un escondite mío.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_01"); //He enterrado cosas en dos lugares más, en los altos pastos.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_02"); //Uno de los sitios está allí arriba, tras la granja, y el otro, junto a la entrada al paso de las cascadas.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_03"); //Hay unas escaleras que bajan desde las tierras del granjero a las del propietario.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_04"); //Hay otro alijo en la hondonada del final de las escaleras.

	if (B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_Addon_Greg_NW,"Enterró sus cosas en más de un sitio. 1) En la pequeña isla, en el lago con dos cascadas. 2) Arriba, en los altos pastos detrás de la granja. 3) Cerca de la entrada al paso de las cataratas. 4) En la hondonada que hay detrás de las escaleras que van de los altos pastos de las tierras del granjero a los del propietario. Se supone que debo conseguirle lo que enterró. Él esperará lejos, en el cruce que hay entre las tierras.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};                                                                                             
                                                                                               
func void DIA_Addon_Greg_NW_RakeCavePlundered_gold ()                                          
{                                                                                              
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00"); //Sí. He desenterrado una bolsita de oro.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01"); //(con avaricia) Dámela.

	if ((Npc_HasItems (other,ItSe_GoldPocket25))||(Npc_HasItems (other,ItMi_Gold)>= 25))
		{	
			if (B_GiveInvItems (other, self, ItSe_GoldPocket25,1))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02"); //Aquí tienes.
				}
			else if (B_GiveInvItems (other, self, ItMi_Gold,25))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03"); //Había 25 monedas de oro dentro. Toma, quédatelas.
				};
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04"); //Fantástico, siguen ahí.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05"); //No eres tan inútil, después de todo.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06"); //Muy bien, escucha. He enterrado aún más. Y quiero que me lo consigas.
			B_Greg_RakePlaceBriefing ();
			Greg_SuchWeiter = TRUE;
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07"); //Te esperaré en el cruce que hay junto a las tierras del propietario. No me falles. Lo lamentarías, cazarrecompensas.
			AI_StopProcessInfos (self);
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_GivePlayerXP (XP_Addon_RakeCavePlundered);
		}
	else
		{
			AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08"); //Ya no lo tengo.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09"); //Maldición. ¿Quieres que te lo saque a palos?
			AI_StopProcessInfos (self);
			MIS_Addon_Greg_RakeCave = LOG_FAILED;//Joly:SC hat Greg angeschissen.
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_Attack (self, other, AR_NONE, 1);
		};
};

///////////////////////////////////////////////////////////////////////
//	PERM vor LakeCave
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_LakeCave	(C_INFO)
{
	npc		 	= PIR_1300_Addon_Greg_NW;
	nr		 	= 100; //alle anderen importants wichtiger
	condition	= DIA_Addon_Greg_NW_LakeCave_Condition;
	information	= DIA_Addon_Greg_NW_LakeCave_Info;
	permanent	= TRUE;
	important 	= TRUE;
};

func int DIA_Addon_Greg_NW_LakeCave_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 	
	&& (Greg_SuchWeiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_LakeCave_Info ()
{
	B_Greg_GoNow();
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WhereTreasures
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhereTreasures		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dime otra vez dónde enterraste exactamente tus cosas.";
};

func int DIA_Addon_Greg_NW_WhereTreasures_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhereTreasures_15_00"); //Repíteme dónde has enterrado tus cosas.
	B_Greg_RakePlaceBriefing ();
};

///////////////////////////////////////////////////////////////////////
//	Info PermTaverne
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PermTaverne		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Greg_NW_PermTaverne_Condition;
	information	 = 	DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent	 = 	TRUE;

	description	 = 	"Una cosa más...";
};

func int DIA_Addon_Greg_NW_PermTaverne_Condition ()
{
	if 	(
		(GregLocation == Greg_Bigcross)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross) == FALSE)
		&& (((Npc_GetDistToWP(self,"BIGCROSS")<1000) == FALSE)||(MIS_Addon_Greg_RakeCave == LOG_SUCCESS))
		)
	|| 	(
		(GregLocation == Greg_Dexter)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_WasWillstDu))
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_PermTaverne_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PermTaverne_15_00"); //Una cosa más

	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_01"); //Primero, consigue todo lo que he enterrado. Luego hablaremos.
	}
	else if (MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_02"); //Te estoy agradecido por ayudarme, pero eso no nos convierte en amigos, a ver si me entiendes.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_03"); //Ya hemos hablado demasiado.
	};
};


///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//3. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info Bigcross
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Bigcross		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Bigcross_Condition;
	information	 = 	DIA_Addon_Greg_NW_Bigcross_Info;

	description	 = 	"¿Va todo bien?";
};

func int DIA_Addon_Greg_NW_Bigcross_Condition ()
{
	if (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Bigcross_Info ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)||(MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_00"); //Mira, la traición personificada.
	};

	AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_01"); //¿Qué tal todo?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_02"); //Regular. Esos mercenarios no son de gran ayuda, la verdad.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_03"); //Esperaba que al menos tuvieran más agallas.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_04"); //Pero no son más que unos fanfarrones y unos bocazas, por si te interesa.
	
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_05"); //¿Qué ha pasado con todo lo que enterré? ¿Lo has encontrado ya?
		if (RAKEPLACE[1]==FALSE)
		|| (RAKEPLACE[2]==FALSE)
		|| (RAKEPLACE[3]==FALSE)
		|| (RAKEPLACE[4]==FALSE)
		|| (RAKEPLACE[5]==FALSE)
		{
			AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_06"); //No, no todo.
			AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_07"); //Pues date prisa, ¿no? No puede ser tan difícil.
		};
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info WhatWantFromSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhatWantFromSLD		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Info;

	description	 = 	"¿Por qué te interesan los mercenarios?";
};

func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhatWantFromSLD_15_00"); //¿Por qué te interesan los mercenarios?
	
	if (SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter ();
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_01"); //Ya te lo he dicho. Ando buscando a un tipo con armadura roja.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_02"); //Pero estos idiotas de aquí no tienen ni idea de lo que hablo.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info DexterFound
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_DexterFound		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_DexterFound_Condition;
	information	 = 	DIA_Addon_Greg_NW_DexterFound_Info;

	description	 = 	"Supongo que hablas de alguien llamado Dexter.";
};

func int DIA_Addon_Greg_NW_DexterFound_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_DexterFound_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_DexterFound_15_00"); //Supongo que hablas de alguien llamado Dexter.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_DexterFound_01_01"); //Maldita sea. ¿Cómo quieres que sepa el nombre del tipo?
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Se me ha ocurrido.", DIA_Addon_Greg_NW_DexterFound_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Tan vez deberíamos ir juntos a buscarle.", DIA_Addon_Greg_NW_DexterFound_together );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Yo sé dónde puedes encontrarlo.", DIA_Addon_Greg_NW_DexterFound_wo );
};
func void DIA_Addon_Greg_NW_DexterFound_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_weg_15_00"); //Se me ha ocurrido.
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_00"); //Yo sé dónde puedes encontrarlo.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_01"); //(sorprendido) ¿En serio? ¡DÍMELO!
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_02"); //No anda lejos de aquí.
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_03"); //Al parecer, es el líder de una banda de bandidos.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_04"); //(con sorna) JA. Sí, es él.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_05"); //Sabía que ese viejo lobo de mar andaba por aquí.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_06"); //Ahora sólo tengo que registrar todos los escondrijos y ratoneras de la zona.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_07"); //Encontraré a ese bastardo, no necesito tu ayuda.
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_together_15_00"); //Tan vez deberíamos ir juntos a buscarle.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_together_01_01"); //Aún tengo un asunto pendiente con él. Puedo ocuparme solo.
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//4. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_00"); //(en alto) ¿Dónde está ese cerdo?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter_15_01"); //¿Quién? ¿El capitán? Aquí mismo.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_02"); //(en alto) Pues aparta de mi camino.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"DexterHouseRun");
};

///////////////////////////////////////////////////////////////////////
//	Info WodennNu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WodennNu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WodennNu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WodennNu_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_WodennNu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
	&& (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10")<500) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WodennNu_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_00"); //(enfadado) ¿Y ahora dónde se ha metido?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WodennNu_15_01"); //Estaba aquí.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_02"); //(ordenando) ¡Bueno, pues ve a buscarlo!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter2		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter2_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_00"); //Ah, Dexter está acabado, ¿verdad?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter2_15_01"); //Parece que está muerto.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_02"); //Ya tardaba. Comprueba si lleva algo encima.
	Npc_ExchangeRoutine	(self,"DexterHouseWalk");
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info RavensLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RavensLetter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RavensLetter_Condition;
	information	 = 	DIA_Addon_Greg_NW_RavensLetter_Info;

	description	 = 	"Lo único que Dexter llevaba era esta carta.";
};

func int DIA_Addon_Greg_NW_RavensLetter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_CaughtDexter2))
	&& (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_00"); //Lo único que Dexter llevaba era esta carta.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_01"); //Enséñamela.
	B_UseFakeScroll ();
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_02"); //Ag, mierda, no me sirve para nada.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_03"); //No deberíamos haberle dejado palmarla así.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_04"); //No sabrás como cruzar las montañas que hay al noreste de Khorinis
	
	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_05"); //Tal vez por un túnel subterráneo. Los Magos de Agua están estudiando un portal que conduce a las montañas del noreste.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_06"); //(enfadado) ¿Qué tontería es esa?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_07"); //(burlándose) Bah, Magos de Agua. ¿No se te ocurre un plan mejor?
	};
	
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_08"); //No.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_09"); //(suspirando resignado) Así que estoy atrapado.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_10"); //Dexter era mi última esperanza.
};

///////////////////////////////////////////////////////////////////////
//	Info WasWillstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WasWillstDu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WasWillstDu_Info;

	description	 = 	"¿Qué querías de Dexter?";
};

func int DIA_Addon_Greg_NW_WasWillstDu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_RavensLetter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WasWillstDu_15_00"); //¿Qué querías de Dexter?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_01"); //Vengo de más allá de las montañas al noreste de esta isla. Y quiero volver.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_02"); //Esperaba que ese cretino supiera cómo salir de aquí sin una embarcación.

	Npc_ExchangeRoutine	(self,"DexterThrone");	

	Info_ClearChoices	(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "¿Qué hay más allá de esas montañas?", DIA_Addon_Greg_NW_WasWillstDu_da );
	
	if (Skip_NW.aivar[AIV_TalkedToPlayer]==TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "Vi a un pirata llamado Skip cerca del puerto marítimo.", DIA_Addon_Greg_NW_WasWillstDu_Skip );
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_da_15_00"); //¿Qué hay más allá de esas montañas?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_01"); //Más vale que no intentes ir allí.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_02"); //Son tierras peligrosas. Un enclenque como tú no duraría mucho.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00"); //He visto un pirata llamado Skip cerca del puerto.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01"); //Ese imbécil. Llevo esperándolo 3 días. ¿Por qué llega tan tarde?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02"); //Cuando recupere las fuerzas, le daré su merecido.
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundTreasure
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_FoundTreasure		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information	 = 	DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent	 = 	TRUE;

	description	 = 	"He encontrado tus cosas enterradas.";
};

func int DIA_Addon_Greg_NW_FoundTreasure_Condition ()
{
	if (RAKEPLACE[1]==TRUE)
	&& (RAKEPLACE[2]==TRUE)
	&& (RAKEPLACE[3]==TRUE)
	&& (RAKEPLACE[4]==TRUE)
	&& (RAKEPLACE[5]==TRUE)
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_FoundTreasure_15_00"); //He encontrado tus cosas enterradas.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_FoundTreasure_01_01"); //Entonces deberás llevar encima unas 100 monedas de oro, un cáliz de oro, un plato de plata y un amuleto, todo mío. Dámelo.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
	Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "Resulta que no lo llevo encima.", DIA_Addon_Greg_NW_FoundTreasure_not );

	if ((Npc_HasItems (other,ItSe_GoldPocket100)) || (Npc_HasItems (other,itmi_gold)>= 100))
	&& (Npc_HasItems (other,ItMi_GoldCup))
	&& (Npc_HasItems (other,ItMi_SilverChalice))
	&& (Npc_HasItems (other,ItAm_Prot_Point_01))
		{
			Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "Aquí lo tienes.", DIA_Addon_Greg_NW_FoundTreasure_ja );
		};
};
func void DIA_Addon_Greg_NW_FoundTreasure_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_00"); //Aquí lo tienes.

	if (B_GiveInvItems (other, self, ItSe_GoldPocket100,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_01"); //Una bolsa con 100 monedas de oro.
	}	
	else if (B_GiveInvItems (other, self, ItMi_gold,100))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_02"); //100 monedas de oro.
	};

	if (B_GiveInvItems (other, self, ItMi_GoldCup,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_03"); //Un cáliz de oro.
	};
	if (B_GiveInvItems (other, self, ItMi_SilverChalice,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_04"); //Un plato de plata.
	};
	if (B_GiveInvItems (other, self, ItAm_Prot_Point_01,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_05"); //Y un amuleto.
	};
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_06"); //Muy bien. Tienes suerte de haber sido tan estúpido como para huir con el botín.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_07"); //Aquí tienes tu parte.

	B_GiveInvItems (self, other, ItMi_gold,30);
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
		
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_not_15_00"); //No lo llevo encima.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_not_01_01"); //Entonces consígueme todo antes de que me vuelva loco.
	AI_StopProcessInfos (self);
};

