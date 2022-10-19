

instance BAU_941_Kati (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kati";
	guild 		= GIL_OUT;
	id 			= 941;
	voice 		= 16;
	flags       = NPC_FLAG_IMMORTAL;	//Joly:nur solange Alnveres da ist!																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTexBabe_N, ITAR_BauBabe_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_941;
};

FUNC VOID Rtn_PreStart_941 ()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"NW_FARM2_PATH_01");
    TA_Stand_ArmsCrossed		(22,00,08,00,"NW_FARM2_PATH_01");
};

FUNC VOID Rtn_Start_941 ()
{	
	TA_Cook_Stove		(05,00,10,00,"NW_FARM2_HOUSE_IN_04");
    TA_Sit_Bench		(10,00,12,00,"NW_FARM2_BENCH_02");
   	TA_Cook_Stove		(12,00,20,55,"NW_FARM2_HOUSE_IN_04");
    TA_Roast_Scavenger 	(20,55,23,59,"NW_FARM2_BBQ");
    TA_Sleep			(23,59,05,00,"NW_FARM2_HOUSE_IN_02");
};



