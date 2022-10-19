// ***************************************************************
//								EXIT
// ***************************************************************

// ---------------------
	var int Lothar_ImOV;
// ---------------------

INSTANCE DIA_Lothar_EXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lothar_EXIT_Condition()
{	
	if (Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_EXIT_Info() 
{
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							First EXIT
// ***************************************************************

INSTANCE DIA_Lothar_FirstEXIT   (C_INFO)
{
	npc         = Pal_203_Lothar;
	nr          = 999;
	condition   = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent   = TRUE;
	description = "Musím jít! (KONEC)";
};
FUNC INT DIA_Lothar_FirstEXIT_Condition()
{	
	if (Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lothar_FirstEXIT_Info() 
{
	AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_00"); //Musím jít!
	if (Lothar_Regeln == FALSE)
	{
		AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_01"); //Poèkej! Ještê neznáš mêstské zákony!
		AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_02"); //Pozdêji.
	}
	else
	{
		if (Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_03"); //Ještê JEDNOU uslyším, že lidem vyprávíš o dracích, a budeš mít velké problémy. Vyjádâil jsem se jasnê?
		}
		else
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_04"); //Dokud jsi v Khorinidu, jsi v bezpeèí.

			if (hero.guild != GIL_PAL)
			{
				AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_05"); //Na mêsto teë dohlížejí královští paladini!
			};
		};

		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine (self, "START");
	};

	// ------- Canthars TA auswechseln -------
	if (Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine (Canthar, "START");
		Canthar_InStadt = TRUE;
	};

	AI_StopProcessInfos (self);
};


// ***************************************************************
//							Hallo
// ***************************************************************

instance DIA_Lothar_Hallo (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Hallo_Condition;
	information	 = 	DIA_Lothar_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lothar_Hallo_Condition ()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lothar_Hallo_01_00"); //Stùj, cizinèe!

	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Hallo_01_01"); //Nevidêl jsem tê procházet branou.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_02"); //A?
		AI_Output (self, other, "DIA_Lothar_Hallo_01_03"); //A stráže u druhé brány mají zákaz vpouštêt do mêsta neznámé osoby.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_04"); //Noooo...
		AI_Output (self, other, "DIA_Lothar_Hallo_01_05"); //Budu si s têma dvêma muset promluvit!
		AI_Output (self, other, "DIA_Lothar_Hallo_01_06"); //Ale mezi námi:
	};

	AI_Output (self, other, "DIA_Lothar_Hallo_01_07"); //Jsem Lothar. Královský paladin a skromný služebník Innose, tvého Pána.
	AI_Output (self, other, "DIA_Lothar_Hallo_01_08"); //Náš velitel, lord Hagen, mê povêâil úkolem vysvêtlit všem pâíchozím nové zákony mêsta, které se vztahují na všechny zdejší obyvatele.

	//ADDON>
	AI_Output (self, other, "DIA_Addon_Lothar_Hallo_01_00"); //Od té doby, co lidé z mêsta zaèali bezdùvodnê mizet, si každý musí dávat pozor, aby ho nepotkal stejný osud.
	//ADDON<

	if Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	{
		B_StartOtherRoutine (Lester, "XARDAS");
	};
};

// ***************************************************************
//						Wichtige Nachricht			E1
// ***************************************************************
instance DIA_Lothar_MESSAGE		(C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_MESSAGE_Condition;
	information	 = 	DIA_Lothar_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"Mám dùležitý vzkaz pro velitele paladinù!";
};
func int DIA_Lothar_MESSAGE_Condition ()
{	
	if (Mil_305_schonmalreingelassen == FALSE) 
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_MESSAGE_Info ()
{
 	AI_Output (other, self, "DIA_Lothar_MESSAGE_15_00"); //Mám dùležitý vzkaz pro velitele paladinù!
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_01"); //Ctihodný lord Hagen nikoho nepâijímá.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_02"); //Za všechny vêci týkající se prostých obèanù je zodpovêdný lord Andre, velitel mêstské stráže.
};	

// ***************************************************************
//							Auge Innos 				E2
// ***************************************************************
instance DIA_Lothar_EyeInnos (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_EyeInnos_Condition;
	information	 = 	DIA_Lothar_EyeInnos_Info;
	permanent    =  FALSE;
	description	 = 	"Pâišel jsem si pro Innosovo oko!";
};
func int DIA_Lothar_EyeInnos_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_EyeInnos_Info ()
{
	AI_Output (other, self, "DIA_Lothar_EyeInnos_15_00"); //Pâišel jsem si pro Innosovo oko!

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_01"); //Oko spadá pod rozhodnutí lorda Hagena. Promluv si s ním.
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_02"); //Posvátné Innosovo oko! Jak to, že o nêm víš?! Nejsi èlenem našeho âádu!
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_03"); //Âekl mi o nêm jeden mág.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_04"); //Netuším, co tím zamýšlel, když ti svêâil jedno z tajemstvích našeho âádu.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_05"); //Ale urèitê nechtêl, abys na nêj právê TY vztáhl ruku.
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_06"); //Ale...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_07"); //Už o tom nechci slyšet!
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output (self, other, "DIA_Lothar_EyeInnos_01_08"); //Nejdâív zaèneš s báchorkami o dracích, a teë tohle - neuvêâitelné!
		};
	};
};	

