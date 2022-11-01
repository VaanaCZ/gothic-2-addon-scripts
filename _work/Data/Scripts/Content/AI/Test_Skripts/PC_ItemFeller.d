INSTANCE PC_Itemfeller(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "Mr. Item";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE;
	level			= 30;
	voice			= 15;
	id				= 0;
	
	//--------- abilities --------
	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		100;
	attribute[ATR_MANA_MAX] =		400;
	attribute[ATR_MANA] =			400;
	attribute[ATR_HITPOINTS_MAX] =	400;
	attribute[ATR_HITPOINTS] =		400;
	
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
//########################################
//########################################
//###								   ###
//###			Alle Items			   ###
//###								   ###	
//########################################
//########################################



//----------------------------------------
//	IT_MeleeWeapons.d
//----------------------------------------
//----Common Waffen----	
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
//----Orcwaffen----	
	CreateInvItems (self, ItMw_2H_OrcAxe_01,1);
	CreateInvItems (self, ItMw_2H_OrcAxe_02,1);
	CreateInvItems (self, ItMw_2H_OrcAxe_03,1);
	CreateInvItems (self, ItMw_2H_OrcAxe_04,1);
	CreateInvItems (self, ItMw_2H_OrcSword_01,1);
	CreateInvItems (self, ItMw_2H_OrcSword_02,1);
//----Kapitel 1----	
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
//----Kapitel 2----
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
//----Kapitel 3----	
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
//----Kapitel 4----	
	CreateInvItems (self, ItMw_ElBastardo,1);
	CreateInvItems (self, ItMw_Kriegshammer2,1);
	CreateInvItems (self, ItMw_Meisterdegen,1);
	CreateInvItems (self, ItMw_Folteraxt,1);
	CreateInvItems (self, ItMw_Orkschlaechter,1);
	CreateInvItems (self, ItMw_Zweihaender4,1);
	CreateInvItems (self, ItMw_Schlachtaxt,1);
	CreateInvItems (self, ItMw_Krummschwert,1);
	CreateInvItems (self, ItMw_Barbarenstreitaxt,1);
	CreateInvItems (self, ItMw_Sturmbringer,1);
//----Kapitel 5----	
	CreateInvItems (self, ItMw_Berserkeraxt,1);
	CreateInvItems (self, ItMw_Drachenschneide,1);
//----Schmiedewaffen----	
	CreateInvItems (self, ItMw_1H_Common_01,1);
	CreateInvItems (self, ItMw_1H_Special_01,1);
	CreateInvItems (self, ItMw_2H_Special_01,1);
	CreateInvItems (self, ItMw_1H_Special_02,1);
	CreateInvItems (self, ItMw_2H_Special_02,1);
	CreateInvItems (self, ItMw_1H_Special_03,1);
	CreateInvItems (self, ItMw_2H_Special_03,1);
	CreateInvItems (self, ItMw_1H_Special_04,1);
	CreateInvItems (self, ItMw_2H_Special_04,1);
//----Gesegnete Waffen ----	
	CreateInvItems (self, ItMw_1H_Blessed_01,1);
	CreateInvItems (self, ItMw_1H_Blessed_02,1);
	CreateInvItems (self, ItMw_1H_Blessed_03,1);
	CreateInvItems (self, ItMw_2H_Blessed_01,1);
	CreateInvItems (self, ItMw_2H_Blessed_02,1);
	CreateInvItems (self, ItMw_2H_Blessed_03,1);
//----------------------------------------
//	IT_Armor.d
//----------------------------------------
	CreateInvItems(self,ITAR_Governor,1);
	CreateInvItems(self,ITAR_SMITH,1);
	CreateInvItems(self,ITAR_BARKEEPER,1);
	CreateInvItems(self,ITAR_JUDGE,1);
	CreateInvItems(self,ITAR_VLK_L,1);
	CreateInvItems(self,ITAR_VLK_M,1);
	CreateInvItems(self,ITAR_VLK_H,1);
	CreateInvItems(self,ITAR_VlkBabe_L,1);
	CreateInvItems(self,ITAR_VlkBabe_M,1);
	CreateInvItems(self,ITAR_VlkBabe_H,1);
	CreateInvItems(self,ITAR_MIL_L,1);
	CreateInvItems(self,ITAR_MIL_M,1);
	CreateInvItems(self,ITAR_PAL_M,1);
	CreateInvItems(self,ITAR_PAL_H,1);
	CreateInvItems(self,ITAR_BAU_L,1);
	CreateInvItems(self,ITAR_BAU_M,1);
	CreateInvItems(self,ITAR_BauBabe_L,1);
	CreateInvItems(self,ITAR_BauBabe_M,1);
	CreateInvItems(self,ITAR_SLD_L,1);
	CreateInvItems(self,ITAR_SLD_M,1);
	CreateInvItems(self,ITAR_SLD_H,1);
	CreateInvItems(self,ITAR_DJG_L,1);
	CreateInvItems(self,ITAR_DJG_M,1);
	CreateInvItems(self,ITAR_DJG_H,1);
	CreateInvItems(self,ITAR_DJG_Crawler,1);
	CreateInvItems(self,ITAR_DJG_Babe,1);
	CreateInvItems(self,ITAR_NOV_L,1);
	CreateInvItems(self,ITAR_KDF_L,1);
	CreateInvItems(self,ITAR_KDF_H,1);
	CreateInvItems(self,ITAR_Leather_L,1);
	CreateInvItems(self,ITAR_BDT_M,1);
	CreateInvItems(self,ITAR_BDT_H,1);
	CreateInvItems(self,ITAR_XARDAS,1);
	CreateInvItems(self,ITAR_LESTER,1);
	CreateInvItems(self,ITAR_DIEGO,1);
	CreateInvItems(self,ITAR_CorAngar,1);
	CreateInvItems(self,ITAR_KDW_H,1);
	CreateInvItems(self,ITAR_Dementor,1);
	CreateInvItems(self,ITAR_Prisoner,1);
//----------------------------------------
//	IT_Runen.d
//----------------------------------------
	CreateInvItems(self,ItRu_PalLight,1);
	CreateInvItems(self,ItRu_PalLightHeal,1);
	CreateInvItems(self,ItRu_PalHolyBolt,1);
	CreateInvItems(self,ItRu_PalMediumHeal,1);
	CreateInvItems(self,ItRu_PalRepelEvil,1);
	CreateInvItems(self,ItRu_PalFullHeal,1);
	CreateInvItems(self,ItRu_PalDestroyEvil,1);
	CreateInvItems(self,ItRu_PalTeleportSecret,1);
	CreateInvItems(self,ItRu_TeleportSeaport,1);
	CreateInvItems(self,ItRu_TeleportMonastery,1);
	CreateInvItems(self,ItRu_TeleportFarm,1);
	CreateInvItems(self,ItRu_TeleportXardas,1);
	CreateInvItems(self,ItRu_TeleportPassNW,1);
	CreateInvItems(self,ItRu_TeleportPassOW,1);
	CreateInvItems(self,ItRu_TeleportOC,1);
	CreateInvItems(self,ItRu_TeleportTaverne,1);
	CreateInvItems(self,ItRu_Teleport_3,1);
	CreateInvItems(self,ItRu_Light,1);
	CreateInvItems(self,ItRu_Firebolt,1);
	CreateInvItems(self,ItRu_Zap,1);
	CreateInvItems(self,ItRu_LightHeal,1);
	CreateInvItems(self,ItRu_SumGobSkel,1);
	CreateInvItems(self,ItRu_InstantFireball,1);
	CreateInvItems(self,ItRu_Icebolt,1);
	CreateInvItems(self,ItRu_SumWolf,1);
	CreateInvItems(self,ItRu_Windfist,1);
	CreateInvItems(self,ItRu_Sleep,1);
	CreateInvItems(self,ItRu_MediumHeal,1);
	CreateInvItems(self,ItRu_LightningFlash,1);
	CreateInvItems(self,ItRu_ChargeFireball,1);
	CreateInvItems(self,ItRu_SumSkel,1);
	CreateInvItems(self,ItRu_Fear,1);
	CreateInvItems(self,ItRu_IceCube,1);
	CreateInvItems(self,ItRu_ThunderBall,1);
	CreateInvItems(self,ItRu_SumGol,1);
	CreateInvItems(self,ItRu_HarmUndead,1);
	CreateInvItems(self,ItRu_Pyrokinesis,1);
	CreateInvItems(self,ItRu_Firestorm,1);
	CreateInvItems(self,ItRu_IceWave,1);
	CreateInvItems(self,ItRu_SumDemon,1);
	CreateInvItems(self,ItRu_FullHeal,1);
	CreateInvItems(self,ItRu_Firerain,1);
	CreateInvItems(self,ItRu_BreathOfDeath,1);
	CreateInvItems(self,ItRu_MassDeath,1);
	CreateInvItems(self,ItRu_MasterOfDisaster,1);
	CreateInvItems(self,ItRu_ArmyOfDarkness,1);
	CreateInvItems(self,ItRu_Shrink,1);
//----------------------------------------
//	IT_Scrolls.d
//----------------------------------------
	CreateInvItems(self,ItSc_PalLight,10);
	CreateInvItems(self,ItSc_PalLightHeal,10);
	CreateInvItems(self,ItSc_PalHolyBolt,10);
	CreateInvItems(self,ItSc_PalMediumHeal,10);
	CreateInvItems(self,ItSc_PalRepelEvil,10);
	CreateInvItems(self,ItSc_PalFullHeal,10);
	CreateInvItems(self,ItSc_PalDestroyEvil,10);
	CreateInvItems(self,ItSc_Charm,10);
	CreateInvItems(self,ItSc_Light,10);
	CreateInvItems(self,ItSc_Firebolt,10);
	CreateInvItems(self,ItSc_Icebolt,10);
	CreateInvItems(self,ItSc_LightHeal,10);
	CreateInvItems(self,ItSc_SumGobSkel,10);
	CreateInvItems(self,ItSc_InstantFireball,10);
	CreateInvItems(self,ItSc_Zap,10);
	CreateInvItems(self,ItSc_SumWolf,10);
	CreateInvItems(self,ItSc_Windfist,10);
	CreateInvItems(self,ItSc_Sleep,10);
	CreateInvItems(self,ItSc_MediumHeal,10);
	CreateInvItems(self,ItSc_LightningFlash,10);
	CreateInvItems(self,ItSc_ChargeFireball,10);
	CreateInvItems(self,ItSc_SumSkel,10);
	CreateInvItems(self,ItSc_Fear,10);
	CreateInvItems(self,ItSc_IceCube,10);
	CreateInvItems(self,ItSc_ThunderBall,10);
	CreateInvItems(self,ItSc_SumGol,10);
	CreateInvItems(self,ItSc_HarmUndead,10);
	CreateInvItems(self,ItSc_Pyrokinesis,10);
	CreateInvItems(self,ItSc_Firestorm,10);
	CreateInvItems(self,ItSc_IceWave,10);
	CreateInvItems(self,ItSc_SumDemon,10);
	CreateInvItems(self,ItSc_FullHeal,10);
	CreateInvItems(self,ItSc_Firerain,10);
	CreateInvItems(self,ItSc_BreathOfDeath,10);
	CreateInvItems(self,ItSc_MassDeath,10);
	CreateInvItems(self,ItSc_ArmyOfDarkness,10);
	CreateInvItems(self,ItSc_Shrink,10);
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
//----------------------------------------
//	IT_Food.d
//----------------------------------------
	CreateInvItems(self,ItFo_Apple,10);
	CreateInvItems(self,ItFo_Cheese,10);
	CreateInvItems(self,ItFo_Bacon,10);
	CreateInvItems(self,ItFo_Bread,10);
	CreateInvItems(self,ItFo_Fish,10);
	CreateInvItems(self,ItFoMuttonRaw,10);
	CreateInvItems(self,ItFoMutton,10);
	CreateInvItems(self,ItFo_Stew,10);
	CreateInvItems(self,ItFo_FishSoup,10);
	CreateInvItems(self,ItFo_Sausage,10);
	CreateInvItems(self,ItFo_Honey,10);
	CreateInvItems(self,ItFo_Water,10);
	CreateInvItems(self,ItFo_Beer,10);
	CreateInvItems(self,ItFo_Booze,10);
	CreateInvItems(self,ItFo_Wine,10);
	CreateInvItems(self,ItFo_Milk,10);
	CreateInvItems(self,ItFo_XPStew,10);
	CreateInvItems(self,ItFo_CoragonsBeer,10);
//----------------------------------------
//	IT_Plants.d
//----------------------------------------
	CreateInvItems(self,ItPl_Weed,10);
	CreateInvItems(self,ItPl_Beet,10);
	CreateInvItems(self,ItPl_SwampHerb,10);
	CreateInvItems(self,ItPl_Mana_Herb_01,10);
	CreateInvItems(self,ItPl_Mana_Herb_02,10);
	CreateInvItems(self,ItPl_Mana_Herb_03,10);
	CreateInvItems(self,ItPl_Health_Herb_01,10);
	CreateInvItems(self,ItPl_Health_Herb_02,10);
	CreateInvItems(self,ItPl_Health_Herb_03,10);
	CreateInvItems(self,ItPl_Dex_Herb_01,10);
	CreateInvItems(self,ItPl_Strength_Herb_01,10);
	CreateInvItems(self,ItPl_Speed_Herb_01,10);
	CreateInvItems(self,ItPl_Mushroom_01,10);
	CreateInvItems(self,ItPl_Mushroom_02,10);
	CreateInvItems(self,ItPl_Forestberry,10);
	CreateInvItems(self,ItPl_Blueplant,10);
	CreateInvItems(self,ItPl_Planeberry,10);
	CreateInvItems(self,ItPl_Temp_Herb,10);
	CreateInvItems(self,ItPl_Perm_Herb,10);	
//----------------------------------------
//	IT_Keys.d
//----------------------------------------
	CreateInvItems(self,ItKe_Key_01,1);
	CreateInvItems(self,ItKe_Key_02,1);
	CreateInvItems(self,ItKe_Key_03,1);
	CreateInvItems(self,ItKe_Lockpick,1);
	CreateInvItems(self,ItKe_City_Tower_01,1);
	CreateInvItems(self,ItKe_City_Tower_02,1);
	CreateInvItems(self,ItKe_City_Tower_03,1);
	CreateInvItems(self,ItKe_City_Tower_04,1);
	CreateInvItems(self,ItKe_City_Tower_05,1);
	CreateInvItems(self,ItKe_City_Tower_06,1);
//----------------------------------------
//	IT_Torch.d
//----------------------------------------
	CreateInvItems(self,ItLsTorch,50);
	CreateInvItems(self,ItLsTorchFirespit,10);
//----------------------------------------
//	IT_Misc.d
//----------------------------------------
	CreateInvItems(self,ItMi_Stomper,10);
	CreateInvItems(self,ItMi_RuneBlank,10);
	CreateInvItems(self,ItMi_Pliers,10);
	CreateInvItems(self,ItMi_Flask,10);
	CreateInvItems(self,ItMi_Hammer,10);
	CreateInvItems(self,ItMi_Scoop,10);
	CreateInvItems(self,ItMi_Pan,10);
	CreateInvItems(self,ItMi_PanFull,10);
	CreateInvItems(self,ItMi_Saw,10);
	CreateInvItems(self,ItMiSwordraw,10);
	CreateInvItems(self,ItMiSwordrawhot,10);
	CreateInvItems(self,ItMiSwordbladehot,10);
	CreateInvItems(self,ItMiSwordblade,10);
	CreateInvItems(self,ItMi_Rake,10);
	CreateInvItems(self,ItMi_Broom,10);
	CreateInvItems(self,ItMi_Lute,10);
	CreateInvItems(self,ItMi_Brush,10);
	CreateInvItems(self,ItMi_Joint,10);
	CreateInvItems(self,ItMi_Packet,10);
	CreateInvItems(self,ItMi_Pocket,10);
	CreateInvItems(self,ItMi_Nugget,10);
	CreateInvItems (self,ItMi_Gold, 1000);
	CreateInvItems(self,ItMi_OldCoin,10);
	CreateInvItems(self,ItMi_GoldCandleHolder,10);
	CreateInvItems(self,ItMi_GoldNecklace,10);
	CreateInvItems(self,ItMi_SilverRing,10);
	CreateInvItems(self,ItMi_SilverCup,10);
	CreateInvItems(self,ItMi_SilverPlate,10);
	CreateInvItems(self,ItMi_GoldPlate,10);
	CreateInvItems(self,ItMi_GoldCup,10);
	CreateInvItems(self,ItMi_BloodCup_MIS,10);
	CreateInvItems(self,ItMi_GoldRing,10);
	CreateInvItems(self,ItMi_SilverChalice,10);
	CreateInvItems(self,ItMi_JeweleryChest,10);
	CreateInvItems(self,ItMi_GoldChalice,10);
	CreateInvItems(self,ItMi_GoldChest,10);
	CreateInvItems(self,ItMi_InnosStatue,10);
	CreateInvItems(self,ItMi_Sextant,10);
	CreateInvItems(self,ItMi_SilverCandleHolder,10);
	CreateInvItems(self,ItMi_SilverNecklace,10);
	
	CreateInvItems(self,ItMi_Sulfur,10);
	CreateInvItems(self,ItMi_Quartz,10);
	CreateInvItems(self,ItMi_Pitch,10);
	CreateInvItems(self,ItMi_Rockcrystal,10);
	CreateInvItems(self,ItMi_Aquamarine,10);
	CreateInvItems(self,ItMi_HolyWater,10);
	CreateInvItems(self,ItMi_Coal,10);
	CreateInvItems(self,ItMi_DarkPearl,10);
	
	CreateInvItems(self,ItMi_ApfelTabak,10);
	CreateInvItems(self,ItMi_PilzTabak,10);
	CreateInvItems(self,ItMi_DoppelTabak,10);
	CreateInvItems(self,ItMi_Honigtabak,10);
	CreateInvItems(self,ItMi_SumpfTabak,10);
	
//----------------------------------------
//Ranged_weapons.d
//----------------------------------------
	CreateInvItems(self,ItRw_Mil_Crossbow,1);
	CreateInvItems(self,ItRw_Sld_Bow,1);
	
	CreateInvItems(self,ItRw_Bow_L_01,1);
	CreateInvItems(self,ItRw_Bow_L_02,1);
	CreateInvItems(self,ItRw_Bow_L_03,1);
	CreateInvItems(self,ItRw_Bow_L_04,1);
	
	CreateInvItems(self,ItRw_Bow_M_01,1);
	CreateInvItems(self,ItRw_Bow_M_02,1);
	CreateInvItems(self,ItRw_Bow_M_03,1);
	CreateInvItems(self,ItRw_Bow_M_04,1);
	
	CreateInvItems(self,ItRw_Bow_H_01,1);
	CreateInvItems(self,ItRw_Bow_H_02,1);
	CreateInvItems(self,ItRw_Bow_H_03,1);
	CreateInvItems(self,ItRw_Bow_H_04,1);
	
	CreateInvItems(self,ItRw_Crossbow_L_01,1);
	CreateInvItems(self,ItRw_Crossbow_L_02,1);
	CreateInvItems(self,ItRw_Crossbow_M_01,1);
	CreateInvItems(self,ItRw_Crossbow_M_02,1);
	CreateInvItems(self,ItRw_Crossbow_H_01,1);
	CreateInvItems(self,ItRw_Crossbow_H_02,1);
//----------------------------------------
//Ammunition.d
//----------------------------------------
	CreateInvItems(self,ItRw_Arrow,1000);
	CreateInvItems(self,ItRw_Bolt,1000);
//----------------------------------------
//Written.d
//----------------------------------------
	CreateInvItems(self,StandardBrief,1);
	CreateInvItems(self,StandardBuch,1);
	CreateInvItems(self,ItWr_Map_NewWorld,1);
	CreateInvItems(self,ItWr_Map_NewWorld_City,1);
	CreateInvItems(self,ItWr_Map_OldWorld,1);
	CreateInvItems(self,ItWr_EinhandBuch,1);
	CreateInvItems(self,ItWr_Zweihandbuch,1);
//----------------------------------------
//Secrets.d
//----------------------------------------
	CreateInvItems(self,ItSe_ErzFisch,1);
	CreateInvItems(self,ItSe_GoldFisch,1);
	CreateInvItems(self,ItSe_Ringfisch,1);
	CreateInvItems(self,ItSe_LockpickFisch,1);
	CreateInvItems(self,ItSe_GoldPocket25,1);
	CreateInvItems(self,ItSe_GoldPocket50,1);
	CreateInvItems(self,ItSe_GoldPocket100,1);
//----------------------------------------	
//Alle neuen Amulette
//----------------------------------------
	CreateInvItems(self,ItAm_Dex_01,1);
	CreateInvItems(self,ItAm_Strg_01,1);
	CreateInvItems(self,ItAm_Hp_01,1);
	CreateInvItems(self,ItAm_Mana_01,1);
	CreateInvItems(self,ItAm_Dex_Strg_01,1);
	CreateInvItems(self,ItAm_Hp_Mana_01,1 );
	CreateInvItems(self,ItAm_Prot_Fire_01,1);
	CreateInvItems(self,ItAm_Prot_Mage_01,1);
	CreateInvItems(self,ItAm_Prot_Edge_01,1);
	CreateInvItems(self,ItAm_Prot_Point_01,1);
	CreateInvItems(self,ItAm_Prot_Total_01,1);
//----------------------------------------	
//Alle neuen Ringe
//----------------------------------------
	CreateInvItems(self,ItRi_Dex_01,1);	
	CreateInvItems(self,ItRi_Dex_02,1);
	CreateInvItems(self,ItRi_Hp_01,1);
	CreateInvItems(self,ItRi_Hp_02,1);
	CreateInvItems(self,ItRi_Str_01,1);
	CreateInvItems(self,ItRi_Str_02,1);
	CreateInvItems(self,ItRi_Mana_01,1);
	CreateInvItems(self,ItRi_Mana_02,1);
	CreateInvItems(self,ItRi_Dex_Strg_01,1);
	CreateInvItems(self,ItRi_Hp_Mana_01,1);
	CreateInvItems(self,ItRi_Prot_Fire_01,1);
	CreateInvItems(self,ItRi_Prot_Fire_02,1);
	CreateInvItems(self,ItRi_Prot_Edge_01,1);
	CreateInvItems(self,ItRi_Prot_Edge_02,1);
	CreateInvItems(self,ItRi_Prot_Mage_01,1);
	CreateInvItems(self,ItRi_Prot_Mage_02,1);
	CreateInvItems(self,ItRi_Prot_Point_01,1);
	CreateInvItems(self,ItRi_Prot_Point_02,1);
	CreateInvItems(self,ItRi_Prot_Total_01,1);
	CreateInvItems(self,ItRi_Prot_Total_02,1);
//---------------------------------------------------------------------
//Alle neuen Potions
//---------------------------------------------------------------------
	CreateInvItems  (self, ItPo_Mana_01, 10);
	CreateInvItems  (self, ItPo_Mana_02, 10);
	CreateInvItems  (self, ItPo_Mana_03, 10);
	CreateInvItems  (self, ItPo_Health_01, 10);
	CreateInvItems  (self, ItPo_Health_02, 10);
	CreateInvItems  (self, ItPo_Health_03, 10);
	CreateInvItems  (self, ItPo_Perm_STR, 10);
	CreateInvItems  (self, ItPo_Perm_DEX, 10);
	CreateInvItems  (self, ItPo_Perm_Health, 10);
	CreateInvItems  (self, ItPo_Perm_Mana, 10);
	CreateInvItems  (self, ItPo_Speed, 10);
	CreateInvItems  (self, ItPo_MegaDrink, 10);
//----------------------------------------------------------------------
//	Alle neuen Animaltrophies	
//----------------------------------------------------------------------
	
	CreateInvItems(self,ItAt_Meatbugflesh,10);
	CreateInvItems(self,ItAt_SheepFur,10);
	CreateInvItems(self,ItAt_WolfFur,10);
	CreateInvItems(self,ItAt_BugMandibles,10);
	CreateInvItems(self,ItAt_Claw,10);
	CreateInvItems(self,ItAt_LurkerClaw,10);
	CreateInvItems(self,ItAt_Teeth,10);
	CreateInvItems(self,ItAt_CrawlerMandibles,10);
	CreateInvItems(self,ItAt_Wing,10);
	CreateInvItems(self,ItAt_Sting,10);
	CreateInvItems(self,itat_LurkerSkin,10);
	CreateInvItems(self,ItAt_WargFur,10);
	CreateInvItems(self,ItAt_DrgSnapperHorn,10);
	CreateInvItems(self,ItAt_CrawlerPlate,10);
	CreateInvItems(self,ItAt_ShadowFur,10);
	CreateInvItems(self,ItAt_SharkSkin,10);
	CreateInvItems(self,ItAt_TrollFur,10);
	CreateInvItems(self,ItAt_TrollBlackFur,10);
	CreateInvItems(self,ItAt_WaranFiretongue,10);
	CreateInvItems(self,ItAt_ShadowHorn,10);
	CreateInvItems(self,ItAt_SharkTeeth,10);
	CreateInvItems(self,ItAt_TrollTooth,10);
	CreateInvItems(self,ItAt_GoblinBone,10);
	CreateInvItems(self,ItAt_SkeletonBone,10);
	CreateInvItems(self,ItAt_DemonHeart,10);
	CreateInvItems(self,ItAt_StoneGolemHeart,1);
	CreateInvItems(self,ItAt_FireGolemHeart,1);
	CreateInvItems(self,ItAt_IceGolemHeart,1);
	CreateInvItems(self,ItAt_UndeadDragonSoulStone,1);
	CreateInvItems(self,ItAt_IcedragonHeart,1);
	CreateInvItems(self,ItAt_RockdragonHeart,1);
	CreateInvItems(self,ItAt_SwampdragonHeart,1);
	CreateInvItems(self,ItAt_FiredragonHeart,1);
	CreateInvItems(self,ItAt_DragonBlood,10);
	CreateInvItems(self,ItAt_DragonScale,10);
//----------------------------------------
//	Fakescroll
//----------------------------------------
	CreateInvItems (self, Fakescroll,1);
//----------------------------------------
//	MissionItems_1.d
//----------------------------------------
	CreateInvItems (self, ItKe_Xardas,1);
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS,1);
	CreateInvItems (self, ItMw_2h_Rod,1);
	CreateInvItems (self, ItMi_CoragonsSilber,1);
	CreateInvItems (self, ItMi_TheklasPaket,1);
	CreateInvItems (self, ItMi_MariasGoldPlate,1);
	CreateInvItems (self, ItRi_ValentinosRing,1);
	CreateInvItems (self, ItKe_Dexter,1);
	CreateInvItems (self, ItWr_Kraeuterliste,1);
	CreateInvItems (self, ItWr_ManaRezept,1);
	CreateInvItems (self, ItWr_Passierschein,1);
	CreateInvItems (self, ItMi_HerbPaket,1);
	CreateInvItems (self, ItKe_Storage,1);
	CreateInvItems (self, ItFo_SmellyFish,1);
	CreateInvItems (self, ItFo_HalvorFish_MIS,1);
	CreateInvItems (self, ItWr_HalvorMessage,1);
	CreateInvItems (self, ItMw_AlriksSword_Mis,1);
	CreateInvItems (self, ItWr_VatrasMessage,1);
	CreateInvItems (self, ItWr_VatrasMessage_Open,1);
	CreateInvItems (self, ItKe_Hotel,1);
	CreateInvItems (self, ItKe_ThiefGuildKey_MIS,1);
	CreateInvItems (self, ItKe_ThiefGuildKey_Hotel_MIS,1);
	CreateInvItems (self, ItKe_Innos_MIS,1);
	CreateInvItems (self, ItKe_KlosterSchatz,1);
	CreateInvItems (self, ItKe_KlosterStore,1);
	CreateInvItems (self, ItKe_KDFPlayer,1);
	CreateInvItems (self, ItKe_KlosterBibliothek,1);
	CreateInvItems (self, ItFo_Schafswurst,1);
	CreateInvItems (self, ItPo_Perm_LittleMana,1);
	CreateInvItems (self, Holy_Hammer_MIS,1);
	CreateInvItems(self,ItKe_MagicChest,1);	
	CreateInvItems(self,ItWr_Passage_MIS,1);
	CreateInvItems(self,ItWr_BanditLetter_MIS,1);
	CreateInvItems(self,ItWr_Poster_MIS,1);
	CreateInvItems(self,ItKe_Bandit,1);
	CreateInvItems(self,ItMi_BaltramPaket,1);
	CreateInvItems(self,ItRw_Bow_L_03_MIS,1);
	CreateInvItems(self,ItRi_Prot_Point_01_MIS,1);
	CreateInvItems(self,ItMi_EddasStatue,1);
	CreateInvItems(self,ItKe_EVT_CRYPT_01,1);
	CreateInvItems(self,ItKe_EVT_CRYPT_02,1);
	CreateInvItems(self,ItKe_EVT_CRYPT_03,1);
	CreateInvItems(self,ITAR_PAL_SKEL,1);
	CreateInvItems(self,ItKe_Valentino,1);
	CreateInvItems(self,ItKe_Buerger,1);
	CreateInvItems(self,ItKe_Richter,1);
	CreateInvItems(self,ItKe_Salandril,1);
	CreateInvItems(self,ItKe_PaladinTruhe,1);
	CreateInvItems(self,ItKe_ThiefTreasure,1);
	CreateInvItems(self,ItKe_Fingers,1);
	CreateInvItems(self,ItWr_Schuldenbuch,1);
	CreateInvItems(self,ItPl_Sagitta_Herb_MIS,1);
	CreateInvItems(self,ITKE_ORLAN_HOTELZIMMER,1);
	CreateInvItems(self,ItRw_DragomirsArmbrust_MIS,1);
