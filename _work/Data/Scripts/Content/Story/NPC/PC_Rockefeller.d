INSTANCE PC_Rockefeller(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "Rockefeller";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE;
	level			= 100;
	voice			= 15;
	id				= 0;
	
	//--------- abilities --------
	attribute[ATR_STRENGTH] =		1000;
	attribute[ATR_DEXTERITY] =		1000;
	attribute[ATR_MANA_MAX] =		1000;
	attribute[ATR_MANA] =			1000;
	attribute[ATR_HITPOINTS_MAX] =	1000;
	attribute[ATR_HITPOINTS] =		1000;
	
	exp				= (500*((level+1)/2)*(level+1));
	exp_next		= (500*((level+2)/2)*(level+1));

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex		Skin-Color	Head-MMS    		Head-Tex		Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,	"hum_body_Naked0", 	BodyTex_Player,	0,			"Hum_Head_Pony", 	FACE_N_Player,	0, 			ITAR_PAL_H);
	
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE, 			6);
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK, 		1); //hängt ab von DEX (auf Programmebene)
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK, 			1);
	Npc_SetTalentSkill	(self, NPC_TALENT_ACROBAT, 			0);
	
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKPOCKET, 		1);	//hängt ab von DEX (auf Scriptebene)
	Npc_SetTalentSkill	(self, NPC_TALENT_SMITH, 			1);
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
	
	B_SetFightSkills (self, 100); //Grenzen für Talent-Level liegen bei 30 und 60
	
	//-------- inventory --------
	EquipItem (self, ItMw_2h_Pal_Sword);
	
	
	//bodyStateInterruptableOverride = TRUE;


