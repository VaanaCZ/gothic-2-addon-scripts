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
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Hej, je�li szukasz uczciwego kupca, to w�a�nie go znalaz�e�.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//Moja chata stoi zaraz za domem Estebana, wi�c jak b�dziesz czego� potrzebowa�, to wpadnij.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk handluje or�em wszelkiego rodzaju.");
	
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
	
	//Bolzen nachf�llen
	if (Npc_HasItems (self, ItRw_Bolt) < 50)
	{
		CreateInvItems (self,ItRw_Bolt, (50 - Npc_HasItems (self, ItRw_Bolt))); 
	};
	//Pfeile nachf�llen
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
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //S�uchaj uwa�nie � chc�, �eby co� z tym zrobi�. Jasne?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //Mam w�asne problemy. Sam jestem poszkodowany.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //Jak to?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //S�ono zap�aci�em za moj� ostatni� przesy�k�.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Ale nigdy do mnie nie dotar�a! Jaka� �winia j� zabra�a!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //Kto� mi j� ukrad�. I to jeden z naszych!
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
	description	= "Co to za przesy�ka?";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //Co to za przesy�ka?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Paczka pe�na wytrych�w. Mia�a zosta� odebrana od pirat�w.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Ale przechwyci� j� go�� imieniem Juan. A tyle z�ota za ni� da�em.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Ten sukinsyn ukrywa si� gdzie� na bagnie...
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Jaki� Juan by� zamieszany w handel z bandytami. Podobno ma kryj�wk� gdzie� na bagnie.");
	B_LogEntry (Topic_Addon_Fisk,"Jaki� Juan zw�dzi� przesy�k� dla Fiska (paczk� wytrych�w). Ukrywa si� gdzie� na bagnie.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Nie �yje.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Dobrze, nie b�dzie mnie ju� wkurza�!
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //Jeszcze �yje...
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Pozostawi�e� t� �wini� przy �yciu?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Nie by� sam....
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Niewa�ne � tych go�ci te� si� pozb�d�...
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //A co do ciebie...
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Dobrze znam Huno.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Dzi�ki mnie dostaniesz zni�k� na bro�.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //Dosta�em ten kamie� od Corristo.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //To jedyna rzecz, kt�ra ocala�a, gdy wyrwa�em si� z kolonii. S�dz�, �e tobie bardziej si� przyda.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //Dam ci jeszcze jedn� z moich broni.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h gr��er oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //R�ka r�k� myje � nic si� nie zmieni�o.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "Mam twoj� paczk�.";
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
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //Mam twoj� paczk�.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //Naprawd�? A co z Juanem?
	
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
	description = "Otworzy�em twoj� paczk�!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //Otworzy�em twoj� paczk�!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //Mog�em si� tego spodziewa�! Nie mog�e� si� doczeka�, co?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //Masz przynajmniej wytrychy?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //A co wa�niejsze � co si� sta�o z Juanem?

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
	description = "Masz tu tuzin wytrych�w...";
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
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Masz tu tuzin wytrych�w...

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Bardzo dobrze. Ludzie czekaj� na dostaw�.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //To za ma�o! Chyba nie chcesz zatrzyma� sobie reszty?
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
	description = "Juan pracowa� dla Estebana!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //Juan pracowa� dla Estebana!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //Co?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Nie udawaj! Wiedzia�e� o tym!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //Masz racj�. Ale chyba rozumiesz, czemu ci o tym nie powiedzia�em.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //Ka�dy w obozie wie, �e pracujesz dla Estebana.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //Nie mam zamiaru si� w to wpl�ta� tylko dlatego, �e chcesz ten sw�j czerwony kamie�.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Tak naprawd� to nie pracuj� dla Estebana...",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Nie wierz� ci.",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Rozumiem.",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Rozumiem.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Dobrze, nie krzycz! Kto� mo�e nas pods�uchiwa�.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Nie wierz� ci.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //A wierz sobie, w co chcesz! Ale ostrzegam ci� � je�li nagadasz Estebanowi na m�j temat, skopi� ci ty�ek!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //Tak naprawd� to nie pracuj� dla Estebana...
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //Aha! Chcesz oszuka� starego g�upca?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //W takim razie dam ci dobr� rad� � lepiej si� tym nie chwal.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Je�li chodzi o Estebana, to nie powiniene� wierzy� nikomu � nawet mi, jasne?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //Dobra, do�� tego, bo jeszcze kto� nas us�yszy!
	
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
	description = "To TY stoisz za t� pr�b� zab�jstwa!";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//To TY stoisz za t� pr�b� zab�jstwa!
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Tak. Esteban mi zawadza.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Nie pozwala wej�� do kopalni moim ludziom. Chce mie� pewno��, �e wszyscy pracuj� dla niego � TYLKO dla niego.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//�ci�ga haracz z handlu i tak kontroluje ca�y ob�z.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Co chcesz zrobi�?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Chcesz zaj�� jego miejsce?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"M�g�bym ci� wyda� Estebanowi...",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//Chcesz zaj�� jego miejsce?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//Nie, jestem tylko kupcem � po prostu nie chc�, �eby kto� mi si� tu miesza� do interesu.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//M�g�bym ci� wyda� Estebanowi...
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//Pomy�la�e�, co by si� sta�o potem? My�lisz, �e dosta�by� to, co chcesz?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Zapomnij o tym � mam lepszy pomys�.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Co chcesz zrobi�?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Pozb�dziemy si� Estebana. Znaczy si�, zabijesz go i zajmiesz jego miejsce.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Nic z tego, dop�ki otaczaj� go jego ludzie.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//A wi�c b�dziemy musieli si� nimi zaj��. Powiemy prawd�.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Jak� prawd�?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//Wykona�e� swoje zadanie i wiesz, �e to ja sta�em za pr�b� zab�jstwa.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Powiedz o tym Estebanowi, a wy�le swoich zbir�w, �eby mnie zabili. B�d� tu na nich czeka�.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//Ty b�dziesz m�g� za�atwi� tego sukinsyna, a ja zajm� si� stra�nikami.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban nie �yje. Zn�w b�d� m�g� zaj�� si� handlem...
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Prosz�, to dla ciebie...
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Fisk zleci� zab�jstwo Estebana.");
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
	description = "Esteban nie b�dzie ju� sprawia� k�opot�w.";
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
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban nie b�dzie ju� sprawia� k�opot�w.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//D�ugo na to czeka�em.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Masz chyba do�� du�o roboty, a ja musz� znowu zaj�� si� prowadzeniem mojego interesu.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Je�li b�dziesz czego� potrzebowa�, wiesz, gdzie mnie szuka�.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};

