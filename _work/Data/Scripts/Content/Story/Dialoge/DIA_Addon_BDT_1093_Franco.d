///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Franco_EXIT   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 999;
	condition   = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_EXIT_Info()
{
	if (Franco_Exit == FALSE)
	&& (MIS_HlpLogan == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");//Nie zabłądź, bo skończysz jako mięso dla węży.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Franco_PICKPOCKET (C_INFO)
{
	npc			= BDT_1093_Addon_Franco;
	nr			= 900;
	condition	= DIA_Franco_PICKPOCKET_Condition;
	information	= DIA_Franco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzież tego amuletu będzie ryzykowna)";
};                       

FUNC INT DIA_Franco_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)
	&& (Npc_HasItems (self,ItAm_Addon_Franco) >= 1))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Franco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Franco_PICKPOCKET);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_BACK 		,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItAm_Addon_Franco, 1);
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Franco_PICKPOCKET);
		
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX]	= 196; //boah ey, ist ja ein super trick!
		self.attribute[ATR_HITPOINTS] 		= 196;
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
		
		
	};
};
	
func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Franco_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HI   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 1;
	condition   = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Franco_HI_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Franco_HI_Info()
{	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Jeśli wykonam dobrą robotę dla Franka, wpuści mnie do obozu.");
	
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_00");//Hej, czego szukasz? Chcesz wejść do obozu?
	AI_Output (other,self,"DIA_Addon_Franco_HI_15_01");//Tak, jestem...
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_02");//Nie interesuje mnie, coś ty za jeden. Jestem Franko, przywódca tego obozu.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_03");//Jeżeli wykażesz się poza obozem, zabiorę cię do środka.
	
	if (Ramon_News == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Franco_HI_08_04");//Strażnik bramy, Ramon, powie ci, kiedy w obozie będą potrzebni nowi ludzie. Porozmawiaj z nim.
		B_LogEntry (Topic_Addon_Franco,"Mam zapytać Ramona, strażnika przy bramie, czy potrzebują w obozie nowych ludzi.");
	};
};
//---------------------------------------------------------------------
//	Info Mission SumpfHai
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Hai   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 2;
	condition   = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent   = FALSE;
	description = "Thorus potrzebuje nowego człowieka.";
};
FUNC INT DIA_Addon_Franco_Hai_Condition()
{	
	if (Ramon_News == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Hai_Info()
{	
	
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_00");//Thorus potrzebuje nowego człowieka.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_01");//Dobrze, zajmę się tym.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_02");//Chwila, a co ze mną?
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_03");//Nic jeszcze nie zrobiłeś.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_04");//Sporo już osiągnąłem, ale ty nic o tym nie wiesz...
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_05");//Dobra, dać ci szansę? Proszę bardzo. Zabieraj dupsko do Logana. Ostatnio dokuczają mu bagienne węże.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_06");//Pomóż mu się ich pozbyć, a wtedy dostaniesz się do obozu.
	
	B_LogEntry (Topic_Addon_Franco,"Przed wpuszczeniem mnie do obozu Franko chce, żebym pomógł Loganowi.");
};
//---------------------------------------------------------------------
//	Info Logan Wo?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Wo   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 3;
	condition   = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent   = FALSE;
	description = "Gdzie znajdę tego Logana?";
};
FUNC INT DIA_Addon_Franco_Wo_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	&& (!Npc_IsDead (Logan))
	&& (MIS_HlpLogan == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Wo_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Wo_15_00");//Gdzie znajdę tego Logana?
	AI_Output (self,other,"DIA_Addon_Franco_Wo_08_01");//Gdy staniesz przed wejściem do obozu, idź w lewo wzdłuż urwiska. To kawałek drogi w bagno.
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Logan tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tot   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 5;
	condition   = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent   = FALSE;
	description = "Logan nie żyje.";
};
FUNC INT DIA_Addon_Franco_tot_Condition()
{	
	if (MIS_HlpLogan != LOG_SUCCESS)
	&&  Npc_IsDead (Logan)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tot_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tot_15_00");//Logan nie żyje.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_01");//Cholera. Był najlepszym myśliwym, jakiego mieliśmy. Szlag by to trafił!
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_02");//Wysłałem do obozu kogoś innego.
	
	if (MIS_HlpLogan == LOG_RUNNING)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};
