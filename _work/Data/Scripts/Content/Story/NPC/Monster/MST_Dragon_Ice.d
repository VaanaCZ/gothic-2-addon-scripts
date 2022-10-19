//****************************
//	Icedragon Prototype			
//****************************

PROTOTYPE Mst_Default_Dragon_Ice(C_Npc)			
{
	//----- Monster ----
	name							= "Lodowy smok";
	guild							= GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= ID_DRAGON_ICE;
	level							= 600;
	
	bodyStateInterruptableOverride = TRUE;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= 200;
	attribute	[ATR_DEXTERITY]		= 200;
	attribute	[ATR_HITPOINTS_MAX]	= 1000;
	attribute	[ATR_HITPOINTS]		= 1000;
	attribute	[ATR_MANA_MAX] 		= 1000;
	attribute	[ATR_MANA] 			= 1000;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		= 180;
	protection	[PROT_EDGE]			= 180;
	protection	[PROT_POINT]		= 180;	
	protection	[PROT_FIRE]			= 180;
	protection	[PROT_FLY]			= 180;	
	protection	[PROT_MAGIC]		= 180;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	159;
	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_DRAGON;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_DRAGON_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	aivar[AIV_MaxDistToWp]			= 10000;
	aivar[AIV_OriginalFightTactic] 	= FAI_DRAGON;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_Rtn_DragonRest;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_Dragon_Ice()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Ice_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*********************
//	Icedragon 
//*********************

INSTANCE Dragon_Ice	(Mst_Default_Dragon_Ice)
{
	name	=	"Finkregh";
	flags				   			= 	NPC_FLAG_IMMORTAL;
	B_SetVisuals_Dragon_Ice();
	Npc_SetToFistMode(self);
};
