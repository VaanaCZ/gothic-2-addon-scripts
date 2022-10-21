	
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sagitta_EXIT   (C_INFO)
{
	npc         = BAU_980_Sagitta;
	nr          = 999;
	condition   = DIA_Sagitta_EXIT_Condition;
	information = DIA_Sagitta_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sagitta_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Sagitta_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_HALLO		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	nr		 = 	4;
	condition	 = 	DIA_Sagitta_HALLO_Condition;
	information	 = 	DIA_Sagitta_HALLO_Info;

	description	 = 	"�Est�s sola?";
};

func int DIA_Sagitta_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_15_00"); //�Est�s sola?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_17_01"); //Dime qu� quieres de m� y l�rgate. Estoy ocupada.

	Info_ClearChoices	(DIA_Sagitta_HALLO);
	Info_AddChoice	(DIA_Sagitta_HALLO, DIALOG_BACK, DIA_Sagitta_HALLO_ende );
	Info_AddChoice	(DIA_Sagitta_HALLO, "�Puedes curarme?", DIA_Sagitta_HALLO_Heil );
	Info_AddChoice	(DIA_Sagitta_HALLO, "�Qu� est�s haciendo aqu� fuera?", DIA_Sagitta_HALLO_was );
	Info_AddChoice	(DIA_Sagitta_HALLO, "�Qui�n eres t�?", DIA_Sagitta_HALLO_wer );

};

func void DIA_Sagitta_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_wer_15_00"); //�Qui�n eres t�?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_01"); //Entonces, �no has o�do hablar de m�?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_02"); //Dicen que soy la bruja de las hierbas. Me llaman curandera.
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_03"); //Pero cuando est�n enfermos, de repente se acuerdan de la buena Sagitta y de sus hierbas medicinales.

};

func void DIA_Sagitta_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_was_15_00"); //�Qu� est�s haciendo aqu� fuera?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_was_17_01"); //Llevo viviendo aqu� desde que tengo uso de raz�n, y me ocupo de mis hierbas.
	AI_Output			(self, other, "DIA_Sagitta_HALLO_was_17_02"); //El bosque es mi amigo y me ofrece todo lo que necesito.

};

func void DIA_Sagitta_HALLO_Heil ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_Heil_15_00"); //�Puedes curarme?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_Heil_17_01"); //Por eso has venido, �no? Cuando te pase algo, d�melo.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Sagitta vende mercanc�as detr�s de la granja de Sekob.");
};

func void DIA_Sagitta_HALLO_ende ()
{
	Info_ClearChoices	(DIA_Sagitta_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachAlchemyRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_TeachAlchemyRequest		(C_INFO)
{
	npc			 = 	BAU_980_Sagitta;
	nr          = 	6;	
	condition	 = 	DIA_Sagitta_TeachAlchemyRequest_Condition;
	information	 = 	DIA_Sagitta_TeachAlchemyRequest_Info;
	permanent	 = 	TRUE;

	description	 = 	"�Me ense�as lo que sabes de las hierbas?";
};

func int DIA_Sagitta_TeachAlchemyRequest_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
	&& (MIS_Sagitta_Herb == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Sagitta_TeachAlchemyRequest_OneTime;
func void DIA_Sagitta_TeachAlchemyRequest_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_15_00"); //�Me ense�as lo que sabes de las hierbas?

	if (DIA_Sagitta_TeachAlchemyRequest_OneTime ==FALSE)
	{
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_01"); //Qu� interesante. No me lo suelen pedir.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_02"); //�Quieres ser mi pupilo? Antes tendr�s que demostrarme que hablas en serio.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_03"); //Ahora mismo trabajo en una poci�n muy rara que se compone de hierbas y zumos deliciosos.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_04"); //Si me traes un ingrediente (una hierba muy escasa que se me ha acabado), te instruir�.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_05"); //Ya te lo he dicho: s�, despu�s de que me traigas ese ingrediente escaso.
	};
	
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Lo siento, no me interesa.", DIA_Sagitta_TeachAlchemyRequest_nein );
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "�D�nde est� este ingrediente?", DIA_Sagitta_TeachAlchemyRequest_wo );
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "�Qu� ingrediente es?", DIA_Sagitta_TeachAlchemyRequest_was );
	
};
func void DIA_Sagitta_TeachAlchemyRequest_was ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_was_15_00"); //�Qu� ingrediente es?
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_was_17_01"); //Es una planta muy escasa, una hierba llamada �loe solar. Se la reconoce por su fuerte olor almendrado.
	
};