//---------------------------------------------------------------------
//	Info Logan Success HAISUCCESS
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HaiSuccess   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 6;
	condition   = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent   = FALSE;
	description = "Pomogłem Loganowi...";
};
FUNC INT DIA_Addon_Franco_HaiSuccess_Condition()
{	
	if (MIS_HlpLogan == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_HaiSuccess_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_00");//Pomogłem Loganowi...
	
	if Npc_IsDead (Logan)
	{
		AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_01");//...ale on tego nie przeżył.
	};
	AI_Output (self,other,"DIA_Addon_Franco_HaiSuccess_08_02");//Dobra, walczyłeś z wężami - możesz się przydać - przynajmniej bardziej niż większość tutejszych chłopaków.
	B_GivePlayerXP (XP_Addon_HlpLogan);
	
	B_LogEntry (Topic_Addon_Franco,"Pomogłem Loganowi, ale to nie wystarczyło, aby Franko wpuścił mnie do obozu.");
};

//---------------------------------------------------------------------
//	Mis 2 (Edgor)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Mis2 (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 7;
	condition   = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent   = FALSE;
	description = "Czyli mogę wejść do obozu?";
};
FUNC INT DIA_Addon_Franco_Mis2_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	|| (Npc_KnowsInfo (other, DIA_Addon_Franco_tot))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Mis2_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_MIS2_15_00");//Czyli mogę wejść do obozu?
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_01");//Słuchaj - jest jeszcze jedna rzecz, do której mi się przydasz.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_02");//Kilka dni temu wysłałem na bagna Edgora.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_03");//Miał dla mnie zdobyć starą kamienną tabliczkę - ale od tamtej pory nikt go nie widział.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_04");//Poszukaj go i przynieś mi tę przeklętą tabliczkę.
	
	MIS_HlpEdgor = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Stoneplate,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Stoneplate,"Franko chce dostać kamienną tablicę, którą miał mu przynieść Edgor. Teraz ja muszę ją zdobyć.");
	
	B_LogEntry (Topic_Addon_Franco,"Przed wpuszczeniem mnie do obozu Franko chce, żebym pomógł Edgarowi.");
};

//---------------------------------------------------------------------
//	Info Logan While
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_While   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 8;
	condition   = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent   = FALSE;
	description = "A jak to wygląda od strony złota?";
};
FUNC INT DIA_Addon_Franco_While_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_HaiSuccess))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_While_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_While_15_00");//A jak to wygląda od strony złota?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_01");//Co?
	AI_Output (other,self,"DIA_Addon_Franco_While_15_02");//Dostanę zapłatę za moją pracę na bagnach?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_03");//Chcesz trochę złota? Pewnie, ile potrzebujesz? Pięćdziesiąt samorodków? Sto? Dam ci tyle, ile zdołasz udźwignąć...
	AI_Output (self,other,"DIA_Addon_Franco_While_08_04");//Co ty sobie wyobrażasz... że co? Żarty sobie stroisz?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_05");//A teraz ruszaj i zrób coś pożytecznego. Bo inaczej nie dostaniesz ani bryłki złota!
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info WOEDGOR
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_WOEDGOR   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 9;
	condition   = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent   = TRUE;
	description = "Więc gdzie znajdę tego Edgora?";
};
FUNC INT DIA_Addon_Franco_WOEDGOR_Condition()
{	
	if (MIS_HlpEdgor == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Addon_Stone_04 ) < 1)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_WOEDGOR_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_15_00"); //Więc gdzie znajdę tego Edgora?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_08_01"); //Chcesz znać łatwiejszą czy krótszą drogę?
	
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Chcę się tam dostać szybko." ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Powiedz mi, jaka jest łatwiejsza droga." ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output (self,other,"DIA_Addon_Franco_There_08_00"); //Wszędzie tam są ruiny. Gdzieś w nich siedzi.
	AI_Output (self,other,"DIA_Addon_Franco_There_08_01"); //Myślę, że jest dość rozgarnięty, żeby rozpalić ognisko, które powinieneś zobaczyć.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //Powiedz mi, jaka jest łatwiejsza droga.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //Idź mostem aż do bramy. Tam powinien stać Sancho.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //Skręć tam w lewo i idź wzdłuż mostu.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //Chcę się tam dostać szybko.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //Dobra, trochę w lewo i w bagno.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};
