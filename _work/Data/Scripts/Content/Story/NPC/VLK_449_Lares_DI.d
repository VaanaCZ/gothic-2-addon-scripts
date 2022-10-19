//#############################################
//##
//##	Dracheninsel
//##
//############################################

instance VLK_449_Lares_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lares"; 
	guild 		= GIL_NONE;
	id 			= 4490;
	voice 		= 9;	//Joly: hat zu viel mit Diego zu tun, als dass man ihm Diegos Stimme gibt: Deswegen Stimme 8
	flags       = 0;																
	npctype		= NPCTYPE_FRIEND;

	// ------ aivar ------
	aivar[AIV_PARTYMEMBER] = TRUE;		
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_SLD_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Lares, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4490;
};
 
FUNC VOID Rtn_Start_4490()
{	
	TA_Smalltalk			(08,00,23,00,"SHIP_CREW_05");
	TA_Smalltalk			(23,00,08,00,"SHIP_CREW_05");
};
 
FUNC VOID Rtn_SittingShipDI_4490()
{	
	TA_Sit_Bench 	(08,00,23,00,"SHIP_CREW_04");
	TA_Sit_Bench 	(23,00,08,00,"SHIP_CREW_04");
};

