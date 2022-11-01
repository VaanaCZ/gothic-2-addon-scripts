///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Till_EXIT   (C_INFO)
{
	npc         = BAU_931_Till;
	nr          = 999;
	condition   = DIA_Till_EXIT_Condition;
	information = DIA_Till_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Till_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Till_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Till_HALLO		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	3;
	condition	 = 	DIA_Till_HALLO_Condition;
	information	 = 	DIA_Till_HALLO_Info;

	description	 = 	"Tak co, chlapečku?";
};

func int DIA_Till_HALLO_Condition ()
{
	if (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_15_00"); //Tak co, chlapečku?
	AI_Output			(self, other, "DIA_Till_HALLO_03_01"); //Takhle se mnou žádnej usoplenej rolník nebude mluvit - kolikrát ti to ještę budu pâipomínat?
	B_StartOtherRoutine (Till,"Začít"); 

	Info_ClearChoices	(DIA_Till_HALLO);

	if (Kapitel < 5)
	{
		Info_AddChoice	(DIA_Till_HALLO, "Nejsem rolník.", DIA_Till_HALLO_keinervoneuch );
	
		if (Npc_IsDead(Sekob)== FALSE)
		{
			Info_AddChoice	(DIA_Till_HALLO, "Ty to tady vedeš?", DIA_Till_HALLO_selber );
		};
	};
};

func void DIA_Till_HALLO_selber ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_selber_15_00"); //Ty to tady vedeš?
	AI_Output			(self, other, "DIA_Till_HALLO_selber_03_01"); //(ustrašenę) Eh. Ne, jsem jen Sekobův syn. Ale až můj starý otec jednou nebude mezi námi, bude mi to tu všechno patâit.
	AI_Output			(other, self, "DIA_Till_HALLO_selber_15_02"); //Úžasné!

	Info_ClearChoices	(DIA_Till_HALLO);
};

func void DIA_Till_HALLO_keinervoneuch ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_keinervoneuch_15_00"); //Nejsem rolník.
	AI_Output			(self, other, "DIA_Till_HALLO_keinervoneuch_03_01"); //A co tady chceš? Nemáme nic. Takže zase můžeš jít.

	Info_ClearChoices	(DIA_Till_HALLO);
};


///////////////////////////////////////////////////////////////////////
//	Info feldarbeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Till_FELDARBEITER		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	4;
	condition	 = 	DIA_Till_FELDARBEITER_Condition;
	information	 = 	DIA_Till_FELDARBEITER_Info;

	description	 = 	"Takhle jednáš se všemi rolníky?";
};

func int DIA_Till_FELDARBEITER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_FELDARBEITER_Info ()
{
	AI_Output			(other, self, "DIA_Till_FELDARBEITER_15_00"); //Takhle jednáš se všemi rolníky?
	AI_Output			(self, other, "DIA_Till_FELDARBEITER_03_01"); //Jasnę - potâebujou to. A není proč se pohoršovat, takhle to prostę funguje.

};


///////////////////////////////////////////////////////////////////////
//	Info Sekob
///////////////////////////////////////////////////////////////////////
instance DIA_Till_SEKOB		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	9;
	condition	 = 	DIA_Till_SEKOB_Condition;
	information	 = 	DIA_Till_SEKOB_Info;

	description	 = 	"Potâebuju mluvit s tvým otcem.";
};

