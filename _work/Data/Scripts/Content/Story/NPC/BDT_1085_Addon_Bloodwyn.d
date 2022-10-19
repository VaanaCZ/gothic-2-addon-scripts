instance BDT_1085_Addon_Bloodwyn (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bloodwyn";
	guild 		= GIL_BDT;
	id 			= 1085;
	voice 		= 4;//Stimme Lee
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	//aivars
	aivar[AIV_StoryBandit]	= TRUE; 	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_2h_Sld_Sword);
	
	// ------ Inventory ------
	CreateInvItems (self, ITKE_Addon_Bloodwyn_01,1);
	CreateInvItems (self, ItMi_Addon_Bloodwyn_Kopf,1);

	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bloodwyn, BodyTex_N, ITAR_Thorus_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1085;
};

FUNC VOID Rtn_Start_1085 ()
{
    TA_Stand_WP  	  (08,00,16,00,"BL_RAVEN_09");
    TA_Stand_WP  	  (16,00,08,00,"BL_RAVEN_09");  
};
FUNC VOID Rtn_Mine_1085 ()
{
    TA_Stand_WP  	  (08,00,16,00,"ADW_MINE_TO_MC_01");
    TA_Stand_WP  	  (16,00,08,00,"ADW_MINE_TO_MC_01");  
};
FUNC VOID Rtn_Gold_1085 ()
{
    TA_Stand_WP  	  (08,00,16,00,"ADW_MINE_MC_07");
    TA_Stand_WP  	  (16,00,08,00,"ADW_MINE_MC_07");  
};
