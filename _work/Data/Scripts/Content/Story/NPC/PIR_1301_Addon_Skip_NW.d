INSTANCE PIR_1301_Addon_Skip_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Skip";
	guild 		= GIL_PIR;
	id 			= 1301;
	voice 		= 8;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: kommt später in der Addonworld nochmal vor.														
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_ShortSword2);
	EquipItem (self, ItRw_sld_bow); 
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Pirat01, BodyTex_N, ITAR_PIR_L_Addon);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1301;
};

FUNC VOID Rtn_Start_1301 ()
{	
	TA_Sit_Campfire	(05,00,20,00,"NW_CITY_PIRATESCAMP_04");
	TA_Sit_Campfire	(20,00,05,00,"NW_CITY_PIRATESCAMP_04");
};

FUNC VOID Rtn_Tot_1301 ()
{	
	TA_Sit_Campfire	(05,00,20,00,"TOT");
	TA_Sit_Campfire	(20,00,05,00,"TOT");
};

