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
	description = "Posílají mê mágové vody. Mám tê osvobodit.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Posílají mê mágové vody. Mám vás osvobodit.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(opatrnê) Vážnê? A proè bych ti mêl vêâit?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Chcete se odsud dostat, nebo ne?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Samozâejmê že jo, ale...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Posílá mê Vatras, a to by ti mêlo staèit. Jinak si tu klidnê mùžete všichni shnít v týhle díâe, mnê je to fuk.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(rychle) No dobâe, vêâím ti.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(zmatenê) Vážnê? Wow, to šlo rychleji, než jsem si myslel. Prima, tak teë ještê potâebujeme plán.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Pokus o útêk je hodnê riskantní. William to zkusil a koupil to.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Zdejší vêzni jsou vesmês samí rolníci a dêlníci – vêâí mi, ale sami se utéct neodváží.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"A co mám podle tebe dêlat? Vyprosit ti u Havrana propuštêní?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"To mám vymlátit všecky bandity, aby ses vùbec pohnul?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//To ale není žádný plán.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Postarej se, aby nás nenapadly stráže, a pak odsud zmizíme.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Dobâe, zaâídím to. Vyâië ostatním, aã se pâipraví.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Otroci se neodváží uniknout. Musím najít nêjaký zpùsob, jak je nepozorovanê dostat z tábora.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Co mám udêlat – vyprosit ti u Havrana milost?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(šklebí se) To není špatnej nápad.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//To se odsud nehnete, dokud nepobiju všecky bandity?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(vydêšenê) To by bylo šílenství!
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
	description = "Všecko je v pohodê, už se mùžete vypaâit.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//Všecko je v pohodê, mùžete se vypaâit.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Výbornê. Znám v bažinê jednu jeskyni, kde se zatím mùžem ukrýt. Jenže co dál?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Bêžte z bažiny smêrem k jihozápadu. Vodní mágové si zâídili tábor kousek od rozvalin starého chrámu.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Ukážou vám cestu z tohohle údolí.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Díky, moc ti dêkuju. (zaèíná âeènit) Jsme ti všichni hluboce zavázáni...
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
	description = "Stráž už to má za sebou, mùžeš jít.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Stráže jsou mrtvé, už mùžete jít.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//A co se stane, až opustíme dùl? Ostatní stráže nás rozsekají! Ne, je to moc riskantní.
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
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Samozâejmê že jo, jen èekáme na správnou pâíležitost.
};



	
	
