instance Pal_219_Ritter (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_OUT;
	id 			= 218;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_OCAMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Pal_Sword);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_ToughBald01, BodyTex_L, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 55); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_219;
};

FUNC VOID Rtn_Start_219 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"OW_PATH_264");
    TA_Stand_Guarding	(23,00,08,00,"OW_PATH_264");
};
