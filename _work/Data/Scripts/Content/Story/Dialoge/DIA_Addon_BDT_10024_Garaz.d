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
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Poczekaj chwilê.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//Jakiœ problem?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Pe³zacz. A w zasadzie kilka. Wygl¹da na to, ¿e trafiliœmy na gniazdo.
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
	description = "Dlaczego nie zaatakujemy pe³zaczy?";
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
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//Dlaczego nie zaatakujemy pe³zaczy?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//Te¿ siê nad tym zastanawiam. Stra¿nicy maj¹ najwyraŸniej "wa¿niejsze rzeczy do roboty".
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//A teraz Bloodwyn kaza³ mi rozwi¹zaæ ten problem.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Rozumiem, ¿e nie zamierzasz walczyæ z pe³zaczami?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//A powinienem? Po to, ¿ebyœmy mogli po³o¿yæ ³apska na z³ocie w tej jaskini?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Bloodwyn i tak zabierze wiêkszoœæ. A ja nie zamierzam nadstawiaæ karku za tê odrobinê, która zostanie.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//A, jeœli TY chcesz z nimi walczyæ - proszê bardzo. Tylko nie œci¹gnij ich tu, na górê.
	
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
	description = "Jest coœ jeszcze, co mo¿esz mi powiedzieæ o Bloodwynie?";
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
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//Jest coœ jeszcze, co mo¿esz mi powiedzieæ o Bloodwynie?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Tak, to chciwy sukinsyn. Sprawdza ka¿d¹ ¿y³kê z³ota i z³o¿e.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//Dla niego wa¿ne jest tylko z³oto. Nas ma w g³êbokim poszanowaniu.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//Coœ jeszcze?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Uwa¿a siê za najlepszego. Bloodwyn nie mo¿e znieœæ nikogo, kto jest od niego lepszy. Oczywiœcie ja nie powa¿y³bym siê rzuciæ mu wyzwania.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Najlepiej go unikaæ - chyba ¿e naprawdê chcesz go wkurzyæ.
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn na pewno opuœci œwi¹tyniê, jeœli us³yszy plotki o nowym z³o¿u z³ota znalezionym w kopalni.");
	B_LogEntry (Topic_Addon_Tempel,"Kiedy Bloodwyn siê zdenerwuje, traci nad sob¹ panowanie. Ta wiedza na pewno mi siê przyda."); 
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
	description	= "Za³atwione. Pe³zacze s¹ martwe.";
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
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//Za³atwione. Pe³zacze s¹ martwe.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn tu idzie. Tego chcia³eœ, prawda?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//Zabi³eœ pe³zacza, ¿eby œci¹gn¹æ tu Bloodwyna? No to TERAZ zrób to, co zamierza³eœ.
	
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
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//Da³eœ temu bydlakowi nauczkê. Dobra robota.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//W takim razie rozejrzê siê po okolicy.
	
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
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//O rany, sporo tu tego z³ota.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//Bêdziemy potrzebowaæ drabiny, ¿eby dotrzeæ do tego z³ota.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Tylko ¿e nikt nie korzysta z drabin od czasu upadku bariery.. Szkoda.
};




