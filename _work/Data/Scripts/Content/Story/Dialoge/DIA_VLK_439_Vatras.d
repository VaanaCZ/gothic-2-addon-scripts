// *********************************************************
// 			  				EXIT
// *********************************************************
var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int Vatras_MORE;

///////////////////////////////////////////////////////////////////////
//	Info KillerWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_KillerWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_KillerWarning_Condition;
	information	 = 	DIA_Addon_Vatras_KillerWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_KillerWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 3)
	&& (MadKillerCount < 7)
	&& (VatrasPissedOffForever == FALSE)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Vatras_KillerWarning_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_00"); //Corren muchos rumores sobre ti en Khorinis.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_01"); //Dicen que estás implicado en asesinatos de gente inocente.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_02"); //Si eso es cierto, lo menos que puedo hacer es prevenirte. 
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_03"); //No abandones el sendero del equilibrio y la conservación de este mundo o sufrirás las consecuencias.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_04"); //Dime. ¿Qué puedo hacer para ayudarte?
};

///////////////////////////////////////////////////////////////////////
//	Info LastWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_LastWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_LastWarning_Condition;
	information	 = 	DIA_Addon_Vatras_LastWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_LastWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 7)
	&& (VatrasPissedOffForever == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_LastWarning_Info ()
{
	B_LastWarningVatras ();
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_06"); //¿Qué tienes que decir?

	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Bésame el culo.", DIA_Addon_Vatras_LastWarning_Arsch );	 
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Lo siento. No sabía lo que hacía.", DIA_Addon_Vatras_LastWarning_Reue );	 
};
func void DIA_Addon_Vatras_LastWarning_Arsch ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00"); //Déjame en paz.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00"); //Percibo remordimiento en tus palabras.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01"); //No me dejas elección.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff ();
};

func void DIA_Addon_Vatras_LastWarning_Reue ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00"); //Lo siento. No sabía lo que hacía.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00"); //Rezaré por ti y espero que recuperes pronto el juicio.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01"); //Y pobre de ti como me entere de que has participado en otro asesinato.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};

///////////////////////////////////////////////////////////////////////
//	Info PissedOf
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PissedOff		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_PissedOff_Condition;
	information	 = 	DIA_Addon_Vatras_PissedOff_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_PissedOff_Condition ()
{
	if (MadKillerCount > VatrasMadKillerCount)
	&& (Npc_KnowsInfo (other, DIA_Addon_Vatras_LastWarning))
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PissedOff_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_00"); //Tus palabras son tan falsas como tus hazañas.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_01"); //No vas a dejar de matar indiscriminadamente.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_02"); //No me dejas elección. 
	B_VatrasPissedOff ();
};

// ----------------------------
instance DIA_Vatras_EXIT   (C_INFO)
{
	npc         = VLK_439_Vatras;
	nr          = 999;
	condition   = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Vatras_EXIT_Info()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (Vatras_LaresExit == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_00"); //¡Espera!
		if (Vatras_GehZuLares == TRUE) 
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_01"); //Si ves a Lares
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_02"); //Me gustaría que me hicieras un favor.
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_03"); //Baja al puerto y encontrarás a un hombre llamado Lares.
			Vatras_GehZuLares = TRUE;
		};	
			
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_04"); //Dale este ornamento y dile que hay que devolverlo. Él sabrá lo que hacer con él.
		CreateInvItems (self, ItMi_Ornament_Addon_Vatras, 1);									
		B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);	
		
		Vatras_LaresExit = TRUE;
	};
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
	
	if (Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine  (VLK_455_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_454_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_428_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_450_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_426_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_421_Valentino,"VATRASAWAY");	
		
		Vatras_SchickeLeuteWeg = FALSE;
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Vatras_PICKPOCKET (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 900;
	condition	= DIA_Vatras_PICKPOCKET_Condition;
	information	= DIA_Vatras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       
func INT DIA_Vatras_PICKPOCKET_Condition()
{
	C_Beklauen (91, 250);
};
func VOID DIA_Vatras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Vatras_PICKPOCKET);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_BACK 		,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Vatras_PICKPOCKET_DoIt);
};
func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};
func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};



// *********************************************************
// 			  				Hallo
// *********************************************************
instance DIA_Vatras_GREET		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Vatras_GREET_Condition;
	information	 = 	DIA_Vatras_GREET_Info;

	important	 =  TRUE;
};
func int DIA_Vatras_GREET_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GREET_Info ()
{
	AI_Output (self, other, "DIA_Vatras_GREET_05_00"); //Que Adanos te acompañe.
	AI_Output (other, self, "DIA_Vatras_GREET_15_01"); //¿Quién eres tú?
	AI_Output (self, other, "DIA_Vatras_GREET_05_02"); //Soy Vatras, siervo de Adanos, el guardián el equilibrio terrestre y divino.
	AI_Output (self, other, "DIA_Vatras_GREET_05_03"); //¿Qué puedo hacer por ti?
};



// *********************************************************
// 		  				Brief abgeben
// *********************************************************
instance DIA_Addon_Vatras_Cavalorn		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Cavalorn_Condition;
	information	= DIA_Addon_Vatras_Cavalorn_Info;

	description	= "Toma, tengo una carta para ti.";
};
func int DIA_Addon_Vatras_Cavalorn_Condition ()
{
	if 	(
			(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon_Sealed) >=1)
			&& (MIS_Addon_Cavalorn_Letter2Vatras == LOG_RUNNING)
		)
		||	(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon)>=1) 
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Cavalorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Cavalorn_15_00"); //Toma, tengo una carta para ti.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_01"); //¿Para mí?
	
	if (SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon,1);
		AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_02"); //Sí, pero… está abierta. Espero que no haya caído en las manos equivocadas.
	};

	B_UseFakeScroll();
	
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_03"); //Pues sí. Se trata de un mensaje muy importante.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_04"); //¿Cómo llegó esta carta a tu poder?
	
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Se la quité a unos bandido.", DIA_Addon_Vatras_Cavalorn_Bandit );

	if (MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Del cazador Cavalorn.", DIA_Addon_Vatras_Cavalorn_Cavalorn );
	};

	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};
func void DIA_Addon_Vatras_Cavalorn_Bandit ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Bandit_15_00"); //Se la quité a unos bandido.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_01"); //(preocupado) Por Adanos. Eso no es bueno. Nada bueno.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_02"); //Si lo que dices es cierto, tenemos un serio problema.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_03"); //Me encargaré de esto lo antes que pueda.
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};
func void DIA_Addon_Vatras_Cavalorn_Cavalorn ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00"); //Me la dio Cavalorn, el cazador.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01"); //(sorprendido) ¿Cavalorn? ¿Y dónde está?
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02"); //Me pidió que te dijera que no lo ha conseguido y que se dirige al punto de encuentro. Tú sabrás qué significa.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03"); //Veo que te has ganado la confianza de Cavalorn. Eso dice mucho de ti.
	
	B_GivePlayerXP (XP_Addon_CavalornTrust);
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};

// ************************************************************
// 		Cavalorn Sent Me
// ************************************************************
var int Vatras_Why;
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CavalornSentMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_CavalornSentMe_Condition;
	information	= DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent	= FALSE;
	description	= "¡Me envía Cavalorn!";
};
func int DIA_Addon_Vatras_CavalornSentMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	&& (Vatras_Why == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CavalornSentMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_00"); //¡Me envía Cavalorn!
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_01"); //(astuto) ¿Y qué te ha dicho?
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_02"); //Que necesitaba urgentemente gente buena.
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_03"); //(sonríe) Ajá… ¿Y tú quieres UNIRTE a nosotros, hijo?
};

