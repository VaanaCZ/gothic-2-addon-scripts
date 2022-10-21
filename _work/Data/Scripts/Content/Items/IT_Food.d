// ************************************************************************************************
// Heilwirkung und Kosten von Nahrung
// ************************************************************************************************

const int	Value_Apple		=	8;		const int	HP_Apple		=	3;
const int	Value_Cheese	=	30;		const int	HP_Cheese		=	15;
const int	Value_Bacon		=	50;		const int	HP_Bacon		=	20;
const int	Value_Bread		=	20;		const int	HP_Bread		=	10;
const int	Value_Fish		=	15;		const int	HP_Fish			=	5;
const int	Value_Rawmeat	=	3;		const int	HP_RawMeat		=	6;
const int	Value_Meat		=	6;		const int	HP_Meat			=	12;
const int	Value_Stew		=	8;		const int	HP_Stew			=	20;
const int	Value_FishSoup	=	20;		const int	HP_FishSoup		=	10;
const int	Value_Sausage	=	30;		const int	HP_Sausage		=	12;
const int	Value_Honey		=	30;		const int	HP_Honey		=	12;

const int	Value_Water		=	10;		const int	HP_Water		=	8;
const int	Value_Beer		=	20;		const int	HP_Beer			=	3;	const int	Mana_Beer		=	1;
const int	Value_Booze		=	15;		const int	HP_Booze		=	4;	const int	Mana_Booze		=	1;
const int	Value_Wine		=	20;		const int	HP_Wine			=	2;	const int	Mana_Wine		=	1;
const int	Value_Milk		=	15; 	const int	HP_Milk			=	5;	const int	Mana_Milk		=	1;	// Joly: Wenn diese Werte geändert werden passt Lobarts Auftrag holMilch nicht mehr!!!!!!




// ************************************************************************************************
//	Essbares				                                          				
// ************************************************************************************************


INSTANCE ItFo_Apple (C_Item)
{	
	name 				=	"Apfel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Apple;
	
	visual 				=	"ItFo_Apple.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Apple;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Apple;
	
	TEXT[3]				=    "Ein frischer Apfel";
	TEXT[4]				=    "knackig und saftig";
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Apple;

};

	FUNC VOID Use_Apple()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Apple);
		
		if (Npc_IsPlayer (self))
		{
			Apple_Bonus = Apple_Bonus + 1;
			
			if (Apple_Bonus == 7)  
			{
				Print	(PRINT_Eat1);
			};
			if (Apple_Bonus == 15)  
			{
				Print (PRINT_Eat2);
			};
			if (Apple_Bonus == 25)  
			{
				Print (PRINT_Eat3);
				B_RaiseAttribute (self,	ATR_STRENGTH, 1);
				Snd_Play	("LevelUp");
				Apple_Bonus = 0;
			};
		};
	};

INSTANCE ItFo_Cheese (C_Item)
{	
	name 				=	"Käse";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Cheese;
	
	visual 				=	"ItFo_Cheese.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Cheese;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Cheese;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Cheese;

};

	FUNC VOID Use_Cheese()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Cheese);
	};


INSTANCE ItFo_Bacon (C_Item)
{	
	name 				=	"Schinken";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bacon;
	
	visual 				=	"ItFo_Bacon.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Bacon;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Bacon;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Bacon;

};

	FUNC VOID Use_Bacon()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bacon);
	};



INSTANCE ItFo_Bread (C_Item)
{	
	name 				=	"Brot";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bread;
	
	visual 				=	"ItFo_Bread.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Bread;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Bread;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Bread;

};

	FUNC VOID Use_Bread()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bread);
	};




INSTANCE ItFo_Fish (C_Item)
{	
	name 				=	"Fisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Fish;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Fish;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Fish;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Fish;

};

	FUNC VOID Use_Fish()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Fish);
	};




INSTANCE ItFoMuttonRaw (C_Item)
{	
	name 				=	"Rohes Fleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_RawMeat;
	
	visual 				=	"ItFoMuttonRaw.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	on_state[0]			=	Use_RawMeat;

	description			= 	name;
	
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_RawMeat;
	
	TEXT[5]				= 	NAME_Value;			
	COUNT[5]			= 	Value_RawMeat;

};

	FUNC VOID Use_RawMeat()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_RawMeat);
	};