//----------------------------------------
//	MissionItems_2.d
//----------------------------------------
	CreateInvItems (self, ItMi_StoneOfKnowlegde_MIS,1);
	CreateInvItems (self, ItRu_TeleportOWDemonTower,1);
	CreateInvItems (self, ItWr_PaladinLetter_MIS,1);
	CreateInvItems (self, ItWr_LetterForGorn_MIS,1);
	CreateInvItems (self, ItKe_PrisonKey_MIS,1);
	CreateInvItems (self, ItKe_OC_Store,1);
	CreateInvItems (self, ITKE_ErzBaronFlur,1);
	CreateInvItems (self, ITKE_ErzBaronRaum,1);
	CreateInvItems (self, ItMi_GornsTreasure_MIS,1);
	CreateInvItems (self, ItWr_Silvestro_MIS,1);
	CreateInvItems (self, ItAt_ClawLeader,1);
	CreateInvItems (self, ItSe_Olav,1);
	CreateInvItems (self, ItMi_GoldPlate_MIS,1);
	CreateInvItems (self, ItKe_Pass_MIS,1);
	CreateInvItems (self, ItKe_Bromor,1);
	CreateInvItems (self, ITKE_RUNE_MIS,1);
	CreateInvItems (self, ItWr_Bloody_MIS,1);
	CreateInvItems (self, ItWr_Pfandbrief_MIS,1);
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS,1);
	CreateInvItems (self, ItWr_Manowar,1);
	CreateInvItems (self, ItWr_KDWLetter,1);
	CreateInvItems (self, ItWr_GilbertLetter,1);
