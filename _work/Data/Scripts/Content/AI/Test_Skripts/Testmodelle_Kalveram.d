//#########################################
//##
//##	Allgemeine Hinweise
//##
//#########################################
/*
*********************************************************************************************
VOR DEM SCHIFF:
*********************************************************************************************

NW_WAITFOR_SHIP_CAPTAIN 			1x TA_Sit_Bench
	alle drei Captains
 
NW_WAITFOR_SHIP_01 					1x TA_Sit_Bench, 2x TA_Stand_
	Lee 	-> Stand_Guarding
	Mario	-> Stand_Drinking
	Wolf 	-> Sit_Bench	

NW_CITY_WAY_TO_SHIP_19 				2x TA_Smalltalk
	Lester	->Smalltalk
	Milten	->Smalltalk

NW_WAITFOR_SHIP_05 
	Diego 	->Smalltalk
	Lares 	->Smalltalk				2x TA_Smalltalk, 2x TA_Stand_
	Bennet  ->Stand
	GornNW_nach_DJG	->Stand
	
NW_WAITFOR_SHIP_03 					2x TA_Smalltalk, 2x TA_Stand_
	Biff 	->Stand
	Angar 	-> Stand
NW_WAITFOR_SHIP_04 					1x TA_Sit_Bench, 2x TA_Stand_
	Vatras 	->TA_SIT_BENCH

*********************************************************************************************
AUF DEM SCHIFF:
*********************************************************************************************
SHIP_CREW_CAPTAIN 			1x TA_STAND_WP
	alle drei Captains
 
SHIP_CREW_01 					1x TA_Sit_Bench, 2x TA_Stand_
	Lee 	-> Stand_Guarding
	Mario	-> Stand_Drinking
	Wolf 	-> Sit_Bench	

SHIP_CREW_19 				2x TA_Smalltalk
	Lester	->Smalltalk
	Milten	->Smalltalk

SHIP_CREW_05 	2x TA_Smalltalk, 1x TA_Stand_
	Lares 	->Smalltalk				
	Diego	->Smalltalk	

SHIP_CREW_03 					2x TA_Smalltalk, 2x TA_Stand_
	Angar
	Girion
SHIP_CREW_04 					1x TA_Sit_Bench, 2x TA_Stand_


	Gorn 	->Patroll
	Biff 	->Patroll
	Wolf 	->Patroll

*/

