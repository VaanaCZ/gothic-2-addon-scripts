//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_EXIT   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 999;
	condition   = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fisk_PICKPOCKET (C_INFO)
{
	npc			= BDT_1097_Addon_Fisk;
	nr			= 900;
	condition	= DIA_Addon_Fisk_PICKPOCKET_Condition;
	information	= DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       
FUNC INT DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	C_Beklauen (118, 300);
};
 
FUNC VOID DIA_Addon_Fisk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
	
func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Hi   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 1;
	condition   = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fisk_Hi_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Hej, jestli tady v táboøe hledáš òákıho slušnıho obchodníka, tak jsi ho právì našel.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//Mám chatrè pøímo za Estebanem, take kdybys nìco potøeboval, zastav se.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk prodává všechno moné.");
	
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine  (self,"START");
};
//--------------------------------------------------------------------
//	Info Trade
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Trade   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 888;
	condition   = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;

};
FUNC INT DIA_Addon_Fisk_Trade_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Trade_Info()
{
	B_Say (other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	
	//Bolzen nachfüllen
	if (Npc_HasItems (self, ItRw_Bolt) < 50)
	{
		CreateInvItems (self,ItRw_Bolt, (50 - Npc_HasItems (self, ItRw_Bolt))); 
	};
	//Pfeile nachfüllen
	if (Npc_HasItems (self, ItRw_Arrow) < 50)
	{
		CreateInvItems (self,ItRw_Arrow, (50 - Npc_HasItems (self, ItRw_Arrow))); 
	};
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Attentat   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fisk_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //Hele, já s tím nechci mít nic spoleènıho, kapišto?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //(nevinnì) Mám jinı starosti, já sám jsem obì.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //Jak to?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //Za poslední dodávku jsem vysolil pìknou hromadu zlata.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Ale nikdy jsem za ni nic nedostal! Òákej hajzl to prostì stopil!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //(rozzuøenì) Okradli mì, a nejspíš nìkdo z našich vlastních lidí!
};

//---------------------------------------------------------------------
//	Lieferung
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Lieferung   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 3;
	condition   = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent   = FALSE;
	description	= "Co to bylo za dodávku?";
};
FUNC INT DIA_Addon_Fisk_Lieferung_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //Co to bylo za dodávku?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Balík paklíèù. Nìkdo mi je mìl vyzvednout u pirátù.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Ale jistej Juan mi je èmajznul. (vztekle) Vèetnì zlata, kterı jsem za nì zaplatil!
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Ten šmejd se teï ukrejvá nìkde v bainì.
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Jistı Juan obchodoval s bandity. Prı se ukrıvají kdesi v bainách.");
	B_LogEntry (Topic_Addon_Fisk,"Jistı Juan ukradl Fiskovi zásilku zboí (balík paklíèù). Teï se skrıvá kdesi v bainách.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Je mrtvı.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Dobøe, aspoò u od nìj bude pokoj.
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //Je stále naivu.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Tys tu svini nechal ít?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Nebyl sám.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Nevadí – já se s tìma hajzlama vypoøádám pozdìjc.
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //A co se tıèe tebe...
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Mám fakt dobrı vztahy s Hunem.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Dohlídnu, aby ti odteïka prodával brnìní fakt levnì.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //A vem si tohle – tenhle šutr jsem jednou dostal od Corrista.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //Je to jediná vìc, co pøeila mùj útìk z bariéry. Myslím, e ho vyuiješ víc jak já.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //A taky ti dám jednu ze svejch zbraní.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h größer oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //(uliènicky) Ruka ruku myje – to se nikdy nezmìní.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "Mám ten tvùj balík.";
};
FUNC INT DIA_Addon_Fisk_GivePaket_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Lennar_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //Mám ten tvùj balík.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //(potìšenì) Vánì! (pøekvapenì) A co Juan?
	
	B_Addon_Fisk_AboutJuan();
	
	B_Addon_Fisk_Belohnung();
};

//---------------------------------------------------------------------
//	Paket OPEN - 
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_PaketOpen (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 5;
	condition   = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent   = FALSE;
	description = "Otevøel jsem tvùj balík!";
};
FUNC INT DIA_Addon_Fisk_PaketOpen_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (LennarPaket_Open == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //Otevøel jsem ten tvùj balík!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //(smìje se) Samozøejmì! Ses prostì nemoh doèkat, co?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //Máš aspoò ještì ty paklíèe?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //A hlavnì, co je s Juanem?

	B_Addon_Fisk_AboutJuan();
};

