///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_EXIT   (C_INFO)
{
	npc         = KDW_1400_Addon_Saturas_NW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Saturas_EXIT_Info()
{
	if (MIS_Addon_Saturas_BringRiordian2Me == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Ponieważ nie sądzę, żeby udało ci się odciągnąć innych magów od pracy, możesz zanieść jednemu z nich wiadomość ode mnie.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Powiedz Riordianowi, że chcę z nim porozmawiać.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Przebywa w głębi krypty.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas chce, żebym przysłał do niego Maga Wody, Riordiana. Znajdę go gdzieś głęboko w tunelach wykopalisk."); 
	};
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nefarius
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Nefarius		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Nefarius_Condition;
	information	 = 	DIA_Addon_Saturas_Nefarius_Info;
 
 	description	 = 	"Mam znaleźć zaginione części ornamentu dla Nefariusa.";
};

func int DIA_Addon_Saturas_Nefarius_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Nefarius_Info ()
{
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //Mam znaleźć zaginione części ornamentu dla Nefariusa.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //Co? Niemożliwe! Też się w to wplątałeś?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //Nie obawiaj się. Znajdę je i przyniosę tutaj.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //Wiesz przynajmniej, gdzie masz szukać?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius dał mi mapę...
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //Pokaż mi ją!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmmm. W wielkim lesie jest bardzo niebezpiecznie. Nie powinieneś iść tam sam.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //Poszukaj w Khorinis kogoś, kto będzie ci towarzyszyć.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //Nie chcę, żeby pożarły cię potwory – a razem z tobą ornament.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Oddaję ci twoją mapę...

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas uważa, że nie powinienem samotnie chodzić po lesie, szukając fragmentów. Mam udać się do Khorinis i znaleźć kogoś, kto będzie mi towarzyszyć."); 
	};
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Hallo		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Hallo_Condition;
	information	 = 	DIA_Addon_Saturas_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition ()
{
	Npc_PerceiveAll (self);
	if (Wld_DetectNpc (self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Hallo_weißtdu ()
{
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_00"); //Wiesz, co uczyniłeś?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_01"); //Wprowadziłeś taki chaos w strukturze magii, że będzie to słychać aż w Khorinis.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_02"); //Podziękuj swoim gwiazdom za to, że bariera przestała istnieć.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_weißtdu_15_03"); //Dlaczego w takim razie narzekasz? Wszystko poszło dobrze.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_04"); //Milcz!
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_05"); //Czego chcesz, u licha?
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //Zwariowałeś? Odejdź stąd.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Krypty są zbyt niebezpieczne dla niedzielnych poszukiwaczy przygód.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //Ale czy my się aby nie znamy? Oczywiście. Ty sukinsynu...
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //Nie myśl, że zapomnieliśmy, jak zdradziłeś nas w Nowym Obozie.

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Ja...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //Ściągnąłeś całą energię magiczną z naszych złóż rudy i po prostu zniknąłeś!
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //Dlaczego to zrobiłeś?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Przepraszam. Nie wiedziałem, co czynię.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Wasz plan i tak by się nie powiódł. ", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Musiałem. Bez tej energii nie zdołałbym pokonać Śniącego.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Musiałem. Bez tej energii nie zdołałbym pokonać Śniącego.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //O czym ty mówisz? Śniący? Pokonać?
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Wasz plan i tak by się nie powiódł. Wysadzanie bariery za pomocą rudy to największa bzdura, o jakiej słyszałem.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Prędzej sami wysadzilibyście się w powietrze.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //No nie! Kto dał ci prawo oceniać nas i nasze intencje?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Gdybym nie był człowiekiem miłującym pokój, sprowadziłbym na ciebie gniew Adanosa.
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Przepraszam. Nie wiedziałem, co czynię.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //Naprawdę? I myślisz, że już wszystko jest w porządku?
	DIA_Addon_Saturas_Hallo_weißtdu ();
};



///////////////////////////////////////////////////////////////////////
//	Info keineAhnung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_keineAhnung		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_keineAhnung_Condition;
	information	 = 	DIA_Addon_Saturas_keineAhnung_Info;

	description	 = 	"Nie mam pojęcia.";
};

func int DIA_Addon_Saturas_keineAhnung_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_keineAhnung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //Nie mam pojęcia. Myślałem, że po prostu się tu pojawię.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Marnujesz mój czas. Odejdź.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //Później się tobą zajmę.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Znalazłem Magów Wody. Najpierw muszę się dowiedzieć, co oni tu właściwie robią. Saturas nie chciał mi powiedzieć. Nadal jest trochę spięty z powodu tej starej sprawy z kolonii karnej."); 

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info raus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_raus		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_raus_Condition;
	information	 = 	DIA_Addon_Saturas_raus_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Saturas_raus_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_keineAhnung))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Saturas_raus_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Lepiej szybko stąd odejdź, zanim coś ci się stanie.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Lares
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Lares		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Lares_Condition;
	information	 = 	DIA_Addon_Saturas_Lares_Info;

	description	 = 	"Przybyłem tu z Laresem.";
};

