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
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Wi�c to ty jeste� tym go�ciem, kt�ry wywalczy� sobie wej�cie do obozu.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//Wie�ci szybko si� rozchodz�...
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franko by� twardy. Nikt nie �mia� mu si� przeciwstawi�. Nikt poza tob�.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//M�wi� to tylko po to, �eby�my si� dobrze zrozumieli. Je�li spr�bujesz tego samego ze mn�, zabij� ci�.
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
	description = "Chc� wej�� do kopalni!";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//Chc� wej�� do kopalni!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//Oczywi�cie, �e tak. Rozmawiasz z w�a�ciw� osob�.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Ka�dy, kto pracuje w kopalni, dostanie �adny udzia� w z�ocie.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//A ja odpowiadam za czerwone kamienie, bez kt�rych Thorus nikogo nie przepu�ci.
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
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Zwykle domagam si� pewnego udzia�u w wykopanym z�ocie.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//Jak tam twoja sprawno�� w kopaniu?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//Znasz ju� par� sztuczek, prawda?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Nie wygl�dasz na eksperta w tej dziedzinie...
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//Gdybym da� ci czerwony kamie�, to na pewno nie dlatego, �e jeste� wykwalifikowanym kopaczem.
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
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Jeden z bandyt�w pr�bowa� mnie usun��. Jednak to ON zosta� usuni�ty przez moich stra�nik�w.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Pewnie chcia� zaj�� twoje miejsce, co?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//To by� dure�! Skretynia�y oprych. Szczerze w�tpi�, �e sam wpad� na ten pomys�.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//Nie, wykonywa� czyje� zlecenie...
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//A ja mam si� dowiedzie�, kto za tym stoi.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Niewa�ne, kto wys�a� zab�jc� - zap�aci za to. Znajd� go, a ja wpuszcz� ci� do kopalni.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//W�a�nie dlatego przys�a� mnie tu Senyan.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? On te� dla mnie pracuje. Kaza�em mu mie� oczy szeroko otwarte.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Mia�a miejsce pr�ba zab�jstwa Estebana. Mam si� dowiedzie�, kto za tym stoi.");

};
//--------------------------------------------------------------------
//	Info Attent�ter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "Od czego mam zacz��?";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//Od czego mam zacz��?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//Wszyscy w obozie wiedz� o tym incydencie. Tak wi�c nie musisz tego trzyma� w tajemnicy.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Spr�buj si� dowiedzie�, kto jest po mojej stronie, a kto nie!
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Porozmawiaj ze Snafem. Ten gruby kucharzyna zawsze du�o wie.
	
	B_LogEntry (Topic_Addon_Esteban, "Aby wytropi� spiskowca, powinienem porozmawia� ze wszystkimi lud�mi w obozie i ustali�, po czyjej s� stronie. Najlepiej rozpocz�� od Snafa. Dociera do niego mn�stwo plotek.");
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
	description = "Potrzebuj� lepszego pancerza.";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Potrzebuj� lepszego pancerza.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Po co? Masz ju� zbroj�. Musi ci wystarczy�.
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Popro�, jak wykonasz zadanie...
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
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//S�uchaj, mam tak�e inne sprawy, kt�rymi musz� si� zajmowa�.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//Och, my�la�em, �e zaciekawi ci� informacja o tym, kto sta� za pr�b� zab�jstwa...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//Kto to jest? Podaj mi imi�, �eby moi stra�nicy mogli mu poder�n�� gard�o.
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//To handlarz Fisk. Siedzi sobie teraz w karczmie i popija. Nie ma poj�cia, �e wiem...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA! Doskona�a robota, ch�opcze. Moi stra�nicy si� nim zajm�...
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Ch�opaki, s�yszeli�cie! Id�cie po tego Fiska.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Wr��, gdy dowiesz si�, kto to by�.
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
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fisk umrze w cierpieniach i dowiedz� si� o tym wszyscy w obozie.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//To b�dzie dla nich ostrze�enie.
	
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
	description = "Dobra, a czy dostan� teraz czerwony kamie�?";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//Dobra, a czy dostan� teraz czerwony kamie�?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Dobrze si� spisa�e�. Kto� taki jak ty nie powinien siedzie� w kopalni.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Bardziej mi si� przydasz w obozie. Zostaniesz tu i b�dziesz dalej dla mnie pracowa�.
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
	description = "Zastanowi� si� nad tym.";
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
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Zastanowi� si� nad tym.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Najwyra�niej zapomnia�e�, z kim rozmawiasz. To ja jestem szefem w obozie i b�dziesz robi�, co ci ka��.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//A ja m�wi�, �e b�dziesz pracowa� dla mnie i dla nikogo innego. Zrozumia�e�?
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
	description = "Chyba �artujesz?";
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
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Chyba �artujesz. Nie taka by�a umowa.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//Nie ka�demu zaproponowa�bym co� takiego. Oczywi�cie, je�li ci si� co� nie podoba, mo�esz zawsze opu�ci� obozowisko...
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//A mo�e dotrzymasz s�owa i dasz mi czerwony kamie�?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hej - jeszcze jedno s�owo i moi stra�nicy zajm� si� tak�e tob�.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//Jacy stra�nicy?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Co? Ach, rozumiem. Chcesz mnie zdradzi�. Kiepski pomys�.
	
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
	description = "DAWAJ czerwony kamie�, bo sam go sobie wezm�.";
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
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //DAWAJ czerwony kamie�, bo sam go sobie wezm�.
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Chyba znudzi�o ci si� �ycie. Dobrze, zrobi� ci przys�ug� i pomog� rozwi�za� ten problem!!!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




