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
	description = "Przybywam tu z polecenia Mag�w Wody.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Przybywam tu z polecenia Mag�w Wody, aby ci� uwolni�.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//Naprawd�? Niby czemu mia�bym ci wierzy�?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Chcesz si� st�d wydosta�?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Pewnie, �e chc� st�d uciec. Ale...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Przys�a� mnie Vatras. Je�li to ci� nie satysfakcjonuje, to nie b�d� si� narzuca�. Mo�esz tu zosta�, je�li bardzo chcesz.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//Dobrze, wierz� ci.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//Naprawd�? To by�o �atwiejsze, ni� si� spodziewa�em. Dobra, teraz potrzebny nam plan.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Ucieczka to ryzykowna sprawa. William pr�bowa� i teraz w�cha kwiatki od spodu.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Wi�niowie to rolnicy i robotnicy. Ufaj� mi, ale nie zechc� ryzykowa� g�ow�.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Chcesz, �ebym za�atwi� ci u�askawienie od Kruka?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Mam za�atwi� wszystkich bandzior�w, zanim si� w og�le ruszysz?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//Ale to si� nie uda.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Je�li jednak zajmiesz si� stra�nikami, to reszta mo�e wykorzysta� szans�.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Dobrze. Stra�nik�w bior� na siebie. Powiedz innym, �eby si� przygotowali.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Niewolnicy nie b�d� pr�bowa� ucieczki. Musz� znale�� spos�b, �eby bezpiecznie mogli opu�ci� ob�z.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Chcesz, �ebym za�atwi� ci u�askawienie od Kruka?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//To nie by�oby takie z�e.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//Mam za�atwi� wszystkich bandzior�w, zanim si� w og�le ruszysz?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//To by�oby czyste szale�stwo!
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
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Wspaniale. Znam jedn� jaskini� na bagnach, w kt�rej mog� ukry� ludzi, ale co potem?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Id�c z bagien, kierujcie si� na po�udniowy zach�d, a powinni�cie trafi� do obozu, kt�ry Magowie Wody rozbili w ruinach starej �wi�tyni.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Oni poka�� wam drog�.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Wielkie dzi�ki, naprawd�. Jeste�my g��boko wdzi�czni za okazane nam mi�osierdzie i pozostajemy zobowi�zani...
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
	description = "Zaj��em si� stra�nikiem. Mo�ecie ucieka�.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Zaj��em si� stra�nikiem. Mo�ecie ucieka�.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//A co b�dzie, je�li opu�cimy kopalni�? Pozostali stra�nicy zabij� nas w mgnieniu oka!
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
	description = "Chcecie ucieka�?";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//Chcecie ucieka�?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Pewnie. Po prostu czekamy na odpowiedni� chwil�.
};



	
	
