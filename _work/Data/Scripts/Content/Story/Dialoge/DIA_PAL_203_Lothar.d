// ***************************************************************
//								EXIT
// ***************************************************************

// ---------------------
	var int Lothar_ImOV;
// ---------------------

INSTANCE DIA_Lothar_EXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lothar_EXIT_Condition()
{	
	if (Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_EXIT_Info() 
{
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							First EXIT
// ***************************************************************

INSTANCE DIA_Lothar_FirstEXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent   = TRUE;
	description = "¡Debo irme! (FIN)";
};
FUNC INT DIA_Lothar_FirstEXIT_Condition()
{	
	if (Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_FirstEXIT_Info() 
{
	AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_00"); //¡Tengo que irme!
	if (Lothar_Regeln == FALSE)
	{
		AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_01"); //¡Espera! ¡Todavía no conoces las nuevas leyes de la ciudad!
		AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_02"); //Hasta luego.
	}
	else
	{
		if (Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_03"); //Como me entere de que vuelves a hablar a la gente de dragones, vas a meterte en un buen lío. ¿Ha quedado claro?
		}
		else
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_04"); //Mientras estés en Khorinis puedes sentirte a salvo.

			if (hero.guild != GIL_PAL)
			{
				AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_05"); //¡Ahora los paladines del rey protegen la ciudad!
			};
		};

		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine (self, "START");
	};

	// ------- Canthars TA auswechseln -------
	if (Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine (Canthar, "START");
		Canthar_InStadt = TRUE;
	};

	AI_StopProcessInfos (self);
};


// ***************************************************************
//							Hallo
// ***************************************************************

instance DIA_Lothar_Hallo (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Hallo_Condition;
	information	 = 	DIA_Lothar_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lothar_Hallo_Condition ()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lothar_Hallo_01_00"); //¡Alto, forastero!

	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Hallo_01_01"); //No te he visto entrar por esta puerta.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_02"); //¿Y?
		AI_Output (self, other, "DIA_Lothar_Hallo_01_03"); //Y los guardias de la otra puerta tienen órdenes de no dejar entrar en la ciudad a desconocidos.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_04"); //Bueeeeno...
		AI_Output (self, other, "DIA_Lothar_Hallo_01_05"); //¡Voy a tener que hablar seriamente con esos dos!
		AI_Output (self, other, "DIA_Lothar_Hallo_01_06"); //Pero ahora, por lo que a nosotros respecta:
	};

	AI_Output (self, other, "DIA_Lothar_Hallo_01_07"); //Soy Lothar. Paladín del rey y humilde sirviente de Innos, nuestro señor.
	AI_Output (self, other, "DIA_Lothar_Hallo_01_08"); //Nuestro comandante, lord Hagen, me ha confiado la tarea de explicarle a los recién llegados las nuevas leyes que se aplican a todos los habitantes de la ciudad.

	//ADDON>
	AI_Output (self, other, "DIA_Addon_Lothar_Hallo_01_00"); //Desde que ha empezado a desaparecer gente de la ciudad, todos se preocupan de no sufrir la misma suerte.
	//ADDON<

	if Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	{
		B_StartOtherRoutine (Lester, "XARDAS");
	};
};

// ***************************************************************
//						Wichtige Nachricht			E1
// ***************************************************************
instance DIA_Lothar_MESSAGE		(C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_MESSAGE_Condition;
	information	 = 	DIA_Lothar_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"¡Tengo un mensaje importante para el líder de los paladines!";
};
func int DIA_Lothar_MESSAGE_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_MESSAGE_Info ()
{
 	AI_Output (other, self, "DIA_Lothar_MESSAGE_15_00"); //¡Tengo un mensaje importante para el líder de los paladines!
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_01"); //El honorable lord Hagen no recibe a nadie.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_02"); //Lord Andre, el comandante de la guardia de la ciudad, es el responsable de todos los asuntos concernientes al pueblo llano.
};	