//----------------------------------------
//			die neuen Waffen 
//----------------------------------------
	CreateInvItems (self, ItMw_1h_Vlk_Dagger,1); 
	CreateInvItems (self, ItMw_1H_Mace_L_01,1);
	CreateInvItems (self, ItMw_1h_Bau_Axe,1);
	CreateInvItems (self, ItMw_1h_Vlk_Mace,1);
	CreateInvItems (self, ItMw_1H_Mace_L_03,1);
	CreateInvItems (self, ItMw_1h_Bau_Mace,1);
	CreateInvItems (self, ItMw_1h_Vlk_Axe,1);
	CreateInvItems (self, ItMw_1H_Mace_L_04,1);
	CreateInvItems (self, ItMw_ShortSword1,1);
	CreateInvItems (self, ItMw_Nagelknueppel,1);
	CreateInvItems (self, ItMw_1H_Sword_L_03,1);
	CreateInvItems (self, ItMw_ShortSword2,1);
	CreateInvItems (self, ItMw_Sense,1);
	CreateInvItems (self, ItMw_1h_Vlk_Sword,1);
	CreateInvItems (self, ItMw_1h_Nov_Mace,1);
	CreateInvItems (self, ItMw_2h_Bau_Axe,1);
	CreateInvItems (self, ItMw_2H_Axe_L_01,1);
	CreateInvItems (self, ItMw_1h_MISC_Sword,1);
	CreateInvItems (self, ItMw_1h_Misc_Axe,1);
	CreateInvItems (self, ItMw_2H_Sword_M_01,1);
	CreateInvItems (self, ItMw_1h_Mil_Sword,1);
	CreateInvItems (self, ItMw_1h_Sld_Axe,1);
	CreateInvItems (self, ItMw_1h_Sld_Sword,1);
	CreateInvItems (self, ItMw_2h_Sld_Axe,1);
	CreateInvItems (self, ItMw_2h_Sld_Sword,1);
	CreateInvItems (self, ItMw_1h_Pal_Sword,1);
	CreateInvItems (self, ItMw_2h_Pal_Sword,1);
	CreateInvItems (self, ItMw_2H_OrcAxe_01,1);
	CreateInvItems (self, ItMw_2H_OrcAxe_02,1);
	CreateInvItems (self, ItMw_2H_OrcAxe_03,1);
	CreateInvItems (self, ItMw_2H_OrcAxe_04,1);
	CreateInvItems (self, ItMw_2H_OrcSword_01,1);
	CreateInvItems (self, ItMw_ShortSword3,1);
	CreateInvItems (self, ItMw_Nagelkeule,1);
	CreateInvItems (self, ItMw_ShortSword4,1);
	CreateInvItems (self, ItMw_Kriegskeule,1);
	CreateInvItems (self, ItMw_Richtstab,1);
	CreateInvItems (self, ItMw_ShortSword5,1);
	CreateInvItems (self, ItMw_Kriegshammer1,1);
	CreateInvItems (self, ItMw_Hellebarde,1);
	CreateInvItems (self, ItMw_Nagelkeule2,1);
	CreateInvItems (self, ItMw_Schiffsaxt,1);
	CreateInvItems (self, ItMw_Piratensaebel,1);
	CreateInvItems (self, ItMw_Schwert,1);
	CreateInvItems (self, ItMw_1H_Common_01,1);
	CreateInvItems (self, ItMw_Stabkeule,1);
	CreateInvItems (self, ItMw_Zweihaender1,1);
	CreateInvItems (self, ItMw_Steinbrecher,1);
	CreateInvItems (self, ItMw_Spicker,1);
	CreateInvItems (self, ItMw_Streitaxt1,1);
	CreateInvItems (self, ItMw_Schwert1,1);
	CreateInvItems (self, ItMw_Schwert2,1);
	CreateInvItems (self, ItMw_Doppelaxt,1);
	CreateInvItems (self, ItMw_Bartaxt,1);
	CreateInvItems (self, ItMw_Morgenstern,1);
	CreateInvItems (self, ItMw_Schwert3,1);
	CreateInvItems (self, ItMw_Schwert4,1);
	CreateInvItems (self, ItMw_1H_Special_01,1);
	CreateInvItems (self, ItMw_2H_Special_01,1);
	CreateInvItems (self, ItMw_Rapier,1);
	CreateInvItems (self, ItMw_Rubinklinge,1);
	CreateInvItems (self, ItMw_Streitkolben,1);
	CreateInvItems (self, ItMw_Zweihaender2,1);
	CreateInvItems (self, ItMw_Runenschwert,1);
	CreateInvItems (self, ItMw_Rabenschnabel,1);
	CreateInvItems (self, ItMw_Schwert5,1);
	CreateInvItems (self, ItMw_Inquisitor,1);
	CreateInvItems (self, ItMw_Streitaxt2,1);
	CreateInvItems (self, ItMw_Zweihaender3,1);
	CreateInvItems (self, ItMw_1H_Special_02,1);
	CreateInvItems (self, ItMw_2H_Special_02,1);
	CreateInvItems (self, ItMw_ElBastardo,1);
	CreateInvItems (self, ItMw_Kriegshammer2,1);
	CreateInvItems (self, ItMw_Meisterdegen,1);
	CreateInvItems (self, ItMw_Folteraxt,1);
	CreateInvItems (self, ItMw_Orkschlaechter,1);
	CreateInvItems (self, ItMw_Schlachtaxt,1);
	CreateInvItems (self, ItMw_Krummschwert,1);
	CreateInvItems (self, ItMw_Barbarenstreitaxt,1);
	CreateInvItems (self, ItMw_Sturmbringer,1);
	CreateInvItems (self, ItMw_1H_Special_03,1);
	CreateInvItems (self, ItMw_2H_Special_03,1);
	CreateInvItems (self, ItMw_Berserkeraxt,1);
	CreateInvItems (self, ItMw_Drachenschneide,1);
	CreateInvItems (self, ItMw_1H_Special_04,1);
	CreateInvItems (self, ItMw_2H_Special_04,1);
	CreateInvItems (self, ItMw_1H_Blessed_01,1);
	CreateInvItems (self, ItMw_1H_Blessed_02,1);
	CreateInvItems (self, ItMw_1H_Blessed_03,1);
	CreateInvItems (self, ItMw_2H_Blessed_01,1);
	CreateInvItems (self, ItMw_2H_Blessed_02,1);
	CreateInvItems (self, ItMw_2H_Blessed_03,1);

