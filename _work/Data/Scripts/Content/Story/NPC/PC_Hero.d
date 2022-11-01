instance PC_Hero (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Já";
	guild		= GIL_NONE;
	id			= 0;
	voice		= 15;
	level		= 0;
	Npctype		= NPCTYPE_MAIN;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= 0;
	exp_next		= 500;
	lp				= 0;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 10;
	attribute[ATR_DEXTERITY] 		= 10;
	attribute[ATR_MANA_MAX] 		= 10;
	attribute[ATR_MANA] 			= 10;
	attribute[ATR_HITPOINTS_MAX]	= 40;
	attribute[ATR_HITPOINTS] 		= 40;
	
	// ------ visuals ------
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, NO_ARMOR);
	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 9,				0,			"Hum_Head_Pony", 	FACE_N_Player,	0, 			NO_ARMOR);
	
	// ------ Kampf-Talente ------
	B_SetFightSkills 	(self, 10); 
};


// ***********
// Test-Heroes
// ***********

instance PC_L10 (NPC_DEFAULT) //Mitte 2. Kapitel (Anfang der OW)
{
	// ------ SC ------
	name 		= "Já";
	guild		= GIL_MIL;
	id			= 0;
	voice		= 15;
	level		= 10;
	Npctype		= NPCTYPE_MAIN;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= (500*((slf.level+1)/2)*(slf.level+1));
	exp_next		= (500*((slf.level+2)/2)*(slf.level+1));
	lp				= 0;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 83; //10+50+23 (20% von 115) //80LP
	attribute[ATR_DEXTERITY] 		= 32; //10+0+22  (20% von 110)
	attribute[ATR_MANA_MAX] 		= 64; //10+0+54  (20% von 234)
	attribute[ATR_MANA] 			= 64;
	attribute[ATR_HITPOINTS_MAX]	= 148;    
	attribute[ATR_HITPOINTS] 		= 148;
	
	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, ITAR_MIL_L);
	
	// ------ Kampf-Talente ------
	B_AddFightSkill (self, NPC_TALENT_1H, 		30);
	B_AddFightSkill (self, NPC_TALENT_2H, 		10);   
	B_AddFightSkill (self, NPC_TALENT_BOW, 		10);
	B_AddFightSkill (self, NPC_TALENT_CROSSBOW,	10);
	
	CreateInvItems (self, itmi_gold, 500);
	CreateInvItems (self, itrw_arrow, 100);
	
	EquipItem (self, ItMw_Nagelkeule2);
	EquipItem (self, ItRw_Bow_L_01);
};

instance PC_L20 (NPC_DEFAULT) //Anfang 2. Kapitel - Ende der ADW
{
	// ------ SC ------
	name 		= "Já";
	guild		= GIL_MIL;
	id			= 0;
	voice		= 15;
	level		= 20;
	Npctype		= NPCTYPE_MAIN;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= (500*((slf.level+1)/2)*(slf.level+1));
	exp_next		= (500*((slf.level+2)/2)*(slf.level+1));
	lp				= 40; //für Lockpick, SteintafelIII
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 106; //10+50+46 (40% von 115) //80LP
	attribute[ATR_DEXTERITY] 		= 54;  //10+0+44  (40% von 110)  
	attribute[ATR_MANA_MAX] 		= 118; //10+0+108 (40% von 234)
	attribute[ATR_MANA] 			= 35;
	attribute[ATR_HITPOINTS_MAX]	= 280;    
	attribute[ATR_HITPOINTS] 		= 280;
	
	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, ITAR_Ranger_Addon);
	
	// ------ Kampf-Talente ------
	B_AddFightSkill (self, NPC_TALENT_1H, 		60); //80LP	
	B_AddFightSkill (self, NPC_TALENT_2H, 		30);	
	B_AddFightSkill (self, NPC_TALENT_BOW, 		10);
	B_AddFightSkill (self, NPC_TALENT_CROSSBOW,	10);
	
	CreateInvItems (self, itmi_gold, 1000);
	CreateInvItems (self, itrw_arrow, 100);
	CreateInvItems (self, itrw_bolt, 100);
	
	EquipItem (self, ItMw_Rubinklinge);	
	EquipItem (self, ItRw_Crossbow_M_02);	
	
	CreateInvItems (self, ItRu_PalLight, 1);
	CreateInvItems (self, ItRu_PalLightHeal, 1);
	CreateInvItems (self, ItRu_PalHolyBolt, 1);
};