func void DIA_Sagitta_TeachAlchemyRequest_wo ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_15_00"); //�D�nde est� este ingrediente?
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_01"); //Esta hierba solo crece en lugares que tienen todos los nutrientes que necesita.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_02"); //�stos se encuentran en los excrementos de un troll negro.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_03"); //Por eso me cuesta tanto conseguir la hierba, �entiendes?
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "A ver si la encuentro en alg�n lugar.", DIA_Sagitta_TeachAlchemyRequest_wo_ja );
};
func void DIA_Sagitta_TeachAlchemyRequest_wo_ja ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00"); //A ver si la encuentro en alg�n lugar.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01"); //Buena suerte en tu b�squeda.
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SagittaHerb,LOG_RUNNING);
	B_LogEntry (TOPIC_SagittaHerb,"Sagitta necesita un tipo de hierba bastante extra�o. Es �loe solar y solo crece en los excrementos de un troll negro.");

};


func void DIA_Sagitta_TeachAlchemyRequest_nein ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_nein_15_00"); //Lo siento, no me interesa.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_nein_17_01"); //Entonces no me hagas perder el tiempo con tus tonter�as.
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
};

///////////////////////////////////////////////////////////////////////
//	Info Sagitta_Herb
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_Sagitta_Herb		(C_INFO)
{
	npc			 = 	BAU_980_Sagitta;
	nr          = 	3;	
	condition	 = 	DIA_Sagitta_Sagitta_Herb_Condition;
	information	 = 	DIA_Sagitta_Sagitta_Herb_Info;

	description	 = 	"He encontrado el �loe solar.";
};

func int DIA_Sagitta_Sagitta_Herb_Condition ()
{	
	if (Npc_HasItems (other,ItPl_Sagitta_Herb_MIS))
	&& (MIS_Sagitta_Herb == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};
func void DIA_Sagitta_Sagitta_Herb_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_Sagitta_Herb_15_00"); //He encontrado el �loe solar.
	AI_Output			(self, other, "DIA_Sagitta_Sagitta_Herb_17_01"); //Gracias. Dime qu� quieres saber de la elaboraci�n de pociones.
	B_GiveInvItems (other,self,ItPl_Sagitta_Herb_MIS,1);
	Sagitta_TeachAlchemy = TRUE;	
	MIS_Sagitta_Herb = LOG_SUCCESS;
	B_GivePlayerXP (XP_Sagitta_Sonnenaloe);
};


///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sagitta_Teach   (C_INFO)
{
	npc         = BAU_980_Sagitta;
	nr          = 2;
	condition   = DIA_Sagitta_Teach_Condition;
	information = DIA_Sagitta_Teach_Info;
	permanent   = TRUE;
	description = "�Qu� pociones me puedes ense�ar a preparar?";
};
//----------------------------------------
var int DIA_Sagitta_Teach_permanent;
//----------------------------------------

FUNC INT DIA_Sagitta_Teach_Condition()
{	
	if (DIA_Sagitta_Teach_permanent == FALSE)
	&& (Sagitta_TeachAlchemy == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Sagitta_Teach_15_00");//�Qu� pociones me puedes ense�ar a preparar?

	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_ClearChoices (DIA_Sagitta_Teach);
		Info_AddChoice (DIA_Sagitta_Teach,DIALOG_BACK,DIA_Sagitta_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Esencia de curaci�n", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Extracto de curaci�n", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Esencia de man�", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Extracto de man�", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Elixir de man�", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Elixir de esp�ritu", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Elixir de destreza", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Sagitta_Teach_17_01"); //Antes de que te ense�e lo que s� de alquimia, tengo que explicarte todo lo que necesitas para preparar pociones.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_02"); //La mesa de trabajo del alquimista sirve de cocina para elaborar las pociones. Necesitar�s un matraz vac�o para guardar la poci�n.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_03"); //Luego a�ade los ingredientes necesarios y obtendr�s la poci�n.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_04"); //Por supuesto, yo puedo ense�arte.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Sagitta_Teach_17_05"); //�Qu� poci�n vas a querer?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Sagitta_Teach_17_06"); //Ya sabes todo lo que pod�a ense�arte.
		DIA_Sagitta_Teach_permanent = TRUE;
	};
};

