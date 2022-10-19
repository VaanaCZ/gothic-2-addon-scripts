
instance VLK_4145_Waffenknecht (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_WAFFENKNECHT; 
	guild 		= GIL_MIL;
	id 			= 4145;
	voice 		= 1;
	flags       = 0;							
	npctype		= NPCTYPE_OCAMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic	= FAI_NAILED;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Mil_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart09, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4145;
};

FUNC VOID Rtn_Start_4145 ()
{	
	TA_Stand_Guarding	 (08,00,23,00,"OC_GUARD_PALISADE_07");
    TA_Stand_Guarding	 (23,00,08,00,"OC_GUARD_PALISADE_07");
};
