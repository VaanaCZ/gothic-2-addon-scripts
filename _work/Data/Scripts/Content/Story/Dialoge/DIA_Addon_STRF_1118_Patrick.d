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
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Przybywam tu z polecenia Magów Wody, aby ciê uwolniæ.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//Naprawdê? Niby czemu mia³bym ci wierzyæ?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Chcesz siê st¹d wydostaæ?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Pewnie, ¿e chcê st¹d uciec. Ale...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Przys³a³ mnie Vatras. Jeœli to ciê nie satysfakcjonuje, to nie bêdê siê narzuca³. Mo¿esz tu zostaæ, jeœli bardzo chcesz.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//Dobrze, wierzê ci.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//Naprawdê? To by³o ³atwiejsze, ni¿ siê spodziewa³em. Dobra, teraz potrzebny nam plan.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Ucieczka to ryzykowna sprawa. William próbowa³ i teraz w¹cha kwiatki od spodu.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//WiêŸniowie to rolnicy i robotnicy. Ufaj¹ mi, ale nie zechc¹ ryzykowaæ g³ow¹.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Chcesz, ¿ebym za³atwi³ ci u³askawienie od Kruka?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Mam za³atwiæ wszystkich bandziorów, zanim siê w ogóle ruszysz?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//Ale to siê nie uda.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Jeœli jednak zajmiesz siê stra¿nikami, to reszta mo¿e wykorzystaæ szansê.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Dobrze. Stra¿ników biorê na siebie. Powiedz innym, ¿eby siê przygotowali.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Niewolnicy nie bêd¹ próbowaæ ucieczki. Muszê znaleŸæ sposób, ¿eby bezpiecznie mogli opuœciæ obóz.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Chcesz, ¿ebym za³atwi³ ci u³askawienie od Kruka?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//To nie by³oby takie z³e.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//Mam za³atwiæ wszystkich bandziorów, zanim siê w ogóle ruszysz?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//To by³oby czyste szaleñstwo!
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
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Wspaniale. Znam jedn¹ jaskiniê na bagnach, w której mogê ukryæ ludzi, ale co potem?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Id¹c z bagien, kierujcie siê na po³udniowy zachód, a powinniœcie trafiæ do obozu, który Magowie Wody rozbili w ruinach starej œwi¹tyni.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Oni poka¿¹ wam drogê.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Wielkie dziêki, naprawdê. Jesteœmy g³êboko wdziêczni za okazane nam mi³osierdzie i pozostajemy zobowi¹zani...
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
	description = "Zaj¹³em siê stra¿nikiem. Mo¿ecie uciekaæ.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Zaj¹³em siê stra¿nikiem. Mo¿ecie uciekaæ.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//A co bêdzie, jeœli opuœcimy kopalniê? Pozostali stra¿nicy zabij¹ nas w mgnieniu oka!
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
	description = "Chcecie uciekaæ?";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//Chcecie uciekaæ?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Pewnie. Po prostu czekamy na odpowiedni¹ chwilê.
};



	
	