// ************************************************************
// 		Tell Me About RING 		(Trigger für MIS_Waffenhändler)
// ************************************************************
instance DIA_Addon_Vatras_TellMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_TellMe_Condition;
	information	= DIA_Addon_Vatras_TellMe_Info;
	permanent	= TRUE;

	description	= "Háblame del Anillo de Agua.";
};
func int DIA_Addon_Vatras_TellMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_TellMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_15_00"); //Háblame del 'Anillo de Agua'.

	if (!Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_01"); //(expectante) ¿Y por qué iba a hacerlo?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_02"); //Como aún no formas parte de nuestra comunidad, no te puedo contar TODO, claro está.
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_03"); //Pero te contaré lo que pueda.
		
		Info_ClearChoices (DIA_Addon_Vatras_TellMe);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, DIALOG_BACK, DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "¿A qué os dedicáis exactamente?", DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "¿Dónde están los otros Magos de Agua?", DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Entonces, ¿quiénes son miembros del Anillo de Agua?", DIA_Addon_Vatras_TellMe_WerNoch);
	};
};
func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_TellMe);
};
func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Philo_15_00"); //¿A qué os dedicáis exactamente?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_01"); //Estamos entre el orden de Innos y el caos de Beliar.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_02"); //Si uno de los dos superara al otro, significaría la pérdida de libertad total, o el caos infernal.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_03"); //Por ello, preservamos el equilibrio entre ambos. Hacemos que sea posible vivir en este mundo.
	
	if (MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "¿Y qué significa eso en términos prácticos?", DIA_Addon_Vatras_TellMe_Konkret);
	};
};
func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Konkret_15_00"); //(frunciendo el ceño) ¿Y eso qué significa en la práctica?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_01"); //La caída de la Barrera ha acarreado muchos peligros.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_02"); //Los bandidos son, probablemente, el más claro.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_03"); //Ahora no sólo es totalmente imposible atravesar la isla sin que te ataquen...
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_04"); //…¡sino que además, alguien los apoya en la ciudad!
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Add_05_00"); //Hemos descubierto que los bandidos reciben regularmente envíos de un mercader de armas de Khorinis. 
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_05"); //Intentamos desenmascarar a ese tipo de gente para proteger la ciudad.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_06"); //Si averiguas algo al respecto, dímelo.
	MIS_Vatras_FindTheBanditTrader = LOG_RUNNING;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"Hay un comerciante de armas en Khorinis que presta ayuda a los bandidos. Vatras quiere que investigue el asunto."); 
	B_LogEntry (TOPIC_Addon_BanditTrader,"Martin, maestro de provisiones de los paladines, está haciendo negocios con el comerciante de armas. Lo encontraré en el puerto, donde los paladines almacenan sus suministros."); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"El 'Anillo de Agua' se está ocupando de los bandidos en Khorinis."); 
};
func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_OtherKdW_15_00"); //¿Dónde están los otros Magos de Agua?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_01"); //Explorando las ruinas de una antigua cultura al noreste de Khorinis.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_02"); //Sospechamos que esas ruinas pueden esconder un pasaje a una parte de la isla inexplorada.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Los otros Magos de Agua están explorando las ruinas de una antigua cultura al noreste de Khorinis. Puede que haya una entrada a una zona desconocida de Khorinis."); 

	Info_AddChoice (DIA_Addon_Vatras_TellMe, "Háblame más de esa zona inexplorada.", DIA_Addon_Vatras_TellMe_Unexplored);
};
func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_00"); //Háblame más de esa zona inexplorada.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_01"); //Si te interesa unirte a la expedición, te podría enviar a Saturas con una carta.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_02"); //Sólo podrás participar si eres de los nuestros, claro está.
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_03"); //Por supuesto.
	B_LogEntry (TOPIC_Addon_KDW,"Vatras quiere que me haga miembro del 'Anillo de Agua' antes de unirme a la expedición de Magos de Agua."); 
};
func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_WerNoch_15_00"); //Entonces, ¿quiénes son miembros del Anillo de Agua?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_01"); //No puedo decírtelo hasta que no te unas al Anillo.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_02"); //Pero seguro que, a estas alturas, ya has conocido a unos cuantos.
};

