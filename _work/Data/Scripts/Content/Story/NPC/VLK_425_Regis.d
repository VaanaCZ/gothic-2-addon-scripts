
instance VLK_425_Regis (Npc_Default)
{
	// ------ NSC ------
	name 		= "Regis"; 
	guild 		= GIL_VLK;
	id 			= 425;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_425;
};
FUNC VOID Rtn_Start_425 ()
{	
	TA_Sit_Bench	(05,30,20,30,"NW_CITY_REGIS");
	TA_Smalltalk	(20,30,00,30,"NW_CITY_MERCHANT_PATH_14_A");
	TA_Sit_Chair	(00,30,05,30,"NW_CITY_TAVERN_IN_04");
};
