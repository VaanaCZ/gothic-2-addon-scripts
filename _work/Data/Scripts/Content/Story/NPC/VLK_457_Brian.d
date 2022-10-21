
instance VLK_457_Brian (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brian"; 
	guild 		= GIL_VLK;
	id 			= 457;
	voice 		= 4;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Axe); 
		
	// ------ Inventory ------
	// Händler

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kirgo, BodyTex_B,ITAR_SMITH);	
	Mdl_SetModelFatness	(self,0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_457;
};
FUNC VOID Rtn_Start_457()
{	
	TA_Smith_Sharp		(07,05,20,35,"NW_CITY_SMITH_SHARP");
	TA_Smalltalk		(20,35,00,25,"NW_CITY_MERCHANT_PATH_14");
    TA_Sleep			(00,25,07,05,"NW_CITY_BED_BRIAN");
};
FUNC VOID Rtn_Lighthouse_457()
{	
	TA_Stand_Guarding	(08,00,20,00,"NW_LIGHTHOUSE_IN_01");
    TA_Sit_Throne			(20,00,08,00,"NW_LIGHTHOUSE_IN_03"); 
};