instance PC_L40 (NPC_DEFAULT) //Anfang 4. Kapitel (Drachenjagd)
{
	// ------ SC ------
	name 		= "Já";
	guild		= GIL_PAL;
	id			= 0;
	voice		= 15;
	level		= 40;
	Npctype		= NPCTYPE_MAIN;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= (500*((slf.level+1)/2)*(slf.level+1));
	exp_next		= (500*((slf.level+2)/2)*(slf.level+1));
	lp				= 60; //für Lockpick, SteintafelIII, PermSTR
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 159;  //10+80+69 (60% von 115) //170LP
	attribute[ATR_DEXTERITY] 		= 76;   //10+0+66  (60% von 110)       
	attribute[ATR_MANA_MAX] 		= 172;	//10+0+162 (60% von 234) 
	attribute[ATR_MANA] 			= 172;	
	attribute[ATR_HITPOINTS_MAX]	= 520;    
	attribute[ATR_HITPOINTS] 		= 520;	
	
	// ------ visuals ------
	B_SetNpcVisual 	(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, ITAR_PAL_M);
	
	// ------ Kampf-Talente ------
	B_AddFightSkill (self, NPC_TALENT_1H, 		90); //170LP
	B_AddFightSkill (self, NPC_TALENT_2H, 		60); 
	B_AddFightSkill (self, NPC_TALENT_BOW, 		10); 
	B_AddFightSkill (self, NPC_TALENT_CROSSBOW,	10); 
	
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK, 		1);
	
	CreateInvItems (self, itmi_gold, 2000);
	CreateInvItems (self, itrw_bolt, 100);
	
	EquipItem (self, ItMw_1H_Blessed_02); 	
	EquipItem (self, ItRw_Crossbow_M_02);	
	
	CreateInvItems (self,ItKe_Lockpick,10);
	CreateInvItems (self,ItMi_Flask,2);
	CreateInvItems (self, ItPo_Health_02, 10);
	CreateInvItems (self, ItPo_Speed, 5);
	CreateInvItems (self,ItLsTorch,50);
	
	CreateInvItems (self, ItRu_PalLight, 1);
	CreateInvItems (self, ItRu_PalLightHeal, 1);
	CreateInvItems (self, ItRu_PalHolyBolt, 1);
	CreateInvItems (self, ItRu_PalMediumHeal, 1);
	CreateInvItems (self, ItRu_PalRepelEvil, 1);
};

instance PC_L60 (NPC_DEFAULT) //Anfang 6. Kapitel (Dracheninsel)
{
	// ------ SC ------
	name 		= "Já";
	guild		= GIL_PAL;
	id			= 0;
	voice		= 15;
	level		= 60;
	Npctype		= NPCTYPE_MAIN;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= (500*((slf.level+1)/2)*(slf.level+1));
	exp_next		= (500*((slf.level+2)/2)*(slf.level+1));
	lp				= 60; //60; für Lockpick, SteintafelIII, PermSTR
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 228; //10+126+92 (80% von 115) //370LP
	attribute[ATR_DEXTERITY] 		= 98;  //10+0+88  (80% von 110)         
	attribute[ATR_MANA_MAX] 		= 234; //10+0+224 (80% von 234)        
	attribute[ATR_MANA] 			= 234;  
	attribute[ATR_HITPOINTS_MAX]	= 760;    
	attribute[ATR_HITPOINTS] 		= 760;	
	
	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, ITAR_PAL_H);
	
	// ------ Kampf-Talente ------
	B_AddFightSkill (self, NPC_TALENT_1H, 		90); //170LP
	B_AddFightSkill (self, NPC_TALENT_2H, 		60);
	B_AddFightSkill (self, NPC_TALENT_BOW, 		10);
	B_AddFightSkill (self, NPC_TALENT_CROSSBOW,	10);
	
	CreateInvItems (self, itmi_gold, 3000);
	CreateInvItems (self, itrw_bolt, 100);
	
	EquipItem (self, ItMw_1H_Blessed_03);
	EquipItem (self, ItRw_Crossbow_M_02);	
	
	CreateInvItems (self, ItRu_PalLight, 1);
	CreateInvItems (self, ItRu_PalLightHeal, 1);
	CreateInvItems (self, ItRu_PalHolyBolt, 1);
	CreateInvItems (self, ItRu_PalMediumHeal, 1);
	CreateInvItems (self, ItRu_PalRepelEvil, 1);
	CreateInvItems (self, ItRu_PalFullHeal, 1);
	CreateInvItems (self, ItRu_PalDestroyEvil, 1);
};







