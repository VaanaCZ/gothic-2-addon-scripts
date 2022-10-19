//********************
//	Wolf Prototype														
//********************

PROTOTYPE Mst_Default_Wolf(C_Npc)			
{
	//----- Monster ----
	name							=	"Wilk";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_WOLF;
	level							=	6;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	30;
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	0;

	//---- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WOLF;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;	
};


//************
//	Visuals
//************


func void B_SetVisuals_Wolf()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Wolf    	
//************

INSTANCE Wolf	(Mst_Default_Wolf)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


//*****************
//	Summoned Wolf    	
//*****************

INSTANCE Summoned_Wolf	(Mst_Default_Wolf)
{
	name							=	"Przyzwany wilk";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_WOLF;
	level							=	0; //10
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	75;
	protection	[PROT_EDGE]			=	75;
	protection	[PROT_POINT]		=	25;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	75;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


//************
//	YWolf    	
//************

INSTANCE YWolf	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"M這dy wilk";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	
	//----- Kampf-Taktik ----
	fight_tactic					= FAI_MONSTER_COWARD;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};



//************
//	Missions W闤fe f�r Pepe: YWolf    	
//************


INSTANCE PEPES_YWolf1	(Mst_Default_Wolf)
{
	name							=	"M這dy wilk";
	level							=	3;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


INSTANCE PEPES_YWolf2	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"M這dy wilk";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


INSTANCE PEPES_YWolf3	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"M這dy wilk";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};


INSTANCE PEPES_YWolf4	(Mst_Default_Wolf)
{
	level							=	3;
	name							=	"M這dy wilk";
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
	
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

