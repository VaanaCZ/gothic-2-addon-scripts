///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bengar_EXIT   (C_INFO)
{
	npc         = BAU_960_Bengar;
	nr          = 999;
	condition   = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bengar_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_HALLO		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	3;
	condition	 = 	DIA_Bengar_HALLO_Condition;
	information	 = 	DIA_Bengar_HALLO_Info;

	description	 = 	"¿Eres el granjero?";
};

func int DIA_Bengar_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //¿Eres el granjero?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //Podría decirse que sí, pero no soy más que un arrendatario.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //Todas las tierras son de un terrateniente.

};

///////////////////////////////////////////////////////////////////////
//	Info wovonlebtihr
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_WOVONLEBTIHR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Bengar_WOVONLEBTIHR_Condition;
	information	 = 	DIA_Bengar_WOVONLEBTIHR_Info;

	description	 = 	"¿Cómo os ganáis la vida?";
};

func int DIA_Bengar_WOVONLEBTIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_WOVONLEBTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //¿Cómo os ganáis la vida?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //Gracias a la caza y a la madera que cortamos. Por supuesto, también criamos ovejas y labramos la tierra.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Onar me endilga todos estos jornaleros y tengo que mantenerles ocupados. Solo unos pocos son buenos cazadores.

};


///////////////////////////////////////////////////////////////////////
//	Info tageloehner
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_TAGELOEHNER		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	6;
	condition	 = 	DIA_Bengar_TAGELOEHNER_Condition;
	information	 = 	DIA_Bengar_TAGELOEHNER_Info;

	description	 = 	"¿Empleas jornaleros?";
};

func int DIA_Bengar_TAGELOEHNER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_TAGELOEHNER_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //¿Empleas jornaleros?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Onar echa a los que no puede emplear en su granja.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //Me los manda y yo les doy de comer a cambio de trabajo.

};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bengar_MissingPeople_Info;

	description	 = 	"¿Te ha pasado algo inusual últimamente?";
};

func int DIA_Addon_Bengar_MissingPeople_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //¿Ha pasado algo raro por aquí últimamente?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //Están ocurriendo cosas muy extrañas.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Pero nada tan extraño como la misteriosa desaparición de Pardos.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //Es uno de mis jornaleros y no de los que lo dejarían todo de la noche a la mañana y se esfumarían sin más.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"El granjero Bengar echa en falta a su bracero Pardos."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "¿Alguna pista?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Quizá estuviera ya harto de todo.", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "¿Y qué tiene de extraño su desaparición?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //¿Y qué tiene de extraño su desaparición?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos es un tipo muy tímido: lo más lejos de la granja que se ha ido es al límite de mis tierras.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Si ve una simple sabandija, sale corriendo.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //No es que esos bichos sean muy bonitos, pero tampoco son nada peligrosos.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //(asqueado) Dicen que hay gente que se las come. Puag.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //Te acabas acostumbrando.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Quizá estuviera ya harto de todo.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //Trabajar en el campo era su vida. No puedo imaginarme que se haya ido a trabajar con otro granjero.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //Conmigo podía hacer lo que se le antojara.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //¿Alguna pista?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //Creo que esos bandidos han debido secuestrarlo. Llevan días rondando por esta zona.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Una vez los vi llevarse a un ciudadano de la ciudad a su campamento.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //Parecía que fueran a hacerlo esclavo.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "¿Dónde está el campamento de los bandidos?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //¿Dónde está el campamento de los bandidos?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Al final de mis tierras hay unas escalerillas que conducen a una pequeña hondonada. Allí es donde se han asentado.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //Me gustaría ir allí a buscar a Pardos, pero es imposible que yo me enfrente a esos tipos.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //Y más vale darles manga ancha. No se caracterizan por su sentido del humor.
	Bengar_ToldAboutRangerBandits = TRUE;
};
func void DIA_Addon_Bengar_MissingPeople_back ()
{
	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnPardos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_ReturnPardos		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_ReturnPardos_Condition;
	information	 = 	DIA_Addon_Bengar_ReturnPardos_Info;

	description	 = 	"¿Ha vuelto Pardos?";
};

