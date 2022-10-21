
instance VLK_434_Borka (Npc_Default)
{
	// ------ NSC ------
	name 		= "Borka"; 
	guild 		= GIL_VLK;
	id 			= 434;
	voice 		= 11;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace); 
	
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Joint, 20);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_Ian, BodyTex_L,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_434;
};

FUNC VOID Rtn_Start_434()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"NW_CITY_HABOUR_PUFF_ENTRANCE");
    TA_Stand_ArmsCrossed		(22,00,08,00,"NW_CITY_HABOUR_PUFF_ENTRANCE");
};
FUNC VOID Rtn_Prison_434()	//nach seiner Verhaftung M.F. 
{	
	TA_Sit_Campfire		(08,00,22,00,"NW_CITY_HABOUR_KASERN_BORKA");
    TA_Sit_Campfire		(22,00,08,00,"NW_CITY_HABOUR_KASERN_BORKA");
};
