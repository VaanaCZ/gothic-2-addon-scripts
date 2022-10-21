
instance Pal_211_Torwache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_RITTER;
	guild 		= GIL_PAL;
	id 			= 211;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_2H_Pal_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Wolf, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_211;
};

FUNC VOID Rtn_Start_211 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_CITYHALL_WARROOM_04");
    TA_Stand_Guarding	(23,00,08,00,"NW_CITY_CITYHALL_WARROOM_04");	
};
