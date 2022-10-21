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
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //St�j! Ciebie zna�! Ty przyjaciel-cz�owiek, z �agodny g�os.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //Przyjaciel co zabi� demon KRUSHAK!
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"Odnalaz�em mego starego orkowego przyjaciela, Ur-Shaka."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "Co tu porabiasz?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "Gadaj�cy ork?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //Gadaj�cy ork?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //Zapomnia� Ur-Shak? Ur-Shak smutny.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //Du�o dni wcze�niej Ur-Shak pom�g� zdoby� ULU-MULU, �eby przyjaciel poszed� do wioski. Wtedy orki go nie zabi�.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //Przyjaciel by� w �wi�tynia ork�w i pokona� demon. Du�o dni wcze�niej! Nie pami�ta?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //Szkoda, �e okoliczno�ci nie s� bardziej sprzyjaj�ce. O ma�o ci� nie zabi�em. Co tu robisz?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //Ur-Shak idzie, �eby zobaczy�, co si� sta�o z jego bracia.
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

	description	 = 	"Dlaczego orkowie atakuj� ludzi?";
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
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //Dlaczego orkowie atakuj� ludzi?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //Ur-Shak zawsze m�wi�, �e ludzie nie z�e, �e tam te� przyjaciele.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //Ale szaman nie s�ucha� Ur-Shak, a bracia ci�gle nie lubi� Ur-Shak.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //Ur-Shak nie wie, czemu wielka wojna z ludzie.
	B_LogEntry (TOPIC_Urshak,"Wci�� nie przekona� swego ludu do wys�uchania jego racji. Ci�gle jest wygna�cem."); 
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

	description	 = 	"Sk�d si� was tu tylu wzi�o?";
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
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //Sk�d si� was tu tylu wzi�o?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //Jedne orki id� z g�r, a inne ze statk�w. Wszystkie robi� wielkie ogrodzenie.
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

	description	 = 	"Co si� kryje za palisad� ork�w na wschodzie?";
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
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //Co si� kryje za palisad� ork�w na wschodzie?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //U ork�w zawsze du�y pali-sada. Tam wojenny ob�z.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //Pali-sada dobry na wojn�. Nie wida� ilu orki, a orki bezpieczne.
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

	description	 = 	"Co zamierzasz teraz zrobi�?";
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
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //Co zamierzasz teraz zrobi�?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //Ur-Shak poczeka, a� zwiadowcy zaprowadzi� go do Hosh-Pak.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //Kim jest ten Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //Bardzo du�y szaman. Wielki wp�yw ma na wojownicy. Wielki plan ma dla ork�w.

	B_LogEntry (TOPIC_Urshak,"Ur-Shak planuje spotka� si� z orkowym szamanem, Hosh-Pakiem. Chce otrzyma� pozwolenie na ponowne do��czenie do Rady Szaman�w."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Gdzie znajd� tego Hosh-Paka?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Wi�c dlaczego sam do niego nie p�jdziesz?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //Wi�c dlaczego sam do niego nie p�jdziesz?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //Ur-Shak pr�bowa� i pr�bowa� oddosta� honor, i by� zn�w w rada szaman�w.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //Ale Hosh-Pak nie chcia� s�ucha�. Bez zwiadowc�w orki zabij� Ur-Shak. Ur-Shak musi porozmawia� z Hosh-Pak.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //Mo�e dzisiaj uda�.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //Gdzie znajd� tego Hosh-Paka?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //On ma miejsce, gdzie widzi wojownicy - nad fortec�, przy ognista g�ra. Tam Hosh-Pak dowodzi wojownicy.

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

	description	 = 	"Hosh-Pak nie �yje.";
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
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //Hosh-Pak nie �yje.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //Hosh-Pak nie �yje? RUSHTASOK!
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //Moje serce smutne. Ur-Shak nie zapomni wielki ork, kt�ry zrobi� go szamanem.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //Rozumiem. Hosh-Pak by� twoim nauczycielem, tak?
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //Ur-Shak musi nie�� sw�j smutek. Musi pogrzeba� Hosh-Pak. Ur-Shak musi ju� i��.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //Przyjaciel lepiej i�� na prze��cz. Tu niebezpiecznie.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //Ur-Shak bardzo smutny, je�li przyjaciel-cz�owiek te� zgin��.

	B_LogEntry (TOPIC_Urshak,"Hosh-Pak nie �yje. M�j orkowy przyjaciel zmierza do jego namiot�w, pogr��ony w �a�obie po swoim mentorze. Nie powinienem mu przeszkadza�."); 

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
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //Przyjaciel lepiej i�� przez prze��cz.
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
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //KHROTOK! Ja wiem, �e ty by�, gdzie zabili Hosh-Pak. Du�y b��d, obcy cz�owiek!
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //Widz�, �e zaj��e� tu jego miejsce. Od pocz�tku mn� manipulowa�e�.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //Twoja pozycja w�r�d ork�w jest wy�sza, ni� sk�onny by�e� przyzna�. Teraz jeste� niczym wi�cej jak narz�dziem w r�kach z�a.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //Obcy dobrze m�wi. Ur-Shak zna teraz tylko nienawi�� i zemsta.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //Ur-Shak zobaczy� b��d, �e zaufa� cz�owiek. Ur-Shak �a�uje, �e pom�g� z�y cz�owiek i m�wi� mu przyjaciel.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //Obcy i�� ju� z doliny i przez prze��cz. Ur-Shak nie mo�e zabi� obcy. Honor szamana nie pozwala teraz zabi�.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //Nast�pnym razem b�dziemy wrogi. Ty ju� lepiej i��.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"Rada orkowych szaman�w ponownie przyj�a w swe szeregi Ur-Shaka. Walczy on teraz po stronie wroga... Nie wiem, jak zareaguje na m�j widok. Nie powinienem mu chyba wchodzi� w drog�, dop�ki nie rozstrzygn� moich spraw z orkami - do tego czasu powinien si� ju� uspokoi�."); 
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
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //Ty i��. Nie rozmawia� z obcy.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















