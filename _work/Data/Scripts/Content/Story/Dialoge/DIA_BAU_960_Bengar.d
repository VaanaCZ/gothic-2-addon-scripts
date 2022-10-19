///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bengar_EXIT   (C_INFO)
{
	npc         = BAU_960_Bengar;
	nr          = 999;
	condition   = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bengar_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_HALLO		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	3;
	condition	 = 	DIA_Bengar_HALLO_Condition;
	information	 = 	DIA_Bengar_HALLO_Info;

	description	 = 	"Ty jsi tady farmáøem?";
};

func int DIA_Bengar_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //Ty jsi tady farmáøem?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //Dalo by se to tak øíct, ale jsem jen nájemce.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //Veškeré pozemky patøí velkostatkáøi.

};

///////////////////////////////////////////////////////////////////////
//	Info wovonlebtihr
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_WOVONLEBTIHR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Bengar_WOVONLEBTIHR_Condition;
	information	 = 	DIA_Bengar_WOVONLEBTIHR_Info;

	description	 = 	"Jak si obstaráváš obživu?";
};

func int DIA_Bengar_WOVONLEBTIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_WOVONLEBTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //Jak si obstaráváš obživu?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //Vìtšinou lovem a kácením stromù. Taky samozøejmì chováme ovce a obdìláváme pùdu.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Onar mi sem poslal všechny tyhle lidi a já je musím živit. A jen málo z nich umí vzít za práci, jak sis asi sám všiml.

};


///////////////////////////////////////////////////////////////////////
//	Info tageloehner
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_TAGELOEHNER		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	6;
	condition	 = 	DIA_Bengar_TAGELOEHNER_Condition;
	information	 = 	DIA_Bengar_TAGELOEHNER_Info;

	description	 = 	"Zamìstnáváš nádeníky?";
};

func int DIA_Bengar_TAGELOEHNER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_TAGELOEHNER_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //Zamìstnáváš nádeníky?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Onar vyhodil lidi, co mu na jeho farmì nebyli k nièemu.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //Pak je poslal ke mnì. Dávám jim najíst a oni pro mì pracují.

};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bengar_MissingPeople_Info;

	description	 = 	"Neudálo se tu poslední dobou nìco divného?";
};

func int DIA_Addon_Bengar_MissingPeople_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //Nesebìhlo se tu v poslední dobì nìco divného?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //Poslední dobou se tu dìjí divné vìci.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Ale nic není divnìjšího než to záhadné zmizení Parda.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //Býval jedním z dìlníkù na poli a rozhodnì nepatøil k tìm, co by najednou se vším praštili, sebrali se a takhle utekli.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Sedlák Bengar postrádá svého èeledína Pardose."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Napadá tì, proè zmizel?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Možná už mìl prostì všeho dost.", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Co je na jeho zmizení tak divného?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //Co pøesnì je na tom jeho zmizení divného?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos je trochu bázlivý - jakživ nebyl dál než na kraji mých polí.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Zdrhnul by, i kdyby nìkde zahlídnul žravou štìnici.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //Na tu sice není pìkný pohled, ale rozhodnì se nedá øíct, že by šlo o nebezpeènou potvoru.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //(znechucenì) A to se prý najdou lidi, kteøí je jedí. Fuj tajbl.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //Na to si zvykneš.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Možná už toho mìl prostì plné zuby.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //On prací na polích žil. Nedokážu si pøedstavit, že by utekl makat na jiný statek.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //U mì si mohl dìlat, co chtìl.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //Máš nìjaké stopy?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //Myslím, že ho museli odvléct ti banditi. Už pár dní se tu potulovali kolem.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Jednou jsem vidìl, jak do svého tábora táhli nìkoho z mìsta.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //Vypadalo to, že z nìj chtìjí udìlat otroka.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Kde leží tábor banditù?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //Kde leží ten tábor banditù?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Na konci mých polností jsou schody, které vedou do malého údolíèka. Tam se ti lapkové usadili.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //Moc rád bych si tam pro Parda zašel, ale já proti tìm chlapùm nemám žádnou šanci.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //A ty by ses jim mìl taky na sto honù vyhnout. Nemají zrovna smysl pro humor.
	Bengar_ToldAboutRangerBandits = TRUE;
};
func void DIA_Addon_Bengar_MissingPeople_back ()
{
	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnPardos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_ReturnPardos		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_ReturnPardos_Condition;
	information	 = 	DIA_Addon_Bengar_ReturnPardos_Info;

	description	 = 	"Vrátil se Pardos zpátky?";
};

