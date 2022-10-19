INSTANCE VLK_4304_Addon_William (Npc_Default)
{
	// ------ NSC ------
	name 		= "William";
	guild 		= GIL_VLK;
	id 			= 4304;
	voice 		= 6;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	// ------ Inventory ------
	CreateInvItems (self,ITWr_Addon_William_01,1);//Joly: nicht austauschen oder umbenennen.
	CreateInvItems (self,ITKe_Lockpick,2);
	CreateInvItems (self,ITFo_Apple,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Homer, BodyTex_N, ITAR_BAU_L);	  
	Mdl_SetModelFatness	(self, 0.9);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4304;
};

FUNC VOID Rtn_Start_4304 ()
{	
	TA_Smalltalk 	(05,00,20,00,"ADW_ENTRANCE_RUIN2_02");
	TA_Smalltalk	(20,00,05,00,"ADW_ENTRANCE_RUIN2_02");
};
