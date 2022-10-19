//**********************
//	SwampDrone Prototype
//**********************

PROTOTYPE Mst_Default_SwampDrone(C_Npc)			
{
	//----- Monster -----
	name							= "Bagienny truteñ";
	guild							= GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID]			= ID_SWAMPDRONE;
	level							= 10;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= 50;
	attribute	[ATR_DEXTERITY]		= 50;
	attribute	[ATR_HITPOINTS_MAX]	= 100; 
	attribute	[ATR_HITPOINTS]		= 100;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Ptotection ----
	protection	[PROT_BLUNT]		= 50;
	protection	[PROT_EDGE]			= 50;
	protection	[PROT_POINT]		= 0;
	protection	[PROT_FIRE]			= 50;
	protection	[PROT_FLY]			= 50;
	protection	[PROT_MAGIC]		= 0;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_BLOODFLY;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= FALSE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;	
};

//******************
//		Visuals
//******************

func void B_SetVisuals_SwampDrone()
{
	Mdl_SetVisual			(self,	"SwampDrone.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"SwampDrone_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*************
//	Bloodfly   
//*************

INSTANCE SwampDrone	(Mst_Default_SwampDrone)
{
	B_SetVisuals_SwampDrone();
	Npc_SetToFistMode(self);
};
