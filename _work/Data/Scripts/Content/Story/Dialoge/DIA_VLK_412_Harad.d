// *****************************************************
// 							EXIT 
// *****************************************************
INSTANCE DIA_Harad_EXIT   (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 999;
	condition   = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Harad_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Harad_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *****************************************************
// 							Hallo
// *****************************************************
instance DIA_Harad_Hallo		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 2;
	condition	= DIA_Harad_Hallo_Condition;
	information	= DIA_Harad_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
func int DIA_Harad_Hallo_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Harad_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Harad_Hallo_12_00"); //(Quejoso) ¿Qué quieres?
};

// *****************************************************
// 							Arbeit
// *****************************************************
instance DIA_Harad_Arbeit		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Arbeit_Condition;
	information	= DIA_Harad_Arbeit_Info;
	permanent   = FALSE;
	description = "Busco trabajo.";
};
func int DIA_Harad_Arbeit_Condition ()
{
	return TRUE;
};
func void DIA_Harad_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Harad_Arbeit_15_00"); //¡Busco trabajo!
	AI_Output (self, other, "DIA_Harad_Arbeit_12_01"); //Mm, un nuevo aprendiz no me vendría mal.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_02"); //Brian terminará pronto su aprendizaje y entonces se irá de la ciudad.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_03"); //¿Sirves para algo?
	AI_Output (other, self, "DIA_Harad_Arbeit_15_04"); //Si quieres decir que si conozco la forja...
	AI_Output (self, other, "DIA_Harad_Arbeit_12_05"); //No. No quiero decir eso.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_06"); //Tarde o temprano los orcos asediarán la ciudad, y entonces los únicos hombres que servirán de algo serán lo que puedan defender nuestra ciudad.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Harad_Arbeit_12_07"); //Y no voy a tomar a un aprendiz que me deshonre huyendo de la ciudad con las mujeres y los inútiles, en lugar de dar la cara con los hombres.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Si puedo convencer a Harad de que no soy un inútil, me aceptará como aprendiz.");
};

// *****************************************************
// 						MIS_Orc
// *****************************************************
instance DIA_Harad_Taugenichts (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Taugenichts_Condition;
	information	= DIA_Harad_Taugenichts_Info;
	permanent   = FALSE;
	description = "¡No soy un inútil!";
};
func int DIA_Harad_Taugenichts_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};
func void DIA_Harad_Taugenichts_Info ()
{
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_00"); //¡No soy un inútil!
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_01"); //¡Eso son palabras mayores! ¿Puedes apoyarlas con actos mayores?
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_02"); //¿Dónde quieres ir a parar?
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_03"); //Tráeme el arma de un orco.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_04"); //Se han visto orcos cerca de la ciudad. Con un poco de suerte, no tendrás que buscar mucho.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_05"); //Si consigues traerme una, te aceptaré como aprendiz.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_06"); //Siempre que los otros maestros lo aprueben.
	
	MIS_Harad_Orc = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HaradOrk,LOG_RUNNING);
	B_LogEntry (TOPIC_HaradOrk,"Hay un orco fuera de la ciudad. Harad, el herrero, quiere que lo mate. Un arma orca será evidencia suficiente.");
};

