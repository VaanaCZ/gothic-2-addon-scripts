//***************************
//	 Sheep Prototype		
//***************************

PROTOTYPE Mst_Default_Sheep(C_Npc)			
{
	//----- Maonster ----
	name							=	"Schaf";
	guild							=	GIL_SHEEP;
	aivar[AIV_MM_REAL_ID]			= 	ID_SHEEP;
	level							=	1;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	10;
	attribute	[ATR_HITPOINTS]		=	10;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
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
	//fight_tactic					= FAI_Giant_Rat;//Schafe kämpfen nicht!!

	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;

	//----- Daily Routine ----
	
};


//************
//	Visuals
//************

func void B_SetVisuals_Sheep()
{
	Mdl_SetVisual			(self,	"Sheep.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sheep_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

// ------ Hammel ------
func void B_SetVisuals_Hammel ()
{
	Mdl_SetVisual			(self,	"Sheep.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Hammel_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Sheep
//***************

INSTANCE Sheep	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

//***************
//	Hammel
//***************

INSTANCE Hammel	(Mst_Default_Sheep)
{
	B_SetVisuals_Hammel();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFoMuttonRaw, 1);
};
//***************
//	Follow_Sheep
//***************

INSTANCE Follow_Sheep	(Mst_Default_Sheep)
{
	name						= "Liesel";
	
	aivar[AIV_ToughGuy] = TRUE; //Liesel knn getötet werden, ohne daß jemand sich anpißt!
		
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	
	start_aistate				= ZS_MM_Rtn_Follow_Sheep;
	CreateInvItems (self, ItFoMuttonRaw, 1);
};
//***************
//	Follow_Sheep_AKIL
//***************

INSTANCE Follow_Sheep_AKIL	(Mst_Default_Sheep)
{
	name						= "Schaf";
	
	aivar[AIV_ToughGuy] = TRUE;
	
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	start_aistate				= ZS_MM_Rtn_Follow_Sheep;
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

//******************************
//	Balthasar_Sheeps
//******************************

INSTANCE Balthasar_Sheep1	(Mst_Default_Sheep)
{
	B_SetVisuals_Hammel();

	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Balthasar_Sheep2	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

INSTANCE Balthasar_Sheep3	(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
	CreateInvItems (self, ItFoMuttonRaw, 1);
};
