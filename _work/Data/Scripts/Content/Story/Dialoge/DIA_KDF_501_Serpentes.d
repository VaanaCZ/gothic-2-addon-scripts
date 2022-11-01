///////////////////////////////////////////////////////////////////////
//	Info Kap1 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap1_EXIT_Condition;
	information = DIA_Serpentes_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOTALK
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOTALK		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOTALK_Condition;
	information	 = 	DIA_Serpentes_NOTALK_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Serpentes_NOTALK_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOTALK_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOTALK_10_00"); //(Con sorna) ¿Osas dirigirme la palabra, novicio? Vuelve al trabajo.
	
	Info_ClearChoices (DIA_Serpentes_NOTALK);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"Solo iba (FINAL)",DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"Tengo una pregunta más...",DIA_Serpentes_NOTALK_QUESTION);
};
FUNC VOID DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output (other, self, "DIA_Serpentes_NOTALK_QUESTION_15_00"); //Tengo una pregunta más...
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_01"); //(Furioso) Parece que no quieres entenderlo. Yo decido cuando considero adecuado hablar contigo. ¿Quién te crees que eres?
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_02"); //¡Y ahora vuelve al trabajo!
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Serpentes_NOTALK_EXIT()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_GOAWAY_Condition;
	information	 = 	DIA_Serpentes_GOAWAY_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_GOAWAY_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOTALK)
	&& Npc_IsInState (self, ZS_Talk)
	&& !(Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_GOAWAY_10_00"); //¡Tu presencia aquí no solo demuestra tu falta de respeto, sino también tu estupidez, novicio!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info YOURSTORY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_YOURSTORY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	24;
	condition	 = 	DIA_Serpentes_YOURSTORY_Condition;
	information	 = 	DIA_Serpentes_YOURSTORY_Info;
	permanent	 =  FALSE;
	description	 = 	"He oído que has superado la prueba del fuego.";
};
func int DIA_Serpentes_YOURSTORY_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_TEST)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN)== FALSE)
	&& (MIS_GOLEM != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_YOURSTORY_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_00"); //He oído que has superado la prueba del fuego.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_01"); //(Con suficiencia) Te digo una cosa, con toda humildad. Todo el que lo ha intentado ha muerto.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_02"); //(Condescendiente) No deberías someterte a esta prueba. Tu espíritu es débil. Es mejor que sirvas en el monasterio y quizás serás elegido en unos cuantos años.
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_03"); //Voy a superar la prueba.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_04"); //Si es voluntad de Innos lo harás. Pero si no... fracasarás.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_TEST		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_TEST_Condition;
	information	 = 	DIA_Serpentes_TEST_Info;
	permanent	 = 	FALSE;
	description	 = 	"Estoy listo para afrontar tu prueba, maestro.";
};
func int DIA_Serpentes_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_TEST_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_TEST_15_00"); //Estoy listo para afrontar tu prueba, maestro.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_01"); //Así que quieres someterte a la prueba. Solo un novicio valiente exige la prueba, pero hace falta algo más que valor.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_02"); //¿Eres lo bastante inteligente para superar la prueba? ¿Eres lo bastante fuerte para afrontar los peligros que te aguardan?
	AI_Output (self, other, "DIA_Serpentes_TEST_10_03"); //Si no, lo pagarás con la vida.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_04"); //Y ahora, presta atención a la prueba: en el Lugar de las Piedras, busca al nonato. Encuentra al que antaño fue convocado.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_05"); //Vence al que no puede ser vencido (mídete contra la roca viva, lucha con la piedra imperecedera) y destrúyelo.
	
	//----- Der Magische Golem ----
	Wld_InsertNpc 	(MagicGolem, 			"FP_MAGICGOLEM");
	Magic_Golem		= Hlp_GetNpc (MagicGolem);	//Damits auch initialisiert ist!!


	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Golem,LOG_RUNNING);
	B_LogEntry (TOPIC_Golem,"Serpentes me ha puesto a prueba. Quiere que ''encuentre lo que una vez fue convocado'', la roca viva, y que la derrote.");
};
///////////////////////////////////////////////////////////////////////
//	Info NOIDEA
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOIDEA		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOIDEA_Condition;
	information	 = 	DIA_Serpentes_NOIDEA_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Qué tipo de criatura sería esa?";
};
func int DIA_Serpentes_NOIDEA_Condition ()
{	
	if (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOIDEA_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_NOIDEA_15_00"); //¿Roca viva...? ¿Qué clase de criatura puede ser?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_01"); //Ya te he contado todo. (burlón) ¿Encuentras demasiado difícil esta prueba?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_02"); //Ahora sabrás lo que significa someterme a la prueba del fuego: no responderé más preguntas.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOHELP
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOHELP		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOHELP_Condition;
	information	 = 	DIA_Serpentes_NOHELP_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_NOHELP_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOIDEA)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	&& (MIS_GOLEM == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (other.guild == GIL_NOV)
	&& ((Npc_KnowsInfo (other, DIA_Ulthar_TEST) == FALSE)
	|| Npc_KnowsInfo (other,DIA_Serpentes_YOURSTORY))
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOHELP_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOHELP_10_00"); //(Con desprecio) ¡Ve a llevar a cabo tu cometido, novicio!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	3;
	condition	 = 	DIA_Serpentes_SUCCESS_Condition;
	information	 = 	DIA_Serpentes_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"He derrotado al gólem.";
};
func int DIA_Serpentes_SUCCESS_Condition ()
{	
	if (Npc_IsDead (MagicGolem))
	&& (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_SUCCESS_Info ()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc (NOV_608_Garwig);
	
	AI_Output (other, self, "DIA_Serpentes_SUCCESS_15_00"); //He derrotado al gólem.
	AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_01"); //¿Qué? ¿Lo has conseguido? Pero sin el martillo de Innos, es imposible que hayas destruido al gólem.
	
	if (Npc_IsDead (garwig))
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_02"); //(Triunfante) ¡Te has traicionado! ¡Tú mataste a Garwig!
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_03"); //¡¡¡Sufre el castigo que merece el asesino de un siervo de Innos!!!
		
		AI_StopProcessInfos (self);
		B_Attack  (self, other, AR_HumanMurderedHuman, 0);
	}
	else 
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_04"); //(Arrepentido) No obstante, he de admitir que has cumplido la tarea que te he encomendado.
	};
	if (Npc_HasItems (other, Holy_Hammer_Mis) >= 1)
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_05"); //Y será mejor que me quede con el martillo.
		
		Npc_RemoveInvItems (other, Holy_Hammer_MIS,1); 
		Wld_InsertItem (Holy_Hammer_MIS,"FP_HAMMER");
	};
	
	MIS_GOLEM = LOG_SUCCESS;
	B_GivePlayerXP (XP_GOLEM);
	
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_PERM   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 99;
	condition   = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent   = TRUE;

	description = "¿Quieres contarme algo más?";
};
FUNC INT DIA_Serpentes_PERM_Condition()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Serpentes_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Serpentes_PERM_Info()
{
	AI_Output (other, self, "DIA_Serpentes_PERM_15_00"); //¿Quieres contarme algo más?

		if (hero.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_01"); //Por ahora no, hermano.
		}
		else
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_02"); //Puedes retirarte. Ya sabes lo que tienes que hacer.
		};
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 2
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap2_EXIT_Condition;
	information = DIA_Serpentes_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap3 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap3_EXIT_Condition;
	information = DIA_Serpentes_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteile
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteile		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	30;
	condition	 = 	DIA_Serpentes_MinenAnteile_Condition;
	information	 = 	DIA_Serpentes_MinenAnteile_Info;
	important	 = 	TRUE;
};

