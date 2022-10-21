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
	AI_Output (self, other, "DIA_Addon_Lucia_Hi_16_01");//Poslyö, jestli chceö nÏco k jÌdlu, zajdi za Snafem. A jestli chceö nÏco k pitÌ, pak seö na spr·vn˝m mÌstÏ.
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
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_01");//Piva uû m·me jenom trochu. Jedin˝ pivo na ostrovÏ sem p¯inesli paladinovÈ.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_02");//Jedin· dobr· vÏc, kterou s sebou ti chlapi p¯inesli.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_03");//Jinak tu pijeme, co teËe. M·m tu p·lenku, ko¯alku a bÌlej rum...
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_04");//(vdÏËnÏ) Hmm... TOHLE bys mÏl vyzkouöet ñ m·m recept od Samuela. Ten staroch se fakt vyzn·.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Lucia mi m˘ûe prodat nÏjakou ko¯alku.");
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
	description = "Nepoch·zÌö n·hodou z Khorinidu?";
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
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_01");//Ani mi to nep¯ipomÌnej! V tom mÏstÏ byl p¯Ìöernej ûivot.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_02");//Dokud tam jeötÏ p¯ijÌûdÏly lodÏ s novejma trestancema, byl tam aspoÚ ruch.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_03");//Ale ti druzÌ chlapi... (smÏje se) Ne, dÌky. Moûn· je to tÌm, ûe jsme na ostrovÏ... no, uû je to stejnÏ pryË.

	if (MIS_LuciasLetter != 0)
	|| (SC_KnowsLuciaCaughtByBandits != 0)
	|| (Nadja_GaveLuciaInfo != 0)
	{
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_06"); //S Elvrichem uû jsem skonËila!
		AI_Output (other,self , "DIA_Addon_Lucia_Khorinis_15_04"); //ProË?
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_05"); //Je to mÏkkota! Kdyû mÏ banditi un·öeli, nehnul pro mÏ ani prstem!
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
	description = "Co chceö dÏlat?";
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
	AI_Output (other, self, "DIA_Addon_Lucia_Jetzt_15_00");//Co chceö dÏlat?
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_01");//UvidÌme. ProzatÌm tu z˘stanu se Snafem, Fiskem a ostatnÌma.
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_02");//Uû jsi mluvil s Thorusem? (obr·tÌ oËi v sloup) P¯i Innosovi, to je ale kus chlapa!
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_03");//(smÏje se) PromiÚ, radöi se vr·tÌme k vÏci. Nem·m û·dnej cÌl, jen se tak nech·v·m un·öet.
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
	description = "Ty ty paladiny zrovna v l·sce nem·ö, co?";
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
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_15_00");//Ty paladiny moc r·da nem·ö, co?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_01");//Ty fanatick˝ vrahouny, co si nech·vaj platit od ohnivejch m·g˘? Ne.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_02");//Ten lord Hagen s tou svojÌ sebrankou obsadili cel˝ mÏsto a vöichni se jim klanÏj.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_03");//Ale j· to dÏlat nechtÏla. NemÌnila jsem Ëekat, aû zav¯ou i »ervenou lucernu a vsadÌ mÏ do ûelez.
	
	if (Npc_GetTrueGuild (other) != GIL_SLD)
	&& (Npc_GetTrueGuild (other) != GIL_DJG)
	{
		Info_ClearChoices (DIA_Addon_Lucia_Paladine);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"UkonËit rozhovor.",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"PaladinovÈ nebojujÌ jeho jmÈnem. Innos si svÈ v·leËnÌky vybÌr· s·m.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"PaladinovÈ jsou Innosov˝mi v·leËnÌky, û·dnÌ vrahovÈ.",DIA_Addon_Lucia_Paladine_MURDER);
		
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WAHL_15_00");//PaladinovÈ jen nebojujÌ v InnosovÏ jmÈnu. To on s·m si vybÌr· svÈ bojovnÌky.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_01");//V·ûnÏ? A j· si myslÌm, ûe se ti lidi vybÌrajÌ sami.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_02");//Ale trochu mÏ udivujeö ñ mluvÌö, jako bys byl jednÌm z nich.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Uû jsi nÏkdy nÏkoho zabila?",DIA_Addon_Lucia_Paladine_KILL);
};
FUNC VOID DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_KILL_15_00");//Uû jsi nÏkdy nÏkoho zabila?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_01");//Ne, a jsem fakt r·da.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_02");//ProsÌm, uû nikdy nemluv tak v·ûnÏ.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_03");//Dej si radöi nÏco k pitÌ a vychutnej si kaûd˝ okamûik, kter˝ n·m bohovÈ d·vajÌ.
	
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WEIB_15_00");//Ty tedy odmÌt·ö Innose, ûenötino?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_01");//Jak bych mohla? To jenom lidi zneuûÌvajÌ jeho jmÈno.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_02");//J· nikdy o InnosovÏ boûstvÌ ani na okamûik nezapochybovala.
};
FUNC VOID DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_MURDER_15_00");//PaladinovÈ jsou Innosovi v·leËnÌci, û·dnÌ vrazi.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_01");//V·ûnÏ? Vûdyù majÌ na meËÌch taky krev ñ ˙plnÏ stejnÏ jako pir·ti nebo banditi.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_02");//Jedinej rozdÌl je, ûe vraûdÏj v InnosovÏ jmÈnu a ne proto, aby p¯eûili.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Ty nevÏ¯Ìö v Innose?",DIA_Addon_Lucia_Paladine_WEIB);
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
	AI_Output (self, other, "DIA_Addon_Lucia_Attentat_16_00");//V˘bec nic.
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
	description = "R·d bych si dal nÏco k pitÌ.";
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
	AI_Output (other, self, "DIA_Addon_Lucia_Trade_15_00");//Dej mi nÏco k pitÌ.
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
	description = "M˘ûeö mÏ nÏËemu nauËit?";
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
	AI_Output (other, self, "DIA_Addon_Lucia_lernen_15_00");//M˘ûeö mÏ nÏËemu nauËit?
	AI_Output (self, other, "DIA_Addon_Lucia_lernen_16_01");//(smÏje se) Moc r·da. M˘ûeö se u mÏ pocviËit v obratnosti.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Lucia mi pom˘ûe vylepöit obratnost.");	
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
	description	 = 	"ChtÏl bych b˝t o nÏco obratnÏjöÌ.";
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
	AI_Output (other, self, "DIA_Addon_Lucia_TEACH_15_00"); //Chci b˝t obratnÏjöÌ.
	
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



