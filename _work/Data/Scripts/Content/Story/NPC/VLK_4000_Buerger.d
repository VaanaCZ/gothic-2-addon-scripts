
instance VLK_4000_Buerger (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buerger; 
	guild 		= GIL_VLK;
	id 			= 4000;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self,ItMw_1h_Vlk_Mace);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart21, BodyTex_N,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4000;
};

FUNC VOID Rtn_Start_4000()
{	
	TA_Sleep		(22,00,08,00,"NW_CITY_UPTOWN_HUT_05_BED_01");
	TA_Smalltalk	(08,00,12,00,"NW_CITY_UPTOWN_HUT_04_ENTRY");
	TA_Sit_Bench	(12,00,15,00,"NW_CITY_GUARD_01");
	TA_Smalltalk	(15,00,18,00,"NW_CITY_UPTOWN_HUT_04_ENTRY");
	TA_Sit_Bench	(18,00,20,00,"NW_CITY_GUARD_01");
	TA_Sit_Bench 	(20,00,22,00,"NW_CITY_UPTOWN_PATH_27");

};
