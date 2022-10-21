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
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Hej, jeœli szukasz uczciwego kupca, to w³aœnie go znalaz³eœ.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//Moja chata stoi zaraz za domem Estebana, wiêc jak bêdziesz czegoœ potrzebowaæ, to wpadnij.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk handluje orê¿em wszelkiego rodzaju.");
	
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
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //S³uchaj uwa¿nie – chcê, ¿eby coœ z tym zrobiæ. Jasne?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //Mam w³asne problemy. Sam jestem poszkodowany.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //Jak to?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //S³ono zap³aci³em za moj¹ ostatni¹ przesy³kê.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Ale nigdy do mnie nie dotar³a! Jakaœ œwinia j¹ zabra³a!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //Ktoœ mi j¹ ukrad³. I to jeden z naszych!
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
	description	= "Co to za przesy³ka?";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //Co to za przesy³ka?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Paczka pe³na wytrychów. Mia³a zostaæ odebrana od piratów.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Ale przechwyci³ j¹ goœæ imieniem Juan. A tyle z³ota za ni¹ da³em.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Ten sukinsyn ukrywa siê gdzieœ na bagnie...
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Jakiœ Juan by³ zamieszany w handel z bandytami. Podobno ma kryjówkê gdzieœ na bagnie.");
	B_LogEntry (Topic_Addon_Fisk,"Jakiœ Juan zwêdzi³ przesy³kê dla Fiska (paczkê wytrychów). Ukrywa siê gdzieœ na bagnie.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Nie ¿yje.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Dobrze, nie bêdzie mnie ju¿ wkurzaæ!
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //Jeszcze ¿yje...
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Pozostawi³eœ tê œwiniê przy ¿yciu?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Nie by³ sam....
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Niewa¿ne – tych goœci te¿ siê pozbêdê...
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //A co do ciebie...
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Dobrze znam Huno.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Dziêki mnie dostaniesz zni¿kê na broñ.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //Dosta³em ten kamieñ od Corristo.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //To jedyna rzecz, która ocala³a, gdy wyrwa³em siê z kolonii. S¹dzê, ¿e tobie bardziej siê przyda.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //Dam ci jeszcze jedn¹ z moich broni.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h größer oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //Rêka rêkê myje – nic siê nie zmieni³o.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "Mam twoj¹ paczkê.";
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
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //Mam twoj¹ paczkê.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //Naprawdê? A co z Juanem?
	
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
	description = "Otworzy³em twoj¹ paczkê!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //Otworzy³em twoj¹ paczkê!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //Mog³em siê tego spodziewaæ! Nie mog³eœ siê doczekaæ, co?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //Masz przynajmniej wytrychy?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //A co wa¿niejsze – co siê sta³o z Juanem?

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
	description = "Masz tu tuzin wytrychów...";
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
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Masz tu tuzin wytrychów...

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Bardzo dobrze. Ludzie czekaj¹ na dostawê.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //To za ma³o! Chyba nie chcesz zatrzymaæ sobie reszty?
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
	description = "Juan pracowa³ dla Estebana!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //Juan pracowa³ dla Estebana!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //Co?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Nie udawaj! Wiedzia³eœ o tym!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //Masz racjê. Ale chyba rozumiesz, czemu ci o tym nie powiedzia³em.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //Ka¿dy w obozie wie, ¿e pracujesz dla Estebana.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //Nie mam zamiaru siê w to wpl¹taæ tylko dlatego, ¿e chcesz ten swój czerwony kamieñ.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Tak naprawdê to nie pracujê dla Estebana...",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Nie wierzê ci.",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Rozumiem.",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Rozumiem.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Dobrze, nie krzycz! Ktoœ mo¿e nas pods³uchiwaæ.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Nie wierzê ci.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //A wierz sobie, w co chcesz! Ale ostrzegam ciê – jeœli nagadasz Estebanowi na mój temat, skopiê ci ty³ek!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //Tak naprawdê to nie pracujê dla Estebana...
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //Aha! Chcesz oszukaæ starego g³upca?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //W takim razie dam ci dobr¹ radê – lepiej siê tym nie chwal.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Jeœli chodzi o Estebana, to nie powinieneœ wierzyæ nikomu – nawet mi, jasne?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //Dobra, doœæ tego, bo jeszcze ktoœ nas us³yszy!
	
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
	description = "To TY stoisz za t¹ prób¹ zabójstwa!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//To TY stoisz za t¹ prób¹ zabójstwa!
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Tak. Esteban mi zawadza.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Nie pozwala wejœæ do kopalni moim ludziom. Chce mieæ pewnoœæ, ¿e wszyscy pracuj¹ dla niego – TYLKO dla niego.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//Œci¹ga haracz z handlu i tak kontroluje ca³y obóz.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Co chcesz zrobiæ?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Chcesz zaj¹æ jego miejsce?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Móg³bym ciê wydaæ Estebanowi...",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//Chcesz zaj¹æ jego miejsce?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//Nie, jestem tylko kupcem – po prostu nie chcê, ¿eby ktoœ mi siê tu miesza³ do interesu.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Móg³bym ciê wydaæ Estebanowi...
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//Pomyœla³eœ, co by siê sta³o potem? Myœlisz, ¿e dosta³byœ to, co chcesz?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Zapomnij o tym – mam lepszy pomys³.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Co chcesz zrobiæ?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Pozbêdziemy siê Estebana. Znaczy siê, zabijesz go i zajmiesz jego miejsce.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Nic z tego, dopóki otaczaj¹ go jego ludzie.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//A wiêc bêdziemy musieli siê nimi zaj¹æ. Powiemy prawdê.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Jak¹ prawdê?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//Wykona³eœ swoje zadanie i wiesz, ¿e to ja sta³em za prób¹ zabójstwa.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Powiedz o tym Estebanowi, a wyœle swoich zbirów, ¿eby mnie zabili. Bêdê tu na nich czekaæ.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//Ty bêdziesz móg³ za³atwiæ tego sukinsyna, a ja zajmê siê stra¿nikami.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban nie ¿yje. Znów bêdê móg³ zaj¹æ siê handlem...
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Proszê, to dla ciebie...
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Fisk zleci³ zabójstwo Estebana.");
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
	description = "Esteban nie bêdzie ju¿ sprawia³ k³opotów.";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban nie bêdzie ju¿ sprawia³ k³opotów.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//D³ugo na to czeka³em.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Masz chyba doœæ du¿o roboty, a ja muszê znowu zaj¹æ siê prowadzeniem mojego interesu.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Jeœli bêdziesz czegoœ potrzebowaæ, wiesz, gdzie mnie szukaæ.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};

