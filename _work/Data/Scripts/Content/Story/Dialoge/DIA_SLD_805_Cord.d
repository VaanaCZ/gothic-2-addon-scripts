// ************************************************************
// 			  					EXIT
// ************************************************************
INSTANCE DIA_Cord_EXIT   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 999;
	condition   = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_MeetingIsRunning		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Cord_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Cord_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Cord_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Cord_MeetingIsRunning_OneTime;
func void DIA_Addon_Cord_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_00"); //Bienvenido al 'Anillo de Agua', hermano.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_01"); //Deberías ir ya a ver a Vatras ya
	};
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo
// ************************************************************
INSTANCE DIA_Cord_Hallo   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 2;
	condition   = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Cord_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cord_Hallo_Info()
{
	AI_Output (self ,other, "DIA_Cord_Hallo_14_00"); //Si tienes un problema con los lobos o con los incursores de campo, ve a hablar con uno de los mercenarios jóvenes.
	AI_Output (self ,other, "DIA_Cord_Hallo_14_01"); //Ven a hablar conmigo si aparecen los paladines.
	
	if (SC_IsRanger == FALSE)
	{	
		AI_Output (other, self, "DIA_Cord_Hallo_15_02"); //¿Qué?
		AI_Output (self ,other, "DIA_Cord_Hallo_14_03"); //Cada vez que uno de los campesinos venís a verme, siempre es para que se acabe con bestias inocentes.
		AI_Output (other, self, "DIA_Cord_Hallo_15_04"); //No soy campesino.
		AI_Output (self ,other, "DIA_Cord_Hallo_14_05"); //¿No? ¿Y qué es lo que quieres?
	};
};

// ************************************************************
// 			  					WannaJoin
// ************************************************************
var int Cord_SchonmalGefragt;
// ------------------------------------------------------------
INSTANCE DIA_Cord_WannaJoin   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 5;
	condition   = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent   = TRUE;
	description = "¡Quiero ser un mercenario!";
};

FUNC INT DIA_Cord_WannaJoin_Condition()
{
	if (Cord_Approved == FALSE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID B_Cord_BeBetter ()
{
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_14"); //Ya que apenas sabes cómo sostener un arma, ¡éste no es tu lugar!
};

FUNC VOID DIA_Cord_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Cord_WannaJoin_15_00"); //¡Quiero ser mercenario!
	if (Cord_SchonmalGefragt == FALSE)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_01"); //Tienes pinta de haber nacido para trabajar el campo, chaval.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_02"); //¿Entonces puedes sostener un arma?
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_03"); //¿Has mejorado ya?
	};
	
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_04"); //¿Y qué hay de las armas a una mano?
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_05"); //No se me da mal.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_06"); //Bueeeeno...
	};
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_07"); //¿Y con las armas a dos manos?
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_08"); //Puedo manejarlas.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_09"); //¡Seguro que mejoraré!
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	|| (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_10"); //Bien, al menos no eres un maldito principiante. De acuerdo. Votaré a tu favor.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_11"); //Cualquier otra cosa que necesites saber, podrás aprenderlo de mí.
		Cord_Approved = TRUE;
		B_GivePlayerXP (XP_Cord_Approved);
		B_LogEntry (TOPIC_SLDRespekt,"Tengo seguro el voto de Cord.");
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Cord puede entrenarme en el uso de armas de una y dos manos.");
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_12"); //En otras palabras: ¡Eres un maldito novato!
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_13"); //Cada mercenario necesita poder confiar en sus camaradas. Nuestras vidas dependen de ello.
		B_Cord_BeBetter ();
		
		Log_CreateTopic (TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_CordProve,LOG_RUNNING); 
		B_LogEntry (TOPIC_CordProve,"Cord me dará su voto cuando haya aprendido a luchar mejor."); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info YouAreRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_YouAreRanger		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cord_YouAreRanger_Condition;
	information	 = 	DIA_Addon_Cord_YouAreRanger_Info;

	description	 = 	"He oído que perteneces al 'Anillo de Agua'.";
};