//----------------------------------------
//Armor.d
//----------------------------------------

	CreateInvItem(self,ITAR_Governor);
	CreateInvItem(self,ITAR_Smith);
	CreateInvItem(self,ITAR_Barkeeper);
	CreateInvItem(self,ITAR_Judge);
	CreateInvItem(self,ITAR_VLK_L);
	CreateInvItem(self,ITAR_VLK_M);
	CreateInvItem(self,ITAR_VLK_H);
	CreateInvItem(self,ITAR_VLKBabe_L);
	CreateInvItem(self,ITAR_VLKBabe_M);
	CreateInvItem(self,ITAR_VLKBabe_H);
	CreateInvItem(self,ITAR_MIL_L);
	CreateInvItem(self,ITAR_MIL_M);
	CreateInvItem(self,ITAR_PAL_M);
	CreateInvItem(self,ITAR_PAL_H);
	
	CreateInvItem(self,ITAR_Bau_L);
	CreateInvItem(self,ITAR_Bau_M);
	CreateInvItem(self,ITAR_BauBabe_L);
	CreateInvItem(self,ITAR_BauBabe_M);
	CreateInvItem(self,ITAR_SLD_L);
	CreateInvItem(self,ITAR_SLD_M);
	CreateInvItem(self,ITAR_SLD_H);
	
	CreateInvItem(self,ITAR_NOV_L);
	CreateInvItem(self,ITAR_KDF_L);
	CreateInvItem(self,ITAR_KDF_H);
	
	CreateInvItem(self,ITAR_Leather_L);
	CreateInvItem(self,ITAR_BDT_M);
	CreateInvItem(self,ITAR_BDT_H);
	
	CreateInvItem(self,ITAR_DJG_L);
	CreateInvItem(self,ITAR_DJG_M);
	CreateInvItem(self,ITAR_DJG_H);
	CreateInvItem(self,ITAR_DJG_Crawler);
	CreateInvItem(self,ITAR_DJG_Babe);
	
	CreateInvItem(self,ITAR_XARDAS);
	CreateInvItem(self,ITAR_LESTER);
	CreateInvItem(self,ITAR_DIEGO);
	CreateInvItem(self,ITAR_CorAngar);
	CreateInvItem(self,ITAR_KDW_H);
	CreateInvItem(self,ITAR_Dementor);
	CreateInvItem(self,ITAR_Prisoner);
	
	//Addon
	CreateInvItem(self,ITAR_PIR_L_Addon);
	CreateInvItem(self,ITAR_PIR_M_Addon);
	CreateInvItem(self,ITAR_PIR_H_Addon);
	CreateInvItem(self,ITAR_Thorus_Addon);
	CreateInvItem(self,ITAR_Raven_Addon);
	CreateInvItem(self,ITAR_OreBaron_Addon);
	CreateInvItem(self,ITAR_RANGER_Addon);
	CreateInvItem(self,ITAR_KDW_L_Addon);
	CreateInvItem(self,ITAR_Bloodwyn_Addon);
	
