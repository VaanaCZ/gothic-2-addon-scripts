
instance Pal_205_Torwache (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Torwache;
	guild 		= GIL_PAL;
	id 			= 205;
	voice 		= 12;
	flags       = NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] 	= TRUE;
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Pal_Sword);
	
	
	// ------ Inventory ------
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak05, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_205;
};
//
FUNC VOID Rtn_Start_205 ()
{
	TA_Guard_Passage	(08,00,23,00,"NW_CITYHALL_GUARD_02");
    TA_Guard_Passage	(23,00,08,00,"NW_CITYHALL_GUARD_02");	
};
