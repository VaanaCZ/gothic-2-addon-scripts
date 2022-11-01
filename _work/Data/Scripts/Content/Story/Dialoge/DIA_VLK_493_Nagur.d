///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_EXIT   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 999;
	condition   = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Nagur_PICKPOCKET (C_INFO)
{
	npc			= VLK_493_Nagur;
	nr			= 900;
	condition	= DIA_Nagur_PICKPOCKET_Condition;
	information	= DIA_Nagur_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Nagur_PICKPOCKET_Condition()
{
	C_Beklauen (75, 150);
};
 
FUNC VOID DIA_Nagur_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nagur_PICKPOCKET);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_BACK 		,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
	
func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info vor dem Auftrag (Spieler hat noch nicht mit Kardif geredet)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Hallo   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 2;
	condition   = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Hallo_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_00");//Hej, nie mam czasu na pogawędki. Jeśli szukasz informacji, porozmawiaj z Kardifem.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_01");//Człowieku, zostaw mnie w spokoju, rozumiesz?!
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Job Angebot
///////////////////////////////////////////////////////////////////////
	var int NagurHack;
	
	func void B_Nagur_Abfertigen()
	{
		var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
		if (Hlp_IsItem (heroArmor, ItAr_MIL_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_MIL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_H) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_NOV_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_H) == FALSE)
		{
			AI_Output (self ,other,"DIA_Nagur_Add_08_02"); //I nie myśl, że cię nie poznam tylko dlatego, że założyłeś inne szaty.
		};
		
		AI_Output (self ,other,"DIA_Nagur_Add_08_03"); //Radzę ci jak przyjaciel, nie wtykaj nosa w cudze sprawy!
		AI_Output (self ,other,"DIA_Nagur_Add_08_04"); //Spadaj!
		
		MIS_Nagur_Bote = LOG_SUCCESS; //HACK: Attila kommt bei 3* Success oder 1* suckt --> nur noch die anderen beiden Missionen sind Trigger
		NagurHack = TRUE;
		AI_StopProcessInfos (self);
	};

INSTANCE DIA_Nagur_Job   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 3;
	condition   = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent   = FALSE;
	description = "Kardif powiedział, że masz dla mnie pracę.";
};
FUNC INT DIA_Nagur_Job_Condition()
{	
	if (DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Job_Info()
{
	AI_Output (other, self, "DIA_Nagur_Job_15_00");//Kardif powiedział, że masz dla mnie pracę.
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_00"); //NIE MA w porcie pracy dla ludzi z klasztoru!
		B_Nagur_Abfertigen();
	}
	else if (other.guild == GIL_MIL)
	|| 		(other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_01"); //Jeśli należysz do ludzi Króla, to raczej nie licz na jakąkolwiek pracę w porcie.
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output (self, other, "DIA_Nagur_Job_08_01");//Proszę, proszę... Cóż, powiadasz, że szukasz jakiegoś specjalnego zajęcia? W porządku, ale pamiętaj - ja tu rządzę.
		AI_Output (other, self, "DIA_Nagur_Job_15_02");//Co masz na myśli?
		AI_Output (self, other, "DIA_Nagur_Job_08_03");//Ano to, że słuchasz tylko mnie. Prócz tego przysługuje ci jedna trzecia zysku.
		AI_Output (self, other, "DIA_Nagur_Job_08_04");//Jeśli takie warunki ci nie odpowiadają, poszukaj sobie innej pracy.
	
		Info_ClearChoices (DIA_Nagur_Job);
		Info_AddChoice  (DIA_Nagur_Job,"Jesteśmy partnerami. Dzielimy się po połowie.",DIA_Nagur_Job_Halbe);
		Info_AddChoice  (DIA_Nagur_Job,"W porządku, ty tu jesteś szefem.",DIA_Nagur_Job_Klar);
	};
};
FUNC VOID DIA_Nagur_Job_Klar()
{
	AI_Output (other, self, "DIA_Nagur_Job_Klar_15_00");//W porządku, ty tu jesteś szefem.
	AI_Output (self, other, "DIA_Nagur_Job_Klar_08_01");//Wszystko jasne. W takim razie przygotuj się na łatwą kasę.
	Nagur_Deal = 80;
	Info_ClearChoices (DIA_Nagur_Job);
};
FUNC VOID DIA_Nagur_Job_Halbe()
{
	AI_Output (other, self, "DIA_Nagur_Job_Halbe_15_00");//Jesteśmy partnerami. Dzielimy się po połowie.
	AI_Output (self, other, "DIA_Nagur_Job_Halbe_08_01");//No dobra już, dobra. Tylko cię sprawdzałem. Oczywiście, że podzielimy się zyskami sprawiedliwie.
	Nagur_Deal = 120;
	Info_ClearChoices (DIA_Nagur_Job);
};
///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftrag   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 4;
	condition   = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent   = FALSE;
	description = "Dobra, więc jaki masz plan?";
};

