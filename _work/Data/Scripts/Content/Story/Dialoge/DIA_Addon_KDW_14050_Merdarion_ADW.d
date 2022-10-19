
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14050_Addon_Merdarion_ADW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information = DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14050_Addon_Merdarion_ADW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Merdarion_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_ADW_PICKPOCKET);
};
*/
 ///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ADWHello_Condition;
	information	 = 	DIA_Addon_Merdarion_ADWHello_Info;

	description	 = 	"�Qu� tal va todo?";
};

func int DIA_Addon_Merdarion_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Back ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_Back_15_00"); //Ya he o�do suficiente.
	Info_ClearChoices	(DIA_Addon_Merdarion_ADWHello);
};
func void DIA_Addon_Merdarion_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_15_00"); //�Qu� tal todo?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_01"); //(escuchando) Escucha� Curioso, �verdad?
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_15_02"); //Mmh...
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_03"); //Ests piedras de teletransporte no parecen funcionar, pero se sigue oyendo el murmullo.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_06_04"); //Aunque no est�n activas, a�n queda energ�a en ellas.

	Info_ClearChoices	(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "�Qu� da poder a las piedras de teletransporte?", DIA_Addon_Merdarion_ADWHello_reaktor );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "�Qu� crees que hay que hacer para volver a activarlas?", DIA_Addon_Merdarion_ADWHello_was );
};
func void DIA_Addon_Merdarion_ADWHello_was ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_was_15_00"); //�Qu� crees que hay que hacer para volver a activarlas?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_01"); //No tengo ni idea. Necesito pruebas que confirmen mis sospechas.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_02"); //Hace d�as me dio la sensaci�n de que ya hab�a visto antes este tipo de construcci�n.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_was_06_03"); //Sospecho que hay que suministrarles una cantidad de energ�a m�gica gigantesca para que vuelvan a funcionar.
	
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "�D�nde hab�as visto estas piedras de teletransporte?", DIA_Addon_Merdarion_ADWHello_wo );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "�Qu� podr�a proporcionar una energ�a m�gica de esta magnitud�?", DIA_Addon_Merdarion_ADWHello_focus );
};
func void DIA_Addon_Merdarion_ADWHello_focus ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_00"); //Qu� podr�a proporcionarnos tanta energ�a m�gica
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_01"); //S�lo se me ocurre una cosa. Un foco de piedra.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_02"); //Hablo de uno de los cinco focos de piedra que se usaron para crear la barrera m�gica en el Valle de Minas.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focus_06_03"); //Por lo que s�, hace tiempo tuviste que recuperarlos para nosotros.
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focus_15_04"); //S�, lo recuerdo.
	
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Dijiste que quer�as pruebas para sacar tus conclusiones.", DIA_Addon_Merdarion_ADWHello_focusProof );
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "�D�nde est�n ahora los focos de piedra?", DIA_Addon_Merdarion_ADWHello_focusWo );
};
func void DIA_Addon_Merdarion_ADWHello_focusWo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focusWo_15_00"); //�D�nde est�n ahora los focos de piedra?
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_01"); //Me los confiaron a m�. Se supone que debo guardarlos a salvo hasta que les encontremos otra utilidad.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusWo_06_02"); //Seg�n parece, ha llegado ese momento.
	Info_AddChoice	(DIA_Addon_Merdarion_ADWHello, "Ya he o�do bastante.", DIA_Addon_Merdarion_ADWHello_Back );
};
func void DIA_Addon_Merdarion_ADWHello_focusProof ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_ADWHello_focusProof_15_00"); //Dec�as que necesitabas pruebas de tus sospechas.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_01"); //Deber�a de haber un foco m�gico conectado a estas piedras.
	AI_Output			(self, other, "DIA_Addon_Merdarion_ADWHello_focusProof_06_02"); //Pero no s� d�nde.
};
func void DIA_Addon_Merdarion_ADWHello_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_wo_15_00"); //�D�nde has visto antes las piedras de teletransporte?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_01"); //T� tambi�n estabas en la colonia penal. �Nunca te fijaste en esas piedras?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_wo_06_02"); //Seguro que a�n siguen por all�.
};
func void DIA_Addon_Merdarion_ADWHello_reaktor ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADWHello_reaktor_15_00"); //�Qu� hacen las piedras de teletransporte?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_01"); //Los constructores eran un pueblo muy desarrollado.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_02"); //Utilizaban propiedades m�gicas desconocidas para nosotros.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_03"); //Crearon una red de piedras de teletransporte para desplazarse r�pidamente de un punto de la ciudad a otro.
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADWHello_reaktor_06_04"); //Esta piedra DE AQU� constituye claramente una especie de centro.
};

///////////////////////////////////////////////////////////////////////
//	Info FokusGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FokusGeben		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_FokusGeben_Condition;
	information	 = 	DIA_Addon_Merdarion_FokusGeben_Info;

	description	 = 	"Dame un foco de piedra.";
};

func int DIA_Addon_Merdarion_FokusGeben_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_FokusGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_FokusGeben_15_00"); //Dame un foco de piedra. Intentar� hacer funcionar el teletransporte.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FokusGeben_06_01"); //Muy bien. Pero mucho cuidado, �me oyes?
	AI_Output	(self, other, "DIA_Addon_Merdarion_FokusGeben_06_02"); //Saturas me corta la cabeza si los perdemos.
	CreateInvItems (self, ItMi_Focus, 1);									
	B_GiveInvItems (self, other, ItMi_Focus, 1);			
	
	Log_CreateTopic (TOPIC_Addon_TeleportsADW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsADW,"El Mago de Agua Merdarion me dio uno de esos focos de piedra que se usaron para crear la Barrera del Valle de las Minas. Debo intentar activar una de las piedras de teletransporte."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FirstFocus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_FirstFocus		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_FirstFocus_Condition;
	information	 = 	DIA_Addon_Merdarion_FirstFocus_Info;

	description	 = 	"He activado una de las piedras de teletransporte.";
};

