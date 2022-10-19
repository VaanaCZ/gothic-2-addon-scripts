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
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");//Nie zab³¹dŸ, bo skoñczysz jako miêso dla wê¿y.
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
	description = "(Kradzie¿ tego amuletu bêdzie ryzykowna)";
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
	B_LogEntry (Topic_Addon_Franco,"Jeœli wykonam dobr¹ robotê dla Franka, wpuœci mnie do obozu.");
	
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_00");//Hej, czego szukasz? Chcesz wejœæ do obozu?
	AI_Output (other,self,"DIA_Addon_Franco_HI_15_01");//Tak, jestem...
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_02");//Nie interesuje mnie, coœ ty za jeden. Jestem Franko, przywódca tego obozu.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_03");//Je¿eli wyka¿esz siê poza obozem, zabiorê ciê do œrodka.
	
	if (Ramon_News == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Franco_HI_08_04");//Stra¿nik bramy, Ramon, powie ci, kiedy w obozie bêd¹ potrzebni nowi ludzie. Porozmawiaj z nim.
		B_LogEntry (Topic_Addon_Franco,"Mam zapytaæ Ramona, stra¿nika przy bramie, czy potrzebuj¹ w obozie nowych ludzi.");
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
	description = "Thorus potrzebuje nowego cz³owieka.";
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
	
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_00");//Thorus potrzebuje nowego cz³owieka.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_01");//Dobrze, zajmê siê tym.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_02");//Chwila, a co ze mn¹?
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_03");//Nic jeszcze nie zrobi³eœ.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_04");//Sporo ju¿ osi¹gn¹³em, ale ty nic o tym nie wiesz...
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_05");//Dobra, daæ ci szansê? Proszê bardzo. Zabieraj dupsko do Logana. Ostatnio dokuczaj¹ mu bagienne wê¿e.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_06");//Pomó¿ mu siê ich pozbyæ, a wtedy dostaniesz siê do obozu.
	
	B_LogEntry (Topic_Addon_Franco,"Przed wpuszczeniem mnie do obozu Franko chce, ¿ebym pomóg³ Loganowi.");
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
	description = "Gdzie znajdê tego Logana?";
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
	AI_Output (other,self,"DIA_Addon_Franco_Wo_15_00");//Gdzie znajdê tego Logana?
	AI_Output (self,other,"DIA_Addon_Franco_Wo_08_01");//Gdy staniesz przed wejœciem do obozu, idŸ w lewo wzd³u¿ urwiska. To kawa³ek drogi w bagno.
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
	description = "Logan nie ¿yje.";
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
	AI_Output (other,self,"DIA_Addon_Franco_tot_15_00");//Logan nie ¿yje.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_01");//Cholera. By³ najlepszym myœliwym, jakiego mieliœmy. Szlag by to trafi³!
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_02");//Wys³a³em do obozu kogoœ innego.
	
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
	description = "Pomog³em Loganowi...";
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
	AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_00");//Pomog³em Loganowi...
	
	if Npc_IsDead (Logan)
	{
		AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_01");//...ale on tego nie prze¿y³.
	};
	AI_Output (self,other,"DIA_Addon_Franco_HaiSuccess_08_02");//Dobra, walczy³eœ z wê¿ami - mo¿esz siê przydaæ - przynajmniej bardziej ni¿ wiêkszoœæ tutejszych ch³opaków.
	B_GivePlayerXP (XP_Addon_HlpLogan);
	
	B_LogEntry (Topic_Addon_Franco,"Pomog³em Loganowi, ale to nie wystarczy³o, aby Franko wpuœci³ mnie do obozu.");
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
	description = "Czyli mogê wejœæ do obozu?";
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
	AI_Output (other,self,"DIA_Addon_Franco_MIS2_15_00");//Czyli mogê wejœæ do obozu?
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_01");//S³uchaj - jest jeszcze jedna rzecz, do której mi siê przydasz.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_02");//Kilka dni temu wys³a³em na bagna Edgora.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_03");//Mia³ dla mnie zdobyæ star¹ kamienn¹ tabliczkê - ale od tamtej pory nikt go nie widzia³.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_04");//Poszukaj go i przynieœ mi tê przeklêt¹ tabliczkê.
	
	MIS_HlpEdgor = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Stoneplate,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Stoneplate,"Franko chce dostaæ kamienn¹ tablicê, któr¹ mia³ mu przynieœæ Edgor. Teraz ja muszê j¹ zdobyæ.");
	
	B_LogEntry (Topic_Addon_Franco,"Przed wpuszczeniem mnie do obozu Franko chce, ¿ebym pomóg³ Edgarowi.");
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
	description = "A jak to wygl¹da od strony z³ota?";
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
	AI_Output (other,self,"DIA_Addon_Franco_While_15_00");//A jak to wygl¹da od strony z³ota?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_01");//Co?
	AI_Output (other,self,"DIA_Addon_Franco_While_15_02");//Dostanê zap³atê za moj¹ pracê na bagnach?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_03");//Chcesz trochê z³ota? Pewnie, ile potrzebujesz? Piêædziesi¹t samorodków? Sto? Dam ci tyle, ile zdo³asz udŸwign¹æ...
	AI_Output (self,other,"DIA_Addon_Franco_While_08_04");//Co ty sobie wyobra¿asz... ¿e co? ¯arty sobie stroisz?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_05");//A teraz ruszaj i zrób coœ po¿ytecznego. Bo inaczej nie dostaniesz ani bry³ki z³ota!
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
	description = "Wiêc gdzie znajdê tego Edgora?";
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
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_15_00"); //Wiêc gdzie znajdê tego Edgora?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_08_01"); //Chcesz znaæ ³atwiejsz¹ czy krótsz¹ drogê?
	
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Chcê siê tam dostaæ szybko." ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Powiedz mi, jaka jest ³atwiejsza droga." ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output (self,other,"DIA_Addon_Franco_There_08_00"); //Wszêdzie tam s¹ ruiny. Gdzieœ w nich siedzi.
	AI_Output (self,other,"DIA_Addon_Franco_There_08_01"); //Myœlê, ¿e jest doœæ rozgarniêty, ¿eby rozpaliæ ognisko, które powinieneœ zobaczyæ.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //Powiedz mi, jaka jest ³atwiejsza droga.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //IdŸ mostem a¿ do bramy. Tam powinien staæ Sancho.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //Skrêæ tam w lewo i idŸ wzd³u¿ mostu.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //Chcê siê tam dostaæ szybko.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //Dobra, trochê w lewo i w bagno.
	
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
	description = "Tu masz tê kamienn¹ tabliczkê.";
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
	AI_Output (other,self,"DIA_Addon_Franco_tafel_15_00");//Tu masz tê kamienn¹ tabliczkê.
	B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
	
	AI_Output (self,other,"DIA_Addon_Franco_tafel_08_01");//Dobrze, znakomicie. Kruk bêdzie z ciebie zadowolony.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HlpEdgor);
	
	B_LogEntry (Topic_Addon_Franco,"Przynios³em Frankowi kamienn¹ tablicê, której szuka³.");
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
	description = "A co z obozem? Mogê w koñcu wejœæ?";
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
	AI_Output (other,self,"DIA_Addon_Franco_JemandAnderen_15_00");//A co z obozem? Mogê w koñcu wejœæ?
	
	if !Npc_IsDead (Logan)
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_01");//Nie, wys³a³em tam Logana. Zajmowa³ wy¿sz¹ pozycjê na mojej liœcie.
		
		Logan_Inside = TRUE;
		AI_Teleport (Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine (Logan,"LAGER");
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_02");//Nie, wys³a³em ju¿ kogoœ innego.
	};
	
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_03");//W obozie nie potrzebuj¹ nikogo wiêcej.
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_04");//Poza tym przydasz mi siê tutaj, skoro nie ma ju¿ Logana.
		
	B_LogEntry (Topic_Addon_Franco,"Franko nie wpuœci mnie do obozu. Coœ mi siê zdaje, ¿e bêdê musia³ siê jakoœ pozbyæ tego 'frankowego problemu'...");
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
	description = "Wpuœæ mnie, NATYCHMIAST!";
};
FUNC INT DIA_Addon_Franco_Fight_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_Fight_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Fight_15_00"); //Wpuœæ mnie, NATYCHMIAST!
	AI_Output (self,other,"DIA_Addon_Franco_Fight_08_01"); //A co siê stanie, jeœli odmówiê?
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	Info_AddChoice (DIA_Addon_Franco_Fight, "W takim razie jeszcze trochê poczekam..." ,DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Bardzo tego po¿a³ujesz." ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Duel_15_00"); //Bardzo tego po¿a³ujesz.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Duel_08_01"); //Próbujesz MI groziæ? Myœlê, ¿e pora ciê czegoœ nauczyæ...
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Nothing_15_00"); //W takim razie jeszcze trochê poczekam...
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Nothing_08_01"); //W³aœnie.
	
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
	description = "Ty œwinio! Zaraz ciê za³atwiê!";
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
	AI_Output (other,self,"DIA_Addon_Franco_Pig_15_00");//Ty œwinio! Zaraz ciê za³atwiê!
	AI_Output (self,other,"DIA_Addon_Franco_Pig_08_01");//Taki kurdupel, jak ty, chce siê ze mn¹ mierzyæ? Poczekaj tylko!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




