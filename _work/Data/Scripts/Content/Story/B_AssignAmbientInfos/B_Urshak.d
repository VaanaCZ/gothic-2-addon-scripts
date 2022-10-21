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
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //Stój! Ciebie znaæ! Ty przyjaciel-cz³owiek, z ³agodny g³os.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //Przyjaciel co zabiæ demon KRUSHAK!
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"Odnalaz³em mego starego orkowego przyjaciela, Ur-Shaka."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "Co tu porabiasz?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "Gadaj¹cy ork?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //Gadaj¹cy ork?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //Zapomnia³ Ur-Shak? Ur-Shak smutny.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //Du¿o dni wczeœniej Ur-Shak pomóg³ zdobyæ ULU-MULU, ¿eby przyjaciel poszed³ do wioski. Wtedy orki go nie zabiæ.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //Przyjaciel by³ w œwi¹tynia orków i pokona³ demon. Du¿o dni wczeœniej! Nie pamiêta?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //Szkoda, ¿e okolicznoœci nie s¹ bardziej sprzyjaj¹ce. O ma³o ciê nie zabi³em. Co tu robisz?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //Ur-Shak idzie, ¿eby zobaczyæ, co siê sta³o z jego bracia.
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

	description	 = 	"Dlaczego orkowie atakuj¹ ludzi?";
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
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //Dlaczego orkowie atakuj¹ ludzi?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //Ur-Shak zawsze mówi³, ¿e ludzie nie z³e, ¿e tam te¿ przyjaciele.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //Ale szaman nie s³uchaæ Ur-Shak, a bracia ci¹gle nie lubiæ Ur-Shak.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //Ur-Shak nie wie, czemu wielka wojna z ludzie.
	B_LogEntry (TOPIC_Urshak,"Wci¹¿ nie przekona³ swego ludu do wys³uchania jego racji. Ci¹gle jest wygnañcem."); 
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

	description	 = 	"Sk¹d siê was tu tylu wziê³o?";
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
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //Sk¹d siê was tu tylu wziê³o?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //Jedne orki id¹ z gór, a inne ze statków. Wszystkie robi¹ wielkie ogrodzenie.
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

	description	 = 	"Co siê kryje za palisad¹ orków na wschodzie?";
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
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //Co siê kryje za palisad¹ orków na wschodzie?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //U orków zawsze du¿y pali-sada. Tam wojenny obóz.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //Pali-sada dobry na wojnê. Nie widaæ ilu orki, a orki bezpieczne.
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

	description	 = 	"Co zamierzasz teraz zrobiæ?";
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
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //Co zamierzasz teraz zrobiæ?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //Ur-Shak poczeka, a¿ zwiadowcy zaprowadziæ go do Hosh-Pak.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //Kim jest ten Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //Bardzo du¿y szaman. Wielki wp³yw ma na wojownicy. Wielki plan ma dla orków.

	B_LogEntry (TOPIC_Urshak,"Ur-Shak planuje spotkaæ siê z orkowym szamanem, Hosh-Pakiem. Chce otrzymaæ pozwolenie na ponowne do³¹czenie do Rady Szamanów."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Gdzie znajdê tego Hosh-Paka?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Wiêc dlaczego sam do niego nie pójdziesz?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //Wiêc dlaczego sam do niego nie pójdziesz?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //Ur-Shak próbowaæ i próbowaæ oddostaæ honor, i byæ znów w rada szamanów.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //Ale Hosh-Pak nie chcia³ s³uchaæ. Bez zwiadowców orki zabij¹ Ur-Shak. Ur-Shak musi porozmawiaæ z Hosh-Pak.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //Mo¿e dzisiaj udaæ.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //Gdzie znajdê tego Hosh-Paka?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //On ma miejsce, gdzie widzi wojownicy - nad fortec¹, przy ognista góra. Tam Hosh-Pak dowodzi wojownicy.

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

	description	 = 	"Hosh-Pak nie ¿yje.";
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
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //Hosh-Pak nie ¿yje.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //Hosh-Pak nie ¿yje? RUSHTASOK!
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //Moje serce smutne. Ur-Shak nie zapomni wielki ork, który zrobi³ go szamanem.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //Rozumiem. Hosh-Pak by³ twoim nauczycielem, tak?
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //Ur-Shak musi nieœæ swój smutek. Musi pogrzebaæ Hosh-Pak. Ur-Shak musi ju¿ iœæ.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //Przyjaciel lepiej iœæ na prze³êcz. Tu niebezpiecznie.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //Ur-Shak bardzo smutny, jeœli przyjaciel-cz³owiek te¿ zgin¹æ.

	B_LogEntry (TOPIC_Urshak,"Hosh-Pak nie ¿yje. Mój orkowy przyjaciel zmierza do jego namiotów, pogr¹¿ony w ¿a³obie po swoim mentorze. Nie powinienem mu przeszkadzaæ."); 

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
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //Przyjaciel lepiej iœæ przez prze³êcz.
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
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //KHROTOK! Ja wiem, ¿e ty by³, gdzie zabili Hosh-Pak. Du¿y b³¹d, obcy cz³owiek!
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //Widzê, ¿e zaj¹³eœ tu jego miejsce. Od pocz¹tku mn¹ manipulowa³eœ.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //Twoja pozycja wœród orków jest wy¿sza, ni¿ sk³onny by³eœ przyznaæ. Teraz jesteœ niczym wiêcej jak narzêdziem w rêkach z³a.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //Obcy dobrze mówi. Ur-Shak zna teraz tylko nienawiœæ i zemsta.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //Ur-Shak zobaczy³ b³¹d, ¿e zaufa³ cz³owiek. Ur-Shak ¿a³uje, ¿e pomóg³ z³y cz³owiek i mówi³ mu przyjaciel.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //Obcy iœæ ju¿ z doliny i przez prze³êcz. Ur-Shak nie mo¿e zabiæ obcy. Honor szamana nie pozwala teraz zabiæ.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //Nastêpnym razem bêdziemy wrogi. Ty ju¿ lepiej iœæ.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"Rada orkowych szamanów ponownie przyjê³a w swe szeregi Ur-Shaka. Walczy on teraz po stronie wroga... Nie wiem, jak zareaguje na mój widok. Nie powinienem mu chyba wchodziæ w drogê, dopóki nie rozstrzygnê moich spraw z orkami - do tego czasu powinien siê ju¿ uspokoiæ."); 
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
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //Ty iœæ. Nie rozmawiaæ z obcy.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















