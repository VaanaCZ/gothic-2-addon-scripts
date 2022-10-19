// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Dar_EXIT (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 999;
	condition   = DIA_Dar_EXIT_Condition;
	information = DIA_Dar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Dar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Dar_Hallo (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 1;
	condition   = DIA_Dar_Hallo_Condition;
	information = DIA_Dar_Hallo_Info;
	permanent   = FALSE;
	description = "Co to tu kouâíš?";
};

FUNC INT DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Dar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Dar_Hallo_15_00"); //Co to tu kouâíš?
	AI_Output (self, other, "DIA_Dar_Hallo_03_01"); //Chceš šluka?
	
	Info_ClearChoices (DIA_Dar_Hallo);
	Info_AddChoice (DIA_Dar_Hallo, "Ne.", DIA_Dar_Hallo_Nein);
	Info_AddChoice (DIA_Dar_Hallo, "Jasnê.", DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_00"); //Jasnê.
	CreateInvItem (other, itmi_joint);
	B_UseItem (other, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_01"); //Není špatná, co?
	AI_Output (other, self, "DIA_Dar_Hallo_Ja_15_02"); //Kde jsi tenhle matroš sehnal?
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Hallo_Ja_03_03"); //(kâení se) Mám svý zdroje.
	Info_ClearChoices (DIA_Dar_Hallo);	
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output (other, self, "DIA_Dar_Hallo_Nein_15_00"); //Ne.
	Info_ClearChoices (DIA_Dar_Hallo);	
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Dar_einmal; 

INSTANCE DIA_Dar_PERM (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 2;
	condition   = DIA_Dar_PERM_Condition;
	information = DIA_Dar_PERM_Info;
	permanent   = TRUE;
	description = "Dêláš taky kromê hulení nêco jinýho?";
};

FUNC INT DIA_Dar_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_PERM_Info()
{
	AI_Output (other, self, "DIA_Dar_PERM_15_00"); //Dêláš taky kromê hulení nêco jinýho?
	
	if (Dar_LostAgainstCipher == TRUE)
	&& (Dar_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_01"); //(sarkasticky) Nêkdy se nechám zmlátit od pomstychtivých feãákù kvùli týhle trávê...
		Dar_einmal = TRUE;
	}
		else //DEFAULT
	{
		AI_Output (self, other, "DIA_Dar_PERM_03_02"); //V tuhle chvíli ne.
	};
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************

INSTANCE DIA_Dar_WannaJoin (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 3;
	condition   = DIA_Dar_WannaJoin_Condition;
	information = DIA_Dar_WannaJoin_Info;
	permanent   = FALSE;
	description = "Chci se pâidat k žoldákùm. Bude ti to vadit?";
};

FUNC INT DIA_Dar_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_Hallo))
	&& (other.guild == GIL_NONE)
	&& (Dar_LostAgainstCipher == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Dar_WannaJoin_15_00"); //Chci se pâidat k žoldákùm. Bude ti to vadit?
	AI_Output (self, other, "DIA_Dar_WannaJoin_03_01"); //Je mi to jedno.
};

// ************************************************************
// 			  				DuDieb
// ************************************************************

INSTANCE DIA_Dar_DuDieb (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 4;
	condition   = DIA_Dar_DuDieb_Condition;
	information = DIA_Dar_DuDieb_Info;
	permanent   = FALSE;
	description = "Cipher mi âekl, že mu nêkdo ukradnul jeho balíèek trávy z bažin...";
};

FUNC INT DIA_Dar_DuDieb_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat)) //von Diebstahl gehört
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_DuDieb_Info()
{
	AI_Output (other, self, "DIA_Dar_DuDieb_15_00"); //Cipher mi âekl, že mu nêkdo ukradnul jeho balíèek trávy.
	AI_Output (self, other, "DIA_Dar_DuDieb_03_01"); //(debilnê a tlumenê se smêje)
	AI_Output (other, self, "DIA_Dar_DuDieb_15_02"); //Nevíš o tom nêco?
	AI_Output (self, other, "DIA_Dar_DuDieb_03_03"); //(velmi krátce) Ne.
	
	Dar_Verdacht = TRUE;
};

// ************************************************************
// 			  				WoPaket
// ************************************************************

INSTANCE DIA_Dar_WoPaket (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 4;
	condition   = DIA_Dar_WoPaket_Condition;
	information = DIA_Dar_WoPaket_Info;
	permanent   = TRUE;
	description = "Kde je ten balík?";
};

