//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Un segundo.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//¿Algún problema?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Reptadores de las minas. A montones. Hemos entrado en un nido.
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "¿Por qué no atacamos a los reptadores?";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//¿Por qué no atacamos a los reptadores?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//Yo también lo he preguntado, pero los guardias tenemos cosas mejores que hacer.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//Bloodwyn me ha encargado solucionar el problema.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Supongo que no querrás luchar contra esos reptadores.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//¿Para qué? ¿Para quedarnos con todo el oro de la cueva?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//De todos modos, Bloodwyn se quedará la mayor parte. Y yo no pienso jugarme el cuello por la miseria que me toque.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//Si TÚ quieres enfrentarte a los reptadores, haz lo que debas. Sólo una cosa: no les atraigas al exterior, ¿vale?
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "¿Puedes hablarme más sobre Bloodwyn?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//¿Puedes hablarme más sobre Bloodwyn?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Sí. Es un bastardo sediento de oro. Inspecciona cada veta nueva y cada pepita.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//Por el oro, va a donde haga falta, pero nuestra vida no le importa una mierda.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//¿Y entonces?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Cree que es el mejor y no puede soportar la idea de que alguien le supere. Pero en fin, yo no me metería con él, aún así.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//No te interpongas en su camino y no lo provoques, a menos que quieras hacerlo enfurecer y perder el control.
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn se irá definitivamente del templo cuando se entere de que ha aparecido una veta de oro nueva en la mina.");
	B_LogEntry (Topic_Addon_Tempel,"Cuando Bloodwyn se enfada, pierde el control. Eso me sería de gran utilidad."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "Los reptadores son historia.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//Creo que ya está. Ya no quedan reptadores.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn ya está de camino. Eso es lo que querías, ¿no?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//Vamos, que mataste a los reptadores para que Bloodwyn viniera. Así que sea cual sea tu plan, hazlo AHORA.
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//Le has dado su merecido a ese imbécil. Buen trabajo.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//Echaré un vistazo por la cueva.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//Guau, seguro que aquí hay un montón de oro.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//Para llegar a los trozos de allí arriba necesitamos una escalera.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Pero desde que cayó la Barrera, ya nadie utiliza escaleras… Una auténtica pena
};




