INSTANCE ITKE_PORTALTEMPELWALKTHROUGH_ADDON (C_Item)
{
	name 				=	"Rezavý klíč";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Pasuje k tęmto dveâím:";
	TEXT[3]				=   "Teleportační kámen k chrámovému portálu";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-----------------------------------------------------------------------
INSTANCE ITKE_Greg_ADDON_MIS (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Klíč od klášterní";
	TEXT[3]				=   "Kapitánova chatrč";
	TEXT[4]				=   "Greg";	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-----------------------------------------------------------------------
INSTANCE ITKE_Addon_Tavern_01 (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Louův klíč";
	
	TEXT[2]				=	"Pasuje ke dveâím v hospodę";
	TEXT[3]				=   "v táboâe banditů";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-----------------------------------------------------------------------
INSTANCE ITKE_Addon_Esteban_01 (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Estebanův klíč";
	
	TEXT[2]				=	"Pasuje k zámku u truhlice";
	TEXT[3]				=   "v jeho skrýši";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//-----------------------------------------------------------------------
INSTANCE ITKE_ORLAN_TELEPORTSTATION (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Orlanův klíč";
	
	TEXT[2]				=	"Pasuje ke dveâím v jeskyni";
	TEXT[3]				=   "jižnę od jeho hospody";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};


//-----------------------------------------------------------------------
INSTANCE ITKE_CANYONLIBRARY_HIERARCHY_BOOKS_ADDON (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"od šamana ve skâetím táboâe";
	TEXT[3]				=   "pâed knihovnou učenců";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-----------------------------------------------------------------------
INSTANCE ITKE_ADDON_BUDDLER_01 (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Klíč od truhlice";
	
	TEXT[2]				=	"Z tábora banditů";
	TEXT[3]				=   "";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-----------------------------------------------------------------------
INSTANCE ITKE_ADDON_SKINNER (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Klíč od truhlice";
	
	TEXT[2]				=	"Skinnerův klíč";
	TEXT[3]				=   "";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-----------------------------------------------------------------------
INSTANCE ITKE_Addon_Thorus (C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Thorův klíč";
	
	TEXT[2]				=	"Pasuje k zámku u truhlice";
	TEXT[3]				=   "";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
