
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
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
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

	description	 = 	"¿Algún descubrimiento nuevo?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //¿Algún descubrimiento nuevo?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //¡Los constructores de estas ruinas me fascinan!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Es una pena que su idioma esté tan muerto como ellos.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //(pensativo) Ni siquiera sus poderosos rituales e invocaciones pudieron salvarles.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //¿Invocaciones?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Los constructores estaban fuertemente vinculados al mundo espiritual.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Si lo he entendido bien, creían estar en constante contacto con sus antepasados.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Realizaban regularmente invocaciones y rituales para pedir consejo a sus espíritus o aclarar sus ideas.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "¿Cómo funcionaban los rituales de invocación?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Los muertos vivientes que he conocido no tienen mucho que decir.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //¿Cómo funcionaban los rituales de invocación?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Los guardianes de los muertos tenían determinadas fórmulas para apaciguar a los espíritus.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Las descripciones que he encontrado por aquí, sin embargo, resultan muy confusas. He obtenido pocas respuestas claras.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //Los no muertos que conozco nunca han tenido mucho que decir.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Los constructores no creaban no muertos sin alma como los zombis u otras criaturas malvadas.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //Esos espíritus eran almas de grandes guerreros, sacerdotes y gobernantes.
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

	description	 = 	"Si veo un fantasma, te lo diré.";
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
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Si veo un espíritu, te lo comunicaré.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //(ríe) Sí, te lo suplico.
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

	description	 = 	"Me envía Saturas.";
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
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Me envía Saturas.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Raven ha conseguido llegar al templo y ha bloqueado el portal desde dentro.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //¡Saturas cree que ha conseguido información sobre el templo de un fantasma!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //(sorprendido) ¡Por Adanos!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Debe de haber invocado al sumo sacerdote Khardimon para preguntarle la forma de entrar al templo.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //¡Según los registros, su tumba estaba en las cuevas bajo la fortaleza!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //Tú tendrás que hacer lo mismo.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Pero ya no le puedes preguntar a Khardimon
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //La tumba del príncipe guerrero Quarhodron está supuestamente al oeste del valle.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Tendrás que buscarla… y despertar a Quarhodron.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //En estas inscripciones explican cómo puede invocar a un espíritu un fiel de Adanos.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //¿Crees que eso funcionará?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //He oído un montón de incoherencias.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Por ejemplo, los escritos de Y'Berion, líder de la Hermandad del Durmiente.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Pero creo al autor de ESTOS escritos.
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "¿Hablas en serio?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "¿Por qué Quarhodron? ¿Por qué no el sumo sacerdote Khardimon?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "La Hermandad del Durmiente no SÓLO extendió  mentiras.", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //¿Por qué Quarhodron? ¿Por qué no el sumo sacerdote Khardimon?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Raven ha profanado la tumba de Khardimon con su invocación. Eso está claro.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Nosotros tenemos que buscar otro espíritu.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //La Hermandad del Durmiente no se dedicó a difundir SÓLO mentiras. El Durmiente existió de verdad.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //Pero no son sus mentiras lo que les resta credibilidad, sino sus propias palabras.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //Resultan más confusos que plausibles. Dejan en evidencia la cantidad de hierba del pantano que fumaban.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //La seriedad y la prudencia de las palabras de esta tablilla de piedra me convencen de que ESTE hombre escribió la verdad.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //¿Hablas en serio?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Quiero investigar todas las posibilidades.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Aunque sólo exista una remota posibilidad de reunirnos con uno de los constructores, hay que aprovecharla.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Después de todo, Raven lo ha conseguido.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Suponiendo que quisiera invocar al fantasma…", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Suponiendo que quisiera invocar a ese fantasma, ¿qué tengo que hacer?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Buscar la tumba de Quarhodron al oeste del valle.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Para invocar su fantasma, hay que pronunciar las palabras de los guardianes de la muerte que te he anotado aquí.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //Eso es todo. Ahora sólo te queda encontrar la tumba.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //¡Buena suerte, hijo!

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir quiere que despierte al fantasma del antiguo príncipe guerrero Quarhodron y le pida consejo. Me dio un documento con las palabras que debo pronunciar en alto en la tumba de Quarhodron, al oeste."); 

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

	description	 = 	"Vuelve a contarme lo de ese príncipe guerrero Quarhodron.";
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
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //Vuelve a contarme lo de ese príncipe guerrero Quarhodron.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Tienes que encontrar su tumba e invocar su fantasma con las palabras de los guardianes de la muerte.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //He escrito aquí las palabras. Sólo tienes que leerlas en alto.
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
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //(emocionado) ¿Entonces pudiste despertarlo de entre los muertos?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //Es increíble. Cada vez me fascinan más los constructores.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Quién sabe hasta dónde habrían llegado si aún siguieran existiendo
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //¿Qué te dijo el fantasma?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Me dio algo con lo que podré entrar al templo de Adanos.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Entonces ve a visitar a Saturas. Seguro que le interesa lo que tengas que contarle.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Debería informar a Saturas de que he despertado a Quarhodron."); 
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

	description	 = 	"Enséñame ese idioma.";
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

















