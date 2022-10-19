//*****************************
//	Minecrawler Prototype
//*****************************

PROTOTYPE Mst_Default_Minecrawler(C_Npc)			
{
	//----- Monster ----
	name							=	"Pe³zacz";
	guild							=	GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID]			= 	ID_MINECRAWLER;
	level							=	12;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	60;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_MINECRAWLER;
	
	//----- Sense & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;
};


//***********
// Visuals
//***********

func void B_SetVisuals_Minecrawler()
{
	Mdl_SetVisual			(self,	"Crawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Crw_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Minecrawler
//*****************

INSTANCE Minecrawler	(Mst_Default_Minecrawler)
{
	B_SetVisuals_Minecrawler();
	Npc_SetToFistMode(self);
};
//*****************
//	Minecrawler_Priest im PriesterHaus der ADW
//*****************

INSTANCE Minecrawler_Priest	(Mst_Default_Minecrawler)
{
	B_SetVisuals_Minecrawler();
	Npc_SetToFistMode(self);
};
INSTANCE GoldMinecrawler	(Mst_Default_Minecrawler)
{
	B_SetVisuals_Minecrawler();
	Npc_SetToFistMode(self);
};



