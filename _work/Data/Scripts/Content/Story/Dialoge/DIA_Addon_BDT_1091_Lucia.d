//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_EXIT   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 999;
	condition   = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lucia_PICKPOCKET (C_INFO)
{
	npc			= BDT_1091_Addon_Lucia;
	nr			= 900;
	condition	= DIA_Addon_Lucia_PICKPOCKET_Condition;
	information	= DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80_Female;
};                       
FUNC INT DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	C_Beklauen (80, 100);
};
 
FUNC VOID DIA_Addon_Lucia_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
	
func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Hi   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent   = FALSE;
	description = "No? Jak to jde?";
};
FUNC INT DIA_Addon_Lucia_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Hi_15_00");//Tak co? Jak to jde?
	AI_Output (self, other, "DIA_Addon_Lucia_Hi_16_01");//Poslyš, jestli chceš nęco k jídlu, zajdi za Snafem. A jestli chceš nęco k pití, pak seš na správným místę.
};
//---------------------------------------------------------------------
//	Info was
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_was   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent   = FALSE;
	description = "Tak co tu teda pijete?";
};
FUNC INT DIA_Addon_Lucia_was_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_was_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_was_15_00");//Tak co tu teda pijete?
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_01");//Piva už máme jenom trochu. Jediný pivo na ostrovę sem pâinesli paladinové.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_02");//Jediná dobrá vęc, kterou s sebou ti chlapi pâinesli.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_03");//Jinak tu pijeme, co teče. Mám tu pálenku, koâalku a bílej rum...
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_04");//(vdęčnę) Hmm... TOHLE bys męl vyzkoušet – mám recept od Samuela. Ten staroch se fakt vyzná.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Lucia mi může prodat nęjakou koâalku.");
};
//---------------------------------------------------------------------
//	Info Khorinis
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Khorinis   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent   = FALSE;
	description = "Nepocházíš náhodou z Khorinidu?";
};
FUNC INT DIA_Addon_Lucia_Khorinis_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Bromor_Lucia)
	|| (Nadja_GaveLuciaInfo == TRUE)
	|| Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Khorinis_15_00");//Copak ty nejsi z Khorinidu?
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_01");//Ani mi to nepâipomínej! V tom męstę byl pâíšernej život.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_02");//Dokud tam ještę pâijíždęly lodę s novejma trestancema, byl tam aspoŕ ruch.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_03");//Ale ti druzí chlapi... (smęje se) Ne, díky. Možná je to tím, že jsme na ostrovę... no, už je to stejnę pryč.

	if (MIS_LuciasLetter != 0)
	|| (SC_KnowsLuciaCaughtByBandits != 0)
	|| (Nadja_GaveLuciaInfo != 0)
	{
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_06"); //S Elvrichem už jsem skončila!
		AI_Output (other,self , "DIA_Addon_Lucia_Khorinis_15_04"); //Proč?
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_05"); //Je to mękkota! Když mę banditi unášeli, nehnul pro mę ani prstem!
		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP (XP_Ambient);
	};
	TOPIC_END_Lucia = TRUE;
};
//---------------------------------------------------------------------
//	Info Jetzt
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Jetzt   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent   = FALSE;
	description = "Co chceš dęlat?";
};
FUNC INT DIA_Addon_Lucia_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Khorinis)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Jetzt_15_00");//Co chceš dęlat?
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_01");//Uvidíme. Prozatím tu zůstanu se Snafem, Fiskem a ostatníma.
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_02");//Už jsi mluvil s Thorusem? (obrátí oči v sloup) Pâi Innosovi, to je ale kus chlapa!
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_03");//(smęje se) Promiŕ, radši se vrátíme k vęci. Nemám žádnej cíl, jen se tak nechávám unášet.
};
//---------------------------------------------------------------------
//	Info Paladine
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Paladine   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent   = FALSE;
	description = "Ty ty paladiny zrovna v lásce nemáš, co?";
};
FUNC INT DIA_Addon_Lucia_Paladine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_15_00");//Ty paladiny moc ráda nemáš, co?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_01");//Ty fanatický vrahouny, co si nechávaj platit od ohnivejch mágů? Ne.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_02");//Ten lord Hagen s tou svojí sebrankou obsadili celý męsto a všichni se jim klanęj.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_03");//Ale já to dęlat nechtęla. Nemínila jsem čekat, až zavâou i Červenou lucernu a vsadí mę do želez.
	
	if (Npc_GetTrueGuild (other) != GIL_SLD)
	&& (Npc_GetTrueGuild (other) != GIL_DJG)
	{
		Info_ClearChoices (DIA_Addon_Lucia_Paladine);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Ukončit rozhovor.",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Paladinové nebojují jeho jménem. Innos si své válečníky vybírá sám.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Paladinové jsou Innosovými válečníky, žádní vrahové.",DIA_Addon_Lucia_Paladine_MURDER);
		
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WAHL_15_00");//Paladinové jen nebojují v Innosovę jménu. To on sám si vybírá své bojovníky.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_01");//Vážnę? A já si myslím, že se ti lidi vybírají sami.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_02");//Ale trochu mę udivuješ – mluvíš, jako bys byl jedním z nich.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Už jsi nękdy nękoho zabila?",DIA_Addon_Lucia_Paladine_KILL);
};
FUNC VOID DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_KILL_15_00");//Už jsi nękdy nękoho zabila?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_01");//Ne, a jsem fakt ráda.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_02");//Prosím, už nikdy nemluv tak vážnę.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_03");//Dej si radši nęco k pití a vychutnej si každý okamžik, který nám bohové dávají.
	
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WEIB_15_00");//Ty tedy odmítáš Innose, ženštino?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_01");//Jak bych mohla? To jenom lidi zneužívají jeho jméno.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_02");//Já nikdy o Innosovę božství ani na okamžik nezapochybovala.
};
FUNC VOID DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_MURDER_15_00");//Paladinové jsou Innosovi válečníci, žádní vrazi.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_01");//Vážnę? Vždyă mají na mečích taky krev – úplnę stejnę jako piráti nebo banditi.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_02");//Jedinej rozdíl je, že vraždęj v Innosovę jménu a ne proto, aby pâežili.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Ty nevęâíš v Innose?",DIA_Addon_Lucia_Paladine_WEIB);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Attentat   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 9;
	condition   = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Lucia_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Lucia_Attentat_16_00");//Vůbec nic.
};
//---------------------------------------------------------------------
//	Info Trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Trade   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 99;
	condition   = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = "Rád bych si dal nęco k pití.";
};
FUNC INT DIA_Addon_Lucia_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Trade_15_00");//Dej mi nęco k pití.
	B_GiveTradeInv(self);
};
//---------------------------------------------------------------------
//	Info lernen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_lernen   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 19;
	condition   = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent   = FALSE;
	description = "Můžeš mę nęčemu naučit?";
};
FUNC INT DIA_Addon_Lucia_lernen_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_lernen_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_lernen_15_00");//Můžeš mę nęčemu naučit?
	AI_Output (self, other, "DIA_Addon_Lucia_lernen_16_01");//(smęje se) Moc ráda. Můžeš se u mę pocvičit v obratnosti.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Lucia mi pomůže vylepšit obratnost.");	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lucia_TEACH		(C_INFO)
{
	npc		  	 = 	BDT_1091_Addon_Lucia;
	nr			 = 	101;
	condition	 = 	DIA_Addon_Lucia_TEACH_Condition;
	information	 = 	DIA_Addon_Lucia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtęl bych být o nęco obratnęjší.";
};
func int DIA_Addon_Lucia_TEACH_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_lernen)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lucia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lucia_TEACH_15_00"); //Chci být obratnęjší.
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
};
func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_TEACH);
};
func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};
func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};



