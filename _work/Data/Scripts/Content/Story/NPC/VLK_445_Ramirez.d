
instance VLK_445_Ramirez (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ramirez"; 
	guild 		= GIL_OUT;
	id 			= 445;
	voice 		= 14;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Meisterdegen); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Tough_Okyl, BodyTex_N,ITAR_VLK_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_445;
};

FUNC VOID Rtn_Start_445()
{	
	TA_Stand_ArmsCrossed	(07,00,23,00,"NW_CITY_KANAL_ROOM_04_01");
    TA_Sit_Throne			(23,00,07,00,"NW_CITY_KANAL_ROOM_05_02");
};
