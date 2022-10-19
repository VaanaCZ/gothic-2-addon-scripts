///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap1 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap1_EXIT_Condition;
	information = DIA_Marduk_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_JOB		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	condition	 = 	DIA_Marduk_JOB_Condition;
	information	 = 	DIA_Marduk_JOB_Info;
	permanent	 =	FALSE;	
	description	 = 	"Jakou pr�ci tu vykon�v�?";
};
func int DIA_Marduk_JOB_Condition ()
{
	return TRUE;
};
func void DIA_Marduk_JOB_Info ()
{
	AI_Output (other, self, "DIA_Marduk_JOB_15_00"); //Jakou pr�ci tu vykon�v�?
	AI_Output (self, other, "DIA_Marduk_JOB_05_01"); //P�ipravuji paladiny na boj proti zlu.
};
///////////////////////////////////////////////////////////////////////
//	Info Arbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Arbeit		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 = 	3;
	condition	 = 	DIA_Marduk_Arbeit_Condition;
	information	 = 	DIA_Marduk_Arbeit_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mohu pro tebe n�co ud�lat, Mist�e?";
};
func int DIA_Marduk_Arbeit_Condition ()
{	
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Marduk_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Arbeit_15_00"); //Mohu pro tebe n�co ud�lat, mist�e?
	AI_Output (self, other, "DIA_Marduk_Arbeit_05_01"); //Pro m�? Ne, nepot�ebuji tvou pomoc. Rad�ji se modli za blaho Innosov�ch v�le�n�k�, kte�� se vydali do Hornick�ho �dol�.
	
	MIS_MardukBeten = LOG_RUNNING;
	B_StartOtherRoutine (Sergio,"WAIT");
	
	Log_CreateTopic (Topic_MardukBeten,LOG_MISSION);
	Log_SetTopicStatus (Topic_MardukBeten,LOG_RUNNING);
	B_LogEntry (Topic_MardukBeten,"Mistr Marduk pro m� nem� ��dn� �koly. Pr� se m�m rad�i pomodlit za paladiny.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gebetet
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Gebetet		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 = 	3;
	condition	 = 	DIA_Marduk_Gebetet_Condition;
	information	 = 	DIA_Marduk_Gebetet_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pomodlil jsem se za paladiny.";
};
func int DIA_Marduk_Gebetet_Condition ()
{	
	if (MIS_MardukBeten == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, PC_PrayShrine_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Marduk_Gebetet_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Gebetet_15_00"); //Pomodlil jsem se za paladiny.
	AI_Output (self, other, "DIA_Marduk_Gebetet_05_01"); //Dob�e jsi u�inil. Nyn� si b� op�t po sv� pr�ci.
	
	MIS_MardukBeten = LOG_SUCCESS;
	B_GivePlayerXP (XP_MardukBeten);
	B_StartOtherRoutine (Sergio,"START");
};
///////////////////////////////////////////////////////////////////////
//	Info Das B�se
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Evil		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	condition	 = 	DIA_Marduk_Evil_Condition;
	information	 = 	DIA_Marduk_Evil_Info;
	permanent	 =	TRUE;
	description	 = 	"Co je to 'Zlo'?";
};
func int DIA_Marduk_Evil_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Marduk_JOB)
	{
		return TRUE;
	};
};
func void DIA_Marduk_Evil_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Evil_15_00"); //Co je to 'zlo'?
	AI_Output (self ,other, "DIA_Marduk_Evil_05_01"); //Zlo je v�ude. Je to moc Beliara, Innosova v��n�ho protivn�ka.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_02"); //Je to v�ezast�raj�c� temnota sna��c� se nav�dy zhasnout Innosovo sv�tlo.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_03"); //Beliar je P�n Temnot, Nen�visti a Ni�en�.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_04"); //Jen ti z n�s, jejich� srdce plane Innosov�ch svat�m ohn�m, mohou do sv�ta vn�st bla�en� Innosovo sv�tlo a zahubit temnotu.
};
///////////////////////////////////////////////////////////////////////
//	Info Paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Pal		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	condition	 = 	DIA_Marduk_Pal_Condition;
	information	 = 	DIA_Marduk_Pal_Info;
	permanent	 = 	FALSE;
	description	 = 	"Tady v kl�te�e ale �ij� jen m�gov� a novicov�.";
};
func int DIA_Marduk_Pal_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Marduk_JOB)
	{
		return TRUE;
	};
};
func void DIA_Marduk_Pal_Info ()
{
	AI_Output (other, self, "DIA_Marduk_Pal_15_00"); //Tady v kl�te�e ale �ij� jen m�gov� a novicov�.
	AI_Output (self, other, "DIA_Marduk_Pal_05_01"); //P�esn� tak. Na rozd�l od na�eho spole�enstv�, kter� uct�v� Innosovo u�en�...
	AI_Output (self, other, "DIA_Marduk_Pal_05_02"); //...paladinov� vzd�vaj� nejvy��� hold velk�m skutk�m na�eho P�na.
	AI_Output (self, other, "DIA_Marduk_Pal_05_03"); //My jsme Innosov�mi z�stupci, ale paladinov� jsou jeho v�le�n�ky, kte�� vyr�ej� v jeho jm�n� do bitev a ���� jeho sl�vu.
};
///////////////////////////////////////////////////////////////////////
//	Info BEFORETEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_BEFORETEACH		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 = 	3;
	condition	 = 	DIA_Marduk_BEFORETEACH_Condition;
	information	 = 	DIA_Marduk_BEFORETEACH_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mohl bys m� n�co nau�it?";
};
func int DIA_Marduk_BEFORETEACH_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Marduk_JOB)
	{
		return TRUE;
	};
};
func void DIA_Marduk_BEFORETEACH_Info ()
{
	AI_Output (other, self, "DIA_Marduk_BEFORETEACH_15_00"); //Mohl bys m� n�co nau�it?
	AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_01"); //Jsem odborn�k na magii ledu a bou�e. Mohu t� nau�it jejich s�le.
	
	if (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_02"); //U��m v�ak jen m�gy.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_TEACH		(C_INFO)
{
	npc			 = 	KDF_505_Marduk;
	nr			 =  10;
	condition	 = 	DIA_Marduk_TEACH_Condition;
	information	 = 	DIA_Marduk_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"R�d bych se od tebe n��emu p�iu�il (vytvo�it runy).";
};
func int DIA_Marduk_TEACH_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Marduk_BEFORETEACH)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Marduk_TEACH_Info ()
{
		var int abletolearn;
		
		abletolearn = 0;
		
		AI_Output (other, self, "DIA_Marduk_TEACH_15_00"); //U� m�.

		Info_ClearChoices 	(DIA_Marduk_TEACH);
		Info_AddChoice 		(DIA_Marduk_TEACH,DIALOG_BACK,DIA_Marduk_TEACH_BACK);
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE) 
		{
			Info_AddChoice 		(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_Zap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Zap)),DIA_Marduk_TEACH_ZAP);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE)
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_Marduk_TEACH_Icebolt);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3) 
		&& (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE) 
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_IceCube, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceCube)) ,DIA_Marduk_TEACH_IceCube);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE) 
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_ChargeZap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeZap)) ,DIA_Marduk_TEACH_ThunderBall);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4) 
		&& (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE) 
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_LightningFlash, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightningFlash)) ,DIA_Marduk_TEACH_LightningFlash);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
		{
			Info_AddChoice	(DIA_Marduk_TEACH, B_BuildLearnString (NAME_SPL_IceWave, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceWave)) ,DIA_Marduk_TEACH_IceWave);
			abletolearn = (abletolearn +1);
		};
		if (abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Marduk_TEACH_05_01"); //V tuto chv�li t� u�it nemohu.
			Info_ClearChoices 	(DIA_Marduk_TEACH);
		};
	
};
FUNC VOID DIA_Marduk_TEACH_BACK()
{
	Info_ClearChoices 	(DIA_Marduk_TEACH);
};
///////////////////////////////////////////////////////////////////////
//	MAGIER ZAUBER 
///////////////////////////////////////////////////////////////////////
FUNC VOID DIA_Marduk_TEACH_ZAP()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Zap);	
};
FUNC VOID DIA_Marduk_TEACH_Icebolt()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
FUNC VOID DIA_Marduk_TEACH_LightningFlash()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightningFlash);	
};
FUNC VOID DIA_Marduk_TEACH_IceCube()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceCube);	
};
FUNC VOID DIA_Marduk_TEACH_ThunderBall()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeZap);	
};
FUNC VOID DIA_Marduk_TEACH_IceWave()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceWave);	
};


