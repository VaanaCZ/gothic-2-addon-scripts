//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10031_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10031_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10031_Wache_EXIT_Condition;
	information = DIA_Addon_10031_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10031_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10031_Wache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Scatty
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10031_Wache_Scatty   (C_INFO)
{
	npc         = BDT_10031_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10031_Wache_Scatty_Condition;
	information = DIA_Addon_10031_Wache_Scatty_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10031_Wache_Scatty_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10031_Wache_Scatty_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_00");//Hej, chcesz pokopa�? Nie zapomnij zabra� wyposa�enia od Scatty'ego.
	AI_Output (other, self, "DIA_Addon_BDT_10031_Wache_Scatty_15_01");//Co b�dzie mi potrzebne?
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_02");//Kilof na pewno. Odrobina �ywno�ci te� ci nie zaszkodzi.
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_03");//A co z miksturami uzdrawiaj�cymi? W kopalni s� pe�zacze.
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
var int Wache_Joker;
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10031_Wache_Hi   (C_INFO)
{
	npc         = BDT_10031_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10031_Wache_Hi_Condition;
	information = DIA_Addon_10031_Wache_Hi_Info;
	permanent   = TRUE;
	description = "Wszystko w porz�dku?";
};
FUNC INT DIA_Addon_10031_Wache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10031_Wache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10031_Wache_Hi_15_00");//Wszystko w porz�dku?
	
	if (Sklaven_Flucht == TRUE)
	&& (Wache_Joker == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_01");//Oj, ch�opcze, niewolnicy na pewno si� spiesz�.
		AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_02");//Gdy dowiedzieli si�, �e zostan� uwolnieni, kiedy tylko sko�cz�, zacz�li uwija� si� jak mr�wki!
		Wache_Joker = TRUE;
	};
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_03");//Tak. Nie r�b problem�w, to wszystko b�dzie w porz�dku.
	
};
