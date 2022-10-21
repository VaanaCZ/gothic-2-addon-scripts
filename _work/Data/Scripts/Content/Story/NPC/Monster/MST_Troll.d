//**********************
//	Troll Prototype		
//**********************

PROTOTYPE Mst_Default_Troll(C_Npc)			
{
	//----- Monster ----
	name							=	"Troll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL;
	level							=	50; //30
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	100;	//FlyDamage
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	125;
	protection	[PROT_EDGE]			=	125;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	250;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_TROLL;

	//----- Senses & Ranges ----	
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//***************************************************
	bodyStateInterruptableOverride 	= TRUE;
	//***************************************************
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************


func void B_SetVisuals_Troll()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***********
//	Troll    
//***********
INSTANCE Troll	(Mst_Default_Troll)
{
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

//***********
//	Troll    
//***********
INSTANCE Valley_Troll (Mst_Default_Troll)
{
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 2300; //wegen Quahodron-Gruft-Troll
	aivar[AIV_OriginalFightTactic] 	= FAI_TROLL;
};

//***********
//	Maya-Troll    
//***********
INSTANCE Maya_Troll	(Mst_Default_Troll)
{
	aivar[AIV_MaxDistToWp]			= 1000;
	aivar[AIV_OriginalFightTactic] 	= FAI_TROLL;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};

//*********************************
//	Höhlentroll bei Orks auf der DI    
//*********************************
INSTANCE Troll_DI	(Mst_Default_Troll)
{
	name		=	"Troll jaskiniowy";

	aivar[AIV_MaxDistToWp]			= 300;
	aivar[AIV_OriginalFightTactic] 	= FAI_TROLL;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};
