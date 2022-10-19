//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Dyrian_EXIT   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 999;
	condition   = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Dyrian_Hello   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_Hello_Condition()
{
	if  (Npc_IsInState (self, ZS_Talk))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	&&  (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Hello_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Hello_13_00"); //(Con tristeza) ¿Qué quieres?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Dyrian_Wurst(C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr			= 3;
	condition	= DIA_Dyrian_Wurst_Condition;
	information	= DIA_Dyrian_Wurst_Info;
	permanent	= FALSE;
	description = "Estoy ocupado distribuyendo salchichas.";
};                       

FUNC INT DIA_Dyrian_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dyrian_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Dyrian_Wurst_15_00"); //Estoy ocupado distribuyendo salchichas.
	AI_Output (self, other, "DIA_Dyrian_Wurst_13_01"); //Gracias. Espero que no sea la última salchicha que me den por aquí.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//**************************************************************************
//	Was machst Du hier? 
//**************************************************************************
INSTANCE DIA_Dyrian_Job   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent   = FALSE;
	description = "¿Qué estás haciendo aquí?";
};
FUNC INT DIA_Dyrian_Job_Condition()
{	
	if Npc_KnowsInfo (hero,DIA_Dyrian_Hello)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Job_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Job_15_00"); //¿Qué haces aquí?
	AI_Output (self ,other,"DIA_Dyrian_Job_13_01"); //He infringido los preceptos de la comunidad.
	AI_Output (self ,other,"DIA_Dyrian_Job_13_02"); //Ahora estoy esperando que el Concilio Supremo decida si puedo permanecer en el monasterio.
};
//**************************************************************************
//	Wieso sollst Du das Kloster denn verlassen?
//**************************************************************************

INSTANCE DIA_Dyrian_WhatDone   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent   = FALSE;
	description = "Dime qué pasó.";
};
FUNC INT DIA_Dyrian_WhatDone_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dyrian_Job))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_WhatDone_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_WhatDone_15_00"); //Dime qué pasó.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_01"); //Mientras barría, cogí un libro de las habitaciones de los magos, para leerlo más tarde.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_02"); //Por supuesto, el maestro Hyglas se dio cuenta de inmediato y me preguntó por el libro.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_03"); //Atemorizado por el posible castigo, mentí, pero más tarde me pilló con el libro en mi habitación.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_04"); //Se enfadó mucho e informó al Concilio Supremo. Ahora están discutiendo si podré quedarme.
};

//**************************************************************************
//	Kann ich dir irgendwie helfen?
//**************************************************************************
INSTANCE DIA_Dyrian_CanHelp   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent   = TRUE;
	description = "¿Puedo ayudarte de alguna manera?";
};
FUNC INT DIA_Dyrian_CanHelp_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Job)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_CanHelp_15_00"); //¿Puedo ayudarte de alguna manera?
	AI_Output (self ,other,"DIA_Dyrian_CanHelp_13_01"); //No, estoy a merced de la clemencia de Innos y de los magos.
};
//**************************************************************************
//	SC hat die Prüfung des Feuers angenommen und mit Hyglas gesprochen
//**************************************************************************
INSTANCE DIA_Dyrian_Scroll   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dyrian_Scroll_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	||	(MIS_RUNE == LOG_RUNNING)
	||	(MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_Scroll_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_00"); //Oye, ¿de verdad has pedido la prueba del fuego?
	AI_Output (other,self ,"DIA_Dyrian_Scroll_15_01"); //Sí, y pretendo superarla.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_02"); //Bueno, quizá pueda ayudarte. Puedo darte un pergamino de conjuros muy útil. Un conjuro de DORMIR. ¿Te interesa?

	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"No, no necesito tu ayuda.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"¿Qué quieres a cambio?",DIA_Dyrian_Scroll_How);
	Info_AddChoice (DIA_Dyrian_Scroll,"¿Qué puedo hacer con él?",DIA_Dyrian_Scroll_What);
};
FUNC VOID DIA_Dyrian_Scroll_What ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_00"); //¿Qué puedo hacer con él?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_01"); //Con este conjuro puedes hacer que la gente caiga en un breve sueño mágico. Pero solo si su voluntad es menor que la tuya.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_02"); //Podría ser muy útil si alguien se interpone en tu camino...
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_03"); //¿Y cómo sé si la otra persona tiene una voluntad más débil?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_04"); //No hace falta que te molestes en probar con los magos. Pero podrías poner a dormir a la mayoría de los novicios.
};
FUNC VOID DIA_Dyrian_Scroll_No ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_No_15_00"); //No, no necesito tu ayuda.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_No_13_01"); //Si cambias de opinión, puedes venir a verme cuando quieras.
	Info_ClearChoices (DIA_Dyrian_Scroll);
};
FUNC VOID DIA_Dyrian_Scroll_How ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_How_15_00"); //¿Qué quieres a cambio?
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_01"); //Cada mago que es aceptado, obtiene un deseo.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_02"); //Y si consigues pasar la prueba del fuego, podrías arreglarlo para que me pueda quedar en el monasterio.
	
	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"No, no necesito tu ayuda.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"De acuerdo, dame el pergamino.",DIA_Dyrian_Scroll_Yes);
	
};
FUNC VOID DIA_Dyrian_Scroll_Yes ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_Yes_15_00"); //De acuerdo, dame el pergamino.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_Yes_13_01"); //Buena suerte con la prueba. Que Innos te ayude.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
	Log_CreateTopic (Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus (Topic_DyrianDrin,LOG_RUNNING);
	B_LogEntry (Topic_DyrianDrin,"Dyrian me ha dado un pergamino de dormir. A cambio, quiere que, cuando me convierta en mago, interceda para que se le permita quedarse en el monasterio.");
	Info_ClearChoices (DIA_Dyrian_Scroll);
	
};
//**************************************************************************
//	Doch Scroll nehmen
//**************************************************************************
INSTANCE DIA_Dyrian_Doch   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent   = TRUE;
	description = "He cambiado de idea. Dame el conjuro de dormir.";
};
FUNC INT DIA_Dyrian_Doch_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Scroll)
	&& (MIS_HelpDyrian != LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Doch_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Doch_15_00"); //He cambiado de idea. Dame el conjuro de dormir.
	AI_Output (self ,other,"DIA_Dyrian_Doch_13_01"); //Bien, si superas la prueba, intercederás para que me pueda quedar en el monasterio.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
};
//*****************************************************************************
//			SC trifft Dyrian, nach Aufnahme und der ist noch im KLoster
//*****************************************************************************
INSTANCE DIA_Dyrian_HelloAgain   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_HelloAgain_Condition()
{
	if  Npc_IsInState (self, ZS_Talk)
	&& (other.guild == GIL_KDF)
	&& (MIS_HelpDyrian == LOG_SUCCESS)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HelloAgain_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_00"); //(Contento) Gracias, ¡me has salvado!
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_01"); //(Con miedo) ¡Oh!, perdóneme, maestro, no tenía intención de molestar.
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_02"); //(Con respeto) Te agradezco que me pueda quedar en el monasterio. De ahora en adelante, mi vida será diferente.
	
	B_GivePlayerXP (XP_Ambient); 	
	AI_StopProcessInfos (self); 
};

