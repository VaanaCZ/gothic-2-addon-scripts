
instance DMT_1299_OberDementor_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schwarzmagier";	
	guild 		= GIL_DMT;
	id 			= 1299;
	voice 		= 09;	
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------								
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	//Joly: CreateInvItems (self, ItKe_LastDoorToUndeadDrgDI_MIS, 1);
	CreateInvItems (self, ItWr_LastDoorToUndeadDrgDI_MIS, 1);
	CreateInvItems (self, ItKe_ChestMasterDementor_MIS, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_MadPsi, BodyTex_N, ITAR_Xardas);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1299;
};

FUNC VOID Rtn_Start_1299 ()
{	
	TA_Stand_Dementor	(08,00,23,00,"DI_SCHWARZMAGIER");	
    TA_Stand_Dementor	(23,00,08,00,"DI_SCHWARZMAGIER");
};
