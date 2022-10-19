//*************************
//	FireGolem Prototype	
//*************************

PROTOTYPE Mst_Default_FireGolem(C_Npc)			
{
	//----- Monster ----
	name							=	"Ognisty golem";
	guild							=	GIL_FIREGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_FIREGOLEM;
	level							=	40;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	200;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	200;	
	protection	[PROT_FIRE]			=	150;	
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	150;
	
	//----- Damage Types ----
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_STONEGOLEM;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//***************
//	Visuals
//***************

func void B_SetVisuals_FireGolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Firegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Fire_Body",DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	FireGolem   
//***************

INSTANCE FireGolem	(Mst_Default_FireGolem)
{
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);
};
