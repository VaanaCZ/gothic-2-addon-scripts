INSTANCE PIR_1368_Addon_Malcom (Npc_Default)
{
	// ------ NSC ------
	name 		= "Malcom";
	guild 		= GIL_PIR;
	id 			= 1368;
	voice 		= 4;
	flags       = 0;															
	npctype		= NPCTYPE_MAIN;
		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hAxe);
	CreateInvItems (self, ItWr_TwoHStonePlate3_Addon, 1);	//Joly: dring lassen, wird abgefragt!							

	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal_Sly, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1368;
};

FUNC VOID Rtn_PreStart_1368 ()
{	
	TA_Sit_Campfire (06,00,10,00,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Saw			(10,00,14,00,"ADW_PIRATECAMP_WAY_15");
	TA_Sit_Campfire (14,00,18,00,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Saw			(18,00,22,00,"ADW_PIRATECAMP_WAY_15");
	TA_Sit_Campfire (22,00,02,00,"ADW_PIRATECAMP_LUMBER_SIT");
	TA_Sit_Campfire	(02,00,06,00,"ADW_PIRATECAMP_LUMBER_SIT");
};


FUNC VOID Rtn_Start_1368 ()
{	
	TA_Sleep 		(06,00,18,00,"ADW_PIRATECAMP_SECRETCAVE_02");
	TA_Sleep 		(18,00,06,00,"ADW_PIRATECAMP_SECRETCAVE_02");
};