func int DIA_Addon_Cord_YouAreRanger_Condition ()
{
	if (RangerHelp_gildeSLD == TRUE)
	&& (Cord_SchonmalGefragt == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cord_YouAreRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_00"); //He oído que perteneces al 'Anillo de Agua'.
	
	if (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_01"); //¿Qué clase de cotorra es la que ha abierto el pico?
		
		if (SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_02"); //Me lo dijo Lee.
		};
	
		if (SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_03"); //Lares me ha dicho que me ayudarías si te decía que 'vivo bajo su protección'.
		};
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_04"); //(suspira) Tendré que escucharte entonces, ¿no?
	//AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_05"); //Was muss ich denn jetzt für dich machen, damit du die Schnauze hälst?
	AI_Output	(self, other, "DIA_Addon_Cord_Add_14_01"); //Vale, ¿qué necesitas?
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_06"); //Y ten mucho cuidado con lo que me cuentas, porque si no me gusta lo que oigo, te despellejaré vivo.
	
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "No necesito nada. Me arreglaré solo.", DIA_Addon_Cord_YouAreRanger_nix );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Quiero tu armadura.", DIA_Addon_Cord_YouAreRanger_ruestung );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "¡Quiero tu arma!", DIA_Addon_Cord_YouAreRanger_waffe );
	if (Cord_Approved == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Enséñame a luchar.", DIA_Addon_Cord_YouAreRanger_kampf );
	};
	if (hero.guild == GIL_NONE)
	{
		//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Verschwinde hier. Ich will deinen Platz auf dem Hof einnehmen.", DIA_Addon_Cord_YouAreRanger_weg );
	};
	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Podrías ayudarme a unirme a los mercenarios.", DIA_Addon_Cord_YouAreRanger_SLDAufnahme );
	};
	//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Bezahl mich für mein Schweigen.", DIA_Addon_Cord_YouAreRanger_Gold );
};
var int Cord_SC_Dreist;
func void 	B_DIA_Addon_Cord_YouAreRanger_WARN ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_WARN_14_00"); //(amenazador) Y pobre de ti si me entero de que no sabes mantener la boca cerrada. No pienso repetirlo, ¿vale?
};
func void 	B_DIA_Addon_Cord_YouAreRanger_FRESSE ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_FRESSE_14_00"); //(furioso) Ya vale, has llegado demasiado lejos. Voy a barrer el suelo contigo.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};
func void DIA_Addon_Cord_YouAreRanger_ruestung ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_ruestung_15_00"); //Quiero tu armadura.

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_ruestung_14_01"); //Repite eso y tendrás que recoger tus dientes del suelo.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Cord_YouAreRanger_Add_15_00"); //¡Quiero tu arma!

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_03"); //(amenazador) ¿En serio?
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_02"); //(serio) ¡Pues ven a por ella!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_weg_15_00"); //Esfúmate. Quiero sustituirte en esta granja.

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_weg_14_01"); //Y no intentes tomarme el pelo, chaval, o te romperé hasta el último hueso del cuerpo.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Addon_Cord_YouAreRanger_kampf ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_kampf_15_00"); //Enséñame a luchar.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_kampf_14_01"); //Muy bien. ¿Qué más?
	Cord_RangerHelp_Fight = TRUE;

	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Eso es todo.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00"); //Podrías ayudarme a que los mercenarios me aceptaran.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01"); //(ríe) Ya te sigo. Bien. Lo intentaré. ¿Qué más?

	Cord_RangerHelp_GetSLD = TRUE;
	
	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Eso es todo.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_Gold_15_00"); //Compra mi silencio.
	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_Gold_14_01"); //¿Eso es lo que quieres? Lo siento por ti. No admito chantajes, granuja.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};
func void DIA_Addon_Cord_YouAreRanger_nix ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_nix_15_00"); //No necesito nada. Me arreglaré solo.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_nix_14_01"); //Si eso es lo que quieres. Has tenido tu oportunidad.
	B_DIA_Addon_Cord_YouAreRanger_WARN ();
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
};
func void DIA_Addon_Cord_YouAreRanger_reicht ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_reicht_15_00"); //Eso es todo.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_reicht_14_01"); //Eso no es muy difícil.
	B_DIA_Addon_Cord_YouAreRanger_WARN ();
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
};