//*****************************************************************************
//			Wie gehts? //Info für Magier Success 
//*****************************************************************************
func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output (other,self ,"DIA_Dyrian_HowIsIt_15_00"); //¿Cómo va todo?
};

INSTANCE DIA_Dyrian_HowIsIt   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent   = TRUE;
	description = "¿Qué tal va todo?";
};
FUNC INT DIA_Dyrian_HowIsIt_Condition()
{
	if Npc_KnowsInfo (other,DIA_Dyrian_HelloAgain)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_01"); //Bien, disfruto del trabajo, maestro.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Wie gehts? //Info für alle anderen 
//*****************************************************************************
INSTANCE DIA_Dyrian_other   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent   = TRUE;
	description = "¿Qué tal va todo?";
};
FUNC INT DIA_Dyrian_other_Condition()
{
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_NONE)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_02"); //Agradezco a Innos poder estar en el monasterio.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Dyrian steht in Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_Kneipe   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent   = TRUE;
	description = "¿Qué tal va todo?";
};
FUNC INT DIA_Dyrian_Kneipe_Condition()
{
	if  (MIS_HelpDyrian == LOG_FAILED)
	&&  (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Kneipe_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_15_00"); //¿Cómo va todo?
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_01"); //¿Y tú me lo preguntas? Puse en ti todas mis esperanzas y me has dejado en la estacada.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_02"); //No me queda nada más que el alcohol. ¡Y todo por tu culpa!
	
	Info_ClearChoices (DIA_Dyrian_Kneipe);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Toma, 5 de oro.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Puedo explicarlo todo.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Cuidado con lo que dices.",DIA_Dyrian_Kneipe_ShutUp);
		
};

FUNC VOID DIA_Dyrian_Kneipe_Gold ()
{
	AI_Output	(other,self ,"DIA_Dyrian_Kneipe_Gold_15_00"); //Toma, 5 monedas de oro, para ti.
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_01"); //(Nervioso) ¿5 de oro? ¿Me das 5 de oro a cambio de destruir mi vida?
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_02"); //¡Me quedaré con todo tu oro!
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 0); 
};

FUNC VOID DIA_Dyrian_Kneipe_CanExplain ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_CanExplain_15_00"); //Puedo explicarlo todo.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_01"); //Ahórrate tus excusas baratas.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_02"); //Cada vez que abres la boca, escupes mentiras. Ahora, déjame en paz.
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Dyrian_Kneipe_ShutUp ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_ShutUp_15_00"); //Cuidado con lo que dices.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_01"); //Sí, sigue así, amenázame. No te va a servir de nada.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_02"); //¡Le diré a todo el mundo el bastardo hipócrita que eres! En cuanto acabe esta botella...
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_03"); //¡Ahora, fuera de aquí, me das asco!

	AI_StopProcessInfos (self);
};
//*****************************************************************************
//			Wie gehts? //Info nachher Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_nachher   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent   = TRUE;
	description = "¿Qué pasa?";
};
FUNC INT DIA_Dyrian_nachher_Condition()
{
	if  Npc_KnowsInfo (other,DIA_Dyrian_Kneipe)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_nachher_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_nachher_15_00"); //¿Qué pasa?
	AI_Output (self ,other,"DIA_Dyrian_nachher_13_01"); //¡Ah, déjame en paz! ¡No quiero tener nada que ver contigo!
	AI_StopProcessInfos (self);	
};
 
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dyrian_PICKPOCKET (C_INFO)
{
	npc			= NOV_604_Dyrian;
	nr			= 900;
	condition	= DIA_Dyrian_PICKPOCKET_Condition;
	information	= DIA_Dyrian_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Dyrian_PICKPOCKET_Condition()
{
	C_Beklauen (10, 15);
};
 
FUNC VOID DIA_Dyrian_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_BACK 		,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};
	
func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};


