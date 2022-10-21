
instance Pal_208_Paladin (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_PAL;
	id 			= 208;
	voice 		= 4;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Drax, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_208;
};
FUNC VOID Rtn_Start_208 ()
{
	TA_Smalltalk	(08,00,19,02,"NW_CITY_UPTOWN_PATH_05_B");
	TA_Smalltalk	(19,02,23,00,"NW_CITY_UPTOWN_HUT_03_04");
    TA_Sleep		(23,00,07,00,"NW_CITY_LEOMAR_BED_06");	
};
