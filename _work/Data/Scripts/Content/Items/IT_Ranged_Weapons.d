// *************************
// unbenutzte Item - Visuals
// *************************

//ItRw_Bow_War_04	// Dämonenbogen, Todbringer
//ItRw_Bow_War_03	// Sturmbogen
//ItRw_Bow_War_02	// Orkhetzer
//ItRw_Bow_War_01	// Kriegsbogen
//ItRw_Bow_Long_08	// Nimroder, Hornbogen
//ItRw_Bow_Long_07	// Armeebogen
//ItRw_Bow_Long_06	// Windbrecher
//ItRw_Bow_Long_05	// Wolfsfetzer
//ItRw_Bow_Long_04	// Eichenbogen
//ItRw_Bow_Long_03	// Weidenbogen
//ItRw_Bow_Long_02	// Heckenbogen
//ItRw_Bow_Long_01	// Langbogen
//ItRw_Bow_Small_05	// Knochenbogen
//ItRw_Bow_Small_04	// Jagdbogen
//ItRw_Bow_Small_03	// Feldbogen
//ItRw_Bow_Small_02	// Reiterbogen
//ItRw_Bow_Small_01	// Kurzbogen 



//Munition

INSTANCE ItRw_Arrow(C_Item)
{
	name 				=	"Pfeil";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	Value_Pfeil;

	visual 				=	"ItRw_Arrow.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

INSTANCE ItRw_Bolt(C_Item)
{
	name 				=	"Bolzen";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;

	value 				=	Value_Bolzen;

	visual 				=	"ItRw_Bolt.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

//NSC Waffen

INSTANCE ItRw_Mil_Crossbow(C_Item)
{
	name 				=	"Armbrust";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_MilArmbrust;

	damageTotal			= 	Damage_MilArmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_MilArmbrust;
	visual 				=	"ItRw_Mil_Crossbow.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Sld_Bow(C_Item)
{
	name 				=	"Bogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Sldbogen;

	damageTotal			=	Damage_Sldbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Sldbogen;
	visual 				=	"ItRw_Sld_Bow.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


//Bögen
//Kapitel 1
instance ItRw_Bow_L_01(C_Item)
{
	name 				=	"Kurzbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Kurzbogen;

	damageTotal			=	Damage_Kurzbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Kurzbogen;
	visual 				=	"ItRw_Bow_L_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Bow_L_02 (C_Item)
{
	name 				=	"Weidenbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Weidenbogen;

	damageTotal			=	Damage_Weidenbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Weidenbogen;
	visual 				=	"ItRw_Bow_L_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 2
instance ItRw_Bow_L_03 (C_Item)
{
	name 				=	"Jagdbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Jagdbogen;

	damageTotal			=	Damage_Jagdbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Jagdbogen;
	visual 				=	"ItRw_Bow_M_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

instance ItRw_Bow_L_04 (C_Item)
{
	name 				=	"Ulmenbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Ulmenbogen;

	damageTotal			=	Damage_Ulmenbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Ulmenbogen;
	visual 				=	"ItRw_Bow_M_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 3

INSTANCE ItRw_Bow_M_01 (C_Item)
{
	name 				=	"Kompositbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Kompositbogen;

	damageTotal			=	Damage_Kompositbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Kompositbogen;
	visual 				=	"ItRw_Bow_M_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Bow_M_02 (C_Item)
{
	name 				=	"Eschenbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Eschenbogen;

	damageTotal			=	Damage_Eschenbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Eschenbogen;
	visual 				=	"ItRw_Bow_M_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 4

INSTANCE ItRw_Bow_M_03 (C_Item)
{
	name 				=	"Langbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Langbogen;

	damageTotal			=	Damage_Langbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Langbogen;
	visual 				=	"ItRw_Bow_M_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Bow_M_04 (C_Item)
{
	name 				=	"Buchenbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Buchenbogen;

	damageTotal			=	Damage_Buchenbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Buchenbogen;
	visual 				=	"ItRw_Bow_M_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 5

INSTANCE ItRw_Bow_H_01 (C_Item)
{
	name 				=	"Knochenbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Knochenbogen;

	damageTotal			=	Damage_Knochenbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Knochenbogen;
	visual 				=	"ItRw_Bow_H_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Bow_H_02 (C_Item)
{
	name 				=	"Eichenbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Eichenbogen;

	damageTotal			=	Damage_Eichenbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Eichenbogen;
	visual 				=	"ItRw_Bow_H_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 6

INSTANCE ItRw_Bow_H_03 (C_Item)
{
	name 				=	"Kriegsbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Kriegsbogen;

	damageTotal			=	Damage_Kriegsbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Kriegsbogen;
	visual 				=	"ItRw_Bow_H_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItRw_Bow_H_04 (C_Item)
{
	name 				=	"Drachenbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Drachenbogen;

	damageTotal			=	Damage_Drachenbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Drachenbogen;
	visual 				=	"ItRw_Bow_H_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Armbrüste

//Kapitel 1

INSTANCE ItRw_Crossbow_L_01(C_Item)
{
	name 				=	"Jagdarmbrust";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Jagdarmbrust;

	damageTotal			= 	Damage_Jagdarmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Jagdarmbrust;
	visual 				=	"ItRw_Crossbow_L_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 2

INSTANCE ItRw_Crossbow_L_02(C_Item)
{
	name 				=	"Leichte Armbrust";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_LeichteArmbrust;

	damageTotal			= 	Damage_LeichteArmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_LeichteArmbrust;
	visual 				=	"ItRw_Crossbow_L_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 3

INSTANCE ItRw_Crossbow_M_01(C_Item)
{
	name 				=	"Armbrust";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Armbrust;

	damageTotal			= 	Damage_Armbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Armbrust;
	visual 				=	"ItRw_Crossbow_M_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 4

INSTANCE ItRw_Crossbow_M_02(C_Item)
{
	name 				=	"Kriegsarmbrust";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Kriegsarmbrust;

	damageTotal			= 	Damage_Kriegsarmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Kriegsarmbrust;
	visual 				=	"ItRw_Crossbow_M_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 5

INSTANCE ItRw_Crossbow_H_01(C_Item)
{
	name 				=	"Schwere Armbrust";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_SchwereArmbrust;

	damageTotal			= 	Damage_SchwereArmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_SchwereArmbrust;
	visual 				=	"ItRw_Crossbow_H_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Kapitel 6

INSTANCE ItRw_Crossbow_H_02(C_Item)
{
	name 				=	"Drachenjägerarmbrust";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_Drachenjaegerarmbrust;

	damageTotal			= 	Damage_Drachenjaegerarmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Drachenjaegerarmbrust;
	visual 				=	"ItRw_Crossbow_H_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
