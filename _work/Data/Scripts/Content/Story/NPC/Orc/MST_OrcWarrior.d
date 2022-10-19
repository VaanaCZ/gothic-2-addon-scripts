//*****************************
//	Orc WARRIOR Prototype		
//*****************************

PROTOTYPE Mst_Default_OrcWarrior(C_Npc)			
{
	//----- Monster -----
	name							=	"Ork Krieger";
	guild							=	GIL_ORC;
	aivar[AIV_MM_REAL_ID]			= 	ID_ORCWARRIOR;
	voice							=	18;
	level							=	30;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	100; //+ca. 50-80 Waffe //MIN 100 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	150;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	150;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	20;
	
	//----- HitChances -----
	HitChance	[NPC_TALENT_1H]			= 60;
	HitChance	[NPC_TALENT_2H]			= 60;
	HitChance	[NPC_TALENT_BOW]		= 60;
	HitChance	[NPC_TALENT_CROSSBOW]	= 60;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	fight_tactic	=	FAI_ORC;

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	= PERC_DIST_ORC_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

//**************
//	Visuals
//**************

func void B_SetVisuals_OrcWarrior()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyWarrior",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};


//******************
//	Orc Warrior Roam    														
//******************

INSTANCE OrcWarrior_Roam (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};
//******************
//	Orc Warrior Rest    														
//******************

INSTANCE OrcWarrior_Rest (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_02);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//******************
//	Orc Warrior Sit    														
//******************

INSTANCE OrcWarrior_Sit (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_OrcSitStart] 	= OnlyRoutine;
};



//******************************************************************************************************************************************************************************************************
//	Story Orks   														
//******************************************************************************************************************************************************************************************************

// ------ Ork vor Stadt ------
INSTANCE OrcWarrior_Harad (Mst_Default_OrcWarrior)
{
	name							=	"Ork Späher";
	
	level							=	15;
	
	//----- Attribute -----	
	attribute	[ATR_STRENGTH]		=	75; //MIN 70 wg Equip!!!
	attribute	[ATR_DEXTERITY]		=	75;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	75;
	protection	[PROT_EDGE]			=	75;
	protection	[PROT_POINT]		=	75;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_01);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


// ----- Lobarts Orks ------
INSTANCE OrcWarrior_Lobart1 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart2 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart3 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart4 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart5 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};

INSTANCE OrcWarrior_Lobart6 (Mst_Default_OrcWarrior)
{
	//-------- visual --------
	B_SetVisuals_OrcWarrior();

	//-------- inventory --------
	EquipItem (self, ItMw_2H_OrcAxe_03);
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