// *********************************************************
// 		  				Wanna JOIN (+ Ex-Segen)
// *********************************************************
instance DIA_Addon_Vatras_WannaBeRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_WannaBeRanger_Condition;
	information	= DIA_Addon_Vatras_WannaBeRanger_Info;

	description	= "¡Quiero unirme al 'Anillo de Agua'!";
};
func int DIA_Addon_Vatras_WannaBeRanger_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WannaBeRanger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_00"); //¡Quiero unirme al 'Anillo de Agua'!
	
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_01"); //¿Sí? Eso significa que ya has cumplido el primer requisito.
		AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_02"); //¿Eso qué significa?
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_03"); //Que alguno de nosotros ha tenido que confiar en ti. Si no, no sabrías nada del Anillo.
	};
	
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_04"); //Pero si no sé nada de vosotros
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_03"); //Ich will dich wohl segnen, Fremder, aber ich kenne dich nicht. Erzähle mir was über dich.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_04"); //¿Qué quieres saber?
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_05"); //Bueno, podrías decirme de dónde vienes y por qué has venido a la ciudad.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_06"); //Traigo un importante mensaje para el líder de los paladines.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_07"); //¿Cuál es el mensaje?
		
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Han venido dragones...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Pronto ocurrirán cosas terribles.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00"); //Un gran ejército se está reuniendo mientras hablamos. Liderado por dragones y decidido a conquistar el país.
	
	if (Vatras_First == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01"); //Si eso es cierto, el equilibrio de la tierra quedará alterado. ¿Quién te dijo esto?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02"); //(Pensando) ¿Dragones? Hablas de seres que, hasta ahora, solo aparecen mencionados en leyendas. ¿Cómo te has enterado de esto?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Oh, había oído rumores por ahí...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Xardas el mago me lo contó...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_LIE_15_00"); //Pronto ocurrirán cosas terribles.
	
	if (Vatras_First == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_01"); //(Enfadado) Ajá. ¿Y quién te ha dicho esto?
	}
	else 
 	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_02"); //Cosas terribles, mmm... ¿cómo lo sabes?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Oh, había oído rumores por ahí...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Xardas el mago me lo contó...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = 2;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00"); //Xardas el mago me lo contó. Me envió a avisar a los paladines.
	
	if (Vatras_Second == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01"); //Conozco a este hombre y sé que es sabio y un gran maestro de la magia. ¿Y de dónde vienes?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02"); //El nigromante... Así que está vivo... (Lo considera) ¿y te ha enviado él? ¿Quién eres en realidad?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Solo soy un aventurero del sur...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Soy un antiguo convicto...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_LIE_15_00"); //Oh, he oído rumores por ahí...
	
	if (Vatras_Second == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_01"); //(Molesto) ¿Al menos recuerdas de dónde vienes?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_02"); //Ajá. Y por eso es por lo que has hecho este viaje. ¿Quién eres en realidad?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Soy un aventurero del sur...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Soy un antiguo convicto...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = 2;
};
func VOID B_Vatras_INFLUENCE_REPEAT()
{
	//RAUS wegen ADDON
	//AI_Output (other, self, "DIA_Vatras_INFLUENCE_REPEAT_15_00"); //Und, gibst du mir jetzt deinen Segen?	
	
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_01"); //Gut, fassen wir mal zusammen:
	
	if (Vatras_Third == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_02"); //Eres un ex-presidiario...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_03"); //Eres un aventurero del sur...
	};
	if (Vatras_Second  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_04"); //… al que Xardas el nigromante le ha dicho que...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_05"); //… que ha oído rumores que dicen que...
	};
	if (Vatras_First  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_06"); //… unos dragones vienen a conquistar el país.
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_07"); //… van a ocurrir cosas terribles.
	};
		
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_08"); //Y has venido a informar de esto a los paladines...
	if (Vatras_First   == TRUE)
	&& (Vatras_Second  == TRUE)
	&& (Vatras_Third   == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_09"); //Todo eso suena bastante fantástico, pero no puedo percibir que me estés mintiendo.
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_10"); //Por tanto, debo suponer que tus motivos son honorables.
		
		AI_Output (self, other, "DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11"); //Quiero brindarte la oportunidad de unirte al Anillo de Agua.
		
		Info_ClearChoices  (DIA_Addon_Vatras_WannaBeRanger);
	}
	else 
	{
		AI_Output (self, other, "DIA_Vatras_Add_05_00"); //Creo que hay algo que no me cuentas.
		AI_Output (self, other, "DIA_Vatras_Add_05_01"); //Si estás preocupado de que pueda contar lo que me digas, déjame convencerte.
		AI_Output (self, other, "DIA_Vatras_Add_05_02"); //He jurado mantener todos los secretos que se me confían.
		if (Wld_IsTime(05,05,20,10))
		{
			AI_Output (other, self, "DIA_Vatras_Add_15_03"); //¿Y qué hay de toda esta gente?
			AI_Output (self, other, "DIA_Vatras_Add_05_04"); //Ellos solo entienden la mitad de lo que PREDICO. Así que no te inquietes.
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_05"); //Empecemos por el principio. ¿Cuál es el mensaje?
		
		//ADDON - SC kann nicht mehr versagen!
		//Vatras_Chance = TRUE; 
		Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Han venido dragones...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Pronto ocurrirán cosas terribles.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
	
	//else-Fall raus - Addon
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_13"); //Ich habe dir jetzt zweimal die Chance gegeben, mir die Wahrheit zu sagen - aber du willst es anscheinend nicht. Ich werde dir meinen Segen nicht geben.
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00"); //Soy un antiguo convicto de la colonia penal de Khorinis.
	Vatras_Third = TRUE;
	
	B_Vatras_INFLUENCE_REPEAT();
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_LIE_15_00"); //Soy un aventurero del sur...
	Vatras_Third = FALSE;
		
	B_Vatras_INFLUENCE_REPEAT();
}; 
// ************************************************************
// 			  			How to JOIN
// ************************************************************
// ------------------------------------------------------------
// Was muß ich tun?
// ------------------------------------------------------------
instance DIA_Addon_Vatras_HowToJoin	(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_HowToJoin_Condition;
	information	= DIA_Addon_Vatras_HowToJoin_Info;

	description	= "¿Qué debo hacer para unirme al Anillo?";
};
func int DIA_Addon_Vatras_HowToJoin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_HowToJoin_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_00"); //¿Qué tengo que hacer para unirme al Anillo?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_01"); //Que sepas que unirte al Anillo es una gran responsabilidad.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_02"); //No pienso dejar entrar al primero que venga a pedirlo.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_03"); //Si quieres unirte al Anillo, tienes que demostrar que eres como uno de los nuestros.
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_04"); //¿Y eso quiere decir?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_05"); //Antes de dejar que un jovencito se una a nuestras filas, tiene que haber hecho una gran hazaña por el Anillo.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_06"); //Sólo entonces empezaré a pensarme que nos ayudes a conservar el equilibrio de las fuerzas en esta isla.
	
	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "¿Qué tipo de hazaña te convencería?", DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "He liberado a mucha gente. La Barrera ha caído.", DIA_Addon_Vatras_HowToJoin_FreedMen );
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "He vencido al Durmiente. ¿Te parece suficiente?", DIA_Addon_Vatras_HowToJoin_Sleeper );
};
func void DIA_Addon_Vatras_HowToJoin_Sleeper ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_Sleeper_15_00"); //He vencido al Durmiente. ¿Eso no es una gran hazaña?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_01"); //Oigo historias como esa todos los días.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_02"); //Incluida la historia de la derrota de una bestia llamada Durmiente.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_03"); //No me habían contado que lo hubiera hecho un solo hombre, pero veo en tu mirada que estás convencido de que lo hiciste.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_04"); //Eso me hace dudar, pero mis sentidos podrían engañarme alguna vez.
};
func void DIA_Addon_Vatras_HowToJoin_FreedMen ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00"); //He liberado a mucha gente. La Barrera ha caído.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01"); //Si DE VERDAD tú eres el responsable de ello
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02"); //El gran acontecimiento del Valle de Minas no sólo ha liberado a los Magos de Agua y otros ciudadanos honrados.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03"); //Todos los criminales del país están ahora en Khorinis, acosando a la población.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04"); //Los bandidos se han hecho con grandes territorios a las afueras de la ciudad. Ahora está imposible salir de la ciudad y volver sano y salvo.
};
func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00"); //¿Qué hazaña considerarías apropiada?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01"); //Khorinis se enfrenta a un gran enigma en estos días.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02"); //El número de personas desaparecidas de la ciudad aumenta día a día.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03"); //Si puedes explicarme qué ha sido de ellos, tendrás tu lugar asegurado en el 'Anillo de Agua'.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras sólo me dejará unirme al 'Anillo de Agua' si averiguo antes dónde está la gente desaparecida."); 

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_RUNNING;
	SC_HearedAboutMissingPeople = TRUE;

	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04"); //Pero
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05"); //¿Sí?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06"); //…antes tienes que llevar tu mensaje a los paladines.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07"); //¡Es un asunto de máxima importancia!
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08"); //Habla con Lord Hagen.
	
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras quiere que le lleve un mensaje importante a Lord Hagen."); 

	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
};
// ------------------------------------------------------------
// Hilf mir bei GILDE!
// ------------------------------------------------------------
instance DIA_Addon_Vatras_GuildBypass (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_GuildBypass_Condition;
	information	= DIA_Addon_Vatras_GuildBypass_Info;

	description	= "¡Pero Lord Hagen no va a recibirme!";
};
func int DIA_Addon_Vatras_GuildBypass_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_GuildBypass_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_15_00"); //¡Pero Lord Hagen no va a recibirme!
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_01"); //Sí, seguro que sí. SIEMPRE que entres antes a formar parte de una comunidad poderosa.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_02"); //El Anillo tiene buenos contactos.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_03"); //Te ayudaremos a transmitir tu mensaje lo antes posible.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_04"); //Tienes que contarle todo a Lares, en quien confío. Él te ayudará.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Para conseguir llegar hasta Lord Hagen, debo unirme a una de las poderosas comunidades de Khorinis."); 
	

	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Lo haré.", DIA_Addon_Vatras_GuildBypass_BACK );
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "¿A qué comunidad me debo unir?", DIA_Addon_Vatras_GuildBypass_WhichGuild);
};
func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_BACK_15_00"); //Lo haré.
	Vatras_GehZuLares = TRUE;
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
};
func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00"); //¿A qué comunidad me debo unir?
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01"); //Hay sólo tres comunidades con suficiente influencia.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02"); //La milicia de la ciudad, el monasterio de los Magos de Fuego y la tropa de mercenarios de la granja del terrateniente.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03"); //Tú eliges, hijo.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04"); //Lares te puede ayudar en esta delicada cuestión. Pregúntale.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Entre las comunidades poderosas están los MAGOS DE FUEGO, la MILICIA y los MERCENARIOS de la granja del propietario."); 
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Lo haré.", DIA_Addon_Vatras_GuildBypass_BACK );
};
// ------------------------------------------------------------
// Ranger NOW 	(MissingPeople ist hier schon Succes!!!)
// ------------------------------------------------------------
instance DIA_Addon_Vatras_NowRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_NowRanger_Condition;
	information	= DIA_Addon_Vatras_NowRanger_Info;
	permanent	= TRUE;

	description	= "¡Estoy preparado para unirme al Anillo de Agua!";
};
func int DIA_Addon_Vatras_NowRanger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (SC_IsRanger == FALSE)
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_NowRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_00"); //¡Estoy preparado para unirme al Anillo de Agua!
	AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_01"); //¿Has entregado tu mensaje a Lord Hagen?
	
	if (Kapitel >= 2) //Pass-Schlüssel von Hagen
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_02"); //Sí.
		if (MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_NowRanger_15_03"); //¡Pero me ha enviado al Valle de Minas para que le consiga pruebas de lo que digo!
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_04"); //TÚ debes decidir qué hacer ahora.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_05"); //Lo importante para mí es que le hicieras llegar el mensaje. Ahora él debe pensar si actuar o esperar a que lleves pruebas.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_06"); //Por lo que a ti respecta
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_07"); //Bien.
		};
		
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_08"); //Nos has demostrado que eres indispensable. Serás uno de nuestros hijos e irás por el mundo en nuestro nombre cumpliendo la voluntad de Adanos.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_09"); //Te confío este Anillo de Agua. Ojalá te ayude a encontrar aliados para conservar junto a ellos el equilibrio de este mundo.
		CreateInvItems (self, ItRi_Ranger_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Addon, 1);		
		if (hero.guild == GIL_KDF)
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_10"); //Eres el primer Mago de Fuego en nuestras filas. Me complace especialmente.
		};
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_11"); //Que Adanos te proteja. Y ahora ve a reunirte con tus hermanos.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_12"); //Te esperarán en la taberna 'La arpía feliz' para aceptarte en nuestra comunidad.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_13"); //Probablemente conozcas la taberna. Está de camino a la granja de Onar.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_14"); //No olvides llevar tu anillo, para que tus hermanos te reconozcan como uno de los suyos.
		
		B_LogEntry (TOPIC_Addon_RingOfWater,"Ahora pertenezco al 'Anillo de Agua' y voy a reunirme con mis hermanos en la taberna 'La arpía feliz'."); 

		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
		B_GivePlayerXP (XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_15"); //No. Aún no.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_16"); //Pues date prisa. Ve a verlo. ¡Seguro que tu mensaje es muy importante!
	};
};
// ------------------------------------------------------------
// NACH RangerMeeting
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CloseMeeting		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_CloseMeeting_Condition;
	information	= DIA_Addon_Vatras_CloseMeeting_Info;
	description = "Vengo de parte de los hermanos del 'Anillo'.";
};
func int DIA_Addon_Vatras_CloseMeeting_Condition ()
{
	if (Lares_TakeFirstMissionFromVatras == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CloseMeeting_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_CloseMeeting_15_00"); //Vengo de parte de los hermanos del 'Anillo'.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_01"); //¡Bien! ¡Te estaba esperando!
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_02"); //Te enviaré a través del portal junto con el resto de Magos de Agua.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_03"); //Tienes que seguir a Raven, antiguo Magnate del Mineral, y averiguar por qué se ha llevado a gente de Khorinis.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_04"); //Nosotros seguiremos aquí, intentando acabar con la amenaza de los bandidos.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_05"); //Llévale esta carta a Saturas. Él te dirá lo que tienes que hacer.
	if (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_CloseMeeting_05_08"); //Lares te llevará ante él, si aún no ha entregado el ornamento.
	};
	CreateInvItems (self, ItWr_Vatras2Saturas_FindRaven, 1);									
	B_GiveInvItems (self, other, ItWr_Vatras2Saturas_FindRaven, 1);	
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_06"); //Que Adanos te guíe.
		
	B_LogEntry (TOPIC_Addon_KDW,"Vatras me ha dado una carta para llevarle a Saturas. Tengo que atravesar el portal con los otros Magos de Agua y seguir la pista del antiguo Magnate del Mineral Raven."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Sklaven,"Voy a averiguar por qué Raven capturó a los ciudadanos de Khorinis."); 


	RangerMeetingRunning = LOG_SUCCESS; //Joly:Muss hier stehen!Sonst Chaos mit Rangern! -> Meeting
	B_SchlussMitRangerMeeting ();
	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// 			  			Missing People