func int DIA_Addon_Bengar_ReturnPardos_Condition ()
{
	if 	(MIS_Bengar_BringMissPeopleBack == LOG_RUNNING)
	&&  (Npc_GetDistToWP (Pardos_NW, "NW_FARM3_HOUSE_IN_NAVI_2") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //Už se Pardos vrátil?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Ano, už je doma a odpoèívá. Díky za všechno, co jsi...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //To nestojí za øeè.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //Poèkej, chci se ti odmìnit, ale nemám...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_04"); //Kašli na to.
	
	B_GivePlayerXP (XP_Ambient);
};	

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_FernandosWeapons		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Bengar_FernandosWeapons_Info;

	description	 = 	"Když tudy ti bandité procházeli, mìli u sebe zbranì?";
};

func int DIA_Addon_Bengar_FernandosWeapons_Condition ()
{
	if (Bengar_ToldAboutRangerBandits == TRUE)
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //Když tudy ti bandité procházeli, nemìli u sebe nìjaké zbranì?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //Co je to za hloupou otázku? Copak by tu banditi pobíhali jen tak beze zbraní?
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //Myslím SPOUSTU zbraní. Velkou dodávku.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Chápu. Jo, když o tom mluvíš, tak toho vážnì nesli hromady.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //Nìco v sudech, nìco ve vacích a nìco i na vozech, které s sebou mìli.
	 B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info rebellieren
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_REBELLIEREN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	8;
	condition	 = 	DIA_Bengar_REBELLIEREN_Condition;
	information	 = 	DIA_Bengar_REBELLIEREN_Info;

	description	 = 	"Co si myslíš o Onarovi?";
};

func int DIA_Bengar_REBELLIEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //Co si myslíš o Onarovi?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //Je to nenažranej parchant, co nás nakonec všechny dostane na šibenici.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Jednou sem paladinové z mìsta dorazí a kvùli tomu bastardovi nás porubají.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Ale já nemám na výbìr. Domobrana si sem chodí jen proto, aby si odnesla naše zboží, ale chránit nás ji ani nenapadne.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Kdybych zùstal vìrný mìstu, byl bych na to teï sám.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Když už nic jiného, Onar pošle pár svých žoldákù hned a pak, aby se podívali, jak jsme dopadli.
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PALADINE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	9;
	condition	 = 	DIA_Bengar_PALADINE_Condition;
	information	 = 	DIA_Bengar_PALADINE_Info;

	description	 = 	"Co máš proti královským vojskùm?";
};

func int DIA_Bengar_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_REBELLIEREN))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) 
		{
				return TRUE;
		};
};

func void DIA_Bengar_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //Co máš proti královským vojskùm?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //To je pøece jasný. Od tý doby, co jsou paladinové ve mìstì, se nic nezlepšilo. Právì naopak.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //Teï ti zatracení vojáci z domobrany pøicházejí na naše pozemky stále èastìji a kradou, co se jim zachce. A paladinové proti tomu nehnou ani prstem.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //Jediní paladinové, které jsem kdy vidìl, jsou ti dva strážci u prùsmyku.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //Nehodlají hnout ani prstem, dokud nás domobrana všechny nepovraždí.

};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PASS		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	10;
	condition	 = 	DIA_Bengar_PASS_Condition;
	information	 = 	DIA_Bengar_PASS_Info;

	description	 = 	"Prùsmyk?";
};

func int DIA_Bengar_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Bengar_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //U jakého prùsmyku?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //U prùsmyku do starého Hornického údolí u vodopádù na druhém konci náhorních pastvin.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Zeptej se na to Malaka. Tenhle týden má spoustu èasu.

};

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZ (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_MILIZ_Condition;
	information	= DIA_Bengar_MILIZ_Info;
	permanent 	= FALSE;
	description	= "Øeknìme, že se na ten váš problém s domobranou podívám.";
};

func int DIA_Bengar_MILIZ_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //Øeknìme, že se na ten váš problém s domobranou podívám.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //Co? Øekl jsem Onarovi, že by mìl poslat pár ŽOLDÁKÙ.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //Je to pøíležitost, jak se pøesvìdèit o svých kvalitách.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //Výbornì. Umíš si pøedstavit, co se mnou domobrana udìlá, když to zpackáš?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //Nemìl jsem dojem, že by sem teï chtìl nìkdo z nich pøijít.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //Už jsem o tom Onarovi øíkal pøed pár dny. Za co mu tu rentu teda platím?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Ti bastardi sem chodí jednou do týdne a vybírají danì pro mìsto.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //Je fajn, žes pøišel právì teï. V tuhle dobu obvykle pøicházejí.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //Mìli by tu být každou chvíli.
};

// ************************************************************
// 			  				Selber vorknöpfen
// ************************************************************
instance DIA_Bengar_Selber (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_Selber_Condition;
	information	= DIA_Bengar_Selber_Info;
	permanent 	= FALSE;
	description	= "A proè se tedy té domobranì nepostavíš sám?";
};

