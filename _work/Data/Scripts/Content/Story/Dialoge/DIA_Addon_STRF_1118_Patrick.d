//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_EXIT   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 999;
	condition   = DIA_Addon_Patrick_EXIT_Condition;
	information = DIA_Addon_Patrick_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Hi   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Hi_Condition;
	information = DIA_Addon_Patrick_Hi_Info;
	permanent   = FALSE;
	description = "Vengo de parte de los Magos de Agua.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Me envían los Magos de Agua. He venido a liberaros.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(dudando) ¿En serio? ¿Y por qué debería creerte?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//¿Tú quieres salir de aquí o no?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Pues claro que quiero, pero
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Me envía Vatras. Si eso no te basta, por mí, como si os pudrís todos en este agujero.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(deprisa) Muy bien, te creo.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(desconcertado) ¿En serio? Guau, más rápido de lo que yo pensaba. Vale, necesitamos un plan.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Intentar huir es muy arriesgado. William probó y ya no puede contarlo.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Los prisioneros son aldeanos y trabajadores, confían en mí, pero no se atreverán a planear una huida.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"¿Qué quieres que haga? ¿Que os consiga un perdón de Raven?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"¿Tengo que matar a todos los bandidos para que os pongáis en marcha?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//Pero ese no puede ser el plan.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Ocúpate de que los guardias no nos ataquen y nosotros saldremos de aquí.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Vale, yo me ocuparé de eso. Dile al resto que se preparen.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Los esclavos no se atreverán a escapar. Tengo que encontrar el modo de que se vayan del campamento pacíficamente.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//¿Qué quieres que haga? ¿Que os consiga un perdón de Raven?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(sonriendo) No es mala idea.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//¿Tengo que matar a todos los bandidos para que os pongáis en marcha?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(asustado) ¡Pero eso es de locos!
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};

//---------------------------------------------------------------------
//	ready
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_ready   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_ready_Condition;
	information = DIA_Addon_Patrick_ready_Info;
	permanent   = FALSE;
	description = "Todo arreglado. Vosotros huid.";
};
FUNC INT DIA_Addon_Patrick_ready_Condition()
{	
	if (Ready_Togo == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Patrick_Hi))
	
	|| (Npc_IsDead (PrisonGuard)
	&&  Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Thorus_Answer)) 
	
	|| (Npc_IsDead (Thorus)
	&&  Npc_IsDead (Bloodwyn)
	&&  Npc_IsDead (PrisonGuard))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_ready_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//Todo arreglado. Vosotros huid.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Genial. Conozco una cueva en el pantano donde podemos reunirnos de momento. ¿Pero luego qué?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Sal del pantano en dirección suroeste. Los Magos de Agua se han asentado cerca de las ruinas del antiguo templo.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Os mostrarán el modo de salir del valle.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Gracias, muchísimas gracias. (empezando) Te estamos muy agradecidos
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_05");//No hay de qué.
	
	Sklaven_Flucht = TRUE; 
	B_GivePlayerXP (XP_Addon_Flucht);
	
	AI_StopProcessInfos (self);
	
	//AI_UseMob			(self,"ORE",-1);

	Npc_ExchangeRoutine (self,"FLUCHT");
	
	B_StartOtherRoutine (Telbor, "FLUCHT");
	B_StartOtherRoutine (Tonak, "FLUCHT");
	B_StartOtherRoutine (Pardos,"FLUCHT");
	B_StartOtherRoutine (Monty,"FLUCHT");	
	
	B_StartOtherRoutine (Buddler_1,"WORK");
	B_StartOtherRoutine (Buddler_2,"WORK");
	B_StartOtherRoutine (Buddler_3,"WORK");
	
	B_RemoveNpc (STRF_1128_Addon_Sklave);
	B_RemoveNpc (STRF_1129_Addon_Sklave);
	B_RemoveNpc (STRF_1130_Addon_Sklave);
	
	B_RemoveNpc (STRF_1136_Addon_Sklave);
	B_RemoveNpc (STRF_1137_Addon_Sklave);
	B_RemoveNpc (STRF_1138_Addon_Sklave);
	B_RemoveNpc (STRF_1139_Addon_Sklave);
	B_RemoveNpc (STRF_1140_Addon_Sklave);
	
	
};
//---------------------------------------------------------------------
//	Killer
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Killer   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Killer_Condition;
	information = DIA_Addon_Patrick_Killer_Info;
	permanent   = FALSE;
	description = "Me he ocupado del guardia, ya podéis iros.";
};
FUNC INT DIA_Addon_Patrick_Killer_Condition()
{	
	if Npc_IsDead (PrisonGuard)
	&& (Ready_Togo == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Patrick_Hi))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_Killer_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Me he ocupado del guardia, ya podéis iros.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//¿Y qué pasará cuando salgamos de la mina? Los otros guardias nos aniquilarán. No, es muy arriesgado.
};
//---------------------------------------------------------------------
//	Hoehle
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Hoehle   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Hoehle_Condition;
	information = DIA_Addon_Patrick_Hoehle_Info;
	permanent   = TRUE;
	description = "¿Queréis iros?";
};
FUNC INT DIA_Addon_Patrick_Hoehle_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_BL_HOEHLE_04") <= 1000)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//¿Queréis iros?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Pues claro, sólo que esperamos el momento adecuado.
};



	
	
