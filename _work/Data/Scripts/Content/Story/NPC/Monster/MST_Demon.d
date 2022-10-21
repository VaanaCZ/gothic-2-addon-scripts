//********************
//	Demon Prototype		
//********************

PROTOTYPE Mst_Default_Demon(C_Npc)			
{
	//---- Monster ----
	name							=	"Demon";
	guild							=	GIL_DEMON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DEMON;
	level							=	50;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	250;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	175;
	protection	[PROT_EDGE]			=	175;
	protection	[PROT_POINT]		=	175;
	protection	[PROT_FIRE]			=	175;
	protection	[PROT_FLY]			=	175;
	protection	[PROT_MAGIC]		=	175;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik -----
	fight_tactic	=	FAI_DEMON;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	=	FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] =	TRUE;
	aivar[AIV_MM_Packhunter] 	=	FALSE;
	
	//----- Daily Routine ----
	start_aistate				=	ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	=	OnlyRoutine;
};


//****************
//	Visual
//****************

func void B_SetVisuals_Demon()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**********
//	Demon
//**********

INSTANCE Demon (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

//******************
//	Summoned_Demon    															
//******************

INSTANCE Summoned_Demon (Mst_Default_Demon)
{
	name							= "Przyzwany demon";
	guild							= GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONED_DEMON;
	level							= 0;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//		Story Demons
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//********************
//	Xardas_DT_Demons
//********************

INSTANCE Xardas_DT_Demon1 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Xardas_DT_Demon2 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Xardas_DT_Demon3 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Xardas_DT_Demon4 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

INSTANCE Xardas_DT_Demon5 (Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};