func int DIA_Serpentes_MinenAnteile_Condition ()
{
	if (Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Serpentes_MinenAnteile_Info ()
{
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_00"); //No tan deprisa. Tengo otra misión para ti.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_15_01"); //(Suspira) ¿Cuál es?
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_02"); //Ahora que eres miembro de la Hermandad del Fuego, debes cumplir con las obligaciones que conlleva la pertenencia a la iglesia.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_03"); //La iglesia no solo se ocupa de asuntos mágicos. Como bien sabes, también es la autoridad máxima en la administración de justicia.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_04"); //El último caso que nos han planteado abre un abismo insondable y ha de solucionarse de una vez por todas.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Ya tengo bastantes problemas. Búscate a otro.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "¿De qué va esto?", DIA_Serpentes_MinenAnteile_was );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "¿No es asunto de la milicia?", DIA_Serpentes_MinenAnteile_miliz );
	}
	else
	{
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_05"); //En este asunto podría venirnos bien un mercenario a sueldo de tu calaña.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Ya tengo bastantes problemas. Búscate a otro.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "¿A quién debo matar?", DIA_Serpentes_MinenAnteile_KillSLD );
	};
};
func void DIA_Serpentes_MinenAnteile_miliz ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_miliz_15_00"); //¿No es asunto de la milicia?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_miliz_10_01"); //La milicia solo es responsable de la ciudad. Este asunto tiene repercusiones de mayor alcance.

};