// *****************************************************
// 						Orc Running
// *****************************************************
instance DIA_Harad_OrcRunning (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcRunning_Condition;
	information	= DIA_Harad_OrcRunning_Info;
	permanent   = FALSE;
	description = "Hablemos de nuevo de eso del orco...";
};
func int DIA_Harad_OrcRunning_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	&& (Harad_HakonMission == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Harad_OrcRunning_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_15_00"); //Hablemos de nuevo de eso del orco...
	AI_Output (self, other, "DIA_Harad_OrcRunning_12_01"); //(Brusco) ¿Qué?
	
	Info_ClearChoices (DIA_Harad_OrcRunning);	
	Info_AddChoice (DIA_Harad_OrcRunning, "¡Tu orco está más que muerto!", DIA_Harad_OrcRunning_Done);
	Info_AddChoice (DIA_Harad_OrcRunning, "Un orco es un duro adversario...", DIA_Harad_OrcRunning_TooHard);

	//AI_Output (self, other, "DIA_Harad_OrcRunning_12_02"); //Ah, ich verstehe schon. Du hast Wichtigeres zu tun. Schon in Ordnung, die Sache hat sich erledigt.
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_00"); //Pero un orco es un duro adversario...
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_01"); //Mm, mirándote, podrías tener razón. No tienes mucha carne sobre tus huesos. Pero eso puede cambiar.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_02"); //En cualquier caso, debes demostrarme que tienes el valor para pelear.
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_03"); //¿Y no podría ser algo un poco más pequeño?
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_04"); //Mm... (Meditándolo) Hakon, el tratante de armas del mercado, me dijo que había sido atacado por unos bandidos hace pocos días.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_05"); //Se dice que los bastardos andan vagando por el exterior de la puerta este.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_06"); //Esos pícaros cobardes no deberían ser demasiado listos.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_07"); //¡Cázalos! A todos y cada uno. Entonces sabré que puedo usarte aquí en la ciudad.
	
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	
	if (MIS_HakonBandits != LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Lehrling, "Harad me contó que los bandidos robaron a Hakon, el mercader, en las afueras de la ciudad. Si puedo cazarlos, quedará convencido de que soy bueno. Debería tener unas palabras con Hakon. Puede que sepa algo más acerca del paradero de esos bandidos.");
	}
	else
	{
		B_LogEntry (TOPIC_Lehrling, "Harad me contó que los bandidos robaron a Hakon, el mercader, en las afueras de la ciudad. Si puedo cazarlos, quedará convencido de que soy bueno.");
	};
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_Done_15_00"); //¡Tu orco está más que muerto!
	AI_Output (self, other, "DIA_Harad_OrcRunning_Done_12_01"); //¡Bien! Entonces deja de malgastar tu aliento y haz que tus actos hablen por sí mismos.
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

// *****************************************************
// 						Orc Success
// *****************************************************
instance DIA_Harad_OrcSuccess (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcSuccess_Condition;
	information	= DIA_Harad_OrcSuccess_Info;
	permanent   = FALSE;
	description = "Tengo el arma de orco que querías.";
};
func int DIA_Harad_OrcSuccess_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	{
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_OrcSuccess_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcSuccess_15_00"); //Tengo el arma de orco que querías.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_01"); //Enséñamela...
	
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_01, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_02, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_03, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_04, 1);
		}
		else //if (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcSword_01, 1);
		};
	
	if (Harad_HakonMission == TRUE)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_02"); //¿POR FIN lo conseguiste? ¡Buen chico!
	};
	
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_03"); //Hace bastante que no tenía un arma como ésta en mis manos. Fui soldado en la guerra orca.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_04"); //Fueron tiempos difíciles, créeme.
	
	if (Player_IsApprentice == APP_Harad)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_05"); //Sabía que había un motivo para tomarte como aprendiz. ¡Bien hecho!
	}
	else if (Player_IsApprentice == APP_NONE) 
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_06"); //No creía que pudieras hacerlo. Estoy impresionado.
	}
	else //anderer Weg
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_07"); //Es una pena que hayas decidido seguir otro camino.
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_08"); //Me habrías venido muy bien.
	};
	
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP (XP_Harad_Orc);
	B_LogEntry (Topic_Lehrling,"Harad me aceptará como aprendiz si consigo la aprobación del resto de los maestros.");
};

// *****************************************************
// 						LEHRLING	(PERM)
// *****************************************************
var int Harad_StartGuild;
// ----------------------