//---------------------------------------------------------------------
//	Info tafel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tafel   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 10;
	condition   = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent   = FALSE;
	description = "Tu masz tę kamienną tabliczkę.";
};
FUNC INT DIA_Addon_Franco_tafel_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04 ) >= 1)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tafel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tafel_15_00");//Tu masz tę kamienną tabliczkę.
	B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
	
	AI_Output (self,other,"DIA_Addon_Franco_tafel_08_01");//Dobrze, znakomicie. Kruk będzie z ciebie zadowolony.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HlpEdgor);
	
	B_LogEntry (Topic_Addon_Franco,"Przyniosłem Frankowi kamienną tablicę, której szukał.");
};

//---------------------------------------------------------------------
//	JemandAnderen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_JemandAnderen   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 11;
	condition   = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent   = FALSE;
	description = "A co z obozem? Mogę w końcu wejść?";
};
FUNC INT DIA_Addon_Franco_JemandAnderen_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_tafel))
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_JemandAnderen_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_JemandAnderen_15_00");//A co z obozem? Mogę w końcu wejść?
	
	if !Npc_IsDead (Logan)
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_01");//Nie, wysłałem tam Logana. Zajmował wyższą pozycję na mojej liście.
		
		Logan_Inside = TRUE;
		AI_Teleport (Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine (Logan,"LAGER");
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_02");//Nie, wysłałem już kogoś innego.
	};
	
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_03");//W obozie nie potrzebują nikogo więcej.
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_04");//Poza tym przydasz mi się tutaj, skoro nie ma już Logana.
		
	B_LogEntry (Topic_Addon_Franco,"Franko nie wpuści mnie do obozu. Coś mi się zdaje, że będę musiał się jakoś pozbyć tego 'frankowego problemu'...");
};

//---------------------------------------------------------------------
//	Info Fight
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Fight   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 12;
	condition   = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent   = TRUE;
	description = "Wpuść mnie, NATYCHMIAST!";
};
FUNC INT DIA_Addon_Franco_Fight_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_Fight_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Fight_15_00"); //Wpuść mnie, NATYCHMIAST!
	AI_Output (self,other,"DIA_Addon_Franco_Fight_08_01"); //A co się stanie, jeśli odmówię?
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	Info_AddChoice (DIA_Addon_Franco_Fight, "W takim razie jeszcze trochę poczekam..." ,DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Bardzo tego pożałujesz." ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Duel_15_00"); //Bardzo tego pożałujesz.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Duel_08_01"); //Próbujesz MI grozić? Myślę, że pora cię czegoś nauczyć...
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Nothing_15_00"); //W takim razie jeszcze trochę poczekam...
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Nothing_08_01"); //Właśnie.
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info Fight2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Pig   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 13;
	condition   = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent   = TRUE;
	description = "Ty świnio! Zaraz cię załatwię!";
};
FUNC INT DIA_Addon_Franco_Pig_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Pig_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Pig_15_00");//Ty świnio! Zaraz cię załatwię!
	AI_Output (self,other,"DIA_Addon_Franco_Pig_08_01");//Taki kurdupel, jak ty, chce się ze mną mierzyć? Poczekaj tylko!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