// ***************************************************************
//							Auge Innos 				E2
// ***************************************************************
instance DIA_Lothar_EyeInnos (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_EyeInnos_Condition;
	information	 = 	DIA_Lothar_EyeInnos_Info;
	permanent    =  FALSE;
	description	 = 	"¡He venido a por el Ojo de Innos!";
};
func int DIA_Lothar_EyeInnos_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_EyeInnos_Info ()
{
	AI_Output (other, self, "DIA_Lothar_EyeInnos_15_00"); //¡He venido a por el Ojo de Innos!

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_01"); //El Ojo es asunto de lord Hagen. Habla con él.
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_02"); //¡El sagrado Ojo de Innos! ¡¿Cómo sabes de su existencia?! ¡No eres miembro de la orden!
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_03"); //Un mago me habló de él.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_04"); //No sé qué motivos tendría para confiarte uno de los secretos de nuestra orden.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_05"); //Pero seguro que no pretendía que TÚ pusieras tus zarpas sobre él.
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_06"); //Pero...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_07"); //¡No quiero saber nada más del tema!
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output (self, other, "DIA_Lothar_EyeInnos_01_08"); //Primero me sueltas cuentos de hadas sobre dragones y ahora esto. ¡Increíble!
		};
	};
};	

// ***************************************************************
//							Drachen 				E2
// ***************************************************************
instance DIA_Lothar_Dragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Dragons_Condition;
	information	 = 	DIA_Lothar_Dragons_Info;
	permanent    =  FALSE;
	description	 = 	"Escucha, ¡la ciudad está amenazada por dragones!";
};
func int DIA_Lothar_Dragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Dragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Dragons_15_00"); //Escucha, ¡la ciudad está amenazada por dragones!
	if ((hero.guild != GIL_PAL)&&(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_01"); //¡Eso es imposible!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_02"); //¡Otro lunático!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_03"); //Ya tenemos suficiente inquietud en la ciudad. ¡Y sin que vengan idiotas asustando a la gente con cuentos de dragones!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_04"); //Al último que contó cuentos de dragones lo encerré de inmediato y lo mandé al Valle de las Minas. ¡Así que cuidado con lo que dices!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_05"); //¡Aquí no queremos que nadie se dedique a propagar el pánico entre la gente!
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_06"); //Lo he oído varias veces, pero cuesta creerlo.
		AI_Output (self, other, "DIA_Lothar_Dragons_01_07"); //Sería mejor que no dijeras nada a nadie. No tenemos que sembrar el pánico entre la gente.
	};
	Player_TalkedAboutDragons = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_Ornament		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lothar_Ornament_Condition;
	information	 = 	DIA_Addon_Lothar_Ornament_Info;

	description	 = 	"¿Sabes algo de una criatura de piedra del círculo de piedra de la granja de Lobart?";
};

func int DIA_Addon_Lothar_Ornament_Condition ()
{
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //¿Sabes algo de una criatura de piedra del círculo de piedra de la granja de Lobart?
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //Claro. La destruimos. Suponía una amenaza para las granjas de alrededor.
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //¿Por qué lo preguntas?
	
	Info_ClearChoices	(DIA_Addon_Lothar_Ornament);
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Estoy buscando un fragmento metálico de un anillo.", DIA_Addon_Lothar_Ornament_suche );
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "¿Crees que es normal?", DIA_Addon_Lothar_Ornament_normal );
};
func void DIA_Addon_Lothar_Ornament_normal ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //¿Crees que es normal?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //¿Te refieres al monstruo?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //Por lo que sé, los Magos de Agua se están ocupando del asunto.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //A mí no me preocupa mucho. Tenemos nuestros quehaceres en la ciudad y en el Valle de Minas.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //Comprendo.
};

func void DIA_Addon_Lothar_Ornament_suche ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //Estoy buscando un fragmento metálico de un anillo.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //Debería de andar cerca del círculo de piedra de Lobart.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //Sí, había algo así. Lo llevaban las criaturas de piedra. Pensaba que era una runa mágica.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //Se lo di a Lord Hagen. No tengo ni idea de si aún lo tiene.
};

