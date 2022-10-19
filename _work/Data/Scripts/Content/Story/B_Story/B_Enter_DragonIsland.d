
//###############################################
//##
//##	Die Dracheninsel
//##
//###############################################
FUNC VOID STARTUP_NEWWORLD_PART_DRAGON_ISLAND_01 ()
{
	//-- Grotte -------------------------------------------
	
	Wld_InsertNpc 	(Firewaran, 	"FP_ROAM_DI_WARAN_01");	
	Wld_InsertNpc 	(Firewaran, 	"FP_ROAM_DI_WARAN_02");	
	Wld_InsertNpc 	(Firewaran, 	"FP_ROAM_DI_WARAN_03");	

	//----- Die Orks -----

	Wld_InsertNpc 	(Troll_DI, 	"DI_ORKAREA_TROLL");		
	Wld_InsertItem	(ItMi_DarkPearl , "FP_ITEM_DI_ENTER_03"); //Joly: Zutat für ItPo_MegaDrink
	Wld_InsertItem	(ItMi_Sulfur 	, "FP_ITEM_DI_ENTER_07"); //Joly: Zutat für ItPo_MegaDrink
	Wld_InsertItem	(ItWr_ZugBruecke_MIS, "FP_ITEM_DI_ENTER_09"); //Joly: Hinweis, die ZugbrückenProblematik zu lösen.

	Wld_InsertNpc 	(OrcWarrior_Rest, 	"FP_ROAM_DI_ORK_01");	
	Wld_InsertNpc 	(OrcWarrior_Rest, 	"FP_ROAM_DI_ORK_02");	
	Wld_InsertNpc 	(Warg, 	"FP_ROAM_DI_ORK_03");	
	Wld_InsertNpc 	(OrcElite_Rest, 	"FP_ROAM_DI_ORK_04");	
	Wld_InsertNpc 	(OrcShaman_Sit, 	"FP_ROAM_DI_ORK_05");	
	Wld_InsertNpc 	(Warg, 	"FP_ROAM_DI_ORK_06");	
	Wld_InsertNpc 	(OrcWarrior_Rest, 	"FP_ROAM_DI_ORK_07");	
	Wld_InsertNpc 	(OrcElite_Rest , 	"FP_ROAM_DI_ORK_08");	
	Wld_InsertNpc 	(OrcWarrior_Rest, 	"FP_ROAM_DI_ORK_09");	
	Wld_InsertNpc 	(Warg, 	"FP_ROAM_DI_ORK_11");	
	Wld_InsertNpc 	(OrcElite_Rest, 	"FP_ROAM_DI_ORK_14");	
	Wld_InsertNpc 	(OrcShaman_Sit, 	"FP_ROAM_DI_ORK_15");	
	Wld_InsertNpc 	(OrcElite_Rest, 	"FP_ROAM_DI_ORK_16");	
	Wld_InsertNpc 	(Warg, 	"FP_ROAM_DI_ORK_17");	
	Wld_InsertNpc 	(Warg, 	"FP_ROAM_DI_ORK_18");	
	Wld_InsertNpc 	(OrcWarrior_Rest, 	"FP_ROAM_DI_ORK_19");	
	Wld_InsertNpc 	(OrcShaman_Sit, 	"FP_ROAM_DI_ORK_20");	
	Wld_InsertNpc 	(OrcElite_Rest, 	"FP_ROAM_DI_ORK_21");	
	Wld_InsertNpc 	(OrcElite_Rest, 	"FP_ROAM_DI_ORK_22");	
	Wld_InsertNpc 	(OrcElite_Rest, 	"FP_ROAM_DI_ORK_23");	

	Wld_InsertNpc 	(OrcWarrior_Roam, 	"FP_ROAM_DI_ORK_28");	
	Wld_InsertNpc 	(OrcElite_Roam, 	"FP_ROAM_DI_ORK_29");	
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"FP_ROAM_DI_ORK_30");	
	Wld_InsertNpc 	(OrcElite_Roam, 	"FP_ROAM_DI_ORK_33");	
	Wld_InsertNpc 	(OrcElite_Roam, 	"FP_ROAM_DI_ORK_34");	
	Wld_InsertNpc 	(OrcWarrior_Roam, 	"FP_ROAM_DI_ORK_35");	
	
	Wld_InsertNpc 	(Warg, 	"FP_ROAM_DI_ORK_12");	
	Wld_InsertNpc 	(OrcShaman_Sit, 	"FP_ROAM_DI_ORK_13");	
	Wld_InsertNpc 	(OrkElite_AntiPaladinOrkOberst_DI, 	"DI_ORKOBERST");	
	Wld_InsertNpc 	(OrcElite_DIOberst1_Rest, 	"FP_ROAM_DI_ORK_24");	
	Wld_InsertNpc 	(OrcElite_DIOberst2_Rest, 	"FP_ROAM_DI_ORK_26");	
	Wld_InsertNpc 	(OrcElite_DIOberst3_Rest, 	"FP_ROAM_DI_ORK_27");	

	Wld_InsertNpc 	(DMT_DementorAmbientSpeaker, 	"DI_ORKAREA_24");		
	Wld_InsertNpc 	(DMT_DementorAmbientSpeaker, 	"DI_DRACONIANAREA_22");		
	Wld_InsertNpc 	(DMT_DementorAmbientSpeaker, 	"DI_DRACONIANAREA_08");		
	//----- Die Draconier -----
	Wld_InsertNpc 	(Dragon_Fire_Island, 	"DI_DRACONIANAREA_FIREDRAGON");	

	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_01");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_02");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_03");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_04");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_05");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_06");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_07");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_08");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_09");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_10");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_11");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_12");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_13");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_14");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_15");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_16");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_17");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_18");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_19");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_20");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_21");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_22");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_23");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_24");		
	Wld_InsertNpc 	(Draconian, 	"FP_ROAM_DI_DRACONIAN_25");		
};
FUNC VOID INIT_NEWWORLD_PART_DRAGON_ISLAND_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
};

