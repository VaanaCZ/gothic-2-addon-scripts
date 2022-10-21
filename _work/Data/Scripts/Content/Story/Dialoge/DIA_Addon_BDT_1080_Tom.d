//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_EXIT   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 999;
	condition   = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tom_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Tom_PICKPOCKET (C_INFO)
{
	npc			= BDT_1080_Addon_Tom;
	nr			= 900;
	condition	= DIA_Addon_Tom_PICKPOCKET_Condition;
	information	= DIA_Addon_Tom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Tom_PICKPOCKET_Condition()
{
	C_Beklauen (40, 52);
};
 
FUNC VOID DIA_Addon_Tom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
	
func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_HI   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 1;
	condition   = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent   = FALSE;
	description = "Dlaczego tu siedzisz?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //Dlaczego tu siedzisz?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //Mam troch� k�opot�w. Powr�t do obozu nie by�by teraz najlepszym wyj�ciem.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //Co si� sta�o?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //Mia�em ca�kiem niez�e kontakty z piratami, wiesz?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Zawsze spotykali�my si� nieopodal obozu, �eby pohandlowa�.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //Ch�opie, kupowa�em graty dla po�owy ludzi z obozu. "Tom, za�atw mi to, Tom za�atw mi tamto".
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //A ten bydlak Esteban wszystko zrujnowa�!
};
//---------------------------------------------------------------------
//	Info Juan
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Juan   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 2;
	condition   = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent   = FALSE;
	description = "W jaki spos�b?";
};
FUNC INT DIA_Addon_Tom_Juan_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Juan_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Juan_15_00"); //W jaki spos�b?
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban wys�a� jednego ze swoich ludzi, Juana. Kole� obserwowa� nas.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //A p�niej, jak omawia�em interes z piratami, wyszed� z ciemno�ci i ich pobi�.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //Ch�opie, ale ten go�� by� szybki! Na szcz�cie zdo�a�em uciec.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"A wi�c to Juan jest odpowiedzialny za zab�jstwo Hanka i Angusa. Urz�dzi� na nich zasadzk�, a nast�pnie zamordowa�.");
};

//---------------------------------------------------------------------
//	Info Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Esteban   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 3;
	condition   = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent   = FALSE;
	description = "I od tamtej pory si� tu ukrywasz?";
};
FUNC INT DIA_Addon_Tom_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_Juan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Esteban_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //I od tamtej pory si� tu ukrywasz?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Najpierw wr�ci�em do obozu i powiedzia�em Fiskowi, Huno i innym ch�opakom, �eby nie spodziewali si� dostawy.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //I �e mog� za to podzi�kowa� Estebanowi.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Je�li Esteban dowie si�, kto doni�s� ch�opakom, �e to on za tym stoi, b�d� martwy.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_04"); //Dlatego nie wracam do obozu.
	
	Tom_tells = TRUE;
};

//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Dead   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 4;
	condition   = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent   = FALSE;
	description = "Esteban nie �yje.";
};
FUNC INT DIA_Addon_Tom_Dead_Condition()
{	
	if (Npc_IsDead (Esteban))
	&& (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Dead_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Esteban nie �yje.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //Naprawd�? Ch�opie, TO si� nazywa mie� szcz�cie.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //Kto go zabi�?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //Powiedzmy, �e kto�, kogo znasz...
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Dzi�kuj�, �e tu przyszed�e�. Teraz mog� wr�ci� do obozu...
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"LAGER");
};

//---------------------------------------------------------------------
// PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_PERM   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 5;
	condition   = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent   = TRUE;
	description = "Co� jeszcze?";
};
FUNC INT DIA_Addon_Tom_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_PERM_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //Co� jeszcze?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Teraz b�d� m�g� si� cieszy� gorza�� Lucii.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //W ko�cu mog� wr�ci�!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //H�? Przewa�nie siedz� tutaj i licz� kamienie...
		};
	};
};




