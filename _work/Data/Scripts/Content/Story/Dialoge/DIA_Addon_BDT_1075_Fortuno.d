///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_EXIT   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 999;
	condition   = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fortuno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1075_Addon_Fortuno;
	nr			= 900;
	condition	= DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information	= DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	C_Beklauen (10, 25);
};
 
FUNC VOID DIA_Addon_Fortuno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
	
func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Hi   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent   = TRUE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fortuno_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Fortuno_Geheilt_01 == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_Info()
{
	if (Fortuno_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_00");//Czarna chmura nad domem... ON nadchodzi....
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//Krwi¹... Przyzywa³em go... ON, który mnie obserwuje... Och, nie, odejdŸ, zostaw mnie...
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//Dobrze siê czujesz?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"Fortuno postrada³ zmys³y. Szuka 'zielonego nowicjusza'.");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//Zielony... Zielony nowicjusz... Nie mogê go znaleŸæ...
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Wrócê póŸniej... (KONIEC)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Jak mogê ci pomóc?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Masz, weŸ to bagienne ziele.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if Npc_HasItems (other, ItMi_Addon_Joint_01 ) >= 1
	{ 
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Dobrze, spróbuj tego zielonego nowicjusza.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//Jak mogê ci pomóc?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//Zielony... Zielony nowicjusz pomaga nowicjuszowi...
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//Masz, weŸ to bagienne ziele.
	
	if B_GiveInvItems (other, self,ItMi_Joint,1)
	{
		AI_UseItem (self, ItMI_Joint);
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01");//Nie zielony ani nie silny, nie zielony, nie silny...
};
FUNC VOID DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00");//Dobrze, spróbuj tego zielonego nowicjusza.
	
	if B_GiveInvItems (other, self,ItMi_Addon_Joint_01,1)
	{
		AI_UseItem (self, ItMI_Addon_Joint_01);
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01");//AAACH...
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//Moja g³owa... Kim... Jestem... Fortuno... Co... Co siê dzieje?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"Zielony nowicjusz przywróci³ zmys³y Fortuna.");
};


///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_wer   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent   = FALSE;
	description	= "Dobrze, a teraz powiedz mi, co z tob¹.";
};
FUNC INT DIA_Addon_Fortuno_wer_Condition()
{	
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_wer_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//Dobrze, a teraz powiedz mi, co z tob¹.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//By³em kiedyœ cz³onkiem Bractwa Œni¹cego. Wtedy wszystko by³o jeszcze w porz¹dku.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//Tak, wszyscy byliœmy skazanymi przestêpcami, ale ¿ycie dla nas - nowicjuszy - nie by³o takie z³e...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//Hej, ja te¿ by³em wiêŸniem w Górniczej Dolinie. Powiedz mi coœ, czego nie wiem.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//Ja... Nic nie pamiêtam. Ciemnoœæ przes³ania mój umys³.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//Spróbuj siê skoncentrowaæ. Co siê sta³o? Jak odzyska³eœ œwiadomoœæ?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//Kruk... Pamiêtam tylko Kruka i... ciemne pomieszczenia.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//O co chodzi z Krukiem? Co on ci zrobi³?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//Przepraszam. Czujê siê, jakby mój umys³ nie by³ wolny... Sam tego nie rozumiem...
};
///////////////////////////////////////////////////////////////////////
//	Info FREE
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_FREE   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 5;
	condition   = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent   = FALSE;
	description	= "Musi byæ jakiœ sposób, ¿eby przywróciæ ci wspomnienia.";
};
FUNC INT DIA_Addon_Fortuno_FREE_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_wer)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//Musi byæ jakiœ sposób, ¿eby przywróciæ ci wspomnienia.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//Hmm... Mo¿e jest sposób.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//Guru znali sztukê koncentracji i manipulacji umys³em.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//A TY wiesz coœ o tych rzeczach?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//Nie, obawiam siê, ¿e ta wiedza zaginê³a...
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//Cholera. Je¿eli jest jakiœ sposób na uwolnienie twojego umys³u, to go znajdê.

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"Fortuno wróci³ do zmys³ów, ale niczego nie pamiêta.");
};
///////////////////////////////////////////////////////////////////////
//	Info Herb
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Herb   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 99;
	condition   = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent   = FALSE;
	description	= "Potrzebujesz wiêcej bagiennego ziela?";
};
FUNC INT DIA_Addon_Fortuno_Herb_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//Potrzebujesz wiêcej bagiennego ziela?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//Taaak, potrzebujê tyle ziela, ile tylko zdo³asz przynieœæ.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//Zap³acê ci lepiej ni¿ Fisk.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(Oddaj ca³e bagienne ziele)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(Oddaj 1 bagienne ziele)",DIA_Addon_Fortuno_Trade_1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Trade (kein Trade Modul!)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trade   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 100;
	condition   = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent   = TRUE;
	description	= "Mam dla ciebie bagienne ziele...";
};
FUNC INT DIA_Addon_Fortuno_Trade_Condition()
{	
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	&& Npc_KnowsInfo (other, DIA_Addon_Fortuno_Herb)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trade_15_00");//Mam dla ciebie bagienne ziele...
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
};
FUNC VOID DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems (other, Itpl_Swampherb);
	
	if B_GiveInvItems (other, self, ITPL_Swampherb, amount)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, amount * Value_SwampHerb);
	
	B_GivePlayerXP (amount * 10);
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_1()
{
	if B_GiveInvItems (other, self, ITPL_Swampherb, 1)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, Value_SwampHerb);
	
	B_GivePlayerXP (10);
	B_Fortuno_InfoManager();
};