FUNC INT DIA_Nagur_Auftrag_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Job))
	&& (MIS_Nagur_Bote != LOG_SUCCESS) //also hier NICHT B_Nagur_Abfertigen durchlaufen
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_15_00");//Dobra, więc jaki masz plan?
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_01");//Znasz chyba kupca Baltrama? Jeśli nie, to najwyższy czas byś go poznał i porozmawiał z nim.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_02");//Baltram zatrudnia posłańca, który dostarcza mu towary z farmy Akila.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_03");//Właściwie to ZATRUDNIAŁ posłańca, póki nie poderżnąłem mu gardła. Obecnie Baltram poszukuje kogoś na to miejsce i tu zaczyna się twoje zadanie.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_04");//Zatrudnisz się u Baltrama, a przesyłkę od Akila przyniesiesz do mnie.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_05");//Ja zaś sprzedam ją temu, kto zdecyduje się zapłacić najwięcej.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_06");//I niech ci nie przyjdzie do głowy sprzedać przesyłkę gdzieś po drodze do mnie. Kapujesz?
	
	Info_ClearChoices (DIA_Nagur_Auftrag);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Ja jestem gotowy (KONIEC)",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Gdzie znajdę Baltrama?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Kiedy mam się spotkać z Baltramem?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Jak dojść do farmy Akila?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice    (DIA_Nagur_Auftrag,"A co ja będę z tego miał?",DIA_Nagur_Auftrag_Gewinn);

};
FUNC VOID DIA_Nagur_Auftrag_Akil()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Akil_15_00");//Jak dojść do farmy Akila?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_01");//Wyjdź z placu targowego przez wschodnią bramę.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_02");//Jeśli podążysz ścieżką w prawo, wkrótce dojdziesz do kilku wykutych w skale stopni.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_03");//Wejdź na górę, a znajdziesz się na farmie Akila.
};
FUNC VOID DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Gewinn_15_00");//A co ja będę z tego miał?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Gewinn_08_01");//Hmmm, dokładnie ci teraz nie powiem. Myślę jednak, że możesz liczyć na 400 sztuk złota.
};
FUNC VOID DIA_Nagur_Auftrag_Baltram()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Baltram_15_00");//Gdzie znajdę Baltrama?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Baltram_08_01");//Jego kram znajduje się na placu targowym.
};
FUNC VOID DIA_Nagur_Auftrag_Wann()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Wann_15_00");//Kiedy mam się spotkać z Baltramem?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Wann_08_01");//W każdej chwili. Chyba już się domyślił, że jego poprzedni posłaniec nie wróci.
};
FUNC VOID DIA_Nagur_Auftrag_Okay()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Okay_15_00");//W porządku, zgadzam się.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Okay_08_01");//Doskonale, w takim razie ruszaj w drogę. Pamiętaj jednak, że nieuczciwy posłaniec to martwy posłaniec, jeśli wiesz, co mam na myśli!
	MIS_Nagur_Bote = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Nagur,LOG_RUNNING);
	B_LogEntry (TOPIC_Nagur,"Kiedy Baltram zatrudni mnie jako chłopca na posyłki, odbiorę dostawę od farmera Akila i przekażę ją Nagurowi.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Success   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 5;
	condition   = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent   = FALSE;
	description = "Przyniosłem przesyłkę.";
};

