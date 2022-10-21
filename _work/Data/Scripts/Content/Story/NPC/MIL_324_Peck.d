
instance Mil_324_Peck (Npc_Default)
{
	// ------ NSC ------
	name 		= "Peck";	
	guild 		= GIL_MIL;
	id 			= 324;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKe_City_Tower_05,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Orik, BodyTex_B, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_324;
};

FUNC VOID Rtn_Start_324() // Im Bordell 
{	
	TA_Smalltalk	(08,00,23,00,"NW_CITY_HABOUR_PUFF_PECK");
    TA_Smalltalk	(23,00,08,00,"NW_CITY_HABOUR_PUFF_PECK");
};
FUNC VOID Rtn_Storage_324()// bei der Waffenausgabe
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_CITY_ARMORY_PECK"); 
    TA_Sleep				(22,00,08,00,"NW_CITY_BARRACK02_BED_PECK");
};
