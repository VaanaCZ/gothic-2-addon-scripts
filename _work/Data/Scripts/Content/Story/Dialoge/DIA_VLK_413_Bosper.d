// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Bosper_EXIT   (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 999;
	condition   = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 							Hallo
// ***********************************************************
instance DIA_Bosper_HALLO		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr			 =  2;
	condition	 = 	DIA_Bosper_HALLO_Condition;
	information	 = 	DIA_Bosper_HALLO_Info;
	permanent    =  FALSE;
	important    =  TRUE;
};
func int DIA_Bosper_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Bosper_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //¡Bienvenido a mi tienda, extraño!
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Soy Bosper. Fabrico arcos y comercio con pieles.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //¿Qué te trae a Khorinis?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper fabrica arcos y comercia con pieles. Su tienda está en la puerta este, en la parte baja de la ciudad.");
};

// ***********************************************************
// 						 	IntoOV		//e1
// ***********************************************************
instance DIA_Bosper_IntoOV		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 1;
	condition	= DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent   = FALSE;
	description = "Necesito entrar en el barrio alto...";
};
func int DIA_Bosper_IntoOV_Condition ()
{	
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Bosper_IntoOV_Info ()
{
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Necesito entrar en el barrio alto...
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //¿Dónde los paladines? Olvídalo.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Aquí tienes que ser un ciudadano respetado. O, al menos, tener un trabajo decente.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //Al ser extraño, no tienes ninguna oportunidad de entrar.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //Ya lo he notado...
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Para conseguir acceso al barrio alto, tengo que convertirme en un ciudadano respetable o conseguir trabajo.");
};

// ***********************************************************
// 						 	SeekWork	//e1
// ***********************************************************
instance DIA_Bosper_SeekWork		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent   = FALSE;
	description = "Busco trabajo.";
};
func int DIA_Bosper_SeekWork_Condition ()
{	
	return TRUE;
};
func void DIA_Bosper_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SeekWork_15_00"); //¡Busco trabajo!
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Mm, un nuevo aprendiz no me vendría mal.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //El último que tenía dejó su trabajo hace dos días.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //Entonces, ¿sabes algo de caza?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Bueno...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Podría enseñarte a despellejar animales.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Te pagaré bien por cada piel que me traigas.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Puedo conseguirte algunas pieles, si te refieres a eso.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //¡Excelente! Tráeme todas las pieles de animales que puedas. Te las compraré a buen precio.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper está buscando un aprendiz nuevo. Podría empezar a trabajar con él.");	
 
};

// ***********************************************************
// 						 	LEHRLING	//e2 PERM
// ***********************************************************
// ----------------------
var int Bosper_HintToJob;
var int Bosper_StartGuild;
// ----------------------

instance DIA_Bosper_LEHRLING		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent   = TRUE;
	description = "¡Quiero ser aprendiz tuyo!";
};
func int DIA_Bosper_LEHRLING_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //¡Quiero ser aprendiz tuyo!

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //(Sonríe) ¡Genial! Parece que ya conoces los fundamentos.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad cree que eres un buen tipo.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Pero Harad no está convencido de tus habilidades.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Pero Harad dice que nunca te había visto.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben te dio su bendición. Yo no soy tan piadoso, pero no me importa.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben solo te dará su aprobación con la bendición de los dioses.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben no tiene ni idea de quién eres.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino dice que, por él, puedes empezar donde quieras.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino dice que se te acusa de un crimen aquí en la ciudad. Espero que sea algo sin importancia.
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Haz que se resuelva el problema.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino no ha oído hablar nunca de ti.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //Y Matteo dice que vales tu peso en oro.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //Y Matteo mencionó ciertas deudas. Sea lo que sea esto, será mejor que vayas a hablar con él.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matteo dice que todavía no ha hablado contigo sobre esto.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matteo dice que no te ha visto en su vida.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //¡Esto significa que tienes la aprobación de todos los maestros!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Ahora tienes la aprobación de cuatro maestros, suficiente para ser aceptado como aprendiz.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Puedes trabajar para mí cuando quieras.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "De acuerdo. Pensaré en ello.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "¡Estoy listo!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Necesitas la aprobación de, al menos, cuatro maestros para poder ser aceptado como aprendiz en la parte baja de la ciudad.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //Esto significa que deberías hablar con todos los que aún no han dado su aprobación.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Antes de aceptarte, necesito saber si realmente sirves para algo.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Recuperaste mi arco, pero eso no dice mucho sobre tu talento como cazador.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //¡Estoy listo!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //¡No lo lamentarás! Creo que trabajaremos muy bien, juntos.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper me ha aceptado como aprendiz. Ahora puedo entrar en el barrio alto.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //De acuerdo. Pensaré en ello.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //¡No tomes la decisión equivocada! Serías perfecto para mí.
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};
		
			
// ***********************************************************
// 						OtherMasters	 	//e2
// ***********************************************************
instance DIA_Bosper_OtherMasters (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent   = FALSE;
	description = "¿Y si quiero ir con alguno de los otros maestros?";
};
func int DIA_Bosper_OtherMasters_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //¿Y si quiero ir con alguno de los otros maestros?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //(Gruñendo) ¡Tonterías!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad y Matteo ya tienen aprendices.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Constantino el alquimista es un solitario y no ha tenido un aprendiz desde hace años.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //Y en cuanto a Thorben, todo el mundo sabe que está totalmente arruinado. Probablemente ni siquiera podría pagarte.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Yo, en cambio, necesito desesperadamente un aprendiz, y pago bien.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Pero no importa con quién quieras irte, necesitas igualmente la aprobación de todos los maestros de la parte baja de la ciudad...
	
	
	
};

