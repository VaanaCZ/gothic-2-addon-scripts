var int URSHAK_SUCKED;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Urshak_EXIT   (C_INFO)
{
	npc         = NONE_110_Urshak;
	nr          = 999;
	condition   = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HALLO		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	5;
	condition	 = 	DIA_Urshak_HALLO_Condition;
	information	 = 	DIA_Urshak_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (URSHAK_SUCKED	== FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Urshak_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_00"); //KHROTOK JABARTH!!!
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //Stój! Ciebie znać! Ty przyjaciel-człowiek, z łagodny głos.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //Przyjaciel co zabić demon KRUSHAK!
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"Odnalazłem mego starego orkowego przyjaciela, Ur-Shaka."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "Co tu porabiasz?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "Gadający ork?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //Gadający ork?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //Zapomniał Ur-Shak? Ur-Shak smutny.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //Dużo dni wcześniej Ur-Shak pomógł zdobyć ULU-MULU, żeby przyjaciel poszedł do wioski. Wtedy orki go nie zabić.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //Przyjaciel był w świątynia orków i pokonał demon. Dużo dni wcześniej! Nie pamięta?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //Szkoda, że okoliczności nie są bardziej sprzyjające. O mało cię nie zabiłem. Co tu robisz?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //Ur-Shak idzie, żeby zobaczyć, co się stało z jego bracia.
	Info_ClearChoices	(DIA_Urshak_HALLO);
};



///////////////////////////////////////////////////////////////////////
//	Info WasmachenOrks
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASMACHENORKS		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	6;
	condition	 = 	DIA_Urshak_WASMACHENORKS_Condition;
	information	 = 	DIA_Urshak_WASMACHENORKS_Info;

	description	 = 	"Dlaczego orkowie atakują ludzi?";
};

func int DIA_Urshak_WASMACHENORKS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASMACHENORKS_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //Dlaczego orkowie atakują ludzi?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //Ur-Shak zawsze mówił, że ludzie nie złe, że tam też przyjaciele.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //Ale szaman nie słuchać Ur-Shak, a bracia ciągle nie lubić Ur-Shak.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //Ur-Shak nie wie, czemu wielka wojna z ludzie.
	B_LogEntry (TOPIC_Urshak,"Wciąż nie przekonał swego ludu do wysłuchania jego racji. Ciągle jest wygnańcem."); 
};


///////////////////////////////////////////////////////////////////////
//	Info soviele
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_SOVIELE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	7;
	condition	 = 	DIA_Urshak_SOVIELE_Condition;
	information	 = 	DIA_Urshak_SOVIELE_Info;

	description	 = 	"Skąd się was tu tylu wzięło?";
};

func int DIA_Urshak_SOVIELE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_SOVIELE_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //Skąd się was tu tylu wzięło?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //Jedne orki idą z gór, a inne ze statków. Wszystkie robią wielkie ogrodzenie.
};


///////////////////////////////////////////////////////////////////////
//	Info Zaun
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_ZAUN		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	8;
	condition	 = 	DIA_Urshak_ZAUN_Condition;
	information	 = 	DIA_Urshak_ZAUN_Info;

	description	 = 	"Co się kryje za palisadą orków na wschodzie?";
};

func int DIA_Urshak_ZAUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_ZAUN_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //Co się kryje za palisadą orków na wschodzie?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //U orków zawsze duży pali-sada. Tam wojenny obóz.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //Pali-sada dobry na wojnę. Nie widać ilu orki, a orki bezpieczne.
};



///////////////////////////////////////////////////////////////////////
//	Info washastduvor
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASHASTDUVOR		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_WASHASTDUVOR_Condition;
	information	 = 	DIA_Urshak_WASHASTDUVOR_Info;

	description	 = 	"Co zamierzasz teraz zrobić?";
};

func int DIA_Urshak_WASHASTDUVOR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASHASTDUVOR_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //Co zamierzasz teraz zrobić?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //Ur-Shak poczeka, aż zwiadowcy zaprowadzić go do Hosh-Pak.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //Kim jest ten Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //Bardzo duży szaman. Wielki wpływ ma na wojownicy. Wielki plan ma dla orków.

	B_LogEntry (TOPIC_Urshak,"Ur-Shak planuje spotkać się z orkowym szamanem, Hosh-Pakiem. Chce otrzymać pozwolenie na ponowne dołączenie do Rady Szamanów."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Gdzie znajdę tego Hosh-Paka?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Więc dlaczego sam do niego nie pójdziesz?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //Więc dlaczego sam do niego nie pójdziesz?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //Ur-Shak próbować i próbować oddostać honor, i być znów w rada szamanów.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //Ale Hosh-Pak nie chciał słuchać. Bez zwiadowców orki zabiją Ur-Shak. Ur-Shak musi porozmawiać z Hosh-Pak.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //Może dzisiaj udać.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //Gdzie znajdę tego Hosh-Paka?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //On ma miejsce, gdzie widzi wojownicy - nad fortecą, przy ognista góra. Tam Hosh-Pak dowodzi wojownicy.

};

