//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_NW_EXIT   (C_INFO)
{
	npc         = STRF_1123_Addon_Patrick_NW;
	nr          = 999;
	condition   = DIA_Addon_Patrick_NW_EXIT_Condition;
	information = DIA_Addon_Patrick_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Patrick_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Patrick_NW_PICKPOCKET (C_INFO)
{
	npc			= STRF_1123_Addon_Patrick_NW;
	nr			= 900;
	condition	= DIA_Addon_Patrick_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Patrick_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Patrick_NW_PICKPOCKET_Condition()
{
	C_Beklauen (35, 50);
};
 
FUNC VOID DIA_Addon_Patrick_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Patrick_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Patrick_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Patrick_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Patrick_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Patrick_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Patrick_NW_PICKPOCKET);
};
	
func void DIA_Addon_Patrick_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Patrick_NW_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_NW_Hi   (C_INFO)
{
	npc         = STRF_1123_Addon_Patrick_NW;
	nr          = 2;
	condition   = DIA_Addon_Patrick_NW_Hi_Condition;
	information = DIA_Addon_Patrick_NW_Hi_Info;
	permanent   = FALSE;
	description = "Takže už je ti dobře?";
};
FUNC INT DIA_Addon_Patrick_NW_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_NW_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_NW_Hi_15_00");//Tak co, je všecko v pořádku?
	AI_Output (self, other, "DIA_Addon_Patrick_NW_Hi_07_01");//Všecko je fajn. Vodní mágové nás bezpečně odvedli z toho proklatýho údolí.
	AI_Output (other, self, "DIA_Addon_Patrick_NW_Hi_15_02");//A co budeš dělat teď?
	AI_Output (self, other, "DIA_Addon_Patrick_NW_Hi_07_03");//Budu dál bojovat za Leeho. A jednou snad opustíme tenhle ostrov.
	AI_Output (other, self, "DIA_Addon_Patrick_NW_Hi_15_04");//A pak?
	AI_Output (self, other, "DIA_Addon_Patrick_NW_Hi_07_05");//Uvidíme. Pokud je ještě pořád válka, půjdem proti skřetům, ale to se uvidí.
};





