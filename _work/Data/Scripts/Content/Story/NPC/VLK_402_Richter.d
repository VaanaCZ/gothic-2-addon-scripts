instance VLK_402_Richter (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sêdzia";
	guild 		= GIL_VLK;
	id 			= 402;
	voice 		= 10;
	flags       = NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKe_Richter,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Richter, BodyTex_N, ITAR_Judge);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_402;
};

FUNC VOID Rtn_Start_402 ()
{	
	TA_Read_Bookstand 	(08,00,18,45,"NW_CITY_RICHTER_BED");
	TA_Sit_Throne		(18,45,22,00,"NW_CITYHALL_PRIVATE_THRONE");
    TA_Sit_Throne		(22,00,01,00,"NW_CITY_RICHTER");
    TA_Sleep			(01,00,08,00,"NW_CITY_RICHTER_BED");
};