FUNC VOID DIA_Sagitta_Teach_BACK ()
{
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Health_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Sagitta_Teach);
};
FUNC VOID DIA_Sagitta_Teach_Health_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Mana_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Mana_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Mana_03 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Perm_Mana ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Perm_Dex ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX);
	Info_ClearChoices (DIA_Sagitta_Teach);
};
	
///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_HEAL		(C_INFO)
{
	npc			 = 	BAU_980_Sagitta;
	nr          = 	99;	//Joly: braucht ne hohe Nummer, denn wird in den sp�teren Kapiteln auch verwendet.
	condition	 = 	DIA_Sagitta_HEAL_Condition;
	information	 = 	DIA_Sagitta_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"C�rame.";
};

func int DIA_Sagitta_HEAL_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};
func void DIA_Sagitta_HEAL_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEAL_15_00"); //C�rame.
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Sagitta_HEAL_17_01"); //Veamos. Um. Mi ung�ento curar� tus heridas m�s graves.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Sagitta_HEAL_17_02"); //Ahora mismo no necesitas curarte.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_TRADE		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	condition	 = 	DIA_Sagitta_TRADE_Condition;
	information	 = 	DIA_Sagitta_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

	description	 = 	"�Qu� mercanc�a puedes ofrecerme?";
};

func int DIA_Sagitta_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Sagitta_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_TRADE_15_00"); //�Qu� mercanc�a puedes ofrecerme?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Sagitta_TRADE_17_01"); //Dime lo que quieres.
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

INSTANCE DIA_Sagitta_KAP3_EXIT(C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 999;
	condition	= DIA_Sagitta_KAP3_EXIT_Condition;
	information	= DIA_Sagitta_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sagitta_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_OBSESSION		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	nr		 = 	30;
	condition	 = 	DIA_Sagitta_OBSESSION_Condition;
	information	 = 	DIA_Sagitta_OBSESSION_Info;

	description	 = 	"Tengo una sensaci�n trepidante.";
};

func int DIA_Sagitta_OBSESSION_Condition ()
{
	if (SC_IsObsessed == TRUE)
	&& (SC_ObsessionTimes < 1)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Sagitta_OBSESSION_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_OBSESSION_15_00"); //Estoy muy inquieto. Necesito ayuda.
	AI_Output			(self, other, "DIA_Sagitta_OBSESSION_17_01"); //Veo que el sue�o no basta para que te recuperes. Has estado expuesto a la mirada negra de los buscadores.
	AI_Output			(self, other, "DIA_Sagitta_OBSESSION_17_02"); //Ve a ver a Pyrokar, el mago supremo del monasterio. Mis humildes remedios no bastan.
};

///////////////////////////////////////////////////////////////////////
//	Info Thekla
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_Thekla		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	nr		 = 	3;
	condition	 = 	DIA_Sagitta_Thekla_Condition;
	information	 = 	DIA_Sagitta_Thekla_Info;

	description	 = 	"Me manda Thekla para recoger un paquete.";
};

