//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Więc to ty jesteś tym gościem, który wywalczył sobie wejście do obozu.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//Wieści szybko się rozchodzą...
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franko był twardy. Nikt nie śmiał mu się przeciwstawić. Nikt poza tobą.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Mówię to tylko po to, żebyśmy się dobrze zrozumieli. Jeśli spróbujesz tego samego ze mną, zabiję cię.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "Chcę wejść do kopalni!";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//Chcę wejść do kopalni!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//Oczywiście, że tak. Rozmawiasz z właściwą osobą.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Każdy, kto pracuje w kopalni, dostanie ładny udział w złocie.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//A ja odpowiadam za czerwone kamienie, bez których Thorus nikogo nie przepuści.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "Daj mi jeden z tych czerwonych kamieni.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Daj mi jeden z tych czerwonych kamieni.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//Pewnie, ale nie za darmo.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Zwykle domagam się pewnego udziału w wykopanym złocie.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//Jak tam twoja sprawność w kopaniu?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//Znasz już parę sztuczek, prawda?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Nie wyglądasz na eksperta w tej dziedzinie...
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//Gdybym dał ci czerwony kamień, to na pewno nie dlatego, że jesteś wykwalifikowanym kopaczem.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//Nie, mam dla ciebie inne zadanie.
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "Tak?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//Tak?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Jeden z bandytów próbował mnie usunąć. Jednak to ON został usunięty przez moich strażników.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Pewnie chciał zająć twoje miejsce, co?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//To był dureń! Skretyniały oprych. Szczerze wątpię, że sam wpadł na ten pomysł.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//Nie, wykonywał czyjeś zlecenie...
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//A ja mam się dowiedzieć, kto za tym stoi.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Nieważne, kto wysłał zabójcę - zapłaci za to. Znajdź go, a ja wpuszczę cię do kopalni.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Właśnie dlatego przysłał mnie tu Senyan.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? On też dla mnie pracuje. Kazałem mu mieć oczy szeroko otwarte.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Miała miejsce próba zabójstwa Estebana. Mam się dowiedzieć, kto za tym stoi.");

};
//--------------------------------------------------------------------
//	Info Attentäter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "Od czego mam zacząć?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//Od czego mam zacząć?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//Wszyscy w obozie wiedzą o tym incydencie. Tak więc nie musisz tego trzymać w tajemnicy.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Spróbuj się dowiedzieć, kto jest po mojej stronie, a kto nie!
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Porozmawiaj ze Snafem. Ten gruby kucharzyna zawsze dużo wie.
	
	B_LogEntry (Topic_Addon_Esteban, "Aby wytropić spiskowca, powinienem porozmawiać ze wszystkimi ludźmi w obozie i ustalić, po czyjej są stronie. Najlepiej rozpocząć od Snafa. Dociera do niego mnóstwo plotek.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "Potrzebuję lepszego pancerza.";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Potrzebuję lepszego pancerza.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Po co? Masz już zbroję. Musi ci wystarczyć.
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Poproś, jak wykonasz zadanie...
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "Co do tego zadania...";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//Co do tego zadania...
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Słuchaj, mam także inne sprawy, którymi muszę się zajmować.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//Och, myślałem, że zaciekawi cię informacja o tym, kto stał za próbą zabójstwa...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//Kto to jest? Podaj mi imię, żeby moi strażnicy mogli mu poderżnąć gardło.
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//To handlarz Fisk. Siedzi sobie teraz w karczmie i popija. Nie ma pojęcia, że wiem...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA! Doskonała robota, chłopcze. Moi strażnicy się nim zajmą...
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Chłopaki, słyszeliście! Idźcie po tego Fiska.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Wróć, gdy dowiesz się, kto to był.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "I co teraz?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//I co teraz?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//Teraz? Powiem ci, co zrobimy.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fisk umrze w cierpieniach i dowiedzą się o tym wszyscy w obozie.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//To będzie dla nich ostrzeżenie.
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "Dobra, a czy dostanę teraz czerwony kamień?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//Dobra, a czy dostanę teraz czerwony kamień?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Dobrze się spisałeś. Ktoś taki jak ty nie powinien siedzieć w kopalni.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Bardziej mi się przydasz w obozie. Zostaniesz tu i będziesz dalej dla mnie pracował.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "Zastanowię się nad tym.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Zastanowię się nad tym.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Najwyraźniej zapomniałeś, z kim rozmawiasz. To ja jestem szefem w obozie i będziesz robił, co ci każę.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//A ja mówię, że będziesz pracował dla mnie i dla nikogo innego. Zrozumiałeś?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "Chyba żartujesz?";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Chyba żartujesz. Nie taka była umowa.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//Nie każdemu zaproponowałbym coś takiego. Oczywiście, jeśli ci się coś nie podoba, możesz zawsze opuścić obozowisko...
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//A może dotrzymasz słowa i dasz mi czerwony kamień?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hej - jeszcze jedno słowo i moi strażnicy zajmą się także tobą.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//Jacy strażnicy?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Co? Ach, rozumiem. Chcesz mnie zdradzić. Kiepski pomysł.
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "DAWAJ czerwony kamień, bo sam go sobie wezmę.";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //DAWAJ czerwony kamień, bo sam go sobie wezmę.
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Chyba znudziło ci się życie. Dobrze, zrobię ci przysługę i pomogę rozwiązać ten problem!!!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




