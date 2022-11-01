///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parcival_EXIT   (C_INFO)
{
	npc         = PAL_252_Parcival;
	nr          = 999;
	condition   = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Parcival_EXIT_Condition()
{
	if (Kapitel < 3)
	{
			return TRUE;
	};
};

FUNC VOID DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Schürfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Schurfer		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  2;
	condition	 = 	DIA_Parcival_Schurfer_Condition;
	information	 = 	DIA_Parcival_Schurfer_Info;
	permanent 	 =  FALSE;
	description	 =	"¿Qué puedes contarme de los raspadores?";
};
func int DIA_Parcival_Schurfer_Condition ()	
{	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Schurfer_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Schurfer_15_00"); //¿Qué puedes contarme de los raspadores?
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_01"); //Yo organicé los tres grupos.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_02"); //Marcos, Fajeth y Silvestro son los paladines que lideran cada uno de ellos.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_03"); //El grupo de Marcos fue hacia una vieja mina, liderado por un viejo excavador que se llama Grimes.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_04"); //Los otros dos grupos partieron juntos.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_05"); //Jergan, uno de nuestros exploradores, nos ha informado de que han acampado cerca de una torre grande.
	
	B_LogEntry (TOPIC_ScoutMine,"Cada unidad de raspadores está lideradas por un paladín: Marcos, Fajeth y Silvestro.");
	B_LogEntry (TOPIC_ScoutMine,"El grupo de Marcos fue hacia lo que solía ser la vieja mina. Su explorador es Grimes, el excavador."); 
	B_LogEntry (TOPIC_ScoutMine,"Los otros dos grupos partieron juntos y acamparon cerca de la gran torre."); 
	
};
///////////////////////////////////////////////////////////////////////
//	Info Schürfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Diego		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  9;
	condition	 = 	DIA_Parcival_Diego_Condition;
	information	 = 	DIA_Parcival_Diego_Info;
	permanent 	 =  FALSE;
	description	 =	"¿Con qué grupo de raspadores fue Diego?";
};
func int DIA_Parcival_Diego_Condition ()	
{	
	if (SearchForDiego == LOG_RUNNING)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Diego_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Diego_15_00"); //¿Con qué grupo de raspadores fue Diego?
	AI_Output (self, other, "DIA_Parcival_Diego_13_01"); //Ese convicto, ¿Diego?, iba con el grupo de Silvestro.
	
	B_LogEntry (TOPIC_ScoutMine,"Diego está con los raspadores que dirige Silvestro."); 
};
///////////////////////////////////////////////////////////////////////
//	Info Weg
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Weg		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  8;
	condition	 = 	DIA_Parcival_Weg_Condition;
	information	 = 	DIA_Parcival_Weg_Info;
	permanent 	 =  FALSE;
	description	 =	"¿Sabes cómo llegar a las minas?";
};
func int DIA_Parcival_Weg_Condition ()	
{	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Weg_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Weg_15_00"); //¿Sabes cómo llegar a las minas?
	AI_Output (self, other, "DIA_Parcival_Weg_13_01"); //No hay un camino seguro hasta el valle. Pero yo diría que lo lógico sería no tomar una ruta directa.
	AI_Output (self, other, "DIA_Parcival_Weg_13_02"); //Mantente alejado de los orcos y de los bosques, y que Innos te proteja.
	
	B_LogEntry (TOPIC_ScoutMine,"Puede que lo más inteligente sea no tomar una ruta directa hacia los raspadores. En concreto, debería evitar los orcos y los bosques."); 
};

///////////////////////////////////////////////////////////////////////
//	Info DRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGON		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  2;
	condition	 = 	DIA_Parcival_DRAGON_Condition;
	information	 = 	DIA_Parcival_DRAGON_Info;
	description	 =	"¿Cómo van las cosas?";
};
func int DIA_Parcival_DRAGON_Condition ()	
{
	return TRUE;
};
func void DIA_Parcival_DRAGON_Info ()
{
	AI_Output (other, self, "DIA_Parcival_DRAGON_15_00"); //¿Cuál es la situación?
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_01"); //El campamento está rodeado de orcos. Se han atrincherado completamente.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_02"); //Pero son aún más alarmantes los ataques de los dragones. Hasta ahora han destruido todo el baluarte exterior.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_03"); //Otro ataque de un dragón y las bajas serán enormes.
};
///////////////////////////////////////////////////////////////////////
//	Info DRAGONS
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGONS		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr		 	 = 	2;
	condition	 = 	DIA_Parcival_DRAGONS_Condition;
	information	 = 	DIA_Parcival_DRAGONS_Info;
	description	 = 	"¿Cuántos dragones hay?";
};