func void DIA_Urshak_WASHASTDUVOR_weiter ()
{
	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);
};



///////////////////////////////////////////////////////////////////////
//	Info hoshpakDead
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKDEAD		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_HOSHPAKDEAD_Condition;
	information	 = 	DIA_Urshak_HOSHPAKDEAD_Info;

	description	 = 	"Hosh-Pak nie żyje.";
};

func int DIA_Urshak_HOSHPAKDEAD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_WASHASTDUVOR))
		&& (Npc_IsDead(Hosh_pak))
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //Hosh-Pak nie żyje.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //Hosh-Pak nie żyje? RUSHTASOK!
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //Moje serce smutne. Ur-Shak nie zapomni wielki ork, który zrobił go szamanem.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //Rozumiem. Hosh-Pak był twoim nauczycielem, tak?
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //Ur-Shak musi nieść swój smutek. Musi pogrzebać Hosh-Pak. Ur-Shak musi już iść.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //Przyjaciel lepiej iść na przełęcz. Tu niebezpiecznie.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //Ur-Shak bardzo smutny, jeśli przyjaciel-człowiek też zginąć.

	B_LogEntry (TOPIC_Urshak,"Hosh-Pak nie żyje. Mój orkowy przyjaciel zmierza do jego namiotów, pogrążony w żałobie po swoim mentorze. Nie powinienem mu przeszkadzać."); 

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,20);
	Npc_ExchangeRoutine	(self,"Start");
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");	
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");	
};


///////////////////////////////////////////////////////////////////////
//	Info geh
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_GEH		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_GEH_Condition;
	information	 = 	DIA_Urshak_GEH_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_GEH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<1000) == FALSE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_GEH_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //Przyjaciel lepiej iść przez przełęcz.
	Npc_SetRefuseTalk (self,10);
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info HoshpakRache
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKRACHE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_HOSHPAKRACHE_Condition;
	information	 = 	DIA_Urshak_HOSHPAKRACHE_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HOSHPAKRACHE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<=1000))
		&& (URSHAK_SUCKED == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKRACHE_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //KHROTOK! Ja wiem, że ty był, gdzie zabili Hosh-Pak. Duży błąd, obcy człowiek!
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //Widzę, że zająłeś tu jego miejsce. Od początku mną manipulowałeś.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //Twoja pozycja wśród orków jest wyższa, niż skłonny byłeś przyznać. Teraz jesteś niczym więcej jak narzędziem w rękach zła.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //Obcy dobrze mówi. Ur-Shak zna teraz tylko nienawiść i zemsta.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //Ur-Shak zobaczył błąd, że zaufał człowiek. Ur-Shak żałuje, że pomógł zły człowiek i mówił mu przyjaciel.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //Obcy iść już z doliny i przez przełęcz. Ur-Shak nie może zabić obcy. Honor szamana nie pozwala teraz zabić.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //Następnym razem będziemy wrogi. Ty już lepiej iść.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"Rada orkowych szamanów ponownie przyjęła w swe szeregi Ur-Shaka. Walczy on teraz po stronie wroga... Nie wiem, jak zareaguje na mój widok. Nie powinienem mu chyba wchodzić w drogę, dopóki nie rozstrzygnę moich spraw z orkami - do tego czasu powinien się już uspokoić."); 
	B_GivePlayerXP (XP_UrshakBecomesShaman);
};


///////////////////////////////////////////////////////////////////////
//	Info keineWahl
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_KEINEWAHL		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_KEINEWAHL_Condition;
	information	 = 	DIA_Urshak_KEINEWAHL_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_KEINEWAHL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKRACHE))
	&& (Npc_IsInState (self,ZS_Talk))
		{
				return TRUE;
		};
};

func void DIA_Urshak_KEINEWAHL_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //Ty iść. Nie rozmawiać z obcy.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