func void DIA_Serpentes_MinenAnteile_nein ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_nein_15_00"); //Ya tengo bastantes problemas. Búscate a otro.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_01"); //(Con enojo) Esto es indignante. Si no estás dispuesto a servir a la Hermandad, jamás alcanzarás los círculos superiores de la magia.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_02"); //Considérate amonestado. Espero que no vuelva a suceder, o te irá mal.
	AI_StopProcessInfos (self);
};

func void DIA_Serpentes_MinenAnteile_was ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_15_00"); //¿De qué va esto?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_01"); //En la ciudad, alguien ha vendido participaciones falsas de las minas de la antigua colonia penal.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_02"); //La verdad es que estos papeles carecen de valor y de importancia, pero pueden armar líos entre la gente, y no nos lo podemos permitir ahora mismo.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_03"); //Se supone que el estafador ha abordado a todos los comerciantes honrados de la ciudad y del país, y a algunos ha conseguido venderles las participaciones falsas.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_04"); //Encuentra a este malhechor y tráele ante este tribunal. En tiempos tan malos hay que erradicar a los estafadores y a los saqueadores.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_05"); //Debemos darle un castigo ejemplar para disuadir al resto de la chusma.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Intentaré solucionar el asunto.", DIA_Serpentes_MinenAnteile_was_ja );

};
func void DIA_Serpentes_MinenAnteile_was_ja ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_00"); //Intentaré solucionar el asunto.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_01"); //Una cosa más. Cuando visites a los comerciantes, que no se enteren que buscas participaciones de las minas.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_02"); //Creo que querrán venderlas, y no te las ofrecerían si se percataran de tu relación con la iglesia, ¿entiendes?
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_03"); //Sí.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_04"); //En ese caso, ponte manos a la obra. Ojalá tengas éxito, hermano.
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
	
	MIS_Serpentes_MinenAnteil_KDF = LOG_RUNNING;	

	 if ((Npc_IsDead(Salandril))== FALSE)
	 {
		 CreateInvItems (Salandril, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(VLK_416_Matteo))== FALSE)
	 {
		 CreateInvItems (VLK_416_Matteo, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_413_Bosper))== FALSE)
	 {
		 CreateInvItems (VLK_413_Bosper, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_409_Zuris))== FALSE)
	 {
		 CreateInvItems (VLK_409_Zuris, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_911_Elena))== FALSE)
	 {
		 CreateInvItems (BAU_911_Elena, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	 {
		 CreateInvItems (BAU_970_Orlan, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_407_Hakon))== FALSE)
	 {
		 CreateInvItems (VLK_407_Hakon, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_936_Rosi))== FALSE)
	 {
		 CreateInvItems (BAU_936_Rosi, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_468_Canthar))== FALSE)
	 {
		 CreateInvItems (VLK_468_Canthar, 	ItWr_MinenAnteil_Mis, 3); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 3;
	 };
	SalandrilVerteilteMinenAnteil =	SalandrilMinenAnteil_MAINCounter;

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Alguien está vendiendo concesiones ilegales de minas de mineral, y se enriquece. Debo descubrir quién las está vendiendo a los mercaderes de por aquí. Serpentes quiere todos los documentos falsificados."); 
};

