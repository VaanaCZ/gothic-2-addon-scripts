
instance VLK_433_Bromor (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bromor"; 
	guild 		= GIL_VLK;
	id 			= 433;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Dagger); 
	

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKE_Bromor,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Fingers, BodyTex_N,ITAR_Vlk_H );	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_433;
};

//Joly: NIE AUF EINE BANK ODER THRON SETZEN
FUNC VOID Rtn_Start_433()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_PUFF_COUNTER");
    TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_PUFF_COUNTER");
};
