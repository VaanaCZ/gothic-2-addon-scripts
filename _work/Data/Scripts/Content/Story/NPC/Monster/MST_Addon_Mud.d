////////////////////////////////////////////////////////////////////////////////
//
//	The Return of VLK_574_Mud (enjoy the silence remix)
//


prototype Mst_Default_Mud(C_Npc)
{
	name							= "Mud";
	guild							= GIL_ZOMBIE;
	aivar[AIV_MM_REAL_ID]			= ID_ZOMBIE;
	level							= 0;	// Gothic I
	
	attribute[ATR_STRENGTH]			= 20;	// Gothic I
	attribute[ATR_DEXTERITY]		= 10;	// Gothic I
	attribute[ATR_HITPOINTS_MAX]	= 88;	// Gothic I
	attribute[ATR_HITPOINTS]		= 88;	// Gothic I
	attribute[ATR_MANA_MAX] 		= 0;	// Gothic I
	attribute[ATR_MANA] 			= 0;	// Gothic I

	damagetype 						= DAM_EDGE;

	fight_tactic					= FAI_ZOMBIE;

	senses							= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range					= PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]		= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] 	= FALSE;
	
	start_aistate					= ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] 		= OnlyRoutine;
};

func void B_SetVisuals_Mud ()
{
	Mdl_SetVisual		(self, "Zombie.mds");
	Mdl_SetVisualBody	(self, "Zom_Body", 0, 0, "Hum_Head_Pony", Face_N_ZombieMud, 0, NO_ARMOR);
};

func void B_CreateInvItems_Mud ()
{
	CreateInvItems(self, ItFo_Water, 1);	// Gothic I
	CreateInvItems(self, ItMi_Gold, 5);		// Gothic I (ItMi_Nugget)
};


////////////////////////////////////////////////////////////////////////////////


instance Undead_Mud (Mst_Default_Mud)
{
	name = NAME_Addon_Undead_Mud;

	B_SetVisuals_Mud();
	B_CreateInvItems_Mud();
	Npc_SetToFistMode(self);
};

instance Summoned_Mud(Mst_Default_Mud)
{
	name = NAME_Addon_Summoned_Mud;

	guild					= GIL_SUMMONEDZOMBIE;
	aivar[AIV_MM_REAL_ID]	= ID_SUMMONEDZOMBIE;

	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;

	B_SetVisuals_Mud();
	B_CreateInvItems_Mud();
	Npc_SetToFistMode(self);
};
