///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Tengron_EXIT   (C_INFO)
{
	npc         = Pal_280_Tengron;
	nr          = 999;
	condition   = DIA_Tengron_EXIT_Condition;
	information = DIA_Tengron_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Tengron_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Tengron_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_First		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	2;
	condition	 = 	DIA_Tengron_First_Condition;
	information	 = 	DIA_Tengron_First_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tengron_First_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_ScoutMine != LOG_RUNNING)
	&& (MIS_ScoutMine != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Tengron_First_Info ()
{
	AI_Output (self, other, "DIA_Tengron_First_07_00"); //¿Qué haces aquí?
	AI_Output (other, self, "DIA_Tengron_First_15_01"); //Viajo por orden de lord Hagen.
	AI_Output (self, other, "DIA_Tengron_First_07_02"); //Tienes que intentar llegar como sea al castillo y hablar con el comandante Garond.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HALLO		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	2;
	condition	 = 	DIA_Tengron_HALLO_Condition;
	information	 = 	DIA_Tengron_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tengron_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_ScoutMine == LOG_RUNNING)
	|| (MIS_ScoutMine == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Tengron_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Tengron_HALLO_07_00"); //¡Que Innos te acompañe! ¿Traes noticias del castillo? ¿Llegarán pronto los refuerzos?
	
	if (Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output (other, self, "DIA_Tengron_HALLO_15_01"); //No he venido a traer noticias, sino a obtenerlas.
		AI_Output (self, other, "DIA_Tengron_HALLO_07_02"); //Entonces habla con Fajeth. Es el que está al mando. Pero si tienes noticias del castillo, házmelas saber.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_News		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	7;
	condition	 = 	DIA_Tengron_News_Condition;
	information	 = 	DIA_Tengron_News_Info;
	permanent 	 =  FALSE;
	description	 = 	"Acerca de las noticias...";
};

func int DIA_Tengron_News_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_News_Info ()
{
	AI_Output (other, self, "DIA_Tengron_News_15_00"); //Con respecto a las noticias...
	AI_Output (self, other, "DIA_Tengron_News_07_01"); //Sí, ¿cuál es la situación en el castillo?
	AI_Output (other, self, "DIA_Tengron_News_15_02"); //Todavía está asediado por los orcos y aún es vulnerable a los ataques de los dragones.
	AI_Output (self, other, "DIA_Tengron_News_07_03"); //Maldición, espero que los chicos puedan aguantar.
	AI_Output (self, other, "DIA_Tengron_News_07_04"); //Escucha, tengo un amigo en el castillo. Se llama Udar. Nos conocemos desde hace mucho y hemos luchado en muchas batallas, codo con codo.
	AI_Output (self, other, "DIA_Tengron_News_07_05"); //Quiero que le lleves este anillo. Lo pondrá a buen recaudo. Dile que lo recuperaré cuando vuelva.
	
	Info_ClearChoices (DIA_Tengron_News);
	
	Info_AddChoice (DIA_Tengron_News,"No tengo tiempo para eso.",DIA_Tengron_News_No);
	Info_AddChoice (DIA_Tengron_News,"Sin problemas...",DIA_Tengron_News_Yes);
};
FUNC VOID DIA_Tengron_News_No()
{
	AI_Output (other, self, "DIA_Tengron_News_No_15_00"); //No tengo tiempo para eso.
	AI_Output (self, other, "DIA_Tengron_News_No_07_01"); //Comprendo.
	
	Info_ClearChoices (DIA_Tengron_News);
};
FUNC VOID DIA_Tengron_News_Yes()
{
	AI_Output (other, self, "DIA_Tengron_News_Yes_15_00"); //No hay problema. Cuando llegue al castillo le daré el anillo a Udar.
	AI_Output (self, other, "DIA_Tengron_News_Yes_07_01"); //Bien. La magia del anillo le proporcionará nuevas fuerzas a Udar. Y dile que ya se lo pediré de vuelta.
	
	B_GiveInvItems (self,other,ItRi_Tengron,1);
	Info_ClearChoices (DIA_Tengron_News);
	
	Log_CreateTopic (Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus (Topic_TengronRing,LOG_RUNNING);
	B_LogEntry (Topic_TengronRing,"Tengron me ha dado un anillo que debo entregar a Udar, en el castillo.");
};
///////////////////////////////////////////////////////////////////////
//	Info Situation
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_Situation		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	70;
	condition	 = 	DIA_Tengron_Situation_Condition;
	information	 = 	DIA_Tengron_Situation_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Qué tal van las cosas por aquí?";
};
func int DIA_Tengron_Situation_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};
func void DIA_Tengron_Situation_Info ()
{
	AI_Output (other, self, "DIA_Tengron_Situation_15_00"); //¿Qué tal van las cosas por aquí?
	AI_Output (self, other, "DIA_Tengron_Situation_07_01"); //Estamos rodeados de monstruos y apenas hemos recogido mineral. Además, hemos perdido muchos buenos hombres.
	AI_Output (self, other, "DIA_Tengron_Situation_07_02"); //No sé cuánto podremos aguantar, ¡pero no nos rendiremos!
};
///////////////////////////////////////////////////////////////////////
//	Info NeedYourHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HELP		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	9;
	condition	 = 	DIA_Tengron_HELP_Condition;
	information	 = 	DIA_Tengron_HELP_Info;
	permanent 	 =  FALSE;
	description	 = 	"Me vendría bien que me ayudaras..."; 
};
func int DIA_Tengron_HELP_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	&&  Npc_KnowsInfo(other, DIA_Tengron_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Tengron_HELP_Info ()
{
	AI_Output (other, self, "DIA_Tengron_HELP_15_00"); //Podrías ser de ayuda. Fajeth quiere que cace a los lagartos pero...
	AI_Output (self, other, "DIA_Tengron_HELP_07_01"); //SOLO recibo órdenes de Fajeth. Y mis órdenes son vigilar la mina. Eso es exactamente lo que voy a hacer.
	AI_Output (self, other, "DIA_Tengron_HELP_07_02"); //Quizá te pueda ayudar alguien más.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Tengron_PICKPOCKET (C_INFO)
{
	npc			= Pal_280_Tengron;
	nr			= 900;
	condition	= DIA_Tengron_PICKPOCKET_Condition;
	information	= DIA_Tengron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Tengron_PICKPOCKET_Condition()
{
	C_Beklauen (32, 50);
};
 
FUNC VOID DIA_Tengron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Tengron_PICKPOCKET);
	Info_AddChoice		(DIA_Tengron_PICKPOCKET, DIALOG_BACK 		,DIA_Tengron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Tengron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Tengron_PICKPOCKET_DoIt);
};

func void DIA_Tengron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Tengron_PICKPOCKET);
};
	
func void DIA_Tengron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Tengron_PICKPOCKET);
};






