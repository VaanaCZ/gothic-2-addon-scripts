
instance VLK_493_Nagur (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nagur"; 
	guild 		= GIL_VLK;
	id 			= 493;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal17, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_493;
};

FUNC VOID Rtn_Start_493()
{	
	TA_Sit_Chair		(08,00,23,00,"NW_CITY_HABOUR_TAVERN01_02");
    TA_Sit_Chair		(23,00,08,00,"NW_CITY_HABOUR_TAVERN01_02"); 
};
FUNC VOID Rtn_Prison_493()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"NW_CITY_HABOUR_KASERN_NAGUR");
    TA_Stand_ArmsCrossed	(23,00,08,00,"NW_CITY_HABOUR_KASERN_NAGUR"); 
};