// ***************************************************************
//							Drachen 				E2
// ***************************************************************
instance DIA_Lothar_Dragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_Dragons_Condition;
	information	 = 	DIA_Lothar_Dragons_Info;
	permanent    =  FALSE;
	description	 = 	"Poslouchej - mêsto ohrožují draci!";
};
func int DIA_Lothar_Dragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Dragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Dragons_15_00"); //Poslouchej - mêsto ohrožují draci!
	if ((hero.guild != GIL_PAL)&&(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_01"); //To není možné!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_02"); //Další šílenec!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_03"); //Už takhle máme ve mêstê dost nepokojù. Nepotâebujeme žádného troubu, který bude dêsit lid povídaèkami o dracích!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_04"); //Posledního èlovêka, který si takovéhle vêci vymýšlel, jsem dal okamžitê zavâít a poslat do Hornického údolí s vêzeàským transportem. Takže pozor na jazyk!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_05"); //Nepotâebujeme nikoho, kdo by nám mezi lidmi šíâil paniku!
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_06"); //Hodnê jsem o tom slyšel. Ale têžko tomu uvêâit.
		AI_Output (self, other, "DIA_Lothar_Dragons_01_07"); //Bude lepší, když si to necháš pro sebe. Musíme pâedejít tomu, aby se mezi lidem šíâil strach a panika.
	};
	Player_TalkedAboutDragons = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_Ornament		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lothar_Ornament_Condition;
	information	 = 	DIA_Addon_Lothar_Ornament_Info;

	description	 = 	"Nevíš nêco o té kamenné obludê z kamenného kruhu na Lobartovê statku?";
};

func int DIA_Addon_Lothar_Ornament_Condition ()
{
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //Nevíš nêco o té kamenné obludê z kamenného kruhu u Lobartova statku?
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //No jasnê, znièili jsme ji. Ohrožovala i okolní usedlosti.
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //Proè se ptáš?
	
	Info_ClearChoices	(DIA_Addon_Lothar_Ornament);
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Hledám kovovou èást ornamentu, který patâí k prstenu.", DIA_Addon_Lothar_Ornament_suche );
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Myslíš, že je to normální?", DIA_Addon_Lothar_Ornament_normal );
};
func void DIA_Addon_Lothar_Ornament_normal ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //Myslíš, že je to normální?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //Myslíš tu kamennou potvoru?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //Pokud vím, tak o tohle se starají vodní mágové. 
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //Moc jsem o tom nepâemýšlel. Máme dost práce tady ve mêstê a v Hornickém údolí.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //Chápu.
};

func void DIA_Addon_Lothar_Ornament_suche ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //Hledám kovový úlomek z ornamentu, který patâí k prstenu.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //Mêl by být nêkde u kamenného kruhu u Lobarta.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //Jo, na nêco takového jsme narazili. Mêl to u sebe ten kameàák. Myslím, že to byla nêjaká magická runa.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //Dal jsem ji lordu Hagenovi, ale netuším, jestli ji poâád ještê má.
};