//#####################################################################
//##
//##		Kapitel 2
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap2_EXIT_Condition;
	information = DIA_Marduk_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



//#####################################################################
//##
//##		Kapitel 3
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap3_EXIT_Condition;
	information = DIA_Marduk_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello Kap3 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap3_Hello   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 30;
	condition   = DIA_Marduk_Kap3_Hello_Condition;
	information = DIA_Marduk_Kap3_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Marduk_Kap3_Hello_Condition()
{
	if (Kapitel == 3)
	&& ((hero.guild == GIL_PAL)
	|| (hero.guild == GIL_DJG))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap3_Hello_Info()
{
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_00"); //V�tej, synu.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_01"); //Odkdy jsi jedn�m z paladin�?
	};
	if (hero.Guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_02"); //Odkud jsi p�i�el?
	};
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
	Info_AddChoice (DIA_Marduk_Kap3_Hello,"Do toho ti nic nen�.",DIA_Marduk_Kap3_Hello_NotYourConcern);
	
	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"Jen kr�tce.",DIA_Marduk_Kap3_Hello_Soon);
	};
	if (hero.Guild == GIL_DJG)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"P�i�el jsem z farem.",DIA_Marduk_Kap3_Hello_DJG);
	};
	
};

FUNC VOID DIA_Marduk_Kap3_Hello_NotYourConcern ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00"); //Do toho ti nic nen�.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01"); //(k�rav�) Paladin by m�l b�t za v�ech okolnost� zdvo�il� a slu�n�. Tv�m �kolem je chr�nit ty, kte�� se nemohou chr�nit sami.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02"); //(k�rav�) Je to privilegium a m�l bys b�t vd��n�, �e ti Innos nab�z� tuto mo�nost. Zamysli se nad t�m!
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03"); //(rozzloben�) B�valy �asy, kdy l�za nem�la povolen vstup do na�eho svat�ho kl�tera. Jsi smutn�m d�kazem, �e ty �asy pominuly.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04"); //(varovn�) Varuji t�, nic tady nezkou�ej, jinak bude� okam�it� potrest�n. Na n�jakou zbyte�nou m�rnost si nepotrp�me.
	};	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_Soon ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_Soon_15_00"); //Jen kr�tce.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_01"); //V tom p��pad� t� v�t�m. V t�hle bitv� budeme pot�ebovat ka�d�ho mu�e, jen� m� dost odvahy postavit se zlu.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_02"); //Osud n�s v�ech le�� v rukou lid�, jako jsi ty. Nech� ti Innos d� v�dy tolik odvahy, kolik bude� pot�ebovat.
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_DJG ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_DJG_15_00"); //P�i�el jsem z farem.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_01"); //V tom p��pad� mi pohostinnost vel� t� p�iv�tat. Douf�m, �e toho nebudu litovat.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_02"); //Nesna� se zneu��t sv�ho postaven� hosta, nebo bude� m�t velk� probl�my.
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Paladine trainieren 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_TrainPals   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 32;
	condition   = DIA_Marduk_TrainPals_Condition;
	information = DIA_Marduk_TrainPals_Info;
	permanent   = TRUE;
	description = "Co m� m��e� nau�it?";
};

