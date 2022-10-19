instance BDT_1099_Addon_Huno (Npc_Default)
{
	// ------ NSC ------
	name 		= "Huno";
	guild 		= GIL_BDT;
	id 			= 1099;
	voice 		= 6;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Huno, BodyTex_N, ITAR_SMITH);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_1099;
};
FUNC VOID RTN_PreStart_1099()
{
	 TA_Smith_Anvil    (06,00,12,00,"BL_UP_02");	
	 TA_Smith_Sharp    (12,00,18,00,"BL_SMITH_YARD_02");
	 TA_Smith_Anvil    (18,00,23,00,"BL_UP_02");
	 
	 TA_Sleep		   (23,00,06,00,"BL_SMITH_SLEEP"); 
};

FUNC VOID Rtn_Start_1099 ()
{
	TA_Sleep		(22,00,07,00,"BL_SMITH_SLEEP"); 
	
	
	TA_Smith_Fire	(07,00,07,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(07,10,07,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(07,20,07,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(07,30,07,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(07,40,07,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(07,50,08,00,"BL_SMITH_ANVIL");
	
	TA_Smith_Fire	(08,00,08,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(08,10,08,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(08,20,08,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(08,30,08,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(08,40,08,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(08,50,09,00,"BL_SMITH_ANVIL");

	TA_Smith_Fire	(09,00,09,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(09,10,09,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(09,20,09,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(09,30,09,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(09,40,09,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(09,50,10,00,"BL_SMITH_ANVIL");

	TA_Smith_Fire	(10,00,10,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(10,10,10,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(10,20,10,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(10,30,10,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(10,40,10,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(10,50,11,00,"BL_SMITH_ANVIL");    
          
	TA_Smith_Fire	(11,00,11,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(11,10,11,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(11,20,11,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(11,30,11,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(11,40,11,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(11,50,12,00,"BL_SMITH_ANVIL");

	TA_Smith_Fire	(12,00,12,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(12,10,12,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(12,20,12,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(12,30,12,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(12,40,12,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(12,50,13,00,"BL_SMITH_ANVIL");
          
	TA_Smith_Fire	(13,00,13,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(13,10,13,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(13,20,13,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(13,30,13,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(13,40,13,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(13,50,14,00,"BL_SMITH_ANVIL");

	TA_Smith_Fire	(14,00,14,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(14,10,14,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(14,20,14,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(14,30,14,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(14,40,14,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(14,50,15,00,"BL_SMITH_ANVIL");

	TA_Smith_Fire	(15,00,15,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(15,10,15,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(15,20,15,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(15,30,15,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(15,40,15,50,"BL_SMITH_COOL");
 	TA_Smith_Anvil	(15,50,16,00,"BL_SMITH_ANVIL");
		
	TA_Smith_Fire	(16,00,16,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(16,10,16,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(16,20,16,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(16,30,16,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(16,40,16,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(16,50,17,00,"BL_SMITH_ANVIL");

	TA_Smith_Fire	(17,00,17,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(17,10,17,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(17,20,17,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(17,30,17,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(17,40,17,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(17,50,18,00,"BL_SMITH_ANVIL");

	TA_Smith_Fire	(18,00,18,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(18,10,18,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(18,20,18,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(18,30,18,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(18,40,18,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(18,50,19,00,"BL_SMITH_ANVIL");

	TA_Smith_Fire	(19,00,19,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(19,10,19,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(19,20,19,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(19,30,19,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(19,40,19,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(19,50,20,00,"BL_SMITH_ANVIL");

	TA_Smith_Fire	(20,00,20,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(20,10,20,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(20,20,20,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(20,30,20,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(20,40,20,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(20,50,21,00,"BL_SMITH_ANVIL");
	
	TA_Smith_Fire	(21,00,21,10,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(21,10,21,20,"BL_SMITH_ANVIL");
	TA_Smith_Fire	(21,20,21,30,"BL_SMITH_FIRE");
	TA_Smith_Anvil	(21,30,21,40,"BL_SMITH_ANVIL");
	TA_Smith_Cool	(21,40,21,50,"BL_SMITH_COOL");
	TA_Smith_Anvil	(21,50,22,00,"BL_SMITH_ANVIL");	    		
};