// ***************************************************************
//							WerVonDrachen 				E3
// ***************************************************************
instance DIA_Lothar_WhoDragons (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_WhoDragons_Condition;
	information	 = 	DIA_Lothar_WhoDragons_Info;
	permanent    =  FALSE;
	description	 = 	"Nêkdo už o pâítomnosti drakù mluvil?";
};
func int DIA_Lothar_WhoDragons_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Dragons))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WhoDragons_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WhoDragons_15_00"); //Nêkdo už o pâítomnosti drakù mluvil?
	AI_Output (self, other, "DIA_Lothar_WhoDragons_01_01"); //Ano. Ten chlapík se jmenoval Diego. Alespoà mám ten pocit.

	if ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_WhoDragons_01_02"); //(výhrùžnê) Varoval jsem ho - zrovna jako tebe! Ale ten blázen si nedal pokoj a poâád otravoval!
	};
};	

// ***************************************************************
//							Regeln 				E1
// ***************************************************************
instance DIA_Lothar_Regeln (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_Regeln_Condition;
	information	 = 	DIA_Lothar_Regeln_Info;
	permanent    =  FALSE;
	description	 = 	"No dobâe - seznam mê s mêstskými zákony!";
};
func int DIA_Lothar_Regeln_Condition ()
{	
	return TRUE;
};
func void DIA_Lothar_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Regeln_15_00"); //(s mírným povzdechem) Dobrá - vysvêtli mi zákony mêsta!
	AI_Output (self, other, "DIA_Lothar_Regeln_01_01"); //Za prvé: Ctihodný paladin lord Hagen sídlí se svými jednotkami v horní èásti mêsta.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_02"); //Proto tam mají pâístup pouze ctihodní obèané.
	AI_Output (self ,other, "DIA_Lothar_Add_01_04"); //Za druhé: V radnici v horní èásti mêsta je teë velitelství paladinù. Mají do ní pâístup pouze samotní paladinové a èlenové domobrany.
	AI_Output (self ,other, "DIA_Lothar_Add_01_05"); //A za tâetí: Každý, kdo je obvinên z nêjakého zloèinu, se musí ospravedlnit pâed velitelem domobrany.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_05"); //Nêjaké otázky?
	
	Lothar_Regeln = TRUE;
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_MissingPeople		(C_INFO)
{
	npc		 = 	Pal_203_Lothar;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lothar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Lothar_MissingPeople_Info;

	description	 = 	"Obyvatelé mêsta prostê mizí?";
};

func int DIA_Addon_Lothar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lothar_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lothar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //Lidé z mêsta prostê mizí?
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //Jo, skoro každý den se po nêkom slehne zem.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //Dost mê štve, že domobrana ještê poâád nezjistila, kdo za tím vším vêzí.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //Není divu, že obyvatelé mêsta si teë dávají zvlášã bacha na cizince.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_04"); //Takže je radši moc neprovokuj, rozumíš?
	
		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};
	
	SC_HearedAboutMissingPeople = TRUE;
};

// ***************************************************************
//							HowCitizen 				E2
// ***************************************************************
instance DIA_Lothar_HowCitizen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	4;
	condition	 = 	DIA_Lothar_HowCitizen_Condition;
	information	 = 	DIA_Lothar_HowCitizen_Info;
	permanent    =  FALSE;
	description	 = 	"Jak se mohu JÁ stát obèanem mêsta?";
};
func int DIA_Lothar_HowCitizen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_HowCitizen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_06"); //Jak se mohu JÁ stát obèanem mêsta?
	AI_Output (self ,other, "DIA_Lothar_Add_01_07"); //Za obèany mêsta jsou považováni jen ti, kdo mají stálé zamêstnání!
	AI_Output (self ,other, "DIA_Lothar_Add_01_09"); //Ale neâekl bych, že by k setkání s lordem Hagenem staèilo být obèanem mêsta!
	AI_Output (self ,other, "DIA_Lothar_Add_01_10"); //Jako obèan máš pâístup do horní èásti mêsta, nic víc!
	AI_Output (self ,other, "DIA_Lothar_Add_01_11"); //Na radnici mùžeš být vpuštên jen v pâípadê, že se staneš èlenem domobrany!
};

