// ************************************************************************************************
// Wert von Kram
// ************************************************************************************************

// Items für Objektbenutzung und Item-Interaktion...
// z.B. Krautstampfer, Hammer, Kochlöffel, Laborflasche, Roheisen (Schmiede)

const int	Value_SwordBlade		= 10;
const int	Value_SwordBladeHot		= 10;
const int	Value_SwordRawHot		= 10;
const int	Value_SwordRaw			= 10;

const int	Value_Brush				= 3;	
const int	Value_Flask				= 3;
const int	Value_Stomper			= 3;
const int 	Value_Pan				= 20;
const int 	Value_Saw				= 20;
const int	Value_Broom				= 10;
const int	Value_Rake				= 10;

const int	Value_Hammer			= 10;
const int	Value_Scoop				= 3;
const int	Value_Nugget			= 200;
const int	Value_Joint				= 30;
const int	Value_Alarmhorn			= 10;
const int	Value_Lute				= 10;
const int	Value_Gold				= 1;

const int	Value_RuneBlank			= 100;

const int	Value_Sulfur			= 20;
const int	Value_Quartz			= 20;
const int	Value_Pitch				= 10;
const int	Value_Rockcrystal		= 30;
const int	Value_Aquamarine		= 100;
const int	Value_HolyWater			= 20;
const int	Value_Coal				= 15;
const int	Value_DarkPearl			= 1000;

//Tabak
const int 	VALUE_ItMi_ApfelTabak	= 10;
const int 	VALUE_ItMi_PilzTabak	= 10;
const int 	VALUE_ItMi_SumpfTabak	= 10;
const int 	VALUE_ItMi_DoppelTabak	= 10;
const int 	VALUE_ItMi_HonigTabak	= 10;

//Schmuck Items 
const int	Value_SilverRing		 = 120; 
const int	Value_SilverNecklace	 = 200;
const int	Value_SilverCandleHolder =  50;
const int	Value_SilverPlate	 	 = 100; //muss durch 2 teilbar in B_Say Gold enthalten sein
const int	Value_SilverCup			 = 100; //muss durch 2 teilbar in B_Say Gold enthalten sein
const int	Value_SilverChalice		 = 250;

const int 	Value_GoldPlate			=  200;
const int	Value_GoldRing			=  250;
const int	Value_GoldNecklace		=  300;
const int	Value_GoldCandleHolder	=  120;
const int	Value_GoldCup			=  350;
const int	Value_BloodCup			=  200;
const int   Value_GoldChalice		=  500;
const int   Value_GoldChest			=  750;
const int	Value_JeweleryChest		= 1000;

const int   Value_InnosStatue		=  100;
const int	Value_Sextant			= 1500;


/*ursprüngliche Werte:
const int	Value_SilverRing		 = 200;
const int	Value_SilverNecklace	 = 100;
const int	Value_SilverCandleHolder = 30 ;
const int	Value_SilverPlate	 	 = 100;
const int	Value_SilverCup			 = 200;
const int	Value_SilverChalice		 = 100;
                                           
const int	Value_GoldRing			= 1150;
const int	Value_GoldNecklace		= 250 ;
const int	Value_GoldCandleHolder	= 300 ;
const int	Value_GoldCup			= 800 ;
const int   Value_GoldChalice		= 400 ;
const int   Value_GoldChest			= 1000;
const int	Value_JeweleryChest		= 50  ;
                                           
const int   Value_InnosStatue		= 100 ;
const int	Value_Sextant			= 30  ;
*/








/*******************************************************************************************
**	Items für Mobsi-Benutzung               					  		  				  **
*******************************************************************************************/
// Krautstampfen