//----------------------------------------
//Alle neuen Runen
//----------------------------------------
	CreateInvItem(self,ItRu_PalLight);
	CreateInvItem(self,ItRu_PalLightHeal);
	CreateInvItem(self,ItRu_PalHolyBolt);
	CreateInvItem(self,ItRu_PalMediumHeal);
	CreateInvItem(self,ItRu_PalRepelEvil);
	CreateInvItem(self,ItRu_PalFullHeal);
	CreateInvItem(self,ItRu_PalDestroyEvil);
	
	
	/*CreateInvItem(self,ItRu_TeleportSeaport);
	CreateInvItem(self,ItRu_TeleportMonastery);
	CreateInvItem(self,ItRu_TeleportFarm);
	CreateInvItem(self,ItRu_TeleportXardas);
	CreateInvItem(self,ItRu_TeleportPassNW);
	CreateInvItem(self,ItRu_TeleportPassOW);
	CreateInvItem(self,ItRu_TeleportOC);
	CreateInvItem(self,ItRu_Teleport_1);
	CreateInvItem(self,ItRu_Teleport_2);
	CreateInvItem(self,ItRu_Teleport_3);*/
	CreateInvItem(self,ItRu_Light);
	CreateInvItem(self,ItRu_Firebolt);
	CreateInvItem(self,ItRu_Icebolt);
	CreateInvItem(self,ItRu_LightHeal);
	CreateInvItem(self,ItRu_SumGobSkel);
	CreateInvItem(self,ItRu_InstantFireball);
	CreateInvItem(self,ItRu_Zap);
	CreateInvItem(self,ItRu_SumWolf);
	CreateInvItem(self,ItRu_Windfist);
	CreateInvItem(self,ItRu_Sleep);
	CreateInvItem(self,ItRu_MediumHeal);
	CreateInvItem(self,ItRu_LightningFlash);
	CreateInvItem(self,ItRu_ChargeFireball);
	CreateInvItem(self,ItRu_SumSkel);
	CreateInvItem(self,ItRu_Fear);
	CreateInvItem(self,ItRu_IceCube);
	CreateInvItem(self,ItRu_ThunderBall);
	CreateInvItem(self,ItRu_SumGol);
	CreateInvItem(self,ItRu_HarmUndead);
	CreateInvItem(self,ItRu_Pyrokinesis);
	CreateInvItem(self,ItRu_Firestorm);
	CreateInvItem(self,ItRu_IceWave);
	CreateInvItem(self,ItRu_SumDemon);
	CreateInvItem(self,ItRu_FullHeal);
	CreateInvItem(self,ItRu_Firerain);
	CreateInvItem(self,ItRu_BreathOfDeath);
	CreateInvItem(self,ItRu_MassDeath);
	CreateInvItem(self,ItRu_MasterOfDisaster);
	CreateInvItem(self,ItRu_ArmyOfDarkness);
	CreateInvItem(self,ItRu_Shrink);
	
//----------------------------------------
//Alle neuen Scrolls
//----------------------------------------
	CreateInvItem(self,ItSc_PalLight);
	CreateInvItem(self,ItSc_PalLightHeal);
	CreateInvItem(self,ItSc_PalHolyBolt);
	CreateInvItem(self,ItSc_PalMediumHeal);
	CreateInvItem(self,ItSc_PalRepelEvil);
	CreateInvItem(self,ItSc_PalFullHeal);
	CreateInvItem(self,ItSc_PalDestroyEvil);
	
	CreateInvItems(self,ItSc_Charm, 10);
	CreateInvItem(self,ItSc_Light);
	CreateInvItem(self,ItSc_Firebolt);
	CreateInvItem(self,ItSc_Icebolt);
	CreateInvItem(self,ItSc_LightHeal);
	CreateInvItem(self,ItSc_SumGobSkel);
	CreateInvItem(self,ItSc_InstantFireball);
	CreateInvItem(self,ItSc_Zap);
	CreateInvItem(self,ItSc_SumWolf);
	CreateInvItem(self,ItSc_Windfist);
	CreateInvItem(self,ItSc_Sleep);
	CreateInvItem(self,ItSc_MediumHeal);
	CreateInvItem(self,ItSc_LightningFlash);
	CreateInvItem(self,ItSc_ChargeFireball);
	CreateInvItem(self,ItSc_SumSkel);
	CreateInvItem(self,ItSc_Fear);
	CreateInvItem(self,ItSc_IceCube);
	CreateInvItem(self,ItSc_ThunderBall);
	CreateInvItem(self,ItSc_SumGol);
	CreateInvItem(self,ItSc_HarmUndead);
	CreateInvItem(self,ItSc_Pyrokinesis);
	CreateInvItem(self,ItSc_Firestorm);
	CreateInvItem(self,ItSc_IceWave);
	CreateInvItem(self,ItSc_SumDemon);
	CreateInvItem(self,ItSc_FullHeal);
	CreateInvItem(self,ItSc_Firerain);
	CreateInvItem(self,ItSc_BreathOfDeath);
	CreateInvItem(self,ItSc_MassDeath);
	CreateInvItem(self,ItSc_ArmyOfDarkness);
	CreateInvItem(self,ItSc_Shrink);
	CreateInvItems(self,ItSc_TrfSheep,10);
	CreateInvItems(self,ItSc_TrfScavenger,10);
	CreateInvItems(self,ItSc_TrfGiantRat,10);
	CreateInvItems(self,ItSc_TrfGiantBug,10);
	CreateInvItems(self,ItSc_TrfWolf,10);
	CreateInvItems(self,ItSc_TrfWaran,10);
	CreateInvItems(self,ItSc_TrfSnapper,10);
	CreateInvItems(self,ItSc_TrfWarg,10);
	CreateInvItems(self,ItSc_TrfFireWaran,10);
	CreateInvItems(self,ItSc_TrfLurker,10);
	CreateInvItems(self,ItSc_TrfShadowbeast,10);
	CreateInvItems(self,ItSc_TrfDragonSnapper,10);


