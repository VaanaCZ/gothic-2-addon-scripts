//***************************
//	Undeaddragon Prototype	
//***************************

PROTOTYPE Mst_Default_Dragon_Undead(C_Npc)			
{
	//----- Monster ----
	name							=	"Nemrtvý drak";
	guild							=	GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= 	ID_DRAGON_UNDEAD;
	level							=	1000;
	
	bodyStateInterruptableOverride 	= 	TRUE;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		= 400;
	attribute	[ATR_DEXTERITY]		= 400;
	attribute	[ATR_HITPOINTS_MAX]	= 2000;
	attribute	[ATR_HITPOINTS]		= 2000;
	attribute	[ATR_MANA_MAX] 		= 2000;
	attribute	[ATR_MANA] 			= 2000;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 200;
	protection	[PROT_EDGE]			= 200;
	protection	[PROT_POINT]		= 200;
	protection	[PROT_FIRE]			= 200;
	protection	[PROT_FLY]			= 200;	
	protection	[PROT_MAGIC]		= 200;
	
	//----- Damage Types ----
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	249;
	damage		[DAM_INDEX_FLY]		=	1;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_DRAGON;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= 1000;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	aivar[AIV_MaxDistToWp]			= 1000;
	aivar[AIV_OriginalFightTactic] 	= FAI_DRAGON;

	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_Rtn_DragonRest;
	
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_Dragon_Undead()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Undead_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Undeaddragon	
//*****************
INSTANCE Dragon_Undead	(Mst_Default_Dragon_Undead)
{
	B_SetVisuals_Dragon_Undead();
	flags				   			= 	NPC_FLAG_IMMORTAL;
	effect							=	"spellfx_undead_dragon";
	Npc_SetToFistMode(self);
};
