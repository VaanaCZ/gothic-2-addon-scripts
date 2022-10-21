
instance Mil_311_Andre (Npc_Default)
{
	// ------ NSC ------
	name 		= "Andre";	
	guild 		= GIL_MIL;
	id 			= 311;
	voice 		= 8;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: NPC_FLAG_IMMORTAL																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak12, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_311;
};
FUNC VOID Rtn_PreStart_311 ()
{
	TA_Stand_Guarding 	(00,00,12,00,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY"); 
	TA_Stand_Guarding 	(12,00,00,00,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
};

FUNC VOID Rtn_Start_311 ()
{	
	TA_Read_Bookstand  		(08,00,00,10,"NW_CITY_ANDRE"); 
    TA_Smalltalk			(00,10,05,00,"NW_CITY_ANDRE_SMALLTALK"); 
    TA_Read_Bookstand		(05,00,08,00,"NW_CITY_ANDRE");
    
};
