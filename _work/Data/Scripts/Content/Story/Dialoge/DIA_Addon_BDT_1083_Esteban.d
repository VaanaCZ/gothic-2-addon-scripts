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
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Tak ty seš ten chlap, co se probojoval až do tábora.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//To se to teda rychle rozneslo.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franco byl tvrdej oříšek, nikdo si s ním radši nic nezačínal. Nikdo kromě tebe.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Abych to ujasnil, jestli ňákou takovou sviňárnu zkusíš na mě, zabiju tě.
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
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(s úšklebkem) To je jasný. Pak jsi přišel na to správný místo.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Protože každej, kdo kutá v dole, dostává pěknou hromadu zlata.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//A taky potřebuješ červený kameny, aby tě Thorus pustil dovnitř.
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
	description = "Dej mi jeden z těch červených kamenů.";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Dej mi jeden z těch červených kamenů.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//Klidně, ale nebude to zadarmo.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Obvykle za ně chci podíl ze zlata, který chlapi dostanou za kopání.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//(odhadně) Co vlastně víš o dolování zlata?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//Už ses nejspíš pár triků naučil, co?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Nezdá se mi, že bys byl zrovna kopáčskej lumen.
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(jízlivě) Jestli ti dám červenej kámen, nebude to proto, že seš tak dobrej kopáč.
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
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Jeden bandita se mě snažil oddělat. Ale místo toho moje stráže zabily JEHO.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Zachtělo se mu tvýho místa, co?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//Byl to debil! Bandita bez mozku. Snažit se mě zabít na vlastní pěst, to je přeci úplná pitomost!
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//Ne, jenom plnil ňákou dohodu – určitě ho poslal někdo jinej.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//Takže já mám zjistit, kdo za tím opravdu vězí.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Ať už na mě toho vraha poslal kdokoliv, pořádně si to odskáče. Najdi ho – a já tě pustím do dolu.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Zrovna v týhle věci mě za tebou poslal Senyan..
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? Ten pro mě taky pracuje. Říkal jsem mu, ať má oči otevřený.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Někdo Estebanovi usiloval o život. Mám zjistit, kdo to byl.");

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
	description = "A proč bych to měl dělat?";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//Co bych v tom měl dělat?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//V tomhle táboře o tom ví každej, takže musíš hrát otevřeně.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Snaž se zjistit, kdo stojí na mý straně a kdo ne. A nenech se oblafnout.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Promluv si se Snafem. Ten tlustej kuchař toho pochytí spoustu.
	
	B_LogEntry (Topic_Addon_Esteban, "Viníka najdu tak, že si promluvím se všemi v táboře a získám přehled, kdo na čí straně stojí. Nejlepší bude začít s vyptáváním u Snafa, protože ten slyší spoustu věcí.");
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
	description = "Potřebuju lepší zbroj.";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Potřebuju lepší brnění.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Na co? Dyk už jedno máš. Zatím ti musí stačit.
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Když ale splníš, co ti zadám, můžem si o tom ještě promluvit.
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
	description = "Co se týče toho úkolu...";
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
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Hele, já se musím starat i o jiný věci.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//Já myslel, že by ses rád dozvěděl, kdo stojí za tím útokem.
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//A kdo? Vyklop jeho jméno, ať mu mý stráže můžou zakroutit krkem!
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//Spískal to obchodník Fisk. A zrovna si klidně sedí za barem, popíjí a nic netuší.
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA! Výborně, chlapče. Mý stráže už s ním zametou.
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Slyšeli jste ho, chlapi. Běžte na Fiska.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Vrať se, až zjistíš, kdo je to.
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
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fiska čeká pěkně bolestivá smrt. A každej v táboře se o tom dozví.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//Bude to pro ně varování.
	
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
	description = "Dostanu teď ten červený kámen?";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//A dostanu teď ten červený kámen?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Vedl sis dobře. Takový lidi se nemaj co plahočit v dole.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Tady pro tebe najdu mnohem lepší využití. Zůstaneš v táboře a budeš pro mě dělat dál.
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
	description = "Budu o tom přemýšlet.";
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
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Popřemýšlím o tom.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Zapomínáš, s kým mluvíš. Já to tady vedu a ty budeš dělat, co řeknu.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//A já říkám, že budeš dělat pro mě a pro nikoho jinýho. Je to jasný?
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
	description = "Snažíš se mě tahat za nos?";
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
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Nedělej ze mě vola. O tom, že bych pro tebe pracoval, nikdy nebyla řeč.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//Takovouhle nabídku hned tak někdo nedostane. Ale jestli chceš, tak klidně můžeš odejít z tábora.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//A co kdybys dodržel slovo a dal mi ten červený kámen?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hele, ještě slovo a mý stráže ti daj taky pěknou nakládačku.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(úšklebek) Jaké stráže?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Cože...? Á, už to chápu, chceš mě dostat. Jen počkej...
	
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
	description = "OKAMŽITĚ mi dej ten kámen, nebo si ho vezmu sám!";
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
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //OKAMŽITĚ mi dej ten šutr, nebo si ho vezmu sám!
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Tak ty chceš chcípnout? No dobře, udělám ti laskavost a zbavím tě tvý blbosti.
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




