PROTOTYPE Default_AmbientDementor (C_NPC)			
{
	// ------ NSC ------
	name 		= NAME_Dementor;	
	guild 		= GIL_DMT;
	voice 		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	// ------ Equippte Waffen ------																

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_MadPsi, BodyTex_N, ITAR_Dementor);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80);
	
	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	bodyStateInterruptableOverride = TRUE; 
};

// *******************************************************
// DMT_DementorAmbient
// *******************************************************

instance DMT_DementorAmbient (Default_AmbientDementor)	//Joly: greift auf Sicht an (alle NSCs), VORSICHT, nur bedacht in bewohnte Gebiete setzten.
{
	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};


// *******************************************************
// DMT_DementorAmbientSpeaker
// *******************************************************

instance DMT_DementorAmbientSpeaker (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};

// *******************************************************
// DMT_DementorAmbientWalker
// *******************************************************

instance DMT_DementorAmbientWalker1 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1221;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1221;
};

FUNC VOID Rtn_Start_1221 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(07,00,08,00,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor	(08,00,09,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(09,00,10,00,"NW_FARM1_CITYWALL_05");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(11,00,12,00,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor	(12,00,13,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(13,00,14,00,"NW_FARM1_CITYWALL_05");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(15,00,16,00,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor	(16,00,17,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(17,00,18,00,"NW_FARM1_CITYWALL_05");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(19,00,20,00,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor	(20,00,21,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(21,00,22,00,"NW_FARM1_CITYWALL_05");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(23,00,00,00,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor	(00,00,01,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(01,00,02,00,"NW_FARM1_CITYWALL_05");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(03,00,04,00,"NW_FARM1_CITYWALL_05");
	TA_Stand_Dementor	(04,00,05,00,"NW_XARDAS_TOWER_VIEW_03");
	TA_Stand_Dementor	(05,00,06,00,"NW_FARM1_CITYWALL_05");
};

instance DMT_DementorAmbientWalker2 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1222;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1222;
};

FUNC VOID Rtn_Start_1222 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(07,00,08,00,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor	(08,00,09,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(09,00,10,00,"NW_XARDAS_VALLEY_03");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(11,00,12,00,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor	(12,00,13,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(13,00,14,00,"NW_XARDAS_VALLEY_03");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(15,00,16,00,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor	(16,00,17,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(17,00,18,00,"NW_XARDAS_VALLEY_03");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(19,00,20,00,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor	(20,00,21,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(21,00,22,00,"NW_XARDAS_VALLEY_03");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(23,00,00,00,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor	(00,00,01,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(01,00,02,00,"NW_XARDAS_VALLEY_03");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(03,00,04,00,"NW_XARDAS_VALLEY_03");
	TA_Stand_Dementor	(04,00,05,00,"NW_XARDAS_TOWER_SECRET_CAVE_04");
	TA_Stand_Dementor	(05,00,06,00,"NW_XARDAS_VALLEY_03");
};

instance DMT_DementorAmbientWalker3 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1223;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1223;
};

FUNC VOID Rtn_Start_1223 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(07,00,08,00,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor	(08,00,09,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(09,00,10,00,"NW_CITY_TO_FARM2_10");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(11,00,12,00,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor	(12,00,13,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(13,00,14,00,"NW_CITY_TO_FARM2_10");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(15,00,16,00,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor	(16,00,17,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(17,00,18,00,"NW_CITY_TO_FARM2_10");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(19,00,20,00,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor	(20,00,21,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(21,00,22,00,"NW_CITY_TO_FARM2_10");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(23,00,00,00,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor	(00,00,01,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(01,00,02,00,"NW_CITY_TO_FARM2_10");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(03,00,04,00,"NW_CITY_TO_FARM2_10");
	TA_Stand_Dementor	(04,00,05,00,"NW_FARM3_PATH_12_MONSTER_03");
	TA_Stand_Dementor	(05,00,06,00,"NW_CITY_TO_FARM2_10");
};

instance DMT_DementorAmbientWalker4 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1224;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1224;
};

FUNC VOID Rtn_Start_1224 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(07,00,08,00,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor	(08,00,09,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(09,00,10,00,"NW_TAVERNE_BIGFARM_05");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(11,00,12,00,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor	(12,00,13,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(13,00,14,00,"NW_TAVERNE_BIGFARM_05");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(15,00,16,00,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor	(16,00,17,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(17,00,18,00,"NW_TAVERNE_BIGFARM_05");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(19,00,20,00,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor	(20,00,21,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(21,00,22,00,"NW_TAVERNE_BIGFARM_05");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(23,00,00,00,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor	(00,00,01,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(01,00,02,00,"NW_TAVERNE_BIGFARM_05");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(03,00,04,00,"NW_TAVERNE_BIGFARM_05");
	TA_Stand_Dementor	(04,00,05,00,"NW_BIGMILL_PATH_05");
	TA_Stand_Dementor	(05,00,06,00,"NW_TAVERNE_BIGFARM_05");
};

instance DMT_DementorAmbientWalker5 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1225;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1225;
};

FUNC VOID Rtn_Start_1225 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(07,00,08,00,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor	(08,00,09,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(09,00,10,00,"NW_BIGMILL_FARM3_03");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(11,00,12,00,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor	(12,00,13,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(13,00,14,00,"NW_BIGMILL_FARM3_03");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(15,00,16,00,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor	(16,00,17,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(17,00,18,00,"NW_BIGMILL_FARM3_03");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(19,00,20,00,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor	(20,00,21,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(21,00,22,00,"NW_BIGMILL_FARM3_03");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(23,00,00,00,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor	(00,00,01,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(01,00,02,00,"NW_BIGMILL_FARM3_03");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(03,00,04,00,"NW_BIGMILL_FARM3_03");
	TA_Stand_Dementor	(04,00,05,00,"NW_FARM3_BIGWOOD_04");
	TA_Stand_Dementor	(05,00,06,00,"NW_BIGMILL_FARM3_03");
};

instance DMT_DementorAmbientWalker6 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1226;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1226;
};

FUNC VOID Rtn_Start_1226 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(07,00,08,00,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor	(08,00,09,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(09,00,10,00,"NW_BIGMILL_PATH_06");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(11,00,12,00,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor	(12,00,13,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(13,00,14,00,"NW_BIGMILL_PATH_06");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(15,00,16,00,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor	(16,00,17,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(17,00,18,00,"NW_BIGMILL_PATH_06");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(19,00,20,00,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor	(20,00,21,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(21,00,22,00,"NW_BIGMILL_PATH_06");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(23,00,00,00,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor	(00,00,01,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(01,00,02,00,"NW_BIGMILL_PATH_06");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(03,00,04,00,"NW_BIGMILL_PATH_06");
	TA_Stand_Dementor	(04,00,05,00,"NW_PATH_TO_MONASTERY_07");
	TA_Stand_Dementor	(05,00,06,00,"NW_BIGMILL_PATH_06");
};

instance DMT_DementorAmbientWalker7 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1227;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1227;
};

FUNC VOID Rtn_Start_1227 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(07,00,08,00,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor	(08,00,09,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(09,00,10,00,"NW_TROLLAREA_RIVERSIDE_10");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(11,00,12,00,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor	(12,00,13,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(13,00,14,00,"NW_TROLLAREA_RIVERSIDE_10");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(15,00,16,00,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor	(16,00,17,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(17,00,18,00,"NW_TROLLAREA_RIVERSIDE_10");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(19,00,20,00,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor	(20,00,21,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(21,00,22,00,"NW_TROLLAREA_RIVERSIDE_10");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(23,00,00,00,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor	(00,00,01,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(01,00,02,00,"NW_TROLLAREA_RIVERSIDE_10");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(03,00,04,00,"NW_TROLLAREA_RIVERSIDE_10");
	TA_Stand_Dementor	(04,00,05,00,"NW_TROLLAREA_PATH_62");
	TA_Stand_Dementor	(05,00,06,00,"NW_TROLLAREA_RIVERSIDE_10");
};

instance DMT_DementorAmbientWalker8 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1228;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1228;
};

FUNC VOID Rtn_Start_1228 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(07,00,08,00,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor	(08,00,09,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(09,00,10,00,"NW_TROLLAREA_PLANE_08");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(11,00,12,00,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor	(12,00,13,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(13,00,14,00,"NW_TROLLAREA_PLANE_08");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(15,00,16,00,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor	(16,00,17,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(17,00,18,00,"NW_TROLLAREA_PLANE_08");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(19,00,20,00,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor	(20,00,21,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(21,00,22,00,"NW_TROLLAREA_PLANE_08");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(23,00,00,00,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor	(00,00,01,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(01,00,02,00,"NW_TROLLAREA_PLANE_08");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(03,00,04,00,"NW_TROLLAREA_PLANE_08");
	TA_Stand_Dementor	(04,00,05,00,"NW_TROLLAREA_PATH_49");
	TA_Stand_Dementor	(05,00,06,00,"NW_TROLLAREA_PLANE_08");
};

instance DMT_DementorAmbientWalker9 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1229;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1229;
};

FUNC VOID Rtn_Start_1229 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(07,00,08,00,"BIGCROSS");
	TA_Stand_Dementor	(08,00,09,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(09,00,10,00,"BIGCROSS");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(11,00,12,00,"BIGCROSS");
	TA_Stand_Dementor	(12,00,13,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(13,00,14,00,"BIGCROSS");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(15,00,16,00,"BIGCROSS");
	TA_Stand_Dementor	(16,00,17,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(17,00,18,00,"BIGCROSS");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(19,00,20,00,"BIGCROSS");
	TA_Stand_Dementor	(20,00,21,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(21,00,22,00,"BIGCROSS");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(23,00,00,00,"BIGCROSS");
	TA_Stand_Dementor	(00,00,01,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(01,00,02,00,"BIGCROSS");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(03,00,04,00,"BIGCROSS");
	TA_Stand_Dementor	(04,00,05,00,"NW_TROLLAREA_PATH_31");
	TA_Stand_Dementor	(05,00,06,00,"BIGCROSS");
};

instance DMT_DementorAmbientWalker10 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1230;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1230;
};

FUNC VOID Rtn_Start_1230 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(07,00,08,00,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor	(08,00,09,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(09,00,10,00,"NW_TROLLAREA_RITUALFOREST_17");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(11,00,12,00,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor	(12,00,13,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(13,00,14,00,"NW_TROLLAREA_RITUALFOREST_17");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(15,00,16,00,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor	(16,00,17,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(17,00,18,00,"NW_TROLLAREA_RITUALFOREST_17");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(19,00,20,00,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor	(20,00,21,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(21,00,22,00,"NW_TROLLAREA_RITUALFOREST_17");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(23,00,00,00,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor	(00,00,01,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(01,00,02,00,"NW_TROLLAREA_RITUALFOREST_17");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(03,00,04,00,"NW_TROLLAREA_RITUALFOREST_17");
	TA_Stand_Dementor	(04,00,05,00,"NW_TROLLAREA_PATH_42");
	TA_Stand_Dementor	(05,00,06,00,"NW_TROLLAREA_RITUALFOREST_17");
};

instance DMT_DementorAmbientWalker11 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ NSC ------
	id 			= 1231;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1231;
};

FUNC VOID Rtn_Start_1231 ()
{	
	TA_Stand_Dementor	(06,00,07,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(07,00,08,00,"NW_FOREST_PATH_79");
	TA_Stand_Dementor	(08,00,09,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(09,00,10,00,"NW_FOREST_PATH_79");
	
	TA_Stand_Dementor	(10,00,11,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(11,00,12,00,"NW_FOREST_PATH_79");
	TA_Stand_Dementor	(12,00,13,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(13,00,14,00,"NW_FOREST_PATH_79");
	
	TA_Stand_Dementor	(14,00,15,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(15,00,16,00,"NW_FOREST_PATH_79");
	TA_Stand_Dementor	(16,00,17,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(17,00,18,00,"NW_FOREST_PATH_79");
	
	TA_Stand_Dementor	(18,00,19,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(19,00,20,00,"NW_FOREST_PATH_79");
	TA_Stand_Dementor	(20,00,21,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(21,00,22,00,"NW_FOREST_PATH_79");
	
	TA_Stand_Dementor	(22,00,23,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(23,00,00,00,"NW_FOREST_PATH_79");
	TA_Stand_Dementor	(00,00,01,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(01,00,02,00,"NW_FOREST_PATH_79");
	
	TA_Stand_Dementor	(02,00,03,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(03,00,04,00,"NW_FOREST_PATH_79");
	TA_Stand_Dementor	(04,00,05,00,"NW_CITY_TO_FARM2_05");
	TA_Stand_Dementor	(05,00,06,00,"NW_FOREST_PATH_79");
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Story  DementorAmbients
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// *******************************************************
// DMT_DementorSpeakerVino
// *******************************************************

instance DMT_DementorSpeakerVino1 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	id 			= 1232;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorSpeakerVino2 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	id 			= 1233;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorSpeakerVino3 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	id 			= 1234;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorSpeakerVino4 (Default_AmbientDementor) //Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	id 			= 1235;
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};


// *******************************************************
// DMT_DementorAmbientSekob
// *******************************************************

instance DMT_DementorAmbientSekob1 (Default_AmbientDementor)	//Joly: greift auf Sicht an (alle NSCs), VORSICHT, nur bedacht in bewohnte Gebiete setzten.
{
	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientSekob2 (Default_AmbientDementor)	//Joly: greift auf Sicht an (alle NSCs), VORSICHT, nur bedacht in bewohnte Gebiete setzten.
{
	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientSekob3 (Default_AmbientDementor)	//Joly: greift auf Sicht an (alle NSCs), VORSICHT, nur bedacht in bewohnte Gebiete setzten.
{
	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};

instance DMT_DementorAmbientSekob4 (Default_AmbientDementor)	//Joly: greift auf Sicht an (alle NSCs), VORSICHT, nur bedacht in bewohnte Gebiete setzten.
{
	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};

// *******************************************************
// CastlemineDMT
// *******************************************************

instance CastlemineDMT (Default_AmbientDementor)	//Joly: spricht den SC mit seiner Important an und greift ihn dann an!!!!!
{
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};

//**************************************************************
//	KeyMaster	Dragonisland
//**************************************************************

INSTANCE DragonIsle_Keymaster	(Default_AmbientDementor)
{
	name		=	"Schlüsselmeister";
	id 			= 	1236;

	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;

	CreateInvItem	(self,ItKe_EVT_UNDEAD_02);	//der Schlüssel ist wichtig für die Türen zu den Zuggittern

	// ------ TA anmelden ------
	start_aistate = ZS_Stand_Dementor;
};
//**************************************************************
//	Akademie	Dragonisland
//**************************************************************

instance DMT_DementorAmbientWalker_DI_01 (Default_AmbientDementor) 
{
	// ------ NSC ------
	id 			= 1237;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1237;
};

FUNC VOID Rtn_Start_1237 ()
{	
	TA_Stand_Dementor	(06,00,06,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(06,10,06,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(06,20,06,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(06,30,06,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(06,40,06,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(06,50,07,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(07,00,07,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(07,10,07,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(07,20,07,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(07,30,07,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(07,40,07,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(07,50,08,00,"DI_UNDEADDRAGONTEMPEL_03");
	
	TA_Stand_Dementor	(08,00,08,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(08,10,08,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(08,20,08,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(08,30,08,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(08,40,08,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(08,50,09,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(09,00,09,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(09,10,09,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(09,20,09,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(09,30,09,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(09,40,09,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(09,50,10,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(10,00,10,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(10,10,10,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(10,20,10,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(10,30,10,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(10,40,10,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(10,50,11,00,"DI_UNDEADDRAGONTEMPEL_03");    
          
	TA_Stand_Dementor	(11,00,11,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(11,10,11,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(11,20,11,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(11,30,11,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(11,40,11,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(11,50,12,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(12,00,12,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(12,10,12,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(12,20,12,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(12,30,12,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(12,40,12,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(12,50,13,00,"DI_UNDEADDRAGONTEMPEL_03");
          
	TA_Stand_Dementor	(13,00,13,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(13,10,13,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(13,20,13,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(13,30,13,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(13,40,13,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(13,50,14,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(14,00,14,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(14,10,14,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(14,20,14,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(14,30,14,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(14,40,14,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(14,50,15,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(15,00,15,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(15,10,15,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(15,20,15,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(15,30,15,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(15,40,15,50,"DI_UNDEADDRAGONTEMPEL_08");
 	TA_Stand_Dementor	(15,50,16,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(16,00,16,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(16,10,16,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(16,20,16,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(16,30,16,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(16,40,16,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(16,50,17,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(17,00,17,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(17,10,17,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(17,20,17,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(17,30,17,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(17,40,17,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(17,50,18,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(18,00,18,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(18,10,18,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(18,20,18,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(18,30,18,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(18,40,18,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(18,50,19,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(19,00,19,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(19,10,19,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(19,20,19,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(19,30,19,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(19,40,19,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(19,50,20,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(20,00,20,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(20,10,20,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(20,20,20,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(20,30,20,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(20,40,20,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(20,50,21,00,"DI_UNDEADDRAGONTEMPEL_03");
	
	TA_Stand_Dementor	(21,00,21,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(21,10,21,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(21,20,21,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(21,30,21,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(21,40,21,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(21,50,22,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(22,00,22,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(22,10,22,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(22,20,22,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(22,30,22,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(22,40,22,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(22,50,23,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(23,00,23,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(23,10,23,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(23,20,23,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(23,30,23,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(23,40,23,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(23,50,00,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(00,00,00,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(00,10,00,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(00,20,00,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(00,30,00,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(00,40,00,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(00,50,01,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(01,00,01,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(01,10,01,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(01,20,01,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(01,30,01,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(01,40,01,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(01,50,02,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(02,00,02,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(02,10,02,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(02,20,02,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(02,30,02,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(02,40,02,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(02,50,03,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(03,00,03,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(03,10,03,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(03,20,03,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(03,30,03,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(03,40,03,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(03,50,04,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(04,00,04,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(04,10,04,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(04,20,04,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(04,30,04,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(04,40,04,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(04,50,05,00,"DI_UNDEADDRAGONTEMPEL_03");

	TA_Stand_Dementor	(05,00,05,10,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(05,10,05,20,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(05,20,05,30,"DI_UNDEADDRAGONTEMPEL_06");
	TA_Stand_Dementor	(05,30,05,40,"DI_UNDEADDRAGONTEMPEL_03");
	TA_Stand_Dementor	(05,40,05,50,"DI_UNDEADDRAGONTEMPEL_08");
	TA_Stand_Dementor	(05,50,06,00,"DI_UNDEADDRAGONTEMPEL_03");

};

instance DMT_DementorAmbientWalker_DI_02 (Default_AmbientDementor)
{
	// ------ NSC ------
	id 			= 1238;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1238;
};

FUNC VOID Rtn_Start_1238 ()
{	
	TA_Stand_Dementor	(06,00,06,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(06,10,06,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(06,20,06,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(06,30,06,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(06,40,06,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(06,50,07,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(07,00,07,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(07,10,07,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(07,20,07,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(07,30,07,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(07,40,07,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(07,50,08,00,"DI_UNDEADDRAGONTEMPEL_02");
	
	TA_Stand_Dementor	(08,00,08,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(08,10,08,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(08,20,08,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(08,30,08,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(08,40,08,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(08,50,09,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(09,00,09,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(09,10,09,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(09,20,09,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(09,30,09,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(09,40,09,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(09,50,10,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(10,00,10,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(10,10,10,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(10,20,10,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(10,30,10,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(10,40,10,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(10,50,11,00,"DI_UNDEADDRAGONTEMPEL_02");    
          
	TA_Stand_Dementor	(11,00,11,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(11,10,11,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(11,20,11,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(11,30,11,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(11,40,11,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(11,50,12,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(12,00,12,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(12,10,12,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(12,20,12,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(12,30,12,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(12,40,12,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(12,50,13,00,"DI_UNDEADDRAGONTEMPEL_02");
          
	TA_Stand_Dementor	(13,00,13,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(13,10,13,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(13,20,13,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(13,30,13,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(13,40,13,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(13,50,14,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(14,00,14,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(14,10,14,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(14,20,14,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(14,30,14,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(14,40,14,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(14,50,15,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(15,00,15,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(15,10,15,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(15,20,15,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(15,30,15,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(15,40,15,50,"DI_UNDEADDRAGONTEMPEL_12");
 	TA_Stand_Dementor	(15,50,16,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(16,00,16,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(16,10,16,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(16,20,16,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(16,30,16,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(16,40,16,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(16,50,17,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(17,00,17,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(17,10,17,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(17,20,17,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(17,30,17,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(17,40,17,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(17,50,18,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(18,00,18,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(18,10,18,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(18,20,18,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(18,30,18,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(18,40,18,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(18,50,19,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(19,00,19,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(19,10,19,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(19,20,19,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(19,30,19,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(19,40,19,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(19,50,20,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(20,00,20,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(20,10,20,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(20,20,20,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(20,30,20,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(20,40,20,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(20,50,21,00,"DI_UNDEADDRAGONTEMPEL_02");
	
	TA_Stand_Dementor	(21,00,21,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(21,10,21,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(21,20,21,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(21,30,21,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(21,40,21,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(21,50,22,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(22,00,22,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(22,10,22,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(22,20,22,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(22,30,22,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(22,40,22,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(22,50,23,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(23,00,23,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(23,10,23,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(23,20,23,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(23,30,23,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(23,40,23,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(23,50,00,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(00,00,00,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(00,10,00,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(00,20,00,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(00,30,00,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(00,40,00,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(00,50,01,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(01,00,01,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(01,10,01,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(01,20,01,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(01,30,01,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(01,40,01,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(01,50,02,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(02,00,02,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(02,10,02,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(02,20,02,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(02,30,02,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(02,40,02,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(02,50,03,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(03,00,03,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(03,10,03,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(03,20,03,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(03,30,03,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(03,40,03,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(03,50,04,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(04,00,04,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(04,10,04,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(04,20,04,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(04,30,04,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(04,40,04,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(04,50,05,00,"DI_UNDEADDRAGONTEMPEL_02");

	TA_Stand_Dementor	(05,00,05,10,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(05,10,05,20,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(05,20,05,30,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(05,30,05,40,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(05,40,05,50,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(05,50,06,00,"DI_UNDEADDRAGONTEMPEL_02");
};

instance DMT_DementorAmbientWalker_DI_03 (Default_AmbientDementor) 
{
	// ------ NSC ------
	id 			= 1239;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1239;
};

FUNC VOID Rtn_Start_1239 ()
{	
	TA_Stand_Dementor	(06,00,06,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(06,10,06,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(06,20,06,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(06,30,06,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(06,40,06,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(06,50,07,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(07,00,07,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(07,10,07,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(07,20,07,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(07,30,07,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(07,40,07,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(07,50,08,00,"DI_UNDEADDRAGONTEMPEL_12");
	
	TA_Stand_Dementor	(08,00,08,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(08,10,08,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(08,20,08,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(08,30,08,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(08,40,08,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(08,50,09,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(09,00,09,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(09,10,09,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(09,20,09,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(09,30,09,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(09,40,09,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(09,50,10,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(10,00,10,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(10,10,10,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(10,20,10,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(10,30,10,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(10,40,10,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(10,50,11,00,"DI_UNDEADDRAGONTEMPEL_12");    
          
	TA_Stand_Dementor	(11,00,11,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(11,10,11,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(11,20,11,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(11,30,11,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(11,40,11,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(11,50,12,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(12,00,12,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(12,10,12,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(12,20,12,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(12,30,12,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(12,40,12,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(12,50,13,00,"DI_UNDEADDRAGONTEMPEL_12");
          
	TA_Stand_Dementor	(13,00,13,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(13,10,13,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(13,20,13,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(13,30,13,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(13,40,13,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(13,50,14,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(14,00,14,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(14,10,14,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(14,20,14,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(14,30,14,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(14,40,14,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(14,50,15,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(15,00,15,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(15,10,15,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(15,20,15,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(15,30,15,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(15,40,15,50,"DI_UNDEADDRAGONTEMPEL_10");
 	TA_Stand_Dementor	(15,50,16,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(16,00,16,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(16,10,16,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(16,20,16,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(16,30,16,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(16,40,16,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(16,50,17,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(17,00,17,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(17,10,17,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(17,20,17,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(17,30,17,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(17,40,17,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(17,50,18,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(18,00,18,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(18,10,18,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(18,20,18,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(18,30,18,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(18,40,18,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(18,50,19,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(19,00,19,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(19,10,19,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(19,20,19,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(19,30,19,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(19,40,19,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(19,50,20,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(20,00,20,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(20,10,20,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(20,20,20,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(20,30,20,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(20,40,20,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(20,50,21,00,"DI_UNDEADDRAGONTEMPEL_12");
	
	TA_Stand_Dementor	(21,00,21,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(21,10,21,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(21,20,21,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(21,30,21,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(21,40,21,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(21,50,22,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(22,00,22,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(22,10,22,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(22,20,22,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(22,30,22,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(22,40,22,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(22,50,23,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(23,00,23,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(23,10,23,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(23,20,23,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(23,30,23,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(23,40,23,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(23,50,00,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(00,00,00,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(00,10,00,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(00,20,00,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(00,30,00,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(00,40,00,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(00,50,01,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(01,00,01,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(01,10,01,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(01,20,01,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(01,30,01,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(01,40,01,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(01,50,02,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(02,00,02,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(02,10,02,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(02,20,02,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(02,30,02,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(02,40,02,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(02,50,03,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(03,00,03,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(03,10,03,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(03,20,03,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(03,30,03,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(03,40,03,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(03,50,04,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(04,00,04,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(04,10,04,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(04,20,04,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(04,30,04,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(04,40,04,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(04,50,05,00,"DI_UNDEADDRAGONTEMPEL_12");

	TA_Stand_Dementor	(05,00,05,10,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(05,10,05,20,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(05,20,05,30,"DI_UNDEADDRAGONTEMPEL_07");
	TA_Stand_Dementor	(05,30,05,40,"DI_UNDEADDRAGONTEMPEL_12");
	TA_Stand_Dementor	(05,40,05,50,"DI_UNDEADDRAGONTEMPEL_10");
	TA_Stand_Dementor	(05,50,06,00,"DI_UNDEADDRAGONTEMPEL_12");
};

instance DMT_DementorAmbientWalker_DI_04 (Default_AmbientDementor)
{
	// ------ NSC ------
	id 			= 1240;
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1240;
};

FUNC VOID Rtn_Start_1240 ()
{	
	TA_Stand_Dementor	(06,05,06,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(06,15,06,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(06,25,06,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(06,35,06,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(06,45,06,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(06,55,07,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(07,05,07,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(07,15,07,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(07,25,07,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(07,35,07,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(07,45,07,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(07,55,08,05,"DI_UNDEADDRAGONTEMPEL_01");
	
	TA_Stand_Dementor	(08,05,08,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(08,15,08,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(08,25,08,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(08,35,08,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(08,45,08,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(08,55,09,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(09,05,09,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(09,15,09,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(09,25,09,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(09,35,09,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(09,45,09,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(09,55,10,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(10,05,10,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(10,15,10,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(10,25,10,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(10,35,10,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(10,45,10,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(10,55,11,05,"DI_UNDEADDRAGONTEMPEL_01");    
          
	TA_Stand_Dementor	(11,05,11,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(11,15,11,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(11,25,11,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(11,35,11,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(11,45,11,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(11,55,12,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(12,05,12,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(12,15,12,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(12,25,12,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(12,35,12,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(12,45,12,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(12,55,13,05,"DI_UNDEADDRAGONTEMPEL_01");
          
	TA_Stand_Dementor	(13,05,13,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(13,15,13,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(13,25,13,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(13,35,13,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(13,45,13,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(13,55,14,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(14,05,14,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(14,15,14,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(14,25,14,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(14,35,14,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(14,45,14,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(14,55,15,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(15,05,15,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(15,15,15,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(15,25,15,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(15,35,15,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(15,45,15,55,"DI_UNDEADDRAGONTEMPEL_02");
 	TA_Stand_Dementor	(15,55,16,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(16,05,16,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(16,15,16,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(16,25,16,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(16,35,16,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(16,45,16,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(16,55,17,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(17,05,17,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(17,15,17,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(17,25,17,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(17,35,17,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(17,45,17,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(17,55,18,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(18,05,18,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(18,15,18,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(18,25,18,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(18,35,18,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(18,45,18,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(18,55,19,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(19,05,19,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(19,15,19,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(19,25,19,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(19,35,19,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(19,45,19,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(19,55,20,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(20,05,20,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(20,15,20,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(20,25,20,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(20,35,20,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(20,45,20,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(20,55,21,05,"DI_UNDEADDRAGONTEMPEL_01");
	
	TA_Stand_Dementor	(21,05,21,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(21,15,21,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(21,25,21,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(21,35,21,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(21,45,21,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(21,55,22,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(22,05,22,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(22,15,22,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(22,25,22,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(22,35,22,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(22,45,22,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(22,55,23,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(23,05,23,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(23,15,23,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(23,25,23,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(23,35,23,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(23,45,23,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(23,55,00,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(00,05,00,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(00,15,00,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(00,25,00,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(00,35,00,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(00,45,00,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(00,55,01,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(01,05,01,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(01,15,01,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(01,25,01,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(01,35,01,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(01,45,01,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(01,55,02,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(02,05,02,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(02,15,02,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(02,25,02,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(02,35,02,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(02,45,02,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(02,55,03,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(03,05,03,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(03,15,03,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(03,25,03,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(03,35,03,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(03,45,03,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(03,55,04,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(04,05,04,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(04,15,04,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(04,25,04,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(04,35,04,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(04,45,04,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(04,55,05,05,"DI_UNDEADDRAGONTEMPEL_01");

	TA_Stand_Dementor	(05,05,05,15,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(05,15,05,25,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(05,25,05,35,"DI_UNDEADDRAGONTEMPEL_09");
	TA_Stand_Dementor	(05,35,05,45,"DI_UNDEADDRAGONTEMPEL_01");
	TA_Stand_Dementor	(05,45,05,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(05,55,06,05,"DI_UNDEADDRAGONTEMPEL_01");
};

instance DMT_DementorAmbientWalker_DI_05 (Default_AmbientDementor)
{
	// ------ NSC ------
	id 			= 1242;
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1242;
};

FUNC VOID Rtn_Start_1242 ()
{	
	TA_Stand_Dementor	(06,05,06,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(06,15,06,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(06,25,06,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(06,35,06,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(06,45,06,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(06,55,07,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(07,05,07,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(07,15,07,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(07,25,07,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(07,35,07,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(07,45,07,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(07,55,08,05,"DI_UNDEADDRAGONTEMPEL_11");
	
	TA_Stand_Dementor	(08,05,08,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(08,15,08,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(08,25,08,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(08,35,08,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(08,45,08,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(08,55,09,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(09,05,09,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(09,15,09,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(09,25,09,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(09,35,09,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(09,45,09,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(09,55,10,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(10,05,10,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(10,15,10,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(10,25,10,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(10,35,10,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(10,45,10,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(10,55,11,05,"DI_UNDEADDRAGONTEMPEL_11");    
          
	TA_Stand_Dementor	(11,05,11,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(11,15,11,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(11,25,11,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(11,35,11,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(11,45,11,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(11,55,12,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(12,05,12,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(12,15,12,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(12,25,12,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(12,35,12,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(12,45,12,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(12,55,13,05,"DI_UNDEADDRAGONTEMPEL_11");
          
	TA_Stand_Dementor	(13,05,13,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(13,15,13,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(13,25,13,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(13,35,13,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(13,45,13,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(13,55,14,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(14,05,14,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(14,15,14,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(14,25,14,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(14,35,14,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(14,45,14,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(14,55,15,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(15,05,15,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(15,15,15,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(15,25,15,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(15,35,15,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(15,45,15,55,"DI_UNDEADDRAGONTEMPEL_02");
 	TA_Stand_Dementor	(15,55,16,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(16,05,16,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(16,15,16,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(16,25,16,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(16,35,16,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(16,45,16,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(16,55,17,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(17,05,17,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(17,15,17,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(17,25,17,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(17,35,17,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(17,45,17,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(17,55,18,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(18,05,18,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(18,15,18,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(18,25,18,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(18,35,18,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(18,45,18,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(18,55,19,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(19,05,19,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(19,15,19,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(19,25,19,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(19,35,19,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(19,45,19,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(19,55,20,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(20,05,20,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(20,15,20,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(20,25,20,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(20,35,20,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(20,45,20,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(20,55,21,05,"DI_UNDEADDRAGONTEMPEL_11");
	
	TA_Stand_Dementor	(21,05,21,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(21,15,21,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(21,25,21,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(21,35,21,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(21,45,21,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(21,55,22,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(22,05,22,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(22,15,22,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(22,25,22,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(22,35,22,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(22,45,22,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(22,55,23,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(23,05,23,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(23,15,23,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(23,25,23,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(23,35,23,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(23,45,23,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(23,55,00,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(00,05,00,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(00,15,00,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(00,25,00,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(00,35,00,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(00,45,00,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(00,55,01,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(01,05,01,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(01,15,01,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(01,25,01,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(01,35,01,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(01,45,01,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(01,55,02,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(02,05,02,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(02,15,02,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(02,25,02,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(02,35,02,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(02,45,02,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(02,55,03,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(03,05,03,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(03,15,03,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(03,25,03,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(03,35,03,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(03,45,03,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(03,55,04,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(04,05,04,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(04,15,04,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(04,25,04,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(04,35,04,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(04,45,04,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(04,55,05,05,"DI_UNDEADDRAGONTEMPEL_11");

	TA_Stand_Dementor	(05,05,05,15,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(05,15,05,25,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(05,25,05,35,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(05,35,05,45,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(05,45,05,55,"DI_UNDEADDRAGONTEMPEL_02");
	TA_Stand_Dementor	(05,55,06,05,"DI_UNDEADDRAGONTEMPEL_11");
};

instance DMT_DementorAmbientWalker_DI_06 (Default_AmbientDementor)
{
	// ------ NSC ------
	id 			= 1243;
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1243;
};

FUNC VOID Rtn_Start_1243 ()
{	
	TA_Stand_Dementor	(06,05,06,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(06,15,06,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(06,25,06,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(06,35,06,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(06,45,06,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(06,55,07,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(07,05,07,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(07,15,07,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(07,25,07,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(07,35,07,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(07,45,07,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(07,55,08,05,"DI_UNDEADDRAGONTEMPEL_05");
	
	TA_Stand_Dementor	(08,05,08,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(08,15,08,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(08,25,08,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(08,35,08,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(08,45,08,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(08,55,09,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(09,05,09,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(09,15,09,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(09,25,09,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(09,35,09,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(09,45,09,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(09,55,10,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(10,05,10,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(10,15,10,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(10,25,10,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(10,35,10,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(10,45,10,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(10,55,11,05,"DI_UNDEADDRAGONTEMPEL_05");    
          
	TA_Stand_Dementor	(11,05,11,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(11,15,11,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(11,25,11,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(11,35,11,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(11,45,11,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(11,55,12,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(12,05,12,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(12,15,12,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(12,25,12,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(12,35,12,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(12,45,12,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(12,55,13,05,"DI_UNDEADDRAGONTEMPEL_05");
          
	TA_Stand_Dementor	(13,05,13,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(13,15,13,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(13,25,13,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(13,35,13,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(13,45,13,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(13,55,14,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(14,05,14,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(14,15,14,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(14,25,14,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(14,35,14,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(14,45,14,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(14,55,15,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(15,05,15,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(15,15,15,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(15,25,15,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(15,35,15,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(15,45,15,55,"DI_UNDEADDRAGONTEMPEL_11");
 	TA_Stand_Dementor	(15,55,16,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(16,05,16,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(16,15,16,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(16,25,16,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(16,35,16,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(16,45,16,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(16,55,17,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(17,05,17,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(17,15,17,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(17,25,17,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(17,35,17,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(17,45,17,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(17,55,18,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(18,05,18,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(18,15,18,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(18,25,18,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(18,35,18,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(18,45,18,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(18,55,19,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(19,05,19,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(19,15,19,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(19,25,19,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(19,35,19,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(19,45,19,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(19,55,20,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(20,05,20,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(20,15,20,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(20,25,20,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(20,35,20,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(20,45,20,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(20,55,21,05,"DI_UNDEADDRAGONTEMPEL_05");
	
	TA_Stand_Dementor	(21,05,21,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(21,15,21,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(21,25,21,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(21,35,21,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(21,45,21,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(21,55,22,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(22,05,22,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(22,15,22,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(22,25,22,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(22,35,22,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(22,45,22,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(22,55,23,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(23,05,23,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(23,15,23,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(23,25,23,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(23,35,23,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(23,45,23,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(23,55,00,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(00,05,00,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(00,15,00,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(00,25,00,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(00,35,00,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(00,45,00,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(00,55,01,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(01,05,01,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(01,15,01,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(01,25,01,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(01,35,01,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(01,45,01,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(01,55,02,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(02,05,02,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(02,15,02,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(02,25,02,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(02,35,02,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(02,45,02,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(02,55,03,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(03,05,03,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(03,15,03,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(03,25,03,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(03,35,03,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(03,45,03,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(03,55,04,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(04,05,04,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(04,15,04,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(04,25,04,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(04,35,04,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(04,45,04,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(04,55,05,05,"DI_UNDEADDRAGONTEMPEL_05");

	TA_Stand_Dementor	(05,05,05,15,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(05,15,05,25,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(05,25,05,35,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(05,35,05,45,"DI_UNDEADDRAGONTEMPEL_05");
	TA_Stand_Dementor	(05,45,05,55,"DI_UNDEADDRAGONTEMPEL_11");
	TA_Stand_Dementor	(05,55,06,05,"DI_UNDEADDRAGONTEMPEL_05");
};