// ***************************************************************
//							WoArbeit				E3
// ***************************************************************
instance DIA_Lothar_WoArbeit (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	5;
	condition	 = 	DIA_Lothar_WoArbeit_Condition;
	information	 = 	DIA_Lothar_WoArbeit_Info;
	permanent    =  FALSE;
	description	 = 	"Kde bych mohl najít práci?";
};
func int DIA_Lothar_WoArbeit_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_HowCitizen))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoArbeit_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_14"); //Kde bych mohl najít práci?
	AI_Output (self ,other, "DIA_Lothar_Add_01_15"); //Musíš se pâihlásit jako uèedník k jednomu z mistrù tady v dolní èásti mêsta.
	AI_Output (self ,other, "DIA_Lothar_Add_01_16"); //Jakmile tê mistr pâijme, stane se z tebe obèan.
	AI_Output (self ,other, "DIA_Lothar_Add_01_17"); //Musí s tím ale souhlasit i ostatní mistâi, tak velí zvyk tady v Khorinidu.
	AI_Output (self ,other, "DIA_Lothar_Add_01_18"); //Pokud sis pohrával s myšlenkou, že najdeš nêjakou práci v pâístavu, tak na to zase rychle zapomeà!
	AI_Output (self ,other, "DIA_Lothar_Add_01_19"); //Žije tam spodina. Ani tam nechoë, nebo toho budeš litovat!
};

// ***************************************************************
//							ToOV 				E2
// ***************************************************************
instance DIA_Lothar_ToOV (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	6;
	condition	 = 	DIA_Lothar_ToOV_Condition;
	information	 = 	DIA_Lothar_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"Jak se dostanu do horní ètvrti?";
};
func int DIA_Lothar_ToOV_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToOV_Info ()
{
	AI_Output (other, self, "DIA_Lothar_ToOV_15_00"); //Jak se dostanu do horní èásti mêsta?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_01"); //No tak, posloucháš mê vùbec?!
	AI_Output (self, other, "DIA_Lothar_ToOV_01_02"); //Nejsi obèanem tohoto mêsta. Mùžeš si tu zacházku ušetâit - stráže tê dovnitâ nepustí.
	AI_Output (self, other, "DIA_Lothar_ToOV_01_03"); //Do celé té oblasti za vnitâní branou máš vstup zakázán!
};	

// ***************************************************************
//							ToMiliz 				E2
// ***************************************************************
instance DIA_Lothar_ToMiliz (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToMiliz_Condition;
	information	 = 	DIA_Lothar_ToMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"Jak se mohu pâidat k domobranê?";
};
func int DIA_Lothar_ToMiliz_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_Regeln))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToMiliz_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_26"); //Jak se mohu pâidat k domobranê?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_27"); //Na pâíkaz lorda Hagena mohou do domobrany vstoupit jen obèané mêsta.
		AI_Output (other, self, "DIA_Lothar_Add_15_28"); //Aha.
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_29"); //Pokud by ses chtêl dozvêdêt nêco víc, promluv si v kasárnách s lordem Andrem.
};	

// ***************************************************************
//							ToPaladins 				E2
// ***************************************************************
instance DIA_Lothar_ToPaladins (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	7;
	condition	 = 	DIA_Lothar_ToPaladins_Condition;
	information	 = 	DIA_Lothar_ToPaladins_Info;
	permanent    =  FALSE;
	description	 = 	"Co musím udêlat, abych mêl takové brnêní jako ty?";
};
func int DIA_Lothar_ToPaladins_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lothar_ToMiliz))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Lothar_ToPaladins_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_30"); //Co musím udêlat, abych mêl takové brnêní jako ty?
	if (other.guild != GIL_MIL)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_31"); //(kâièí) Cože? Vždyã ani nejsi èlenem domobrany!
	};
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_32"); //Nejsi dokonce ani OBÈAN!
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_33"); //Jak tê mùže vùbec napadnout, že bys mohl nosit brnêní PALADINA?
	AI_Output (self ,other, "DIA_Lothar_Add_01_34"); //Tuhle èest si vysloužilo jen nêkolik málo èlenù domobrany, a to za své neobyèejnê odvážné skutky.
	AI_Output (self ,other, "DIA_Lothar_Add_01_35"); //(stroze) Pokud by ses chtêl stát paladinem, máš pâed sebou hodnê dlouhou cestu, chlapèe!
};	