instance Itemhoshi (Npc_Default)
{
	// ------ NSC ------
	name 		= "Itemhoshi";
	guild 		= GIL_MIL;
	id 			= 1500;
	voice 		= 3;
	flags       = NPC_FLAG_IMMORTAL;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
// ------ Inventory ------

//------------------------------------------------------------
//	Alle Waffen 
//------------------------------------------------------------
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
	CreateInvItems (self, ItMw_2H_OrcSword_02,1);
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
	CreateInvItems (self, ItMw_Zweihaender4,1);
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
//BeliarsWaffe
	CreateInvItems (self, ItMw_BeliarWeapon_1H_01,1);
	CreateInvItems (self, ItMw_BeliarWeapon_2H_01,1);
	CreateInvItems (self, ItMw_BeliarWeapon_Raven,1);
//Addon
	CreateInvItems (self, ItMW_Addon_Knife01,1);
	CreateInvItems (self, ItMW_Addon_Stab01,1);
	CreateInvItems (self, ItMW_Addon_Stab02,1);
	CreateInvItems (self, ItMW_Addon_Stab03,1);
	CreateInvItems (self, ItMW_Addon_Stab04,1);
	CreateInvItems (self, ItMW_Addon_Stab05,1);
	CreateInvItems (self, ItMW_Addon_Hacker_1h_01,1);
	CreateInvItems (self, ItMW_Addon_Hacker_1h_02,1);
	CreateInvItems (self, ItMW_Addon_Hacker_2h_01,1);
	CreateInvItems (self, ItMW_Addon_Hacker_2h_02,1);
	CreateInvItems (self, ItMW_Addon_Keule_1h_01,1);
	CreateInvItems (self, ItMW_Addon_Keule_2h_01,1);
	CreateInvItems (self, ItMw_FrancisDagger_Mis,1);
	CreateInvItems (self, ItMw_RangerStaff_Addon,1);
	CreateInvItems (self, ItMw_Addon_PIR2hAxe,1);
	CreateInvItems (self, ItMw_Addon_PIR2hSword,1);
	CreateInvItems (self, ItMw_Addon_PIR1hAxe,1);
	CreateInvItems (self, ItMw_Addon_PIR1hSword,1);
	CreateInvItems (self, ItMw_Addon_BanditTrader,1);
	CreateInvItems (self, ItMw_Addon_Betty,1);

//------------------------------------------------------------
//	Alle Armor
//------------------------------------------------------------
	//Gothic2
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
	CreateInvItems(self,ITAR_PIR_L_Addon,1);
	CreateInvItems(self,ITAR_PIR_M_Addon,1);
	CreateInvItems(self,ITAR_PIR_H_Addon,1);
	CreateInvItems(self,ITAR_Thorus_Addon,1);
	CreateInvItems(self,ITAR_Raven_Addon,1);
	CreateInvItems(self,ITAR_OreBaron_Addon,1);
	CreateInvItems(self,ITAR_RANGER_Addon,1);
	CreateInvItems(self,ITAR_Fake_RANGER,1);
	CreateInvItems(self,ITAR_KDW_L_Addon,1);
	CreateInvItems(self,ITAR_BLOODWYN_Addon,1);
	CreateInvItems(self,ITAR_MayaZombie_Addon,1);
	CreateInvItems(self,ItAr_FireArmor_Addon,1);
	
//------------------------------------------------------------
//	Alle Runen
//------------------------------------------------------------
//Gothic2
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
	CreateInvItems(self,ItRu_TeleportOWDemonTower,1);
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
	CreateInvItems(self,ItRu_Deathbolt,1);
	CreateInvItems(self,ItRu_Deathball,1);
	CreateInvItems(self,ItRu_Concussionbolt,1);
//Addon
	CreateInvItems(self,ItRu_Thunderstorm,1);
	CreateInvItems(self,ItRu_Whirlwind,1);
	CreateInvItems(self,ItRu_Geyser,1);
	CreateInvItems(self,ItRu_Waterfist,1);
	CreateInvItems(self,ItRu_Icelance,1);
	CreateInvItems(self,ItRu_BeliarsRage,1);
	CreateInvItems(self,ItRu_SuckEnergy,1);
	CreateInvItems(self,ItRu_GreenTentacle,1);
	CreateInvItems(self,ItRu_Swarm,1);
	CreateInvItems(self,ItRu_Skull,1);
	CreateInvItems(self,ItRu_SummonZombie,1);
	CreateInvItems(self,ItRu_SummonGuardian,1);
//------------------------------------------------------------
//	Alle Scrolls
//------------------------------------------------------------
	CreateInvItems(self,ItSc_PalLight,10);
	CreateInvItems(self,ItSc_PalLightHeal,10);
	CreateInvItems(self,ItSc_PalHolyBolt,10);
	CreateInvItems(self,ItSc_PalMediumHeal,10);
	CreateInvItems(self,ItSc_PalRepelEvil,10);
	CreateInvItems(self,ItSc_PalFullHeal,10);
	CreateInvItems(self,ItSc_PalDestroyEvil,10);
	CreateInvItems(self,ItSc_Charm, 10);
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
//Addon
	CreateInvItems(self,ItSc_Geyser,10);
	CreateInvItems(self,ItSc_Icelance,10);
	CreateInvItems(self,ItSc_Waterfist,10);
	CreateInvItems(self,ItSc_Thunderstorm,10);
	CreateInvItems(self,ItSc_Whirlwind,10);

//------------------------------------------------------------
//	Alle Secrets
//------------------------------------------------------------
//Gothic2
	CreateInvItems(self,ItSe_ErzFisch,1);
	CreateInvItems(self,ItSe_GoldFisch,1);
	CreateInvItems(self,ItSe_Ringfisch,1);
	CreateInvItems(self,ItSe_LockpickFisch,1);
	CreateInvItems(self,ItSe_GoldPocket25,1);
	CreateInvItems(self,ItSe_GoldPocket50,1);
	CreateInvItems(self,ItSe_GoldPocket100,1);
	CreateInvItems(self,ItSe_HannasBeutel,1);
//------------------------------------------------------------
//	Alle Written
//------------------------------------------------------------
//Gothic2
	CreateInvItems(self,Fakescroll,1);	
	CreateInvItems(self,StandardBrief,1);
	CreateInvItems(self,StandardBuch,1);
	CreateInvItems(self,ItWr_Map_NewWorld,1);
	CreateInvItems(self,ItWr_Map_NewWorld_City,1);
	CreateInvItems(self,ItWr_Map_OldWorld,1);
	CreateInvItems(self,ItWr_EinhandBuch,1);
	CreateInvItems(self,ItWr_ZweihandBuch,1);
//Addon		
	CreateInvItems(self,ItWr_Addon_BookXP250,1);
	CreateInvItems(self,ItWr_Addon_BookXP500,1);
	CreateInvItems(self,ItWr_Addon_BookXP1000,1);
	CreateInvItems(self,ItWr_Addon_LPBook,1);
	CreateInvItems(self,ItWr_Addon_BookLP2,1);
	CreateInvItems(self,ItWr_Addon_BookLP3,1);
	CreateInvItems(self,ItWr_Addon_BookLP5,1);
	CreateInvItems(self,ItWr_Addon_BookLP8,1);
	CreateInvItems(self,ItWr_StrStonePlate1_Addon,1);
	CreateInvItems(self,ItWr_StrStonePlate2_Addon,1);
	CreateInvItems(self,ItWr_StrStonePlate3_Addon,1);
	CreateInvItems(self,ItWr_DexStonePlate1_Addon,1);
	CreateInvItems(self,ItWr_DexStonePlate2_Addon,1);
	CreateInvItems(self,ItWr_DexStonePlate3_Addon,1);
	CreateInvItems(self,ItWr_HitPointStonePlate1_Addon,1);
	CreateInvItems(self,ItWr_HitPointStonePlate2_Addon,1);
	CreateInvItems(self,ItWr_HitPointStonePlate3_Addon,1);
	CreateInvItems(self,ItWr_ManaStonePlate1_Addon,1);
	CreateInvItems(self,ItWr_ManaStonePlate2_Addon,1);
	CreateInvItems(self,ItWr_ManaStonePlate3_Addon,1);
	CreateInvItems(self,ItWr_OneHStonePlate1_Addon,1);
	CreateInvItems(self,ItWr_OneHStonePlate2_Addon,1);
	CreateInvItems(self,ItWr_OneHStonePlate3_Addon,1);
	CreateInvItems(self,ItWr_TwoHStonePlate1_Addon,1);
	CreateInvItems(self,ItWr_TwoHStonePlate2_Addon,1);
	CreateInvItems(self,ItWr_TwoHStonePlate3_Addon,1);
	CreateInvItems(self,ItWr_BowStonePlate1_Addon,1);
	CreateInvItems(self,ItWr_BowStonePlate2_Addon,1);
	CreateInvItems(self,ItWr_BowStonePlate3_Addon,1);
	CreateInvItems(self,ItWr_CrsBowStonePlate1_Addon,1);
	CreateInvItems(self,ItWr_CrsBowStonePlate2_Addon,1);
	CreateInvItems(self,ItWr_CrsBowStonePlate3_Addon,1);
	CreateInvItems(self,ITWr_Addon_Hinweis_02,1);
	CreateInvItems(self,ITWr_Addon_Health_04,1);
	CreateInvItems(self,ITWr_Addon_Mana_04,1);
	CreateInvItems(self,ITWr_Addon_Hinweis_01,1);
	CreateInvItems(self,ITWr_Addon_William_01,1);
	CreateInvItems(self,ITWr_Addon_MCELIXIER_01,1);
	CreateInvItems(self,ITWr_Addon_Pirates_01,1);
	CreateInvItems(self,ITWr_Addon_Joint_01,1);
	CreateInvItems(self,ITWr_Addon_Lou_Rezept,1);
	CreateInvItems(self,ITWr_Addon_Lou_Rezept2,1);
	CreateInvItems(self,ITWr_Addon_Piratentod,1);
	CreateInvItems(self,Fakescroll_Addon,1);
	CreateInvItems(self,ItWr_Addon_AxtAnleitung,1);
	CreateInvItems(self,ItWr_Addon_SUMMONANCIENTGHOST,1);
	CreateInvItems(self,ItWr_Map_AddonWorld,1);
	
	CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC1,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC2,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC3,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC4,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC5,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDW_CIRC6,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDF_CIRC1,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDF_CIRC2,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDF_CIRC3,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDF_CIRC4,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDF_CIRC5,1);
	CreateInvItems(self,ITWR_Addon_Runemaking_KDF_CIRC6,1);
	
