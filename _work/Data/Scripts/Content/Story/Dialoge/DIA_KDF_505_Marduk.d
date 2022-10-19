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
	description	 = 	"Jakou práci tu vykonáváš?";
};
func int DIA_Marduk_JOB_Condition ()
{
	return TRUE;
};
func void DIA_Marduk_JOB_Info ()
{
	AI_Output (other, self, "DIA_Marduk_JOB_15_00"); //Jakou práci tu vykonáváš?
	AI_Output (self, other, "DIA_Marduk_JOB_05_01"); //Pâipravuji paladiny na boj proti zlu.
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
	description	 = 	"Mohu pro tebe nêco udêlat, Mistâe?";
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
	AI_Output (other, self, "DIA_Marduk_Arbeit_15_00"); //Mohu pro tebe nêco udêlat, mistâe?
	AI_Output (self, other, "DIA_Marduk_Arbeit_05_01"); //Pro mê? Ne, nepotâebuji tvou pomoc. Radêji se modli za blaho Innosových váleèníkù, kteâí se vydali do Hornického údolí.
	
	MIS_MardukBeten = LOG_RUNNING;
	B_StartOtherRoutine (Sergio,"WAIT");
	
	Log_CreateTopic (Topic_MardukBeten,LOG_MISSION);
	Log_SetTopicStatus (Topic_MardukBeten,LOG_RUNNING);
	B_LogEntry (Topic_MardukBeten,"Mistr Marduk pro mê nemá žádné úkoly. Prý se mám radši pomodlit za paladiny.");
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
	AI_Output (self, other, "DIA_Marduk_Gebetet_05_01"); //Dobâe jsi uèinil. Nyní si bêž opêt po své práci.
	
	MIS_MardukBeten = LOG_SUCCESS;
	B_GivePlayerXP (XP_MardukBeten);
	B_StartOtherRoutine (Sergio,"START");
};
///////////////////////////////////////////////////////////////////////
//	Info Das Böse
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
	AI_Output (self ,other, "DIA_Marduk_Evil_05_01"); //Zlo je všude. Je to moc Beliara, Innosova vêèného protivníka.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_02"); //Je to všezastírající temnota snažící se navždy zhasnout Innosovo svêtlo.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_03"); //Beliar je Pán Temnot, Nenávisti a Nièení.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_04"); //Jen ti z nás, jejichž srdce plane Innosových svatým ohnêm, mohou do svêta vnést blažené Innosovo svêtlo a zahubit temnotu.
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
	description	 = 	"Tady v klášteâe ale žijí jen mágové a novicové.";
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
	AI_Output (other, self, "DIA_Marduk_Pal_15_00"); //Tady v klášteâe ale žijí jen mágové a novicové.
	AI_Output (self, other, "DIA_Marduk_Pal_05_01"); //Pâesnê tak. Na rozdíl od našeho spoleèenství, které uctívá Innosovo uèení...
	AI_Output (self, other, "DIA_Marduk_Pal_05_02"); //...paladinové vzdávají nejvyšší hold velkým skutkùm našeho Pána.
	AI_Output (self, other, "DIA_Marduk_Pal_05_03"); //My jsme Innosovými zástupci, ale paladinové jsou jeho váleèníky, kteâí vyrážejí v jeho jménê do bitev a šíâí jeho slávu.
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
	description	 = 	"Mohl bys mê nêco nauèit?";
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
	AI_Output (other, self, "DIA_Marduk_BEFORETEACH_15_00"); //Mohl bys mê nêco nauèit?
	AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_01"); //Jsem odborník na magii ledu a bouâe. Mohu tê nauèit jejich síle.
	
	if (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_02"); //Uèím však jen mágy.
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
	description	 = 	"Rád bych se od tebe nêèemu pâiuèil (vytvoâit runy).";
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
		
		AI_Output (other, self, "DIA_Marduk_TEACH_15_00"); //Uè mê.

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
			AI_Output (self, other, "DIA_Marduk_TEACH_05_01"); //V tuto chvíli tê uèit nemohu.
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
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_00"); //Vítej, synu.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_01"); //Odkdy jsi jedním z paladinù?
	};
	if (hero.Guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_02"); //Odkud jsi pâišel?
	};
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
	Info_AddChoice (DIA_Marduk_Kap3_Hello,"Do toho ti nic není.",DIA_Marduk_Kap3_Hello_NotYourConcern);
	
	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"Jen krátce.",DIA_Marduk_Kap3_Hello_Soon);
	};
	if (hero.Guild == GIL_DJG)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"Pâišel jsem z farem.",DIA_Marduk_Kap3_Hello_DJG);
	};
	
};

