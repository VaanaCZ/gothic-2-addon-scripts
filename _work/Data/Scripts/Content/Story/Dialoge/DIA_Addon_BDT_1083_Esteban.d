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
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Wiêc to ty jesteœ tym goœciem, który wywalczy³ sobie wejœcie do obozu.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//Wieœci szybko siê rozchodz¹...
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franko by³ twardy. Nikt nie œmia³ mu siê przeciwstawiæ. Nikt poza tob¹.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Mówiê to tylko po to, ¿ebyœmy siê dobrze zrozumieli. Jeœli spróbujesz tego samego ze mn¹, zabijê ciê.
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
	description = "Chcê wejœæ do kopalni!";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//Chcê wejœæ do kopalni!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//Oczywiœcie, ¿e tak. Rozmawiasz z w³aœciw¹ osob¹.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Ka¿dy, kto pracuje w kopalni, dostanie ³adny udzia³ w z³ocie.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//A ja odpowiadam za czerwone kamienie, bez których Thorus nikogo nie przepuœci.
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
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Zwykle domagam siê pewnego udzia³u w wykopanym z³ocie.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//Jak tam twoja sprawnoœæ w kopaniu?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//Znasz ju¿ parê sztuczek, prawda?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Nie wygl¹dasz na eksperta w tej dziedzinie...
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//Gdybym da³ ci czerwony kamieñ, to na pewno nie dlatego, ¿e jesteœ wykwalifikowanym kopaczem.
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
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Jeden z bandytów próbowa³ mnie usun¹æ. Jednak to ON zosta³ usuniêty przez moich stra¿ników.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Pewnie chcia³ zaj¹æ twoje miejsce, co?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//To by³ dureñ! Skretynia³y oprych. Szczerze w¹tpiê, ¿e sam wpad³ na ten pomys³.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//Nie, wykonywa³ czyjeœ zlecenie...
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//A ja mam siê dowiedzieæ, kto za tym stoi.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Niewa¿ne, kto wys³a³ zabójcê - zap³aci za to. ZnajdŸ go, a ja wpuszczê ciê do kopalni.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//W³aœnie dlatego przys³a³ mnie tu Senyan.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? On te¿ dla mnie pracuje. Kaza³em mu mieæ oczy szeroko otwarte.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Mia³a miejsce próba zabójstwa Estebana. Mam siê dowiedzieæ, kto za tym stoi.");

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
	description = "Od czego mam zacz¹æ?";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//Od czego mam zacz¹æ?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//Wszyscy w obozie wiedz¹ o tym incydencie. Tak wiêc nie musisz tego trzymaæ w tajemnicy.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Spróbuj siê dowiedzieæ, kto jest po mojej stronie, a kto nie!
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Porozmawiaj ze Snafem. Ten gruby kucharzyna zawsze du¿o wie.
	
	B_LogEntry (Topic_Addon_Esteban, "Aby wytropiæ spiskowca, powinienem porozmawiaæ ze wszystkimi ludŸmi w obozie i ustaliæ, po czyjej s¹ stronie. Najlepiej rozpocz¹æ od Snafa. Dociera do niego mnóstwo plotek.");
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
	description = "Potrzebujê lepszego pancerza.";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Potrzebujê lepszego pancerza.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Po co? Masz ju¿ zbrojê. Musi ci wystarczyæ.
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Poproœ, jak wykonasz zadanie...
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
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//S³uchaj, mam tak¿e inne sprawy, którymi muszê siê zajmowaæ.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//Och, myœla³em, ¿e zaciekawi ciê informacja o tym, kto sta³ za prób¹ zabójstwa...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//Kto to jest? Podaj mi imiê, ¿eby moi stra¿nicy mogli mu poder¿n¹æ gard³o.
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//To handlarz Fisk. Siedzi sobie teraz w karczmie i popija. Nie ma pojêcia, ¿e wiem...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA! Doskona³a robota, ch³opcze. Moi stra¿nicy siê nim zajm¹...
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Ch³opaki, s³yszeliœcie! IdŸcie po tego Fiska.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Wróæ, gdy dowiesz siê, kto to by³.
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
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fisk umrze w cierpieniach i dowiedz¹ siê o tym wszyscy w obozie.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//To bêdzie dla nich ostrze¿enie.
	
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
	description = "Dobra, a czy dostanê teraz czerwony kamieñ?";
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
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//Dobra, a czy dostanê teraz czerwony kamieñ?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Dobrze siê spisa³eœ. Ktoœ taki jak ty nie powinien siedzieæ w kopalni.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Bardziej mi siê przydasz w obozie. Zostaniesz tu i bêdziesz dalej dla mnie pracowa³.
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
	description = "Zastanowiê siê nad tym.";
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
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Zastanowiê siê nad tym.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//NajwyraŸniej zapomnia³eœ, z kim rozmawiasz. To ja jestem szefem w obozie i bêdziesz robi³, co ci ka¿ê.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//A ja mówiê, ¿e bêdziesz pracowa³ dla mnie i dla nikogo innego. Zrozumia³eœ?
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
	description = "Chyba ¿artujesz?";
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
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Chyba ¿artujesz. Nie taka by³a umowa.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//Nie ka¿demu zaproponowa³bym coœ takiego. Oczywiœcie, jeœli ci siê coœ nie podoba, mo¿esz zawsze opuœciæ obozowisko...
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//A mo¿e dotrzymasz s³owa i dasz mi czerwony kamieñ?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hej - jeszcze jedno s³owo i moi stra¿nicy zajm¹ siê tak¿e tob¹.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//Jacy stra¿nicy?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Co? Ach, rozumiem. Chcesz mnie zdradziæ. Kiepski pomys³.
	
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
	description = "DAWAJ czerwony kamieñ, bo sam go sobie wezmê.";
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
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //DAWAJ czerwony kamieñ, bo sam go sobie wezmê.
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Chyba znudzi³o ci siê ¿ycie. Dobrze, zrobiê ci przys³ugê i pomogê rozwi¹zaæ ten problem!!!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




