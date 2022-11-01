//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //Czego jeszcze chcesz? Spadaj!
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //Na co czekasz? Idź się napić!
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "Od razu widać, że znasz się na swoim fachu.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Od razu widać, że znasz się na swoim fachu.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//Już to kiedyś słyszałem... przynosisz stal?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//Stal? Nie, chyba mnie z kimś pomyliłeś....
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Hmm... wyglądasz znajomo. Spotkaliśmy się wcześniej?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Oczywiście, w Starym Obozie.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Nie pamiętam tego.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno handluje wyrobami kowalskimi.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Oczywiście, w Starym Obozie.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//W Starym Obozie... racja... to ty jesteś tym wścibskim gościem... myślałem, że nie żyjesz.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//Cóż, wszyscy tak sądzili. Kto jeszcze przeżył?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//Paru ludzi. Niektórzy uciekli z Krukiem, tak jak ja. Wielu zginęło w obozie.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//Nie pamiętam tego.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Hmm... Sam mam w głowie mętlik... Szlag by to trafił...
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "Opowiedz mi o ucieczce.";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//Opowiedz mi o ucieczce.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//Kiedy przestała istnieć bariera, zapanował chaos.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//Niektórzy się ukryli – inni uciekli, a wszystko zostało splądrowane.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//Co zrobiłeś?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//Próbowałem uciec z obozu, gdy nagle zrobiło się strasznie jasno i poczułem straszliwy ból.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//Trafił mnie cholerny piorun! Ciągle mi się zdaje, że go słyszę...
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//Później dowiedziałem się, że znalazł mnie Thorus i zabrał ze sobą.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "Potrzebuję lepszej zbroi.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Potrzebuję lepszej zbroi.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //Cóż – możesz ją mieć. To, że jest taka droga, to wina Estebana.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Ten parszywy pies ściąga haracz z każdej sprzedanej przeze mnie zbroi.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Kup ciężką zbroję bandytów. Ochrona (broń i strzały) 45, 2100 sztuk złota.", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk powiedział, że sprzedasz mi ją po dobrej cenie.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //Fisk, powiadasz... Hmm, dobrze, jestem mu winien przysługę.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Kup ciężką zbroję bandytów. Ochrona (broń i strzały) 45, 1400 sztuk złota.", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Dobra, biorę zbroję.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Wygląda nieźle.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Nie ma złota, nie ma zbroi.
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "A co do próby zabójstwa Estebana...";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //Czego ode mnie chcesz?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Szukam osoby, która zleciła zabójstwo...
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //I przyszedłeś z tym do mnie?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //Myślałem, że możesz coś wiedzieć na ten temat.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //Ale nie wiem!
};


//----------------------------------------------------------------------
//	Paar Dinge gehört
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //A teraz słuchaj! Zabieraj stąd swój tyłek, zanim przestanę nad sobą panować!
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "Słyszałem trochę ciekawych rzeczy na twój temat...";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //Słyszałem trochę ciekawych rzeczy na twój temat...
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //Hę?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //Znowu zaczynasz? Mam nadzieję, że tym razem to coś ważnego...
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //Podobno w momencie zamachu nie było cię na stanowisku!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //Tak?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul powiedział, że nienawidzisz Estebana.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //Czyżby? Coś jeszcze?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //Emilio zdradził twoje imię! Na pewno wiesz coś na temat próby zabójstwa!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //A więc porozmawiałeś sobie ze starym Emiliem, co?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //Nie tylko on ciebie podejrzewa.
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //Jak to?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Chcę się dogadać ze zleceniodawcą zabójstwa!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Jeśli stoisz za tą próbą zabójstwa, to zapłacisz za to!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "Wygląda na to, że trzymam Huna w szachu.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //Może też powinienem z nim porozmawiać. Jestem pewien, że to pomoże mu zmienić zdanie!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //Nic więcej...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //Jeśli stoisz za tą próbą zabójstwa, to zapłacisz za to!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //Jesteś idiotą! Naprawdę zamierzasz podlizywać się Estebanowi?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //Spadaj stąd!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //Chcę się dogadać ze zleceniodawcą zabójstwa!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //Wystąpisz przeciwko Estebanowi? Naprawdę? Więc to udowodnij!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //Zbyt długo już czekam na dostawę stali od piratów.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Domyślam się, że przejął ją Esteban. Chce sprzedać mi stal po wyższej cenie.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //Oczywiście sam nie brudzi sobie tym rąk. Ma na usługach paru bandytów z bagna.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //Skąd o tym wiesz?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //Pijani bandyci dużo mówią...
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //Ten gadatliwy bandyta ma jakieś imię?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //Nie powinno cię to obchodzić. Ale gość, którego SZUKASZ, nazywa się Juan. Jednak od dawna nie widziałem go w obozie.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //Będziesz musiał poszukać go na bagnie.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno czeka na dostawę stali od piratów. Sądzi, że na rozkaz Estebana przechwycił ją niejaki Juan, który ukrywa się gdzieś na bagnie.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Najpierw powiesz mi, kto zlecił zabójstwo!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "W porządku, zrobię to dla ciebie!", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //W porządku, zrobię to dla ciebie!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Dobrze. Zobaczymy, czy mogę ci zaufać.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //Najpierw powiesz mi, kto zlecił zabójstwo!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //Nie. Nie ufam ci.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Uważaj. Następną rozmowę odbędę albo z nim, albo z Estebanem.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //To zależy od ciebie.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //W takim razie dobrze! Zaaranżuję twoje spotkanie ze zleceniodawcą. Ale na moich zasadach, zrozumiano?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //Idź do knajpy i porozmawiaj z oberżystą. On powie ci, co robić dalej.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno powiedział mi, żebym zamienił słówko ze Snafem.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "Mam stal.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//Mam stal.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //I co? Juan też tam był?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //Tak.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //Wiedziałem! Za wszystkim stał ten szczur, Esteban.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Jesteś w porządku. Jeśli mam być szczery, nie spodziewałem się tego.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Proszę, oto twoja nagroda.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //Co będzie teraz z naszą umową?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //Człowiek, którego szukasz, czeka na ciebie w knajpie. Porozmawiaj z oberżystą.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno powiedział mi, żebym zamienił słówko ze Snafem.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};