instance DIA_Harad_LEHRLING (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_LEHRLING_Condition;
	information	= DIA_Harad_LEHRLING_Info;
	permanent   = TRUE;
	description = "¿Cuándo puedo empezar como aprendiz tuyo?";
};
func int DIA_Harad_LEHRLING_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Harad_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Harad_LEHRLING_15_00"); //¿Cuándo puedo empezar como aprendiz tuyo?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		// ------ Harad ------
		if (MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_01"); //Nos vendrá bien por aquí un tío que pueda cargarse a un orco.
			
			if (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_02"); //Además, Hakon me contó cómo arreglaste el tema de los bandidos. ¡Bien hecho!
			};
		}
		else //HakonBandits SUCCESS
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_03"); //No mataste a un orco, pero Hakon me contó cómo arreglaste el tema de los bandidos. ¡Bien hecho!
		};
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_04"); //Por lo que a mí concierne, puedes empezar inmediatamente.
				
		stimmen = stimmen + 1;
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_05"); //En cuanto a los otros maestros...
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_06"); //Thorben te ha dado su bendición.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_07"); //El viejo Thorben solo quiere que obtengas la bendición de los dioses. Creo que es una buena idea.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_08"); //Thorben dice que nunca ha hablado contigo.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_09"); //Bosper intentó quitármelo de la cabeza. Te quiere como aprendiz suyo.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_10"); //Tuve una breve pero intensa discusión con él sobre este asunto.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_11"); //Al final, aceptó.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_12"); //Me pidió que, al menos, le diera la oportunidad de interesarse en su profesión.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_13"); //Echa un vistazo. Siempre puedes decidirlo después. A no ser que no quieras su voto, claro.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_14"); //Y Bosper aún no te conoce.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_15"); //Como siempre, a Constantino le da todo lo mismo. Dijo que, por lo que a él respecta, puedes empezar donde quieras.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_16"); //Constantino dice que estás acusado de un crimen aquí en la ciudad. ¿Es eso cierto?
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_17"); //Si es así, ¡deberías resolver el tema inmediatamente!
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_18"); //Constantino no ha oído hablar nunca de ti.
		};
		
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_19"); //Y Matteo dice que le devolviste su oro. Me parece que eres un joven honorable.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_20"); //Y Matteo dice que aún le debes algo. No sé lo que hay entre vosotros, pero deberías resolver ese asunto.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_21"); //Y Matteo dice que nunca ha hablado de esto contigo.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_22"); //Y Matteo dice que nunca te ha visto en su tienda.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_23"); //¡Eso significa que tienes la aprobación de todos los maestros!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_24"); //Eso significa que tienes la aprobación de cuatro maestros, suficiente para ser aceptado como aprendiz.
			};
			
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_25"); //¿Estás preparado para comenzar tu aprendizaje conmigo?
			
			Info_ClearChoices (DIA_Harad_LEHRLING);
			Info_AddChoice (DIA_Harad_LEHRLING, "De acuerdo. Pensaré en ello.", DIA_Harad_LEHRLING_Later);
			Info_AddChoice (DIA_Harad_LEHRLING, "¡Estoy listo!", DIA_Harad_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_26"); //Necesitas la aprobación de, al menos, cuatro maestros para poder ser aceptado como aprendiz en la parte baja de la ciudad.
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_27"); //Así que deberías hablar con todos los que aún no estén convencidos de ti.
		};
	}
	else //Mission nicht erfüllt
	{
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_28"); //Pero no antes de que me hayas demostrado que sirves para algo.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_00"); //¡Estoy listo!
	AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_01"); //¡Bien! Te enseñaré a forjar una espada decente.
	
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_02"); //¡Eso ya sé hacerlo!
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_03"); //Bueno, ¡pues mucho mejor!
	};
	
	if (other.attribute[ATR_STRENGTH] < (T_MED-30))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_04"); //Además, es hora de que te pongas más cachas. ¡Estás desapareciendo ante mis propios ojos!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Harad_StartGuild = other.guild;
	
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("schmied", GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_LogEntry (Topic_Bonus,"Harad me ha aceptado como aprendiz. Ahora tengo acceso al barrio alto.");
	B_LogEntry (Topic_Bonus,"Harad comprará a buen precio las armas que forje.");
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_CityTeacher, "Harad puede enseñarme el arte de la herrería. También me puede ayudar a hacerme más fuerte.");
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_Later_15_00"); //De acuerdo. Pensaré en ello.
	if (!Npc_IsDead (Brian))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_Later_12_01"); //Tómate tu tiempo. Brian seguirá aquí durante un tiempo.
	};
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

// *****************************************************
// 						Zustimmung
// *****************************************************
instance DIA_Harad_Zustimmung		(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  2;
	condition	 = 	DIA_Harad_Zustimmung_Condition;
	information	 = 	DIA_Harad_Zustimmung_Info;
	permanent    =  TRUE;
	description	 = 	"¿Puedo hacerme aprendiz de otro maestro?";
};

func int DIA_Harad_Zustimmung_Condition ()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

//------------------------------------
var int DIA_Harad_Zustimmung_Permanent;
//------------------------------------