FUNC INT DIA_Dar_WoPaket_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_WoPaket_Info()
{
	AI_Output (other, self, "DIA_Dar_WoPaket_15_00"); //(výhrùžnê) Kde je ten balíèek?
		
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{	
		AI_Output (self, other, "DIA_Dar_WoPaket_03_01"); //Dobâe, dobâe, dobâe. Prodal jsem ho nêjakýmu pobudovi ve mêstê.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_02"); //Bylo to v pâístavu. Nemùžu si vzpomenout, jak vypadal.
		AI_Output (other, self, "DIA_Dar_WoPaket_15_03"); //Koleduješ si o další výprask?
		AI_Output (self, other, "DIA_Dar_WoPaket_03_04"); //Upâímnê, chlape, byl jsem totálnê zfetovanej. Nemám nejmenší ponêtí, jak ten chlápek vypadal.
		AI_Output (self, other, "DIA_Dar_WoPaket_03_05"); //Bylo to v pâístavu blízko lodênic. To je všechno, na co si vzpomínám.
	
		Dar_Dieb = TRUE;
		B_LogEntry (Topic_CipherPaket,"Dar se pâiznal, že balík s trávou ukradl on. Prodal jej v khorinidské pâístavní ètvrti, hned vedle loëaâovy dílny.");
	}
	else
	{
		AI_Output (self, other, "DIA_Dar_WoPaket_03_06"); //Co já vím?
	};
};

// ************************************************************
// 			  				AufsMaul
// ************************************************************

INSTANCE DIA_Dar_AufsMaul (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 5;
	condition   = DIA_Dar_AufsMaul_Condition;
	information = DIA_Dar_AufsMaul_Info;
	permanent   = FALSE;
	description = "Já to z tebe vymlátím!";
};

FUNC INT DIA_Dar_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_AufsMaul_Info()
{
	AI_Output (other, self, "DIA_Dar_AufsMaul_15_00"); //Já to z tebe vymlátím!
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_01"); //Klídek. Jsem moc zhulenej na to, abych s tebou bojoval!
	B_GiveInvItems (self, other, itmi_joint, 1);
	AI_Output (self, other, "DIA_Dar_AufsMaul_03_02"); //Na, dej si nejdâív velkýho šluka!
};

// ************************************************************
// 			  			Kameradenschwein
// ************************************************************

INSTANCE DIA_Dar_Kameradenschwein (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 1;
	condition   = DIA_Dar_Kameradenschwein_Condition;
	information = DIA_Dar_Kameradenschwein_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Dar_Kameradenschwein_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] == FALSE; //geht NUR bei ECHTER Important-Info!
		return TRUE;
	};
};

FUNC VOID DIA_Dar_Kameradenschwein_Info()
{
	AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_00"); //Kecale! Âekl jsi Cipherovi, že jsem mu vzal jeho trávu!
	if (Npc_KnowsInfo (other, DIA_Dar_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Dar_Kameradenschwein_03_01");  //Nebudu pro tebe hlasovat.
	};
};

// ************************************************************
// 			  				Pilztabak
// ************************************************************

INSTANCE DIA_Dar_Pilztabak (C_INFO)
{
	npc         = SLD_810_Dar;
	nr          = 6;
	condition   = DIA_Dar_Pilztabak_Condition;
	information = DIA_Dar_Pilztabak_Info;
	permanent   = FALSE;
	description	= "Už jsi nêkdy balil tabák?";
};

FUNC INT DIA_Dar_Pilztabak_Condition()
{
	if (Npc_HasItems (other, Itmi_Pilztabak) > 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_Pilztabak_Info()
{
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_00"); //Už sis nêkdy zkoušel sám namíchat tabák?
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_01"); //To zní zajímavê. Dej to sem.
	B_GiveInvItems (other, self, Itmi_Pilztabak, 1);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_02"); //Jasnê, jdeme na to.
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_03"); //Už jsi nêkdy kouâil takovejhle materiálek?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_04"); //No...
	CreateInvItem (self, itmi_joint);
	B_UseItem (self, itmi_joint);
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_05"); //Kouâil, nebo nekouâil?
	AI_Output (other, self, "DIA_Dar_Pilztabak_15_06"); //Nêjak jsem se k tomu nedostal...
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_07"); //Kurva!
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_08"); //Svatý Rhobare!
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	AI_Output (self, other, "DIA_Dar_Pilztabak_03_09"); //Tenhle matroš je dost krutej! Vùbec to nezkoušej!
	B_GivePlayerXP (XP_Ambient);
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

INSTANCE DIA_Dar_KAP3_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP3_EXIT_Condition;
	information	= DIA_Dar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
}; 
                      
FUNC INT DIA_Dar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Dar_KAP4_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP4_EXIT_Condition;
	information	= DIA_Dar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orcring
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_ORCRING		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_ORCRING_Condition;
	information	 = 	DIA_Dar_ORCRING_Info;

	description	 = 	"Vypadá to, že tu chybí nêjací žoldáci.";
};

func int DIA_Dar_ORCRING_Condition ()
{
	if (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Dar_ORCRING_Info ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_15_00"); //Vypadá to, že tu chybí nêjací žoldáci.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_01"); //Jo, to máš recht. Sylvio je na míle daleko a vzal pùlku posádky s sebou.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_02"); //To je jedno. Mám alespoà vêtší šanci stát se jedním z Leeových chlapcù. Všechno, co potâebuju, je se porvat.
	AI_Output			(self, other, "DIA_Dar_ORCRING_03_03"); //Kdybych mohl dokázat, že jsem skuteènê ostrej chlápek, možná bych se dokonce mohl stát jedním z Leeových têlesných strážcù.

	Info_ClearChoices	(DIA_Dar_ORCRING);
	Info_AddChoice	(DIA_Dar_ORCRING, "To mê neznepokojuje.", DIA_Dar_ORCRING_no );
	Info_AddChoice	(DIA_Dar_ORCRING, "Ostrej chlápek? Ty?", DIA_Dar_ORCRING_necken );
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice	(DIA_Dar_ORCRING, "Co by to mêlo být?", DIA_Dar_ORCRING_wie );
	};
};

