instance BDT_1011_Bandit_M (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BANDIT; 
	guild 		= GIL_BDT;
	id 			= 1011;
	voice 		= 1;
	flags       = 0;			
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------		
	EquipItem			(self, ItMw_1h_VLK_Axe);
	EquipItem			(self, ItRw_SLD_Bow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------				
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald",  Face_N_Homer, BodyTex_N, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------						
	B_SetFightSkills (self, 40); 
	
	// ------ TA ------
	start_aistate = ZS_Bandit;
};

