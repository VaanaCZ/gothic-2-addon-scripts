// *******************************************************************
// Startup und Init Funktionen der Level-zen-files
// -----------------------------------------------
// Die STARTUP-Funktionen werden NUR beim ersten Betreten eines Levels 
// (nach NewGame) aufgerufen, die INIT-Funktionen jedesmal
// Die Funktionen müssen so heissen wie die zen-files
// *******************************************************************

// *********
// GLOBAL
// *********

func void STARTUP_GLOBAL()
{
	// wird fuer jede Welt aufgerufen (vor STARTUP_<LevelName>)
	Game_InitGerman();
};

func void INIT_GLOBAL()
{
	// wird fuer jede Welt aufgerufen (vor INIT_<LevelName>)
	Game_InitGerman();
};


// *********
// Testlevel
// *********


func void STARTUP_Testlevel ()
{

};

	func void INIT_SUB_Testlevel ()
	{
	};

func void INIT_Testlevel ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_Testlevel();
};

//------------------------------------------------------------
//		Addon World ADANOSTEMPEL
//------------------------------------------------------------
func void STARTUP_ADDON_PART_ADANOSTEMPLE_01 ()
{
	Wld_InsertNpc (BDT_1090_Addon_Raven,"ADW_ADANOSTEMPEL_RAVEN_11");

	Wld_InsertNpc (BDT_10400_Addon_DeadBandit,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
	Wld_InsertNpc (BDT_10401_Addon_DeadBandit,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_02");

	Wld_InsertNpc (Stoneguardian_ADANOSTEMPELENTRANCE_01,"ADW_ADANOSTEMPEL_ENTRANCE_17");
	//Wld_InsertNpc (Stoneguardian_ADANOSTEMPELENTRANCE_02,"ADW_ADANOSTEMPEL_ENTRANCE_18M");
	Wld_InsertNpc (Stoneguardian_ADANOSTEMPELENTRANCE_03,"ADW_ADANOSTEMPEL_ENTRANCE_20");
	Wld_InsertNpc (Stoneguardian_ADANOSTEMPELENTRANCE_04,"ADW_ADANOSTEMPEL_ENTRANCE_13");

	Wld_InsertNpc (Stoneguardian_TREASUREPITS_05A,"ADW_ADANOSTEMPEL_TREASUREPITS_05A");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_05B,"ADW_ADANOSTEMPEL_TREASUREPITS_05B");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_05C,"ADW_ADANOSTEMPEL_TREASUREPITS_05C");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_05D,"ADW_ADANOSTEMPEL_TREASUREPITS_05D");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_05E,"ADW_ADANOSTEMPEL_TREASUREPITS_05E");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_05F,"ADW_ADANOSTEMPEL_TREASUREPITS_05F");

	Wld_InsertNpc (Giant_Rat,"ADW_ADANOSTEMPEL_TREASUREPITS_07A");
	Wld_InsertNpc (Giant_Rat,"ADW_ADANOSTEMPEL_TREASUREPITS_07B");
	
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_09A,"ADW_ADANOSTEMPEL_TREASUREPITS_09A");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_09B,"ADW_ADANOSTEMPEL_TREASUREPITS_09B");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_09C,"ADW_ADANOSTEMPEL_TREASUREPITS_09C");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_09D,"ADW_ADANOSTEMPEL_TREASUREPITS_09D");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_09E,"ADW_ADANOSTEMPEL_TREASUREPITS_09E");
	Wld_InsertNpc (Stoneguardian_TREASUREPITS_09F,"ADW_ADANOSTEMPEL_TREASUREPITS_09F");


	Wld_InsertNpc (Stoneguardian_RHADEMES_14A,"ADW_ADANOSTEMPEL_RHADEMES_14A");
	Wld_InsertNpc (Stoneguardian_RHADEMES_14B,"ADW_ADANOSTEMPEL_RHADEMES_14B");
	Wld_InsertNpc (Stoneguardian_RHADEMES_14C,"ADW_ADANOSTEMPEL_RHADEMES_14C");
	Wld_InsertNpc (Stoneguardian_RHADEMES_14D,"ADW_ADANOSTEMPEL_RHADEMES_14D");
	Wld_InsertNpc (Stoneguardian_RHADEMES_14E,"ADW_ADANOSTEMPEL_RHADEMES_14E");
	Wld_InsertNpc (Stoneguardian_RHADEMES_14F,"ADW_ADANOSTEMPEL_RHADEMES_14F");

	Wld_InsertNpc (NONE_ADDON_112_Rhademes,"ADW_ADANOSTEMPEL_RHADEMES");
};

func void INIT_SUB_ADDON_PART_ADANOSTEMPLE_01 ()
{
	
};

func void INIT_ADDON_PART_ADANOSTEMPLE_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	CurrentLevel = ADDONWORLD_ZEN;	 

	INIT_SUB_ADDON_PART_ADANOSTEMPLE_01();
};

//------------------------------------------------------------
//		Addon World GOLDMINE
//------------------------------------------------------------
func void STARTUP_ADDON_PART_GOLDMINE_01 ()
{
	//----------------------Humans----------------------------
	Wld_InsertNpc 	(STRF_1118_Addon_Patrick, 	"ADDON_GOLDMINE");
	Wld_InsertNpc 	(STRF_1119_Addon_Monty, 	"ADDON_GOLDMINE");
	Wld_InsertNpc 	(STRF_1120_Addon_Tonak, 	"ADDON_GOLDMINE");
	Wld_InsertNpc 	(STRF_1121_Addon_Telbor, 	"ADDON_GOLDMINE");
	Wld_InsertNpc 	(STRF_1122_Addon_Pardos, 	"ADDON_GOLDMINE");
	
	Wld_InsertNpc 	(BDT_1095_Addon_Crimson, 	"ADDON_GOLDMINE");
	
	
	Wld_InsertNpc   (BDT_10023_Addon_Wache,		"ADDON_GOLDMINE");
	Wld_InsertNpc   (BDT_10024_Addon_Garaz,		"ADDON_GOLDMINE");
	
	//----------------tote Sklaven--------------------
	Wld_InsertNpc	(STRF_1131_Addon_Sklave, "ADW_MINE_SKLAVENTOD_01");
	Wld_InsertNpc	(STRF_1132_Addon_Sklave, "ADW_MINE_SKLAVENTOD_01");
	Wld_InsertNpc	(STRF_1133_Addon_Sklave, "ADW_MINE_SKLAVENTOD_01");
	Wld_InsertNpc	(STRF_1134_Addon_Sklave, "ADW_MINE_SKLAVENTOD_01");
	Wld_InsertNpc	(STRF_1135_Addon_Sklave, "ADW_MINE_SKLAVENTOD_01");
	
	//----------------Plus Buddler, Wachen, Sklaven--------------------
	Wld_InsertNpc	(STRF_1128_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1129_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1130_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1136_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1137_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1138_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1139_Addon_Sklave, "ADDON_GOLDMINE");
	Wld_InsertNpc	(STRF_1140_Addon_Sklave, "ADDON_GOLDMINE");
	
	Wld_InsertNpc	(BDT_10025_Addon_Wache, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10026_Addon_Wache, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10027_Addon_Buddler, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10028_Addon_Buddler, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10029_Addon_Buddler, "ADDON_GOLDMINE");
	Wld_InsertNpc	(BDT_10030_Addon_Buddler, "ADDON_GOLDMINE");
	
		
		
	//------------ Monster ANZAHL (10) WICHTIG für Garaz (FIXME_FILLER) ----------------------------
	Wld_InsertNpc 	(GoldMinecrawler, 	"ADW_MINE_MC_04");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_04");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_03");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_03");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_08");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_08");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_07");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_07");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_02");
	Wld_InsertNpc 	(GoldMinecrawler, 			"ADW_MINE_MC_02");

	Wld_InsertNpc 	(Meatbug, 			"ADW_MINE_LAGER_08");
	Wld_InsertNpc 	(Meatbug, 			"ADW_MINE_LAGER_09");
	Wld_InsertNpc 	(Meatbug, 			"ADW_MINE_LAGER_05");
	Wld_InsertNpc 	(Meatbug, 			"ADW_MINE_LAGER_SIDE_04");
	
	Wld_InsertNpc 	(Stoneguardian_MineDead1, 	"ADW_GRUFT_01");
	Wld_InsertNpc 	(Stoneguardian_MineDead2, 	"ADW_GRUFT_02");
	Wld_InsertNpc 	(Stoneguardian_MineDead3, 	"ADW_MINE_TO_GRUFT_05");
	Wld_InsertNpc 	(Stoneguardian_MineDead4, 	"ADW_MINE_TO_GRUFT_06");
	
	
	
	
	

};

func void INIT_SUB_ADDON_PART_GOLDMINE_01 ()
{
	
};

func void INIT_ADDON_PART_GOLDMINE_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_GOLDMINE_01();
};

//------------------------------------------------------------
//		Addon World CANYON
//------------------------------------------------------------
func void STARTUP_ADDON_PART_CANYON_01 ()
{
	//----------------------freies Land------------------------

	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_09");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_TELEPORT_PATH_03");
	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_TELEPORT_PATH_03");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_TELEPORT_PATH_04");

	Wld_InsertNpc 	(CanyonRazor01, 	"ADW_CANYON_MINE1_01");
	

	Wld_InsertNpc 	(CanyonRazor02, 	"ADW_CANYON_PATH_TO_LIBRARY_07A");
	Wld_InsertNpc 	(CanyonRazor03, 	"ADW_CANYON_PATH_TO_LIBRARY_07A");
	

	Wld_InsertNpc 	(CanyonRazor04, 	"ADW_CANYON_PATH_TO_LIBRARY_36");
	Wld_InsertNpc 	(CanyonRazor05, 	"ADW_CANYON_PATH_TO_LIBRARY_36");
	

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_LIBRARY_40");
	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_LIBRARY_40");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_LIBRARY_03");

	Wld_InsertNpc 	(Bloodhound, 	"ADW_CANYON_PATH_TO_BANDITS_31");

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_BANDITS_52");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_BANDITS_52");

	Wld_InsertNpc 	(CanyonRazor06, 	"ADW_CANYON_PATH_TO_MINE2_04");
	

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_31A");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_31A");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_31A");

	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_PATH_TO_BANDITS_55");
	Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_PATH_TO_BANDITS_55");

	Wld_InsertNpc 	(Shadowbeast_Addon_Fire, 	"ADW_CANYON_PATH_TO_BANDITS_06E");

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_16A");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_16A");
	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_16A");

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_PATH_TO_LIBRARY_17");

	Wld_InsertNpc 	(orcbiter, 	"ADW_CANYON_ORCS_09");


	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_37");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_37");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_12A");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_12A");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_12A");
	Wld_InsertNpc 	(Wolf, 	"ADW_CANYON_PATH_TO_LIBRARY_12A");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_08");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_08");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_14");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_14");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_19");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_20");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_PATH_TO_LIBRARY_20");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_04");

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_05");
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"ADW_CANYON_ORCS_05");

	Wld_InsertNpc 	(OrcWarrior_Rest, 	"ADW_CANYON_ORCS_02");
	Wld_InsertNpc 	(OrcShaman_Sit_CanyonLibraryKey, 	"ADW_CANYON_ORCS_02");
	Wld_InsertNpc 	(OrcShaman_Sit, 	"ADW_CANYON_ORCS_02");

	Wld_InsertNpc 	(Bloodhound, 	"ADW_CANYON_PATH_TO_MINE2_09");
	Wld_InsertNpc 	(Bloodhound, 	"ADW_CANYON_PATH_TO_MINE2_09");

	Wld_InsertNpc 	(Bloodhound, 	"ADW_CANYON_PATH_TO_MINE2_06");
	

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_26");
	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_26");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_24");

	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_66");
	Wld_InsertNpc 	(Giant_DesertRat, 	"ADW_CANYON_PATH_TO_BANDITS_66");
	
	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_22");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_PATH_TO_BANDITS_22");

	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_21");

	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_17");
	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_17");
	
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_PATH_TO_BANDITS_14");
	Wld_InsertNpc 	(Minecrawler, 	"ADW_CANYON_PATH_TO_BANDITS_14");
	
	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_62");
	Wld_InsertNpc 	(Minecrawler, 			"ADW_CANYON_PATH_TO_BANDITS_19");
	
	Wld_InsertNpc 	(Blattcrawler, 			"ADW_CANYON_PATH_TO_BANDITS_06");

	Wld_InsertNpc 	(Blattcrawler, 			"ADW_CANYON_PATH_TO_BANDITS_09");

	//Höhle 
	Wld_InsertItem (ItRi_Addon_Health_02,"FP_ITEM_CANYON_02"); 
	
	//hintere Mine
	Wld_InsertItem (ItRi_Addon_MANA_01,"FP_ITEM_CANYON_09");
	
	//----------------------Library----------------------------
	Wld_InsertNpc 	(Shadowbeast_Addon_Fire_CanyonLib, 	"ADW_CANYON_LIBRARY_04");
	Wld_InsertNpc 	(Shadowbeast_Addon_Fire, 	"ADW_CANYON_LIBRARY_LEFT_08");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_LEFT_07");
	Wld_InsertNpc 	(Shadowbeast_Addon_Fire, 	"ADW_CANYON_LIBRARY_RIGHT_07");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_RIGHT_13");

	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_01");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_02");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_03");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_04");
	Wld_InsertNpc 	(Stoneguardian, 	"ADW_CANYON_LIBRARY_STONIE_05");
	Wld_InsertItem  (ItMi_Addon_Stone_05,"ADW_ITEM_CANYON_TOKEN_01"); 
	
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_MINE1_13");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_MINE2_09");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"ADW_CANYON_MINE2_09");

	Wld_InsertNpc 	(Minecrawler, 	"ADW_CANYON_MINE1_10");
	Wld_InsertNpc 	(Minecrawler, 	"ADW_CANYON_MINE1_05");

	Wld_InsertItem  (ItMi_Zeitspalt_Addon,"FP_ITEM_CANYON_UNIQUE");  
	
};
func void INIT_SUB_ADDON_PART_CANYON_01 ()
{

};
func void INIT_ADDON_PART_CANYON_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_CANYON_01();
};
//------------------------------------------------------------
//		Addon World ENTRANCE
//------------------------------------------------------------
func void STARTUP_ADDON_PART_ENTRANCE_01 ()
{
	Wld_InsertNpc (KDW_14000_Addon_Saturas_ADW   ,"ADW_ENTRANCE");
	Wld_InsertNpc (KDW_14010_Addon_Cronos_ADW    ,"ADW_ENTRANCE");
	Wld_InsertNpc (KDW_14020_Addon_Nefarius_ADW  ,"ADW_ENTRANCE");
	Wld_InsertNpc (KDW_14030_Addon_Myxir_ADW     ,"ADW_ENTRANCE");
	Wld_InsertNpc (KDW_14040_Addon_Riordian_ADW  ,"ADW_ENTRANCE");
	Wld_InsertNpc (KDW_14050_Addon_Merdarion_ADW ,"ADW_ENTRANCE");
	
	Wld_InsertNpc (NONE_Addon_114_Lance_ADW,"ADW_ENTRANCE"); 			//Leiche im Sumpf
	Wld_InsertNpc (VLK_4304_Addon_William,"ADW_ENTRANCE"); 			//Unterhalpb des Hügels, auf der PIR Seite
	Wld_InsertNpc (PIR_1352_Addon_AlligatorJack,"ADW_ENTRANCE");	//Auf dem weg zu den Banditen
	
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_PLATEAU_08");
	
	
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_05");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_05");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_05");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_02B");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_02B");


	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_11");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_11");
	//Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_VALLEY_02A"); //RAUS wegen AlliJack

	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_2_VALLEY_08");
	
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_PATH2BANDITS_05P");
	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_PATH2BANDITS_05P");
 

	Wld_InsertNpc (Sleepfly ,"ADW_ENTRANCE_PATH2BANDITS_10");
	Wld_InsertNpc (Sleepfly ,"ADW_ENTRANCE_PATH2BANDITS_10");
	
	Wld_InsertNpc (Bloodfly ,"ADW_ENTRANCE_PATH2BANDITS_03");

	Wld_InsertNpc (Waran ,"ADW_ENTRANCE_PATH2BANDITS_05");

	Wld_InsertNpc (Razor ,"ADW_ENTRANCE_RUIN1_01");
	Wld_InsertNpc (Giant_Rat ,"ADW_ENTRANCE_RUIN1_01");
	
	
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_BEHINDAKROPOLIS_04");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_PIRATECAMP_13");
	Wld_InsertNpc (Blattcrawler ,"ADW_ENTRANCE_2_PIRATECAMP_13");

	Wld_InsertNpc (Stoneguardian_NailedPortalADW1 ,"ADW_PORTALTEMPEL_08A");
	Wld_InsertNpc (Stoneguardian_NailedPortalADW2 ,"ADW_PORTALTEMPEL_08B");

	Wld_InsertNpc (Molerat ,"ADW_ENTRANCE_PATH2BANDITSCAVE1_05");
	Wld_InsertNpc (Molerat ,"ADW_ENTRANCE_PATH2BANDITSCAVE1_06");
	Wld_InsertNpc (Molerat ,"ADW_ENTRANCE_2_PIRATECAMP_05");
	Wld_InsertNpc (Molerat ,"ADW_ENTRANCE_2_PIRATECAMP_05");

	Wld_InsertNpc (Gobbo_Warrior ,"ADW_ENTRANCE_2_PIRATECAMP_19");
	Wld_InsertNpc (Gobbo_Black ,"ADW_ENTRANCE_2_PIRATECAMP_19");
	Wld_InsertNpc (Gobbo_Black ,"ADW_ENTRANCE_2_PIRATECAMP_19");

	Wld_InsertNpc (Shadowbeast ,"ADW_ENTRANCE_2_PIRATECAMP_22");
	
	//Items
	Wld_InsertItem (ItWr_StonePlateCommon_Addon,"FP_ITEM_ADWPORTAL_01");
	Wld_InsertItem (ItWr_HitPointStonePlate3_Addon,"FP_ITEM_ADWPORTAL_02"); 
	
	Wld_InsertItem (ItRi_Addon_Health_01,"FP_ITEM_ENTRANCE_09"); 
	
};

func void INIT_SUB_ADDON_PART_ENTRANCE_01 ()
{
};

func void INIT_ADDON_PART_ENTRANCE_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_ENTRANCE_01();
};
//------------------------------------------------------------
//		Addon World Banditenlager
//------------------------------------------------------------
FUNC VOID STARTUP_ADDON_PART_BANDITSCAMP_01()
{
	//FUNKTIONEN
	//Machvoll_Goldmobis_ADW();
	//ITEMS 
		
	//Pflanzen auf den Stufen von Bloodwyns Behausung
	
	Wld_InsertItem (ItPl_Health_Herb_02,"FP_ITEM_BL_STAIRS_01"); 
	Wld_InsertItem (ItPl_Mana_Herb_01,"FP_ITEM_BL_STAIRS_02");
	Wld_InsertItem (ItPl_Mana_Herb_03,"FP_ITEM_BL_STAIRS_03");
	Wld_InsertItem (ItPl_Mana_Herb_02,"FP_ITEM_BL_STAIRS_04");
	Wld_InsertItem (ItPl_Health_Herb_03,"FP_ITEM_BL_STAIRS_05");
	
	Wld_InsertItem (ItSc_LightningFlash,"FP_BL_ITEM_SMITH_01"); //Regal
	Wld_InsertItem (ItPl_Speed_Herb_01,"FP_BL_ITEM_SMITH_02"); //hinter den Kisten im Hof
	Wld_InsertItem (ItPl_Temp_Herb,"FP_BL_ITEM_SMITH_BACK_01");//links neben dem Haus
	
	Wld_InsertItem (ItPo_Mana_02,"FP_ITEM_BL_TRYSTAN");
	
	Wld_InsertItem (ItAm_Addon_Health,"FP_ITEM_MINE_01");//BALKEN VERSTECK
	
	Wld_InsertItem (ITKE_ADDON_BUDDLER_01,"FP_ITEM_BL_CHEST");
	Wld_InsertItem (ITWr_Addon_Hinweis_02,"FP_ITEM_BL_SNAF");
	
	Wld_InsertItem (ItPo_Health_Addon_04,"FP_RAVEN_01");
	Wld_InsertItem (ItPo_Mana_Addon_04,"FP_RAVEN_02");
	
	
	//IM SUMPF 
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_BANDITSCAMP_01"); 
	Wld_InsertItem (ItPo_Mana_03,"FP_ITEM_BANDITSCAMP_02"); 
	
	Wld_InsertItem (ItRi_Addon_MANA_02,"FP_ITEM_BANDITSCAMP_03"); //TOLLES ITEM !!!
	
	Wld_InsertItem (ItSc_IceCube,"FP_ITEM_BANDITSCAMP_04"); 
	Wld_InsertItem (ItPl_Speed_Herb_01,"FP_ITEM_BANDITSCAMP_05"); 
	Wld_InsertItem (ItPo_Health_03,"FP_ITEM_BANDITSCAMP_06"); 
	Wld_InsertItem (ItPo_Mana_03,"FP_ITEM_BANDITSCAMP_07"); 
	Wld_InsertItem (ItPl_Perm_Herb,"FP_ITEM_BANDITSCAMP_08"); 
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_BANDITSCAMP_09"); 
	Wld_InsertItem (ItPo_Health_02,"FP_ITEM_BANDITSCAMP_10"); 
	Wld_InsertItem (ItMi_GoldNugget_Addon,"FP_ITEM_BANDITSCAMP_11"); 
	Wld_InsertItem (ItPo_Health_02,"FP_ITEM_BANDITSCAMP_12"); 
	Wld_InsertItem (ItPo_Speed,"FP_ITEM_BANDITSCAMP_13"); 
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_BANDITSCAMP_14"); 
	Wld_InsertItem (ItPo_Health_03,"FP_ITEM_BANDITSCAMP_15"); 
	Wld_InsertItem (ItMW_Addon_Keule_2h_01,"FP_ITEM_BANDITSCAMP_16"); 
	Wld_InsertItem (ItMi_GoldNugget_Addon,"FP_ITEM_BANDITSCAMP_17"); 
	Wld_InsertItem (ItPl_Speed_Herb_01,"FP_ITEM_BANDITSCAMP_19"); 
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_BANDITSCAMP_20"); 
	//NSCs
	
	//-----------------VORPOSTEN--------------------------------------
	
	//Franco und seine Jäger
	Wld_InsertNpc (BDT_1093_Addon_Franco,"BANDIT");
	
	Wld_InsertNpc (BDT_10011_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10012_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_1076_Addon_Bandit,"BANDIT");//EX Schmied
	Wld_InsertNpc (BDT_1077_Addon_Bandit,"BANDIT");//EX Händler
	
	//Vorposten 1 Holzbau/Palisade
	
	Wld_InsertNpc (BDT_1073_Addon_Sancho,"BANDIT");
	Wld_InsertNpc (BDT_1087_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10022_Addon_Miguel,"BANDIT");
	
	//Vorposten 2 Versteck
	Wld_InsertNpc (BDT_1072_Addon_Logan,"BANDIT");
	Wld_InsertNpc (BDT_1080_Addon_Tom,"BANDIT");
	
	//Vorposten 3 Ruine
	Wld_InsertNpc (BDT_1074_Addon_Edgor,"BANDIT");
	Wld_InsertNpc (BDT_1078_Addon_Bandit,"BANDIT");//EX Wirt
	
	//Sonstige im Sumpf 
	Wld_InsertNpc (BDT_10016_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10017_Addon_Juan  ,"BANDIT");
	//--------------------LAGER-----------------------------------------
	
	Wld_InsertNpc (BDT_10014_Addon_Thorus, "BANDIT");//
	
	Wld_InsertNpc (BDT_1071_Addon_Ramon, "BANDIT");//TORWACHE
	Wld_InsertNpc (BDT_10004_Addon_Finn,"BANDIT");
	Wld_InsertNpc (BDT_1088_Addon_Torwache,"BL_ENTRANCE_GUARD_02");
	
	
	Wld_InsertNpc (BDT_1083_Addon_Esteban,"BANDIT");
	Wld_InsertNpc (BDT_1081_Addon_Wache_01,"BANDIT");
	Wld_InsertNpc (BDT_10005_Addon_Wache_02,"BANDIT");
	
	Wld_InsertNpc (BDT_1097_Addon_Fisk,"BANDIT");//Händler
	Wld_InsertNpc (BDT_1098_Addon_Snaf,"BANDIT");//Wirt
	Wld_InsertNpc (BDT_1099_Addon_Huno,"BANDIT");//Schmied
	
	
	Wld_InsertNpc (BDT_1070_Addon_Paul,"BL_DOWN_CENTER_07");
	Wld_InsertNpc (BDT_1082_Addon_Skinner,"BANDIT");
	Wld_InsertNpc (BDT_1075_Addon_Fortuno,"BANDIT");
	Wld_InsertNpc (BDT_1084_Addon_Senyan,"BANDIT");
	Wld_InsertNpc (BDT_10015_Addon_Emilio,"BANDIT");
	
	Wld_InsertNpc (BDT_1096_Addon_Lennar,"BANDIT");
	Wld_InsertNpc (BDT_1079_Addon_Carlos,"BANDIT");
	
	Wld_InsertNpc (BDT_1091_Addon_Lucia ,"BANDIT");
	//Wld_InsertNpc (BDT_1092_Addon_Isabel,"BANDIT"); 
	
	Wld_InsertNpc	(BDT_10031_Addon_Wache, "BANDIT");
	Wld_InsertNpc   (BDT_1086_Addon_Scatty,	"BANDIT");
	
	Wld_InsertNpc (BDT_1085_Addon_Bloodwyn,"BANDIT");
	
	Wld_InsertNpc (STRF_1141_Addon_Sklave,"BANDIT");
	Wld_InsertNpc (STRF_1142_Addon_Sklave,"BANDIT");
	Wld_InsertNpc (STRF_1143_Addon_Sklave,"BANDIT");
	Wld_InsertNpc (STRF_1144_Addon_Sklave,"BANDIT");
	
	
	Wld_InsertNpc (BDT_10001_Addon_Bandit_L,"BANDIT");
	Wld_InsertNpc (BDT_10002_Addon_Bandit_M,"BANDIT");
	Wld_InsertNpc (BDT_10003_Addon_Bandit_H,"BANDIT");
	
	Wld_InsertNpc (BDT_10006_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10007_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10008_Addon_Bandit,"BANDIT");
	
	Wld_InsertNpc (BDT_10009_Addon_Bandit,"BANDIT");
	Wld_InsertNpc (BDT_10010_Addon_Bandit,"BANDIT");
	
	Wld_InsertNpc (BDT_10018_Addon_Torwache,"BANDIT");
	Wld_InsertNpc (BDT_10019_Addon_Wache,"BANDIT");
	Wld_InsertNpc (BDT_10020_Addon_Wache,"BANDIT");
	Wld_InsertNpc (BDT_10021_Addon_Wache,"BANDIT");
	
	//-----------------Ravens Tempel ---------------------- 
	Wld_InsertNpc (Zombie_Addon_Knecht,"BL_RAVEN_SIDE_17");
	Wld_InsertNpc (Zombie_Addon_Knecht,"BL_RAVEN_SIDE_18");
	Wld_InsertNpc (Zombie_Addon_Knecht,"BL_RAVEN_SIDE_19");
	Wld_InsertNpc (Zombie_Addon_Knecht,"BL_RAVEN_SIDE_20");
	Wld_InsertNpc (Zombie_Addon_Knecht,"BL_RAVEN_SIDE_21");
	Wld_InsertNpc (Zombie_Addon_Knecht,"BL_RAVEN_SIDE_22");
	
	
	//-----------------MONSTER------------------------------------ 
	Wld_InsertNpc (SwampGolem,"ADW_PATH_TO_GOLEM_05");
	Wld_InsertNpc (SwampGolem,"ADW_PATH_TO_GOLEM_06");
	Wld_InsertNpc (SwampGolem,"ADW_PATH_TO_GOLEM_08");
	
	Wld_InsertNpc (SwampGolem,"ADW_SWAMP_GOLEM_02");
	Wld_InsertNpc (SwampGolem,"ADW_SWAMP_GOLEM_03");
	Wld_InsertNpc (SwampGolem,"ADW_SWAMP_GOLEM_04");
	
	//Bloodflies rechts vom Eingang BL
	Wld_InsertNpc (Bloodfly,"ADW_BL_FLIES_03");
	Wld_InsertNpc (Bloodfly,"ADW_BL_FLIES_04");
	Wld_InsertNpc (Bloodfly,"ADW_BL_FLIES_06");
	Wld_InsertNpc (Bloodfly,"ADW_BL_FLIES_07");
	
	//Steg
	Wld_InsertNpc (Gobbo_Black,"ADW_BANDIT_VP1_05");
	
	
	//Sharks hinter Vorposten 3
	Wld_InsertNpc (MIS_Addon_Swampshark_Lou,"ADW_SHARK_01");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_02");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_03");
	//und Weg zurück zum Damm
	Wld_InsertNpc (Swampshark,"ADW_SHARK_04");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_05");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_06");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_07");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_08");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_09");
	Wld_InsertNpc (Swampshark,"ADW_SHARK_10");
	
	
	//Swamp Shark Straße
	Wld_InsertNpc (SwampGolem,"ADW_SWAMP_WAND_01");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_WAND_02");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_WAND_03");
	
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_02");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_03");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_07");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_08");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_09");
	Wld_InsertNpc (Swampshark,"ADW_SWAMP_SHARKSTREET_10");

	Wld_InsertNpc (Swamprat,"ADW_CANYON_PATH_TO_BANDITS_01B");
	
	Wld_InsertNpc (Sleepfly,"ADW_LITTLE_HILL_03");
	Wld_InsertNpc (Sleepfly,"ADW_LITTLE_HILL_03");
	Wld_InsertNpc (Sleepfly,"ADW_LITTLE_HILL_04");
	
	//Weg rauf zum Big Sea
	Wld_InsertNpc (Sleepfly,"ADW_SWAMP_04");
	Wld_InsertNpc (Sleepfly,"ADW_SWAMP_04");
	
	Wld_InsertNpc (Sleepfly,"ADW_SWAMP_05");
	Wld_InsertNpc (Sleepfly,"ADW_SWAMP_05");

	//Little Sea 
	
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_01");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_01");
	
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_02");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_02");
	
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_03");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_LITTLE_SEA_03");
	
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_12");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_13");
	
	//Pfuetze 
	Wld_InsertNpc (Swamprat,"ADW_PFUETZE_01");
	Wld_InsertNpc (Swamprat,"ADW_PFUETZE_02");
	Wld_InsertNpc (Swamprat,"ADW_PFUETZE_03");
	Wld_InsertNpc (Swamprat,"ADW_PFUETZE_04");
	
	//Ruine
	Wld_InsertNpc (Gobbo_Warrior,"ADW_BANDIT_VP1_07_D");
	Wld_InsertNpc (Gobbo_Black,"ADW_BANDIT_VP1_07_E");
	Wld_InsertNpc (Gobbo_Black,"ADW_BANDIT_VP1_07_F");
	Wld_InsertNpc (Gobbo_Black,"ADW_SWAMP_LITTLE_SEA_03_B");
	Wld_InsertNpc (Gobbo_Black,"ADW_SWAMP_09_C");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_01");
	
	
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_LOCH_01");
	Wld_InsertNpc (Waran,"ADW_SWAMP_LOCH_02");
	Wld_InsertNpc (Waran,"ADW_SWAMP_LOCH_03");
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_LOCH_04");

	Wld_InsertNpc (Gobbo_Black,"ADW_SWAMP_08_D");
	Wld_InsertNpc (Gobbo_Black,"ADW_SWAMP_08_E");
	
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Swampdrone,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");

	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_10");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_13");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_14");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_06");
	Wld_InsertNpc (Bloodfly,"ADW_SWAMP_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_12");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_BF_NEST_06");

	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_03");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_04");
	
	//----------------Senat--- (und Wege dorthin)--------------------
	
	//Items
	Wld_InsertItem (ItPl_Mana_Herb_01,"FP_ITEM_SENAT_01");
	Wld_InsertItem (ItPl_Health_Herb_02,"FP_ITEM_SENAT_02");
	Wld_InsertItem (ItPl_Temp_Herb,"FP_ITEM_SENAT_03");
	Wld_InsertItem (ItPl_Health_Herb_03,"FP_ITEM_SENAT_04");
	Wld_InsertItem (ItPl_Mana_Herb_02,"FP_ITEM_SENAT_05");
	//Monster	
	Wld_InsertNpc (Stoneguardian_Sani01,"ADW_SENAT_SIDE_01");
	Wld_InsertNpc (Stoneguardian_Sani02,"ADW_SENAT_SIDE_02");
	Wld_InsertNpc (Stoneguardian_Sani03,"ADW_SENAT_SIDE_03");
	
	
	Wld_InsertNpc (Stoneguardian_Sani04,"ADW_SENAT_GUARDIAN_01");
	Wld_InsertNpc (Stoneguardian_Sani05,"ADW_SENAT_GUARDIAN_02");
	Wld_InsertNpc (Stoneguardian_Sani06,"ADW_SENAT_GUARDIAN_03");
	
	Wld_InsertNpc (StoneGuardian_Heiler,"ADW_SENAT_INSIDE_01");
	
	Wld_InsertNpc (Waran,"ADW_SENAT_MONSTER_01");
	Wld_InsertNpc (Waran,"ADW_SENAT_MONSTER_02");
	Wld_InsertNpc (Waran,"ADW_SENAT_MONSTER_03");
	Wld_InsertNpc (Waran,"ADW_SENAT_MONSTER_04");

	Wld_InsertNpc (Waran,"ADW_SENAT_05");
	Wld_InsertNpc (Waran,"ADW_SENAT_05");
	
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_HILLS_DOWN_07");
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_HILLS_DOWN_07");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_06");
	
	
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_03");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HILLS_DOWN_03");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_15");
	Wld_InsertNpc (Swamprat,"ADW_HOHLWEG_CENTER");
	Wld_InsertNpc (Swamprat,"FP_ROAM_BF_NEST_26");
	Wld_InsertNpc (Swamprat,"ADW_BANDITSCAMP_RAKEPLACE_03");
	Wld_InsertNpc (Swampdrone,"ADW_CANYON_PATH_TO_BANDITS_02");
	Wld_InsertNpc (Swampdrone,"ADW_PFUETZE_02");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_LOCH_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_LOCH_06");


	Wld_InsertNpc (Swamprat,"ADW_SWAMP_TO_BIGSEA_01");
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_TO_BIGSEA_01");
	
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_HOHLWEG_02");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_05");
	Wld_InsertNpc (Swampdrone,"ADW_SWAMP_HOHLWEG_05");
	
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_07");
	Wld_InsertNpc (Swamprat,"ADW_SWAMP_07");
};



