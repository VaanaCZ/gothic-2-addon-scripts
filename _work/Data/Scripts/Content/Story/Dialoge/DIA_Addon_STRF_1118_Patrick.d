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
	description = "Przybywam tu z polecenia Magów Wody.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Przybywam tu z polecenia Magów Wody, aby cię uwolnić.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//Naprawdę? Niby czemu miałbym ci wierzyć?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Chcesz się stąd wydostać?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Pewnie, że chcę stąd uciec. Ale...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Przysłał mnie Vatras. Jeśli to cię nie satysfakcjonuje, to nie będę się narzucał. Możesz tu zostać, jeśli bardzo chcesz.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//Dobrze, wierzę ci.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//Naprawdę? To było łatwiejsze, niż się spodziewałem. Dobra, teraz potrzebny nam plan.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Ucieczka to ryzykowna sprawa. William próbował i teraz wącha kwiatki od spodu.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Więźniowie to rolnicy i robotnicy. Ufają mi, ale nie zechcą ryzykować głową.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Chcesz, żebym załatwił ci ułaskawienie od Kruka?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Mam załatwić wszystkich bandziorów, zanim się w ogóle ruszysz?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//Ale to się nie uda.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Jeśli jednak zajmiesz się strażnikami, to reszta może wykorzystać szansę.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Dobrze. Strażników biorę na siebie. Powiedz innym, żeby się przygotowali.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Niewolnicy nie będą próbować ucieczki. Muszę znaleźć sposób, żeby bezpiecznie mogli opuścić obóz.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Chcesz, żebym załatwił ci ułaskawienie od Kruka?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//To nie byłoby takie złe.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//Mam załatwić wszystkich bandziorów, zanim się w ogóle ruszysz?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//To byłoby czyste szaleństwo!
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
	description = "Droga wolna. Uciekajcie!";
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
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//Droga wolna. Uciekajcie!
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Wspaniale. Znam jedną jaskinię na bagnach, w której mogę ukryć ludzi, ale co potem?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Idąc z bagien, kierujcie się na południowy zachód, a powinniście trafić do obozu, który Magowie Wody rozbili w ruinach starej świątyni.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Oni pokażą wam drogę.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Wielkie dzięki, naprawdę. Jesteśmy głęboko wdzięczni za okazane nam miłosierdzie i pozostajemy zobowiązani...
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_05");//Spokojnie, po co ta ceremonia...
	
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
	description = "Zająłem się strażnikiem. Możecie uciekać.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Zająłem się strażnikiem. Możecie uciekać.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//A co będzie, jeśli opuścimy kopalnię? Pozostali strażnicy zabiją nas w mgnieniu oka!
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
	description = "Chcecie uciekać?";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//Chcecie uciekać?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Pewnie. Po prostu czekamy na odpowiednią chwilę.
};



	
	
