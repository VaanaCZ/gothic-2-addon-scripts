INSTANCE PIR_1354_Addon_Henry (Npc_Default)
{
	// ------ NSC ------
	name 		= "Henry";
	guild 		= GIL_PIR;
	id 			= 1354;
	voice 		= 4;
	flags       = FALSE;												
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	EquipItem (self, ItMw_Krummschwert); 
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Normal01, BodyTex_P, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1354;
};

FUNC VOID Rtn_Start_1354 ()
{	
	TA_Guard_Passage	(05,00,20,00,"ADW_PIRATECAMP_WAY_04");
	TA_Guard_Passage	(20,00,05,00,"ADW_PIRATECAMP_WAY_04");
};

