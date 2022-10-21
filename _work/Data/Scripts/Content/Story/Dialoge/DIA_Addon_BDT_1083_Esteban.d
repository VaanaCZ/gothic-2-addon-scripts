//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Tak ty seš ten chlap, co se probojoval a do tábora.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//To se to teda rychle rozneslo.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franco byl tvrdej oøíšek, nikdo si s ním radši nic nezaèínal. Nikdo kromì tebe.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Abych to ujasnil, jestli òákou takovou sviòárnu zkusíš na mì, zabiju tì.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "Chci do dolu!";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//Chci se dostat do dolu!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(s úšklebkem) To je jasnı. Pak jsi pøišel na to správnı místo.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Protoe kadej, kdo kutá v dole, dostává pìknou hromadu zlata.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//A taky potøebuješ èervenı kameny, aby tì Thorus pustil dovnitø.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "Dej mi jeden z tìch èervenıch kamenù.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Dej mi jeden z tìch èervenıch kamenù.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//Klidnì, ale nebude to zadarmo.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Obvykle za nì chci podíl ze zlata, kterı chlapi dostanou za kopání.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//(odhadnì) Co vlastnì víš o dolování zlata?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//U ses nejspíš pár trikù nauèil, co?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Nezdá se mi, e bys byl zrovna kopáèskej lumen.
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(jízlivì) Jestli ti dám èervenej kámen, nebude to proto, e seš tak dobrej kopáè.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//Kdepak, mám pro tebe jinou práci.
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "Jakou práci?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//Jakou práci?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Jeden bandita se mì snail oddìlat. Ale místo toho moje stráe zabily JEHO.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Zachtìlo se mu tvıho místa, co?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//Byl to debil! Bandita bez mozku. Snait se mì zabít na vlastní pìst, to je pøeci úplná pitomost!
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//Ne, jenom plnil òákou dohodu – urèitì ho poslal nìkdo jinej.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//Take já mám zjistit, kdo za tím opravdu vìzí.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//A u na mì toho vraha poslal kdokoliv, poøádnì si to odskáèe. Najdi ho – a já tì pustím do dolu.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Zrovna v tıhle vìci mì za tebou poslal Senyan..
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? Ten pro mì taky pracuje. Øíkal jsem mu, a má oèi otevøenı.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Nìkdo Estebanovi usiloval o ivot. Mám zjistit, kdo to byl.");

};
//--------------------------------------------------------------------
//	Info Attentäter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "A proè bych to mìl dìlat?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//Co bych v tom mìl dìlat?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//V tomhle táboøe o tom ví kadej, take musíš hrát otevøenì.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Sna se zjistit, kdo stojí na mı stranì a kdo ne. A nenech se oblafnout.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Promluv si se Snafem. Ten tlustej kuchaø toho pochytí spoustu.
	
	B_LogEntry (Topic_Addon_Esteban, "Viníka najdu tak, e si promluvím se všemi v táboøe a získám pøehled, kdo na èí stranì stojí. Nejlepší bude zaèít s vyptáváním u Snafa, protoe ten slyší spoustu vìcí.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "Potøebuju lepší zbroj.";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Potøebuju lepší brnìní.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Na co? Dyk u jedno máš. Zatím ti musí staèit.
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Kdy ale splníš, co ti zadám, mùem si o tom ještì promluvit.
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "Co se tıèe toho úkolu...";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//K tomu úkolu...
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Hele, já se musím starat i o jinı vìci.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//Já myslel, e by ses rád dozvìdìl, kdo stojí za tím útokem.
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//A kdo? Vyklop jeho jméno, a mu mı stráe mùou zakroutit krkem!
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//Spískal to obchodník Fisk. A zrovna si klidnì sedí za barem, popíjí a nic netuší.
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA! Vıbornì, chlapèe. Mı stráe u s ním zametou.
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Slyšeli jste ho, chlapi. Bìte na Fiska.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Vra se, a zjistíš, kdo je to.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "A co bude dál?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//A co bude dál?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//Co bude dál? Povím ti, co bude dál.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fiska èeká pìknì bolestivá smrt. A kadej v táboøe se o tom dozví.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//Bude to pro nì varování.
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "Dostanu teï ten èervenı kámen?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//A dostanu teï ten èervenı kámen?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Vedl sis dobøe. Takovı lidi se nemaj co plahoèit v dole.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Tady pro tebe najdu mnohem lepší vyuití. Zùstaneš v táboøe a budeš pro mì dìlat dál.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "Budu o tom pøemıšlet.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Popøemıšlím o tom.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Zapomínáš, s kım mluvíš. Já to tady vedu a ty budeš dìlat, co øeknu.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//A já øíkám, e budeš dìlat pro mì a pro nikoho jinıho. Je to jasnı?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "Snaíš se mì tahat za nos?";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Nedìlej ze mì vola. O tom, e bych pro tebe pracoval, nikdy nebyla øeè.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//Takovouhle nabídku hned tak nìkdo nedostane. Ale jestli chceš, tak klidnì mùeš odejít z tábora.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//A co kdybys dodrel slovo a dal mi ten èervenı kámen?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hele, ještì slovo a mı stráe ti daj taky pìknou nakládaèku.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(úšklebek) Jaké stráe?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Coe...? Á, u to chápu, chceš mì dostat. Jen poèkej...
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "OKAMITÌ mi dej ten kámen, nebo si ho vezmu sám!";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //OKAMITÌ mi dej ten šutr, nebo si ho vezmu sám!
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Tak ty chceš chcípnout? No dobøe, udìlám ti laskavost a zbavím tì tvı blbosti.
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




