// ************************************************************************************************
// 	Wert der Fackel
// ************************************************************************************************

const int	Value_Fackel			=	2;

// ************************************************************************************************
// 	Fackel muﬂ ihre Instanznamen behalten
// ************************************************************************************************
INSTANCE ItLsTorch(C_Item)
{
	name 				=	"Pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_TORCH|ITEM_MULTI;

	value 				=	Value_Fackel;

	visual 				=	"ItLs_Torch_01.3ds";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[3]				=   "Zwyk≥a pochodnia.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= 	value;

};

/******************************************************************************************/
INSTANCE ItLsTorchburning(C_Item)
{
	name 				=	"P≥onπca pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_TORCH;

	value 				=	0;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[3]				=   "Zwyk≥a pochodnia.";
};

/******************************************************************************************/
INSTANCE ItLsTorchburned(C_Item)
{
	name 				=	"Pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_TORCH|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItLs_Torchburned_01.3ds";
	material 			=	MAT_WOOD;
	TEXT[3]				=   "Wypalona pochodnia.";
	description			= 	name;
};
// *****************
// Feuerspucker-Item
// *****************

INSTANCE ItLsTorchFirespit(C_Item)
{
	name 				=	"Pochodnia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_TORCH;

	value 				=	1;

	visual 				=	"ITLSTORCHBURNING.ZEN";
	material 			=	MAT_WOOD;

	scemeName			=	"FIRESPIT";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
