 
instance Pal_212_Schiffswache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Schiffswache;
	guild 		= GIL_PAL;
	id 			= 212;
	voice 		= 8;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: NPC_FLAG_IMMORTAL															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_NAILED;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_2H_PAL_Sword);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_Scatty, BodyTex_L, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_212;
};

FUNC VOID Rtn_Start_212 ()
{
	TA_Guard_Passage	(08,00,23,00,"NW_CITY_SHIP_GUARD_02");
    TA_Guard_Passage	(23,00,08,00,"NW_CITY_SHIP_GUARD_02");	
};

FUNC VOID Rtn_ShipFree_212 ()
{
	TA_Smalltalk	(08,00,23,00,"NW_CITY_PALCAMP_01");
    TA_Smalltalk	(23,00,08,00,"NW_CITY_PALCAMP_01");	
};