FUNC VOID STARTUP_NEWWORLD_PART_DRAGON_UNDEAD_01 ()
{
	//----- Der Schwarzmagiernovize -----
	Wld_InsertItem	(ItWr_Rezept_MegaDrink_MIS 	, "FP_ITEM_DI_BLACKNOV_01"); 
	Wld_InsertItem	(ItWr_Diary_BlackNovice_MIS	, "FP_ITEM_DI_BLACKNOV_02"); 

	//----- Die Untoten -----
	Wld_InsertNpc 	(Skeleton_Lord_Archol, 	"DI_ARCHOL");	
	Wld_InsertNpc 	(Skeleton_Archol1, 	"DI_ARCHOL_SKELETON_01");	
	Wld_InsertNpc 	(Skeleton_Archol2, 	"DI_ARCHOL_SKELETON_02");	
	Wld_InsertNpc 	(Skeleton_Archol3, 	"DI_ARCHOL_SKELETON_03");	
	Wld_InsertNpc 	(Skeleton_Archol4, 	"DI_ARCHOL_SKELETON_04");	
	Wld_InsertNpc 	(Skeleton_Archol5, 	"DI_ARCHOL_SKELETON_05");	
	Wld_InsertNpc 	(Skeleton_Archol6, 	"DI_ARCHOL_SKELETON_06");	
	
	Wld_InsertNpc	(DMT_DementorAmbient,	"DI_DRACONIANAREA_53");
	Wld_InsertNpc	(DMT_DementorAmbient,	"DI_DRACONIANAREA_52");
	Wld_InsertNpc	(Lesser_Skeleton,		"DI_DRACONIANAREA_55");
	Wld_InsertNpc	(Lesser_Skeleton,		"DI_DRACONIANAREA_55");
	Wld_InsertNpc	(Skeleton,				"DI_DRACONIANAREA_56");
	Wld_InsertNpc	(Lesser_Skeleton,		"DI_DRACONIANAREA_56");
	Wld_InsertNpc	(Skeleton,				"DI_DRACONIANAREA_51");
	Wld_InsertNpc	(Lesser_Skeleton,		"DI_DRACONIANAREA_51");
	Wld_InsertNpc	(Skeleton,				"DI_DRACONIANAREA_51");

	//Marios Gruselkabinett
	
	Wld_InsertNpc	(Shadowbeast_Skeleton,	"WP_UNDEAD_SPAWN_POINT_01");

	//Supernova
	Wld_InsertNpc	(Skeleton_Lord,	"WP_UNDEAD_LEFT_DOWN_06");

	Wld_InsertNpc	(OrcElite_Rest,			"WP_UNDEAD_SPAWN_POINT_02");
	Wld_InsertNpc	(OrcElite_Rest,			"WP_UNDEAD_SPAWN_POINT_03");
	Wld_InsertNpc	(OrcShaman_Sit,			"WP_UNDEAD_SPAWN_POINT_04");
	
	Wld_InsertNpc	(Zombie01,				"WP_UNDEAD_SPAWN_POINT_05");
	Wld_InsertNpc	(Zombie02,				"WP_UNDEAD_SPAWN_POINT_06");
	Wld_InsertNpc	(Zombie03,				"WP_UNDEAD_SPAWN_POINT_07");
	Wld_InsertNpc	(Zombie04,				"WP_UNDEAD_SPAWN_POINT_08");
	
	Wld_InsertNpc	(Skeleton,				"DRAGONISLAND_UNDEAD_04_01");
	Wld_InsertNpc	(Skeleton,				"DRAGONISLAND_UNDEAD_04_02");
	
	Wld_InsertNpc	(Skeleton,				"DRAGONISLAND_UNDEAD_08_01");
	Wld_InsertNpc	(Skeleton_Lord,			"DRAGONISLAND_UNDEAD_08_02");
	Wld_InsertNpc	(Skeleton_Lord,			"DRAGONISLAND_UNDEAD_08_03");
	Wld_InsertNpc	(Skeleton,				"DRAGONISLAND_UNDEAD_08_04");
};