func int DIA_Bengar_Selber_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Bengar_MilSuccess == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info ()
{
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Je vás tu tolik. Proè se domobranì prostì nepostavíte sami?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //Je pravda, že nás tu je jak psù. Ale nemáme výcvik na boj s domobranou.
};		

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZKLATSCHEN		(C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZKLATSCHEN_Condition;
	information	= DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent	= FALSE;
	description	= "Jen a si teda domobrana dorazí, já už to s nimi vyøídím!";
};

func int DIA_Bengar_MILIZKLATSCHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_MILIZ))
	&& (!Npc_IsDead(Rick))
	&& (!Npc_IsDead(Rumbold))
	&& (Rumbold_Bezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //Jen a si teda domobrana dorazí, já už to s nimi vyøídím!
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Nemùžu se doèkat. Už pøicházejí. Øíkal jsem ti to.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //Jen to nezpackej!
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //Tak dobrá, hodnì štìstí! Ukaž jim to.
	};

	AI_StopProcessInfos (self);
				
	Npc_ExchangeRoutine	(self,"MilComing"); 
	
	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))
	{
		Npc_ExchangeRoutine	(Rick,"MilComing");
		AI_ContinueRoutine (Rick);
	};
	if (Hlp_IsValidNpc (Rumbold))
	&& (!Npc_IsDead (Rumbold))
	{		
		Npc_ExchangeRoutine	(Rumbold,"MilComing"); 
		AI_ContinueRoutine (Rumbold);
	};
};
	
// ************************************************************
// 			  				Miliz weg 
// ************************************************************
var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZWEG_Condition;
	information	= DIA_Bengar_MILIZWEG_Info;
	permanent	= TRUE;
	description	= "Váš problém s domobranou už je minulostí.";
};

func int DIA_Bengar_MILIZWEG_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bengar_MILIZ))
	&& (Bengar_MilSuccess == FALSE)
	{
		if (Npc_IsDead (Rick) && Npc_IsDead (Rumbold))
		|| (Rumbold_Bezahlt == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //Váš problém s domobranou už je minulostí.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //Jsi blázen? Víš, co mi ti chlapi udìlají, až odsud odejdeš?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Poøád tu okounìjí. Øekni jim, a odtáhnou ÚPLNÌ!
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //To není špatné. Možná nám teï na konci mìsíce zbude nìco i pro obchod. Díky.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Dokonce jsi za mì chtìl zaplatit. To je od tebe velmi milé.
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
		};
		
		Bengar_MilSuccess = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info balthasar
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASAR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	13;
	condition	 = 	DIA_Bengar_BALTHASAR_Condition;
	information	 = 	DIA_Bengar_BALTHASAR_Info;

	description	 = 	"Ovèák Balthazar na vaše pastviny nesmí?";
};

func int DIA_Bengar_BALTHASAR_Condition ()
{
	if 	(
		(MIS_Balthasar_BengarsWeide == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASAR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //Ovèák Balthazar na vaše pastviny nesmí?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //No, ano. To je takhle: Øekl jsem Sekobovi, že by mi mìl platit, když chce své ovce pást na mých pozemcích.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //Ale pravda je, že jsem to øekl jen proto, aby už sem nechodil. Nemùžu Balthazara vystát.
	B_LogEntry (TOPIC_BalthasarsSchafe,"Mám-li pøesvìdèit Bengara, aby Balthazara pustil na své pastviny, musím mu uèinit laskavost. Urèitì se k tomu nìjaká pøíležitost naskytne."); 
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info balthasardarfaufweide
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASARDARFAUFWEIDE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	14;
	condition	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;

	description	 = 	"Domobrana je pryè a Balthazar mùže tvoji pastvinu znovu využívat.";
};

func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bengar_BALTHASAR))
		&& (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
		&& (Bengar_MilSuccess == TRUE)
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //Domobrana je pryè a Balthazar mùže tvoji pastvinu znovu využívat.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //Proè?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //(výhružnì) Protože jsem to øekl.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Mmh. Dobrá, jak chceš.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //A si najde místo pro svoje zvíøata nìkde mezi poli.

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	15;
	condition	 = 	DIA_Bengar_PERMKAP1_Condition;
	information	 = 	DIA_Bengar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dávej na sebe pozor.";
};

func int DIA_Bengar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_BALTHASARDARFAUFWEIDE))
	&& (Kapitel < 3)
			{
					return TRUE;
			};
};

func void DIA_Bengar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //Dávej na sebe pozor.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Ty tady.

	AI_StopProcessInfos (self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Bengar_KAP3_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP3_EXIT_Condition;
	information	= DIA_Bengar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Allein
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_ALLEIN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	30;
	condition	 = 	DIA_Bengar_ALLEIN_Condition;
	information	 = 	DIA_Bengar_ALLEIN_Info;

	description	 = 	"Jak se vede?";
};

