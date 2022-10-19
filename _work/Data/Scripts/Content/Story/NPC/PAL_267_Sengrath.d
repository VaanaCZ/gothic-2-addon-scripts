
instance PAL_267_Sengrath (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sengrath";
	guild 		= GIL_PAL;
	id 			= 267;
	voice 		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_OCMAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_NAILED;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Pal_Sword);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal03, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 65); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_267;
};

FUNC VOID Rtn_Start_267 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OC_CENTER_GUARD_01");
    TA_Stand_Guarding		(23,00,08,00,"OC_CENTER_GUARD_01");
};

FUNC VOID Rtn_ORCBARRIER_267 ()
{	
	TA_Sleep		(08,00,23,00,"OW_ORCBARRIER_12");
    TA_Sleep		(23,00,08,00,"OW_ORCBARRIER_12");
};