//------------------------------------------------------------
//	Alle Food
//------------------------------------------------------------
//Gothic2
	CreateInvItems(self,ItFo_Apple,10);
	CreateInvItems(self,ItFo_Cheese,10);
	CreateInvItems(self,ItFo_Bacon,10);
	CreateInvItems(self,ItFo_Bread,10);
	CreateInvItems(self,ItFo_Fish,10);
	CreateInvItems(self,ItFoMuttonRaw,10);
	CreateInvItems(self,ItFoMutton,10);
	CreateInvItems(self,ItFo_Stew,10);
	CreateInvItems(self,ItFo_XPStew,10);
	CreateInvItems(self,ItFo_FishSoup,10);
	CreateInvItems(self,ItFo_Sausage,10);
	CreateInvItems(self,ItFo_Honey,10);
	CreateInvItems(self,ItFo_Water,10);
	CreateInvItems(self,ItFo_Beer,10);
	CreateInvItems(self,ItFo_CoragonsBeer,10);
	CreateInvItems(self,ItFo_Booze,10);
	CreateInvItems(self,ItFo_Wine,10);
	CreateInvItems(self,ItFo_Milk,10);
//Addon	
	CreateInvItems(self,ItFo_Addon_Shellflesh,10);
	CreateInvItems(self,ItFo_Addon_Rum,10);
	CreateInvItems(self,ItFo_Addon_Grog,10);
	CreateInvItems(self,ItFo_Addon_LousHammer,10);
	CreateInvItems(self,ItFo_Addon_SchlafHammer,10);
	CreateInvItems(self,ItFo_Addon_SchnellerHering,10);
	CreateInvItems(self,ItFo_Addon_Pfeffer_01,10);
	CreateInvItems(self,ItFo_Addon_FireStew,10);
	CreateInvItems(self,ItFo_Addon_Meatsoup,10);

//------------------------------------------------------------
//	Alle Plants
//------------------------------------------------------------
//Gothic2
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
	CreateInvItems(self,ItPl_Weed,10);
	CreateInvItems(self,ItPl_Beet,10);
//Addon
//------------------------------------------------------------
//	Alle Keys
//------------------------------------------------------------
//Gothic2
	CreateInvItems(self,ItKe_Key_01,1);
	CreateInvItems(self,ItKe_Key_02,1);
	CreateInvItems(self,ItKe_Key_03,1);
	CreateInvItems(self,ItKe_Lockpick,10);
	CreateInvItems(self,ItKe_City_Tower_01,1);
	CreateInvItems(self,ItKe_City_Tower_02,1);
	CreateInvItems(self,ItKe_City_Tower_03,1);
	CreateInvItems(self,ItKe_City_Tower_04,1);
	CreateInvItems(self,ItKe_City_Tower_05,1);
	CreateInvItems(self,ItKe_City_Tower_06,1);
//Addon	
	CreateInvItem(self,ITKE_PORTALTEMPELWALKTHROUGH_ADDON);
	CreateInvItem(self,ITKE_Greg_ADDON_MIS);
	CreateInvItem(self,ITKE_Addon_Tavern_01);
	CreateInvItem(self,ITKE_Addon_Esteban_01);
	CreateInvItem(self,ITKE_ORLAN_TELEPORTSTATION);
	CreateInvItem(self,ITKE_CANYONLIBRARY_HIERARCHY_BOOKS_ADDON);
	CreateInvItem(self,ITKE_ADDON_BUDDLER_01);
	CreateInvItem(self,ITKE_ADDON_SKINNER);
	CreateInvItem(self,ITKE_Addon_Thorus);
//------------------------------------------------------------
//	Alle Fackeln
//------------------------------------------------------------
	CreateInvItems(self,ItLsTorch,50);

//------------------------------------------------------------
//	Alle Misc
//------------------------------------------------------------
//Gothic2
	CreateInvItems(self,ItMi_Pan,1);
	CreateInvItems(self,ItMi_PanFull,1);
	CreateInvItems(self,ItMi_Saw,1);
	CreateInvItems(self,ItMi_Pliers,1);
	CreateInvItems(self,ItMi_Brush,1);
	CreateInvItems(self,ItMi_Flask,1);
	CreateInvItems(self,ItMi_Stomper,1);
	CreateInvItems(self,ItMi_Broom,1);
	CreateInvItems(self,ItMi_Rake,1);
	CreateInvItems(self,ItMi_Hammer,1);
	CreateInvItems(self,ItMi_Scoop,1);
	CreateInvItems(self,ItMi_Nugget,1);
	CreateInvItems(self,ItMi_Joint,1);
	CreateInvItems(self,ItMi_Lute,1);
	CreateInvItems (self,ItMi_Gold, 1000);
	CreateInvItems (self,ItMi_OldCoin,1);
	CreateInvItems(self,ItMiSwordraw,1);
	CreateInvItems(self,ItMiSwordrawhot,1);
	CreateInvItems(self,ItMiSwordbladehot,1);
	CreateInvItems(self,ItMiSwordblade,1);
	CreateInvItems(self,ItMi_RuneBlank,1);
	CreateInvItems(self,ItMi_Sulfur,1);
	CreateInvItems(self,ItMi_Quartz,1);
	CreateInvItems(self,ItMi_Pitch,1);
	CreateInvItems(self,ItMi_Rockcrystal,1);
	CreateInvItems(self,ItMi_Aquamarine,1);
	CreateInvItems(self,ItMi_HolyWater,1);
	CreateInvItems(self,ItMi_Coal,1);
	CreateInvItems(self,ItMi_DarkPearl,1);
	CreateInvItems(self,ItMi_GoldCandleHolder,1);
	CreateInvItems(self,ItMi_GoldNecklace,1);
	CreateInvItems(self,ItMi_GoldCup,1);
	CreateInvItems(self,ItMi_GoldChalice,1);
	CreateInvItems(self,ItMi_GoldChest,1);
	CreateInvItems(self,ItMi_GoldRing,1);
	CreateInvItems(self,ItMi_GoldPlate,1);	
	CreateInvItems(self,ItMi_SilverChalice,1);
	CreateInvItems(self,ItMi_JeweleryChest,1);
	CreateInvItems(self,ItMi_InnosStatue,1);
	CreateInvItems(self,ItMi_SilverRing,1);
	CreateInvItems(self,ItMi_SilverChalice,1);
	CreateInvItems(self,ItMi_SilverCup,1);
	CreateInvItems(self,ItMi_SilverPlate,1);
	CreateInvItems(self,ItMi_SilverNecklace,1);
	CreateInvItems(self,ItMi_SilverCandleHolder,1);
	CreateInvItems(self,ItMi_Sextant,1);
	CreateInvItems(self,ItMi_Packet,1);
	CreateInvItems(self,ItMi_Pocket,1);
	CreateInvItems(self,ItMi_BloodCup_MIS,1);
	CreateInvItems(self,ItMi_ApfelTabak,1);
	CreateInvItems(self,ItMi_PilzTabak,1);
	CreateInvItems(self,ItMi_DoppelTabak,1);
	CreateInvItems(self,ItMi_Honigtabak,1);
	CreateInvItems(self,ItMi_SumpfTabak,1);
