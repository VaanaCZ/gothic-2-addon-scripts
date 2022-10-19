//******************************************
//   Gorn in der Oldworld
//******************************************

INSTANCE PC_Fighter_OW (Npc_Default)	
{
	// ------ NSC ------
	name 		= "Gorn";
	guild 		= GIL_NONE;
	id 			= 3;
	voice 		= 12;
	flags       = NPC_FLAG_IMMORTAL;	//Joly:  nicht IMMORTAL																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter",Face_B_Gorn, BodyTex_B, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_3;
};

// sitzt in einer Zelle in der Burg im Minental
//-------------------------------------
FUNC VOID Rtn_Start_3()
{	
	TA_Sit_Campfire			(08,00,23,00,"OC_PRISON_CELL_03_SIT_GROUND");
    TA_Sit_Campfire			(23,00,08,00,"OC_PRISON_CELL_03_SIT_GROUND");
};

FUNC VOID Rtn_Free_3 ()
{	
	TA_Smalltalk			(08,00,23,00,"OC_MAGE_LIBRARY_IN");
	TA_Smalltalk			(23,00,08,00,"OC_MAGE_LIBRARY_IN");
};
FUNC VOID Rtn_Tot_3 ()
{	
	TA_Sit_Campfire			(08,00,23,00,"TOT");
    TA_Sit_Campfire			(23,00,08,00,"TOT");
};