//**********************************************************************
//	Alle neuen Food
//**********************************************************************

	CreateInvItem(self,ItFo_Apple);
	CreateInvItem(self,ItFo_Cheese);
	CreateInvItem(self,ItFo_Bacon);
	CreateInvItem(self,ItFo_Bread);
	CreateInvItem(self,ItFo_Fish);
	CreateInvItem(self,ItFoMuttonRaw);
	//CreateInvItem(self,ItFo_Meat);
	CreateInvItem(self,ItFo_Stew);
	CreateInvItem(self,ItFo_FishSoup);
	CreateInvItem(self,ItFo_Sausage);
	CreateInvItem(self,ItFo_Honey);
	
	CreateInvItem(self,ItFo_Water);
	CreateInvItem(self,ItFo_Beer);
	CreateInvItem(self,ItFo_Booze);
	CreateInvItem(self,ItFo_Wine);
	CreateInvItem(self,ItFo_Milk);
	
//**********************************************************************
//	Alle neuen Plants
//**********************************************************************

	CreateInvItem(self,ItPl_SwampHerb);
	CreateInvItem(self,ItPl_Mana_Herb_01);
	CreateInvItem(self,ItPl_Mana_Herb_02);
	CreateInvItem(self,ItPl_Mana_Herb_03);
	CreateInvItem(self,ItPl_Health_Herb_01);
	CreateInvItem(self,ItPl_Health_Herb_02);
	CreateInvItem(self,ItPl_Health_Herb_03);
	CreateInvItem(self,ItPl_Dex_Herb_01);
	CreateInvItem(self,ItPl_Strength_Herb_01);
	CreateInvItem(self,ItPl_Speed_Herb_01);

	CreateInvItem(self,ItPl_Mushroom_01);
	CreateInvItem(self,ItPl_Mushroom_02);

	CreateInvItem(self,ItPl_Forestberry);
	CreateInvItem(self,ItPl_Blueplant);
	CreateInvItem(self,ItPl_Planeberry);

	CreateInvItem(self,ItPl_Temp_Herb);
	CreateInvItem(self,ItPl_Perm_Herb);


	
//**********************************************************************
//	Alle neuen Keys
//**********************************************************************

	CreateInvItem(self,ItKe_Key_01);
	CreateInvItem(self,ItKe_Key_02);
	CreateInvItem(self,ItKe_Key_03);
	CreateInvItem(self,ItKe_Lockpick);
//----------------------------------------
//MISC /Light_sources
//----------------------------------------
	CreateInvItems(self,ItLsTorch,50);

