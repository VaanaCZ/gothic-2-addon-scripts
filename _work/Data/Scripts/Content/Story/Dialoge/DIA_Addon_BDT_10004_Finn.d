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
	description = "Tak u� zase mak�?"; 
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
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hacker_15_00"); //U� zase mak�?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hacker_07_01"); //Jo, te� se sna��m z tohohle dolu vykutat zlato do posledn� mrt�.
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
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hi_15_00"); //Zdrav�m!
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hi_07_01"); //(nabru�en�) Co chce�?
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
	description = "Kde bych sehnal krump��?";
};
FUNC INT DIA_Addon_Finn_Hacke_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Finn_Hacke_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Hacke_15_00"); //Kde bych sehnal krump��?
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_01"); //B� za kov��em Hunem. Ale i kdy� bude� m�t krump��, neznamen� to, �e se dostane� do dolu.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_02"); //Jestli tam opravdu chce�, mus� si promluvit s Estebanem.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_03"); //Za Thorusem ani nemus� chodit - ten t� pust� dovnit�, jedin� kdy� bude� m�t �erven� k�men.
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
	description = "Posly�, co si mysl� o Estebanovi?";
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
	AI_Output (other, self, "DIA_Addon_Finn_Esteban_15_00"); //Posly�, co si mysl� o Estebanovi?
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_01"); //(opatrn�) Je zdej�� ��f a je... no, mysl�m �e je dobrej.
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_02"); //(v�hav�) V�dycky do dolu pos�l� jenom dobr� chlapy. Mysl�m ty, kte�� se vyznaj� v dolov�n�.
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
	description = "A v� n�co o dolov�n�?";
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
	AI_Output (other, self, "DIA_Addon_Finn_Profi_15_00"); //A ty se v dolov�n� vyzn�?
	AI_Output (self, other, "DIA_Addon_Finn_Profi_07_01"); //Jsem nejlep��!
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
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_00"); //No jasn�, ��fe. Chce� vid�t nejlep��ho z dolu? Pr�v� se na n�j kouk�.
	
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_01");//Ne, n�co jin�ho. Zasv�t�m t� do tajemstv� kop���.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_02");//Ob�as se hod� do toho po��dn� majznout.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_03");//Kdy� n�kolikr�t ude�� a nic nevykope�, p�eje� �pi�kou krump��e po boc�ch kamene.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_04");//S trochou �t�st� tak najde� i v�ce valoun� najednou.
	
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
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_00");//No, n�co bys m�l v�d�t. Zlato nen� ruda. Je v tom jeden zatracenej rozd�l.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_01");//T�m mysl�m, �e ��dn� �ensk� by si nejsp� na krk nepov�sila n�hrdeln�k z rudy.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_02");//P�i kop�n� postupuj odshora dol�. Tak nejl�p uvoln� nuggety.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_03");//N�kte�� kop��i to d�laj jinak, ale to je mnohem slo�it�j��.

	B_Upgrade_hero_HackChance(10);
};
//---------------------------------------------------------------------
//	Info einsch�tzen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_ein   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 7;
	condition   = DIA_Addon_Finn_ein_Condition;
	information = DIA_Addon_Finn_ein_Info;
	permanent   = TRUE;
	description = "Mohl bys posoudit m� zlatokopeck� schopnosti?";
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
	AI_Output (other, self, "DIA_Addon_Finn_ein_15_00");//M��e� posoudit m� zlatokopeck� schopnosti?
	
	if (Finn_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_01");//No jasn�, u� v tom d�l�m v�c jak p�tat�icet let. M��u posoudit �pln� v�ecko.
		Finn_einmal = TRUE;
	};
	AI_Output (self, other, "DIA_Addon_Finn_ein_07_02");//Co se tebe t��e, tak bych �ekl, �e jsi

	if (Hero_HackChance < 20)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_03"); //absolutn� za��te�n�k.
	}
	else if (Hero_HackChance < 40)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_04"); //celkem uch�zej�c� kop��.
	}
	else if (Hero_HackChance < 55)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_05"); //zku�enej zlatokop.
	}
	else if (Hero_HackChance < 75)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_06"); //nefal�ovanej kop��.
	}
	else if (Hero_HackChance < 90)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_07"); //zatracen� dobrej kop��.
	}
	else if (Hero_HackChance < 98)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_08"); //kop��skej mistr.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_09"); //guru mezi kop��i.
		
		if (Finn_Gratulation == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Finn_ein_07_10");//Tak te� se� stejn� dobrej jak j�. Gratuluju, k�mo.
			B_GivePlayerXP (XP_Ambient*2);
			Snd_Play ("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};
	
	
	var string ConcatText;
	
	ConcatText = ConcatStrings ("Nat�en� zlato: ", IntToString (Hero_HackChance));
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
	description	= "K tomu pokusu o Estabanovu vra�du...";
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
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_00"); //(opatrn�) Ano?
	AI_Output (other, self, "DIA_Addon_Finn_Attentat_15_01"); //M� pon�t�, kdo za t�m stoj�?
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_02"); //Pro� to chce� v�d�t?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Chci si s t�m chl�pkem promluvit.",DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Esteban ho chce zab�t!",DIA_Addon_Finn_Attentat_ForTheBoss);
};
	
func void B_Addon_Finn_TellAll()
{
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_00"); //(vypr�v�) P�i tom �toku jsem si zrovna �el ke kov��i Hunovi pro novej krump��.
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_01"); //Ale on tam nebyl.
	AI_Output (other, self, "DIA_Addon_Finn_TellAll_15_02"); //A co d�l?
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_03"); //Obvykle tam V�DYCKY b�v�, tak�e je to FAKT podez�el�, to ti pov�m.
	
	Finn_TellAll = TRUE;
	B_LogEntry (Topic_Addon_Esteban, "Finn tvrd�, �e Huno se od �toku u� neobjevil.");
};
	
func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output (other, self, "DIA_Addon_Finn_ForTheBoss_15_00"); //Esteban ho chce nechat zab�t!
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_01"); //No teda! Ty d�l� pro ��fa?
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_02"); //Pak ti pov�m, co v�m.
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
};
	
