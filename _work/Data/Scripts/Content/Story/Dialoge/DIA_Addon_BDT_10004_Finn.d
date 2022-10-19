//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_EXIT   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 999;
	condition   = DIA_Addon_Finn_EXIT_Condition;
	information = DIA_Addon_Finn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Finn_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Finn_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Finn_PICKPOCKET (C_INFO)
{
	npc			= BDT_10004_Addon_Finn;
	nr			= 900;
	condition	= DIA_Addon_Finn_PICKPOCKET_Condition;
	information	= DIA_Addon_Finn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Finn_PICKPOCKET_Condition()
{
	C_Beklauen (35, 50);
};
 
FUNC VOID DIA_Addon_Finn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Finn_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Finn_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Finn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Finn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Finn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Finn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Finn_PICKPOCKET);
};
	
func void DIA_Addon_Finn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Finn_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Hacker   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 9;
	condition   = DIA_Addon_Finn_Hacker_Condition;
	information = DIA_Addon_Finn_Hacker_Info;
	permanent   = TRUE;
	description = "Znowu w pracy?"; 
};
FUNC INT DIA_Addon_Finn_Hacker_Condition()
{	
	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hacker_15_00"); //Znowu w pracy?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hacker_07_01"); //Tak, mam zamiar zdobyæ ostatni kawa³ek z³ota z tej kopalni.
};
//----------------------------------------------------------------------
//	Info Hacke
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Hi   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 1;
	condition   = DIA_Addon_Finn_Hi_Condition;
	information = DIA_Addon_Finn_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE; 
};
FUNC INT DIA_Addon_Finn_Hi_Condition()
{	
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hi_15_00"); //Czeœæ.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hi_07_01"); //Czego chcesz?
};

//----------------------------------------------------------------------
//	Info Hacke
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Hacke   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 2;
	condition   = DIA_Addon_Finn_Hacke_Condition;
	information = DIA_Addon_Finn_Hacke_Info;
	permanent   = FALSE;
	description = "Gdzie dostanê kilof?";
};
FUNC INT DIA_Addon_Finn_Hacke_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Finn_Hacke_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Hacke_15_00"); //Gdzie dostanê kilof?
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_01"); //IdŸ do Huno, kowala. Ale posiadanie kilofa wcale nie otworzy ci drogi do kopalni.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_02"); //Jeœli chcesz wejœæ, musisz najpierw porozmawiaæ z Estebanem.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_03"); //Do Thorusa mo¿esz nawet nie iœæ - jeœli nie masz czerwonego kamienia, to ciê nie wpuœci.
};

//----------------------------------------------------------------------
//	Info Esteban
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Esteban   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 3;
	condition   = DIA_Addon_Finn_Esteban_Condition;
	information = DIA_Addon_Finn_Esteban_Info;
	permanent   = FALSE;
	description = "Co myœlisz o Estebanie?";
};
FUNC INT DIA_Addon_Finn_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Finn_Hacke)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Esteban_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Esteban_15_00"); //Co myœlisz o Estebanie?
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_01"); //On tu jest szefem... Myœlê, ¿e jest w porz¹dku.
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_02"); //Porz¹dnych ch³opaków zawsze wpuszcza do kopalni. To znaczy takich, którzy maj¹ pojêcie o górnictwie.
};

