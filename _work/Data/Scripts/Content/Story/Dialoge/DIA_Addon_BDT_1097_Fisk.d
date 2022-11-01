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
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Hej, jestli tady v táboře hledáš ňákýho slušnýho obchodníka, tak jsi ho právě našel.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//Mám chatrč přímo za Estebanem, takže kdybys něco potřeboval, zastav se.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk prodává všechno možné.");
	
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
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //Hele, já s tím nechci mít nic společnýho, kapišto?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //(nevinně) Mám jiný starosti, já sám jsem oběť.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //Jak to?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //Za poslední dodávku jsem vysolil pěknou hromadu zlata.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Ale nikdy jsem za ni nic nedostal! Ňákej hajzl to prostě stopil!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //(rozzuřeně) Okradli mě, a nejspíš někdo z našich vlastních lidí!
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
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Balík paklíčů. Někdo mi je měl vyzvednout u pirátů.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Ale jistej Juan mi je čmajznul. (vztekle) Včetně zlata, který jsem za ně zaplatil!
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Ten šmejd se teď ukrejvá někde v bažině.
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Jistý Juan obchodoval s bandity. Prý se ukrývají kdesi v bažinách.");
	B_LogEntry (Topic_Addon_Fisk,"Jistý Juan ukradl Fiskovi zásilku zboží (balík paklíčů). Teď se skrývá kdesi v bažinách.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Je mrtvý.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Dobře, aspoň už od něj bude pokoj.
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //Je stále naživu.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Tys tu svini nechal žít?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Nebyl sám.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Nevadí – já se s těma hajzlama vypořádám pozdějc.
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //A co se týče tebe...
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Mám fakt dobrý vztahy s Hunem.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Dohlídnu, aby ti odteďka prodával brnění fakt levně.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //A vem si tohle – tenhle šutr jsem jednou dostal od Corrista.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //Je to jediná věc, co přežila můj útěk z bariéry. Myslím, že ho využiješ víc jak já.
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
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //(uličnicky) Ruka ruku myje – to se nikdy nezmění.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "Mám ten tvůj balík.";
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
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //Mám ten tvůj balík.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //(potěšeně) Vážně! (překvapeně) A co Juan?
	
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
	description = "Otevřel jsem tvůj balík!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //Otevřel jsem ten tvůj balík!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //(směje se) Samozřejmě! Ses prostě nemoh dočkat, co?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //Máš aspoň ještě ty paklíče?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //A hlavně, co je s Juanem?

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
	description = "Tady máš tucet paklíčů.";
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
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Tady máš tucet paklíčů.

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Výborně. Pár lidí už na tuhle dodávku čeká jak na smilování.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //Tohle není tucet! (potutelně) Chceš mě snad napálit?
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
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //(překvapeně) Cože?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Nehraj si se mnou! Tys o tom věděl!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //(klidně) No dobře, máš pravdu. Ale doufám, že si taky uvědomuješ, proč jsem ti to neřek.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //Všichni v táboře si myslí, že pracuješ pro Estebana.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //A já se do tý záležitosti rozhodně nechci namočit jenom proto, že seš celej žhavej, jen aby ti dal červenej kámen.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Já vlastně nepracuju pro Estebana.",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Nevěřím ti!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"To je mi jasný!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Chápu.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Fajn, tak to nechme bejt. Nikdo nás nemusí slyšet!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Nevěřím ti!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //Věř si, čemu chceš, ale varuju tě! Jestli o mně chceš Estebanovi vyprávět ňáký pohádky, pak budeš další na řadě!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //Já pro Estebana až tak úplně nepracuju.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //Takže si s tím starým šmejdem jen tak zahráváš?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //Pak ti dám dobrou radu: nech si to pro sebe.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Nevěř NIKOMU, kdo má něco společnýho s Estebanem, ani mně. Kapišto?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //A teď už toho nechme, ať nás někdo neslyší.
	
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
	description = "Takže ten útok jsi spískal TY!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//Takže ten útok jsi spískal TY.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Jo. Esteban mi kazí kšefty.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Nikoho z lidí, co pro mě pracujou, nechce pustit do dolů. Dává si bacha, aby VŠICHNI makali pro něj a jedině pro něj.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//Proto může vybírat poplatek z každýho obchodu. Ovládá celej tábor.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Co máš v plánu?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Chceš zaujmout jeho místo?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Taky bych tě mohl Estebanovi prodat.",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//A ty ho chceš nahradit?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//Ne, já jsem kupec – jen si chci v klidu hledět svýho.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Mohl bych tě Estebanovi prodat.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//A co? Co si myslíš, že se pak stane? Myslíš, že ti dá, co chceš?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Zapomeň na to – mám lepší plán.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Co máš v plánu?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Odstraníme Estebana – to znamená, že TY ho zabiješ a převezmeš jeho místo.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Když s ním budou ty jeho gorily, nemám šanci.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//Pak je musíme přimět, k odchodu – povíme jim pravdu.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Jakou pravdu?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//Žes udělal, co ti nakázal, a že ten útok jsem spískal já.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Pověz to Estebanovi a on pošle svý hochy, aby mě zabili. A já si tu na ně počkám.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//Až budou pryč, můžeš toho bastarda v klidu sejmout a já se zatím postarám o jeho stráže.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban je mrtvý. Už se zase můžu věnovat jenom obchodům.
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
	description = "Esteban už to má za sebou.";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban už to má za sebou.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//Na tohle jsem čekal jak dlouho.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Myslím, že teď máš na práci další věci a já se musím vrátit zpátky k obchodům.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Takže když budeš potřebovat něco dalšího, víš, kde mě najít.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};