FUNC VOID INIT_SUB_ADDON_PART_BANDITSCAMP_01()
{	
		//Die portalräume im banditenlager
		Wld_AssignRoomToGuild("tavern01"  , GIL_NONE);
		Wld_AssignRoomToGuild("beds01"	  , GIL_PUBLIC);
		Wld_AssignRoomToGuild("merchant01", GIL_PUBLIC);
		Wld_AssignRoomToGuild("schmied01" , GIL_NONE);
		Wld_AssignRoomToGuild("zoll01"	  , GIL_NONE);
		Wld_AssignRoomToGuild("raven01"	  , GIL_PUBLIC);
};
FUNC VOID INIT_ADDON_PART_BANDITSCAMP_01()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_BANDITSCAMP_01();
};

//#############################################
//###										###
//###			Piratenlager				###
//###										###
//#############################################

FUNC VOID STARTUP_ADDON_PART_PIRATESCAMP_01 ()
{
	//--------- Piraten --------------------------
	Wld_InsertNpc (PIR_1350_Addon_Francis,"STRAND");		//Vor Gregs Hütte -->SitBench
	Wld_InsertNpc (PIR_1351_Addon_Samuel,"STRAND");			//In der Höhle    
	Wld_InsertNpc (PIR_1353_Addon_Morgan,"STRAND");			//Vor Sams Höhle
	Wld_InsertNpc (PIR_1354_Addon_Henry,"STRAND");			//An der Palisade --> ArmsCrossed
	Wld_InsertNpc (PIR_1355_Addon_Skip,"STRAND");			//
	Wld_InsertNpc (PIR_1356_Addon_Bill,"STRAND");			//Am Strand -->Saw
	Wld_InsertNpc (PIR_1357_Addon_Garett ,"STRAND");		//Am Lagerschuppen
	
	Wld_InsertNpc (PIR_1360_Addon_Pirat,"STRAND");			//An der Palisade --> RepairHut
	Wld_InsertNpc (PIR_1361_Addon_Pirat,"STRAND");			//An der Palisade --> Saw
	Wld_InsertNpc (PIR_1362_Addon_Bones,"STRAND");			//Trainiert
	Wld_InsertNpc (PIR_1363_Addon_Pirat,"STRAND");			//Bank
	Wld_InsertNpc (PIR_1364_Addon_Pirat,"STRAND");			//FixME_Hoshi --> noch TA setzen!!!
	Wld_InsertNpc (PIR_1365_Addon_Matt,"STRAND");			//SmallTalk
	Wld_InsertNpc (PIR_1366_Addon_Brandon,"STRAND");			//Smalltalk
	
	Wld_InsertNpc (PIR_1367_Addon_Owen,"STRAND");			//Holzfälelrlager
	Wld_InsertNpc (PIR_1368_Addon_Malcom,"STRAND");			//tot ind er geheimen Höhle
	
	
	Wld_InsertNpc (PIR_1370_Addon_Angus,"STRAND");			//tot
	Wld_InsertNpc (PIR_1371_Addon_Hank ,"STRAND");			//tot
	
	
	//--------- Turm Banditen-------------------------
	
	Wld_InsertNpc (BDT_10100_Addon_TowerBandit,"STRAND");			
	Wld_InsertNpc (BDT_10101_Addon_TowerBandit,"STRAND");			
	Wld_InsertNpc (BDT_10102_Addon_TowerBandit,"STRAND");	
	
	Wld_InsertItem (ItMi_Addon_GregsTreasureBottle_MIS,"FP_ADW_GREGSBOTTLE"); 		
	
	
	// --------- Monster -----------------------------
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_ISLE1_01");
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_ISLE1_01");
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_ISLE1_01");
	
	// -------- Strandlurker ------------------------
	Wld_InsertNpc (BeachWaran1,"ADW_PIRATECAMP_BEACH_27");
	Wld_InsertNpc (BeachWaran2,"ADW_PIRATECAMP_BEACH_27");
	
	Wld_InsertNpc (BeachLurker1,"ADW_PIRATECAMP_BEACH_28");
	Wld_InsertNpc (BeachLurker2,"ADW_PIRATECAMP_BEACH_28");
	Wld_InsertNpc (BeachLurker2,"ADW_PIRATECAMP_BEACH_28");
	
	Wld_InsertNpc (BeachShadowbeast1,"ADW_PIRATECAMP_CAVE3_04");
	
	//-------- Einsamer Strand -----------------------
	
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_LONEBEACH_11");
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_LONEBEACH_12");
	Wld_InsertNpc (FireWaran,"ADW_PIRATECAMP_LONEBEACH_10");
	Wld_InsertNpc (FireWaran,"ADW_PIRATECAMP_LONEBEACH_10");
	Wld_InsertNpc (FireWaran,"DAW_PIRTECAMP_LONEBEACH_07");
	Wld_InsertNpc (FireWaran,"ADW_PIRATECAMP_LONEBEACH_08");
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_LONEBEACH_05");
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_LONEBEACH_04");
	
	Wld_InsertNpc (ZOMBIE01,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc (MAYAZOMBIE02,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc (ZOMBIE03,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	
	// --------- Versteckte Höhle ----------------------
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_SECRETCAVE_01");
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_SECRETCAVE_01");
	
	//---------- Holzfällerlager -----------------------
	
	Wld_InsertNpc (Meatbug,"ADW_PIRATECAMP_LUMBER_01");
	Wld_InsertNpc (Meatbug,"ADW_PIRATECAMP_LUMBER_01");
	Wld_InsertNpc (Meatbug,"ADW_PIRATECAMP_LUMBER_01");
	
	// --------- Vor dem Turm ------------------------
	
	Wld_InsertNpc (Gobbo_Black,"ADW_PIRATECAMP_PLAIN_01");
	Wld_InsertNpc (Gobbo_Black,"ADW_PIRATECAMP_PLAIN_01");
	Wld_InsertNpc (Gobbo_Black,"ADW_PIRATECAMP_PLAIN_02");
	
	// --------- Hinter dem Turm --------------------
	
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATCAMP_PLAIN_05");
	
	//---------- Wasserloch -------------------------
	 
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATCAMP_PLAIN_05");
	
	Wld_InsertNpc (Waran,"ADW_PIRATECAMP_WATERHOLE_08");
	
	Wld_InsertNpc (Lurker,"ADW_PIRATECAMP_WATERHOLE_04");
	
	//---------- Weg ---------------------------------
	
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_01");
	Wld_InsertNpc (Blattcrawler,"ADW_PIRATECAMP_WAY_SPAWN_02");
	
	
	//========================================================
	//				Items
	//========================================================
	
	
	
	//-------- Treibgut im Seichten Wasser -----
	
	Wld_InsertItem (ItFo_Addon_Rum,"FP_ITEMSPAWN_SHALLOWWATER_01");	
	Wld_InsertItem (ItMi_GoldNugget_Addon,"FP_ITEMSPAWN_SHALLOWWATER_02");	
	Wld_InsertItem (ItMi_Addon_Shell_01,"FP_ITEMSPAWN_SHALLOWWATER_03");
	Wld_InsertItem (ItMi_JeweleryChest,"FP_ITEMSPAWN_SHALLOWWATER_04");
	Wld_InsertItem (ItMi_GoldChalice,"FP_ITEMSPAWN_SHALLOWWATER_05");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_06");	
	Wld_InsertItem (ItMi_GoldRing,"FP_ITEMSPAWN_SHALLOWWATER_07");
	Wld_InsertItem (ItMi_Addon_Shell_01,"FP_ITEMSPAWN_SHALLOWWATER_08");
	Wld_InsertItem (ItSe_GoldPocket100,"FP_ITEMSPAWN_SHALLOWWATER_09");
	Wld_InsertItem (ItMi_RuneBlank,"FP_ITEMSPAWN_SHALLOWWATER_10");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_11");	
	Wld_InsertItem (ItPo_Health_Addon_04,"FP_ITEMSPAWN_SHALLOWWATER_12");	
	Wld_InsertItem (ItMi_Skull,"FP_ITEMSPAWN_SHALLOWWATER_13");	
	Wld_InsertItem (ItPo_Health_Addon_04,"FP_ITEMSPAWN_SHALLOWWATER_14");	
	Wld_InsertItem (ItMi_SilverCandleHolder,"FP_ITEMSPAWN_SHALLOWWATER_15");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_16");
	Wld_InsertItem (ItMi_SilverRing,"FP_ITEMSPAWN_SHALLOWWATER_17");	
	Wld_InsertItem (ItMi_Addon_Shell_01,"FP_ITEMSPAWN_SHALLOWWATER_18");	
	Wld_InsertItem (ItPo_Mana_Addon_04,"FP_ITEMSPAWN_SHALLOWWATER_19");
	Wld_InsertItem (ItMi_GoldCup,"FP_ITEMSPAWN_SHALLOWWATER_20");
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_21");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_22");
	Wld_InsertItem (ItMi_GoldChest,"FP_ITEMSPAWN_SHALLOWWATER_23");
	Wld_InsertItem (ItMi_GoldCup,"FP_ITEMSPAWN_SHALLOWWATER_24");	
	Wld_InsertItem (ItSe_GoldPocket100,"FP_ITEMSPAWN_SHALLOWWATER_25");	
	Wld_InsertItem (ItMi_Nugget,"FP_ITEMSPAWN_SHALLOWWATER_26");
	Wld_InsertItem (ItMi_Addon_Shell_01,"FP_ITEMSPAWN_SHALLOWWATER_27");	
	Wld_InsertItem (ItMi_SilverPlate,"FP_ITEMSPAWN_SHALLOWWATER_28");
	Wld_InsertItem (ItMi_SilverCup,"FP_ITEMSPAWN_SHALLOWWATER_29");	
	Wld_InsertItem (ItMi_Addon_Shell_02,"FP_ITEMSPAWN_SHALLOWWATER_30");	
	
	
	Wld_InsertItem (ItAm_Addon_STR,"FP_ITEMSPAWN_LONEBEACH_02");	//-->Feuerwaranstrand in der Höhle
/*

	//-------- Sonstige Item FP ------------
	
	
	
	
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_WATERHOLE_01");	//-->Hinten im Talkessel mit dem See
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_SECRETCAVE_01");	//-->In der unterirdische Stunthöhle
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_WAY_01");			//-->Auf dem Platz vor dem Piratenlager, an dem grossen Felsen zum Canyon hin
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_WAY_02");			//-->Auf dem grossen Platz vor Piratenlager, an der Felswand
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_BANDITS_01");		//-->Zwischen Turm und Abgrund zum Wasserloch
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_BANDITS_02");		//-->Hinterm Turm
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_BANDITS_03");		//-->Auf dem Turm
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_LONEBEACH_01");	//-->Feuerwaranstrand
	
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_WATER_01");		//-->Auf Felseninsel
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_BEACH_01");		//-->Piratenstrand ganz links
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_BEACH_02");		//-->Piratenstrand, hinter der ersten Hütte
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_LURKERBEACH_01");	//-->Lurkerstrand vorne
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_LURKERBEACH_02");	//-->Lurkerstrand hinten
	Wld_InsertItem (XXX,"FP_ITEMSPAWN_LURKERBEACH_03");	//-->Lurkerstrand Höhle
	
	*/
};

FUNC VOID INIT_SUB_ADDON_PART_PIRATESCAMP_01 ()
{
};

FUNC VOID INIT_ADDON_PART_PIRATESCAMP_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_PIRATESCAMP_01();
};

//#############################################
//###										###
//###			Part VALLEY					###
//###										###
//#############################################

FUNC VOID STARTUP_ADDON_PART_VALLEY_01 ()
{
	Wld_InsertNpc (None_Addon_115_Eremit,"ADW_VALLEY_PATH_031_HUT");
	
	// ------ Troll ------
	Wld_InsertNpc (Valley_Troll,"ADW_VALLEY_BIGCAVE_07");
	Wld_InsertNpc (Valley_Troll,"ADW_VALLEY_PATH_048_B");

	// ------ Gobbo_Black ------
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_003_A");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_BIGCAVE_08");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_BIGCAVE_08");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_BIGCAVE_08");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_BIGCAVE_08");
	Wld_InsertNpc (MayaZombie03,"ADW_VALLEY_BIGCAVE_18");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_012");
	Wld_InsertNpc (Gobbo_Warrior_Visir,"ADW_VALLEY_PATH_115_F");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_115_F");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_054_B");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_054_B");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_054_D");
	Wld_InsertNpc (Gobbo_Black,"ADW_VALLEY_PATH_054_E");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_054_F");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_058_CAVE_09");
	Wld_InsertNpc (Gobbo_Warrior_Visir,"ADW_VALLEY_PATH_058_CAVE_09");
	Wld_InsertNpc (Gobbo_Warrior,"ADW_VALLEY_PATH_058_CAVE_09");

	// ------ Harpie ------
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_06");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_06");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_PATH_110");
	Wld_InsertNpc (Harpie,"ADW_VALLEY_PATH_110");

	// ------ Snapper ------
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_020");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_020");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_BIGCAVE_01");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_D");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc (Snapper,"ADW_VALLEY_PATH_038_J");
	
	// ------ Shadowbeast ------
	Wld_InsertNpc (Shadowbeast,"ADW_VALLEY_PATH_029");

	// ------ Skeleton ------
	Wld_InsertNpc (Skeleton,"ADW_VALLEY_PATH_020_CAVE_05");
	Wld_InsertNpc (Skeleton,"ADW_VALLEY_PATH_020_CAVE_05");
	
	// ------Scavenger ------
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_032_G");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_032_G");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_032_G");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_121_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_121_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_121_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_120_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_120_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_120_A");

	// ------ Molerat ------
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_027");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_045");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_129_B");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_129_B");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_129_B");

	// ------ Minecrawler ------
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_131");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_131");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_132_A");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_132_A");
	Wld_InsertNpc (Minecrawler_Priest,"ADW_VALLEY_PATH_134");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_134");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (Minecrawler,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc (MinecrawlerWarrior,"ADW_VALLEY_PATH_058_CAVE_13");
	
	// ------ Blattcrawler ------
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_024_A");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_024_A");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_125");
	Wld_InsertNpc (SwampGolem_Valley,"ADW_VALLEY_PATH_064_A");	
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_062");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_062");

	// ------ Bloodfly ------
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_102_A");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_102_A");
	Wld_InsertNpc (Scavenger_Demon,"ADW_VALLEY_PATH_116_A");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_043");
	Wld_InsertNpc (Swamprat,"ADW_VALLEY_PATH_043");
	Wld_InsertNpc (Blattcrawler,"ADW_VALLEY_PATH_053");
	Wld_InsertNpc (Bloodfly,"ADW_VALLEY_PATH_017");
	
	// ------ Meatbug ------
	Wld_InsertNpc (Meatbug,"ADW_VALLEY_PATH_058");

	// ------ Orcs ------
	Wld_InsertNpc (OrcWarrior_Rest,"ADW_VALLEY_PATH_033_A");
	Wld_InsertNpc (OrcWarrior_Sit,"ADW_VALLEY_PATH_035");
	Wld_InsertNpc (OrcWarrior_Sit,"ADW_VALLEY_PATH_036");
	Wld_InsertNpc (OrcShaman_Sit,"ADW_VALLEY_PATH_115_E");
	
	// ------ Zombie ------
	Wld_InsertNpc (MayaZombie01,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc (Zombie04,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc (Zombie03,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc (MayaZombie04_Totenw,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc (Zombie04,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc (Zombie02,"ADW_VALLEY_PATH_073");
	
	
	Wld_InsertNpc (Stoneguardian_NailedValleyShowcase_01,"ADW_VALLEY_SHOWCASE1_02");
	Wld_InsertNpc (Stoneguardian_NailedValleyShowcase_02,"ADW_VALLEY_SHOWCASE1_03");
	Wld_InsertItem (ItMi_Zeitspalt_Addon,"FP_ITEM_VALLEY_02");
	
	//Qurahodrons Grab
	Wld_InsertItem (ItRi_Addon_STR_02,"FP_ITEM_VALLEY_12");
};

FUNC VOID INIT_SUB_ADDON_PART_VALLEY_01 ()
{
};

FUNC VOID INIT_ADDON_PART_VALLEY_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_ADDON_PART_VALLEY_01();
};




// *************
// Alte Oberwelt
// *************

func void STARTUP_OLDCAMP ()
{
	
	//ITEMS
	Wld_InsertItem (ItMi_GornsTreasure_MIS,"FP_ITEM_GORN");
	Wld_InsertItem (ItKE_ErzbaronFlur,"FP_ITEM_OC_01");
	Wld_InsertItem (ItKE_ErzbaronRaum,"FP_ITEM_OC_02");

	Wld_InsertItem (ItWr_HitPointStonePlate2_Addon,"FP_ROAM_ORK_OC_04_2");

	
	// Foltermeister
	//------------------------------------------
	Wld_InsertNpc	(VLK_4100_Brutus,"OC1"); 
	
	// Gefangene im Kerker
	//------------------------------------------
	Wld_InsertNpc	(STRF_1100_Straefling,"OC1"); 
	Wld_InsertNpc	(STRF_1101_Draal	 ,"OC1"); 
	Wld_InsertNpc	(STRF_1102_Straefling,"OC1"); 
	Wld_InsertNpc	(STRF_1103_Straefling,"OC1"); 
	Wld_InsertNpc	(PC_FIGHTER_OW		 ,"OC1"); 
	
	// Kerker Wache 
	//------------------------------------------
	Wld_InsertNpc	(PAL_261_Gerold,"OC1"); 
	
	// Vorstand 
	//------------------------------------------
	Wld_InsertNpc	(PAL_250_Garond,"OC1"); 
	Wld_InsertNpc	(PAL_251_Oric,"OC1"); 
	Wld_InsertNpc	(PAL_252_Parcival,"OC1"); 
	
	// Koch und Wachen EBR Haus
	//------------------------------------------
	Wld_InsertNpc	(PAL_262_Wache,"OC1"); 
	Wld_InsertNpc	(PAL_263_Wache,"OC1"); 
	Wld_InsertNpc	(STRF_1107_Straefling,"OC1"); 
	
	// Haupt- Tor  Wachen
	//------------------------------------------
	Wld_InsertNpc	(PAL_253_Wache,"OC1"); 
	Wld_InsertNpc	(PAL_254_Wache,"OC1"); 
	
	// Training, Abends Campfire
	//------------------------------------------
	Wld_InsertNpc	(PAL_255_Ritter,"OC1"); 
	Wld_InsertNpc	(PAL_256_Ritter,"OC1"); 
	Wld_InsertNpc	(PAL_257_Ritter,"OC1"); 
	Wld_InsertNpc	(PAL_258_Keroloth,"OC1"); 
	
	// Palisadenwachen
	//------------------------------------------
	Wld_InsertNpc	(PAL_267_Sengrath,"OC1"); 
	Wld_InsertNpc	(PAL_268_Udar,"OC1"); 

	Wld_InsertNpc	(PAL_264_Ritter,"OC1"); 
	Wld_InsertNpc	(PAL_265_Ritter,"OC1"); 
	Wld_InsertNpc	(PAL_266_Ritter,"OC1"); 
	
	// Magier
	//------------------------------------------
	Wld_InsertNpc	(PC_Mage_OW,"OC1"); 
	
	// sonstige Typen 
	//------------------------------------------
	Wld_InsertNpc	(PAL_260_Tandor,"OC1"); // Lagerhaus Wache 
	
	Wld_InsertNpc	(Sheep,"FP_SLEEP_OC_SHEEP_01"); 
	Wld_InsertNpc	(Sheep,"FP_SLEEP_OC_SHEEP_02"); 
	Wld_InsertNpc	(Sheep,"FP_SLEEP_OC_SHEEP_03"); 
	
	Wld_InsertNpc	(PAL_269_Ritter,"OC1"); 
	Wld_InsertNpc	(PAL_270_Ritter,"OC1"); 
	Wld_InsertNpc	(PAL_271_Ritter,"OC1"); 

	Wld_InsertNpc	(PAL_272_Ritter,"OC1"); 
	
	Wld_InsertNpc	(VLK_4101_Waffenknecht,"OC1"); 
	Wld_InsertNpc	(VLK_4102_Waffenknecht,"OC1"); 
	Wld_InsertNpc	(VLK_4103_Waffenknecht,"OC1"); 
	Wld_InsertNpc	(VLK_4104_Waffenknecht,"OC1"); 
	Wld_InsertNpc	(VLK_4105_Waffenknecht,"OC1"); 
	Wld_InsertNpc	(VLK_4106_Dobar,"OC1");
	Wld_InsertNpc	(VLK_4107_Parlaf,"OC1");
	Wld_InsertNpc	(VLK_4108_Engor,"OC1");
	Wld_InsertNpc	(VLK_4109_Waffenknecht,"OC1"); 
	
	Wld_InsertNpc	(VLK_4140_Waffenknecht,"OC1"); 
	Wld_InsertNpc	(VLK_4141_Waffenknecht,"OC1"); 
	Wld_InsertNpc	(VLK_4142_Waffenknecht,"OC1"); 
	Wld_InsertNpc	(VLK_4143_Haupttorwache,"OC1");
	Wld_InsertNpc	(VLK_4144_Waffenknecht,"OC1");

	Wld_InsertNpc	(VLK_4145_Waffenknecht,"OC1");
	Wld_InsertNpc	(VLK_4146_Waffenknecht,"OC1");
	Wld_InsertNpc	(VLK_4147_Waffenknecht,"OC1");

	Wld_InsertNpc	(PAL_273_Ritter,"OC1");
	Wld_InsertNpc	(PAL_274_Ritter,"OC1"); 
	
	// arbeitende STRF + Wache
	//------------------------------------------
	Wld_InsertNpc	(STRF_1108_Straefling,"OC1"); 
	Wld_InsertNpc	(STRF_1109_Straefling,"OC1");
	Wld_InsertNpc	(PAL_259_Wache,"OC1"); 
	
	// Orks  ** noch mehr Roamer ***
	//------------------------------------------
	Wld_InsertNpc	(OrcElite_Roam,"OC14");
	Wld_InsertNpc	(OrcWarrior_Roam,"OC_ORK_BETWEEN_CAMPS_01"); 
	Wld_InsertNpc	(OrcElite_Roam,"OC_ORK_LITTLE_CAMP_01"); 
	Wld_InsertNpc	(OrcWarrior_Roam,"OC_ORK_BETWEEN_CAMPS_02"); 
	Wld_InsertNpc	(OrcElite_Roam,"OC_ORK_LITTLE_CAMP_03");
	Wld_InsertNpc	(OrcWarrior_Roam,"OC10");
	Wld_InsertNpc	(OrcWarrior_Roam,"OC9");
	Wld_InsertNpc	(OrcWarrior_Roam,"OC_ORK_BACK_CAMP_02");
	Wld_InsertNpc	(OrcElite_Roam,"OC8");
	Wld_InsertNpc	(OrcWarrior_Roam,"OC6");
	Wld_InsertNpc	(OrcWarrior_Roam,"OC_ORK_BACK_CAMP_15");
	
	
	Wld_InsertNpc   (OrcShaman_Sit,"OC_ORK_MAIN_CAMP_05");	
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_MAIN_CAMP_05");	
	Wld_InsertNpc   (OrcWarrior_Roam,"OC_ORK_MAIN_CAMP_04");
		
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_MAIN_CAMP_01");	
	Wld_InsertNpc   (OrcShaman_Sit,"OC_ORK_MAIN_CAMP_02");	
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_MAIN_CAMP_03");
		
	Wld_InsertNpc   (OrcShaman_Sit,"OC_ORK_LITTLE_CAMP_03");	
	Wld_InsertNpc   (OrcShaman_Sit,"OC_ORK_LITTLE_CAMP_03");
		
	Wld_InsertNpc   (OrcShaman_Sit,"OC_ORK_BACK_CAMP_16");	
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_BACK_CAMP_16");
		
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_06");	
	Wld_InsertNpc   (OrcShaman_Sit,"OC_ORK_BACK_CAMP_06");	
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_BACK_CAMP_06");	
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_BACK_CAMP_06");	
	
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_BACK_CAMP_07");	
	Wld_InsertNpc   (OrcShaman_Sit,"OC7");	
	Wld_InsertNpc   (OrcElite_Roam,"OC7");
	
	Wld_InsertNpc   (OrcShaman_Sit,"OC_ORK_LITTLE_CAMP_05");
	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_MAIN_CAMP_10");	
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_MAIN_CAMP_11");
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_MAIN_CAMP_12");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_MAIN_CAMP_03");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_MAIN_CAMP_02");
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_MAIN_CAMP_07");
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_MAIN_CAMP_04");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC1");
	Wld_InsertNpc   (OrcWarrior_Rest,"OC2");		
	Wld_InsertNpc   (OrcWarrior_Rest,"OC1");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC13");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC11");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_LITTLE_CAMP_02");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_LITTLE_CAMP_02");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_LITTLE_CAMP_06");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_LITTLE_CAMP_04");
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_BACK_CAMP_01");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_02");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_03");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_04");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_05");	
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_BACK_CAMP_06");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_07");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_08");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_09");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_10");	
	Wld_InsertNpc   (OrcElite_Roam,"OC_ORK_BACK_CAMP_11");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_12");
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_13");	
	Wld_InsertNpc   (OrcWarrior_Rest,"OC_ORK_BACK_CAMP_14");
	
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_REST_ORK_OC_18");
	Wld_InsertNpc   (Sheep			,"FP_SLEEP_SHEEP_ORK");	
	
	// Hoshpak
	
	Wld_InsertNpc   (OrcShaman_Hosh_Pak	,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc   (OrcShaman_Sit	,"FP_CAMPFIRE_HOSHPAK_02");	
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_ROAM_HOSHPAK_05");	
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_ROAM_HOSHPAK_03");	

	// Warge 
	Wld_InsertNpc	(Warg,"OC_PATH_04");
	Wld_InsertNpc	(Warg,"OC_PATH_02");
	Wld_InsertNpc	(Warg,"OC_PATH_02");
	Wld_InsertNpc	(Warg,"OC_PATH_02");
	Wld_InsertNpc	(Warg,"FP_ROAM_WARG_OC_10");
	Wld_InsertNpc	(Warg,"FP_ROAM_WARG_OC_10");
	Wld_InsertNpc	(Warg,"FP_ROAM_WARG_OC_13");
	Wld_InsertNpc	(Warg,"FP_ROAM_WARG_OC_13");
	
};

	func void INIT_SUB_OLDCAMP()
	{
		// ------ LIGHTS ------
		
		//Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
		//Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
		//Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);
			
		// ------ PORTAL-RÄUME ------		//Groß- und Kleinschreibung beachten!
	
		//Wld_AssignRoomToGuild("hütte77",GIL_VLK);
		
		//Kirche im alten Lager
		Wld_AssignRoomToGuild("ki1", GIL_NONE); //Hauptraum
		Wld_AssignRoomToGuild("ki2", GIL_NONE); //rechter Raum
		Wld_AssignRoomToGuild("ki3", GIL_NONE); //linker raum
		
		//Brutus
		Wld_AssignRoomToGuild("tu1", GIL_NONE); //wegen Mission besser gil_none (läuft raus)
		
		//Wehrgänge
		Wld_AssignRoomToGuild("he3", GIL_NONE); //einzelner Raum über Knast
		Wld_AssignRoomToGuild("he1", GIL_NONE); //Schalterraum
		Wld_AssignRoomToGuild("he2", GIL_NONE); //raum mit verbindung zu gardistenhaus
		
		//Gardistenhaus
		Wld_AssignRoomToGuild("eg1",	-1); //Eingangsbereich
		//unten
		Wld_AssignRoomToGuild("eg4",	-1); //Engor
		Wld_AssignRoomToGuild("eg2",	GIL_PUBLIC); //linker Schlafraum
		Wld_AssignRoomToGuild("sthaus",	GIL_PUBLIC); //gang hinter engor
		Wld_AssignRoomToGuild("st",		GIL_PUBLIC); //lagerraum
		Wld_AssignRoomToGuild("klo",	GIL_PUBLIC); //kleiner raum hinterm lager
		//oben
		Wld_AssignRoomToGuild("eg3",	GIL_MIL); //Schlafraum oben
		Wld_AssignRoomToGuild("eg5",	GIL_MIL); //Schlafraum oben - (verbindung zu he2)
		
		//Erzbaronhaus - alle Flure (auch oben)
		Wld_AssignRoomToGuild("hh1",	-1); //Eingangsbereich = DRAUSSEN (wegen B_AssessEnterRoom)
		//EBr unten
		Wld_AssignRoomToGuild("hh2",	GIL_PUBLIC); //Waffenkammer
		Wld_AssignRoomToGuild("hh3",	GIL_PUBLIC); //Küche
		Wld_AssignRoomToGuild("hhmh1",	GIL_PUBLIC); //Thronsaal
		//EBr oben
		Wld_AssignRoomToGuild("hh8",	GIL_MIL); //Schlafraum vorne links
		Wld_AssignRoomToGuild("hh7",	GIL_MIL); //Schlafraum vorne rechts
		Wld_AssignRoomToGuild("hh5",	GIL_MIL); //Gomez grosser raum hinten
		Wld_AssignRoomToGuild("hh4",	GIL_MIL); //Raum rechts hinten (mit gang zum turm)
		Wld_AssignRoomToGuild("wg3",	GIL_MIL); //gang zum turm
		Wld_AssignRoomToGuild("tu2",	GIL_MIL); //turmzimmer
	};