func int DIA_Addon_Saturas_Lares_Condition ()
{
	if (Lares_Angekommen == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Lares_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //Przybyłem tu z Laresem.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //Z Laresem? Naprawdę? A gdzie on jest?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Zostawił mnie i wrócił do miasta.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //Co? Przysłał cię tutaj samego? O co mu chodzi?
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Ornament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Ornament_Condition;
	information	 = 	DIA_Addon_Saturas_Ornament_Info;

	description	 = 	"Przynoszę twój ornament.";
};

func int DIA_Addon_Saturas_Ornament_Condition ()
{
	//if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Lares))
	//&& (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	if ( Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE) )
	|| ( (Lares_Angekommen == TRUE) && Npc_KnowsInfo(other, DIA_Addon_Saturas_Lares) && Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Przynoszę twój ornament.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //Jak to? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //Kto ci to dał? Nie dostałeś go chyba od Laresa?
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Spokojnie. Przyniosłem go dla ciebie. Jesteś zainteresowany?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Pewnie. Ale martwi mnie, że maczasz w tym palce.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //Dlaczego tak się przejmujesz tą starą historią?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Pracowałem dla ciebie ostatnim razem. Przecież mogłeś wtedy na mnie liczyć.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //I co z tego miałem? Hę, nie myśl, że ci ufam...
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;

	//Joly: Monster auffüllen, die bei Lares gestört haben
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc 	(Giant_Bug, 	"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc 	(Lurker, 		"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 

	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
  	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, "NW_CITY_TO_FARM2_02"); //auf Treppe
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
};

///////////////////////////////////////////////////////////////////////
//	Info geheimbund
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_geheimbund		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_geheimbund_Condition;
	information	 = 	DIA_Addon_Saturas_geheimbund_Info;

	description	 = 	"Chcę wstąpić do Wodnego Kręgu.";
};

func int DIA_Addon_Saturas_geheimbund_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_geheimbund_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Chcę wstąpić do Wodnego Kręgu.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //CO? Skąd się o tym dowiedziałeś? Kto...? LARES... Zabiję go!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Złamał nasze zasady. Nikt nie może mówić o Wodnym Kręgu.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //Brakuje mi słów. Mogę ci zaufać tylko wtedy, kiedy będę miał na ciebie oko.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //Vatras powiedział mi o pierścieniu.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //Co? Vatras? Świetnie! Ze wszystkich Magów Wody spotkałeś jedynego, który ciebie NIE znał...
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //Słuchaj uważnie: Nie rób głupot!
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //Będę uważać...
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas nie chce podjąć decyzji o przyjęciu mnie do Wodnego Kręgu. Woli, żeby zajął się tym Vatras."); 

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_wasmachstdu		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_wasmachstdu_Condition;
	information	 = 	DIA_Addon_Saturas_wasmachstdu_Info;

	description	 = 	"Co tu robisz?";
};

func int DIA_Addon_Saturas_wasmachstdu_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_wasmachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //Co tu robisz?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //W tych salach kryją się dawne tajemnice. Niesamowite tajemnice.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Te inskrypcje i freski wskazują na bardzo starą cywilizację.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Wszystko, co widzisz, napisano w nieznanym języku.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Próbujemy zrozumieć ten język.
};

///////////////////////////////////////////////////////////////////////
//	Info Erdbeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Erdbeben		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	6;
	condition	 = 	DIA_Addon_Saturas_Erdbeben_Condition;
	information	 = 	DIA_Addon_Saturas_Erdbeben_Info;

	description	 = 	"A co z tymi dziwnymi trzęsieniami ziemi?";
};

