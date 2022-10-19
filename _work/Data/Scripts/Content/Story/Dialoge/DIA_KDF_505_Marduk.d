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
	description	 = 	"Czym siê zajmujesz?";
};
func int DIA_Marduk_JOB_Condition ()
{
	return TRUE;
};
func void DIA_Marduk_JOB_Info ()
{
	AI_Output (other, self, "DIA_Marduk_JOB_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other, "DIA_Marduk_JOB_05_01"); //Przygotowujê paladynów do walki z si³ami Z³a.
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
	description	 = 	"Czy mogê coœ dla ciebie zrobiæ, Mistrzu?";
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
	AI_Output (other, self, "DIA_Marduk_Arbeit_15_00"); //Czy mogê coœ dla ciebie zrobiæ, Mistrzu?
	AI_Output (self, other, "DIA_Marduk_Arbeit_05_01"); //Dla mnie? Nie, nie potrzebujê twojej pomocy. Lepiej pomódl siê za szczêœliwy powrót wojowników Innosa, którzy udali siê do Górniczej Doliny.
	
	MIS_MardukBeten = LOG_RUNNING;
	B_StartOtherRoutine (Sergio,"WAIT");
	
	Log_CreateTopic (Topic_MardukBeten,LOG_MISSION);
	Log_SetTopicStatus (Topic_MardukBeten,LOG_RUNNING);
	B_LogEntry (Topic_MardukBeten,"Mistrz Marduk nie ma dla mnie ¿adnych zadañ. Powiedzia³ mi, ¿ebym lepiej poszed³ zmówiæ modlitwê za paladynów.");
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
	description	 = 	"Modli³em siê za paladynów.";
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
	AI_Output (other, self, "DIA_Marduk_Gebetet_15_00"); //Modli³em siê za paladynów.
	AI_Output (self, other, "DIA_Marduk_Gebetet_05_01"); //To bardzo dobrze. A teraz wracaj do swoich zajêæ.
	
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
	description	 = 	"Co to s¹ 'si³y Z³a'?";
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
	AI_Output (other, self, "DIA_Marduk_Evil_15_00"); //Co to s¹ 'si³y Z³a'?
	AI_Output (self ,other, "DIA_Marduk_Evil_05_01"); //Z³o czai siê wszêdzie. Jest ¿ywio³em Beliara, odwiecznego przeciwnika Innosa.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_02"); //To wszechobecny mrok, który pragnie na zawsze poch³on¹æ Œwiat³o Innosa.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_03"); //Beliar jest W³adc¹ Ciemnoœci, Nienawiœci i Zniszczenia.
	AI_Output (self ,other, "DIA_Marduk_Evil_05_04"); //Tylko ci poœród nas, którzy nosz¹ w sercach œwiêty ogieñ naszego pana, bêd¹ mogli rozœwietliæ mrok jego wiecznym p³omieniem.
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
	description	 = 	"Ale w klasztorze ¿yj¹ jedynie magowie i nowicjusze.";
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
	AI_Output (other, self, "DIA_Marduk_Pal_15_00"); //Ale w klasztorze ¿yj¹ jedynie magowie i nowicjusze.
	AI_Output (self, other, "DIA_Marduk_Pal_05_01"); //Zgadza siê. W odró¿nieniu od naszej spo³ecznoœci, koncentruj¹cej siê g³ównie na S³owie Innosa...
	AI_Output (self, other, "DIA_Marduk_Pal_05_02"); //...paladyni s³awi¹ przede wszystkim wielkie czyny naszego Pana.
	AI_Output (self, other, "DIA_Marduk_Pal_05_03"); //My reprezentujemy naukê Innosa, podczas gdy paladyni s¹ jego wojownikami, ruszaj¹cymi do bitwy z jego imieniem na ustach i zwyciê¿aj¹cymi ku jego chwale.
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
	description	 = 	"Czy móg³byœ mnie czegoœ nauczyæ?";
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
	AI_Output (other, self, "DIA_Marduk_BEFORETEACH_15_00"); //Czy mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_01"); //Jestem ekspertem w dziedzinie magii lodu i pioruna. Mogê ciê nauczyæ, jak okie³znaæ ich moc.
	
	if (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Marduk_BEFORETEACH_05_02"); //Jednak szkolê jedynie magów.
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
	description	 = 	"Nauczaj mnie (tworzenie run)";
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
		
		AI_Output (other, self, "DIA_Marduk_TEACH_15_00"); //Zostañ moim nauczycielem.

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
			AI_Output (self, other, "DIA_Marduk_TEACH_05_01"); //Teraz nie mogê ciê uczyæ.
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
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_00"); //Witaj, synu.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_01"); //Od kiedy to jesteœ paladynem?
	};
	if (hero.Guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Info_05_02"); //Sk¹d pochodzisz?
	};
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
	Info_AddChoice (DIA_Marduk_Kap3_Hello,"Nie twój interes.",DIA_Marduk_Kap3_Hello_NotYourConcern);
	
	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"Od niedawna.",DIA_Marduk_Kap3_Hello_Soon);
	};
	if (hero.Guild == GIL_DJG)
	{
		Info_AddChoice (DIA_Marduk_Kap3_Hello,"Przyby³em z farmy.",DIA_Marduk_Kap3_Hello_DJG);
	};
	
};

