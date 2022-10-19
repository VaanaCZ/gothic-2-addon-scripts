//**********************
//	Alligator Prototype		
//**********************

PROTOTYPE Mst_Default_Addon_Alligator (C_Npc)			
{
	//----- Monster ----
	name							=	"Aligator";
	guild							=	GIL_Alligator;
	aivar[AIV_MM_REAL_ID]			= 	ID_Alligator;
	level							=	12;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_ALLIGATOR;

	//----- Sense & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

//************
//	Visuals
//************

func void B_SetVisuals_Alligator ()
{
	Mdl_SetVisual			(self,	"Alligator.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"KRO_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**************
//	Alligator    	
//**************

INSTANCE Alligator	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};

//**************
//	Dead Alligator (PortalTempel)
//**************

INSTANCE Alligator_PortalDead	(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};


