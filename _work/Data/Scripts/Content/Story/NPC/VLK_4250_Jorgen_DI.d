
//#############################################
//##
//##	Dracheninsel
//##
//#############################################

instance VLK_4250_Jorgen_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jorgen";
	guild 		= GIL_NONE;
	id 			= 42500;
	voice 		= 7;
	flags       = NPC_FLAG_IMMORTAL;	//Joly:letzter NSC, der stehen bleiben muß -> Letzter Dialog!!				//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivar ------
	aivar[AIV_PARTYMEMBER] = TRUE;	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);													
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------														
	EquipItem			(self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Tough_Skip, BodyTex_N, ITAR_VLK_L);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_42500;
};

FUNC VOID Rtn_Start_42500 ()
{
	TA_Stand_WP			(08,00,23,00,"SHIP_CREW_CAPTAIN");
	TA_Sleep			(23,00,08,00,"SHIP_IN_06");
};

