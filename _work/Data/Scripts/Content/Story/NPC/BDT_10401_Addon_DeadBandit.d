instance BDT_10401_Addon_DeadBandit (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandyta";
	guild 		= GIL_BDT;
	id 			= 10401;
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
	EquipItem (self, ItMw_2h_Sld_Sword);
	
	CreateInvItems (self, ItMi_GoldChalice, 1);									
	CreateInvItems (self, ItMi_SilverRing, 1);									
	CreateInvItems (self, ItPo_Health_02, 2);									
	CreateInvItems (self, ItPo_Mana_01, 5);									
	// ------ Inventory ------
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart01, BodyTex_P, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10401;
};

FUNC VOID Rtn_Start_10401 ()
{
    TA_Stand_WP  	  (08,00,16,00,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
    TA_Stand_WP  	  (16,00,08,00,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");  
};