///////////////////////////////////////////////////////////////////////
//	Info RangerHelp2GetSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_RangerHelp2GetSLD		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information	 = 	DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ayúdame a convertirme en mercenario.";
};
var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;
func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition ()
{
	if (Cord_RangerHelp_GetSLD == TRUE)
	&& (hero.guild == GIL_NONE)
	&& (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE)
		{
			return TRUE;
		};
};
func void B_Cord_RangerHelpObsolete ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_00"); //Ya me he ocupado.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_01"); //Oh. Entonces supongo que puedo ayudarte.
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_02"); //¿Qué quieres decir con eso?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_03"); //Pues significa que no puedo ayudarte.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_04"); //¿O es que quieres que me enfrente a todos los mercenarios para que tú puedas unirte?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_05"); //Tendrás que hacerlo tú solo.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};
func void B_Cord_ComeLaterWhenDone ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_ComeLaterWhenDone_14_00"); //Así que adelante, ocúpate y luego vuelve.
	AI_StopProcessInfos (self);
};
func void B_Cord_IDoItForYou ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_00"); //Ah, sí. Eso es fácil. Mira, vuelve mañana, hasta entonces lo tendré listo.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_01"); //Pero vas a tener que hacerme algún favor a cambio.
	AI_Output	(other, self, "DIA_Addon_Cord_IDoItForYou_15_02"); //¿Qué clase de favor?
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_03"); //Cerca de aquí, al sureste, hay un pequeño campamento de bandidos en las montañas.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_04"); //Si, desde aquí, vas al sureste, pronto verás una torre.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_05"); //Uno de los míos, Patrick, se fue hace varios días para hacer negocios con esas alimañas.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_06"); //En fin, ya le dije que era mala idea, pero ese idiota no quiso escucharme.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_07"); //Me imagino que lo habrán aniquilado, aunque no estoy seguro.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_08"); //Tú irás a enterarte por mí.

	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Cord va a ocuparse de la prueba de Torlof. Patrick, amigo de Cord, ha desaparecido. Quiere que vaya al campamento bandido de la montaña que hay al sureste y averigüe si Patrick está allí."); 

	
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "Olvídalo. Es mucho más difícil que la tarea de Torlof.", B_Cord_IDoItForYou_mist );
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "¿Y qué te hace pensar que no se desharán también de MÍ?", B_Cord_IDoItForYou_Dexter );
		
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};
func void B_Cord_IDoItForYou_mist ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_mist_15_00"); //Olvídalo. Es mucho más difícil que la tarea de Torlof.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_01"); //No tiene por qué. No creo que les interese un tipo tan insignificante, pegajoso y poca cosa como tú.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_02"); //Y yo no puedo hacerlo. Esos tipos pierden el control con sólo ver a un mercenario.
};
func void B_Cord_IDoItForYou_Dexter ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_Dexter_15_00"); //¿Y qué te hace pensar que no se desharán también de MÍ?
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_01"); //Que sé el nombre de su líder. Se llama Dexter. Sólo tienes que decir que lo conoces.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_02"); //Sus hombres se lo pensarán dos veces antes de cortarte el pescuezo.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_03"); //Aún así, podría ser peligroso, claro.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_04"); //Pero tú puedes conseguirlo.
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"El líder de los bandido se llama Dexter."); 

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"El mercenario Cord anda buscando a su amigo Patrick."); 
		
	MIS_Addon_Cord_Look4Patrick = LOG_RUNNING;
	Ranger_SCKnowsDexter = TRUE; 
};
func void DIA_Addon_Cord_RangerHelp2GetSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_00"); //Ayúdame a convertirte en mercenario.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_01"); //A ver, que piense. Mmh. Tendrás que pasar a Torlof si quieres hacer algún progreso.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_02"); //¿Ya conoces a Torlof?

	if (Torlof_Go == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_03"); //Pues no.
		B_Cord_ComeLaterWhenDone ();
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_04"); //Sí, eso de la prueba.
		AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_05"); //Ah. ¿Y en qué consiste?
		
		if	(Torlof_ProbeBestanden == TRUE)
		|| ((MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)&& (Npc_IsDead (Rumbold))&& (Npc_IsDead (Rick)))
		|| ((MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)&&((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE)||(Npc_IsDead (Sekob))))
		{
			B_Cord_RangerHelpObsolete ();
		}		
		else if (Torlof_Probe == 0)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_06"); //Aún no la he aceptado.
			B_Cord_ComeLaterWhenDone ();
		}		
		else if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_07"); //Tengo que recaudar el alquiler de la granja de Sekob.
			B_Cord_IDoItForYou ();
		}
		else if (Torlof_Probe == Probe_Bengar)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_08"); //Tengo que alejar a la milicia de la granja de Bengar.
			B_Cord_IDoItForYou ();
		}
		else 
		{
			B_Cord_RangerHelpObsolete ();
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_TalkedToDexter		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cord_TalkedToDexter_Condition;
	information	 = 	DIA_Addon_Cord_TalkedToDexter_Info;

	description	 = 	"Fui a ver a Dexter.";
};