//---------------------------------
	var int Marduk_TrainPals_permanent;
//---------------------------------
FUNC INT DIA_Marduk_TrainPals_Condition()
{
	if (hero.guild == GIL_PAL)
	&& (Marduk_TrainPals_permanent == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_TrainPals_Info()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_00"); //Co m� m��e� nau�it?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_01"); //Samoz�ejm� �e t� nemohu u�it ve zp�sobech veden� boje.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_02"); //Ale mohu ti p�ibl�it Innosovu podstatu a jeho dary.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_03"); //Krom� toho je m�m �kolem p�ipravit t� na ritu�l posv�cen� me�e.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_04"); //A magie?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_05"); //Zde u��me pouze na�e druhy magie. Kouzl�m paladin� se mus� nau�it ve m�st�.
	
	Info_ClearChoices (DIA_Marduk_TrainPals); 
	Info_AddChoice (DIA_Marduk_TrainPals,"Mo�n� pozd�ji.",DIA_Marduk_TrainPals_Later);
	Info_AddChoice (DIA_Marduk_TrainPals,"Co t�m mysl�?",DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice (DIA_Marduk_TrainPals,"Co je posv�cen� me�e?",DIA_Marduk_TrainPals_Blessing);
};

FUNC VOID DIA_Marduk_TrainPals_Later()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Later_15_00"); //Mo�n� pozd�ji.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Later_05_01"); //Jsi zde kdykoliv srde�n� v�t�n.
	
	Info_ClearChoices (DIA_Marduk_TrainPals);
};

