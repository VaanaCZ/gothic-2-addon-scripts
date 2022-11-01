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
	description = "Tak už zase makáš?"; 
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
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hacker_15_00"); //Už zase makáš?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hacker_07_01"); //Jo, teë se snažím z tohohle dolu vykutat zlato do poslední mrtę.
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
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hi_15_00"); //Zdravím!
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hi_07_01"); //(nabručenę) Co chceš?
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
	description = "Kde bych sehnal krumpáč?";
};
FUNC INT DIA_Addon_Finn_Hacke_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Finn_Hacke_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Hacke_15_00"); //Kde bych sehnal krumpáč?
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_01"); //Bęž za kováâem Hunem. Ale i když budeš mít krumpáč, neznamená to, že se dostaneš do dolu.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_02"); //Jestli tam opravdu chceš, musíš si promluvit s Estebanem.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_03"); //Za Thorusem ani nemusíš chodit - ten tę pustí dovnitâ, jedinę když budeš mít červený kámen.
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
	description = "Poslyš, co si myslíš o Estebanovi?";
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
	AI_Output (other, self, "DIA_Addon_Finn_Esteban_15_00"); //Poslyš, co si myslíš o Estebanovi?
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_01"); //(opatrnę) Je zdejší šéf a je... no, myslím že je dobrej.
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_02"); //(váhavę) Vždycky do dolu posílá jenom dobrý chlapy. Myslím ty, kteâí se vyznají v dolování.
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
	description = "A víš nęco o dolování?";
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
	AI_Output (other, self, "DIA_Addon_Finn_Profi_15_00"); //A ty se v dolování vyznáš?
	AI_Output (self, other, "DIA_Addon_Finn_Profi_07_01"); //Jsem nejlepší!
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
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_00"); //No jasnę, šéfe. Chceš vidęt nejlepšího z dolu? Právę se na nęj koukáš.
	
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_01");//Ne, nęco jinýho. Zasvętím tę do tajemství kopáčů.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_02");//Občas se hodí do toho poâádnę majznout.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_03");//Když nękolikrát udeâíš a nic nevykopeš, pâejeë špičkou krumpáče po bocích kamene.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_04");//S trochou štęstí tak najdeš i více valounů najednou.
	
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
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_00");//No, nęco bys męl vędęt. Zlato není ruda. Je v tom jeden zatracenej rozdíl.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_01");//Tím myslím, že žádná ženská by si nejspíš na krk nepovęsila náhrdelník z rudy.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_02");//Pâi kopání postupuj odshora dolů. Tak nejlíp uvolníš nuggety.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_03");//Nękteâí kopáči to dęlaj jinak, ale to je mnohem složitęjší.

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
	description = "Mohl bys posoudit mé zlatokopecké schopnosti?";
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
	AI_Output (other, self, "DIA_Addon_Finn_ein_15_00");//Můžeš posoudit mé zlatokopecké schopnosti?
	
	if (Finn_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_01");//No jasnę, už v tom dęlám víc jak pętatâicet let. Můžu posoudit úplnę všecko.
		Finn_einmal = TRUE;
	};
	AI_Output (self, other, "DIA_Addon_Finn_ein_07_02");//Co se tebe týče, tak bych âekl, že jsi

	if (Hero_HackChance < 20)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_03"); //absolutní začátečník.
	}
	else if (Hero_HackChance < 40)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_04"); //celkem ucházející kopáč.
	}
	else if (Hero_HackChance < 55)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_05"); //zkušenej zlatokop.
	}
	else if (Hero_HackChance < 75)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_06"); //nefalšovanej kopáč.
	}
	else if (Hero_HackChance < 90)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_07"); //zatracenę dobrej kopáč.
	}
	else if (Hero_HackChance < 98)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_08"); //kopáčskej mistr.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_09"); //guru mezi kopáči.
		
		if (Finn_Gratulation == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Finn_ein_07_10");//Tak teë seš stejnę dobrej jak já. Gratuluju, kámo.
			B_GivePlayerXP (XP_Ambient*2);
			Snd_Play ("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};
	
	
	var string ConcatText;
	
	ConcatText = ConcatStrings ("Natęžené zlato: ", IntToString (Hero_HackChance));
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
	description	= "K tomu pokusu o Estabanovu vraždu...";
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
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_00"); //(opatrnę) Ano?
	AI_Output (other, self, "DIA_Addon_Finn_Attentat_15_01"); //Máš ponętí, kdo za tím stojí?
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_02"); //Proč to chceš vędęt?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Chci si s tím chlápkem promluvit.",DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Esteban ho chce zabít!",DIA_Addon_Finn_Attentat_ForTheBoss);
};
	
func void B_Addon_Finn_TellAll()
{
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_00"); //(vypráví) Pâi tom útoku jsem si zrovna šel ke kováâi Hunovi pro novej krumpáč.
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_01"); //Ale on tam nebyl.
	AI_Output (other, self, "DIA_Addon_Finn_TellAll_15_02"); //A co dál?
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_03"); //Obvykle tam VŽDYCKY bývá, takže je to FAKT podezâelý, to ti povím.
	
	Finn_TellAll = TRUE;
	B_LogEntry (Topic_Addon_Esteban, "Finn tvrdí, že Huno se od útoku už neobjevil.");
};
	
func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output (other, self, "DIA_Addon_Finn_ForTheBoss_15_00"); //Esteban ho chce nechat zabít!
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_01"); //No teda! Ty dęláš pro šéfa?
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_02"); //Pak ti povím, co vím.
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
};
	
