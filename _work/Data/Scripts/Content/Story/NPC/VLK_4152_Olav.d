
instance VLK_4152_Olav (Npc_Default)
{
	// ------ NSC ------
	name 		= "Olav"; 
	guild 		= GIL_MIL;
	id 			= 4152;
	voice 		= 4;
	flags       = 0;							
	npctype		= NPCTYPE_OCAMBIENT;
	

	// ------ Attribute ------
	slf.attribute[ATR_STRENGTH] 		= 10;
	slf.attribute[ATR_DEXTERITY] 		= 10;
	slf.attribute[ATR_MANA_MAX] 		= 0;
	slf.attribute[ATR_MANA] 			= 0;
	slf.attribute[ATR_HITPOINTS_MAX]	= 1;
	slf.attribute[ATR_HITPOINTS] 		= 1;																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItSe_Olav,1);
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart22, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4152;
};

FUNC VOID Rtn_Start_4152 ()
{	
	TA_Stand_Guarding 		(08,00,23,00,"OW_WOLFHUT_01");
    TA_Stand_Guarding		(23,00,08,00,"OW_WOLFHUT_01");
};
