//#############################################
//##
//##	Neue Welt
//##
//#############################################

instance VLK_444_Jack (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jack"; 
	guild 		= GIL_VLK;
	id 			= 444;
	voice 		= 14;
	flags       = 0;	//Sterblich, optionaler Captain im Kapitel 5!																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1h_VLK_Sword);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_ImportantOld, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_444;
};

FUNC VOID Rtn_Start_444()
{	
	TA_Sit_Bench	(04,45,19,45,"NW_CITY_HABOUR_06_C");
    TA_Sit_Throne	(19,45,04,45,"NW_CITY_PUFF_THRONE");
};

FUNC VOID Rtn_Lighthouse_444()
{	
	TA_Sit_Throne	(08,00,20,00,"NW_LIGHTHOUSE_IN_03");
    TA_Sleep		(20,00,08,00,"NW_LIGHTHOUSE_IN_03"); 
};

FUNC VOID Rtn_WaitForShipCaptain_444 ()
{
	TA_Sit_Bench 			(08,00,20,00,"NW_WAITFOR_SHIP_CAPTAIN"); 
    TA_Sit_Bench 				(0,00,08,00,"NW_WAITFOR_SHIP_CAPTAIN");		
};

FUNC VOID Rtn_AllOnBoard_444 ()
{
	TA_Stand_WP			(08,00,23,00,"SHIP_CREW_CAPTAIN");
	TA_Sleep			(23,00,08,00,"SHIP_IN_06");
};