//**********************************************************************
//	Alle neuen Misc
//**********************************************************************

	CreateInvItem(self,ItMi_Pan);
	CreateInvItem(self,ItMi_Saw);
	CreateInvItem(self,ItMi_Brush);
	CreateInvItem(self,ItMi_Flask);
	CreateInvItem(self,ItMi_Stomper);
	CreateInvItem(self,ItMi_Broom);
	CreateInvItem(self,ItMi_Rake);
	CreateInvItem(self,ItMi_Hammer);
	CreateInvItem(self,ItMi_Scoop);
	CreateInvItem(self,ItMi_Nugget);
	CreateInvItem(self,ItMi_Joint);
	CreateInvItem(self,ItMi_Lute);
	CreateInvItems (self,ItMi_Gold, 1000);
	CreateInvItem(self,ItMiSwordraw);
	CreateInvItem(self,ItMiSwordrawhot);
	CreateInvItem(self,ItMiSwordbladehot);
	CreateInvItem(self,ItMiSwordblade);
	CreateInvItem(self,ItMi_RuneBlank);
	CreateInvItem(self,ItMi_Sulfur);
	CreateInvItem(self,ItMi_Quartz);
	CreateInvItem(self,ItMi_Pitch);
	CreateInvItem(self,ItMi_Rockcrystal);
	CreateInvItem(self,ItMi_Aquamarine);
	CreateInvItem(self,ItMi_HolyWater);
	CreateInvItem(self,ItMi_Coal);
	CreateInvItem(self,ItMi_DarkPearl);
	CreateInvItem(self,ItMi_GoldCandleHolder);
	CreateInvItem(self,ItMi_GoldNecklace);
	CreateInvItem(self,ItMi_GoldCup);
	CreateInvItem(self,ItMi_GoldChalice);
	CreateInvItem(self,ItMi_GoldChest);
	CreateInvItem(self,ItMi_GoldRing);
	CreateInvItem(self,ItMi_SilverChalice);
	CreateInvItem(self,ItMi_JeweleryChest);
	CreateInvItem(self,ItMi_InnosStatue);
	
	CreateInvItem(self,ItMi_SilverRing);
	CreateInvItem(self,ItMi_SilverCup);
	CreateInvItem(self,ItMi_SilverPlate);
	CreateInvItem(self,ItMi_SilverNecklace);
	CreateInvItem(self,ItMi_SilverCandleHolder);
	CreateInvItem(self,ItMi_Sextant);
	
	
	
//----------------------------------------
//Ranged_weapons.d
//----------------------------------------
	CreateInvItem(self,ItRw_Bow_L_01);
	CreateInvItem(self,ItRw_Bow_L_02);
	CreateInvItem(self,ItRw_Bow_L_03);
	CreateInvItem(self,ItRw_Bow_L_04);
	
	CreateInvItem(self,ItRw_Bow_M_01);
	CreateInvItem(self,ItRw_Bow_M_02);
	CreateInvItem(self,ItRw_Bow_M_03);
	CreateInvItem(self,ItRw_Bow_M_04);
	
	CreateInvItem(self,ItRw_Bow_H_01);
	CreateInvItem(self,ItRw_Bow_H_02);
	CreateInvItem(self,ItRw_Bow_H_03);
	CreateInvItem(self,ItRw_Bow_H_04);
	
	CreateInvItem(self,ItRw_Crossbow_L_01);
	CreateInvItem(self,ItRw_Crossbow_L_02);
	CreateInvItem(self,ItRw_Crossbow_M_01);
	CreateInvItem(self,ItRw_Crossbow_M_02);
	CreateInvItem(self,ItRw_Crossbow_H_01);
	CreateInvItem(self,ItRw_Crossbow_H_02);
//----------------------------------------
//Ammunition.d
//----------------------------------------
	CreateInvItems(self,ItRw_Arrow,1000);
	CreateInvItems(self,ItRw_Bolt,1000);
