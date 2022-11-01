///////////////////////////////////////////////////////////////////////
//	Info Kap1 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap1_EXIT_Condition;
	information = DIA_Serpentes_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOTALK
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOTALK		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOTALK_Condition;
	information	 = 	DIA_Serpentes_NOTALK_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Serpentes_NOTALK_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOTALK_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOTALK_10_00"); //(káravě) Odvažuješ se oslovit mě, novici? Vrať se ke své práci.
	
	Info_ClearChoices (DIA_Serpentes_NOTALK);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"Zrovna jsem na odchodu. (KONEC)",DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"Mám ještě jednu otázku...",DIA_Serpentes_NOTALK_QUESTION);
};
FUNC VOID DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output (other, self, "DIA_Serpentes_NOTALK_QUESTION_15_00"); //Mám ještě jednu otázku.
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_01"); //(vztekle) Zdá se, že to nechápeš. Já sám si rozhodnu, kdy s tebou budu mluvit. Kdo si myslíš, že jsi?
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_02"); //A teď si běž po svém!
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Serpentes_NOTALK_EXIT()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_GOAWAY_Condition;
	information	 = 	DIA_Serpentes_GOAWAY_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_GOAWAY_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOTALK)
	&& Npc_IsInState (self, ZS_Talk)
	&& !(Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_GOAWAY_10_00"); //Tvá přítomnost dokazuje nejen nedostatek úcty, ale také tvou hloupost, novici!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info YOURSTORY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_YOURSTORY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	24;
	condition	 = 	DIA_Serpentes_YOURSTORY_Condition;
	information	 = 	DIA_Serpentes_YOURSTORY_Info;
	permanent	 =  FALSE;
	description	 = 	"Slyšel jsem, že jsi složil zkoušku ohně.";
};
func int DIA_Serpentes_YOURSTORY_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_TEST)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN)== FALSE)
	&& (MIS_GOLEM != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_YOURSTORY_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_00"); //Slyšel jsem, že jsi složil zkoušku ohně.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_01"); //(samolibě) To ti při vší skromnosti mohu říct. Kdokoliv jiný, kdo se o to pokoušel, zemřel.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_02"); //(blahosklonně) Vážně bys neměl tu zkoušku podstupovat. Tvůj duch je slabý. Lepší bude, když budeš sloužit několik let v klášteře, třeba budeš během několika let vyvolen.
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_03"); //Já tu zkoušku složím.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_04"); //Pokud to je vůle Innosova, tak ano. Ale jestli ne - pak selžeš.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_TEST		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_TEST_Condition;
	information	 = 	DIA_Serpentes_TEST_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jsem připraven podrobit se tvé zkoušce, Mistře.";
};
func int DIA_Serpentes_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_TEST_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_TEST_15_00"); //Jsem připraven podrobit se tvé zkoušce, Mistře.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_01"); //Takže chceš tu zkoušku podstoupit. O něco takového může žádat jen odvážný novic. Odvaha však není vše, co je zapotřebí.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_02"); //Jsi dost chytrý na to, abys tu zkoušku složil? Jsi dost silný, aby ses postavil nebezpečím, jež na tebe čekají?
	AI_Output (self, other, "DIA_Serpentes_TEST_10_03"); //Jestli ne, zaplatíš za to životem.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_04"); //A nyní poslouchej znění zkoušky: Na Místě kamenů hledej toho, kdo nebyl nikdy zrozen - najdeš toho, kdo byl kdysi přivolán.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_05"); //Přemož toho, koho přemoci nelze - utkej se s živoucí skálou, bojuj s neumírajícím kamenem - a znič jej.
	
	//----- Der Magische Golem ----
	Wld_InsertNpc 	(MagicGolem, 			"FP_MAGICGOLEM");
	Magic_Golem		= Hlp_GetNpc (MagicGolem);	//Damits auch initialisiert ist!!


	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Golem,LOG_RUNNING);
	B_LogEntry (TOPIC_Golem,"Serpentes mě podrobil zkoušce. Mám najít 'toho, kdo byl kdysi vyvolán', oživlý kámen, a přemoci jej.");
};
///////////////////////////////////////////////////////////////////////
//	Info NOIDEA
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOIDEA		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOIDEA_Condition;
	information	 = 	DIA_Serpentes_NOIDEA_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co to může být za bytost?";
};
func int DIA_Serpentes_NOIDEA_Condition ()
{	
	if (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOIDEA_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_NOIDEA_15_00"); //Živoucí skála? Co to může být za stvoření?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_01"); //Řekl jsem ti vše. (výsměšně) Nebo se ti zdá ta zkouška příliš obtížná?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_02"); //Nyní poznáš, co to obnáší podstoupit zkoušku ohně - na žádné další tvé otázky už nebudu odpovídat.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOHELP
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOHELP		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOHELP_Condition;
	information	 = 	DIA_Serpentes_NOHELP_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_NOHELP_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOIDEA)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	&& (MIS_GOLEM == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (other.guild == GIL_NOV)
	&& ((Npc_KnowsInfo (other, DIA_Ulthar_TEST) == FALSE)
	|| Npc_KnowsInfo (other,DIA_Serpentes_YOURSTORY))
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOHELP_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOHELP_10_00"); //(opovržlivě) Běž a splň svůj úkol, novici!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	3;
	condition	 = 	DIA_Serpentes_SUCCESS_Condition;
	information	 = 	DIA_Serpentes_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Porazil jsem toho golema.";
};
func int DIA_Serpentes_SUCCESS_Condition ()
{	
	if (Npc_IsDead (MagicGolem))
	&& (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_SUCCESS_Info ()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc (NOV_608_Garwig);
	
	AI_Output (other, self, "DIA_Serpentes_SUCCESS_15_00"); //Porazil jsem toho golema.
	AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_01"); //Cože? Vážně jsi to dokázal? Ale bez Innosova kladiva bys golema nemohl nikdy přemoci.
	
	if (Npc_IsDead (garwig))
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_02"); //(vítězně) Ale teď ses sám prozradil! Byls to ty, kdo zabil Garwiga!
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_03"); //ČEKÁ TĚ TREST ZA VRAŽDU INNOSOVA SLUŽEBNÍKA!!!
		
		AI_StopProcessInfos (self);
		B_Attack  (self, other, AR_HumanMurderedHuman, 0);
	}
	else 
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_04"); //(lítostivě) Ale musím uznat, že úkol, který jsem ti zadal, jsi splnil.
	};
	if (Npc_HasItems (other, Holy_Hammer_Mis) >= 1)
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_05"); //Měl jsem to kladivo vzít sám.
		
		Npc_RemoveInvItems (other, Holy_Hammer_MIS,1); 
		Wld_InsertItem (Holy_Hammer_MIS,"FP_HAMMER");
	};
	
	MIS_GOLEM = LOG_SUCCESS;
	B_GivePlayerXP (XP_GOLEM);
	
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_PERM   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 99;
	condition   = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent   = TRUE;

	description = "Chceš mi říct ještě něco?";
};
FUNC INT DIA_Serpentes_PERM_Condition()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Serpentes_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Serpentes_PERM_Info()
{
	AI_Output (other, self, "DIA_Serpentes_PERM_15_00"); //Chceš mi říct ještě něco?

		if (hero.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_01"); //Ne. Teď ne, bratře.
		}
		else
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_02"); //Odchod. Víš, co musíš udělat.
		};
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 2
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap2_EXIT_Condition;
	information = DIA_Serpentes_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap3 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap3_EXIT_Condition;
	information = DIA_Serpentes_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteile
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteile		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	30;
	condition	 = 	DIA_Serpentes_MinenAnteile_Condition;
	information	 = 	DIA_Serpentes_MinenAnteile_Info;
	important	 = 	TRUE;
};

