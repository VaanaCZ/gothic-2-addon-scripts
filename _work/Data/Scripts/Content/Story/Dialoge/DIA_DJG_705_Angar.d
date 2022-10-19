///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_AngarDJG_EXIT   (C_INFO)
{
	npc         = DJG_705_Angar;
	nr          = 999;
	condition   = DIA_AngarDJG_EXIT_Condition;
	information = DIA_AngarDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_AngarDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_AngarDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	5;
	condition	 = 	DIA_AngarDJG_HALLO_Condition;
	information	 = 	DIA_AngarDJG_HALLO_Info;

	description	 = 	"Neznáme se?";
};

func int DIA_AngarDJG_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_AngarDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_HALLO_15_00"); //Neznáme se? Ty jsi Cor Angar. Býval jsi templáâem v táboâe v bažinách.
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_01"); //(rezignovanê) Âíkej mi Angar. Ten titul už nepoužívám. Spáèovo bratrstvo už neexistuje.
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_02"); //Zajímavé, ale vypadá to, jako bys mê už odnêkud znal. Nêjak si tê nemohu vybavit.
	AI_Output			(other, self, "DIA_AngarDJG_HALLO_15_03"); //Co to s tebou je?
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_04"); //(pâehlíživê) Ale, svýho èasu jsem vùbec nemohl spát. Poâád jsem mêl noèní mùry.
	B_LogEntry (TOPIC_Dragonhunter,"V Hornickém údolí jsem našel Angara.");
};


///////////////////////////////////////////////////////////////////////
//	B_SCTellsAngarAboutMadPsi
///////////////////////////////////////////////////////////////////////
func void B_SCTellsAngarAboutMadPsi ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00"); //Spáèovo bratrstvo si zotroèilo zlo.
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01"); //Tví dâívêjší pâátelé ze starého tábora procházejí zemí v èerných róbách a vypadají, že je všechno, co se hýbe, neskuteènê štve.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02"); //O èem to mluvíš?
	};
};

func void B_SCTellsAngarAboutMadPsi2 ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00"); //Slouží nepâíteli a nejsou nièím jiným než bezduchými bojovníky zla.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01"); //U všech bohù. Vêdêt to, nebyl bych tak zaslepeným. Už se to víckrát nestane, Pâísahám.
		B_GivePlayerXP (XP_Angar_KnowsMadPsi);
		Angar_KnowsMadPsi = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Wiekommstduhierher
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WIEKOMMSTDUHIERHER		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	6;
	condition	 = 	DIA_Angar_WIEKOMMSTDUHIERHER_Condition;
	information	 = 	DIA_Angar_WIEKOMMSTDUHIERHER_Info;

	description	 = 	"Jak ses sem dostal?";
};

