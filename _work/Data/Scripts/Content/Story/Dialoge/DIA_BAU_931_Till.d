///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Till_EXIT   (C_INFO)
{
	npc         = BAU_931_Till;
	nr          = 999;
	condition   = DIA_Till_EXIT_Condition;
	information = DIA_Till_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Till_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Till_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Till_HALLO		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	3;
	condition	 = 	DIA_Till_HALLO_Condition;
	information	 = 	DIA_Till_HALLO_Info;

	description	 = 	"¿Y bien, chaval?";
};

func int DIA_Till_HALLO_Condition ()
{
	if (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_15_00"); //¿Y bien, chaval?
	AI_Output			(self, other, "DIA_Till_HALLO_03_01"); //Los mozos no me pueden hablar así. ¿Cuántas veces tengo que decírtelo?
	B_StartOtherRoutine (Till,"Start"); 

	Info_ClearChoices	(DIA_Till_HALLO);

	if (Kapitel < 5)
	{
		Info_AddChoice	(DIA_Till_HALLO, "No soy un mozo.", DIA_Till_HALLO_keinervoneuch );
	
		if (Npc_IsDead(Sekob)== FALSE)
		{
			Info_AddChoice	(DIA_Till_HALLO, "¿Estás al mando?", DIA_Till_HALLO_selber );
		};
	};
};

func void DIA_Till_HALLO_selber ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_selber_15_00"); //¿Estás al mando?
	AI_Output			(self, other, "DIA_Till_HALLO_selber_03_01"); //(Intimidado) Eh... no, solo soy el hijo de Sekob. Pero cuando mi viejo nos deje, todas las tierras que ves serán mías.
	AI_Output			(other, self, "DIA_Till_HALLO_selber_15_02"); //¡Asombroso!

	Info_ClearChoices	(DIA_Till_HALLO);
};

func void DIA_Till_HALLO_keinervoneuch ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_keinervoneuch_15_00"); //No soy un mozo.
	AI_Output			(self, other, "DIA_Till_HALLO_keinervoneuch_03_01"); //¿Y qué quieres? No tenemos nada. Márchate ahora mismo.

	Info_ClearChoices	(DIA_Till_HALLO);
};


///////////////////////////////////////////////////////////////////////
//	Info feldarbeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Till_FELDARBEITER		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	4;
	condition	 = 	DIA_Till_FELDARBEITER_Condition;
	information	 = 	DIA_Till_FELDARBEITER_Info;

	description	 = 	"¿Así tratas a tus peones?";
};

func int DIA_Till_FELDARBEITER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_FELDARBEITER_Info ()
{
	AI_Output			(other, self, "DIA_Till_FELDARBEITER_15_00"); //¿Así tratas a tus peones?
	AI_Output			(self, other, "DIA_Till_FELDARBEITER_03_01"); //Claro, con ellos es necesario. Quien no acata la disciplina, se lleva una paliza. Así son las cosas.

};


///////////////////////////////////////////////////////////////////////
//	Info Sekob
///////////////////////////////////////////////////////////////////////
instance DIA_Till_SEKOB		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	9;
	condition	 = 	DIA_Till_SEKOB_Condition;
	information	 = 	DIA_Till_SEKOB_Info;

	description	 = 	"Tengo que hablar con tu padre.";
};

func int DIA_Till_SEKOB_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
		&&((Npc_KnowsInfo(other, DIA_Sekob_HALLO))== FALSE)
		&& (Kapitel < 3)
		&& (Npc_IsDead(Sekob)== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_SEKOB_Info ()
{
	AI_Output			(other, self, "DIA_Till_SEKOB_15_00"); //Tengo que hablar con tu padre.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_01"); //No tiene tiempo, pero yo soy su ayudante. ¿En qué puedo ayudarte?
	AI_Output			(other, self, "DIA_Till_SEKOB_15_02"); //Preséntame a tu padre.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_03"); //Eres un tipo duro y un buen luchador, ¿eh?
	AI_Output			(other, self, "DIA_Till_SEKOB_15_04"); //El mejor.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_05"); //Entonces, será mejor que vaya a por él.
	AI_Output			(other, self, "DIA_Till_SEKOB_15_06"); //Da lo mismo, chaval. Seguro que lo encuentro.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_07"); //Si tú lo dices.
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	10;
	condition	 = 	DIA_Till_WASMACHSTDU_Condition;
	information	 = 	DIA_Till_WASMACHSTDU_Info;

	description	 = 	"¿Y a qué te dedicas?";
};

func int DIA_Till_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Till_WASMACHSTDU_15_00"); //¿Y a qué te dedicas cuando no juegas a ser el gerente de la granja?
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_01"); //Monto guardia.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_02"); //Los asquerosos milicianos de la ciudad cada vez frecuentan más nuestras tierras y roban todo lo que pueden.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_03"); //La última vez fue la semana pasada y se llevaron unas cuantas ovejas.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_04"); //Como coja a alguno, me lo cargo.
	AI_Output			(other, self, "DIA_Till_WASMACHSTDU_15_05"); //¡Por supuesto!

};