func int DIA_Till_SEKOB_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
		&&((Npc_KnowsInfo(other, DIA_Sekob_HALLO))== FALSE)
		&& (Kapitel < 3)
		&& (Npc_IsDead(Sekob)== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_SEKOB_Info ()
{
	AI_Output			(other, self, "DIA_Till_SEKOB_15_00"); //Potâebuju mluvit s tvým otcem.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_01"); //Nemá čas. Ale já ho zastupuju. Jak ti můžu pomoct?
	AI_Output			(other, self, "DIA_Till_SEKOB_15_02"); //Pâedstav mę svému otci.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_03"); //Ty jsi opravdu neústupný chlapík a zâejmę i dobrý bojovník, co?
	AI_Output			(other, self, "DIA_Till_SEKOB_15_04"); //Ten nejlepší.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_05"); //Tak to asi bude lepší, když tę za ním vezmu.
	AI_Output			(other, self, "DIA_Till_SEKOB_15_06"); //Nedęlej si starosti, hochu. Najdu ho sám. Určitę.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_07"); //Když to âíkáš.
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	10;
	condition	 = 	DIA_Till_WASMACHSTDU_Condition;
	information	 = 	DIA_Till_WASMACHSTDU_Info;

	description	 = 	"Tak co tedy dęláš?";
};

func int DIA_Till_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Till_WASMACHSTDU_15_00"); //Tak co dęláš, když si zrovna nehraješ na pána farmy?
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_01"); //Hlídám.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_02"); //Ta mizerná domobrana z męsta leze na náš pozemek čím dál tím častęjc a krade všechno, co se dá odnést.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_03"); //Byli tu minulý týden a vzali si nękolik našich ovcí.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_04"); //Kdyby se mi nękdo z nich dostal do rukou, udęlal bych s ním krátký proces.
	AI_Output			(other, self, "DIA_Till_WASMACHSTDU_15_05"); //Ale jistę!

};

///////////////////////////////////////////////////////////////////////
//	Info warumnichtsld
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WARUMNICHTSLD		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	11;
	condition	 = 	DIA_Till_WARUMNICHTSLD_Condition;
	information	 = 	DIA_Till_WARUMNICHTSLD_Info;

	description	 = 	"Proč vám proti domobranę nepomůžou žoldáci?";
};

func int DIA_Till_WARUMNICHTSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_WASMACHSTDU))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_WARUMNICHTSLD_Info ()
{
	AI_Output			(other, self, "DIA_Till_WARUMNICHTSLD_15_00"); //Proč vám proti domobranę nepomůžou žoldáci?
	AI_Output			(self, other, "DIA_Till_WARUMNICHTSLD_03_01"); //Než ty se na nęco zmůžou, já už je dávno zaženu sám.
};

///////////////////////////////////////////////////////////////////////
//	Info Bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKO		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	5;
	condition	 = 	DIA_Till_BRONKO_Condition;
	information	 = 	DIA_Till_BRONKO_Info;

	description	 = 	"(Zeptat se na Bronca.)";
};

func int DIA_Till_BRONKO_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
		&& (Npc_KnowsInfo(other, DIA_Bronko_HALLO))
		&& (Kapitel < 5)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKO_15_00"); //Je tady chlápek, co chce po každém kolemjdoucím mýtné a tvrdí o sobę, že je farmáâ.
	AI_Output			(self, other, "DIA_Till_BRONKO_03_01"); //(rozpačitę) Eh. Ano. Já vím. To je Bronco. Dęlá si, co chce.
	AI_Output			(self, other, "DIA_Till_BRONKO_03_02"); //Jako bych ho milionkrát nedokopával k tomu, aby se vrátil do práce.
	AI_Output			(other, self, "DIA_Till_BRONKO_15_03"); //Ale?
	AI_Output			(self, other, "DIA_Till_BRONKO_03_04"); //Prostę to neudęlal.
	
	if (Npc_IsDead(Sekob)== FALSE)
	{
		AI_Output			(self, other, "DIA_Till_BRONKO_03_05"); //Můj otec je na mę pęknę naštvanej, že jsem ho ještę nedokázal pâinutit, aby se vrátil do práce.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Bronkozurarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOZURARBEIT		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	6;
	condition	 = 	DIA_Till_BRONKOZURARBEIT_Condition;
	information	 = 	DIA_Till_BRONKOZURARBEIT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Možná bych ti mohl pomoct.";
};

var int DIA_Till_BRONKOZURARBEIT_noPerm;