//Addon	
	CreateInvItems(self,ItMi_GoldNugget_Addon,10);
	CreateInvItems(self,ItMi_Addon_WhitePearl,10);
	CreateInvItems(self,ItMi_Addon_Joint_01,10);
	CreateInvItems(self,ItMi_BaltramPaket,10);
	CreateInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	CreateInvItems(self,ItMi_BromorsGeld_Addon,10);
	CreateInvItems(self,ItSe_ADDON_CavalornsBeutel,10);
	CreateInvItems(self,ItMi_Skull,1);
	CreateInvItems(self,ItMi_Addon_Shell_01,10);
	CreateInvItems(self,ItMi_Addon_Shell_02,10);

//------------------------------------------------------------
//	Ranged Weapons
//------------------------------------------------------------
//Gothic2
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
	CreateInvItems(self,ItRw_Sld_Bow,1);
	CreateInvItems(self,ItRw_Mil_Crossbow,1);
	
	CreateInvItems(self,ItRw_Arrow,1000);
	CreateInvItems(self,ItRw_Bolt,1000);
//Addon
	CreateInvItems(self,ItRw_Addon_MagicBow,1);
	CreateInvItems(self,ItRw_Addon_MagicCrossbow,1);
	CreateInvItems(self,ItRw_Addon_MagicArrow,100);
	CreateInvItems(self,ItRw_Addon_MagicBolt,100);

//------------------------------------------------------------
//	Alle Gürtel
//------------------------------------------------------------	
//Gothic2

//Addon
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
//	Alle Amulette
//-----------------------------------------------------------
//Gothic2
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
//Addon	
	CreateInvItem(self,ItAm_Addon_Franco);
	CreateInvItem(self,ItAm_Addon_Health);
	CreateInvItem(self,ItAm_Addon_MANA);
	CreateInvItem(self,ItAm_Addon_STR);
	
	
//------------------------------------------------------------	
//	Alle Ringe
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
//Addon
	CreateInvItem(self,ItRi_Addon_Health_01);
	CreateInvItem(self,ItRi_Addon_Health_02);
	CreateInvItem(self,ItRi_Addon_MANA_01);
	CreateInvItem(self,ItRi_Addon_MANA_02);
	CreateInvItem(self,ItRi_Addon_STR_01);
	CreateInvItem(self,ItRi_Addon_STR_02);
//------------------------------------------------------------
//	Alle Potions
//------------------------------------------------------------
//Gothic2
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
//Addon
	CreateInvItems  (self, ItPo_Addon_Geist_01, 10);
	CreateInvItems  (self, ItPo_Addon_Geist_02, 10);
	CreateInvItems  (self, ItPo_Health_Addon_04, 10);
	CreateInvItems  (self, ItPo_Mana_Addon_04, 10);	

//------------------------------------------------------------
//	Alle Animaltrophies	
//------------------------------------------------------------
//Gothic2	
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
	CreateInvItems(self,ItAt_StoneGolemHeart,10);
	CreateInvItems(self,ItAt_FireGolemHeart,10);
	CreateInvItems(self,ItAt_IceGolemHeart,10);
	CreateInvItems(self,ItAt_UndeadDragonSoulStone,10);
	CreateInvItems(self,ItAt_IcedragonHeart,10);
	CreateInvItems(self,ItAt_RockdragonHeart,10);
	CreateInvItems(self,ItAt_SwampdragonHeart,10);
	CreateInvItems(self,ItAt_FiredragonHeart,10);
	CreateInvItems(self,ItAt_DragonBlood,10);
	CreateInvItems(self,ItAt_DragonScale,10);
//Addon
	CreateInvItems(self,ItAt_Addon_BCKopf,10);
	CreateInvItems(self,ItAt_Addon_KeilerFur,10);