//----------------------------------------------------------------------
//	Info Esteban
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Profi (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 4;
	condition   = DIA_Addon_Finn_Profi_Condition;
	information = DIA_Addon_Finn_Profi_Info;
	permanent   = FALSE;
	description = "Znasz siê na górnictwie?";
};
FUNC INT DIA_Addon_Finn_Profi_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Finn_Esteban)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Profi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Profi_15_00"); //Znasz siê na górnictwie?
	AI_Output (self, other, "DIA_Addon_Finn_Profi_07_01"); //Jestem najlepszy!
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10004_Finn_Mine   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 5;
	condition   = DIA_Addon_Finn_Mine_Condition;
	information = DIA_Addon_Finn_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Finn_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_00"); //W porz¹dku, szefie. Chcesz, ¿eby w kopalni pracowali najlepsi? Czyli znowu wkraczam do akcji.
	
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_01");//I jeszcze jedno: zdradzê ci sekret Kopaczy.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_02");//Czas po³upaæ nieco g³azów.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_03");//Jak uderzy³eœ ju¿ kilka razy, ale nic nie odkopa³eœ, to przeci¹gnij ostrzem kilofa po skale.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_04");//Przy odrobinie szczêœcia zdobêdziesz sporo kawa³ków.
	
	B_Upgrade_hero_HackChance(10);
	Knows_Truemmerschlag = TRUE;
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Gold   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 6;
	condition   = DIA_Addon_Finn_Gold_Condition;
	information = DIA_Addon_Finn_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Finn_Gold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_00");//Trzeba wiedzieæ kilka rzeczy. Z³oto to nie ruda. To piekielnie du¿a ró¿nica.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_01");//Jaka kobieta nosi³aby na szyi ³añcuch wykonany z rudy?
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_02");//Zacznij kopaæ od góry do do³u. Tym sposobem naj³atwiej odkopaæ samorodki.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_03");//Niektórzy kopacze robi¹ odwrotnie, ale to o wiele trudniejsze.

	B_Upgrade_hero_HackChance(10);
};
//---------------------------------------------------------------------
//	Info einschätzen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_ein   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 7;
	condition   = DIA_Addon_Finn_ein_Condition;
	information = DIA_Addon_Finn_ein_Info;
	permanent   = TRUE;
	description = "Potrafisz oceniæ moje umiejêtnoœci kopania z³ota?";
};
FUNC INT DIA_Addon_Finn_ein_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};
var int Finn_einmal;
var int Finn_Gratulation;
FUNC VOID DIA_Addon_Finn_ein_Info()
{
	AI_Output (other, self, "DIA_Addon_Finn_ein_15_00");//Potrafisz oceniæ moje umiejêtnoœci kopania z³ota?
	
	if (Finn_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_01");//Pewnie. Robiê tu ju¿ od ponad 35 lat. Wszystko poznam!
		Finn_einmal = TRUE;
	};
	AI_Output (self, other, "DIA_Addon_Finn_ein_07_02");//Powiedzia³bym, ¿e jesteœ...

	if (Hero_HackChance < 20)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_03"); //nieopierzonym ¿ó³todziobem.
	}
	else if (Hero_HackChance < 40)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_04"); //przeciêtnym kopaczem.
	}
	else if (Hero_HackChance < 55)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_05"); //doœwiadczonym kopaczem.
	}
	else if (Hero_HackChance < 75)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_06"); //urodzonym kopaczem.
	}
	else if (Hero_HackChance < 90)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_07"); //piekielnie dobrym kopaczem.
	}
	else if (Hero_HackChance < 98)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_08"); //mistrzem kopania.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_09"); //guru kopaczy.
		
		if (Finn_Gratulation == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Finn_ein_07_10");//Teraz jesteœ tak dobry, jak ja. Gratulujê, partnerze!
			B_GivePlayerXP (XP_Ambient*2);
			Snd_Play ("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};
	
	
	var string ConcatText;
	
	ConcatText = ConcatStrings ("Kopanie z³ota: ", IntToString (Hero_HackChance));
	ConcatText = ConcatStrings (ConcatText, " procent");
	PrintScreen (concatText, -1, -1, FONT_ScreenSmall,2);
};

//----------------------------------------------------------------------
//	Attentat
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Attentat   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 8;
	condition   = DIA_Addon_Finn_Attentat_Condition;
	information = DIA_Addon_Finn_Attentat_Info;
	permanent   = FALSE;
	description	= "A co do próby zabójstwa Estebana...";
};
FUNC INT DIA_Addon_Finn_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentats auf Esteban
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_00"); //Tak?
	AI_Output (other, self, "DIA_Addon_Finn_Attentat_15_01"); //Wiesz, kto stoi za tym wszystkim?
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_02"); //Dlaczego chcesz to wiedzieæ?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Chcê porozmawiaæ z tym goœciem.",DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Esteban chce go widzieæ martwym!",DIA_Addon_Finn_Attentat_ForTheBoss);
};
	