func void DIA_Dar_ORCRING_necken ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_15_00"); //Ostrej chlápek? Ty?
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_01"); //(naštvanê) Oj, ale no tak, sklapni. Kdopak jsi ve skuteènosti?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_02"); //Nêjakej nafoukanej trouba z mêsta. Vy chcípáci nemáte nic, co byste mohli nabídnout.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_03"); //Jsi tu jenom pár dní a už máš takovýhle kecy.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_04"); //Koho si myslíš, že têma svejma blbejma magickýma kecama vystrašíš? Mê teda rozhodnê ne.
		}; 
	

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_05"); //Když o tom tak pâemýšlím, rozbití tvojí lebky je pâesnê to, èím bych si mohl u Leeových chlapcù vysloužit ten správný respekt.

		Info_ClearChoices	(DIA_Dar_ORCRING);
		Info_AddChoice	(DIA_Dar_ORCRING, "Nemám èas na tyhle kecy.", DIA_Dar_ORCRING_necken_no );
		Info_AddChoice	(DIA_Dar_ORCRING, "OK. Tak to zkus.", DIA_Dar_ORCRING_necken_schlagen );
	}
	else
	{
		AI_Output			(self, other, "DIA_Dar_ORCRING_necken_03_06"); //Tak poèkej. Najdu si zpùsob, jak udêlat na Leeho dojem.
	};
};
var int Dar_FightAgainstPaladin;
func void DIA_Dar_ORCRING_necken_schlagen ()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_schlagen_15_00"); //Fajn. Tak to zkus.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_schlagen_03_01"); //Eh, nemùžu èekat.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Dar_ORCRING_necken_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_necken_no_15_00"); //Nemám èas na tyhle kecy.
	AI_Output			(self, other, "DIA_Dar_ORCRING_necken_no_03_01"); //Jo, jasnê. Zapomnêl jsem, rytíâ spravedlnosti bez báznê a hany. To je zlý. Myslel jsem, že máš víc kuráže.
	AI_StopProcessInfos (self);
};

func void DIA_Dar_ORCRING_wie ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_wie_15_00"); //Co by to mêlo být?
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_01"); //Nevím pâesnê. Nêjaká skâetí trofej by nebyla k zahození.
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_02"); //Tâeba odznak od vùdce skâetù nebo nêco takového. Prapor, prsten... a tak nêco.
	AI_Output			(self, other, "DIA_Dar_ORCRING_wie_03_03"); //S nièím menším tady dojem neudêláš. O tom žádná.
	
	Log_CreateTopic (TOPIC_Dar_BringOrcEliteRing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing, LOG_RUNNING);
	B_LogEntry (TOPIC_Dar_BringOrcEliteRing,"Dar se chce stát pohlavárem žoldnéâù, a k tomu potâebuje nêjakou skâetí trofej. Praporec, nárameník, prsten nebo nêco takového."); 

	MIS_Dar_BringOrcEliteRing = LOG_RUNNING;
	Info_ClearChoices	(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no ()
{
	AI_Output			(other, self, "DIA_Dar_ORCRING_no_15_00"); //To mê neznepokojuje.
	AI_Output			(self, other, "DIA_Dar_ORCRING_no_03_01"); //(naštvanê) Samozâejmê že ne. To by mê ohromilo.
	Info_ClearChoices	(DIA_Dar_ORCRING);
};

///////////////////////////////////////////////////////////////////////
//	Info FightagainstPalOver
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_FIGHTAGAINSTPALOVER		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	information	 = 	DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important	 = 	TRUE;
};

