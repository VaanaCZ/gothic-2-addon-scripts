///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Malak_EXIT   (C_INFO)
{
	npc         = BAU_963_Malak;
	nr          = 999;
	condition   = DIA_Malak_EXIT_Condition;
	information = DIA_Malak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Malak_EXIT_Condition()
{
		if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Malak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_HALLO		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	3;
	condition	 = 	DIA_Malak_HALLO_Condition;
	information	 = 	DIA_Malak_HALLO_Info;

	description	 = 	"Je všechno v poâádku?";
};

func int DIA_Malak_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Malak_HALLO_15_00"); //Je všechno v poâádku?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Malak_HALLO_08_01"); //Další nádeník, co neví, kam by se vrtnul? Žádný problém. Promluv si s Bengarem, naším farmáâem.
		}
	else
		{
			AI_Output			(self, other, "DIA_Malak_HALLO_08_02"); //Jasnê.
		};

};


///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	4;
	condition	 = 	DIA_Malak_WASMACHSTDU_Condition;
	information	 = 	DIA_Malak_WASMACHSTDU_Info;

	description	 = 	"Co tady dêláš?";
};

func int DIA_Malak_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Malak_WASMACHSTDU_15_00"); //Co tady dêláš?
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_01"); //Jsem ovèák. Není to zrovna nároèná práce.
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_02"); //Ale teë si musíš dávat poâádný pozor. Zvlášã když se dostaneš blízko k prùsmyku.

};


///////////////////////////////////////////////////////////////////////
//	Info pass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PASS		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	5;
	condition	 = 	DIA_Malak_PASS_Condition;
	information	 = 	DIA_Malak_PASS_Info;

	description	 = 	"Co víš o tom prùsmyku?";
};

func int DIA_Malak_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PASS_15_00"); //Co víš o tom prùsmyku?
	AI_Output			(self, other, "DIA_Malak_PASS_08_01"); //Nic moc. Jen to, že vede do Hornického údolí, co ještê pâed pár týdny uzavírala magická bariéra.
	AI_Output			(self, other, "DIA_Malak_PASS_08_02"); //Ale jinak jediná vêc, na kterou si my farmáâi musíme dávat pozor, jsou karavany, co každý mêsíc vozí do Hornického údolí všechno možné.
	AI_Output			(self, other, "DIA_Malak_PASS_08_03"); //Ti hrdloâezové nám dokážou poâádnê znepâíjemnit život.

};

///////////////////////////////////////////////////////////////////////
//	Info wopass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WOPASS		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	6;
	condition	 = 	DIA_Malak_WOPASS_Condition;
	information	 = 	DIA_Malak_WOPASS_Info;

	description	 = 	"Kde najdu prùsmyk do Hornického údolí?";
};

func int DIA_Malak_WOPASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_HALLO))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_WOPASS_Info ()
{
	AI_Output			(other, self, "DIA_Malak_WOPASS_15_00"); //Kde najdu prùsmyk do Hornického údolí?
	AI_Output			(self, other, "DIA_Malak_WOPASS_08_01"); //Poblíž vodopádù na druhé stranê náhorních pastvin.

};



///////////////////////////////////////////////////////////////////////
//	Info minental
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_MINENTAL		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	7;
	condition	 = 	DIA_Malak_MINENTAL_Condition;
	information	 = 	DIA_Malak_MINENTAL_Info;

	description	 = 	"Co se povídá o Hornickém údolí?";
};

func int DIA_Malak_MINENTAL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_PASS))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_MINENTAL_Info ()
{

	AI_Output			(other, self, "DIA_Malak_MINENTAL_15_00"); //Co se povídá o Hornickém údolí?
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_01"); //Všechno možné. Nêkteâí z chlapù slyšeli v noci kâik, nêkteâí vidêli podivná svêtla nad horami.
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_02"); //Ale jestli to chceš vêdêt, tak to všechno jsou jen babský povídaèky.

};