FUNC VOID DIA_Marduk_Kap3_Hello_NotYourConcern ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00"); //To nie twoja sprawa.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01"); //Paladyn powinien byæ zawsze uprzejmy i skromny. Jego zadaniem jest chroniæ tych, którzy nie potrafi¹ obroniæ siê sami.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02"); //Powinieneœ byæ wdziêczny Innosowi, ¿e powierzy³ ci tak zaszczytn¹ misjê. Przemyœl to sobie!
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03"); //W dawnych czasach ho³ota nie mia³a wstêpu do naszego œwiêtego klasztoru. Jesteœ ¿ywym dowodem na to, ¿e by³y to lepsze czasy.
		AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04"); //Ostrzegam, pilnuj siê, jeœli nie chcesz zostaæ ukarany. Taka arogancja nie jest tu mile widziana..
	};	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_Soon ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_Soon_15_00"); //Od niedawna.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_01"); //A zatem witam ciê w naszych szeregach. W nadchodz¹cej bitwie przyda siê ka¿dy, kto ma odwagê przeciwstawiæ siê Z³u.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_Soon_05_02"); //Ca³a nasza przysz³oœæ spoczywa w rêkach takich jak ty. Niechaj Innos zapewni ci mêstwo, bêdziesz go potrzebowa³.
	
	Info_ClearChoices (DIA_Marduk_Kap3_Hello);
};

FUNC VOID DIA_Marduk_Kap3_Hello_DJG ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_Hello_DJG_15_00"); //Przyby³em z farmy.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_01"); //A zatem witam ciê w tym przybytku. Mam nadziejê, ¿e docenisz nasz¹ goœcinnoœæ.
	AI_Output (self ,other,"DIA_Marduk_Kap3_Hello_DJG_05_02"); //Jednak pamiêtaj, ¿e jesteœ tutaj jedynie goœciem. Nie nadu¿ywaj tej goœcinnoœci, jeœli nie chcesz mieæ powa¿nych problemów.
	
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
	description = "Czego mo¿esz mnie nauczyæ?";
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
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_00"); //Czego mo¿esz mnie nauczyæ?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_01"); //Oczywiœcie, nie mogê ci pomóc, jeœli chodzi o walkê.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_02"); //Mogê jednak przybli¿yæ ci istotê ³aski Innosa i jego œwiêtych darów.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_03"); //Poza tym, bêdê ciê przygotowywa³ do rytua³u Konsekracji Miecza.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_15_04"); //Nauczacie tu magii?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_05_05"); //Tutaj nauczamy tylko naszej magii. Ciebie interesuje zapewne magia paladynów, któr¹ mo¿esz studiowaæ w mieœcie.
	
	Info_ClearChoices (DIA_Marduk_TrainPals); 
	Info_AddChoice (DIA_Marduk_TrainPals,"Mo¿e póŸniej.",DIA_Marduk_TrainPals_Later);
	Info_AddChoice (DIA_Marduk_TrainPals,"Co przez to rozumiesz?",DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice (DIA_Marduk_TrainPals,"Co to jest Konsekracja Miecza?",DIA_Marduk_TrainPals_Blessing);
};

