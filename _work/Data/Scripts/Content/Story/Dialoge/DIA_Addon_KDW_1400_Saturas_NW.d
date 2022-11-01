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
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Když už tę nic neodradí, abys ostatní mágy rušil od práce, můžeš jednomu z nich ode mę nęco vzkázat.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Vyâië Riordianovi, že bych ho tu rád vidęl.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Najdeš ho v zadní části krypty.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas chce, abych za ním poslal vodního mága Riordiana. Męl by být na místę vykopávek, nękde vzadu v hrobce."); 
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
 
 	description	 = 	"Mám najít ztracené části Nefariova ornamentu.";
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
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //Mám najít ztracené části ornamentu pro Nefaria.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //Cože? To je neuvęâitelné! To jsi zase ty?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //Žádný strach, pâinesu sem ty vęci.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //(povzdech) Víš alespoŕ, co máš hledat?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius mi dal tuhle mapu.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //Ukaž mi ji!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmm, v tom velkém hvozdę je to velmi nebezpečné. Nemęl bys tam chodit sám.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //V Khorinidu se poohlédni po nękom, kdo tę doprovodí.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //Nechci, aby tę sežraly nęjaké nestvůry – a s tebou i ten ornament.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Tady máš tu mapu.

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas mę nabádal, abych zlomky ornamentu v lese nehledal sám. Męl bych zajít do Khorinidu a poohlédnout se po nękom, kdo by mę doprovodil."); 
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
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_00"); //
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_01"); //
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_02"); //
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_weißtdu_15_03"); //
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_04"); //
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_05"); //
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //Zbláznil ses? Bęž odsud.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Tyhle hrobky jsou pro samozvané dobrodruhy pâíliš nebezpečné.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //(otrávenę) Poslyš, neznáme my se? Samozâejmę! Ty hajzle!
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //(otrávenę) Nemysli si, že jsem ti zapomnęl, jak jsi nás tenkrát v Novém táboâe podrazil.

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "(rozpačitę) Já...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //(otrávenę) Vyčerpal jsi magickou moc z celé hory rudy a pak ses prostę vypaâil.
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //(otrávenę) Co sis vůbec myslel, že dęláš?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Je mi to moc líto. Nevędęl jsem, co dęlám.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Stejnę by vám to nevyšlo.", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Bylo to nutné. Nemohl jsem jinak.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Jinak to nešlo. Bez síly rudy bych nikdy Spáče neporazil.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //(rozzuâenę) Co to blábolíš? Spáč a poražený?
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Váš plán by stejnę nefungoval. Odpálení bariéry pomocí haldy rudy je nejvętší pitomost, jakou jsem kdy slyšel.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Nakonec byste do vzduchu vyhodili sami sebe.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //(rozzuâenę) To už je vrchol! Kdo ti dal právo soudit nás a naše úmysly?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Kdybych nebyl tak mírumilovný, seslal bych na tebe Adanův hnęv, chlapče.
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Je mi to líto. Nevędęl jsem, co dęlám.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //Vážnę? A to si myslíš, že tę omlouvá?
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

	description	 = 	"Tak o tom nemám ani šajna.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //Nemám tušení. Âíkal jsem si, že se jen tak zastavím.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Jen mę pâipravuješ o čas. Zmiz odsud.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //(k sobę) Vyâídím si to s tebou pozdęji.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Konečnę jsem našel vodní mágy. Nejdâív bych męl zjistit, co tady ve skutečnosti dęlají. Saturas, který stále nemůže zapomenout na události z trestanecké kolonie, mi to zjevnę neâekne."); 

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
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Ztraă se, než se ti nęco stane.
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

	description	 = 	"Pâišel jsem sem s Laresem.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //Pâišel jsem sem s Laresem.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //(znepokojenę) S Laresem? vážnę? Kde je?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Jsem tu sám, Lares se vrátil do męsta.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //Cože? A to tę k nám poslal samotného? Co si vůbec myslí?
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

	description	 = 	"Pâinesl jsem ti ten ornament.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Pâinesl jsem ti ten ornament.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //Co to má pro všecko na svętę znamenat? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //Kdo ti to dal? Neâíkej mi, že to na tebe Lares jen tak pâehrál.
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Nech tęch âečí – tady to máš. Chceš to, ne?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Samozâejmę. Ale znervózŕuje mę, že ses do hry vložil zrovna TY.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //Proč s tou starou historií s horou rudy tolik nadęláš?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Vždyă jsem ti to už vynahradil. A nemůžeš âíct, že jsem byl nespolehlivý.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //(povzdech) A co mi to nakonec pâineslo? Pche, nemysli si, že bych ti snad vęâil.
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

	description	 = 	"Chtęl bych vstoupit do kruhu vody.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Chci se pâidat ke kruhu vody.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //(vztekle) COŽE? Jak o nęm můžeš vędęt? Kdo...? Ten LARES! Já ho zabiju!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Porušil nejdůležitęjší pravidlo – s nikým o kruhu vody nemluvit.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //(úplnę perplex) Nevím, co bych męl âíct. Vęâím ti, jen dokud tę můžu mít na očích.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //O vašem kruhu mi ale povędęl Vatras.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //(rezignovanę) Cože? Vatras? (sarkasticky) No to je úžasné! Jediný z vodních mágů na ostrovę, který tę nezná, a ty na nęj zrovna natrefíš.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //Varuju tę, tentokrát nedęlej žádné hlouposti.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //(sarkasticky) Pokusím se.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas mę do kruhu vody nemůže pâijmout. Rozhodnutí musí nechat na Vatrasovi."); 

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

	description	 = 	"Co tady dęláš?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //Co tu dęláš?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //(uctivę) V tęchto síních jsou skryta pradávná tajemství. Záhadná tajemství.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Nápisy na stęnách poukazují na velmi starou kulturu.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Všechno, co tu vidíš, je psáno v jazyce, který vůbec neznáme.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Teprve mu začínáme rozumęt a chápat, co znamená.
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

	description	 = 	"Co je to za divná zemętâesení?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //Co je to za podivná zemętâesení?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //To je jedna z hádanek, kterou se snažím vyâešit.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //Kdesi za tęmito horami je nęjak narušena magická struktura.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //Nękdo se evidentnę ze všech sil snaží zlomit velice mocné kouzlo.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Obávám se, že zanedlouho tahle zemętâesení postihnou celý ostrov.
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

	description	 = 	"Proč je pro tebe ten ornament tak důležitý?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //Proč je pro tebe ten ornament tak důležitý?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //(otrávenę) Je to klíč k portálu.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //Víc ti neâeknu.
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

	description	 = 	"Nyní patâím ke kruhu vody.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Teë už patâím ke kruhu vody.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC trägt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese Rüstung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Jak vidím, nosíš zbroj našich dętí.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Jak vidím, nosíš naše tajné poznávací znamení – akvamarínový prsten.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //A tvé oči mi napovídají, že mluvíš pravdu.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //(mumlá si) No dobâe, pâijímám tę do našich âad.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Ale nezapomeŕ, že to znamená i obrovskou zodpovędnost.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //A ve tvém vlastním zájmu doufám, že budeš jednat čestnę.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas akceptoval, že jsem vstoupil do kruhu vody."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //A jak ti mám âíct, že jsi teë jedním z nás?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //Ten akvamarínový prsten, co nosíš, patâí Laresovi – já to poznám.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Snažíš se mę obelstít, co? Nic jiného jsem ani nečekal.
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

	description	 = 	"Dej mi prsten, otevâu ten portál.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Dej mi ten prsten, aă můžu otevâít portál.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //(potutelnę) Dobâe! Jako naše nové dítko bys męl vážnę mít tu čest.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Já ale stále čekám na zprávu od Vatrase. Dokud ji nedostanu, nemohu jít.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //Já pro tebe zprávu od Vatrase MÁM:
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //(otrávenę) Chápu. A samozâejmę jsi to nevydržel a musel jsi ji otevâít, co?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //No, já...
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //(hrozivę) Ve tvém vlastním zájmu doufám, že nezklameš tu velice chabou důvęru, kterou k tobę chovám.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //(pâekvapenę) Velice zajímavé. Dobâe.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //Tumáš, vezmi si prsten. Sejdeme se u portálu – počkám na tebe.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Pokud má Nefarius pravdu, portál se otevâe, jakmile do nęj vložíš prsten.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas mi dal zdobený prsten. Ten stačí vložit do mechanismu portálu a můžu projít na druhou stranu."); 

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
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Vzhledem k tomu, že mi Vatras nijak nenaznačil, že by se ti dalo vęâit, nechám si ten prsten sám.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas mi prsten nedá, dokud mu nepâinesu znamení od Vatrase, že se mi dá vęâit."); 
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

	description	 = 	"Můžeš mę naučit nęjaké magii?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //Můžeš mę naučit nęco z oboru magie?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //Aby sis zase zahrával se samotnou její podstatou?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //Ne. Na takové hrátky nemám čas.
};
