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
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");//Nie zab��d�, bo sko�czysz jako mi�so dla w�y.
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
	description = "(Kradzie� tego amuletu b�dzie ryzykowna)";
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
	B_LogEntry (Topic_Addon_Franco,"Je�li wykonam dobr� robot� dla Franka, wpu�ci mnie do obozu.");
	
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_00");//Hej, czego szukasz? Chcesz wej�� do obozu?
	AI_Output (other,self,"DIA_Addon_Franco_HI_15_01");//Tak, jestem...
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_02");//Nie interesuje mnie, co� ty za jeden. Jestem Franko, przyw�dca tego obozu.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_03");//Je�eli wyka�esz si� poza obozem, zabior� ci� do �rodka.
	
	if (Ramon_News == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Franco_HI_08_04");//Stra�nik bramy, Ramon, powie ci, kiedy w obozie b�d� potrzebni nowi ludzie. Porozmawiaj z nim.
		B_LogEntry (Topic_Addon_Franco,"Mam zapyta� Ramona, stra�nika przy bramie, czy potrzebuj� w obozie nowych ludzi.");
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
	description = "Thorus potrzebuje nowego cz�owieka.";
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
	
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_00");//Thorus potrzebuje nowego cz�owieka.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_01");//Dobrze, zajm� si� tym.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_02");//Chwila, a co ze mn�?
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_03");//Nic jeszcze nie zrobi�e�.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_04");//Sporo ju� osi�gn��em, ale ty nic o tym nie wiesz...
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_05");//Dobra, da� ci szans�? Prosz� bardzo. Zabieraj dupsko do Logana. Ostatnio dokuczaj� mu bagienne w�e.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_06");//Pom� mu si� ich pozby�, a wtedy dostaniesz si� do obozu.
	
	B_LogEntry (Topic_Addon_Franco,"Przed wpuszczeniem mnie do obozu Franko chce, �ebym pom�g� Loganowi.");
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
	description = "Gdzie znajd� tego Logana?";
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
	AI_Output (other,self,"DIA_Addon_Franco_Wo_15_00");//Gdzie znajd� tego Logana?
	AI_Output (self,other,"DIA_Addon_Franco_Wo_08_01");//Gdy staniesz przed wej�ciem do obozu, id� w lewo wzd�u� urwiska. To kawa�ek drogi w bagno.
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
	description = "Logan nie �yje.";
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
	AI_Output (other,self,"DIA_Addon_Franco_tot_15_00");//Logan nie �yje.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_01");//Cholera. By� najlepszym my�liwym, jakiego mieli�my. Szlag by to trafi�!
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_02");//Wys�a�em do obozu kogo� innego.
	
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
	description = "Pomog�em Loganowi...";
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
	AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_00");//Pomog�em Loganowi...
	
	if Npc_IsDead (Logan)
	{
		AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_01");//...ale on tego nie prze�y�.
	};
	AI_Output (self,other,"DIA_Addon_Franco_HaiSuccess_08_02");//Dobra, walczy�e� z w�ami - mo�esz si� przyda� - przynajmniej bardziej ni� wi�kszo�� tutejszych ch�opak�w.
	B_GivePlayerXP (XP_Addon_HlpLogan);
	
	B_LogEntry (Topic_Addon_Franco,"Pomog�em Loganowi, ale to nie wystarczy�o, aby Franko wpu�ci� mnie do obozu.");
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
	description = "Czyli mog� wej�� do obozu?";
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
	AI_Output (other,self,"DIA_Addon_Franco_MIS2_15_00");//Czyli mog� wej�� do obozu?
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_01");//S�uchaj - jest jeszcze jedna rzecz, do kt�rej mi si� przydasz.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_02");//Kilka dni temu wys�a�em na bagna Edgora.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_03");//Mia� dla mnie zdoby� star� kamienn� tabliczk� - ale od tamtej pory nikt go nie widzia�.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_04");//Poszukaj go i przynie� mi t� przekl�t� tabliczk�.
	
	MIS_HlpEdgor = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Stoneplate,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Stoneplate,"Franko chce dosta� kamienn� tablic�, kt�r� mia� mu przynie�� Edgor. Teraz ja musz� j� zdoby�.");
	
	B_LogEntry (Topic_Addon_Franco,"Przed wpuszczeniem mnie do obozu Franko chce, �ebym pom�g� Edgarowi.");
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
	description = "A jak to wygl�da od strony z�ota?";
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
	AI_Output (other,self,"DIA_Addon_Franco_While_15_00");//A jak to wygl�da od strony z�ota?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_01");//Co?
	AI_Output (other,self,"DIA_Addon_Franco_While_15_02");//Dostan� zap�at� za moj� prac� na bagnach?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_03");//Chcesz troch� z�ota? Pewnie, ile potrzebujesz? Pi��dziesi�t samorodk�w? Sto? Dam ci tyle, ile zdo�asz ud�wign��...
	AI_Output (self,other,"DIA_Addon_Franco_While_08_04");//Co ty sobie wyobra�asz... �e co? �arty sobie stroisz?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_05");//A teraz ruszaj i zr�b co� po�ytecznego. Bo inaczej nie dostaniesz ani bry�ki z�ota!
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
	description = "Wi�c gdzie znajd� tego Edgora?";
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
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_15_00"); //Wi�c gdzie znajd� tego Edgora?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_08_01"); //Chcesz zna� �atwiejsz� czy kr�tsz� drog�?
	
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Chc� si� tam dosta� szybko." ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Powiedz mi, jaka jest �atwiejsza droga." ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output (self,other,"DIA_Addon_Franco_There_08_00"); //Wsz�dzie tam s� ruiny. Gdzie� w nich siedzi.
	AI_Output (self,other,"DIA_Addon_Franco_There_08_01"); //My�l�, �e jest do�� rozgarni�ty, �eby rozpali� ognisko, kt�re powiniene� zobaczy�.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //Powiedz mi, jaka jest �atwiejsza droga.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //Id� mostem a� do bramy. Tam powinien sta� Sancho.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //Skr�� tam w lewo i id� wzd�u� mostu.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //Chc� si� tam dosta� szybko.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //Dobra, troch� w lewo i w bagno.
	
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
	description = "Tu masz t� kamienn� tabliczk�.";
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
	AI_Output (other,self,"DIA_Addon_Franco_tafel_15_00");//Tu masz t� kamienn� tabliczk�.
	B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
	
	AI_Output (self,other,"DIA_Addon_Franco_tafel_08_01");//Dobrze, znakomicie. Kruk b�dzie z ciebie zadowolony.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HlpEdgor);
	
	B_LogEntry (Topic_Addon_Franco,"Przynios�em Frankowi kamienn� tablic�, kt�rej szuka�.");
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
	description = "A co z obozem? Mog� w ko�cu wej��?";
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
	AI_Output (other,self,"DIA_Addon_Franco_JemandAnderen_15_00");//A co z obozem? Mog� w ko�cu wej��?
	
	if !Npc_IsDead (Logan)
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_01");//Nie, wys�a�em tam Logana. Zajmowa� wy�sz� pozycj� na mojej li�cie.
		
		Logan_Inside = TRUE;
		AI_Teleport (Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine (Logan,"LAGER");
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_02");//Nie, wys�a�em ju� kogo� innego.
	};
	
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_03");//W obozie nie potrzebuj� nikogo wi�cej.
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_04");//Poza tym przydasz mi si� tutaj, skoro nie ma ju� Logana.
		
	B_LogEntry (Topic_Addon_Franco,"Franko nie wpu�ci mnie do obozu. Co� mi si� zdaje, �e b�d� musia� si� jako� pozby� tego 'frankowego problemu'...");
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
	description = "Wpu�� mnie, NATYCHMIAST!";
};
FUNC INT DIA_Addon_Franco_Fight_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_Fight_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Fight_15_00"); //Wpu�� mnie, NATYCHMIAST!
	AI_Output (self,other,"DIA_Addon_Franco_Fight_08_01"); //A co si� stanie, je�li odm�wi�?
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	Info_AddChoice (DIA_Addon_Franco_Fight, "W takim razie jeszcze troch� poczekam..." ,DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Bardzo tego po�a�ujesz." ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Duel_15_00"); //Bardzo tego po�a�ujesz.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Duel_08_01"); //Pr�bujesz MI grozi�? My�l�, �e pora ci� czego� nauczy�...
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Nothing_15_00"); //W takim razie jeszcze troch� poczekam...
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Nothing_08_01"); //W�a�nie.
	
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
	description = "Ty �winio! Zaraz ci� za�atwi�!";
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
	AI_Output (other,self,"DIA_Addon_Franco_Pig_15_00");//Ty �winio! Zaraz ci� za�atwi�!
	AI_Output (self,other,"DIA_Addon_Franco_Pig_08_01");//Taki kurdupel, jak ty, chce si� ze mn� mierzy�? Poczekaj tylko!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