INSTANCE ItFoMutton (C_Item)	//kommt aus Bratpfannen-Mobsi !!!
{	
	name 				=	"Gebratenes Fleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Meat;
	
	visual 				=	"ItFoMutton.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MEAT";
	on_state[0]			=	Use_Meat;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Meat;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Meat;

};

	FUNC VOID Use_Meat()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Meat);
	};




INSTANCE ItFo_Stew (C_Item)
{	
	name 				=	"Eintopf";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_Stew;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Stew;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

	FUNC VOID Use_Stew()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Stew);
	};



INSTANCE ItFo_XPStew (C_Item)
{	
	name 				=	"Thekla's Eintopf";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_XPStew;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Stew;
	TEXT[2]				=  	NAME_Bonus_Str; 	COUNT[2]	= 1;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_Stew;

};

	FUNC VOID Use_XPStew()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Stew);
		Snd_Play	("LevelUp");
		B_RaiseAttribute (self, ATR_STRENGTH, 1);
	};



INSTANCE ItFo_CoragonsBeer (C_Item)
{	
	name 				=	"Bier";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Beer;
	
	visual 				=	"ItFo_Beer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_CoragonsBeerBeer;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Beer;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_Beer;
	
	TEXT[4]				= 	"Coragons Spezial Bier";		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Beer;

};

	FUNC VOID Use_CoragonsBeerBeer()
	{
		B_RaiseAttribute	(self,	ATR_MANA_MAX,	Mana_Beer);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Beer);	 
		
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	HP_Beer);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Beer);
		var string concatText;
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(HP_Beer));
		PrintScreen	(concatText, 55, -1, FONT_Screen, 2);
	};



INSTANCE ItFo_FishSoup (C_Item)
{	
	name 				=	"Fischsuppe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_FishSoup.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_FishSoup;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_FishSoup;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_FishSoup;

};

	FUNC VOID Use_FishSoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_FishSoup);
	};




INSTANCE ItFo_Sausage (C_Item)
{	
	name 				=	"Wurst";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Sausage;
	
	visual 				=	"ItFo_Sausage.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Sausage;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Sausage;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Sausage;

};

	FUNC VOID Use_Sausage()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Sausage);
	};


INSTANCE ItFo_Honey (C_Item)
{	
	name 				=	"Honig";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Honey;
	
	visual 				=	"ItFo_Honey.3DS";
	material 			=	MAT_STONE;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Honey;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;	COUNT[1]	= HP_Honey;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Honey;

};

	FUNC VOID Use_Honey()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Honey);
	};

// ************************************************************************************************
//	Trinkbares
// ************************************************************************************************



INSTANCE ItFo_Water (C_Item)
{	
	name 				=	"Wasser";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Water;
	
	visual 				=	"ItFo_Water.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Water;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= HP_Water;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= Value_Water;

};

	FUNC VOID Use_Water()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Water);
	};



INSTANCE ItFo_Beer (C_Item)
{	
	name 				=	"Bier";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Beer;
	
	visual 				=	"ItFo_Beer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_Beer;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Beer;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_Beer;
	
	TEXT[4]				= 	"Dunkles Paladiner";		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Beer;

};

	FUNC VOID Use_Beer()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Beer);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Beer);	 
	};


INSTANCE ItFo_Booze (C_Item)
{	
	name 				=	"Wacholder";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Booze;
	
	visual 				=	"ItFo_Booze.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Booze;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Booze;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_Booze;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Booze;

};

	FUNC VOID Use_Booze()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Booze);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Booze);	 
	};


INSTANCE ItFo_Wine (C_Item)
{	
	name 				=	"Wein";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Wine;
	
	visual 				=	"ItFo_Wine.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Wine;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Wine;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_Wine;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Wine;

};

	FUNC VOID Use_Wine()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Wine);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Wine);	 
	};


INSTANCE ItFo_Milk (C_Item)
{	
	name 				=	"Milch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Milk;
	
	visual 				=	"ItFo_Milk.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Milk;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Milk;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_Milk;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Milk;

};

	FUNC VOID Use_Milk()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Milk);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Milk);	 
	};

