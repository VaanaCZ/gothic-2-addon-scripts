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
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Hej, jeśli szukasz uczciwego kupca, to właśnie go znalazłeś.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//Moja chata stoi zaraz za domem Estebana, więc jak będziesz czegoś potrzebować, to wpadnij.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk handluje orężem wszelkiego rodzaju.");
	
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
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //Słuchaj uważnie – chcę, żeby coś z tym zrobić. Jasne?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //Mam własne problemy. Sam jestem poszkodowany.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //Jak to?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //Słono zapłaciłem za moją ostatnią przesyłkę.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Ale nigdy do mnie nie dotarła! Jakaś świnia ją zabrała!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //Ktoś mi ją ukradł. I to jeden z naszych!
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
	description	= "Co to za przesyłka?";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //Co to za przesyłka?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Paczka pełna wytrychów. Miała zostać odebrana od piratów.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Ale przechwycił ją gość imieniem Juan. A tyle złota za nią dałem.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Ten sukinsyn ukrywa się gdzieś na bagnie...
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Jakiś Juan był zamieszany w handel z bandytami. Podobno ma kryjówkę gdzieś na bagnie.");
	B_LogEntry (Topic_Addon_Fisk,"Jakiś Juan zwędził przesyłkę dla Fiska (paczkę wytrychów). Ukrywa się gdzieś na bagnie.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Nie żyje.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Dobrze, nie będzie mnie już wkurzać!
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //Jeszcze żyje...
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Pozostawiłeś tę świnię przy życiu?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Nie był sam....
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Nieważne – tych gości też się pozbędę...
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //A co do ciebie...
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Dobrze znam Huno.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Dzięki mnie dostaniesz zniżkę na broń.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //Dostałem ten kamień od Corristo.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //To jedyna rzecz, która ocalała, gdy wyrwałem się z kolonii. Sądzę, że tobie bardziej się przyda.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //Dam ci jeszcze jedną z moich broni.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h größer oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //Ręka rękę myje – nic się nie zmieniło.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "Mam twoją paczkę.";
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
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //Mam twoją paczkę.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //Naprawdę? A co z Juanem?
	
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
	description = "Otworzyłem twoją paczkę!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //Otworzyłem twoją paczkę!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //Mogłem się tego spodziewać! Nie mogłeś się doczekać, co?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //Masz przynajmniej wytrychy?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //A co ważniejsze – co się stało z Juanem?

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
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Bardzo dobrze. Ludzie czekają na dostawę.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //To za mało! Chyba nie chcesz zatrzymać sobie reszty?
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
	description = "Juan pracował dla Estebana!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //Juan pracował dla Estebana!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //Co?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Nie udawaj! Wiedziałeś o tym!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //Masz rację. Ale chyba rozumiesz, czemu ci o tym nie powiedziałem.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //Każdy w obozie wie, że pracujesz dla Estebana.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //Nie mam zamiaru się w to wplątać tylko dlatego, że chcesz ten swój czerwony kamień.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Tak naprawdę to nie pracuję dla Estebana...",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Nie wierzę ci.",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Rozumiem.",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Rozumiem.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Dobrze, nie krzycz! Ktoś może nas podsłuchiwać.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Nie wierzę ci.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //A wierz sobie, w co chcesz! Ale ostrzegam cię – jeśli nagadasz Estebanowi na mój temat, skopię ci tyłek!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //Tak naprawdę to nie pracuję dla Estebana...
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //Aha! Chcesz oszukać starego głupca?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //W takim razie dam ci dobrą radę – lepiej się tym nie chwal.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Jeśli chodzi o Estebana, to nie powinieneś wierzyć nikomu – nawet mi, jasne?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //Dobra, dość tego, bo jeszcze ktoś nas usłyszy!
	
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
	description = "To TY stoisz za tą próbą zabójstwa!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//To TY stoisz za tą próbą zabójstwa!
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Tak. Esteban mi zawadza.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Nie pozwala wejść do kopalni moim ludziom. Chce mieć pewność, że wszyscy pracują dla niego – TYLKO dla niego.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//Ściąga haracz z handlu i tak kontroluje cały obóz.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Co chcesz zrobić?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Chcesz zająć jego miejsce?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Mógłbym cię wydać Estebanowi...",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//Chcesz zająć jego miejsce?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//Nie, jestem tylko kupcem – po prostu nie chcę, żeby ktoś mi się tu mieszał do interesu.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Mógłbym cię wydać Estebanowi...
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//Pomyślałeś, co by się stało potem? Myślisz, że dostałbyś to, co chcesz?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Zapomnij o tym – mam lepszy pomysł.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Co chcesz zrobić?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Pozbędziemy się Estebana. Znaczy się, zabijesz go i zajmiesz jego miejsce.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Nic z tego, dopóki otaczają go jego ludzie.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//A więc będziemy musieli się nimi zająć. Powiemy prawdę.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Jaką prawdę?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//Wykonałeś swoje zadanie i wiesz, że to ja stałem za próbą zabójstwa.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Powiedz o tym Estebanowi, a wyśle swoich zbirów, żeby mnie zabili. Będę tu na nich czekać.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//Ty będziesz mógł załatwić tego sukinsyna, a ja zajmę się strażnikami.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban nie żyje. Znów będę mógł zająć się handlem...
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Proszę, to dla ciebie...
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Fisk zlecił zabójstwo Estebana.");
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
	description = "Esteban nie będzie już sprawiał kłopotów.";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban nie będzie już sprawiał kłopotów.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//Długo na to czekałem.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Masz chyba dość dużo roboty, a ja muszę znowu zająć się prowadzeniem mojego interesu.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Jeśli będziesz czegoś potrzebować, wiesz, gdzie mnie szukać.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};

