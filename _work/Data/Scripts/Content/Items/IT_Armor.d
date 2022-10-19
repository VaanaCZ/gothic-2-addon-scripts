// *********************************************************
// Rüstungs Kosten in Gold
// -----------------------
// Alles, was hier mit 0 angegeben ist  
// a) kann der Spieler NIE bekommen und
// b) braucht auch KEIN Visuaisierungs-Item (ItAr_TestDummy)
// *********************************************************

// ------ Stadt ------
const int VALUE_ITAR_Governor	= 1100;
const int VALUE_ITAR_Judge		= 0;
const int VALUE_ITAR_Smith		= 0;
const int VALUE_ITAR_Barkeeper	= 0;
const int VALUE_ITAR_Vlk_L		= 120;
const int VALUE_ITAR_Vlk_M		= 120;
const int VALUE_ITAR_Vlk_H		= 120;
const int VALUE_ITAR_VlkBabe_L	= 0;
const int VALUE_ITAR_VlkBabe_M	= 0;
const int VALUE_ITAR_VlkBabe_H	= 0;
const int VALUE_ITAR_MIL_L		= 600;
const int VALUE_ITAR_MIL_M		= 2500;
const int VALUE_ITAR_PAL_M		= 5000;
const int VALUE_ITAR_PAL_H		= 20000;

// ------ Bauern und Söldner ------
const int VALUE_ITAR_Bau_L		= 80;
const int VALUE_ITAR_Bau_M		= 100;
const int VALUE_ITAR_BauBabe_L	= 0;
const int VALUE_ITAR_BauBabe_M	= 0;
const int VALUE_ITAR_SLD_L		= 500;
const int VALUE_ITAR_SLD_M		= 1000;
const int VALUE_ITAR_DJG_Crawler= 1500;
const int VALUE_ITAR_SLD_H		= 2500;

// ------ Kloster ------
const int VALUE_ITAR_NOV_L		= 280;
const int VALUE_ITAR_KDF_L		= 500;
const int VALUE_ITAR_KDF_H		= 3000;

// ------ Banditen ------
const int VALUE_ITAR_Leather_L	= 250;
const int VALUE_ITAR_BDT_M		= 550;
const int VALUE_ITAR_BDT_H		= 2100;

// ------ Drachenjäger ------
const int VALUE_ITAR_DJG_L		= 3000;
const int VALUE_ITAR_DJG_M		= 12000;
const int VALUE_ITAR_DJG_H		= 20000;
const int VALUE_ITAR_DJG_Babe	= 0;

// ------ Besondere ------
const int VALUE_ITAR_XARDAS		= 15000;
const int VALUE_ITAR_LESTER		= 300;
const int VALUE_ITAR_DIEGO		= 450;
const int VALUE_ITAR_CorAngar	= 600;
const int VALUE_ITAR_Dementor	= 500;
const int VALUE_ITAR_KDW_H		= 450;
const int VALUE_ITAR_Prisoner	= 10;


// ******************
// 		Rüstungen
// ******************

