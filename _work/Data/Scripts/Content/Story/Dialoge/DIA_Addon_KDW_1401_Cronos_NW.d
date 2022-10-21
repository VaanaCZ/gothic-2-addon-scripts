///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cronos_EXIT   (C_INFO)
{
	npc         = KDW_1401_Addon_Cronos_NW;
	nr          = 999;
	condition   = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Hallo		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Hallo_Condition;
	information	 = 	DIA_Addon_Cronos_Hallo_Info;

	description	 = 	"¿Te puedo molestar un momento?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //¿Te puedo molestar un momento?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(sorprendido) Eres TÚ. Creía que no volvería a verte.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Eres muy valiente viniendo por aquí. Hubo un tiempo en el que te hubiéramos desollado vivo.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Tienes suerte de que eso fuera hace unas semanas y ahora nos hayamos relajado.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WasMachstdu		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_WasMachstdu_Condition;
	information	 = 	DIA_Addon_Cronos_WasMachstdu_Info;

	description	 = 	"¿Qué estás haciendo aquí?";
};

func int DIA_Addon_Cronos_WasMachstdu_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_WasMachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //¿Qué estás haciendo aquí?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(confuso) Mi misión es averiguar más sobre los guardianes del templo.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Un cometido nada sencillo, permíteme decirte. Esos centinelas de piedra me sorprenden enteramente.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Los ves quietos y totalmente inertes y al momento te están atacando como unos posesos.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Aún no he podido determinar qué poder es el que los mueve, pero algo está claro. Es de origen mágico.
};
///////////////////////////////////////////////////////////////////////
//	Info Waechter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Waechter		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Waechter_Condition;
	information	 = 	DIA_Addon_Cronos_Waechter_Info;

	description	 = 	"Háblame más de esos centinelas de piedra.";
};

func int DIA_Addon_Cronos_Waechter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_Waechter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Háblame más de esos centinelas de piedra.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //(confuso) Ahora no puedo contarte demasiado. Por desgracia, hemos tenido que destruirlos. Ahora no son peligrosos.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Cuando vinimos aquí, nos atacaron.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Sólo pudimos derrotarlos con nuestros poderes combinados y me temo que aún hay más esperándonos tras en portal.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Debe de haber un modo de disipar la energía que los mueve, para que no sean más que meras estatuas.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_NW_Trade		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_NW_Trade_Condition;
	information	 = 	DIA_Addon_Cronos_NW_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"¿Puedes venderme equipamiento?";
};

func int DIA_Addon_Cronos_NW_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //¿Puedes venderme equipamiento?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //¿Por qué no? Si no recuerdo mal, ya hemos hecho negocios antes.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Dime lo que necesitas.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