func int DIA_Parcival_DRAGONS_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Parcival_DRAGON)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Parcival_DRAGONS_Info ()
{
	AI_Output (other, self, "DIA_Parcival_DRAGONS_15_00"); //¿Cuántos dragones hay?
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_01"); //No sabemos cuántos hay, pero seguro que más de uno.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_02"); //Pero eso no es todo. Todo el Valle de las Minas está lleno de criaturas malignas que apoyan a los dragones.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_03"); //No nos engañemos, sin refuerzos del exterior, nuestras oportunidades de salir vivos de aquí son escasísimas.
	 
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info BRAVE
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_BRAVE		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	8;
	condition	 = 	DIA_Parcival_BRAVE_Condition;
	information	 = 	DIA_Parcival_BRAVE_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Parcival_BRAVE_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& Npc_KnowsInfo (hero,DIA_Parcival_DRAGONS)
	&& (Kapitel < 3)
	&& (Parcival_BRAVE_LaberCount <= 6)
	{
		return TRUE;
	};
};

var int Parcival_BRAVE_LaberCount;
func void DIA_Parcival_BRAVE_Info ()
{
	if (Parcival_BRAVE_LaberCount < 6)
	{
		var int randy;
		randy = Hlp_Random (3);
		
		if randy == 0
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_00"); //Todo sigue tranquilo. Pero puede cambiar en cualquier momento.
		};
		if randy == 1
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_01"); //Aguantaremos todo lo que podamos.
		};
		if randy == 2
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_02"); //Innos nos ayudará. ¡Su luz ilumina nuestros corazones!
		};
	
	}
	else 
	{
	AI_Output			(self, other, "DIA_Parcival_BRAVE_13_03"); //¡Eh! ¿No tienes nada mejor que hacer que charlar conmigo? ¡Lárgate!
	B_GivePlayerXP (XP_Ambient);
	};
	
	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
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

INSTANCE DIA_Parcival_KAP3_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP3_EXIT_Condition;
	information	= DIA_Parcival_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info AllesKlar
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_ALLESKLAR		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	nr		 = 	31;
	condition	 = 	DIA_Parcival_ALLESKLAR_Condition;
	information	 = 	DIA_Parcival_ALLESKLAR_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Va todo bien?";
};

func int DIA_Parcival_ALLESKLAR_Condition ()
{
	if (Kapitel == 3)
		&& 	(DIA_Parcival_ALLESKLAR_NervCounter < 3)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
		{
				return TRUE;
		};
};
var int DIA_Parcival_ALLESKLAR_NervCounter;
func void DIA_Parcival_ALLESKLAR_Info ()
{
	AI_Output			(other, self, "DIA_Parcival_ALLESKLAR_15_00"); //¿Va todo bien?

	if (DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_01"); //¡Hasta ahora!
	}	
	else if (DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_02"); //Sí, maldita sea.
	}	
	else if (Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_03"); //(Risas) Ah, ahora entiendo lo que tienes pensado. No, amigo mío. Esta vez no.
	}
	else
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_04"); //No me molestes.
	};

	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter + 1;
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

INSTANCE DIA_Parcival_KAP4_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP4_EXIT_Condition;
	information	= DIA_Parcival_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Ist irgendwas wichtiges passiert?
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_AnyNews		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_AnyNews_Condition;
	information	 = 	DIA_Parcival_AnyNews_Info;

	description  =	"¿Ha ocurrido algo importante?";		
};

func int DIA_Parcival_AnyNews_Condition ()
{	
	if (Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_AnyNews_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_AnyNews_15_00"); //¿Ha ocurrido algo importante?
	if (hero.guild == GIL_DJG)
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_01"); //¿Eres uno de esos desgraciados que se hacen llamar cazadores de dragones?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_02"); //La verdad es que esperaba fueras lo bastante honorable como para no unirte a esa gente.
	
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_03"); //Estoy preocupado, muy preocupado.
		AI_Output 	(other,self ,"DIA_Parcival_AnyNews_15_04"); //¿Por qué?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_05"); //Hace poco aparecieron estos hombres que se hacen llamar cazadores de dragones.
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_06"); //En lo que a mí respecta, no son más que vagos y criminales.
	};
	AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_07"); //Si dependiera de mí, los echaría a todos del castillo. Dejemos que los orcos se encarguen de ellos.

	Info_ClearChoices (DIA_Parcival_AnyNews);
	Info_AddChoice	(DIA_Parcival_AnyNews,"A diferencia de Lord Hagen, están aquí.",DIA_Parcival_AnyNews_LordHagen); 
	Info_AddChoice	(DIA_Parcival_AnyNews,"Deberías darles una oportunidad.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice	(DIA_Parcival_AnyNews,"¿No crees que exageras?",DIA_Parcival_AnyNews_Overact);
	
};

FUNC VOID DIA_Parcival_AnyNews_LordHagen ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_LordHagen_15_00"); //A diferencia de lord Hagen, están aquí.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_01"); //(Riendo amargamente) Sí, por desgracia son todo lo que tenemos.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_02"); //Desde luego, Innos nos está sometiendo a una dura prueba.
	
	Info_ClearChoices (DIA_Parcival_AnyNews);
};

FUNC VOID DIA_Parcival_AnyNews_Chance ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Chance_15_00"); //Deberías darles una oportunidad.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_01"); //Tienen una, por desgracia.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_02"); //Garond está convencido de que pueden ayudarnos.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_03"); //Pero los tendré vigilados. Ya tenemos suficientes problemas con los orcos y no nos podemos permitir más.
	
	Info_ClearChoices (DIA_Parcival_AnyNews);  
};