func int DIA_Serpentes_MinenAnteile_Condition ()
{
	if (Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Serpentes_MinenAnteile_Info ()
{
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_00"); //Ne tak rychle. Mám pro tebe ještě jeden úkol.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_15_01"); //(s povzdychem) A to?
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_02"); //Teď, když jsi členem bratrstva ohně, musíš splnit své povinnosti související s tím, když se staneš jedním z nás.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_03"); //Církev nezajímají jen věci kolem magie - jak sám víš, je to také nejvyšší autorita v oblastech práva.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_04"); //Poslední případ před námi otevírá bezednou propast a jednou provždy se s ním musíme vypořádat.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Už takhle mám dost svých starostí. Najdi si někoho jiného.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "O co jde?", DIA_Serpentes_MinenAnteile_was );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Není to snad záležitost domobrany?", DIA_Serpentes_MinenAnteile_miliz );
	}
	else
	{
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_05"); //Nájemný žoldák tvého kalibru by nám v tom mohl pomoci.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Už takhle mám dost svých starostí. Najdi si někoho jiného.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Koho mám zabít?", DIA_Serpentes_MinenAnteile_KillSLD );
	};
};
func void DIA_Serpentes_MinenAnteile_miliz ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_miliz_15_00"); //Není to snad záležitost domobrany?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_miliz_10_01"); //Domobrana je zodpovědná jen za město. Tahle záležitost má ovšem dalekosáhlé důsledky.

};

