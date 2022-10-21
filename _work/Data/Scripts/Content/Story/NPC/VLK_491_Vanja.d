

instance VLK_491_Vanja (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vanja";
	guild 		= GIL_VLK;
	id 			= 491;
	voice 		= 17;
	flags       = 0;				
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------				
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_B_RedLocks, BodyTexBabe_B, ITAR_VlkBabe_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 20); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_491;
};

FUNC VOID Rtn_Start_491 ()
{	
	TA_Smalltalk 	(08,00,23,00,"NW_CITY_HABOUR_PUFF_VANJA");
    TA_Smalltalk	(23,00,08,00,"NW_CITY_HABOUR_PUFF_VANJA");
};

FUNC VOID Rtn_Alone_491 ()
{	
	TA_Sweep_FP 	(08,00,23,00,"NW_CITY_HABOUR_PUFF_VANJA");
    TA_Sweep_FP		(23,00,08,00,"NW_CITY_HABOUR_PUFF_VANJA");
};

