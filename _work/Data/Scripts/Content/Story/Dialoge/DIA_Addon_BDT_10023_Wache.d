//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_Hi   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10023_Wache_Hi_Condition()
{	
	if (Npc_GetDistToNpc (self,other) <= 300)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Hej, dokąd idziesz? Zamierzasz ruszyć tą ścieżką?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//No tak, dlaczego nie?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Na dole jest więcej niewolników. Nie bij ich za bardzo, jeśli nie są w stanie pracować.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Nie chcemy, żeby się obijali. Mają wydobywać złoto.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Rozumiem, a kto tak kazał?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//To rozkaz Bloodwyna.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//Wydawało mi się, że szefem jest tu Kruk.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//To prawda. Niewolników dał jednak w prezencie Bloodwynowi. Już ich nie potrzebuje.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Kruk nie potrzebuje już niewolników. Teraz ich właścicielem jest Bloodwyn."); 
};
//---------------------------------------------------------------------
//	Info go
//---------------------------------------------------------------------
var int PrisonGuard_Rules;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_go   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent   = TRUE;
	description = "Uwolnij niewolników!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//Uwolnij niewolników!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//Słuchaj, rozkazy wydaje tu Bloodwyn. Niewolnicy są jego własnością i tylko on może ich uwolnić.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//Poza tym Thorus także ma tutaj pewną władzę. A ty co robisz?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Tylko Bloodwyn i Thorus mogą pozwolić na uwolnienie niewolników.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//Sprawujesz tu jakąś ważną funkcję?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Rozmawiałem z Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(Pokaż głowę Bloodwyna)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"To ja decyduję, KTO może wejść do kopalni.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//To ja decyduję, KTO może wejść do kopalni.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//A zatem wykonujesz teraz pracę Estebana. A to oznacza, że nie masz tu ŻADNYCH wpływów. Zjeżdżaj.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Wystarczy?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//Nie chcę TEGO oglądać!
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Lepiej będzie, jak NATYCHMIAST uwolnisz niewolników.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//Słuchaj, nie mogę nikogo wypuścić, jeśli nie mam takiego rozkazu od Thorusa.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Rozmawiałem z Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//Mówiłeś, że niewolnicy należą do Bloodwyna.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//Tak. Ale wspominałem też, że nie mogę ich zwolnić bez pozwolenia Thorusa.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Jesteś z tych typów, którzy nawet nie pójdą się odlać bez pozwolenia, co?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//No cóż, wspomniałem, że...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//...dobrze, daruj sobie resztę.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//Rozmawiałem z Thorusem. Masz uwolnić niewolników.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//Dobrze, jeśli tak sobie życzy Thorus. Zastanawia mnie, dlaczego wydał taki rozkaz...
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//...ale nie płacą ci za zadawanie pytań.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Dobrze, dobrze - widzę, że nie mam już kogo pilnować. Idę zjeść trochę tej smacznej zupy.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