// ***********************************************************
// 							Bartok	 	//e2
// ***********************************************************
instance DIA_Bosper_Bartok (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 4;
	condition	= DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent   = FALSE;
	description = "¿Por qué renunció tu aprendiz a su trabajo?";
};
func int DIA_Bosper_Bartok_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};
func void DIA_Bosper_Bartok_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //¿Por qué renunció tu aprendiz a su trabajo?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Lo único que dijo es que salir ahí fuera era cada vez más peligroso.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Si te interesa de verdad, puedes preguntárselo tú mismo.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Su nombre es Bartok. Probablemente estará por la taberna de Coragon.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Cruza el paso subterráneo que sale desde la herrería y saldrás directo.
};

// ***********************************************************
// 						ZUSTIMMUNG		 	//e3   PERM
// ***********************************************************

instance DIA_Bosper_ZUSTIMMUNG (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "¿Conseguiré tu aprobación para irme con otro maestro?";
};
func int DIA_Bosper_ZUSTIMMUNG_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info ()
{
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //¿Conseguiré tu aprobación para irme con otro maestro?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //(Decepcionado) Esperaba que me eligieras a mí.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Pero si es así como lo quieres...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //¿Eso significa que votarás por mí?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Si ningún otro maestro se opone, sí.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //Después de todo, recuperaste mi arco.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Pero, seguramente, habrías sido un buen cazador.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Bosper me dará su consentimiento si quiero empezar como aprendiz en cualquier lado.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //(Suspiro) ¡De acuerdo! Tendrás mi aprobación, pero con una condición.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Trabaja para mí. Al menos un poco de tiempo.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //De esa forma podrás comprobar por ti mismo si te gusta mi oficio o no.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //Y, ¿quién sabe?, quizá termine gustándote y te quedes conmigo.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //Si eres suficientemente bueno como para estar CONMIGO, también lo eres para estar con el resto.
		Bosper_HintToJob = TRUE;
	};	
};

// ***********************************************************
// 							Job		 	//e3
// ***********************************************************
instance DIA_Bosper_Job (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent   = FALSE;
	description = "¿Qué quieres que haga para ti?";
};
func int DIA_Bosper_Job_Condition ()
{	
	if (Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Job_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //¿Qué quieres que haga para ti?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Te enseñaré a despellejar a un animal y tú me traerás, digamos, media docena de pieles de lobo.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper me puede enseñar a despellejar animales.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Tráeme media docena de pieles de lobo.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Entonces sabré que has aprendido el oficio.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Si no tardas mucho y no destrozas las pieles, te aceptaré, si quieres.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //O (suspira) puedes empezar con uno de los otros maestros, si es lo que de verdad prefieres.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Le voy a llevar a Bosper seis pieles de lobo. Entonces podré trabajar con él o conseguir su consentimiento para que trabaje con uno de los otros maestros.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Debería hacer que me enseñara a despellejar animales.");
	};
};

// ***********************************************************
// 					Ich hab deine Felle	 	//e4
// ***********************************************************
instance DIA_Bosper_BringFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 102;
	condition	= DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent   = TRUE;
	description = "Sobre las pieles de lobo...";
};
func int DIA_Bosper_BringFur_Condition ()
{	
	if (MIS_Bosper_WolfFurs == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BringFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //Sobre las pieles de lobo...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //Ahora ya estás como aprendiz de otro maestro. Te compraré las pieles por su precio normal.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Aquí las tengo. Toma.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //¡Genial! Sabía que servirías para este trabajo.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //Aquí tienes el dinero que te prometí.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //¿Y? ¿Qué opinas? ¿No es éste mejor trabajo que aporrear espadas todo el día o llenar botellitas en una cámara polvorienta?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper me aceptará como aprendiz siempre que los demás maestros den su consentimiento.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Habíamos acordado media docena, pero aún te queda tiempo. Ve a por esas pieles.
	};

};

