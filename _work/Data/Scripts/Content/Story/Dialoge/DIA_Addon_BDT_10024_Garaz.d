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
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Poczekaj chwilę.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//Jakiś problem?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Pełzacz. A w zasadzie kilka. Wygląda na to, że trafiliśmy na gniazdo.
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
	description = "Dlaczego nie zaatakujemy pełzaczy?";
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
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//Dlaczego nie zaatakujemy pełzaczy?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//Też się nad tym zastanawiam. Strażnicy mają najwyraźniej "ważniejsze rzeczy do roboty".
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//A teraz Bloodwyn kazał mi rozwiązać ten problem.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Rozumiem, że nie zamierzasz walczyć z pełzaczami?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//A powinienem? Po to, żebyśmy mogli położyć łapska na złocie w tej jaskini?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Bloodwyn i tak zabierze większość. A ja nie zamierzam nadstawiać karku za tę odrobinę, która zostanie.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//A, jeśli TY chcesz z nimi walczyć - proszę bardzo. Tylko nie ściągnij ich tu, na górę.
	
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
	description = "Jest coś jeszcze, co możesz mi powiedzieć o Bloodwynie?";
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
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//Jest coś jeszcze, co możesz mi powiedzieć o Bloodwynie?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Tak, to chciwy sukinsyn. Sprawdza każdą żyłkę złota i złoże.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//Dla niego ważne jest tylko złoto. Nas ma w głębokim poszanowaniu.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//Coś jeszcze?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Uważa się za najlepszego. Bloodwyn nie może znieść nikogo, kto jest od niego lepszy. Oczywiście ja nie poważyłbym się rzucić mu wyzwania.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Najlepiej go unikać - chyba że naprawdę chcesz go wkurzyć.
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn na pewno opuści świątynię, jeśli usłyszy plotki o nowym złożu złota znalezionym w kopalni.");
	B_LogEntry (Topic_Addon_Tempel,"Kiedy Bloodwyn się zdenerwuje, traci nad sobą panowanie. Ta wiedza na pewno mi się przyda."); 
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
	description	= "Załatwione. Pełzacze są martwe.";
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
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//Załatwione. Pełzacze są martwe.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn tu idzie. Tego chciałeś, prawda?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//Zabiłeś pełzacza, żeby ściągnąć tu Bloodwyna? No to TERAZ zrób to, co zamierzałeś.
	
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
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//Dałeś temu bydlakowi nauczkę. Dobra robota.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//W takim razie rozejrzę się po okolicy.
	
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
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//O rany, sporo tu tego złota.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//Będziemy potrzebować drabiny, żeby dotrzeć do tego złota.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Tylko że nikt nie korzysta z drabin od czasu upadku bariery.. Szkoda.
};




