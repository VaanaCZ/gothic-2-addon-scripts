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
	name 		=	"Золотой самородок";

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
//	WeiЯe Perle
//---------------------------------------------------------------------
INSTANCE ItMi_Addon_WhitePearl (C_Item)
{
	name 				=	"Жемчужина";

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
//	Grьner Novize
//---------------------------------------------------------------------
INSTANCE ItMi_Addon_Joint_01(C_Item)
{
	name 				=	"Зеленый послушник";

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
	name 				=	"Пакет для Бальтрама";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Тяжелый пакет с";
	TEXT[3]				=	"различными товарами";
	TEXT[4]				=	"с фермы Акила";
	
};

//****************************************************************************
//				Baltrams Lieferung fьr Skip
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_Packet_Baltram4Skip_Addon (C_Item)
{
	name 				=	"Пакет для Скипа";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	200;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Тяжелый пакет";
	TEXT[3]				=	"с различными товарами";
	TEXT[4]				=	"для пирата Скипа";
	
};
/******************************************************************************************/
INSTANCE ItMi_BromorsGeld_Addon (C_Item)
{
	name 				=	"Золотая чаша Бромора";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_GoldChalice.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[2]				= 	"На дне этой чаши ";
	TEXT[3]				=	"острым предметом нацарапано";
	TEXT[4]				=	"имя 'Бромор'.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItSe_ADDON_CavalornsBeutel	(C_Item)
{
	name 				=	"Кожаный мешочек Кавалорна";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_CavalornsBeutel;
	
	description			= 	name;
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"На мешочке прикреплен ярлык";
	TEXT[2]				= 	"с именем 'Кавалорн'";
	TEXT[3]				= 	"Внутри находится 1 кусок руды";
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
		B_LogEntry (TOPIC_Addon_CavalornTheHut,"Я нашел мешочек с куском руды около хижины Кавалорна в Долине рудников. Его, должно быть, забыл там старый пройдоха Кавалорн.");
};

//**************************************
//		Diverser Kleinkram
//**************************************
instance ItMi_Skull(C_Item)
{
	name 				=	"Череп";

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
	name 				=	"Виолончель";

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
	name 				=	"Виолончельный лук";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_CelloBow.3ds";
	
	material 			=	MAT_WOOD;
	
	description			= 	name;
};

INSTANCE ItMi_IEDrum(C_Item)
{
	name 				=	"Барабан";

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
	name 				=	"Тромба марина";

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
	name 				=	"Барабанная палочка";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"Itmi_IE_DrumStick.3ds";
	
	material 			=	MAT_WOOD;
	
	description			= 	name;
};

INSTANCE ItMi_IEDudelBlau(C_Item)
{
	name 				=	"Синяя волынка";

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
	name 				=	"Желтая волынка";

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
	name 				=	"Арфа";

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
	name 				=	"Лютня";

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
	name 				=	"Звенящий пакет";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	300;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	on_state[0]			=   Use_LennarPaket;
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"Внутри находятся отмычки";
	TEXT[3]				=	"";
	TEXT[4]				=	"Много отмычек";
	
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
	name 				=	"Черная руда";

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
	TEXT[3]				= 	"Эффект неизвестен.";				

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
