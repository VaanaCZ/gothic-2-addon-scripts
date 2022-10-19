
instance BAU_942_Randolph (Npc_Default)
{
	// ------ NSC ------
	name 		= "Randolph";
	guild 		= GIL_OUT;
	id 			= 942;
	voice 		= 6;
	flags       = NPC_FLAG_IMMORTAL;	//Joly:nur solange Alnveres da ist!																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------															
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Kharim, BodyTex_B, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 20); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_preStart_942;
};
//Joly: NIE AUF EINE BANK ODER THRON SETZEN
FUNC VOID Rtn_preStart_942 ()
{	
	TA_Stand_Guarding (08,00,22,00,"NW_FARM2_FIELD_04_B");
    TA_Stand_Guarding (22,00,08,00,"NW_FARM2_FIELD_04_B");
};
//Joly: NIE AUF EINE BANK ODER THRON SETZEN
FUNC VOID Rtn_Start_942 ()
{	
	TA_Pick_FP 			(05,00,21,00,"NW_FARM2_FIELD_04");
    TA_Stand_Eating		(21,00,05,00,"NW_FARM2_OUT_07");
};
//Joly: NIE AUF EINE BANK ODER THRON SETZEN
FUNC VOID Rtn_Wettkampf_942 ()
{	
	TA_Stand_Drinking  	(08,00,22,00,"NW_TAVERNE_RUKHAR");	
    TA_Stand_Drinking 	(22,00,08,00,"NW_TAVERNE_RUKHAR");
};


