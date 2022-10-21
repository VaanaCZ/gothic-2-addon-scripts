INSTANCE NONE_ADDON_111_Quarhodron (Npc_Default)
{
	// ------ NSC ------
	name 		= "Quarhodron";
	guild 		= GIL_NONE;
	id 			= 111;
	voice 		= 11;
	flags       = NPC_FLAG_GHOST|NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	aivar[AIV_NoFightParker] 		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	//B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic",Face_N_Corristo , BodyTex_N, ITAR_Raven_Addon);		

	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_111;
};

FUNC VOID Rtn_Start_111 ()
{	
	TA_Ghost  	(08,00,23,00,"ADW_ANCIENTGHOST"); 
    TA_Ghost	(23,00,08,00,"ADW_ANCIENTGHOST");
};

FUNC VOID Rtn_TOT_111 ()
{	
	TA_Ghost  	(08,00,23,00,"TOT"); 
    TA_Ghost	(23,00,08,00,"TOT");
};
