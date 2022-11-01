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
	description = "Posílají mę mágové vody. Mám tę osvobodit.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Posílají mę mágové vody. Mám vás osvobodit.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(opatrnę) Vážnę? A proč bych ti męl vęâit?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Chcete se odsud dostat, nebo ne?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Samozâejmę že jo, ale...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Posílá mę Vatras, a to by ti męlo stačit. Jinak si tu klidnę můžete všichni shnít v týhle díâe, mnę je to fuk.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(rychle) No dobâe, vęâím ti.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(zmatenę) Vážnę? Wow, to šlo rychleji, než jsem si myslel. Prima, tak teë ještę potâebujeme plán.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Pokus o útęk je hodnę riskantní. William to zkusil a koupil to.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Zdejší vęzni jsou vesmęs samí rolníci a dęlníci – vęâí mi, ale sami se utéct neodváží.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"A co mám podle tebe dęlat? Vyprosit ti u Havrana propuštęní?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"To mám vymlátit všecky bandity, aby ses vůbec pohnul?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//To ale není žádný plán.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Postarej se, aby nás nenapadly stráže, a pak odsud zmizíme.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Dobâe, zaâídím to. Vyâië ostatním, aă se pâipraví.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Otroci se neodváží uniknout. Musím najít nęjaký způsob, jak je nepozorovanę dostat z tábora.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Co mám udęlat – vyprosit ti u Havrana milost?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(šklebí se) To není špatnej nápad.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//To se odsud nehnete, dokud nepobiju všecky bandity?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(vydęšenę) To by bylo šílenství!
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
	description = "Všecko je v pohodę, už se můžete vypaâit.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//Všecko je v pohodę, můžete se vypaâit.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Výbornę. Znám v bažinę jednu jeskyni, kde se zatím můžem ukrýt. Jenže co dál?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Bęžte z bažiny smęrem k jihozápadu. Vodní mágové si zâídili tábor kousek od rozvalin starého chrámu.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Ukážou vám cestu z tohohle údolí.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Díky, moc ti dękuju. (začíná âečnit) Jsme ti všichni hluboce zavázáni...
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_05");//To nic.
	
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
	description = "Stráž už to má za sebou, můžeš jít.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Stráže jsou mrtvé, už můžete jít.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//A co se stane, až opustíme důl? Ostatní stráže nás rozsekají! Ne, je to moc riskantní.
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
	description = "Vy nechcete odejít?";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//To se odsud nechcete dostat?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Samozâejmę že jo, jen čekáme na správnou pâíležitost.
};



	
	
