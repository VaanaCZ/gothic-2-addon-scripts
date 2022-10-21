
instance Pal_203_Lothar (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lothar";
	guild 		= GIL_PAL;
	id 			= 203;
	voice 		= 1;
	flags       = NPC_FLAG_IMMORTAL;	//Bitte nicht ändern er stirbt zum 3. Kapitel															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Pal_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_P_NormalBart_Nefarius, BodyTex_P, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_preStart_203;
};
FUNC VOID Rtn_PreStart_203 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_MAINSTREET_01_B"); 
    TA_Stand_Guarding	(23,00,08,00,"NW_CITY_MAINSTREET_01_B");	
};
FUNC VOID Rtn_Start_203 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_LOTHAR");
    TA_Stand_Guarding	(23,00,08,00,"NW_CITY_LOTHAR");	
};

FUNC VOID Rtn_Tot_203 ()
{
	TA_Sleep	(08,00,23,00,"TOT");
    TA_Sleep	(23,00,08,00,"TOT");	
};