//------------------------------------------------------------
//	Alle Missionitems
//------------------------------------------------------------
	CreateInvItems(self,ItKe_Xardas,1);
	CreateInvItems(self,ItWr_Canthars_KomproBrief_MIS,1);
	CreateInvItems(self,ItMw_2h_Rod,1);
	CreateInvItems(self,ItMi_CoragonsSilber,1);
	CreateInvItems(self,ItMi_TheklasPaket,1);
	CreateInvItems(self,ItMi_MariasGoldPlate,1);
	CreateInvItems(self,ItRi_ValentinosRing,1);
	CreateInvItems(self,ItKe_Dexter,1);
	CreateInvItems(self,ItWr_Kraeuterliste,1);
	CreateInvItems(self,ItWr_ManaRezept,1);
	CreateInvItems(self,ItWr_Passierschein,1);
	CreateInvItems(self,ItMi_HerbPaket,1);
	CreateInvItems(self,ItKe_Storage,1);
	CreateInvItems(self,ItFo_SmellyFish,1);
	CreateInvItems(self,ItFo_HalvorFish_MIS,1);
	CreateInvItems(self,ItWr_HalvorMessage,1);
	CreateInvItems(self,ItMw_AlriksSword_Mis,1);
	CreateInvItems(self,ItWr_VatrasMessage,1);
	CreateInvItems(self,ItWr_VatrasMessage_Open,1);
	CreateInvItems(self,ItKe_Hotel,1);
	CreateInvItems(self,ItKe_ThiefGuildKey_MIS,1);
	CreateInvItems(self,ItKe_ThiefGuildKey_Hotel_MIS,1);
	CreateInvItems(self,ItKe_Innos_MIS,1);
	CreateInvItems(self,ItKe_KlosterSchatz,1);
	CreateInvItems(self,ItKe_KlosterStore,1);
	CreateInvItems(self,ItKe_KDFPlayer,1);
	CreateInvItems(self,ItKe_KlosterBibliothek,1);
	CreateInvItems(self,ItFo_Schafswurst,1);
	CreateInvItems(self,ItPo_Perm_LittleMana,1);
	CreateInvItems(self,Holy_Hammer_MIS,1);
	CreateInvItems(self,ItKe_MagicChest,1);
	CreateInvItems(self,ItWr_Passage_MIS,1);
	CreateInvItems(self,ItWr_BanditLetter_MIS,1);
	CreateInvItems(self,ItWr_Poster_MIS,1);
	CreateInvItems(self,ItKe_Bandit,1);
	CreateInvItems(self,ItRw_Bow_L_03_MIS,1);
	CreateInvItems(self,ItRi_Prot_Point_01_MIS,1);
	CreateInvItems(self,ItMi_EddasStatue,1);
	CreateInvItems(self,ItKe_EVT_CRYPT_01,1);
	CreateInvItems(self,ItKe_EVT_CRYPT_02,1);
	CreateInvItems(self,ItKe_EVT_CRYPT_03,1);
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
	CreateInvItems(self,ItMi_StoneOfKnowlegde_MIS,1);
	CreateInvItems(self,ItWr_PaladinLetter_MIS,1);
	CreateInvItems(self,ItWr_LetterForGorn_MIS,1);
	CreateInvItems(self,ItKe_PrisonKey_MIS,1);
	CreateInvItems(self,ItKe_OC_Store,1);
	CreateInvItems(self,ITKE_ErzBaronFlur,1);
	CreateInvItems(self,ITKE_ErzBaronRaum,1);
	CreateInvItems(self,ItMi_GornsTreasure_MIS,1);
	CreateInvItems(self,ItWr_Silvestro_MIS,1);
	CreateInvItems(self,ItAt_ClawLeader,1);
	CreateInvItems(self,ItSe_Olav,1);
	CreateInvItems(self,ItMi_GoldPlate_MIS,1);
	CreateInvItems(self,ItKe_Pass_MIS,1);
	CreateInvItems(self,ItKe_Bromor,1);
	CreateInvItems(self,ITKE_RUNE_MIS,1);
	CreateInvItems(self,ItWr_Bloody_MIS,1);
	CreateInvItems(self,ItWr_Pfandbrief_MIS,1);
	CreateInvItems(self,ItWr_Map_OldWorld_Oremines_MIS,1);
	CreateInvItems(self,ItWr_Manowar,1);
	CreateInvItems(self,ItWr_KDWLetter,1);
	CreateInvItems(self,ItWr_GilbertLetter,1);
	CreateInvItems(self,ItRi_Tengron,1);
	CreateInvItems(self,ItMi_InnosEye_MIS,1);
	CreateInvItems(self,ItMi_InnosEye_Discharged_Mis,1);
	CreateInvItems(self,ItMi_InnosEye_Broken_Mis,1);
	CreateInvItems(self,ItWr_PermissionToWearInnosEye_MIS,1);
	CreateInvItems(self,ItWr_XardasBookForPyrokar_Mis,1);
	CreateInvItems(self,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	CreateInvItems(self,ItWr_CorneliusTagebuch_Mis,1);
	CreateInvItems(self,ITWR_DementorObsessionBook_MIS,1);
	CreateInvItems(self,ItWr_PyrokarsObsessionList,1);
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	CreateInvItems(self,ItMw_MalethsGehstock_MIS,1);
	CreateInvItems(self,ItMi_MalethsBanditGold,1);
	CreateInvItems(self,ItMi_Moleratlubric_MIS,1);
	CreateInvItems(self,ItWr_BabosLetter_MIS,1);
	CreateInvItems(self,ItWr_BabosPinUp_MIS,1);
	CreateInvItems(self,ItWr_BabosDocs_MIS,1);
	CreateInvItems(self,ItKe_IgarazChest_Mis,1);
	CreateInvItems(self,ItWr_Astronomy_Mis,1);
	CreateInvItems(self,ItPo_HealObsession_MIS,1);
	CreateInvItems(self,ItSe_Golemchest_Mis,1);
	CreateInvItems(self,ItWr_ShatteredGolem_MIS,1);
	CreateInvItems(self,ItWr_DiegosLetter_MIS,1);
	CreateInvItems(self,ItSe_DiegosTreasure_Mis,1);
	CreateInvItems(self,ItMi_UltharsHolyWater_Mis,1);
	CreateInvItems(self,ItWr_MinenAnteil_Mis,1);
	CreateInvItems(self,ItAm_Prot_BlackEye_Mis,1);
	CreateInvItems(self,ItMi_KarrasBlessedStone_Mis,1);
	CreateInvItems(self,ItWr_RichterKomproBrief_MIS,1);
	CreateInvItems(self,ItWr_MorgahardTip,1);
	CreateInvItems(self,ItWr_Map_Shrine_MIS,1);
	CreateInvItems(self,ItWr_VinosKellergeister_Mis,1);
	CreateInvItems(self,ItAm_Mana_Angar_MIS,1);
	CreateInvItems(self,ItMW_1H_FerrosSword_Mis,1);
	CreateInvItems(self,ItMi_KerolothsGeldbeutel_MIS,1);
	CreateInvItems(self,ItMi_KerolothsGeldbeutelLeer_MIS,1);
	CreateInvItems(self,ItRw_SengrathsArmbrust_MIS,1);
	CreateInvItems(self,ItAt_TalbinsLurkerSkin,1);
	CreateInvItems(self,ItAt_DragonEgg_MIS,1);
	CreateInvItems(self,ItRi_OrcEliteRing,1);
	CreateInvItems(self,ItPo_DragonEggDrinkNeoras_MIS,1);
	CreateInvItems(self,ItWr_Map_Orcelite_MIS,1);
	CreateInvItems(self,ItWr_Map_Caves_MIS,1);
	CreateInvItems(self,ItWr_XardasLetterToOpenBook_MIS,1);
	CreateInvItems(self,ItKe_MonastarySecretLibrary_Mis,1);
	CreateInvItems(self,ItWr_HallsofIrdorath_Mis,1);
	CreateInvItems(self,ItWr_HallsofIrdorath_Open_Mis,1);
	CreateInvItems(self,ItWr_XardasSeamapBook_Mis,1);
	CreateInvItems(self,ItWr_UseLampIdiot_Mis,1);
	CreateInvItems(self,ItWr_Seamap_Irdorath,1);
	CreateInvItems(self,ItMi_KerolothsGeldbeutel_MIS,1);
	CreateInvItems(self,ITWr_ForgedShipLetter_MIS,1);
	CreateInvItems(self,ITKE_OC_MAINGATE_MIS,1);
	CreateInvItems(self,ITKE_SHIP_LEVELCHANGE_MIS,1);
	CreateInvItems(self,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems(self,ItPo_PotionOfDeath_02_Mis,1);
	CreateInvItems(self,ItAm_AmulettOfDeath_Mis,1);
	CreateInvItems(self,ItPo_HealRandolph_MIS,1);
	CreateInvItems(self,ItSe_XardasNotfallBeutel_MIS,1);
	CreateInvItems(self,ItWr_XardasErmahnungFuerIdioten_MIS,1);
	CreateInvItems(self,ItWr_Krypta_Garon,1);
	CreateInvItems(self,ItKe_OrkKnastDI_MIS,1);
	CreateInvItems(self,ItKe_EVT_UNDEAD_01,1);
	CreateInvItems(self,ItKe_EVT_UNDEAD_02,1);
	CreateInvItems(self,ItKe_LastDoorToUndeadDrgDI_MIS,1);
	CreateInvItems(self,ItWr_LastDoorToUndeadDrgDI_MIS,1);
	CreateInvItems(self,ItKe_ChestMasterDementor_MIS,1);
	CreateInvItems(self,ItWr_Rezept_MegaDrink_MIS,1);
	CreateInvItems(self,ItWr_Diary_BlackNovice_MIS,1);
	CreateInvItems(self,ItWr_ZugBruecke_MIS,1);
	CreateInvItems(self,ItMi_PowerEye,1);
//Addon
	CreateInvItems(self,ItWr_SaturasFirstMessage_Addon_Sealed,1);
	CreateInvItems(self,ItWr_SaturasFirstMessage_Addon,1);
	CreateInvItems(self,ItMi_Ornament_Addon,1);
	CreateInvItems(self,ItMi_Ornament_Addon_Vatras,1);
	CreateInvItems(self,ItWr_Map_NewWorld_Ornaments_Addon,1);
	CreateInvItems(self,ItWr_Map_NewWorld_Dexter,1);
	CreateInvItems(self,ItRi_Ranger_Lares_Addon,1);
	CreateInvItems(self,ItRi_Ranger_Addon,1);
	CreateInvItems(self,ItRi_LanceRing,1);
	CreateInvItems(self,ItMi_PortalRing_Addon,1);
	CreateInvItems(self,ItWr_Martin_MilizEmpfehlung_Addon,1);
	CreateInvItems(self,ItWr_RavensKidnapperMission_Addon,1);
	CreateInvItems(self,ItWr_Vatras_KDFEmpfehlung_Addon,1);
	CreateInvItems(self,ItMi_LostInnosStatue_Daron,1);
	CreateInvItems(self,ItWr_LuciasLoveLetter_Addon,1);
	CreateInvItems(self,ItMi_AmbossEffekt_Addon,1);
	CreateInvItems(self,ItMi_OrnamentEffekt_FARM_Addon,1);
	CreateInvItems(self,ItMi_OrnamentEffekt_FOREST_Addon,1);
	CreateInvItems(self,ItMi_OrnamentEffekt_BIGFARM_Addon,1);
	CreateInvItems(self,ItMi_Rake,1);
	CreateInvItems(self,ItRi_Addon_BanditTrader,1);
	CreateInvItems(self,ItWr_Addon_BanditTrader,1);
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven_opened,1);
	CreateInvItems(self,ItAm_Addon_WispDetector,1);
	CreateInvItems(self,ItFo_Addon_Krokofleisch_Mission,1);
	CreateInvItems(self,ItRi_Addon_MorgansRing_Mission,1);
	CreateInvItems(self,ItMi_Focus,1);
	CreateInvItems(self,ItMi_Addon_Steel_Paket,1);
	CreateInvItems(self,ItWr_StonePlateCommon_Addon,1);
	CreateInvItems(self,ItMi_Addon_Stone_01,1);
	CreateInvItems(self,ItMi_Addon_Stone_05,1);
	CreateInvItems(self,ItMi_Addon_Stone_03,1);
	CreateInvItems(self,ItMi_Addon_Stone_04,1);
	CreateInvItems(self,ItMi_Addon_Stone_02,1);
	CreateInvItems(self,ItMI_Addon_Kompass_Mis,1);	
	CreateInvItems(self,ItSE_Addon_FrancisChest,1);
	CreateInvItems(self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	CreateInvItems(self,ITWR_Addon_GregsLogbuch_Mis,1);
	CreateInvItems(self,ITKE_Addon_Bloodwyn_01,1);
	CreateInvItems(self,ITKE_Addon_Heiler,1);
	CreateInvItems(self,ItMi_TempelTorKey,1);
	CreateInvItems(self,ItMi_Addon_Bloodwyn_Kopf,1);
	CreateInvItems(self,ItWR_Addon_TreasureMap,1);
	CreateInvItems(self,ItMi_Addon_GregsTreasureBottle_MIS,1);
	CreateInvItems(self,itmi_erolskelch,1);
	
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_OldBald_Jeremiah, BodyTex_N, 0);	
	//Mdl_SetModelFatness	(self, 2);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	//------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60
		

	// ------ TA anmelden ------
	
};

