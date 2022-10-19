
instance VLK_438_Alrik (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alrik"; 
	guild 		= GIL_NONE;
	id 			= 438;
	voice 		= 9;
	flags       = 0;																
	npctype		= NPCTYPE_FRIEND; //plündert nicht!!! (und ein Freischlag)
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy] = TRUE;	
	aivar[AIV_ToughGuyNewsOverride] = TRUE; 

	aivar[AIV_MM_FollowTime] = 1000;
	aivar[AIV_FightDistCancel] = 600;

	aivar[AIV_MaxDistToWp]			= 300;
	aivar[AIV_OriginalFightTactic] 	= FAI_HUMAN_NORMAL;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem(self, ItMw_1h_Bau_Mace);
		
	// ------ Inventory ------
	//B_CreateAmbientInv 	(self); //NICHT, Alrik soll nicht mehr Gold haben!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Bloodwyn, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,20);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_438;
};

FUNC VOID Rtn_Start_438() //NICHT ÄNDERN --> DIALOG!
{	
	TA_Stand_Guarding	(10,55,19,15,"NW_CITY_PATH_HABOUR_16_01");
	TA_Stand_Drinking	(19,15,03,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sit_Bench		(03,30,10,55,"NW_CITY_PATH_HABOUR_16_01");
};