// *********
// E3 Heroes
// *********

instance PC_E3Mage (NPC_DEFAULT) //PC_E3Mage
{
	// ------ SC ------
	name 		= "Já";
	guild		= GIL_KDF;
	id			= 0;
	voice		= 15;
	level		= 31;
	Npctype		= NPCTYPE_MAIN;

	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp			= 248000;
	exp_next	= 264000;
	lp			= 0;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 50;
	attribute[ATR_DEXTERITY] 		= 50;    
	attribute[ATR_MANA_MAX] 		= 200;
	attribute[ATR_MANA] 			= 200;
	attribute[ATR_HITPOINTS_MAX]	= 500;    
	attribute[ATR_HITPOINTS] 		= 500;
	
	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, ITAR_KDF_H);
	
	// ------ Kampf-Talente ------
	B_AddFightSkill (self, NPC_TALENT_1H, 		40);
	B_AddFightSkill (self, NPC_TALENT_2H, 		30);
	B_AddFightSkill (self, NPC_TALENT_BOW, 		20);	
	B_AddFightSkill (self, NPC_TALENT_CROSSBOW,	10);
	
	// ------ sonstige Talente ------
		
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE, 			6);
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK, 		1); //hängt ab von DEX (auf Programmebene)
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK, 			1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_ACROBAT, 		0);
	
	//Npc_SetTalentSkill	(self, NPC_TALENT_PICKPOCKET, 		1);	//hängt ab von DEX (auf Scriptebene)
	//Npc_SetTalentSkill	(self, NPC_TALENT_SMITH, 			1);
	Npc_SetTalentSkill	(self, NPC_TALENT_RUNES, 			1);
	Npc_SetTalentSkill	(self, NPC_TALENT_ALCHEMY, 			1);
	Npc_SetTalentSkill	(self, NPC_TALENT_TAKEANIMALTROPHY,	1);
	
	PLAYER_TALENT_ALCHEMY[POTION_Health_01]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Health_02]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Health_03]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Mana_01]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Mana_02]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Mana_03]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Speed]			= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Perm_STR]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health]	= TRUE; 
	/*
	PLAYER_TALENT_SMITH[WEAPON_Common] 			= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_02]	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;
	*/
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] 			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws]			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] 				= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] 			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] 		= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] 		= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] 			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] 			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] 		= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] 	= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] 	= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] 		= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] 		= TRUE;
	
	PLAYER_TALENT_RUNES[SPL_LIGHT] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_Firebolt] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Icebolt] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_LightHeal] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] 	= TRUE;
	PLAYER_TALENT_RUNES[SPL_InstantFireball] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_Zap] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonWolf] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_WINDFIST] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Sleep] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_MediumHeal] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_LightningFlash] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeFireball] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonSkeleton] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_Fear] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_IceCube] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeZap] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGolem] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_DestroyUndead] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_Pyrokinesis] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_Firestorm] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_IceWave] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonDemon] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_FullHeal] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Firerain] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_BreathOfDeath] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_MassDeath] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_Shrink] 				= TRUE;
	
	// ------ Inventory -------
	EquipItem (self, ItMw_1h_MISC_Sword);
	
	EquipItem (self, ItAm_Mana_01);
	
	EquipItem (self, ItRu_Light);
	EquipItem (self, ItRu_InstantFireball);
	EquipItem (self, ItRu_IceCube);
	EquipItem (self, ItRu_FullHeal);
	EquipItem (self, ItRu_FireRain);
	EquipItem (self, ItRu_LightningFlash);
	EquipItem (self, ItRu_Shrink);
	
	CreateInvItems (self, itmi_gold, 100);
	
	CreateInvItems (self, itRu_MassDeath, 1);
	CreateInvItems (self, itRu_ArmyOfDarkness, 1);
	CreateInvItems (self, itRu_SumGol, 1);
	
	CreateInvItems (self, itSc_TrfSheep, 5);
	CreateInvItems (self, itSc_TrfWolf, 5);
	CreateInvItems (self, itSc_TrfDragonSnapper, 3);
	
	CreateInvItems (self, ItMi_Flask, 10);
	CreateInvItems (self, ItMi_RuneBlank, 10);
	
	CreateInvItems (self, ItMi_Sulfur, 10);
	CreateInvItems (self, ItMi_Quartz, 10);
	CreateInvItems (self, ItMi_Pitch, 10);
	CreateInvItems (self, ItMi_Rockcrystal, 10);
	CreateInvItems (self, ItMi_Aquamarine, 10);
	CreateInvItems (self, ItMi_HolyWater, 10);
	CreateInvItems (self, ItMi_Coal, 10);
	CreateInvItems (self, ItMi_DarkPearl, 10);
	
	CreateInvItems (self, ItPl_SwampHerb, 10);
	CreateInvItems (self, ItPl_Mana_Herb_01, 10);
	CreateInvItems (self, ItPl_Mana_Herb_02, 10);
	CreateInvItems (self, ItPl_Mana_Herb_03, 10);
	CreateInvItems (self, ItPl_Health_Herb_01, 10);
	CreateInvItems (self, ItPl_Health_Herb_02, 10);
	CreateInvItems (self, ItPl_Health_Herb_03, 10);
	CreateInvItems (self, ItPl_Dex_Herb_01, 10);
	CreateInvItems (self, ItPl_Strength_Herb_01, 10);
	CreateInvItems (self, ItPl_Speed_Herb_01, 10);
	CreateInvItems (self, ItPl_Mushroom_01, 10);
	CreateInvItems (self, ItPl_Mushroom_02, 10);
	CreateInvItems (self, ItPl_Forestberry, 10);
	CreateInvItems (self, ItPl_Blueplant, 10);
	CreateInvItems (self, ItPl_Planeberry, 10);
	CreateInvItems (self, ItPl_Temp_Herb, 10);
	CreateInvItems (self, ItPl_Perm_Herb, 10);
	
	CreateInvItems (self, ItPo_Mana_01, 10);
	CreateInvItems (self, ItPo_Mana_02, 5);
	CreateInvItems (self, ItPo_Mana_03, 1);
	
	CreateInvItems (self, ItPo_Health_01, 10);
	CreateInvItems (self, ItPo_Health_02, 5);
	CreateInvItems (self, ItPo_Health_03, 1);
	
	CreateInvItems (self, ItPo_Speed, 5);
};