// ***************************************************************
//							WoAndre 				E2
// ***************************************************************
instance DIA_Lothar_WoAndre (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	8;
	condition	 = 	DIA_Lothar_WoAndre_Condition;
	information	 = 	DIA_Lothar_WoAndre_Info;
	permanent    =  FALSE;
	description	 = 	"Kde najdu velitele mêstské stráže?";
};
func int DIA_Lothar_WoAndre_Condition ()
{	
	if ( Npc_KnowsInfo(other, DIA_Lothar_Regeln) || Npc_KnowsInfo(other, DIA_Lothar_MESSAGE) )
	&& (Andre.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_WoAndre_Info ()
{
	AI_Output (other, self, "DIA_Lothar_WoAndre_15_00"); //Kde najdu velitele mêstské stráže?
	AI_Output (self, other, "DIA_Lothar_WoAndre_01_01"); //Lord Andre je v kasárnách na druhém konci mêsta.
};	

// ***************************************************************
//							Schlafen 				E2
// ***************************************************************
instance DIA_Lothar_Schlafen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	9;
	condition	 = 	DIA_Lothar_Schlafen_Condition;
	information	 = 	DIA_Lothar_Schlafen_Info;
	permanent    =  FALSE;
	description	 = 	"Kde bych tu mohl strávit noc?";
};
func int DIA_Lothar_Schlafen_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_22"); //Kde bych tu mohl strávit noc?
	AI_Output (self ,other, "DIA_Lothar_Add_01_23"); //Pokud hledáš nocleh, jdi do hotelu pâímo naproti kasárnám.
	AI_Output (self ,other, "DIA_Lothar_Add_01_24"); //Paladinové platí za ubytování všech poutníkù, kteâí do mêsta pâijdou.
	AI_Output (self ,other, "DIA_Lothar_Add_01_25"); //Najdeš zde také všechny potulné kupce z tržištê.
};	

