///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ingmar_EXIT   (C_INFO)
{
	npc         = Pal_201_Ingmar;
	nr          = 999;
	condition   = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ingmar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Hallo		(C_INFO)
{
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  2;
	condition	 = 	DIA_Ingmar_Hallo_Condition;
	information	 = 	DIA_Ingmar_Hallo_Info;
	permanent    =  TRUE;
	important	 = 	TRUE;
};
//------------------------------------
var int DIA_Ingmar_Hallo_permanent;
//------------------------------------
func int DIA_Ingmar_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Ingmar_Hallo_permanent == FALSE)
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Hallo_Info ()
{
	if (EnterOW_Kapitel2 == FALSE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_00"); //De acuerdo con los informes que he recibido, el Valle de las Minas es un lugar peligroso.
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_01"); //Aseg�rate de equiparte adecuadamente antes de salir para all�.
	}
	else if (MIS_OLDWORLD == LOG_SUCCESS)
	&& 		(LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_02"); //La situaci�n en el Valle de las Minas es bastante preocupante. Pero planearemos algo para superar los peligros y sacar de all� a nuestros muchachos con el mineral.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_03"); //Cre�a que hab�as venido a hablar con lord Hagen. Deber�as hacerlo.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Krieg mit den Orks 
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Krieg		(C_INFO)
{
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  99;
	condition	 = 	DIA_Ingmar_Krieg_Condition;
	information	 = 	DIA_Ingmar_Krieg_Info;
	permanent    =  FALSE;
	description	 =  "�Qu� tal van las cosas en el continente?";
};
func int DIA_Ingmar_Krieg_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Krieg_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_Krieg_15_00"); //�Qu� tal van las cosas en el continente?
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_01"); //La guerra todav�a no se ha ganado, aunque las tropas reales ya est�n haciendo retroceder a los orcos.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_02"); //No obstante, hay peque�as bandas de orcos que se congregan e varios lugares e intentan dividir nuestro ej�rcito.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_03"); //Luchan sin honor y sin fe. Por ello, al final, acabaremos ganando.
};	

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_CanTeach		(C_INFO)
{ 
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  100;
	condition	 = 	DIA_Ingmar_CanTeach_Condition;
	information	 = 	DIA_Ingmar_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"�Puedes ense�arme?";
};

func int DIA_Ingmar_CanTeach_Condition ()
{	
	if (Ingmar_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Ingmar_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_CanTeach_15_00"); //�Puedes ense�arme?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_01"); //Te puedo ense�ar a reforzar los brazos para que as� puedas blandir las armas con mayor efectividad.
			Ingmar_TeachSTR = TRUE;
			B_LogEntry (TOPIC_CityTeacher,"Ingmar, el palad�n, puede ayudarme a ser m�s fuerte.");
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_02"); //Solo instruyo a los miembros de nuestra orden.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Teach		(C_INFO)
{
	npc		  	 = 	Pal_201_Ingmar;
	nr			 = 	6;
	condition	 = 	DIA_Ingmar_Teach_Condition;
	information	 = 	DIA_Ingmar_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero fortalecerme.";
};
func int DIA_Ingmar_Teach_Condition ()
{	
	if (Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Teach_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_Teach_15_00"); //Quiero ser m�s fuerte.
	
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
};
func void DIA_Ingmar_Teach_BACK()
{
	if (other.attribute [ATR_STRENGTH] >= T_MAX)
	{
		AI_Output (self, other, "DIA_Ingmar_Teach_06_00"); //Eres fuerte como un troll. No te puedo ense�ar nada m�s.
	};
	Info_ClearChoices (DIA_Ingmar_TEACH);
};
func void DIA_Ingmar_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_TEACH_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
	
};
func void DIA_Ingmar_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
	
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

INSTANCE DIA_Ingmar_KAP3_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP3_EXIT_Condition;
	information	= DIA_Ingmar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Ingmar_KAP4_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP4_EXIT_Condition;
	information	= DIA_Ingmar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

	
///////////////////////////////////////////////////////////////////////
//	Info Orkelite
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_ORKELITE		(C_INFO)
{
	npc		 = 	Pal_201_Ingmar;
	nr		 = 	40;
	condition	 = 	DIA_Ingmar_ORKELITE_Condition;
	information	 = 	DIA_Ingmar_ORKELITE_Info;

	description	 = 	"Los orcos est�n planeando una gran ofensiva.";
};

func int DIA_Ingmar_ORKELITE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)) || (Hagen_SawOrcRing == TRUE))
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