instance PC_E3Paladin (NPC_DEFAULT) //PC_E3Paladin
{
	// ------ SC ------
	name 		= "Já";
	guild		= GIL_PAL;
	id			= 0;
	voice		= 15;
	level		= 31;
	Npctype		= NPCTYPE_MAIN;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp			= 248000;
	exp_next	= 264000;
	lp			= 0;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 100;
	attribute[ATR_DEXTERITY] 		= 100;    
	attribute[ATR_MANA_MAX] 		= 50;
	attribute[ATR_MANA] 			= 50;
	attribute[ATR_HITPOINTS_MAX]	= 500;    
	attribute[ATR_HITPOINTS] 		= 500;
	
	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, ITAR_PAL_H);
	
	// ------ Kampf-Talente ------
	B_AddFightSkill (self, NPC_TALENT_1H, 		100);
	B_AddFightSkill (self, NPC_TALENT_2H, 		90);
	B_AddFightSkill (self, NPC_TALENT_BOW, 		80);	
	B_AddFightSkill (self, NPC_TALENT_CROSSBOW,	70);
	
	// ------ sonstige Talente ------
		
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE, 			0);
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK, 		1); //hängt ab von DEX (auf Programmebene)
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK, 			1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_ACROBAT, 		0);
	
	//Npc_SetTalentSkill	(self, NPC_TALENT_PICKPOCKET, 		1);	//hängt ab von DEX (auf Scriptebene)
	Npc_SetTalentSkill	(self, NPC_TALENT_SMITH, 			1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_RUNES, 			1);
	//Npc_SetTalentSkill	(self, NPC_TALENT_ALCHEMY, 			1);
	Npc_SetTalentSkill	(self, NPC_TALENT_TAKEANIMALTROPHY,	1);
	/*
	PLAYER_TALENT_ALCHEMY[POTION_Health_01]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Health_02]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Health_03]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Mana_01]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Mana_02]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Mana_03]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Speed]			= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Perm_STR]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana]		= TRUE; 
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health]	= TRUE; 
	*/
	PLAYER_TALENT_SMITH[WEAPON_Common] 			= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_02]	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] 	= TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] 	= TRUE;
	
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] 			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws]			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] 				= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] 			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] 		= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] 		= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] 			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] 			= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] 		= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] 	= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] 	= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] 		= TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] 		= TRUE;
	/*
	PLAYER_TALENT_RUNES[SPL_LIGHT] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_Firebolt] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Icebolt] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_LightHeal] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] 	= TRUE;
	PLAYER_TALENT_RUNES[SPL_InstantFireball] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_Zap] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonWolf] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_WINDFIST] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Sleep] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_MediumHeal] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_LightningFlash] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeFireball] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonSkeleton] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_Fear] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_IceCube] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeZap] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGolem] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_DestroyUndead] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_Pyrokinesis] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_Firestorm] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_IceWave] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonDemon] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_FullHeal] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Firerain] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_BreathOfDeath] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_MassDeath] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] 		= TRUE;
	PLAYER_TALENT_RUNES[SPL_Shrink] 				= TRUE;
	*/
	// ------ Inventory -------
	EquipItem (self, ItMw_2h_Pal_Sword);
	EquipItem (self, ItRw_Bow_H_01);
	
	//CreateInvItems (self, ItMw_2h_Pal_Sword, 1);
	//CreateInvItems (self, ItMw_2H_Axe_H_03, 1);	
	CreateInvItems (self, ItRw_Crossbow_H_01, 1);	
	
	CreateInvItems (self, ItRw_Arrow, 1000);
	CreateInvItems (self, ItRw_Bolt, 1000);
			
	EquipItem (self, ItAm_Strg_01);
	
	EquipItem (self, ItRu_PalMediumHeal);
	EquipItem (self, ItRu_PalRepelEvil);
	
	CreateInvItems (self, itmi_gold, 100);
	
	CreateInvItems (self, itmi_nugget, 50);
	CreateInvItems (self, itmiswordraw, 10);
	CreateInvItems (self, itat_dragonblood, 10);
	
	CreateInvItems (self, itsc_InstantFireball, 10);
	CreateInvItems (self, itSc_TrfSheep, 5);
	CreateInvItems (self, itSc_TrfWolf, 5);
	CreateInvItems (self, itSc_TrfDragonSnapper, 3);
	
	CreateInvItems (self, ItMi_Flask, 10);
	CreateInvItems (self, ItMi_RuneBlank, 10);
	
	CreateInvItems (self, ItPo_Mana_01, 10);
	CreateInvItems (self, ItPo_Mana_02, 5);
	CreateInvItems (self, ItPo_Mana_03, 1);
	
	CreateInvItems (self, ItPo_Health_01, 10);
	CreateInvItems (self, ItPo_Health_02, 5);
	CreateInvItems (self, ItPo_Health_03, 1);
	
	CreateInvItems (self, ItPo_Speed, 5);
};
//---------------------ADDON------------------------------------
instance PC_Bandit (NPC_DEFAULT)
{
	// ------ SC ------
	name 		= "Já";
	guild		= GIL_NONE;
	id			= 0;
	voice		= 15;
	level		= 10;
	Npctype		= NPCTYPE_MAIN;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	// ------ XP Setup ------
	exp				= 0;
	exp_next		= 500;
	lp				= 0;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 60;
	attribute[ATR_DEXTERITY] 		= 10;     
	attribute[ATR_MANA_MAX] 		= 10;
	attribute[ATR_MANA] 			= 10;
	attribute[ATR_HITPOINTS_MAX]	= 200;
	attribute[ATR_HITPOINTS] 		= 200;
	
	//--------Talente---------------
	
	PLAYER_TALENT_SMITH [WEAPON_1H_Harad_01] = TRUE;
	PLAYER_TALENT_SMITH [WEAPON_1H_Harad_02] = TRUE;
	PLAYER_TALENT_SMITH [WEAPON_1H_Harad_03] = TRUE;
	PLAYER_TALENT_SMITH [WEAPON_1H_Harad_04] = TRUE;
	

	Npc_SetTalentSkill	(self, NPC_TALENT_PICKPOCKET, 		1);
	B_AddFightSkill 	(self, NPC_TALENT_1H, 		60);
	// ------ visuals ------
	//B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", FACE_N_Player, BodyTex_N, NO_ARMOR);
	
	Mdl_SetVisual (self,"HUMANS.MDS");
	// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
	Mdl_SetVisualBody (self, "hum_body_Naked0", 9,				0,			"Hum_Head_Pony", 	FACE_N_Player,	0, 			ITAR_Thorus_Addon);
	
	
	//-------------items------------------
	EquipItem (self, ItMw_BeliarWeapon_1H_02);
	
	//---Values-----
	CreateInvItems (self, Itmi_Gold, 1000);
	CreateInvItems (self, ItMi_GoldNugget_Addon,5);
	CreateInvItems (self, ItMw_BeliarWeapon_1H_01,1);
	
	CreateInvItems (self, ItMw_1h_Vlk_Dagger,1);
	CreateInvItems (self, ItMw_1H_Mace_L_01,1);
	//---Amulette und Kram-----
	/*
	CreateInvItems (self, ITAm_Addon_Health,1);
	CreateInvItems (self, ITRi_Addon_Health_01,1);
	CreateInvItems (self, ITRi_Addon_Health_02,1);
	
	CreateInvItems (self, ITAm_Addon_Mana,1);
	CreateInvItems (self, ITRi_Addon_Mana_01,1);
	CreateInvItems (self, ITRi_Addon_Mana_02,1);
	*/
	CreateInvItems (self, ITAm_Addon_STR,1);
	CreateInvItems (self, ITRi_Addon_STR_01,1);
	CreateInvItems (self, ITRi_Addon_STR_02,1);
	
	CreateInvItems (self, ITAR_Leather_L,1);
	CreateInvItems (self, ITAR_SLD_L,1);
	CreateInvItems (self, ITAR_SLD_M,1);
	CreateInvItems (self, ITAR_SLD_H,1);
	CreateInvItems (self, ITAR_MIL_M,1);
	CreateInvItems (self, ITAR_KDF_H,1);
	CreateInvItems (self, ITAR_NOV_L,1);
	
	/*
	CreateInvItems (self,ItRw_Special_Arrow,1000);
	CreateInvItems (self,ItRw_SecialBow,1);
	*/
	
	CreateInvItems (self,ItBE_Addon_Leather_01,1);

	
	CreateInvItems (self,ItBE_Addon_SLD_01,1);
	
	
	CreateInvItems (self,ItBE_Addon_MIL_01,1);
	
	CreateInvItems (self,ItBE_Addon_MC,1);
	CreateInvItems (self,ItBE_Addon_KDF_01,1);

	CreateInvItems (self,ItBE_Addon_NOV_01,1);
	
	
	CreateInvItems (self, ItMi_Addon_Joint_01,2);
	CreateInvItems (self, ItPo_Addon_Geist_01,2);
	CreateInvItems (self, ItPo_Addon_Geist_02,2);
	
	CreateInvItems (self, ItWr_Addon_BookXP250,1);
	CreateInvItems (self, ItWr_Addon_BookXP500,1);
	CreateInvItems (self, ItWr_Addon_BookXP1000,1);
	CreateInvItems (self, ItWr_Addon_BookLP2,1);
	CreateInvItems (self, ItWr_Addon_BookLP3,1);
	CreateInvItems (self, ItWr_Addon_BookLP5,1);
	CreateInvItems (self, ItWr_Addon_BookLP8,1);
		
	//Schnaps und Zutaten-----
	CreateInvItems (self, ItFo_Addon_Schlafhammer,1);
	CreateInvItems (self, ItFo_Addon_LousHammer,1);
	CreateInvItems (self, ItFo_Booze,5);
	CreateInvItems (self, itmw_2h_Axe_L_01,1);
	CreateInvItems (self, ItPl_SwampHerb,10);
	CreateInvItems (self, ItPl_Beet,10);
	CreateInvItems (self, ItAt_SharkTeeth,10);
	CreateInvItems (self, ItFo_Addon_Rum,20);

};