///////////////////////////////////////////////////////////////////////
//	Info warstduschonda
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WARSTDUSCHONDA		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	8;
	condition	 = 	DIA_Malak_WARSTDUSCHONDA_Condition;
	information	 = 	DIA_Malak_WARSTDUSCHONDA_Info;

	description	 = 	"Už jsi nêkdy byl v Hornickém údolí?";
};

func int DIA_Malak_WARSTDUSCHONDA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_PASS))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_WARSTDUSCHONDA_Info ()
{
	AI_Output			(other, self, "DIA_Malak_WARSTDUSCHONDA_15_00"); //Už jsi nêkdy byl v Hornickém údolí?
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_01"); //Ne. Ale jednou za èas se k nêmu dostanu. To vždycky vidím ty dva paladiny, co stojí u brány a drží stráž.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_02"); //Vypadá to, jako by se ujišãovali, že se z údolí nic nedostane ven.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_03"); //Ale jinak je Hornické údolí vlastnê takové pâirozené vêzení. Jakmile tam jedou vejdeš, ven už se nedostaneš.

};


///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PALADINE		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 9;
	condition	 = 	DIA_Malak_PALADINE_Condition;
	information	 = 	DIA_Malak_PALADINE_Info;

	description	 = 	"Povêz mi o paladinech nêco víc. Jak dlouho už tu jsou?";
};

func int DIA_Malak_PALADINE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Malak_WARSTDUSCHONDA))
		&& 	(Npc_KnowsInfo(other, DIA_Malak_MINENTAL))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Malak_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PALADINE_15_00"); //Âekni mi víc o têch paladinech. Jak dlouho už tam jsou?
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_01"); //Týden, dva. Myslím. Pâesnê to nevím.
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_02"); //Nedávno se jich tu potloukala celá skupina a pak zmizeli v prùsmyku. Od té doby už jsem je nevidêl.

};

///////////////////////////////////////////////////////////////////////
//	Info keineFrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_KEINEFRAUEN		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 10;
	condition	 = 	DIA_Malak_KEINEFRAUEN_Condition;
	information	 = 	DIA_Malak_KEINEFRAUEN_Info;

	description	 = 	"Nevidêl jsem tady žádnou ženu.";
};

func int DIA_Malak_KEINEFRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_KEINEFRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Malak_KEINEFRAUEN_15_00"); //Nevidêl jsem tady žádnou ženu.
	AI_Output			(self, other, "DIA_Malak_KEINEFRAUEN_08_01"); //Tak to máš pravdu. Tohle je farma pro chlapy, abych tak âekl. Hodnê práce, âekl bych.

};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	11;
	condition	 = 	DIA_Malak_PERMKAP1_Condition;
	information	 = 	DIA_Malak_PERMKAP1_Info;
	permanent	 =  TRUE;	

	description	 = 	"S tou prací to nepâehánêj.";
};

func int DIA_Malak_PERMKAP1_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Malak_HALLO))
		&& (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
		&& (Npc_KnowsInfo(other, DIA_Malak_PASS))
		&& (Npc_KnowsInfo(other, DIA_Malak_MINENTAL))
		&& (Npc_KnowsInfo(other, DIA_Malak_WARSTDUSCHONDA))
		&& (Npc_KnowsInfo(other, DIA_Malak_PALADINE))
		&& (Npc_KnowsInfo(other, DIA_Malak_KEINEFRAUEN))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Malak_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PERMKAP1_15_00"); //S tou prací to nepâehánêj.
	AI_Output			(self, other, "DIA_Malak_PERMKAP1_08_01"); //Pokusím se.

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

INSTANCE DIA_Malak_KAP3_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP3_EXIT_Condition;
	information	= DIA_Malak_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info fleefromPass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_FLEEFROMPASS		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	30;
	condition	 = 	DIA_Malak_FLEEFROMPASS_Condition;
	information	 = 	DIA_Malak_FLEEFROMPASS_Info;

	description	 = 	"Co tady dêláš?";
};

