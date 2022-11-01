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
		AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_01"); //Počkej! Ještę neznáš męstské zákony!
		AI_Output (other, self, "DIA_Lothar_FirstEXIT_15_02"); //Pozdęji.
	}
	else
	{
		if (Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_03"); //Ještę JEDNOU uslyším, že lidem vyprávíš o dracích, a budeš mít velké problémy. Vyjádâil jsem se jasnę?
		}
		else
		{
			AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_04"); //Dokud jsi v Khorinidu, jsi v bezpečí.

			if (hero.guild != GIL_PAL)
			{
				AI_Output (self, other, "DIA_Lothar_FirstEXIT_01_05"); //Na męsto teë dohlížejí královští paladini!
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
	AI_Output (self, other, "DIA_Lothar_Hallo_01_00"); //Stůj, cizinče!

	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Hallo_01_01"); //Nevidęl jsem tę procházet branou.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_02"); //A?
		AI_Output (self, other, "DIA_Lothar_Hallo_01_03"); //A stráže u druhé brány mají zákaz vpouštęt do męsta neznámé osoby.
		AI_Output (other, self, "DIA_Lothar_Hallo_15_04"); //Noooo...
		AI_Output (self, other, "DIA_Lothar_Hallo_01_05"); //Budu si s tęma dvęma muset promluvit!
		AI_Output (self, other, "DIA_Lothar_Hallo_01_06"); //Ale mezi námi:
	};

	AI_Output (self, other, "DIA_Lothar_Hallo_01_07"); //Jsem Lothar. Královský paladin a skromný služebník Innose, tvého Pána.
	AI_Output (self, other, "DIA_Lothar_Hallo_01_08"); //Náš velitel, lord Hagen, mę povęâil úkolem vysvętlit všem pâíchozím nové zákony męsta, které se vztahují na všechny zdejší obyvatele.

	//ADDON>
	AI_Output (self, other, "DIA_Addon_Lothar_Hallo_01_00"); //Od té doby, co lidé z męsta začali bezdůvodnę mizet, si každý musí dávat pozor, aby ho nepotkal stejný osud.
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
	description	 = 	"Mám důležitý vzkaz pro velitele paladinů!";
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
 	AI_Output (other, self, "DIA_Lothar_MESSAGE_15_00"); //Mám důležitý vzkaz pro velitele paladinů!
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_01"); //Ctihodný lord Hagen nikoho nepâijímá.
	AI_Output (self, other, "DIA_Lothar_MESSAGE_01_02"); //Za všechny vęci týkající se prostých občanů je zodpovędný lord Andre, velitel męstské stráže.
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
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_02"); //Posvátné Innosovo oko! Jak to, že o nęm víš?! Nejsi členem našeho âádu!
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_03"); //Âekl mi o nęm jeden mág.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_04"); //Netuším, co tím zamýšlel, když ti svęâil jedno z tajemstvích našeho âádu.
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_05"); //Ale určitę nechtęl, abys na nęj právę TY vztáhl ruku.
		AI_Output (other, self, "DIA_Lothar_EyeInnos_15_06"); //Ale...
		AI_Output (self, other, "DIA_Lothar_EyeInnos_01_07"); //Už o tom nechci slyšet!
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output (self, other, "DIA_Lothar_EyeInnos_01_08"); //Nejdâív začneš s báchorkami o dracích, a teë tohle - neuvęâitelné!
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
	description	 = 	"Poslouchej - męsto ohrožují draci!";
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
	AI_Output (other, self, "DIA_Lothar_Dragons_15_00"); //Poslouchej - męsto ohrožují draci!
	if ((hero.guild != GIL_PAL)&&(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_01"); //To není možné!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_02"); //Další šílenec!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_03"); //Už takhle máme ve męstę dost nepokojů. Nepotâebujeme žádného troubu, který bude dęsit lid povídačkami o dracích!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_04"); //Posledního človęka, který si takovéhle vęci vymýšlel, jsem dal okamžitę zavâít a poslat do Hornického údolí s vęzeŕským transportem. Takže pozor na jazyk!
		AI_Output (self, other, "DIA_Lothar_Dragons_01_05"); //Nepotâebujeme nikoho, kdo by nám mezi lidmi šíâil paniku!
	}
	else
	{
		AI_Output (self, other, "DIA_Lothar_Dragons_01_06"); //Hodnę jsem o tom slyšel. Ale tęžko tomu uvęâit.
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

	description	 = 	"Nevíš nęco o té kamenné obludę z kamenného kruhu na Lobartovę statku?";
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
	AI_Output	(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //Nevíš nęco o té kamenné obludę z kamenného kruhu u Lobartova statku?
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //No jasnę, zničili jsme ji. Ohrožovala i okolní usedlosti.
	AI_Output	(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //Proč se ptáš?
	
	Info_ClearChoices	(DIA_Addon_Lothar_Ornament);
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Hledám kovovou část ornamentu, který patâí k prstenu.", DIA_Addon_Lothar_Ornament_suche );
	Info_AddChoice	(DIA_Addon_Lothar_Ornament, "Myslíš, že je to normální?", DIA_Addon_Lothar_Ornament_normal );
};
func void DIA_Addon_Lothar_Ornament_normal ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //Myslíš, že je to normální?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //Myslíš tu kamennou potvoru?
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //Pokud vím, tak o tohle se starají vodní mágové. 
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //Moc jsem o tom nepâemýšlel. Máme dost práce tady ve męstę a v Hornickém údolí.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //Chápu.
};

func void DIA_Addon_Lothar_Ornament_suche ()
{
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //Hledám kovový úlomek z ornamentu, který patâí k prstenu.
	AI_Output			(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //Męl by být nękde u kamenného kruhu u Lobarta.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //Jo, na nęco takového jsme narazili. Męl to u sebe ten kameŕák. Myslím, že to byla nęjaká magická runa.
	AI_Output			(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //Dal jsem ji lordu Hagenovi, ale netuším, jestli ji poâád ještę má.
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
	description	 = 	"Nękdo už o pâítomnosti draků mluvil?";
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
	AI_Output (other, self, "DIA_Lothar_WhoDragons_15_00"); //Nękdo už o pâítomnosti draků mluvil?
	AI_Output (self, other, "DIA_Lothar_WhoDragons_01_01"); //Ano. Ten chlapík se jmenoval Diego. Alespoŕ mám ten pocit.

	if ((hero.guild != GIL_PAL)	&&	(hero.guild != GIL_KDF))
	{
		AI_Output (self, other, "DIA_Lothar_WhoDragons_01_02"); //(výhrůžnę) Varoval jsem ho - zrovna jako tebe! Ale ten blázen si nedal pokoj a poâád otravoval!
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
	description	 = 	"No dobâe - seznam mę s męstskými zákony!";
};
func int DIA_Lothar_Regeln_Condition ()
{	
	return TRUE;
};
func void DIA_Lothar_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Lothar_Regeln_15_00"); //(s mírným povzdechem) Dobrá - vysvętli mi zákony męsta!
	AI_Output (self, other, "DIA_Lothar_Regeln_01_01"); //Za prvé: Ctihodný paladin lord Hagen sídlí se svými jednotkami v horní části męsta.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_02"); //Proto tam mají pâístup pouze ctihodní občané.
	AI_Output (self ,other, "DIA_Lothar_Add_01_04"); //Za druhé: V radnici v horní části męsta je teë velitelství paladinů. Mají do ní pâístup pouze samotní paladinové a členové domobrany.
	AI_Output (self ,other, "DIA_Lothar_Add_01_05"); //A za tâetí: Každý, kdo je obvinęn z nęjakého zločinu, se musí ospravedlnit pâed velitelem domobrany.
	AI_Output (self, other, "DIA_Lothar_Regeln_01_05"); //Nęjaké otázky?
	
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

	description	 = 	"Obyvatelé męsta prostę mizí?";
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
	AI_Output	(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //Lidé z męsta prostę mizí?
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //Jo, skoro každý den se po nękom slehne zem.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //Dost mę štve, že domobrana ještę poâád nezjistila, kdo za tím vším vęzí.
	AI_Output	(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //Není divu, že obyvatelé męsta si teë dávají zvlášă bacha na cizince.
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
	description	 = 	"Jak se mohu JÁ stát občanem męsta?";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_06"); //Jak se mohu JÁ stát občanem męsta?
	AI_Output (self ,other, "DIA_Lothar_Add_01_07"); //Za občany męsta jsou považováni jen ti, kdo mají stálé zamęstnání!
	AI_Output (self ,other, "DIA_Lothar_Add_01_09"); //Ale neâekl bych, že by k setkání s lordem Hagenem stačilo být občanem męsta!
	AI_Output (self ,other, "DIA_Lothar_Add_01_10"); //Jako občan máš pâístup do horní části męsta, nic víc!
	AI_Output (self ,other, "DIA_Lothar_Add_01_11"); //Na radnici můžeš být vpuštęn jen v pâípadę, že se staneš členem domobrany!
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
	AI_Output (self ,other, "DIA_Lothar_Add_01_15"); //Musíš se pâihlásit jako učedník k jednomu z mistrů tady v dolní části męsta.
	AI_Output (self ,other, "DIA_Lothar_Add_01_16"); //Jakmile tę mistr pâijme, stane se z tebe občan.
	AI_Output (self ,other, "DIA_Lothar_Add_01_17"); //Musí s tím ale souhlasit i ostatní mistâi, tak velí zvyk tady v Khorinidu.
	AI_Output (self ,other, "DIA_Lothar_Add_01_18"); //Pokud sis pohrával s myšlenkou, že najdeš nęjakou práci v pâístavu, tak na to zase rychle zapomeŕ!
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
	description	 = 	"Jak se dostanu do horní čtvrti?";
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
	AI_Output (other, self, "DIA_Lothar_ToOV_15_00"); //Jak se dostanu do horní části męsta?
	AI_Output (self, other, "DIA_Lothar_ToOV_01_01"); //No tak, posloucháš mę vůbec?!
	AI_Output (self, other, "DIA_Lothar_ToOV_01_02"); //Nejsi občanem tohoto męsta. Můžeš si tu zacházku ušetâit - stráže tę dovnitâ nepustí.
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
	description	 = 	"Jak se mohu pâidat k domobranę?";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_26"); //Jak se mohu pâidat k domobranę?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_27"); //Na pâíkaz lorda Hagena mohou do domobrany vstoupit jen občané męsta.
		AI_Output (other, self, "DIA_Lothar_Add_15_28"); //Aha.
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_29"); //Pokud by ses chtęl dozvędęt nęco víc, promluv si v kasárnách s lordem Andrem.
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
	description	 = 	"Co musím udęlat, abych męl takové brnęní jako ty?";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_30"); //Co musím udęlat, abych męl takové brnęní jako ty?
	if (other.guild != GIL_MIL)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_31"); //(kâičí) Cože? Vždyă ani nejsi členem domobrany!
	};
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_32"); //Nejsi dokonce ani OBČAN!
	};
	AI_Output (self ,other, "DIA_Lothar_Add_01_33"); //Jak tę může vůbec napadnout, že bys mohl nosit brnęní PALADINA?
	AI_Output (self ,other, "DIA_Lothar_Add_01_34"); //Tuhle čest si vysloužilo jen nękolik málo členů domobrany, a to za své neobyčejnę odvážné skutky.
	AI_Output (self ,other, "DIA_Lothar_Add_01_35"); //(stroze) Pokud by ses chtęl stát paladinem, máš pâed sebou hodnę dlouhou cestu, chlapče!
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
	description	 = 	"Kde najdu velitele męstské stráže?";
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
	AI_Output (other, self, "DIA_Lothar_WoAndre_15_00"); //Kde najdu velitele męstské stráže?
	AI_Output (self, other, "DIA_Lothar_WoAndre_01_01"); //Lord Andre je v kasárnách na druhém konci męsta.
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
	AI_Output (self ,other, "DIA_Lothar_Add_01_24"); //Paladinové platí za ubytování všech poutníků, kteâí do męsta pâijdou.
	AI_Output (self ,other, "DIA_Lothar_Add_01_25"); //Najdeš zde také všechny potulné kupce z tržištę.
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
	AI_Output (self, other, "DIA_Lothar_PermB4OV_01_00"); //O všem ostatním si už můžeš promluvit s lordem Andrem!
	AI_StopProcessInfos(self);
};	
	

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() //überflüsige Outputs
{
	AI_Output (other, self, "DIA_Lothar_Add_15_00"); //Ale já se MUSÍM setkat s lordem Hagenem!

	AI_Output (self ,other, "DIA_Lothar_Add_01_45"); //A jak vidím, tak tę pâijal do domobrany.
	AI_Output (self ,other, "DIA_Lothar_Add_01_46"); //Hm - určitę ví, co dęlá.
	
	AI_Output (other, self, "DIA_Lothar_Add_15_20"); //Kolik je tady mistrů?
	AI_Output (self ,other, "DIA_Lothar_Add_01_21"); //Myslím, že jich je dohromady pęt.
		
	AI_Output (self ,other, "DIA_Lothar_Add_01_62"); //Hele, neâekl jsem to snad dost jasnę? Už žádné povídačky o dracích!
	AI_Output (other, self, "DIA_Lothar_Add_15_63"); //Jak víš...?
	AI_Output (self ,other, "DIA_Lothar_Add_01_64"); //Do TOHO ti nic není!
	AI_Output (self ,other, "DIA_Lothar_Add_01_65"); //To bylo naposledy, rozumíme si?!
	
	AI_Output (other, self, "DIA_Lothar_Add_15_66"); //Kde najdu velitele domobrany?
	AI_Output (other, self, "DIA_Lothar_Add_15_08"); //Jsem teë učedník jednoho ze zdejších mistrů!
	
	// ------ NEWS_Modul für Unterstadt ------
	AI_Output (self ,other, "DIA_Lothar_Add_01_47"); //Už zase ty.

	AI_Output (self ,other, "DIA_Lothar_Add_01_43"); //Slyšel jsem, že ses setkal s lordem Andrem?
	AI_Output (self ,other, "DIA_Lothar_Add_01_44"); //Âíkal jsem ti snad, že k domobranę se můžeš pâidat jen v pâípadę, že jsi občanem męsta.

	AI_Output (self ,other, "DIA_Lothar_Add_01_48"); //Oznámil jsem lordu Hagenovi, že s ním chceš mluvit.
	AI_Output (other, self, "DIA_Lothar_Add_15_49"); //A? Co âíkal?
	AI_Output (self ,other, "DIA_Lothar_Add_01_50"); //Nikdy o tobę neslyšel.
	AI_Output (other, self, "DIA_Lothar_Add_15_51"); //Samozâejmę že ne. Âekl jsi mu o tęch dracích?
	AI_Output (self ,other, "DIA_Lothar_Add_01_52"); //Copak jsem ti neâekl, abys s tęmi povídačkami PÂESTAL?!

	AI_Output (self ,other, "DIA_Lothar_Add_01_12"); //Slyšel jsem, že už máš souhlas nękolika mistrů.
	AI_Output (self ,other, "DIA_Lothar_Add_01_13"); //Bereš to docela vážnę, co?

	AI_Output (self ,other, "DIA_Lothar_Add_01_01"); //Musíš dodržovat pravidla, stejnę jako kdokoliv jiný!
	AI_Output (self ,other, "DIA_Lothar_Add_01_02"); //Lord Hagen nemá čas.
	AI_Output (self ,other, "DIA_Lothar_Add_01_03"); //Pokud máš na srdci nęco PODSTATNÉHO, jdi za lordem Andrem. On ti pomůže!
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
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_01"); //Takže se ti nakonec podaâilo dostat se do horní části męsta!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_36"); //Kde jsi vzal tu róbu?
		AI_Output (other, self, "DIA_Lothar_Add_15_37"); //Prošel jsem zkouškou ohnę.
		AI_Output (self ,other, "DIA_Lothar_Add_01_38"); //Neuvęâitelné. V tom pâípadę to, co se tu dęje, musí být Innosova vůle.
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lothar_Add_01_39"); //Nepâidal ses k Onarovým žoldákům, že ne?
		AI_Output (self ,other, "DIA_Lothar_Add_01_40"); //Jak ses sem dostal?
		AI_Output (other, self, "DIA_Lothar_Add_15_41"); //Pâináším nabídku pâímęâí od Leeho.
		AI_Output (self ,other, "DIA_Lothar_Add_01_42"); //Pche! Lord Hagen s tím nikdy nebude souhlasit.
	};
		
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_02"); //Musíš tady dbát na nękteré vęci, jinak odsud poletíš stejnę rychle, jako ses sem dostal.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_03"); //Vstup máš povolen jen do budov obchodníků. Poznáš je podle znamení nade dveâmi - to jen aby nedošlo k nęjakým nedorozumęním.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_04"); //Ostatní budovy patâí významným občanům - tam nemáš co pohledávat!
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV) 
	{
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_05"); //Nic na tom nemęní, že teë jsi členem Innosova âádu.
	};
	if (other.guild == GIL_MIL)
	{	
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_06"); //Jakožto člen domobrany máš také povolen pâístup do prostor paladinů.
		AI_Output (self, other, "DIA_Lothar_HelloAgain_01_07"); //Svoje ubikace máš ale poâád v kasárnách.
	};
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_08"); //V téhle čtvrti žijí významní občané męsta. Chovej se k nim tedy s náležitou úctou.
	AI_Output (self, other, "DIA_Lothar_HelloAgain_01_09"); //Rozumíme si?
	AI_Output (other, self, "DIA_Lothar_HelloAgain_15_10"); //Jasnę.
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
	AI_Output (self, other, "DIA_Lothar_Hagen_01_01"); //Je v radnici, na konci horní čtvrti.
	AI_Output (self, other, "DIA_Lothar_Hagen_01_02"); //Pokud ale nemáš dobrý důvod, tak tę tam stejnę nikdo nepustí.
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
	AI_Output (self ,other, "DIA_Lothar_Add_01_54"); //A? Nesnažil ses ho obtęžovat s tęmi báchorkami o dracích, že ne?
	AI_Output (other, self, "DIA_Lothar_Add_15_55"); //Pâesnę to jsem udęlal.
	AI_Output (self ,other, "DIA_Lothar_Add_01_56"); //To snad nemůže být pravda...
	AI_Output (other, self, "DIA_Lothar_Add_15_57"); //Poslal mę sehnat nęjaké důkazy.
	AI_Output (self ,other, "DIA_Lothar_Add_01_58"); //V tom pâípadę hodnę štęstí. (pro sebe) Blázne...
	
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
	description  = 	"Mám důkaz! Tady je dopis od velitele Garonda!";
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
	AI_Output (other, self, "DIA_Lothar_Add_15_59"); //Mám důkaz! Tady je dopis od velitele Garonda!
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
	description  = 	"Stalo se v poslední dobę nęco zajímavého?";
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
	AI_Output (other, self, "DIA_Lothar_PERM_15_00"); //Stalo se v poslední dobę nęco zajímavého?
	if (other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_01"); //Ano - že sem vpustili nękoho, jako jsi ty. Nęco takového se nestalo už celé vęky.
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Lothar_PERM_01_02"); //Ty bys to męl vędęt nejlíp. Jako člen męstské stráže musíš dohlížet na poâádek a dodržování zákona!
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