//---------------------------------------------------------------------
//	- Dietriche abgeben! 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePicks (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 6;
	condition   = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent   = TRUE;
	description = "Tady máš tucet paklíèù.";
};
FUNC INT DIA_Addon_Fisk_GivePicks_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_PaketOpen))
	&& (MIS_Lennar_Lockpick == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Tady máš tucet paklíèù.

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Vıbornì. Pár lidí u na tuhle dodávku èeká jak na smilování.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //Tohle není tucet! (potutelnì) Chceš mì snad napálit?
	};
};


//---------------------------------------------------------------------
//	Inspektor
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Inspektor (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 7;
	condition   = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent   = FALSE;
	description = "Juan pracoval pro Estebana!";
};
FUNC INT DIA_Addon_Fisk_Inspektor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Lieferung))
	&& (Npc_KnowsInfo (other, DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //Juan pracoval pro Estebana!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //(pøekvapenì) Coe?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Nehraj si se mnou! Tys o tom vìdìl!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //(klidnì) No dobøe, máš pravdu. Ale doufám, e si taky uvìdomuješ, proè jsem ti to neøek.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //Všichni v táboøe si myslí, e pracuješ pro Estebana.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //A já se do tı záleitosti rozhodnì nechci namoèit jenom proto, e seš celej havej, jen aby ti dal èervenej kámen.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Já vlastnì nepracuju pro Estebana.",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Nevìøím ti!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"To je mi jasnı!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Chápu.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Fajn, tak to nechme bejt. Nikdo nás nemusí slyšet!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Nevìøím ti!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //Vìø si, èemu chceš, ale varuju tì! Jestli o mnì chceš Estebanovi vyprávìt òákı pohádky, pak budeš další na øadì!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //Já pro Estebana a tak úplnì nepracuju.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //Take si s tím starım šmejdem jen tak zahráváš?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //Pak ti dám dobrou radu: nech si to pro sebe.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Nevìø NIKOMU, kdo má nìco spoleènıho s Estebanem, ani mnì. Kapišto?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //A teï u toho nechme, a nás nìkdo neslyší.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

//--------------------------------------------------------------------
//	Info Meeting
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Meeting   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent   = FALSE;
	description = "Take ten útok jsi spískal TY!";
};
FUNC INT DIA_Addon_Fisk_Meeting_Condition()
{	
	if (Npc_GetDistToWP  (self, "BL_INN_UP_06") <= 500)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//Take ten útok jsi spískal TY.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Jo. Esteban mi kazí kšefty.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Nikoho z lidí, co pro mì pracujou, nechce pustit do dolù. Dává si bacha, aby VŠICHNI makali pro nìj a jedinì pro nìj.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//Proto mùe vybírat poplatek z kadıho obchodu. Ovládá celej tábor.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Co máš v plánu?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Chceš zaujmout jeho místo?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Taky bych tì mohl Estebanovi prodat.",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//A ty ho chceš nahradit?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//Ne, já jsem kupec – jen si chci v klidu hledìt svıho.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Mohl bych tì Estebanovi prodat.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//A co? Co si myslíš, e se pak stane? Myslíš, e ti dá, co chceš?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Zapomeò na to – mám lepší plán.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Co máš v plánu?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Odstraníme Estebana – to znamená, e TY ho zabiješ a pøevezmeš jeho místo.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Kdy s ním budou ty jeho gorily, nemám šanci.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//Pak je musíme pøimìt, k odchodu – povíme jim pravdu.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Jakou pravdu?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//es udìlal, co ti nakázal, a e ten útok jsem spískal já.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Povìz to Estebanovi a on pošle svı hochy, aby mì zabili. A já si tu na nì poèkám.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//A budou pryè, mùeš toho bastarda v klidu sejmout a já se zatím postarám o jeho stráe.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban je mrtvı. U se zase mùu vìnovat jenom obchodùm.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Tumáš, tohle je pro tebe.
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Ten útok na Estebana naplánoval Fisk.");
};
//--------------------------------------------------------------------
//	Info Sieg
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Sieg   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent   = FALSE;
	description = "Esteban u to má za sebou.";
};
FUNC INT DIA_Addon_Fisk_Sieg_Condition()
{	
	if (MIS_Judas == LOG_SUCCESS)
	&&  Npc_IsDead (Esteban)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban u to má za sebou.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//Na tohle jsem èekal jak dlouho.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Myslím, e teï máš na práci další vìci a já se musím vrátit zpátky k obchodùm.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Take kdy budeš potøebovat nìco dalšího, víš, kde mì najít.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};

