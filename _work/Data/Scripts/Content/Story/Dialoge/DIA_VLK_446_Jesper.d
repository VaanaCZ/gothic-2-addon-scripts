//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_EXIT   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 999;
	condition   = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jesper_PICKPOCKET (C_INFO)
{
	npc			= VLK_446_Jesper;
	nr			= 900;
	condition	= DIA_Jesper_PICKPOCKET_Condition;
	information	= DIA_Jesper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Jesper_PICKPOCKET_Condition()
{
	C_Beklauen (80, 180);
};
 
FUNC VOID DIA_Jesper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jesper_PICKPOCKET);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_BACK 		,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
	
func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
//////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Hallo   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Jesper_Hallo_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Jesper_Hallo_Info()
{
	AI_Output (self, other,"DIA_Jesper_Hallo_09_00");//Co tu robisz? Nie masz tu czego szukać.
	AI_Output (self, other,"DIA_Jesper_Hallo_09_01");//No dobra, co tu robisz?
		
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Zamierzam cię zabić.",DIA_Jesper_Hallo_Kill);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Chciałem trochę pozwiedzać.",DIA_Jesper_Hallo_NurSo);
		
	if  (Attila_Key == TRUE)
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attila dał mi klucz... ",DIA_Jesper_Hallo_Willkommen);
	}	
	else 
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Załatwiłem Attilę...",DIA_Jesper_Hallo_Umgelegt);
	};
	
	DG_gefunden = TRUE;
	
};
FUNC VOID DIA_Jesper_Hallo_Kill()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Kill_15_00");//Zamierzam cię zabić.
	AI_Output (self, other,"DIA_Jesper_Hallo_Kill_09_01");//Cóż za wspaniały pomysł. Sam na niego wpadłeś, co? A co tam. Nie będę przedłużał.
	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Jesper_Hallo_NurSo()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_NurSo_15_00");//Chciałem trochę pozwiedzać.
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_01");//Nie ma się na co gapić. Wkraczasz na grząski grunt, jasne?
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_02");//Więc nie ruszaj broni i powiedz mi, dlaczego tu jesteś.
};
FUNC VOID DIA_Jesper_Hallo_Willkommen()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Willkommen_15_00");//Attila dał mi klucz. Dlatego tu jestem. Więc czego ode mnie chcesz?
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_01");//Chciałbyś wiedzieć? Spokojnie.
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_02");//Idź do Cassii. Czeka na ciebie.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Umgelegt_15_00");//Załatwiłem Attilę. Miał przy sobie klucz do kanałów.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_01");//Zabiłeś Attilę? No i co z tego, to był nędzny pies.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_02");//Powiem ci coś. Jeśli mnie zaatakujesz, zabiję cię.
	
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Co ty tu robisz...",DIA_Jesper_Hallo_Was);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Chcę się zobaczyć z twoim przywódcą.",DIA_Jesper_Hallo_Anfuehrer);
};
FUNC VOID DIA_Jesper_Hallo_Was()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Was_15_00");//Co robisz w tej ciemnej, wilgotnej norze?
	AI_Output (self, other,"DIA_Jesper_Hallo_Was_09_01");//Mieszkam tu. Jeszcze jedno głupie pytanie, a wytnę ci na skórze wzorek.
};
FUNC VOID DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Anfuehrer_15_00");//Chcę się zobaczyć z twoim przywódcą.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_01");//HA - moim przywódcą? Jestem pewien, że Cassia chętnie z tobą porozmawia.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_02");//Idź - i nie próbuj żadnych sztuczek.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bezahlen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent   = TRUE;
	description	= "Możesz mnie czegoś nauczyć?";
};
FUNC INT DIA_Jesper_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Jesper_TeachSneak == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Info()
{	
	AI_Output (other, self, "DIA_Jesper_Bezahlen_15_00");//Możesz mnie czegoś nauczyć?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_01");//Pewnie, pokażę ci, jak się skradać - za darmo.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_02");//Chcesz się nauczyć, jak się bezszelestnie poruszać? To cię będzie kosztować 100 sztuk złota.
		B_Say_Gold (self, other, Jesper_Cost);
		
		Info_ClearChoices (DIA_Jesper_Bezahlen);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Może później... (POWRÓT)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Chcę się nauczyć sztuki skradania (zapłać 100 sztuk złota).",DIA_Jesper_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Jesper_Bezahlen);
};
FUNC VOID DIA_Jesper_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_00");//Dobra, chcę się nauczyć skradania.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_01");//Oto złoto.
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_02");//Daj mi znać, jak będziesz gotowy.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_03");//Bez złota niczego się nie nauczysz.
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Schleichen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Schleichen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent   = TRUE;
	description = "Naucz mnie zasad skradania i ukrywania się.";
};
//--------------------------------------
var int DIA_Jesper_Schleichen_permanent;
//-------------------------------------- 
FUNC INT DIA_Jesper_Schleichen_Condition()
{	
	if (Jesper_TeachSneak == TRUE) 
	&& (DIA_Jesper_Schleichen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Schleichen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Schleichen_15_00");//Naucz mnie sztuki skradania się.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK)
	{
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_01");//Umiejętność skradania się jest niezwykle ważna dla każdego złodzieja. Przede wszystkim do poruszania się po cudzych domach.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_02");//Nie tup tak. Większość ludzi ma bardzo czujny sen.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_03");//Jeśli będziesz się skradał, nikt cię nie usłyszy - wtedy będziesz mógł pracować bez przeszkód.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Freunde getötet
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Killer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 2;
	condition   = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Jesper_Killer_Condition()
{	
	if Npc_IsDead (Cassia)
	|| Npc_IsDead (Ramirez)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Killer_Info()
{
	if  Npc_IsDead (Cassia)
	&&  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_00");//Zabiłeś moich przyjaciół. Dlaczego to zrobiłeś, morderco?
		AI_Output (self, other, "DIA_Jesper_Killer_09_01");//Wyślę cię do królestwa Beliara.
	}
	else if Npc_IsDead (Cassia)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_02");//Zabiłeś Cassię, ty parszywy morderco. Mnie jednak nie pokonasz!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	}
	else if  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_03");//Wyświadczyłem Ramirezowi więcej przysług i zebrałem więcej gotówki, niż kiedykolwiek widziałeś.
		AI_Output (self, other, "DIA_Jesper_Killer_09_04");//A ty go zabiłeś, wredny psie! Pora za to zapłacić!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	};
	
};
//////////////////////////////////////////////////////////////////////
//	Info Bogen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bogen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent   = FALSE;
	description = "Nie wiesz przypadkiem czegoś o łuku Bospera?";
};

FUNC INT DIA_Jesper_Bogen_Condition()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) < 1)
	&& (MIS_Bosper_Bogen == LOG_RUNNING)
	&& (Join_Thiefs == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bogen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Bogen_15_00");//Nie wiesz przypadkiem czegoś o łuku Bospera?
	AI_Output (self, other, "DIA_Jesper_Bogen_09_01");//Chodzi ci o ten łuk od łuczarza? Taak, mam go gdzieś w skrzyni.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_02");//Pełno tam jednak szczurów. Możesz go przynieść, jeśli się nie boisz.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_03");//Och, oczywiście skrzynia jest zamknięta. Będziesz musiał się włamać. Na szczęście wciąż masz wytrychy.
	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_01");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_02");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_03");
};
//////////////////////////////////////////////////////////////////////
//	Info Tür
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Tuer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent   = FALSE;
	description = "Co jest za tymi zamkniętymi drzwiami?";
};