func int DIA_Angar_WIEKOMMSTDUHIERHER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_15_00"); //Jak ses sem dostal?
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_01"); //Poté, co zanikla bariéra, jsem se ukryl v horách. Pak bylo naèase, abych zaèal nêco dêlat.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_02"); //Bloudil jsem nêkolik dní a pak jsem se náhle objevil na tomhle hradê. Neptej se mê, co se stalo. Já to nevím.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_03"); //A jako by toho bylo málo, ještê jsem ztratil amulet, který jsem mêl už dlouhá léta. Nejspíš se zblázním, když se mi ho nepodaâí znovu nalézt.

	Log_CreateTopic (TOPIC_AngarsAmulett, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AngarsAmulett, LOG_RUNNING);
	B_LogEntry (TOPIC_AngarsAmulett,"Angar ztratil svùj amulet a teë se jej zoufale snaží najít."); 


	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, DIALOG_BACK, DIA_Angar_WIEKOMMSTDUHIERHER_gehen );
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Kde pâesnê jsi ten amulet ztratil?", DIA_Angar_WIEKOMMSTDUHIERHER_amulett );

	if (SC_KnowsMadPsi == TRUE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Spáèovo bratrstvo si zotroèilo zlo.", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	}
	else
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Co se stalo s ostatníma z tábora v bažinách?", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	};

	if (DJG_Angar_SentToStones == FALSE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Co budeš dêlat dál?", DIA_Angar_WIEKOMMSTDUHIERHER_nun );
	};
};
func void DIA_Angar_WIEKOMMSTDUHIERHER_amulett ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00"); //Kde pâesnê jsi ten amulet ztratil?

	if (DJG_Angar_SentToStones ==FALSE)
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01"); //Nêkde na jihu, krátce pâedtím, než jsem se objevil tady na hradê.
		B_LogEntry (TOPIC_AngarsAmulett,"Amulet by mêl ležet kdesi na jihu. Angar se po nêm jde podívat."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02"); //Nêkde musí být.
		B_LogEntry (TOPIC_AngarsAmulett,"Amulet se nachází u kamenné hrobky na jihu Hornického údolí."); 
	};
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03"); //Bojím se, že ho nêkdo ukradl. Musím ho za každou cenu dostat zpátky.
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_andere ()
{
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi ();
	}
	else
	{
		AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00"); //Co se stalo s ostatníma z tábora v bažinách?
	};
	
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01"); //Poslední vêc, na kterou si pamatuju, bylo znièení bariéry a nervy drásající jekot, který ho doprovázel.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02"); //V panické hrùze jsme se vrhli k zemi a svíjeli se bolestí. Ten zvuk. A poâád sílil.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03"); //A pak, když bylo po všem, se všichni zbláznili a s hlasitým âevem zmizeli ve tmê.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04"); //Pak už jsem je nikdy nevidêl.
	
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi2 ();
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_nun ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00"); //Co chceš dêlat dál?
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01"); //Nejdâív jsem si musel trochu odpoèinout, abych mohl zaèít hledat svùj ztracený amulet.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02"); //Zaslechl jsem nêco o dracích.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03"); //Také se povídá, že se do Hornického údolí vydalo mnoho bojovníkù na jejich lov.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04"); //Uvažuju o tom, že bych se k nim pâidal.

	Angar_willDJGwerden = TRUE;

};

func void DIA_Angar_WIEKOMMSTDUHIERHER_gehen ()
{
	Info_ClearChoices	(DIA_Angar_WIEKOMMSTDUHIERHER);
};

///////////////////////////////////////////////////////////////////////
//	Info SCTellsAngarAboutMadPsi2
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_SCTellsAngarAboutMadPsi2		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	7;
	condition	 = 	DIA_Angar_SCTellsAngarAboutMadPsi2_Condition;
	information	 = 	DIA_Angar_SCTellsAngarAboutMadPsi2_Info;

	description	 = 	"Spáèovo bratrstvo si zotroèilo zlo."; //Joly: falls erst nach DIA_Angar_WIEKOMMSTDUHIERHER  (SC_KnowsMadPsi == TRUE)
};

func int DIA_Angar_SCTellsAngarAboutMadPsi2_Condition ()
{
	if (SC_KnowsMadPsi == TRUE)
	&& (Angar_KnowsMadPsi == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		{
				return TRUE;
		};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_Info ()
{
	B_SCTellsAngarAboutMadPsi ();
	B_SCTellsAngarAboutMadPsi2 ();
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_FOUNDAMULETT		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	7;
	condition	 = 	DIA_Angar_FOUNDAMULETT_Condition;
	information	 = 	DIA_Angar_FOUNDAMULETT_Info;

	description	 = 	"Našel jsem tvùj amulet.";
};

func int DIA_Angar_FOUNDAMULETT_Condition ()
{
	if 	(Npc_HasItems (other,ItAm_Mana_Angar_MIS))
		&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		{
				return TRUE;
		};
};

func void B_AngarsAmulettAbgeben()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_15_00"); //Našel jsem tvùj amulet.
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_04_01"); //Díky. Myslel jsem, že už ho nikdy neuvidím.

	B_GiveInvItems (other, self, ItAm_Mana_Angar_MIS,1);
	
	DJG_AngarGotAmulett = TRUE;
	B_GivePlayerXP (XP_AngarDJGUndeadMage); 
};

func void DIA_Angar_FOUNDAMULETT_Info ()
{
	B_AngarsAmulettAbgeben ();

	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "Proè je pro tebe tak dùležitý?", DIA_Angar_FOUNDAMULETT_besonders );
	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "Co budeš dêlat teë?", DIA_Angar_FOUNDAMULETT_nun );
};

