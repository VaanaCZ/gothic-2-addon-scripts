//***************************
//	Shadowbeast Prototype	
//***************************

PROTOTYPE Mst_Default_Shadowbeast(C_Npc)			
{
	//----- Monster ----
	name							=	"Cieniostwór";
	guild							=	GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID]			= 	ID_SHADOWBEAST;
	level							=	30;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	125;
	protection	[PROT_EDGE]			=	125;
	protection	[PROT_POINT]		=	75;
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;
	protection	[PROT_MAGIC]		=	20;

	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_SHADOWBEAST;

	//----- Senses & Ranges ----
	senses			= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_SleepStart] 	= 6;	
	aivar[AIV_MM_SleepEnd]		= 20;
	aivar[AIV_MM_RoamStart]		= 20;
	aivar[AIV_MM_RoamEnd]		= 6;
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Shadowbeast()
{
	Mdl_SetVisual			(self,"Shadow.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sha_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*******************
//	Shadowbeast    	
//*******************

INSTANCE Shadowbeast	(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};

//Addon

INSTANCE BeachShadowbeast1	(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};