// ***************************************************************
//							WerVonDrachen 				E3
// ***************************************************************
instance DIA_Lothar_WhoDragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_WhoDragons_Condition;
	information	 = 	DIA_Lothar_WhoDragons_Info;
	permanent    =  FALSE;
	description	 = 	"¿Ya ha informado alguien de los dragones?";
};
func int DIA_Lothar_WhoDragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Dragons))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WhoDragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WhoDragons_15_00"); //¿Ya ha informado alguien de los dragones?
	AI_Output (self, other, "DIA_Lothar_WhoDragons_01_01"); //Sí. El nombre del tipo era Diego. O, al menos, eso creo.

	if ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_WhoDragons_01_02"); //(Amenazador) Le avisé, ¡igual que hago contigo! ¡Pero el maldito lunático me sacó de quicio!
	};
};	

// ***************************************************************
//							Regeln 				E1
// ***************************************************************
instance DIA_Lothar_Regeln (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_Regeln_Condition;
	information	 = 	DIA_Lothar_Regeln_Info;
	permanent    =  FALSE;
	description	 = 	"De acuerdo, ¡explícame las reglas de la ciudad!";
};
func int DIA_Lothar_Regeln_Condition ()
{	
	return TRUE;
};
func void DIA_Lothar_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Regeln_15_00"); //(Suspirando) De acuerdo, ¡explícame las reglas de la ciudad!
	AI_Output (self, other, "DIA_Lothar_Regeln_01_01"); //Primero: el honorable paladín lord Hagen, reside en el barrio alto junto con sus tropas.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_02"); //Por eso solo los ciudadanos honorables pueden acceder al barrio alto.
	AI_Output (self ,other, "DIA_Lothar_Add_01_04"); //Segundo: el ayuntamiento, que está en el barrio alto, ahora es el cuartel general de los paladines. Solo los propios paladines y los miembros de la milicia pueden acceder a él.
	AI_Output (self ,other, "DIA_Lothar_Add_01_05"); //Y tercero: cualquier acusado de un crimen debe expiar sus culpas con el comandante de la milicia.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_05"); //¿Alguna pregunta?
	
	Lothar_Regeln = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_MissingPeople		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lothar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Lothar_MissingPeople_Info;

	description	 = 	"¿La gente de la ciudad desaparece sin más?";
};

func int DIA_Addon_Lothar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lothar_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //¿Está desapareciendo gente de la ciudad sin más?
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //Sí. Y cada día más.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //Es increíble que la milicia aún no haya podido descubrir qué hay detrás de estos extraños sucesos.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //No me extraña que los habitantes de la ciudad desconfíen ahora de los forasteros.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_04"); //Así que intenta no provocarlos mientras estés allí, ¿vale?
	
		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};
	
	SC_HearedAboutMissingPeople = TRUE;
};

// ***************************************************************
//							HowCitizen 				E2
// ***************************************************************
instance DIA_Lothar_HowCitizen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	4;
	condition	 = 	DIA_Lothar_HowCitizen_Condition;
	information	 = 	DIA_Lothar_HowCitizen_Info;
	permanent    =  FALSE;
	description	 = 	"¿Cómo me HAGO ciudadano de la ciudad?";
};
func int DIA_Lothar_HowCitizen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_HowCitizen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_06"); //¿Cómo me HAGO ciudadano de la ciudad?
	AI_Output (self ,other, "DIA_Lothar_Add_01_07"); //¡Solo se consideran ciudadanos los que tengan trabajos estables!
	AI_Output (self ,other, "DIA_Lothar_Add_01_09"); //¡Pero no creas que podrás ver a lord Hagen solo porque seas ciudadano!
	AI_Output (self ,other, "DIA_Lothar_Add_01_10"); //Como ciudadano tienes derecho a entrar al barrio alto, ¡nada más!
	AI_Output (self ,other, "DIA_Lothar_Add_01_11"); //¡Solo podrás acceder al ayuntamiento si eres miembro de la milicia!
};