func void DIA_Angar_FOUNDAMULETT_besonders ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_00"); //Proè je pro tebe tak dùležitý?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_besonders_04_01"); //Byl to dárek.
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_02"); //Aha.


};

func void DIA_Angar_FOUNDAMULETT_nun ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_nun_15_00"); //Co budeš dêlat teë?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_01"); //Vypadnu z tohodle zatracenýho údolí.
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_02"); //Možná se ještê nêkdy setkáme. Sbohem.

	AI_StopProcessInfos (self);
	if 	((Npc_GetDistToWP(self,"OC_TO_MAGE")<1000) == FALSE) //Joly: Damit Angar nicht am OC Tor rumkronkelt, wenn er noch im OC ist.
	{ 
		Npc_ExchangeRoutine	(self,"LeavingOW");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DJG_Anwerben
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DJG_ANWERBEN		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	8;
	condition	 = 	DIA_Angar_DJG_ANWERBEN_Condition;
	information	 = 	DIA_Angar_DJG_ANWERBEN_Info;

	description	 = 	"Možná bych ti mohl pomoct s nalezením toho amuletu.";
};

func int DIA_Angar_DJG_ANWERBEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DJG_ANWERBEN_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_15_00"); //Možná bych ti mohl pomoct s nalezením toho amuletu.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_04_01"); //Proè ne. Trocha pomoci nemùže škodit.


	if (DJG_Angar_SentToStones == FALSE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Už musím jít.", DIA_Angar_DJG_ANWERBEN_gehen );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Kam chceš vyrazit?", DIA_Angar_DJG_ANWERBEN_wo );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Kdy pùjdeš?", DIA_Angar_DJG_ANWERBEN_wann );
		};
	
	if (Angar_willDJGwerden == TRUE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "A co drakobijci?", DIA_Angar_DJG_ANWERBEN_DJG );
		};
};
func void DIA_Angar_DJG_ANWERBEN_DJG ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_DJG_15_00"); //Co ti drakobijci?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_DJG_04_01"); //Promluvím si s nimi pozdêji. Možná se jim moje silné paže budou hodit.

};

func void DIA_Angar_DJG_ANWERBEN_wann ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wann_15_00"); //Kdy pùjdeš?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wann_04_01"); //Jakmile mi bude líp.
};

func void DIA_Angar_DJG_ANWERBEN_wo ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wo_15_00"); //Kam chceš vyrazit?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_01"); //Mêl bych se vydat na jih, tam, co jsem byl naposled.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_02"); //Je tam jeskynní hrob, obklopený balvany.

};
func void DIA_Angar_DJG_ANWERBEN_gehen ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_gehen_15_00"); //Už musím jít.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_gehen_04_01"); //Buë opatrný.
	
	AI_StopProcessInfos (self);
};




///////////////////////////////////////////////////////////////////////
//	Info Wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WASMACHSTDU		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	9;
	condition	 = 	DIA_AngarDJG_WASMACHSTDU_Condition;
	information	 = 	DIA_AngarDJG_WASMACHSTDU_Info;

	description	 = 	"Stalo se nêco?";
};

func int DIA_AngarDJG_WASMACHSTDU_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01")<8000) 
		&&	(Npc_KnowsInfo(other, DIA_Angar_DJG_ANWERBEN)) 
		&& (DJG_AngarGotAmulett == FALSE)
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_00"); //Nêco je špatnê?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_01"); //Slyšels to? Ještê nikdy jsem v celém svém životê neslyšel tak pâíšerný zvuk!
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_02"); //Co myslíš? Neslyšel jsem ani hlásku!
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_03"); //Celá tahle oblast páchne smrtí a zkázou. Ta zahnívající stvoâení hlídají skalní pâístup do krypty, tam pâed námi.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_04"); //Skrývá se tam nêco pâíšerného a vysílá to své nohsledy na povrch zemê.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_05"); //Jsem si témêâ jistý, že jsem ten amulet ztratil nêkde tady.

	if (Angar_willDJGwerden == TRUE)
	{
	Info_AddChoice	(DIA_AngarDJG_WASMACHSTDU, "Mluvil jsi s drakobijci?", DIA_AngarDJG_WASMACHSTDU_DJG );
	};
};
func void DIA_AngarDJG_WASMACHSTDU_DJG ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_DJG_15_00"); //Mluvil jsi s drakobijci?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_01"); //Ano. Ale oèekával jsem spoleèenstvo podobné tomu, co jsme mêli v táboâe v bažinách.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_02"); //Ti chlapi ale nejsou nic víc než jen divoká nesourodá sbírka naprostých pitomcù. To není nic pro mê.
};


