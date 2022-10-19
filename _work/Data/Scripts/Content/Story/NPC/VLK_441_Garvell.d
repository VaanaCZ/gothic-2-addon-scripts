
instance VLK_441_Garvell (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garvell"; 
	guild 		= GIL_VLK;
	id 			= 441;
	voice 		= 4;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Axe); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItSe_GoldPocket25,1);	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_441;
};

FUNC VOID Rtn_Start_441()
{	
	TA_Stand_Drinking	(04,50,19,11,"NW_CITY_HABOUR_07");
    TA_Smalltalk		(19,11,00,01,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01");
    TA_Stand_Drinking	(00,01,04,50,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};