// ************************************************************
// ------------------------------------------------------------
// MissingPeople PERM
// ------------------------------------------------------------
var int MISSINGPEOPLEINFO[20];
// ------------------------------------------------------------
instance DIA_Addon_Vatras_MissingPeople (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_MissingPeople_Condition;
	information	= DIA_Addon_Vatras_MissingPeople_Info;
	permanent	= TRUE;
	description	= "Sobre la gente desaparecida…";
};
func int DIA_Addon_Vatras_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};
var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;
func void DIA_Addon_Vatras_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_15_00"); //Sobre la gente desaparecida
	AI_Output (self, other, "DIA_Addon_Vatras_MissingPeople_05_01"); //¿Sí?
	
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice (DIA_Addon_Vatras_MissingPeople, DIALOG_BACK, DIA_Addon_Vatras_MissingPeople_BACK);
	if (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "¡Yo sé dónde están!", DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Deja que te cuente lo que sé…", DIA_Addon_Vatras_MissingPeople_Report);
	};
	
	if (DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "¿Dónde empiezo a buscarlos?", DIA_Addon_Vatras_MissingPeople_Wo);
	};
};
func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
};
func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HintMissingPeople_Wo_15_00"); //¿Dónde empiezo a buscarlos?
	AI_Output (self, other, "DIA_Addon_Vatras_HintMissingPeople_Wo_05_01"); //La mayoría ha desaparecido de la zona del puerto. Quizá deberías empezar por allí.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"La mayoría de la gente desapareció en el puerto de Khorinis. Allí empezaré a investigar."); 
	
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};
func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_00"); //Te diré lo que yo s
	
	 if ((MIS_Akil_BringMissPeopleBack != 0)
	 || (MIS_Bengar_BringMissPeopleBack != 0))
	 &&	(MISSINGPEOPLEINFO[1] == FALSE)
	 {
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_01"); //Los granjeros también han perdido a gente.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[1] = TRUE;
	 };
	
	if ((Elvrich_GoesBack2Thorben == TRUE)
	|| (Elvrich_SCKnowsPirats == TRUE)
	|| (SC_KnowsDexterAsKidnapper == TRUE))
	&& (MISSINGPEOPLEINFO[2] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_02"); //He descubierto que los bandidos son los responsables de las desapariciones de la zona.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[2] = TRUE;
	};

	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[3] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_03"); //Elvrich, el aprendiz del Maestro Thorben, me ha dicho que los bandidos se llevan por mar a los que secuestran en Khorinis.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	
	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[4] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_04"); //También hay piratas metidos en  el ajo. Aún no sé cuál es su papel exactamente.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[4] = TRUE;
	};	
	
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (MISSINGPEOPLEINFO[5] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_05"); //He rescatado a Elvrich de los bandidos.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	&& (MISSINGPEOPLEINFO[6] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_06"); //Los bandidos se llevaron a una chica llamada Lucía.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	
	if ((Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
	|| (MIS_LuciasLetter == LOG_SUCCESS))
	&& (MISSINGPEOPLEINFO[7] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_07"); //Lucía, la chica que secuestraron los bandidos, ha decidido unirse a ellos.
		if (MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_08"); //No parece que la hayan obligado a hacerlo, la verdad.
		};
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[7] = TRUE;
	};
		
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (MISSINGPEOPLEINFO[8] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_09"); //El líder de los bandidos se llama Dexter. Es el responsable de los secuestros.
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_10"); //Conocí a Dexter en la colonia penal. Él trabajaba entonces para el Magnate del Mineral Gómez.
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_11"); //Seguro que se acuerda de ti. Ve con cuidado.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[8] = TRUE;
	};

	if (Vatras_MissingPeopleReports != 0)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_12"); //Creo que estás sobre la pista. Sigue así.
		var int XP_Vatras_MissingPeopleReports;
		XP_Vatras_MissingPeopleReports = (XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports );
		B_GivePlayerXP (XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_13"); //¿Qué más has averiguado?
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_14"); //Nada importante, hasta ahora.
	};
};
func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_00"); //Sé dónde está la gente desaparecida.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_01"); //¿Qué sabes?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_02"); //Un hombre llamado Raven los llevó a todos a un lugar lejano de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_03"); //¿Por qué estás tan seguro?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_04"); //He leído sus órdenes. Tiene a bandidos locales trabajando para él.
	if (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	{	
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_05"); //Mira.
		B_UseFakeScroll ();
	};
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_06"); //Bien. Has hecho un buen trabajo. Creía que íbamos a tener que resignarnos a no saber nada.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Vatras_WhereAreMissingPeople);
};
// ------------------------------------------------------------
// Gefangene befreit
// ------------------------------------------------------------
instance DIA_Addon_Vatras_Free (C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Vatras_Free_Condition;
	information	 = 	DIA_Addon_Vatras_Free_Info;
	permanent	 =  FALSE;
	description	 = 	"¡Los desaparecidos han vuelto!";
};
func int DIA_Addon_Vatras_Free_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Free_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Free_15_00"); //Los desaparecidos han vuelto.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_01"); //Sí, gracias a ti. Su viaje ha llegado a buen puerto.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_02"); //Pero tu viaje debe continuar, así que marcha con la bendición de Adanos.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_03"); //(rezando) Adanos, bendice a este hombre. Ilumina su camino y concédele fuerza para afrontar los peligros.
	
	B_RaiseAttribute (other, ATR_MANA_MAX, 3);
	other.attribute[ATR_MANA]	   = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	
	Snd_Play ("Levelup");
	
	// ***Mike** Auskommentiert, weil FALSCHE funktion - bitte Rücksprache, bevor du's wieder änderst
	//var string concatText;
	//concatText = ConcatStrings (NAME_Bonus_ManaMax,IntToString (4));
	//PrintScreen (concatText, -1,-1,FONT_ScreenSmall,2); 
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_Waffen (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Waffen_Condition;
	information	= DIA_Addon_Vatras_Waffen_Info;
	permanent 	= TRUE;
	description = "Sobre el comerciante de armas…";
};
func int DIA_Addon_Vatras_Waffen_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_15_00"); //Sobre el comerciante de armas
	
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
	Info_AddChoice (DIA_Addon_Vatras_Waffen, DIALOG_BACK, DIA_Addon_Vatras_Waffen_BACK);
	if (Fernando_ImKnast == TRUE)
	|| (Fernando_HatsZugegeben == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "¡Sé quién ha estado vendiendo armas a los bandidos!", DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "¿Qué sabes del comerciante de armas hasta el momento?", DIA_Addon_Vatras_Waffen_ToMartin);
	};
};
func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
};
func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_ToMartin_15_00"); //¿Qué sabes del comerciante de armas?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_01"); //Pregúntale a Martin, el maestro de provisiones de los paladines. Él sabrá contarte más cosas.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_02"); //Le han encargado que desenmascare al comerciante de armas.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_03"); //Encontrarás a Martin en la zona del puerto. Si ves un montón de cajas, provisiones y paladines, Martin no andará lejos.
		
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_00"); //¡Sé quién ha estado vendiendo armas a los bandidos!
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_01"); //Se llama Fernando.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_02"); //Muy bien. ¿Y Martin ha tomado las medidas precisas para que no vuelva a realizar más envíos?
	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_Waffen_Success_15_03"); //Sí. Martín se ocupará de que pase una buena temporada entre rejas.
		AI_Output	(self, other, "DIA_Addon_Vatras_Waffen_Success_05_04"); //Bien hecho, hijo.

		if (Npc_KnowsInfo (other, DIA_ADDON_Vatras_WannaBeRanger))
		&& (SC_IsRanger == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_05"); //(descaradamente) ¿Eso significa que dejarás que me una al 'Anillo de Agua'?
			AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_06"); //(sonríe) ESO no fue lo que acordamos, y lo sabes.
		};
		
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_07"); //Que Adanos ilumine tu camino.
		
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_CaughtFernando_15_09"); //Aún no.
		AI_Output	(self, other, "DIA_Addon_Vatras_CaughtFernando_05_10"); //Pues date prisa e infórmalo enseguida. Hay que detenerlo de inmediato.
	};
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_WISP (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_WISP_Condition;
	information	= DIA_Addon_Vatras_WISP_Info;

	description = "¿Hay algo que pueda ayudarme en mi búsqueda?";
};
func int DIA_Addon_Vatras_WISP_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader != 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WISP_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_WISP_15_00"); //¿Hay algo que pueda ayudarme en mi búsqueda?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_01"); //Eres muy persistente, jovencito. Pero sí, se me ocurre algo que podría facilitarte las cosas.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_02"); //Te daré este amuleto de mineral. Seguro que le darás buen uso.
	CreateInvItems (self, ItAm_Addon_WispDetector, 1);									
	B_GiveInvItems (self, other, ItAm_Addon_WispDetector, 1);
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_03"); //Es un amuleto de la voluntad de la espiral penetrante.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_04"); //Hay muy pocos. La voluntad de la espiral que contiene este amuleto tiene propiedades especiales.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_05"); //Te puede ayudar a encontrar cosas que escapan a nuestra vista.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_06"); //Para invocarla, sólo tienes que llevarlo.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_07"); //Si pierde su poder o no puedes encontrarla, vuelve a ponerte el amuleto y reaparecerá.
	
	B_LogEntry (TOPIC_Addon_BanditTrader,"Vatras me ha dado un amuleto de voluntad de la espiral penetrante para encontrar al comerciante de armas."); 
	Log_CreateTopic (TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned); 
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned_NF); 

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_08"); //La voluntad de la espiral puede detectar armas.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_09"); //Te puede ser muy útil para investigar los envíos de armas a los bandidos.
	};

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_10"); //Cuídalo bien y nunca te fallará.

	Info_ClearChoices (DIA_Addon_Vatras_WISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "¡Gracias! Lo cuidaré como nadie.", DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "¿Puede hacer más cosas la voluntad de la espiral?", DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "¿Una voluntad de la espiral en un amuleto?", DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;	
};
func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Thanks_15_00"); //¡Gracias! Lo cuidaré como nadie.
	Info_ClearChoices (DIA_Addon_Vatras_WISP);
};
func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_MoreWISP_15_00"); //¿Puede hacer más cosas la voluntad de la espiral?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_01"); //¿Además de buscar armas de cuerpo a cuerpo? No, a menos que le enseñes.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_02"); //Creo que Riordian sabe cómo aleccionar a estas criaturas. Es uno de los nuestros y ahora viaja con Saturas.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_03"); //Tal vez él pueda decirte más.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Addon_BanditTrader,"Mi voluntad de la espiral penetrante no sólo sirve para buscar armas de combate a corto alcance. Riordian, el Mago de Agua, puede hacer que busque otros objetos."); 
	};
};
func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WISPDETECTOR_was_15_00"); //¿Una voluntad de la espiral en un amuleto?
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_01"); //Las voluntades de la espiral son criaturas admirables. Son de pura energía mágica.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_02"); //Están vinculadas al mineral mágico de este mundo. Es su origen. Les da su fuerza.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_03"); //No me sorprende que no hayas oído hablar de ellos. Sólo aparecen ante la persona que porta el mineral, a la que pertenecen.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_04"); //Las luces errantes han sido arrancadas de sus enclaves. Se dispondrán a atacar a cualquiera que se les acerque
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_05"); //No hay forma de ayudar a estas pobres criaturas. Más vale que te alejes de ellas.
};

