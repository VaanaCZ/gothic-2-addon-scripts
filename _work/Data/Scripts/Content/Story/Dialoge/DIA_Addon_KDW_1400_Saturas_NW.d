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
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Kdy u tì nic neodradí, abys ostatní mágy rušil od práce, mùeš jednomu z nich ode mì nìco vzkázat.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Vyøiï Riordianovi, e bych ho tu rád vidìl.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Najdeš ho v zadní èásti krypty.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas chce, abych za ním poslal vodního mága Riordiana. Mìl by bıt na místì vykopávek, nìkde vzadu v hrobce."); 
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
 
 	description	 = 	"Mám najít ztracené èásti Nefariova ornamentu.";
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
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //Mám najít ztracené èásti ornamentu pro Nefaria.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //Coe? To je neuvìøitelné! To jsi zase ty?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //ádnı strach, pøinesu sem ty vìci.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //(povzdech) Víš alespoò, co máš hledat?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius mi dal tuhle mapu.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //Uka mi ji!
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmm, v tom velkém hvozdì je to velmi nebezpeèné. Nemìl bys tam chodit sám.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //V Khorinidu se poohlédni po nìkom, kdo tì doprovodí.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //Nechci, aby tì seraly nìjaké nestvùry – a s tebou i ten ornament.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Tady máš tu mapu.

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas mì nabádal, abych zlomky ornamentu v lese nehledal sám. Mìl bych zajít do Khorinidu a poohlédnout se po nìkom, kdo by mì doprovodil."); 
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
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //Zbláznil ses? Bì odsud.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Tyhle hrobky jsou pro samozvané dobrodruhy pøíliš nebezpeèné.
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //(otrávenì) Poslyš, neznáme my se? Samozøejmì! Ty hajzle!
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //(otrávenì) Nemysli si, e jsem ti zapomnìl, jak jsi nás tenkrát v Novém táboøe podrazil.

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "(rozpaèitì) Já...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //(otrávenì) Vyèerpal jsi magickou moc z celé hory rudy a pak ses prostì vypaøil.
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //(otrávenì) Co sis vùbec myslel, e dìláš?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Je mi to moc líto. Nevìdìl jsem, co dìlám.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Stejnì by vám to nevyšlo.", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Bylo to nutné. Nemohl jsem jinak.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //Jinak to nešlo. Bez síly rudy bych nikdy Spáèe neporazil.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //(rozzuøenì) Co to blábolíš? Spáè a poraenı?
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Váš plán by stejnì nefungoval. Odpálení bariéry pomocí haldy rudy je nejvìtší pitomost, jakou jsem kdy slyšel.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Nakonec byste do vzduchu vyhodili sami sebe.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //(rozzuøenì) To u je vrchol! Kdo ti dal právo soudit nás a naše úmysly?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Kdybych nebyl tak mírumilovnı, seslal bych na tebe Adanùv hnìv, chlapèe.
	DIA_Addon_Saturas_Hallo_weißtdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Je mi to líto. Nevìdìl jsem, co dìlám.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //Vánì? A to si myslíš, e tì omlouvá?
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
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //Nemám tušení. Øíkal jsem si, e se jen tak zastavím.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Jen mì pøipravuješ o èas. Zmiz odsud.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //(k sobì) Vyøídím si to s tebou pozdìji.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Koneènì jsem našel vodní mágy. Nejdøív bych mìl zjistit, co tady ve skuteènosti dìlají. Saturas, kterı stále nemùe zapomenout na události z trestanecké kolonie, mi to zjevnì neøekne."); 

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
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Ztra se, ne se ti nìco stane.
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

	description	 = 	"Pøišel jsem sem s Laresem.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //Pøišel jsem sem s Laresem.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //(znepokojenì) S Laresem? vánì? Kde je?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Jsem tu sám, Lares se vrátil do mìsta.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //Coe? A to tì k nám poslal samotného? Co si vùbec myslí?
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

	description	 = 	"Pøinesl jsem ti ten ornament.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Pøinesl jsem ti ten ornament.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //Co to má pro všecko na svìtì znamenat? 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //Kdo ti to dal? Neøíkej mi, e to na tebe Lares jen tak pøehrál.
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Nech tìch øeèí – tady to máš. Chceš to, ne?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Samozøejmì. Ale znervózòuje mì, e ses do hry vloil zrovna TY.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //Proè s tou starou historií s horou rudy tolik nadìláš?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Vdy jsem ti to u vynahradil. A nemùeš øíct, e jsem byl nespolehlivı.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //(povzdech) A co mi to nakonec pøineslo? Pche, nemysli si, e bych ti snad vìøil.
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

	description	 = 	"Chtìl bych vstoupit do kruhu vody.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Chci se pøidat ke kruhu vody.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //(vztekle) COE? Jak o nìm mùeš vìdìt? Kdo...? Ten LARES! Já ho zabiju!
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Porušil nejdùleitìjší pravidlo – s nikım o kruhu vody nemluvit.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //(úplnì perplex) Nevím, co bych mìl øíct. Vìøím ti, jen dokud tì mùu mít na oèích.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //O vašem kruhu mi ale povìdìl Vatras.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //(rezignovanì) Coe? Vatras? (sarkasticky) No to je úasné! Jedinı z vodních mágù na ostrovì, kterı tì nezná, a ty na nìj zrovna natrefíš.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //Varuju tì, tentokrát nedìlej ádné hlouposti.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //(sarkasticky) Pokusím se.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas mì do kruhu vody nemùe pøijmout. Rozhodnutí musí nechat na Vatrasovi."); 

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

	description	 = 	"Co tady dìláš?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //Co tu dìláš?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //(uctivì) V tìchto síních jsou skryta pradávná tajemství. Záhadná tajemství.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Nápisy na stìnách poukazují na velmi starou kulturu.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Všechno, co tu vidíš, je psáno v jazyce, kterı vùbec neznáme.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Teprve mu zaèínáme rozumìt a chápat, co znamená.
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

	description	 = 	"Co je to za divná zemìtøesení?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //Co je to za podivná zemìtøesení?
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //To je jedna z hádanek, kterou se snaím vyøešit.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //Kdesi za tìmito horami je nìjak narušena magická struktura.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //Nìkdo se evidentnì ze všech sil snaí zlomit velice mocné kouzlo.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Obávám se, e zanedlouho tahle zemìtøesení postihnou celı ostrov.
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

	description	 = 	"Proè je pro tebe ten ornament tak dùleitı?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //Proè je pro tebe ten ornament tak dùleitı?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //(otrávenì) Je to klíè k portálu.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //Víc ti neøeknu.
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

	description	 = 	"Nyní patøím ke kruhu vody.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Teï u patøím ke kruhu vody.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC trägt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese Rüstung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Jak vidím, nosíš zbroj našich dìtí.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Jak vidím, nosíš naše tajné poznávací znamení – akvamarínovı prsten.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //A tvé oèi mi napovídají, e mluvíš pravdu.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //(mumlá si) No dobøe, pøijímám tì do našich øad.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Ale nezapomeò, e to znamená i obrovskou zodpovìdnost.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //A ve tvém vlastním zájmu doufám, e budeš jednat èestnì.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas akceptoval, e jsem vstoupil do kruhu vody."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //A jak ti mám øíct, e jsi teï jedním z nás?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //Ten akvamarínovı prsten, co nosíš, patøí Laresovi – já to poznám.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Snaíš se mì obelstít, co? Nic jiného jsem ani neèekal.
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

	description	 = 	"Dej mi prsten, otevøu ten portál.";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Dej mi ten prsten, a mùu otevøít portál.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //(potutelnì) Dobøe! Jako naše nové dítko bys mìl vánì mít tu èest.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Já ale stále èekám na zprávu od Vatrase. Dokud ji nedostanu, nemohu jít.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //Já pro tebe zprávu od Vatrase MÁM:
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //(otrávenì) Chápu. A samozøejmì jsi to nevydrel a musel jsi ji otevøít, co?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //No, já...
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //(hrozivì) Ve tvém vlastním zájmu doufám, e nezklameš tu velice chabou dùvìru, kterou k tobì chovám.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //(pøekvapenì) Velice zajímavé. Dobøe.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //Tumáš, vezmi si prsten. Sejdeme se u portálu – poèkám na tebe.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Pokud má Nefarius pravdu, portál se otevøe, jakmile do nìj vloíš prsten.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas mi dal zdobenı prsten. Ten staèí vloit do mechanismu portálu a mùu projít na druhou stranu."); 

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
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Vzhledem k tomu, e mi Vatras nijak nenaznaèil, e by se ti dalo vìøit, nechám si ten prsten sám.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas mi prsten nedá, dokud mu nepøinesu znamení od Vatrase, e se mi dá vìøit."); 
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

	description	 = 	"Mùeš mì nauèit nìjaké magii?";
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
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //Mùeš mì nauèit nìco z oboru magie?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //Aby sis zase zahrával se samotnou její podstatou?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //Ne. Na takové hrátky nemám èas.
};
