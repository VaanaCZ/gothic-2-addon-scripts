
instance Vlk_424_Alwin (Npc_Default) //Metzger
{
	// ------ NSC ------
	name 		= "Alwin";	
	guild 		= GIL_VLK;
	id 			= 424;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Vlk_Axe);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_Barkeeper);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_424;
};

FUNC VOID Rtn_Start_424()
{	
	TA_Sit_Bench 	(08,00,22,00,"NW_CITY_PATH_HABOUR_18");
    TA_Sleep 		(22,00,08,00,"NW_CITY_HABOUR_HUT_07_BED_01");
};
