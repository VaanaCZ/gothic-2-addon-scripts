///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Quarhodron_EXIT   (C_INFO)
{
	npc         = NONE_ADDON_111_Quarhodron;
	nr          = 999;
	condition   = DIA_Addon_Quarhodron_EXIT_Condition;
	information = DIA_Addon_Quarhodron_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Hello		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_Hello_Condition;
	information	 = 	DIA_Addon_Quarhodron_Hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
var int DIA_Addon_Quarhodron_Hello_NoPerm;
func int DIA_Addon_Quarhodron_Hello_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Addon_Quarhodron_Hello_NoPerm == FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Addon_Quarhodron_Hello_Info ()
{
	IF (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_00"); //¿Por qué interrumpes mi descanso, guardián?
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_01"); //(enfadado) Dime, ¿qué deseas?
		 
		Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "¿Qué hay en el templo de Adanos?", DIA_Addon_Quarhodron_Hello_schwert );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Alguien entró por la fuerza al templo de Adanos.", DIA_Addon_Quarhodron_Hello_raven );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Déjame acceder al templo de Adanos.", DIA_Addon_Quarhodron_Hello_tempel );
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "Los terremotos asolan la tierra.", DIA_Addon_Quarhodron_Hello_erdbeben );
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems 	(hero, ItWr_Addon_SUMMONANCIENTGHOST,1); //Joly: sonst gammelt das ding unnütz herum.
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_02"); //¿Bengla anthani, Osiri?
		B_Say (other, self, "$CANTUNDERSTANDTHIS");	
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_11_03"); //(en alto) ¿Bengla anthani?
		AI_StopProcessInfos (self);
	};
};
var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;
func void B_Quarhodron_Hello_KommZumPunkt ()
{
	if (DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3)
	&& (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Quarhodron_Hello, "La venerada sabiduría de los antepasados es realmente abrumadora.", DIA_Addon_Quarhodron_Hello_frech );
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_erdbeben_15_00"); //Los terremotos proliferan en cada rincón. Hay que hacer algo antes de que el mar se trague toda la isla.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_01"); //Nosotros no podemos hacer más.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_02"); //La ira de Adanos ha caído sobre Jharkendar para castigar a los infieles.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_raven ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_00"); //Alguien ha conseguido entrar al templo de Adanos.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_raven_11_01"); //Tonterías. Yo mismo sellé la puerta. Es imposible pasar.
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_02"); //¿Eso crees?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_tempel ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_tempel_15_00"); //Permíteme acceder al templo de Adanos.
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_tempel_11_01"); //El templo permanecerá cerrado por toda la eternidad. Así lo decidimos en el consejo.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_schwert ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Hello_schwert_15_00"); //¿Qué hay en el templo de Adanos?
	AI_Output			(self, other, "DIA_Addon_Quarhodron_Hello_schwert_11_01"); //Mi mayor desdicha, mi mayor decepción.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt ();
};
func void DIA_Addon_Quarhodron_Hello_frech ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Hello_frech_15_00"); //La venerada sabiduría de los antepasados es realmente abrumadora.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_01"); //Un hombre de tu posición no puede hablarme así.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_02"); //No puedo evitar tener la impresión de que no eres quien finges ser.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_03"); //Si quieres mi ayuda, tienes que demostrarme lo que vales.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_04"); //Contesta a mis preguntas para estar seguro de no abrir mi corazón a extraños.
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron sólo me ayudará si demuestro ante él mi valía. Me ha hecho algunas preguntas complicadas. Si las respondo, me echará una mano."); 

	Info_ClearChoices	(DIA_Addon_Quarhodron_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Fragen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Fragen		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_Fragen_Condition;
	information	 = 	DIA_Addon_Quarhodron_Fragen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pregunta.";
};

func int DIA_Addon_Quarhodron_Fragen_Condition ()
{
	if (QuarhodronIstZufrieden == FALSE)
		{
			return TRUE;
		};
};

