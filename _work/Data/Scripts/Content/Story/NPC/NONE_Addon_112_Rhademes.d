INSTANCE NONE_ADDON_112_Rhademes (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rhademes";
	guild 		= GIL_NONE;
	id 			= 112;
	voice 		= 3;
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

	protection	[PROT_POINT]		=	99999999;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	//B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Ske_Head", 0, BodyTex_N, ITAR_Raven_Addon);
		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_112;
};

FUNC VOID Rtn_Start_112 ()
{	
	TA_GhostWusel (08,00,20,00,"ADW_ADANOSTEMPEL_RHADEMES_02");
    TA_GhostWusel (20,00,08,00,"ADW_ADANOSTEMPEL_RHADEMES_02");
};
FUNC VOID Rtn_TOT_112 ()
{	
	TA_Ghost  	(08,00,20,00,"TOT"); 
    TA_Ghost	(20,00,08,00,"TOT");
};
