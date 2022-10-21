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
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_00");//Hey, willst du buddeln gehen? Dann vergiss nicht, dich bei Scatty einzudecken.
	AI_Output (other, self, "DIA_Addon_BDT_10031_Wache_Scatty_15_01");//Was brauche ich denn?
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_02");//Nun zumindest 'ne Spitzhacke. Etwas Proviant kann auch nicht schaden.
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Scatty_06_03");//Oder wie wäre es mit Heiltränken? Da unten gibt's Minecrawler.
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
	description = "Alles klar?";
};
FUNC INT DIA_Addon_10031_Wache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10031_Wache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10031_Wache_Hi_15_00");//Alles klar?
	
	if (Sklaven_Flucht == TRUE)
	&& (Wache_Joker == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_01");//Junge, Junge. Die Sklaven hatten es aber ziemlich eilig.
		AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_02");//Als sie gehört haben, dass sie frei sind, sind sie gerannt wie die Hasen!
		Wache_Joker = TRUE;
	};
	AI_Output (self, other, "DIA_Addon_BDT_10031_Wache_Hi_06_03");//Ja. Also mach keinen Ärger, dann bleibt auch alles klar.
	
};