func int DIA_Addon_Cord_TalkedToDexter_Condition ()
{
	if ((BDT_1060_Dexter.aivar[AIV_TalkedToPlayer] == TRUE)
	|| (Npc_IsDead(BDT_1060_Dexter)))
	&& (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cord_TalkedToDexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_00"); //Fui a ver a Dexter.
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_01"); //¿Y?
	
	if (Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_02"); //Dexter ha muerto.
	};
	
	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_03"); //No había rastro de tu amigo Patrick por allí.
	
	if (Dexter_KnowsPatrick == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_04"); //Dexter se acordaba de él, pero decía que hacía siglos que no lo veía.
		AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_05"); //¿Y seguro que Dexter no ha mentido?
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_06"); //No lo sé. Pero es todo lo que puedo decirte.
		
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_07"); //No lo entiendo. Es como si hubiera desaparecido de la faz de la tierra.
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_08"); //Bueno, tú has cumplido tu parte del trato

	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP (XP_Addon_Cord_Look4Patrick);

	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_09"); //¿Y qué pasa con la prueba de Torlof?
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_10"); //No te preocupes, puedes volver con Torlof. Has cumplido tu misión y has superado la prueba. Te dije que yo me ocuparía.

	Cord_RangerHelp_TorlofsProbe = TRUE;

	if (Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if (Torlof_Probe == Probe_Bengar)
	{
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
};

// ************************************************************
// 			  ReturnPatrick
// ************************************************************
INSTANCE DIA_Cord_ReturnPatrick   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 8;
	condition   = DIA_Cord_ReturnPatrick_Condition;
	information = DIA_Cord_ReturnPatrick_Info;
	permanent   = FALSE;
	description = "Patrick ha vuelto.";
};

FUNC INT DIA_Cord_ReturnPatrick_Condition()
{
	if (Npc_GetDistToWP (Patrick_NW, "NW_BIGFARM_PATRICK") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cord_ReturnPatrick_Info()
{
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_00"); //Patrick ha vuelto.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_01"); //Sí. Ya casi había perdido la esperanza. T
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_02"); //Eh, hazme un favor.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_03"); //¿Sí?
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_04"); //Ahórranos tu discurso de agradecimiento.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_05"); //No pensaba dar las gracias.
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_06"); //¿Entonces…?
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_07"); //(sonríe) Iba a decirte que eres el granuja más afortunado.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_09"); //(sonríe) Que te vaya bien.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				ExplainSkills
// ************************************************************
INSTANCE DIA_Cord_ExplainSkills   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 1;
	condition   = DIA_Cord_ExplainSkills_Condition;
	information = DIA_Cord_ExplainSkills_Info;
	permanent   = FALSE;
	description = "¿Qué debería aprender primero, el combate a una o a dos manos?";
};

FUNC INT DIA_Cord_ExplainSkills_Condition()
{
	if (Cord_Approved == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cord_ExplainSkills_Info()
{
	AI_Output (other, self, "DIA_Cord_ExplainSkills_15_00"); //¿Qué debería aprender primero, el combate a una o a dos manos?
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_01"); //Los dos tipos de armas son similares.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_02"); //En cuanto llegues al siguiente nivel con un tipo de arma, aprenderás también el de la otra.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_03"); //Si, por ejemplo, se te da bien combatir con espadas a una mano, pero sigues siendo un principiante con armas a dos manos...
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_04"); //… tus habilidades a dos manos mejorarán a la vez que entrenas con un arma a una mano.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_05"); //Si solo entrenas con un tipo de arma, descubrirás que el entrenamiento es más agotador.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_06"); //Si siempre entrenas con las dos, conseguirás los mismos resultados con menos esfuerzo.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_07"); //Al final, el resultado va a ser el mismo. Tú decides.
};
// ************************************************************
// 			  				ExplainWeapons
// ************************************************************
INSTANCE DIA_Cord_ExplainWeapons   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 2;
	condition   = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent   = FALSE;
	description = "¿Cuáles son las ventajas de las armas a una o a dos manos?";
};

