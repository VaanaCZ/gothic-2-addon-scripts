
instance VLK_4006_Bote (Npc_Default)
{
	// ------ NSC ------
	name 		= "Goniec"; 
	guild 		= GIL_VLK;
	id 			= 4006;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
	
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] 	 = 500;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal_Stone, BodyTex_N,ITAR_VLK_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4006;
};

FUNC VOID Rtn_Start_4006()
{	
	TA_Stand_Guarding	(08,00,22,00,"NW_PATH_TO_MONASTERY_AREA_01");
    TA_Stand_Guarding	(22,00,08,00,"NW_PATH_TO_MONASTERY_AREA_01");
};
FUNC VOID Rtn_Rest_4006()
{	
	TA_Stand_Drinking	(08,00,22,00,"TAVERNE");
    TA_Stand_Drinking	(22,00,08,00,"TAVERNE");
};
