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
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_01"); //(rezignovanę) Âíkej mi Angar. Ten titul už nepoužívám. Spáčovo bratrstvo už neexistuje.
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_02"); //Zajímavé, ale vypadá to, jako bys mę už odnękud znal. Nęjak si tę nemohu vybavit.
	AI_Output			(other, self, "DIA_AngarDJG_HALLO_15_03"); //Co to s tebou je?
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_04"); //(pâehlíživę) Ale, svýho času jsem vůbec nemohl spát. Poâád jsem męl noční můry.
	B_LogEntry (TOPIC_Dragonhunter,"V Hornickém údolí jsem našel Angara.");
};


///////////////////////////////////////////////////////////////////////
//	B_SCTellsAngarAboutMadPsi
///////////////////////////////////////////////////////////////////////
func void B_SCTellsAngarAboutMadPsi ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00"); //Spáčovo bratrstvo si zotročilo zlo.
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01"); //Tví dâívęjší pâátelé ze starého tábora procházejí zemí v černých róbách a vypadají, že je všechno, co se hýbe, neskutečnę štve.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02"); //O čem to mluvíš?
	};
};

func void B_SCTellsAngarAboutMadPsi2 ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00"); //Slouží nepâíteli a nejsou ničím jiným než bezduchými bojovníky zla.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01"); //U všech bohů. Vędęt to, nebyl bych tak zaslepeným. Už se to víckrát nestane, Pâísahám.
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
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_01"); //Poté, co zanikla bariéra, jsem se ukryl v horách. Pak bylo načase, abych začal nęco dęlat.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_02"); //Bloudil jsem nękolik dní a pak jsem se náhle objevil na tomhle hradę. Neptej se mę, co se stalo. Já to nevím.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_03"); //A jako by toho bylo málo, ještę jsem ztratil amulet, který jsem męl už dlouhá léta. Nejspíš se zblázním, když se mi ho nepodaâí znovu nalézt.

	Log_CreateTopic (TOPIC_AngarsAmulett, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AngarsAmulett, LOG_RUNNING);
	B_LogEntry (TOPIC_AngarsAmulett,"Angar ztratil svůj amulet a teë se jej zoufale snaží najít."); 


	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, DIALOG_BACK, DIA_Angar_WIEKOMMSTDUHIERHER_gehen );
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Kde pâesnę jsi ten amulet ztratil?", DIA_Angar_WIEKOMMSTDUHIERHER_amulett );

	if (SC_KnowsMadPsi == TRUE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Spáčovo bratrstvo si zotročilo zlo.", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	}
	else
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Co se stalo s ostatníma z tábora v bažinách?", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	};

	if (DJG_Angar_SentToStones == FALSE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Co budeš dęlat dál?", DIA_Angar_WIEKOMMSTDUHIERHER_nun );
	};
};
func void DIA_Angar_WIEKOMMSTDUHIERHER_amulett ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00"); //Kde pâesnę jsi ten amulet ztratil?

	if (DJG_Angar_SentToStones ==FALSE)
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01"); //Nękde na jihu, krátce pâedtím, než jsem se objevil tady na hradę.
		B_LogEntry (TOPIC_AngarsAmulett,"Amulet by męl ležet kdesi na jihu. Angar se po nęm jde podívat."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02"); //Nękde musí být.
		B_LogEntry (TOPIC_AngarsAmulett,"Amulet se nachází u kamenné hrobky na jihu Hornického údolí."); 
	};
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03"); //Bojím se, že ho nękdo ukradl. Musím ho za každou cenu dostat zpátky.
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
	
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01"); //Poslední vęc, na kterou si pamatuju, bylo zničení bariéry a nervy drásající jekot, který ho doprovázel.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02"); //V panické hrůze jsme se vrhli k zemi a svíjeli se bolestí. Ten zvuk. A poâád sílil.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03"); //A pak, když bylo po všem, se všichni zbláznili a s hlasitým âevem zmizeli ve tmę.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04"); //Pak už jsem je nikdy nevidęl.
	
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi2 ();
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_nun ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00"); //Co chceš dęlat dál?
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01"); //Nejdâív jsem si musel trochu odpočinout, abych mohl začít hledat svůj ztracený amulet.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02"); //Zaslechl jsem nęco o dracích.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03"); //Také se povídá, že se do Hornického údolí vydalo mnoho bojovníků na jejich lov.
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

	description	 = 	"Spáčovo bratrstvo si zotročilo zlo."; //Joly: falls erst nach DIA_Angar_WIEKOMMSTDUHIERHER  (SC_KnowsMadPsi == TRUE)
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

	description	 = 	"Našel jsem tvůj amulet.";
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
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_15_00"); //Našel jsem tvůj amulet.
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_04_01"); //Díky. Myslel jsem, že už ho nikdy neuvidím.

	B_GiveInvItems (other, self, ItAm_Mana_Angar_MIS,1);
	
	DJG_AngarGotAmulett = TRUE;
	B_GivePlayerXP (XP_AngarDJGUndeadMage); 
};

func void DIA_Angar_FOUNDAMULETT_Info ()
{
	B_AngarsAmulettAbgeben ();

	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "Proč je pro tebe tak důležitý?", DIA_Angar_FOUNDAMULETT_besonders );
	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "Co budeš dęlat teë?", DIA_Angar_FOUNDAMULETT_nun );
};

