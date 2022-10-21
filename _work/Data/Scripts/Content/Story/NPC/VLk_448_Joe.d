
instance VLK_448_Joe (Npc_Default)
{
	// ------ NSC ------
	name 		= "Joe"; 
	guild 		= GIL_OUT;
	id 			= 448;
	voice 		= 10;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	//EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_ToughBald, BodyTex_P,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_448;
};

FUNC VOID Rtn_PreStart_448()
{	
	TA_Sit_Campfire	(08,00,23,00,"NW_CITY_MERCHANT_TOWER_01");
    TA_Sit_Campfire	(23,00,08,00,"NW_CITY_MERCHANT_TOWER_01");
};
FUNC VOID Rtn_Start_448()
{	
	TA_Stand_Drinking	(08,00,23,00,"NW_CITY_HABOUR_TAVERN01_08");
    TA_Stand_Drinking	(23,00,08,00,"NW_CITY_HABOUR_TAVERN01_08");
};
