
instance PAL_268_Udar  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Udar";
	guild 		= GIL_PAL;
	id 			= 268;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_OCMAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_NAILED;	//damit er nicht runterspringt
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Pal_Sword);
	EquipItem (self, ItRw_Crossbow_H_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal_Stone, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_268;
};

FUNC VOID Rtn_Start_268 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OC_CENTER_GUARD_03");
    TA_Stand_Guarding		(23,00,08,00,"OC_CENTER_GUARD_03");
};

