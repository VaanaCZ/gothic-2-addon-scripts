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
	description = "Posílají mì mágové vody. Mám tì osvobodit.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Posílají mì mágové vody. Mám vás osvobodit.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(opatrnì) Vánì? A proè bych ti mìl vìøit?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Chcete se odsud dostat, nebo ne?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Samozøejmì e jo, ale...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Posílá mì Vatras, a to by ti mìlo staèit. Jinak si tu klidnì mùete všichni shnít v tıhle díøe, mnì je to fuk.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(rychle) No dobøe, vìøím ti.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(zmatenì) Vánì? Wow, to šlo rychleji, ne jsem si myslel. Prima, tak teï ještì potøebujeme plán.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Pokus o útìk je hodnì riskantní. William to zkusil a koupil to.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Zdejší vìzni jsou vesmìs samí rolníci a dìlníci – vìøí mi, ale sami se utéct neodváí.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"A co mám podle tebe dìlat? Vyprosit ti u Havrana propuštìní?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"To mám vymlátit všecky bandity, aby ses vùbec pohnul?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//To ale není ádnı plán.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Postarej se, aby nás nenapadly stráe, a pak odsud zmizíme.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Dobøe, zaøídím to. Vyøiï ostatním, a se pøipraví.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Otroci se neodváí uniknout. Musím najít nìjakı zpùsob, jak je nepozorovanì dostat z tábora.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Co mám udìlat – vyprosit ti u Havrana milost?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(šklebí se) To není špatnej nápad.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//To se odsud nehnete, dokud nepobiju všecky bandity?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(vydìšenì) To by bylo šílenství!
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
	description = "Všecko je v pohodì, u se mùete vypaøit.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//Všecko je v pohodì, mùete se vypaøit.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Vıbornì. Znám v bainì jednu jeskyni, kde se zatím mùem ukrıt. Jene co dál?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Bìte z bainy smìrem k jihozápadu. Vodní mágové si zøídili tábor kousek od rozvalin starého chrámu.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Ukáou vám cestu z tohohle údolí.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Díky, moc ti dìkuju. (zaèíná øeènit) Jsme ti všichni hluboce zavázáni...
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
	description = "Strá u to má za sebou, mùeš jít.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Stráe jsou mrtvé, u mùete jít.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//A co se stane, a opustíme dùl? Ostatní stráe nás rozsekají! Ne, je to moc riskantní.
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
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Samozøejmì e jo, jen èekáme na správnou pøíleitost.
};



	
	
