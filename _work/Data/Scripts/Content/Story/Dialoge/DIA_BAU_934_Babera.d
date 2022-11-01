///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Babera_EXIT   (C_INFO)
{
	npc         = BAU_934_Babera;
	nr          = 999;
	condition   = DIA_Babera_EXIT_Condition;
	information = DIA_Babera_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Babera_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Babera_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_HALLO		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	1;
	condition	 = 	DIA_Babera_HALLO_Condition;
	information	 = 	DIA_Babera_HALLO_Info;

	description	 = 	"Hola, bella muchacha.";
};

func int DIA_Babera_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Babera_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Babera_HALLO_15_00"); //Hola, bella muchacha.
	AI_Output			(self, other, "DIA_Babera_HALLO_16_01"); //Deja de dorarme la píldora, chaval. Dime lo que quieres. Estoy ocupada.
};

///////////////////////////////////////////////////////////////////////
//	Info Wiesiehtsaus
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_WIESIEHTSAUS		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	2;
	condition	 = 	DIA_Babera_WIESIEHTSAUS_Condition;
	information	 = 	DIA_Babera_WIESIEHTSAUS_Info;

	description	 = 	"¿Cómo va el trabajo en el campo?";
};

func int DIA_Babera_WIESIEHTSAUS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Babera_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Babera_WIESIEHTSAUS_Info ()
{
	AI_Output			(other, self, "DIA_Babera_WIESIEHTSAUS_15_00"); //¿Cómo va el trabajo en el campo?
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_16_01"); //Si miras lo grandes que son las parcelas en las que tenemos que trabajar, te puedes hacer a la idea...
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_16_02"); //¿Buscas trabajo como labrador?

	Info_ClearChoices	(DIA_Babera_WIESIEHTSAUS);

	if (hero.guild == GIL_NONE)
		{
			Info_AddChoice	(DIA_Babera_WIESIEHTSAUS, "No. La verdad es que quiero convertirme en mercenario.", DIA_Babera_WIESIEHTSAUS_Nein );
			Info_AddChoice	(DIA_Babera_WIESIEHTSAUS, "Tal vez.", DIA_Babera_WIESIEHTSAUS_Vielleicht );
		};
};
func void DIA_Babera_WIESIEHTSAUS_Vielleicht ()
{
	AI_Output			(other, self, "DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00"); //Tal vez.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01"); //En ese caso, ve a ver al viejo negrero, al granjero Sekob. A lo mejor tiene algo para ti.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02"); //Por otro lado, también podrías intentarlo en la granja de Onar al final del camino largo.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03"); //Pero ten cuidado con los mercenarios. No les gustan los forasteros.

	Info_ClearChoices	(DIA_Babera_WIESIEHTSAUS);
};

func void DIA_Babera_WIESIEHTSAUS_Nein ()
{
	AI_Output			(other, self, "DIA_Babera_WIESIEHTSAUS_Nein_15_00"); //No. La verdad es que quiero convertirme en mercenario.
	AI_Output			(self, other, "DIA_Babera_WIESIEHTSAUS_Nein_16_01"); //Entonces éste no es tu sitio. Los mercenarios suelen estar en la granja del terrateniente.

	Info_ClearChoices	(DIA_Babera_WIESIEHTSAUS);
};

///////////////////////////////////////////////////////////////////////
//	Info bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_BRONKO		(C_INFO)
{
	npc		 	 = 	BAU_934_Babera;
	nr		 	 = 	3;
	condition	 = 	DIA_Babera_BRONKO_Condition;
	information	 = 	DIA_Babera_BRONKO_Info;

	description	 = 	"(Preguntar por Bronco)";
};

func int DIA_Babera_BRONKO_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bronko_Hallo))
		&& (Npc_KnowsInfo(other, DIA_Babera_WIESIEHTSAUS)) 
		)
		{
				return TRUE;
		};
};

func void DIA_Babera_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Babera_BRONKO_15_00"); //Oye, ese tipo desagradable de ahí...
	AI_Output			(self, other, "DIA_Babera_BRONKO_16_01"); //Es Bronco. ¿Qué pasa con él?
	AI_Output			(other, self, "DIA_Babera_BRONKO_15_02"); //¿Es tu granjero?
	AI_Output			(self, other, "DIA_Babera_BRONKO_16_03"); //(Se ríe) ¿Te ha dicho eso? Sekob es el granjero. Bronco no es más que un vago y un haragán, pero es fuerte como un toro.
	AI_Output			(self, other, "DIA_Babera_BRONKO_16_04"); //Por eso nadie le dice nada cuando no trabaja.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Babera_BRONKO_16_05"); //Solo le tiene miedo a los mercenarios.

		}
	else
		{
			AI_Output			(self, other, "DIA_Babera_BRONKO_16_06"); //Los únicos que pueden hacerle trabajar son los mercenarios. Les tiene miedo.

		};
	Babera_BronkoKeinBauer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Rosi
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_Rosi		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	3;
	condition	 = 	DIA_Babera_Rosi_Condition;
	information	 = 	DIA_Babera_Rosi_Info;

	description	 = 	"¿Dónde está Rosi?";
};

func int DIA_Babera_Rosi_Condition ()
{
		if (MIS_bringRosiBackToSekob == LOG_RUNNING)
		&& (Kapitel >= 5)
		&& (RosiFoundKap5 == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Babera_Rosi_Info ()
{
	AI_Output			(other, self, "DIA_Babera_Rosi_15_00"); //¿Dónde está Rosi?
	AI_Output			(self, other, "DIA_Babera_Rosi_16_01"); //No pudo soportarlo más y se fue al norte, a los bosques.
	B_LogEntry (TOPIC_RosisFlucht,"Rosi ha huido de la granja de Sekob. Babera dice que abandonó la granja y fue hacia el norte, al bosque."); 
	B_LogEntry (TOPIC_bringRosiBackToSekob,"Rosi ha huido de la granja de Sekob. Babera dice que abandonó la granja y fue hacia el norte, al bosque."); 
};


///////////////////////////////////////////////////////////////////////
//	Info dustoerst
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_DUSTOERST		(C_INFO)
{
	npc		 = 	BAU_934_Babera;
	nr		 = 	10;
	condition	 = 	DIA_Babera_DUSTOERST_Condition;
	information	 = 	DIA_Babera_DUSTOERST_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Y además de eso?";
};

func int DIA_Babera_DUSTOERST_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Babera_BRONKO))
		{
				return TRUE;
		};
};

func void DIA_Babera_DUSTOERST_Info ()
{
	AI_Output			(other, self, "DIA_Babera_DUSTOERST_15_00"); //¿Y además de eso?
	AI_Output			(self, other, "DIA_Babera_DUSTOERST_16_01"); //Estoy ocupado.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Babera_PICKPOCKET (C_INFO)
{
	npc			= BAU_934_Babera;
	nr			= 900;
	condition	= DIA_Babera_PICKPOCKET_Condition;
	information	= DIA_Babera_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Babera_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Babera_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Babera_PICKPOCKET);
	Info_AddChoice		(DIA_Babera_PICKPOCKET, DIALOG_BACK 		,DIA_Babera_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Babera_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Babera_PICKPOCKET_DoIt);
};

func void DIA_Babera_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Babera_PICKPOCKET);
};
	
func void DIA_Babera_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Babera_PICKPOCKET);
};