func void DIA_Serpentes_MinenAnteile_nein ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_nein_15_00"); //Už takhle mám dost svých starostí. Najdi si někoho jiného.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_01"); //(rozzlobeně) To je urážka. Nikdy se nedostaneš do vyšších magických kruhů, pokud nejsi ochoten vykonat službu pro svoje bratrstvo.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_02"); //Ukládám ti důtku. Doufám, že se to už víckrát nestane - jinak by to s tebou špatně dopadlo.
	AI_StopProcessInfos (self);
};

func void DIA_Serpentes_MinenAnteile_was ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_15_00"); //O co jde?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_01"); //Ve městě je někdo, kdo prodal falešné podíly na rudné doly v bývalé trestanecké kolonii.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_02"); //Ty papíry jsou zcela bezcenné a nemají žádný význam, vážně. Přesto by mohly mezi lidem vyvolat potíže, což si nyní nemůžeme dovolit.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_03"); //Ten švindlíř nejspíš oslovil všechny významné obchodníky ve městě a okolí a dokonce se mu evidentně podařilo některým z nich část těch falešných podílových listů prodat.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_04"); //Najdi toho padoucha a přiveď jej před tribunál. V takovýchto těžkých časech nemůžeme trpět takovéhle podvodníky a mrchožrouty.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_05"); //Musíme ho exemplárně potrestat, abychom odradili ostatní podobné zlotřilce.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Zkusím tu záležitost nějak vyřídit.", DIA_Serpentes_MinenAnteile_was_ja );

};
func void DIA_Serpentes_MinenAnteile_was_ja ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_00"); //Zkusím tu záležitost nějak vyřídit.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_01"); //Ještě jedna věc. Až budeš ty obchodníky navštěvovat, nedej najevo, že se pídíš po těch podílových listech.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_02"); //Řekl bych, že je budou chtít prodat dál a rozhodně by ti je nenabízeli, pokud jim dojde, že jednáš z rozkazu církve, rozumíš?
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_03"); //Ano.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_04"); //Tak vzhůru do práce. Přeji ti brzký úspěch, bratře.
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
	
	MIS_Serpentes_MinenAnteil_KDF = LOG_RUNNING;	

	 if ((Npc_IsDead(Salandril))== FALSE)
	 {
		 CreateInvItems (Salandril, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(VLK_416_Matteo))== FALSE)
	 {
		 CreateInvItems (VLK_416_Matteo, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_413_Bosper))== FALSE)
	 {
		 CreateInvItems (VLK_413_Bosper, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_409_Zuris))== FALSE)
	 {
		 CreateInvItems (VLK_409_Zuris, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_911_Elena))== FALSE)
	 {
		 CreateInvItems (BAU_911_Elena, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	 {
		 CreateInvItems (BAU_970_Orlan, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_407_Hakon))== FALSE)
	 {
		 CreateInvItems (VLK_407_Hakon, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_936_Rosi))== FALSE)
	 {
		 CreateInvItems (BAU_936_Rosi, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_468_Canthar))== FALSE)
	 {
		 CreateInvItems (VLK_468_Canthar, 	ItWr_MinenAnteil_Mis, 3); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 3;
	 };
	SalandrilVerteilteMinenAnteil =	SalandrilMinenAnteil_MAINCounter;

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Nějaký tunelář tu obchodníkům prodává ilegální akcie rudných dolů a vydělává na tom pořádný balík. Musím zjistit, kdo za tím vězí, a Serpentovi pak musím všechny ty padělky odevzdat."); 
};

