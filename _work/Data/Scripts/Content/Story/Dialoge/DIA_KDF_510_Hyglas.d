///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Feuer
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Feuer		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_Feuer_Condition;
	information	 = 	DIA_Hyglas_Feuer_Info;
	permanent	 = 	FALSE;
	description	 =  "Exijo someterme a la prueba del fuego.";
};
func int DIA_Hyglas_Feuer_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Pyrokar_FIRE) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_Feuer_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_Feuer_15_00"); //Exijo someterme a la prueba del fuego.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_01"); //La prueba del fuego procede de la antigüedad y hace mucho tiempo que no se lleva a cabo.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_02"); //Solicitas algo demasiado peligroso. No vuelvas a pensar en ello.
};    
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Hallo		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_Hallo_Condition;
	information	 = 	DIA_Hyglas_Hallo_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Hyglas_Hallo_Condition ()
{	
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Hyglas_Hallo_14_00"); //Soy el maestro Hyglas, guardián del fuego y custodio del conocimiento.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_01"); //Así que el maestro Parlan te ha dado permiso para estudiar las escrituras.
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_02"); //Está en tu mano hacer justamente eso. Estudia y encuentra el conocimiento en las escrituras.
	};
};    
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_JOB		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_JOB_Condition;
	information	 = 	DIA_Hyglas_JOB_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Qué estudias, maestro?";
};
func int DIA_Hyglas_JOB_Condition ()
{	
	return TRUE;
};
func void DIA_Hyglas_JOB_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_JOB_15_00"); //¿Qué estudias, maestro?
	AI_Output (self, other, "DIA_Hyglas_JOB_14_01"); //Mi investigación se centra en el fuego, el poder de Innos.
	AI_Output (self, other, "DIA_Hyglas_JOB_14_02"); //Es su don y, al mismo tiempo, un arma poderosa. Además, creo runas que contienen su poder.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (other, self, "DIA_Hyglas_JOB_15_03"); //Muy instructivo. ¿Puedes enseñarme a hacerlo?
		AI_Output (self, other, "DIA_Hyglas_JOB_14_04"); //Innos es quien concede la magia, y solo sus siervos, los magos del fuego, pueden aprender a esgrimir su poder.
	};
};    
///////////////////////////////////////////////////////////////////////
//	Info CONTEST
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_CONTEST		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr           =  9;
	condition	 = 	DIA_Hyglas_CONTEST_Condition;
	information	 = 	DIA_Hyglas_CONTEST_Info;
	permanent	 =  FALSE;
	description	 = 	"He solicitado la prueba del fuego.";
};
func int DIA_Hyglas_CONTEST_Condition ()
{
	if (MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_CONTEST_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_00"); //He pedido someterme a la prueba del fuego. Ulthar me encargó que creara una runa de flecha de fuego.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_01"); //¿Y quieres que te enseñe la fórmula?
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_02"); //No sé que otra cosa podría hacer.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_03"); //Um...
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_04"); //De acuerdo, te enseñaré la fórmula, pero antes tienes que encontrar todos los componentes necesarios.
	
	B_LogEntry (TOPIC_Rune,"Hyglas está dispuesto a enseñarme la fórmula de la flecha de fuego, en cuanto tenga todos los ingredientes.");
};	
///////////////////////////////////////////////////////////////////////
//	Info FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_FIREBOLT		(C_INFO)
{
	npc		 	 = 	KDF_510_Hyglas;
	nr           =  9;
	condition	 = 	DIA_Hyglas_FIREBOLT_Condition;
	information	 = 	DIA_Hyglas_FIREBOLT_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Qué componentes necesito para una runa de flecha de fuego?";
};
func int DIA_Hyglas_FIREBOLT_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_CONTEST)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_FIREBOLT_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_FIREBOLT_15_00"); //¿Qué componentes necesito para una runa de flecha de fuego?
	AI_Output (self, other, "DIA_Hyglas_FIREBOLT_14_01"); //Documéntate. Está en los libros.
};
///////////////////////////////////////////////////////////////////////
//	Info TALENT_FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TALENT_FIREBOLT		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =	990;
	condition	 = 	DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information	 = 	DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Enséñame a crear la runa de flecha de fuego.";

};
func int DIA_Hyglas_TALENT_FIREBOLT_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_CONTEST)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	&& (Npc_HasItems (other,ItMi_RuneBlank) >= 1)
	&& (Npc_HasItems (other,ItSc_Firebolt) >= 1)
	&& (Npc_HasItems (other,ItMi_Sulfur) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_TALENT_FIREBOLT_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_TALENT_FIREBOLT_15_00"); //Enséñame a crear la runa de flecha de fuego.
	
	if (B_TeachPlayerTalentRunes (self, other, SPL_Firebolt))	
	{
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_01"); //Para crear una runa de flecha de fuego, tienes que incorporar azufre a la piedra rúnica en la mesa rúnica.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_02"); //El poder del pergamino con el conjuro de flecha de fuego fluirá al interior de la runa, y contarás con un instrumento de Innos.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_03"); //Por lo tanto, en cuanto tengas todas las materias primas, ve a la mesa rúnica y crea la runa.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info BLANK_RUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_BLANK_RUNE		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =	9;	
	condition	 = 	DIA_Hyglas_BLANK_RUNE_Condition;
	information	 = 	DIA_Hyglas_BLANK_RUNE_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Dónde encuentro una piedra rúnica?";
};
func int DIA_Hyglas_BLANK_RUNE_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_FIREBOLT)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (npc_hasItems (other, ItMI_RuneBlank) < 1) 
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_BLANK_RUNE_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_BLANK_RUNE_15_00"); //¿Dónde encuentro una piedra rúnica?
	AI_Output (self, other, "DIA_Hyglas_BLANK_RUNE_14_01"); //Eh, fuiste tú el que exigió someterse a la prueba del fuego, no yo. Averiguarlo forma parte de la prueba.
};
///////////////////////////////////////////////////////////////////////
//	Info GOTRUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_GOTRUNE		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =  2;
	condition	 = 	DIA_Hyglas_GOTRUNE_Condition;
	information	 = 	DIA_Hyglas_GOTRUNE_Info;
	permanent	 =  FALSE;
	description	 = 	"He creado la runa.";
};
func int DIA_Hyglas_GOTRUNE_Condition ()
{
	if (Npc_KnowsInfo (hero,DIA_Ulthar_SUCCESS)== FALSE ) 
	&& (Npc_HasItems (hero, ItRu_Firebolt) >= 1)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_GOTRUNE_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_GOTRUNE_15_00"); //He creado la runa.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_01"); //Vaya, vaya. Parece que has superado esta prueba. De todos modos, no era tan complicada.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_02"); //Pues ve a ver a Ulthar y muéstrale tu obra.
	
	B_LogEntry (TOPIC_Rune,"He creado una runa de flecha de fuego."); 
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TEACH		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	15;
	condition	 = 	DIA_Hyglas_TEACH_Condition;
	information	 = 	DIA_Hyglas_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Enséñame.";
};
func int DIA_Hyglas_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_TEACH_Info ()
{

	var int abletolearn;
	
	abletolearn = 0;
	AI_Output (other, self, "DIA_Hyglas_TEACH_15_00"); //Enséñame.
	
	
	Info_ClearChoices (DIA_Hyglas_TEACH);
	Info_AddChoice 	  (DIA_Hyglas_TEACH, DIALOG_BACK,DIA_Hyglas_TEACH_BACK);	
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2) 
	&& (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_Hyglas_TEACH_InstantFireball);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3) 
	&& (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE)
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Firestorm, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firestorm)) ,DIA_Hyglas_TEACH_Firestorm);
		abletolearn = (abletolearn +1);
	};
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4) 
	&& (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_ChargeFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeFireball)) ,DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn = (abletolearn +1);
	};
	
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5) 
	&& (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Pyrokinesis, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Pyrokinesis)) ,DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6) 
	&& (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Hyglas_TEACH_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		B_Say (self, other, "$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices (DIA_Hyglas_TEACH);
	};
};
FUNC VOID DIA_Hyglas_TEACH_BACK ()
{
	Info_ClearChoices (DIA_Hyglas_TEACH);
};
FUNC VOID DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball);	
};
FUNC VOID DIA_Hyglas_TEACH_Pyrokinesis()
{	
	B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis);	
};
FUNC VOID DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firestorm);	
};
FUNC VOID DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};

