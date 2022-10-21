
instance VLK_443_Arbeiter (Npc_Default)
{
	// ------ NSC ------
	name 		= "Arbeiter"; 
	guild 		= GIL_VLK;
	id 			= 443;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_Mace_L_04); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak04, BodyTex_N,ITAR_Bau_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_443;
};

FUNC VOID Rtn_Start_443()
{	
	TA_Saw			(04,55,19,05,"NW_CITY_HABOUR_08");
    TA_Smalltalk	(19,05,04,55,"NW_CITY_HABOUR_02");
};