//----------------------------------------
//Written.d
//----------------------------------------
	
//----------------------------------------
//Melee_weapons.d
//----------------------------------------
	/*
	//Schmiedewaffen
	CreateInvItem(self,ItMw_1H_Common_01);
	
	CreateInvItem(self,ItMw_1H_Special_01);
	CreateInvItem(self,ItMw_2H_Special_01);
	CreateInvItem(self,ItMw_1H_Special_02);
	CreateInvItem(self,ItMw_2H_Special_02);
	CreateInvItem(self,ItMw_1H_Special_03);
	CreateInvItem(self,ItMw_2H_Special_03);
	CreateInvItem(self,ItMw_1H_Special_04);
	CreateInvItem(self,ItMw_2H_Special_04);
	
	//Heilige Waffen
	CreateInvItem(self,ItMw_1H_Blessed_01);
	CreateInvItem(self,ItMw_2H_Blessed_01);
	CreateInvItem(self,ItMw_1H_Blessed_02);
	CreateInvItem(self,ItMw_2H_Blessed_02);
	CreateInvItem(self,ItMw_1H_Blessed_03);
	CreateInvItem(self,ItMw_1H_Blessed_03);
	
	//Orkwaffen
	CreateInvItem(self,ItMw_2H_OrcSword_01);
	CreateInvItem(self,ItMw_2H_OrcAxe_01);
	CreateInvItem(self,ItMw_2H_OrcAxe_02);
	CreateInvItem(self,ItMw_2H_OrcAxe_03);
	CreateInvItem(self,ItMw_2H_OrcAxe_04);
	*/
//-----------------------------------------------------------	
//Alle neuen Gürtel
//-----------------------------------------------------------	
	CreateInvItems (self, ItBe_Addon_Leather_01, 1);
	
	CreateInvItems (self, ItBe_Addon_SLD_01, 1);
	
	
	CreateInvItems (self, ItBe_Addon_NOV_01, 1);
	
	CreateInvItems (self, ItBe_Addon_MIL_01, 1);

	
	CreateInvItems (self, ItBe_Addon_KDF_01, 1);

	
	CreateInvItems (self, ItBe_Addon_MC, 1);
	
	CreateInvItems (self, ItBe_Addon_STR_5, 1);
	CreateInvItems (self, ItBe_Addon_STR_10, 1);
	CreateInvItems (self, ItBe_Addon_DEX_5, 1);
	CreateInvItems (self, ItBe_Addon_DEX_10, 1);

	CreateInvItems (self, ItBe_Addon_Prot_Edge, 1);
	CreateInvItems (self, ItBe_Addon_Prot_Point, 1);
	CreateInvItems (self, ItBe_Addon_Prot_Magic, 1);
	CreateInvItems (self, ItBe_Addon_Prot_Fire, 1);
	CreateInvItems (self, ItBe_Addon_Prot_EdgPoi, 1);
	CreateInvItems (self, ItBe_Addon_Prot_Total, 1);
	
//-----------------------------------------------------------	
//Alle neuen Amulette
//-----------------------------------------------------------
	CreateInvItem(self,ItAm_Dex_01);
	CreateInvItem(self,ItAm_Strg_01);
	CreateInvItem(self,ItAm_Hp_01);
	CreateInvItem(self,ItAm_Mana_01);
	CreateInvItem(self,ItAm_Dex_Strg_01);
	CreateInvItem(self,ItAm_Hp_Mana_01 );
	CreateInvItem(self,ItAm_Prot_Fire_01);
	CreateInvItem(self,ItAm_Prot_Mage_01);
	CreateInvItem(self,ItAm_Prot_Edge_01);
	CreateInvItem(self,ItAm_Prot_Point_01);
	CreateInvItem(self,ItAm_Prot_Total_01);
