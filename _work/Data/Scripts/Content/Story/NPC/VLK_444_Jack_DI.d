
//#############################################
//##
//##	Dracheninsel
//##
//#############################################

instance VLK_444_Jack_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jack"; 
	guild 		= GIL_VLK;
	id 			= 4440;
	voice 		= 14;
	flags       = NPC_FLAG_IMMORTAL;	//letzter NSC, der stehen bleiben muß -> Letzter Dialog!!				//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;

	// ------ aivar ------
	aivar[AIV_PARTYMEMBER] = TRUE;		
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1h_VLK_Sword);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_ImportantOld, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4440;
};

FUNC VOID Rtn_Start_4440()
{	
	TA_Stand_WP			(08,00,23,00,"SHIP_CREW_CAPTAIN");
	TA_Sleep			(23,00,08,00,"SHIP_IN_06");
};

FUNC VOID Rtn_OrkSturmDI_4440()
{	
	TA_Stand_WP			(08,00,23,00,"SHIP_DECK_03");
	TA_Stand_WP			(23,00,08,00,"SHIP_DECK_03");
};