instance Hoshi_Testmodell (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hoshi";	
	guild 		= GIL_MIL;
	id 			= 20000;
	voice 		= 6;
	flags       = 0;																
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal05, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_302;
};

FUNC VOID Rtn_Start_20000 ()
{	
	TA_Guard_Passage	(08,00,23,00,"NW_CITY_GUARDOFFICE_GUARD_01");
    TA_Guard_Passage	(23,00,08,00,"NW_CITY_GUARDOFFICE_GUARD_01");
};


instance TA_Testmodell (Npc_Default)
{
	// ------ NSC ------
	name 		= "TA_Testmodell";
	guild 		= GIL_SLD;
	id 			= 1500;
	voice 		= 3;
	flags       = NPC_FLAG_IMMORTAL;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	//aivar[AIV_IgnoresFakeGuild] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_OldBald_Jeremiah, BodyTex_N, 0);	
	//Mdl_SetModelFatness	(self, 2);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	//------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60
		

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1500;
};

FUNC VOID Rtn_Start_1500 ()
{
	TA_Cook_Cauldron   	(00,00,00,15,"WP_COOK_CAULDRON");
	TA_Pee				(00,15,00,30,"WP_WASH");
	TA_Cook_Pan			(00,30,00,45,"WP_COOK_PAN");
	TA_Pick_FP			(00,45,01,00,"WP_PICK");
	TA_Pick_Ore			(01,00,01,15,"WP_PICK_ORE");
	TA_Practice_Magic	(01,15,01,30,"WP_STAND");
	TA_Potion_Alchemy	(01,30,01,45,"WP_POTION_ALCHEMY");
	TA_Pray_Innos_FP	(01,45,02,00,"WP_PRAY");
	TA_Pray_Innos		(02,00,02,15,"WP_PRAY_INNOS_STATUE");
	TA_Practice_Sword	(02,15,02,30,"WP_MOBSIS_ALLE");
	TA_Play_Lute		(02,30,02,45,"WP_STAND");
	TA_Read_Bookstand	(02,45,03,00,"WP_READ_BOOKSTAND");
	TA_Repair_Hut		(03,00,03,15,"WP_REPAIR_HUT");
	TA_Roast_Scavenger	(03,15,03,30,"WP_ROAST_SCAVENGER");
	TA_Sit_Campfire		(03,30,03,45,"WP_STAND");
	TA_Sit_Bench		(03,45,04,00,"WP_SIT_BENCH");
	TA_Smoke_Joint		(04,00,04,15,"WP_STAND");
	TA_Sit_Chair		(04,15,04,30,"WP_SIT_CHAIR");
	TA_Sit_Throne		(04,30,04,45,"WP_SIT_THRONE");
	TA_Smalltalk		(04,45,05,00,"WP_SMALLTALK");
	TA_Smith_Fire		(05,00,05,15,"WP_SMITH_FIRE");
	TA_Smith_Anvil		(05,15,05,30,"WP_SMITH_ANVIL");
	TA_Smith_Cool		(05,30,05,45,"WP_SMITH_COOL");
	TA_Smith_Sharp		(05,45,06,00,"WP_SMITH_SHARP");		
	TA_Sleep			(06,00,06,15,"WP_SLEEP");
	TA_Stand_ArmsCrossed(06,15,06,30,"WP_STAND");
	TA_Smoke_Waterpipe	(06,30,06,45,"WP_SMOKE_WATERPIPE");
	TA_Stand_Guarding	(06,45,07,00,"WP_STAND");
	TA_Stand_Eating		(07,00,07,15,"WP_STAND");
	TA_Spit_Fire		(07,15,07,30,"WP_STAND");
	TA_Stand_Drinking	(07,30,07,45,"WP_STAND");	
	TA_Stand_Sweeping	(07,45,08,00,"WP_STAND");
	TA_Rake_FP			(08,00,08,15,"WP_PICK");
	TA_Cook_Stove		(08,15,08,30,"WP_COOK_STOVE");
	TA_Saw				(08,30,08,45,"WP_SAW");
	TA_Pray_Innos		(08,45,09,00,"WP_PRAY_INNOS_STATUE");
	TA_Pray_Innos_FP	(09,00,09,15,"WP_PRAY");
	TA_Wash_FP			(09,15,09,30,"WP_WASH");
	TA_Stomp_Herb		(09,30,09,45,"WP_STOMP_HERB");
	TA_Pick_FP			(09,45,10,15,"WP_PICK");
	TA_Pick_FP			(10,15,24,00,"WP_PRAY");				
};