// ***************************************************************
//							WoArbeit				E3
// ***************************************************************
instance DIA_Lothar_WoArbeit (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	5;
	condition	 = 	DIA_Lothar_WoArbeit_Condition;
	information	 = 	DIA_Lothar_WoArbeit_Info;
	permanent    =  FALSE;
	description	 = 	"¿Dónde puedo encontrar trabajo?";
};
func int DIA_Lothar_WoArbeit_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_HowCitizen))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoArbeit_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_14"); //¿Dónde puedo encontrar trabajo?
	AI_Output (self ,other, "DIA_Lothar_Add_01_15"); //Tendrás que empezar como aprendiz de uno de los maestros de la parte baja de la ciudad.
	AI_Output (self ,other, "DIA_Lothar_Add_01_16"); //Serás ciudadano en cuanto te acepte un maestro.
	AI_Output (self ,other, "DIA_Lothar_Add_01_17"); //Sin embargo, el resto de los maestros deben estar de acuerdo. Ésa es la costumbre aquí, en Khorinis.
	AI_Output (self ,other, "DIA_Lothar_Add_01_18"); //Si estabas pensando en buscar trabajo en el distrito portuario, ¡olvídalo!
	AI_Output (self ,other, "DIA_Lothar_Add_01_19"); //Allí vive la escoria de la ciudad. ¡No vayas siquiera por allí o te arrepentirás!
};

// ***************************************************************
//							ToOV 				E2
// ***************************************************************
instance DIA_Lothar_ToOV (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	6;
	condition	 = 	DIA_Lothar_ToOV_Condition;
	information	 = 	DIA_Lothar_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"¿Cómo llego al barrio alto?";
};
func int DIA_Lothar_ToOV_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToOV_Info ()
{
	AI_Output (other, self, "DIA_Lothar_ToOV_15_00"); //¿Cómo llego al barrio alto?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_01"); //Veamos, ¡¿es que no me prestas atención?!
	AI_Output (self, other, "DIA_Lothar_ToOV_01_02"); //No eres ciudadano de esta ciudad. Puedes ahorrarte el viaje, los guardias no te dejarán entrar.
	AI_Output (self, other, "DIA_Lothar_ToOV_01_03"); //¡Toda la zona más allá de la puerta interior te está vedada!
};	

// ***************************************************************
//							ToMiliz 				E2
// ***************************************************************
instance DIA_Lothar_ToMiliz (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToMiliz_Condition;
	information	 = 	DIA_Lothar_ToMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"¿Cómo puedo hacer que me acepten en la milicia?";
};
func int DIA_Lothar_ToMiliz_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToMiliz_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_26"); //¿Cómo puedo hacer que me acepten en la milicia?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_27"); //Por mandato expreso de lord Hagen, en la milicia solo pueden alistarse ciudadanos.
		AI_Output (other, self, "DIA_Lothar_Add_15_28"); //Entiendo.
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_29"); //Si quieres más información, ve al cuartel a hablar con lord Andre.
};	

// ***************************************************************
//							ToPaladins 				E2
// ***************************************************************
instance DIA_Lothar_ToPaladins (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToPaladins_Condition;
	information	 = 	DIA_Lothar_ToPaladins_Info;
	permanent    =  FALSE;
	description	 = 	"¿Qué tengo que hacer para conseguir una armadura como la tuya?";
};
func int DIA_Lothar_ToPaladins_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_ToMiliz))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToPaladins_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_30"); //¿Qué tengo que hacer para conseguir una armadura como la tuya?
	if (other.guild != GIL_MIL)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_31"); //(Sobreactuado) ¿Qué? ¡Ni siquiera eres miembro de la milicia!
	};
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_32"); //¡Todavía no eres CIUDADANO!
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_33"); //¿Cómo se te ocurre pensar en ponerte la armadura de un PALADÍN?
	AI_Output (self ,other, "DIA_Lothar_Add_01_34"); //Hasta ahora, este honor solo se le ha otorgado a unos pocos ciudadanos de la milicia, aquellos que han realizado proezas extraordinarias.
	AI_Output (self ,other, "DIA_Lothar_Add_01_35"); //(En tono estricto) ¡Hijo, te queda mucho camino para llegar a ser paladín!
};	

