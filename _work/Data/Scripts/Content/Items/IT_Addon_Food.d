/******************************************************************************************/
//	RUM																	//
/******************************************************************************************/

CONST int Value_Rum = 30;
CONST int Mana_Rum  = 10;

const int Value_Grog = 10;
const int HP_Grog	 = 1;

const int Value_SchnellerHering	= 30;	

const int Value_LousHammer = 30;
const int Mana_LousHammer = 1;

const int Value_SchlafHammer = 60;

const int Value_FireStew = 180;
const int STR_FireStew	= 1;
const int HP_FireStew	= 5;
const int STR_MeatSoup	= 1;

const int Value_Shellflesh	= 60;
const int HP_Shellflesh		= 20;
//---------------------------------------------------------------------
//	Muschelfleisch
//---------------------------------------------------------------------
INSTANCE ItFo_Addon_Shellflesh (C_Item)
{
	name 				=	"Carne di mollusco";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Shellflesh;

	visual 				=	"ItAt_Meatbugflesh.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Shellflesh;

	description			= 	name;
	TEXT[0]				= 	"Succosa carne di mollusco";
	TEXT[1]				= 	NAME_Bonus_HP; COUNT[1] = HP_Shellflesh;
	TEXT[2]				= 	"Può essere mangiata cruda";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

	FUNC VOID Use_Shellflesh()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS, HP_Shellflesh);
	};

//-----------------------------
INSTANCE ItFo_Addon_Rum(C_Item)
{
	name 			=	"Rum";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Rum;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseRum;
	scemeName		=	"POTIONFAST";

	description		= 	"Rum bianco";
	
	TEXT[1]			= 	NAME_Bonus_Mana;				
	COUNT[1]		= 	Mana_Rum;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Rum;

};

	FUNC VOID UseRum()
	{
		Npc_ChangeAttribute	(self,	ATR_MANA, Mana_Rum);
	};

//#############################################
//			Grog
//#############################################
	
INSTANCE ItFo_Addon_Grog(C_Item)
{
	name 			=	"Grog";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Grog;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseGrog;
	scemeName		=	"POTIONFAST";

	description		= 	"Autentico grog del marinaio";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Grog;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Grog;

};

	FUNC VOID UseGrog()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS, HP_Grog);
	};	
//-----------------------------
//	Lou's Hammer (mit Manaessenz)
//-----------------------------

var int Hammer_Once;	//damit der Magier sich nicht für 30 Gold superviel MANA kauft!!

INSTANCE ItFo_Addon_LousHammer (C_Item)
{
	name 			=	"Martello di Lou";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_LousHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLouHammer;
	scemeName		=	"POTIONFAST";

	description		= 	"Martello di Lou";
	
	TEXT[1]			= 	"Effetto         ???";				
	
	
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_LousHammer;

};

	FUNC VOID UseLouHammer()
	{
		if Hammer_Once == FALSE
		{
			B_RaiseAttribute (self,	ATR_MANA_MAX, Mana_LousHammer);
			Hammer_Once = TRUE;
		};	
	};
//-------------------------------------------------------
//	Lou's doppelter Hammer (Schlafhammer)
//--------------------------------------------------------
INSTANCE ItFo_Addon_SchlafHammer (C_Item)
{
	name 			=	"Martello doppio";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_SchlafHammer;	

	visual 			=	"ItMi_Rum_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseSchlafHammer;
	scemeName		=	"POTIONFAST";

	description		= 	"Martello doppio";
	
	TEXT[1]			= 	"Rende sonnolento il bevitore più accanito…";				

	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_SchlafHammer;

};

	FUNC VOID UseSchlafHammer()
	{
		if (self.attribute[ATR_HITPOINTS] > 2)
		{
			self.attribute[ATR_HITPOINTS] = (self.attribute[ATR_HITPOINTS]/2);
		};
	};
	
	
//#############################################
//			Schneller Hering
//#############################################
	
INSTANCE ItFo_Addon_SchnellerHering(C_Item)
{
	name 			=	"Aringa furiosa";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Schnellerhering;	

	visual 			=	"ItMi_Rum_01.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseSchnellerHering;
	scemeName		=	"POTIONFAST";

	description		= 	"Ha un aspetto pericoloso!";
	
	TEXT[1]			= 	"Effetto sconosciuto.";				
	TEXT[2]			=	"Probabili effetti collaterali";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_SchnellerHering;

};

	FUNC VOID UseSchnellerHering()
	{
		var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
		if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
		{
			//AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
			//AI_Wait (self ,2);
			//AI_PlayAni (self, "T_HEASHOOT_2_STAND");
			//Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  self, self, 0, 0, 0, FALSE );
			Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", 120000);		//2min
		};	
		Player_KnowsSchnellerHering = TRUE;
	};	
//-------------------------------------------------------
//------------- Pfeffer  -----------------------
//-------------------------------------------------------
INSTANCE ItFo_Addon_Pfeffer_01	(C_Item)
{
	name 				=	"Sacchetto di pepe";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";

	material 			=	MAT_LEATHER;
		
	description			= 	"Pepe rosso irritante";
	
	TEXT[0]				= 	"Dalle isole del Sud";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"ATTENZIONE, PICCANTE!";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------
// Feuergeschnetzeltes mit hammer schnaps
//-------------------------------------------------------
INSTANCE ItFo_Addon_FireStew (C_Item)
{	
	name 				=	"Strisce di fuoco";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FireStew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_FireStew;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_Str;		COUNT[1]	= STR_FireStew;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_FireStew;

};

	FUNC VOID Use_FireStew()
	{
		B_RaiseAttribute 	(self,	ATR_STRENGTH,	STR_FireStew);
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS_MAX,	HP_FireStew);
		
		PrintScreen ("Forza ed energia vitale sono aumentate!", -1, 34, FONT_ScreenSmall,2); 
	};
//-------------------------------------------------------
// Fleischsuppe
//-------------------------------------------------------
INSTANCE ItFo_Addon_Meatsoup (C_Item)
{	
	name 				=	"Stufato di carne";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_FishSoup;
	
	visual 				=	"ItFo_FishSoup.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_MeatSoup;

	description			= 	"Stufato di carne fumante";
	TEXT[1]				= 	NAME_Bonus_STR;		COUNT[1]	= STR_MeatSoup;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_FishSoup;

};

	FUNC VOID Use_MeatSoup()
	{
		var string ConcatText;
		ConcatText = ConcatStrings (NAME_Bonus_Str, IntToString (STR_MeatSoup));
		
		B_RaiseAttribute (self,	ATR_STRENGTH, STR_MeatSoup);
		PrintScreen (ConcatText, -1, 34, FONT_ScreenSmall,2); 
	};
	
	
	
	
