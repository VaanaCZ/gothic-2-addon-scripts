//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10026_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10026_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10026_Wache_EXIT_Condition;
	information = DIA_Addon_10026_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10026_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10026_Wache_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10026_Wache_Hi   (C_INFO)
{
	npc         = BDT_10026_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10026_Wache_Hi_Condition;
	information = DIA_Addon_10026_Wache_Hi_Info;
	permanent   = TRUE;
	description = "Wie sieht's aus?";
};
FUNC INT DIA_Addon_10026_Wache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10026_Wache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10026_Wache_Hi_15_00");//Wie sieht's aus?
	
	if (Sklaven_Flucht == FALSE)
	{	
		CreateInvItems (self, ItFo_Bacon,1);
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_01");//Schade, dass wir nur noch so wenig Sklaven haben. Wir m�ssen bald mal neue holen.
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_02");//Die Typen sind schon v�llig kaputt. Liegt wohl daran, dass sie so wenig zu fressen kriegen. (lacht)
		B_UseItem (self, ItFo_Bacon);
		
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_03");//Aber eher schicke ich die Buddler wieder an die Arbeit, als dass ich den Hunden ein St�ck Fleisch abgebe.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Hi_13_04");//Die Sklaven sind weg - schade. Naja, dann m�ssen wir halt wieder die Buddler schlagen.
	};
	AI_StopProcessInfos (self);
};

//----------------------------------------------------------------------
//	Info Gruft
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10026_Wache_Gruft   (C_INFO)
{
	npc         = BDT_10026_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10026_Wache_Gruft_Condition;
	information = DIA_Addon_10026_Wache_Gruft_Info;
	permanent   = TRUE;
	description = "Wei�t du was �ber die Gruft?";
};
FUNC INT DIA_Addon_10026_Wache_Gruft_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10026_Wache_Gruft_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10026_Wache_Gruft_15_00");//Wei�t du was �ber die Gruft?
	AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Gruft_13_01");//Ja. Die Gruft liegt hinten in diesem Gang.
	AI_Output (self, other, "DIA_Addon_BDT_10026_Wache_Gruft_13_02");//(unber�hrt) Immer den Leichen nach, dann wirst du sie schon finden.
};



