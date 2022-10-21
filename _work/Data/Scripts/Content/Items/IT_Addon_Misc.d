//---------------------------------------------------------------------
//	Item Werte
//---------------------------------------------------------------------
const int 	Value_Goldnugget 			=  18;
const int	Value_WhitePearl			= 120;	
const int	Value_Addon_Joint_01		=  60;	
//---------------------------------------------------------------------
//	Goldbrocken
//---------------------------------------------------------------------
INSTANCE ItMi_GoldNugget_Addon(C_Item)
{
	name 		=	"Goldbrocken";

	mainflag 	=	ITEM_KAT_NONE;
	flags 		=	ITEM_MULTI;

	value 		=	Value_Goldnugget;

	visual 		=	"ItMi_GoldNugget_01.3ds";
	material 	=	MAT_STONE;

	description	= 	name;
	
	TEXT[5]		= 	NAME_Value;	
	COUNT[5]	=	value;
	
	INV_ZBIAS	= INVCAM_ENTF_MISC2_STANDARD;
	
};
//---------------------------------------------------------------------
//	Weiße Perle
//---------------------------------------------------------------------
INSTANCE ItMi_Addon_WhitePearl (C_Item)
{
	name 				=	"Perle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WhitePearl;

	visual 				=	"ItMi_WhitePearl_01.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS			= INVCAM_ENTF_MISC_STANDARD;
};
//---------------------------------------------------------------------
//	Grüner Novize
//---------------------------------------------------------------------
INSTANCE ItMi_Addon_Joint_01(C_Item)
{
	name 				=	"Grüner Novize";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Addon_Joint_01;

	visual 				=	"ItMi_Joint_US.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"JOINT";
	on_state[0]			= 	Use_Addon_Joint_01;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};
var int FirstJoint;
func void Use_Addon_Joint_01()
{
	if (Npc_IsPlayer (self))
	{
		if (FirstJoint == FALSE)
		{
			FirstJoint = TRUE;
			B_GivePlayerXP (5); 
		};
		Wld_PlayEffect ("SLOW_TIME", self, self, 0, 0, 0, FALSE);
	};
};

//****************************************************************************
//				Baltrams Lieferung von Akil
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_BaltramPaket(C_Item)
{
	name 				=	"Baltram's Lieferung";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Ein schweres Paket";
	TEXT[3]				=	"voller guter Sachen";
	TEXT[4]				=	"vom Bauern Akil";
	
};