// ***************************************************************
//							WoAndre 				E2
// ***************************************************************
instance DIA_Lothar_WoAndre (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	8;
	condition	 = 	DIA_Lothar_WoAndre_Condition;
	information	 = 	DIA_Lothar_WoAndre_Info;
	permanent    =  FALSE;
	description	 = 	"¿Dónde puedo encontrar al comandante de la guardia de la ciudad?";
};
func int DIA_Lothar_WoAndre_Condition ()
{	
	if ( Npc_KnowsInfo(other, DIA_Lothar_Regeln) || Npc_KnowsInfo(other, DIA_Lothar_MESSAGE) )
	&& (Andre.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoAndre_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WoAndre_15_00"); //¿Dónde puedo encontrar al comandante de la guardia de la ciudad?
	AI_Output (self, other, "DIA_Lothar_WoAndre_01_01"); //Lord Andre está en el cuartel, en el otro extremo de la ciudad.
};	

// ***************************************************************
//							Schlafen 				E2
// ***************************************************************
instance DIA_Lothar_Schlafen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	9;
	condition	 = 	DIA_Lothar_Schlafen_Condition;
	information	 = 	DIA_Lothar_Schlafen_Info;
	permanent    =  FALSE;
	description	 = 	"¿Hay por aquí algún sitio para pasar la noche?";
};
func int DIA_Lothar_Schlafen_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_22"); //¿Hay por aquí algún sitio para pasar la noche?
	AI_Output (self ,other, "DIA_Lothar_Add_01_23"); //Si buscas un lugar en el que dormir, ve al hotel, justo al otro lado del cuartel.
	AI_Output (self ,other, "DIA_Lothar_Add_01_24"); //Los paladines pagan por el alojamiento de todos los viajeros que vienen a la ciudad.
	AI_Output (self ,other, "DIA_Lothar_Add_01_25"); //Los mercaderes itinerantes también se alojan allí.
};	