func void B_Addon_Finn_TellAll()
{
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_00"); //Po próbie zabójstwa chcia³em odebraæ swój kilof od kowala Huno.
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_01"); //Nie by³o go tam jednak.
	AI_Output (other, self, "DIA_Addon_Finn_TellAll_15_02"); //No i?
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_03"); //On ZAWSZE tam jest. Wed³ug mnie to DOŒÆ podejrzane.
	
	Finn_TellAll = TRUE;
	B_LogEntry (Topic_Addon_Esteban, "Finn mówi, ¿e Huno by³ nieobecny w czasie próby zabójstwa.");
};
	
func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output (other, self, "DIA_Addon_Finn_ForTheBoss_15_00"); //Esteban chce go widzieæ martwym!
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_01"); //Och! Pracujesz dla szefa?
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_02"); //W takim razie powiem ci, co wiem.
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
};
	
func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output (other, self, "DIA_Addon_Finn_WannaTalk_15_00"); //Chcê porozmawiaæ z tym goœciem.
	AI_Output (self, other, "DIA_Addon_Finn_WannaTalk_07_01"); //A czego od niego chcesz?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"To nie twoja sprawa!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Mam dla niego ciekawe informacje!",DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Chcê za³atwiæ Estebana i szukam sprzymierzeñca!",DIA_Addon_Finn_Attentat_KillEsteban);
};	
		
func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output (other, self, "DIA_Addon_Finn_KillEsteban_15_00"); //Chcê za³atwiæ Estebana i szukam sprzymierzeñca!
	AI_Output (self, other, "DIA_Addon_Finn_KillEsteban_07_01"); //Nie chcê mieæ z tym nic wspólnego!
	
	Finn_Petzt = TRUE;
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output (other, self, "DIA_Addon_Finn_HaveInfos_15_00"); //Mam dla niego ciekawe informacje!
	AI_Output (self, other, "DIA_Addon_Finn_HaveInfos_07_01"); //Nie jesteœ w zmowie z tym klientem, prawda?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Chcê za³atwiæ Estebana i szukam sprzymierzeñca!",DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"To nie twoja sprawa!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"W ¿adnym razie!",DIA_Addon_Finn_Attentat_NoNo);
};

	func void DIA_Addon_Finn_Attentat_NoNo()
	{
		AI_Output (other, self, "DIA_Addon_Finn_NoNo_15_00"); //W ¿adnym razie!
		AI_Output (self, other, "DIA_Addon_Finn_NoNo_07_01"); //Dobrze! Powiem ci, co wiem.
		
		B_Addon_Finn_TellAll();
		Info_ClearChoices (DIA_Addon_Finn_Attentat);
	};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{	
	AI_Output (other, self, "DIA_Addon_Finn_ForgetIt_15_00"); //To nie twoja sprawa!
	AI_Output (self, other, "DIA_Addon_Finn_ForgetIt_07_01"); //No i? Có¿, na ten temat tak¿e nic nie wiem.
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
};

//----------------------------------------------------------------------
//	Nochmal Attentat
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Again  (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 9;
	condition   = DIA_Addon_Finn_Again_Condition;
	information = DIA_Addon_Finn_Again_Info;
	permanent   = TRUE;
	description	= "A wracaj¹c do tej próby zabójstwa...";
};
FUNC INT DIA_Addon_Finn_Again_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Finn_Attentat))
	&& (!Npc_IsDead(Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Again_Info()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_15_00"); //A wracaj¹c do tej próby zabójstwa...
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_01"); //Powiedzia³em ci ju¿ wszystko...
		
		Info_ClearChoices (DIA_Addon_Finn_Again);
		Info_AddChoice (DIA_Addon_Finn_Again, "Dobrze... (wróæ)", DIA_Addon_Finn_Again_Exit);
		Info_AddChoice (DIA_Addon_Finn_Again, "No có¿, opowiedz mi to raz jeszcze.", DIA_Addon_Finn_Again_Nochmal);		
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_02"); //Zostaw mnie samego z tym badziewiem!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Exit_15_00"); //Dobrze...
	Info_ClearChoices (DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Nochmal_15_00"); //No có¿, opowiedz mi to raz jeszcze.
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Again);	
};


