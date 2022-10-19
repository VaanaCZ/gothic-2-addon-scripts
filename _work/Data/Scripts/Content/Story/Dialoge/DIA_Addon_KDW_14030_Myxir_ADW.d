
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14030_Addon_Myxir_ADW;
	nr          = 999;
	condition   = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Myxir_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14030_Addon_Myxir_ADW;
	nr			= 900;
	condition	= DIA_Addon_Myxir_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Myxir_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Myxir_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Myxir_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Myxir_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Myxir_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Myxir_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Myxir_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_ADWHello_Condition;
	information	 = 	DIA_Addon_Myxir_ADWHello_Info;

	description	 = 	"�Alg�n descubrimiento nuevo?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //�Alg�n descubrimiento nuevo?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //�Los constructores de estas ruinas me fascinan!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Es una pena que su idioma est� tan muerto como ellos.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //(pensativo) Ni siquiera sus poderosos rituales e invocaciones pudieron salvarles.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //�Invocaciones?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Los constructores estaban fuertemente vinculados al mundo espiritual.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Si lo he entendido bien, cre�an estar en constante contacto con sus antepasados.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Realizaban regularmente invocaciones y rituales para pedir consejo a sus esp�ritus o aclarar sus ideas.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "�C�mo funcionaban los rituales de invocaci�n?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Los muertos vivientes que he conocido no tienen mucho que decir.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //�C�mo funcionaban los rituales de invocaci�n?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Los guardianes de los muertos ten�an determinadas f�rmulas para apaciguar a los esp�ritus.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Las descripciones que he encontrado por aqu�, sin embargo, resultan muy confusas. He obtenido pocas respuestas claras.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //Los no muertos que conozco nunca han tenido mucho que decir.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Los constructores no creaban no muertos sin alma como los zombis u otras criaturas malvadas.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //Esos esp�ritus eran almas de grandes guerreros, sacerdotes y gobernantes.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Hasta ahora, no he tenido duda de su existencia.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_PermADW		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Myxir_PermADW_Condition;
	information	 = 	DIA_Addon_Myxir_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"Si veo un fantasma, te lo dir�.";
};
func int DIA_Addon_Myxir_PermADW_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Si veo un esp�ritu, te lo comunicar�.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //(r�e) S�, te lo suplico.
};
///////////////////////////////////////////////////////////////////////
//	Info GeistTafel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistTafel		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistTafel_Condition;
	information	 = 	DIA_Addon_Myxir_GeistTafel_Info;

	description	 = 	"Me env�a Saturas.";
};

func int DIA_Addon_Myxir_GeistTafel_Condition ()
{
	if (Saturas_RiesenPlan == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistTafel_Info ()
{
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Me env�a Saturas.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Raven ha conseguido llegar al templo y ha bloqueado el portal desde dentro.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //�Saturas cree que ha conseguido informaci�n sobre el templo de un fantasma!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //(sorprendido) �Por Adanos!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Debe de haber invocado al sumo sacerdote Khardimon para preguntarle la forma de entrar al templo.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //�Seg�n los registros, su tumba estaba en las cuevas bajo la fortaleza!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //T� tendr�s que hacer lo mismo.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Pero ya no le puedes preguntar a Khardimon
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //La tumba del pr�ncipe guerrero Quarhodron est� supuestamente al oeste del valle.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Tendr�s que buscarla� y despertar a Quarhodron.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //En estas inscripciones explican c�mo puede invocar a un esp�ritu un fiel de Adanos.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //�Crees que eso funcionar�?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //He o�do un mont�n de incoherencias.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Por ejemplo, los escritos de Y'Berion, l�der de la Hermandad del Durmiente.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Pero creo al autor de ESTOS escritos.
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "�Hablas en serio?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "�Por qu� Quarhodron? �Por qu� no el sumo sacerdote Khardimon?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "La Hermandad del Durmiente no S�LO extendi�  mentiras.", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //�Por qu� Quarhodron? �Por qu� no el sumo sacerdote Khardimon?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Raven ha profanado la tumba de Khardimon con su invocaci�n. Eso est� claro.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Nosotros tenemos que buscar otro esp�ritu.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //La Hermandad del Durmiente no se dedic� a difundir S�LO mentiras. El Durmiente existi� de verdad.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //Pero no son sus mentiras lo que les resta credibilidad, sino sus propias palabras.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //Resultan m�s confusos que plausibles. Dejan en evidencia la cantidad de hierba del pantano que fumaban.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //La seriedad y la prudencia de las palabras de esta tablilla de piedra me convencen de que ESTE hombre escribi� la verdad.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //�Hablas en serio?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Quiero investigar todas las posibilidades.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Aunque s�lo exista una remota posibilidad de reunirnos con uno de los constructores, hay que aprovecharla.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Despu�s de todo, Raven lo ha conseguido.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Suponiendo que quisiera invocar al fantasma�", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Suponiendo que quisiera invocar a ese fantasma, �qu� tengo que hacer?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Buscar la tumba de Quarhodron al oeste del valle.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Para invocar su fantasma, hay que pronunciar las palabras de los guardianes de la muerte que te he anotado aqu�.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //Eso es todo. Ahora s�lo te queda encontrar la tumba.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //�Buena suerte, hijo!

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir quiere que despierte al fantasma del antiguo pr�ncipe guerrero Quarhodron y le pida consejo. Me dio un documento con las palabras que debo pronunciar en alto en la tumba de Quarhodron, al oeste."); 

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
};

///////////////////////////////////////////////////////////////////////
//	Info GeistPerm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistPerm		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistPerm_Condition;
	information	 = 	DIA_Addon_Myxir_GeistPerm_Info;

	description	 = 	"Vuelve a contarme lo de ese pr�ncipe guerrero Quarhodron.";
};

func int DIA_Addon_Myxir_GeistPerm_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistPerm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //Vuelve a contarme lo de ese pr�ncipe guerrero Quarhodron.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Tienes que encontrar su tumba e invocar su fantasma con las palabras de los guardianes de la muerte.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //He escrito aqu� las palabras. S�lo tienes que leerlas en alto.
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Myxir_TalkedToGhost_Info;

	description	 = 	"He hablado con Quarhodron.";
};
func int DIA_Addon_Myxir_TalkedToGhost_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	&& (SC_TalkedToGhost == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //He hablado con Quarhodron.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //(emocionado) �Entonces pudiste despertarlo de entre los muertos?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //Es incre�ble. Cada vez me fascinan m�s los constructores.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Qui�n sabe hasta d�nde habr�an llegado si a�n siguieran existiendo
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //�Qu� te dijo el fantasma?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Me dio algo con lo que podr� entrar al templo de Adanos.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Entonces ve a visitar a Saturas. Seguro que le interesa lo que tengas que contarle.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Deber�a informar a Saturas de que he despertado a Quarhodron."); 
	};
};

///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ens��ame ese idioma.";
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition ()
{
	if (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)	
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_ADW_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();

	if (DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach); 
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};	
	
	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,DIALOG_BACK,DIA_Addon_Myxir_ADW_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1 ()
{
	if (B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};

















