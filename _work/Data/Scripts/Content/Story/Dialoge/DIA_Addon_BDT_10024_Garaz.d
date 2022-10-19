//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Poczekaj chwil�.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//Jaki� problem?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Pe�zacz. A w zasadzie kilka. Wygl�da na to, �e trafili�my na gniazdo.
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "Dlaczego nie zaatakujemy pe�zaczy?";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//Dlaczego nie zaatakujemy pe�zaczy?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//Te� si� nad tym zastanawiam. Stra�nicy maj� najwyra�niej "wa�niejsze rzeczy do roboty".
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//A teraz Bloodwyn kaza� mi rozwi�za� ten problem.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Rozumiem, �e nie zamierzasz walczy� z pe�zaczami?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//A powinienem? Po to, �eby�my mogli po�o�y� �apska na z�ocie w tej jaskini?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Bloodwyn i tak zabierze wi�kszo��. A ja nie zamierzam nadstawia� karku za t� odrobin�, kt�ra zostanie.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//A, je�li TY chcesz z nimi walczy� - prosz� bardzo. Tylko nie �ci�gnij ich tu, na g�r�.
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "Jest co� jeszcze, co mo�esz mi powiedzie� o Bloodwynie?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//Jest co� jeszcze, co mo�esz mi powiedzie� o Bloodwynie?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Tak, to chciwy sukinsyn. Sprawdza ka�d� �y�k� z�ota i z�o�e.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//Dla niego wa�ne jest tylko z�oto. Nas ma w g��bokim poszanowaniu.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//Co� jeszcze?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Uwa�a si� za najlepszego. Bloodwyn nie mo�e znie�� nikogo, kto jest od niego lepszy. Oczywi�cie ja nie powa�y�bym si� rzuci� mu wyzwania.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Najlepiej go unika� - chyba �e naprawd� chcesz go wkurzy�.
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn na pewno opu�ci �wi�tyni�, je�li us�yszy plotki o nowym z�o�u z�ota znalezionym w kopalni.");
	B_LogEntry (Topic_Addon_Tempel,"Kiedy Bloodwyn si� zdenerwuje, traci nad sob� panowanie. Ta wiedza na pewno mi si� przyda."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "Za�atwione. Pe�zacze s� martwe.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//Za�atwione. Pe�zacze s� martwe.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn tu idzie. Tego chcia�e�, prawda?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//Zabi�e� pe�zacza, �eby �ci�gn�� tu Bloodwyna? No to TERAZ zr�b to, co zamierza�e�.
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//Da�e� temu bydlakowi nauczk�. Dobra robota.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//W takim razie rozejrz� si� po okolicy.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//O rany, sporo tu tego z�ota.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//B�dziemy potrzebowa� drabiny, �eby dotrze� do tego z�ota.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Tylko �e nikt nie korzysta z drabin od czasu upadku bariery.. Szkoda.
};