///////////////////////////////////////////////////////////////////////
//	Info WhatsInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WHATSINTHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	10;
	condition	 = 	DIA_AngarDJG_WHATSINTHERE_Condition;
	information	 = 	DIA_AngarDJG_WHATSINTHERE_Info;

	description	 = 	"Co se skrývá v té jeskyni ve skalách?";
};

func int DIA_AngarDJG_WHATSINTHERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_WASMACHSTDU))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_AngarDJG_WHATSINTHERE_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WHATSINTHERE_15_00"); //Co se skrývá v té jeskyni ve skalách?
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_01"); //Nêco mi nechce dovolit se k té jeskyni pâiblížit!
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_02"); //Stâeží ji magická stvoâení. Vidêl jsem je v noci, jak prohledávají okolí. Nechutnost sama.
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_03"); //Obrátila se nazpêt a zmizela mezi stromy. A tys mêl pocit, jako by vysála všechen život z okolí jako houba vysává vodu.

	//Log_AddEntry (TOPIC_Dragonhunter,"Ich habe Angar im Minental gefunden. Er vermutet, daß sich in der Felsengruft, wo er sich aufhält, ein Drache befindet, der hier seine untoten Helfer an die Oberfläche entsendet.");
	B_LogEntry (TOPIC_Dragonhunter,"V Hornickém údolí jsem našel Angara.");
};

///////////////////////////////////////////////////////////////////////
//	Info WantToGoInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WANTTOGOINTHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	11;
	condition	 = 	DIA_AngarDJG_WANTTOGOINTHERE_Condition;
	information	 = 	DIA_AngarDJG_WANTTOGOINTHERE_Info;

	description	 = 	"Pojëme spolu.";
};

func int DIA_AngarDJG_WANTTOGOINTHERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_WHATSINTHERE))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_AngarDJG_WANTTOGOINTHERE_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WANTTOGOINTHERE_15_00"); //Jdeme spoleènê.
	AI_Output			(self, other, "DIA_AngarDJG_WANTTOGOINTHERE_04_01"); //Zkusím to. Ale buë opatrný.

	AI_StopProcessInfos (self);  

	if (Npc_IsDead(SkeletonMage_Angar))
	{
		Npc_ExchangeRoutine	(self,"Zwischenstop"); 
	}
	else
	{
		Npc_ExchangeRoutine	(self,"Angriff");
		DJG_AngarAngriff = TRUE; 
	};
		self.aivar[AIV_PARTYMEMBER] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageDead
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UndeadMageDead		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	13;
	condition	 = 	DIA_AngarDJG_UndeadMageDead_Condition;
	information	 = 	DIA_AngarDJG_UndeadMageDead_Info;
	important	 = 	TRUE;
};

func int DIA_AngarDJG_UndeadMageDead_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02")<1000) 
		&& (DJG_AngarAngriff == TRUE)
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_UndeadMageDead_Info ()
{
	AI_Output			(self, other, "DIA_AngarDJG_UndeadMageDead_04_00"); //(kâièí) Jenom smrt a zkáza. Musím se odsud dostat.
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"RunToEntrance");
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageComes
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UNDEADMAGECOMES		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	13;
	condition	 = 	DIA_AngarDJG_UNDEADMAGECOMES_Condition;
	information	 = 	DIA_AngarDJG_UNDEADMAGECOMES_Info;
	important	 = 	TRUE;
};