func int DIA_Addon_Bengar_ReturnPardos_Condition ()
{
	if 	(MIS_Bengar_BringMissPeopleBack == LOG_RUNNING)
	&&  (Npc_GetDistToWP (Pardos_NW, "NW_FARM3_HOUSE_IN_NAVI_2") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //¿Ha vuelto Pardos?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Sí, está dentro, descansando. Gracias por todo lo que has
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //De nada.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //Espera, me gustaría recompensarte, pero no tengo
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_04"); //Olvídalo.
	
	B_GivePlayerXP (XP_Ambient);
};	

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_FernandosWeapons		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Bengar_FernandosWeapons_Info;

	description	 = 	"¿Los bandidos que pasaron por aquí llevaban armas?";
};

func int DIA_Addon_Bengar_FernandosWeapons_Condition ()
{
	if (Bengar_ToldAboutRangerBandits == TRUE)
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //¿Llevaban armas encima cuando pasaron por aquí los bandidos?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //¿Qué estupidez de pregunta es esa? ¿Cómo quieres que un bandido vaya desarmado?
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //Me refiero a muchísimas armas. Un envío.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Ah, vale. Sí, ahora que lo dices, iban muy cargados.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //Las llevaban en barriles, el bolsas y en el carro que traían.
	 B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info rebellieren
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_REBELLIEREN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	8;
	condition	 = 	DIA_Bengar_REBELLIEREN_Condition;
	information	 = 	DIA_Bengar_REBELLIEREN_Info;

	description	 = 	"¿Qué opinas de Onar?";
};

func int DIA_Bengar_REBELLIEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //¿Qué opinas de Onar?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //Es un cerdo avaricioso que conseguirá que nos ahorquen.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Un día de estos, por su culpa, los paladines saldrán de la ciudad y acabarán con nosotros.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Pero no me queda más remedio. Los milicianos solo vienen a recaudar y no a defender la granja.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Si permaneciera fiel a la ciudad, me quedaría solo.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Al menos Onar manda mercenarios de vez en cuando para ver cómo nos va.
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PALADINE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	9;
	condition	 = 	DIA_Bengar_PALADINE_Condition;
	information	 = 	DIA_Bengar_PALADINE_Info;

	description	 = 	"¿Qué tienes en contra de las tropas reales?";
};

func int DIA_Bengar_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_REBELLIEREN))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) 
		{
				return TRUE;
		};
};

func void DIA_Bengar_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //¿Qué tienes en contra de las tropas reales?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //Es evidente. Desde que los paladines están en la ciudad, no ha habido ninguna mejora. Todo lo contrario.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //Los malditos milicianos vienen a nuestras tierras cada vez con más frecuencia y rapiñan todo lo que pueden, y los paladines no hacen nada para impedirlo.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //Los únicos paladines que he visto son los dos guardias del desfiladero.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //No se moverían ni un milímetro, ni aunque la milicia nos masacrara.

};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PASS		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	10;
	condition	 = 	DIA_Bengar_PASS_Condition;
	information	 = 	DIA_Bengar_PASS_Info;

	description	 = 	"¿El desfiladero?";
};

func int DIA_Bengar_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Bengar_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //¿El desfiladero?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //Sí. El desfiladero que lleva al viejo Valle de las Minas junto a las cataratas al otro extremo de la pradera alta.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Pregúntale a Malak. La semana pasada fue un par de veces.

};

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZ (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_MILIZ_Condition;
	information	= DIA_Bengar_MILIZ_Info;
	permanent 	= FALSE;
	description	= "Se supone que tengo que encargarme del problema de la milicia.";
};

func int DIA_Bengar_MILIZ_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //Se supone que tengo que encargarme del problema de la milicia.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //¿Qué? Le pedí a Onar que me enviara un par de sus mercenarios.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //Esta es la oportunidad de demostrar mi valía.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //Estupendo. ¿Sabes lo que me hará la milicia si la cagas?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //Ya creía que no iba a venir nadie.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //Se lo dije a Onar hace días. ¿Para qué estoy pagando la renta?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Estos bastardos vienen una vez a la semana a recaudar los impuestos de la ciudad.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //Me alegro de que hayas venido en este preciso momento. Es cuando suelen venir.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //Llegarán en cualquier momento.
};

// ************************************************************
// 			  				Selber vorknöpfen
// ************************************************************
instance DIA_Bengar_Selber (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_Selber_Condition;
	information	= DIA_Bengar_Selber_Info;
	permanent 	= FALSE;
	description	= "¿Por qué no os enfrentáis a la milicia?";
};