func void DIA_Serpentes_MinenAnteile_KillSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_Kill_15_00"); //Koho mám zabít?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_01"); //Innosi, slituj se. Nikoho, samozřejmě. Tahle záležitost vyžaduje trošku jemnější jednání, ty neomalený hulváte.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_02"); //Salandril, alchymista z horního konce města, se provinil vážným zločinem a musí za něj být potrestán.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_03"); //Odmítl však přijít do kláštera, kde měl stanout před soudem. Přiveď ho sem.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_04"); //Jak to uděláš, to už je na tobě. Samozřejmě že za to dostaneš odpovídající odměnu.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Není to snad záležitost domobrany?", DIA_Serpentes_MinenAnteile_miliz );
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Žádný problém. Postarám se o to.", DIA_Serpentes_MinenAnteile_was_jaSLD );
};

var int MIS_Serpentes_BringSalandril_SLD;
func void DIA_Serpentes_MinenAnteile_was_jaSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_jaSLD_15_00"); //Žádný problém. Postarám se o to.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_jaSLD_10_01"); //Dobrá. Očekáváme, že to během několika dní zařídíš.
	MIS_Serpentes_BringSalandril_SLD = LOG_RUNNING;
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Musím před soud do kláštera přivést Salandrila, alchymistu z horní khorinidské čtvrti. Nemusí mě zajímat, co vlastně spáchal, hlavně když za to dostanu zaplaceno."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteileBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteileBringen		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	2;
	condition	 = 	DIA_Serpentes_MinenAnteileBringen_Condition;
	information	 = 	DIA_Serpentes_MinenAnteileBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co se týče těch padělaných důlních akcií...";
};

func int DIA_Serpentes_MinenAnteileBringen_Condition ()
{
	if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_MinenAnteil_Mis))
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

var int SerpentesMinenAnteilCounter;
func void DIA_Serpentes_MinenAnteileBringen_Info ()
{
		var int SerpentesMinenAnteilCount;
		var int XP_BringSerpentesMinenAnteils;
		var int SerpentesMinenAnteilOffer;
		var int SerpentesMinenAnteilGeld;
	
		SerpentesMinenAnteilCount = Npc_HasItems(other, ItWr_MinenAnteil_Mis);
		SerpentesMinenAnteilOffer = 200; 

		 if (SerpentesMinenAnteilCount == 1)
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_00"); //Podařilo se mi získat ty podílové listy.
				B_GivePlayerXP (XP_BringSerpentesMinenAnteil);
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,1);
				SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_01"); //Podařilo se mi získat několik podílových listů.
	
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,  SerpentesMinenAnteilCount);
	
				XP_BringSerpentesMinenAnteils = (SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil);
				SerpentesMinenAnteilCounter = (SerpentesMinenAnteilCounter + SerpentesMinenAnteilCount); 
	
				B_GivePlayerXP (XP_BringSerpentesMinenAnteils);
			};

		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCount;
		
		var string MinenAnteilText;
		var string MinenAnteilLeft;
		MinenAnteilLeft = IntToString (SalandrilMinenAnteil_MAINCounter);
		MinenAnteilText = ConcatStrings(MinenAnteilLeft, PRINT_NumberLeft);
		AI_PrintScreen	(MinenAnteilText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);

		if (SerpentesMinenAnteilCounter < SalandrilVerteilteMinenAnteil)
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_02"); //Velmi dobře. Musíš stáhnout z oběhu úplně všechny. Je to pro naše lidi jako jed. Přines mi je všechny.
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_03"); //Dám ti vše potřebné.
		}
		else if (SerpentesMinenAnteilCounter == SalandrilVerteilteMinenAnteil) //Joly:kein Exploid
		{
			AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_04"); //Myslím, že by to měly být všechny.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_05"); //Dobrá práce. Zasloužíš si svou odměnu.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_06"); //Vezmi si tenhle ochranný amulet. Pomůže ti na cestách, na něž se ještě budeš muset vypravit.
			CreateInvItems (self, ItAm_Prot_Mage_01, 1); 
			B_GiveInvItems (self, other, ItAm_Prot_Mage_01, 1);
		}
		else	//Joly: zur Sicherheit!
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_07"); //Je tohle opravdu poslední?
		};
		
		SerpentesMinenAnteilGeld	= (SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer);
		
		CreateInvItems (self, ItMi_Gold, SerpentesMinenAnteilGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, SerpentesMinenAnteilGeld);
};

