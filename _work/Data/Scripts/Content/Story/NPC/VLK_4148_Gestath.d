INSTANCE VLK_4148_Gestath (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gestath";
	guild 		= GIL_OUT;
	id 			= 4148;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_2h_SLD_Sword); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Thorus, BodyTex_B, ITAR_DJG_Crawler);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4148;
};

FUNC VOID Rtn_Start_4148 ()
{	
	TA_Stand_Guarding			(08,00,23,00,"OW_DJG_ROCKCAMP_01");
    TA_Sit_Campfire				(23,00,08,00,"OW_DJG_ROCKCAMP_01");		
};