func int DIA_Bengar_Selber_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Bengar_MilSuccess == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info ()
{
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Sois muchos. ¿Por qué no os enfrentáis a la milicia?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //Es verdad que somos muchos, pero carecemos de la instrucción de combate que tiene la milicia.
};		

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZKLATSCHEN		(C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZKLATSCHEN_Condition;
	information	= DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent	= FALSE;
	description	= "¡Que venga la milicia! ¡Yo me encargaré de ellos!";
};

func int DIA_Bengar_MILIZKLATSCHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_MILIZ))
	&& (!Npc_IsDead(Rick))
	&& (!Npc_IsDead(Rumbold))
	&& (Rumbold_Bezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //¡Que venga la milicia! ¡Yo me encargaré de ellos!
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Estoy impaciente. Aquí vienen. Ya te lo dije.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //¡No la fastidies!
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //¡Buena suerte! Dales una lección.
	};

	AI_StopProcessInfos (self);
				
	Npc_ExchangeRoutine	(self,"MilComing"); 
	
	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))
	{
		Npc_ExchangeRoutine	(Rick,"MilComing");
		AI_ContinueRoutine (Rick);
	};
	if (Hlp_IsValidNpc (Rumbold))
	&& (!Npc_IsDead (Rumbold))
	{		
		Npc_ExchangeRoutine	(Rumbold,"MilComing"); 
		AI_ContinueRoutine (Rumbold);
	};
};
	
// ************************************************************
// 			  				Miliz weg 
// ************************************************************
var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZWEG_Condition;
	information	= DIA_Bengar_MILIZWEG_Info;
	permanent	= TRUE;
	description	= "El problema con la milicia es algo del pasado.";
};

func int DIA_Bengar_MILIZWEG_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bengar_MILIZ))
	&& (Bengar_MilSuccess == FALSE)
	{
		if (Npc_IsDead (Rick) && Npc_IsDead (Rumbold))
		|| (Rumbold_Bezahlt == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //El problema con la milicia es algo del pasado.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //¿Estás loco? ¿Sabes lo que me harán esos tipos en cuanto te marches?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Siguen rondando por ahí. Diles que desaparezcan.
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //No está mal. A lo mejor ahora nos queda algo a fin de mes. Gracias.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Has querido pagarme y todo. Qué amable.
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
		};
		
		Bengar_MilSuccess = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info balthasar
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASAR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	13;
	condition	 = 	DIA_Bengar_BALTHASAR_Condition;
	information	 = 	DIA_Bengar_BALTHASAR_Info;

	description	 = 	"¿El pastor Balthasar no puede entrar en tu pradera?";
};

func int DIA_Bengar_BALTHASAR_Condition ()
{
	if 	(
		(MIS_Balthasar_BengarsWeide == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASAR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //¿El pastor Balthasar no puede entrar en tu pradera?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //Ah, sí. La dichosa historia. Le dije que Sekob tenía que pagarme si quería llevar las ovejas a la pradera.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //Lo cierto es que solo es una excusa. No soporto a Balthasar.
	B_LogEntry (TOPIC_BalthasarsSchafe,"Si quiero convencer a Bengar de que vuelva a dejar que Balthasar entre en sus pastos, le tendré que hacer un favor. Estoy seguro de que se presentará una oportunidad."); 
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info balthasardarfaufweide
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASARDARFAUFWEIDE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	14;
	condition	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;

	description	 = 	"La milicia ha desaparecido y Balthasar puede volver a usar tus tierras.";
};

func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bengar_BALTHASAR))
		&& (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
		&& (Bengar_MilSuccess == TRUE)
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //La milicia ha desaparecido y Balthasar puede volver a usar tus tierras.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //¿Por qué?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //(Amenazador) Porque lo digo yo.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Um. Vale, lo que tú digas.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //Déjale algún lugar para sus bichos detrás de la parcela.

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	15;
	condition	 = 	DIA_Bengar_PERMKAP1_Condition;
	information	 = 	DIA_Bengar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"Cuídate.";
};

func int DIA_Bengar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_BALTHASARDARFAUFWEIDE))
	&& (Kapitel < 3)
			{
					return TRUE;
			};
};

func void DIA_Bengar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //Cuídate.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Tú también.

	AI_StopProcessInfos (self);
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

INSTANCE DIA_Bengar_KAP3_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP3_EXIT_Condition;
	information	= DIA_Bengar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Allein
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_ALLEIN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	30;
	condition	 = 	DIA_Bengar_ALLEIN_Condition;
	information	 = 	DIA_Bengar_ALLEIN_Info;

	description	 = 	"¿Cómo van las cosas?";
};

