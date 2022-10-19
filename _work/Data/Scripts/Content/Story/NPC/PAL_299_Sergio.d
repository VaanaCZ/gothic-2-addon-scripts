instance PAL_299_Sergio (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sergio";
	guild 		= GIL_PAL;
	id 			= 299;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_2h_Pal_Sword);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ITKE_INNOS_MIS,1);//damit er das Tor öffnen kann
	CreateInvItems (self, ItPo_Health_02,4);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal_Erpresser, BodyTex_N, ITAR_PAL_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_299;
};

FUNC VOID Rtn_Start_299 ()
{
	TA_Pray_Innos  	(08,00,23,00,"NW_MONASTERY_CHAPELL_02");
    TA_Pray_Innos 	(23,00,08,00,"NW_MONASTERY_CHAPELL_02");	
};
FUNC VOID Rtn_WaitForPlayer_299 ()
{
	TA_Stand_Guarding  	(08,00,23,00,"NW_MONASTERY_PLACE_09");
    TA_Stand_Guarding 	(23,00,08,00,"NW_MONASTERY_PLACE_09");	
};
FUNC VOID Rtn_Train_299 ()
{
	TA_Pray_Innos  	  (07,00,23,00,"NW_MONASTERY_CHAPELL_02");
    TA_Pray_Innos 	  (23,00,05,00,"NW_MONASTERY_CHAPELL_02");	
	TA_Practice_Sword (05,00,07,00,"NW_MONASTERY_TRAIN_01");	
};
FUNC VOID Rtn_Wait_299 ()
{
	TA_Stand_Guarding  	(08,00,23,00,"NW_MONASTERY_CHAPELL_03");
    TA_Stand_Guarding 	(23,00,08,00,"NW_MONASTERY_CHAPELL_03");	
};
FUNC VOID Rtn_Guide_299()
{
	TA_Guide_Player  	(08,00,23,00,"NW_TO_PASS_01");
    TA_Guide_Player 	(23,00,08,00,"NW_TO_PASS_01");	
};