func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output (other, self, "DIA_Addon_Finn_WannaTalk_15_00"); //Chci si s tím chlápkem promluvit.
	AI_Output (self, other, "DIA_Addon_Finn_WannaTalk_07_01"); //(obezâetnę) A co po nęm chceš?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Do toho ti nic není!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Mám pro nęj jistou zajímavou informaci.",DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Chci odkrouhnout Estebana a hledám nękoho, kdo mi s tím pomůže!",DIA_Addon_Finn_Attentat_KillEsteban);
};	
		
func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output (other, self, "DIA_Addon_Finn_KillEsteban_15_00"); //Chci oddęlat Estebana a hledám nękoho, kdo mi v tom pomůže!
	AI_Output (self, other, "DIA_Addon_Finn_KillEsteban_07_01"); //S tím nechci nic mít!
	
	Finn_Petzt = TRUE;
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output (other, self, "DIA_Addon_Finn_HaveInfos_15_00"); //Mám pro nęj zajímavou informaci.
	AI_Output (self, other, "DIA_Addon_Finn_HaveInfos_07_01"); //Ty ses spolčil s tím chlapem, co to rozkázal, že jo.
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Chci odkrouhnout Estebana a hledám nękoho, kdo mi s tím pomůže!",DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Po tom ti nic není!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"To rozhodnę ne!",DIA_Addon_Finn_Attentat_NoNo);
};

	func void DIA_Addon_Finn_Attentat_NoNo()
	{
		AI_Output (other, self, "DIA_Addon_Finn_NoNo_15_00"); //To teda ne!
		AI_Output (self, other, "DIA_Addon_Finn_NoNo_07_01"); //(odhadnę) No dobâe. Povím ti, co vím.
		
		B_Addon_Finn_TellAll();
		Info_ClearChoices (DIA_Addon_Finn_Attentat);
	};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{	
	AI_Output (other, self, "DIA_Addon_Finn_ForgetIt_15_00"); //Po tom ti nic není.
	AI_Output (self, other, "DIA_Addon_Finn_ForgetIt_07_01"); //Takže? Já o tý vęci stejnę nic nevím.
	
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
	description	= "Ještę k tomu útoku...";
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
	AI_Output (other, self, "DIA_Addon_Finn_Again_15_00"); //Ještę k tomu útoku.
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_01"); //Už jsem ti âekl všechno, co vím.
		
		Info_ClearChoices (DIA_Addon_Finn_Again);
		Info_AddChoice (DIA_Addon_Finn_Again, "OK... (zpęt)", DIA_Addon_Finn_Again_Exit);
		Info_AddChoice (DIA_Addon_Finn_Again, "Tak mi to âekni znova!", DIA_Addon_Finn_Again_Nochmal);		
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_02"); //Tak mę s tím už neotravuj.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Exit_15_00"); //(odhadnę) Dobâe.
	Info_ClearChoices (DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Nochmal_15_00"); //Tak mi to âekni znovu!
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Again);	
};