func void DIA_Serpentes_MinenAnteile_KillSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_Kill_15_00"); //¿A quién debo matar?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_01"); //Por el amor de Innos. A nadie, desde luego. El asunto requiere un poco más de tacto, patán.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_02"); //Salandril, el alquimista de la parte alta de la ciudad, es culpable de un delito grave y tiene que ser castigado por ello.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_03"); //Sin embargo, se ha negado a venir al monasterio para ser juzgado. Tráelo.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_04"); //Nos da igual cómo lo logres. Por supuesto, se te recompensará.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "¿No es asunto de la milicia?", DIA_Serpentes_MinenAnteile_miliz );
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "No hay problema. Me ocuparé de ello.", DIA_Serpentes_MinenAnteile_was_jaSLD );
};

var int MIS_Serpentes_BringSalandril_SLD;
func void DIA_Serpentes_MinenAnteile_was_jaSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_jaSLD_15_00"); //No hay problema. Me ocuparé de ello.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_jaSLD_10_01"); //Bien. Esperamos tener noticias tuyas en unos días.
	MIS_Serpentes_BringSalandril_SLD = LOG_RUNNING;
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Voy a llevar a Salandril, un alquimista del barrio alto de Khorinis, al monasterio, para sea juzgado. En realidad no me importa lo que se supone que ha hecho, siempre y cuando me paguen."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteileBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteileBringen		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	2;
	condition	 = 	DIA_Serpentes_MinenAnteileBringen_Condition;
	information	 = 	DIA_Serpentes_MinenAnteileBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Acerca de las participaciones de la mina falsificadas...";
};

func int DIA_Serpentes_MinenAnteileBringen_Condition ()
{
	if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_MinenAnteil_Mis))
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

var int SerpentesMinenAnteilCounter;
func void DIA_Serpentes_MinenAnteileBringen_Info ()
{
		var int SerpentesMinenAnteilCount;
		var int XP_BringSerpentesMinenAnteils;
		var int SerpentesMinenAnteilOffer;
		var int SerpentesMinenAnteilGeld;
	
		SerpentesMinenAnteilCount = Npc_HasItems(other, ItWr_MinenAnteil_Mis);
		SerpentesMinenAnteilOffer = 200; 

		 if (SerpentesMinenAnteilCount == 1)
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_00"); //He logrado hacerme con una participación de las minas.
				B_GivePlayerXP (XP_BringSerpentesMinenAnteil);
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,1);
				SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_01"); //He logrado hacerme con unas cuantas participaciones de las minas.
	
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,  SerpentesMinenAnteilCount);
	
				XP_BringSerpentesMinenAnteils = (SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil);
				SerpentesMinenAnteilCounter = (SerpentesMinenAnteilCounter + SerpentesMinenAnteilCount); 
	
				B_GivePlayerXP (XP_BringSerpentesMinenAnteils);
			};

		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCount;
		
		var string MinenAnteilText;
		var string MinenAnteilLeft;
		MinenAnteilLeft = IntToString (SalandrilMinenAnteil_MAINCounter);
		MinenAnteilText = ConcatStrings(MinenAnteilLeft, PRINT_NumberLeft);
		AI_PrintScreen	(MinenAnteilText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);

		if (SerpentesMinenAnteilCounter < SalandrilVerteilteMinenAnteil)
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_02"); //Muy bien. Debes retirarlas a todas de la circulación, pues son un veneno para la gente. Tráemelas todas.
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_03"); //Ten. Te proporcionaré los medios pertinentes.
		}
		else if (SerpentesMinenAnteilCounter == SalandrilVerteilteMinenAnteil) //Joly:kein Exploid
		{
			AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_04"); //Creo que ésas eran todas.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_05"); //Muy bien. Te has ganado una recompensa.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_06"); //Toma este amuleto protector. Te ayudará en los caminos que recorrerás en el futuro.
			CreateInvItems (self, ItAm_Prot_Mage_01, 1); 
			B_GiveInvItems (self, other, ItAm_Prot_Mage_01, 1);
		}
		else	//Joly: zur Sicherheit!
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_07"); //Ésta ya es la última, ¿no?
		};
		
		SerpentesMinenAnteilGeld	= (SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer);
		
		CreateInvItems (self, ItMi_Gold, SerpentesMinenAnteilGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, SerpentesMinenAnteilGeld);
};