//------------------------------------------------------------	
//Alle neuen Ringe
//------------------------------------------------------------
	CreateInvItem(self,ItRi_Dex_01);	
	CreateInvItem(self,ItRi_Dex_02);
	CreateInvItem(self,ItRi_Hp_01);
	CreateInvItem(self,ItRi_Hp_02);
	CreateInvItem(self,ItRi_Str_01);
	CreateInvItem(self,ItRi_Str_02);
	CreateInvItem(self,ItRi_Mana_01);
	CreateInvItem(self,ItRi_Mana_02);
	CreateInvItem(self,ItRi_Dex_Strg_01);
	CreateInvItem(self,ItRi_Hp_Mana_01);
	CreateInvItem(self,ItRi_Prot_Fire_01);
	CreateInvItem(self,ItRi_Prot_Fire_02);
	CreateInvItem(self,ItRi_Prot_Edge_01);
	CreateInvItem(self,ItRi_Prot_Edge_02);
	CreateInvItem(self,ItRi_Prot_Mage_01);
	CreateInvItem(self,ItRi_Prot_Mage_02);
	CreateInvItem(self,ItRi_Prot_Point_01);
	CreateInvItem(self,ItRi_Prot_Point_02);
	CreateInvItem(self,ItRi_Prot_Total_01);
	CreateInvItem(self,ItRi_Prot_Total_02);

//---------------------------------------------------------------------
//Alle neuen Potions
//---------------------------------------------------------------------
	CreateInvItems  (self, ItPo_Mana_01, 10);
	CreateInvItems  (self, ItPo_Mana_02, 10);
	CreateInvItems  (self, ItPo_Mana_03, 10);
	CreateInvItems  (self, ItPo_Mana_Addon_04, 10);
	
	CreateInvItems  (self, ItPo_Health_01, 10);
	CreateInvItems  (self, ItPo_Health_02, 10);
	CreateInvItems  (self, ItPo_Health_03, 10);
	CreateInvItems  (self, ItPo_Health_Addon_04, 10);
	
	CreateInvItems  (self, ItPo_Perm_STR, 10);
	CreateInvItems  (self, ItPo_Perm_DEX, 10);
	CreateInvItems  (self, ItPo_Perm_Health, 10);
	CreateInvItems  (self, ItPo_Perm_Mana, 10);
	
	CreateInvItems  (self, ItPo_Speed, 10);
	
//**********************************************************************
//	Alle neuen Animaltrophies	
//**********************************************************************
	
	CreateInvItem(self,ItAt_Meatbugflesh);
	CreateInvItem(self,ItAt_SheepFur);
	CreateInvItem(self,ItAt_WolfFur);
	CreateInvItem(self,ItAt_BugMandibles);
	CreateInvItem(self,ItAt_Claw);
	CreateInvItem(self,ItAt_LurkerClaw);
	CreateInvItem(self,ItAt_Teeth);
	CreateInvItem(self,ItAt_CrawlerMandibles);
	CreateInvItem(self,ItAt_Wing);
	CreateInvItem(self,ItAt_Sting);
	CreateInvItem(self,itat_LurkerSkin);
	CreateInvItem(self,ItAt_WargFur);
	//CreateInvItem(self,ItAr_DrgSnapperHorn);
	CreateInvItem(self,ItAt_CrawlerPlate);
	CreateInvItem(self,ItAt_ShadowFur);
	CreateInvItem(self,ItAt_SharkSkin);
	CreateInvItem(self,ItAt_TrollFur);
	CreateInvItem(self,ItAt_WaranFiretongue);
	CreateInvItem(self,ItAt_ShadowHorn);
	CreateInvItem(self,ItAt_SharkTeeth);
	CreateInvItem(self,ItAt_TrollTooth);
	
	CreateInvItem(self,ItAt_GoblinBone);
	CreateInvItem(self,ItAt_SkeletonBone);
	CreateInvItem(self,ItAt_DemonHeart);
	CreateInvItem(self,ItAt_StoneGolemHeart);
	CreateInvItem(self,ItAt_FireGolemHeart);
	CreateInvItem(self,ItAt_IceGolemHeart);

};