func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output (other, self, "DIA_Addon_Finn_WannaTalk_15_00"); //Chci si s t�m chl�pkem promluvit.
	AI_Output (self, other, "DIA_Addon_Finn_WannaTalk_07_01"); //(obez�etn�) A co po n�m chce�?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Do toho ti nic nen�!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"M�m pro n�j jistou zaj�mavou informaci.",DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Chci odkrouhnout Estebana a hled�m n�koho, kdo mi s t�m pom��e!",DIA_Addon_Finn_Attentat_KillEsteban);
};	
		
func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output (other, self, "DIA_Addon_Finn_KillEsteban_15_00"); //Chci odd�lat Estebana a hled�m n�koho, kdo mi v tom pom��e!
	AI_Output (self, other, "DIA_Addon_Finn_KillEsteban_07_01"); //S t�m nechci nic m�t!
	
	Finn_Petzt = TRUE;
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output (other, self, "DIA_Addon_Finn_HaveInfos_15_00"); //M�m pro n�j zaj�mavou informaci.
	AI_Output (self, other, "DIA_Addon_Finn_HaveInfos_07_01"); //Ty ses spol�il s t�m chlapem, co to rozk�zal, �e jo.
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Chci odkrouhnout Estebana a hled�m n�koho, kdo mi s t�m pom��e!",DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Po tom ti nic nen�!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"To rozhodn� ne!",DIA_Addon_Finn_Attentat_NoNo);
};

	func void DIA_Addon_Finn_Attentat_NoNo()
	{
		AI_Output (other, self, "DIA_Addon_Finn_NoNo_15_00"); //To teda ne!
		AI_Output (self, other, "DIA_Addon_Finn_NoNo_07_01"); //(odhadn�) No dob�e. Pov�m ti, co v�m.
		
		B_Addon_Finn_TellAll();
		Info_ClearChoices (DIA_Addon_Finn_Attentat);
	};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{	
	AI_Output (other, self, "DIA_Addon_Finn_ForgetIt_15_00"); //Po tom ti nic nen�.
	AI_Output (self, other, "DIA_Addon_Finn_ForgetIt_07_01"); //Tak�e? J� o t� v�ci stejn� nic nev�m.
	
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
	description	= "Je�t� k tomu �toku...";
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
	AI_Output (other, self, "DIA_Addon_Finn_Again_15_00"); //Je�t� k tomu �toku.
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_01"); //U� jsem ti �ekl v�echno, co v�m.
		
		Info_ClearChoices (DIA_Addon_Finn_Again);
		Info_AddChoice (DIA_Addon_Finn_Again, "OK... (zp�t)", DIA_Addon_Finn_Again_Exit);
		Info_AddChoice (DIA_Addon_Finn_Again, "Tak mi to �ekni znova!", DIA_Addon_Finn_Again_Nochmal);		
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_02"); //Tak m� s t�m u� neotravuj.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Exit_15_00"); //(odhadn�) Dob�e.
	Info_ClearChoices (DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Nochmal_15_00"); //Tak mi to �ekni znovu!
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Again);	
};


