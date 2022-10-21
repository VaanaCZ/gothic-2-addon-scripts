INSTANCE PIR_1350_Addon_Francis (Npc_Default)
{
	// ------ NSC ------
	name 		= "Francis";
	guild 		= GIL_PIR;
	id 			= 1350;
	voice 		= 13;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Schwert1);  
	
	// ------ Inventory ------
	CreateInvItems (self ,ITKE_Greg_ADDON_MIS,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Cipher_neu, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1350;
};

FUNC VOID Rtn_Start_1350 ()
{	
	TA_Sit_Bench 	(05,00,20,00,"ADW_PIRATECAMP_HUT4_01");
	TA_Sit_Bench	(20,00,05,00,"ADW_PIRATECAMP_HUT4_01");
};

FUNC VOID Rtn_GregIsBack_1350 ()
{	
	TA_Saw 	(05,00,20,00,"ADW_PIRATECAMP_BEACH_19");
	TA_Saw 	(20,00,05,00,"ADW_PIRATECAMP_BEACH_19");
};