func void DIA_Harad_Zustimmung_Info ()
{
	AI_Output (other, self, "DIA_Harad_Zustimmung_15_00"); //¿Puedo hacerme aprendiz de otro maestro?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_01"); //Eres un buen tipo.
		if (MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_02"); //Hakon me contó cómo te ocupaste de los bandidos.
		};
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_03"); //Te doy mi aprobación.
		
		if (DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP (XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		B_LogEntry (Topic_Lehrling,"Harad dará su aprobación si quiero empezar como aprendiz en donde sea.");
		
		if (!Npc_IsDead(Brian))
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_04"); //Brian seguirá aquí durante un tiempo. Ya aparecerá algún chaval fuerte para ocupar su lugar.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_05"); //Los otros maestros podrán dar su aprobación, pero yo te daré la mía ¡solo cuando demuestres que sirves para algo!
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Harad_MILKommentar;
	var int Harad_PALKommentar;
	var int Harad_INNOSKommentar;
// ----------------------------------

instance DIA_Harad_AlsLehrling (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 1;
	condition   = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Harad_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Harad)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Harad_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Harad_StartGuild != GIL_MIL)
	&& (Harad_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_00"); //¿Ahora estás con la milicia? ¡Estoy orgulloso de ti!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_01"); //Naturalmente, mientras estés en el ejército no espero que cumplas tus deberes como aprendiz igual de bien.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_02"); //Pero si necesitas algo, puedes venir a hablar conmigo cuando quieras.
		Harad_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Harad_StartGuild != GIL_PAL)
	&& (Harad_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_03"); //¡Has conseguido ser aceptado en los paladines!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_04"); //Me alegro de haberte aceptado como aprendiz. Incluso aunque no pasaras mucho tiempo junto al yunque.
		
		Harad_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Harad_StartGuild != GIL_NOV)
	&& (Harad_StartGuild != GIL_KDF)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_05"); //Así que has entrado en el monasterio. Me habría gustado que te quedaras en la ciudad. Necesitamos a todos los hombres buenos.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_06"); //Pero si tuviste que seguir la llamada de Innos, así son las cosas.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_07"); //Si necesitas algo de mí, ya sabes dónde estoy.
		Harad_INNOSKommentar = TRUE;
	}
	
	else if (Harad_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Harad_MILKommentar == FALSE)
	&& (Harad_PALKommentar == FALSE)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_08"); //Hace bastante que no pasabas por aquí. ¿Por dónde has estado, eh?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_09"); //Aquí estás otra vez...
		Harad_Lehrling_Day = Wld_GetDay();
	};
};

// *****************************************************
// 					Verkaufst du Waffen?
// *****************************************************
instance DIA_Harad_Waffen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Waffen_Condition;
	information	 = 	DIA_Harad_Waffen_Info;
	permanent    =  FALSE;
	description	 = 	"¿También vendes armas?";
};
func int DIA_Harad_Waffen_Condition ()
{	
	if (Kapitel == 1)
	{
		return TRUE;
	};
};
func void DIA_Harad_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Waffen_15_00"); //¿También vendes armas?
	AI_Output (self, other, "DIA_Harad_Waffen_12_01"); //Olvídalo. Todo lo que hago va para los paladines o para la milicia.
	AI_Output (self ,other, "DIA_Harad_Add_12_00"); //Tengo un encargo de 100 espadas para lord Hagen. Quiere equipar a la guardia de la ciudad.
};

// *****************************************************
// 					Aufgaben als Lehrling
// *****************************************************
instance DIA_Harad_Aufgaben	(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  1;
	condition	 = 	DIA_Harad_Aufgaben_Condition;
	information	 = 	DIA_Harad_Aufgaben_Info;
	permanent    =  FALSE;
	description	 = 	"¿Cuáles son mis tareas como aprendiz?";
};

func int DIA_Harad_Aufgaben_Condition ()
{	
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};
func void DIA_Harad_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_00"); //¿Cuáles son mis tareas como aprendiz?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_01"); //Tienes tres intentos.
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_02"); //¿Forjar, forjar y forjar?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_03"); //No eres tan tonto como pareces. Pago por hoja. Si no trabajas, no hay dinero. Así de fácil.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_05"); //Más aún: te enseñaré todo lo que necesitas saber para hacer una espada normal.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_06"); //Hacer espadas mágicas es solo para los herreros experimentados. Y a ti aún te queda mucho para eso...
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_07"); //Si necesitas un sitio donde dormir, puedes apoltronarte por mi casa. ¿Todo claro por ahora?
};