FUNC VOID Rtn_Guide_1500 ()
{
	TA_Guide_Player	(06,00,18,00,"WP_GUIDE_PLAYER");
	TA_Guide_Player	(18,00,06,00,"WP_GUIDE_PLAYER");
};

FUNC VOID Rtn_Follow_1500 ()
{
	TA_Follow_Player	(06,00,18,00,"WP_FOLLOW_PLAYER");
	TA_Follow_Player	(18,00,06,00,"WP_FOLLOW_PLAYER");
};


//*************************************************
//	Testdialoge für Followmode und Guideplayer ----
//*************************************************

//--- Exit ---

INSTANCE DIA_TA_Testmodell_EXIT(C_INFO)
{
	npc			= TA_Testmodell;
	nr			= 999;
	condition	= DIA_TA_Testmodell_EXIT_Condition;
	information	= DIA_TA_Testmodell_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_TA_Testmodell_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_TA_Testmodell_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//--- Guideplayer ---

INSTANCE Info_TA_Testmodell_GuideStart (C_INFO)
{
	npc			= TA_Testmodell;
	nr			= 997;
	condition	= DIA_TA_Testmodell_GuideStart_Condition;
	information	= DIA_TA_Testmodell_GuideStart_Info;
	permanent	= TRUE;
	description = "Zeig mir den Guide_Player!";
};                       

FUNC INT DIA_TA_Testmodell_GuideStart_Condition()
{
	var C_NPC Testmodell;
	Testmodell = Hlp_GetNpc (TA_Testmodell);
	
	if (!Npc_IsInRoutine (self,ZS_GUIDE_PLAYER))
	{
		return 1;
	};
};
 
	FUNC VOID DIA_TA_Testmodell_GuideStart_Info()
	{	
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self,"Guide");
		
	};


INSTANCE Info_TA_Testmodell_GuideEnd (C_INFO)
{
	npc			= TA_Testmodell;
	nr			= 998;
	condition	= DIA_TA_Testmodell_GuideEnd_Condition;
	information	= DIA_TA_Testmodell_GuideEnd_Info;
	permanent	= TRUE;
	description = "Beende den Guide_Player!";
};                       

FUNC INT DIA_TA_Testmodell_GuideEnd_Condition()
{
	var C_NPC Testmodell;
	Testmodell = Hlp_GetNpc (TA_Testmodell);
	
	if (Npc_IsInRoutine (self,ZS_GUIDE_PLAYER))
	{
		return 1;
	};
};
 
FUNC VOID DIA_TA_Testmodell_GuideEnd_Info()
{	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};

//--- Follow_Player ---

INSTANCE Info_TA_Testmodell_FollowStart (C_INFO)
{
	npc			= TA_Testmodell;
	nr			= 995;
	condition	= DIA_TA_Testmodell_FollowStart_Condition;
	information	= DIA_TA_Testmodell_FollowStart_Info;
	permanent	= TRUE;
	description = "Folge mir!";
};                       

FUNC INT DIA_TA_Testmodell_FollowStart_Condition()
{
	var C_NPC Testmodell;
	Testmodell = Hlp_GetNpc (TA_Testmodell);
	
	if (!Npc_IsInRoutine (self,ZS_FOLLOW_PLAYER))
	{
		return 1;
	};
};
 
FUNC VOID DIA_TA_Testmodell_FollowStart_Info()
{	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FOLLOW");
	
};


INSTANCE Info_TA_Testmodell_FollowEnd (C_INFO)
{
	npc			= TA_Testmodell;
	nr			= 998;
	condition	= DIA_TA_Testmodell_FollowEnd_Condition;
	information	= DIA_TA_Testmodell_FollowEnd_Info;
	permanent	= TRUE;
	description = "Hör auf mir zu folgen!";
};                       

FUNC INT DIA_TA_Testmodell_FollowEnd_Condition()
{
	var C_NPC Testmodell;
	Testmodell = Hlp_GetNpc (TA_Testmodell);
	
	if (Npc_IsInRoutine (self,ZS_FOLLOW_PLAYER))
	{
		return 1;
	};
};
 