func void DIA_Angar_FOUNDAMULETT_besonders ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_00"); //Proč je pro tebe tak důležitý?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_besonders_04_01"); //Byl to dárek.
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_02"); //Aha.


};

func void DIA_Angar_FOUNDAMULETT_nun ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_nun_15_00"); //Co budeš dęlat teë?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_01"); //Vypadnu z tohodle zatracenýho údolí.
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_02"); //Možná se ještę nękdy setkáme. Sbohem.

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
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_04_01"); //Proč ne. Trocha pomoci nemůže škodit.


	if (DJG_Angar_SentToStones == FALSE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Už musím jít.", DIA_Angar_DJG_ANWERBEN_gehen );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Kam chceš vyrazit?", DIA_Angar_DJG_ANWERBEN_wo );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Kdy půjdeš?", DIA_Angar_DJG_ANWERBEN_wann );
		};
	
	if (Angar_willDJGwerden == TRUE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "A co drakobijci?", DIA_Angar_DJG_ANWERBEN_DJG );
		};
};
func void DIA_Angar_DJG_ANWERBEN_DJG ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_DJG_15_00"); //Co ti drakobijci?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_DJG_04_01"); //Promluvím si s nimi pozdęji. Možná se jim moje silné paže budou hodit.

};

func void DIA_Angar_DJG_ANWERBEN_wann ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wann_15_00"); //Kdy půjdeš?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wann_04_01"); //Jakmile mi bude líp.
};

func void DIA_Angar_DJG_ANWERBEN_wo ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wo_15_00"); //Kam chceš vyrazit?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_01"); //Męl bych se vydat na jih, tam, co jsem byl naposled.
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

	description	 = 	"Stalo se nęco?";
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
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_00"); //Nęco je špatnę?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_01"); //Slyšels to? Ještę nikdy jsem v celém svém životę neslyšel tak pâíšerný zvuk!
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_02"); //Co myslíš? Neslyšel jsem ani hlásku!
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_03"); //Celá tahle oblast páchne smrtí a zkázou. Ta zahnívající stvoâení hlídají skalní pâístup do krypty, tam pâed námi.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_04"); //Skrývá se tam nęco pâíšerného a vysílá to své nohsledy na povrch zemę.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_05"); //Jsem si témęâ jistý, že jsem ten amulet ztratil nękde tady.

	if (Angar_willDJGwerden == TRUE)
	{
	Info_AddChoice	(DIA_AngarDJG_WASMACHSTDU, "Mluvil jsi s drakobijci?", DIA_AngarDJG_WASMACHSTDU_DJG );
	};
};
func void DIA_AngarDJG_WASMACHSTDU_DJG ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_DJG_15_00"); //Mluvil jsi s drakobijci?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_01"); //Ano. Ale očekával jsem společenstvo podobné tomu, co jsme męli v táboâe v bažinách.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_02"); //Ti chlapi ale nejsou nic víc než jen divoká nesourodá sbírka naprostých pitomců. To není nic pro mę.
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
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_01"); //Nęco mi nechce dovolit se k té jeskyni pâiblížit!
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_02"); //Stâeží ji magická stvoâení. Vidęl jsem je v noci, jak prohledávají okolí. Nechutnost sama.
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_03"); //Obrátila se nazpęt a zmizela mezi stromy. A tys męl pocit, jako by vysála všechen život z okolí jako houba vysává vodu.

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
	AI_Output			(other, self, "DIA_AngarDJG_WANTTOGOINTHERE_15_00"); //Jdeme společnę.
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
	AI_Output			(self, other, "DIA_AngarDJG_UndeadMageDead_04_00"); //(kâičí) Jenom smrt a zkáza. Musím se odsud dostat.
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

	description	 = 	"Co se dęje?";
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
	AI_Output			(other, self, "DIA_Angar_WASISTLOS_15_00"); //Co se dęje?
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_01"); //Dál už s tebou jít nemůžu.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_02"); //Nęco mi âíká, že se odsud živý nedostanu.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_03"); //Nedokážu to vysvętlit, ale...
	
	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_04"); //Męl bych se z týhle zpropadený zemę dostat co nejrychlejš. Jinak mę potká stejný osud jako mé bratry.
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_05"); //Pokaždý, když narazím na tyhle... zplozence pekel, mám pocit, jako bych bojoval proti vlastním lidem.
	};

	AI_StopProcessInfos (self);

	B_LogEntry (TOPIC_Dragonhunter,"Angar prostę odešel. Pâi boji se všemi tęmi nemrtvými męl pocit, jako by bojoval s vlastními druhy.");
			
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

	description	 = 	"Angare! Co tady dęláš?";
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
	AI_Output			(other, self, "DIA_Angar_WHYAREYOUHERE_15_00"); //Angare! Co tady dęláš?
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_01"); //Byl jsem na cestę k průsmyku, když jsem narazil na skâety. Nedokázal jsem ty bezbožný barbary setâást.
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_02"); //Zatím tady počkám a pak projdu průsmykem. Uvidíme se na druhé stranę!

	B_LogEntry (TOPIC_Dragonhunter,"Opęt jsem se potkal s Angarem. Ještę poâád zůstává v Hornickém údolí.");
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

	description	 = 	"Nechci tę tu nechat samotného!";
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
	AI_Output			(other, self, "DIA_Angar_PERMKAP4_15_00"); //Vážnę tę můžu nechat samotného?
	AI_Output			(self, other, "DIA_Angar_PERMKAP4_04_01"); //Jasnę. Jdi. Uvidíme se.

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

















