FUNC INT DIA_Jesper_Tuer_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Tuer_Info()
{
	AI_Output (other, self, "DIA_Jesper_Tuer_15_00");//Co jest za tymi zamkniętymi drzwiami?
	AI_Output (self, other, "DIA_Jesper_Tuer_09_01");//Dalej jest skrzynia - wyzwanie przygotowane przez mistrza otwierania zamków.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_02");//Umieścił na niej tak skomplikowany zamek, że do tej pory nikt nie mógł go otworzyć.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_03");//Niestety, został złapany - wyrzucili go za Barierę i pewnie tam umarł.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_04");//Jeśli jednak chcesz otworzyć skrzynię, to weź ten klucz od drzwi sali.
	
	B_GiveInvItems (self, other, ItKe_Fingers,1);
};
//////////////////////////////////////////////////////////////////////
//	Info Truhe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Truhe   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent   = FALSE;
	description = "Udało mi się otworzyć skrzynię.";
};

FUNC INT DIA_Jesper_Truhe_Condition()
{	
	if (Mob_HasItems ("MOB_FINGERS", Itmi_Gold) < 300)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Silvercup) < 5)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Goldcup) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItAM_Strg_01) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItPO_perm_Dex) < 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Truhe_Info()
{
	AI_Output (other, self, "DIA_Jesper_Truhe_15_00");//Udało mi się otworzyć skrzynię.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_01");//Niemożliwe! Wygląda na to, że mamy nowego mistrza otwierania zamków.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_02");//Gratulacje!
	
	B_GivePlayerXP (XP_JesperTruhe);
};  