func void DIA_Ingmar_ORKELITE_Info ()
{

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_00"); //Los orcos est�n planeando una gran ofensiva.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_01"); //�De veras? �Qu� interesante! �Y c�mo dices que los sabes?

	if (TalkedTo_AntiPaladin == TRUE)
	{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_02"); //He hablado con ellos.
	};

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_03"); //Algunos de sus l�deres est�n por esta zona.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_04"); //Mmm. Eso no parece la estrategia t�pica de los orcos.

	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Ser�a mejor que se te ocurriera una forma de acabar con ellos.", DIA_Ingmar_ORKELITE_loswerden );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "�Qu� deber�amos hacer ahora?", DIA_Ingmar_ORKELITE_wasTun );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "�Qu� quieres decir con eso?", DIA_Ingmar_ORKELITE_wieso );

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Ingmar estaba muy interesado en la historia de los guerreros de �lite orcos."); 

	MIS_KillOrkOberst = LOG_RUNNING;
};
func void DIA_Ingmar_ORKELITE_loswerden ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_loswerden_15_00"); //Ser�a mejor que se te ocurriera la forma de acabar con ellos.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_loswerden_06_01"); //Bastar�a con que dispusi�ramos de m�s informaci�n. Mandar� a alguien a explorar los alrededores.
	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wieso_15_00"); //�Y eso qu� significa?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_01"); //Si lo que dices es cierto, significa que esperan debilitarnos desde dentro, atacando con sus mejores guerreros.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_02"); //Lo normal es que haya un se�or de la guerra liderando cada horda de guerreros orcos. Es raro ver a dos o m�s juntos.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_03"); //Lo hacen por una raz�n. Sus l�deres son la clave de su estrategia de combate y suelen ir rodeados de guerreros orcos.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_04"); //Por eso es dif�cil acercarse a ellos si antes no te enfrentas a una horda de, al menos, 30 guerreros.
	
	B_LogEntry (TOPIC_OrcElite,"Ingmar ha dicho algo acerca de un l�der de los se�ores de la guerra orcos."); 
};

func void DIA_Ingmar_ORKELITE_wasTun ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wasTun_15_00"); //�Qu� deber�amos hacer ahora?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_01"); //Cuando se los ve en estas cantidades suelen formar una patrulla de incursi�n liderada por el de rango m�s elevado.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_02"); //Este caudillo establece el cuartel general y se retira a alguna cueva, desde la que manda sus tropas a la batalla.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_03"); //Si pudi�ramos hacernos con ese l�der, la ventaja que obtendr�amos ser�a decisiva.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_04"); //A los l�deres orcos les gusta estar cerca de sus enemigos. Ser�a buena idea buscar su cueva en alg�n lugar no muy lejano de la ciudad.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_05"); //Se han visto orcos cerca de la granja de Lobart. Puede que sea un buen sitio para empezar a buscar.

	B_LogEntry (TOPIC_OrcElite,"De acuerdo con Ingmar, deber�a encontrar al coronel orco en una cueva, en alg�n lugar cerca de la granja de Lobart. Ingmar quiere que lo encuentre y lo elimine."); 
	
	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
};


///////////////////////////////////////////////////////////////////////
//	Info Hauptquartier
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_HAUPTQUARTIER		(C_INFO)
{
	npc			 = 	Pal_201_Ingmar;
	nr			 = 	41;
	condition	 = 	DIA_Ingmar_HAUPTQUARTIER_Condition;
	information	 = 	DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent	 =  FALSE;
	description	 = 	"He podido encontrar el cuartel general de los orcos.";
};

func int DIA_Ingmar_HAUPTQUARTIER_Condition ()
{
	if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst))
	&& (Npc_KnowsInfo(other, DIA_Ingmar_ORKELITE))
		{
				return TRUE;
		};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_HAUPTQUARTIER_15_00"); //He podido encontrar el cuartel general de los orcos. Su caudillo ha ca�do.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_01"); //Es una noticia estupenda. Eso va a tener ocupados a los orcos durante alg�n tiempo.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_02"); //No est� mal. Si tuviera m�s caballeros de tu val�a, la batalla que nos espera ser�a pan comido.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_03"); //Toma. Ll�vate nuestro oro y �salo para equiparte.

	B_GivePlayerXP (XP_KilledOrkOberst);
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	MIS_KillOrkOberst = LOG_SUCCESS;
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

INSTANCE DIA_Ingmar_KAP5_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP5_EXIT_Condition;
	information	= DIA_Ingmar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP5_EXIT_Info()
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


INSTANCE DIA_Ingmar_KAP6_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP6_EXIT_Condition;
	information	= DIA_Ingmar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ingmar_PICKPOCKET (C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 900;
	condition	= DIA_Ingmar_PICKPOCKET_Condition;
	information	= DIA_Ingmar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ser�a casi imposible robar su pergamino)";
};                       

FUNC INT DIA_Ingmar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (105 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Ingmar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ingmar_PICKPOCKET);
	Info_AddChoice		(DIA_Ingmar_PICKPOCKET, DIALOG_BACK 		,DIA_Ingmar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ingmar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ingmar_PICKPOCKET_DoIt);
};

func void DIA_Ingmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 105)
	{
		B_GiveInvItems (self, other, ITWr_Manowar, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Ingmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Ingmar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ingmar_PICKPOCKET);
};






