INSTANCE ITAR_Governor (C_Item)
{
	name 					=	"Kaftan gubernatora";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT]	= 	40;
	protection [PROT_POINT] = 	40;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Armor_Governor.asc";
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
INSTANCE ITAR_JUDGE (C_Item)
{
	name 					=	"Szata sêdziego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_JUDGE;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3DS";
	visual_change 			=	"Armor_Judge.asc";
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
INSTANCE ITAR_SMITH (C_Item)
{
	name 					=	"Strój kowala";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_SMITH;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Smith.3DS";
	visual_change 			=	"Armor_Smith.asc";
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
INSTANCE ITAR_BARKEEPER (C_Item)
{
	name 					=	"Strój ziemianina";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BARKEEPER;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Wirt.3DS";
	visual_change 			=	"Armor_Barkeeper.asc";
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
INSTANCE ITAR_VLK_L (C_Item)
{
	name 					=	"Strój obywatela";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_L.3DS";
	visual_change 			=	"Armor_Vlk_L.asc";
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
INSTANCE ITAR_VLK_M (C_Item)
{
	name 					=	"Strój obywatela";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_M.3DS";
	visual_change 			=	"Armor_Vlk_M.asc";
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
INSTANCE ITAR_VLK_H (C_Item)
{
	name 					=	"Strój obywatela";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_H.3DS";
	visual_change 			=	"Armor_Vlk_H.asc";
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
instance ITAR_VlkBabe_L (C_Item)
{
	name 					=	"Strój obywatela 1";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_VlkBabe_L.asc";
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
INSTANCE ITAR_VlkBabe_M (C_Item)
{
	name 					=	"Strój obywatela 2";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_VlkBabe_M.asc";
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
INSTANCE ITAR_VlkBabe_H (C_Item)
{
	name 					=	"Strój obywatela 3";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_VlkBabe_H.asc";
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
INSTANCE ITAR_MIL_L (C_Item)
{
	name 					=	"Lekki pancerz stra¿y";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	40;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_MIL_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_MIL_L.3DS";
	visual_change 			=	"Armor_Mil_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_MIL_L;
	on_unequip				=	UnEquip_ITAR_MIL_L;
	
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
FUNC VOID Equip_ITAR_MIL_L()
{
	if Npc_IsPlayer (self)
	{
		MILArmor_Equipped = TRUE;
		
		if (MIL01_Equipped == TRUE)//Gürtel
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_MIL_L()
{
	if Npc_IsPlayer (self)
	{
		MILArmor_Equipped = FALSE;
		
		if (MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};
// ******************************************************
INSTANCE ITAR_MIL_M (C_Item)
{
	name 					=	"Ciê¿ki pancerz stra¿y";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_MIL_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_MIL_M.3DS";
	visual_change 			=	"Armor_MIL_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_MIL_M;
	on_unequip				=	UnEquip_ITAR_MIL_M;
	
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
FUNC VOID Equip_ITAR_MIL_M()
{
	if Npc_IsPlayer (self)
	{
		MILArmor_Equipped = TRUE;
		
		if (MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_MIL_M()
{
	if Npc_IsPlayer (self)
	{
		MILArmor_Equipped = FALSE;
		
		if (MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};
// ******************************************************
INSTANCE ITAR_PAL_M (C_Item)
{
	name 					=	"Pancerz rycerza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;
	
	value 					=	VALUE_ITAR_PAL_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_M.3ds";
	visual_change 			=	"Armor_Pal_M.asc";
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
// ******************************************************
INSTANCE ITAR_PAL_H (C_Item)
{
	name 					=	"Pancerz paladyna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150;
	protection [PROT_BLUNT] = 	150;
	protection [PROT_POINT] = 	150;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_PAL_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_H.3ds";
	visual_change 			=	"Armor_Pal_H.asc";
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
// ******************************************************
INSTANCE ITAR_BAU_L (C_Item)
{
	name 					=	"Strój farmera 1";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BAU_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bau_L.3DS";
	visual_change 			=	"Armor_Bau_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				=	 protection	[PROT_EDGE];
	
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
INSTANCE ITAR_BAU_M (C_Item)
{
	name 					=	"Strój farmera 2";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BAU_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bau_M.3ds";
	visual_change 			=	"Armor_Bau_M.asc";
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
INSTANCE ITAR_BauBabe_L (C_Item)
{
	name 					=	"Suknia farmerki 1";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BauBabe_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_BauBabe_L.asc";
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
INSTANCE ITAR_BauBabe_M (C_Item)
{
	name 					=	"Suknia farmerki 2" ;

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10;
	protection [PROT_BLUNT] = 	10;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BauBabe_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_BauBabe_M.asc";
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
INSTANCE ITAR_SLD_L (C_Item)
{
	name 					=	"Lekki pancerz najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_SLD_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_L.3ds";
	visual_change 			=	"Armor_Sld_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_SLD_L;
	on_unequip				=	UnEquip_ITAR_SLD_L;
	
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
FUNC VOID Equip_ITAR_SLD_L()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = TRUE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};			
};
FUNC VOID UnEquip_ITAR_SLD_L()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = FALSE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};

// ******************************************************
INSTANCE ITAR_SLD_M (C_Item)
{
	name 					=	"Œredni pancerz najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	5;

	value 					=	VALUE_ITAR_SLD_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_M.3ds";
	visual_change 			=	"Armor_Sld_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_SLD_M;
	on_unequip				=	UnEquip_ITAR_SLD_M;
	
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
FUNC VOID Equip_ITAR_SLD_M()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = TRUE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};			
};
FUNC VOID UnEquip_ITAR_SLD_M()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = FALSE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};			
};
// ******************************************************
INSTANCE ITAR_SLD_H (C_Item)
{
	name 					=	"Ciê¿ki pancerz najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	80;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_SLD_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_H.3ds";
	visual_change 			=	"Armor_Sld_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_SLD_H;
	on_unequip				=	UnEquip_ITAR_SLD_H;
	
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
FUNC VOID Equip_ITAR_SLD_H()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = TRUE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};			
};
FUNC VOID UnEquip_ITAR_SLD_H()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = FALSE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};			
};
// ******************************************************
INSTANCE ITAR_DJG_Crawler (C_Item)
{
	name 					=	"Zbroja z pancerzy pe³zaczy";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_DJG_Crawler;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_Crawler.3ds";
	visual_change 			=	"Armor_Djg_Crawler.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_DJG_Crawler;
	on_unequip				=	UnEquip_ITAR_DJG_Crawler;
	
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
FUNC VOID Equip_ITAR_DJG_Crawler()
{
	if Npc_IsPlayer (self)
	{
		MCArmor_Equipped = TRUE;
	
		if (MC_Equipped == TRUE)	
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};			
};
FUNC VOID UnEquip_ITAR_DJG_Crawler()
{
	if Npc_IsPlayer (self)
	{
		MCArmor_Equipped = FALSE;
		
		if (MC_Equipped == TRUE)	
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};			
};
// ******************************************************
INSTANCE ITAR_DJG_L (C_Item)
{
	name 					=	"Lekki pancerz ³owcy smoków";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;

	value 					=	VALUE_ITAR_DJG_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_L.3ds";
	visual_change 			=	"Armor_Djg_L.asc";
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
INSTANCE ITAR_DJG_M (C_Item)
{
	name 					=	"Œredni pancerz ³owcy smoków";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120;
	protection [PROT_BLUNT]	= 	120;
	protection [PROT_POINT] = 	120;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	35;

	value 					=	VALUE_ITAR_DJG_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_M.3ds";
	visual_change 			=	"Armor_Djg_M.asc";
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
INSTANCE ITAR_DJG_H (C_Item)
{
	name 					=	"Ciê¿ki pancerz ³owcy smoków";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150;
	protection [PROT_BLUNT] = 	150;
	protection [PROT_POINT] = 	150;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_DJG_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_H.3ds";
	visual_change 			=	"Armor_Djg_H.asc";
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
INSTANCE ITAR_DJG_BABE (C_Item)
{
	name 					=	"Kobiecy pancerz ³owcy smoków";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	60;
	protection [PROT_BLUNT] = 	60;
	protection [PROT_POINT] = 	60;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_DJG_BABE;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_L.3DS";
	visual_change 			=	"Armor_Djg_Babe.asc";
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
INSTANCE ITAR_NOV_L (C_Item)
{
	name 					=	"Szata nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	25;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_NOV_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Nov_L.3ds";
	visual_change 			=	"Armor_Nov_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_NOV_L;
	on_unequip				=	UnEquip_ITAR_NOV_L;
	
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
FUNC VOID Equip_ITAR_NOV_L()
{
	if Npc_IsPlayer (self)
	{
		NOVArmor_Equipped = TRUE;
		
		if (NOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_NOV_L()
{
	if Npc_IsPlayer (self)
	{
		NOVArmor_Equipped = FALSE;
	
		if (NOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
	
};
// ******************************************************
INSTANCE ITAR_KDF_L (C_Item)
{
	name 					=	"Szata Maga Ognia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	40;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	20;

	value 					=	VALUE_ITAR_KDF_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KdF_L.3ds";
	visual_change 			=	"Armor_Kdf_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_KDF_L;
	on_unequip				=	UnEquip_ITAR_KDF_L;
	
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
FUNC VOID Equip_ITAR_KDF_L()
{
	if Npc_IsPlayer (self)
	{
		KDFArmor_Equipped = TRUE;
		
		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_KDF_L()
{
	if Npc_IsPlayer (self)
	{
		KDFArmor_Equipped = FALSE;
	
		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};
// ******************************************************
INSTANCE ITAR_KDF_H (C_Item)
{
	name 					=	"Ciê¿ka szata ognia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_KDF_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KdF_H.3ds";
	visual_change 			=	"Armor_Kdf_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_KDF_H;
	on_unequip				=	UnEquip_ITAR_KDF_H;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				=	 protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];

	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_KDF_H()
{
	if Npc_IsPlayer (self)
	{
		KDFArmor_Equipped = TRUE;
		
		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_KDF_H()
{
	if Npc_IsPlayer (self)
	{
		KDFArmor_Equipped = FALSE;
		
		if (KDF01_Equipped == TRUE)
		{	
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};
// ******************************************************
INSTANCE ITAR_Leather_L (C_Item)
{
	name 					=	"Skórzany pancerz";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	 5;
	protection [PROT_MAGIC] = 	 0;

	value 					=	VALUE_ITAR_Leather_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Leather_L.3ds";
	visual_change 			=	"Armor_Leather_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	on_equip				=	Equip_ITAR_Leather_L;
	on_unequip				=	UnEquip_ITAR_Leather_L;
	
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
FUNC VOID Equip_ITAR_Leather_L()
{
	if Npc_IsPlayer (self)
	{
		LeatherArmor_Equipped = TRUE;	
	
		if (Leather01_Equipped == TRUE) //Ledergürtel
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_Leather_L()
{
	if Npc_IsPlayer (self)
	{
		LeatherArmor_Equipped = FALSE;	
	
		if (Leather01_Equipped == TRUE) //Ledergürtel
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};
// ******************************************************
INSTANCE ITAR_BDT_M (C_Item)
{
	name 					=	"Œredni pancerz bandyty";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35;
	protection [PROT_BLUNT]	= 	35;
	protection [PROT_POINT] = 	35;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BDT_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bdt_M.3ds";
	visual_change 			=	"Armor_Bdt_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
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
INSTANCE ITAR_BDT_H (C_Item)
{
	name 					=	"Ciê¿ki pancerz bandyty";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BDT_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bdt_H.3ds";
	visual_change 			=	"Armor_Bdt_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

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
INSTANCE ITAR_XARDAS (C_Item)
{
	name 					=	"Szata Mrocznej Magii";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_XARDAS;

	wear 					=	WEAR_TORSO;

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
/******************************************************************************************/
INSTANCE ITAR_LESTER (C_Item)
{
	name 					=	"Szata Lestera";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	25;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_LESTER;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Lester.3ds";
	visual_change 			=	"Armor_Lester.asc";
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
/******************************************************************************************/
INSTANCE ITAR_Diego (C_Item)
{
	name 					=	"Pancerz Diega";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30;
	protection [PROT_BLUNT] = 	30;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Diego;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Diego.3ds";
	visual_change 			=	"Armor_Diego.asc";
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
/******************************************************************************************/
INSTANCE ITAR_CorAngar (C_Item)
{
	name 					=	"Pancerz Cor Angara";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;

	value 					=	VALUE_ITAR_CorAngar;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_CorAngar.3ds";
	visual_change 			=	"Armor_CorAngar.asc";
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
INSTANCE ITAR_Dementor (C_Item)
{
	name 					=	"Mroczny p³aszcz";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	130;
	protection [PROT_BLUNT] = 	130;
	protection [PROT_POINT] = 	130;
	protection [PROT_FIRE] 	= 	65;
	protection [PROT_MAGIC] = 	65;

	value 					=	VALUE_ITAR_Dementor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Xardas.3ds";
	visual_change 			=	"Armor_Dementor.asc";
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
INSTANCE ITAR_KDW_H (C_Item)
{
	name 					=	"Szata Maga Wody";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_KDW_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KdW_H.3ds";
	visual_change 			=	"Armor_KdW_H.asc";
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
instance ITAR_Prisoner (C_Item)
{
	name 					=	"£achy skazañca";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Prisoner;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Prisoner.3ds";
	visual_change 			=	"Armor_Prisoner.asc";
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
