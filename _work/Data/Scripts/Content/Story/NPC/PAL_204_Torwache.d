
instance Pal_204_Torwache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Torwache;
	guild 		= GIL_PAL;
	id 			= 204;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_AMBIENT;
	
	//------- AI Vars ----------
	aivar[AIV_NewsOverride] 	= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2H_Pal_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Whistler, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_204;
};

FUNC VOID Rtn_Start_204 ()
{
	TA_Guard_Passage	(08,00,23,00,"NW_CITYHALL_GUARD_01");
    TA_Guard_Passage	(23,00,08,00,"NW_CITYHALL_GUARD_01");	
};