FUNC VOID DIA_Marduk_TrainPals_Meaning()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_00"); //Co t�m mysl�?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_01"); //Kdy� musel Innos opustit n� sv�t, zanechal lidstvu ��st sv� svat� s�ly.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_02"); //Jen m�lo lidem je povoleno pou��vat jeho moc a dohl�et jeho jm�nem na spravedlnost.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_03"); //A co mi chce� p�ibl�it?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_04"); //Mohu t� nasm�rovat na spr�vnou cestu, abys rozeznal Innosovu podstatu a n�sledoval jej.
};

FUNC VOID DIA_Marduk_TrainPals_Blessing()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Blessing_15_00"); //Co je posv�cen� me�e?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_01"); //Posv�cen� me�e je jeden z nejsvat�j��ch ritu�l� v�ech paladin�.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_02"); //B�hem ceremonie proud� skrz �epel paladinova me�e Innosova s�la a d�v� zbrani netu�enou moc.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_03"); //Takto posv�cen� me� je paladinov�m nejcenn�j��m majetkem a bude jej prov�zet cel�m �ivotem.

	Marduk_TrainPals_permanent = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Schwertweihe 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_SwordBlessing   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 33;
	condition   = DIA_Marduk_SwordBlessing_Condition;
	information = DIA_Marduk_SwordBlessing_Info;
	permanent   = TRUE;
	description = "Chci posv�tit sv�j me�.";
};
FUNC INT DIA_Marduk_SwordBlessing_Condition()
{
	if (Marduk_TrainPals_permanent == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_SwordBlessing_Info()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_15_00"); //Chci posv�tit sv�j me�.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_01"); //Pokud jsi rozhodnut podniknout tento krok, bude� nejprve pot�ebovat magick� me�.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_02"); //S n�m bys m�l zaj�t do kaple a modlit se tam.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_03"); //B�hem modliteb - a po uv�liv�m daru na�emu P�nu Innosovi - bys m�l Innose po��dat o p��ze� a veden� v bitv� proti zlu.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_04"); //Pokud ti bude Innos p��zniv� naklon�n, bude od t� chv�le tv�j me� posv�cen� na��m P�nem.
	
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
	Info_AddChoice (DIA_Marduk_SwordBlessing,DIALOG_BACK,DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Jak� forma daru to m� b�t?",DIA_Marduk_SwordBlessing_Donation); 
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Kde mohu sehnat magick� me�?",DIA_Marduk_SwordBlessing_OreBlade);
};

FUNC VOID DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
};

FUNC VOID DIA_Marduk_SwordBlessing_Donation ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_Donation_15_00"); //Jak� forma daru to m� b�t?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_01"); //Inu, s p�ihl�dnut�m k milosti, kter� na tebe bude vlo�ena, vypad� obnos 5000 zlat�ch velice p�im��en�.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_02"); //M��e� ov�em klidn� v�novat i v�c.
};

FUNC VOID DIA_Marduk_SwordBlessing_OreBlade ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_00"); //Kde mohu sehnat magick� me�?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01"); //Zkus se zeptat ve m�st� kov��e Harada.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02"); //Pokud jsou paladinov� na ostrov�, dod�v� jim magick� me�e.
	if (Npc_IsDead (HARAD) == TRUE)
	{
		AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_03"); //Harad je mrtv�.
		AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04"); //To je mi l�to, v tom p��pad� si bude� muset po�kat, a� se s ostatn�mi paladiny vr�t� na pevninu.
	}; 
};

///////////////////////////////////////////////////////////////////////
//	Info PERM Kap3 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap3_PERM   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 39;
	condition   = DIA_Marduk_Kap3_PERM_Condition;
	information = DIA_Marduk_Kap3_PERM_Info;
	permanent   = TRUE;
	description = "Co je nov�ho?";
};
FUNC INT DIA_Marduk_Kap3_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap3_PERM_Info()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_00"); //Je n�co nov�ho?
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_01"); //Ano, nep��teli se poda�ilo nasadit do na�ich posv�tn�ch prostor zr�dce.
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_02"); //Ukradl Innosovo oko, jeden z na�ich nejd�le�it�j��ch artefakt�. A to je jenom vrcholek ledovce.
		//Joly:AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_03"); //Jak to mysl�?
	};
	
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_04"); //(znepokojen�) Nep��tel se o�ividn� dostal do m�sta.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_05"); //Jak to mysl�?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_06"); //Na ulici byl zavra�d�n jeden z paladin�, Lothar.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_07"); //(rozzloben�) Za bo��ho dne! Za�lo to u� p��li� daleko, ale ob�v�m se, �e to je jen za��tek.
	
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,DIALOG_BACK,DIA_Marduk_Kap3_PERM_BAck);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,"Co se bude d�t te�?",DIA_Marduk_Kap3_PERM_AndNow);
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Bennet je nevinn�.",DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}	
	else
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"U� byl ten vrah chycen?",DIA_Marduk_Kap3_PERM_Murderer);
	};
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Kam ten zlod�j �el?",DIA_Marduk_Kap3_PERM_thief);
	}; 
};