// ************************************************************
// 						Klingen verkaufen
// ************************************************************
instance DIA_Harad_SellBlades (C_INFO)
{
	npc			 = VLK_412_Harad;
	nr			 = 200;
	condition	 = DIA_Harad_SellBlades_Condition;
	information	 = DIA_Harad_SellBlades_Info;
	permanent    = TRUE;
	description	 = "Quiero vender las armas que forje.";
};
func int DIA_Harad_SellBlades_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};
func void DIA_Harad_SellBlades_Info ()
{
	AI_Output (other, self, "DIA_Harad_SellBlades_15_00"); //Quiero vender las armas que forje.
	
	var C_ITEM equipWeap; equipWeap = Npc_GetEquippedMeleeWeapon(other);
	
	var int anzahl_common; anzahl_common = Npc_HasItems (other, ItMw_1H_Common_01);
	if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE) { anzahl_common = anzahl_common - 1; };
	var int anzahl_schwert1; anzahl_schwert1 = Npc_HasItems (other, ItMw_Schwert1);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) { anzahl_schwert1 = anzahl_schwert1 - 1; };
	var int anzahl_schwert4; anzahl_schwert4 = Npc_HasItems (other, ItMw_Schwert4);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE) { anzahl_schwert4 = anzahl_schwert4 - 1; };
	var int anzahl_rubinklinge; anzahl_rubinklinge = Npc_HasItems (other, ItMw_Rubinklinge);
	if (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE) { anzahl_rubinklinge = anzahl_rubinklinge - 1; };
	var int anzahl_elbastardo; anzahl_elbastardo = Npc_HasItems (other, ItMw_ElBastardo);
	if (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE) { anzahl_elbastardo = anzahl_elbastardo - 1; };
	
	var int gesamt; gesamt = (anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo);
	
    if (gesamt == 0)
	{
		if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) 
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE)  
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_01"); //La única que tienes es la de tu cinturón. Sería mejor que te la guardases.
		}
		else
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_04"); //¡Pues haz alguna! Solo aceptaré espadas normales.
		};
	}
	else //(gesamt >= 1) - die verbeliebenden Klingen verkaufen ------
	{
		AI_Output (self, other, "DIA_Harad_SellBlades_12_02"); //Bien, dame aquí.
		
		Npc_RemoveInvItems (other, ItMw_1H_Common_01, anzahl_common);
		Npc_RemoveInvItems (other, ItMw_Schwert1, anzahl_Schwert1);
		Npc_RemoveInvItems (other, ItMw_Schwert4, anzahl_Schwert4);
		Npc_RemoveInvItems (other, ItMw_Rubinklinge, anzahl_Rubinklinge);
		Npc_RemoveInvItems (other, ItMw_ElBastardo, anzahl_ElBastardo);
		
				var string concatText;
				concatText = ConcatStrings(IntToString(gesamt), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
				AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
				
		AI_Output (self, other, "DIA_Harad_SellBlades_12_03"); //Muy bien, y aquí tienes tu paga.
		var int lohn;
		lohn 	= (anzahl_common * Value_Common1)
				+ (anzahl_schwert1 * Value_Schwert1)
				+ (anzahl_schwert4 * Value_Schwert4)
				+ (anzahl_rubinklinge * Value_Rubinklinge)
				+ (anzahl_elbastardo * Value_ElBastardo);
				
		lohn 	= (lohn / 3);
		
		B_GiveInvItems (self, other, itmi_gold, lohn);
	};
};
	
// ************************************************************
// 						Weapon_Common Lehrer
// ************************************************************
func void B_Harad_TeachSmith()
{
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_01"); //Es bastante sencillo, chico. Toma una pieza de acero en bruto y ponlo en el fuego hasta que se ponga al rojo vivo.
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_02"); //Luego golpea la hoja y dale forma en el yunque.
};
// ------------------------------------------------------------
func void B_HaradSmithChoices()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
	Info_AddChoice	(DIA_Harad_TeachSmith, DIALOG_BACK, DIA_Harad_TeachSmith_BACK);
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_04))		,DIA_Harad_TeachSmith_Harad04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_03))		,DIA_Harad_TeachSmith_Harad03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_02))		,DIA_Harad_TeachSmith_Harad02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_01))		,DIA_Harad_TeachSmith_Harad01);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice	(DIA_Harad_TeachSmith, B_BuildLearnString("Aprender a forjar"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Harad_TeachSmith_Common);
	};
};
// ------------------------------------------------------------
instance DIA_Harad_TeachSmith (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  50;
	condition	 = 	DIA_Harad_TeachSmith_Condition;
	information	 = 	DIA_Harad_TeachSmith_Info;
	permanent    =  TRUE;
	description	 = 	"¡Enséñame a forjar una espada decente!";
};