func int DIA_Bengar_ALLEIN_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_ALLEIN_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //¿Cuál es la situación?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak ha desaparecido y se ha llevado a todos los que trabajaban para mí. Dijo que iba a las montañas.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //Ya no aguantaba más.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //Corren malos tiempos. No sé el tiempo que voy a resistirlo.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Todos los días las hordas de monstruos cruzan el desfiladero y acechan en la pradera alta. Está empezando a afectarme.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Si por lo menos contara con ayudantes o mercenarios...
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //Uno de ellos estaba dispuesto a trabajar para mí. No obstante, cambió de idea. Creo que se llamaba Wolf.
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar está solo en su granja. Su amigo, Malak, se ha ido y se ha llevado con él a los otros. Bengar cree que ha huido a las montañas."); 
	B_LogEntry (TOPIC_BengarALLEIN,"Ahora su granja está totalmente desprotegida. Necesita ayuda. Dijo algo de un mercenario que responde al nombre de Wolf."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Malaktot
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKTOT		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_MALAKTOT_Condition;
	information	 = 	DIA_Bengar_MALAKTOT_Info;

	description	 = 	"Malak ha muerto.";
};

func int DIA_Bengar_MALAKTOT_Condition ()
{
	if (Npc_IsDead(Malak))
	&& (Malak_isAlive_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKTOT_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak ha muerto.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //Entonces todo va a ir a peor.
};

///////////////////////////////////////////////////////////////////////
//	Info SLDda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_SLDDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_SLDDA_Condition;
	information	 = 	DIA_Bengar_SLDDA_Info;

	description	 = 	"He encontrado al mercenario que querías.";
};

func int DIA_Bengar_SLDDA_Condition ()
{
	if (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_SLDDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //He encontrado al mercenario que querías.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Jamás he visto nada parecido en mi granja. Espero que funcione.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Ten, toma esto. Creo que lo encontrarás útil.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);
	B_GivePlayerXP (XP_BengarsHelpingSLDArrived);
					
};

///////////////////////////////////////////////////////////////////////
//	Info Malakwiederda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKWIEDERDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	35;
	condition	 = 	DIA_Bengar_MALAKWIEDERDA_Condition;
	information	 = 	DIA_Bengar_MALAKWIEDERDA_Info;

	description	 = 	"Malak ha vuelto.";
};

func int DIA_Bengar_MALAKWIEDERDA_Condition ()
{
	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((MIS_GetMalakBack == LOG_SUCCESS)||(NpcObsessedByDMT_Malak == TRUE))
	&& ((Npc_IsDead(Malak))==FALSE)

		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKWIEDERDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak ha vuelto.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //Ya era hora. Creía que no iba a volverle a ver.
	B_GivePlayerXP (XP_GetMalakBack);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERM		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	80;
	condition	 = 	DIA_Bengar_PERM_Condition;
	information	 = 	DIA_Bengar_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Todo irá bien.";
};

func int DIA_Bengar_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_ALLEIN))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //Todo irá bien.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak vuelve a estar aquí, pero la situación apenas ha cambiado.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //A menos que suceda un milagro, vamos a morir todos.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Wolf es un tipo peculiar, pero funcionará.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Sin Malak, aquí ya no se trabaja. Si no sucede algo rápido, tendré que abandonar la granja.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Espero que vuelva pronto.
		};
	};
	AI_StopProcessInfos (self);
	
	if (Npc_IsDead(SLD_Wolf))
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	B_StartOtherRoutine	(SLD_815_Soeldner,"Start");
	B_StartOtherRoutine	(SLD_817_Soeldner,"Start");
	};
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

INSTANCE DIA_Bengar_KAP4_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP4_EXIT_Condition;
	information	= DIA_Bengar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Bengar_KAP5_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP5_EXIT_Condition;
	information	= DIA_Bengar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP5_EXIT_Info()
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


INSTANCE DIA_Bengar_KAP6_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP6_EXIT_Condition;
	information	= DIA_Bengar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bengar_PICKPOCKET (C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 900;
	condition	= DIA_Bengar_PICKPOCKET_Condition;
	information	= DIA_Bengar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bengar_PICKPOCKET_Condition()
{
	C_Beklauen (28, 50);
};
 
FUNC VOID DIA_Bengar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bengar_PICKPOCKET);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_BACK 		,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};
	
func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};


















































