FUNC VOID DIA_Marduk_Kap3_Hello_NotYourConcern ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00"); //Do toho ti nic není.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01"); //(káravê) Paladin by mêl být za všech okolností zdvoâilý a slušný. Tvým úkolem je chránit ty, kteâí se nemohou chránit sami.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02"); //(káravê) Je to privilegium a mêl bys být vdêèný, že ti Innos nabízí tuto možnost. Zamysli se nad tím!
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03"); //(rozzlobenê) Bývaly èasy, kdy lùza nemêla povolen vstup do našeho svatého kláštera. Jsi smutným dùkazem, že ty èasy pominuly.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04"); //(varovnê) Varuji tê, nic tady nezkoušej, jinak budeš okamžitê potrestán. Na nêjakou zbyteènou mírnost si nepotrpíme.
	};	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_Soon ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_Soon_15_00"); //Jen krátce.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_01"); //V tom pâípadê tê vítám. V téhle bitvê budeme potâebovat každého muže, jenž má dost odvahy postavit se zlu.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_02"); //Osud nás všech leží v rukou lidí, jako jsi ty. Nechã ti Innos dá vždy tolik odvahy, kolik budeš potâebovat.
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_DJG ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_DJG_15_00"); //Pâišel jsem z farem.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_01"); //V tom pâípadê mi pohostinnost velí tê pâivítat. Doufám, že toho nebudu litovat.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_02"); //Nesnaž se zneužít svého postavení hosta, nebo budeš mít velké problémy.
	
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
	description = "Co mê mùžeš nauèit?";
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
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_00"); //Co mê mùžeš nauèit?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_01"); //Samozâejmê že tê nemohu uèit ve zpùsobech vedení boje.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_02"); //Ale mohu ti pâiblížit Innosovu podstatu a jeho dary.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_03"); //Kromê toho je mým úkolem pâipravit tê na rituál posvêcení meèe.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_04"); //A magie?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_05"); //Zde uèíme pouze naše druhy magie. Kouzlùm paladinù se musíš nauèit ve mêstê.
	
	Info_ClearChoices (DIA_Marduk_TrainPals); 
	Info_AddChoice (DIA_Marduk_TrainPals,"Možná pozdêji.",DIA_Marduk_TrainPals_Later);
	Info_AddChoice (DIA_Marduk_TrainPals,"Co tím myslíš?",DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice (DIA_Marduk_TrainPals,"Co je posvêcení meèe?",DIA_Marduk_TrainPals_Blessing);
};

FUNC VOID DIA_Marduk_TrainPals_Later()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Later_15_00"); //Možná pozdêji.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Later_05_01"); //Jsi zde kdykoliv srdeènê vítán.
	
	Info_ClearChoices (DIA_Marduk_TrainPals);
};

FUNC VOID DIA_Marduk_TrainPals_Meaning()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_00"); //Co tím myslíš?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_01"); //Když musel Innos opustit náš svêt, zanechal lidstvu èást své svaté síly.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_02"); //Jen málo lidem je povoleno používat jeho moc a dohlížet jeho jménem na spravedlnost.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_03"); //A co mi chceš pâiblížit?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_04"); //Mohu tê nasmêrovat na správnou cestu, abys rozeznal Innosovu podstatu a následoval jej.
};

FUNC VOID DIA_Marduk_TrainPals_Blessing()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Blessing_15_00"); //Co je posvêcení meèe?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_01"); //Posvêcení meèe je jeden z nejsvatêjších rituálù všech paladinù.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_02"); //Bêhem ceremonie proudí skrz èepel paladinova meèe Innosova síla a dává zbrani netušenou moc.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_03"); //Takto posvêcený meè je paladinovým nejcennêjším majetkem a bude jej provázet celým životem.

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
	description = "Chci posvêtit svùj meè.";
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
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_15_00"); //Chci posvêtit svùj meè.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_01"); //Pokud jsi rozhodnut podniknout tento krok, budeš nejprve potâebovat magický meè.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_02"); //S ním bys mêl zajít do kaple a modlit se tam.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_03"); //Bêhem modliteb - a po uvážlivém daru našemu Pánu Innosovi - bys mêl Innose požádat o pâízeà a vedení v bitvê proti zlu.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_04"); //Pokud ti bude Innos pâíznivê naklonên, bude od té chvíle tvùj meè posvêcený naším Pánem.
	
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
	Info_AddChoice (DIA_Marduk_SwordBlessing,DIALOG_BACK,DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Jaká forma daru to má být?",DIA_Marduk_SwordBlessing_Donation); 
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Kde mohu sehnat magický meè?",DIA_Marduk_SwordBlessing_OreBlade);
};

