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
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Poniewa¿ nie s¹dzê, ¿eby uda³o ci siê odci¹gn¹æ innych magów od pracy, mo¿esz zanieœæ jednemu z nich wiadomoœæ ode mnie.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Powiedz Riordianowi, ¿e chcê z nim porozmawiaæ.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Przebywa w g³êbi krypty.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas chce, ¿ebym przys³a³ do niego Maga Wody, Riordiana. Znajdê go gdzieœ g³êboko w tunelach wykopalisk."); 
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
 
 	description	 = 	"Mam znaleŸæ zaginione czêœci ornamentu dla Nefariusa.";
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
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //Mam znaleŸæ zaginione czêœci ornamentu dla Nefariusa.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //Co? Niemo¿liwe! Te¿ siê w to wpl¹ta³eœ?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //Nie obawiaj siê. Znajdê je i przyniosê tutaj.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //Wiesz przynajmniej, gdzie masz szukaæ?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius da³ mi mapê...
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //Poka¿ mi j¹!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmmm. W wielkim lesie jest bardzo niebezpiecznie. Nie powinieneœ iœæ tam sam.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //Poszukaj w Khorinis kogoœ, kto bêdzie ci towarzyszyæ.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //Nie chcê, ¿eby po¿ar³y ciê potwory – a razem z tob¹ ornament.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Oddajê ci twoj¹ mapê...

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas uwa¿a, ¿e nie powinienem samotnie chodziæ po lesie, szukaj¹c fragmentów. Mam udaæ siê do Khorinis i znaleŸæ kogoœ, kto bêdzie mi towarzyszyæ."); 
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
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_00"); //Wiesz, co uczyni³eœ?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_01"); //Wprowadzi³eœ taki chaos w strukturze magii, ¿e bêdzie to s³ychaæ a¿ w Khorinis.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_02"); //Podziêkuj swoim gwiazdom za to, ¿e bariera przesta³a istnieæ.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_weißtdu_15_03"); //Dlaczego w takim razie narzekasz? Wszystko posz³o dobrze.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_04"); //Milcz!
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_05"); //Czego chcesz, u licha?
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //Zwariowa³eœ? OdejdŸ st¹d.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Krypty s¹ zbyt niebezpieczne dla niedzielnych poszukiwaczy przygód.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //Ale czy my siê aby nie znamy? Oczywiœcie. Ty sukinsynu...
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //Nie myœl, ¿e zapomnieliœmy, jak zdradzi³eœ nas w Nowym Obozie.

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Ja...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //Œci¹gn¹³eœ ca³¹ energiê magiczn¹ z naszych z³ó¿ rudy i po prostu znikn¹³eœ!
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //Dlaczego to zrobi³eœ?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Przepraszam. Nie wiedzia³em, co czyniê.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Wasz plan i tak by siê nie powiód³. ", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Musia³em. Bez tej energii nie zdo³a³bym pokonaæ Œni¹cego.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Musia³em. Bez tej energii nie zdo³a³bym pokonaæ Œni¹cego.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //O czym ty mówisz? Œni¹cy? Pokonaæ?
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Wasz plan i tak by siê nie powiód³. Wysadzanie bariery za pomoc¹ rudy to najwiêksza bzdura, o jakiej s³ysza³em.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Prêdzej sami wysadzilibyœcie siê w powietrze.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //No nie! Kto da³ ci prawo oceniaæ nas i nasze intencje?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Gdybym nie by³ cz³owiekiem mi³uj¹cym pokój, sprowadzi³bym na ciebie gniew Adanosa.
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Przepraszam. Nie wiedzia³em, co czyniê.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //Naprawdê? I myœlisz, ¿e ju¿ wszystko jest w porz¹dku?
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

	description	 = 	"Nie mam pojêcia.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //Nie mam pojêcia. Myœla³em, ¿e po prostu siê tu pojawiê.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Marnujesz mój czas. OdejdŸ.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //PóŸniej siê tob¹ zajmê.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Znalaz³em Magów Wody. Najpierw muszê siê dowiedzieæ, co oni tu w³aœciwie robi¹. Saturas nie chcia³ mi powiedzieæ. Nadal jest trochê spiêty z powodu tej starej sprawy z kolonii karnej."); 

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
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Lepiej szybko st¹d odejdŸ, zanim coœ ci siê stanie.
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

	description	 = 	"Przyby³em tu z Laresem.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //Przyby³em tu z Laresem.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //Z Laresem? Naprawdê? A gdzie on jest?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Zostawi³ mnie i wróci³ do miasta.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //Co? Przys³a³ ciê tutaj samego? O co mu chodzi?
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

	description	 = 	"Przynoszê twój ornament.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Przynoszê twój ornament.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //Jak to? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //Kto ci to da³? Nie dosta³eœ go chyba od Laresa?
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Spokojnie. Przynios³em go dla ciebie. Jesteœ zainteresowany?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Pewnie. Ale martwi mnie, ¿e maczasz w tym palce.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //Dlaczego tak siê przejmujesz t¹ star¹ histori¹?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Pracowa³em dla ciebie ostatnim razem. Przecie¿ mog³eœ wtedy na mnie liczyæ.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //I co z tego mia³em? Hê, nie myœl, ¿e ci ufam...
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

	description	 = 	"Chcê wst¹piæ do Wodnego Krêgu.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Chcê wst¹piæ do Wodnego Krêgu.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //CO? Sk¹d siê o tym dowiedzia³eœ? Kto...? LARES... Zabijê go!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Z³ama³ nasze zasady. Nikt nie mo¿e mówiæ o Wodnym Krêgu.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //Brakuje mi s³ów. Mogê ci zaufaæ tylko wtedy, kiedy bêdê mia³ na ciebie oko.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //Vatras powiedzia³ mi o pierœcieniu.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //Co? Vatras? Œwietnie! Ze wszystkich Magów Wody spotka³eœ jedynego, który ciebie NIE zna³...
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //S³uchaj uwa¿nie: Nie rób g³upot!
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //Bêdê uwa¿aæ...
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas nie chce podj¹æ decyzji o przyjêciu mnie do Wodnego Krêgu. Woli, ¿eby zaj¹³ siê tym Vatras."); 

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
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //W tych salach kryj¹ siê dawne tajemnice. Niesamowite tajemnice.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Te inskrypcje i freski wskazuj¹ na bardzo star¹ cywilizacjê.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Wszystko, co widzisz, napisano w nieznanym jêzyku.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Próbujemy zrozumieæ ten jêzyk.
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

	description	 = 	"A co z tymi dziwnymi trzêsieniami ziemi?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //A co z tymi dziwnymi trzêsieniami ziemi?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //To tajemnica, któr¹ staram siê rozwi¹zaæ.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //Gdzieœ za tymi górami zosta³a zaburzona struktura magii.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //NajwyraŸniej ktoœ ze wszystkich si³ próbuje rozproszyæ jakieœ potê¿ne zaklêcie.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Obawiam siê, ¿e nied³ugo trzêsienia ziemi bêd¹ odczuwalne na ca³ej wyspie.
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

	description	 = 	"Dlaczego ten ornament jest taki wa¿ny?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //Dlaczego ten ornament jest taki wa¿ny?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //To klucz do portalu.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //Nie powiem ci o tym nic wiêcej.
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

	description	 = 	"Teraz nale¿ê do Wodnego Krêgu.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Teraz nale¿ê do Wodnego Krêgu.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC trägt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese Rüstung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Widzê, ¿e nosisz zbrojê naszego bractwa.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Widzê, ¿e masz na palcu nasz tajemny, wyj¹tkowy znak. Pierœcieñ z akwamarynem.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //Widzê te¿ po twoich oczach, ¿e mówisz prawdê.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //Dobrze. Pozwolê ci wst¹piæ w nasze szeregi.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Pamiêtaj, ¿e wi¹¿e siê to z wielk¹ odpowiedzialnoœci¹.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //I mam nadziejê, ¿e oka¿esz siê godny.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas przyj¹³ mnie do Wodnego Krêgu."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //A sk¹d masz wiedzieæ, ¿e jesteœ jednym z nas?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //Pierœcieñ z akwamarynem noszony przez ciebie nale¿y do Laresa. Rozpoznajê go.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Chcesz mnie oszukaæ? W sumie nie oczekiwa³em niczego innego.
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

	description	 = 	"Daj mi pierœcieñ. Otworzê portal.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Daj mi pierœcieñ. Otworzê portal.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //Dobrze! Jako nowy cz³onek naszego bractwa zas³ugujesz na ten honor.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Ale ca³y czas czekam na wiadomoœæ od Vatrasa. Wyruszymy, gdy j¹ otrzymam.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //MAM dla ciebie wiadomoœæ od Vatrasa.
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //Hmm. I oczywiœcie nie mog³eœ siê powstrzymaæ przed jej otwarciem, prawda?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //Có¿, eee...
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //Dla twojego dobra... obym nie po¿a³owa³, ¿e ci zaufa³em.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //Bardzo interesuj¹ce.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //WeŸ ten pierœcieñ. Spotkamy siê przy portalu. Bêdê tam na ciebie czekaæ.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Jeœli Nefarius ma racjê, portal otworzy siê, kiedy tylko umieœcisz tam pierœcieñ.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas da³ mi zdobiony pierœcieñ. Chce, ¿ebym go wsadzi³ w mechanizm portalu i przeszed³ na drug¹ stronê."); 

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
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Dopóki Vatras nie da mi znaku, ¿e mogê ci zaufaæ, pierœcieñ bêdzie u mnie.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas nie da mi zdobionego pierœcienia, dopóki nie otrzyma znaku od Vatrasa, ¿e jestem godny zaufania."); 
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

	description	 = 	"Mo¿esz nauczyæ mnie czegoœ o magii?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //Mo¿esz nauczyæ mnie czegoœ o magii?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //Abyœ jeszcze bardziej naruszy³ jej strukturê?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //Nie. Nie mam czasu na takie zabawy.
};