func int DIA_Malak_FLEEFROMPASS_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Malak_FLEEFROMPASS_Info ()
{
	if 	(NpcObsessedByDMT_Malak == FALSE)
	&& (hero.guild == GIL_KDF)
	{
	B_NpcObsessedByDMT (self);
	}
	else
	{
	AI_Output			(other, self, "DIA_Malak_FLEEFROMPASS_15_00"); //Co tady dêláš?
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_01"); //Utekl jsem sem z Bengarovy farmy. Nechtêlo se mi èekat, až mê rozsápe nêkterá z têch nestvùr, co pâicházejí z prùsmyku.
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_02"); //Nedokážeš si pâedstavit, co se za posledních nêkolik dnù odtamtud všechno vyvalilo.
	AI_Output			(other, self, "DIA_Malak_FLEEFROMPASS_15_03"); //Ale dokážu.
	B_LogEntry (TOPIC_BengarALLEIN,"Malak se usadil na jihu, neboã se bojí nestvùr, které nahoru na pastviny pâicházejí z prùsmyku."); 
	B_GivePlayerXP (XP_FoundMalakFLEEFROMPASS);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_Heilung		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	55;
	condition	 = 	DIA_Malak_Heilung_Condition;
	information	 = 	DIA_Malak_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Potâebuješ pomoct.";
};

func int DIA_Malak_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Malak == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& (Kapitel >= 3)
	 {
				return TRUE;
	 };
};
var int DIA_Malak_Heilung_oneTime;
func void DIA_Malak_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Malak_Heilung_15_00"); //Potâebuješ pomoct.

	if (DIA_Malak_Heilung_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Malak_Heilung_08_01"); //(plaètivê) Jen bych chtêl jít domù. Vrátím se k Bengarovi. Doufám, že je ještê naživu.

		B_NpcClearObsessionByDMT (self);
		Npc_ExchangeRoutine	(self,"Zaèít");
		B_StartOtherRoutine   (BAU_962_Bauer,"Zaèít"); 
		B_StartOtherRoutine   (BAU_964_Bauer,"Zaèít"); 
		B_StartOtherRoutine   (BAU_965_Bauer,"Zaèít"); 
		B_StartOtherRoutine   (BAU_966_Bauer,"Zaèít"); 
		B_StartOtherRoutine   (BAU_967_Bauer,"Zaèít"); 
		B_StartOtherRoutine   (BAU_968_Bauer,"Zaèít"); 
		B_StartOtherRoutine   (BAU_969_Bauer,"Zaèít"); 

	DIA_Malak_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Malak_Heilung_08_02"); //Nech mê na pokoji, mágu. Poradím si sám.
		B_NpcClearObsessionByDMT (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info permcastle
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PERMCASTLE		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	31;
	condition	 = 	DIA_Malak_PERMCASTLE_Condition;
	information	 = 	DIA_Malak_PERMCASTLE_Info;
	permanent	 = 	TRUE;

	description	 = 	"A co tady?";
};

func int DIA_Malak_PERMCASTLE_Condition ()
{
	if (Npc_GetDistToWP(self,"CASTLEMINE")<4000) 
	&& (MIS_GetMalakBack != LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Malak_FLEEFROMPASS))
	&& (NpcObsessedByDMT_Malak == FALSE)	
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >=3)
		{
				return TRUE;
		};
};

func void DIA_Malak_PERMCASTLE_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PERMCASTLE_15_00"); //A co tady?
	AI_Output			(self, other, "DIA_Malak_PERMCASTLE_08_01"); //Tady mám jen potíže s bandity. Poâád lepší než ty zrùdy.
};

///////////////////////////////////////////////////////////////////////
//	Info BacktoBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_BACKTOBENGAR		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	31;
	condition	 = 	DIA_Malak_BACKTOBENGAR_Condition;
	information	 = 	DIA_Malak_BACKTOBENGAR_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bengar tê potâebuje. Èeká, až se k nêmu vrátíš nêmu na statek.";
};