func int DIA_AngarDJG_UNDEADMAGECOMES_Condition ()
{
		
	if 	(
		(Npc_GetDistToWP(self,"OW_PATH_3_13")<500) 				
		&&	(Npc_KnowsInfo(other, DIA_AngarDJG_WANTTOGOINTHERE))
		&& ((Npc_KnowsInfo(other, DIA_AngarDJG_UndeadMageDead))==FALSE)
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_UNDEADMAGECOMES_Info ()
{
	AI_Output			(self, other, "DIA_AngarDJG_UNDEADMAGECOMES_04_00"); //(šeptá) Tady to je! Slyšels to?
	
	AI_StopProcessInfos (self);   
 	
 	Npc_ExchangeRoutine	(self,"GotoStonehendgeEntrance"); 

};

///////////////////////////////////////////////////////////////////////
//	Info Wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WASISTLOS		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	14;
	condition	 = 	DIA_Angar_WASISTLOS_Condition;
	information	 = 	DIA_Angar_WASISTLOS_Info;

	description	 = 	"Co se dêje?";
};

func int DIA_Angar_WASISTLOS_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_PATH_3_STONES")<1000) 				
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)	
			{
					return TRUE;
			};
};

func void DIA_Angar_WASISTLOS_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WASISTLOS_15_00"); //Co se dêje?
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_01"); //Dál už s tebou jít nemùžu.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_02"); //Nêco mi âíká, že se odsud živý nedostanu.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_03"); //Nedokážu to vysvêtlit, ale...
	
	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_04"); //Mêl bych se z týhle zpropadený zemê dostat co nejrychlejš. Jinak mê potká stejný osud jako mé bratry.
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_05"); //Pokaždý, když narazím na tyhle... zplozence pekel, mám pocit, jako bych bojoval proti vlastním lidem.
	};

	AI_StopProcessInfos (self);

	B_LogEntry (TOPIC_Dragonhunter,"Angar prostê odešel. Pâi boji se všemi têmi nemrtvými mêl pocit, jako by bojoval s vlastními druhy.");
			
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"LeavingOW");
};

///////////////////////////////////////////////////////////////////////
//	Info Whyareyouhere
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WHYAREYOUHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 15;
	condition	 = 	DIA_Angar_WHYAREYOUHERE_Condition;
	information	 = 	DIA_Angar_WHYAREYOUHERE_Info;

	description	 = 	"Angare! Co tady dêláš?";
};

func int DIA_Angar_WHYAREYOUHERE_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_CAVALORN_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_Angar_WHYAREYOUHERE_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WHYAREYOUHERE_15_00"); //Angare! Co tady dêláš?
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_01"); //Byl jsem na cestê k prùsmyku, když jsem narazil na skâety. Nedokázal jsem ty bezbožný barbary setâást.
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_02"); //Zatím tady poèkám a pak projdu prùsmykem. Uvidíme se na druhé stranê!

	B_LogEntry (TOPIC_Dragonhunter,"Opêt jsem se potkal s Angarem. Ještê poâád zùstává v Hornickém údolí.");
	B_GivePlayerXP (XP_AngarDJGAgain); 
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_PERMKAP4		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	condition	 = 	DIA_Angar_PERMKAP4_Condition;
	information	 = 	DIA_Angar_PERMKAP4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nechci tê tu nechat samotného!";
};

func int DIA_Angar_PERMKAP4_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Angar_WHYAREYOUHERE))
		{
				return TRUE;
		};
};

func void DIA_Angar_PERMKAP4_Info ()
{
	AI_Output			(other, self, "DIA_Angar_PERMKAP4_15_00"); //Vážnê tê mùžu nechat samotného?
	AI_Output			(self, other, "DIA_Angar_PERMKAP4_04_01"); //Jasnê. Jdi. Uvidíme se.

	AI_StopProcessInfos (self);	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Angar_PICKPOCKET (C_INFO)
{
	npc			= DJG_705_Angar;
	nr			= 900;
	condition	= DIA_Angar_PICKPOCKET_Condition;
	information	= DIA_Angar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Angar_PICKPOCKET_Condition()
{
	C_Beklauen (47, 55);
};
 
FUNC VOID DIA_Angar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Angar_PICKPOCKET);
	Info_AddChoice		(DIA_Angar_PICKPOCKET, DIALOG_BACK 		,DIA_Angar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Angar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Angar_PICKPOCKET_DoIt);
};

func void DIA_Angar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Angar_PICKPOCKET);
};
	
func void DIA_Angar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Angar_PICKPOCKET);
};

















































