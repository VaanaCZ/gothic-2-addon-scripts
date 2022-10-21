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
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //Na co czekasz? Id� si� napi�!
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
	description = "Od razu wida�, �e znasz si� na swoim fachu.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Od razu wida�, �e znasz si� na swoim fachu.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//Ju� to kiedy� s�ysza�em... przynosisz stal?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//Stal? Nie, chyba mnie z kim� pomyli�e�....
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Hmm... wygl�dasz znajomo. Spotkali�my si� wcze�niej?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Oczywi�cie, w Starym Obozie.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Nie pami�tam tego.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno handluje wyrobami kowalskimi.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Oczywi�cie, w Starym Obozie.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//W Starym Obozie... racja... to ty jeste� tym w�cibskim go�ciem... my�la�em, �e nie �yjesz.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//C�, wszyscy tak s�dzili. Kto jeszcze prze�y�?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//Paru ludzi. Niekt�rzy uciekli z Krukiem, tak jak ja. Wielu zgin�o w obozie.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//Nie pami�tam tego.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Hmm... Sam mam w g�owie m�tlik... Szlag by to trafi�...
	
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
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//Kiedy przesta�a istnie� bariera, zapanowa� chaos.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//Niekt�rzy si� ukryli � inni uciekli, a wszystko zosta�o spl�drowane.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//Co zrobi�e�?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//Pr�bowa�em uciec z obozu, gdy nagle zrobi�o si� strasznie jasno i poczu�em straszliwy b�l.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//Trafi� mnie cholerny piorun! Ci�gle mi si� zdaje, �e go s�ysz�...
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//P�niej dowiedzia�em si�, �e znalaz� mnie Thorus i zabra� ze sob�.
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
	description = "Potrzebuj� lepszej zbroi.";
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
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Potrzebuj� lepszej zbroi.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //C� � mo�esz j� mie�. To, �e jest taka droga, to wina Estebana.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Ten parszywy pies �ci�ga haracz z ka�dej sprzedanej przeze mnie zbroi.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Kup ci�k� zbroj� bandyt�w. Ochrona (bro� i strza�y) 45, 2100 sztuk z�ota.", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk powiedzia�, �e sprzedasz mi j� po dobrej cenie.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //Fisk, powiadasz... Hmm, dobrze, jestem mu winien przys�ug�.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Kup ci�k� zbroj� bandyt�w. Ochrona (bro� i strza�y) 45, 1400 sztuk z�ota.", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Dobra, bior� zbroj�.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Wygl�da nie�le.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Nie ma z�ota, nie ma zbroi.
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
	description = "A co do pr�by zab�jstwa Estebana...";
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
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Szukam osoby, kt�ra zleci�a zab�jstwo...
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //I przyszed�e� z tym do mnie?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //My�la�em, �e mo�esz co� wiedzie� na ten temat.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //Ale nie wiem!
};


//----------------------------------------------------------------------
//	Paar Dinge geh�rt
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //A teraz s�uchaj! Zabieraj st�d sw�j ty�ek, zanim przestan� nad sob� panowa�!
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "S�ysza�em troch� ciekawych rzeczy na tw�j temat...";
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
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //S�ysza�em troch� ciekawych rzeczy na tw�j temat...
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //H�?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //Znowu zaczynasz? Mam nadziej�, �e tym razem to co� wa�nego...
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //Podobno w momencie zamachu nie by�o ci� na stanowisku!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //Tak?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul powiedzia�, �e nienawidzisz Estebana.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //Czy�by? Co� jeszcze?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //Emilio zdradzi� twoje imi�! Na pewno wiesz co� na temat pr�by zab�jstwa!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //A wi�c porozmawia�e� sobie ze starym Emiliem, co?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //Nie tylko on ciebie podejrzewa.
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //Jak to?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Chc� si� dogada� ze zleceniodawc� zab�jstwa!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Je�li stoisz za t� pr�b� zab�jstwa, to zap�acisz za to!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "Wygl�da na to, �e trzymam Huna w szachu.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //Mo�e te� powinienem z nim porozmawia�. Jestem pewien, �e to pomo�e mu zmieni� zdanie!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //Nic wi�cej...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //Je�li stoisz za t� pr�b� zab�jstwa, to zap�acisz za to!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //Jeste� idiot�! Naprawd� zamierzasz podlizywa� si� Estebanowi?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //Spadaj st�d!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //Chc� si� dogada� ze zleceniodawc� zab�jstwa!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //Wyst�pisz przeciwko Estebanowi? Naprawd�? Wi�c to udowodnij!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //Zbyt d�ugo ju� czekam na dostaw� stali od pirat�w.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Domy�lam si�, �e przej�� j� Esteban. Chce sprzeda� mi stal po wy�szej cenie.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //Oczywi�cie sam nie brudzi sobie tym r�k. Ma na us�ugach paru bandyt�w z bagna.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //Sk�d o tym wiesz?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //Pijani bandyci du�o m�wi�...
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //Ten gadatliwy bandyta ma jakie� imi�?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //Nie powinno ci� to obchodzi�. Ale go��, kt�rego SZUKASZ, nazywa si� Juan. Jednak od dawna nie widzia�em go w obozie.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //B�dziesz musia� poszuka� go na bagnie.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno czeka na dostaw� stali od pirat�w. S�dzi, �e na rozkaz Estebana przechwyci� j� niejaki Juan, kt�ry ukrywa si� gdzie� na bagnie.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Najpierw powiesz mi, kto zleci� zab�jstwo!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "W porz�dku, zrobi� to dla ciebie!", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //W porz�dku, zrobi� to dla ciebie!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Dobrze. Zobaczymy, czy mog� ci zaufa�.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //Najpierw powiesz mi, kto zleci� zab�jstwo!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //Nie. Nie ufam ci.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Uwa�aj. Nast�pn� rozmow� odb�d� albo z nim, albo z Estebanem.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //To zale�y od ciebie.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //W takim razie dobrze! Zaaran�uj� twoje spotkanie ze zleceniodawc�. Ale na moich zasadach, zrozumiano?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //Id� do knajpy i porozmawiaj z ober�yst�. On powie ci, co robi� dalej.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno powiedzia� mi, �ebym zamieni� s��wko ze Snafem.");
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
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //I co? Juan te� tam by�?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //Tak.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //Wiedzia�em! Za wszystkim sta� ten szczur, Esteban.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Jeste� w porz�dku. Je�li mam by� szczery, nie spodziewa�em si� tego.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Prosz�, oto twoja nagroda.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //Co b�dzie teraz z nasz� umow�?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //Cz�owiek, kt�rego szukasz, czeka na ciebie w knajpie. Porozmawiaj z ober�yst�.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno powiedzia� mi, �ebym zamieni� s��wko ze Snafem.");
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