// ***********************************************************
// 							TeachFUR		 	//e4
// ***********************************************************
instance DIA_Bosper_TeachFUR (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent   = TRUE;
	description = "¡Enséñame a despellejar animales! (5 PA)";
};
func int DIA_Bosper_TeachFUR_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_Job))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_TeachFUR_Info ()
{
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //¡Enséñame a despellejar animales!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //De acuerdo. Atiende. En realidad es bastante fácil.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Coges una hoja afilada y abres el vientre del animal. Luego haces unas pequeñas incisiones en la parte interior de las patas, y puedes despellejarlo.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Tráeme las pieles de lobo y veremos...
			B_LogEntry (TOPIC_BosperWolf,"Bosper me ha enseñado a despellejar animales.");
		};
	};
};

// **************************************************************
// 							TRADE
// **************************************************************
instance DIA_Bosper_Trade		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  700;
	condition	 = 	DIA_Bosper_Trade_Condition;
	information	 = 	DIA_Bosper_Trade_Info;
	permanent	 = 	TRUE;
	description	 = 	"Enséñame tu mercancía.";
};
func int DIA_Bosper_Trade_Condition ()
{
	if (MIS_Bosper_WolfFurs != LOG_RUNNING)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	
	return TRUE;
};
func void DIA_Bosper_Trade_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Enséñame tu mercancía.
	
	if (DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv (self);
		//Joly: Mc ArrowBolt
		//////////////////////////////////////////////////////////////////////////////////////
		Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
		var int McBolzenAmount;
		McBolzenAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
		Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
		var int McArrowAmount;
		McArrowAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
		//////////////////////////////////////////////////////////////////////////////////////
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //No estás aquí para ojear mi mercancía. ¡Se supone que debes conseguirme esas pieles!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //¡Pues en marcha!
	};
};

// **************************************************************
// 						Von Bogen gehört
// **************************************************************
instance DIA_Bosper_BogenRunning (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  5;
	condition	 = 	DIA_Bosper_BogenRunning_Condition;
	information	 = 	DIA_Bosper_BogenRunning_Info;
	permanent	 = 	FALSE;
	description	 = "Me he enterado de que te han robado.";
};
func int DIA_Bosper_BogenRunning_Condition ()
{	
	if (MIS_Bosper_Bogen == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenRunning_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //Me he enterado de que te han robado.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //¿Quién te ha dicho eso? Seguro que Bartok, ¿eh? ¿No tenía nada mejor que contarte? En fin.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //Déjame decirte: ¡si atrapo a ese bastardo, que se prepare!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //Salí de la tienda solo un momento y, cuando volví, vi justo cómo se largaba con mi arco al hombro.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //Llamé a los guardias inmediatamente, pero el muy ruin corrió hacia el puerto y allí lo perdieron de vista.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //Les metí caña y buscaron por todo el distrito del puerto. Pero no encontraron nada.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //¡Esos fracasados arrastrados!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //Apuesto a que mi arco sigue en alguna parte de la ciudad. He informado a los guardias de las dos puertas y aún no han visto a nadie salir con mi arco.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //Cuando le ponga las manos encima a ese bastardo...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"A Bosper le habían robado un arco. El ladrón huyó al puerto, pero allí se le perdió la pista. La milicia ha buscado en el distrito del puerto pero no pudieron encontrar nada. A pesar de todo, el arco debe seguir en la ciudad.");
};

// **************************************************************
// 						Bogen gefunden
// **************************************************************
instance DIA_Bosper_BogenSuccess (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  6;
	condition	 = 	DIA_Bosper_BogenSuccess_Condition;
	information	 = 	DIA_Bosper_BogenSuccess_Info;
	permanent	 = 	FALSE;
	description	 = "Creo que este arco te pertenece...";
};
func int DIA_Bosper_BogenSuccess_Condition ()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenSuccess_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //Creo que este arco te pertenece...
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //¡Mi arco! ¿Dónde lo encontraste?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //En un oscuro agujero lleno de ratas.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //Espero que no te metieras en problemas...
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //No, ya había hecho antes este tipo de cosas.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //Mm, gracias de todas formas. ¡Te debo una!
	 
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems (self, ItRw_Bow_L_03_MIS,1); 
	
};

// **************************************************************
// 							PERM
// **************************************************************
//------------------------
	var int Bosper_Island;