FUNC VOID DIA_Parcival_AnyNews_Overact ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Overact_15_00"); //¿No crees que exageras?
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_01"); //Para nada. En nuestra situación, necesitamos hombres que sirvan de ejemplo.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_02"); //Guerreros que despierten el fuego de Innos en nuestros guerreros.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_03"); //Y, en cambio, esa escoria acaba con la moral de mis tropas.
};
 
///////////////////////////////////////////////////////////////////////
//	Ich muss mit dir über Jan reden
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_Jan		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_Jan_Condition;
	information	 = 	DIA_Parcival_Jan_Info;
	permanent	 = 	FALSE;
	description  =	"Tengo que hablarte de Jan.";		
};

func int DIA_Parcival_Jan_Condition ()
{	
	if (MIS_JanBecomesSmith == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_Jan_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_00"); //Tengo que hablarte de Jan.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_01"); //¿Jan? ¿Quién es?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_02"); //Un cazador de dragones. Es herrero.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_03"); //Oh, sí, me acuerdo de él. ¿Qué pasa con él?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_04"); //Quiere trabajar en la herrería.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_05"); //Ni hablar. No es uno de los nuestros y no confío en él.
}; 
 
///////////////////////////////////////////////////////////////////////
//	Kannst du das mit Jan noch mal überdenken?
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_ThinkAgain		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_ThinkAgain_Condition;
	information	 = 	DIA_Parcival_ThinkAgain_Info;
	permanent	 = 	TRUE;
	description  =	"¿No puedes volver a pensar en lo de Jan?";		
};

func int DIA_Parcival_ThinkAgain_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Parcival_Jan)) 
	&& (MIS_JanBecomesSmith == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Parcival_ThinkAgain_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_ThinkAgain_15_00"); //¿No puedes volver a pensarte lo de Jan?
	AI_Output 	(self ,other,"DIA_Parcival_ThinkAgain_13_01"); //No, mi decisión es firme.
}; 
 
///////////////////////////////////////////////////////////////////////
//	Garond will, dass Jan die Schmiede übernimmt.
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_TalkedGarond		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_TalkedGarond_Condition;
	information	 = 	DIA_Parcival_TalkedGarond_Info;

	description  =	"Garond quiere que Jan se encargue de la herrería.";		
};

func int DIA_Parcival_TalkedGarond_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Parcival_Jan))
	&& (MIS_JanBecomesSmith == LOG_SUCCESS)	 
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_TalkedGarond_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_TalkedGarond_15_00"); //Garond quiere que Jan se encargue de la herrería.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_01"); //Mmm. Si es así, en lo que a mí respecta puede quedarse la herrería.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_02"); //Aunque sigo pensando que es un error confiar en ese Jan.
};  

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_PERMKAP4		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	nr		 = 	43;
	condition	 = 	DIA_Parcival_PERMKAP4_Condition;
	information	 = 	DIA_Parcival_PERMKAP4_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Y además de eso?";
};

func int DIA_Parcival_PERMKAP4_Condition ()
{
	if (Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Parcival_AnyNews))
		{
				return TRUE;
		};
};

func void DIA_Parcival_PERMKAP4_Info ()
{
	AI_Output			(other, self, "DIA_Parcival_PERMKAP4_15_00"); //¿Y además de eso?
	AI_Output			(self, other, "DIA_Parcival_PERMKAP4_13_01"); //Ahh, ¡déjame en paz!

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

INSTANCE DIA_Parcival_KAP5_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP5_EXIT_Condition;
	information	= DIA_Parcival_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verraeter
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_VERRAETER		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	condition	 = 	DIA_Parcival_VERRAETER_Condition;
	information	 = 	DIA_Parcival_VERRAETER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Parcival_VERRAETER_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
		&& (MIS_OCGateOpen == TRUE)
		{
			return TRUE;		
		};
};

func void DIA_Parcival_VERRAETER_Info ()
{
	
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_00"); //¡Traidor! Sé que fuiste TÚ el que abrió la puerta.
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_01"); //Pagarás por ello.
	
	Npc_SetRefuseTalk (self,30);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
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


INSTANCE DIA_Parcival_KAP6_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP6_EXIT_Condition;
	information	= DIA_Parcival_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Parcival_PICKPOCKET (C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 900;
	condition	= DIA_Parcival_PICKPOCKET_Condition;
	information	= DIA_Parcival_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Parcival_PICKPOCKET_Condition()
{
	C_Beklauen (84, 460);
};
 
FUNC VOID DIA_Parcival_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Parcival_PICKPOCKET);
	Info_AddChoice		(DIA_Parcival_PICKPOCKET, DIALOG_BACK 		,DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Parcival_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Parcival_PICKPOCKET);
};
	
func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Parcival_PICKPOCKET);
};


















































		
																				
	
	
	
	
	
	
	
	
	
	
	
	














