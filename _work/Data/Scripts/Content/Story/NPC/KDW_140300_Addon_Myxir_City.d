INSTANCE KDW_140300_Addon_Myxir_CITY (Npc_Default)
{
	// ------ NSC ------
	name 		= "Myxir";
	guild 		= GIL_KDW; 
	id 			= 140300;
	voice 		= 12;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_P_NormalBart_Cronos, BodyTex_P, ITAR_KDW_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_140300;
};

FUNC VOID Rtn_Start_140300 ()
{
	TA_Pray_Innos_FP		(05,05,20,10,	"NW_CITY_MERCHANT_TEMPLE_IN");
    TA_Stand_WP	  			(20,10,05,05,	"NW_CITY_MERCHANT_TEMPLE_FRONT");
};