///////////////////////////////////////////////////////////////////////
//	Info GotSalandril
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOTSalandril		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	32;
	condition	 = 	DIA_Serpentes_GOTSalandril_Condition;
	information	 = 	DIA_Serpentes_GOTSalandril_Info;

	description	 = 	"Sé quien puso en circulación las participaciones de las minas.";
};

func int DIA_Serpentes_GOTSalandril_Condition ()
{
	if (SC_KnowsProspektorSalandril == TRUE)
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

func void DIA_Serpentes_GOTSalandril_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_GOTSalandril_15_00"); //Sé quien puso en circulación las participaciones de las minas. Lo hizo Salandril, el alquimista de la parte alta de la ciudad.
	AI_Output			(self, other, "DIA_Serpentes_GOTSalandril_10_01"); //Entonces tráelo. Tenemos que hablar con él.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilHere
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilHERE		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilHERE_Condition;
	information	 = 	DIA_Serpentes_SalandrilHERE_Info;

	description	 = 	"Salandril está aquí, en el monasterio.";
};

func int DIA_Serpentes_SalandrilHERE_Condition ()
{
	if (Npc_GetDistToWP(Salandril,"ALTAR")<10000) 
		{
			if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
				{
					return TRUE;
				}
			else if (Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			&& (hero.guild == GIL_KDF) 
				{
					return TRUE;
				}
			else
				{
					return FALSE;
				};
		};
};

func void DIA_Serpentes_SalandrilHERE_Info ()
{
	AI_Output		(other, self, "DIA_Serpentes_SalandrilHERE_15_00"); //Salandril está aquí, en el monasterio.
	AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_01"); //Muy bien. Luego nos ocuparemos de él.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_02"); //Aquí tienes tu recompensa. Y no digas ni una palabra de esto, ¿entiendes?
		CreateInvItems (self, ItMi_Gold, 400);									
		B_GiveInvItems (self, other, ItMi_Gold, 400);					
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_SalandrilInKloster);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilDEAD
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilDEAD		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilDEAD_Condition;
	information	 = 	DIA_Serpentes_SalandrilDEAD_Info;

	description	 = 	"Salandril ha muerto.";
};

func int DIA_Serpentes_SalandrilDEAD_Condition ()
{
	if  (
			(Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			||  (
					((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
					&& (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING)
				)
		)
		&& (Npc_IsDead(Salandril))
		{
				return TRUE;
		};
};

func void DIA_Serpentes_SalandrilDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_SalandrilDEAD_15_00"); //Salandril ha muerto.
	AI_Output			(self, other, "DIA_Serpentes_SalandrilDEAD_10_01"); //Parece que su mala obra no ha quedado impune. Que Innos se apiade de su pobre alma.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_Ambient);
};
	
//##################################################################
//##
//##	Kapitel 4
//##
//##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Serpentes_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap4_EXIT_Condition;
	information = DIA_Serpentes_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 5
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap5 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap5_EXIT_Condition;
	information = DIA_Serpentes_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Serpentes_PICKPOCKET (C_INFO)
{
	npc			= KDF_501_Serpentes;
	nr			= 900;
	condition	= DIA_Serpentes_PICKPOCKET_Condition;
	information	= DIA_Serpentes_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Serpentes_PICKPOCKET_Condition()
{
	C_Beklauen (86, 380);
};
 
FUNC VOID DIA_Serpentes_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Serpentes_PICKPOCKET);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_BACK 		,DIA_Serpentes_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Serpentes_PICKPOCKET_DoIt);
};

func void DIA_Serpentes_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};
	
func void DIA_Serpentes_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};





















