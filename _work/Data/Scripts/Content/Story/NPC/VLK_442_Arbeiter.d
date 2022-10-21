
instance VLK_442_Arbeiter (Npc_Default)
{
	// ------ NSC ------
	name 		= "Arbeiter"; 
	guild 		= GIL_VLK;
	id 			= 442;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
 	EquipItem	(self, ItMw_1h_VLK_Axe); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Senyan, BodyTex_N,ITAR_Bau_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_442;
};

FUNC VOID Rtn_Start_442()
{	
	TA_Repair_Hut	(05,00,19,00,"NW_CITY_HABOUR_WERFT_ENTRY");
    TA_Smalltalk	(19,00,05,00,"NW_CITY_PATH_HABOUR_01");
};