// ***************************************************************
//							PERM - VOR OV				
// ***************************************************************
instance DIA_Lothar_PermB4OV (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 3;
	condition	= DIA_Lothar_PermB4OV_Condition;
	information	= DIA_Lothar_PermB4OV_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
func int DIA_Lothar_PermB4OV_Condition ()
{	
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Lothar_Regeln == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PermB4OV_Info ()
{
	AI_Output (self, other, "DIA_Lothar_PermB4OV_01_00"); //O všem ostatním si už mùžeš promluvit s lordem Andrem!
	AI_StopProcessInfos(self);
};	
	

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() //überflüsige Outputs
{
	AI_Output (other, self, "DIA_Lothar_Add_15_00"); //Ale já se MUSÍM setkat s lordem Hagenem!

	AI_Output (self ,other, "DIA_Lothar_Add_01_45"); //A jak vidím, tak tê pâijal do domobrany.
	AI_Output (self ,other, "DIA_Lothar_Add_01_46"); //Hm - urèitê ví, co dêlá.
	
	AI_Output (other, self, "DIA_Lothar_Add_15_20"); //Kolik je tady mistrù?
	AI_Output (self ,other, "DIA_Lothar_Add_01_21"); //Myslím, že jich je dohromady pêt.
		
	AI_Output (self ,other, "DIA_Lothar_Add_01_62"); //Hele, neâekl jsem to snad dost jasnê? Už žádné povídaèky o dracích!
	AI_Output (other, self, "DIA_Lothar_Add_15_63"); //Jak víš...?
	AI_Output (self ,other, "DIA_Lothar_Add_01_64"); //Do TOHO ti nic není!
	AI_Output (self ,other, "DIA_Lothar_Add_01_65"); //To bylo naposledy, rozumíme si?!
	
	AI_Output (other, self, "DIA_Lothar_Add_15_66"); //Kde najdu velitele domobrany?
	AI_Output (other, self, "DIA_Lothar_Add_15_08"); //Jsem teë uèedník jednoho ze zdejších mistrù!
	
	// ------ NEWS_Modul für Unterstadt ------
	AI_Output (self ,other, "DIA_Lothar_Add_01_47"); //Už zase ty.

	AI_Output (self ,other, "DIA_Lothar_Add_01_43"); //Slyšel jsem, že ses setkal s lordem Andrem?
	AI_Output (self ,other, "DIA_Lothar_Add_01_44"); //Âíkal jsem ti snad, že k domobranê se mùžeš pâidat jen v pâípadê, že jsi obèanem mêsta.

	AI_Output (self ,other, "DIA_Lothar_Add_01_48"); //Oznámil jsem lordu Hagenovi, že s ním chceš mluvit.
	AI_Output (other, self, "DIA_Lothar_Add_15_49"); //A? Co âíkal?
	AI_Output (self ,other, "DIA_Lothar_Add_01_50"); //Nikdy o tobê neslyšel.
	AI_Output (other, self, "DIA_Lothar_Add_15_51"); //Samozâejmê že ne. Âekl jsi mu o têch dracích?
	AI_Output (self ,other, "DIA_Lothar_Add_01_52"); //Copak jsem ti neâekl, abys s têmi povídaèkami PÂESTAL?!

	AI_Output (self ,other, "DIA_Lothar_Add_01_12"); //Slyšel jsem, že už máš souhlas nêkolika mistrù.
	AI_Output (self ,other, "DIA_Lothar_Add_01_13"); //Bereš to docela vážnê, co?

	AI_Output (self ,other, "DIA_Lothar_Add_01_01"); //Musíš dodržovat pravidla, stejnê jako kdokoliv jiný!
	AI_Output (self ,other, "DIA_Lothar_Add_01_02"); //Lord Hagen nemá èas.
	AI_Output (self ,other, "DIA_Lothar_Add_01_03"); //Pokud máš na srdci nêco PODSTATNÉHO, jdi za lordem Andrem. On ti pomùže!
};


// #########################################
// #########################################
		
// 				Im Oberen Viertel
		
// #########################################
// #########################################


// ***************************************************************
//								OV Regeln
// ***************************************************************
instance DIA_Lothar_HelloAgain (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	1;
	condition	 = 	DIA_Lothar_HelloAgain_Condition;
	information	 = 	DIA_Lothar_HelloAgain_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lothar_HelloAgain_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	{
		return TRUE;
	};
};
func void DIA_Lothar_HelloAgain_Info ()
{
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_00"); //Aaa! Zase ty!
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_01"); //Takže se ti nakonec podaâilo dostat se do horní èásti mêsta!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_36"); //Kde jsi vzal tu róbu?
		AI_Output (other, self, "DIA_Lothar_Add_15_37"); //Prošel jsem zkouškou ohnê.
		AI_Output (self ,other, "DIA_Lothar_Add_01_38"); //Neuvêâitelné. V tom pâípadê to, co se tu dêje, musí být Innosova vùle.
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_39"); //Nepâidal ses k Onarovým žoldákùm, že ne?
		AI_Output (self ,other, "DIA_Lothar_Add_01_40"); //Jak ses sem dostal?
		AI_Output (other, self, "DIA_Lothar_Add_15_41"); //Pâináším nabídku pâímêâí od Leeho.
		AI_Output (self ,other, "DIA_Lothar_Add_01_42"); //Pche! Lord Hagen s tím nikdy nebude souhlasit.
	};
		
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_02"); //Musíš tady dbát na nêkteré vêci, jinak odsud poletíš stejnê rychle, jako ses sem dostal.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_03"); //Vstup máš povolen jen do budov obchodníkù. Poznáš je podle znamení nade dveâmi - to jen aby nedošlo k nêjakým nedorozumêním.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_04"); //Ostatní budovy patâí významným obèanùm - tam nemáš co pohledávat!
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV) 
	{
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_05"); //Nic na tom nemêní, že teë jsi èlenem Innosova âádu.
	};
	if (other.guild == GIL_MIL)
	{	
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_06"); //Jakožto èlen domobrany máš také povolen pâístup do prostor paladinù.
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_07"); //Svoje ubikace máš ale poâád v kasárnách.
	};
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_08"); //V téhle ètvrti žijí významní obèané mêsta. Chovej se k nim tedy s náležitou úctou.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_09"); //Rozumíme si?
	AI_Output (other, self, "DIA_Lothar_HelloAgain_15_10"); //Jasnê.
};	