func int DIA_Addon_Saturas_Erdbeben_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_wasmachstdu))
	&& (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Bedrohung))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Erdbeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //A co z tymi dziwnymi trzęsieniami ziemi?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //To tajemnica, którą staram się rozwiązać.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //Gdzieś za tymi górami została zaburzona struktura magii.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //Najwyraźniej ktoś ze wszystkich sił próbuje rozproszyć jakieś potężne zaklęcie.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Obawiam się, że niedługo trzęsienia ziemi będą odczuwalne na całej wyspie.
};
///////////////////////////////////////////////////////////////////////
//	Info WhatsOrnament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_WhatsOrnament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_WhatsOrnament_Condition;
	information	 = 	DIA_Addon_Saturas_WhatsOrnament_Info;

	description	 = 	"Dlaczego ten ornament jest taki ważny?";
};

func int DIA_Addon_Saturas_WhatsOrnament_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsOrnament == FALSE)
	&& (RitualRingRuns == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //Dlaczego ten ornament jest taki ważny?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //To klucz do portalu.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //Nie powiem ci o tym nic więcej.
};
///////////////////////////////////////////////////////////////////////
//	Info ScRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ScRanger		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_ScRanger_Condition;
	information	 = 	DIA_Addon_Saturas_ScRanger_Info;
	permanent	 = 	TRUE;

	description	 = 	"Teraz należę do Wodnego Kręgu.";
};

func int DIA_Addon_Saturas_ScRanger_Condition ()
{
	if (SaturasKnows_SC_IsRanger == FALSE)
	&& (SC_IsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ScRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Teraz należę do Wodnego Kręgu.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC trägt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese Rüstung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Widzę, że nosisz zbroję naszego bractwa.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Widzę, że masz na palcu nasz tajemny, wyjątkowy znak. Pierścień z akwamarynem.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //Widzę też po twoich oczach, że mówisz prawdę.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //Dobrze. Pozwolę ci wstąpić w nasze szeregi.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Pamiętaj, że wiąże się to z wielką odpowiedzialnością.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //I mam nadzieję, że okażesz się godny.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas przyjął mnie do Wodnego Kręgu."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //A skąd masz wiedzieć, że jesteś jednym z nas?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //Pierścień z akwamarynem noszony przez ciebie należy do Laresa. Rozpoznaję go.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Chcesz mnie oszukać? W sumie nie oczekiwałem niczego innego.
			AI_StopProcessInfos (self);		
		};
};

///////////////////////////////////////////////////////////////////////
//	Info OpenPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_OpenPortal		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_OpenPortal_Condition;
	information	 = 	DIA_Addon_Saturas_OpenPortal_Info;
	permanent	 = 	TRUE;

	description	 = 	"Daj mi pierścień. Otworzę portal.";
};
var int DIA_Addon_Saturas_OpenPortal_NoPerm;
func int DIA_Addon_Saturas_OpenPortal_Condition ()
{
	if (RitualRingRuns == LOG_SUCCESS)
	&& (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_OpenPortal_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Daj mi pierścień. Otworzę portal.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //Dobrze! Jako nowy członek naszego bractwa zasługujesz na ten honor.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Ale cały czas czekam na wiadomość od Vatrasa. Wyruszymy, gdy ją otrzymam.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //MAM dla ciebie wiadomość od Vatrasa.
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //Hmm. I oczywiście nie mogłeś się powstrzymać przed jej otwarciem, prawda?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //Cóż, eee...
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //Dla twojego dobra... obym nie pożałował, że ci zaufałem.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //Bardzo interesujące.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //Weź ten pierścień. Spotkamy się przy portalu. Będę tam na ciebie czekać.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Jeśli Nefarius ma rację, portal otworzy się, kiedy tylko umieścisz tam pierścień.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas dał mi zdobiony pierścień. Chce, żebym go wsadził w mechanizm portalu i przeszedł na drugą stronę."); 

			AI_StopProcessInfos (self);		
			Npc_ExchangeRoutine	(self,"OpenPortal");
			B_StartOtherRoutine	(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos (self);		
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Dopóki Vatras nie da mi znaku, że mogę ci zaufać, pierścień będzie u mnie.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas nie da mi zdobionego pierścienia, dopóki nie otrzyma znaku od Vatrasa, że jestem godny zaufania."); 
		AI_StopProcessInfos (self);		
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PERM		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Saturas_PERM_Condition;
	information	 = 	DIA_Addon_Saturas_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Możesz nauczyć mnie czegoś o magii?";
};

func int DIA_Addon_Saturas_PERM_Condition ()
{
	if (MIS_Addon_Saturas_BringRiordian2Me != 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //Możesz nauczyć mnie czegoś o magii?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //Abyś jeszcze bardziej naruszył jej strukturę?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //Nie. Nie mam czasu na takie zabawy.
};