//#######################################
//##
//##	Kapitel 2
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap2_EXIT_Condition;
	information = DIA_Hyglas_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#######################################
//##
//##	Kapitel 3
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap3_EXIT_Condition;
	information = DIA_Hyglas_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringBook
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_BringBook   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 38;
	condition   = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent   = FALSE;
	description = "¿Alguna novedad?";
};
FUNC INT DIA_Hyglas_BringBook_Condition()
{
	if (Kapitel >= 3)
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_BringBook_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_00"); //¿Alguna novedad?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_01"); //Um, sí. Probablemente hayas advertido la presencia de esas figuras de atuendo negro.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_02"); //Me he topado con ellos.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_03"); //Esto nos lleva al meollo del asunto. En este momento, observamos una constelación de estrellas muy peculiar.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_04"); //Para ser más exactos, el signo del Buey se encuentra en correlación directa con el signo del Guerrero. Supongo que sabes lo que significa eso.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_05"); //Um. Bueno, si te digo la verdad...
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_06"); //Sí, bueno, ya veo. No te puedo explicar todos los detalles, pero significa que van a producirse grandes cambios. Y los cambios no me gustan.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_07"); //Por lo tanto, quiero que me traigas un libro de la ciudad. Se llama ''El poder divino de las estrellas''. Tendrás que rebuscar un poco, pero estoy seguro de que lo encontrarás.
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	Info_AddChoice (DIA_Hyglas_BringBook,"Ve tú a por el libro.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice (DIA_Hyglas_BringBook,"¿Qué obtengo yo a cambio?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice (DIA_Hyglas_BringBook,"Veré si puedo encontrarlo.",DIA_Hyglas_BringBook_Yes);
};