FUNC VOID INIT_NEWWORLD_PART_DRAGON_UNDEAD_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
};

FUNC VOID STARTUP_NEWWORLD_PART_DRAGON_FINAL_01 ()
{
	//----- Die Schwarzmagierakademie -----

	Wld_InsertNpc	(DMT_DementorAmbientWalker_DI_01,				"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc	(DMT_DementorAmbientWalker_DI_02,				"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc	(DMT_DementorAmbientWalker_DI_03,				"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc	(DMT_DementorAmbientWalker_DI_04,				"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc	(DMT_DementorAmbientWalker_DI_05,				"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc	(DMT_DementorAmbientWalker_DI_06,				"DI_UNDEADDRAGONTEMPEL_01");
	Wld_InsertNpc	(DMT_DementorAmbient,				"DI_UNDEADDRAGONTEMPEL_20");
	Wld_InsertNpc	(DMT_DementorAmbient,				"DI_UNDEADDRAGONTEMPEL_23");

	Wld_InsertNpc	(DMT_1299_OberDementor_DI,		"DI_SCHWARZMAGIER");
	
	Wld_InsertNpc 	(Dragon_Undead, 	"DI_UNDEADDRAGON");	

	// Dragon_Undead Trap UndeadOrks
	Wld_InsertNpc	(UndeadOrcWarrior,	"DI_UNDEADDRAGON_TRAP_01");
	Wld_InsertNpc	(UndeadOrcWarrior,	"DI_UNDEADDRAGON_TRAP_02");
	Wld_InsertNpc	(UndeadOrcWarrior,	"DI_UNDEADDRAGON_TRAP_03");
};

FUNC VOID INIT_NEWWORLD_PART_DRAGON_FINAL_01 ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
};

// ------ DRAGONISLAND -------
FUNC VOID STARTUP_DRAGONISLAND ()
{
		/*	JorgenIsCaptain = TRUE;
	TorlofIsCaptain = TRUE;
	JackIsCaptain = TRUE;

	Lee_IsOnBoard = LOG_SUCCESS;
	MiltenNW_IsOnBoard = LOG_SUCCESS;			//Ist Milten an Bord?
	Lester_IsOnBoard = LOG_SUCCESS;				//Ist Lester an Bord?
	Mario_IsOnBoard = LOG_SUCCESS;				//Ist Mario an Bord?
	Wolf_IsOnBoard = LOG_SUCCESS;				//Ist Wolf an Bord?
	Lares_IsOnBoard = LOG_SUCCESS;				//Ist Lares an Bord?
	Diego_IsOnBoard = LOG_SUCCESS;				//Ist Diego an Bord?
	Bennet_IsOnBoard = LOG_SUCCESS;				//Ist Bennet an Bord?
	Vatras_IsOnBoard = LOG_SUCCESS;				//Ist Vatras an Bord?
	Gorn_IsOnBoard = LOG_SUCCESS;				//Ist Gorn an Bord?	
	Biff_IsOnBoard = LOG_SUCCESS;
	Angar_IsOnBoard = LOG_SUCCESS;
	Girion_IsOnBoard = LOG_SUCCESS;		*/	
	
//----- Die Kapitäne -----
	
	if ( JorgenIsCaptain == TRUE)	//Jorgen
	{
		Wld_InsertNpc 	(VLK_4250_Jorgen_DI, 	"SHIP_DECK_01");
	};

	if ( TorlofIsCaptain == TRUE)	//Torlof
	{
		Wld_InsertNpc 	(SLD_801_Torlof_DI, 	"SHIP_DECK_01");
	};

	if ( JackIsCaptain == TRUE)		//Jack
	{
		Wld_InsertNpc 	(VLK_444_Jack_DI, 		"SHIP_DECK_01");
	};
	
//----- Die Crew -----
	
	if ( Lee_IsOnBoard == LOG_SUCCESS) //Lee
	{
		Wld_InsertNpc 	(SLD_800_Lee_DI, 		"SHIP_DECK_01");
	};

	if ( MiltenNW_IsOnBoard == LOG_SUCCESS) //Milten
	{
		Wld_InsertNpc 	(PC_Mage_DI, 			"SHIP_DECK_01");
		if ( Lester_IsOnBoard != LOG_SUCCESS) 
			{
				B_StartOtherRoutine	(PC_Mage_DI, "SittingShipDI");
			};
	};

	if ( Lester_IsOnBoard == LOG_SUCCESS)	//Lester
	{
		Wld_InsertNpc 	(PC_Psionic_DI, 		"SHIP_DECK_01");
		if ( MiltenNW_IsOnBoard != LOG_SUCCESS) 
			{
				B_StartOtherRoutine	(PC_Psionic_DI, "SittingShipDI");
			};
	};

	if ( Mario_IsOnBoard == LOG_SUCCESS) //Mario
	{
		Wld_InsertNpc 	(None_101_Mario_DI, 	"SHIP_DECK_01");
	};

	if ( Wolf_IsOnBoard== LOG_SUCCESS) //Wolf
	{
		Wld_InsertNpc 	(SLD_811_Wolf_DI, 		"SHIP_DECK_01");
	};


	if ( Vatras_IsOnBoard == LOG_SUCCESS)	//Vatras
	{
		Wld_InsertNpc 	(VLK_439_Vatras_DI, 	"SHIP_DECK_01");
	};	
	
	if ( Bennet_IsOnBoard == LOG_SUCCESS)	//Bennet
	{
		Wld_InsertNpc 	(SLD_809_Bennet_DI, 	"SHIP_DECK_01");
	};	

	if ( Diego_IsOnBoard == LOG_SUCCESS)	//Diego 
	{
		Wld_InsertNpc 	(PC_Thief_DI, 			"SHIP_DECK_01");
	
		if ( Lares_IsOnBoard != LOG_SUCCESS) 
			{
				B_StartOtherRoutine	(PC_Thief_DI, "SittingShipDI");
			};
	};

	if ( Gorn_IsOnBoard == LOG_SUCCESS)	//Gorn
	{
		Wld_InsertNpc 	(PC_Fighter_DI, 		"SHIP_DECK_01");
	};	

	if ( Lares_IsOnBoard == LOG_SUCCESS)	//Lares
	{
		Wld_InsertNpc 	(VLK_449_Lares_DI, 		"SHIP_DECK_01");

		if ( Diego_IsOnBoard != LOG_SUCCESS) 
			{
				B_StartOtherRoutine	(VLK_449_Lares_DI, "SittingShipDI");
			};
	};	

	if ( Biff_IsOnBoard == LOG_SUCCESS)	//Biff
	{
		Wld_InsertNpc 	(DJG_713_Biff_DI, 		"SHIP_DECK_01");
	};	

	if ( Angar_IsOnBoard == LOG_SUCCESS)	//Angar
	{
		Wld_InsertNpc 	(DJG_705_Angar_DI, 		"SHIP_DECK_01");
	};	

	if ( Girion_IsOnBoard == LOG_SUCCESS)	//Girion
	{
		Wld_InsertNpc 	(Pal_207_Girion_DI, 		"SHIP_DECK_01");
	};	

	Wld_InsertNpc 	(NOV_600_Pedro_DI, 		"SHIP_DECK_01");
	 
	Wld_InsertItem	(ItMi_Flask	, 	"FP_ITEM_SHIP_03"); 
	Wld_InsertItem	(ItMi_Flask,	"FP_ITEM_SHIP_07");

	// ------ StartUps der Unter-Parts ------ 
	STARTUP_NEWWORLD_PART_DRAGON_ISLAND_01();
	STARTUP_NEWWORLD_PART_DRAGON_UNDEAD_01();
	STARTUP_NEWWORLD_PART_DRAGON_FINAL_01();

	PlayVideo ("SHIP.BIK");	 
	
	
	
	Log_CreateTopic (TOPIC_HallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HallenVonIrdorath, LOG_RUNNING);
	Log_AddEntry (TOPIC_HallenVonIrdorath,"Wir haben die Insel des Feindes erreicht. Innos weiß, welche Kreaturen im Innern dieses Berges auf mich warten werden."); 

	B_Kapitelwechsel (6, DRAGONISLAND_ZEN);
};


FUNC VOID INIT_DRAGONISLAND ()
{
	B_InitMonsterAttitudes (); 
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	CurrentLevel = DRAGONISLAND_ZEN;
	

	//----- Levelchange verbarrikadieren --------
	if (Npc_HasItems (hero,ITKE_SHIP_LEVELCHANGE_MIS))
	{
		Npc_RemoveInvItems	(hero,	ITKE_SHIP_LEVELCHANGE_MIS,1);	//Joly: denn SHIP zen wird bei DRAGONISLAND UND NEWWORLD benutzt. Beim betreten der Insel ist die Tür wieder zu!!!!
	};
	B_InitNpcGlobals (); 
};

