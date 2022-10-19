// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Lutero_EXIT(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 999;
	condition	= DIA_Lutero_EXIT_Condition;
	information	= DIA_Lutero_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Lutero_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_Lutero_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
	
	if (Lutero_Krallen == LOG_RUNNING)
	&& (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE)
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
	
};
//************************************************************
//	Hallo
//************************************************************
INSTANCE DIA_Lutero_Hallo(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Hallo_Condition;
	information	= DIA_Lutero_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lutero_Hallo_Condition()
{	
	if ((other.guild != GIL_NONE)
	|| (other.guild != GIL_NOV)) 	
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Hallo_Info()
{	
	AI_Output (self ,other,"DIA_Lutero_Hallo_13_00"); //Mi nombre es Lutero. Compro y vendo todo tipo de cosas.
	AI_Output (other ,self,"DIA_Lutero_Hallo_15_01"); //¿Qué mercancía puedes ofrecerme?
	AI_Output (self ,other,"DIA_Lutero_Hallo_13_02"); //Bueno, sobre todo, cosas raras e inusuales. Por el momento, siempre he conseguido cumplir los deseos de mis clientes.
	
	Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, "Lutero trata con objetos raros e inusuales, en el barrio alto."); 
};
//************************************************************
//	GetLost
//************************************************************
INSTANCE DIA_Lutero_GetLost(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_GetLost_Condition;
	information	= DIA_Lutero_GetLost_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lutero_GetLost_Condition()
{	
	if ((other.guild == GIL_NONE)
	|| (other.guild == GIL_NOV)) 	
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_GetLost_Info()
{	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Lutero_GetLost_13_00"); //¡Lárgate, inútil! ¿No tienes nada que hacer? Vete a buscar trabajo, ¡pero a otra parte!
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_GetLost_13_01"); //¿Qué deseas, novicio? ¿No deberías estar en el monasterio?
	};
	AI_StopProcessInfos (self);
};
//************************************************************
//	Snapper
//************************************************************
INSTANCE DIA_Lutero_Snapper(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Snapper_Condition;
	information	= DIA_Lutero_Snapper_Info;
	permanent	= FALSE;
	description = "¿Buscas algo en particular?";
};                       

FUNC INT DIA_Lutero_Snapper_Condition()
{	
	if (other.guild != GIL_NONE)
	&& (other.guild != GIL_NOV) 	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Snapper_Info()
{	
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_00"); //¿Buscas algo en particular?
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_01"); //Sí, para mi tarea actual necesito las garras de un chasqueador.
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_02"); //Pero no una garra cualquiera. Tendría que ser algo especial. Las garras de una bestia poderosa que haya matado a muchos hombres, o algo así.
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_03"); //¿Dónde puedo encontrar chasqueadores?
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_04"); //Hay unos pocos en esta isla, pero la mayoría viven en el Valle de las Minas.
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_05"); //¿Y qué obtengo yo a cambio?
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_06"); //Podría conseguirte una piedra rúnica.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_07"); //Podría conseguirte un anillo de invencibilidad.
	};
	AI_Output (other ,self,"DIA_Lutero_Hello_15_08"); //Veré qué puedo hacer.
	
	Log_CreateTopic (Topic_Lutero,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lutero,LOG_RUNNING);
	B_LogEntry (Topic_Lutero,"El mercader, Lutero, busca las garras de un chasqueador especialmente fuerte.");
	
	Lutero_Krallen = LOG_RUNNING;
};
//************************************************************
//	Kralle abliefern
//************************************************************
INSTANCE DIA_Lutero_Kralle(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Kralle_Condition;
	information	= DIA_Lutero_Kralle_Info;
	permanent	= FALSE;
	description = "Tengo unas garras especiales de chasqueador para ti.";
};                       

FUNC INT DIA_Lutero_Kralle_Condition()
{	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	&& (Npc_KnowsInfo (other, DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Kralle_Info()
{	
	AI_Output (other ,self,"DIA_Lutero_Kralle_15_00"); //Tengo unas garras especiales de chasqueador para ti.
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	AI_Output (self ,other,"DIA_Lutero_Kralle_13_01"); //Mi cliente se alegrará de saberlo.
	B_GiveInvItems (other, self, ItAt_ClawLeader,1);
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_02"); //No tengo la piedra rúnica aquí. Pero sé dónde encontrarla.
		AI_Output (self ,other,"DIA_Lutero_Hello_13_03"); //En el camino desde la ciudad hasta la posada, pasarás por debajo de un puente.
		AI_Output (self ,other,"DIA_Lutero_Hello_13_04"); //Allí, en una cueva, un amigo mío ha dejado la piedra rúnica en un cofre. Aquí tienes la llave.
		B_GiveInvItems (self, other, ITKE_RUNE_MIS,1); 
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_05"); //Aquí tienes el anillo que te prometí.
		B_GiveInvItems (self, other, ItRi_Prot_Total_01,1);
	};
};
//************************************************************
//	Trade
//************************************************************
INSTANCE DIA_Lutero_Trade(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Trade_Condition;
	information	= DIA_Lutero_Trade_Info;
	permanent	= TRUE;
	description = "Enséñame tu mercancía.";
	trade		= TRUE;
};                       
FUNC INT DIA_Lutero_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Lutero_Hallo)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Trade_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Lutero_Trade_15_00"); //Enséñame tu mercancía.
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lutero_PICKPOCKET (C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 900;
	condition	= DIA_Lutero_PICKPOCKET_Condition;
	information	= DIA_Lutero_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lutero_PICKPOCKET_Condition()
{
	C_Beklauen (58, 65);
};
 
FUNC VOID DIA_Lutero_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lutero_PICKPOCKET);
	Info_AddChoice		(DIA_Lutero_PICKPOCKET, DIALOG_BACK 		,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lutero_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lutero_PICKPOCKET);
};
	
func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lutero_PICKPOCKET);
};


