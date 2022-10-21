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
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Hej, dok�d idziesz? Zamierzasz ruszy� t� �cie�k�?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//No tak, dlaczego nie?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Na dole jest wi�cej niewolnik�w. Nie bij ich za bardzo, je�li nie s� w stanie pracowa�.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Nie chcemy, �eby si� obijali. Maj� wydobywa� z�oto.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Rozumiem, a kto tak kaza�?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//To rozkaz Bloodwyna.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//Wydawa�o mi si�, �e szefem jest tu Kruk.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//To prawda. Niewolnik�w da� jednak w prezencie Bloodwynowi. Ju� ich nie potrzebuje.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Kruk nie potrzebuje ju� niewolnik�w. Teraz ich w�a�cicielem jest Bloodwyn."); 
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
	description = "Uwolnij niewolnik�w!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//Uwolnij niewolnik�w!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//S�uchaj, rozkazy wydaje tu Bloodwyn. Niewolnicy s� jego w�asno�ci� i tylko on mo�e ich uwolni�.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//Poza tym Thorus tak�e ma tutaj pewn� w�adz�. A ty co robisz?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Tylko Bloodwyn i Thorus mog� pozwoli� na uwolnienie niewolnik�w.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//Sprawujesz tu jak�� wa�n� funkcj�?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Rozmawia�em z Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(Poka� g�ow� Bloodwyna)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"To ja decyduj�, KTO mo�e wej�� do kopalni.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//To ja decyduj�, KTO mo�e wej�� do kopalni.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//A zatem wykonujesz teraz prac� Estebana. A to oznacza, �e nie masz tu �ADNYCH wp�yw�w. Zje�d�aj.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Wystarczy?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//Nie chc� TEGO ogl�da�!
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Lepiej b�dzie, jak NATYCHMIAST uwolnisz niewolnik�w.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//S�uchaj, nie mog� nikogo wypu�ci�, je�li nie mam takiego rozkazu od Thorusa.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Rozmawia�em z Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//M�wi�e�, �e niewolnicy nale�� do Bloodwyna.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//Tak. Ale wspomina�em te�, �e nie mog� ich zwolni� bez pozwolenia Thorusa.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Jeste� z tych typ�w, kt�rzy nawet nie p�jd� si� odla� bez pozwolenia, co?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//No c�, wspomnia�em, �e...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//...dobrze, daruj sobie reszt�.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//Rozmawia�em z Thorusem. Masz uwolni� niewolnik�w.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//Dobrze, je�li tak sobie �yczy Thorus. Zastanawia mnie, dlaczego wyda� taki rozkaz...
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//...ale nie p�ac� ci za zadawanie pyta�.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Dobrze, dobrze - widz�, �e nie mam ju� kogo pilnowa�. Id� zje�� troch� tej smacznej zupy.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