func int DIA_Harad_TeachSmith_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Harad_TeachCommon_15_00"); //¡Enséñame a forjar una espada decente!
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
};
func void DIA_Harad_TeachSmith_Common()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_Common)
	{
		B_Harad_TeachSmith();
		AI_Output (self, other, "DIA_Harad_TeachCommon_12_03"); //Tus primeras espadas no serán obras maestras, pero puedes aprender todo lo demás más tarde.
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad01()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_01)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad02()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_02)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad03()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_03)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad04()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_04)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};

// ************************************************************
// 							STR Lehrer bis 50
// ************************************************************
// -------------------------
	var int Harad_Merke_STR;
// -------------------------	

INSTANCE DIA_Harad_TeachSTR (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 100;
	condition	= DIA_Harad_TeachSTR_Condition;
	information	= DIA_Harad_TeachSTR_Info;
	permanent	= 1;
	description = "¡Quiero hacerme más fuerte!";
};                       

FUNC INT DIA_Harad_TeachSTR_Condition()
{
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Harad_TeachSTR_Info()
{	
	AI_Output (other, self, "DIA_Harad_TeachSTR_15_00"); //¡Quiero hacerme más fuerte!
	
	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if (Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_01"); //Ya has cogido un poco de músculo.
	};

	if (other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_02"); //Regresa si quieres aprender más.
	};
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};

// ------ 5 Stärke ------
func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};




//############################
//##						##
//##		Kapitel 2		##
//##						##
//############################

// *****************************************************
// 					Immer noch
// *****************************************************
instance DIA_Harad_ImmerNoch (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_ImmerNoch_Condition;
	information	 = 	DIA_Harad_ImmerNoch_Info;
	permanent    =  FALSE;
	description	 = 	"¿Sigues trabajando para los paladines?";
};
func int DIA_Harad_ImmerNoch_Condition ()
{	
	if (Kapitel >= 2)
	{
		return TRUE;
	};	
};

func void DIA_Harad_ImmerNoch_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_01"); //¿Sigues trabajando para los paladines?
	AI_Output (self ,other,"DIA_Harad_Add_12_02"); //Terminé el encargo de lord Hagen.
	AI_Output (self ,other,"DIA_Harad_Add_12_03"); //Ahora estoy haciendo hojas con mineral mágico para él. Pero esta vez cobrando.
	AI_Output (self ,other,"DIA_Harad_Add_12_04"); //Pero también vuelvo a tener tiempo para hacer unas cuantas armas, aparte, para los comerciantes del mercado.
	AI_Output (self ,other,"DIA_Harad_Add_12_05"); //Así que, si estás buscando una buena hoja, deberías ir donde ellos.
};

// *****************************************************
// 					About Erzklingen
// *****************************************************
instance DIA_Harad_AboutErzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_AboutErzklingen_Condition;
	information	 = 	DIA_Harad_AboutErzklingen_Info;
	permanent    =  FALSE;
	description	 = 	"¡Cuéntame más cosas sobre las hojas de mineral mágico!";
};
func int DIA_Harad_AboutErzklingen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};	
};

func void DIA_Harad_AboutErzklingen_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_06"); //¡Cuéntame más cosas sobre las hojas de mineral mágico!
	AI_Output (self, other, "DIA_Harad_Waffen_12_02"); //Crear una hoja mágica es un proceso muy complicado y caro, pero el resultado es una hoja fácil de manejar y prácticamente indestructible.
	AI_Output (self, other, "DIA_Harad_Waffen_12_03"); //La hoja es ciertamente de buena calidad, pero solo mostrará su auténtico poder en manos de un paladín.
	AI_Output (self, other, "DIA_Harad_Waffen_12_04"); //La espada de un paladín está bendecida por Innos. Como resultado, la hoja mágica se convierte en un arma encantada ¡que causa daños incomparables!
};