func int DIA_Bengar_ALLEIN_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_ALLEIN_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //Jak to vypadá?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak zmizel a vzal s sebou všechno a každého, kdo pro mì pracoval. Øíkal, že má namíøeno do hor.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //Už to tu nemohl vydržet.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //Èasy jsou zlé. Nevím, jak dlouho tu ještì vydržím.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Vytáèí mì, jak z prùsmyku teï proudí záplavy pøíšer, aby plundrovaly náhorní pastviny.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Kdybych tu tak alespoò mìl nìjakou pomoc do žoldákù.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //Jeden z nich se chystal, že pro mì bude pracovat. Asi zmìnil názor. Mám dojem, že se jmenoval "Vlk".
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar zùstal na svém statku docela sám. Jeho pøítel Malak zmizel a všichni ostatní odešli s ním. Podle Bengara se nejspíš uchýlili do hor."); 
	B_LogEntry (TOPIC_BengarALLEIN,"Jeho statek je teï úplnì nechránìný a potøebuje pomoc. Zmiòoval se o nìjakém žoldnéøi jménem Vlk. Copak já toho chlápka neznám?"); 
};

///////////////////////////////////////////////////////////////////////
//	Info Malaktot
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKTOT		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_MALAKTOT_Condition;
	information	 = 	DIA_Bengar_MALAKTOT_Info;

	description	 = 	"Malak je mrtvý.";
};

func int DIA_Bengar_MALAKTOT_Condition ()
{
	if (Npc_IsDead(Malak))
	&& (Malak_isAlive_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKTOT_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak je mrtvý.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //Teï se všechno obrací k horšímu.
};

///////////////////////////////////////////////////////////////////////
//	Info SLDda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_SLDDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_SLDDA_Condition;
	information	 = 	DIA_Bengar_SLDDA_Info;

	description	 = 	"Najal jsem ty žoldáky, které jsi chtìl.";
};

func int DIA_Bengar_SLDDA_Condition ()
{
	if (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_SLDDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //Najal jsem ty žoldáky, které jsi chtìl.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Nikdy jsem na své farmì nikoho podobného nemìl. Jen doufám, že to bude fungovat.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Tady, vezmi si tohle. Mám dojem, že se ti to bude hodit.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);
	B_GivePlayerXP (XP_BengarsHelpingSLDArrived);
					
};

///////////////////////////////////////////////////////////////////////
//	Info Malakwiederda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKWIEDERDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	35;
	condition	 = 	DIA_Bengar_MALAKWIEDERDA_Condition;
	information	 = 	DIA_Bengar_MALAKWIEDERDA_Info;

	description	 = 	"Malak se vrátil.";
};

func int DIA_Bengar_MALAKWIEDERDA_Condition ()
{
	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((MIS_GetMalakBack == LOG_SUCCESS)||(NpcObsessedByDMT_Malak == TRUE))
	&& ((Npc_IsDead(Malak))==FALSE)

		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKWIEDERDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak se vrátil.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //Už bylo naèase. Myslel jsem, že už ho víckrát neuvidím.
	B_GivePlayerXP (XP_GetMalakBack);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERM		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	80;
	condition	 = 	DIA_Bengar_PERM_Condition;
	information	 = 	DIA_Bengar_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"To bude v poøádku.";
};

func int DIA_Bengar_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_ALLEIN))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //To bude v poøádku.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak se sice vrátil, ale na situaci to moc nemìní.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //Pokud se nestane nìjaký zázrak, všichni to tu odskáèeme.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Vlk je divnej chlap, ale myslím, že to nìjak zvládneme.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Bez Malaka tu nic nefunguje. Jestli se brzy nìco nestane, vzdám se farmy.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Snad se brzy vrátí.
		};
	};
	AI_StopProcessInfos (self);
	
	if (Npc_IsDead(SLD_Wolf))
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	B_StartOtherRoutine	(SLD_815_Soeldner,"Zaèít");
	B_StartOtherRoutine	(SLD_817_Soeldner,"Zaèít");
	};
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Bengar_KAP4_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP4_EXIT_Condition;
	information	= DIA_Bengar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Bengar_KAP5_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP5_EXIT_Condition;
	information	= DIA_Bengar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Bengar_KAP6_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP6_EXIT_Condition;
	information	= DIA_Bengar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bengar_PICKPOCKET (C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 900;
	condition	= DIA_Bengar_PICKPOCKET_Condition;
	information	= DIA_Bengar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bengar_PICKPOCKET_Condition()
{
	C_Beklauen (28, 50);
};
 
FUNC VOID DIA_Bengar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bengar_PICKPOCKET);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_BACK 		,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};
	
func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};


















































































