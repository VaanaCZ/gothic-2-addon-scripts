instance BDT_1098_Addon_Snaf (Npc_Default)
{
	// ------ NSC ------
	name 		= "Snaf";
	guild 		= GIL_BDT;
	id 			= 1098;
	voice 		= 1;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self,ItFo_Addon_LousHammer,1);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Snaf, BodyTex_N, ITAR_BARKEEPER);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1098;
};
FUNC VOID Rtn_Start_1098 ()
{
    TA_Stand_Sweeping (07,00,10,00,"BL_INN_BAR_02");
	TA_Stand_WP 	  (10,00,15,00,"BL_INN_BAR_05");	
	TA_Cook_Cauldron  (15,00,21,00,"BL_INN_BAR_05");
	TA_Stand_WP 	  (21,00,07,00,"BL_INN_BAR_05");
};