///////////////////////////////////////////////////////////////////////
//	Info warumnichtsld
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WARUMNICHTSLD		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	11;
	condition	 = 	DIA_Till_WARUMNICHTSLD_Condition;
	information	 = 	DIA_Till_WARUMNICHTSLD_Info;

	description	 = 	"¿Por qué no os ayudan los mercenarios con la milicia?";
};

func int DIA_Till_WARUMNICHTSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_WASMACHSTDU))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_WARUMNICHTSLD_Info ()
{
	AI_Output			(other, self, "DIA_Till_WARUMNICHTSLD_15_00"); //¿Por qué no os ayudan los mercenarios con la milicia?
	AI_Output			(self, other, "DIA_Till_WARUMNICHTSLD_03_01"); //Antes de que acaben con los ejercicios de calentamiento, ya he echado a la milicia.
};

///////////////////////////////////////////////////////////////////////
//	Info Bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKO		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	5;
	condition	 = 	DIA_Till_BRONKO_Condition;
	information	 = 	DIA_Till_BRONKO_Info;

	description	 = 	"(Preguntar por Bronco)";
};

func int DIA_Till_BRONKO_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
		&& (Npc_KnowsInfo(other, DIA_Bronko_HALLO))
		&& (Kapitel < 5)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKO_15_00"); //Hay un tipo que exige peaje a todos los transeúntes, pues afirma ser el granjero.
	AI_Output			(self, other, "DIA_Till_BRONKO_03_01"); //(Avergonzado) Eh... sí. Es Bronco. Hace lo que le da la gana.
	AI_Output			(self, other, "DIA_Till_BRONKO_03_02"); //Le he sacudido más de mil veces para que vuelva al trabajo.
	AI_Output			(other, self, "DIA_Till_BRONKO_15_03"); //¿Pero?
	AI_Output			(self, other, "DIA_Till_BRONKO_03_04"); //No lo hace.
	
	if (Npc_IsDead(Sekob)== FALSE)
	{
		AI_Output			(self, other, "DIA_Till_BRONKO_03_05"); //Mi padre está enfadado conmigo porque aún no he conseguido convencerle para que vuelva a trabajar.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Bronkozurarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOZURARBEIT		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	6;
	condition	 = 	DIA_Till_BRONKOZURARBEIT_Condition;
	information	 = 	DIA_Till_BRONKOZURARBEIT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Quizá pueda ayudarte.";
};

var int DIA_Till_BRONKOZURARBEIT_noPerm;

func int DIA_Till_BRONKOZURARBEIT_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_BRONKO))
		&& (DIA_Till_BRONKOZURARBEIT_noPerm == FALSE)
		&& (Kapitel < 5)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_BRONKOZURARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_15_00"); //Quizá pueda ayudarte.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_03_01"); //¿En serio? Bueno, si consigues que Bronco vuelva al trabajo, te pagaré... 10 monedas de oro, por ejemplo. ¿Qué te parece?

	Till_Angebot = 10;

	Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);

	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "No hay problema, pero quiero más dinero.", DIA_Till_BRONKOZURARBEIT_mehr );
	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Muy bien. Veré qué puedo hacer.", DIA_Till_BRONKOZURARBEIT_ok );
	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Me lo pensaré.", DIA_Till_BRONKOZURARBEIT_nochnicht );

};

func void DIA_Till_BRONKOZURARBEIT_nochnicht ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_nochnicht_15_00"); //Me lo pensaré.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_nochnicht_03_01"); //Haz lo que quieras.

	Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
	AI_StopProcessInfos (self);
};

func void DIA_Till_BRONKOZURARBEIT_ok ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_ok_15_00"); //Muy bien. Veré qué puedo hacer.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_ok_03_01"); //Pero date prisa.
	
	DIA_Till_BRONKOZURARBEIT_noPerm = TRUE;
	MIS_Sekob_Bronko_eingeschuechtert = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Bronkoeingeschuechtert, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert, LOG_RUNNING);
	B_LogEntry (TOPIC_Bronkoeingeschuechtert,"Till no consigue que Bronko trabaje. Quiere que pruebe yo."); 

	AI_StopProcessInfos (self);
};

func void DIA_Till_BRONKOZURARBEIT_mehr ()
{
	if (Till_IchMachsNurEinmal == TRUE)
		{
			AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_00"); //Quiero más.
		}
	else
		{
			AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_01"); //No hay problema, pero quiero más dinero.
			Till_IchMachsNurEinmal = TRUE;
		};

	 if (Till_Angebot == 10)
	 	{
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_02"); //Muy bien. 20 monedas de oro, pues.
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Quiero más.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Muy bien. Veré qué puedo hacer.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 20;
		}
	 else if (Till_Angebot == 20)
		{
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_03"); //¿30?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Quiero más.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Muy bien. Veré qué puedo hacer.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 30;
		}
	 else if (Till_Angebot == 30)
		{	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_04"); //¿Tal vez... 50?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Quiero más.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Muy bien. Veré qué puedo hacer.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 50;
		}
	 else if (Till_Angebot == 50)
		{	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_05"); //Muy bien. ¿70?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Quiero más.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Muy bien. Veré qué puedo hacer.", DIA_Till_BRONKOZURARBEIT_ok );
		Till_Angebot = 70;
		}
	 else if (Till_Angebot == 70)
		{	
	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_06"); //¡Vale, vale! Te pagaré 100 monedas de oro, pero no tengo más.
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);

			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Muy bien. Veré qué puedo hacer.", DIA_Till_BRONKOZURARBEIT_ok );

			Till_Angebot = 100;
		};
};