// ***************************************************************
//							PERM - VOR OV				
// ***************************************************************
instance DIA_Lothar_PermB4OV (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 3;
	condition	= DIA_Lothar_PermB4OV_Condition;
	information	= DIA_Lothar_PermB4OV_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
func int DIA_Lothar_PermB4OV_Condition ()
{	
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Lothar_Regeln == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PermB4OV_Info ()
{
	AI_Output (self, other, "DIA_Lothar_PermB4OV_01_00"); //¡Puedes hablar con lord Andre de todo lo demás!
	AI_StopProcessInfos(self);
};	
	

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() //überflüsige Outputs
{
	AI_Output (other, self, "DIA_Lothar_Add_15_00"); //¡Pero DEBO ver a lord Hagen!

	AI_Output (self ,other, "DIA_Lothar_Add_01_45"); //Y, por lo que veo, te ha aceptado en la milicia.
	AI_Output (self ,other, "DIA_Lothar_Add_01_46"); //Mm, debe de saber lo que se hace.
	
	AI_Output (other, self, "DIA_Lothar_Add_15_20"); //¿Cuántos maestros hay?
	AI_Output (self ,other, "DIA_Lothar_Add_01_21"); //Creo que hay cinco en total.
		
	AI_Output (self ,other, "DIA_Lothar_Add_01_62"); //Dime, ¿no lo he dejado claro? ¡No quiero más cuentos de dragones?
	AI_Output (other, self, "DIA_Lothar_Add_15_63"); //¿Cómo sabes...?
	AI_Output (self ,other, "DIA_Lothar_Add_01_64"); //¡Eso NO es asunto tuyo!
	AI_Output (self ,other, "DIA_Lothar_Add_01_65"); //Ésa ha sido la última vez, ¡¿entendido?!
	
	AI_Output (other, self, "DIA_Lothar_Add_15_66"); //¿Dónde puedo encontrar al comandante de la milicia?
	AI_Output (other, self, "DIA_Lothar_Add_15_08"); //¡Ahora soy aprendiz de uno de los maestros!
	
	// ------ NEWS_Modul für Unterstadt ------
	AI_Output (self ,other, "DIA_Lothar_Add_01_47"); //Otra vez tú.

	AI_Output (self ,other, "DIA_Lothar_Add_01_43"); //He oído que has visto a lord Andre.
	AI_Output (self ,other, "DIA_Lothar_Add_01_44"); //Te dije que solo podrías alistarte en la milicia si eras ciudadano de la ciudad.

	AI_Output (self ,other, "DIA_Lothar_Add_01_48"); //He informado a lord Hagen de que quieres hablar con él...
	AI_Output (other, self, "DIA_Lothar_Add_15_49"); //¿Y? ¿Qué te dijo?
	AI_Output (self ,other, "DIA_Lothar_Add_01_50"); //No ha oído hablar de ti.
	AI_Output (other, self, "DIA_Lothar_Add_15_51"); //Claro que no. ¿Le hablaste de los dragones?
	AI_Output (self ,other, "DIA_Lothar_Add_01_52"); //¡¿Pero no te dije que DEJARAS de contar esos cuentos?!

	AI_Output (self ,other, "DIA_Lothar_Add_01_12"); //He oído que ya tienes el consentimiento de algunos de los maestros.
	AI_Output (self ,other, "DIA_Lothar_Add_01_13"); //Te lo tomas muy en serio, ¿no?

	AI_Output (self ,other, "DIA_Lothar_Add_01_01"); //Debes obedecer las reglas, ¡como todo el mundo!
	AI_Output (self ,other, "DIA_Lothar_Add_01_02"); //No se puede ver a lord Hagen.
	AI_Output (self ,other, "DIA_Lothar_Add_01_03"); //Si tienes algo IMPORTANTE que decir, díselo a lord Andre. ¡Él te ayudará!
};


// #########################################
// #########################################
		
// 				Im Oberen Viertel
		
// #########################################
// #########################################


// ***************************************************************
//								OV Regeln
// ***************************************************************
instance DIA_Lothar_HelloAgain (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_HelloAgain_Condition;
	information	 = 	DIA_Lothar_HelloAgain_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lothar_HelloAgain_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	{
		return TRUE;
	};
};
func void DIA_Lothar_HelloAgain_Info ()
{
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_00"); //¡Ah! ¡Otra vez tú!
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_01"); //¡Así que te las has arreglado para entrar en el barrio alto!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_36"); //¿Dónde has conseguido esta túnica?
		AI_Output (other, self, "DIA_Lothar_Add_15_37"); //He superado la prueba del fuego.
		AI_Output (self ,other, "DIA_Lothar_Add_01_38"); //Increíble. Entonces lo que está pasando aquí debe de ser la voluntad de Innos...
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_39"); //No te has unido a los mercenarios de Onar, ¿verdad?
		AI_Output (self ,other, "DIA_Lothar_Add_01_40"); //¿Cómo has entrado aquí?
		AI_Output (other, self, "DIA_Lothar_Add_15_41"); //Traigo una propuesta de paz de Lee...
		AI_Output (self ,other, "DIA_Lothar_Add_01_42"); //¡Bah! Lord Hagen nunca la aceptará.
	};
		
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_02"); //Debes tener cuidado con algunas cosas, si no quieres salir de aquí tan rápido como has entrado.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_03"); //Solo se te permite entrar en los edificios de los mercaderes. Los puedes reconocer por los carteles que tienen sobre la puerta, para que no haya malentendidos.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_04"); //El resto de los edificios pertenecen a ciudadanos importantes. ¡Allí no pintas nada!
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV) 
	{
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_05"); //Aunque seas miembro de la orden de Innos.
	};
	if (other.guild == GIL_MIL)
	{	
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_06"); //Como miembro de la milicia, también puedes acceder a las habitaciones de los paladines.
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_07"); //Pero tus aposentos siguen estando en el cuartel.
	};
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_08"); //Los ciudadanos importantes de la ciudad viven en este barrio. Trátalos con respeto.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_09"); //¿Nos entendemos?
	AI_Output (other, self, "DIA_Lothar_HelloAgain_15_10"); //Claro.
};	