// ********************************************************
// 			  			  STONEPLATES
// *********************************************************
// ---------------------------------------------------------
// About Stoneplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_Stoneplate (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_Stoneplate_Condition;
	information	= DIA_Addon_Vatras_Stoneplate_Info;

	description	= "Tengo esta tablilla de piedra…";
};

func int DIA_Addon_Vatras_Stoneplate_Condition ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Stoneplate_15_00"); //Tengo esta tablilla de piedra. ¿Puedes decirme algo al respecto?
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_01"); //Son objetos de la antigua cultura que llevamos tiempo investigando.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_02"); //Existen varios tipos. Algunas contienen información de la historia del antiguo pueblo.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_03"); //Y esas son justo las que me interesan. Tráeme todas las que puedas de esa clase.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_04"); //Sabré recompensarte como corresponde.

	Log_CreateTopic (TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Stoneplates, LogText_Addon_VatrasTrade); 
	
	Log_CreateTopic (TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, LogText_Addon_VatrasTrade);

};
// ---------------------------------------------------------
// Sell Stonplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_SellStonplate		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_SellStonplate_Condition;
	information	= DIA_Addon_Vatras_SellStonplate_Info;
	permanent 	= TRUE;
	description	= "Tengo más tablillas de piedra para ti…";
};
func int DIA_Addon_Vatras_SellStonplate_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_Stoneplate))
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_SellStonplate_Info ()
{
	var int anzahl; anzahl = Npc_HasItems (other, ItWr_StonePlateCommon_Addon);
	
	if (anzahl == 1)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_SellStonplate_15_00"); //Tengo otra tablilla de piedra para ti
	}
	else 
	{
		//Fixme Joly --> Hier SC-output "Hier.." oder ähnliche --Mike
	};
	
	B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, anzahl);
		
	AI_Output	(self, other, "DIA_Addon_Vatras_SellStonplate_05_01"); //¡Perfecto!
	
	if (anzahl >= 10)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_02"); //¡Aumentaré tu poder mágico!
		B_RaiseAttribute	(other, ATR_MANA_MAX, anzahl);
		Npc_ChangeAttribute	(other, ATR_MANA, anzahl);
	}
	else if (anzahl >= 5)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_04"); //Toma, unos pergaminos de conjuro como recompensa
		B_GiveInvItems (self, other, ItSc_InstantFireball, anzahl);
	}
	else // 1-4 Plates --> 2-5 Tränke
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_03"); //Toma, unas cuantas pociones como recompensa
		B_GiveInvItems (self, other, ItPo_Health_03, anzahl+1);
	};
	
	B_GivePlayerXP (XP_Addon_VatrasStonplate * anzahl);
};

// *********************************************************
// 			  			KLOSTER BYPASS
// *********************************************************
var int Vatras_SentToDaron;
// -----------------------------
instance DIA_Addon_Vatras_GuildHelp		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_GuildHelp_Condition;
	information	 = 	DIA_Addon_Vatras_GuildHelp_Info;

	description	 = 	"Lares dice que puedes ayudarme a entrar en el monasterio de los Magos de Fuego.";
};

func int DIA_Addon_Vatras_GuildHelp_Condition ()
{
	if (RangerHelp_gildeKDF == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_00"); //Lares dijo que podías ayudarme a entrar en el monasterio de los Magos de Fuego.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_01"); //¿Esa es tu elección? ¿El Camino del Fuego?
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_02"); //Sí, quiero convertirme en Mago de Fuego.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_03"); //Por lo que sé, aceptan novicios en su monasterio sin problema, así que ¿para qué quieres mi ayuda?

	if (SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_04"); //El novicio que hay en la puerta del monasterio quiere hacerme pagar un tributo para entrar. Una oveja y mucho oro.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_05"); //Lares me dijo que pedían un tributo a cualquiera que quisiera pasar al monasterio.
	};	
	
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_06"); //Yo no soy quién para darte acceso al monasterio. Soy Mago de Agua, ya sabes. Pero tengo buena relación con Daron, Mago de Fuego.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_07"); //Está casi siempre en el mercado, recogiendo limosna para su iglesia.
	Vatras_SentToDaron = TRUE;
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_08"); //Pero he oído que no ha ido sólo a conseguir fondos.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_09"); //Me habló de una estatuilla que le habían robado.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_10"); //Era muy importante para él. Seguro que te deja pasar al monasterio si la recuperas.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_11"); //Por supuesto, si decides finalmente no unirte al Círculo de Fuego, aún puedes entrar a formar parte del Anillo.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_12"); //Si demuestras tu valía, claro está.
	MIS_Addon_Vatras_Go2Daron = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron, Mago de Fuego del mercado, me ayudará a entrar en el monasterio si encuentro la estatuilla que le robaron. "); 
};


// ************************************************************
// ***														***
//							Gothic II 
// ***														***
// ************************************************************

// ============================================================
// MORE 	(Wegen der alten Scheiße...)
// ============================================================
instance DIA_Vatras_MORE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	998;
	condition	 = 	DIA_Vatras_MORE_Condition;
	information	 = 	DIA_Vatras_MORE_Info;
	permanent    =  TRUE;
	description	 = 	"(Más)";
};
func int DIA_Vatras_MORE_Condition ()
{
	if (Vatras_MORE == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MORE_Info ()
{
	Vatras_MORE = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info INFLUENCE (SEGEN)
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INFLUENCE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	92;
	condition	 = 	DIA_Vatras_INFLUENCE_Condition;
	information	 = 	DIA_Vatras_INFLUENCE_Info;
	permanent    =  FALSE;
	description	 = 	"Te pido tu bendición.";
};
func int DIA_Vatras_INFLUENCE_Condition ()
{
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	}; 
};
func void DIA_Vatras_INFLUENCE_Info ()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_00"); //Te pido tu bendición.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_01"); //¿Por qué iba a darte mi bendición, extraño?
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_02"); //Quiero ser aprendiz de uno de los maestros de la parte baja de la ciudad.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_11"); //¡Ve con la bendición de Adanos, hijo mío!
	Snd_Play ("LevelUp");
	B_GivePlayerXP (XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry (TOPIC_Thorben,"Vatras, el mago de agua, me ha bendecido.");
};

///////////////////////////////////////////////////////////////////////
//	Info WoKdF
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_WoKdF (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  93;
	condition	 = 	DIA_Vatras_WoKdF_Condition;
	information	 = 	DIA_Vatras_WoKdF_Info;
	permanent    =  FALSE;
	description	 = 	"¿Dónde puedo encontrar un sacerdote de Innos?";		
};

