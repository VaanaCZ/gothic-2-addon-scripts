// ************************************************************************************************
// 	Wert der Fackel
// ************************************************************************************************

const int	Value_Fackel			=	2;

// ************************************************************************************************
// 	Fackel muЯ ihre Instanznamen behalten
// ************************************************************************************************
INSTANCE ItLsTorch(C_Item)
{
	name 				=	"Факел";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_TORCH|ITEM_MULTI;

	value 				=	Value_Fackel;

	visual 				=	"ItLs_Torch_01.3ds";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[3]				=   "Факел.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= 	value;

};

/******************************************************************************************/
INSTANCE ItLsTorchburning(C_Item)
{
	name 				=	"Горящий факел";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_TORCH;

	value 				=	0;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[3]				=   "Факел.";
};

/******************************************************************************************/
INSTANCE ItLsTorchburned(C_Item)
{
	name 				=	"Факел";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_TORCH|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItLs_Torchburned_01.3ds";
	material 			=	MAT_WOOD;
	TEXT[3]				=   "Сгоревший факел.";
	description			= 	name;
};
// *****************
// Feuerspucker-Item
// *****************

INSTANCE ItLsTorchFirespit(C_Item)
{
	name 				=	"Факел";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_TORCH;

	value 				=	1;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;

	scemeName			=	"FIRESPIT";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
