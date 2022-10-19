//************************
//	Lurker Prototype
//************************

PROTOTYPE Mst_Default_Lurker(C_Npc)			
{
	//----- Monster ----
	name							=	"Topielec";
	guild							=	GIL_LURKER;
	aivar[AIV_MM_REAL_ID]			= 	ID_LURKER;
	level							=	12;
	
	//----- Attributes ----
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
	
	//----- Damage Types----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_LURKER;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

//**************
//	Visuals
//**************

//---------------------------------------------------
func void B_SetVisuals_Lurker()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*************
//	Lurker
//*************

INSTANCE Lurker	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

//*************
//	Kervos Lurker
//*************

INSTANCE Kervo_Lurker1	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;	//Joly: damit sie nicht in Kervos Höhle rennen.
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker2	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker3	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker4	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker5	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker6	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};


//Addon
//Beachlurker

INSTANCE BeachLurker1	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

INSTANCE BeachLurker2	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

INSTANCE BeachLurker3	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};