func int DIA_Vatras_WoKdF_Condition ()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Vatras_Segen == TRUE)
	&& (Vatras_SentToDaron == FALSE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_WoKdF_Info ()
{
	AI_Output (other, self, "DIA_Vatras_WoKdF_15_00"); //¿Dónde puedo encontrar un sacerdote de Innos?
	AI_Output (self, other, "DIA_Vatras_WoKdF_05_01"); //Lo mejor sería mirar por el mercado. Encontrarás un emisario del monasterio allí.
};

///////////////////////////////////////////////////////////////////////
//	Info Spende
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Spende (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  94;
	condition	 = 	DIA_Vatras_Spende_Condition;
	information	 = 	DIA_Vatras_Spende_Info;
	permanent    =  TRUE;
	description	 = 	"¡Quiero hacer una donación a Adanos!";
};

func int DIA_Vatras_Spende_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Spende_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Spende_15_00"); //¡Quiero hacer una donación a Adanos!
	AI_Output (self, other, "DIA_Vatras_Spende_05_01"); //Una donación a la iglesia de Adanos aliviaría una parte de los pecados que puedas haber cometido, hijo mío.
	AI_Output (self, other, "DIA_Vatras_Spende_05_02"); //¿Cuánto puedes dar?
	
	Info_ClearChoices   (DIA_Vatras_Spende);
	Info_AddChoice 		(DIA_Vatras_Spende, "Ahora mismo no tengo nada disponible...", DIA_Vatras_Spende_BACK);
	if (Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Tengo 50 monedas de oro...", DIA_Vatras_Spende_50);
	};
	if (Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Tengo 100 monedas de oro...",	DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output (other, self, "DIA_Vatras_Spende_BACK_15_00"); //Ahora mismo no tengo nada disponible...
	AI_Output (self, other, "DIA_Vatras_Spende_BACK_05_01"); //Eso no es problema. Puedes hacer efectivas tus buenas intenciones más tarde, hijo mío.
	Info_ClearChoices   (DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output (other, self, "DIA_Vatras_Spende_50_15_00"); //Tengo 50 monedas de oro...
	AI_Output (self, other, "DIA_Vatras_Spende_50_05_01"); //Te doy las gracias en nombre de Adanos, hijo mío. Tu dinero será repartido entre los necesitados.
	B_GiveInvItems (other, self, Itmi_Gold, 50);
	Info_ClearChoices   (DIA_Vatras_Spende);
};
	
func void DIA_Vatras_Spende_100()
{
	AI_Output (other, self, "DIA_Vatras_Spende_100_15_00"); //Tengo 100 monedas de oro...
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_01"); //¡Te bendigo en nombre de Adanos por este generoso acto!
	Snd_Play ("LevelUp");
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_02"); //¡Que el camino que sigas sea bendecido por Adanos!
	B_GiveInvItems (other, self, ITmi_Gold, 100);
	Vatras_Segen = TRUE;
	Info_ClearChoices   (DIA_Vatras_Spende);
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Thorben,"Vatras, el mago de agua, me ha bendecido.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_CanTeach		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  95;
	condition	 = 	DIA_Vatras_CanTeach_Condition;
	information	 = 	DIA_Vatras_CanTeach_Info;
	permanent    =  FALSE;
	description	 = 	"¿Puedes enseñarme algo sobre magia?";
};

func int DIA_Vatras_CanTeach_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_CanTeach_15_00"); //¿Puedes enseñarme algo sobre magia?
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_01"); //Solo los Elegidos de Innos y los Elegidos de Adanos tienen permiso para hacer magia rúnica.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_02"); //Pero los mortales comunes también pueden hacer magia con ayuda de pergaminos de conjuros.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_03"); //Puedo enseñarte a canalizar y expandir tus poderes mágicos.
	
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Vatras, el mago de agua, puede aumentar mis poderes mágicos.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Teach		(C_INFO)
{
	npc		  	 = 	VLK_439_Vatras;
	nr			 = 	100;
	condition	 = 	DIA_Vatras_Teach_Condition;
	information	 = 	DIA_Vatras_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero aumentar mis poderes mágicos.";
};
func int DIA_Vatras_Teach_Condition ()
{	
	if (Vatras_TeachMANA == TRUE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Teach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Teach_15_00"); //Quiero aumentar mis poderes mágicos.
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
};
func void DIA_Vatras_Teach_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output (self, other, "DIA_Vatras_Teach_05_00"); //Tu poder mágico ha crecido más de lo que yo puedo enseñarte.
	};
	Info_ClearChoices (DIA_Vatras_TEACH);
};
func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_TEACH_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info GODS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_GODS		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	98;	//Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_GODS_Condition;
	information	 = 	DIA_Vatras_GODS_Info;
	permanent	 =  TRUE;
	description	 = 	"Háblame de los dioses.";
};

func int DIA_Vatras_GODS_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GODS_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_15_00"); //Háblame de los dioses.
	AI_Output			(self, other, "DIA_Vatras_GODS_05_01"); //¿Qué te gustaría saber, exactamente?
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK);
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Innos.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Adanos.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Beliar.",DIA_Vatras_GODS_BELIAR); 		 
	 		 
};
FUNC VOID DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices (DIA_Vatras_GODS); 
};
FUNC VOID DIA_Vatras_GODS_INNOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_INNOS_15_00"); //Háblame de Innos.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_01"); //Muy bien. (Rezando) Innos es el primero y más poderoso de los dioses. Creó el sol y el mundo.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_02"); //Domina la luz y el fuego, sus regalos para la humanidad. Él es ley y justicia.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_03"); //Sus sacerdotes son los magos de fuego y los paladines son sus guerreros.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Innos.",DIA_Vatras_GODS_INNOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Adanos.",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Beliar.",DIA_Vatras_GODS_BELIAR); 	
	
};
FUNC VOID DIA_Vatras_GODS_ADANOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_ADANOS_15_00"); //Háblame de Adanos.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_01"); //Adanos es el dios del centro. Él es la medida de la justicia, el guardián del equilibrio entre Innos y Beliar.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_02"); //Domina el poder del cambio. Su regalo es el agua de todos los océanos, ríos y lagos.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_03"); //Sus sacerdotes son los magos del agua y yo soy servidor y sacerdote de Adanos.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 	
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Innos.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Adanos.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Beliar.",DIA_Vatras_GODS_BELIAR); 	

};
FUNC VOID DIA_Vatras_GODS_BELIAR()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_BELIAR_15_00"); //Háblame de Beliar.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_01"); //Beliar es el oscuro dios de la muerte, la destrucción y todas las cosas antinaturales.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_02"); //Está en eterno combate con Innos, pero Adanos mantiene el equilibrio entre ambos.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_03"); //Solo unos pocos humanos siguen la llamada de Beliar. Sin embargo, otorga un enorme poder a los que lo hacen.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Innos.",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Adanos.",DIA_Vatras_GODS_ADANOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Háblame de Beliar.",DIA_Vatras_GODS_BELIAR); 			 
	
};
///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HEAL		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	99;	//Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_HEAL_Condition;
	information	 = 	DIA_Vatras_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Puedes curarme?";
};

func int DIA_Vatras_HEAL_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_HEAL_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HEAL_15_00"); //¿Puedes curarme?
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_01"); //(De manera devota) Que Adanos bendiga este cuerpo. Que lo libre de sus heridas y lo fortalezca con nueva vida.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_02"); //No necesitas magia curativa en este momento.
	};	
};

// ********************************************************************
// 							Isgaroth Mission
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MISSION		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MISSION_Condition;
	information	= DIA_Vatras_MISSION_Info;
	
	important	= TRUE;
};
func int DIA_Vatras_MISSION_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Kapitel == 2)
	
	{
		return TRUE;
	};
};
func void DIA_Vatras_MISSION_Info ()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_10"); //Tengo un mensaje para el maestro Isgaroth. Él custodia la capilla frente al monasterio.
	AI_Output (self, other, "DIA_Vatras_MISSION_05_01"); //Si me haces este recado, podrás elegir tu propia recompensa.
	
	Info_ClearChoices   (DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Ahora no.",DIA_Vatras_MISSION_NO);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Claro.",DIA_Vatras_MISSION_YES);
};
FUNC VOID B_SayVatrasGo()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_13"); //Bien. Así que ahora ve a ver al maestro Isgaroth.
};
func VOID DIA_Vatras_MISSION_YES()
{
	AI_Output (other, self, "DIA_Vatras_MISSION_YES_15_00"); //Lo haré.
	AI_Output (self, other, "DIA_Vatras_Add_05_11"); //Bien, entonces lleva el mensaje y elige uno de estos pergaminos de conjuros.
	AI_Output (self, other, "DIA_Vatras_Add_05_12"); //Cuando hayas entregado el mensaje, te recompensaré adecuadamente.
	
	B_GiveInvItems (self, hero, ItWr_VatrasMessage,1); 
	MIS_Vatras_Message = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Botschaft,LOG_RUNNING);
	B_LogEntry (TOPIC_Botschaft,"Vatras me ha dado un mensaje para el maestro Isgaroth. Está en el altar que hay delante del monasterio.");
	
	Info_ClearChoices 	(DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Me llevaré el hechizo de luz.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Elijo el hechizo de curación.",DIA_Vatras_MISSION_HEAL);	
	Info_AddChoice 		(DIA_Vatras_MISSION,"Dame la flecha de hielo.",DIA_Vatras_MISSION_ICE);	
};
FUNC VOID DIA_Vatras_MISSION_NO ()
{	
	//AI_Output	(other, self, "DIA_Vatras_MISSION_NO_15_00"); //Such dir einen anderen Laufburschen, alter Mann!
	AI_Output (other, self, "DIA_ADDON_Vatras_MISSION_NO_15_00"); //¡Ahora no!
	AI_Output (self, other, "DIA_ADDON_Vatras_MISSION_NO_05_01"); //Sin problema. Enviaré a otra persona.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_HEAL()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_HEAL_15_00"); //Elijo el conjuro de curación.
	 B_SayVatrasGo();
	 
	B_GiveInvItems (self, hero,ItSc_LightHeal ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_ICE()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_ICE_15_00"); //Dame la flecha de hielo.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Icebolt ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_LIGHT()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_LIGHT_15_00"); //Me llevaré el conjuro de luz.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Light ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
///////////////////////////////////////////////////////////////////////
//	Info MESSAGE_SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MESSAGE_SUCCESS		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information	= DIA_Vatras_MESSAGE_SUCCESS_Info;
	
	description	= "He entregado tu mensaje.";
};

