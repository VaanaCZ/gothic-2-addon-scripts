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
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//Krwią... Przyzywałem go... ON, który mnie obserwuje... Och, nie, odejdź, zostaw mnie...
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//Dobrze się czujesz?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"Fortuno postradał zmysły. Szuka 'zielonego nowicjusza'.");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//Zielony... Zielony nowicjusz... Nie mogę go znaleźć...
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Wrócę później... (KONIEC)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Jak mogę ci pomóc?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Masz, weź to bagienne ziele.",DIA_Addon_Fortuno_Hi_JOINT);
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
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//Jak mogę ci pomóc?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//Zielony... Zielony nowicjusz pomaga nowicjuszowi...
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//Masz, weź to bagienne ziele.
	
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
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//Moja głowa... Kim... Jestem... Fortuno... Co... Co się dzieje?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"Zielony nowicjusz przywrócił zmysły Fortuna.");
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
	description	= "Dobrze, a teraz powiedz mi, co z tobą.";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//Dobrze, a teraz powiedz mi, co z tobą.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//Byłem kiedyś członkiem Bractwa Śniącego. Wtedy wszystko było jeszcze w porządku.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//Tak, wszyscy byliśmy skazanymi przestępcami, ale życie dla nas - nowicjuszy - nie było takie złe...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//Hej, ja też byłem więźniem w Górniczej Dolinie. Powiedz mi coś, czego nie wiem.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//Ja... Nic nie pamiętam. Ciemność przesłania mój umysł.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//Spróbuj się skoncentrować. Co się stało? Jak odzyskałeś świadomość?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//Kruk... Pamiętam tylko Kruka i... ciemne pomieszczenia.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//O co chodzi z Krukiem? Co on ci zrobił?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//Przepraszam. Czuję się, jakby mój umysł nie był wolny... Sam tego nie rozumiem...
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
	description	= "Musi być jakiś sposób, żeby przywrócić ci wspomnienia.";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//Musi być jakiś sposób, żeby przywrócić ci wspomnienia.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//Hmm... Może jest sposób.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//Guru znali sztukę koncentracji i manipulacji umysłem.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//A TY wiesz coś o tych rzeczach?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//Nie, obawiam się, że ta wiedza zaginęła...
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//Cholera. Jeżeli jest jakiś sposób na uwolnienie twojego umysłu, to go znajdę.

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"Fortuno wrócił do zmysłów, ale niczego nie pamięta.");
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
	description	= "Potrzebujesz więcej bagiennego ziela?";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//Potrzebujesz więcej bagiennego ziela?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//Taaak, potrzebuję tyle ziela, ile tylko zdołasz przynieść.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//Zapłacę ci lepiej niż Fisk.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(Oddaj całe bagienne ziele)",DIA_Addon_Fortuno_Trade_all);
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
	description	= "Mam dla ciebie miksturę. Powinna pomóc ci odzyskać pamięć.";
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
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//Mam dla ciebie miksturę. Powinna pomóc ci odzyskać pamięć.
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
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//Ach! Teraz... Teraz pamiętam... Adanosie, pomóż... Co ja uczyniłem?
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//Tak, co zrobiłeś? A co ważniejsze, co zrobił Kruk?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//Pomogłem mu... nawiązać kontakt. Z NIM. Potrzebował wielu eliksirów... Uwarzyłem je dla niego.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//Próbował otworzyć portal, aby dostać się do świątyni.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//Po co? Czego on chce ze świątyni?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//Jest tam potężny artefakt... Pogrzebany wraz ze swym ostatnim właścicielem. Potężnym wojownikiem, który wykonywał JEGO wolę...
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//Co dalej?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//Nie udało nam się otworzyć portalu.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//Kruk jednak dowiedział się, że ZDOŁA go otworzyć, jeśli odkopie kryptę kapłana.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//Dlatego ściągnął tu tych wszystkich niewolników. Ofiary, które zmusił do kopania w miejscu, gdzie odpoczywają siły czasu.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//Kryptę kapłana?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//Grobowiec kapłana Adanosa znajduje się w kopalni.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//Przypominam sobie też kamienne tabliczki. Kruk wierzył, że wskażą mu drogę.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//Gdy tylko zdołał odcyfrować inskrypcje, stałem się zbędny.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//Rzucił na mnie zaklęcie, które sprawiło, że wszystko zapomniałem. A ty mnie uwolniłeś.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Kruk chce wydobyć potężny artefakt ze świątyni Adanosa."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Z jakiegoś powodu Kruk rozkopał w kopalni złota grób jednego z kapłanów prastarej kultury."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Kruk sądzi, że w realizacji jego planu pomogą jakieś kamienne tablice."); 
	
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
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//Próba zabójstwa? Wybacz, przez jakiś czas mnie... nie było. Nie wiem nic na ten temat.
};