//****************************************************************************
//				Baltrams Lieferung für Skip
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_Packet_Baltram4Skip_Addon (C_Item)
{
	name 				=	"Paket für Skip";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Dieses schwere Paket";
	TEXT[3]				=	"voller guter Sachen";
	TEXT[4]				=	"ist für den Piraten Skip bestimmt";
	
};
/******************************************************************************************/
INSTANCE ItMi_BromorsGeld_Addon (C_Item)
{
	name 				=	"Bromors Goldene Schale";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_GoldChalice.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[2]				= 	"Der Name 'Bromor' ist mit";
	TEXT[3]				=	"einem scharfen Gegenstand in den";
	TEXT[4]				=	"Boden der Schale geritzt worden.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItSe_ADDON_CavalornsBeutel	(C_Item)
{
	name 				=	"Cavalorns Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_CavalornsBeutel;
	
	description			= 	name;
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"Am Bund hängt ein Schild";
	TEXT[2]				= 	"mit dem Namen 'Cavalorn'";
	TEXT[3]				= 	"1 Brocken Erz befinden sich darin";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_CavalornsBeutel ()
{
		CreateInvItems (hero, ItMi_Nugget ,1);
		Print (PRINT_FoundOreNugget);
		SC_OpenedCavalornsBeutel = TRUE;
		Log_CreateTopic (TOPIC_Addon_CavalornTheHut, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_CavalornTheHut,"Bei Cavalorns Hütte im Minental habe ich einen Beutel mit einem Erzbrocken gefunden. Cavalorn, der alte Gauner, hat ihn hier bestimmt vergessen.");
};

//**************************************
//		Diverser Kleinkram
//**************************************
instance ItMi_Skull(C_Item)
{
	name 				=	"Schädel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	10;

	visual 				=	"DT_SKELETON_V01_HEAD.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
};

















//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// 				INEXTREMO ITEMS
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------


INSTANCE ItMi_IECello(C_Item)
{
	name 				=	"Cello";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Cello.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"CELLO";
	on_state[0]			= 	Use_Cello;
		
	description			= 	name;
};

func void Use_Cello()
{
	
};

INSTANCE ItMi_IECelloBow(C_Item)
{
	name 				=	"CelloBow";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_CelloBow.3ds";
	
	material 			=	MAT_WOOD;
	
	description			= 	name;
};

INSTANCE ItMi_IEDrum(C_Item)
{
	name 				=	"Drum";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Drum.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"PAUKE";
	on_state[0]			= 	Use_Drum;
	
	description			= 	name;
};

func void Use_Drum()
{
	
};

INSTANCE ItMi_IEDrumScheit(C_Item)
{
	name 				=	"Drumscheit";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Drumscheit.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"DRUMSCHEIT";
	on_state[0]			= 	Use_Drumscheit;
	
	description			= 	name;
};

func void Use_Drumscheit()
{
	
};

INSTANCE ItMi_IEDrumStick(C_Item)
{
	name 				=	"DrumStick";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_DrumStick.3ds";
	
	material 			=	MAT_WOOD;
	
	description			= 	name;
};

INSTANCE ItMi_IEDudelBlau(C_Item)
{
	name 				=	"Blauer Dudelsack";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_DudelBlau.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"DUDEL";
	on_state[0]			= 	Use_Dudel;
	
	description			= 	name;
};

func void Use_Dudel()
{
	
};

INSTANCE ItMi_IEDudelGelb(C_Item)
{
	name 				=	"Gelber Dudelsack";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_DudelGelb.3ds";
	
	material 			=	MAT_WOOD;
	
	scemeName			=	"DUDEL";
	on_state[0]			= 	Use_Dudel;

	
	description			= 	name;
};



INSTANCE ItMi_IEHarfe(C_Item)
{
	name 				=	"Harfe";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Harfe.3ds";
	
	material 			=	MAT_WOOD;

	scemeName			=	"HARFE";
	on_state[0]			= 	Use_Harfe;

	
	description			= 	name;
};

func void Use_Harfe()
{
	
};

INSTANCE ItMi_IELaute(C_Item)
{
	name 				=	"Laute";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_Laute.3ds";
	
	material 			=	MAT_WOOD;

	scemeName			=	"IELAUTE";
	on_state[0]			= 	Use_Laute;

	description			= 	name;
};

func void Use_Laute()
{
};
//****************************************************************************
//				Lennar'S Dietrich Paket
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_Addon_Lennar_Paket(C_Item)
{
	name 				=	"Klimperndes Paket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	300;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	on_state[0]			=   Use_LennarPaket;
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Da sind Dietriche drin";
	TEXT[3]				=	"";
	TEXT[4]				=	"Viele Dietriche";
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	value;
};
FUNC VOID Use_LennarPaket()
{
	B_PlayerFindItem (ItKE_lockpick,Lennar_picklock_amount);
	Snd_Play ("Geldbeutel");
	
	LennarPaket_Open = TRUE;
};
	
instance ItMi_Zeitspalt_Addon(C_Item)
{
	name 				=	"Schwarzes Erz";

	mainflag 			=	ITEM_KAT_POTIONS;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Zeitspalt_Addon.3DS";
	scemename			=	"MAPSEALED";	
	on_state[0]			=   Use_Zeitspalt_Addon;
	material 			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	name;
	TEXT[3]				= 	"Wirkung unbekannt";				

	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
};
	func void Use_Zeitspalt_Addon()
	{
		if (Npc_IsPlayer(self))
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",  self, self, 0, 0, 0, FALSE);

			// FIXME_Nico: DropUnconscious (DropDead funktioniert bereits)
			//Npc_ChangeAttribute(self, ATR_MANA, -self.attribute[ATR_MANA]);
			//Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS] + 2);
			// Bereits laufenden Effekt beenden, damit die Kamera nicht ausrastet...
			// (beim Wechsel immer noch starker Morph-Effekt, aber nicht mehr andauernd)
			Wld_StopEffect("SLOW_MOTION");
			Wld_PlayEffect("SLOW_MOTION", self, self, 0, 0, 0, FALSE);
		};
	};