///////////////////////////////////////////////////////////////////////
//	Info bronkowiederanArbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOWIEDERANARBEIT		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	7;
	condition	 = 	DIA_Till_BRONKOWIEDERANARBEIT_Condition;
	information	 = 	DIA_Till_BRONKOWIEDERANARBEIT_Info;

	description	 = 	"Bronco ha vuelto al trabajo.";
};

func int DIA_Till_BRONKOWIEDERANARBEIT_Condition ()
{
	if 	(
		(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		&& (DIA_Till_BRONKOZURARBEIT_noPerm == TRUE)
		&& (Kapitel < 5)
		)
		{
				return TRUE;
		};
};

func void DIA_Till_BRONKOWIEDERANARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_00"); //Bronco ha vuelto al trabajo.
	AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_01"); //¿En serio? Genial.
	AI_Output			(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_02"); //Sí. Y ahora quiero mi dinero.
	
	IntToFloat	(Till_Angebot);
	
	if (Till_Angebot <= 50)
		{
			AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_03"); //(Dubitativo) Um. Bueno. Así son los negocios, ¿no?

			CreateInvItems (self, ItMi_Gold, Till_Angebot);									
			B_GiveInvItems (self, other, ItMi_Gold, Till_Angebot);
		}
	else
		{
			AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_04"); //Por desgracia, no tengo tanto dinero. Pero te estoy muy agradecido por la ayuda.

			Till_HatSeinGeldBehalten = TRUE;
		};

	B_GivePlayerXP (XP_BronkoGehtAnDieArbeit);

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Till_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	99;
	condition	 = 	DIA_Till_PERMKAP1_Condition;
	information	 = 	DIA_Till_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Molestar a Till)";
};

func int DIA_Till_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	|| (Kapitel >= 5)
		{
				return TRUE;
		};
};

func void DIA_Till_PERMKAP1_Info ()
{
	if (Kapitel == 5)
		{
			if (MIS_bringRosiBackToSekob != LOG_SUCCESS)
			&& (Rosi_FleeFromSekob_Kap5 == TRUE)
			{
				AI_Output			(other, self, "DIA_Till_PERMKAP1_15_00"); //Estás muy lejos de casa, ¿eh? Papá no va a poder ayudarte.
				AI_Output			(self, other, "DIA_Till_PERMKAP1_03_01"); //Uno de estos días voy a cerrarte esa bocaza que tienes.
			};
			
			AI_Output			(other, self, "DIA_Till_PERMKAP1_15_02"); //Considérate afortunado si te dejo con vida, perdedor.
			AI_Output			(self, other, "DIA_Till_PERMKAP1_03_03"); //Entonces déjame en paz.
			AI_StopProcessInfos (self);	
		}
		else
		{		
			if 	(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
				{
					AI_Output			(other, self, "DIA_Till_PERMKAP1_15_04"); //A lo mejor deberías comer más para hacerte grande y fuerte.
					AI_Output			(self, other, "DIA_Till_PERMKAP1_03_05"); //Algún día te daré una lección.
					AI_StopProcessInfos (self);
				}
			else
				{
					if (Till_HatSeinGeldBehalten == TRUE)
						{
							AI_Output			(other, self, "DIA_Till_PERMKAP1_15_06"); //Maldito enano...
							AI_Output			(self, other, "DIA_Till_PERMKAP1_03_07"); //Lárgate.
							AI_StopProcessInfos (self);
						}			
					else
						{
							AI_Output			(other, self, "DIA_Till_PERMKAP1_15_08"); //¿Ya te ha sonado la nariz alguien hoy?
							AI_Output			(self, other, "DIA_Till_PERMKAP1_03_09"); //Déjame en paz, idiota.
						};
				};
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Till_PICKPOCKET (C_INFO)
{
	npc			= BAU_931_Till;
	nr			= 900;
	condition	= DIA_Till_PICKPOCKET_Condition;
	information	= DIA_Till_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Till_PICKPOCKET_Condition()
{
	C_Beklauen (36, 40);
};
 
FUNC VOID DIA_Till_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Till_PICKPOCKET);
	Info_AddChoice		(DIA_Till_PICKPOCKET, DIALOG_BACK 		,DIA_Till_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Till_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Till_PICKPOCKET_DoIt);
};

func void DIA_Till_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Till_PICKPOCKET);
};
	
func void DIA_Till_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Till_PICKPOCKET);
};


