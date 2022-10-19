
instance Pal_206_Ritter (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_PAL;
	id 			= 206;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_2H_Pal_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Normal_Kharim, BodyTex_B, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_206;
};

FUNC VOID Rtn_Start_206 ()
{
	TA_Stand_ArmsCrossed	(07,14,19,00,"NW_CITY_UPTOWN_PATH_06_B");
	TA_Smalltalk			(19,00,23,01,"NW_CITY_UPTOWN_HUT_03_05");
	TA_Sleep				(23,01,07,14,"NW_CITY_LEOMAR_BED_01");	
};