func int DIA_Malak_BACKTOBENGAR_Condition ()
{
	if (MIS_GetMalakBack == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Malak_FLEEFROMPASS))
	&& ((Npc_IsDead(Bengar))==FALSE)
	&& (NpcObsessedByDMT_Malak == FALSE)	
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_BACKTOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_00"); //Bengar tê potâebuje. Chce, aby ses vrátil na farmu.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_01"); //Nejsem blázen. Dokud nebude farma dobâe zabezpeèená, nehodlám odsud vystrèit nos!
	
	B_LogEntry (TOPIC_BengarALLEIN,"Malak se nemíní vrátit na Bengarùv statek, dokud zùstává nechránêný."); 

	if (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_02"); //Najal jsem žoldáka. Dává na farmu pozor.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_03"); //Tak to je samozâejmê jiná. Ale poèkat. Kdo toho chlapíka platí, he?
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_04"); //To je mùj problém.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_05"); //(zvêdavê) Mmh. Asi není šance, že bys mi to âekl, co?
	
	Info_AddChoice	(DIA_Malak_BACKTOBENGAR, "Ne.", DIA_Malak_BACKTOBENGAR_los );
	};
};

func void DIA_Malak_BACKTOBENGAR_los ()
{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_los_15_00"); //Ne.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_los_08_01"); //Fajn. Tak se vrátím. Doufám, že ten chlap k nêèemu bude.
	MIS_GetMalakBack = LOG_SUCCESS;
	B_GivePlayerXP (XP_Malak_BACKTOBENGAR);
	B_NpcClearObsessionByDMT (self);
	Npc_ExchangeRoutine	 (self,"Zaèít");
	B_StartOtherRoutine   (BAU_962_Bauer,"Zaèít"); 
	B_StartOtherRoutine   (BAU_964_Bauer,"Zaèít"); 
	B_StartOtherRoutine   (BAU_965_Bauer,"Zaèít"); 
	B_StartOtherRoutine   (BAU_966_Bauer,"Zaèít"); 
	B_StartOtherRoutine   (BAU_967_Bauer,"Zaèít"); 
	B_StartOtherRoutine   (BAU_968_Bauer,"Zaèít"); 
	B_StartOtherRoutine   (BAU_969_Bauer,"Zaèít"); 
};

///////////////////////////////////////////////////////////////////////
//	Info Back
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_BACK		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	32;
	condition	 = 	DIA_Malak_BACK_Condition;
	information	 = 	DIA_Malak_BACK_Info;
	permanent	 = 	TRUE;

	description	 = 	"Zùstaneš teë na Bengarovê farmê?";
};

func int DIA_Malak_BACK_Condition ()
{
	if (MIS_GetMalakBack == LOG_SUCCESS)
	&& (NpcObsessedByDMT_Malak == FALSE)	
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_BACK_Info ()
{
	AI_Output			(other, self, "DIA_Malak_BACK_15_00"); //Zùstaneš teë na Bengarovê farmê?
	AI_Output			(self, other, "DIA_Malak_BACK_08_01"); //Jasnê. Nêjak to zvládneme.
	B_NpcClearObsessionByDMT (self);
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

INSTANCE DIA_Malak_KAP4_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP4_EXIT_Condition;
	information	= DIA_Malak_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
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

INSTANCE DIA_Malak_KAP5_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP5_EXIT_Condition;
	information	= DIA_Malak_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
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


INSTANCE DIA_Malak_KAP6_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP6_EXIT_Condition;
	information	= DIA_Malak_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Malak_PICKPOCKET (C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 900;
	condition	= DIA_Malak_PICKPOCKET_Condition;
	information	= DIA_Malak_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Malak_PICKPOCKET_Condition()
{
	C_Beklauen (43, 40);
};
 
FUNC VOID DIA_Malak_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Malak_PICKPOCKET);
	Info_AddChoice		(DIA_Malak_PICKPOCKET, DIALOG_BACK 		,DIA_Malak_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Malak_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Malak_PICKPOCKET_DoIt);
};

func void DIA_Malak_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Malak_PICKPOCKET);
};
	
func void DIA_Malak_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Malak_PICKPOCKET);
};



























