INSTANCE ItMi_Stomper (C_Item)
{
	name 				=	"Krautstampfer";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"ItMi_Stomper.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};
/******************************************************************************************/
// Runen Bauen
INSTANCE ItMi_RuneBlank (C_Item)
{
	name 				=	"Runenstein";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual 				=	"ItMi_RuneBlank.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_Pliers (C_Item)
{
	name 				=	"Zange";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual 				=	"ItMi_Pliers.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};
/******************************************************************************************/
// Labor Wasserflasche
INSTANCE ItMi_Flask (C_Item)
{
	name 				=	"Laborwasserflasche";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Flask;

	visual 				=	"ItMi_Flask.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};
/******************************************************************************************/
// Reparieren
INSTANCE ItMi_Hammer (C_Item)
{
	name 				=	"Hammer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Hammer;

	visual 				=	"ItMi_Hammer.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

/******************************************************************************************/
// im Topf rühren
INSTANCE ItMi_Scoop (C_Item)
{
	name 				=	"Kochlöffel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Scoop;

	visual 				=	"ItMi_Scoop.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
//	Pfanne zum Braten (für  Lagerfeuer)

INSTANCE ItMi_Pan (C_Item)
{
	name 				=	"Pfanne";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pan;

	visual 				=	"ItMi_Pan.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//Pfann für Herd

INSTANCE ItMi_PanFull (C_Item)
{
	name 				=	"Pfanne";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pan;

	visual 				=	"ItMi_PanFull.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
//	Säge für Baumstamm

INSTANCE ItMi_Saw (C_Item)
{
	name 				=	"Säge";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Saw;

	visual 				=	"ItMi_Saw.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};	   	   

/******************************************************************************************/
//	Items für Schmiede	    					 								 		  **

INSTANCE ItMiSwordraw (C_Item)
{
	name 				=	"Rohstahl";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordRaw;

	visual 				=	"ItMiSwordraw.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				=	NAME_Value;	
	COUNT[5]			= 	value;
};

/******************************************************************************************/
INSTANCE ItMiSwordrawhot (C_Item)
{
	name 				=	"Glühender Stahl";

	mainflag 			=	ITEM_KAT_NONE; 
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordRawHot;

	visual 				=	"ItMiSwordrawhot.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

/******************************************************************************************/
INSTANCE ItMiSwordbladehot (C_Item)
{
	name 				=	"Glühende Klinge";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordBladehot;

	visual 				=	"ItMiSwordbladehot.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

/******************************************************************************************/
INSTANCE ItMiSwordblade	(C_Item)
{
	name 				=	"Klinge";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordBlade;

	visual 				=	"ItMiSwordblade.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


/******************************************************************************************/


/*******************************************************************************************
**	Items für Item-Interaktionen (ohne Mobsi benutzbar)               		 		  	  **
*******************************************************************************************/

/******************************************************************************************/
// Besen zum Fegen
INSTANCE ItMi_Broom (C_Item)
{
	name 				=	"Besen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Broom;

	visual 				=	"ItMi_Broom.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"BROOM";
	on_state[0]			= 	Use_Broom;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
func void Use_Broom()
{
	if (Npc_IsPlayer(self))
	&& (Wld_GetPlayerPortalGuild() == GIL_NOV)
	&& (MIS_ParlanFegen == LOG_RUNNING)
	{
		B_Say (self, self, "$NOSWEEPING");
		Print (PRINT_NoSweeping);
	};
};
/******************************************************************************************/
// zum Rumklimpern
INSTANCE ItMi_Lute (C_Item)
{
	name 				=	"Laute";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Lute;

	visual 				=	"ItMi_Lute.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"LUTE";
	on_state[0]			= 	Use_Lute;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
func void Use_Lute()
{
	
};


/******************************************************************************************/
// Für Babe-Putzen
INSTANCE ItMi_Brush(C_Item)
{
	name 				=	"Bürste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Brush;

	visual				=	"ItMi_Brush.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"BRUSH";
	on_state[0]			= 	Use_Brush;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

func void Use_Brush()
{
	
};


/******************************************************************************************/
INSTANCE ItMi_Joint(C_Item)
{
	name 				=	"Ein Stengel Sumpfkraut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint;

	visual 				=	"ItMi_Joint_US.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"JOINT";
	on_state[0]			= 	Use_Joint;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};
func void Use_Joint()
{
	if (Npc_IsPlayer (self))
	{
		Wld_PlayEffect ("SLOW_TIME", self, self, 0, 0, 0, FALSE);
	};
};

/******************************************************************************************/
/*
INSTANCE ItMi_Alarmhorn (C_Item)
{
	name 				=	"Horn";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Alarmhorn;

	visual 				=	"ItMi_Alarmhorn.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"HORN";
	on_state[0]			= 	Use_Alarmhorn;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
func void Use_Alarmhorn()
{
	
};

*/
//*******************************
//Päckchen
//*******************************
INSTANCE ItMi_Packet(C_Item)
{
	name 				=	"Päckchen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//in dieser Funktio steht der inhalt, die use Funkt dann bitte einkommentiren.
FUNC VOID UsePacket ()
{
	
};

INSTANCE ItMi_Pocket(C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI;
	flags 				=	0;

	value 				=	10;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePocket;
	description			= 	name;
	TEXT[2]				= 	"Ein schmaler Beutel,";
	TEXT[3]				=   "wiegt nicht viel";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//in dieser Funktio steht der inhalt, die use Funkt dann bitte einkommentiren.
FUNC VOID UsePocket ()
{
		CreateInvItems (hero, ItMi_Gold ,10);
		Print 	(PRINT_FoundGold10);
		Snd_Play ("Geldbeutel");
};

//******************************************************************************************
//	Wertvolle Gegenstände
//******************************************************************************************
INSTANCE ItMi_Nugget(C_Item)
{
	name 				=	"Erzbrocken";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_Nugget.3ds";
	material 			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_MANAPOTION";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			=	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
	
};



/******************************************************************************************/
INSTANCE ItMi_Gold (C_Item)
{
	name 				=	"Gold";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Gold;

	visual 				=	"ItMi_Gold.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
};

/******************************************************************************************/
INSTANCE ItMi_OldCoin (C_Item)
{
	name 				=	"Alte Münze";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_OldCoin.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;

};

/******************************************************************************************/
INSTANCE ItMi_GoldCandleHolder (C_Item)
{
	name 				=	"Goldener Kerzenständer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldCandleHolder;

	visual 				=	"ItMi_GoldCandleHolder.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};



/******************************************************************************************/
INSTANCE ItMi_GoldNecklace (C_Item)
{
	name 				=	"Goldene Halskette";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI | ITEM_AMULET;

	value 				=	Value_GoldNecklace;

	visual 				=	"ItMi_GoldNecklace.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;

};


/******************************************************************************************/

INSTANCE ItMi_SilverRing (C_Item)
{
	name 				=	"Silberner Ring";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_RING;

	value 				=	Value_SilverRing;

	visual 				=	"ItMi_SilverRing.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
};

/******************************************************************************************/
INSTANCE ItMi_SilverCup (C_Item)
{
	name 				=	"Silberkelch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverCup;

	visual 				=	"ItMi_SilverCup.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_SilverPlate (C_Item)
{
	name 				=	"Silberteller";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverPlate;

	visual 				=	"ItMi_SilverPlate.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
instance ItMi_GoldPlate (C_Item)
{
	name 				=	"Goldener Teller";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldPlate;

	visual 				=	"ItMi_GoldPlate.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_GoldCup (C_Item)
{
	name 				=	"Goldener Kelch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldCup;

	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_BloodCup_MIS (C_Item)
{
	name 				=	"Blutkelch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI | ITEM_MISSION;

	value 				=	Value_BloodCup;

	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;

	description			= 	"Ein Blutkelch";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_GoldRing (C_Item)
{
	name 				=	"Goldener Ring";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_RING;

	value 				=	Value_GoldRing;

	visual 				=	"ItMi_GoldRing.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
		
};
/******************************************************************************************/
INSTANCE ItMi_SilverChalice (C_Item)
{
	name 				=	"Silberne Schale";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverChalice;

	visual 				=	"ItMi_SilverChalice.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_JeweleryChest (C_Item)
{
	name 				=	"Juwelen Schatulle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_JeweleryChest;

	visual 				=	"ItMi_JeweleryChest.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_GoldChalice (C_Item)
{
	name 				=	"Goldene Schale";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldChalice;

	visual 				=	"ItMi_GoldChalice.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_GoldChest (C_Item)
{
	name 				=	"Schatulle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldChest;

	visual 				=	"ItMi_GoldChest.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_InnosStatue (C_Item)
{
	name 				=	"Innos Statue";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_InnosStatue;

	visual 				=	"ItMi_InnosStatue.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Sextant (C_Item)
{
	name 				=	"Sextant";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sextant;

	visual 				=	"ItMi_Sextant.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_SilverCandleHolder (C_Item)
{
	name 				=	"Silberner Kerzenständer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverCandleHolder;

	visual 				=	"ItMi_SilverCandleHolder.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_SilverNecklace (C_Item)
{
	name 				=	"Silberkette";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI| ITEM_AMULET;

	value 				=	Value_SilverNecklace;

	visual 				=	"ItMi_SilverNecklace.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
//*****************************************************************************************
//	Alchemy Ingredienzien
//*****************************************************************************************
INSTANCE ItMi_Sulfur (C_Item)
{
	name 				=	"Schwefel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sulfur;

	visual 				=	"ItMi_Sulfur.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
};


INSTANCE ItMi_Quartz (C_Item)
{
	name 				=	"Gletscher Quartz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Quartz;

	visual 				=	"ItMi_Quartz.3ds";
	material 			=	MAT_STONE ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
};

INSTANCE ItMi_Pitch (C_Item)
{
	name 				=	"Pech";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pitch;

	visual 				=	"ItMi_Pitch.3DS";
	material 			=	MAT_GLAS ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


INSTANCE ItMi_Rockcrystal (C_Item)
{
	name 				=	"Bergkristall";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Rockcrystal;

	visual 				=	"ItMi_Rockcrystal.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


INSTANCE ItMi_Aquamarine (C_Item)
{
	name 				=	"Aquamarin";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"ItMi_Aquamarine.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};


INSTANCE ItMi_HolyWater (C_Item)
{
	name 				=	"Geweihtes Wasser";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HolyWater;

	visual 				=	"ItMi_HolyWater.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


INSTANCE ItMi_Coal (C_Item)
{
	name 				=	"Kohle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Coal;

	visual 				=	"ItMi_Coal.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};


INSTANCE ItMi_DarkPearl (C_Item)
{
	name 				=	"Schwarze Perle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DarkPearl;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
//-------------------------------------------------------------
//					Tabak Sorten 
//		 Apfeltabak (Basis für alle anderen)
//-------------------------------------------------------------
INSTANCE ItMi_ApfelTabak(C_Item)
{
	name 				=	"Apfel Tabak";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_ApfelTabak; 

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER ;
	
	description			= 	name;
	
	TEXT[2]				=  "Ein Beutel voll Apfeltabak";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------------
//			Pilztabak
//-------------------------------------------------------------
INSTANCE ItMi_PilzTabak(C_Item)
{
	name 				=	"Pilz Tabak";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_PilzTabak;

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[2]				=  "Dunkler Apfel - Pilz Tabak";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------------
//			Doppel Apfel 
//-------------------------------------------------------------
INSTANCE ItMi_DoppelTabak(C_Item)
{
	name 				=	"Doppelter Apfel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_DoppelTabak;

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[2]				=  "Schmeckt stark nach Apfel...";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------------
//			Honigtabak
//-------------------------------------------------------------
INSTANCE ItMi_Honigtabak(C_Item)
{
	name 				=	"Honig Tabak";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_Honigtabak;

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[2]				=  "Süßer Apfel Tabak";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------------
//		SumpfKraut Tabak
//-------------------------------------------------------------
INSTANCE ItMi_SumpfTabak(C_Item)
{
	name 				=	"Krautabak";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_SumpfTabak;

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[2]				=  "Sumpfkraut Mischung";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