func int DIA_Addon_Merdarion_FirstFocus_Condition ()
{
	if (TriggeredTeleporterADW != 0)
		{
			return TRUE;
		};
};
var int Merdarion_GotFocusCount;
func void DIA_Addon_Merdarion_FirstFocus_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_FirstFocus_15_00"); //He activado una de la spiedras de teletransporte.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_01"); //Ya veo, ya. As� que yo ten�a raz�n.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_02"); //Se lo he comentado a los dem�s.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_03"); //Queremos que intentes activar todas las piedras de teletransporte.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_04"); //Ser�a muy �til para nuestras investigaciones desplazarnos r�pidamente de un sitio a otro de la ciudad.
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_05"); //Aqu� tienes otro foco de piedra.
	CreateInvItems (self, ItMi_Focus, 1);									
	B_GiveInvItems (self, other, ItMi_Focus, 1);		
	Merdarion_GotFocusCount = 1;
	AI_Output	(self, other, "DIA_Addon_Merdarion_FirstFocus_06_06"); //Si puedes, act�valas todas.
	AI_Output	(other, self, "DIA_Addon_Merdarion_FirstFocus_15_07"); //Lo intentar�.
	B_GivePlayerXP (XP_Addon_ActivatedTeleportStone);
	B_LogEntry (TOPIC_Addon_TeleportsADW,"Merdarion me ha dado otro foco de piedra. Se supone que debo intentar activar la piedra de teletransporte. Me dar� otro foco en cuanto funcione la siguiente piedra de teletransporte."); 
};

///////////////////////////////////////////////////////////////////////
//	Info ActivateTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ActivateTeleports		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent	 = 	TRUE;

	description	 = 	"He activado otra piedra de teletransporte.";
};
func int DIA_Addon_Merdarion_ActivateTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_FirstFocus))
	&&	(TriggeredTeleporterADW > Merdarion_GotFocusCount)
	&& (Merdarion_GotFocusCount < 6)
			{
				return TRUE;
			};
};

var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

func void DIA_Addon_Merdarion_ActivateTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_00"); //He activado otra piedra de teletransporte.

	if (SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_01"); //Dame el siguiente foco.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_02"); //Pues claro. Aqu� tienes.
		CreateInvItems (self, ItMi_Focus, 1);									
		B_GiveInvItems (self, other, ItMi_Focus, 1);		
	};
	
	if (DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_03"); //�Ha sido dif�cil?
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_04"); //Depende de c�mo se mire. Me vendr�a bien un poco de ayuda.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_05"); //Puedo darte algo de oro. �Eso te ayudar�a?
		AI_Output	(other, self, "DIA_Addon_Merdarion_ActivateTeleports_15_06"); //No me vendr�a mal.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_07"); //A ver
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	
	if (SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_08"); //Lo has hecho muy bien. S�lo tengo elogios para tu trabajo.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_09"); //Todas vuelven a funcionar. Una vista impresionante, �no te parece?
	};
	
	AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_10"); //Toma unas monedas de oro.
	B_GivePlayerXP (XP_Addon_ActivatedTeleportStone);
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);		
	Merdarion_GotFocusCount = (Merdarion_GotFocusCount + 1);
	
	if (Merdarion_GotFocusCount >= 1)
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
 	&& (MIS_Saturas_LookingForHousesOfRulers == 0)
 	{
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_11"); //Oh, por cierto. Antes de que me olvide, Saturas quer�a hablar contigo.
		AI_Output	(self, other, "DIA_Addon_Merdarion_ActivateTeleports_06_12"); //Ve a verlo en cuanto puedas.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachMana
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_PreTeachMana		(C_INFO)
{
	npc		 = 	KDW_14050_Addon_Merdarion_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information	 = 	DIA_Addon_Merdarion_ADW_PreTeachMana_Info;

	description	 = 	"�Puedes ense�arme tus habilidades m�gicas?";
};
func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_ADWHello))
		{
			return TRUE;
		};
};
func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_ADW_PreTeachMana_15_00"); //�Puedes ense�arme tus habilidades m�gicas?
	AI_Output	(self, other, "DIA_Addon_Merdarion_ADW_PreTeachMana_06_01"); //Puedo decirte c�mo incrementar tu poder m�gico.
	Merdarion_Addon_TeachMana = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher,"Merdarion puede aumentar mi man�."); 
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH_MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_ADW_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDW_14050_Addon_Merdarion_ADW;
	nr 			 =  99;
	condition	 = 	DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information	 = 	DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero aumentar mis poderes m�gicos.";
};
var int Merdarion_ADW_Empty;
func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition ()
{	
		if (Merdarion_ADW_Empty == FALSE)
		&& (Merdarion_Addon_TeachMana == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00"); //Quiero incrementar mi poder m�gico.
		
		Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
		Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
		Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5		, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)  
	{
		AI_Output (self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00"); //Lo que pides escapa a mis posibilidades.
		AI_Output (self, other, "DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01"); //Ya no te puedo ense�ar nada m�s.
		Merdarion_ADW_Empty = TRUE;
	};
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH);
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
	Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};
FUNC VOID DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH);
	
	Info_ClearChoices   (DIA_Addon_Merdarion_ADW_TEACH_MANA);	
	Info_AddChoice 		(DIA_Addon_Merdarion_ADW_TEACH_MANA,DIALOG_BACK,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice		(DIA_Addon_Merdarion_ADW_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};