func int DIA_Vatras_MESSAGE_SUCCESS_Condition ()
{	
	if (MIS_Vatras_Message == LOG_RUNNING)
	&& (Vatras_Return == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MESSAGE_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Vatras_MESSAGE_SUCCESS_15_00"); //He entregado tu mensaje.
	AI_Output (self, other, "DIA_Vatras_Add_05_14"); //Acepta mi agradecimiento. Y ahora recoge tu recompensa.
	
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	
	Info_ClearChoices (DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 acedera.",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"Anillo de habilidad",DIA_Vatras_MESSAGE_SUCCESS_Ring);	
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 pepita de mineral.",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems (self, hero,ItPl_Perm_Herb ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems (self, hero,ItRi_Dex_01 ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems (self, hero,ItMI_Nugget ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

////////////////////////// Geht weg //////////////////////////////////
const int kurz = 0;
const int lang = 1;

var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg (var int dauer)
{
	// EXIT IF
	
	if (Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	
	//FUNC
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500)
	&& (Npc_WasInState (self, ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP (self);
		
		AI_Output (self, other, "DIA_Vatras_Add_05_06"); //¡Escuchad! Me necesitan en otro lugar.
		if (dauer == kurz)
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_07"); //No tardaré mucho. Cuando vuelva, te contaré el resto de la historia.
		}
		else //lang
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_08"); //No sé si volveré. Si quieres saber el final, lee la historia en las escrituras.
			
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_09"); //¡Que Adanos te acompañe!
		
		B_TurnToNpc (self, other);
	};
	
	Vatras_SchickeLeuteWeg = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info AbloesePre
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AbloesePre		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AbloesePre_Condition;
	information	 = 	DIA_Addon_Vatras_AbloesePre_Info;

	description	 = 	"Tengo un problema con el Ojo de Innos.";
};

func int DIA_Addon_Vatras_AbloesePre_Condition ()
{
	if ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE))
	&& (Kapitel == 3)
	&& (VatrasCanLeaveTown_Kap3 == FALSE)
	&& (RavenIsDead == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Vatras_AbloesePre_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_00"); //Tengo un problema con el Ojo de Innos. Necesitaría tu ayuda.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_01"); //¿Eso implicaría salir de la ciudad?
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_02"); //No lo sé. Probablemente.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_03"); //Llevo días esperando a que me releven. Los otros Magos de Agua deben de haber vuelto a Khorinis hace tiempo.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_04"); //Si te encargas de que al menos uno de ellos venga a ocuparse de mi trabajo, podré ayudarte a solucionar lo tuyo.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Vatras no puede ayudarme a solucionar mi problema con el 'Ojo de Innos' mientras no haya otro Mago de Agua que le sustituya en la ciudad."); 
};

///////////////////////////////////////////////////////////////////////
//	Info AddonSolved
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AddonSolved		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AddonSolved_Condition;
	information	 = 	DIA_Addon_Vatras_AddonSolved_Info;

	description	 = 	"Ha venido alguien a relevarte.";
};

func int DIA_Addon_Vatras_AddonSolved_Condition ()
{
	 if (RavenIsDead == TRUE)
	 {
		return TRUE;
	 };
};

func void DIA_Addon_Vatras_AddonSolved_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_00"); //Ha venido alguien a relevarte.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_01"); //¿Se han calmado las cosas más allá de las montañas del noreste?
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_02"); //Sí. Raven está muerto y ya no hay ninguna amenaza.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_03"); //Qué noticias tan buenas. Esperemos que ya no vuelva a pasar nada así.

	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_04"); //AHORA puedo ayudarte con tu problema.
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_05"); //Creo recordar que era algo del Ojo de Innos, ¿no?
	};
	VatrasCanLeaveTown_Kap3 = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info InnoseyeKaputt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INNOSEYEKAPUTT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information	 = 	DIA_Vatras_INNOSEYEKAPUTT_Info;

	description	 = 	"El Ojo de Innos está roto.";
};

func int DIA_Vatras_INNOSEYEKAPUTT_Condition ()
{
		if 	(	(Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE)	)
		&& (Kapitel == 3)
		&& (VatrasCanLeaveTown_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info ()
{
	if (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_00"); //Pyrokar me envió.
	}
	else if (MIS_Xardas_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_01"); //Xardas me envió.
	};

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);

	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_02"); //El Ojo de Innos está roto.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_03"); //Lo sé. Me he enterado de ello por unos novicios muy enfadados.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_04"); //Los Buscadores han usado el Círculo del sol de los magos de fuego para destruir el Ojo.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_05"); //Llamaría a esto una maniobra inspirada por el enemigo.

	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Las noticias se extienden deprisa en esta ciudad.", DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten );

	if (hero.guild == GIL_KDF)
	&& (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "¿Por qué Pyrokar decidió enviarme a ti?", DIA_Vatras_INNOSEYEKAPUTT_warumdu );
	};
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "¿Y ahora qué será del Ojo?", DIA_Vatras_INNOSEYEKAPUTT_Auge );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00"); //¿Y ahora qué será del Ojo?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01"); //Debemos recomponerlo. Pero me temo que no es una tarea fácil.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02"); //El engaste está roto en dos. Un herrero habilidoso debería ser capaz de repararlo.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03"); //Pero ése no es el auténtico problema. Es más bien la gema engastada lo que me preocupa.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04"); //Está deslucida y sin poder. El enemigo parece haber sabido exactamente cómo debilitarla.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "¿Dónde puedo encontrar un herrero capaz de reparar el engaste?", DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "¿Cómo puede recuperar la gema su poder?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00"); //¿Cómo puede recuperar la gema su poder?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01"); //Solo veo una forma. Una unión de las tres divinidades reinantes debería producir el efecto deseado.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02"); //Un ritual de inversión bien planeado, en el lugar de su destrucción, devolvería a la gema su fuego.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03"); //Sin embargo, el tema es que hay que traer a este lugar a un representante terrenal de cada uno de los tres dioses.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04"); //Más aún: se necesitará un montón de hierba de ciénaga para este ritual. Estimo que harán falta al menos 3 plantas.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "¿Quiénes podrían ser esos tres representantes terrenales de los dioses?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "¿Dónde puedo encontrar esta hierba de ciénaga?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00"); //¿Dónde puedo encontrar esta hierba de ciénaga?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01"); //Me han hablado de una vieja curandera de los bosques, llamada Sagitta. Supuestamente, vende esas hierbas.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02"); //Pero también podrías probar suerte en el puerto.
	

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00"); //¿Quiénes podrían ser esos tres representantes terrenales de los dioses?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01"); //Yo mismo representaré al dios Adanos.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02"); //Pyrokar, el mago de fuego de mayor rango, sería la persona adecuada para representar al dios Innos.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03"); //Pero en el caso de Beliar, no puedo pensar en un candidato apropiado. Debe ser alguien que domine la magia negra.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "¿Magia negra? ¿Y qué tal Xardas?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00"); //¿Magia negra? ¿Y qué tal Xardas?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01"); //Eso es. Podría funcionar.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02"); //Pero me pregunto cómo nos reunirás a los tres.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03"); //Puedo imaginarme la cara de Pyrokar cuando se entere de que tiene que cooperar con Xardas.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Tengo cosas que hacer.", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter );
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00"); //¿Dónde puedo encontrar a un herrero capaz de reparar el engaste del Ojo?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01"); //Pregunta por la zona y busca a alguien que sepa reparar joyas.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00"); //¿Por qué Pyrokar decidió enviarme a ti?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01"); //Sospechaba que, tarde o temprano, ocurriría algo así.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02"); //Pyrokar siempre se cree tan invulnerable y superior, que raya en el descuido.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03"); //Por tanto, sus precauciones al proteger el Ojo fueron también negligentes.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04"); //Creo simplemente que confía inconscientemente en las habilidades que Adanos me ha concedido.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05"); //No sirve de nada pensar en qué ocurriría si yo no estuviera disponible ahora.

};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00"); //Las noticias se extienden deprisa en esta ciudad.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01"); //Eso no está mal. El enemigo tampoco estará dormido.

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00"); //Tengo cosas que hacer.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01"); //Tendré que partir para preparar la ceremonia en el Círculo del sol.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02"); //Envía a Xardas y a Pyrokar para acá. Y no olvides traer la hierba de ciénaga. Cuento contigo.
	
	B_LogEntry (TOPIC_INNOSEYE, "Vatras quiere que realice un ritual en el círculo del sol para sanar el Ojo. Tengo que convencer a Xardas y a Pyrokar para que tomen parte en él. También tengo que encontrar un herrero que pueda reparar el engaste roto del amuleto.");

	MIS_RitualInnosEyeRepair = LOG_RUNNING;
	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine	(self,"RITUALINNOSEYEREPAIR");

	
	// ------ Zuhörer weg -------
		B_Vatras_Geheweg (kurz);
	// --------------------------
	
	//Joly: Weg mit den Ritualdementoren!!!!!

	DMT_1201.aivar[AIV_EnemyOverride] = TRUE;	//Joly: Damit sie erstmal nicht die Welt entvölkern, ohne Zutun des Spielers!!!!!
	DMT_1202.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1203.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1204.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1205.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1206.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1207.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1208.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1209.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1210.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1211.aivar[AIV_EnemyOverride] = TRUE;

	B_StartOtherRoutine (DMT_1201 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1202 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1203 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1204 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1205 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1206 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1207 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1208 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1209 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1210 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1211 ,"AfterRitual");
};
///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_RitualInnosEyeRepair		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_RitualInnosEyeRepair_Condition;
	information	 = 	DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Cómo van las cosas con el Ojo de Innos?";
};

func int DIA_Vatras_RitualInnosEyeRepair_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_RitualInnosEyeRepair_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_RitualInnosEyeRepair_15_00"); //¿Cómo van las cosas con el Ojo de Innos?
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_01"); //Recuerda: solo un ritual de inversión en el Círculo del sol junto a Xardas y a Pyrokar restaurará el Ojo.
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_02"); //Y no olvides traer el Ojo con su engaste reparado.
};

///////////////////////////////////////////////////////////////////////
//	Info Beginn
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_BEGINN		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	31;
	condition	 = 	DIA_Vatras_BEGINN_Condition;
	information	 = 	DIA_Vatras_BEGINN_Info;

	description	 = 	"He hecho todo lo que me dijiste que hiciera.";
};

