INSTANCE KDF_504_Parlan (Npc_Default)
{
	// ------ NSC ------
	name 		= "Parlan";
	guild 		= GIL_KDF;
	id 			= 504;
	voice 		= 5;
	flags       = NPC_FLAG_IMMORTAL;		//Joly:  IMMORTAL wegen Petzmaster
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_Corristo, BodyTex_N, ITAR_KDF_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_504;
};

FUNC VOID Rtn_Start_504 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_MONASTERY_PLACE_03");
    TA_Stand_Guarding	(23,00,08,00,"NW_MONASTERY_PLACE_03");
};
