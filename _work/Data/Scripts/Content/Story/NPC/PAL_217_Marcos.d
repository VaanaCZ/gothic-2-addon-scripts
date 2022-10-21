
instance PAL_217_Marcos  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Marcos";
	guild 		= GIL_OUT;
	id 			= 217;
	voice 		= 4;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_OCMAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);													
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Pal_Sword);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	
	CreateInvItems (self, ItPo_Health_03,5);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Tough_Rodriguez, BodyTex_P, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_217;
};

FUNC VOID Rtn_Start_217 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OW_SAWHUT_MOLERAT_SPAWN01");
    TA_Stand_Guarding		(23,00,08,00,"OW_SAWHUT_MOLERAT_SPAWN01");
};


