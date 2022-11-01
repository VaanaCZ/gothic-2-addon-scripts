///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"¿Eres pescador?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //¿Eres pescador?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //(cínico) ¿Cómo lo has adivinado?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //¿No podrías dejarme en paz?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //No te lo tomes como algo personal, pero no llevo buena racha con la milicia.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //No te lo tomes como algo personal, pero he tenido mala racha. Por la milicia.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"¿Problemas con la milicia?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //¿Problemas con la milicia?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Esos granujas siguen viniendo y llevándonse todo lo que quieren.
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //La semana pasada se fueron con toda mi captura. 'Es por una buena causa', dijeron.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //Sé que la gente tiene que arreglárselas desde que los granjeros no comercian.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //Y, por supuesto, a veces la gente tiene hambre. No me extraña que me quiten el pescado delante de mis narices.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //Pero si siguen así, no voy a tener ni para comer yo.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Dame todo tu pescado.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Quizá pueda ayudarte.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "¿Le han contado tu problema a los paladines?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //¿Le han contado tu problema a los paladines?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //(ríe) ¿Estás de guasa? ¿Crees que les interesa si un pobre diablo como yo tiene problemas con la milicia?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Dame todo tu pescado.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //(enfadado) Lo SABÍA. Otro de esos bastardos.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //Me temo que llegas tarde. Tus amigos estuvieron ayer aquí y se lo llevaron todo.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //Bien. Ahora más vale que te vayas.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Quizá pueda ayudarte.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //No sé. Supongo que conocerás a alguien de la milicia que tenga mano con los paladines.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Los paladines me compran a duras penas.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Veré lo que puedo hacer.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"El pescador Farim tiene un problema con la milicia. Le quitan tanto pescado que no tiene suficiente para vivir. Debo encontrar a alguien de la milicia con influencia sobre los paladines para ayudarle."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"Sé cómo solucionar tu problema con la milicia.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //Sé cómo solucionar tu problema con la milicia.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //¿Y qué propones?

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //No suelo andar por aquí para mantener tu pescado constantemente vigilado.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //Pero conozco a alguien que puede hacerlo.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Martin, el maestro de provisiones de los paladines, quiere oír tu historia sobre la milicia y el pescado.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //¿Y crees que podrá hacer que la milicia me deje en paz?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //Al menos eso dijo él.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Fantástico. Gracias. No puedo darte mucho, pero espera
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //He encontrado esta extraña piedra azul en una de las isla de la costa de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //No creo que valga mucho, pero alguien como tú seguro que le encuentra utilidad.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"¿Puedes contarme algo sobre los desaparecidos?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //¿Puedes contarme algo de la gente desaparecida?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //Mi amigo William empezó a juntarse con un montón de personajes raros. ¿Y cómo acabó?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Un día, no se presentó a trabajar y eso es lo último que sabemos de él.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"¿Tu amigo William ha desaparecido?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //¿Tu amigo William ha desaparecido?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //Así es. Es pescador, pero un poco arrogante, debo decir.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //Debería de haberse alejado de esa gentuza.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "¿Y quiénes eran esos tipejos?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Volverá a aparecer.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "¿Qué ha estado haciendo?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "¿Cuándo los viste por última vez?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //¿Qué ha estado haciendo?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William tenía algunos negocios oscuros con esa chusma.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //Creo que vendía contrabando a esos bastardos.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //¿Y quiénes eran esos tipejos?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //No sé ni quiénes son, ni qué les trae por Khorinis.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //Sólo sé el sitio donde se reunieron con William.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //Vi a William por casualidad mientras pescaba en la bahía.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "¿Y dónde está ese punto de encuentro?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //¿Y dónde está ese punto de encuentro?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //Hay una bahía enfrente del puerto, al norte de aquí.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //Sólo se puede llegar por barco o nadando.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //Allí hay una play, y un campamento de pesca. Allí es donde los ví.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"El pescador Farim lamenta la pérdida de su amigo William. Dice que William solía verse con asesinos en una bahía al norte del puerto."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "Ya he oído suficiente.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //¿Cuándo los viste por última vez?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Hace unos días.

	Info_AddChoice	(DIA_Addon_Farim_William, "Quizá se hizo al mar sólo para pescar.", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Tal vez se haya echado al mar al pescar.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //No es muy probable. Su barca está amarrada al puerto.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //Volverá a aparecer.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //No lo creo. Ya lleva mucho tiempo fuera.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //Me temo que tendré que arrastrar su cuerpo desde el mar a otro lugar.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Ya he oído suficiente.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Ahórrate el esfuerzo. No creo que des con él.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Y cómo son los mordiscos de pez?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //¿Cómo son las mordeduras de pez?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Deja de hacer que te interesa.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //He vivido tiempos mejores. Poco por lo que vivir, mucho por lo que morir.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //¡Has vuelto!
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //¿Tienes noticias de mi amigo William?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //Está muerto.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //(suspira) Sí, me lo esperaba.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Gracias por venir a informarme.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //Iré al pub a beberme su parte de nuestra última captura, así lo hubiera querido él
};






