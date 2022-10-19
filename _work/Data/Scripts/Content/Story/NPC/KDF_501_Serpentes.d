INSTANCE KDF_501_Serpentes (Npc_Default)
{
	// ------ NSC ------
	name 		= "Serpentes";
	guild 		= GIL_KDF;
	id 			= 501;
	voice 		= 10;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_PSIONIC",Face_N_ImportantGrey , BodyTex_N, ITAR_KDF_H);		
	Mdl_SetModelFatness	(self, -2);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_501;
};

FUNC VOID Rtn_Start_501 ()
{	
	TA_Sit_Throne	(08,00,23,00,"NW_MONASTERY_THRONE_02");
    TA_Sit_Throne	(23,00,08,00,"NW_MONASTERY_THRONE_02");
};