//------------------------
instance DIA_Bosper_PERM		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  10;
	condition	 = 	DIA_Bosper_PERM_Condition;
	information	 = 	DIA_Bosper_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Cómo van las cosas por la ciudad?";
};
func int DIA_Bosper_PERM_Condition ()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};
func void DIA_Bosper_PERM_Info ()
{
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //¿Cómo van las cosas por la ciudad?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Si los orcos vienen de verdad a asediarnos, esto va a ponerse un poco feo.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Solo hay un barco y los paladines lo protegen. Y no creo que lo usen para rescatar a los ciudadanos.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //¿No hay otra forma de salir de aquí?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //No. Nadie puede salir de esta isla sin un barco.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //No hay nada nuevo, por el momento. Pásate más tarde.
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Bosper_MILKommentar;
	var int Bosper_PALKommentar;
	var int Bosper_INNOSKommentar;
// ----------------------------------

instance DIA_Bosper_AlsLehrling (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 1;
	condition   = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Bosper_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Bosper)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bosper_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Bosper_StartGuild != GIL_MIL)
	&& (Bosper_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Te animaste y te uniste a la milicia, ¿eh?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //No es que me importe. Mientras que, además de orcos y bandidos, me caces algún lobo. (Sonríe).
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Parece que tu carrera ha despegado como un cohete. ¡Paladín del rey!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //Vayas donde vayas a partir de ahora, no olvides a tu viejo maestro...
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Entraste en el monasterio, ¿eh? Espero que te dejen salir lo suficiente para que puedas seguir abasteciéndome de pieles...
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //¿Por dónde has andado tanto tiempo?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Necesito más pieles. ¿Has traído alguna?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //Aquí estás otra vez...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};
	
// *******************************************************
//				 Aufgaben als Lehrling
// *******************************************************	
instance DIA_Bosper_Aufgaben (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 1;
	condition	= DIA_Bosper_Aufgaben_Condition;
	information	= DIA_Bosper_Aufgaben_Info;
	permanent	= FALSE;
	description	= "¿Cuáles son mis tareas como aprendiz?";
};
func int DIA_Bosper_Aufgaben_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //¿Cuáles son mis tareas como aprendiz?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //Es fácil. Tráeme todas las pieles que puedas obtener.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Te las pagaré mejor que cualquiera de los otros comerciantes.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Aparte de eso, no hace falta que estés por la tienda. Me las arreglo bien yo solo.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //¿Y dónde se supone que voy a dormir?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Yo no tengo sitio para ti aquí. Están obligados a darte una cama en el hotel del mercado.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper pagará muy caras las pieles de animales.");
};

// *******************************************************
//				 		SellFur
// *******************************************************	
// -----------------------------
	var int Bosper_TrollFurSold;
// -----------------------------

instance DIA_Bosper_SellFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 600;
	condition	= DIA_Bosper_SellFur_Condition;
	information	= DIA_Bosper_SellFur_Info;
	permanent	= TRUE;
	description	= "Tengo unas cuantas pieles para ti...";
};
func int DIA_Bosper_SellFur_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_SellFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //Tengo unas cuantas pieles para ti...
	
	if (Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(other, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
	{
		
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait (self,3);
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur) );
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
		};
		
		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //¿Una piel de oveja? No te habrás cargado la oveja de un granjero mientras pastaba, ¿no?
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //Ni se me pasaría por la cabeza...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Piel de lobo, muy bien...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //¿Una piel de huargo? Esas bestias son duras...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //Ah, incluso una piel de bestia de sombra. Éstas son muy valiosas.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //¿Qué demonios es ESTA piel?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Se la arranqué a un troll.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //Ésa... ésa vale una pequeña fortuna.
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Otra enorme piel de troll... ¿estás intentando acabar con ellos?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //Cuando me encuentro con uno, aprovecho la oportunidad...
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //¡Y la piel de un troll negro, increíble!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Buen trabajo. Ven a verme de nuevo cuando tengas más...
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Pero ya sabes que solo estoy interesado en pieles de lobos, bestias de sombra y similares...
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Bosper_Minenanteil (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_Minenanteil_Condition;
	information	= DIA_Bosper_Minenanteil_Info;

	description = "Veo que tienes participaciones de la mina en venta.";
};   
                    
FUNC INT DIA_Bosper_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bosper_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Veo que tienes participaciones de la mina en venta.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Ejem. No sé nada de ellas. Puedes quedártelas, si quieres.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bosper_PICKPOCKET (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 900;
	condition	= DIA_Bosper_PICKPOCKET_Condition;
	information	= DIA_Bosper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Bosper_PICKPOCKET_Condition()
{
	C_Beklauen (67, 120);
};
 
FUNC VOID DIA_Bosper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bosper_PICKPOCKET);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_BACK 		,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};
	
func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};