FUNC VOID DIA_TA_Testmodell_FollowEnd_Info()
{	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	
};



//*********************
//	Smalltalkpartner
//*********************


instance TA_Smalltalkpartner (Npc_Default)
{
	// ------ NSC ------
	name 		= "Smalltalkpartner";
	guild 		= GIL_NONE;
	id 			= 1501;
	voice 		= 1;
	flags       = NPC_FLAG_IMMORTAL;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_OldBald_Jeremiah, BodyTex_N, 0);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	//------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60
		

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1501;
};

FUNC VOID Rtn_Start_1501 ()
{
	TA_Smalltalk		(11,00,23,00,"WP_SMALLTALK");
	TA_Smalltalk		(23,00,11,00,"WP_SMALLTALK");
};

FUNC VOID Startup_TA_Testlevel ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();

	Wld_InsertNpc (PIR_1350_Addon_Francis,"WP_SMITH_SHARP");
	Wld_InsertNpc (PIR_1351_Addon_Samuel,"WP_COOK_STOVE");
	Wld_InsertNpc (PIR_1352_Addon_AlligatorJack,"WP_SAW");
	Wld_InsertNpc (PIR_1353_Addon_Morgan,"WP_SMITH_FIRE");
	Wld_InsertNpc (PIR_1354_Addon_Henry,"WP_POTION_ALCHEMY");
	Wld_InsertNpc (PIR_1355_Addon_Skip,"WP_COOK_PAN");
	Wld_InsertNpc (PIR_1356_Addon_Bill,"WP_ROAST_SCAVENGER");
	
	Wld_InsertNpc (PAL_Zombie01,"WP_GUIDE_PLAYER");
	//Wld_InsertNpc (PAL_Zombie01,"WP_GUIDE_PLAYER");
	
	//Wld_InsertNpc (PIR_1357_Addon_Pirat,"WP_SIT_CHAIR");  		//Ersatz-Pirat
	//Wld_InsertNpc (PIR_1358_Addon_Pirat,"WP_STOMP_HERB");			//Ersatz-Pirat
	//Wld_InsertNpc (PIR_1359_Addon_Pirat,"WP_SIT_THRONE");			//Ersatz-Pirat
	//Wld_InsertNpc (PIR_1360_Addon_Pirat,"WP_SMITH_ANVIL");		//Ersatz-Pirat	
};

FUNC VOID INIT_SUB_TA_TESTLEVEL ()
{
	
};

func void INIT_TA_Testlevel ()
{
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	B_InitNpcGlobals ();
	
	INIT_SUB_TA_TESTLEVEL ();
};

//***********************************
//		TestGold
//***********************************

INSTANCE Gold(C_Item)
{
	name 				=	"Ein Beutel voll Gold!";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseGold;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseGold ()
{
	CreateInvItems (self,ItMi_Gold,1000);	
	PrintScreen	("1000 Gold erhalten.", -1, 45, FONT_Screen, 2);
	Snd_Play ("Geldbeutel");
	PrintScreen	("Cheater Malus: -100 EXP", -1, 55, FONT_Screen, 2);
	if hero.exp >= 100
	{
		hero.exp = hero.exp - 100;
	}
	else
	{
		hero.exp = 0;
	};	
};

//***********************************
//		Armor
//***********************************

INSTANCE Armor(C_Item)
{
	name 				=	"Ein Beutel voller Rüstungen!";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseArmor;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseArmor ()
{
	Snd_Play ("Geldbeutel");

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
	CreateInvItem(self,ITAR_PAL_SKEL);
	
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
};


// **********************
// Runenbrief
// **********************
instance Runenbrief (C_Item)
{	
	name 				=	"Runenbrief";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseHosh1;
	scemeName			=	"MAP";
	description			=   "Gibt dir alle Addon-Runen";
};
func void UseHosh1 ()
{   
	CreateInvItems (self,ItRu_Waterfist,1);
	CreateInvItems (self,ItRu_Icelance,1);
	CreateInvItems (self,ItRu_Whirlwind,1);
	CreateInvItems (self,ItRu_Geyser,1);
	CreateInvItems (self,ItRu_Thunderstorm,1);
	
	CreateInvItems (self,ItSC_Waterfist,1);
	CreateInvItems (self,ItSC_Icelance,1);
	CreateInvItems (self,ItSC_Whirlwind,1);
	CreateInvItems (self,ItSc_Geyser,1);
	CreateInvItems (self,ItSc_Thunderstorm,1);
	
	CreateInvItems (self,ItRu_BeliarsRage,1);
	CreateInvItems (self,ItRu_SuckEnergy,1);
	CreateInvItems (self,ItRu_GreenTentacle,1);
	CreateInvItems (self,ItRu_Swarm,1);
	CreateInvItems (self,ItRu_Skull,1);
	CreateInvItems (self,ItRu_SummonZombie,1);
	CreateInvItems (self,ItRu_SummonGuardian,1);
};

INSTANCE EnterBanditCamp (C_Item)
{	
	name 				=	"Komm ins BanditCamp";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseHosh2;
	scemeName			=	"MAP";
	description			=   "Setzt Player_HasTalkedToBanditCamp";
};
func void UseHosh2 ()
{   
	Player_HasTalkedToBanditCamp = TRUE;
};

INSTANCE PH (C_Item)
{	
	name 				=	"Gimme Magic";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePatrickHelper;
	scemeName			=	"MAP";
	description			=   "Kleine Magietestumgebung";
};
func void UsePatrickHelper ()
{   
	self.attribute[ATR_MANA_MAX] =		400;
	self.attribute[ATR_MANA] =			400;
	
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
	
	
	PLAYER_TALENT_RUNES[SPL_Whirlwind] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Geyser] 				= TRUE;
	
	PLAYER_TALENT_RUNES[SPL_Greententacle] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_Swarm] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_Waterfist] 				= TRUE;
	


	CreateInvItem(self,ItRu_Whirlwind);
	CreateInvItem(self,ItRu_Geyser);
	
	CreateInvItem(self,ItRu_Greententacle);
	CreateInvItem(self,ItRu_Swarm);
	CreateInvItem(self,ItRu_Waterfist);
};

INSTANCE Hosh4 (C_ITEM) 
{	
	name 					=	"Greg ist Back";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Tagebuch";
	TEXT	[0]				=	"Das Tagebuch von Hoshi";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseHoshiTagebuch;
};

FUNC VOID UseHoshiTagebuch()
{   
	GregIsBack_S1 ();
};


