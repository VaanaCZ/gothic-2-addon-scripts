// *************************
// unbenutzte Item - Visuals
// *************************

//ItMw_2H_Sword_Sleeper_01	// Uriziel ungeladen
//ItMw_2H_Sword_Sleeper_02	// Uriziel geladen

//ItMw_2H_Axe_Old_03		// alter Richter
//ItMw_2H_Axe_Old_01		// alte Streitaxt

//ItMw_1H_Sword_Broad_01 	// Breitschwert 1h
//ItMw_1H_Sword_Long_03		// Hassbringer
//ItMw_1H_Sword_05			// Kriegsschwert
//ItMw_1H_Sword_04			// Kampfschwert
//ItMw_1H_Sword_02			// Richtschwert
//ItMw_2H_Staff_02			// Richtstab
//ItMw_2H_Staff_01			// Kampfstab
//ItMw_1H_Scythe_01			// Schnitter
//ItMw_1H_Sword_Short_02	// Bauernwehr
//ItMw_1H_Sword_Short_01	// Kurzschwert

//ItMw_1H_Poker_01			// Schürhaken

// *****************************************************
// Waffen in der Welt (ab Kapitel 1)
// ---------------------------------
// Hier alle Waffen, die bei mortal-NSCs 
// oder in die Welt objektiert zu finden sind
// Alle haben sehr geringen Wert
// Alle können (theoretisch) in Kapitel 1 erlangt werden
// *****************************************************
INSTANCE ItMw_1h_Vlk_Dagger (C_Item)
{	
	name 				=	"Dolch";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_VLKDolch;

	damageTotal  		= 	Damage_VLKDolch;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKDolch;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Mace_L_01 (C_Item)
{	
	name 				=	"Schürhaken";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Schuerhaken;

	damageTotal  		= 	Damage_Schuerhaken;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schuerhaken;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schuerhaken;
	visual 				=	"Itmw_005_1h_poker_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Bau_Axe (C_Item)
{	
	name 				=	"Sichel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_BauAxe;

	damageTotal  		= 	Damage_BauAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_BauAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_BauAxe;
	visual 				=	"Itmw_007_1h_sickle_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Vlk_Mace (C_Item)
{	
	name 				=	"Gehstock";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_VLKMace;

	damageTotal  		= 	Damage_VLKMace;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_VLKMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKMace;
	visual 				=	"Itmw_008_1h_pole_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Mace_L_03 (C_Item)
{	
	name 				=	"Belegnagel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Belegnagel;

	damageTotal  		= 	Damage_Belegnagel;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Belegnagel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Belegnagel;
	visual 				=	"ItMw_008_1h_mace_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Bau_Mace (C_Item)
{	
	name 				=	"Schwerer Ast";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_BauMace;

	damageTotal  		= 	Damage_BauMace;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_BauMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_BauMace;
	visual 				=	"ItMw_010_1h_Club_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Vlk_Axe (C_Item)
{	
	name 				=	"Beil";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_VLKAxe;

	damageTotal  		= 	Damage_VLKAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKAxe;
	visual 				=	"Itmw_010_1h_vlk_hatchet_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Mace_L_04 (C_Item)
{	
	name 				=	"Schmiedehammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schmiedehammer;

	damageTotal  		= 	Damage_Schmiedehammer;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Schmiedehammer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schmiedehammer;
	visual 				=	"ItMw_010_1h_sledgehammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_ShortSword1 (C_Item)
{	
	name 				=	"Kurzschwert der Miliz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword1;

	damageTotal  		= 	Damage_ShortSword1;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword1;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword1;
	visual 				=	"ItMw_010_1h_Sword_short_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_Nagelknueppel (C_Item)
{	
	name 				=	"Nagelknüppel";  //für Banditen

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelknueppel;

	damageTotal  		= 	Damage_Nagelknueppel;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelknueppel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Nagelknueppel;
	visual 				=	"ItMw_012_1h_Nailmace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Sword_L_03 (C_Item)
{	
	name 				=	"Wolfsklinge";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Wolfsklinge;

	damageTotal  		= 	Damage_Wolfsklinge;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Wolfsklinge;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Wolfsklinge;
	visual 				=	"ItMw_012_1h_Knife_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_ShortSword2 (C_Item)
{	
	name 				=	"Grobes Kurzschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword2;

	damageTotal  		= 	Damage_ShortSword2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword2;
	visual 				=	"ItMw_012_1h_Sword_short_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_Sense (C_Item)
{	
	name 				=	"Kleine Sense";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Sense;

	damageTotal  		= 	Damage_Sense;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Sense;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sense;
	visual 				=	"ItMw_012_1h_Scythe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Vlk_Sword (C_Item)
{	
	name 				=	"Degen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_VLKSchwert;

	damageTotal  		= 	Damage_VLKSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKSchwert;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;	

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	Condition_VLKSchwert;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Nov_Mace (C_Item)
{	
	name 				=	"Kampfstab";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_NovMace;

	damageTotal  		= 	Damage_NovMace;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_NovMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_NovMace;
	visual 				=	"ItMw_020_2h_Nov_Staff_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2h_Bau_Axe (C_Item)
{	
	name 				=	"Holzfälleraxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Bau2hAxt;

	damageTotal  		= 	Damage_Bau2hAxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Bau2hAxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Bau2hAxt;
	visual 				=	"ItMw_020_2h_Axe_Lumberjack_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2H_Axe_L_01 (C_Item) 
{	
	name 				=	"Spitzhacke";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE | ITEM_NSPLIT;
	material 			=	MAT_METAL;

	value 				=	Value_Spitzhacke;

	damageTotal			= 	Damage_Spitzhacke;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Spitzhacke;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Spitzhacke;
	visual 				=	"ItMw_020_2h_Pickaxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_MISC_Sword (C_Item) 
{	
	name 				=	"Rostiges Schwert";  //STANDARDOBJEKTIERUNG

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_MiscSword;

	damageTotal  		= 	Damage_MiscSword;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MiscSword;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_MiscSword;
	visual 				=	"ItMw_020_1h_sword_old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Misc_Axe (C_Item)
{	
	name 				=	"Rostige Axt";  //STANDARDOBJEKTIERUNG

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_MiscAxe;

	damageTotal  		= 	Damage_MiscAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MiscAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_MiscAxe;
	visual 				=	"ItMw_025_2h_Misc_Axe_old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2H_Sword_M_01 (C_Item) 
{	
	name 				=	"Rostiger Zweihänder"; //STANDARDOBJEKTIERUNG

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Misc2hSword;

	damageTotal			= 	Damage_Misc2hSword;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Misc2hSword;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Misc2hSword;
	visual 				=	"ItMw_025_2h_Sword_old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Mil_Sword (C_Item)
{	
	name 				=	"Grobes Breitschwert";  //NUR MILIZ

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_MilSchwert;

	damageTotal  		= 	Damage_MilSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MilSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_MilSchwert;
	visual 				=	"Itmw_025_1h_Mil_Sword_broad_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Sld_Axe (C_Item)
{	
	name 				=	"Grobes Kriegsbeil";  //SÖLDNER

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hAxt;

	damageTotal  		= 	Damage_Sld1hAxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld1hAxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld1hAxt;
	visual 				=	"ItMw_025_1h_sld_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Sld_Sword (C_Item)
{	
	name 				=	"Grobes Schwert";  //SÖLDNER

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hSchwert;

	damageTotal  		= 	Damage_Sld1hSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld1hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld1hSchwert;
	visual 				=	"ItMw_025_1h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
// ****** folgende Waffen sind eigentlich zu gut für Kapitel 1, NSCs sind aber noch VIEL zu stark ******
INSTANCE ItMw_2h_Sld_Axe (C_Item)
{	
	name 				=	"Grobe Kriegsaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hAxe;

	damageTotal  		= 	Damage_Sld2hAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld2hAxe;
	visual 				=	"ItMw_035_2h_sld_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2h_Sld_Sword (C_Item)
{	
	name 				=	"Grober Zweihänder";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hSchwert;

	damageTotal  		= 	Damage_Sld2hSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld2hSchwert;
	visual 				=	"ItMw_035_2h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Pal_Sword (C_Item)
{	
	name 				=	"Paladinschwert";  //NUR PALADIN 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PalSchwert;

	damageTotal  		= 	Damage_PalSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_PalSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PalSchwert;
	visual 				=	"ItMw_030_1h_PAL_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2h_Pal_Sword (C_Item)
{	
	name 				=	"Paladin Zweihänder";  //NUR PALADIN 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PalZweihaender;

	damageTotal  		= 	Damage_PalZweihaender;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_PalZweihaender;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PalZweihaender;
	visual 				=	"ItMw_040_2h_PAL_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
// ************************************
// Ork- und Echsenmenschenwaffen
// -----------------------------
// ACHTUNG: Orkwaffen können auch schon 
// in Kapitel 1 erlangt werden!
// ************************************
INSTANCE ItMw_2H_OrcAxe_01 (C_Item)
{	
	name 				=	"Leichte Orkaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_01;

	damageTotal			= 	Damage_Orkaxt_01;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_01;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_01;
	visual 				=	"ItMw_2H_OrcAxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcAxe_02 (C_Item)
{	
	name 				=	"Mittlere Orkaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_02;

	damageTotal			= 	Damage_Orkaxt_02;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_02;		

	cond_atr[2]   		=  	ATR_STRENGTH;
	cond_value[2]  		=  	Condition_Orkaxt_02;
	visual 				=	"ItMw_2H_OrcAxe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcAxe_03 (C_Item)
{	
	name 				=	"Schwere Orkaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_03;

	damageTotal			= 	Damage_Orkaxt_03;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_03;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_03;
	visual 				= "ItMw_2H_OrcAxe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcAxe_04 (C_Item)
{	
	name 				=	"Brutale Orkaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_04;

	damageTotal			= 	Damage_Orkaxt_04;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_04;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_04;
	visual 				=	"ItMw_2H_OrcAxe_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcSword_01 (C_Item) // *** für Drakonier!!! ***
{	
	name 				=	"Echsenschwert"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschwert;

	damageTotal			= 	Damage_Orkschwert;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Orkschwert;
	visual 				=	"ItMw_2H_OrcSword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcSword_02 (C_Item) // *** für Orcritter!!! ***
{	
	name 				=	"Orkisches Kriegschwert"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschwert_01;

	damageTotal			= 	Damage_Orkschwert_01;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkschwert_01;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Orkschwert_01;
	visual 				=	"ItMw_2H_OrcSword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/

// *******************
// Kapitel 1 - Händler
// *******************
INSTANCE ItMw_ShortSword3 (C_Item)
{	
	name 				=	"Kurzschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword3;

	damageTotal  		= 	Damage_ShortSword3;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword3;
	visual 				=	"ItMw_016_1h_Sword_short_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Nagelkeule (C_Item)
{	
	name 				=	"Nagelkeule";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelkeule;

	damageTotal  		= 	Damage_Nagelkeule;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelkeule;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Nagelkeule;
	visual 				=	"ItMw_018_1h_Mace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_ShortSword4 (C_Item)
{	
	name 				=	"Wolfszahn";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword4;

	damageTotal  		= 	Damage_ShortSword4;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword4;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword4;
	visual 				=	"ItMw_020_1h_Sword_short_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Kriegskeule (C_Item)
{	
	name 				=	"Kriegskeule";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Kriegskeule;

	damageTotal  		= 	Damage_Kriegskeule;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Kriegskeule;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kriegskeule;
	visual 				=	"ItMw_022_1h_mace_war_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Richtstab (C_Item)
{	
	name 				=	"Richtstab";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Richtstab;

	damageTotal  		= 	Damage_Richtstab;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Richtstab;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Richtstab;
	visual 				=	"ItMw_025_2h_Staff_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_ShortSword5 (C_Item)
{	
	name 				=	"edles Kurzschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword5;

	damageTotal  		= 	Damage_ShortSword5;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword5;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword5;
	visual 				=	"ItMw_025_1h_Sword_short_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Kriegshammer1 (C_Item) 
{	
	name 				=	"Kriegshammer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegshammer1;

	damageTotal			= 	Damage_Kriegshammer1;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Kriegshammer1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Kriegshammer1;
	visual 				=	"ItMw_028_1h_warhammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Hellebarde (C_Item) 
{	
	name 				=	"Hellebarde";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Hellebarde;

	damageTotal			= 	Damage_Hellebarde;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Hellebarde;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Hellebarde;
	visual 				=	"itmw_028_2h_halberd_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Nagelkeule2 (C_Item)
{	
	name 				=	"Schwere Nagelkeule";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelkeule2;

	damageTotal  		= 	Damage_Nagelkeule2;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelkeule2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Nagelkeule2;
	visual 				=	"ItMw_018_1h_Mace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schiffsaxt (C_Item)
{	
	name 				=	"Schiffsaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schiffsaxt;

	damageTotal  		= 	Damage_Schiffsaxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schiffsaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schiffsaxt;
	visual 				=	"ItMw_030_1h_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Piratensaebel (C_Item)
{	
	name 				=	"Piratensäbel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Piratensaebel;

	damageTotal  		= 	Damage_Piratensaebel;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Piratensaebel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Piratensaebel;
	visual 				=	"ItMw_030_1h_sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert (C_Item)
{	
	name 				=	"Grobes Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert;

	damageTotal  		= 	Damage_Schwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert;
	visual 				=	"ItMw_030_1h_sword_long_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ****************************
// Schmieden Kapitel 1 (Common)
// ****************************
INSTANCE ItMw_1H_Common_01 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	Damage_Common1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 2 - Händler
// *******************
INSTANCE ItMw_Stabkeule (C_Item) 
{	
	name 				=	"Stabkeule";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Stabkeule;

	damageTotal			= 	Damage_Stabkeule;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Stabkeule;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Stabkeule;
	visual 				=	"ItMw_032_2h_staff_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender1 (C_Item) 
{	
	name 				=	"Leichter Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender1;

	damageTotal			= 	Damage_Zweihaender1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender1;
	visual 				=	"ItMw_032_2h_sword_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Steinbrecher (C_Item)
{	
	name 				=	"Steinbrecher";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Steinbrecher;

	damageTotal  		= 	Damage_Steinbrecher;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Steinbrecher;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Steinbrecher;
	visual 				=	"ItMw_035_1h_mace_war_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Spicker (C_Item)
{	
	name 				=	"Schädelspicker";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Spicker;

	damageTotal  		= 	Damage_Spicker;
	damagetype 			=	DAM_BLUNT;	//Point Schaden führt direkt zum Tod!!
	range    			=  	Range_Spicker;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Spicker;
	visual 				=	"ItMw_035_1h_mace_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Streitaxt1 (C_Item) 
{	
	name 				=	"Leichte Streitaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitaxt1;

	damageTotal			= 	Damage_Streitaxt1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Streitaxt1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Streitaxt1;
	visual 				=	"ItMw_035_2h_Axe_light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert1 (C_Item)
{	
	name 				=	"Edles Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert2 (C_Item)
{	
	name 				=	"Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert2;

	damageTotal  		= 	Damage_Schwert2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert2;
	visual 				=	"ItMw_037_1h_sword_long_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Doppelaxt (C_Item) 
{	
	name 				=	"Doppelaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Doppelaxt;

	damageTotal			= 	Damage_Doppelaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Doppelaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Doppelaxt;
	visual 				=	"ItMw_040_1h_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Bartaxt (C_Item) 
{	
	name 				=	"Bartaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Bartaxt;

	damageTotal			= 	Damage_Bartaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Bartaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Bartaxt;
	visual 				=	"ItMw_040_1h_axe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Morgenstern (C_Item)
{	
	name 				=	"Morgenstern";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Morgenstern;

	damageTotal  		= 	Damage_Morgenstern;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Morgenstern;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Morgenstern;
	visual 				=	"ItMW_045_1h_mace_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert3 (C_Item)
{	
	name 				=	"Grobes Bastardschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert3;

	damageTotal  		= 	Damage_Schwert3;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert3;
	visual 				=	"ItMw_045_1h_Sword_Bastard_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert4 (C_Item)
{	
	name 				=	"Edles Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	Damage_Schwert4;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 2
// *******************
INSTANCE ItMw_1H_Special_01 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_1;
	
	damageTotal			= 	Damage_Special_1H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_1;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_1H_1;
	visual 				=	"ItMw_045_1h_Sword_smith_02.3DS";

	description			= name;
	
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[2]				= NAME_ADDON_BONUS_1H;			COUNT[2]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Special_01 (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_1;

	damageTotal			= 	Damage_Special_2H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_1;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_2H_1;
	visual 				=	"ItMw_050_2h_Sword_smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[2]				= NAME_ADDON_BONUS_2H;			COUNT[2]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 3 - Händler
// *******************
INSTANCE ItMw_Rapier (C_Item) 
{	
	name 				=	"Rapier";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rapier;

	damageTotal			= 	Damage_Rapier;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rapier;	

	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;
	
	cond_atr[2]   		= 	ATR_DEXTERITY;  //!!!
	cond_value[2]  		= 	Condition_Rapier;
	visual 				=	"ItMw_050_1h_Sword_Rapier_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Rubinklinge (C_Item) 
{	
	name 				=	"Rubinklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Streitkolben (C_Item)
{	
	name 				=	"Streitkolben";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitkolben;

	damageTotal  		= 	Damage_Streitkolben;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Streitkolben;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Streitkolben;
	visual 				=	"ItMw_050_1h_mace_war_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender2 (C_Item) 
{	
	name 				=	"Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender2;

	damageTotal			= 	Damage_Zweihaender2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender2;
	visual 				=	"ItMw_055_2h_sword_light_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Runenschwert (C_Item)
{	
	name 				=	"Runenschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Runenschwert;

	damageTotal  		= 	Damage_Runenschwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Runenschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Runenschwert;
	visual 				=	"ItMw_055_1h_sword_long_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Rabenschnabel (C_Item)
{	
	name 				=	"Rabenschnabel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Rabenschnabel;

	damageTotal  		= 	Damage_Rabenschnabel;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Rabenschnabel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Rabenschnabel;
	visual 				=	"ItMw_058_1h_warhammer_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert5 (C_Item)
{	
	name 				=	"Edles Bastardschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert5;

	damageTotal  		= 	Damage_Schwert5;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert5;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert5;
	visual 				=	"ItMw_058_1h_Sword_Bastard_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Inquisitor (C_Item)
{	
	name 				=	"Inquisitor";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Inquisitor;

	damageTotal  		= 	Damage_Inquisitor;
	damagetype 			=	DAM_EDGE;	//!!!
	range    			=  	Range_Inquisitor;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Inquisitor;
	visual 				=	"ItMw_060_1h_mace_war_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Streitaxt2 (C_Item)
{	
	name 				=	"Streitaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitaxt2;

	damageTotal  		= 	Damage_Streitaxt2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Streitaxt2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Streitaxt2;
	visual 				=	"ItMw_060_2h_axe_heavy_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender3 (C_Item)
{	
	name 				=	"Runen - Macht";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender3;

	damageTotal  		= 	Damage_Zweihaender3;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Zweihaender3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Zweihaender3;
	visual 				=	"ItMw_060_2h_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 3
// *******************
INSTANCE ItMw_1H_Special_02 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_02;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_2;

	damageTotal			= 	Damage_Special_1H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_2;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_1H_2;
	visual 				=	"ItMw_060_1h_Sword_smith_03.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Special_02 (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_02;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_2;

	damageTotal			= 	Damage_Special_2H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_2;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_2H_2;
	visual 				=	"ItMw_070_2h_Sword_smith_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 4 - Händler
// *******************
INSTANCE ItMw_ElBastardo (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	Damage_ElBastardo;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Kriegshammer2 (C_Item)
{	
	name 				=	"Schwerer Kriegshammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegshammer2;

	damageTotal  		= 	Damage_Kriegshammer2;
	damagetype 			=	DAM_BLUNT;	
	range    			=  	Range_Kriegshammer2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kriegshammer2;
	visual 				=	"ItMw_065_1h_warhammer_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Meisterdegen (C_Item)
{	
	name 				=	"Meisterdegen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Meisterdegen;

	damageTotal  		= 	Damage_Meisterdegen;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Meisterdegen;
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	Condition_Meisterdegen;
	visual 				=	"ItMw_065_1h_SwordCane_02.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Folteraxt (C_Item)
{	
	name 				=	"Folteraxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Folteraxt;

	damageTotal  		= 	Damage_Folteraxt;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Folteraxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Folteraxt;
	visual 				=	"ItMw_065_2h_greataxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Orkschlaechter (C_Item)
{	
	name 				=	"Orkschlächter";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschlaechter;

	damageTotal  		= 	Damage_Orkschlaechter;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Orkschlaechter;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Orkschlaechter;
	visual 				=	"ItMw_065_1h_sword_bastard_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender4 (C_Item)
{	
	name 				=	"Schwerer Zweihänder";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender4;

	damageTotal  		= 	Damage_Zweihaender4;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Zweihaender4;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Zweihaender4;
	visual 				=	"ItMw_068_2h_sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schlachtaxt (C_Item)
{	
	name 				=	"Schlachtaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schlachtaxt;

	damageTotal  		= 	Damage_Schlachtaxt;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Schlachtaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schlachtaxt;
	visual 				=	"ItMw_070_2h_axe_heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Krummschwert (C_Item)
{	
	name 				=	"Krummschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Scimitar;

	damageTotal  		= 	Damage_Scimitar;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Scimitar;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Scimitar;
	visual 				=	"ItMw_070_2h_sword_09.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Barbarenstreitaxt (C_Item)
{	
	name 				=	"Barbarenstreitaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Barbarenstreitaxt;

	damageTotal  		= 	Damage_Barbarenstreitaxt;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Barbarenstreitaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Barbarenstreitaxt;
	visual 				=	"ItMw_075_2h_axe_heavy_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Sturmbringer (C_Item)		//Joly: trägt None_101_Mario_DI, aber erst auf der Dracheninsel
{	
	name 				=	"Sturmbringer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Sturmbringer;

	damageTotal  		= 	Damage_Sturmbringer;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Sturmbringer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sturmbringer;
	visual 				=	"ItMw_075_2h_sword_heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 4
// *******************
INSTANCE ItMw_1H_Special_03 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_03;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_3;

	damageTotal			= 	Damage_Special_1H_3;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_3;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_1H_3;
	visual 				=	"ItMw_075_1h_sword_smith_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Special_03 (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_03;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_3;

	damageTotal			= 	Damage_Special_2H_3;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_3;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_2H_3;
	visual 				=	"ItMw_090_2h_sword_smith_04.3DS";

	description			= name;
	
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 5 - Händler
// *******************
INSTANCE ItMw_Berserkeraxt (C_Item)//Joly:Auf Dracheninsel beim Schwarzmagiernovizen
{	
	name 				=	"Berserkeraxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Berserkeraxt;

	damageTotal  		= 	Damage_Berserkeraxt;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Berserkeraxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Berserkeraxt;
	visual 				=	"ItMw_080_2h_axe_heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Drachenschneide (C_Item) 
{	
	name 				=	"Drachenschneide";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Drachenschneide;

	damageTotal			= 	Damage_Drachenschneide;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Drachenschneide;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Drachenschneide;
	visual 				=	"itMw_080_2h_sword_heavy_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 5
// *******************
INSTANCE ItMw_1H_Special_04 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_04;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_4;

	damageTotal			= 	Damage_Special_1H_4;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_4;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_1H_4;
	visual 				=	"ItMw_090_1h_sword_smith_05.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Special_04  (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_04;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_4;

	damageTotal			= 	Damage_Special_2H_4;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_4;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_2H_4;
	visual 				=	"ItMw_110_2h_sword_smith_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ************************
// Gesegnete Paladin-Waffen
// ************************
INSTANCE ItMw_1H_Blessed_01 (C_Item) 
{	
	name 				=	"Rohe Erzklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_1;

	damageTotal			= 	Damage_Blessed_1H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_1;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_1;
	visual 				=	"itmw_030_1h_PAL_sword_bastard_RAW_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_1H_Blessed_02 (C_Item) 
{	
	name 				=	"Gesegnete Erzklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_2;

	damageTotal			= 	Damage_Blessed_1H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_2;
	visual 				=	"ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_1H_Blessed_03 (C_Item) 
{	
	name 				=	"Innos Zorn";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_3;

	damageTotal			= 	Damage_Blessed_1H_3;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_3;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_3;
	visual 				=	"ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Blessed_01 (C_Item) 
{	
	name 				=	"Rohe Erzklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_1;

	damageTotal			= 	Damage_Blessed_2H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_1;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_1;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Blessed_02 (C_Item) 
{	
	name 				=	"Ordensschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_2;

	damageTotal			= 	Damage_Blessed_2H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_2;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Blessed_03 (C_Item) 
{	
	name 				=	"Heiliger Vollstrecker";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_3;

	damageTotal			= 	Damage_Blessed_2H_3;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_3;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_3;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/




/*
INSTANCE ItMw_1H_Sword_L_01 (C_Item)
{	
	name 				=	"Dolch";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Dolch;

	damageTotal  		= 	Damage_Dolch;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Dolch;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Dolch;
	visual 				=	"ItMw_1H_Sword_L_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



INSTANCE ItMw_1H_Mace_L_02 (C_Item)
{	
	name 				=	"Knüppel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Knueppel;

	damageTotal  		= 	Damage_Knueppel;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Knueppel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Knueppel;
	visual 				=	"ItMw_1H_Mace_L_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_L_01 (C_Item)
{	
	name 				=	"Sichel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sichel;

	damageTotal  		= 	Damage_Sichel;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Sichel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sichel;
	visual 				=	"ItMw_1H_Axe_L_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};




INSTANCE ItMw_1H_Sword_L_02 (C_Item)
{	
	name 				=	"Haumesser";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Haumesser;

	damageTotal  		= 	Damage_Haumesser;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Haumesser;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Haumesser;
	visual 				=	"ItMw_1H_Sword_L_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_L_02 (C_Item)
{	
	name 				=	"Handbeil";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Handbeil;

	damageTotal  		= 	Damage_Handbeil;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Handbeil;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Handbeil;
	visual 				=	"ItMw_1H_Axe_L_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};




INSTANCE ItMw_1H_Sword_L_04 (C_Item)
{	
	name 				=	"Schartiges Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_RostigesSchwert;

	damageTotal  		= 	Damage_RostigesSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_RostigesSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_RostigesSchwert;
	visual 				=	"ItMw_1H_Sword_L_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_L_03 (C_Item)
{	
	name 				=	"Handaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Handaxt;

	damageTotal  		= 	Damage_Handaxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Handaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Handaxt;
	visual 				=	"ItMw_1H_Axe_L_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ItMw_1H_Mace_L_05 (C_Item)
{	
	name 				=	"Keule";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Keule;

	damageTotal  		= 	Damage_Keule;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Keule;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Keule;
	visual 				=	"ItMw_1H_Mace_L_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_L_05 (C_Item)
{	
	name 				=	"Orkmesser";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkmesser;

	damageTotal  		= 	Damage_Orkmesser;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Orkmesser;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Orkmesser;
	visual 				=	"ItMw_1H_Sword_L_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_L_06 (C_Item)
{	
	name 				=	"Kurzschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Kurzschwert;

	damageTotal  		= 	Damage_Kurzschwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Kurzschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kurzschwert;
	visual 				=	"ItMw_1H_Sword_L_06.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_L_04 (C_Item)
{	
	name 				=	"Alte Axt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_AlteAxt;

	damageTotal  		= 	Damage_AlteAxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_AlteAxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_AlteAxt;
	visual 				=	"ItMw_1H_Axe_L_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_L_06 (C_Item)
{	
	name 				=	"Schmiedehammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schmiedehammer;

	damageTotal  		= 	Damage_Schmiedehammer;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Schmiedehammer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schmiedehammer;
	visual 				=	"ItMw_1H_Mace_L_06.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_L_07 (C_Item)
{	
	name 				=	"Piratenmesser";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Piratenmesser;

	damageTotal  		= 	Damage_Piratenmesser;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Piratenmesser;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Piratenmesser;
	visual 				=	"ItMw_1H_Sword_L_07.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 2

INSTANCE ItMw_1H_Sword_L_08 (C_Item)
{	
	name 				=	"Entermesser";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Entermesser;

	damageTotal  		= 	Damage_Entermesser;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Entermesser;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Entermesser;
	visual 				=	"ItMw_1H_Sword_L_08.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_L_05 (C_Item)
{	
	name 				=	"Schiffsaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schiffsaxt;

	damageTotal  		= 	Damage_Schiffsaxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schiffsaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schiffsaxt;
	visual 				=	"ItMw_1H_Axe_L_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_L_07 (C_Item)
{	
	name 				=	"Nagelkeule";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelkeule;

	damageTotal  		= 	Damage_Nagelkeule;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelkeule;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Nagelkeule;
	visual 				=	"ItMw_1H_Mace_L_07.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_L_09 (C_Item)
{	
	name 				=	"Piratensäbel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Piratensaebel;

	damageTotal  		= 	Damage_Piratensaebel;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Piratensaebel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Piratensaebel;
	visual 				=	"ItMw_1H_Sword_L_09.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_L_10 (C_Item)
{	
	name 				=	"Altes Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_AltesSchwert;

	damageTotal  		= 	Damage_AltesSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_AltesSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_AltesSchwert;
	visual 				=	"ItMw_1H_Sword_L_10.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_L_06 (C_Item)
{	
	name 				=	"Axt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Axt;

	damageTotal  		= 	Damage_Axt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Axt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Axt;
	visual 				=	"ItMw_1H_Axe_L_06.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_L_08 (C_Item)
{	
	name 				=	"Kriegskeule";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Kriegskeule;

	damageTotal  		= 	Damage_Kriegskeule;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Kriegskeule;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kriegskeule;
	visual 				=	"ItMw_1H_Mace_L_08.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_L_09 (C_Item)
{	
	name 				=	"Steinbrecher";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Steinbrecher;

	damageTotal  		= 	Damage_Steinbrecher;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Steinbrecher;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Steinbrecher;
	visual 				=	"ItMw_1H_Mace_L_09.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 3

INSTANCE ItMw_1H_Sword_M_01 (C_Item)
{	
	name 				=	"Rapier";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rapier;

	damageTotal  		= 	Damage_Rapier;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Rapier;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Rapier;
	visual 				=	"ItMw_1H_Sword_M_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_M_01 (C_Item)
{	
	name 				=	"Kriegsbeil";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegsbeil;

	damageTotal  		= 	Damage_Kriegsbeil;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Kriegsbeil;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kriegsbeil;
	visual 				=	"ItMw_1H_Axe_M_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_M_01 (C_Item)
{	
	name 				=	"Leichter Streitkolben";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_LeichterStreitkolben;

	damageTotal  		= 	Damage_LeichterStreitkolben;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_LeichterStreitkolben;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_LeichterStreitkolben;
	visual 				=	"ItMw_1H_Mace_M_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_M_02 (C_Item)
{	
	name 				=	"Schildbrecher";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Schildbrecher;

	damageTotal  		= 	Damage_Schildbrecher;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Schildbrecher;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schildbrecher;
	visual 				=	"ItMw_1H_Mace_M_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_M_02 (C_Item)
{	
	name 				=	"Säbel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Saebel;

	damageTotal  		= 	Damage_Saebel;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Saebel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Saebel;
	visual 				=	"ItMw_1H_Sword_M_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_M_02 (C_Item)
{	
	name 				=	"Bartaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Bartaxt;

	damageTotal  		= 	Damage_Bartaxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Bartaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Bartaxt;
	visual 				=	"ItMw_1H_Axe_M_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_M_03 (C_Item)
{	
	name 				=	"Leichter Morgenstern";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_LeichterMorgenstern;

	damageTotal  		= 	Damage_LeichterMorgenstern;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_LeichterMorgenstern;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_LeichterMorgenstern;
	visual 				=	"ItMw_1H_Mace_M_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_M_04 (C_Item)
{	
	name 				=	"Knochenbrecher";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Knochenbrecher;

	damageTotal  		= 	Damage_Knochenbrecher;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Knochenbrecher;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Knochenbrecher;
	visual 				=	"ItMw_1H_Mace_M_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 3

INSTANCE ItMw_1H_Sword_M_03 (C_Item)
{	
	name 				=	"Scimitar";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Scimitar;

	damageTotal  		= 	Damage_Scimitar;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Scimitar;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Scimitar;
	visual 				=	"ItMw_1H_Sword_M_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_M_03 (C_Item)
{	
	name 				=	"Sturmaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sturmaxt;

	damageTotal  		= 	Damage_Sturmaxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Sturmaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sturmaxt;
	visual 				=	"ItMw_1H_Axe_M_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_M_05 (C_Item)
{	
	name 				=	"Streitkolben";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Streitkolben;

	damageTotal  		= 	Damage_Streitkolben;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Streitkolben;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Streitkolben;
	visual 				=	"ItMw_1H_Mace_M_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_M_06 (C_Item)
{	
	name 				=	"Herzensbrecher";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Herzensbrecher;

	damageTotal  		= 	Damage_Herzensbrecher;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Herzensbrecher;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Herzensbrecher;
	visual 				=	"ItMw_1H_Mace_M_06.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_M_04 (C_Item)
{	
	name 				=	"Breitschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Breitschwert;

	damageTotal  		= 	Damage_Breitschwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Breitschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Breitschwert;
	visual 				=	"ItMw_1H_Sword_M_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_M_04 (C_Item)
{	
	name 				=	"Breitaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Breitaxt;

	damageTotal  		= 	Damage_Breitaxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Breitaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Breitaxt;
	visual 				=	"ItMw_1H_Axe_M_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_M_07 (C_Item)
{	
	name 				=	"Morgenstern";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Morgenstern;

	damageTotal  		= 	Damage_Morgenstern;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Morgenstern;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Morgenstern;
	visual 				=	"ItMw_1H_Mace_M_07.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_M_05 (C_Item)
{	
	name 				=	"Schädelspalter";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schaedelspalter;

	damageTotal  		= 	Damage_Schaedelspalter;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schaedelspalter;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schaedelspalter;
	visual 				=	"ItMw_1H_Sword_M_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 5

INSTANCE ItMw_1H_Sword_H_01 (C_Item)
{	
	name 				=	"Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Langschwert;

	damageTotal  		= 	Damage_Langschwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Langschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Langschwert;
	visual 				=	"ItMw_1H_Sword_H_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_H_01 (C_Item)
{	
	name 				=	"Kriegsaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegsaxt;

	damageTotal  		= 	Damage_Kriegsaxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Kriegsaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kriegsaxt;
	visual 				=	"ItMw_1H_Axe_H_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_H_01 (C_Item)
{	
	name 				=	"Streithammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Streithammer;

	damageTotal  		= 	Damage_Streithammer;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Streithammer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Streithammer;
	visual 				=	"ItMw_1H_Mace_H_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_H_02 (C_Item)
{	
	name 				=	"Kriegsschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegsschwert;

	damageTotal  		= 	Damage_Kriegsschwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Kriegsschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kriegsschwert;
	visual 				=	"ItMw_1H_Sword_H_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_H_03 (C_Item)
{	
	name 				=	"Ordensschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Ordensschwert;

	damageTotal  		= 	Damage_Ordensschwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Ordensschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Ordensschwert;
	visual 				=	"ItMw_1H_Sword_H_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_H_02 (C_Item)
{	
	name 				=	"Doppelaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Doppelaxt;

	damageTotal  		= 	Damage_Doppelaxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Doppelaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Doppelaxt;
	visual 				=	"ItMw_1H_Axe_H_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_H_02 (C_Item)
{	
	name 				=	"Schwerer Streitkolben";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_SchwererStreitkolben;

	damageTotal  		= 	Damage_SchwererStreitkolben;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_SchwererStreitkolben;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_SchwererStreitkolben;
	visual 				=	"ItMw_1H_Mace_H_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_H_04 (C_Item)
{	
	name 				=	"Vollstrecker";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Vollstrecker;

	damageTotal  		= 	Damage_Vollstrecker;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Vollstrecker;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Vollstrecker;
	visual 				=	"ItMw_1H_Sword_H_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 6

INSTANCE ItMw_1H_Sword_H_05 (C_Item)
{	
	name 				=	"Ritterschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Ritterschwert;

	damageTotal  		= 	Damage_Ritterschwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Ritterschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Ritterschwert;
	visual 				=	"ItMw_1H_Sword_H_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Axe_H_03 (C_Item)
{	
	name 				=	"Söldneraxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Soeldneraxt;

	damageTotal  		= 	Damage_Soeldneraxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Soeldneraxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Soeldneraxt;
	visual 				=	"ItMw_1H_Axe_H_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Mace_H_03 (C_Item)
{	
	name 				=	"Schwerer Morgenstern";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_SchwererMorgenstern;

	damageTotal  		= 	Damage_SchwererMorgenstern;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_SchwererMorgenstern;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_SchwererMorgenstern;
	visual 				=	"ItMw_1H_Mace_H_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};




//Kapitel 1



INSTANCE ItMw_2H_Axe_L_02 (C_Item) 
{	
	name 				=	"Holzfälleraxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Holzfaelleraxt;

	damageTotal			= 	Damage_Holzfaelleraxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Holzfaelleraxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Holzfaelleraxt;
	visual 				=	"ItMw_2H_Axe_L_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 2

INSTANCE ItMw_2H_Mace_L_01 (C_Item) 
{	
	name 				=	"Stabkeule";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Stabkeule;

	damageTotal			= 	Damage_Stabkeule;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Stabkeule;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Stabkeule;
	visual 				=	"ItMw_2H_Mace_L_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_L_01 (C_Item) 
{	
	name 				=	"Altes Bastardschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_AltesBastardschwert;

	damageTotal			= 	Damage_AltesBastardschwert;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_AltesBastardschwert;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_AltesBastardschwert;
	visual 				=	"ItMw_2H_Sword_L_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_L_03 (C_Item) 
{	
	name 				=	"Alte Streitaxt ";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_AlteStreitaxt;

	damageTotal			= 	Damage_AlteStreitaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_AlteStreitaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_AlteStreitaxt;
	visual 				=	"ItMw_2H_Axe_L_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Mace_L_02 (C_Item) 
{	
	name 				=	"Alter Kriegshammer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_AlterKriegshammer;

	damageTotal			= 	Damage_AlterKriegshammer;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_AlterKriegshammer;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_AlterKriegshammer;
	visual 				=	"ItMw_2H_Mace_L_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Mace_L_03 (C_Item) 
{	
	name 				=	"Orkschläger";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Orkschlaeger;

	damageTotal			= 	Damage_Orkschlaeger;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Orkschlaeger;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Orkschlaeger;
	visual 				=	"ItMw_2H_Mace_L_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_L_02 (C_Item) 
{	
	name 				=	"Bastardschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Bastardschwert;

	damageTotal			= 	Damage_Bastardschwert;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Bastardschwert;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Bastardschwert;
	visual 				=	"ItMw_2H_Sword_L_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_L_04 (C_Item) 
{	
	name 				=	"Streitaxt ";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitaxt;

	damageTotal			= 	Damage_Streitaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Streitaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Streitaxt;
	visual 				=	"ItMw_2H_Axe_L_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Mace_L_04 (C_Item) 
{	
	name 				=	"Trollschläger";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Trollschlaeger;

	damageTotal			= 	Damage_Trollschlaeger;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Trollschlaeger;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Trollschlaeger;
	visual 				=	"ItMw_2H_Mace_L_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Kapitel 3



INSTANCE ItMw_2H_Axe_M_01 (C_Item) 
{	
	name 				=	"Verwitterte Langaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_VerwitterteLangaxt;

	damageTotal			= 	Damage_VerwitterteLangaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_VerwitterteLangaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_VerwitterteLangaxt;
	visual 				=	"ItMw_2H_Axe_M_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Mace_M_01 (C_Item) 
{	
	name 				=	"Leichter Kriegshammer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_LeichterKriegshammer;

	damageTotal			= 	Damage_LeichterKriegshammer;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_LeichterKriegshammer;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_LeichterKriegshammer;
	visual 				=	"ItMw_2H_Mace_M_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Mace_M_02 (C_Item) 
{	
	name 				=	"Orkhammer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Orkhammer;

	damageTotal			= 	Damage_Orkhammer;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Orkhammer;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Orkhammer;
	visual 				=	"ItMw_2H_Mace_M_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_M_02 (C_Item) 
{	
	name 				=	"Schweres Bastardschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_SchweresBastardschwert;

	damageTotal			= 	Damage_SchweresBastardschwert;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_SchweresBastardschwert;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_SchweresBastardschwert;
	visual 				=	"ItMw_2H_Sword_M_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_M_02 (C_Item) 
{	
	name 				=	"Schwere Streitaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_SchwereStreitaxt;

	damageTotal			= 	Damage_SchwereStreitaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_SchwereStreitaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_SchwereStreitaxt;
	visual 				=	"ItMw_2H_Axe_M_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Mace_M_03 (C_Item) 
{	
	name 				=	"Trollhammer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Trollhammer;

	damageTotal			= 	Damage_Trollhammer;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Trollhammer;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Trollhammer;
	visual 				=	"ItMw_2H_Mace_M_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_M_03 (C_Item) 
{	
	name 				=	"Alter Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_AlterZweihaender;

	damageTotal			= 	Damage_AlterZweihaender;
	damagetype			=	DAM_EDGE;
	range    			=  	Damage_AlterZweihaender;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_AlterZweihaender;
	visual 				=	"ItMw_2H_Sword_M_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_M_03 (C_Item) 
{	
	name 				=	"Alte Langaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_AlteLangaxt;

	damageTotal			= 	Damage_AlteLangaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_AlteLangaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_AlteLangaxt;
	visual 				=	"ItMw_2H_Axe_M_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Mace_M_04 (C_Item) 
{	
	name 				=	"Kriegshammer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Kriegshammer;

	damageTotal			= 	Damage_Kriegshammer;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Kriegshammer;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Kriegshammer;
	visual 				=	"ItMw_2H_Mace_M_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_M_04 (C_Item) 
{	
	name 				=	"Orktöter";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orktoeter;

	damageTotal			= 	Damage_Orktoeter;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orktoeter;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Orktoeter;
	visual 				=	"ItMw_2H_Sword_M_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 4

INSTANCE ItMw_2H_Sword_M_05 (C_Item) 
{	
	name 				=	"Großschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Großschwert;

	damageTotal			= 	Damage_Großschwert;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Großschwert;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Großschwert;
	visual 				=	"ItMw_2H_Sword_M_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_M_04 (C_Item) 
{	
	name 				=	"Großaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Großaxt;

	damageTotal			= 	Damage_Großaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Großaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Großaxt;
	visual 				=	"ItMw_2H_Axe_M_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_M_06 (C_Item) 
{	
	name 				=	"Trolltöter";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Trolltoeter;

	damageTotal			= 	Damage_Trolltoeter;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Trolltoeter;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Trolltoeter;
	visual 				=	"ItMw_2H_Sword_M_06.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_M_07 (C_Item) 
{	
	name 				=	"Leichter Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_LeichterZweihaender;

	damageTotal			= 	Damage_LeichterZweihaender;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_LeichterZweihaender;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_LeichterZweihaender;
	visual 				=	"ItMw_2H_Sword_M_07.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_M_05 (C_Item) 
{	
	name 				=	"Leichte Langaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_LeichteLangaxt;

	damageTotal			= 	Damage_LeichteLangaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_LeichteLangaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_LeichteLangaxt;
	visual 				=	"ItMw_2H_Axe_M_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Mace_M_05 (C_Item) 
{	
	name 				=	"Schwerer Kriegshammer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_SchwererKriegshammer;

	damageTotal			= 	Damage_SchwererKriegshammer;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_SchwererKriegshammer;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_SchwererKriegshammer;
	visual 				=	"ItMw_2H_Mace_M_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Mace_M_06 (C_Item) 
{	
	name 				=	"Zermalmer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Zermalmer;

	damageTotal			= 	Damage_Zermalmer;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Zermalmer;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zermalmer;
	visual 				=	"ItMw_2H_Mace_M_06.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_M_08 (C_Item) 
{	
	name 				=	"Schlachtschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schlachtschwert;

	damageTotal			= 	Damage_Schlachtschwert;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Schlachtschwert;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Schlachtschwert;
	visual 				=	"ItMw_2H_Sword_M_08.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_M_06 (C_Item) 
{	
	name 				=	"Schlachtbeil";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schlachtbeil;

	damageTotal			= 	Damage_Schlachtbeil;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Schlachtbeil;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Schlachtbeil;
	visual 				=	"ItMw_2H_Axe_M_06.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_SWORD_M_09 (C_Item) 
{	
	name 				=	"Witwenmacher";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Witwenmacher;

	damageTotal			= 	Damage_Witwenmacher;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Witwenmacher;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Witwenmacher;
	visual 				=	"ItMw_2H_SWORD_M_09.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 5

INSTANCE ItMw_2H_Sword_H_01 (C_Item) 
{	
	name 				=	"Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender;

	damageTotal			= 	Damage_Zweihaender;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender;
	visual 				=	"ItMw_2H_Sword_H_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_H_01 (C_Item) 
{	
	name 				=	"Langaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Langaxt;

	damageTotal			= 	Damage_Langaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Langaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Langaxt;
	visual 				=	"ItMw_2H_Axe_H_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_H_02 (C_Item) 
{	
	name 				=	"Blutschneide";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blutschneide;

	damageTotal			= 	Damage_Blutschneide;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blutschneide;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blutschneide;
	visual 				=	"ItMw_2H_Sword_H_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_H_03 (C_Item) 
{	
	name 				=	"Berserkerschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Berserkerschwert;

	damageTotal			= 	Damage_Berserkerschwert;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Berserkerschwert;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Berserkerschwert;
	visual 				=	"ItMw_2H_Sword_H_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_H_02 (C_Item) 
{	
	name 				=	"Berserkeraxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Berserkeraxt;

	damageTotal			= 	Damage_Berserkeraxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Berserkeraxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Berserkeraxt;
	visual 				=	"ItMw_2H_Axe_H_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_H_04 (C_Item) 
{	
	name 				=	"Heldenschneide";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Heldenschneide;

	damageTotal			= 	Damage_Heldenschneide;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Heldenschneide;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Heldenschneide;
	visual 				=	"ItMw_2H_Sword_H_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_H_05 (C_Item) 
{	
	name 				=	"Schwerer Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_SchwererZweihaender;

	damageTotal			= 	Damage_SchwererZweihaender;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_SchwererZweihaender;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_SchwererZweihaender;
	visual 				=	"ItMw_2H_Sword_H_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_H_03 (C_Item) 
{	
	name 				=	"Schwere Langaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_SchwereLangaxt;

	damageTotal			= 	Damage_SchwereLangaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_SchwereLangaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_SchwereLangaxt;
	visual 				=	"ItMw_2H_Axe_H_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_H_06 (C_Item) 
{	
	name 				=	"Drachenschneide";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Drachenschneide;

	damageTotal			= 	Damage_Drachenschneide;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Drachenschneide;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Drachenschneide;
	visual 				=	"ItMw_2H_Sword_H_06.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Kapitel 6

INSTANCE ItMw_2H_Sword_H_07 (C_Item) 
{	
	name 				=	"Paladinschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Paladinschwert;

	damageTotal			= 	Damage_Paladinschwert;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Paladinschwert;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Paladinschwert;
	visual 				=	"ItMw_2H_Sword_H_07.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_H_04 (C_Item) 
{	
	name 				=	"Drachenjägeraxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Drachenjaegeraxt;

	damageTotal			= 	Damage_Drachenjaegeraxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Drachenjaegeraxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Drachenjaegeraxt;
	visual 				=	"ItMw_2H_Axe_H_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


//Schmieden Common




// Schmiedewaffen Spezial 



















//Gesegnete Waffen

INSTANCE ItMw_1H_Blessed_01 (C_Item) 
{	
	name 				=	"Schwert der Reue";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_1;

	damageTotal			= 	Damage_Blessed_1H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_1;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_1;
	visual 				=	"ItMw_1H_Blessed_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Blessed_02 (C_Item) 
{	
	name 				=	"Schwert der Buße";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_2;

	damageTotal			= 	Damage_Blessed_1H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_2;
	visual 				=	"ItMw_1H_Blessed_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Blessed_03 (C_Item) 
{	
	name 				=	"Schwert des Lichts";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_3;

	damageTotal			= 	Damage_Blessed_1H_3;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_3;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_3;
	visual 				=	"ItMw_1H_Blessed_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Blessed_01 (C_Item) 
{	
	name 				=	"Verkünder des Glaubens";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_1;

	damageTotal			= 	Damage_Blessed_2H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_1;	

	cond_atr[2]   			= 	ATR_STRENGTH;
	cond_value[2]  			= 	Condition_Blessed_2H_1;
	visual 				=	"ItMw_2H_Blessed_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Blessed_02 (C_Item) 
{	
	name 				=	"Bewahrer des Glaubens";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_2;

	damageTotal			= 	Damage_Blessed_2H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_2;
	visual 				=	"ItMw_2H_Blessed_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Blessed_03 (C_Item) 
{	
	name 				=	"Stimme des Glaubens";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_3;

	damageTotal			= 	Damage_Blessed_2H_3;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_3;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_3;
	visual 				=	"ItMw_2H_Blessed_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
*/






