
instance VLK_4301_Addon_Farim (Npc_Default)
{
	// ------ NSC ------
	name 		= "Farim"; 
	guild 		= GIL_VLK;
	id 			= 4301;
	voice 		= 11;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: HauptstoryCharakter Addon															
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivar ------
	aivar[AIV_ToughGuy] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	CreateInvItems (self, ItMi_Aquamarine, 1);	//Joly: für Mission							
	EquipItem	(self, ItMw_1h_Bau_Mace); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart08, BodyTex_N,ITAR_Bau_L );	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4301;
};

FUNC VOID Rtn_Start_4301 ()
{	
	TA_Repair_Hut 		(08,00,12,00,"NW_CITY_WAY_TO_SHIP_FISCHER_05");
	TA_Stand_Guarding	(12,00,16,00,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	TA_Repair_Hut		(16,00,20,00,"NW_CITY_WAY_TO_SHIP_FISCHER_05");
	TA_Stand_Guarding	(20,00,01,30,"NW_CITY_WAY_TO_SHIP_FISCHER_06");
	TA_Sleep			(01,30,08,00,"NW_CITY_WAY_TO_SHIP_FISCHER_04");
};
