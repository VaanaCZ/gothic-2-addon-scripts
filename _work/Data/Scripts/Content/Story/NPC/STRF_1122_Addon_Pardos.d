instance STRF_1122_Addon_Pardos (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pardos"; 
	guild 		= GIL_STRF;
	id 			= 1122;
	voice 		= 3;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_NoFightParker] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
		slf.level = 12;
		
		slf.attribute[ATR_STRENGTH] 		= 40;
		slf.attribute[ATR_DEXTERITY] 		= 40;
		slf.attribute[ATR_MANA_MAX] 		= 100;
		slf.attribute[ATR_MANA] 			= 100;
		slf.attribute[ATR_HITPOINTS_MAX]	= 120;
		slf.attribute[ATR_HITPOINTS] 		= 70;//für MISSION															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2H_Axe_L_01 );
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1122;
};

FUNC VOID Rtn_Start_1122 ()
{	
	TA_Sit_Campfire	 (08,00,23,00,"ADW_MINE_LAGER_SIDE_04");
    TA_Sit_Campfire	 (23,00,08,00,"ADW_MINE_LAGER_SIDE_04");
};
FUNC VOID Rtn_Flucht_1122 ()
{	
	TA_RunToWP	 (08,00,23,00,"ADW_BL_HOEHLE_03");
    TA_RunToWP	 (23,00,08,00,"ADW_BL_HOEHLE_03");
};
