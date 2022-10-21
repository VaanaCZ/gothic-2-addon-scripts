
//******************************************
//   Gorn in der Oldworld als Drachenjäger
//******************************************

INSTANCE PC_Fighter_DJG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gorn";
	guild 		= GIL_DJG;
	id 			= 704;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_2h_Sld_Axe);
	EquipItem			(self, ItRw_Crossbow_M_01);	
	CreateInvItems (self, ItPo_Health_02, 6);									
	CreateInvItems (self, ItMi_OldCoin, 1);	//Joly: damit man seine Leiche findet, wenn er im Kampf stirbt!									

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter",Face_B_Gorn, BodyTex_B, ITAR_DJG_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_704;
};

FUNC VOID Rtn_PreStart_704 ()
{	
	TA_Stand_ArmsCrossed				(08,00,23,00,"OW_DJG_STARTCAMP_01");
    TA_Stand_ArmsCrossed				(23,00,08,00,"OW_DJG_STARTCAMP_01");
};

FUNC VOID Rtn_Start_704 ()
{	
	TA_Sit_Campfire				(08,00,23,00,"OW_DJG_ROCKCAMP_01");
    TA_Sit_Campfire				(23,00,08,00,"OW_DJG_ROCKCAMP_01");
};

FUNC VOID Rtn_RunToRockRuinBridge_704 ()
{	
	TA_RunToWP		(08,00,23,00,"LOCATION_19_01");
    TA_RunToWP		(23,00,08,00,"LOCATION_19_01");
};

FUNC VOID Rtn_Tot_704 ()
{	
	TA_Stand_ArmsCrossed				(08,00,23,00,"TOT");
    TA_Stand_ArmsCrossed				(23,00,08,00,"TOT");
};