FUNC INT DIA_Cord_ExplainWeapons_Condition()
{
	if (Cord_Approved == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cord_ExplainWeapons_Info()
{
	AI_Output (other, self, "DIA_Cord_ExplainWeapons_15_00"); //¿Cuáles son las ventajas de las armas a una y a dos manos?
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_01"); //Buena pregunta. Veo que has pensado en el asunto.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_02"); //Las armas a una mano son más rápidas, pero más débiles.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_03"); //Las de dos manos causan más daño, pero no puedes golpear tan rápido.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_04"); //Además, necesitas más fuerza para empuñar un arma a dos manos. Eso significa más entrenamiento.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_05"); //La única forma de ser realmente bueno es esforzarse mucho.
};

// ******************************************************
//							Teach
// ******************************************************

var int Cord_Merke_1h;
var int Cord_Merke_2h;
// ------------------------------------------------------

INSTANCE DIA_Cord_Teach(C_INFO)
{
	npc			= SLD_805_Cord;
	nr			= 3;
	condition	= DIA_Cord_Teach_Condition;
	information	= DIA_Cord_Teach_Info;
	permanent	= TRUE;
	description = "¡Enséñame a luchar!";
};                       

FUNC INT DIA_Cord_Teach_Condition()
{
	return TRUE;
};

FUNC VOID B_Cord_Zeitverschwendung ()
{
	AI_Output (self ,other,"DIA_Cord_Teach_14_03"); //No pierdo el tiempo con principiantes.
};

FUNC VOID DIA_Cord_Teach_Info()
{	
	AI_Output (other,self, "DIA_Cord_Teach_15_00"); //¡Enséñame a luchar!
	if (Cord_Approved == TRUE)
	|| (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	|| (Cord_RangerHelp_Fight == TRUE)//ADDON
	{
		if ((Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)&&(Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0))
		|| (Cord_RangerHelp_Fight == TRUE)//ADDON
		{
		
		
			AI_Output (self ,other,"DIA_Cord_Teach_14_01"); //Puedo enseñarte a usar cualquier arma. ¿Por dónde empezamos?
			Cord_Approved = TRUE;
		}
		else if  (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_02"); //Te puedo entrenar para usar una espada a una mano, pero todavía no eres lo bastante bueno como para empuñar una a dos manos.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_04"); //¡Cuando se trata de armas a una mano, eres un maldito principiante! Pero tu habilidad con armas a dos manos no es tan mala.
			AI_Output (self ,other,"DIA_Cord_Teach_14_05"); //Si necesitas más experiencia con armas a una mano, ve a encontrar a un maestro diferente.
			Cord_Approved = TRUE;
		}
		else
		{
			B_Cord_Zeitverschwendung();
			B_Cord_BeBetter ();
		};
		
		if (Cord_Approved == TRUE)
		{
			Info_ClearChoices (DIA_Cord_Teach);
			Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
		
			if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
			|| (Cord_RangerHelp_Fight == TRUE)//ADDON
			{
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
			};
		
			if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
			|| (Cord_RangerHelp_Fight == TRUE)//ADDON
			{
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
			};
		
			Cord_Merke_1h = other.HitChance[NPC_TALENT_1H];
			Cord_Merke_2h = other.HitChance[NPC_TALENT_2H];
		};	
	}
	else 
	{
		AI_Output (self ,other,"DIA_Cord_Teach_14_06"); //Yo solo entreno mercenarios, ¡o candidatos que merezcan la pena!
	};
};

FUNC VOID DIA_Cord_Teach_Back ()
{
	if (Cord_Merke_1h < other.HitChance[NPC_TALENT_1H])
	|| (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output (self ,other,"DIA_Cord_Teach_BACK_14_00"); //Ya estás mejorando, ¡sigue así!
	};
	
	Info_ClearChoices (DIA_Cord_Teach);
};

FUNC VOID DIA_Cord_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

FUNC VOID DIA_Cord_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

FUNC VOID DIA_Cord_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

FUNC VOID DIA_Cord_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cord_PICKPOCKET (C_INFO)
{
	npc			= SLD_805_Cord;
	nr			= 900;
	condition	= DIA_Cord_PICKPOCKET_Condition;
	information	= DIA_Cord_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Cord_PICKPOCKET_Condition()
{
	C_Beklauen (65, 75);
};
 
FUNC VOID DIA_Cord_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cord_PICKPOCKET);
	Info_AddChoice		(DIA_Cord_PICKPOCKET, DIALOG_BACK 		,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cord_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cord_PICKPOCKET);
};
	
func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cord_PICKPOCKET);
};