func int DIA_Till_BRONKOZURARBEIT_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_BRONKO))
		&& (DIA_Till_BRONKOZURARBEIT_noPerm == FALSE)
		&& (Kapitel < 5)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_BRONKOZURARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_15_00"); //Možná bych ti mohl pomoct.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_03_01"); //Myslíš s ním? Fajn, poslouchej, když se ti podaâí Bronca dostat zpátky do práce, zaplatím ti. Âeknęme 10 zlatých. Co âíkáš?

	Till_Angebot = 10;

	Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);

	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Žádný problém. Ale chci víc penęz.", DIA_Till_BRONKOZURARBEIT_mehr );
	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Dobrá. Uvidím, co se dá dęlat.", DIA_Till_BRONKOZURARBEIT_ok );
	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Budu o tom pâemýšlet.", DIA_Till_BRONKOZURARBEIT_nochnicht );

};

func void DIA_Till_BRONKOZURARBEIT_nochnicht ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_nochnicht_15_00"); //Budu o tom pâemýšlet.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_nochnicht_03_01"); //Jak je libo.

	Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
	AI_StopProcessInfos (self);
};

func void DIA_Till_BRONKOZURARBEIT_ok ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_ok_15_00"); //Dobrá. Uvidím, co se dá dęlat.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_ok_03_01"); //Ale pospęš si s tím.
	
	DIA_Till_BRONKOZURARBEIT_noPerm = TRUE;
	MIS_Sekob_Bronko_eingeschuechtert = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Bronkoeingeschuechtert, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert, LOG_RUNNING);
	B_LogEntry (TOPIC_Bronkoeingeschuechtert,"Till nedokáže Bronca pâimęt k práci, a proto mę požádal, abych se o to pokusil."); 

	AI_StopProcessInfos (self);
};

func void DIA_Till_BRONKOZURARBEIT_mehr ()
{
	if (Till_IchMachsNurEinmal == TRUE)
		{
			AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_00"); //Chci víc.
		}
	else
		{
			AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_01"); //Žádný problém. Ale chci víc penęz.
			Till_IchMachsNurEinmal = TRUE;
		};

	 if (Till_Angebot == 10)
	 	{
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_02"); //Dobrá. Tak teda 20 zlatých.
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Chci víc.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Dobrá. Uvidím, co se dá dęlat.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 20;
		}
	 else if (Till_Angebot == 20)
		{
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_03"); //30?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Chci víc.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Dobrá. Uvidím, co se dá dęlat.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 30;
		}
	 else if (Till_Angebot == 30)
		{	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_04"); //Možná... 50?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Dobrá. Uvidím, co se dá dęlat.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Dobrá. Uvidím, co se dá dęlat.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 50;
		}
	 else if (Till_Angebot == 50)
		{	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_05"); //Fajn. 70?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Chci víc.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Dobrá. Uvidím, co se dá dęlat.", DIA_Till_BRONKOZURARBEIT_ok );
		Till_Angebot = 70;
		}
	 else if (Till_Angebot == 70)
		{	
	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_06"); //Tak dobâe, dobâe! Dám ti 100 zlatých. Ale to je všechno, co mám.
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);

			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Dobrá. Uvidím, co se dá dęlat.", DIA_Till_BRONKOZURARBEIT_ok );

			Till_Angebot = 100;
		};
};

///////////////////////////////////////////////////////////////////////
//	Info bronkowiederanArbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOWIEDERANARBEIT		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	7;
	condition	 = 	DIA_Till_BRONKOWIEDERANARBEIT_Condition;
	information	 = 	DIA_Till_BRONKOWIEDERANARBEIT_Info;

	description	 = 	"Bronco se vrátil do práce.";
};