FUNC VOID DIA_Marduk_TrainPals_Later()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Later_15_00"); //Mo¿e póŸniej.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Later_05_01"); //Jesteœ tu zawsze mile widziany.
	
	Info_ClearChoices (DIA_Marduk_TrainPals);
};

FUNC VOID DIA_Marduk_TrainPals_Meaning()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_00"); //Co przez to rozumiesz?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_01"); //Kiedy Innos opuszcza³ ten œwiat, zostawi³ ludziom cz¹stkê swojej boskiej mocy.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_02"); //Tylko nieliczni œmiertelnicy zostali obdarzeni przywilejem jej u¿ywania - na chwa³ê Innosa i zgodnie z jego wol¹.
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Meaning_15_03"); //A co konkretnie chcesz mi przybli¿yæ?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Meaning_05_04"); //Mogê ci wskazaæ œcie¿kê Innosa. Mogê sprawiæ, ¿e ni¹ pod¹¿ysz.
};

FUNC VOID DIA_Marduk_TrainPals_Blessing()
{
	AI_Output (other,self ,"DIA_Marduk_TrainPals_Blessing_15_00"); //Co to jest Konsekracja Miecza?
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_01"); //Jest to jeden z najœwiêtszych rytua³ów paladynów.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_02"); //Podczas tej ceremonii œwiêta moc Innosa przep³ywa przez miecz paladyna, obdarzaj¹c go niewiarygodn¹ moc¹.
	AI_Output (self ,other,"DIA_Marduk_TrainPals_Blessing_05_03"); //Wyœwiêcony w ten sposób miecz towarzyszyæ bêdzie paladynowi do koñca jego dni jako najcenniejszy skarb.

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
	description = "Chcia³bym konsekrowaæ mój miecz.";
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
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_15_00"); //Chcia³bym konsekrowaæ mój miecz.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_01"); //Jeœli jesteœ zdecydowany, najpierw znajdŸ sobie magiczne ostrze.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_02"); //Udaj siê z nim do kaplicy i zmów modlitwê, podczas której poprosisz Innnosa o ³askê i wsparcie w bitwie przeciw si³om Z³a.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_03"); //Powinieneœ równie¿ z³o¿yæ odpowiedni¹ ofiarê.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_05_04"); //Jeœli Innos udzieli ci swojego b³ogos³awieñstwa, twój miecz zostanie konsekrowany.
	
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
	Info_AddChoice (DIA_Marduk_SwordBlessing,DIALOG_BACK,DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Jak¹ ofiarê?",DIA_Marduk_SwordBlessing_Donation); 
	Info_AddChoice (DIA_Marduk_SwordBlessing,"Gdzie mogê zdobyæ magiczne ostrze?",DIA_Marduk_SwordBlessing_OreBlade);
};

FUNC VOID DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices (DIA_Marduk_SwordBlessing);
};

FUNC VOID DIA_Marduk_SwordBlessing_Donation ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_Donation_15_00"); //Jak¹ ofiarê?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_01"); //Hm, bior¹c pod uwagê, jak ogromny dar dostajesz w momencie wyœwiêcenia, suma 5000 z³otych monet nie wydaje siê zbyt wygórowan¹ cen¹.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_Donation_05_02"); //Oczywiœcie, mo¿esz daæ wiêcej.
};