// ***************************************************************
//								Hagen
// ***************************************************************
instance DIA_Lothar_Hagen (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_Hagen_Condition;
	information	 = 	DIA_Lothar_Hagen_Info;
	permanent    =  TRUE;
	description  = 	"Kde najdu lorda Hagena?";
};
func int DIA_Lothar_Hagen_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Hagen_15_00"); //Kde najdu lorda Hagena?
	AI_Output (self, other, "DIA_Lothar_Hagen_01_01"); //Je v radnici, na konci horní ètvrti.
	AI_Output (self, other, "DIA_Lothar_Hagen_01_02"); //Pokud ale nemáš dobrý dùvod, tak tê tam stejnê nikdo nepustí.
};

// ***************************************************************
//							Oldworld Running
// ***************************************************************
instance DIA_Lothar_OWRunning (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunning_Condition;
	information	 = 	DIA_Lothar_OWRunning_Info;
	permanent    =  FALSE;
	description  = 	"Byl jsem si promluvit s lordem Hagenem...";
};
func int DIA_Lothar_OWRunning_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) == 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunning_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_53"); //Byl jsem si promluvit s lordem Hagenem.
	AI_Output (self ,other, "DIA_Lothar_Add_01_54"); //A? Nesnažil ses ho obtêžovat s têmi báchorkami o dracích, že ne?
	AI_Output (other, self, "DIA_Lothar_Add_15_55"); //Pâesnê to jsem udêlal.
	AI_Output (self ,other, "DIA_Lothar_Add_01_56"); //To snad nemùže být pravda...
	AI_Output (other, self, "DIA_Lothar_Add_15_57"); //Poslal mê sehnat nêjaké dùkazy.
	AI_Output (self ,other, "DIA_Lothar_Add_01_58"); //V tom pâípadê hodnê štêstí. (pro sebe) Blázne...
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//							Oldworld Running UND Brief
// ***************************************************************
instance DIA_Lothar_OWRunningBrief (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	2;
	condition	 = 	DIA_Lothar_OWRunningBrief_Condition;
	information	 = 	DIA_Lothar_OWRunningBrief_Info;
	permanent    =  FALSE;
	description  = 	"Mám dùkaz! Tady je dopis od velitele Garonda!";
};
func int DIA_Lothar_OWRunningBrief_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lothar_OWRunningBrief_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Add_15_59"); //Mám dùkaz! Tady je dopis od velitele Garonda!
	AI_Output (self ,other, "DIA_Lothar_Add_01_60"); //Takže ti draci nejsou výmysl?
	AI_Output (self ,other, "DIA_Lothar_Add_01_61"); //Kâivdil jsem ti. Budu se modlit k Innosovi, aby mi odpustil mé chování.
	
	AI_StopProcessInfos (self);
};

// ***************************************************************
//								PERM
// ***************************************************************
instance DIA_Lothar_PERM (C_INFO)
{
	npc			 = 	Pal_203_Lothar;
	nr			 = 	3;
	condition	 = 	DIA_Lothar_PERM_Condition;
	information	 = 	DIA_Lothar_PERM_Info;
	permanent    =  TRUE;
	description  = 	"Stalo se v poslední dobê nêco zajímavého?";
};
func int DIA_Lothar_PERM_Condition ()
{	
	if (Mil_305_schonmalreingelassen == TRUE) //Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lothar_PERM_Info ()
{
	AI_Output (other, self, "DIA_Lothar_PERM_15_00"); //Stalo se v poslední dobê nêco zajímavého?
	if (other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_01"); //Ano - že sem vpustili nêkoho, jako jsi ty. Nêco takového se nestalo už celé vêky.
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_02"); //Ty bys to mêl vêdêt nejlíp. Jako èlen mêstské stráže musíš dohlížet na poâádek a dodržování zákona!
	}
	else //KdF oder NOV
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_03"); //Ne.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lothar_PICKPOCKET (C_INFO)
{
	npc			= Pal_203_Lothar;
	nr			= 900;
	condition	= DIA_Lothar_PICKPOCKET_Condition;
	information	= DIA_Lothar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lothar_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Lothar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lothar_PICKPOCKET);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_BACK 		,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lothar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};
	
func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lothar_PICKPOCKET);
};





