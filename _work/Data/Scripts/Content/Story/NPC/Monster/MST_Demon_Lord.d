//***************************
//	Demon LORD Prototype	
//***************************

PROTOTYPE Mst_Default_DemonLord(C_Npc)			
{
	//----- Monster -----
	name							= "Ksi¹¿ê demonów";
	guild							= GIL_DEMON;
	aivar[AIV_MM_REAL_ID]			= ID_DEMON_LORD;
	level							= 60;
	
	//------ Attribute ----	
	attribute	[ATR_STRENGTH]		= 300;
	attribute	[ATR_DEXTERITY]		= 300;
	attribute	[ATR_HITPOINTS_MAX]	= 600;
	attribute	[ATR_HITPOINTS]		= 600;
	attribute	[ATR_MANA_MAX] 		= 200;
	attribute	[ATR_MANA] 			= 200;
	
	//------ Protections ----
	protection	[PROT_BLUNT]		= 200;
	protection	[PROT_EDGE]			= 200;
	protection	[PROT_POINT]		= 200;
	protection	[PROT_FIRE]			= 200;		
	protection	[PROT_FLY]			= 200;	
	protection	[PROT_MAGIC]		= 200;
	
	//----- Damage Types -----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//------ Fight-Tatik ----
	fight_tactic	=	FAI_DEMON;
	
	//------ Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//*****************
//	Visuals
//*****************

func void B_SetVisuals_DemonLord()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem2_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//****************
//	DemonLord    														
//****************

INSTANCE DemonLord	(Mst_Default_DemonLord)
{
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};


//**************************
//	Xardas_DT_DemonLord    														
//**************************

INSTANCE Xardas_DT_DemonLord	(Mst_Default_DemonLord)
{
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};


