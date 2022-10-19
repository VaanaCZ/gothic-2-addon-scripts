INSTANCE PC_Levelinspektor(NPC_DEFAULT)
{
	//-------- primary data --------
	name 			= "Inspektor poziomu";
	Npctype			= NPCTYPE_MAIN;
	flags			= NPC_FLAG_GHOST;
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

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex		Skin-Color	Head-MMS    		Head-Tex		Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,	"hum_body_Naked0", 	BodyTex_Player,	0,			"Hum_Head_Pony", 	FACE_N_Player,	0, 			ITAR_PAL_H);

	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE, 			6);
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK, 		1); //h�ngt ab von DEX (auf Programmebene)
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK, 			1);
	Npc_SetTalentSkill	(self, NPC_TALENT_ACROBAT, 			0);

	Npc_SetTalentSkill	(self, NPC_TALENT_PICKPOCKET, 		1);	//h�ngt ab von DEX (auf Scriptebene)
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

	B_SetFightSkills (self, 100); //Grenzen f�r Talent-Level liegen bei 30 und 60

	//-------- inventory --------
	EquipItem (self, ItMw_ShortSword3);
	EquipItem (self, ItRw_Bow_L_01);

};









