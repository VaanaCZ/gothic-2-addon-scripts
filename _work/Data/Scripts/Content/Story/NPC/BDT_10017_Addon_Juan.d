instance BDT_10017_Addon_Juan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Juan";
	guild 		= GIL_BDT;
	id 			= 10017;
	voice 		= 13;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Axe);
	
	// ------ Inventory ------
	CreateInvItems (self,ItMi_Addon_Steel_Paket,1);
	CreateInvItems (self,ItMi_Addon_Lennar_Paket,1);
	CreateInvItems (self,Itfo_Addon_Grog, 20);	
	B_CreateAmbientInv (self); 	
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_NormalBart01, BodyTex_L, ITAR_BDT_H);	
	Mdl_SetModelFatness	(self, - 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10017;
};
FUNC VOID Rtn_Start_10017()
{
	TA_Sit_Campfire 	(02,00,10,00,"ADW_SENAT_CAVE_SIT");
	TA_Sit_Campfire 	(10,00,02,00,"ADW_SENAT_CAVE_SIT");
};
