// ------ Piraten ------
const int VALUE_ITAR_PIR_L_Addon		= 1100; 
const int VALUE_ITAR_PIR_M_Addon		= 1300;
const int VALUE_ITAR_PIR_H_Addon		= 1500;
const int VALUE_ITAR_Thorus_Addon 		= 1300;
const int VALUE_ITAR_Raven_Addon  		= 1300;
const int VALUE_Itar_OreBaron_Addon 	= 1300;
const int VALUE_ITAR_RANGER_Addon 		= 1300;
const int VALUE_ITAR_KDW_L_Addon 		= 1300;
const int VALUE_ITAR_Bloodwyn_Addon 	= 1300; 

// ******************************************************
INSTANCE ITAR_PIR_L_Addon (C_Item)
{
	name 					=	"Pirátský odêv";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	40;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_PIR_L_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_PIR_L_ADDON.3ds";
	visual_change 			=	"Armor_Pir_L_Addon.ASC";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_PIR_M_Addon (C_Item)
{
	name 					=	"Pirátská zbroj";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	55;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_PIR_M_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_PIR_M_ADDON.3ds";
	visual_change 			=	"Armor_PIR_M_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_PIR_H_Addon (C_Item)
{
	name 					=	"Kapitánský odêv";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	60;
	protection [PROT_BLUNT] = 	60;
	protection [PROT_POINT] = 	60;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_PIR_H_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_PIR_H_ADDON.3ds";
	visual_change 			=	"Armor_PIR_H_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_Thorus_Addon (C_Item)
{
	name 					=	"Têžká strážní zbroj";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Thorus_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Thorus_ADDON.3ds";
	visual_change 			=	"Armor_Thorus_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	"Zbroj Havranových stráží";

	TEXT[0]					= 	PRINT_Addon_BDTArmor;
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_Raven_Addon (C_Item)
{
	name 					=	"Havranova zbroj";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	100;

	value 					=	VALUE_ITAR_Raven_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Raven_ADDON.3ds";
	visual_change 			=	"Armor_Raven_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_OreBaron_Addon (C_Item)
{
	name 					=	"Zbroj skâetího barona";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_OreBaron_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_CHAOS_ADDON.3ds";
	visual_change 			=	"Armor_CHAOS_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_RANGER_Addon (C_Item)
{
	name 					=	"Zbroj 'kruhu vody'";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_Ranger_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Ranger_ADDON.3ds";
	visual_change 			=	"Armor_Ranger_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_Fake_RANGER (C_Item)
{
	name 					=	"Rozbitá zbroj";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Ranger_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Ranger_ADDON.3ds";
	visual_change 			=	"Armor_Ranger_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;


	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_KDW_L_Addon (C_Item)
{
	name 					=	"Light CoW";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	25;

	value 					=	VALUE_ITAR_KDW_L_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KDW_L_ADDON.3ds";
	visual_change 			=	"Armor_KDW_L_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_Bloodwyn_Addon (C_Item)
{
	name 					=	"Bloodwynova zbroj";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Bloodwyn_Addon;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bloodwyn_ADDON.3ds";
	visual_change 			=	"Armor_Bloodwyn_ADDON.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

// ******************************************************
INSTANCE ITAR_MayaZombie_Addon (C_Item)
{
	name 					=	"Stará zbroj";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	50;

	value 					=	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Raven_ADDON.3ds";
	visual_change 			=	"Armor_MayaZombie_Addon.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};


////////////////////////////////////////////////////////////////////////////////
//
//	Magische Rüstungen
//


instance ItAr_FireArmor_Addon (C_Item)
{
	name 					=	"Magická zbroj";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	50;

	// FIXME_Noki: Werte
	value 					=	VALUE_ITAR_XARDAS;

	wear 					=	WEAR_TORSO | WEAR_EFFECT;
	effect					=	"SPELLFX_FIREARMOR";

	visual 					=	"ItAr_Xardas.3ds";
	visual_change 			=	"Armor_Xardas.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
