// ************************************************************
// 			  					EXIT 
// ************************************************************
INSTANCE DIA_Elena_EXIT   (C_INFO)
{
	npc         = BAU_911_Elena;
	nr          = 999;
	condition   = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Elena_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo 
// ************************************************************
instance DIA_Elena_HALLO		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 1;
	condition	= DIA_Elena_HALLO_Condition;
	information	= DIA_Elena_HALLO_Info;
	permanent	= FALSE;
	description	= "Hola, guapa.";
};

func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Elena_HALLO_15_00"); //Hola, guapa.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_01"); //Um. ¿De dónde te has escapado?
	}
	else
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_02"); //¿Qué querías?
	};
};


// ************************************************************
// 			  					Aufstand
// ************************************************************
instance DIA_Elena_Aufstand		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 2;
	condition	= DIA_Elena_Aufstand_Condition;
	information	= DIA_Elena_Aufstand_Info;
	permanent	= FALSE;
	description	= "Se dice que os habéis rebelado contra el rey.";
};

func int DIA_Elena_Aufstand_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info ()
{
	AI_Output (other, self, "DIA_Elena_Aufstand_15_00"); //Se dice que os habéis rebelado contra el rey.
	AI_Output (self, other, "DIA_Elena_Aufstand_16_01"); //Mi padre ha decidido que ha llegado el momento de que nos defendamos.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Elena_Aufstand_16_02"); //Al fin y al cabo, la milicia nunca nos ha ayudado. Solo venían para llevarse nuestras provisiones.
	};
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Arbeit		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 3;
	condition	= DIA_Elena_Arbeit_Condition;
	information	= DIA_Elena_Arbeit_Info;
	permanent	= FALSE;
	description	= "¿Qué clase de empleos ofrecéis en la granja?";
};

func int DIA_Elena_Arbeit_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Elena_Arbeit_15_00"); //¿Qué clase de empleos ofrecéis en la granja?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_01"); //Mi padre paga a todos los hombres que ayuden a defender la granja.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_02"); //¿Te interesa? No tienes pinta de ser alguien a quien le guste trabajar en el campo.
	AI_Output (other, self, "DIA_Elena_Arbeit_15_03"); //¿Cuánto paga tu padre?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_04"); //Tendrías que negociarlo con él.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_05"); //Solo sé que los mercenarios cobran todos los días.
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Regeln		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 4;
	condition	= DIA_Elena_Regeln_Condition;
	information	= DIA_Elena_Regeln_Info;
	permanent	= FALSE;
	description	= "¿Debo cumplir alguna norma?";
};

func int DIA_Elena_Regeln_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Elena_Regeln_15_00"); //¿Debo cumplir alguna norma?
	AI_Output (self, other, "DIA_Elena_Regeln_16_01"); //No toques nada que no sea tuyo.
	AI_Output (self, other, "DIA_Elena_Regeln_16_02"); //Apártate de las zonas que no sean de tu incumbencia.
	AI_Output (self, other, "DIA_Elena_Regeln_16_03"); //Y si te peleas, hazlo con los mercenarios.
	AI_Output (self, other, "DIA_Elena_Regeln_16_04"); //Si te peleas con los granjeros, todos se van a poner en tu contra.
};


// ************************************************************
// 			  					Aufgabe 
// ************************************************************
instance DIA_Elena_AUFGABE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 5;
	condition	= DIA_Elena_AUFGABE_Condition;
	information	= DIA_Elena_AUFGABE_Info;
	permanent 	= FALSE;
	description	= "¿A qué te dedicas?";
};

func int DIA_Elena_AUFGABE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info ()
{
	AI_Output (other, self, "DIA_Elena_AUFGABE_15_00"); //¿A qué te dedicas?
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_01"); //Vendo todo lo que producimos. Si quieres comprar algo, dímelo.
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_02"); //Pero te advierto que no soporto a los que regatean ni a los que roban, ¿te enteras?
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Elena vende mercancías en la granja de Onar.");
};

// ************************************************************
// 			  					TRADE 
// ************************************************************

//---------------------------------
var int Elena_Trade_mit_mir;
//---------------------------------

instance DIA_Elena_TRADE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr          = 7;
	condition	= DIA_Elena_TRADE_Condition;
	information	= DIA_Elena_TRADE_Info;
	permanent	= TRUE;
	description	= "¡Enséñame tu mercancía!";
	trade		= TRUE;
};

func int DIA_Elena_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_AUFGABE))
	|| (Elena_Trade_mit_mir == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Elena_TRADE_15_00"); //¡Enséñame el género!
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Elena_TRADE_16_01"); //¿Qué puedo ofrecerte?
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Elena_PERM		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 900;
	condition	= DIA_Elena_PERM_Condition;
	information	= DIA_Elena_PERM_Info;
	permanent	= TRUE;
	description	= "¿Ha pasado algo importante últimamente?";
};

func int DIA_Elena_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Elena_PERM_15_00"); //¿Ha pasado algo importante últimamente?

	if (kapitel <= 1)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_01"); //Hace unos días mi padre ordenó que no vendiéramos nada en la ciudad.
		AI_Output			(self, other, "DIA_Elena_PERM_16_02"); //Ahora me quedo en la granja y solo le vendo el género a los visitantes.
	
		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_03"); //Cada vez son más frecuentes los ataques de la milicia a las granjas vecinas. Mi padre no va a tardar en intervenir.
	}
	else if (Kapitel == 3)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_04"); //Ha aumentado la inseguridad en la región. Nadie sale de sus tierras y hace mucho que no vamos a la ciudad.
	}
	else if (kapitel == 4)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_05"); //Los mercenarios cada vez están más inquietos, aunque parecen haberse relajado un poco desde la marcha de Sylvio y sus muchachos.
	}
	else //Kapitel 5
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_06"); //Todo el mundo no hace más que hablar del inminente ataque orco, pero yo no me lo creo. Pienso que en la granja estamos a salvo.
	};
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Minenanteil
///////////////////////////////////////////////////////////////////////
instance DIA_Elena_MINENANTEIL		(C_INFO)
{
	npc		 = 	BAU_911_Elena;
	nr		 = 	2;
	condition	 = 	DIA_Elena_MINENANTEIL_Condition;
	information	 = 	DIA_Elena_MINENANTEIL_Info;

	description  =  "¿Vendes participaciones de las minas?";
};

func int DIA_Elena_MINENANTEIL_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Elena_Hallo))
		{
				return TRUE;
		};
};

func void DIA_Elena_MINENANTEIL_Info ()
{
	AI_Output			(other, self, "DIA_Elena_MINENANTEIL_15_00"); //¿Vendes participaciones de las minas?
	AI_Output			(self, other, "DIA_Elena_MINENANTEIL_16_01"); //¿Y qué? Pagué por ellas un brazo y una pierna.
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Elena_PICKPOCKET (C_INFO)
{
	npc			= BAU_911_Elena;
	nr			= 900;
	condition	= DIA_Elena_PICKPOCKET_Condition;
	information	= DIA_Elena_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Elena_PICKPOCKET_Condition()
{
	C_Beklauen (30, 35);
};
 
FUNC VOID DIA_Elena_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Elena_PICKPOCKET);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_BACK 		,DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};
	
func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};





