func int DIA_Till_BRONKOWIEDERANARBEIT_Condition ()
{
	if 	(
		(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		&& (DIA_Till_BRONKOZURARBEIT_noPerm == TRUE)
		&& (Kapitel < 5)
		)
		{
				return TRUE;
		};
};

func void DIA_Till_BRONKOWIEDERANARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_00"); //Bronco se vrátil do práce.
	AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_01"); //Vážnę? To je úžasný.
	AI_Output			(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_02"); //Jo. A teë k mojí odmęnę.
	
	IntToFloat	(Till_Angebot);
	
	if (Till_Angebot <= 50)
		{
			AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_03"); //(váhavę) Mmh. dobrá. Obchod je obchod, co?

			CreateInvItems (self, ItMi_Gold, Till_Angebot);									
			B_GiveInvItems (self, other, ItMi_Gold, Till_Angebot);
		}
	else
		{
			AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_04"); //Bohužel, nemám tolik penęz. Ale za tvou pomoc jsem ti velmi zavázán.

			Till_HatSeinGeldBehalten = TRUE;
		};

	B_GivePlayerXP (XP_BronkoGehtAnDieArbeit);

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Till_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	99;
	condition	 = 	DIA_Till_PERMKAP1_Condition;
	information	 = 	DIA_Till_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Provokovat Tilla.)";
};

func int DIA_Till_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	|| (Kapitel >= 5)
		{
				return TRUE;
		};
};

func void DIA_Till_PERMKAP1_Info ()
{
	if (Kapitel == 5)
		{
			if (MIS_bringRosiBackToSekob != LOG_SUCCESS)
			&& (Rosi_FleeFromSekob_Kap5 == TRUE)
			{
				AI_Output			(other, self, "DIA_Till_PERMKAP1_15_00"); //Daleko od domova, že ano? Tady ti tvůj tatík nepomůže.
				AI_Output			(self, other, "DIA_Till_PERMKAP1_03_01"); //Nebude to dlouho trvat a zavâu tu tvojí nevymáchanou hubu.
			};
			
			AI_Output			(other, self, "DIA_Till_PERMKAP1_15_02"); //Ty bâídile, ještę budeš mluvit o štęstí, když tę nechám naživu.
			AI_Output			(self, other, "DIA_Till_PERMKAP1_03_03"); //Tak mę nech na pokoji.
			AI_StopProcessInfos (self);	
		}
		else
		{		
			if 	(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
				{
					AI_Output			(other, self, "DIA_Till_PERMKAP1_15_04"); //Možná bys męl víc jíst, abys víc vyrostl a stal se silnęjším.
					AI_Output			(self, other, "DIA_Till_PERMKAP1_03_05"); //Jednou ti ukážu.
					AI_StopProcessInfos (self);
				}
			else
				{
					if (Till_HatSeinGeldBehalten == TRUE)
						{
							AI_Output			(other, self, "DIA_Till_PERMKAP1_15_06"); //Ty mizernej malej...
							AI_Output			(self, other, "DIA_Till_PERMKAP1_03_07"); //Prostę vypadni.
							AI_StopProcessInfos (self);
						}			
					else
						{
							AI_Output			(other, self, "DIA_Till_PERMKAP1_15_08"); //Máš nękoho, kdo ti dneska bude foukat na nosánek?
							AI_Output			(self, other, "DIA_Till_PERMKAP1_03_09"); //Nech mę být, ty pitomče.
						};
				};
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Till_PICKPOCKET (C_INFO)
{
	npc			= BAU_931_Till;
	nr			= 900;
	condition	= DIA_Till_PICKPOCKET_Condition;
	information	= DIA_Till_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Till_PICKPOCKET_Condition()
{
	C_Beklauen (36, 40);
};
 
FUNC VOID DIA_Till_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Till_PICKPOCKET);
	Info_AddChoice		(DIA_Till_PICKPOCKET, DIALOG_BACK 		,DIA_Till_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Till_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Till_PICKPOCKET_DoIt);
};

func void DIA_Till_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Till_PICKPOCKET);
};
	
func void DIA_Till_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Till_PICKPOCKET);
};