FUNC VOID DIA_Marduk_SwordBlessing_OreBlade ()
{
	AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_00"); //Gdzie mogê zdobyæ magiczne ostrze?
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01"); //Spróbuj u kowala Harada.
	AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02"); //Dopóki paladyni przebywaj¹ na wyspach, to on zaopatruje ich w broñ.
	if (Npc_IsDead (HARAD) == TRUE)
	{
		AI_Output (other,self ,"DIA_Marduk_SwordBlessing_OreBlade_15_03"); //Harad nie ¿yje.
		AI_Output (self ,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04"); //Przykro mi, wobec tego bêdziesz musia³ poczekaæ, a¿ wrócisz na kontynent wraz z innymi paladynami.
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
	description = "Jakieœ wieœci?";
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
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_00"); //Jakieœ wieœci?
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_01"); //Tak, do naszego klasztoru przenikn¹³ szpieg.
		AI_Output (self, other,"DIA_Marduk_Kap3_PERM_05_02"); //Ukrad³ nam Oko Innosa, jeden z naszych najwa¿niejszych artefaktów. A to tylko wierzcho³ek góry lodowej.
		//Joly:AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_03"); //Co masz na myœli?
	};
	
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_04"); //Wróg najwyraŸniej wkroczy³ ju¿ do miasta.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_15_05"); //Co masz na myœli?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_06"); //Jeden z naszych paladynów, Lothar, zosta³ zamordowany na ulicy.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_05_07"); //W bia³y dzieñ! To zasz³o za daleko. Niestety, obawiam siê, ¿e to mo¿e byæ dopiero pocz¹tek.
	
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,DIALOG_BACK,DIA_Marduk_Kap3_PERM_BAck);
	Info_AddChoice (DIA_Marduk_Kap3_PERM,"Co teraz?",DIA_Marduk_Kap3_PERM_AndNow);
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Bennet jest niewinny.",DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}	
	else
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Czy morderca zosta³ ju¿ z³apany?",DIA_Marduk_Kap3_PERM_Murderer);
	};
	
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Marduk_Kap3_PERM,"Gdzie jest ten z³odziej?",DIA_Marduk_Kap3_PERM_thief);
	}; 
};

FUNC VOID DIA_Marduk_Kap3_PERM_BAck ()
{
	Info_ClearChoices (DIA_Marduk_Kap3_PERM);	
};

FUNC VOID DIA_Marduk_Kap3_PERM_AndNow ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_00"); //Co teraz?
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01"); //Bêdziemy œcigaæ z³odzieja a¿ do skutku. A kiedy ju¿ go schwytamy, wymierzymy mu odpowiedni¹ karê.
		AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_AndNow_15_02"); //Musimy tylko dowiedzieæ siê, kto ukrad³ Oko Innosa.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03"); //Wkrótce powinniœmy poznaæ to¿samoœæ z³odzieja. A potem go znajdziemy, choæby mia³o nam to zaj¹æ ca³¹ wiecznoœæ.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04"); //Tak bêdzie, klnê siê na Innosa.
	}
	else
	{
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05"); //Morderstwo, i to w dodatku pope³nione na paladynie, to bez w¹tpienia jedno z najgorszych przestêpstw.
		AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06"); //Morderca na pewno zostanie skazany na karê œmierci.
	};
};

FUNC VOID DIA_Marduk_Kap3_PERM_BennetisNotGuilty ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00"); //Bennet jest niewinny. Œwiadek k³ama³.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01"); //Sk¹d to wiesz?
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02"); //Mam na to dowód.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03"); //Czasami myœlê, ¿e naszymi najwiêkszymi wrogami s¹ zdrada i chciwoœæ.
};

FUNC VOID DIA_Marduk_Kap3_PERM_Murderer ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_00"); //Czy morderca zosta³ ju¿ z³apany?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01"); //Na szczêœcie tak. Okaza³o siê, ¿e to jeden z tych rzezimieszków z farmy Onara.
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_Murderer_15_02"); //Kto?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03"); //Nie znam jego imienia. Jednak przyznasz sam, ¿e wœród najemników s¹ ludzie, którzy za pieni¹dze gotowi s¹ pope³niæ ka¿d¹ niegodziwoœæ.
};

FUNC VOID DIA_Marduk_Kap3_PERM_thief ()
{
	AI_Output (other,self ,"DIA_Marduk_Kap3_PERM_thief_15_00"); //Gdzie jest ten z³odziej?
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_01"); //Nie wiem, ucieka³, jakby opêta³o go stado demonów. Nie widzia³em, dok¹d pobieg³.
	AI_Output (self ,other,"DIA_Marduk_Kap3_PERM_thief_05_02"); //Niewa¿ne, gdzie siê ukrywa, pod jaki kamieñ siê wczo³ga, gniew Innosa dosiêgnie go i spali jego czarn¹ duszê!
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
	description = "Jakieœ wieœci?";
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
	AI_Output (other,self ,"DIA_Marduk_Kap4U5_PERM_15_00"); //Jakieœ nowiny?
	AI_Output (self ,other,"DIA_Marduk_Kap4U5_PERM_05_01"); //Nie, niestety nie, sytuacja jest nadal niezmiernie powa¿na.
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


