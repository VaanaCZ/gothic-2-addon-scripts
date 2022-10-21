instance BDT_10400_Addon_DeadBandit (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandyta";
	guild 		= GIL_BDT;
	id 			= 10400;
	voice 		= 4;
	flags      	= 0;
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	level 		= 20;
	
	attribute[ATR_STRENGTH] 		= 70;
	attribute[ATR_DEXTERITY] 		= 80;
	attribute[ATR_MANA_MAX] 		= 100;
	attribute[ATR_MANA] 			= 100;
	attribute[ATR_HITPOINTS_MAX]	= 300;
	attribute[ATR_HITPOINTS] 		= 300;																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Sld_Sword);
	CreateInvItems (self, ItMi_Gold, 50);									
	CreateInvItems (self, ItWr_DexStonePlate1_Addon, 1);									
	CreateInvItems (self, ItWr_OneHStonePlate1_Addon, 1);									
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Ian, BodyTex_L, ITAR_BDT_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10400;
};

FUNC VOID Rtn_Start_10400 ()
{
    TA_Stand_WP  	  (08,00,16,00,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_02");
    TA_Stand_WP  	  (16,00,08,00,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_02");  
};
