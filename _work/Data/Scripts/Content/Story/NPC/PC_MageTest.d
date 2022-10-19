INSTANCE PC_MageTest(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "Magiefuzzi";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE;
	level			= 30;
	voice			= 15;
	id				= 0;
	
	//--------- abilities --------
	attribute[ATR_STRENGTH] =		1000;
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
	
	
	PLAYER_TALENT_RUNES[SPL_Thunderstorm] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_Whirlwind] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Geyser] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Greententacle] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_Swarm] 					= TRUE;
	PLAYER_TALENT_RUNES[SPL_Waterfist] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Icelance] 				= TRUE;
	PLAYER_TALENT_RUNES[SPL_Energyball] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_SuckEnergy] 			= TRUE;
	PLAYER_TALENT_RUNES[SPL_Skull] 			= TRUE;
		
	B_SetFightSkills (self, 100); //Grenzen für Talent-Level liegen bei 30 und 60
	
	//-------- inventory --------
	EquipItem (self, ItMw_2h_Pal_Sword);
	
	
	//bodyStateInterruptableOverride = TRUE;

	CreateInvItem(self,ItRu_Thunderstorm);
	CreateInvItem(self,ItRu_Whirlwind);
	CreateInvItem(self,ItRu_Geyser);
	CreateInvItem(self,ItRu_Greententacle);
	CreateInvItem(self,ItRu_Swarm);
	CreateInvItem(self,ItRu_Waterfist);
	CreateInvItem(self,ItRu_Icelance);
	CreateInvItem(self,ItRu_BeliarsRage);
	CreateInvItem(self,ItRu_SuckEnergy);
	CreateInvItem(self,ItRu_Skull);
	
};