FUNC VOID DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetItYourself_15_00"); //Ve tú a por el libro.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_01"); //¿Cómo osas hablarme en este tono? Tu actitud no demuestra el respeto que me debes.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_02"); //Lárgate y medita acerca de tu actitud.
	
	MIS_HyglasBringBook = LOG_OBSOLETE;
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_00"); //¿Y qué gano yo?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_01"); //¿Qué quieres decir?
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_02"); //Me gustaría saber qué me darás si te traigo el libro.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_03"); //Nada. ¿Qué esperabas? Si tienes tiempo para hacerme un recado en la ciudad, ayudarme es tu obligación.
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_Yes()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_Yes_15_00"); //Veré si puedo encontrarlo.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_01"); //Muy bien. Eso me deja tiempo libre para seguir otras pistas.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_02"); //Pero no tardes. Me temo que no nos sobra el tiempo.
	
	MIS_HyglasBringBook = LOG_RUNNING;
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	
	Log_CreateTopic (TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HyglasBringBook,LOG_RUNNING);
	B_LogEntry (TOPIC_HyglasBringBook,"Hyglas quiere que le consiga el libro ''El poder divino de las estrellas''. Iré a buscarlo entre los mercaderes de la ciudad.");
};

//*********************************************************************
//	Ich hab dein Buch
//*********************************************************************

INSTANCE DIA_Hyglas_HaveBook   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 38;
	condition   = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent   = FALSE;
	description = "Te he traído el libro.";
};
FUNC INT DIA_Hyglas_HaveBook_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Hyglas_BringBook))
	&& (Npc_HasItems (other,ItWr_Astronomy_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_HaveBook_15_00"); //Te he traído el libro.
	
	IF Mis_HyglasBringBook == LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_01"); //Muy bien, dámelo.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_02"); //Así que al final cambiaste de idea. Muy bien. ¿Dónde tienes el libro?
	};		
		
	B_GiveInvItems (other,self,ItWr_Astronomy_Mis,1);
	
	Mis_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP (XP_HyglasBringBook);
	
	
	AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_03"); //Ya puedes retirarte. Voy a estudiarlo.
	
};

//#######################################
//##
//##	Kapitel 4
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap4_EXIT_Condition;
	information = DIA_Hyglas_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm4
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap4_PERM   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 49;
	condition   = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent   = TRUE;
	description = "¿Has averiguado algo?";
};
FUNC INT DIA_Hyglas_Kap4_PERM_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_00"); //¿Has averiguado algo?
	
	if (Mis_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_01"); //No estoy seguro del todo, pero la constelación actual de las estrellas parece indicar muchos peligros.
		AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_02"); //¿Qué tipo de peligros?
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_03"); //Bueno, la estructura entre los mundos parece muy débil. Solo hace falta una pequeña fracción del poder que en otras circunstancias sería necesario para abrir un agujero en esta estructura.
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_04"); //Los demonios podrían valerse de estos portales para entrar en nuestro mundo sin encontrar resistencia.
		
		Hyglas_SendsToKarras = TRUE;
	}
	else if (Mis_HyglasBringBook == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_05"); //No, sigo esperando ese libro.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_06"); //Ya te dije que sigo investigando, pero tardaré más si no cuento con los materiales adecuados.
	};
	
};

//#######################################
//##
//##	Kapitel 5
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap5_EXIT_Condition;
	information = DIA_Hyglas_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hyglas_PICKPOCKET (C_INFO)
{
	npc			= KDF_510_Hyglas;
	nr			= 900;
	condition	= DIA_Hyglas_PICKPOCKET_Condition;
	information	= DIA_Hyglas_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Hyglas_PICKPOCKET_Condition()
{
	C_Beklauen (73, 200);
};
 
FUNC VOID DIA_Hyglas_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice		(DIA_Hyglas_PICKPOCKET, DIALOG_BACK 		,DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hyglas_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hyglas_PICKPOCKET);
};
	
func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hyglas_PICKPOCKET);
};

























