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
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Poniewa� nie s�dz�, �eby uda�o ci si� odci�gn�� innych mag�w od pracy, mo�esz zanie�� jednemu z nich wiadomo�� ode mnie.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Powiedz Riordianowi, �e chc� z nim porozmawia�.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Przebywa w g��bi krypty.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas chce, �ebym przys�a� do niego Maga Wody, Riordiana. Znajd� go gdzie� g��boko w tunelach wykopalisk."); 
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
 
 	description	 = 	"Mam znale�� zaginione cz�ci ornamentu dla Nefariusa.";
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
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //Mam znale�� zaginione cz�ci ornamentu dla Nefariusa.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //Co? Niemo�liwe! Te� si� w to wpl�ta�e�?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //Nie obawiaj si�. Znajd� je i przynios� tutaj.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //Wiesz przynajmniej, gdzie masz szuka�?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius da� mi map�...
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //Poka� mi j�!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmmm. W wielkim lesie jest bardzo niebezpiecznie. Nie powiniene� i�� tam sam.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //Poszukaj w Khorinis kogo�, kto b�dzie ci towarzyszy�.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //Nie chc�, �eby po�ar�y ci� potwory � a razem z tob� ornament.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Oddaj� ci twoj� map�...

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas uwa�a, �e nie powinienem samotnie chodzi� po lesie, szukaj�c fragment�w. Mam uda� si� do Khorinis i znale�� kogo�, kto b�dzie mi towarzyszy�."); 
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
func void DIA_Addon_Saturas_Hallo_wei�tdu ()
{
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_00"); //Wiesz, co uczyni�e�?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_01"); //Wprowadzi�e� taki chaos w strukturze magii, �e b�dzie to s�ycha� a� w Khorinis.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_02"); //Podzi�kuj swoim gwiazdom za to, �e bariera przesta�a istnie�.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_wei�tdu_15_03"); //Dlaczego w takim razie narzekasz? Wszystko posz�o dobrze.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_04"); //Milcz!
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_05"); //Czego chcesz, u licha?
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //Zwariowa�e�? Odejd� st�d.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Krypty s� zbyt niebezpieczne dla niedzielnych poszukiwaczy przyg�d.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //Ale czy my si� aby nie znamy? Oczywi�cie. Ty sukinsynu...
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //Nie my�l, �e zapomnieli�my, jak zdradzi�e� nas w Nowym Obozie.

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Ja...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //�ci�gn��e� ca�� energi� magiczn� z naszych z�� rudy i po prostu znikn��e�!
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //Dlaczego to zrobi�e�?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Przepraszam. Nie wiedzia�em, co czyni�.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Wasz plan i tak by si� nie powi�d�. ", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Musia�em. Bez tej energii nie zdo�a�bym pokona� �ni�cego.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Musia�em. Bez tej energii nie zdo�a�bym pokona� �ni�cego.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //O czym ty m�wisz? �ni�cy? Pokona�?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Wasz plan i tak by si� nie powi�d�. Wysadzanie bariery za pomoc� rudy to najwi�ksza bzdura, o jakiej s�ysza�em.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Pr�dzej sami wysadziliby�cie si� w powietrze.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //No nie! Kto da� ci prawo ocenia� nas i nasze intencje?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Gdybym nie by� cz�owiekiem mi�uj�cym pok�j, sprowadzi�bym na ciebie gniew Adanosa.
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Przepraszam. Nie wiedzia�em, co czyni�.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //Naprawd�? I my�lisz, �e ju� wszystko jest w porz�dku?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
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

	description	 = 	"Nie mam poj�cia.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //Nie mam poj�cia. My�la�em, �e po prostu si� tu pojawi�.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Marnujesz m�j czas. Odejd�.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //P�niej si� tob� zajm�.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Znalaz�em Mag�w Wody. Najpierw musz� si� dowiedzie�, co oni tu w�a�ciwie robi�. Saturas nie chcia� mi powiedzie�. Nadal jest troch� spi�ty z powodu tej starej sprawy z kolonii karnej."); 

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
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Lepiej szybko st�d odejd�, zanim co� ci si� stanie.
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

	description	 = 	"Przyby�em tu z Laresem.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //Przyby�em tu z Laresem.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //Z Laresem? Naprawd�? A gdzie on jest?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Zostawi� mnie i wr�ci� do miasta.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //Co? Przys�a� ci� tutaj samego? O co mu chodzi?
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

	description	 = 	"Przynosz� tw�j ornament.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Przynosz� tw�j ornament.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //Jak to? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //Kto ci to da�? Nie dosta�e� go chyba od Laresa?
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Spokojnie. Przynios�em go dla ciebie. Jeste� zainteresowany?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Pewnie. Ale martwi mnie, �e maczasz w tym palce.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //Dlaczego tak si� przejmujesz t� star� histori�?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Pracowa�em dla ciebie ostatnim razem. Przecie� mog�e� wtedy na mnie liczy�.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //I co z tego mia�em? H�, nie my�l, �e ci ufam...
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;

	//Joly: Monster auff�llen, die bei Lares gest�rt haben
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

	description	 = 	"Chc� wst�pi� do Wodnego Kr�gu.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Chc� wst�pi� do Wodnego Kr�gu.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //CO? Sk�d si� o tym dowiedzia�e�? Kto...? LARES... Zabij� go!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Z�ama� nasze zasady. Nikt nie mo�e m�wi� o Wodnym Kr�gu.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //Brakuje mi s��w. Mog� ci zaufa� tylko wtedy, kiedy b�d� mia� na ciebie oko.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //Vatras powiedzia� mi o pier�cieniu.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //Co? Vatras? �wietnie! Ze wszystkich Mag�w Wody spotka�e� jedynego, kt�ry ciebie NIE zna�...
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //S�uchaj uwa�nie: Nie r�b g�upot!
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //B�d� uwa�a�...
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas nie chce podj�� decyzji o przyj�ciu mnie do Wodnego Kr�gu. Woli, �eby zaj�� si� tym Vatras."); 

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
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //W tych salach kryj� si� dawne tajemnice. Niesamowite tajemnice.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Te inskrypcje i freski wskazuj� na bardzo star� cywilizacj�.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Wszystko, co widzisz, napisano w nieznanym j�zyku.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Pr�bujemy zrozumie� ten j�zyk.
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

	description	 = 	"A co z tymi dziwnymi trz�sieniami ziemi?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //A co z tymi dziwnymi trz�sieniami ziemi?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //To tajemnica, kt�r� staram si� rozwi�za�.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //Gdzie� za tymi g�rami zosta�a zaburzona struktura magii.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //Najwyra�niej kto� ze wszystkich si� pr�buje rozproszy� jakie� pot�ne zakl�cie.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Obawiam si�, �e nied�ugo trz�sienia ziemi b�d� odczuwalne na ca�ej wyspie.
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

	description	 = 	"Dlaczego ten ornament jest taki wa�ny?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //Dlaczego ten ornament jest taki wa�ny?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //To klucz do portalu.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //Nie powiem ci o tym nic wi�cej.
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

	description	 = 	"Teraz nale�� do Wodnego Kr�gu.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Teraz nale�� do Wodnego Kr�gu.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC tr�gt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese R�stung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Widz�, �e nosisz zbroj� naszego bractwa.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Widz�, �e masz na palcu nasz tajemny, wyj�tkowy znak. Pier�cie� z akwamarynem.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //Widz� te� po twoich oczach, �e m�wisz prawd�.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //Dobrze. Pozwol� ci wst�pi� w nasze szeregi.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Pami�taj, �e wi��e si� to z wielk� odpowiedzialno�ci�.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //I mam nadziej�, �e oka�esz si� godny.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas przyj�� mnie do Wodnego Kr�gu."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //A sk�d masz wiedzie�, �e jeste� jednym z nas?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //Pier�cie� z akwamarynem noszony przez ciebie nale�y do Laresa. Rozpoznaj� go.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Chcesz mnie oszuka�? W sumie nie oczekiwa�em niczego innego.
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

	description	 = 	"Daj mi pier�cie�. Otworz� portal.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Daj mi pier�cie�. Otworz� portal.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //Dobrze! Jako nowy cz�onek naszego bractwa zas�ugujesz na ten honor.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Ale ca�y czas czekam na wiadomo�� od Vatrasa. Wyruszymy, gdy j� otrzymam.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //MAM dla ciebie wiadomo�� od Vatrasa.
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //Hmm. I oczywi�cie nie mog�e� si� powstrzyma� przed jej otwarciem, prawda?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //C�, eee...
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //Dla twojego dobra... obym nie po�a�owa�, �e ci zaufa�em.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //Bardzo interesuj�ce.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //We� ten pier�cie�. Spotkamy si� przy portalu. B�d� tam na ciebie czeka�.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Je�li Nefarius ma racj�, portal otworzy si�, kiedy tylko umie�cisz tam pier�cie�.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas da� mi zdobiony pier�cie�. Chce, �ebym go wsadzi� w mechanizm portalu i przeszed� na drug� stron�."); 

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
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Dop�ki Vatras nie da mi znaku, �e mog� ci zaufa�, pier�cie� b�dzie u mnie.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas nie da mi zdobionego pier�cienia, dop�ki nie otrzyma znaku od Vatrasa, �e jestem godny zaufania."); 
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

	description	 = 	"Mo�esz nauczy� mnie czego� o magii?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //Mo�esz nauczy� mnie czego� o magii?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //Aby� jeszcze bardziej naruszy� jej struktur�?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //Nie. Nie mam czasu na takie zabawy.
};
