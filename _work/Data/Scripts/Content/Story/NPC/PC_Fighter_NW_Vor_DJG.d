

//******************************************
//   Gorn in der NewWorld vor dem 4. Kapitel
//******************************************

INSTANCE PC_Fighter_NW_vor_DJG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gorn";
	guild 		= GIL_SLD;
	id 			= 813;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter",Face_B_Gorn, BodyTex_B, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_813;
};

//-------------------------------------
FUNC VOID Rtn_Start_813 ()
{	
	TA_Sit_Chair			(08,00,23,00,"NW_BIGFARM_HOUSE_14"); 
    TA_Sit_Chair			(23,00,08,00,"NW_BIGFARM_HOUSE_14");
};
FUNC VOID Rtn_Tot_813 ()
{	
	TA_Sit_Campfire			(08,00,23,00,"TOT");
    TA_Sit_Campfire			(23,00,08,00,"TOT");
};
