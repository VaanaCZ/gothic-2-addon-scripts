///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kervo_EXIT   (C_INFO)
{
	npc         = STRF_1116_Kervo;
	nr          = 999;
	condition   = DIA_Kervo_EXIT_Condition;
	information = DIA_Kervo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kervo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kervo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info wasist
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_WASIST		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	nr		 = 	4;
	condition	 = 	DIA_Kervo_WASIST_Condition;
	information	 = 	DIA_Kervo_WASIST_Info;

	description	 = 	"¿Qué es lo que no está bien?";
};

func int DIA_Kervo_WASIST_Condition ()
{
	return TRUE;
};

func void DIA_Kervo_WASIST_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_WASIST_15_00"); //¿Qué pasa contigo?
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_01"); //¿Y tienes que preguntarlo? Mira a tu alrededor.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_02"); //Esos malditos acechadores se han extendido por todo el río desde que estoy aquí.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_03"); //Primero solo había dos. Desde ayer, he contado por lo menos cinco.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_04"); //No tengo ni idea de cómo voy a salir de aquí.
};


///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_HILFE		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	nr		 = 	5;
	condition	 = 	DIA_Kervo_HILFE_Condition;
	information	 = 	DIA_Kervo_HILFE_Info;

	description	 = 	"¿Has probado a cruzar el paso?";
};

func int DIA_Kervo_HILFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kervo_WASIST))
		{
				return TRUE;
		};
};
func void DIA_Kervo_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_15_00"); //¿Has probado a cruzar el paso?
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_01"); //¿Me tomas por loco? Ni 20 soldados me sacarían de aquí con esas bestias ahí fuera. Odio a esas cosas.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_02"); //(Absolutamente nervioso) Con solo olerlas, me dan sudores fríos. Y su constante borboteo me hiela la sangre.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_03"); //Si tienes tantas ganas de que te despellejen vivo, adelante.

	Info_ClearChoices	(DIA_Kervo_HILFE);
	Info_AddChoice	(DIA_Kervo_HILFE, "Bueno, entonces me voy.", DIA_Kervo_HILFE_tschau );
	Info_AddChoice	(DIA_Kervo_HILFE, "Pero no puedes quedarte aquí para siempre.", DIA_Kervo_HILFE_ewig );

	if (Kervo_GotStuff == TRUE)
	{
		Info_AddChoice	(DIA_Kervo_HILFE, "¿Qué me darías si mato a las cosas?", DIA_Kervo_HILFE_Problem );
	};

	MIS_Kervo_KillLurker = LOG_RUNNING;
};
func void DIA_Kervo_HILFE_ewig ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_ewig_15_00"); //Pero no puedes quedarte aquí para siempre.
	AI_Output			(self, other, "DIA_Kervo_HILFE_ewig_13_01"); //No tengo ni idea de lo que quieres de mí, pero te diré esto: no vas a conseguir que salga de aquí.
};
var int Kervo_PromiseNugget;
func void DIA_Kervo_HILFE_Problem ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_Problem_15_00"); //¿Qué me darías si mato a las cosas?
	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_01"); //Mm. Bueno... Sería suficiente con que desaparecieran los merodeadores de delante de la caverna.
	
	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_02"); //Encontré una piedra rúnica virgen. Dado que tú eres un mago, estoy seguro de que podrás aprovecharla.
	}
	else
	{
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_03"); //Encontré un trozo de mineral.
	};

	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_04"); //Te lo daría a cambio.
	Kervo_PromiseNugget = TRUE;
	AI_StopProcessInfos (self);
};

func void DIA_Kervo_HILFE_tschau ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_tschau_15_00"); //Bueno, entonces me voy.
	AI_Output			(self, other, "DIA_Kervo_HILFE_tschau_13_01"); //Claro. No te entretendré.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info LurkerPlatt
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_LurkerPlatt		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	condition	 = 	DIA_Kervo_LurkerPlatt_Condition;
	information	 = 	DIA_Kervo_LurkerPlatt_Info;

	description = 	"Los merodeadores de delante de la caverna se han ido.";	
};

func int DIA_Kervo_LurkerPlatt_Condition ()
{
	if 	(MIS_Kervo_KillLurker == LOG_RUNNING)
	&& (Npc_IsDead(Kervo_Lurker1))
	&& (Npc_IsDead(Kervo_Lurker2))
	&& (Npc_IsDead(Kervo_Lurker3))
	&& (Npc_IsDead(Kervo_Lurker4))
	&& (Npc_IsDead(Kervo_Lurker5))
	&& (Npc_IsDead(Kervo_Lurker6))
		{
			return TRUE;
		};
};

func void DIA_Kervo_LurkerPlatt_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_LurkerPlatt_15_00"); //Los merodeadores de delante de la caverna se han ido.
	AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_01"); //Genial. Ahora por fin puedo volver a respirar.

	if (Kervo_PromiseNugget == TRUE)
	{
		AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_02"); //Aquí tienes lo que te prometí.
	
		if (hero.guild == GIL_KDF)
		{
			B_GiveInvItems (self, other, ItMi_RuneBlank, 1);					
		}
		else
		{
			B_GiveInvItems (self, other, ItMi_Nugget, 1);					
		};	
	};
	B_GivePlayerXP (XP_KervoKillLurker);
	MIS_Kervo_KillLurker = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Vergisses
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_VERGISSES		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	condition	 = 	DIA_Kervo_VERGISSES_Condition;
	information	 = 	DIA_Kervo_VERGISSES_Info;
	permanent	 = 	TRUE;

	description = 	"¿Cruzarás ahora el paso?";	
};

func int DIA_Kervo_VERGISSES_Condition ()
{
	if 	(MIS_Kervo_KillLurker == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Kervo_VERGISSES_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_VERGISSES_15_00"); //¿Cruzarás ahora el paso?
	AI_Output			(self, other, "DIA_Kervo_VERGISSES_13_01"); //Olvídalo, hombre. Si me pillan, me llevarán de vuelta a las minas. Yo me quedo aquí.
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kervo_PICKPOCKET (C_INFO)
{
	npc			= STRF_1116_Kervo;
	nr			= 900;
	condition	= DIA_Kervo_PICKPOCKET_Condition;
	information	= DIA_Kervo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kervo_PICKPOCKET_Condition()
{
	C_Beklauen (34, 10);
};
 
FUNC VOID DIA_Kervo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kervo_PICKPOCKET);
	Info_AddChoice		(DIA_Kervo_PICKPOCKET, DIALOG_BACK 		,DIA_Kervo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kervo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kervo_PICKPOCKET_DoIt);
};

func void DIA_Kervo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kervo_PICKPOCKET);
};
	
func void DIA_Kervo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kervo_PICKPOCKET);
};