///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trank   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 3;
	condition   = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent   = FALSE;
	description	= "Mam dla ciebie miksturê. Powinna pomóc ci odzyskaæ pamiêæ.";
};
FUNC INT DIA_Addon_Fortuno_Trank_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	&&   Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE)
	&& ((Npc_HasItems (other, ItPo_Addon_Geist_01) >= 1)
	||  (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//Mam dla ciebie miksturê. Powinna pomóc ci odzyskaæ pamiêæ.
	AI_Output (self, other, "DIA_Addon_Fortuno_Trank_13_01");//Ufam ci.
	
	if (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1)//der richtige
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_02,1)
		{
			AI_UseItem (self, ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP (XP_Addon_Fortuno_02);
		
	}
	else
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_01,1)//der...äh...tödliche
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
			AI_StopProcessInfos (self);
			AI_UseItem (self, ItPo_Addon_Geist_01);
		};
	};
};
///////////////////////////////////////////////////////////////////////
//	Info No more Secrets
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_more   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent   = FALSE;
	description	= "No i jak?";
};
FUNC INT DIA_Addon_Fortuno_more_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_more_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_00");//No i jak?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//Ach! Teraz... Teraz pamiêtam... Adanosie, pomó¿... Co ja uczyni³em?
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//Tak, co zrobi³eœ? A co wa¿niejsze, co zrobi³ Kruk?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//Pomog³em mu... nawi¹zaæ kontakt. Z NIM. Potrzebowa³ wielu eliksirów... Uwarzy³em je dla niego.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//Próbowa³ otworzyæ portal, aby dostaæ siê do œwi¹tyni.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//Po co? Czego on chce ze œwi¹tyni?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//Jest tam potê¿ny artefakt... Pogrzebany wraz ze swym ostatnim w³aœcicielem. Potê¿nym wojownikiem, który wykonywa³ JEGO wolê...
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//Co dalej?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//Nie uda³o nam siê otworzyæ portalu.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//Kruk jednak dowiedzia³ siê, ¿e ZDO£A go otworzyæ, jeœli odkopie kryptê kap³ana.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//Dlatego œci¹gn¹³ tu tych wszystkich niewolników. Ofiary, które zmusi³ do kopania w miejscu, gdzie odpoczywaj¹ si³y czasu.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//Kryptê kap³ana?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//Grobowiec kap³ana Adanosa znajduje siê w kopalni.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//Przypominam sobie te¿ kamienne tabliczki. Kruk wierzy³, ¿e wska¿¹ mu drogê.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//Gdy tylko zdo³a³ odcyfrowaæ inskrypcje, sta³em siê zbêdny.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//Rzuci³ na mnie zaklêcie, które sprawi³o, ¿e wszystko zapomnia³em. A ty mnie uwolni³eœ.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Kruk chce wydobyæ potê¿ny artefakt ze œwi¹tyni Adanosa."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Z jakiegoœ powodu Kruk rozkopa³ w kopalni z³ota grób jednego z kap³anów prastarej kultury."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Kruk s¹dzi, ¿e w realizacji jego planu pomog¹ jakieœ kamienne tablice."); 
	
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Addon_Fortuno_03);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fortuno_Attentat   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 9;
	condition   = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fortuno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&&  Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//Próba zabójstwa? Wybacz, przez jakiœ czas mnie... nie by³o. Nie wiem nic na ten temat.
};