// ***************************************************************
//								Hagen
// ***************************************************************
instance DIA_Lothar_Hagen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_Hagen_Condition;
	information	 = 	DIA_Lothar_Hagen_Info;
	permanent    =  TRUE;
	description  = 	"¿Dónde puedo encontrar a lord Hagen?";
};
func int DIA_Lothar_Hagen_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Hagen_15_00"); //¿Dónde puedo encontrar a lord Hagen?
	AI_Output (self, other, "DIA_Lothar_Hagen_01_01"); //Está en el ayuntamiento, al final del barrio alto.
	AI_Output (self, other, "DIA_Lothar_Hagen_01_02"); //Pero no podrás entrar sin una buena razón.
};

// ***************************************************************
//							Oldworld Running
// ***************************************************************
instance DIA_Lothar_OWRunning (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunning_Condition;
	information	 = 	DIA_Lothar_OWRunning_Info;
	permanent    =  FALSE;
	description  = 	"Venía a ver a Lord Hagen...";
};
func int DIA_Lothar_OWRunning_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) == 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunning_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_53"); //Fui a ver a Lord Hagen...
	AI_Output (self ,other, "DIA_Lothar_Add_01_54"); //¿Y? No le molestarías con tus cuentos de dragones, ¿verdad?
	AI_Output (other, self, "DIA_Lothar_Add_15_55"); //Sí, lo hice...
	AI_Output (self ,other, "DIA_Lothar_Add_01_56"); //Dime que no es cierto...
	AI_Output (other, self, "DIA_Lothar_Add_15_57"); //Me ha mandado a que le consiga pruebas...
	AI_Output (self ,other, "DIA_Lothar_Add_01_58"); //Bueno, entonces que tengas suerte. (Para sí) Menudo lunático...
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							Oldworld Running UND Brief
// ***************************************************************
instance DIA_Lothar_OWRunningBrief (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunningBrief_Condition;
	information	 = 	DIA_Lothar_OWRunningBrief_Info;
	permanent    =  FALSE;
	description  = 	"¡Tengo la prueba! ¡Tengo una carta del comandante Garond!";
};
func int DIA_Lothar_OWRunningBrief_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunningBrief_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_59"); //¡Tengo la prueba! ¡Tengo una carta del comandante Garond!
	AI_Output (self ,other, "DIA_Lothar_Add_01_60"); //¿Así que es cierto lo de los dragones?
	AI_Output (self ,other, "DIA_Lothar_Add_01_61"); //He sido injusto contigo. Tendré que rezar a Innos para que perdone mi comportamiento.
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//								PERM
// ***************************************************************
instance DIA_Lothar_PERM (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_PERM_Condition;
	information	 = 	DIA_Lothar_PERM_Info;
	permanent    =  TRUE;
	description  = 	"¿Ha ocurrido algo excitante últimamente?";
};
func int DIA_Lothar_PERM_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PERM_Info ()
{
	AI_Output (other, self, "DIA_Lothar_PERM_15_00"); //¿Ha ocurrido últimamente algo interesante?
	if (other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_01"); //Sí, que dejan entrar a gente como tú. No había sucedido algo así en eones.
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_02"); //Tú deberías saberlo. Como miembro de la guardia, ¡tu deber es velar por la ley y el orden!
	}
	else //KdF oder NOV
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_03"); //No.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lothar_PICKPOCKET (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 900;
	condition	= DIA_Lothar_PICKPOCKET_Condition;
	information	= DIA_Lothar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lothar_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Lothar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lothar_PICKPOCKET);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_BACK 		,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};
	
func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};





