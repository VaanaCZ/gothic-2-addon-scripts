//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //Co chce�? Vypadni!
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //Tak na co �ek�? B� k baru!
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "�ekl bych, �e jsi mistrem sv�ho �emesla.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Vypad� to, �e se� mistrem sv�ho �emesla.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//To u� jsem sly�el. P�inesls mi tu ocel?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//Ocel? Ne, mysl�m, �e si m� s n�k�m plete�.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Hmm, se� mi n�jak pov�domej. Nezn�me se odn�kud?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Jasn�, ze Star�ho t�bora.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Nem��u si vzpomenout odkud.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno prod�v� kov��sk� vybaven�.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Jasn�, ze Star�ho t�bora.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//Ze Star�ho t�bora? Aha, ty se� ten zv�davej chl�pek. J� myslel, �e jsi mrtvej.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//Jo, to si mysl� ka�d�. Kdo je�t� p�e�il?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//P�r. A n�kdo utek s Havranem, jako j�. Pro spoustu dal��ch se ale Starej t�bor stal hrobem.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//A odkud bychom se m�li zn�t?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Hm, m�m d�sn� d�ravou hlavu. No to je jedno.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "Pov�z mi o tom, jak jsi utekl.";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//Pov�z mi o tom �niku.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//Kdy� padla bari�ra, propuknul chaos.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//N�kdo se schov�val, n�kdo ut�kal a v�ude se rabovalo.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//A co jsi d�lal ty?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//Zrovna jsem vych�zel z t�bora, kdy� se najednou d�sn� rozsv�tlilo a cel� t�lo mi zalila d�sn� bolest.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//Ten zatracenej blesk m� zas�hnul! Jako bych ho furt je�t� sly�el.
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//Pak mi n�kdo �ek, �e m� na�el Thorus a vzal m� s sebou.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "Pot�ebuju lep�� zbroj.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Pot�ebuju lep�� zbroj.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //Tak si m��e� vz�t tuhle. Je drah�, ale za to pod�kuj Estebanovi.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Ten zatracenej pes vyb�r� poplatky z ka�d�ho brn�n�, kter� prod�m.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Zakoupit t�kou zbroj bandit� (Ochrana: zbran� 45, ��py 45. Cena: 2100 zlat�ch)", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk ��kal, �e mi pr� ud�l� cenu.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //Pov�d� Fisk? No, po��d mu dlu��m laskavost.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Zakoupit t�kou zbroj bandit� (Ochrana: zbran� 45, ��py 45. Cena: 1400 zlat�ch)", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Fan, tak j� si tu zbroj vezmu.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Jasn�.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //��dn� zlato, ��dn� zbroj.
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "K tomu pokusu o zavra�d�n� Estebana...";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //(nebezpe�n�) Co po mn� chce�?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Zji��uju, kdo v�z� za t�m �tokem.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //A pro� s t�m loz� za mnou?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //Myslel jsem, �e bys o tom mohl n�co v�d�t.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //J� nev�m NIC!
};


//----------------------------------------------------------------------
//	Paar Dinge geh�rt
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //(povzdech) A te� odsud hezky rychle vypadni, nebo se nezn�m!
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "U� jsem o tob� n�co sly�el.";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //Zaslechl jsem o tob� p�r v�c�.
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //No a?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //Zase ty? (hroziv�) Koukej, a� je to tentokr�t n�co d�le�it�ho!
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //Sly�el jsem, �e kdy� do�lo k tomu �toku, nebyls na sv�m m�st�.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //(nebezpe�n�) Co je�t�?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul tvrdil, �e Estebana nesn��.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //(nebezpe�n�) No a? On snad jo? Tak co d�l?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //Emilio t� pr�sknul! Ur�it� o tom �toku n�co v�!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //(klidn�) Tak ty sis pov�dal se star�m Emiliem?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //A nen� s�m, kdo t� podez�r�.
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //A co to m� jako znamenat?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Chci se p�idat k vrahovi!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Jestli m� s t�m �tokem n�co spole�n�ho, tak si to �eredn� odsk��e�!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "Zd� se, �e m�m Huna v hrsti.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //(hroziv�) Mo�n� bych si s n�m m�l taky promluvit. A pak bude UR�IT� tvrdit pravej opak!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //V�c u� nic.
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //Jestli m� s t�m �tokem n�co spole�n�ho, tak si to �eredn� odsk��e�!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //(otr�ven�) Ty se� takovej debil! To si v�n� mysl�, �e m��e� Estabanovi takhle podlejzat?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //Vypadni odsud!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //Chci se k tomu vrahovi p�idat!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //Proti Estebanovi? V�n�? No tak to doka�!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //U� hezky dlouho �ek�m na dod�vku oceli od pir�t�.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Po��t�m, �e ji zabavil Esteban, aby mi ji pak prodal za vy��� cenu.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //Samoz�ejm� to nem��e ud�lat s�m. Plat� je�t� p�r bandit�m z ba�in.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //Jak to v�?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //O�rali banditi v�dycky hodn� �van�j.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //A m� ten u�van�n� bandita n�jak� jm�no?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //Do jeho jm�na ti nic nen�. Ale ten, koho hled� TY, se jmenuje Juan. Jen�e toho u� jsem stejn� v t�bo�e n�jakou dobu nevid�l.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //Mus� se po n�m poohl�dnout v ba�in�.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno �ek�, a� mu pir�ti dodaj� n�jakou ocel. Pr� ji Estebanovi ukradl jak�si Juan, kter� se te� skr�v� kdesi v ba�in�ch.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Nap�ed mi pov�z, kdo stoj� za t�m �tokem!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Dob�e, ud�l�m to.", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //Fajn, ud�l�m to.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Dob�e. Uvid�me, jestli se ti d� v��it.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //Nap�ed mi pov�z, kdo v�z� za t�m �tokem.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //Ne. Nev���m ti.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Hele, tenhle rozhovor je o tom, jestli jdu s t�m, kdo stoj� za t�m �tokem, nebo s Estebanem.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //S k�m budu mluvit, to z�le�� na tob�.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //(povzdech) No dob�e. Spoj�m t� s t�m, kdo to m� na sv�dom�, ale z�le��, jak�m zp�sobem to �eknu, jasn�?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //B� k baru a promluv si s barmanem. V�ecko ostatn� se dozv� od n�j.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno ��kal, �e bych si m�l promluvit se Snafem.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "M�m tady tu ocel.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//M�m tu ocel.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //A d�l? Byl tam i Juan?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //Byl.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //J� to v�d�l. To byla pr�ce t� krysy Estebana.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Jsi v pohod�. Popravd� �e�eno jsem od tebe n�co takov�ho ne�ekal.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Tum�, za odm�nu si vezmi tohle.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //A jak to te� bude s na��m ujedn�n�m?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //Chlap, se kter�m chce� mluvit, na tebe �ek� u baru. Promluv si s barmanem.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno ��kal, �e bych si m�l promluvit se Snafem.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};






