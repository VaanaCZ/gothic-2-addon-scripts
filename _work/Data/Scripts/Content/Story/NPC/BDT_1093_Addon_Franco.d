instance BDT_1093_Addon_Franco (Npc_Default)
{
	// ------ NSC ------
	name 		= "Franko";
	guild 		= GIL_BDT;
	id 			= 1093;
	voice 		= 8;
	flags      	= 0;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------- AIVAR -----
	AIVAR[AIV_StoryBandit] 	= TRUE;
	aivar[AIV_NewsOverride] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Mil_Sword);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	//CreateInvItems (self, ItAm_Addon_Franco,1); siehe oben
	CreateInvItems (self, ItMi_GoldNugget_Addon,7);
	CreateInvItems (self, ItAm_Addon_Franco,1);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_BDT_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1093;
};
FUNC VOID Rtn_Start_1093 ()
{
   TA_Stand_Guarding   (06,00,20,00,"ADW_PATH_TO_BL_02");
   TA_Stand_Guarding   (20,00,00,00,"BANDIT_FIGHT");
   TA_Stand_Eating     (00,00,03,00,"BANDIT_FIGHT");
   TA_Stand_Drinking   (03,00,06,00,"BANDIT_FIGHT");   	
};
