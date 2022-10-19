
instance PAL_259_Wache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Wache;
	guild 		= GIL_PAL;
	id 			= 259;
	voice 		= 4;
	flags       = 0;																
	npctype		= NPCTYPE_OCAMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1h_Pal_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_ToughBald_Nek, BodyTex_P, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_259;
};

FUNC VOID Rtn_Start_259 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OC_OPEN_ROOM_GUARD_01");
    TA_Stand_Guarding		(23,00,08,00,"OC_OPEN_ROOM_GUARD_01");
};