func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition ()
{
	if 	(Dar_FightAgainstPaladin == TRUE)
	&&	((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
				return TRUE;
		};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info ()
{
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_00"); //Jasnê, vím, že Lee nebude úplnê nadšenej, když se v tom s tebou budu zase angažovat.
	AI_Output			(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_01"); //Nechci si tu nikoho znepâátelit, tak na ten nesmysl prostê zapomeneme, jo?
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringOrcEliteRing
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_BRINGORCELITERING		(C_INFO)
{
	npc		 = 	SLD_810_Dar;
	nr		 = 	4;
	condition	 = 	DIA_Dar_BRINGORCELITERING_Condition;
	information	 = 	DIA_Dar_BRINGORCELITERING_Info;

	description	 = 	"Mám tu skâetí trofej, jak jsi chtêl.";
};

func int DIA_Dar_BRINGORCELITERING_Condition ()
{
	if (MIS_Dar_BringOrcEliteRing == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	&& (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
				return TRUE;
		};
};

func void DIA_Dar_BRINGORCELITERING_Info ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_00"); //Mám tu skâetí trofej, jak jsi chtêl.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_01"); //Cos mi to pâinesl?
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_15_02"); //Prsten skâetího vojevùdce.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_03_03"); //Fíha, no když je to tak... Co za to chceš?
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);

	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Co mi mùžeš nabídnout?", DIA_Dar_BRINGORCELITERING_was );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Dej mi nêjaké zlato.", DIA_Dar_BRINGORCELITERING_geld );
	};
		
};
func void DIA_Dar_BRINGORCELITERING_geld ()
{
	
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_00"); //Dej mi nêjaké zlato.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_01"); //Tâeba 600 zlaãákù?
		AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_02"); //Kolik že?
	};

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_03"); //No dobâe, dám ti za to 1200 zlaãákù.
	
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_04"); //Buë ber, nebo si ten prsten nech.
	};
	
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "To nestaèí.", DIA_Dar_BRINGORCELITERING_geld_no );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Dohodnuto.", DIA_Dar_BRINGORCELITERING_geld_ok );

};
func void DIA_Dar_BRINGORCELITERING_geld_ok ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_ok_15_00"); //Dojednáno - tady je.
	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_ok_03_01"); //Díky, už se nemùžu doèkat, co na to âeknou ostatní.

	CreateInvItems 		(self, ItMi_Gold, 1200);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 1200);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_geld_no_15_00"); //To nestaèí.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_geld_no_03_01"); //A já si zase myslím, že je to nêjak moc. Bez urážky, tahle záležitost se mi zdá nêjak podezâelá.
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_15_00"); //Co mi mùžeš nabídnout?
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_01"); //Buë si vezmi peníze, nebo tenhle amulet, co jsem... no, âeknême, že jsem ho pâed èasem nêjak získal.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_03_02"); //Zvyšuje obratnost, sám jsem to vyzkoušel.

	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Dej mi nêjaké zlato.", DIA_Dar_BRINGORCELITERING_geld );
	Info_AddChoice	(DIA_Dar_BRINGORCELITERING, "Dej mi ten amulet.", DIA_Dar_BRINGORCELITERING_was_am );
};

func void DIA_Dar_BRINGORCELITERING_was_am ()
{
	AI_Output			(other, self, "DIA_Dar_BRINGORCELITERING_was_am_15_00"); //Dej mi ten amulet.
	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_01"); //Jasàaèka, jen si ho užij. A teë naval ten prsten.

	B_GiveInvItems 		(other, self, ItRi_OrcEliteRing, 1);					
	CreateInvItems 		(self, ItAm_Dex_01, 1);									
	B_GiveInvItems 		(self, other, ItAm_Dex_01, 1);					
	B_GivePlayerXP 		(XP_Dar_BringOrcEliteRing);

	AI_Output			(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_02"); //Têšilo mê.
	Info_ClearChoices	(DIA_Dar_BRINGORCELITERING);

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

INSTANCE DIA_Dar_KAP5_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP5_EXIT_Condition;
	information	= DIA_Dar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP5_EXIT_Info()
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


INSTANCE DIA_Dar_KAP6_EXIT(C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 999;
	condition	= DIA_Dar_KAP6_EXIT_Condition;
	information	= DIA_Dar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Dar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dar_PICKPOCKET (C_INFO)
{
	npc			= SLD_810_Dar;
	nr			= 900;
	condition	= DIA_Dar_PICKPOCKET_Condition;
	information	= DIA_Dar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Dar_PICKPOCKET_Condition()
{
	C_Beklauen (67, 35);
};
 
FUNC VOID DIA_Dar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dar_PICKPOCKET);
	Info_AddChoice		(DIA_Dar_PICKPOCKET, DIALOG_BACK 		,DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dar_PICKPOCKET);
};
	
func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dar_PICKPOCKET);
};












