FUNC VOID DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
};

FUNC VOID DIA_Marduk_SwordBlessing_Donation ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_Donation_15_00"); //Jaká forma daru to má být?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_01"); //Inu, s pâihlédnutím k milosti, která na tebe bude vložena, vypadá obnos 5000 zlatých velice pâimêâenê.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_02"); //Mùžeš ovšem klidnê vênovat i víc.
};

FUNC VOID DIA_Marduk_SwordBlessing_OreBlade ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_00"); //Kde mohu sehnat magický meè?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01"); //Zkus se zeptat ve mêstê kováâe Harada.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02"); //Pokud jsou paladinové na ostrovê, dodává jim magické meèe.
	if (Npc_IsDead (HARAD) == TRUE)
	{
		AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_03"); //Harad je mrtvý.
		AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04"); //To je mi líto, v tom pâípadê si budeš muset poèkat, až se s ostatními paladiny vrátíš na pevninu.
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
	description = "Co je nového?";
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
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_00"); //Je nêco nového?
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_01"); //Ano, nepâíteli se podaâilo nasadit do našich posvátných prostor zrádce.
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_02"); //Ukradl Innosovo oko, jeden z našich nejdùležitêjších artefaktù. A to je jenom vrcholek ledovce.
		//Joly:AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_03"); //Jak to myslíš?
	};
	
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_04"); //(znepokojenê) Nepâítel se oèividnê dostal do mêsta.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_05"); //Jak to myslíš?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_06"); //Na ulici byl zavraždên jeden z paladinù, Lothar.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_07"); //(rozzlobenê) Za božího dne! Zašlo to už pâíliš daleko, ale obávám se, že to je jen zaèátek.
	
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,DIALOG_BACK,DIA_Marduk_Kap3_PERM_BAck);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,"Co se bude dít teë?",DIA_Marduk_Kap3_PERM_AndNow);
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Bennet je nevinný.",DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}	
	else
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Už byl ten vrah chycen?",DIA_Marduk_Kap3_PERM_Murderer);
	};
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Kam ten zlodêj šel?",DIA_Marduk_Kap3_PERM_thief);
	}; 
};

FUNC VOID DIA_Marduk_Kap3_PERM_BAck ()
{
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);	
};

FUNC VOID DIA_Marduk_Kap3_PERM_AndNow ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_00"); //Co se bude dít teë?
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01"); //Budeme zlodêje pronásledovat, jedno jak daleko. Chytíme ho a postaráme se, aby jej stihl odpovídající trest.
		AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_02"); //Na to ale budeme nejprve muset zjistit, kdo tím zlodêjem je.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03"); //Brzy na to pâijdeme. A aã už nám to bude trvat jakkoliv dlouho, najdeme ho.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04"); //To pâísahám u Innose.
	}
	else
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05"); //Vražda, navíc vražda paladina, je jeden z nejhorších možných zloèinù.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06"); //Vrah bude bezpochyby odsouzen k smrti.
	};
};

FUNC VOID DIA_Marduk_Kap3_PERM_BennetisNotGuilty ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00"); //Bennet je nevinen. Ten svêdek lhal.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01"); //Jak to víš?
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02"); //Našel jsem dùkaz.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03"); //Nêkdy mám pocit, že našimi nejvêtšími nepâáteli jsou zrada a hamižnost.
};

FUNC VOID DIA_Marduk_Kap3_PERM_Murderer ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_00"); //Už byl ten vrah chycen?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01"); //Naštêstí ano. Byl to jeden z têch hrdloâezù z Onarovy farmy.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_02"); //Kdo?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03"); //Nevím, jak se jmenuje. Mezi têmi žoldáky je ale jistê pár takových, od nichž by tê takový skutek nepâekvapil.
};

FUNC VOID DIA_Marduk_Kap3_PERM_thief ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_thief_15_00"); //Kam ten zlodêj šel?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_01"); //To nevím, odbêhl smêrem k bránê, jako by byl posedlý, a pak zmizel.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_02"); //Ale aã už se schová kamkoliv, aã si zaleze pod jakýkoliv kámen, Innosùv vztek jej srazí a spálí jeho èernou duši.
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
	description = "Co je nového?";
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
	AI_Output (other,self ,"DIA_Marduk_Kap4U5_PERM_15_00"); //Je nêco nového?
	AI_Output (self ,other,"DIA_Marduk_Kap4U5_PERM_05_01"); //Ne, bohužel ne, situace je stále velice kritická.
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