func int DIA_Sagitta_Thekla_Condition ()
{
	if (MIS_Thekla_Paket == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Sagitta_Thekla_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_Thekla_15_00"); //Me manda Thekla para recoger un paquete.
	AI_Output			(self, other, "DIA_Sagitta_Thekla_17_01"); //Ah, s�. La esperaba hace d�as.
	AI_Output			(self, other, "DIA_Sagitta_Thekla_17_02"); //Aqu� tienes el paquete. �Tr�talo con cuidado!
	B_GivePlayerXP (XP_AmbientKap3);								
	B_GiveInvItems (self, other, ItMi_TheklasPaket, 1);					
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

INSTANCE DIA_Sagitta_KAP4_EXIT(C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 999;
	condition	= DIA_Sagitta_KAP4_EXIT_Condition;
	information	= DIA_Sagitta_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sagitta_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HealRandolph
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_HEALRANDOLPH		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	nr		 = 	30;
	condition	 = 	DIA_Sagitta_HEALRANDOLPH_Condition;
	information	 = 	DIA_Sagitta_HEALRANDOLPH_Info;
	permanent	 = 	TRUE;

	description	 = 	"Randolph tiene s�ndrome de abstinencia.";
};

var int DIA_Sagitta_HEALRANDOLPH_GotOne;
var int DIA_Sagitta_HEALRANDOLPH_KnowsPrice;

func int DIA_Sagitta_HEALRANDOLPH_Condition ()
{
	if (MIS_HealRandolph == LOG_RUNNING)
	&& (Npc_HasItems (other,ItPo_HealRandolph_MIS) == 0)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Sagitta_HEALRANDOLPH_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_15_00"); //Randolph tiene s�ndrome de abstinencia.

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_01"); //�Cu�ndo va a aprender ese muchacho?
			DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
		};
	
	if(DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_02"); //Ya te he dado una dosis para �l. No andes enredando.
		}
	else
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_03"); //Voy a darle un remedio. Se le pasar� en cuesti�n de un par de d�as.
		};

	AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_04"); //En total son 300 monedas de oro.

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_15_05"); //�Qu�?
		AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_06"); //Lo �nico gratis es la muerte, chaval.
	};	

	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice	(DIA_Sagitta_HEALRANDOLPH, "No. No para una tonter�a as�."	, DIA_Sagitta_HEALRANDOLPH_no );
	Info_AddChoice	(DIA_Sagitta_HEALRANDOLPH, "Aqu� tienes el dinero."				, DIA_Sagitta_HEALRANDOLPH_geld );
};

func void DIA_Sagitta_HEALRANDOLPH_geld ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_geld_15_00"); //Aqu� tienes el dinero.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_01"); //Muy bien. Puedes pedirle que te lo devuelva.
			CreateInvItems 		(self, ItPo_HealRandolph_MIS, 1);									
			B_GiveInvItems 		(self, other, ItPo_HealRandolph_MIS, 1);					
			DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry (TOPIC_HealRandolph,"Sagirra me ha dado lo que necesita Randolph."); 
		}
	else
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_02"); //Si no tienes el dinero, no llegaremos a un acuerdo.
		};

	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_no_15_00"); //No. No para una tonter�a as�.
	AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_no_17_01"); //(Se r�e) �No te dio dinero? �Es muy propio de �l!
	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
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

INSTANCE DIA_Sagitta_KAP5_EXIT(C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 999;
	condition	= DIA_Sagitta_KAP5_EXIT_Condition;
	information	= DIA_Sagitta_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sagitta_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_KAP5_EXIT_Info()
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


INSTANCE DIA_Sagitta_KAP6_EXIT(C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 999;
	condition	= DIA_Sagitta_KAP6_EXIT_Condition;
	information	= DIA_Sagitta_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sagitta_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sagitta_PICKPOCKET (C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 900;
	condition	= DIA_Sagitta_PICKPOCKET_Condition;
	information	= DIA_Sagitta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120_Female;
};                       

FUNC INT DIA_Sagitta_PICKPOCKET_Condition()
{
	C_Beklauen (103, 360);
};
 
FUNC VOID DIA_Sagitta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sagitta_PICKPOCKET);
	Info_AddChoice		(DIA_Sagitta_PICKPOCKET, DIALOG_BACK 		,DIA_Sagitta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sagitta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sagitta_PICKPOCKET_DoIt);
};

func void DIA_Sagitta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sagitta_PICKPOCKET);
};
	
func void DIA_Sagitta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sagitta_PICKPOCKET);
};




		























 


























