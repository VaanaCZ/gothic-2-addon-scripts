INSTANCE KDF_500_Pyrokar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pyrokar";
	guild 		= GIL_KDF;
	id 			= 500;
	voice 		= 11;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: NPC_FLAG_IMMORTAL																		
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_ImportantOld , BodyTex_N, ITAR_KDF_H);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_500;
};

FUNC VOID Rtn_Start_500 ()
{	
	TA_Sit_Throne	(08,00,23,00,"NW_MONASTERY_THRONE_01");
    TA_Sit_Throne	(23,00,08,00,"NW_MONASTERY_THRONE_01");
};

FUNC VOID Rtn_RitualInnosEyeRepair_500 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_TROLLAREA_RITUAL_02");
    TA_Stand_Guarding	(23,00,08,00,"NW_TROLLAREA_RITUAL_02");
};


FUNC VOID Rtn_RitualInnosEye_500 ()
{	
	TA_Circle	(08,00,23,00,"NW_TROLLAREA_RITUAL_02");
    TA_Circle	(23,00,08,00,"NW_TROLLAREA_RITUAL_02");
};
