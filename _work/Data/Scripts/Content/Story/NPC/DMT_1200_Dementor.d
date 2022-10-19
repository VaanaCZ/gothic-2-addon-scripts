
instance DMT_1200_Dementor (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Dementor;	
	guild 		= GIL_DMT;
	id 			= 1200;
	voice 		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------								
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_MadPsi, BodyTex_N, ITAR_Dementor);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1200;
};

FUNC VOID Rtn_Start_1200 ()
{	
	TA_Stand_Dementor 	(08,00,23,00,"NW_TROLLAREA_PATH_47");	//Joly: DMT an der Brücke bei Novizenchace Kapitel 3
    TA_Stand_Dementor	(23,00,08,00,"NW_TROLLAREA_PATH_47");
};