//----------------------------------------
//	MissionItems_3.d
//----------------------------------------
	CreateInvItems (self, ItMi_InnosEye_MIS,1);
	CreateInvItems (self, ItMi_InnosEye_Discharged_Mis,1);
	CreateInvItems (self, ItMi_InnosEye_Broken_Mis,1);
	CreateInvItems (self, ItWr_PermissionToWearInnosEye_MIS,1);
	CreateInvItems (self, ItWr_XardasBookForPyrokar_Mis,1);
	CreateInvItems (self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	CreateInvItems (self, ItWr_CorneliusTagebuch_Mis,1);
	CreateInvItems (self, ITWR_DementorObsessionBook_MIS,1);
	CreateInvItems (self, ItWr_PyrokarsObsessionList,1);
	CreateInvItems (self, ItPo_HealHilda_MIS,1);
	CreateInvItems (self, ItMw_MalethsGehstock_MIS,1);
	CreateInvItems (self, ItMi_MalethsBanditGold,1);
	CreateInvItems (self, ItMi_Moleratlubric_MIS,1);
	CreateInvItems (self, ItWr_BabosLetter_MIS,1);
	CreateInvItems (self, ItWr_BabosPinUp_MIS,1);
	CreateInvItems (self, ItWr_BabosDocs_MIS,1);
	CreateInvItems (self, ItKe_IgarazChest_Mis,1);
	CreateInvItems (self, ItWr_Astronomy_Mis,1);
	CreateInvItems (self, ItPo_HealObsession_MIS,1);
	CreateInvItems (self, ItSe_Golemchest_Mis,1);
	CreateInvItems (self, ItWr_ShatteredGolem_MIS,1);
	CreateInvItems (self, ItWr_DiegosLetter_MIS,1);	
	CreateInvItems (self, ItSe_DiegosTreasure_Mis,1);
	CreateInvItems (self, ItMi_UltharsHolyWater_Mis,1);
	CreateInvItems (self, ItWr_MinenAnteil_Mis,1);
	CreateInvItems (self, ItAm_Prot_BlackEye_Mis,1);
	CreateInvItems (self, ItMi_KarrasBlessedStone_Mis,1);
	CreateInvItems (self, ItWr_RichterKomproBrief_MIS,1);
	CreateInvItems (self, ItWr_MorgahardTip,1);
	CreateInvItems (self, ItWr_Map_Shrine_MIS,1);
	CreateInvItems (self, ItWr_VinosKellergeister_Mis,1);	
//----------------------------------------
//	MissionItems_4.d
//----------------------------------------
	CreateInvItems (self, ItAm_Mana_Angar_MIS,1);
	CreateInvItems (self, ItMW_1H_FerrosSword_Mis,1);
	CreateInvItems (self, ItMi_KerolothsGeldbeutel_MIS,1);
	CreateInvItems (self, ItMi_KerolothsGeldbeutelLeer_MIS,1);
	CreateInvItems (self, ItRw_SengrathsArmbrust_MIS,1);
	CreateInvItems (self, ItAt_TalbinsLurkerSkin,1);
	CreateInvItems (self, ItAt_DragonEgg_MIS,1);
	CreateInvItems (self, ItRi_OrcEliteRing,1);
	CreateInvItems (self, ItPo_DragonEggDrinkNeoras_MIS,1);
	CreateInvItems (self, ItWr_Map_Orcelite_MIS,1);
	CreateInvItems (self, ItWr_Map_Caves_MIS,1);
//----------------------------------------
//	MissionItems_5.d
//----------------------------------------
	CreateInvItems (self, ItWr_XardasLetterToOpenBook_MIS,1);
	CreateInvItems (self, ItKe_MonastarySecretLibrary_Mis,1);
	CreateInvItems (self, ItWr_HallsofIrdorath_Mis,1);
	CreateInvItems (self, ItWr_HallsofIrdorath_Open_Mis,1);
	CreateInvItems (self, ItWr_XardasSeamapBook_Mis,1);
	CreateInvItems (self, ItWr_Seamap_Irdorath,1);
	CreateInvItems (self, ITWr_ForgedShipLetter_MIS,1);
	CreateInvItems (self, ITKE_OC_MAINGATE_MIS,1);
	CreateInvItems (self, ITKE_SHIP_LEVELCHANGE_MIS,1);
	CreateInvItems (self, ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems (self, ItPo_PotionOfDeath_02_Mis,1);
	CreateInvItems (self, ItAm_AmulettOfDeath_Mis,1);
	CreateInvItems (self, ItPo_HealRandolph_MIS,1);
//----------------------------------------
//	MissionItems_6.d
//----------------------------------------
	CreateInvItems (self, ItSe_XardasNotfallBeutel_MIS,1);
	CreateInvItems (self, ItWr_XardasErmahnungFuerIdioten_MIS,1);
	CreateInvItems (self, ItWr_Krypta_Garon,1);
	CreateInvItems (self, ItKe_OrkKnastDI_MIS,1);
	CreateInvItems (self, ItKe_EVT_UNDEAD_01,1);
	CreateInvItems (self, ItKe_EVT_UNDEAD_02,1);
	CreateInvItems (self, ItKe_LastDoorToUndeadDrgDI_MIS,1);
	CreateInvItems (self, ItWr_LastDoorToUndeadDrgDI_MIS,1);
	CreateInvItems (self, ItKe_ChestMasterDementor_MIS,1);
	CreateInvItems (self, ItWr_Rezept_MegaDrink_MIS,1);
	CreateInvItems (self, ItWr_Diary_BlackNovice_MIS,1);
	CreateInvItems (self, ItWr_ZugBruecke_MIS,1);
	CreateInvItems (self, ItMi_PowerEye,1);		

};