func void INIT_OLDCAMP ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_OLDCAMP();
};

func void STARTUP_DEMONTOWER ()
{
	
	Wld_InsertNpc				(Gobbo_SkeletonOWDemonTower,"DT_E1_06"); // Hat den Teleport ItRu_TeleportOWDemonTower in der Tasche
	Wld_InsertNpc				(Gobbo_Skeleton,"DT_E2_07");
	Wld_InsertNpc				(Gobbo_Skeleton,"DT_E2_09");
	Wld_InsertNpc				(Gobbo_Skeleton,"DT_E2_04");
	Wld_InsertNpc				(Gobbo_Skeleton,"DT_E2_05");
	Wld_InsertNpc				(Gobbo_Skeleton,"DT_E2_08");

	Wld_InsertNpc				(Demon,"DT_E2_06");

	Wld_InsertItem	(ItMi_Zeitspalt_Addon,"FP_ITEM_XARDASALTERTURM_01");
	Wld_InsertNpc				(Skeleton,"DT_E3_07");
	Wld_InsertNpc				(Skeleton,"DT_E3_04");

};

	func void INIT_SUB_DEMONTOWER ()
	{
	};

func void INIT_DEMONTOWER ()
{
	INIT_SUB_DEMONTOWER();
};


func void STARTUP_SURFACE ()
{


//*******************************************************
//		NSCs
//*******************************************************
	
	//ITEMS

	Wld_InsertItem (ItSe_ADDON_CavalornsBeutel,"FP_OW_ITEM_02");//ADDON

	Wld_InsertItem (ItWr_KDWLetter,"FP_ITEM_OW_01");
	Wld_InsertItem (ItWr_GilbertLetter,"FP_ITEM_OW_02");
	
	Wld_InsertItem (ItWr_DexStonePlate2_Addon,"OW_ITEM_ROCKHORT_01");
	Wld_InsertItem (ItWr_DexStonePlate1_Addon,"FP_REST_ORK_OC_29");
	Wld_InsertItem (ItWr_HitPointStonePlate1_Addon,"FP_ROAM_ORK_04");
	Wld_InsertItem (ItWr_StonePlateCommon_Addon,"FP_ROAM_OW_WARAN_DEMON_02");
	Wld_InsertItem (ItWr_OneHStonePlate1_Addon,"FP_ROAM_ITEM_SPECIAL_01");
	Wld_InsertItem (ItWr_ManaStonePlate2_Addon,"OW_ITEM_ICEHORT_01");
	Wld_InsertItem (ItWr_BowStonePlate2_Addon ,"FP_OW_ITEM_05");
	Wld_InsertItem (ItWr_CrsBowStonePlate2_Addon  ,"FP_ROAM_OW_LURKER_NC_LAKE_03");
	Wld_InsertItem (ItWr_StonePlateCommon_Addon  ,"FP_ROAM_OW_WOLF_NEAR_SHADOW3");
	Wld_InsertItem (ItWr_HitPointStonePlate1_Addon   ,"FP_OW_GORNS_VERSTECK");
	Wld_InsertItem (ItWr_CrsBowStonePlate1_Addon   ,"FP_ROAM_OW_GOBBO_CAVE03_02");
	Wld_InsertItem (ItWr_BowStonePlate1_Addon   ,"FP_ROAM_OW_WARAN_EBENE_02_01");
	Wld_InsertItem (ItWr_BowStonePlate1_Addon   ,"OW_ITEM_ROCKHORT_02");
	Wld_InsertItem (ItPl_Dex_Herb_01   ,"OW_ITEM_ROCKHORT_02");
	Wld_InsertItem (ItPl_Dex_Herb_01   ,"FP_ROAM_OW_LURKER_NC_LAKE_03");
	
	//-------------Jäger Camp im Lager über ehem. Cavalorns Hütte---------------------------
	Wld_InsertNpc		(VLK_4130_Talbin,"SPAWN_TALL_PATH_BANDITOS2_03");	
	Wld_InsertNpc		(VLK_4131_Engrom,"SPAWN_TALL_PATH_BANDITOS2_03");
	//-------------Swampcamp---------------------------
	Wld_InsertNpc		(VLK_4148_Gestath,"OW_DJG_ROCKCAMP_01");
	
	//-------------Höhle von Cavalorns Hütte---------------------------
	Wld_InsertNpc		(PAL_217_Marcos,"OC1");
	
	//-------------Entflohene Sträflinge im späteren DJG Vorposten Camp---------------------------------------------------------
	
	Wld_InsertNpc		(STRF_1115_Geppert,"OC1"); 		
	Wld_InsertNpc		(STRF_1116_Kervo,"OC1"); 		

	Wld_InsertNpc		(Kervo_Lurker1,"SPAWN_OW_BLACKGOBBO_A2");
	Wld_InsertNpc		(Kervo_Lurker2,"SPAWN_OW_WARAN_CAVE1_1");
	Wld_InsertNpc		(Kervo_Lurker3,"SPAWN_OW_WARAN_CAVE1_1");
	Wld_InsertNpc		(Kervo_Lurker4,"SPAWN_OW_NEARBGOBBO_LURKER_A1");
	Wld_InsertNpc		(Kervo_Lurker6,"SPAWN_OW_NEARBGOBBO_LURKER_A1");
	Wld_InsertNpc		(Kervo_Lurker5,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
	
	
	
		
	Wld_InsertNpc		(VLK_4110_Jergan,"OC1"); //Späher		
	Wld_InsertNpc		(PAL_2004_Bruder,"OC1"); //Leiche 	
	Wld_InsertNpc		(VLK_4112_Den 	,"OC1"); //Leiche Den 		
	
	//Im Versteck der 4 Freunde
	//------------------------------------------
	Wld_InsertNpc		(PC_ThiefOW, 				"OC1");
	Wld_InsertNpc		(PAL_2006_Leiche, 			"OC1");
	Wld_InsertNpc		(PAL_2007_Leiche, 			"OC1");
	
	//-----------------------neue Erzmine 1 (Fajeth)----------------------------------------------
	Wld_InsertNpc		(Pal_281_Fajeth, 		"OC1"); 
	Wld_InsertNpc		(Pal_280_Tengron, 		"OC1");

	Wld_InsertNpc		(VLK_4120_Bilgot, 		"OC1");


	Wld_InsertNpc		(STRF_1106_Fed, 		"OC1");
	Wld_InsertNpc		(STRF_1104_Straefling,	"OC1");
	Wld_InsertNpc		(STRF_1105_Straefling, 	"OC1");
	Wld_InsertNpc		(STRF_1110_Straefling, 	"OC1");
	Wld_InsertNpc		(STRF_1111_Straefling, 	"OC1");
	Wld_InsertNpc		(STRF_1112_Straefling, 	"OC1");
	Wld_InsertNpc		(STRF_1113_Straefling, 	"OC1");
	Wld_InsertNpc		(STRF_1114_Straefling, 	"OC1");
	
	Wld_InsertNpc		(VLK_4152_Olav, 		"OC1");
	
	//-----------------------neue Erzmine 2 (Marcos)----------------------------------------------
	Wld_InsertNpc		(VLK_4111_Grimes,"OW_MINE2_GRIMES");
	Wld_InsertNpc		(STRF_1117_Straefling,"OW_MINE2_STRF");	
	Wld_InsertNpc		(PAL_218_Ritter,"OW_PATH_264");	
	Wld_InsertNpc		(PAL_219_Ritter,"OW_PATH_148_A");	
	
	//Treck Leichen
	Wld_InsertNpc		(VLK_4151_Leiche,"OW_SPAWN_TRACK_LEICHE_00");	
	Wld_InsertNpc		(STRF_1150_Leiche,"OW_SPAWN_TRACK_LEICHE_01");	
	Wld_InsertNpc		(STRF_1151_Leiche,"OW_SPAWN_TRACK_LEICHE_03");	
	Wld_InsertNpc		(STRF_1153_Leiche,"OW_SPAWN_TRACK_LEICHE_04");	
	
	//-----------------------neue Erzmine 3 (Silvestro)----------------------------------------------	
	Wld_InsertNpc		(PAL_2005_Leiche,"OW_MINE3_LEICHE_05");	
	Wld_InsertNpc		(PAL_2002_Leiche,"OW_MINE3_LEICHE_01");	
	Wld_InsertNpc		(PAL_2003_Leiche,"OW_MINE3_LEICHE_04");	
	
	Wld_InsertNpc		(STRF_1152_Leiche,"OW_MINE3_LEICHE_02");	
	Wld_InsertNpc		(STRF_1154_Leiche,"OW_MINE3_LEICHE_07");	
	Wld_InsertNpc		(STRF_1155_Leiche,"OW_MINE3_LEICHE_06");	
	Wld_InsertNpc		(STRF_1156_Leiche,"OW_MINE3_LEICHE_09");	
	Wld_InsertNpc		(STRF_1157_Leiche,"OW_MINE3_LEICHE_08");	
	
	Wld_InsertNpc		(VLK_4150_Leiche,"OW_MINE3_LEICHE_03");	


//*******************************************************
//		MONSTER
//*******************************************************

	//-----------------------Drachen OW ----------------------------------------------
	Wld_InsertNpc		(Dragon_Swamp,			"OW_SWAMPDRAGON_01");
	Wld_InsertNpc		(Dragon_Rock, 			"OW_ROCKDRAGON_11");
	Wld_InsertNpc		(Dragon_Fire, 			"CASTLE_36");
	Wld_InsertNpc		(Dragon_Ice, 			"OW_ICEDRAGON_01");


		////////////////////////////////////////////////////////////////////////////
		//-----------------------alter Spielstart Gothic1-------------------------//
		////////////////////////////////////////////////////////////////////////////
	
		// Orks am Oretrail:
		
	Wld_InsertNpc       (OrcWarrior_Roam,"SPAWN_OW_MEATBUG_01_01");	
	Wld_InsertNpc       (OrcWarrior_Roam,"OW_PATH_1_16_4");
		
	Wld_InsertNpc       (OrcWarrior_Roam,"OW_PATH_1_16_8");		
	Wld_InsertNpc       (OrcWarrior_Roam,"WP_INTRO_FALL3");
	
	Wld_InsertNpc       (OrcWarrior_Rest,"WP_INTRO21");			
	Wld_InsertNpc       (OrcWarrior_Rest,"WP_INTRO_WI07");

	Wld_InsertItem		(ItSe_DiegosTreasure_Mis,"WP_INTRO_WI15"); 

	
		// hinter der Brücke gegenüber der verlassenen Mine

	Wld_InsertNpc		(Giant_Bug,"SPAWN_MOLERAT02_SPAWN01");	
	Wld_InsertNpc		(Giant_Bug,"SPAWN_MOLERAT02_SPAWN01");	
	
		// Pfad zum OC
	Wld_InsertNpc		(DragonSnapper,"SPAWN_TOTURIAL_CHICKEN_2_2"); 	
	Wld_InsertNpc		(Bloodfly, "OW_PATH_1_5_4");  
	Wld_InsertNpc		(Bloodfly, "OW_PATH_1_5_4");  
	Wld_InsertNpc		(Bloodfly, "OW_PATH_1_5_3");  
	
	Wld_InsertNpc		(DragonSnapper, "FP_ROAM_OW_MAETBUG_ROOT_03"); 

		// Sandbank im Fluß
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_E_3");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_E_3");
	
		// bei Ratford und Drax am Zaun
	Wld_InsertNpc		(Snapper,"FP_ROAM_OW_GOBBO_07_02");  
	Wld_InsertNpc		(Snapper,"FP_ROAM_OW_GOBBO_07_02");
	Wld_InsertNpc		(Snapper,"FP_ROAM_OW_GOBBO_07_02"); 

	Wld_InsertNpc		(Snapper,"OW_PATH_1_5_A"); 
		
		// zwischen ehem. Ratford und Brücke zum OC
	Wld_InsertNpc		(Snapper,"SPAWN_OW_STARTSCAVNGERBO_01_02"); 
	Wld_InsertNpc		(Snapper,"SPAWN_OW_STARTSCAVENGER_02_01");

	Wld_InsertNpc		(Snapper,"SPAWN_OW_SCA_05_01");
	Wld_InsertNpc		(Snapper,"SPAWN_OW_SCA_05_01"); 

	// bei oc1  und ums Oldcamp!

	Wld_InsertNpc		(Meatbug,"FP_ROAM_OW_MEATBUG_04_02");	
	Wld_InsertNpc		(Meatbug,"FP_ROAM_OW_MEATBUG_04_02");	
	Wld_InsertNpc		(Meatbug,"FP_ROAM_OW_MEATBUG_03_03");	
	Wld_InsertNpc		(Meatbug,"FP_ROAM_OW_MEATBUG_03_03");	

	Wld_InsertNpc		(OrcShaman_Sit,"SPAWN_O_SCAVENGER_05_02");	


	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_O_SCAVENGER_05_02");	
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_OW_BLOODFLY_OC_WOOD05");	
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_OW_BLOODFLY_OC_WOOD05");	
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_OW_BLOODFLY_OC_WOOD05");	

	Wld_InsertNpc		(OrcWarrior_Roam,"OC1");	

	Wld_InsertNpc		(OrcWarrior_Roam,"OC2");	
	Wld_InsertNpc		(OrcShaman_Sit,"OC2");	


	Wld_InsertNpc		(OrcWarrior_Roam,"OC7");	
	Wld_InsertNpc		(OrcWarrior_Roam,"OC8");	
	Wld_InsertNpc		(OrcWarrior_Roam,"OC10");	
	Wld_InsertNpc		(OrcWarrior_Roam,"OC12");	
	Wld_InsertNpc		(OrcWarrior_Roam,"OC13");	

	Wld_InsertNpc		(OrcWarrior_Roam,"OC14");	
	Wld_InsertNpc		(OrcWarrior_Roam,"OC_ROUND_22_CF_2");	
	Wld_InsertNpc		(OrcWarrior_Roam,"OC_ROUND_22_CF_2");	
	Wld_InsertNpc		(OrcShaman_Sit,"OC_ROUND_22_CF_2");	
	
	//--------------------Scavenger Horde-------------------------------------
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_01");	
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_01");	
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_01");	
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_01");	
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_01");	
	
	
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_02");	
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_02");	
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_02");	
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_02");
	Wld_InsertNpc		(Scavenger,"OW_SPAWN_SCAVENGER_02");		
	
	//--------------------Direkter Weg ins Orkgebiet (Zaun)-------------------------------------
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_GATE_ORCS_01");	
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_GATE_ORCS_02");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_GATE_ORCS_03");
	
	// entschäfter alternativ Weg zur Newmine
	
	Wld_InsertNpc		(Giant_Bug,"OC3");	
	Wld_InsertNpc		(Giant_Bug,"OW_SCAVENGER_SPAWN_TREE");
	Wld_InsertNpc		(Giant_Bug,"OW_SCAVENGER_SPAWN_TREE");

	Wld_InsertNpc		(Bloodfly,"OC4");	
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_SCAVENGER_AL_ORC");

	Wld_InsertNpc		(Bloodfly,"OC5");	
	Wld_InsertNpc		(Bloodfly,"OC6");	

	Wld_InsertNpc		(Wolf,"SPAWN_PATH_GUARD1");


	Wld_InsertNpc		(Wolf,"SPAWN_OW_BLACKWOLF_02_01");

	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLACKWOLF_02_01");

	Wld_InsertNpc		(Bloodfly,"FP_ROAM_ORC_09");
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_ORC_08");

	Wld_InsertNpc		(Bloodfly,"OW_PATH_103"); 

	Wld_InsertNpc		(Bloodfly,"FP_ROAM_OW_WARAN_ORC_01");
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_OW_WARAN_ORC_04");


	// Fluss am Oldcamp!

	Wld_InsertNpc		(Lurker,"OW_PATH_WARAN05_SPAWN02");
	Wld_InsertNpc		(Lurker,"OW_PATH_WARAN05_SPAWN02");
	Wld_InsertNpc		(Warg,"SPAWN_O_SCAVENGER_05_02");

	Wld_InsertNpc		(Lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");

//------------------ nahe der NewMine	------------------

	Wld_InsertNpc	(NewMine_Snapper1,"SPAWN_OW_SCAVENGER_ORC_03");  // Fajeths Snapper	
	Wld_InsertNpc	(NewMine_Snapper2,"SPAWN_OW_SCAVENGER_ORC_03");
	Wld_InsertNpc	(NewMine_Snapper4,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc	(NewMine_Snapper5,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc	(NewMine_Snapper6,"OW_PATH_333");	

	// Bei eingestürtzter Orcbrücke	
	Wld_InsertNpc	(Wolf,"OW_PATH_099");
	Wld_InsertNpc	(Wolf,"OW_PATH_099");

	Wld_InsertNpc	(Bloodfly,"SPAWN_OW_WARAN_ORC_01");
	Wld_InsertNpc	(Bloodfly,"SPAWN_OW_WARAN_ORC_01");

//------------ neue Mine 3 --------------------------------------------------
	Wld_InsertNpc (Minecrawler, "OW_MINE3_05"); 
	Wld_InsertNpc (Minecrawler, "OW_MINE3_05");
	Wld_InsertNpc (Minecrawler, "OW_MINE3_05");
	Wld_InsertNpc (Minecrawler, "OW_MINE3_06");
	Wld_InsertNpc (Minecrawler, "OW_MINE3_06");
	
	Wld_InsertNpc (Minecrawler, "OW_MINE3_08");
	Wld_InsertNpc (Minecrawler, "OW_MINE3_08");
	Wld_InsertNpc (Minecrawler, "OW_MINE3_10");
	Wld_InsertNpc (MinecrawlerWarrior, "OW_MINE3_10");
	
	Wld_InsertNpc (Minecrawler, "OW_MINE3_LEICHE_02");
	Wld_InsertNpc (Minecrawler, "OW_MINE3_LEICHE_03");

//--------------------------------------------------------------------------	
	/*
	Wld_InsertNpc		(Giant_Rat,"OW_SAWHUT_MOLERAT_SPAWN01");
	Wld_InsertNpc		(Giant_Rat,"OW_SAWHUT_MOLERAT_SPAWN01");
	Wld_InsertNpc		(Giant_Rat,"OW_SAWHUT_MOLERAT_SPAWN01");
	*/
	Wld_InsertNpc		(Giant_Bug,"PATH_OC_NC_6");
	Wld_InsertNpc		(Giant_Bug,"PATH_OC_NC_4");
	Wld_InsertNpc		(Giant_Bug,"PATH_OC_NC_4");

	Wld_InsertNpc		(Giant_Rat,"OW_SAWHUT_MEATBUG_SPAWN");
	Wld_InsertNpc		(Giant_Rat,"OW_SAWHUT_MEATBUG_SPAWN");
	
	Wld_InsertNpc		(Giant_Rat,"OW_SAWHUT_MEATBUG_SPAWN");
	Wld_InsertNpc		(Giant_Rat,"OW_SAWHUT_MEATBUG_SPAWN");

	//-------------BanditenLager------------------ ehem. Aidan 
 	
	Wld_InsertNpc		(BDT_1000_Bandit_L,"OW_WOODRUIN_FOR_WOLF_SPAWN");
	Wld_InsertNpc		(BDT_1001_Bandit_L,"OW_WOODRUIN_FOR_WOLF_SPAWN");
	
	Wld_InsertNpc		(BDT_1002_Bandit_L,"OW_WOODRUIN_WOLF_SPAWN");
	Wld_InsertNpc		(BDT_1003_Bandit_M,"PATH_OC_NC_14");

	
	//------------------Mine 2 zu Banditenlager  Die Brücken--------------------------
	Wld_InsertNpc		(Gobbo_Green,"OW_PATH_149");
	Wld_InsertNpc		(Gobbo_Green,"OW_PATH_150");
	Wld_InsertNpc		(Gobbo_Green,"OW_PATH_057");
	Wld_InsertNpc		(Gobbo_Green,"OW_PATH_059");
	
	//------------------ Zwischen Eisregion und Banditenlager------------------------ 
	
	Wld_InsertNpc		(Bloodfly,"OW_PATH_055");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_055");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_055");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_055");
	
	Wld_InsertNpc		(Giant_Rat,"OW_SPAWN_TRACK_LEICHE_01");
	Wld_InsertNpc		(Giant_Rat,"OW_SPAWN_TRACK_LEICHE_01");
	
	//--------------------------------------------------- 
	
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_FORCAVE_SPAWN");
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_FORCAVE_SPAWN");
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_FORCAVE_SPAWN");
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_FORCAVE_SPAWN");


	
	Wld_InsertNpc		(Icewolf,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc		(Icewolf,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc		(Icewolf,"OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
		
		//----IceRegion----------------


	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_BLOODFLY_05_07");

	Wld_InsertNpc		(Wisp,"FP_ROAM_OW_BLOODFLY_05_05");

	Wld_InsertNpc		(Icewolf,"FP_SLEEP_OW_BLOODFLY_05_02");
	Wld_InsertNpc		(Icewolf,"FP_SLEEP_OW_BLOODFLY_05_01");
	
	Wld_InsertNpc		(IceGolem_Sylvio1,"FP_ROAM_OW_ICEREGION_ENTRANCE_ICEGOLEM_02");
	Wld_InsertNpc		(IceGolem_Sylvio2,"FP_ROAM_OW_ICEREGION_ENTRANCE_ICEGOLEM_01");
	
	
	Wld_InsertNpc		(IceGolem,"FP_ROAM_OW_ICEREGION_1_01");
	Wld_InsertNpc		(IceGolem,"OW_ICEREGION_11");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_2_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_2_02");
	
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_3_01");
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_3_02");
	
	Wld_InsertNpc		(Wisp,"FP_ROAM_OW_ICEREGION_4_01");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_5_02");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_6_01");
	
	Wld_InsertNpc		(IceGolem,"FP_ROAM_OW_ICEREGION_7_01");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_8_01");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_9_01");
	
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_10_01");	
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_12_01");
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_12_02");
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_11_01");
	
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_13_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_13_02");
	
	Wld_InsertNpc		(Wisp,"FP_ROAM_OW_ICEREGION_14_01");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_15_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_15_02");
	
	Wld_InsertNpc		(IceGolem,"FP_ROAM_OW_ICEREGION_16_01");
	
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_17_01");
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_17_02");
	
	Wld_InsertNpc		(Wisp,"FP_ROAM_OW_ICEREGION_18_02");
	
	Wld_InsertNpc		(IceGolem,"FP_ROAM_OW_ICEREGION_19_01");
	Wld_InsertNpc		(IceGolem,"FP_ROAM_OW_ICEREGION_19_02");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_20_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_20_02");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_21_01");
	
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_22_02");
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_22_02");
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_22_02");
	
	Wld_InsertNpc		(Icewolf,"OW_ICEREGION_86");
	Wld_InsertNpc		(Icewolf,"OW_ICEREGION_62");

	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_23_02");
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_23_02");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_24_01");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_25_01");

	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_27_01");
	
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_28_01");
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_28_01");
	Wld_InsertNpc		(Icewolf,"FP_ROAM_OW_ICEREGION_28_01");
	 
	
	Wld_InsertNpc		(IceGolem,"FP_ROAM_OW_ICEREGION_31_01");
	
	Wld_InsertNpc		(IceGolem,"FP_ROAM_OW_ICEREGION_32_02");
	
	Wld_InsertNpc		(IceGolem,"FP_ROAM_OW_ICEREGION_33_02");//auf der ehem. NC-Kneipe

	//-----------------------------------
	
	Wld_InsertNpc		(Giant_Bug,"OW_SCAVENGER_CAVE3_SPAWN");
	Wld_InsertNpc		(Giant_Bug,"OW_SCAVENGER_CAVE3_SPAWN");
	Wld_InsertNpc		(Giant_Bug,"OW_SCAVENGER_TREE_SPAWN");
	Wld_InsertNpc		(Gobbo_Black,"OW_MOLERAT_CAVE_SPAWN");

	
	//--------------------------------------------------------
	Wld_InsertNpc		(Gobbo_Black,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(Gobbo_Black,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(Gobbo_Black,"SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_C3");


	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_12");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_BLOODFLY_12");

	//ehem. Neks Höhle, Gothic2 Gorns Versteck----------------

	Wld_InsertNpc		(Giant_Bug,"SPAWN_OW_SMALLCAVE01_MOLERAT");
	Wld_InsertNpc		(Giant_Bug,"SPAWN_OW_SMALLCAVE01_MOLERAT");
	Wld_InsertNpc		(Giant_Bug,"SPAWN_OW_SMALLCAVE01_MOLERAT");
	//--------------------------------
	Wld_InsertNpc		(Keiler,"SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc		(Keiler,"SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_MOLERAT_OLDWOOD1_M");
	Wld_InsertNpc		(Warg,"SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");


	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_WOLF_WOOD05_02");
	Wld_InsertNpc		(Warg,"FP_ROAM_OW_WOLF_08_08");
	Wld_InsertNpc		(OrcWarrior_Roam,"FP_ROAM_OW_WOLF_08_08");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc		(Warg,"OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_DEADWOOD_WOLF_SPAWN01");

	Wld_InsertNpc		(Lurker,"FP_ROAM_OW_BLOODFLY_04_02_02");

	Wld_InsertNpc		(Bloodfly,"OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc		(Lurker,"OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_LAKE_NC_BLOODFLY_SPAWN01");
	
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Lurker,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_BLOODFLY_WOOD05_01");

	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_MINICOAST_LURKER_A1");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_MINICOAST_LURKER_A1");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_MINICOAST_LURKER_A1");
	Wld_InsertNpc		(Bloodfly,"OW_LAKE_NC_LURKER_SPAWN01");
	
	//Höhle unter Wasserfall nahe Iceregion

	Wld_InsertNpc		(Lurker,"FP_CONVINCECORRISTO_KEY");
	
	//------------------------------------
	Wld_InsertNpc		(Gobbo_Black,"OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc		(Gobbo_Black,"OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc		(Gobbo_Black,"OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc		(Gobbo_Black,"OW_PATH_WARAN06_SPAWN01");

	
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc		(Snapper,"FP_ROAM_OW_SCAVENGER_12_07");
	Wld_InsertNpc		(Snapper,"FP_ROAM_OW_SCAVENGER_12_07");

	

	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc		(Snapper,"OW_PATH_SCAVENGER01_SPAWN01");
	
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc		(Warg,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");

	Wld_InsertNpc		(OrcShaman_Sit,"SPAWN_OW_SCAVENGER_OCWOOD1");	
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_OCWOOD1");

	
	//######################################################################
	//	 An der Orcbarriere 
	//######################################################################
	
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_01");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_01");

	
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_04_01");
	Wld_InsertNpc		(OrcElite_Roam,"OW_ORCBARRIER_04_01");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_04_01");

	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_06");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_06");


	Wld_InsertNpc		(OrcShaman_Sit,"OW_ORCBARRIER_08_01");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_08_01");
	Wld_InsertNpc		(OrcElite_Roam,"OW_ORCBARRIER_08_01");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_08_01");

	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_11");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_11");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_14");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_14");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_16");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_16");
	
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_17");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_ORCBARRIER_17");

	Wld_InsertNpc		(OrcWarrior_Roam,"PATH_OC_FOGTOWER03");
	Wld_InsertNpc		(OrcWarrior_Roam,"PATH_OC_FOGTOWER03");
	
	//######################################################################
	//	 bei alter Gobbohöhle: Orclager
	//######################################################################


	Wld_InsertNpc		(OrcWarrior_Roam,"MOVEMENT_GOBBO_LOCATION_29_01");	
	Wld_InsertNpc		(OrcWarrior_Roam,"MOVEMENT_GOBBO_LOCATION_29_01");
	Wld_InsertNpc		(OrcWarrior_Roam,"LOCATION_29_04");
	Wld_InsertNpc		(OrcShaman_Sit,"MOVEMENT_GOBBO_LOCATION_29_03");
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_WATERFALL_GOBBO6");
	// vor der Brücke
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_WATERFALL_GOBBO10"); 
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_WATERFALL_GOBBO10");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_WATERFALL_GOBBO10");
	Wld_InsertNpc		(OrcWarrior_Roam,"OW_WATERFALL_GOBBO10");
	
	//-------------------------------------------------------------------------------//
	
	Wld_InsertNpc		(Gobbo_Black,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	Wld_InsertNpc		(Gobbo_Black,"SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	Wld_InsertNpc		(Gobbo_Black,"SPAWN_OW_MOLERAT_WOODOLDMINE2");
	Wld_InsertNpc		(DragonSnapper,"SPAWN_OW_SNAPPER_WOOD05_05");
	Wld_InsertNpc		(DragonSnapper,"SPAWN_OW_SNAPPER_WOOD05_05");

	Wld_InsertNpc		(DragonSnapper,"OW_PATH_187"); 
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_185");
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_185");
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_190");
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_190");
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_190");
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_189"); 
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_189");


	
			
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_MOLERAT2_WALD_OC1");
	
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_LURKER_RIVER2");
	Wld_InsertNpc		(Bloodfly,"SPAWN_OW_SCAVENGER_OCWOODEND2");


	Wld_InsertNpc		(Lurker,"SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc		(Lurker,"SPAWN_OW_GOBBO_WATERFALLCAVE_2");


	Wld_InsertNpc       (Shadowbeast_Skeleton_Angar,"OW_PATH_033_TO_CAVE5");					
	
	////////////////////////////////////////////////////////////////////////////
	Wld_InsertNpc		(DragonSnapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");
	Wld_InsertNpc		(DragonSnapper,"SPAWN_OW_SNAPPER_OCWOOD1_05_02");


	////////////////////////////////////////////////////////////////////////////


	// umgestürtzter Demonenbeschwörer Turm im Wasser
	
	Wld_InsertNpc		(Lurker,"MT16");	
	Wld_InsertNpc		(Lurker,"MT15");
	
	Wld_InsertNpc		(Lurker,"MT09");
	Wld_InsertNpc		(Lurker,"MT08");
	Wld_InsertNpc		(Lurker,"MT08");
	
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_210");
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_210");
	
	Wld_InsertNpc		(StoneGolem,"OW_PATH_116");
	

	// OW Dämonentower umgebung

	Wld_InsertNpc		(Bloodfly,"OW_PATH_205");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_208");
	Wld_InsertNpc		(Bloodfly,"OW_PATH_206");


	Wld_InsertNpc		(Bloodfly,"OW_DT_BLOODFLY_01"); 
	Wld_InsertNpc		(Bloodfly,"OW_DT_BLOODFLY_01");

	Wld_InsertNpc		(FireWaran,"SPAWN_OW_WARAN_DEMON_02_01");


	//-----------------------------------------------






	Wld_InsertNpc		(Lurker,"SPAWN_OW_SCAVENGER_BANDIT_02");
	
	Wld_InsertNpc		(Gobbo_Black,"SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc		(Gobbo_Warrior,"SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc		(Gobbo_Black,"SPAWN_OW_MOLERAT_03_04");

	
	Wld_InsertNpc		(Draconian,"SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc		(Draconian,"SPAWN_OW_WARAN_NC_03");

	Wld_InsertNpc		(FireWaran,"SPAWN_OW_WARAN_DEMON_01");
	Wld_InsertNpc		(FireWaran,"SPAWN_OW_WARAN_DEMON_01");

	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc		(FireWaran,"SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE_02_05");
	Wld_InsertNpc		(FireWaran,"SPAWN_OW_WARAN_EBENE_02_05");
	Wld_InsertNpc		(Waran,"SPAWN_OW_WARAN_EBENE_02_05");
	
	
	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3");


	Wld_InsertNpc		(Lurker,"SPAWN_OW_LURKER_RIVER2_BEACH3_2");
	
	
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_WOOD10_04");   
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_WOOD10_04");
	

	

	
		//------------Mordrags Weg vom Al ins NL-------------------------------//
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_06_04"); 
	Wld_InsertNpc		(OrcShaman_Sit,"SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc		(OrcWarrior_Roam,"SPAWN_OW_SCAVENGER_06_04");
			
	//Höhle vor Iceregion
	Wld_InsertNpc				(BDT_1000_Bandit_L,"LOCATION_23_CAVE_1_IN_1");	
	Wld_InsertNpc				(BDT_1007_Bandit_H,"LOCATION_23_CAVE_1_IN_1");
	Wld_InsertNpc				(BDT_1008_Bandit_H,"LOCATION_23_CAVE_1_IN_1");
	Wld_InsertNpc				(BDT_1003_Bandit_M,"LOCATION_23_CAVE_1_IN_1");

	Wld_InsertNpc				(BDT_1006_Bandit_H,"LOCATION_23_CAVE_1_OUT");

	//-----------------------bei DJG Swampcamp--------------------------
	Wld_InsertNpc		(Meatbug,"OW_SCAVENGER_AL_NL_SPAWN"); 
	Wld_InsertNpc		(Meatbug,"OW_SCAVENGER_AL_NL_SPAWN");
	Wld_InsertNpc		(Meatbug,"OW_SCAVENGER_AL_NL_SPAWN");
	Wld_InsertNpc		(Meatbug,"OW_SCAVENGER_AL_NL_SPAWN");
	Wld_InsertNpc		(Meatbug,"OW_SCAVENGER_AL_NL_SPAWN");

	Wld_InsertNpc		(Meatbug,"FP_ROAM_OW_SNAPPER_ENTRANCE_03");
	Wld_InsertNpc		(Meatbug,"FP_ROAM_OW_SNAPPER_ENTRANCE_01");

	//-------------SwampDragongebiet------------------
	

	Wld_InsertNpc		(Swampdrone,"FP_ROAM_SWAMP_ENTRANCE_01");
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_SWAMP_ENTRANCE_02");
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_SWAMP_ENTRANCE_02");
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_SWAMP_ENTRANCE_02");

	Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_02");
	//Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_03");

	//Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_2_02");
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_SWAMP_3_01");
	//Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_3_02");
	//Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_4_01");
	Wld_InsertNpc		(Bloodfly,"FP_ROAM_SWAMP_4_02");

	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_5_01");

	//Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_6_01");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_6_02");

	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_7_01");

	Wld_InsertNpc		(Swampdrone,"OW_DRAGONSWAMP_023");
	Wld_InsertNpc		(Swampdrone,"OW_DRAGONSWAMP_023");
	Wld_InsertNpc		(Swamprat,"OW_PATH_046");

	//Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_9_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_9_02");
	Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_9_02");

	//Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_10_01");
	Wld_InsertNpc		(Swamprat,"FP_ROAM_SWAMP_10_01");

	Wld_InsertNpc		(Swamprat,"FP_ROAM_SWAMP_11_01");
	Wld_InsertNpc		(Swampdrone,"FP_ROAM_SWAMP_17_01");

	//Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_12_02");


	Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_13_01");
	//Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_13_02");
	//Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_14_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_14_02");
	//Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_15_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_15_02");
	Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_16_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_SWAMP_16_02");

	//------------------------------------------------------------

		// Höhle auf Bergweg vor Milten Nähe Stonehenge
	Wld_InsertNpc		(DragonSnapper,"OW_PATH_07_15_CAVE3");
	Wld_InsertNpc		(DragonSnapper,	"OW_PATH_07_15");
	Wld_InsertNpc		(DragonSnapper,	"OW_PATH_07_15");
	Wld_InsertNpc		(DragonSnapper,	"OW_PATH_07_15");

	

	// Gebiet um Stonehenge

   	Wld_InsertNpc		(SkeletonMage_Angar,"OW_UNDEAD_DUNGEON_03"); //Joly: in der Höhle
   	Wld_InsertNpc		(Skeleton,			"FP_ROAM_OW_UNDEAD_DUNGEON_01"); 
	Wld_InsertNpc		(Skeleton,			"FP_ROAM_OW_UNDEAD_DUNGEON_04");
   	Wld_InsertNpc		(Skeleton,			"FP_ROAM_OW_UNDEAD_DUNGEON_02"); 

	Wld_InsertNpc		(Skeleton,			"OW_PATH_07_03");	
	Wld_InsertNpc		(Skeleton,			"OW_PATH_07_03");
	Wld_InsertNpc		(Skeleton,			"OW_PATH_07_04");
	Wld_InsertNpc		(Skeleton,			"OW_PATH_07_04");
	Wld_InsertNpc		(Skeleton,			"OW_PATH_35");
	Wld_InsertNpc		(Skeleton,			"OW_PATH_033_TO_CAVE5");
	Wld_InsertNpc		(Skeleton,			"OW_PATH_033_TO_CAVE5");
	Wld_InsertNpc		(Skeleton,			"OW_PATH_092");
	Wld_InsertNpc		(Skeleton,			"OW_PATH_092");
	Wld_InsertNpc		(Skeleton,			"OW_PATH_091");
	Wld_InsertNpc		(Skeleton,			"OW_PATH_036");

	Wld_InsertNpc		(Keiler,			"OW_PATH_274_RIGHT2");

	
	Wld_InsertNpc		(OrcWarrior_Roam,			"FP_ROAM_ORC_05");	
	Wld_InsertNpc		(OrcWarrior_Roam,			"FP_ROAM_ORC_06");	
	Wld_InsertNpc		(OrcWarrior_Roam,			"OW_PATH_3_06");



    //-------------------------FELSENFESTUNG: RockDragon------------------------
 	// Berggebiet vor Brücke (ehemaliges Bloodhound-gebiet)

	Wld_InsertNpc		(Draconian,"PLATEAU_ROUND01"); 
	Wld_InsertNpc		(Draconian,"PLATEAU_ROUND02");
	Wld_InsertNpc		(StoneGolem,"PLATEAU_ROUND04");
	Wld_InsertNpc		(Draconian,"PLATEAU_ROUND02_CAVE");
	Wld_InsertNpc		(Draconian,"PLATEAU_ROUND02_CAVE_MOVE");
	Wld_InsertNpc		(Draconian,"LOCATION_18_OUT");
	Wld_InsertNpc		(Draconian,"PATH_TO_PLATEAU04");
	Wld_InsertNpc		(Draconian,"PATH_TO_PLATEAU04");
	Wld_InsertNpc		(Draconian,"PATH_TO_PLATEAU04_RIGHT");
	Wld_InsertNpc		(Draconian,"PATH_TO_PLATEAU04_RIGHT");
	Wld_InsertNpc		(Draconian,"PATH_TO_PLATEAU04_SMALLPATH");
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ROCK_DRACONIAN_09_1");
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ROCK_DRACONIAN_07_1");
	

	//Serpentinenwge nach oben
	Wld_InsertNpc		(StoneGolem,"LOCATION_19_03");    
	Wld_InsertNpc		(Draconian,"PLATEAU_ROUND07");    
	Wld_InsertNpc		(Draconian,"PLATEAU_ROUND07");    
	Wld_InsertNpc		(Draconian,"PLATEAU_ROUND07");    
	Wld_InsertNpc		(Draconian,"LOCATION_19_01");
	Wld_InsertNpc		(Draconian,"LOCATION_19_02_1");


	    //Brücke
	Wld_InsertNpc		(Draconian,"PATH_TO_PLATEAU04_BRIDGE2");
	Wld_InsertNpc		(Draconian,"PATH_TO_PLATEAU04_BRIDGE2");
	    
		//Platz vor Fokusplattform & Eingang
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_PATH_RUIN5");    

	Wld_InsertNpc		(Draconian,"LOCATION_19_03_PATH_RUIN7"); 
		
	Wld_InsertNpc		(StoneGolem,"LOCATION_19_03_PATH_RUIN8");    
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_PATH_RUIN11");    
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PATH_RUIN13");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PATH_RUIN15");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_PATH_RUIN16");    
		//EG: Leiterraum
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_PEMTAGRAM_ENTRANCE");    
	Wld_InsertNpc		(StoneGolem,"LOCATION_19_03_PEMTAGRAM_MOVEMENT");    
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_PENTAGRAMM");    
	
		//EG: Biblothek
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ROOM6");    
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ROOM6_BARRELCHAMBER");    
	
		//EG: Geheimkammer
	Wld_InsertNpc		(Demon,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");
		
		//EG: Linker Raum
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_ROOM3");
	
		//1.OG: Raum links vorne
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_SECOND_HARPYE1");
	Wld_InsertNpc		(StoneGolem,"LOCATION_19_03_SECOND_HARPYE2");
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_SECOND_ETAGE6");
		
		//1.OG: Raum links hinten
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_SECOND_HARPYE3");
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_SECOND_HARPYE4");
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_SECOND_ETAGE7");

		//Balkon vorne
	Wld_InsertNpc		(Draconian,"LOCATION_19_03_SECOND_ETAGE_BALCON2");
		

		//Burg zinnen
	Wld_InsertNpc		(Harpie,"OW_ROCKDRAGON_15");
	Wld_InsertNpc		(Harpie,"OW_ROCKDRAGON_14");
	Wld_InsertNpc		(Harpie,"OW_ROCKDRAGON_13");
		// beim Drachen
	Wld_InsertNpc		(Draconian,"OW_ROCKDRAGON_03");
	Wld_InsertNpc		(Draconian,"OW_ROCKDRAGON_07");

	

			
	//-----------------------ORK-GEBIET---------------------------------//
	
	Wld_InsertNpc	(Wolf,"OW_PATH_SNAPPER02_SPAWN01"); 
	Wld_InsertNpc	(Wolf,"OW_PATH_SNAPPER02_SPAWN01");
	Wld_InsertNpc	(Wolf,"OW_PATH_SNAPPER02_SPAWN01");
	Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SNAPPER_02_08");
	
	// östlicher Zugang vom AL

		Wld_InsertNpc		(Wolf,"SPAWN_O_SCAVENGER_OCWOODL2");
		Wld_InsertNpc		(Bloodfly,"SPAWN_O_SCAVENGER_OCWOODL2");

		//der Wald
		Wld_InsertNpc		(Keiler,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC3");
		Wld_InsertNpc		(Keiler,"FP_ROAM_OW_SCAVENGER_LONE_WALD_OC3");
		Wld_InsertNpc		(Bloodfly,"SPAWN_OW_WOLF2_WALD_OC3");
		Wld_InsertNpc		(Bloodfly,"SPAWN_OW_WOLF2_WALD_OC3");

		Wld_InsertNpc		(Bloodfly,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_InsertNpc		(Bloodfly,"SPAWN_WALD_OC_BLOODFLY01");
		Wld_InsertNpc		(Wolf,"SPAWN_OW_MOLERAT2_WALD_OC1");
		Wld_InsertNpc		(Wolf,"SPAWN_OW_MOLERAT2_WALD_OC1");
		Wld_InsertNpc		(Wolf,"SPAWN_OW_MOLERAT2_WALD_OC1");
	
		Wld_InsertNpc		(Snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		
		Wld_InsertNpc		(Wolf,"PATH_WALD_OC_MOLERATSPAWN");
		Wld_InsertNpc		(Wolf,"PATH_WALD_OC_MOLERATSPAWN");

		Wld_InsertNpc		(Wolf,"SPAWN_OW_WOLF2_WALD_OC2");
		Wld_InsertNpc		(Wolf,"SPAWN_OW_SCAVENGER_INWALD_OC2");

		// vor OC2
		Wld_InsertNpc		(Snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
		Wld_InsertNpc		(Snapper,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");

		Wld_InsertNpc		(Snapper,"SPAWN_OW_WARAN_OC_PSI3");
		Wld_InsertNpc		(Snapper,"SPAWN_OW_WARAN_OC_PSI3");

	// Kapitel2 Canyon "Gilbert´s Höhle"
		
		Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SNAPPER_OW_ORC5"); 
		Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SNAPPER_OW_ORC_MOVE");
	
		Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SNAPPER_OW_ORC3");
		Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SNAPPER_OW_ORC");
	
		Wld_InsertNpc	(Wolf,"FP_ROAM_OW_SNAPPER_OW_ORC");
	
		Wld_InsertNpc	(Wolf,"FP_ROAM_ORC_01");
		
		Wld_InsertNpc	(Wolf,"CASTLE_2"); 
	
		Wld_InsertNpc	(Waran,"OW_PATH_104");
		Wld_InsertNpc	(Waran,"OW_PATH_104");
			
		Wld_InsertNpc	(Wolf,"OW_PATH_BLACKWOLF07_SPAWN01");
		Wld_InsertNpc	(Wolf,"OW_PATH_BLACKWOLF07_SPAWN01");
		
		Wld_InsertNpc	(Waran,"CASTLE_3");
		Wld_InsertNpc	(Waran,"CASTLE_4");
		Wld_InsertNpc	(Waran,"OW_PATH_109");

	// westlicher Zugang vom AL

	
	Wld_InsertNpc	(Bloodfly,"OW_ORC_ORCDOG_MOVEMENT_02"); 
	
	
	Wld_InsertNpc	(Wolf,"OW_PATH_195");
	Wld_InsertNpc	(Wolf,"OW_PATH_195");

	Wld_InsertNpc	(Warg,"OW_ORC_ORCDOG_SPAWN01");
	Wld_InsertNpc	(Warg,"FP_ROAM_OW_WOLF_02_12");
	
	
	Wld_InsertNpc	(Bloodfly,"SPAWN_OW_MOLERAT_ORC_04");
	Wld_InsertNpc	(Bloodfly,"SPAWN_OW_MOLERAT_ORC_04");
	Wld_InsertNpc	(Bloodfly,"SPAWN_OW_MOLERAT_ORC_04");



	//Zugang von NL 
	
	Wld_InsertNpc	(Snapper,"SPAWN_OW_WOLF_NEAR_SHADOW3");
	
	Wld_InsertNpc	(Snapper,"OW_PATH_3_09");
	Wld_InsertNpc	(Snapper,"OW_PATH_3_09");
	Wld_InsertNpc	(Snapper,"OW_PATH_3_09"); 
	Wld_InsertNpc	(Snapper,"SPAWN_OW_SHADOWBEAST_10_03");
	Wld_InsertNpc	(Snapper,"SPAWN_OW_SHADOWBEAST_10_03");
	
	
	Wld_InsertNpc	(OrcShaman_Sit,"FP_ROAM_ORC_2_1_9");
	Wld_InsertNpc	(OrcWarrior_Roam,"OW_PATH_3_05");
	Wld_InsertNpc	(OrcWarrior_Roam,"FP_ROAM_ORC_2_1_8");
		
	

		//-----------------------Kastell FireDragon---------------------------------//
	
	
	Wld_InsertNpc	(FireWaran,	"CASTLE_5_1"); 
	Wld_InsertNpc	(FireWaran,	"CASTLE_5_1");
	Wld_InsertNpc	(FireWaran,	"CASTLE_5_1");
	
	
	Wld_InsertNpc	(FireWaran,	"CASTLE_8_1");
	Wld_InsertNpc	(FireWaran,	"CASTLE_8_1"); 
	Wld_InsertNpc	(FireWaran,	"CASTLE_8_1");
	
	
	Wld_InsertNpc	(FireGolem,	"FP_ROAM_CASTLE_8_02");
	Wld_InsertNpc	(Draconian,	"CASTLE_8");
	Wld_InsertNpc	(Draconian,	"CASTLE_8");
	Wld_InsertNpc	(Draconian,	"CASTLE_8");
	
	Wld_InsertNpc	(FireGolem,	"CASTLE_15");
	
	Wld_InsertNpc	(Draconian,	"CASTLE_16"); 
	Wld_InsertNpc	(Draconian,	"CASTLE_16");
	Wld_InsertNpc	(Draconian,	"CASTLE_18");
	Wld_InsertNpc	(Draconian,	"CASTLE_20");
	Wld_InsertNpc	(Draconian,	"CASTLE_22");
	Wld_InsertNpc	(Draconian,	"CASTLE_22");
	Wld_InsertNpc	(Draconian,	"CASTLE_27");
	
	Wld_InsertNpc	(Draconian,	"CASTLE_28");
	
	Wld_InsertItem	(ItMi_Zeitspalt_Addon,"OW_ITEM_FIREHORT_01");

	
		//-------Beim FireDragon--------//
	
	//Joly:Wld_InsertNpc	(Draconian,	"CASTLE_31");
	//Joly:Wld_InsertNpc	(Draconian,	"CASTLE_34");
	
		//---------------//
		
	Wld_InsertNpc	(FireGolem,	"OW_PATH_012");
	Wld_InsertNpc	(Draconian,	"OW_PATH_012");
	Wld_InsertNpc	(Draconian,	"OW_PATH_012");
	Wld_InsertNpc	(Draconian,	"OW_PATH_012");
	
		
	Wld_InsertNpc	(Draconian,	"PATH_CASTLE_TO_WATERFALL");
	Wld_InsertNpc	(Draconian,	"PATH_CASTLE_TO_WATERFALL");
	Wld_InsertNpc	(Draconian,	"PATH_CASTLE_TO_WATERFALL");
	

	//Wld_InsertNpc				(GRD_254_Orry,"OC1");
	//bis
	//Wld_InsertNpc				(Non_1500_Gilbert,"LOCATION_01_07");	


	//------------Toter Gardist---------------------------------------------
	//Wld_InsertNpc				(GRD_282_Nek,"");
	//var C_NPC nek; nek = Hlp_GetNpc(GRD_282_Nek);
	//Npc_ChangeAttribute	(nek, ATR_HITPOINTS, -nek.attribute[ATR_HITPOINTS_MAX]);
	
	
	// --------ITEMS in den vergessenen Höhlen/Locations -----------------
	//Wld_InsertItem			(ItArScrollIcecube,"FP_SLEEP_OW_SNAPPER_HERD1_02");
	//bis
	//Wld_InsertItem			(ItFo_POTION_HEALTH_03,"FP_ROAM_OW_LURKER_BEACH_04");
	

	//----------------------- MH: Monster werden neu verteilt ----------------------
	//Wld_InsertNpc		(Bloodhound, "OW_PATH_012");
	//bis	
	//Wld_InsertNpc	(Zombie4,			"MAGICTOWER_06"); 

};

	FUNC VOID INIT_SUB_SURFACE()
	{
		// ------ Xardas Turm ------- 
		Wld_AssignRoomToGuild("DT1", GIL_DMT);
		Wld_AssignRoomToGuild("DT2", GIL_DMT); //wichtig, damit Diego nicht folgt
		
		B_ENTER_OLDWORLD();
	};

FUNC VOID INIT_SURFACE ()
{
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();    
	
	INIT_SUB_SURFACE();
};



// ------  OLDWORLD.zen ------
FUNC VOID INIT_OLDWORLD ()
{
	INIT_SUB_Oldcamp();
	INIT_SUB_Demontower();
	INIT_SUB_Surface();

    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();    
	B_ENTER_OLDWORLD();

	if (MIS_ReadyForChapter4  == TRUE )	//Joly: muß hier in der INIT ganz zum schluss stehen, nachdem alle NSCs fürs Kapitel insertet wurden!!!
	&& (B_Chapter4_OneTime == FALSE)
	{
		B_Kapitelwechsel (4, OLDWORLD_ZEN);
		B_Chapter4_OneTime = TRUE;
	};
};

FUNC VOID STARTUP_OLDWORLD ()
{
	Startup_Oldcamp();
	Startup_Demontower();
	Startup_Surface();
	Wld_SetTime	(00,00);//Joly:nachtstart wegen video
};

// *************
// Neue Oberwelt
// *************

// ------ CITY -------
func void STARTUP_NewWorld_Part_City_01()
{
	// Allgemein 
	// ----------------------
	// 5 - 6 Uhr Vorbereitung
	// 6 - 20 Uhr Arbeiten
	// 20 - 0 Uhr Freizeit
	// 0 - 5 Uhr Schlafen oder Kneipe
	// ------------------------------
	
	//ITEMS Türme
	Wld_InsertItem (ItMw_Zweihaender1,"FP_CITY_WEAPON_01");//
	Wld_InsertItem (ItMw_Schwert,"FP_CITY_WEAPON_02");//
	Wld_InsertItem (ItMw_Zweihaender2,"FP_CITY_WEAPON_03");//
	Wld_InsertItem (ItMw_Schwert4,"FP_CITY_WEAPON_04");//
	Wld_InsertItem (ItMw_Kriegshammer2,"FP_CITY_WEAPON_05");//
	Wld_InsertItem (ItMw_ShortSword5,"FP_CITY_WEAPON_06");//
	
	Wld_InsertItem (Itke_Buerger,"FP_ITEM_OV_01");//
	Wld_InsertItem (ItWr_Pfandbrief_MIS,"FP_ITEM_OV_02");//
	
	//---Südtor--------------------
	Wld_InsertNpc (Mil_309_Stadtwache	,"NW_CITY_ENTRANCE_01");	//Stadttorwache
	Wld_InsertNpc (Mil_310_Stadtwache	,"NW_CITY_ENTRANCE_01");	//Stadttorwache Important
	
	//---Hauptstrasse--------------
	Wld_InsertNpc (VLK_458_Rupert		, "NW_CITY_ENTRANCE_01");	//Essensstand, pennt bei Matteo - NW_City_Bed_Rupert
	Wld_InsertNpc (VLK_499_Buerger		, "NW_CITY_ENTRANCE_01");	//OV-Bürger. Ißt an Stand, Smalltalk im OV, pennt iv ??? (OV)
	Wld_InsertNpc (VLK_416_Matteo		, "NW_CITY_ENTRANCE_01");	//Ausrüstungs-Händler, pennt in NW_City_Bed_Matteo
	Wld_InsertNpc (MIL_325_Miliz 		, "NW_CITY_ENTRANCE_01");	//TORWACHE vor Matteos Lager
	Wld_InsertNpc (VLK_425_Regis		, "NW_CITY_ENTRANCE_01");	//Bank, Abends Smalltalk vor Kneipe, nachts in Stadtkneipe.
	Wld_InsertNpc (VLK_451_Buerger		, "NW_CITY_ENTRANCE_01");	//Smalltalk mit 452, Smalltalk mit Thorben, nachts in Kneipe 
	Wld_InsertNpc (VLK_452_Buerger		, "NW_CITY_ENTRANCE_01");	//Smalltalk mit 451, pennt in OV - wo ???
	//-----------------------------
	Wld_InsertNpc (VLK_413_Bosper 		, "NW_CITY_ENTRANCE_01");	//Bogner, lebt und pennt in NW_CITY_BED_GRITTA
	Wld_InsertNpc (VLK_427_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//Bospers Frau, Smalltalk mit 452, pennt in NW_CITY_MERCHANT_SHOP01_IN_01
	//-----------------------------
	Wld_InsertNpc (VLK_462_Thorben		, "NW_CITY_ENTRANCE_01"); 	//Schreiner, pennt in NW_CITY_BED_BOSPER
	Wld_InsertNpc (VLK_418_Gritta		, "NW_CITY_ENTRANCE_01"); 	//Nichte vom Schreiner - Mission "Kleid" - lebt und pennt in NW_CITY_BED_BOSPER_B
	//-----------------------------
	Wld_InsertNpc (VLK_412_Harad	 	, "NW_CITY_ENTRANCE_01");	//Schmied, pennt in NW_City_Bed_Harad
	Wld_InsertNpc (VLK_457_Brian		, "NW_CITY_ENTRANCE_01");	//Schmiedgehilfe, abends Smalltalk vor Kneipe, pennt in NW_City_Bed_Brian
	
	//--------------------Turm bei Gritta -----------------------
	Wld_InsertNpc (VLK_448_Joe			, "NW_CITY_ENTRANCE_01");	//Dieb wurde dummerweise eingesperrt
	//-----------------------------
	Wld_InsertNpc (Mil_319_Pablo		, "NW_CITY_ENTRANCE_01");	//Steckbrief-Miliz, Rotationswache Hauptstrasse/Kneipenstrasse/Vatras-Platz
	
	//---Alchemist-----------------
	Wld_InsertNpc (VLK_417_Constantino	, "NW_CITY_ENTRANCE_01");	//Alchemy Master, lebt und pennt in NW_City_Bed_Velax
	
	//---Kneipenstrasse und Vatras-Platz---
	Wld_InsertNpc (VLK_420_Coragon 		, "NW_CITY_ENTRANCE_01");	//Wirt Stadtkneipe 24h
	//------------------------------
	Wld_InsertNpc (Mil_323_Miliz		, "NW_CITY_ENTRANCE_01"); 	//Rotationswache Hauptstrasse/Kneipenstrasse/Vatras-Platz
	//------------------------------
	Wld_InsertNpc (VLK_439_Vatras	 	, "NW_CITY_ENTRANCE_01");	//24 im Schrein, betet nachts am Schrein
	Wld_InsertNpc (VLK_426_Buergerin	, "NW_CITY_ENTRANCE_01");	//Zuhörerin, nachts vor Stadtkneipe
	Wld_InsertNpc (VLK_428_Buergerin	, "NW_CITY_ENTRANCE_01");	//Zuhörerin, nachts Smalltalk Bierstand
	Wld_InsertNpc (VLK_450_Buerger		, "NW_CITY_ENTRANCE_01");	//Zuhörer, nachts vor Stadtkneipe
	Wld_InsertNpc (VLK_454_Buerger		, "NW_CITY_ENTRANCE_01");	//Zuhörer, nachts an Blubber
	Wld_InsertNpc (VLK_455_Buerger		, "NW_CITY_ENTRANCE_01");	//Zuhörer, nachts Smalltalk Bierstand
	Wld_InsertNpc (VLK_421_Valentino	, "NW_CITY_ENTRANCE_01"); 	//OV-Bürger, 
	//------------------------------	
	Wld_InsertNpc (Mil_322_Miliz		, "NW_CITY_ENTRANCE_01");	//Rotationswache Hauptstrasse/Kneipenstrasse/Vatras-Platz
	
	//---Galgenplatz-------------------
	Wld_InsertNpc (VLK_4201_Wirt		, "NW_CITY_ENTRANCE_01"); 	//Bierstand Wirt, 24h
	Wld_InsertNpc (NOV_602_Ulf			, "NW_CITY_ENTRANCE_01");	//am saufen, 24h, ab Kap ??? wo?		
	Wld_InsertNpc (VLK_406_Herold		, "NW_CITY_ENTRANCE_01");	//HEROLD, pennt in OV oder Kaserne - wo ???
	Wld_InsertNpc (VLK_456_Abuyin		, "NW_CITY_ENTRANCE_01");	//Wasserpfeifen-Händler, pennt in Hotel
	Wld_InsertNpc (VLK_440_Bartok	 	, "NW_CITY_ENTRANCE_01");	//Bogenlehrer, nachts vor Stadtkneipe
	
	//---Hotel-------------------------
	Wld_InsertNpc (VLK_414_Hanna	 	, "NW_CITY_ENTRANCE_01"); 	//Hotelbesitzerin, 24h
	
	//---Marktplatz--------------------
	Wld_InsertNpc (VLK_407_Hakon		, "NW_CITY_ENTRANCE_01");	//Waffenhändler, nachts in Hotel
	Wld_InsertNpc (VLK_408_Jora			, "NW_CITY_ENTRANCE_01");	//Krämer, nachts in Hotel
	Wld_InsertNpc (VLK_409_Zuris		, "NW_CITY_ENTRANCE_01");	//Trankhändler, nachts in Zuris Haus
	Wld_InsertNpc (VLK_410_Baltram		, "NW_CITY_ENTRANCE_01");	//Lebensmittelhändler, nachts in Hotel
	Wld_InsertNpc (VLK_470_Sarah		, "NW_CITY_ENTRANCE_01");	//Waffenhändlerin (Canthars Opfer), nachts in Hotel
	Wld_InsertNpc (VLK_492_Rengaru		, "NW_CITY_ENTRANCE_01");	//Dieb, der wegrennt, wenn man ihn zur Rede stellt, nachts an Bierstand
	Wld_InsertNpc (KDF_511_Daron		, "NW_CITY_ENTRANCE_01");	//Magier auf Marktplats, nachts in Zuris Haus
	//---------------------------------
	Wld_InsertNpc (VLK_486_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//Zuris Frau, nachts in Zuris Haus
	Wld_InsertNpc (VLK_495_Buergerin	, "NW_CITY_ENTRANCE_01");	//Coragons Frau, nachts in Kneipe (kocht)	
	Wld_InsertNpc (VLK_496_Buergerin	, "NW_CITY_ENTRANCE_01");	//OV-Frau, nachts ???		
	Wld_InsertNpc (VLK_497_Buergerin	, "NW_CITY_ENTRANCE_01");	//OV-Frau, nachts ???
	//---------------------------------
	Wld_InsertNpc (Mil_320_Miliz		, "NW_CITY_ENTRANCE_01");	//Marktplatzwache 24h
			
	//---Osttor------------------------
	Wld_InsertNpc (Mil_332_Stadtwache 	, "NW_CITY_ENTRANCE_01");	//Stadttorwache
	Wld_InsertNpc (Mil_333_Stadtwache 	, "NW_CITY_ENTRANCE_01");	//Stadttorwache Important

	//---------------------------------
	//---Weg zum Hafen-----------------
	Wld_InsertNpc (VLK_484_Lehmar		, "NW_CITY_ENTRANCE_01"); 	//Geldverleiher, hafen04, pennt in hafen04
	Wld_InsertNpc (VLK_488_Buergerin	, "NW_CITY_ENTRANCE_01");	//Lehmars Frau, pennt in hafen04
	Wld_InsertNpc (VLK_415_Meldor		, "NW_CITY_ENTRANCE_01"); 	//Einer von Lehmars Schlägern, pennt in hafen03
	Wld_InsertNpc (VLK_487_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//Meldors Frau, pennt in hafen03

	//---Platz A----------- (Fight Club)	
	Wld_InsertNpc (VLK_438_Alrik	 	, "NW_CITY_ENTRANCE_01");	//Kampf-Veranstalter, NW_City_Path_Habour_16_01, nachts in Hintrhof auf Bank
	Wld_InsertNpc (VLK_467_Buerger		, "NW_CITY_ENTRANCE_01"); 	//Kampf-Zuschauer, NW_City_Watch_Fight_01, nachts in Puff
	Wld_InsertNpc (VLK_475_Buerger		, "NW_CITY_ENTRANCE_01"); 	//Kampf-Zuschauer, NW_City_Watch_Fight_02, nachts in Puff
	Wld_InsertNpc (VLK_489_Buerger		, "NW_CITY_ENTRANCE_01"); 	//Kampf-Zuschauer, NW_City_Watch_Fight_03, nachts in Puff
		
	//---Platz B-----------	(Schrebergarten)
	//Alwins Frau und Fellans Frau

	//---Platz C----------- (Schlachter)
	Wld_InsertNpc (VLK_424_Alwin		, "NW_CITY_ENTRANCE_01");	//Metzger, pennt in hafen02 - NW_City_Habour_Hut_07_Bed_01
	Wld_InsertNpc (VLK_479_Lucy	, "NW_CITY_ENTRANCE_01"); 	//Alwins Frau, Gärtnerin, NW_City_Pick_02, pennt in hafen02
	Wld_InsertNpc (Hammel			, "NW_CITY_SHEEP_SPAWN_02");	//Schaf
	Wld_InsertNpc (Sheep			, "NW_CITY_SHEEP_SPAWN_01");	//Schaf
	Wld_InsertNpc (Sheep			, "NW_CITY_SHEEP_SPAWN_01");	//Schaf
	
	//---Ratten in Gasse---------------
	//Wld_InsertNpc (Giant_Rat			, "NW_CITY_RATS_01");		//Hintergasse 04/05/06
	//Wld_InsertNpc (Giant_Rat			, "NW_CITY_RATS_01");		//Hintergasse 04/05/06
		
	//---Platz D----------- (Arme Handwerker)
	Wld_InsertNpc (VLK_461_Carl			, "NW_CITY_ENTRANCE_01"); 	//Schmied, pennt in hafen07
	Wld_InsertNpc (VLK_429_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//Carls Frau, pennt in hafen07
	Wld_InsertNpc (VLK_453_Buerger		, "NW_CITY_ENTRANCE_01");	//Sägt, pennt in hafen06
	Wld_InsertNpc (VLK_430_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//Frau vom Säger, pennt in hafen 06
	
	//---Forscher----------
	Wld_InsertNpc (VLK_498_Ignaz		, "NW_CITY_ENTRANCE_01"); 	//verrückter Forscher, hafen09, lebt und pennt da
	
	//---Platz E----------- (Edda)
	Wld_InsertNpc (VLK_471_Edda			, "NW_CITY_ENTRANCE_01"); 	//Kocht für die Armen, pennt in hafen08 - NW_City_Habour_Poor_Area_Hut_06_Bed_02
	//Bett frei (Bed_01)

	//---Platz F----------- (Fellan)
	Wld_InsertNpc (VLK_480_Fellan		, "NW_CITY_ENTRANCE_01"); 	//irrer Hämmerer, pennt in FELLAN - NW_City_Habour_Hut_05_Bed_01
	Wld_InsertNpc (VLK_478_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//Fellans Frau, Gärtnerin, NW_City_Pick_01, pennt in FELLAN
	Wld_InsertNpc (VLK_481_Buerger		, "NW_CITY_ENTRANCE_01"); 	//pennt in hafen01
	Wld_InsertNpc (VLK_482_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//pennt in hafen01
	
	//---Platz G -----------
	Wld_InsertNpc (VLK_466_Gernod		, "NW_CITY_ENTRANCE_01"); 	//pennt in hafen05
	Wld_InsertNpc (VLK_485_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//Gernods Frau, pennt in hafen05
	
	//---Spaziergänger für Hafen---------
	Wld_InsertNpc (VLK_459_Buerger		, "NW_CITY_ENTRANCE_01"); 	//pennt in hafen10
	Wld_InsertNpc (VLK_472_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//pennt in hafen10
	//--------------------------------
	Wld_InsertNpc (VLK_460_Buerger		, "NW_CITY_ENTRANCE_01"); 	//pennt in hafen11
	Wld_InsertNpc (VLK_473_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//pennt in hafen11
	
	//---Hafen--------------
	Wld_InsertNpc (VLK_449_Lares		, "NW_CITY_ENTRANCE_01");	//Steht am Kai (PreStart 24h), dann nachts in Kneipe
	Wld_InsertNpc (VLK_444_Jack			, "NW_CITY_ENTRANCE_01");	//am Kai, wartet, daß der Leuchtturm frei wird

	//---Hafenkneipe---------
	Wld_InsertNpc (VLK_432_Moe	 		, "NW_CITY_ENTRANCE_01");	//Rausschmeisser 24h
	Wld_InsertNpc (VLK_431_Kardif	 	, "NW_CITY_ENTRANCE_01");	//24h Wirt
	Wld_InsertNpc (VLK_493_Nagur		, "NW_CITY_ENTRANCE_01");	//24h an Tisch in Hafenkneipe
	
	//---Puff-----------------
	Wld_InsertNpc (VLK_433_Bromor	 	, "NW_CITY_ENTRANCE_01");	//Puff-Besitzer hinter Theke, pennt in ???
	Wld_InsertNpc (VLK_434_Borka	 	, "NW_CITY_ENTRANCE_01");	//Türsteher Puff 24h
	Wld_InsertNpc (VLK_435_Nadja	 	, "NW_CITY_ENTRANCE_01");	//pennt in ???
	Wld_InsertNpc (VLK_436_Sonja	 	, "NW_CITY_ENTRANCE_01");	//???
	Wld_InsertNpc (VLK_491_Vanja	 	, "NW_CITY_ENTRANCE_01");	//???
	
	//---Fischhändler------------------
	Wld_InsertNpc (VLK_469_Halvor	 	, "NW_CITY_ENTRANCE_01");	//hinter Stand, pennt in NW_City_Bed_Halvor
	Wld_InsertNpc (VLK_476_Fenia	   	, "NW_CITY_ENTRANCE_01"); 	//Halvors Frau, Händlerin auf Hafenstrasse, pennt in FISCH

	//---Kartenzeichner----------------
	Wld_InsertNpc (VLK_437_Brahim	 	, "NW_CITY_ENTRANCE_01"); 	//Kartenzeichner, pennt in KARTEN
	Wld_InsertNpc (VLK_477_Buergerin	, "NW_CITY_ENTRANCE_01"); 	//Brahims Frau, pennt in KARTEN

	//---Werft-------------------------
	Wld_InsertNpc (VLK_441_Garvell		, "NW_CITY_ENTRANCE_01");	//Bootsbauer, nachts in Kneipe
	Wld_InsertNpc (VLK_442_Arbeiter		, "NW_CITY_ENTRANCE_01");	//Werft Arbeiter, nachts vor Kneipe
	Wld_InsertNpc (VLK_443_Arbeiter		, "NW_CITY_ENTRANCE_01");	//Werft Arbeiter, nachts vor Kneipe

	//---Schiff--------------------
	Wld_InsertNpc (Pal_212_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//GateGuard, 24h
	Wld_InsertNpc (Pal_213_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//GateGuard, 24h 
	Wld_InsertNpc (Pal_220_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//auf dem Schiff
	Wld_InsertNpc (Pal_221_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//auf dem Schiff
	Wld_InsertNpc (Pal_222_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//auf dem Schiff 
	Wld_InsertNpc (Pal_223_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//auf dem Schiff
	Wld_InsertNpc (Pal_224_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//auf dem Schiff 
	Wld_InsertNpc (Pal_225_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//auf dem Schiff
	Wld_InsertNpc (Pal_226_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//auf dem Schiff 
	Wld_InsertNpc (Pal_227_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//auf dem Schiff
	Wld_InsertNpc (Pal_228_Schiffswache, "NW_CITY_ENTRANCE_01"); 	//auf dem Schiff
	
	//Items, die auf dem Schiff zu finden sind!
		
	Wld_InsertItem			(ItMi_Moleratlubric_MIS,"FP_ITEM_SHIP_07");	//zur Sicherheit für Vinos Brennerei!
	Wld_InsertItem			(ItSe_GoldPocket25,"FP_ITEM_SHIP_01"); 
	Wld_InsertItem			(ItRi_Prot_Point_02,"FP_ITEM_SHIP_02");
	Wld_InsertItem			(ItPo_Mana_03,"FP_ITEM_SHIP_03");
	Wld_InsertItem			(ItSe_GoldPocket25,"FP_ITEM_SHIP_04");
	Wld_InsertItem			(ItPo_Speed,"FP_ITEM_SHIP_05");
	Wld_InsertItem			(ItPo_Perm_STR,"FP_ITEM_SHIP_06");
	Wld_InsertItem			(ItPo_Health_03,"FP_ITEM_SHIP_08");
	Wld_InsertItem			(ItMiSwordraw,"FP_ITEM_SHIP_09");
	Wld_InsertItem			(ItSe_GoldPocket25,"FP_ITEM_SHIP_10");
	Wld_InsertItem			(ItSe_GoldPocket50,"FP_ITEM_SHIP_11");
	Wld_InsertItem			(ItSc_Zap,"FP_ITEM_SHIP_12");
	Wld_InsertItem			(ItSc_SumWolf,"FP_ITEM_SHIP_12");
	Wld_InsertItem			(ItSc_Sleep,"FP_ITEM_SHIP_12");
	Wld_InsertItem			(ItMi_nugget,"FP_ITEM_SHIP_13");
	Wld_InsertItem			(ItPo_Mana_02,"FP_ITEM_SHIP_14");
	Wld_InsertItem			(ItSe_GoldPocket25,"FP_ITEM_SHIP_15");

	//---PaladinCamp am Hafen---------
	Wld_InsertNpc (Pal_230_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_231_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_232_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_233_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_234_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_235_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_236_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_237_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_238_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_239_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_240_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Pal_241_Ritter, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (Mil_350_Addon_Martin, "NW_CITY_ENTRANCE_01"); 	
	Wld_InsertNpc (VLK_4301_Addon_Farim, "NW_CITY_ENTRANCE_01"); 	
	
	//---------------------------------
	//---Kaserne-----------------------
	Wld_InsertNpc (Mil_311_Andre		, "NW_CITY_ENTRANCE_01");	//Paladin, Milizkommandant
	
	Wld_InsertNpc (Mil_324_Peck			, "NW_CITY_ENTRANCE_01");	//Waffenausgabe, PreStart im Puff
	//***Gehilfe
	
	Wld_InsertNpc (Mil_312_Wulfgar		, "NW_CITY_ENTRANCE_01");	//1h - 60
	Wld_InsertNpc (Mil_317_Ruga			, "NW_CITY_ENTRANCE_01");	//2h - 60 und  STR Lehrer
	Wld_InsertNpc (Mil_313_Boltan		, "NW_CITY_ENTRANCE_01");	//Gefängniswärter
	//NEU Mortis: STR-Lehrer
	
	Wld_InsertNpc (Mil_327_Miliz		, "NW_CITY_ENTRANCE_01");	//SMALLTALK Partner von Boltan
	Wld_InsertNpc (Mil_314_Mortis		, "NW_CITY_ENTRANCE_01");	//Schmied
	Wld_InsertNpc (Mil_315_Kasernenwache, "NW_CITY_ENTRANCE_01");	//Schleifer
	
	Wld_InsertNpc (Mil_329_Miliz		, "NW_CITY_ENTRANCE_01");	//Azubi
 	Wld_InsertNpc (Mil_330_Miliz		, "NW_CITY_ENTRANCE_01");	//Azubi
	Wld_InsertNpc (Mil_331_Miliz		, "NW_CITY_ENTRANCE_01");	//Azubi
	Wld_InsertNpc (Mil_318_Miliz		, "NW_CITY_ENTRANCE_01");	// KasernenWache

	//---------Kanalisation ------------------
	Wld_InsertNpc (VLK_445_Ramirez		, "NW_CITY_ENTRANCE_01");	// 
	Wld_InsertNpc (VLK_446_Jesper		, "NW_CITY_ENTRANCE_01");	// 
	Wld_InsertNpc (VLK_447_Cassia		, "NW_CITY_ENTRANCE_01");	// 
	
	Wld_InsertNpc (Giant_Rat			, "NW_CITY_KANAL_ROOM_01_01");	// 
	Wld_InsertNpc (Giant_Rat			, "NW_CITY_KANAL_ROOM_01_02");	// 
	Wld_InsertNpc (Giant_Rat			, "NW_CITY_KANAL_ROOM_01_03");	// 
	Wld_InsertNpc (Giant_Rat			, "NW_CITY_KANAL_06");	// 
	Wld_InsertNpc (Giant_Rat			, "NW_CITY_KANAL_07");	// 
	//----------------------------------------------------------------
	Wld_InsertNpc	(Mil_328_Miliz, "NW_CITY_ENTRANCE_01");// Lagerhaus Wache
	//----------------------------------------------------------------

	//Wld_InsertNpc 	(VLK_474_Buerger	, "NW_CITY_ENTRANCE_01"); //
	//Wld_InsertNpc		(VLK_463_Buerger	, "NW_CITY_ENTRANCE_01"); // SMALLTALK  GEMÜSE
	//Wld_InsertNpc		(VLK_464_Buerger	, "NW_CITY_ENTRANCE_01"); // SMALLTALK  GEMÜSE
	//Wld_InsertNpc		(VLK_465_Buerger	, "NW_CITY_ENTRANCE_01"); // DRINKING 	GEMÜSE
	
	//Wld_InsertNpc		(VLK_483_Buergerin	, "NW_CITY_ENTRANCE_01"); // SMALLTALK  GEMÜSE
	//Wld_InsertNpc		(VLK_490_Buergerin	, "NW_CITY_ENTRANCE_01"); // SMALLTALK  GEMÜSE

	//Wld_InsertNpc		(VLK_4200_Buergerin	, "NW_CITY_ENTRANCE_01"); //Smalltalk

	//ADDON>
	//Piratenlager an der Küste
	Wld_InsertNpc	(PIR_1301_Addon_Skip_NW, "NW_CITY_ENTRANCE_01");
	//ADDON<

	//------------------------------------
	//---oberes Viertel-------------------
	//------------------------------------
	Wld_InsertNpc		(Mil_304_Torwache	, "NW_CITY_ENTRANCE_01");	//Torwache Bürgerviertel 24h
	Wld_InsertNpc		(Mil_305_Torwache	, "NW_CITY_ENTRANCE_01");	//Torwache Bürgerviertel Important 24h
	//------------------------------------
	Wld_InsertNpc		(PAL_200_Hagen			, "NW_CITY_ENTRANCE_01");// 
	Wld_InsertNpc		(PAL_201_Ingmar			, "NW_CITY_ENTRANCE_01");//Str-Lehrer
	Wld_InsertNpc		(PAL_202_Albrecht		, "NW_CITY_ENTRANCE_01");//Mana-Lehrer
	Wld_InsertNpc		(PAL_203_Lothar			, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_204_Torwache		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_205_Torwache		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_206_Ritter			, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_207_Girion			, "NW_CITY_ENTRANCE_01");//2H-Lehrer
	//NEU Cedric: 1H Lehrer
	Wld_InsertNpc		(PAL_208_Paladin		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_209_Paladin		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_210_Torwache		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_211_Torwache		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_214_Ritter			, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_215_Ritter			, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(PAL_216_Cedric			, "NW_CITY_ENTRANCE_01");//
	
	Wld_InsertNpc		(VLK_400_Larius			, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_401_Cornelius		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_402_Richter		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_403_Gerbrandt		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_404_Lutero			, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_405_Fernando		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_411_Gaertner		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_422_Salandril		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_419_Buerger		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_4000_Buerger		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_4001_Buergerin		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_4002_Buergerin		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_4003_Buergerin		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_4004_Arbeiter		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(VLK_4005_Arbeiter		, "NW_CITY_ENTRANCE_01");//
	
	Wld_InsertNpc		(MIL_302_Torwache		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(MIL_303_Torwache		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(MIL_306_Tuerwache		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(MIL_307_Tuerwache		, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(MIL_316_Wambo			, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(MIL_321_Rangar			, "NW_CITY_ENTRANCE_01");//
	Wld_InsertNpc		(MIL_326_Miliz			, "NW_CITY_ENTRANCE_01");//
	
	//------------------------------------
	//---Insel-------------------
	//------------------------------------
	Wld_InsertNpc		(Waran					, "FP_ROAM_INSEL_01");//
	Wld_InsertNpc		(Waran					, "FP_ROAM_INSEL_03");//
	Wld_InsertNpc		(Waran					, "FP_ROAM_INSEL_05");//
	Wld_InsertNpc		(Waran					, "FP_ROAM_INSEL_07");//
	Wld_InsertItem 		(ItWr_OneHStonePlate2_Addon		, "FP_ROAM_INSEL_07");//
	Wld_InsertNpc		(Waran					, "FP_ROAM_INSEL_09");//
	Wld_InsertItem 		(ItWr_BowStonePlate2_Addon		, "FP_ROAM_INSEL_10");//
	Wld_InsertNpc		(Waran					, "FP_ROAM_INSEL_11");//
	Wld_InsertNpc		(Waran					, "FP_ROAM_INSEL_13");//


	//-------------------------------------
	//------ Muscheln --------
	//-------------------------------------
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_01");
	Wld_InsertItem		(ItWr_ManaStonePlate2_Addon, "FP_SHELLSPAWN_CITY_02");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_02");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_03");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_04");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_05");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_06");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_07");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_08");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_09");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_10");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_11");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_12");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_13");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_14");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_15");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_16");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_17");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_18");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_19");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_20");	
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_21");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_22");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_23");
	Wld_InsertItem		(ItMi_Addon_Shell_02, "FP_SHELLSPAWN_CITY_24");
	Wld_InsertItem		(ItMi_Addon_Shell_01, "FP_SHELLSPAWN_CITY_25");
	
};

	func void INIT_SUB_NewWorld_Part_City_01()
	{
		//---Laternen---
		Wld_SetMobRoutine (00,00, "FIREPLACE", 1);
		Wld_SetMobRoutine (20,00, "FIREPLACE", 1);
		Wld_SetMobRoutine (05,00, "FIREPLACE", 0);
		
		
		//---------------- PORTALRÄUME ------------------------ 
		
		//Hafenviertel
		Wld_AssignRoomToGuild ("hafen01",		GIL_VLK);
		Wld_AssignRoomToGuild ("hafen02",		GIL_VLK);
		Wld_AssignRoomToGuild ("hafen03",		GIL_VLK);
		Wld_AssignRoomToGuild ("hafen04",		GIL_PUBLIC); //Lehmar
		Wld_AssignRoomToGuild ("hafen05",		GIL_VLK);
		Wld_AssignRoomToGuild ("hafen06",		GIL_VLK);
		Wld_AssignRoomToGuild ("hafen07",		GIL_VLK);
		
		if (Edda_Schlafplatz == TRUE)
		{
			Wld_AssignRoomToGuild ("hafen08",	GIL_NONE); //EDDA
		}
		else
		{
			Wld_AssignRoomToGuild ("hafen08",		GIL_VLK); //EDDA
		};
		Wld_AssignRoomToGuild ("hafen09",		GIL_PUBLIC); //Ignaz
		Wld_AssignRoomToGuild ("hafen10",		GIL_VLK);
		Wld_AssignRoomToGuild ("hafen11",		GIL_VLK);
		Wld_AssignRoomToGuild ("fellan",		GIL_VLK);
		//Wld_AssignRoomToGuild ("boot",			GIL_VLK); - ist RAUS
		Wld_AssignRoomToGuild ("fisch",			GIL_VLK);
		Wld_AssignRoomToGuild ("lagerhaus",		GIL_NONE);
		Wld_AssignRoomToGuild ("karten",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("hafenkneipe",	GIL_NONE);
		Wld_AssignRoomToGuild ("puff",			GIL_NONE);
		
		//Handwerker und Händler
		Wld_AssignRoomToGuild ("bogner",		GIL_PUBLIC);		// = Thorben und Gritta!
		Wld_AssignRoomToGuild ("matteo",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("hotel",			GIL_NONE);
		Wld_AssignRoomToGuild ("stadtkneipe",	GIL_NONE);
		Wld_AssignRoomToGuild ("zuris",			GIL_VLK);
		
		if (Player_IsApprentice == APP_Constantino)
		{
			Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
		}
		else
		{
			Wld_AssignRoomToGuild ("alchemist",	GIL_PUBLIC);
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			Wld_AssignRoomToGuild ("gritta",	GIL_NONE);		// = BOSPER!
		}
		else
		{
			Wld_AssignRoomToGuild ("gritta",	GIL_PUBLIC); 	// = BOSPER!
		};
		
		if (Player_IsApprentice == APP_Harad)
		{
			Wld_AssignRoomToGuild ("schmied",	GIL_NONE);
		}
		else
		{
			Wld_AssignRoomToGuild ("schmied",	GIL_VLK);
		};
		
		//Türme
		Wld_AssignRoomToGuild ("turmsued01",	GIL_MIL);
		Wld_AssignRoomToGuild ("turmsued02",	GIL_MIL);
		Wld_AssignRoomToGuild ("turmost01",		GIL_MIL);
		Wld_AssignRoomToGuild ("turmost02",		GIL_MIL);
		Wld_AssignRoomToGuild ("turmschmied",	GIL_MIL);
		Wld_AssignRoomToGuild ("turmbogner",	GIL_MIL);
		
		//Kaserne 
		Wld_AssignRoomToGuild ("andre",			GIL_PUBLIC);
		Wld_AssignRoomToGuild ("waffenkammer",	GIL_PUBLIC);
		Wld_AssignRoomToGuild ("barracke",		GIL_MIL);
		
		//Oberes Viertel
		Wld_AssignRoomToGuild ("nwcityrich01", 	GIL_MIL);
		Wld_AssignRoomToGuild ("rathaus",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("reich01",		GIL_VLK);
		Wld_AssignRoomToGuild ("reich02",		GIL_VLK);
		Wld_AssignRoomToGuild ("reich03",		GIL_VLK);
		Wld_AssignRoomToGuild ("reich04",		GIL_VLK);
		Wld_AssignRoomToGuild ("reich05",		GIL_VLK);
		Wld_AssignRoomToGuild ("reich06",		GIL_PUBLIC); //Salandril Alchemist -> Wegen Mission!!!
		Wld_AssignRoomToGuild ("richter",		GIL_PUBLIC); //wegen SLD Mission Kap.3 
		Wld_AssignRoomToGuild ("leomar",		GIL_VLK);
	};

func void INIT_NewWorld_Part_City_01()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	INIT_SUB_NewWorld_Part_City_01();
};


// ------ Farm1 -------

func void STARTUP_NewWorld_Part_Farm_01()
{
	//---NSCs---
	Wld_InsertNpc		(BAU_954_Maleth, 		"NW_FARM1_OUT_01"); //erster Hirte
	Wld_InsertNpc		(BAU_950_Lobart, 		"NW_FARM1_OUT_01");
	Wld_InsertNpc		(BAU_951_Hilda, 		"NW_FARM1_OUT_01");
	
	Wld_InsertNpc		(BAU_952_Vino, 			"NW_FARM1_OUT_01");
	Wld_InsertNpc		(BAU_953_Bauer, 		"NW_FARM1_OUT_01");
	Wld_InsertNpc		(BAU_955_Bauer, 		"NW_FARM1_OUT_01");

	Wld_InsertNpc		(VLK_468_Canthar, 		"NW_FARM1_OUT_01"); 
	
	//---Schafherde---
	Wld_InsertNpc		(Hammel, 	"NW_FARM1_PATH_CITY_SHEEP_07");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_07");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_07");
	Wld_InsertNpc		(Hammel, 	"NW_FARM1_PATH_CITY_SHEEP_08");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_08");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_08");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_09");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_09");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_09");
	
	//---Schafe auf dem Hof---
	Wld_InsertNpc		(Hammel, 	"NW_FARM1_PATH_CITY_SHEEP_10");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_10");
	Wld_InsertNpc		(Hammel, 	"NW_FARM1_PATH_CITY_SHEEP_11");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_11");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_12");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_PATH_CITY_SHEEP_12");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_OUT_03");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_OUT_03");
	
	//---Schafe bei der Windmühle---
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_MILL_01");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_MILL_01");
	Wld_InsertNpc		(Sheep, 	"NW_FARM1_MILL_01");

	//---Monster zur Stadt---
	Wld_InsertNpc		(YBloodfly, "NW_FARM1_PATH_SPAWN_02");
	Wld_InsertNpc		(YBloodfly, "NW_FARM1_PATH_SPAWN_02");
	Wld_InsertNpc		(YBloodfly, "NW_FARM1_PATH_SPAWN_02");

	Wld_InsertNpc		(YWolf,		"NW_FARM1_PATH_SPAWN_07");
	Wld_InsertNpc		(YWolf, 	"NW_FARM1_PATH_SPAWN_07");

	Wld_InsertNpc		(YGobbo_Green,"NW_FARM1_PATH_CITY_19_B");

	Wld_InsertNpc		(YBloodfly, "NW_FARM1_PATH_CITY_10_B");
	Wld_InsertNpc		(YBloodfly, "NW_FARM1_PATH_CITY_10_B");

	Wld_InsertNpc		(YWolf,		"NW_FARM1_PATH_CITY_05_B");
	Wld_InsertNpc		(YWolf,		"NW_FARM1_PATH_CITY_05_B");
	
	//---GIANT BUGS---
	Wld_InsertNpc		(YGiant_Bug, 	"NW_FARM1_CITYWALL_RIGHT_02");	


	Wld_InsertNpc		(YGiant_Bug, 	"NW_FARM1_OUT_13");	
	
	//---Stonehendge ---

	Wld_InsertNpc		(YGiant_Bug_VinoRitual1, 	"NW_FARM1_OUT_15");	
	Wld_InsertNpc		(YGiant_Bug_VinoRitual2, 	"NW_FARM1_OUT_15");	
	Wld_InsertItem		(ItWr_HitPointStonePlate1_Addon, 	"FP_ITEM_HERB_11");	

	//---Kapitel2 Waldgraben---
	Wld_InsertNpc		(Bloodfly,	"NW_FARM1_CITYWALL_02_B"); 
	Wld_InsertNpc		(Bloodfly,	"NW_FARM1_CITYWALL_02_B");
	
	Wld_InsertNpc		(Snapper, 	"NW_FARM1_CITYWALL_05");
	Wld_InsertNpc		(Snapper, 	"NW_FARM1_CITYWALL_05");
	Wld_InsertNpc		(Snapper, 	"NW_FARM1_CITYWALL_05");
	
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_03");
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_03");
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_03");
	
	Wld_InsertNpc		(Shadowbeast, "NW_FARM1_CITYWALL_FOREST_04_B");
	
	Wld_InsertNpc		(Bloodfly,	"NW_FARM1_CITYWALL_FOREST_06");
	Wld_InsertNpc		(Bloodfly,	"NW_FARM1_CITYWALL_FOREST_06");
	Wld_InsertNpc		(Bloodfly,	"NW_FARM1_CITYWALL_FOREST_06");
	Wld_InsertNpc		(Bloodfly,	"NW_FARM1_CITYWALL_FOREST_06");
	Wld_InsertNpc		(Bloodfly,	"NW_FARM1_CITYWALL_FOREST_06");

	Wld_InsertNpc		(OrcWarrior_Harad, "NW_FARM1_CITYWALL_FOREST_08_B");

	Wld_InsertNpc		(Gobbo_Black, 	"NW_FARM1_CITYWALL_FOREST_14");
	Wld_InsertNpc		(Gobbo_Black, 	"NW_FARM1_CITYWALL_FOREST_14");
	Wld_InsertNpc		(Gobbo_Black,	"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc		(Gobbo_Black, 	"NW_FARM1_CITYWALL_FOREST_15");
	Wld_InsertNpc		(Gobbo_Black, 	"NW_FARM1_CITYWALL_FOREST_16");
	
	//---FARM1CAVE---
	Wld_InsertNpc		(BDT_1000_Bandit_L, 	"NW_FARM1_BANDITS_CAVE_06");
	Wld_InsertNpc		(BDT_1001_Bandit_L, 	"NW_FARM1_BANDITS_CAVE_07");
	Wld_InsertNpc		(BDT_1002_Bandit_L, 	"NW_FARM1_BANDITS_CAVE_08");
	
	Wld_InsertItem		(ItWr_BowStonePlate2_Addon, 	"FP_STAND_DEMENTOR_KDF_29");
	
	Wld_InsertNpc		(BDT_1001_Bandit_L, 	"NW_FARM1_BANDITS_CAVE_03");
};

	func void INIT_SUB_NewWorld_Part_Farm_01()
	{
		Wld_AssignRoomToGuild ("farm01", GIL_PUBLIC);	//hildas Raum
		Wld_AssignRoomToGuild ("farm02", GIL_PUBLIC);  	//Scheune 
		if (Lobart_Kleidung_Verkauft == TRUE)
		{
			Wld_AssignRoomToGuild ("farm03", GIL_NONE);  	//Schlaf Raum
		}
		else
		{		
			Wld_AssignRoomToGuild ("farm03", GIL_PUBLIC);  	//Schlaf Raum
		};
		
	};
	
func void INIT_NewWorld_Part_Farm_01()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_NewWorld_Part_Farm_01();
};


// ------ Xardas -------
func void STARTUP_NewWorld_Part_Xardas_01()
{
	Wld_InsertItem (ItBE_Addon_STR_5, "FP_SPAWN_X_GUERTEL");

	////////////////////////////////////////////////////////////////////////////
	//----------------------- Spielstart Gothic2------------------------------//
	////////////////////////////////////////////////////////////////////////////

	//---NSCs---
	Wld_InsertNpc		(NONE_100_Xardas, 	"NW_XARDAS_START");
	Wld_InsertNpc		(PC_Psionic, 		"NW_XARDAS_TOWER_PATH_01");
		
	Wld_InsertItem 		(ItWr_StonePlateCommon_Addon,		"FP_ITEM_XARDAS_STPLATE_01");//ADDON
	Wld_InsertItem 		(Itke_Xardas,		"FP_ITEM_XARDAS_07");

	Wld_InsertNpc		(BDT_1013_Bandit_L, "NW_XARDAS_STAIRS_01");
	Wld_InsertNpc		(BDT_1014_Bandit_L, "NW_XARDAS_BANDITS_LEFT");
	Wld_InsertNpc		(BDT_1015_Bandit_L, "NW_XARDAS_BANDITS_RIGHT");
	//---Monster auf dem Weg zu Farm1---
	Wld_InsertNpc		(Sheep, 			"NW_XARDAS_TOWER_04");
	
	Wld_InsertNpc		(YWolf, 			"NW_XARDAS_PATH_FARM1_11");
	Wld_InsertNpc		(YGobbo_Green,		"NW_XARDAS_GOBBO_01");
	Wld_InsertNpc		(YGobbo_Green,		"NW_XARDAS_GOBBO_02");
	Wld_InsertNpc		(YWolf, 			"NW_XARDAS_MONSTER_INSERT_01");
	
	//---Xardas Secret---
	Wld_InsertNpc		(Keiler,		"FP_ROAM_XARDAS_SECRET_23");
	Wld_InsertNpc		(Keiler,		"FP_ROAM_XARDAS_SECRET_23");

	Wld_InsertNpc		(Waran,		"FP_ROAM_XARDAS_SECRET_08");
	Wld_InsertNpc		(Waran,		"FP_ROAM_XARDAS_SECRET_08");

	Wld_InsertNpc		(Waran,		"FP_ROAM_XARDAS_SECRET_15");
	Wld_InsertNpc		(Waran,		"FP_ROAM_XARDAS_SECRET_15");

	Wld_InsertNpc		(Waran,		"FP_ROAM_XARDAS_SECRET_04");
	Wld_InsertNpc		(Waran,		"FP_ROAM_XARDAS_SECRET_04");

	Wld_InsertNpc		(Giant_Rat,		"FP_ROAM_XARDAS_SECRET_27");
	Wld_InsertNpc		(Giant_Rat,		"FP_ROAM_XARDAS_SECRET_27");

	Wld_InsertNpc		(Meatbug,		"FP_ROAM_XARDAS_SECRET_01");
	Wld_InsertNpc		(Meatbug,		"FP_ROAM_XARDAS_SECRET_01");

	//---Höhlengang---
	Wld_InsertNpc		(YGobbo_Green,		"NW_XARDAS_TOWER_WATERFALL_CAVE_03");

	Wld_InsertNpc		(YGobbo_Green,		"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_02");

	Wld_InsertNpc		(YGobbo_Green,		"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_05");
	Wld_InsertNpc		(YGobbo_Green,		"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_05");
	Wld_InsertNpc		(YGobbo_Green,		"NW_XARDAS_TOWER_WATERFALL_CAVE_ENTRANCE_GOBBO");

	Wld_InsertNpc		(YGiant_Bug, 		"NW_XARDAS_TOWER_WATERFALL_CAVE_SIDE_02"); 
	Wld_InsertNpc		(YGiant_Bug, 		"NW_XARDAS_TOWER_WATERFALL_CAVE_SIDE_02");

	//---im Tal---
	Wld_InsertNpc		(YWolf, 			"NW_XARDAS_VALLEY_03"); 
	Wld_InsertNpc		(YWolf, 			"NW_XARDAS_VALLEY_04");  
	Wld_InsertNpc		(YWolf, 			"NW_XARDAS_VALLEY_06"); 
	Wld_InsertNpc		(YWolf, 			"NW_XARDAS_VALLEY_08"); 

	Wld_InsertNpc		(YGiant_Rat, 		"NW_XARDAS_TOWER_VALLEY_RAT"); 
	Wld_InsertNpc		(YWolf, 			"NW_XARDAS_TOWER_VALLEY_WOLF");
	
	Wld_InsertNpc		(YBloodfly, 		"NW_XARDAS_TOWER_VALLEY_08");

	//---kleine Höhle im Tal---
	Wld_InsertNpc		(YGiant_Rat, 		"NW_XARDAS_TOWER_SECRET_CAVE_01"); 
	Wld_InsertNpc		(YGiant_Rat, 		"NW_XARDAS_TOWER_SECRET_CAVE_01");
	Wld_InsertNpc		(YGiant_Rat, 		"NW_XARDAS_TOWER_SECRET_CAVE_01");
	
	Wld_InsertNpc		(YGiant_Rat, 		"NW_XARDAS_TOWER_SECRET_CAVE_03");
	
	//ADDON	
	Wld_InsertNpc		(Bau_4300_Addon_Cavalorn, 		"NW_XARDAS_START");
	Wld_InsertNpc		(PIR_1300_Addon_Greg_NW, 		"FARM1");

};

	func void INIT_SUB_NewWorld_Part_Xardas_01()
	{
	};

func void INIT_NewWorld_Part_Xardas_01()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();	
	
	INIT_SUB_NewWorld_Part_Xardas_01();
};


// KLOSTER 
FUNC VOID STARTUP_NewWorld_Part_Monastery_01 ()
{
	Wld_InsertItem 	(ItWr_Manarezept, 	"FP_ITEM_KLOSTER_01");
	
	Wld_InsertNpc 	(PAL_299_Sergio, 	"NW_MONASTERY_ENTRY_01");
	
	Wld_InsertNpc 	(KDF_500_Pyrokar, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_501_Serpentes, "NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_502_Ulthar,	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_503_Karras, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_504_Parlan, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_505_Marduk, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_506_Neoras, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_507_Talamon, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_508_Gorax, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_509_Isgaroth,  "NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(KDF_510_Hyglas, 	"NW_MONASTERY_ENTRY_01");
	
	Wld_InsertNpc 	(NOV_600_Pedro,  	"NW_MONASTERY_ENTRY_01");	//steht vor dem Kloster
	Wld_InsertNpc 	(NOV_601_Igaraz, 	"NW_MONASTERY_ENTRY_01");	//Erwählter im Smalltalk im Hof
	Wld_InsertNpc 	(NOV_603_Agon, 		"NW_MONASTERY_ENTRY_01");	//Kräutergarten
	Wld_InsertNpc 	(NOV_604_Dyrian, 	"NW_MONASTERY_ENTRY_01");	//
	Wld_InsertNpc 	(NOV_605_Opolos, 	"NW_MONASTERY_ENTRY_01");	//Hütet Schafe
	Wld_InsertNpc 	(NOV_606_Novize, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(NOV_607_Novize, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(NOV_608_Garwig, 	"NW_MONASTERY_ENTRY_01");	//Bewacht den Hammer
	Wld_InsertNpc 	(NOV_609_Novize, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(NOV_610_Novize, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(NOV_611_Novize, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(NOV_612_Babo, 		"NW_MONASTERY_ENTRY_01");	//Fegt den Hof
	Wld_InsertNpc 	(NOV_615_Novize, 	"NW_MONASTERY_ENTRY_01");
	Wld_InsertNpc 	(Sheep, 			"FP_ROAM_MONASTERY_01");
	Wld_InsertNpc 	(Sheep, 			"FP_ROAM_MONASTERY_02");
	Wld_InsertNpc 	(Sheep, 			"FP_ROAM_MONASTERY_03");
			
	Wld_InsertNpc 	(Scavenger, 			"NW_PATH_TO_MONASTER_AREA_11");
	Wld_InsertNpc 	(Scavenger, 			"NW_PATH_TO_MONASTER_AREA_11");

	Wld_InsertNpc 	(Scavenger, 			"NW_PATH_TO_MONASTER_MONSTER22");
	Wld_InsertItem 	(ItWr_BowStonePlate1_Addon, 			"FP_ROAM_NW_NW_PATH_TO_MONASTER_MONSTER22_03");
	Wld_InsertItem 	(ItWr_StonePlateCommon_Addon, 			"FP_ITEM_MONASTERY_01");

	Wld_InsertNpc 	(Scavenger, 			"NW_PATH_TO_MONASTER_AREA_01");

	Wld_InsertNpc 	(Giant_Rat, 			"NW_PATH_TO_MONASTER_AREA_02");

	Wld_InsertNpc 	(Giant_Rat, 			"NW_PATH_TO_MONASTER_AREA_10");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_PATH_TO_MONASTER_AREA_10");

	Wld_InsertNpc 	(Giant_Bug, 			"NW_PATH_TO_MONASTER_AREA_08");

	Wld_InsertNpc 	(Giant_Rat, 			"NW_SHRINE_MONSTER");

	Wld_InsertNpc 	(Scavenger, 			"NW_FOREST_CONNECT_MONSTER2");
};

	FUNC VOID INIT_SUB_NewWorld_Part_Monastery_01()
	{
		Wld_AssignRoomToGuild ("kloster01",GIL_PUBLIC); //Kirche
		Wld_AssignRoomToGuild ("kloster02",GIL_PUBLIC); //Bücherei
		Wld_AssignRoomToGuild ("kloster03",GIL_PUBLIC); //Kapelle 
		
		Wld_AssignRoomToGuild ("kloster11",GIL_PUBLIC); //Der Keller
		Wld_AssignRoomToGuild ("kloster13",GIL_PUBLIC); //Weinkelterei
		
		Wld_AssignRoomToGuild ("kloster04",GIL_NOV); //Schlafraum Novizen
		Wld_AssignRoomToGuild ("kloster05",GIL_NOV); //Schlafraum Novizen
		Wld_AssignRoomToGuild ("kloster10",GIL_NOV); //Schlafraum Novizen
		Wld_AssignRoomToGuild ("kloster12",GIL_NOV); //Schlafraum Novizen
		
		Wld_AssignRoomToGuild ("kloster06",GIL_KDF); //Schlafraum Magier
		Wld_AssignRoomToGuild ("kloster07",GIL_KDF); //Schlafraum Magier
		Wld_AssignRoomToGuild ("kloster08",GIL_KDF); //Schlafraum Magier
		Wld_AssignRoomToGuild ("kloster09",GIL_KDF); //Schlafraum Magier
	};

FUNC VOID INIT_NewWorld_Part_Monastery_01 ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();	
	
	INIT_SUB_NewWorld_Part_Monastery_01();
};


//---Der grosse Bauernhof--------


FUNC VOID STARTUP_NewWorld_Part_GreatPeasant_01 ()
{
	// ------ Vorposten
	Wld_InsertNpc 	(SLD_802_Buster, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_827_Soeldner, 	"BIGFARM");
	
	// ------ Feldräuberhöhle ------
	
	//3 rausgenommen, wegen Fester-> werden später insertet
	
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM_FELDREUBER"); 
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM_FELDREUBER2");
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM_FELDREUBER4");
	
	Wld_InsertNpc (Giant_Bug, "FP_ROAM_MONSTERMILL_11");
	Wld_InsertNpc (Giant_Bug, "FP_ROAM_MONSTERMILL_13");
	Wld_InsertNpc (Giant_Bug, "FP_ROAM_MONSTERMILL_04");
	Wld_InsertNpc (Giant_Bug, "FP_ROAM_MONSTERMILL_03");
	
	
	//BIGMILL Felder
	Wld_InsertNpc (Lurker, "NW_BIGMILL_FIELD_MONSTER_03");
	Wld_InsertNpc (Lurker, "NW_BIGMILL_FIELD_MONSTER_03");

	Wld_InsertItem (ItWr_OneHStonePlate1_Addon, "FP_ROAM_NW_BIGMILL_FIELD_MONSTER_04_03");
	
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_01");
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_01");
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_01");
	
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_02");
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_02");
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_02");
	
	//2 Bugs rausgenommen, wegen Fester

	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM_FIELD_MONSTER_01");
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM_FIELD_MONSTER_01");
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM_FIELD_MONSTER_01");

	// NSCs
	Wld_InsertNpc 	(BAU_900_Onar, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_901_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_902_Gunnar, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_903_Bodo, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_904_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_905_Bauer, 	"BIGFARM");
	//Wld_InsertNpc 	(BAU_906_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_907_Wasili, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_908_Hodges, 	"BIGFARM");
	//Wld_InsertNpc 	(BAU_909_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_910_Maria, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_911_Elena, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_912_Pepe, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_913_Thekla, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_914_Baeuerin, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_915_Baeuerin, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_916_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_917_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_918_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_919_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_920_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_921_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_980_Sagitta, 	"BIGFARM");
	
	
	Wld_InsertNpc 	(SLD_800_Lee, 		"BIGFARM");
	Wld_InsertNpc 	(SLD_801_Torlof, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_803_Cipher, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_804_Rod, 		"BIGFARM");
	Wld_InsertNpc 	(SLD_805_Cord, 		"BIGFARM");
	Wld_InsertNpc 	(SLD_806_Sylvio, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_807_Bullco, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_808_Jarvis, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_809_Bennet, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_810_Dar, 		"BIGFARM");
	Wld_InsertNpc 	(SLD_811_Wolf, 		"BIGFARM");

	Wld_InsertNpc 	(SLD_814_Sentenza, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_815_Soeldner, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_816_Fester, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_817_Soeldner, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_818_Soeldner, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_819_Soeldner, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_820_Soeldner, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_821_Soeldner, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_822_Raoul, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_823_Khaled, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_824_Soeldner, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_825_Soeldner, 	"BIGFARM");
	Wld_InsertNpc 	(SLD_826_Soeldner, 	"BIGFARM");


	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_01");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_01");
	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP1_01");

	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_02");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_02");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_02");

	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP1_03");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_03");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP1_03");

	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_12");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_13");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_14");

	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_07");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_08");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_BIGFARM_SHEEP2_09");

	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP2_02");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP2_02");

	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP2_03");
	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_SHEEP2_03");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP2_03");

	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP2_04");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_SHEEP2_04");


	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_KITCHEN_OUT_02");
	Wld_InsertNpc 	(Sheep, 		"NW_BIGFARM_KITCHEN_OUT_02");
	Wld_InsertNpc 	(Hammel, 		"NW_BIGFARM_KITCHEN_OUT_02");

	
	//Farm3

	Wld_InsertNpc 	(BAU_960_Bengar, 		"BIGFARM");

	Wld_InsertNpc 	(BAU_961_Gaan, 			"BIGFARM");

	Wld_InsertNpc 	(Gaans_Snapper, 		"NW_FARM3_BIGWOOD_04");  

	Wld_InsertNpc 	(BAU_962_Bauer, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_963_Malak, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_964_Bauer, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_965_Bauer, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_966_Bauer, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_967_Bauer, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_968_Bauer, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_969_Bauer, 		"BIGFARM");
	
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_FARM3_OUT_05_01");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_FARM3_OUT_05_02");
	Wld_InsertNpc 	(Hammel, 		"FP_ROAM_NW_FARM3_OUT_05_03");
	Wld_InsertNpc 	(Sheep, 		"FP_ROAM_NW_FARM3_OUT_05_04");

	
	//Farm4
	
	Wld_InsertNpc 	(BAU_930_Sekob, 	"BIGFARM");  
	Wld_InsertNpc 	(BAU_931_Till, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_932_Balthasar, "BIGFARM");

	Wld_InsertNpc 	(Balthasar_Sheep1, "NW_FARM4_BALTHASAR");	
	Wld_InsertNpc 	(Balthasar_Sheep2, "NW_FARM4_BALTHASAR");	
	Wld_InsertNpc 	(Balthasar_Sheep3, "NW_FARM4_BALTHASAR");	
	
	Wld_InsertNpc 	(BAU_933_Rega, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_934_Babera, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_935_Bronko, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_936_Rosi, 		"BIGFARM");
	Wld_InsertNpc 	(BAU_937_Bauer, 	"BIGFARM");
	Wld_InsertNpc 	(BAU_938_Bauer, 	"BIGFARM");

	//Holzfäller\Jäger
	Wld_InsertNpc 	(BAU_981_Grom, 	"BIGFARM");

	// Monster
	//***************************************************************************************

	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 


 	Wld_InsertNpc 	(Zombie02,	"NW_FARM2_TAVERNCAVE1_09"); 
	Wld_InsertNpc 	(Zombie03,	"NW_FARM2_TAVERNCAVE1_10"); 
	Wld_InsertNpc 	(Zombie04,	"NW_FARM2_TAVERNCAVE1_08"); 

	Wld_InsertNpc 	(Gobbo_Skeleton,	"NW_FARM2_TAVERNCAVE1_02"); 
	Wld_InsertNpc 	(Gobbo_Skeleton,	"NW_FARM2_TAVERNCAVE1_02"); 
	Wld_InsertNpc 	(Gobbo_Skeleton,	"NW_FARM2_TAVERNCAVE1_02"); 

 	Wld_InsertNpc 	(Wolf,	"NW_TAVERNE_TROLLAREA_MONSTER_04_01"); 
	Wld_InsertNpc 	(Wolf,	"NW_TAVERNE_TROLLAREA_MONSTER_04_01"); 

  	Wld_InsertNpc 	(Gobbo_Green,	"NW_TAVERNE_TROLLAREA_MONSTER_05_01"); 
	Wld_InsertNpc 	(Gobbo_Green,	"NW_TAVERNE_TROLLAREA_MONSTER_05_01"); 
  	Wld_InsertNpc 	(Gobbo_Green,	"NW_TAVERNE_TROLLAREA_MONSTER_05_01"); 

  	Wld_InsertNpc 	(Wolf,	"NW_BIGFARM_LAKE_MONSTER_01_01"); 
	Wld_InsertNpc 	(Wolf,	"NW_BIGFARM_LAKE_MONSTER_01_01"); 

  	Wld_InsertNpc 	(Lurker,	"NW_BIGFARM_LAKE_MONSTER_02_01"); 
	Wld_InsertNpc 	(Lurker,	"NW_BIGFARM_LAKE_MONSTER_02_01"); 
  	Wld_InsertNpc 	(Bloodfly,	"NW_BIGFARM_LAKE_MONSTER_02_01"); 

  	Wld_InsertNpc 	(Wolf,	"NW_BIGFARM_LAKE_MONSTER_03_01"); 
	Wld_InsertNpc 	(Wolf,	"NW_BIGFARM_LAKE_MONSTER_03_01"); 

  	Wld_InsertNpc 	(Lurker,	"NW_LAKE_GREG_TREASURE_01"); 


//Jägerlager

	Wld_InsertNpc 	(BAU_983_Dragomir,	"NW_CITY_TO_LIGHTHOUSE_13_MONSTER5"); 
	Wld_InsertItem	(ItRw_DragomirsArmbrust_MIS , "FP_NW_ITEM_TROLL_06"); 
	Wld_InsertNpc 	(BAU_984_Niclas,	"NW_TAVERNE_TROLLAREA_MONSTER_02_01"); 
	


	// Kap3

 	Wld_InsertNpc 	(Warg,	"NW_FARM4_WOOD_MONSTER_01"); 
	Wld_InsertNpc 	(Warg,	"NW_FARM4_WOOD_MONSTER_01"); 

 	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_02"); 
	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_02"); 
 	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_02"); 
	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_02"); 

	Wld_InsertNpc 	(Wolf,	"NW_FARM4_WOOD_MONSTER_03"); 
	Wld_InsertNpc 	(Wolf,	"NW_FARM4_WOOD_MONSTER_03"); 

	Wld_InsertNpc 	(Gobbo_Skeleton,	"NW_FARM4_WOOD_MONSTER_04"); 
	Wld_InsertNpc 	(Gobbo_Skeleton,	"NW_FARM4_WOOD_MONSTER_04"); 

	Wld_InsertNpc 	(Wolf,	"NW_FARM4_WOOD_MONSTER_05"); 

	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_06"); 
	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_06"); 

	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_07"); 
	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_07"); 

	Wld_InsertNpc 	(Shadowbeast,	"NW_FARM4_WOOD_MONSTER_08"); 

 	Wld_InsertNpc 	(Gobbo_Skeleton,	"NW_FARM4_WOOD_MONSTER_09"); 

 	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_10"); 
	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_10"); 
	Wld_InsertNpc 	(Bloodfly,	"NW_FARM4_WOOD_MONSTER_10"); 
 
  	// Crypt 
	Wld_InsertNpc 	(Crypt_Skeleton_Room_01, "EVT_CRYPT_ROOM_01_SPAWNMAIN");
	Wld_InsertNpc 	(Crypt_Skeleton_Room_02, "EVT_CRYPT_ROOM_02_SPAWNMAIN");
	Wld_InsertNpc 	(Crypt_Skeleton_Room_03, "EVT_CRYPT_ROOM_03_SPAWNMAIN");
	
 	Wld_InsertItem 	(ItMi_Zeitspalt_Addon, "EVT_CRYPT_ROOM_01_SPAWN_03");
 	Wld_InsertItem 	(ItWr_ManaStonePlate2_Addon, "EVT_CRYPT_ROOM_FINAL_SPAWN_01");
 	Wld_InsertItem 	(ItWr_ManaStonePlate3_Addon, "EVT_CRYPT_ROOM_02_SPAWN_05");
	
	//Castlemines
	
	Wld_InsertItem 	(ItWr_HitPointStonePlate3_Addon, "FP_STAND_DEMENTOR_KDF_12");
	Wld_InsertItem 	(ItWr_StonePlateCommon_Addon, "FP_SIT_CAMPFIRE_TOWER_01");
	
	Wld_InsertNpc 	(BDT_1040_Bandit_L, 	"NW_CASTLEMINE_01");
	Wld_InsertNpc 	(BDT_1041_Bandit_L, 	"NW_CASTLEMINE_TOWER_REP_HUT");
	Wld_InsertNpc 	(BDT_1042_Bandit_L, 	"NW_CASTLEMINE_PATH_HUT_02");
	Wld_InsertNpc 	(BDT_1043_Bandit_L, 	"CASTLEMINE");
	Wld_InsertNpc 	(BDT_1044_Bandit_L, 	"NW_CASTLEMINE_TOWER_01");
	Wld_InsertNpc 	(BDT_1045_Bandit_L, 	"NW_CASTLEMINE_PATH_OUTSIDEHUT_02");
	Wld_InsertNpc 	(BDT_1046_Bandit_L, 	"NW_CASTLEMINE_PATH_01");
	Wld_InsertNpc 	(BDT_1047_Bandit_L, 	"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
	Wld_InsertNpc 	(BDT_1048_Bandit_L, 	"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
	Wld_InsertNpc 	(BDT_1049_Bandit_L, 	"NW_CASTLEMINE_TOWER_CAMPFIRE_03");
	Wld_InsertNpc 	(BDT_1060_Dexter, 		"NW_CASTLEMINE_HUT_10");
	Wld_InsertNpc 	(BDT_1061_Wache, 		"NW_CASTLEMINE_PATH_03");
	Wld_InsertNpc 	(BDT_1062_Bandit_L, 	"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
	//Wld_InsertNpc 	(BDT_1063_Bandit_L, 	"NW_CASTLEMINE_HUT_01"); //Joly://ADDON Macht nur Probleme !!!
	Wld_InsertNpc 	(BDT_1064_Bandit_L, 	"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc 	(BDT_1065_Bandit_L, 	"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc 	(BDT_1066_Bandit_L, 	"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc 	(BDT_1067_Bandit_L, 	"NW_CASTLEMINE_HUT_01");
	Wld_InsertNpc 	(BDT_1068_Bandit_L, 	"NW_CASTLEMINE_HUT_01");
	
	/*
	Wld_InsertNpc 	(Giant_Rat, 			"NW_CASTLEMINE_HUT_01");
 	Wld_InsertNpc 	(Giant_Rat, 			"NW_CASTLEMINE_HUT_01");

 	Wld_InsertNpc 	(Giant_Rat, 			"NW_CASTLEMINE_HUT_01_MONSTER");
 	Wld_InsertNpc 	(Giant_Rat, 			"NW_CASTLEMINE_HUT_01_MONSTER");
 	*/
 	
	Wld_InsertNpc 	(Troll, 				"NW_CASTLEMINE_TROLL_08");
	Wld_InsertNpc 	(Troll, 				"NW_CASTLEMINE_TROLL_07");
	Wld_InsertItem 	(ItWr_BowStonePlate2_Addon, "FP_ROAM_CASTLEMILL_TROLL_05");

	Wld_InsertNpc 	(Skeleton, 				"FP_ROAM_CASTLEMINE2_01");
	Wld_InsertNpc 	(Skeleton, 				"FP_ROAM_CASTLEMINE2_02");
	Wld_InsertNpc 	(Skeleton, 				"FP_ROAM_CASTLEMINE2_03");
	Wld_InsertNpc 	(Skeleton, 				"FP_ROAM_CASTLEMINE2_04");
	Wld_InsertNpc 	(Skeleton, 				"FP_ROAM_CASTLEMINE2_05");
	Wld_InsertNpc 	(Skeleton, 				"FP_ROAM_CASTLEMINE2_06");
	Wld_InsertNpc 	(Skeleton, 				"FP_ROAM_CASTLEMINE2_07");
	Wld_InsertNpc 	(SkeletonMage, 			"FP_ROAM_CASTLEMINE2_08");
	Wld_InsertNpc 	(Zombie01, 				"FP_ROAM_CASTLEMINE2_09");
	Wld_InsertNpc 	(Zombie02, 				"FP_ROAM_CASTLEMINE2_10");
	Wld_InsertNpc 	(Zombie03, 				"FP_ROAM_CASTLEMINE2_11");
	Wld_InsertNpc 	(Zombie04, 				"FP_ROAM_CASTLEMINE2_12");
	Wld_InsertNpc 	(Zombie01, 				"FP_ROAM_CASTLEMINE2_13");
	
	Wld_InsertNpc 	(Minecrawler, 			"NW_CASTLEMINE_13");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"NW_CASTLEMINE_10");
	Wld_InsertNpc 	(Minecrawler, 			"NW_CASTLEMINE_12");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"NW_CASTLEMINE_06");

	Wld_InsertNpc 	(Gobbo_Black, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_01");
	Wld_InsertNpc 	(Gobbo_Warrior, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_02");
	Wld_InsertNpc 	(Gobbo_Black, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_03");
	Wld_InsertNpc 	(Gobbo_Black, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_04");
	Wld_InsertItem 	(ItWr_CrsBowStonePlate2_Addon, 	"FP_NW_ITEM_BIGFARMFORESTCAVE_EGG");

	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_02");
	Wld_InsertNpc 	(Gobbo_Black, 			"FP_ROAM_BIGFARM_LAKE_CAVE_07");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_08");
	//Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_09");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_10");
	Wld_InsertNpc 	(Gobbo_Black, 			"FP_ROAM_BIGFARM_LAKE_CAVE_11");
	//Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_12");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_13");

	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_05");
	//Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_06");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_07");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_08");
	//Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_09");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_NW_BIGFARMFORESTCAVE_10");


	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_01");
	Wld_InsertNpc 	(Gobbo_DaronsStatuenKlauer, 	"FP_ROAM_BIGFARM_LAKE_CAVE_02");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_03");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_04");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_05");
	Wld_InsertNpc 	(Gobbo_Green, 			"FP_ROAM_BIGFARM_LAKE_CAVE_06");


	//andere
	Wld_InsertNpc 	(Bloodfly, 			"NW_BIGFARM_LAKE_MONSTER_BLOODFLY");
	Wld_InsertNpc 	(Bloodfly, 			"NW_BIGFARM_LAKE_MONSTER_BLOODFLY");
	Wld_InsertNpc 	(Bloodfly, 			"NW_BIGFARM_LAKE_MONSTER_BLOODFLY");

	Wld_InsertNpc 	(Giant_Bug, 			"NW_TAVERNE_TROLLAREA_MONSTER_03_01M1");
	Wld_InsertNpc 	(Giant_Bug, 			"NW_TAVERNE_TROLLAREA_MONSTER_03_01M1");

	Wld_InsertNpc 	(Wolf, 			"NW_SAGITTA_MOREMONSTER_01");
	Wld_InsertNpc 	(Wolf, 			"NW_SAGITTA_MOREMONSTER_01");
	Wld_InsertNpc 	(Wolf, 			"NW_SAGITTA_MOREMONSTER_01");

	Wld_InsertNpc 	(Giant_Bug, 			"NW_SAGITTA_MOREMONSTER_03");
	Wld_InsertNpc 	(Giant_Bug, 			"NW_SAGITTA_MOREMONSTER_03");

	Wld_InsertNpc 	(Bloodfly, 			"NW_FARM4_WOOD_NEARPEASANT7");
	Wld_InsertNpc 	(Bloodfly, 			"NW_FARM4_WOOD_NEARPEASANT7");

	Wld_InsertNpc 	(Bloodfly, 			"NW_FARM4_WOOD_NEARPEASANT2_14");
	Wld_InsertNpc 	(Bloodfly, 			"NW_FARM4_WOOD_NEARPEASANT2_14");
	Wld_InsertNpc 	(Bloodfly, 			"NW_FARM4_WOOD_NEARPEASANT2_14");

	Wld_InsertNpc 	(Bloodfly, 			"NW_FARM4_WOOD_NEARPEASANT2_10");
	Wld_InsertNpc 	(Bloodfly, 			"NW_FARM4_WOOD_NEARPEASANT2_10");

	Wld_InsertNpc 	(Wolf, 			"NW_FARM4_WOOD_NEARPEASANT2_8");
	Wld_InsertNpc 	(Wolf, 			"NW_FARM4_WOOD_NEARPEASANT2_8");

	Wld_InsertNpc 	(Scavenger, 			"NW_FARM4_WOOD_NEARPEASANT2_7");
	Wld_InsertNpc 	(Scavenger, 			"NW_FARM4_WOOD_NEARPEASANT2_7");
	Wld_InsertNpc 	(Scavenger, 			"NW_FARM4_WOOD_NEARPEASANT2_7");

	Wld_InsertNpc 	(Giant_Bug, 			"NW_FARM4_WOOD_NEARPEASANT2_12");
	Wld_InsertNpc 	(Giant_Bug, 			"NW_FARM4_WOOD_NEARPEASANT2_12");

	Wld_InsertNpc 	(Gobbo_skeleton, 			"NW_FARM4_WOOD_MONSTER_MORE_02");
	Wld_InsertNpc 	(Gobbo_skeleton, 			"NW_FARM4_WOOD_MONSTER_MORE_02");

	Wld_InsertNpc 	(Giant_Bug, 			"NW_FARM4_WOOD_MONSTER_MORE_01");

	Wld_InsertNpc 	(Giant_Bug, 			"NW_FARM4_WOOD_MONSTER_N_3");
	Wld_InsertNpc 	(Giant_Bug, 			"NW_FARM4_WOOD_MONSTER_N_3");

	Wld_InsertNpc 	(Giant_Bug, 			"NW_FARM4_WOOD_MONSTER_N_2");
	Wld_InsertNpc 	(Giant_Bug, 			"NW_FARM4_WOOD_MONSTER_N_2");

	Wld_InsertNpc 	(Giant_Bug, 			"NW_BIGFARM_FOREST_02");
	Wld_InsertNpc 	(Giant_Bug, 			"NW_BIGFARM_FOREST_02");

	Wld_InsertNpc 	(Gobbo_skeleton, 			"NW_CRYPT_MONSTER08");
	Wld_InsertNpc 	(Gobbo_skeleton, 			"NW_CRYPT_MONSTER08");

	Wld_InsertNpc 	(Gobbo_skeleton, 			"NW_CRYPT_MONSTER02");
	Wld_InsertNpc 	(Gobbo_skeleton, 			"NW_CRYPT_MONSTER02");
	Wld_InsertNpc 	(Gobbo_skeleton, 			"NW_CRYPT_MONSTER02");

	Wld_InsertNpc 	(Lesser_skeleton, 			"NW_CRYPT_MONSTER04");
	Wld_InsertNpc 	(Skeleton, 					"NW_CRYPT_MONSTER04");
	Wld_InsertNpc 	(Lesser_skeleton, 			"NW_CRYPT_MONSTER04");
	Wld_InsertItem 	(ItWr_StrStonePlate2_Addon, 	"FP_ROAM_NW_CRYPT_MONSTER04_02");

	Wld_InsertNpc 	(Lesser_skeleton, 			"NW_CRYPT_MONSTER06");
	Wld_InsertNpc 	(Lesser_skeleton, 			"NW_CRYPT_MONSTER06");

	Wld_InsertNpc 	(Wisp, 			"NW_BIGFARM_FOREST_03_NAVIGATION");

	Wld_InsertNpc 	(Keiler, 			"NW_BIGFARM_FOREST_03_NAVIGATION");

 	Wld_InsertNpc 	(Keiler, 			"NW_FARM4_WOOD_NAVIGATION_09");
	Wld_InsertNpc 	(Keiler, 			"NW_FARM4_WOOD_NAVIGATION_09");

	Wld_InsertNpc 	(Wolf, 			"NW_CASTLEMINE_TROLL_05");
 	Wld_InsertNpc 	(Wolf, 			"NW_CASTLEMINE_TROLL_05");

 	Wld_InsertNpc 	(Giant_Bug, 			"NW_BIGFARM_ALLEE_08_N");

 	Wld_InsertNpc 	(Giant_Bug, 			"NW_BIGFARM_ALLEE_08_N_2");
 	Wld_InsertNpc 	(Giant_Bug, 			"NW_BIGFARM_ALLEE_08_N_2");

 	Wld_InsertNpc 	(Giant_Bug, 			"NW_BIGFARM_ALLEE_08_N_5");
 	Wld_InsertNpc 	(Giant_Bug, 			"NW_BIGFARM_ALLEE_08_N_5");
	Wld_InsertNpc 	(Giant_Bug, 			"NW_BIGFARM_ALLEE_08_N_5");

 	Wld_InsertNpc 	(Scavenger, 			"NW_BIGMILL_05");
 	Wld_InsertNpc 	(Scavenger, 			"NW_BIGMILL_05");
 	Wld_InsertNpc 	(Scavenger, 			"NW_BIGMILL_05");

 	Wld_InsertNpc 	(Scavenger, 			"NW_BIGMILL_FARM3_03");
 	Wld_InsertNpc 	(Scavenger, 			"NW_BIGMILL_FARM3_03");


 	Wld_InsertNpc 	(Scavenger, 			"NW_FARM3_BIGWOOD_02");
 	Wld_InsertNpc 	(Scavenger, 			"NW_FARM3_BIGWOOD_02");
 
 	//PATCH M.F. 
 	//Wld_InsertNpc 	(Keiler, 			"NW_FARM3_BIGWOOD_03");
 	//Wld_InsertNpc 	(Keiler, 			"NW_FARM3_BIGWOOD_03");
 	Wld_InsertNpc 	(Keiler, 			"NW_FARM3_BIGWOOD_03");
 
 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_PATH_11_SMALLRIVER_02");
 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_PATH_11_SMALLRIVER_02");

 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_PATH_11_SMALLRIVER_04");

	Wld_InsertNpc 	(Scavenger, 			"NW_FARM3_PATH_11_SMALLRIVER_08");

	Wld_InsertNpc 	(Scavenger, 			"NW_FARM3_PATH_11_SMALLRIVER_10");
	Wld_InsertNpc 	(Scavenger, 			"NW_FARM3_PATH_11_SMALLRIVER_10");

 
 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_PATH_11_SMALLRIVER_17");
 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_PATH_11_SMALLRIVER_17");

 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_PATH_11_SMALLRIVER_20");

 	Wld_InsertNpc 	(Bloodfly, 			"NW_FARM3_PATH_11_SMALLRIVER_24");
 	Wld_InsertNpc 	(Bloodfly, 			"NW_FARM3_PATH_11_SMALLRIVER_24");

 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_PATH_11_SMALLRIVERMID_03");

 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_PATH_11_SMALLRIVERMID_02");

 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_PATH_11_SMALLRIVERMID_03");

 	Wld_InsertNpc 	(Keiler, 			"NW_FARM3_PATH_12_MONSTER_01");
 	Wld_InsertNpc 	(Keiler, 			"NW_FARM3_PATH_12_MONSTER_01");

	Wld_InsertNpc 	(Keiler, 			"NW_FARM3_PATH_12_MONSTER_03");

 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_MOUNTAINLAKE_03");

 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
 	Wld_InsertNpc 	(Lurker, 			"NW_FARM3_MOUNTAINLAKE_MONSTER_01");


 	Wld_InsertNpc 	(Keiler, 		"NW_BIGFARM_LAKE_03_MOVEMENT");
 	Wld_InsertNpc 	(Keiler, 		"NW_BIGFARM_LAKE_03_MOVEMENT");

 	Wld_InsertNpc 	(Giant_Bug, 		"NW_BIGFARM_LAKE_03_MOVEMENT3");
 	Wld_InsertNpc 	(Giant_Bug, 		"NW_BIGFARM_LAKE_03_MOVEMENT3");

 	Wld_InsertNpc 	(Gobbo_skeleton, 	"NW_BIGFARM_LAKE_03_MOVEMENT5");
 	Wld_InsertNpc 	(Gobbo_skeleton, 	"NW_BIGFARM_LAKE_03_MOVEMENT5");
 	
 	//TAVERNECAVE1
 	//Wld_InsertNpc 	(Molerat, 			"WP_BIGFARM_TAVERNCAVE2_01");
 	//Wld_InsertNpc 	(Molerat, 			"WP_BIGFARM_TAVERNCAVE2_02");
 	Wld_InsertItem 	(ItWr_ManaStonePlate1_Addon, 	"FP_ROAM_WP_BIGFARM_TAVERNCAVE2_02_01");
 	
 	
 	//ADDON
 	//Rangerbandits2
 	
  	Wld_InsertNpc 	(BDT_10307_Addon_RangerBandit_M, 	"NW_BIGMILL_FARM3_RANGERBANDITS_01");
  	Wld_InsertNpc 	(BDT_10308_Addon_RangerBandit_L, 	"NW_BIGMILL_FARM3_RANGERBANDITS_02");
  	Wld_InsertNpc 	(BDT_10309_Addon_RangerBandit_L, 	"NW_BIGMILL_FARM3_RANGERBANDITS_03");
  	Wld_InsertNpc 	(BDT_10310_Addon_RangerBandit_M, 	"NW_BIGMILL_FARM3_RANGERBANDITS_04");
  	Wld_InsertNpc 	(VLK_4302_Addon_Elvrich, 			"NW_BIGMILL_FARM3_RANGERBANDITS_04");
	
    	//Rangerbandits1
 	
  	Wld_InsertNpc 	(BDT_10311_Addon_RangerBandit_M, 	"NW_FARM4_WOOD_RANGERBANDITS_04");
  	Wld_InsertNpc 	(BDT_10312_Addon_RangerBandit_L, 	"NW_FARM4_WOOD_RANGERBANDITS_03");
  	Wld_InsertNpc 	(BDT_10313_Addon_RangerBandit_L, 	"NW_FARM4_WOOD_RANGERBANDITS_04");
  	Wld_InsertNpc 	(BDT_10314_Addon_RangerBandit_M, 	"NW_FARM4_WOOD_RANGERBANDITS_05");
  	Wld_InsertItem 	(ItWr_LuciasLoveLetter_Addon, 	"FP_ITEM_NW_FARM4_WOOD_LUCIASLETTER");
  	
  	 Wld_InsertItem 	(ItWr_HitPointStonePlate3_Addon, "FP_ITEM_GREATPEASANT_STPLATE_05");
  	 Wld_InsertItem 	(ItWr_StonePlateCommon_Addon, "FP_ITEM_GREATPEASANT_STPLATE_07");
  	 Wld_InsertItem 	(ItWr_DexStonePlate2_Addon, "FP_ITEM_GREATPEASANT_STPLATE_08");

	//Die Spur der Banditen:
 	
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_STAND_DEMENTOR_05");
    Wld_InsertItem 	(ItWr_StrStonePlate1_Addon, "FP_STAND_DEMENTOR_09");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ROAM_NW_FARM3_PATH_11_SMALLRIVER_09");
    Wld_InsertItem 	(ItWr_DexStonePlate1_Addon, "FP_ROAM_NW_FARM3_PATH_11_SMALLRIVER_05");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ROAM_NW_FARM3_BIGWOOD_02_04");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ROAM_NW_BIGMILL_FARM3_01");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_STAND_DEMENTOR_03");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ROAM_NW_BIGMILL_FARM3_03_02");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_STAND_DEMENTOR_07");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ROAM_NW_BIGFARM_ALLEE_08_N2");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_STAND_DEMENTOR_02");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ROAM_FARM4_SHEEP_02");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ROAM_NW_FARM4_WOOD_MONSTER_MORE_02");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ITEM_NW_FARM4_WOOD_LUCIASLETTER");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ROAM_NW_FARM4_WOOD_MONSTER_N_17");

    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ITEM_GREATPEASANT_FERNANDOSWEAPONS_01");
    Wld_InsertItem 	(ItWr_ManaStonePlate1_Addon, "FP_ITEM_GREATPEASANT_FERNANDOSWEAPONS_01");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ITEM_GREATPEASANT_FERNANDOSWEAPONS_02");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ITEM_GREATPEASANT_FERNANDOSWEAPONS_03");
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ITEM_GREATPEASANT_FERNANDOSWEAPONS_04");
    Wld_InsertItem 	(ItWr_Addon_BanditTrader, "FP_ITEM_NW_FARM4_WOOD_FERNANDOLETTER");
 
	//****************************************************************************************

};

	FUNC VOID INIT_SUB_NewWorld_Part_GreatPeasant_01()
	{
		// ------- Sld-Vorposten -------
		if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
		{
			Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
		}
		else
		{
			Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_SLD);
		};		
	
		// ------ Onars Hof ------
		Wld_AssignRoomToGuild ("grphaupthaus01",	GIL_PUBLIC);
		Wld_AssignRoomToGuild ("grpschmiede01",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("grpscheune01",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("grpkapelle01",		GIL_NONE);
		
		// ------ abgelegene Gruft ------
		Wld_AssignRoomToGuild ("cementary01",		GIL_NONE);
				
		// ------ Sekobs Farm ------
		if (Sekob_RoomFree == FALSE)
		{
			Wld_AssignRoomToGuild ("grpbauer01",		GIL_PUBLIC);
		}
		else
		{
			Wld_AssignRoomToGuild ("grpbauer01",		GIL_NONE);
		};
		Wld_AssignRoomToGuild ("grpbauerscheune01",	GIL_PUBLIC);
		
		// ------ Bengars Farm ------
		Wld_AssignRoomToGuild ("grpbauer02",		GIL_PUBLIC);
		Wld_AssignRoomToGuild ("grpbauerscheune02",	GIL_PUBLIC);
		
		// ------ Abenteuerspielplatz -------
		Wld_AssignRoomToGuild ("grpturm02",			GIL_PUBLIC); //vorderer Turm
		Wld_AssignRoomToGuild ("grpturm01",			GIL_PUBLIC); //hinterer Turm
		Wld_AssignRoomToGuild ("grpwaldhuette02",	GIL_PUBLIC); //Banditenhütte
	};

FUNC VOID INIT_NewWorld_Part_GreatPeasant_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();	
	
	INIT_SUB_NewWorld_Part_GreatPeasant_01();
};
//--------------------------- PASS -------------------------------------------------------
FUNC VOID STARTUP_NewWorld_Part_Pass_To_OW_01 ()
{
	// ------NSCs --------
	
	Wld_InsertNpc 	(PAL_297_Ritter, "NW_PASS_01");
	Wld_InsertNpc 	(PAL_298_Ritter, "NW_PASS_01");
	Wld_InsertItem 	(ItWr_HitPointStonePlate2_Addon, "FP_ITEM_PASS_01");

	Wld_InsertNpc	(YWolf,"NW_PASS_06");
	Wld_InsertNpc	(YWolf,"NW_PASS_06");
	
	Wld_InsertNpc	(YWolf,"NW_PASS_11");
	Wld_InsertNpc	(YWolf,"NW_PASS_11");
	
	Wld_InsertNpc	(YWolf,"NW_PASS_SECRET_15");
	Wld_InsertNpc	(YWolf,"NW_PASS_SECRET_16");
	Wld_InsertNpc	(YWolf,"NW_PASS_SECRET_16");
	Wld_InsertNpc	(YWolf,"NW_PASS_SECRET_17");
	
	Wld_InsertNpc	(Giant_Rat,"NW_PASS_SECRET_05");
	Wld_InsertNpc	(Giant_Rat,"NW_PASS_SECRET_06");
	Wld_InsertNpc	(Giant_Rat,"NW_PASS_SECRET_07");
	Wld_InsertNpc	(Giant_Rat,"NW_PASS_SECRET_08");
	
	Wld_InsertNpc	(Gobbo_Green,"NW_PASS_GRAT_04");
	Wld_InsertNpc	(Gobbo_Green,"NW_PASS_GRAT_05");
	Wld_InsertNpc	(Gobbo_Green,"NW_PASS_GRAT_05");
	Wld_InsertNpc	(Gobbo_Green,"NW_PASS_GRAT_06");
	Wld_InsertNpc	(Gobbo_Green,"NW_PASS_GRAT_06");
	
	//Wld_InsertNpc	(OrcShaman_Sit,"NW_PASS_ORKS_07");
	Wld_InsertNpc	(OrcShaman_Sit,"NW_PASS_ORKS_02");
	//Wld_InsertNpc	(OrcShaman_Sit,"NW_PASS_ORKS_02_B");
	
	Wld_InsertNpc	(OrcShaman_Sit,"NW_PASS_ORKS_13");
	Wld_InsertNpc	(OrcShaman_Sit,"NW_PASS_ORKS_04_B");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_13");
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_14");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_07");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_06");
	//Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_06");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_01");
	//Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_01");
	//Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_01");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_04");
	//Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_04");
	//Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_04");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_08");
	//Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_08");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_03");
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_03");
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_03");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_09");
	
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_10");
	//Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_10");
	
	//Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_11");
	Wld_InsertNpc	(OrcWarrior_Roam,"NW_PASS_ORKS_12");
};
FUNC VOID INIT_SUB_NewWorld_Part_Pass_To_OW_01 ()
{

};
FUNC VOID INIT_NewWorld_Part_Pass_To_OW_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();	
	
	INIT_SUB_NewWorld_Part_Pass_To_OW_01();
};
//---Medium Forest--------

FUNC VOID STARTUP_NewWorld_Part_Forest_01 ()
{
	Wld_InsertItem 		(itmi_erolskelch,"FP_SPAWN_KELCH"); 
	
	Wld_InsertNpc		(BDT_1009_Bandit_L, "NW_FOREST_CAVE1_IN_04"); 
	Wld_InsertNpc		(BDT_1010_Bandit_L, "NW_FOREST_CAVE1_IN_05"); 
	Wld_InsertNpc		(BDT_1011_Bandit_M, "NW_FOREST_CAVE1_IN_06"); 
	//Wld_InsertNpc		(BDT_1016_Bandit_M, "NW_CITY_SMFOREST_BANDIT_03"); 
	//Wld_InsertNpc		(BDT_1017_Bandit_L, "NW_CITY_SMFOREST_BANDIT_04"); 
	
	//Farm2
	Wld_InsertNpc 	(SLD_840_Alvares, 		"FARM2");
	Wld_InsertNpc 	(SLD_841_Engardo, 		"FARM2");

	Wld_InsertNpc 	(BAU_940_Akil, 			"FARM2");
	Wld_InsertNpc 	(BAU_941_Kati, 			"FARM2");
	Wld_InsertNpc 	(BAU_942_Randolph, 		"FARM2");
	Wld_InsertNpc 	(BAU_943_Bauer, 		"FARM2");
	Wld_InsertNpc 	(BAU_944_Ehnim, 		"FARM2");
	Wld_InsertNpc 	(BAU_945_Egill, 		"FARM2");

	Wld_InsertNpc 	(Sheep, 		"NW_FARM2_OUT_02");
	Wld_InsertNpc 	(Sheep, 		"NW_FARM2_OUT_02");

	// Taverne
	
	Wld_InsertNpc 	(BAU_970_Orlan, 		"TAVERNE");
	Wld_InsertNpc 	(BAU_971_Bauer, 		"TAVERNE");
	Wld_InsertNpc 	(BAU_972_Bauer, 		"TAVERNE");
	Wld_InsertNpc 	(BAU_973_Rukhar, 		"TAVERNE");
	Wld_InsertNpc 	(BAU_974_Bauer ,		"NW_TAVERNE_IN_07"); 

	Wld_InsertNpc 	(VLK_4303_Addon_Erol ,	"NW_TAVERNE_IN_07"); 

	// Monster

	Wld_InsertNpc 	(Giant_Rat, 			"FP_ROAM_MEDIUMFOREST_KAP2_12");
	Wld_InsertNpc 	(Giant_Rat, 			"FP_ROAM_MEDIUMFOREST_KAP2_10");

	Wld_InsertNpc 	(Scavenger, 	"FP_ROAM_MEDIUMFOREST_KAP2_28");
	Wld_InsertNpc 	(Scavenger, 	"FP_ROAM_MEDIUMFOREST_KAP2_29");
	
	Wld_InsertNpc 	(Scavenger, 		"FP_ROAM_MEDIUMFOREST_KAP2_17");
	Wld_InsertNpc 	(Scavenger, 		"FP_ROAM_MEDIUMFOREST_KAP2_13");
	Wld_InsertNpc 	(Wolf, 		"FP_ROAM_MEDIUMFOREST_KAP2_36");
	Wld_InsertNpc 	(Wolf, 		"FP_ROAM_MEDIUMFOREST_KAP2_34");


	Wld_InsertNpc 	(Skeleton, 		"FP_ROAM_MEDIUMFOREST_KAP3_04");
	Wld_InsertNpc 	(Skeleton, 		"FP_ROAM_MEDIUMFOREST_KAP3_05");

	Wld_InsertNpc 	(Zombie01, "FP_ROAM_MEDIUMFOREST_KAP3_01");
	Wld_InsertNpc 	(Zombie02, "FP_ROAM_MEDIUMFOREST_KAP3_02");
	Wld_InsertNpc 	(Zombie03, "FP_ROAM_MEDIUMFOREST_KAP3_03");

	Wld_InsertNpc 	(Warg, "FP_ROAM_MEDIUMFOREST_KAP3_08");
	Wld_InsertNpc 	(Warg, "FP_ROAM_MEDIUMFOREST_KAP3_09");
	Wld_InsertNpc 	(Warg, "FP_ROAM_MEDIUMFOREST_KAP3_11");
	Wld_InsertNpc 	(Giant_Bug, "FP_ROAM_MEDIUMFOREST_KAP3_15");
	Wld_InsertNpc 	(Wolf, "FP_ROAM_MEDIUMFOREST_KAP3_17");
	Wld_InsertNpc 	(Keiler, "FP_ROAM_MEDIUMFOREST_KAP3_21");
	Wld_InsertNpc 	(Warg, "FP_ROAM_MEDIUMFOREST_KAP3_23");
	Wld_InsertNpc 	(Warg, "FP_ROAM_MEDIUMFOREST_KAP3_28");
	Wld_InsertNpc 	(Warg, "FP_ROAM_MEDIUMFOREST_KAP3_29");

	Wld_InsertNpc 	(Shadowbeast, "FP_ROAM_MEDIUMFOREST_KAP3_20");

	Wld_InsertNpc 	(Giant_Rat, "FP_ROAM_MEDIUMFOREST_KAP3_27");
	Wld_InsertNpc 	(Giant_Rat, "FP_ROAM_MEDIUMFOREST_KAP3_26");

	Wld_InsertNpc 	(OrcWarrior_Roam, "FP_ROAM_MEDIUMFOREST_KAP3_32");

	// ------- vom Osttor zum Leuchtturm ------
	Wld_InsertNpc 	(Bloodfly, "NW_CITY_TO_LIGHTHOUSE_03"); //mehr FPs
	Wld_InsertNpc 	(Bloodfly, "NW_CITY_TO_LIGHTHOUSE_03");
	
	// ------- Küste ------
	Wld_InsertNpc 	(Waran, "FP_ROAM_SHIPWRECK_04"); 
	Wld_InsertItem  (ItWr_ManaStonePlate1_Addon, "FP_ROAM_SHIPWRECK_03");
	Wld_InsertNpc 	(Waran, "FP_ROAM_SHIPWRECK_01"); 
	
	//ADDON Wld_InsertNpc	(Waran,"FP_ROAM_FISHERCOAST_01");	
	//ADDON Wld_InsertNpc	(Waran,"FP_ROAM_FISHERCOAST_02");

	//ADDON: Wld_InsertNpc 	(Giant_Rat, "FP_ROAM_FISHERMAN_01");
	Wld_InsertNpc 	(Waran, "FP_ROAM_FISHERMAN_04");
	
	// ------- vom Osttor zu Farm2 ------
	Wld_InsertNpc 	(Mil_337_Mika, "FARM2");
	
	Wld_InsertNpc 	(Wolf, "NW_CITY_TO_FOREST_05");
	Wld_InsertNpc 	(Wolf, "NW_CITY_TO_FOREST_07");
	Wld_InsertNpc 	(Giant_Rat, "NW_CITY_TO_FOREST_11");
	Wld_InsertNpc 	(Giant_Rat, "NW_CITY_TO_FOREST_12");
	Wld_InsertNpc 	(Gobbo_Green, "NW_CITY_TO_FOREST_15"); //FPs fehlen
	
	Wld_InsertNpc 	(Wolf, "FP_ROAM_CITY_TO_FOREST_47");

	Wld_InsertNpc 	(Giant_Rat, "FP_ROAM_CITY_TO_FOREST_11");
	Wld_InsertNpc 	(Giant_Rat, "FP_ROAM_CITY_TO_FOREST_10");
	
	Wld_InsertNpc 	(Giant_Rat, "FP_ROAM_CITYFOREST_KAP3_22");
	Wld_InsertNpc 	(Giant_Rat, "FP_ROAM_CITYFOREST_KAP3_20");
	Wld_InsertNpc 	(Giant_Rat, "FP_ROAM_CITYFOREST_KAP3_21");

	Wld_InsertNpc 	(Giant_Bug, "FP_ROAM_CITYFOREST_KAP3_23");
	Wld_InsertNpc 	(Giant_Bug, "FP_ROAM_CITYFOREST_KAP3_27");
	Wld_InsertNpc 	(Giant_Bug, "FP_ROAM_CITYFOREST_KAP3_28");
	Wld_InsertNpc 	(Giant_Bug, "FP_ROAM_CITYFOREST_KAP3_29");
	Wld_InsertNpc 	(Giant_Bug, "FP_ROAM_CITYFOREST_KAP3_30");
	Wld_InsertNpc 	(Giant_Bug, "FP_ROAM_CITYFOREST_KAP3_38");

	Wld_InsertNpc 	(Waran, "FP_ROAM_CITY_TO_FOREST_32");
	Wld_InsertNpc 	(Waran, "FP_ROAM_CITY_TO_FOREST_29");
	Wld_InsertNpc 	(Waran, "FP_ROAM_CITY_TO_FOREST_31");

	Wld_InsertNpc 	(Molerat, "FP_ROAM_CITY_TO_FOREST_42");
	Wld_InsertNpc 	(Molerat, "FP_ROAM_CITY_TO_FOREST_41");

	Wld_InsertNpc 	(Shadowbeast, "FP_ROAM_CITYFOREST_KAP3_04");

	Wld_InsertNpc 	(Gobbo_Black, "FP_ROAM_CITYFOREST_KAP3_07");
	Wld_InsertNpc 	(Gobbo_Black, "FP_ROAM_CITYFOREST_KAP3_06");
	Wld_InsertNpc 	(Gobbo_Black, "FP_ROAM_CITYFOREST_KAP3_08");

	Wld_InsertNpc 	(Warg, "FP_ROAM_CITYFOREST_KAP3_09");
	Wld_InsertNpc 	(Warg, "FP_ROAM_CITYFOREST_KAP3_10");
	Wld_InsertNpc 	(Warg, "FP_ROAM_CITYFOREST_KAP3_11");
	Wld_InsertNpc 	(Warg, "FP_ROAM_CITYFOREST_KAP3_12");
	Wld_InsertNpc 	(Warg, "FP_ROAM_CITYFOREST_KAP3_14");
	Wld_InsertNpc 	(Warg, "FP_ROAM_CITYFOREST_KAP3_15");
	Wld_InsertNpc 	(Warg, "FP_ROAM_CITYFOREST_KAP3_17");
	
	// VINOSKELLEREI
	Wld_InsertNpc 		(Giant_Rat ,"NW_FOREST_VINOSKELLEREI_01"); 
	Wld_InsertNpc 		(Giant_Rat ,"NW_FOREST_VINOSKELLEREI_01"); 
	Wld_InsertItem 		(ItWr_VinosKellergeister_Mis ,"FP_ITEM_NW_VINOKELLEREI"); 

	// ----------- Lighthouse ------------
	
	Wld_InsertNpc 	(BDT_1021_LeuchtturmBandit, "LIGHTHOUSE"); 
	Wld_InsertNpc 	(BDT_1022_LeuchtturmBandit, "NW_LIGHTHOUSE_IN_01");
	Wld_InsertNpc 	(BDT_1023_LeuchtturmBandit, "NW_CITY_TO_LIGHTHOUSE_16");
	
	// ----------- SMForestCave ------------
	Wld_InsertNpc 	(Giant_Rat, "NW_CITY_SMFOREST_05");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_05");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_05");
	
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_06");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_06");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_06");
	
	Wld_InsertNpc 	(BDT_1000_Bandit_L, "NW_CITY_SMFOREST_07");
	Wld_InsertNpc 	(BDT_1002_Bandit_L, "NW_CITY_SMFOREST_BANDIT_02");
	
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_08");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_08");
	
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_09");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_09");
	Wld_InsertNpc 	(Giant_Rat, "NW_CITY_SMFOREST_09");
	
	Wld_InsertNpc 	(Giant_Rat, "NW_CITY_SMFOREST_03");
	Wld_InsertNpc 	(Giant_Rat, "NW_CITY_SMFOREST_03");
	
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_01_01");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_01_01");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_SMFOREST_01_01");
	
	// ----------- COASTCAVE ------------
	Wld_InsertNpc 	(Shadowbeast, "NW_FOREST_PATH_35_06");
	
	// ----------- City2Cave ------------
	Wld_InsertNpc 	(Orcwarrior_Rest, "NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc 	(Wolf, "NW_CITY_TO_FOREST_04_09");
	
	Wld_InsertNpc 	(Meatbug, "NW_CITY_TO_FOREST_04_05");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_TO_FOREST_04_05");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_TO_FOREST_04_05");
	
	Wld_InsertNpc 	(Meatbug, "NW_CITY_TO_FOREST_04_05_01");
	Wld_InsertNpc 	(Meatbug, "NW_CITY_TO_FOREST_04_05_01");
	
	// ----------- BridgeCave ------------
	Wld_InsertNpc 	(Molerat, "NW_TAVERN_TO_FOREST_05_05");
	Wld_InsertNpc 	(Molerat, "NW_TAVERN_TO_FOREST_05_06");
	
	// ----------- ShadowBeastCave ------------
	Wld_InsertNpc 	(Gobbo_Green, "NW_CITYFOREST_CAVE_A01");
	Wld_InsertNpc 	(Gobbo_Green, "NW_CITYFOREST_CAVE_A01");
	
	Wld_InsertNpc 	(Gobbo_Black, "NW_CITYFOREST_CAVE_A02");
	
	Wld_InsertNpc 	(Giant_Rat, "NW_CITYFOREST_CAVE_04");
	Wld_InsertNpc 	(Giant_Rat, "NW_CITYFOREST_CAVE_04");
	
	Wld_InsertNpc 	(Molerat, "NW_CITYFOREST_CAVE_06");
	Wld_InsertNpc 	(Molerat, "NW_CITYFOREST_CAVE_06");
	Wld_InsertNpc 	(Molerat, "NW_CITYFOREST_CAVE_06");
		
	Wld_InsertNpc 	(Shadowbeast, "NW_CITYFOREST_CAVE_A06");
	
	// andere
	Wld_InsertNpc 	(Giant_Rat, "NW_FARM1_CITYWALL_RIGHT_04");
	Wld_InsertNpc 	(Giant_Rat, "NW_FARM1_CITYWALL_RIGHT_04");

	Wld_InsertNpc 	(Scavenger, "NW_FOREST_PATH_38_MONSTER");
	Wld_InsertNpc 	(Scavenger, "NW_FOREST_PATH_38_MONSTER");

	Wld_InsertNpc 	(Keiler, "NW_CITY_TO_LIGHTHOUSE_13_MONSTER");

	Wld_InsertNpc 	(Wolf, "NW_FOREST_PATH_35_01");
	Wld_InsertNpc 	(Wolf, "NW_FOREST_PATH_35_01");

	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_31_MONSTER");
	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_31_MONSTER");

	Wld_InsertNpc 	(Molerat, "NW_FOREST_PATH_21_MONSTER");
	Wld_InsertNpc 	(Molerat, "NW_FOREST_PATH_21_MONSTER");

	Wld_InsertNpc 	(Giant_Bug, "NW_FARM2_TO_TAVERN_09_MONSTER");

	Wld_InsertNpc 	(Giant_Bug, "NW_FARM2_TO_TAVERN_09_MONSTER2");
	Wld_InsertNpc 	(Giant_Bug, "NW_FARM2_TO_TAVERN_09_MONSTER2");

	Wld_InsertNpc 	(Giant_Bug, "NW_FARM2_TO_TAVERN_09_MONSTER3");
	Wld_InsertNpc 	(Giant_Bug, "NW_FARM2_TO_TAVERN_09_MONSTER3");

	Wld_InsertNpc 	(Molerat, "NW_FARM2_TO_TAVERN_09_MONSTER4");
	Wld_InsertNpc 	(Molerat, "NW_FARM2_TO_TAVERN_09_MONSTER4");
	Wld_InsertNpc 	(Molerat, "NW_FARM2_TO_TAVERN_09_MONSTER4");

	Wld_InsertNpc 	(Bloodfly, "NW_FARM2_TO_TAVERN_09_MONSTER5");
	Wld_InsertNpc 	(Bloodfly, "NW_FARM2_TO_TAVERN_09_MONSTER5");

	Wld_InsertNpc 	(Wolf, "NW_CITY_TO_FOREST_04");

	Wld_InsertNpc 	(Wolf, "NW_FOREST_CAVE1_01");

	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_75_2_MONSTER");
	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_75_2_MONSTER");

	Wld_InsertNpc 	(Keiler, "NW_FOREST_PATH_79");
	Wld_InsertNpc 	(Keiler, "NW_FOREST_PATH_79");

	Wld_InsertNpc 	(Keiler, "NW_FOREST_PATH_80_1");
	Wld_InsertNpc 	(Keiler, "NW_FOREST_PATH_80_1");

	Wld_InsertNpc 	(Waran, "NW_FOREST_PATH_82");
	Wld_InsertNpc 	(Waran, "NW_FOREST_PATH_82");

	Wld_InsertNpc 	(Waran, "NW_FOREST_PATH_82_M");
	Wld_InsertNpc 	(Waran, "NW_FOREST_PATH_82_M");

	Wld_InsertNpc 	(Wolf, "NW_FOREST_PATH_66_M");
	Wld_InsertNpc 	(Wolf, "NW_FOREST_PATH_66_M");

 	Wld_InsertNpc 	(Gobbo_Skeleton, "NW_FOREST_PATH_62_M");
 	Wld_InsertNpc 	(Gobbo_Skeleton, "NW_FOREST_PATH_62_M");

 	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_57");
 	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_57");

 	Wld_InsertNpc 	(Bloodfly, "NW_FOREST_PATH_35_01_MONSTER");
 	Wld_InsertNpc 	(Bloodfly, "NW_FOREST_PATH_35_01_MONSTER");

 	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_80_1_MOVEMENT8_M");
 	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_80_1_MOVEMENT8_M");

 	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_80_1_MOVEMENTF");
 	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_80_1_MOVEMENTF");

 	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_31_NAVIGATION3");
 	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_31_NAVIGATION3");

  	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_31_NAVIGATION10");
  	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_31_NAVIGATION10");

  	Wld_InsertNpc 	(Giant_Rat, "NW_FOREST_PATH_31_NAVIGATION11");

  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT6");
  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT6");

  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT15");
  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT15");
  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT15");

  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT8_M5");
  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT8_M5");

  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_31_NAVIGATION16");
  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_31_NAVIGATION16");

  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT8_M3");
  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT8_M3");
  	Wld_InsertNpc 	(Snapper, "NW_FOREST_PATH_80_1_MOVEMENT8_M3");

  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_04_16_MONSTER");
  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_04_16_MONSTER");
  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_04_16_MONSTER");

  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_04_16_MONSTER2");
  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_04_16_MONSTER2");

  	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_04_13");
  	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_04_13");

  	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_04_3");

  	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_04_4");
  	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_04_4");

  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_72_MONSTER");

  	Wld_InsertNpc 	(Bloodfly, "NW_FOREST_PATH_62_06");
  	Wld_InsertNpc 	(Bloodfly, "NW_FOREST_PATH_62_06");

  	Wld_InsertNpc 	(Molerat, "NW_FOREST_PATH_56_MONSTER");
  	Wld_InsertNpc 	(Molerat, "NW_FOREST_PATH_56_MONSTER");

  	Wld_InsertNpc 	(Bloodfly, "NW_FOREST_PATH_27_03");
  	Wld_InsertNpc 	(Bloodfly, "NW_FOREST_PATH_27_03");

  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_27_02");
  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_27_02");

  	Wld_InsertNpc 	(Scavenger, "NW_CITY_TO_LIGHTHOUSE_13_MONSTER7");
  	Wld_InsertNpc 	(Scavenger, "NW_CITY_TO_LIGHTHOUSE_13_MONSTER7");

  	Wld_InsertNpc 	(Bloodfly, "NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");
  	Wld_InsertNpc 	(Bloodfly, "NW_CITY_TO_LIGHTHOUSE_13_MONSTER8");

  	Wld_InsertNpc 	(Keiler, "NW_FOREST_PATH_35_MONSTER");

  	Wld_InsertNpc 	(Orcwarrior_Roam, "NW_FOREST_PATH_31_NAVIGATION_M");
  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_31_NAVIGATION_M");

  	Wld_InsertNpc 	(Orcwarrior_Roam, "NW_FOREST_PATH_31_NAVIGATION19");
  	Wld_InsertNpc 	(Orcwarrior_Roam, "NW_FOREST_PATH_31_NAVIGATION19");

  	Wld_InsertNpc 	(Orcelite_Roam, "NW_FOREST_PATH_18_MONSTER");
  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_18_MONSTER");

  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_72_MONSTER23");
  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_72_MONSTER23");

  	Wld_InsertNpc 	(Molerat, "NW_FOREST_PATH_76");

  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_66_MONSTER");
  	Wld_InsertNpc 	(Warg, "NW_FOREST_PATH_66_MONSTER");

  	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_04_5");
  	Wld_InsertNpc 	(Giant_Bug, "NW_FOREST_PATH_04_5");

  	//Egill/Enim-FIX
  	//Wld_InsertNpc 	(Giant_Bug, "NW_CITY_TO_FARM2_05_MOV5");
  	//Wld_InsertNpc 	(Giant_Bug, "NW_CITY_TO_FARM2_05_MOV5");

  	Wld_InsertNpc 	(Keiler, "NW_FOREST_PATH_04_14_MONSTER");
  	Wld_InsertNpc 	(Keiler, "NW_FOREST_PATH_04_14_MONSTER");

   	Wld_InsertNpc 	(Molerat, "NW_CITY_SMFOREST_03_M");
   	Wld_InsertNpc 	(Molerat, "NW_CITY_SMFOREST_03_M");

   	Wld_InsertNpc 	(Molerat, "NW_FOREST_PATH_25_01_M");
   	Wld_InsertNpc 	(Molerat, "NW_FOREST_PATH_25_01_M");
   	
   	//ADDON
   	
   	//Beim ersten Händlerüberfall
    Wld_InsertNpc 	(BDT_10300_Addon_RangerBandit_L, "NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
    Wld_InsertNpc 	(BDT_10301_Addon_RangerBandit_M, "NW_FARM2_TO_TAVERN_RANGERBANDITS_02");	
    Wld_InsertNpc 	(BDT_10302_Addon_RangerBandit_L, "NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
    Wld_InsertNpc 	(BDT_10303_Addon_RangerBandit_L, "NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
  	
    Wld_InsertNpc 	(BDT_10304_Addon_RangerBandit_M, "NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
    Wld_InsertNpc 	(BDT_10305_Addon_RangerBandit_L, "NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
    
    Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_ITEM_FOREST_BANDITTRADER_01");
	Wld_InsertItem 	(ItMw_Addon_BanditTrader, "FP_SMALLTALK_NW_FARM2_TO_TAVERN_08_02");
 
    //Stoneplates
    Wld_InsertItem 	(ItWr_StonePlateCommon_Addon, "FP_ITEM_FOREST_STPLATE_01");
    Wld_InsertItem 	(ItWr_StrStonePlate1_Addon, "FP_ITEM_FOREST_STPLATE_02");
    Wld_InsertItem 	(ItMi_Zeitspalt_Addon, "FP_ITEM_FOREST_STPLATE_04");
    Wld_InsertItem 	(ItWr_HitPointStonePlate1_Addon, "FP_ITEM_FOREST_STPLATE_06");
};

	FUNC VOID INIT_SUB_NewWorld_Part_Forest_01()
	{
	};

FUNC VOID INIT_NewWorld_Part_Forest_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();	
	
	INIT_SUB_NewWorld_Part_Forest_01();
};
	
//------- Troll Area ---------------------------
FUNC VOID STARTUP_NewWorld_Part_TrollArea_01 ()
{
	
	
	
	
	
	
	
	
	//----- Magierhöhle -----
	/*
	Wld_InsertNpc 	(Skeleton, 				"NW_MAGECAVE_SKELETON");
	Wld_InsertNpc 	(Lesser_Skeleton, 		"NW_MAGECAVE_15");
	Wld_InsertNpc 	(Lesser_Skeleton, 		"NW_MAGECAVE_16");
	Wld_InsertNpc 	(Lesser_Skeleton, 		"NW_MAGECAVE_GUARD_02");
	Wld_InsertNpc 	(Lesser_Skeleton, 		"NW_MAGECAVE_GUARD_01");
	Wld_InsertNpc 	(Lesser_Skeleton, 		"NW_MAGECAVE_CROSSING");
	Wld_InsertNpc 	(Lesser_Skeleton, 		"NW_MAGECAVE_CROSSING");
	*/
	Wld_InsertNpc 	(Meatbug, 				"NW_MAGECAVE_20");
	Wld_InsertNpc 	(Meatbug, 				"NW_MAGECAVE_20");
	Wld_InsertNpc 	(Meatbug, 				"NW_MAGECAVE_20");
	Wld_InsertNpc 	(Minecrawler, 			"NW_MAGECAVE_23");
	Wld_InsertNpc 	(Minecrawler, 			"NW_MAGECAVE_23");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"NW_MAGECAVE_27");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"NW_MAGECAVE_27");
	Wld_InsertItem 	(ItWr_HitPointStonePlate3_Addon, "FP_NW_ITEM_MAGECAVE_EGG");



	//----- Schwarzer Troll -----
	Wld_InsertNpc 	(Troll_Black, 			"NW_TROLLAREA_PATH_84");
	Wld_InsertItem	(ItPl_Sagitta_Herb_MIS, "FP_NW_ITEM_TROLL_05");
	Wld_InsertItem	(ItWr_ManaStonePlate3_Addon, "FP_NW_ITEM_TROLL_01");
	Wld_InsertNpc 	(BAU_982_Grimbald, 		"TROLL");

	//----- Der Weg -----
	Wld_InsertNpc 	(Gobbo_Green, 			"NW_TROLLAREA_PATH_56");
	Wld_InsertNpc 	(Gobbo_Green, 			"NW_TROLLAREA_PATH_56");
	Wld_InsertNpc 	(YGobbo_Green, 			"NW_TROLLAREA_PATH_56");
	
	//----- Der große See -----
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_TROLLAREA_SEA_01");
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_TROLLAREA_SEA_02");
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_TROLLAREA_SEA_03");
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_TROLLAREA_SEA_04");
	
	//RitualForest
	
	Wld_InsertNpc 	(Giant_Rat, 			"FP_ROAM_RITUALFOREST_CAVE_05");
	Wld_InsertNpc 	(Giant_Rat, 			"FP_ROAM_RITUALFOREST_CAVE_05");

	Wld_InsertNpc 	(MinecrawlerWarrior, 	"FP_ROAM_RITUALFOREST_CAVE_07");
	Wld_InsertNpc 	(Skeleton, 	"FP_ROAM_RITUALFOREST_CAVE_08");
	Wld_InsertNpc 	(Skeleton, 	"FP_ROAM_RITUALFOREST_CAVE_09");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"FP_ROAM_RITUALFOREST_CAVE_11");
	
	//----- Die Maya Pyramiden ------
	
	Wld_InsertNpc 	(Giant_Bug, 	"FP_ROAM_NW_TROLLAREA_RUINS_01");
	
	Wld_InsertNpc 	(Snapper, 	"FP_ROAM_NW_TROLLAREA_RUINS_05");
	Wld_InsertNpc 	(Snapper, 	"FP_ROAM_NW_TROLLAREA_RUINS_09");
	
	Wld_InsertNpc 	(Giant_Rat, 	"FP_ROAM_NW_TROLLAREA_RUINS_14");
	Wld_InsertNpc 	(Giant_Rat, 	"FP_ROAM_NW_TROLLAREA_RUINS_15");
	
	Wld_InsertNpc 	(FireWaran, 	"NW_TROLLAREA_RUINS_21");
	Wld_InsertNpc 	(FireWaran, 	"FP_ROAM_NW_TROLLAREA_RUINS_21");
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_NW_TROLLAREA_RUINS_22");
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_NW_TROLLAREA_RUINS_24");
	
	Wld_InsertNpc 	(Waran, 	"FP_ROAM_NW_TROLLAREA_RUINS_28");
	Wld_InsertNpc 	(Waran, 	"FP_ROAM_NW_TROLLAREA_RUINS_29");
	Wld_InsertNpc 	(Waran, 	"FP_ROAM_NW_TROLLAREA_RUINS_30");
	
	Wld_InsertNpc 	(Shadowbeast, 	"FP_ROAM_NW_TROLLAREA_RUINS_10");
	
	Wld_InsertItem 	(ItWr_HitPointStonePlate1_Addon,"FP_NW_ITEM_TROLL_07");
	Wld_InsertItem 	(ItWr_StonePlateCommon_Addon, 	"FP_NW_ITEM_TROLL_08");
	Wld_InsertItem 	(ItWr_CrsBowStonePlate1_Addon, 	"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_26");

	
	//in der Maya-Höhle
	
	//Gobbos in Eingangshöhle
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_01");
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_02");
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_03");
	
	//Gobbos in 2. Höhle
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_05");
	Wld_InsertItem 	(ItWr_HitPointStonePlate1_Addon, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_05");
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_06");
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_07");
	
	//Gobbos in 3. Höhle
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_09");
	Wld_InsertNpc 	(Gobbo_Warrior, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_10");
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_11");
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_12");
	Wld_InsertNpc 	(Gobbo_Black, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_14");
	
	//MineCrawler 1. Höhle
	Wld_InsertNpc 	(Minecrawler, 			"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_16");
	
	//2. Höhle
	Wld_InsertNpc 	(Minecrawler, 			"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_21");
	Wld_InsertNpc 	(Minecrawler, 			"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_23");
	
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_20");
	Wld_InsertNpc 	(MinecrawlerWarrior, 	"FP_ROAM_NW_TROLLAREA_RUINS_CAVE_26");
	
	//Golems		
	Wld_InsertNpc 	(Shattered_Golem, 		"FP_SHATTERED_GOLEM_01");
	Wld_InsertNpc 	(Shattered_Golem, 		"FP_SHATTERED_GOLEM_02");
	Wld_InsertNpc 	(Shattered_Golem, 		"FP_SHATTERED_GOLEM_03");
	Wld_InsertNpc 	(Shattered_Golem, 		"FP_SHATTERED_GOLEM_04");
	
	
				//ADDON
				//ADDON
				Wld_InsertNpc 	(KDW_1400_Addon_Saturas_NW, 		"MAYA");
				Wld_InsertNpc 	(KDW_1401_Addon_Cronos_NW, 			"MAYA");
				Wld_InsertNpc 	(KDW_1402_Addon_Nefarius_NW, 		"MAYA");
				Wld_InsertNpc 	(KDW_1403_Addon_Myxir_NW, 			"MAYA");
				Wld_InsertNpc 	(KDW_1404_Addon_Riordian_NW, 		"MAYA");
				Wld_InsertNpc 	(KDW_1405_Addon_Merdarion_NW, 		"MAYA");
				Wld_InsertItem (ItMi_AmbossEffekt_Addon,"FP_ITEM_TROLLAREA_PORTALRITUAL_01");
				
				
				Wld_InsertNpc 	(Gobbo_Skeleton, 		"NW_TROLLAREA_PORTALTEMPEL_15_A");
				Wld_InsertNpc 	(Gobbo_Skeleton, 		"NW_TROLLAREA_PORTALTEMPEL_15_B");
				Wld_InsertNpc 	(Gobbo_Skeleton, 		"NW_TROLLAREA_PORTALTEMPEL_15_B");
				Wld_InsertNpc 	(Gobbo_Skeleton, 		"NW_TROLLAREA_PORTALTEMPEL_17_A");
				
				Wld_InsertNpc 	(Giant_Rat, 		"NW_TROLLAREA_PORTALTEMPEL_12");
				Wld_InsertNpc 	(Giant_Rat, 		"NW_TROLLAREA_PORTALTEMPEL_12");
				Wld_InsertNpc 	(Giant_Rat, 		"NW_TROLLAREA_PORTALTEMPEL_09");
				Wld_InsertNpc 	(Giant_Rat, 		"NW_TROLLAREA_PORTALTEMPEL_08");
				Wld_InsertNpc 	(Giant_Rat, 		"NW_TROLLAREA_PORTALTEMPEL_08");
				Wld_InsertNpc 	(Giant_Rat, 		"NW_TROLLAREA_PORTALTEMPEL_06");
				Wld_InsertNpc 	(Giant_Rat, 		"NW_TROLLAREA_PORTALTEMPEL_06");
				Wld_InsertNpc 	(Giant_Rat, 		"NW_TROLLAREA_PORTALTEMPEL_06");
				
				//Wld_InsertNpc 	(Alligator_PortalDead, 		"NW_TROLLAREA_PORTALTEMPEL_DEADALLIGATOR");
				//B_KillNpc 		(Alligator_PortalDead);
				Wld_InsertNpc 	(Stoneguardian_Dead1, 		"NW_TROLLAREA_PORTALTEMPEL_08");
				B_KillNpc 		(Stoneguardian_Dead1); 
				Wld_InsertNpc 	(Stoneguardian_Dead2, 		"AMBOSS");
				B_KillNpc 		(Stoneguardian_Dead2); 
				Wld_InsertNpc 	(Stoneguardian_Dead3, 		"PORTAL");
				B_KillNpc 		(Stoneguardian_Dead3); 
				
			    Wld_InsertItem 	(ItWr_HitpointStonePlate1_Addon, "FP_ITEM_TROLLAREA_STPLATE_06");
			    Wld_InsertItem 	(ItWr_StonePlateCommon_Addon, "FP_ITEM_TROLLAREA_STPLATE_07");
			    Wld_InsertItem 	(ItWr_ManaStonePlate1_Addon, "FP_ITEM_TROLLAREA_STPLATE_08");
			    Wld_InsertItem 	(ItWr_BowStonePlate1_Addon, "FP_ITEM_TROLLAREA_STPLATE_09");
			    Wld_InsertItem 	(ItWr_CrsBowStonePlate1_Addon, "FP_ITEM_TROLLAREA_STPLATE_12");
			    Wld_InsertItem 	(ItWr_TwoHStonePlate2_Addon, "FP_ITEM_TROLLAREA_STPLATE_13");
			    Wld_InsertItem 	(ItWr_OneHStonePlate2_Addon, "FP_ITEM_TROLLAREA_STPLATE_14");
			    Wld_InsertItem 	(ItWr_StonePlateCommon_Addon, "FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_DEADALLIGATOR");
			 
 				//ADDON
 				//ADDON

	
	//andere
	
	Wld_InsertNpc 	(Wolf, 		"NW_TROLLAREA_PATH_66_MONSTER");
	Wld_InsertNpc 	(Wolf, 		"NW_TROLLAREA_PATH_66_MONSTER");
	Wld_InsertItem 	(ItWr_ManaStonePlate1_Addon, "FP_ROAM_NW_TROLLAREA_PATH_66_MONSTER_03");

	Wld_InsertItem 	(ItWr_HitPointStonePlate2_Addon, "FP_NW_ITEM_TROLL_03");

	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_PLANE_07");
	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_PLANE_07");


	Wld_InsertNpc 	(Molerat, 		"NW_TROLLAREA_NOVCHASE_01");

	Wld_InsertNpc 	(Bloodfly, 		"NW_TROLLAREA_PATH_38_MONSTER");
	Wld_InsertItem 	(ItWr_OneHStonePlate1_Addon, 		"FP_NW_ITEM_TROLL_02");
	Wld_InsertItem 	(ItWr_TwoHStonePlate1_Addon, 		"FP_ROAM_NW_TROLLAREA_PATH_38_MONSTER_02");
	Wld_InsertNpc 	(Bloodfly, 		"NW_TROLLAREA_PATH_38_MONSTER");

	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_PLANE_04");

	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_RUINS_17");
	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_RUINS_17");

	Wld_InsertNpc 	(Gobbo_Black, 		"NW_TROLLAREA_RUINS_14");
	Wld_InsertNpc 	(Gobbo_Black, 		"NW_TROLLAREA_RUINS_14");

	Wld_InsertNpc 	(Waran, 		"NW_TROLLAREA_RUINS_32");
	Wld_InsertNpc 	(Waran, 		"NW_TROLLAREA_RUINS_32");

	Wld_InsertNpc 	(Lurker, 		"NW_TROLLAREA_PATH_71_MONSTER");

	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_PATH_71_MONSTER2");
	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_PATH_71_MONSTER2");
	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_PATH_71_MONSTER2");

	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_PATH_15_MONSTER");
	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_PATH_15_MONSTER");

	Wld_InsertNpc 	(Grimbald_Snapper1, 		"NW_TROLLAREA_BRIGDE_01");
	Wld_InsertNpc 	(Grimbald_Snapper2, 		"NW_TROLLAREA_BRIGDE_01");
	Wld_InsertNpc 	(Grimbald_Snapper3, 		"NW_TROLLAREA_BRIGDE_01");

	Wld_InsertNpc 	(Molerat, 		"NW_TROLLAREA_RITUALFOREST_04_MONSTER");
	Wld_InsertNpc 	(Molerat, 		"NW_TROLLAREA_RITUALFOREST_04_MONSTER");
	Wld_InsertItem 	(ItWr_HitPointStonePlate1_Addon, 	"FP_ROAM_NW_TROLLAREA_RITUAL_08_02");

	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_RITUALPATH_04");
	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_RITUALPATH_04");
	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_RITUALPATH_04");

	Wld_InsertNpc 	(Gobbo_Skeleton, 		"NW_TROLLAREA_RITUAL_13");
	Wld_InsertNpc 	(Gobbo_Skeleton, 		"NW_TROLLAREA_RITUAL_13");

	Wld_InsertNpc 	(Bloodfly, 		"NW_TROLLAREA_RITUALPATH_032");
	Wld_InsertNpc 	(Bloodfly, 		"NW_TROLLAREA_RITUALPATH_032");
	Wld_InsertNpc 	(Bloodfly, 		"NW_TROLLAREA_RITUALPATH_032");

	Wld_InsertNpc 	(Wisp, 		"NW_TROLLAREA_PLANE_01");
	Wld_InsertItem 	(ItWr_HitPointStonePlate2_Addon, 		"FP_ROAM_NW_TROLLAREA_PLANE_01_01");

	Wld_InsertNpc 	(Scavenger, 		"NW_TROLLAREA_PATH_22_MONSTER");

	Wld_InsertNpc 	(Molerat, 		"NW_TROLLAREA_RITUALFOREST_06_MONSTER");
	Wld_InsertNpc 	(Molerat, 		"NW_TROLLAREA_RITUALFOREST_06_MONSTER");

	Wld_InsertNpc 	(Lurker, 		"NW_TROLLAREA_PATH_08");

	Wld_InsertNpc 	(Giant_Rat, 	"NW_TROLLAREA_BRIGDE_05");
	Wld_InsertNpc 	(Giant_Rat, 	"NW_TROLLAREA_BRIGDE_05");
	
	//TROLLROCKCAVE
	Wld_InsertNpc 	(Skeleton, 	"NW_TROLLAREA_TROLLROCKCAVE_03");
	Wld_InsertNpc 	(Skeleton, 	"NW_TROLLAREA_TROLLROCKCAVE_03");
	
	Wld_InsertNpc 	(Skeleton, 	"NW_TROLLAREA_TROLLROCKCAVE_05");
	
	Wld_InsertNpc 	(Skeleton_Lord, 	"NW_TROLLAREA_TROLLROCKCAVE_07");
	Wld_InsertNpc 	(Skeleton_Lord, 	"NW_TROLLAREA_TROLLROCKCAVE_10");
	
	//TROLLLAKECAVE
	Wld_InsertNpc 	(Meatbug, 				"NW_TROLLAREA_TROLLLAKECAVE_03A");
	Wld_InsertNpc 	(Meatbug, 				"NW_TROLLAREA_TROLLLAKECAVE_03A");
	Wld_InsertNpc 	(Meatbug, 				"NW_TROLLAREA_TROLLLAKECAVE_03A");
	Wld_InsertNpc 	(Meatbug, 				"NW_TROLLAREA_TROLLLAKECAVE_03A");
	
	Wld_InsertNpc 	(Giant_Rat, 	"NW_TROLLAREA_TROLLLAKECAVE_02");
	
	Wld_InsertNpc 	(Gobbo_Warrior, 	"NW_TROLLAREA_TROLLLAKECAVE_08");
	Wld_InsertNpc 	(Gobbo_Black, 	"NW_TROLLAREA_TROLLLAKECAVE_08");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_TROLLLAKECAVE_08");
	
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_TROLLLAKECAVE_09");
	
	//RIVERSIDECAVE
	Wld_InsertNpc 	(Shadowbeast, 	"NW_TROLLAREA_RIVERSIDECAVE_02");
	Wld_InsertItem 	(ItWr_HitPointStonePlate3_Addon, 	"FP_ROAM_NW_TROLLAREA_RIVERSIDECAVE_01_03");
	
	Wld_InsertNpc 	(Shadowbeast, 	"NW_TROLLAREA_RIVERSIDECAVE_07");
		
};

	FUNC VOID INIT_SUB_NewWorld_Part_TrollArea_01()
	{
	};

FUNC VOID INIT_NewWorld_Part_TrollArea_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_NewWorld_Part_TrollArea_01();	
};

// ------ World -------
FUNC VOID STARTUP_NewWorld()
{	
	// ------ StartUps der Unter-Parts ------ 
	STARTUP_NewWorld_Part_City_01();
	STARTUP_NewWorld_Part_Farm_01();
	STARTUP_NewWorld_Part_Xardas_01();
	STARTUP_NewWorld_Part_Monastery_01();
	STARTUP_NewWorld_Part_GreatPeasant_01();
	STARTUP_NewWorld_Part_TrollArea_01();
	STARTUP_NewWorld_Part_Forest_01();
	STARTUP_NewWorld_Part_Pass_To_OW_01();
	// ------ INTRO - muss ganz am Ende der Startup stehen ------
	Kapitel = 1; //Joly: Kann hier stehen bleiben!
	PlayVideo ("INTRO.BIK");
	PlayVideo ("Addon_Title.BIK");
	
	//-----Addon Talent Goldhacken---------
	Hero_HackChance = 10;
};
FUNC VOID INIT_NewWorld()
{
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	B_ENTER_NEWWORLD ();
	
	// ------- Diebesgilde abtöten ------ 
	if (Diebesgilde_Verraten)
	&& (Andre_Diebesgilde_aufgeraeumt != TRUE)
	{
		if (!Npc_IsDead(Cassia))
		|| (!Npc_IsDead(Jesper))
		|| (!Npc_IsDead(Ramirez))
		{
			B_KillNpc(VLK_447_Cassia);
			B_KillNpc(VLK_446_Jesper);
			B_KillNpc(VLK_445_Ramirez);
			Andre_Diebesgilde_aufgeraeumt = TRUE;
		};
	};
	
	// ------ INITS der Unter-Parts ------ 
	INIT_SUB_NewWorld_Part_City_01();
	INIT_SUB_NewWorld_Part_Farm_01();
	INIT_SUB_NewWorld_Part_Xardas_01();
	INIT_SUB_NewWorld_Part_Monastery_01();
	INIT_SUB_NewWorld_Part_GreatPeasant_01();
	INIT_SUB_NewWorld_Part_TrollArea_01();
	INIT_SUB_NewWorld_Part_Forest_01();
	INIT_SUB_NewWorld_Part_Pass_To_OW_01();
	
	if (MIS_ReadyForChapter3  == TRUE )	//Joly: muß hier in der INIT ganz zum schluss stehen, nachdem alle NSCs fürs Kapitel insertet wurden!!!
	&& (B_Chapter3_OneTime == FALSE)
	{
		B_Kapitelwechsel (3,NEWWORLD_ZEN);
		B_Chapter3_OneTime = TRUE;
	};

	if (MIS_AllDragonsDead  == TRUE )	//Joly: muß hier in der INIT ganz zum schluss stehen, nachdem alle NSCs fürs Kapitel insertet wurden!!!
	&& (B_Chapter5_OneTime == FALSE)
	{
		B_Kapitelwechsel (5, NEWWORLD_ZEN);
		B_Chapter5_OneTime = TRUE;
	};
};


// ------ AddonWorld -------
FUNC VOID STARTUP_AddonWorld ()
{	
	STARTUP_ADDON_PART_BANDITSCAMP_01 ();
	STARTUP_ADDON_PART_PIRATESCAMP_01 ();
	STARTUP_ADDON_PART_ENTRANCE_01 ();
	STARTUP_ADDON_PART_GOLDMINE_01 ();
	STARTUP_ADDON_PART_CANYON_01 ();
	STARTUP_ADDON_PART_VALLEY_01 ();
	STARTUP_ADDON_PART_ADANOSTEMPLE_01 ();
		
	// ------ StartUps der Unter-Parts ------ 
	ENTERED_ADDONWORLD = TRUE;
	CurrentLevel = ADDONWORLD_ZEN;	 
	Wld_SetTime	(60,00);//Joly: KDW sind schon 2 Tag da. SC hat ein biosschen länger gebraucht.
};
FUNC VOID INIT_AddonWorld ()
{
	INIT_SUB_ADDON_PART_BANDITSCAMP_01 ();
	INIT_SUB_ADDON_PART_PIRATESCAMP_01 ();
 	INIT_SUB_ADDON_PART_ENTRANCE_01 ();
   	INIT_SUB_ADDON_PART_GOLDMINE_01 ();
   	INIT_SUB_ADDON_PART_CANYON_01 ();
   	INIT_SUB_ADDON_PART_VALLEY_01 ();
   	INIT_SUB_ADDON_PART_ADANOSTEMPLE_01 ();
   
    B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	B_ENTER_ADDONWORLD ();
	
	// ------ INITS der Unter-Parts ------ 
};



