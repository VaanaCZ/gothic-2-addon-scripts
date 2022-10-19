
instance VLK_4200_Buergerin (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	
	guild 		= GIL_VLK;
	id 			= 4200;
	voice 		= 17;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_PinkHair, BodyTex_N, ITAR_VlkBabe_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4200;
};

FUNC VOID Rtn_Start_4200 ()
{	
	TA_Smalltalk	(08,00,22,00,"NW_CITY_MAINSTREET_05_B");
    TA_Sleep		(22,00,08,00,"NW_CITY_UPTOWN_PATH_08"); //FIXME
};
