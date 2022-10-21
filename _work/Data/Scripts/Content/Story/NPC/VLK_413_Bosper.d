
instance VLK_413_Bosper (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bosper";
	guild 		= GIL_VLK;
	id 			= 413;
	voice 		= 11;
	flags       = NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1H_VLK_Dagger);
	EquipItem			(self, ItRw_SLD_Bow);
	
	// ------ Inventory ------
	// Händler

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_L_Tough_Santino, BodyTex_L,ITAR_LEATHER_L );	
	
	Mdl_SetModelFatness	(self, 0.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_413;
};

FUNC VOID Rtn_Start_413 ()
{	
	TA_Stand_Guarding		(05,00,00,00,"NW_CITY_MERCHANT_SHOP01_IN_02");
	TA_Sleep 				(00,00,05,00,"NW_CITY_BED_GRITTA");
};
