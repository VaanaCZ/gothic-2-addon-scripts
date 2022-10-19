
instance VLK_479_Lucy (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lucy"; //Alwins Frau
	guild 		= GIL_VLK;
	id 			= 479;
	voice 		= 17;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Vlk_Dagger);	
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_Anne, BodyTex_N, ITAR_BauBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_479;
};

FUNC VOID Rtn_Start_479 ()
{	
	TA_Rake_FP 			(05,00,19,00,"NW_CITY_PICK_02");
	TA_Cook_Stove		(19,00,22,00,"NW_CITY_HABOUR_HUT_07_IN");
	TA_Sleep			(22,00,05,00,"NW_CITY_HABOUR_HUT_07_BED_01");
};