func int DIA_Vatras_BEGINN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_GetDistToWP(self,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Xardas,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Pyrokar,	"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
		&& (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Vatras_BEGINN_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_00"); //Hice todo lo que mandaste. Aquí está el Ojo reparado.
	B_GivePlayerXP (XP_RitualInnosEyeRuns);

	B_GiveInvItems 		(other, self, ItMi_InnosEye_Broken_MIS, 1);
	Npc_RemoveInvItem 	(self, ItMi_InnosEye_Broken_MIS);

	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_01"); //Muy bien. Ya no falta nada para la ejecución del ritual.
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_02"); //¿Qué hay de la hierba de ciénaga?
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_03"); //Ah, sí. ¿Entonces tienes 3 plantas de hierba de ciénaga?
	
	if (B_GiveInvItems (other, self, ItPL_SwampHerb,3))
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_04"); //Esto... Sí. Aquí están las 3 plantas.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_05"); //Excelente.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_06"); //Es una pena, pero no.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_07"); //De acuerdo. Entonces tendremos que arreglárnoslas sin ellas.
	};
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_08"); //Lo has hecho muy bien, pero ahora hazte a un lado para que podamos comenzar con la ceremonia. Que nuestros espíritus se unan.
 	
	Info_ClearChoices	(DIA_Vatras_BEGINN);
	Info_AddChoice	(DIA_Vatras_BEGINN, DIALOG_ENDE, DIA_Vatras_BEGINN_los );

};
func void DIA_Vatras_BEGINN_los ()
{
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 	
 	Npc_ExchangeRoutine	(self,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk (self,60);

	RitualInnosEyeRuns = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info augeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_AUGEGEHEILT_Condition;
	information	 = 	DIA_Vatras_AUGEGEHEILT_Info;
	important	 = 	TRUE;
};

func int DIA_Vatras_AUGEGEHEILT_Condition ()
{
	if (Kapitel == 3)
		&& (RitualInnosEyeRuns == LOG_RUNNING)
		&& (Npc_RefuseTalk(self) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Vatras_AUGEGEHEILT_Info ()
{
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_00"); //Ya está. Hemos conseguido abortar el plan de enemigo y restaurar el Ojo.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_01"); //Deja que Pyrokar te explique cómo usar su poder.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_02"); //Espero verte de nuevo, cuando hayas cumplido tu misión. Hasta pronto.
 	
 	B_LogEntry (TOPIC_INNOSEYE, "El Ojo ha sido sanado. Pyrokar me lo dará y luego iré a cazar dragones.");
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 
 	RitualInnosEyeRuns = LOG_SUCCESS;
 	MIS_RitualInnosEyeRepair = LOG_SUCCESS;	
 
	B_StartOtherRoutine   (Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine   (Xardas, "RitualInnosEyeRepair");
	
	B_StartOtherRoutine  (VLK_455_Buerger,"START");
	B_StartOtherRoutine  (VLK_454_Buerger,"START");
	B_StartOtherRoutine  (VLK_428_Buergerin,"START");
	B_StartOtherRoutine  (VLK_450_Buerger,"START");
	B_StartOtherRoutine  (VLK_426_Buergerin,"START");
	B_StartOtherRoutine  (VLK_421_Valentino,"START");
};



///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_PERMKAP3		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_PERMKAP3_Condition;
	information	 = 	DIA_Vatras_PERMKAP3_Info;

	description	 = 	"Gracias por ayudar a arreglar el Ojo de Innos.";
};

func int DIA_Vatras_PERMKAP3_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_PERMKAP3_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_PERMKAP3_15_00"); //Gracias por ayudar a arreglar el Ojo de Innos.
	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_01"); //No seas tan abundante con tus agradecimientos. Tu tarea más importante aún te aguarda.

	if (MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_02"); //Habla con Pyrokar. Él te explicará todo lo demás.
	};

	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_03"); //Espero volver a verte de una pieza, hijo mío.

};

///////////////////////////////////////////////////////////////////////
//	Info HildaKrank
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HILDAKRANK		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	34;
	condition	 = 	DIA_Vatras_HILDAKRANK_Condition;
	information	 = 	DIA_Vatras_HILDAKRANK_Info;

	description	 = 	"Hilda, la hija de Lobart, está enferma.";
};

func int DIA_Vatras_HILDAKRANK_Condition ()
{
	if (MIS_HealHilda == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Vatras_GREET))
		{
				return TRUE;
		};
};

func void DIA_Vatras_HILDAKRANK_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HILDAKRANK_15_00"); //Hilda, la hija de Lobart, está enferma.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_01"); //¿Qué? ¿Otra vez? Esa buena mujer debería cuidarse mejor.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_02"); //Un invierno duro y ya no estará entre nosotros. De acuerdo, le daré una medicina para bajar la fiebre.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_03"); //Esto, ya de paso, podrías beneficiártela.
	CreateInvItems (self, ItPo_HealHilda_MIS, 1);									
	B_GiveInvItems (self, other, ItPo_HealHilda_MIS, 1);					
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_OBSESSION		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	35;
	condition	 = 	DIA_Vatras_OBSESSION_Condition;
	information	 = 	DIA_Vatras_OBSESSION_Info;

	description	 = 	"Tengo una sensación trepidante.";
};

func int DIA_Vatras_OBSESSION_Condition ()
{
	if (SC_IsObsessed == TRUE)
	&& (SC_ObsessionTimes < 1)
		{
				return TRUE;
		};
};

func void DIA_Vatras_OBSESSION_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_OBSESSION_15_00"); //Tengo una sensación trepidante.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_01"); //Tú tampoco tienes buen aspecto. Estuviste sometido a la mirada oscura de los buscadores demasiado tiempo.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_02"); //Lo único que puedo curar es tu cuerpo. Solo el monasterio puede purificar tu alma. Habla con Pyrokar. Él te ayudará.
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_Vatras_AllDragonsDead(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 59;
	condition	= DIA_Vatras_AllDragonsDead_Condition;
	information	= DIA_Vatras_AllDragonsDead_Info;
	description = "Los dragones ya no causarán más caos.";
};                       
FUNC INT DIA_Vatras_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vatras_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_00"); //Los dragones ya no causarán más caos.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_01"); //Sabía que regresarías sano y salvo. Sin embargo, aún tienes que superar el mayor obstáculo.
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_02"); //Ya lo sé.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_03"); //Pues equípate bien y ven a verme si necesitas ayuda. Lleva siempre el Ojo de Innos contigo, ¿me oyes? Que Adanos te bendiga.
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_KnowWhereEnemy_Condition;
	information	 = 	DIA_Vatras_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Sé dónde se encuentra nuestro enemigo.";
};
func int DIA_Vatras_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Vatras_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Vatras_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_00"); //Sé dónde se encuentra nuestro enemigo.
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_01"); //Pues no perdamos más tiempo y encontrémosle antes de que nos localice.
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_02"); //¿Quieres acompañarme?
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_03"); //He pensado mucho en esto y nunca he estado más convencido de mi misión, amigo mío.
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                    	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                    	
	B_LogEntry (TOPIC_Crew,"Increíble. Vatras se ha ofrecido a acompañarme en mis viajes. Un hombre de su habilidad y experiencia puede resultarme muy útil.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Vatras_KnowWhereEnemy_15_04"); //Ya tengo a demasiados. Me temo que no habrá sitio suficiente para ti.
		AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_05"); //Pues hazlo. Me necesitarás.
	}
	else 
	{
		Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Voy a pensarlo un poco más.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Será un honor tenerte a mi lado.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_Yes_15_00"); //Considero un honor tenerte a mi lado. Nos reuniremos contigo en el puerto.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01"); //No tardes mucho. El enemigo no descansa, amigo mío.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg (lang);
	
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_No_15_00"); //Voy a pensarlo un poco más.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_No_05_01"); //Tú mismo. Ven a verme de nuevo si cambias de opinión.

	Vatras_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_LeaveMyShip		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_LeaveMyShip_Condition;
	information	 = 	DIA_Vatras_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Será mejor que te quedes aquí. La ciudad te necesita.";
};
func int DIA_Vatras_LeaveMyShip_Condition ()
{	
	if (Vatras_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_LeaveMyShip_15_00"); //Será mejor que te quedes aquí. La ciudad te necesita.
	AI_Output			(self, other, "DIA_Vatras_LeaveMyShip_05_01"); //Quizá tengas razón. Aún así, te acompañaré si lo deseas. Ya lo sabes.
	
	Vatras_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"PRAY"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_StillNeedYou_Condition;
	information	 = 	DIA_Vatras_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ven conmigo a la isla del enemigo.";
};

func int DIA_Vatras_StillNeedYou_Condition ()
{	
	if ((Vatras_IsOnBOard == LOG_OBSOLETE)	
	|| (Vatras_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Vatras_StillNeedYou_15_00"); //Ven conmigo a la isla del enemigo.
	AI_Output	(self, other, "DIA_Vatras_StillNeedYou_05_01"); //Una sabia decisión. Espero que te mantengas firme.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg (lang);
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PISSOFFFOREVVER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PISSOFFFOREVVER		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition ()
{
	if (VatrasPissedOffForever == TRUE)
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info ()
{
	B_VatrasPissedOff ();
	AI_StopProcessInfos (self);  Vatras_MORE = FALSE;
};


