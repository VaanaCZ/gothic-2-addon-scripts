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
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Hej, dok¹d idziesz? Zamierzasz ruszyæ t¹ œcie¿k¹?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//No tak, dlaczego nie?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Na dole jest wiêcej niewolników. Nie bij ich za bardzo, jeœli nie s¹ w stanie pracowaæ.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Nie chcemy, ¿eby siê obijali. Maj¹ wydobywaæ z³oto.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Rozumiem, a kto tak kaza³?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//To rozkaz Bloodwyna.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//Wydawa³o mi siê, ¿e szefem jest tu Kruk.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//To prawda. Niewolników da³ jednak w prezencie Bloodwynowi. Ju¿ ich nie potrzebuje.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Kruk nie potrzebuje ju¿ niewolników. Teraz ich w³aœcicielem jest Bloodwyn."); 
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
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//S³uchaj, rozkazy wydaje tu Bloodwyn. Niewolnicy s¹ jego w³asnoœci¹ i tylko on mo¿e ich uwolniæ.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//Poza tym Thorus tak¿e ma tutaj pewn¹ w³adzê. A ty co robisz?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Tylko Bloodwyn i Thorus mog¹ pozwoliæ na uwolnienie niewolników.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//Sprawujesz tu jak¹œ wa¿n¹ funkcjê?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Rozmawia³em z Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(Poka¿ g³owê Bloodwyna)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"To ja decydujê, KTO mo¿e wejœæ do kopalni.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//To ja decydujê, KTO mo¿e wejœæ do kopalni.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//A zatem wykonujesz teraz pracê Estebana. A to oznacza, ¿e nie masz tu ¯ADNYCH wp³ywów. Zje¿d¿aj.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Wystarczy?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//Nie chcê TEGO ogl¹daæ!
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Lepiej bêdzie, jak NATYCHMIAST uwolnisz niewolników.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//S³uchaj, nie mogê nikogo wypuœciæ, jeœli nie mam takiego rozkazu od Thorusa.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Rozmawia³em z Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//Mówi³eœ, ¿e niewolnicy nale¿¹ do Bloodwyna.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//Tak. Ale wspomina³em te¿, ¿e nie mogê ich zwolniæ bez pozwolenia Thorusa.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Jesteœ z tych typów, którzy nawet nie pójd¹ siê odlaæ bez pozwolenia, co?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//No có¿, wspomnia³em, ¿e...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//...dobrze, daruj sobie resztê.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//Rozmawia³em z Thorusem. Masz uwolniæ niewolników.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//Dobrze, jeœli tak sobie ¿yczy Thorus. Zastanawia mnie, dlaczego wyda³ taki rozkaz...
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//...ale nie p³ac¹ ci za zadawanie pytañ.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Dobrze, dobrze - widzê, ¿e nie mam ju¿ kogo pilnowaæ. Idê zjeœæ trochê tej smacznej zupy.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
