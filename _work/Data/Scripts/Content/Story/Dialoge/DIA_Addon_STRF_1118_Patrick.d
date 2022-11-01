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
	description = "Sono qui per conto dei Maghi dell'Acqua.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Mi hanno mandato i Maghi dell'Acqua. Sono qui per liberarvi.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(cauto) Davvero? E perché dovrei crederti?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Vuoi uscire di qui o no?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Certo che voglio uscire, ma...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Mi ha mandato Vatras. Se non vi basta, per me potete anche restarvene qui a marcire.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(in fretta) D'accordo, ti credo.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(perplesso) Davvero? Wow, ci è voluto meno di quanto pensassi. Ora ci serve solo un piano.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Tentare la fuga è molto rischioso. William ci ha provato, ed è morto.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//I prigionieri sono tutti contadini e operai. Si fidano di me, ma non oserebbero tentare la fuga.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Cosa vuoi che faccia? Devo chiedere a Raven di perdonarti?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Devo uccidere tutti i briganti prima che vi decidiate a muovervi?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//Ma non può funzionare.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Fa' in modo che le guardie non ci attacchino e noi usciremo di qui.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Okay, me ne occupo io. Di' agli altri di tenersi pronti.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Gli schiavi non oseranno tentare di scappare. Devo trovare un modo per permettere loro di uscire dal campo senza essere infastiditi.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Cosa vuoi che faccia? Devo chiedere a Raven di perdonarti?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(sorride) Non è una cattiva idea.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//Devo uccidere tutti i briganti prima che vi decidiate a muovervi?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(spaventato) Ma sarebbe una follia!
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
	description = "A posto. Ora potete scappare.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//A posto. Ora potete scappare.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Eccellente. Conosco una caverna nella palude dove potremo nasconderci, ma poi?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Uscite dalla palude verso sud-ovest. I Maghi dell'Acqua si sono accampati vicino alle rovine del vecchio tempio.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Vi mostreranno la strada per uscire dalla valle.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Grazie mille. (iniziando) Siamo tutti profondamente...
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_05");//Non importa.
	
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
	description = "La guardia è morta. Ora potete andare.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//La guardia è morta. Ora potete andare.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//E cosa accadrà quando avremo lasciato la miniera? Le altre guardie ci massacreranno. No, è troppo rischioso.
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
	description = "Non volete andarvene?";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//Non volete andarvene?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Certo che sì. Stiamo solo aspettando il momento giusto.
};



	
	
