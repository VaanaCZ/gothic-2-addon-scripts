
instance VLK_4003_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buergerin;	
	guild 		= GIL_VLK;
	id 			= 4003;
	voice 		= 17;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_OldBrown, BodyTex_N, ITAR_VlkBabe_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4003;
};

FUNC VOID Rtn_Start_4003 ()
{	
	  TA_Sleep			(22,00,07,45,"NW_CITY_REICH02_BED_02");
	
	  TA_Cook_Stove		(07,45,10,00,"NW_CITY_REICH02_COOK");
   	  TA_Sit_Chair		(10,00,12,30,"NW_CITY_REICH02_SIT");
   	  TA_Stand_Sweeping	(12,30,14,00,"NW_CITY_REICH02_SIT");		
  	  
  	  TA_Cook_Stove		(14,00,16,00,"NW_CITY_REICH02_COOK");	
  	  TA_Sit_Chair		(16,00,18,00,"NW_CITY_REICH02_SIT");		
	  TA_Stand_Sweeping	(18,00,19,00,"NW_CITY_REICH02_SIT");	
	  
	  TA_Smalltalk		(19,00,22,00,"NW_CITY_SMALLTALK_02");
	  
};