FUNC VOID DIA_Marduk_Kap3_PERM_BAck ()
{
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);	
};

FUNC VOID DIA_Marduk_Kap3_PERM_AndNow ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_00"); //Co se bude d�t te�?
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01"); //Budeme zlod�je pron�sledovat, jedno jak daleko. Chyt�me ho a postar�me se, aby jej stihl odpov�daj�c� trest.
		AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_02"); //Na to ale budeme nejprve muset zjistit, kdo t�m zlod�jem je.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03"); //Brzy na to p�ijdeme. A a� u� n�m to bude trvat jakkoliv dlouho, najdeme ho.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04"); //To p��sah�m u Innose.
	}
	else
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05"); //Vra�da, nav�c vra�da paladina, je jeden z nejhor��ch mo�n�ch zlo�in�.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06"); //Vrah bude bezpochyby odsouzen k smrti.
	};
};

FUNC VOID DIA_Marduk_Kap3_PERM_BennetisNotGuilty ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00"); //Bennet je nevinen. Ten sv�dek lhal.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01"); //Jak to v�?
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02"); //Na�el jsem d�kaz.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03"); //N�kdy m�m pocit, �e na�imi nejv�t��mi nep��teli jsou zrada a hami�nost.
};

FUNC VOID DIA_Marduk_Kap3_PERM_Murderer ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_00"); //U� byl ten vrah chycen?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01"); //Na�t�st� ano. Byl to jeden z t�ch hrdlo�ez� z Onarovy farmy.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_02"); //Kdo?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03"); //Nev�m, jak se jmenuje. Mezi t�mi �old�ky je ale jist� p�r takov�ch, od nich� by t� takov� skutek nep�ekvapil.
};

FUNC VOID DIA_Marduk_Kap3_PERM_thief ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_thief_15_00"); //Kam ten zlod�j �el?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_01"); //To nev�m, odb�hl sm�rem k br�n�, jako by byl posedl�, a pak zmizel.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_02"); //Ale a� u� se schov� kamkoliv, a� si zaleze pod jak�koliv k�men, Innos�v vztek jej sraz� a sp�l� jeho �ernou du�i.
};

//#####################################################################
//##
//##		Kapitel 4
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap4_EXIT_Condition;
	information = DIA_Marduk_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM Kap4U5 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap4U5_PERM   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 49;
	condition   = DIA_Marduk_Kap4U5_PERM_Condition;
	information = DIA_Marduk_Kap4U5_PERM_Info;
	permanent   = TRUE;
	description = "Co je nov�ho?";
};
FUNC INT DIA_Marduk_Kap4U5_PERM_Condition()
{
	if (Kapitel == 4)
	|| (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap4U5_PERM_Info()
{
	AI_Output (other,self ,"DIA_Marduk_Kap4U5_PERM_15_00"); //Je n�co nov�ho?
	AI_Output (self ,other,"DIA_Marduk_Kap4U5_PERM_05_01"); //Ne, bohu�el ne, situace je st�le velice kritick�.
};

//#####################################################################
//##
//##		Kapitel 5
//##
//##################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Marduk_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_505_Marduk;
	nr          = 999;
	condition   = DIA_Marduk_Kap5_EXIT_Condition;
	information = DIA_Marduk_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Marduk_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Marduk_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Marduk_PICKPOCKET (C_INFO)
{
	npc			= KDF_505_Marduk;
	nr			= 900;
	condition	= DIA_Marduk_PICKPOCKET_Condition;
	information	= DIA_Marduk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Marduk_PICKPOCKET_Condition()
{
	C_Beklauen (36, 40);
};
 
FUNC VOID DIA_Marduk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Marduk_PICKPOCKET);
	Info_AddChoice		(DIA_Marduk_PICKPOCKET, DIALOG_BACK 		,DIA_Marduk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Marduk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Marduk_PICKPOCKET_DoIt);
};

func void DIA_Marduk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Marduk_PICKPOCKET);
};
	
func void DIA_Marduk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Marduk_PICKPOCKET);
};