FUNC INT DIA_Nagur_Success_Condition()
{	
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_BaltramPaket) >=1)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Success_Info()
{
	AI_Output (other, self, "DIA_Nagur_Success_15_00");//Przyniosłem przesyłkę.
	AI_Output (self, other, "DIA_Nagur_Success_08_01");//Doskonale, postaram się wszystko sprzedać. Wróć do mnie jutro.
	
	B_LogEntry (TOPIC_Nagur,   "Nagur odebrał dostawę. Jutro wypłaci mi moje złoto.");
	
	AI_StopProcessInfos (self);
	
	if B_GiveInvItems (other, self,ItMi_BaltramPaket ,1)
	{
		Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();  
};
///////////////////////////////////////////////////////////////////////
//	Info Deal
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Deal   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 6;
	condition   = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent   = TRUE;
	description = "I co, sprzedałeś już cały towar?";
};
//---------------------------------
var int DIA_Nagur_Deal_permanent; 
//---------------------------------
FUNC INT DIA_Nagur_Deal_Condition()
{	
	if (DIA_Nagur_Deal_permanent == FALSE)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	&& Npc_KnowsInfo (other,DIA_Nagur_Success)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Deal_Info()
{
	AI_Output (other, self, "DIA_Nagur_Deal_15_00");//I co, sprzedałeś już cały towar?
	
	if (B_GetDayPlus() > NagurDay) 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_01");//Tak, ale za mniej, niż się spodziewałem. Za wszystko dostałem jedynie 300 sztuk złota.
		AI_Output (self, other, "DIA_Nagur_Deal_08_02");//A jeszcze część z tego musiałem oddać przełożonym.
		AI_Output (self, other, "DIA_Nagur_Deal_08_03");//Do tego jeszcze zwyczajowa premia dla Kardifa i opłata za twoje zlecenie.
		AI_Output (self, other, "DIA_Nagur_Deal_08_04");//W sumie dla mnie pozostaje 240 sztuk złota. Dzielimy się więc wedle umowy, oto twoja część.
		AI_Output (self, other, "DIA_Nagur_Deal_08_05");//Wykonałeś kawał dobrej roboty, moi zwierzchnicy już o tym wiedzą.
		AI_Output (self, other, "DIA_Nagur_Deal_08_06");//Co będzie dalej... To już nie zależy ode mnie.
		
		B_GiveInvItems (self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP (XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = (Diebesgilde_Okay + 1);
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_07");//Nie, jeszcze nie. W handlu nie szybkość jest najważniejsza a osiągnięta cena.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftraggeber   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent   = FALSE;
	description = "Kto jest twoim pracodawcą?";
};

FUNC INT DIA_Nagur_Auftraggeber_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftraggeber_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftraggeber_15_00");//Kto jest twoim pracodawcą?
	AI_Output (self, other, "DIA_Nagur_Auftraggeber_08_01");//Chyba nie sądzisz, że odpowiem na to pytanie, hm?
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Fazit   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Fazit_Condition;
	information = DIA_Nagur_Fazit_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Fazit_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Auftraggeber)
	&& Npc_IsInState (self,ZS_Talk))
	&& (Knows_SecretSign == FALSE) 
	&& (NagurHack == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Fazit_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Fazit_08_00");//Wszystko w porządku, nic nie powiem moim przełożonym. Możesz być spokojny.
	AI_StopProcessInfos  (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Nagur im Knast
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Knast   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Knast_Condition()
{	
	if Npc_IsInState (self,ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000)
	&& (Nagur_ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Knast_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Knast_08_00");//Zdradziłeś mnie! To był wielki błąd - spieprzaj!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
/////////////////////////////////////////
INSTANCE DIA_Nagur_Sign   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent   = FALSE;
	description	= "(Pokaż złodziejski gest)";
};

FUNC INT DIA_Nagur_Sign_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&& (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Sign_Info()
{	
	AI_PlayAni (other,"T_YES");
	AI_Output (self, other, "DIA_Nagur_Sign_08_00");//Zrobiłeś, co miałeś zrobić. Więc musiałeś poznać moich zwierzchników.
	AI_Output (self, other, "DIA_Nagur_Sign_08_01");//Pamiętaj, słuchaj tego, co mówi ci Cassia - zresztą nie obchodzi nas, kim jesteś. Liczy się tylko to, że przyłączyłeś się do nas.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Perm   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Perm_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&&  Npc_KnowsInfo (other,DIA_Nagur_Sign) 
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Perm_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Perm_08_00");//Poszukaj sobie kogoś innego. Naokoło jest sporo ludzi. My nie mamy już o czym rozmawiać.
	AI_StopProcessInfos (self);
};
