var int Quarhodrons_NextQuestion;
var int QuarhodronIstZufrieden;
var int Quarhodrons_RichtigeAntworten;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed ()
{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_00"); //Tus respuestas incorrectas revelan tus malas intenciones.
		AI_Output			(self, other, "DIA_Addon_Quarhodron_TestFailed_11_01"); //No voy a ayudarte.
		AI_StopProcessInfos (self);	
};

func void B_Quarhodron_Fragen_Choices ()
{
	Log_AddEntry  (TOPIC_Addon_Quarhodron," --- PREGUNTAS DE QUARHODRON ---"); 

	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{
		if (Quarhodrons_NextQuestion == 1)
		&& (Quarhodrons_RichtigeAntworten == 0)
		{
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_00"); //No te creo.
			AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_01"); //Creo que deberías volver cuando hayas decidido contarme la verdad.
			AI_StopProcessInfos (self);
		}
		else 
		{
			if (Quarhodrons_NextQuestion == 1)
			{
				if (B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_02"); //(pensativo) Las habilidades de un guardián de los muertos te hubieran permitido despertarme, eso es cierto.
					AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_03"); //Si eres quien dices ser, serás capaz de responder todas mis preguntas.
					AI_Output (self, other, "DIA_Addon_Quarhodron_Add_11_00"); //Menos una
					
					B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
				};
				Quarhodrons_NextQuestion = 2;
			};
			
			if (Quarhodrons_NextQuestion == 7)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_04"); //¿Quién selló el portal para proteger al mundo el mal?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- ¿Quién cerro el portal para proteger el mundo del mal? ---"); 
				Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
			}
			else if (Quarhodrons_NextQuestion == 6)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_05"); //¿Quién alivia el sufrimiento y atiende a los enfermos?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- ¿Quién alivia el sufrimiento y cuida a los enfermos en Jharkendar? ---"); 
				Quarhodrons_NextQuestion = 7;
			}
			else if (Quarhodrons_NextQuestion == 5)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_06"); //¿Quién tiene la última palabra en el Consejo de los Cinco?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- ¿Quién tiene la última palabra en el Consejo de los Cinco? ---"); 
				Quarhodrons_NextQuestion = 6;
			}	
			else if (Quarhodrons_NextQuestion == 4)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_07"); //¿Quién nos trajo el mal?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- ¿Quién es el responsable del mal que asoló al pueblo de Jharkendar? ---"); 
				Quarhodrons_NextQuestion = 5;
			}
			else if (Quarhodrons_NextQuestion == 3)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_08"); //¿Quién puede darme una orden directa?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- ¿Quién puede darle a Quarhodron una orden directa? ---"); 
				Quarhodrons_NextQuestion = 4;
			}	
			else if (Quarhodrons_NextQuestion == 2)
			{
				AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_09"); //¿Quién protegió en cierta ocasión Jharkendar de ataques enemigos?
				Log_AddEntry  (TOPIC_Addon_Quarhodron," --- ¿Quién protegió en cierta ocasión a las gentes de Jharkendar de ataques enemigos? ---"); 
				Quarhodrons_NextQuestion = 3;
			};
			
			Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
			
			if (Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "Era imposible que yo lo supiera.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			}
			else
			{
				Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "No lo sé.", DIA_Addon_Quarhodron_Fragen_NoPlan );
			};
			
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "A los eruditos.", DIA_Addon_Quarhodron_Fragen_gele );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "A los guardianes de los muertos.", DIA_Addon_Quarhodron_Fragen_totenw );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "A los sacerdotes.", DIA_Addon_Quarhodron_Fragen_prie );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "A la casta guerrera.", DIA_Addon_Quarhodron_Fragen_warr );
			Info_AddChoice	(DIA_Addon_Quarhodron_Fragen, "A los curanderos.", DIA_Addon_Quarhodron_Fragen_heiler );
		};
	};
};
var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info ()
{
	Quarhodrons_NextQuestion 		= 0;
	Quarhodrons_RichtigeAntworten 	= 0;
	AI_Output	(other, self, "DIA_Addon_Quarhodron_Fragen_15_00"); //Pregunta.
	
	if (DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_01"); //Soy Quarhodron, antiguo señor de la guerra de Jharkendar.
		AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_02"); //Me has despertado.
		
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	
	AI_Output	(self, other, "DIA_Addon_Quarhodron_Fragen_11_03"); //¿A qué casta de Jharkendar perteneces?

	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_warr ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_warr_15_00"); //A la casta guerrera.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 3)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 5)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_prie ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_prie_15_00"); //A los sacerdotes.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 4)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_gele ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_gele_15_00"); //A los eruditos.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 6)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_totenw ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_totenw_15_00"); //A los guardianes de los muertos.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_heiler ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_heiler_15_00"); //A los curanderos.
	if (Quarhodrons_NextQuestion == 0)	{Quarhodrons_NextQuestion = 1;};
	if (Quarhodrons_NextQuestion == 7)	{Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1);};
	B_Quarhodron_Fragen_Choices ();
};
func void DIA_Addon_Quarhodron_Fragen_NoPlan ()
{
	AI_Output			(other, self, "DIA_Addon_Quarhodron_Fragen_NoPlan_15_00"); //No lo sé.
	
	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	&& (Quarhodrons_RichtigeAntworten >= 6) 
	{
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_01"); //Bien. Confío en ti y voy a ayudarte.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices	(DIA_Addon_Quarhodron_Fragen);
	}
	else if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed ();
	}
	else
	{	
		AI_Output			(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_02"); //No malgastes mi tiempo.
		AI_StopProcessInfos (self);	
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GibMirKey
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_GibMirKey		(C_INFO)
{
	npc		 = 	NONE_ADDON_111_Quarhodron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Quarhodron_GibMirKey_Condition;
	information	 = 	DIA_Addon_Quarhodron_GibMirKey_Info;

	description	 = 	"(pedir la llave del templo)";
};
func int DIA_Addon_Quarhodron_GibMirKey_Condition ()
{
	if (QuarhodronIstZufrieden == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Quarhodron_GibMirKey_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_00"); //Ahora escucha. Un tipo con muy malas intenciones ha entrado al templo de Adanos.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_01"); //Si no me dejas entrar a mí también enseguida, será demasiado tarde y todo se echará a perder.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_02"); //¡No puede ser! El sumo sacerdote KHARDIMON y yo somos los únicos de Jhardenkar que sabemos abrir la puerta del templo de Adanos.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_03"); //Bien. Entonces, tu amigo KHARDIMON debe de haber abierto el pico.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_04"); //Pues te digo que la puerta estaba abierta. Lo vi en persona.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_05"); //Bien, parece que dices la verdad. No volveré a dudar de tus palabras.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_06"); //Eso espero.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_07"); //Toma, la contraseña. Está escrita en esta tablilla de piedra. Di las palabras ante la puerta sellada del templo y se abrirá.
	CreateInvItems (self, ItMi_TempelTorKey, 1);									
	B_GiveInvItems (self, other, ItMi_TempelTorKey, 1);		
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_08"); //(ya medio muerto) Mi tiempo se agota. Lo siento, no puedo ayudarte más.
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_09"); //(ya medio muerto) Pero recuerda: cuidado con las cámaras de Adanos. Te juegas la vida.
	AI_Output	(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_10"); //Espera. ¿Qué PASA con las cámaras?
	AI_Output	(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_11"); //(ya medio muerto) Las fuerzas me fallan. Adiós. Volveremos a vernos en el reino de los muertos.
	AI_StopProcessInfos (self);
	
	B_LogEntry (TOPIC_Addon_Quarhodron,"Quarhodron me ha dado una tablilla de piedra que puedo usar para abrir la entrada del templo de Adanos."); 
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,"Quarhodron mencionó las 'Salas de Adanos' y dijo que tuviera cuidado allí. Tengo que averiguar lo que quiere decir si no quiero caer en una trampa en el templo de Adanos."); 

	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};