// *****************************************************
// 					Ich möchte eine Erzklinge kaufen
// *****************************************************
instance DIA_Harad_Erzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Erzklingen_Condition;
	information	 = 	DIA_Harad_Erzklingen_Info;
	permanent    =  TRUE;
	description	 = 	"Quiero comprar una hoja de mineral mágico.";
};
func int DIA_Harad_Erzklingen_Condition ()
{	
	if (OreBladeBought == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};	
};

//---------------------------------------------

var int OreBladeBought;

//---------------------------------------------

func void DIA_Harad_Erzklingen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Erzklingen_15_00"); //Quiero comprar una hoja de mineral mágico.
	if (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_01"); //Solo puedo vender espadas mágicas a los paladines. Y, aún así, solo una a cada uno.
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_02"); //Vosotros los paladines no sabéis la suerte que tenéis de poder empuñar unas hojas tan excelentes.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_03"); //Por decreto de lord Hagen, solo puedo venderte una única arma mágica.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_04"); //Entonces, ¿qué puedo ofrecerte?
		
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Espada a dos manos (2000 de oro)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Espada a una mano (2000 de oro)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC void B_Harad_NotEnoughGold ()
{
	AI_Output (self ,other,"B_Harad_NotEnoughGold_12_00"); //No tienes oro suficiente.
};

FUNC VOID B_Harad_HaveFunWithYourSword ()
{
	AI_Output (self,other,"B_Harad_HaveGunWithYourSword_12_00"); //Cuida bien tu nueva arma. Cuesta una fortuna.
	
	OreBladeBought = TRUE;
	
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC VOID DIA_Harad_Erzklingen_2h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_2h_15_00"); //¡Me quedaré con la espada de dos manos!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_2H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_2H_1);
		CreateInvItems (self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_2H_Blessed_01,1);
	
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Espada a dos manos (2000 de oro)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Espada a una mano (2000 de oro)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_1h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_1h_15_00"); //¡Me quedaré con la espada a una mano!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_1H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_1H_1);
		CreateInvItems (self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_1H_Blessed_01,1);
		
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Espada a dos manos (2000 de oro)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Espada a una mano (2000 de oro)",DIA_Harad_Erzklingen_1h);
	};
};



//############################
//##						##
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Harad_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_RepairNecklace_Condition;
	information	 = 	DIA_Harad_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Puedes reparar joyas?";
};

func int DIA_Harad_RepairNecklace_Condition ()
{
	if 	((MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	 ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||    (MIS_SCKnowsInnosEyeIsBroken  == TRUE))) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_RepairNecklace_Info ()
{
	AI_Output (other,self ,"DIA_Harad_RepairNecklace_15_00"); //¿Puedes reparar joyas?
	AI_Output (self	,other,"DIA_Harad_RepairNecklace_12_01"); //Soy un herrero, no un orfebre. No creo que encuentres a nadie en la ciudad que pueda ayudarte.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_02"); //La gente ya no tiene dinero en los bolsillos y ya hace mucho que nadie se hace rico aquí.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_03"); //La mayoría se conforman con tener algo que comer.
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//	Wo finde ich einen Goldschmied?
//*********************************************************************
instance DIA_Harad_Goldsmith		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_Goldsmith_Condition;
	information	 = 	DIA_Harad_Goldsmith_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Dónde puedo encontrar un orfebre?";
};

func int DIA_Harad_Goldsmith_Condition ()
{
	if 	(Npc_KnowsInfo (other,DIA_Harad_RepairNecklace)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_Goldsmith_Info ()
{
	AI_Output (other,self ,"DIA_Harad_Goldsmith_15_00"); //¿Dónde puedo encontrar un orfebre?
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_01"); //Se supone que hay un buen artesano con los mercenarios, en la granja de Onar.
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_02"); //Quizá deberías mirar allí.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Harad_PICKPOCKET (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 900;
	condition	= DIA_Harad_PICKPOCKET_Condition;
	information	= DIA_Harad_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Harad_PICKPOCKET_Condition()
{
	C_Beklauen (14, 35);
};
 
FUNC VOID DIA_Harad_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Harad_PICKPOCKET);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_BACK 		,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};
	
func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};


