
instance Mil_313_Boltan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Boltan";	
	guild 		= GIL_MIL;
	id 			= 313;
	voice 		= 5;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal01, BodyTex_B, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_313;
};

FUNC VOID Rtn_Start_313 ()
{	
	TA_Sit_Chair			(06,55,21,00,"NW_CITY_HABOUR_KASERN_PRISON_SIT");
  	TA_Stand_Guarding		(21,00,06,55,"NW_CITY_HABOUR_KASERN_PRISON_02");
};
