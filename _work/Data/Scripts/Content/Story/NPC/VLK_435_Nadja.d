
instance VLK_435_Nadja (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nadja";	
	guild 		= GIL_VLK;
	id 			= 435;
	voice 		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Hure, BodyTex_N, ITAR_VlkBabe_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_435;
};

FUNC VOID Rtn_Start_435 () // Nadja hält sich für gewöhnlich unten auf...
{	
	TA_Stand_Drinking	(05,00,17,00,"NW_PUFF_DANCE");
	TA_Dance			(17,00,21,00,"NW_PUFF_DANCE");
	TA_Stand_Drinking	(21,00,21,30,"NW_PUFF_DANCE");
    TA_Dance			(21,30,05,00,"NW_PUFF_DANCE");
};
FUNC VOID Rtn_Dance_435 ()// Aber wenn der Spieler zahlt, dann geht sie schon mal mit ihm nach oben
{	
	TA_Stand_ArmsCrossed 	(08,00,22,00,"NW_CITY_HABOUR_PUFF_NADJA");
    TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_HABOUR_PUFF_NADJA");
};
FUNC VOID Rtn_Smoke_435 () // 
{	
	TA_Smoke_Joint	(05,00,17,00,"NW_PUFF_DANCE");
	TA_Dance		(17,00,21,00,"NW_PUFF_DANCE");
	TA_Smoke_Joint	(21,00,21,30,"NW_PUFF_DANCE");
    TA_Dance		(21,30,05,00,"NW_PUFF_DANCE");
};
FUNC VOID Rtn_Tot_435 () // 
{	
	TA_Stand_Guarding (00,00,12,00,"TOT");
	TA_Stand_Guarding (12,00,00,00,"TOT");
};
