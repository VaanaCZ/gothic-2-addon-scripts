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
		AI_Output (self, other, "DIA_Nagur_Hallo_08_00");//Hej, nie mam czasu na pogaw�dki. Je�li szukasz informacji, porozmawiaj z Kardifem.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_01");//Cz�owieku, zostaw mnie w spokoju, rozumiesz?!
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
			AI_Output (self ,other,"DIA_Nagur_Add_08_02"); //I nie my�l, �e ci� nie poznam tylko dlatego, �e za�o�y�e� inne szaty.
		};
		
		AI_Output (self ,other,"DIA_Nagur_Add_08_03"); //Radz� ci jak przyjaciel, nie wtykaj nosa w cudze sprawy!
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
	description = "Kardif powiedzia�, �e masz dla mnie prac�.";
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
	AI_Output (other, self, "DIA_Nagur_Job_15_00");//Kardif powiedzia�, �e masz dla mnie prac�.
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_00"); //NIE MA w porcie pracy dla ludzi z klasztoru!
		B_Nagur_Abfertigen();
	}
	else if (other.guild == GIL_MIL)
	|| 		(other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_01"); //Je�li nale�ysz do ludzi Kr�la, to raczej nie licz na jak�kolwiek prac� w porcie.
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output (self, other, "DIA_Nagur_Job_08_01");//Prosz�, prosz�... C�, powiadasz, �e szukasz jakiego� specjalnego zaj�cia? W porz�dku, ale pami�taj - ja tu rz�dz�.
		AI_Output (other, self, "DIA_Nagur_Job_15_02");//Co masz na my�li?
		AI_Output (self, other, "DIA_Nagur_Job_08_03");//Ano to, �e s�uchasz tylko mnie. Pr�cz tego przys�uguje ci jedna trzecia zysku.
		AI_Output (self, other, "DIA_Nagur_Job_08_04");//Je�li takie warunki ci nie odpowiadaj�, poszukaj sobie innej pracy.
	
		Info_ClearChoices (DIA_Nagur_Job);
		Info_AddChoice  (DIA_Nagur_Job,"Jeste�my partnerami. Dzielimy si� po po�owie.",DIA_Nagur_Job_Halbe);
		Info_AddChoice  (DIA_Nagur_Job,"W porz�dku, ty tu jeste� szefem.",DIA_Nagur_Job_Klar);
	};
};
FUNC VOID DIA_Nagur_Job_Klar()
{
	AI_Output (other, self, "DIA_Nagur_Job_Klar_15_00");//W porz�dku, ty tu jeste� szefem.
	AI_Output (self, other, "DIA_Nagur_Job_Klar_08_01");//Wszystko jasne. W takim razie przygotuj si� na �atw� kas�.
	Nagur_Deal = 80;
	Info_ClearChoices (DIA_Nagur_Job);
};
FUNC VOID DIA_Nagur_Job_Halbe()
{
	AI_Output (other, self, "DIA_Nagur_Job_Halbe_15_00");//Jeste�my partnerami. Dzielimy si� po po�owie.
	AI_Output (self, other, "DIA_Nagur_Job_Halbe_08_01");//No dobra ju�, dobra. Tylko ci� sprawdza�em. Oczywi�cie, �e podzielimy si� zyskami sprawiedliwie.
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
	description = "Dobra, wi�c jaki masz plan?";
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
	AI_Output (other, self, "DIA_Nagur_Auftrag_15_00");//Dobra, wi�c jaki masz plan?
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_01");//Znasz chyba kupca Baltrama? Je�li nie, to najwy�szy czas by� go pozna� i porozmawia� z nim.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_02");//Baltram zatrudnia pos�a�ca, kt�ry dostarcza mu towary z farmy Akila.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_03");//W�a�ciwie to ZATRUDNIA� pos�a�ca, p�ki nie poder�n��em mu gard�a. Obecnie Baltram poszukuje kogo� na to miejsce i tu zaczyna si� twoje zadanie.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_04");//Zatrudnisz si� u Baltrama, a przesy�k� od Akila przyniesiesz do mnie.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_05");//Ja za� sprzedam j� temu, kto zdecyduje si� zap�aci� najwi�cej.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_06");//I niech ci nie przyjdzie do g�owy sprzeda� przesy�k� gdzie� po drodze do mnie. Kapujesz?
	
	Info_ClearChoices (DIA_Nagur_Auftrag);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Ja jestem gotowy (KONIEC)",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Gdzie znajd� Baltrama?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Kiedy mam si� spotka� z Baltramem?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Jak doj�� do farmy Akila?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice    (DIA_Nagur_Auftrag,"A co ja b�d� z tego mia�?",DIA_Nagur_Auftrag_Gewinn);

};
FUNC VOID DIA_Nagur_Auftrag_Akil()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Akil_15_00");//Jak doj�� do farmy Akila?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_01");//Wyjd� z placu targowego przez wschodni� bram�.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_02");//Je�li pod��ysz �cie�k� w prawo, wkr�tce dojdziesz do kilku wykutych w skale stopni.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_03");//Wejd� na g�r�, a znajdziesz si� na farmie Akila.
};
FUNC VOID DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Gewinn_15_00");//A co ja b�d� z tego mia�?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Gewinn_08_01");//Hmmm, dok�adnie ci teraz nie powiem. My�l� jednak, �e mo�esz liczy� na 400 sztuk z�ota.
};
FUNC VOID DIA_Nagur_Auftrag_Baltram()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Baltram_15_00");//Gdzie znajd� Baltrama?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Baltram_08_01");//Jego kram znajduje si� na placu targowym.
};
FUNC VOID DIA_Nagur_Auftrag_Wann()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Wann_15_00");//Kiedy mam si� spotka� z Baltramem?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Wann_08_01");//W ka�dej chwili. Chyba ju� si� domy�li�, �e jego poprzedni pos�aniec nie wr�ci.
};
FUNC VOID DIA_Nagur_Auftrag_Okay()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Okay_15_00");//W porz�dku, zgadzam si�.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Okay_08_01");//Doskonale, w takim razie ruszaj w drog�. Pami�taj jednak, �e nieuczciwy pos�aniec to martwy pos�aniec, je�li wiesz, co mam na my�li!
	MIS_Nagur_Bote = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Nagur,LOG_RUNNING);
	B_LogEntry (TOPIC_Nagur,"Kiedy Baltram zatrudni mnie jako ch�opca na posy�ki, odbior� dostaw� od farmera Akila i przeka�� j� Nagurowi.");
	
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
	description = "Przynios�em przesy�k�.";
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
	AI_Output (other, self, "DIA_Nagur_Success_15_00");//Przynios�em przesy�k�.
	AI_Output (self, other, "DIA_Nagur_Success_08_01");//Doskonale, postaram si� wszystko sprzeda�. Wr�� do mnie jutro.
	
	B_LogEntry (TOPIC_Nagur,   "Nagur odebra� dostaw�. Jutro wyp�aci mi moje z�oto.");
	
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
	description = "I co, sprzeda�e� ju� ca�y towar?";
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
	AI_Output (other, self, "DIA_Nagur_Deal_15_00");//I co, sprzeda�e� ju� ca�y towar?
	
	if (B_GetDayPlus() > NagurDay) 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_01");//Tak, ale za mniej, ni� si� spodziewa�em. Za wszystko dosta�em jedynie 300 sztuk z�ota.
		AI_Output (self, other, "DIA_Nagur_Deal_08_02");//A jeszcze cz�� z tego musia�em odda� prze�o�onym.
		AI_Output (self, other, "DIA_Nagur_Deal_08_03");//Do tego jeszcze zwyczajowa premia dla Kardifa i op�ata za twoje zlecenie.
		AI_Output (self, other, "DIA_Nagur_Deal_08_04");//W sumie dla mnie pozostaje 240 sztuk z�ota. Dzielimy si� wi�c wedle umowy, oto twoja cz��.
		AI_Output (self, other, "DIA_Nagur_Deal_08_05");//Wykona�e� kawa� dobrej roboty, moi zwierzchnicy ju� o tym wiedz�.
		AI_Output (self, other, "DIA_Nagur_Deal_08_06");//Co b�dzie dalej... To ju� nie zale�y ode mnie.
		
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
		AI_Output (self, other, "DIA_Nagur_Deal_08_07");//Nie, jeszcze nie. W handlu nie szybko�� jest najwa�niejsza a osi�gni�ta cena.
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
	description = "Kto jest twoim pracodawc�?";
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
	AI_Output (other, self, "DIA_Nagur_Auftraggeber_15_00");//Kto jest twoim pracodawc�?
	AI_Output (self, other, "DIA_Nagur_Auftraggeber_08_01");//Chyba nie s�dzisz, �e odpowiem na to pytanie, hm?
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
	AI_Output (self, other, "DIA_Nagur_Fazit_08_00");//Wszystko w porz�dku, nic nie powiem moim prze�o�onym. Mo�esz by� spokojny.
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
	AI_Output (self, other, "DIA_Nagur_Knast_08_00");//Zdradzi�e� mnie! To by� wielki b��d - spieprzaj!
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
	description	= "(Poka� z�odziejski gest)";
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
	AI_Output (self, other, "DIA_Nagur_Sign_08_00");//Zrobi�e�, co mia�e� zrobi�. Wi�c musia�e� pozna� moich zwierzchnik�w.
	AI_Output (self, other, "DIA_Nagur_Sign_08_01");//Pami�taj, s�uchaj tego, co m�wi ci Cassia - zreszt� nie obchodzi nas, kim jeste�. Liczy si� tylko to, �e przy��czy�e� si� do nas.
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
	AI_Output (self, other, "DIA_Nagur_Perm_08_00");//Poszukaj sobie kogo� innego. Naoko�o jest sporo ludzi. My nie mamy ju� o czym rozmawia�.
	AI_StopProcessInfos (self);
};
