///////////////////////////////////////////////////////////////////////
//	Info GotSalandril
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOTSalandril		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	32;
	condition	 = 	DIA_Serpentes_GOTSalandril_Condition;
	information	 = 	DIA_Serpentes_GOTSalandril_Info;

	description	 = 	"Už vím, kdo šířil ty ilegální akcie.";
};

func int DIA_Serpentes_GOTSalandril_Condition ()
{
	if (SC_KnowsProspektorSalandril == TRUE)
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

func void DIA_Serpentes_GOTSalandril_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_GOTSalandril_15_00"); //Vím, kdo vypustil ty podílové listy do oběhu. Byl to Salandril, alchymista z horní části města.
	AI_Output			(self, other, "DIA_Serpentes_GOTSalandril_10_01"); //Tak jej přiveď sem. Musíme s ním probrat pár věcí.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilHere
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilHERE		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilHERE_Condition;
	information	 = 	DIA_Serpentes_SalandrilHERE_Info;

	description	 = 	"Salandril je tady, v klášteře.";
};

func int DIA_Serpentes_SalandrilHERE_Condition ()
{
	if (Npc_GetDistToWP(Salandril,"ALTAR")<10000) 
		{
			if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
				{
					return TRUE;
				}
			else if (Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			&& (hero.guild == GIL_KDF) 
				{
					return TRUE;
				}
			else
				{
					return FALSE;
				};
		};
};

func void DIA_Serpentes_SalandrilHERE_Info ()
{
	AI_Output		(other, self, "DIA_Serpentes_SalandrilHERE_15_00"); //Salandril je tady, v klášteře.
	AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_01"); //Dobrá práce. Vyřídíme to s ním později.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_02"); //Tady je tvoje odměna. A nikomu ani slovo, rozumíš?
		CreateInvItems (self, ItMi_Gold, 400);									
		B_GiveInvItems (self, other, ItMi_Gold, 400);					
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_SalandrilInKloster);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilDEAD
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilDEAD		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilDEAD_Condition;
	information	 = 	DIA_Serpentes_SalandrilDEAD_Info;

	description	 = 	"Salandril je mrtvý.";
};

func int DIA_Serpentes_SalandrilDEAD_Condition ()
{
	if  (
			(Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			||  (
					((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
					&& (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING)
				)
		)
		&& (Npc_IsDead(Salandril))
		{
				return TRUE;
		};
};

func void DIA_Serpentes_SalandrilDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_SalandrilDEAD_15_00"); //Salandril je mrtvý.
	AI_Output			(self, other, "DIA_Serpentes_SalandrilDEAD_10_01"); //Inu, v tom případě zůstane jeho skutek nepotrestán. Nechť se Innos slituje nad jeho ubohou duší.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_Ambient);
};
	
//##################################################################
//##
//##	Kapitel 4
//##
//##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Serpentes_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap4_EXIT_Condition;
	information = DIA_Serpentes_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 5
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap5 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap5_EXIT_Condition;
	information = DIA_Serpentes_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Serpentes_PICKPOCKET (C_INFO)
{
	npc			= KDF_501_Serpentes;
	nr			= 900;
	condition	= DIA_Serpentes_PICKPOCKET_Condition;
	information	= DIA_Serpentes_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Serpentes_PICKPOCKET_Condition()
{
	C_Beklauen (86, 380);
};
 
FUNC VOID DIA_Serpentes_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Serpentes_PICKPOCKET);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_BACK 		,DIA_Serpentes_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Serpentes_PICKPOCKET_DoIt);
};

func void DIA_Serpentes_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};
	
func void DIA_Serpentes_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};





















