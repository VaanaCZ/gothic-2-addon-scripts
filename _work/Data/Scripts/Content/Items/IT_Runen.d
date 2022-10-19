// Runen
// Paladin Runen 	

//********************************************************************************************
//Joly: Macht die Runen nicht zu teuer, es sind Produktionsitems -> EXPLOID!!!!!!!!!!!
//********************************************************************************************

const 	string 	Name_PaladinSpell		=	"Czar Paladyna"; 	
const	int	Value_Ru_PalLight			=	500;	
const	int	Value_Ru_PalLightHeal		=	500;
const	int	Value_Ru_PalHolyBolt		=	500;
const	int	Value_Ru_PalMediumHeal		=	2000;
const	int	Value_Ru_PalRepelEvil		=	2000;
const	int	Value_Ru_PalFullHeal		=	3000;
const	int	Value_Ru_PalDestroyEvil		=	3000;

//********************************************************************************************
//Joly: Macht die Runen nicht zu teuer, es sind Produktionsitems -> EXPLOID!!!!!!!!!!!
//********************************************************************************************

// Kreis 1
const	int	Value_Ru_Light				=	500;// Lehrer Parlan
const	int	Value_Ru_Firebolt			=	500;// Lehrer Hyglas 
const	int	Value_Ru_Zap				=	500;// Lehrer Marduk
const	int	Value_Ru_LightHeal			=	500;// Lehrer Parlan
const	int	Value_Ru_SumGobSkel			=	500;// Lehrer Karras
// Kreis 2	
const	int	Value_Ru_InstantFireball	=	1000;// Lehrer Hyglas
const	int	Value_Ru_Icebolt			=	1000;// Lehrer Marduk
const	int	Value_Ru_SumWolf			=	1000;// Lehrer Karras
const	int	Value_Ru_Windfist			=	1000;
const	int	Value_Ru_Sleep				=	1000;
// Kreis 3
const	int	Value_Ru_MediumHeal			=	1500;// Lehrer Parlan
const	int	Value_Ru_SumSkel			=	1500;// Lehrer Karras
const	int	Value_Ru_Fear				=	1500;
const	int	Value_Ru_IceCube			=	1500;// Lehrer Marduk
const	int	Value_Ru_ThunderBall		=	1500;// Lehrer Marduk
const	int	Value_Ru_Firestorm			=	1500;// Lehrer Hyglas
// Kreis 4
const	int	Value_Ru_SumGol				=	2000;// Lehrer Karras
const	int	Value_Ru_HarmUndead			=	2000;
const	int	Value_Ru_LightningFlash		=	2000;// Lehrer Marduk
const	int	Value_Ru_ChargeFireball		=	2000;// Lehrer Hyglas 
// Kreis 5
const	int	Value_Ru_IceWave			=	2500;// Lehrer Marduk
const	int	Value_Ru_SumDemon			=	2500;// Lehrer Karras
const	int	Value_Ru_FullHeal			=	2500;// Lehrer Parlan
const	int	Value_Ru_Pyrokinesis		=	2500;// Lehrer Hyglas
// Kreis 6 		
const	int	Value_Ru_Firerain			=	3000;// Lehrer Hyglas
const	int	Value_Ru_BreathOfDeath		=	3000;
const	int	Value_Ru_MassDeath			=	3000;
const	int	Value_Ru_MasterOfDisaster	=	3000;
const	int	Value_Ru_ArmyOfDarkness		=	3000;// Lehrer Karras
const	int	Value_Ru_Shrink				=	3000;

//TeleportRunen
const int	Value_Ru_PalTeleportSecret		=	500;
const int	Value_Ru_TeleportSeaport		=	500;
const int	Value_Ru_TeleportMonastery		=	500;
const int	Value_Ru_TeleportFarm			=	500;
const int	Value_Ru_TeleportXardas			=	500;
const int	Value_Ru_TeleportPassNW			=	500;
const int	Value_Ru_TeleportPassOW			=	500;
const int	Value_Ru_TeleportOC				=	500;
const int	Value_Ru_TeleportOWDemonTower	=	500;
const int	Value_Ru_TeleportTaverne		=	500;
const int	Value_Ru_Teleport_3				=	500;

/*******************************************************************************************/
INSTANCE ItRu_PalLight (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalLight;

	visual				=	"ItRu_PalLight.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PalLight;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalLight;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalLight;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_PalLIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
}; 
/*******************************************************************************************/
INSTANCE ItRu_PalLightHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalLightHeal;

	visual				=	"ItRu_PalLightHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PalLightHeal;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalLightHeal;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalLightHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_PalLightHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalMediumHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalMediumHeal;

	visual				=	"ItRu_PalMediumHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PalMediumHeal;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalMediumHeal;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalMediumHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_PalMediumHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalFullHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalFullHeal;

	visual				=	"ItRu_PalFullHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PalFullHeal;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalFullHeal;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalFullHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_PalFullHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalHolyBolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalHolyBolt;

	visual				=	"ItRu_PalHolyBolt.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_PalHolyBolt;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalHolyBolt;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalHolyBolt;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_Damage_PalHolyBolt;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItRu_PalRepelEvil (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalRepelEvil;

	visual				=	"ItRu_PalRepelEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_PalRepelEvil;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalRepelEvil;

	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_PalRepelEvil;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_Damage_PalRepelEvil;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalDestroyEvil (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalDestroyEvil;

	visual				=	"ItRu_PalDestroyEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_PalDestroyEvil;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalDestroyEvil;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_PalDestroyEvil;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_Damage_PalDestroyEvil;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalTeleportSecret (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_PalTeleportSecret;
	
	visual				=	"ItRu_PalTeleportSecret.3DS";	
	material			=	MAT_STONE;

	spell				= 	SPL_PalTeleportSecret;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_PalTeleportSecret;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportSeaport (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportSeaport;
	
	visual				=	"ItRu_TeleportSeaport.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportSeaport;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportSeaport;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportMonastery (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportMonastery;

	
	visual				=	"ItRu_TeleportMonastery.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportMonastery;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportMonastery;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportFarm (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportFarm.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportFarm;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportFarm;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportXardas (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportXardas;
	
	visual				=	"ItRu_TeleportXardas.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportXardas;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportXardas;
	

	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportPassNW (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportPassNW;
	
	visual				=	"ItRu_TeleportPassNW.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportPassNW;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportPassNW;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportPassOW (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportPassOW;
	
	visual				=	"ItRu_TeleportPassOW.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportPassOW;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportPassOW;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportOC (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportOC;
	
	visual				=	"ItRu_TeleportOC.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportOC;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportOC;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/

INSTANCE ItRu_TeleportOWDemonTower (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_TeleportOWDemonTower;
	
	visual				=	"ItRu_Teleport_2.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportOWDemonTower;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportOWDemonTower;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_TeleportTaverne (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_TeleportTaverne;
	
	visual				=	"ItRu_Teleport_2.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportTaverne;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportTaverne;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Teleport_3 (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_Teleport_3;
	
	visual				=	"ItRu_Teleport_3.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_Teleport_3;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_Teleport_3;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
// Kreis 1
INSTANCE ItRu_Light (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Light;

	visual				=	"ItRu_Light.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_LIGHT;
	mag_circle			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LIGHT;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_COST_LIGHT;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
}; 
/*******************************************************************************************/
INSTANCE ItRu_FireBolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Firebolt;

	visual				=	"ItRu_FireBolt.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBOLT;
	mag_circle			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Firebolt;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
			
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_COST_FIREBOLT;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_DAMAGE_FIREBOLT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Zap (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Zap;

	visual				=	"ItRu_Zap.3DS";
	material			=	MAT_STONE;
	
	mag_circle			=	1;
	spell				= 	SPL_Zap;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Zap;
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Zap;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_DAMAGE_ZAP;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_LightHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_LightHeal;

	visual				=	"ItRu_LightHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_LightHeal;
	mag_circle			= 	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LightHeal;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_LightHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_LightHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_SumGobSkel (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumGobSkel;

	visual				=	"ItRu_SumGobSkel.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonGoblinSkeleton;
	mag_circle			= 	1;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGoblinSkeleton;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonGoblinSkeleton;
	
	TEXT 	[2]			=   "Niespokojne koœci";
	TEXT 	[3]			=   "martwych goblinów.";
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
// Kreis 2	
INSTANCE ItRu_InstantFireball (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_InstantFireball;

	visual				=	"ItRu_InstantFireball.3DS";
	material			=	MAT_STONE;
	
	mag_circle			= 	2;
	spell				= 	SPL_InstantFireball;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_InstantFireball;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;							
	COUNT	[1]			=	SPL_COST_InstantFireball;
	
	TEXT	[2]			=	NAME_Dam_Magic;	
	COUNT	[2]			=	SPL_DAMAGE_InstantFireball;
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Icebolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Icebolt;

	visual				=	"ItRu_Icebolt.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_Icebolt;
	mag_circle 			=	2;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Icebolt;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Icebolt;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Icebolt;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_SumWolf (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumWolf;

	visual				=	"ItRu_SumWolf.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonWolf;
	mag_circle			= 	2;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonWolf;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonWolf;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Windfist (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Windfist;

	visual				=	"ItRu_Windfist.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_WINDFIST;
	mag_circle 			=	2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_WINDFIST;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;						
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_WindFist;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_WINDFIST;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_Damage_Windfist;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_Damage_Windfist*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_Sleep (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Sleep;

	visual				=	"ItRu_Sleep.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_SLEEP;
	mag_circle 			=	2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Sleep;
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SLEEP;
	
	TEXT	[2]			=	NAME_SEC_Duration;			
	COUNT	[2]			=	SPL_TIME_Sleep;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
// Kreis 3
INSTANCE ItRu_MediumHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_MediumHeal;

	visual				=	"ItRu_MediumHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_MediumHeal;
	mag_circle			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_MediumHeal;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_MediumHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_MediumHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_LightningFlash (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_LightningFlash;

	visual				=	"ItRu_LightningFlash.3DS";
	material			=	MAT_STONE;
	
	mag_circle			=	4;
	spell				= 	SPL_LightningFlash;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	
	description			=	NAME_SPL_LightningFlash;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_LightningFlash;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_Damage_LightningFlash;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
INSTANCE ItRu_ChargeFireball (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_ChargeFireball;

	visual				=	"ItRu_ChargeFireball.3DS";
	material			=	MAT_STONE;
	
	mag_circle			= 	4;
	
	spell				= 	SPL_ChargeFireball;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";
	
	description			= 	NAME_SPL_ChargeFireball;
	
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;						
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_ChargeFireball;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_ChargeFireball;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_Damage_ChargeFireball;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_Damage_ChargeFireball*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
INSTANCE ItRu_SumSkel (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumSkel;

	visual				=	"ItRu_SumSkel.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONSKELETON;
	mag_circle			= 	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonSkeleton;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SUMMONSKELETON;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
INSTANCE ItRu_Fear (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Fear;

	visual				=	"ItRu_Fear.3DS";
	material			=	MAT_STONE;
	mag_circle			= 	3;
	
	spell				= 	SPL_FEAR;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	
	description			=	NAME_SPL_Fear;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_FEAR;
	
	TEXT	[2]			=	NAME_Sec_Duration;				
	COUNT	[2]			=	SPL_TIME_Fear;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
INSTANCE ItRu_IceCube (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_IceCube;

	visual				=	"ItRu_IceCube.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ICECUBE;
	mag_circle 			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceCube;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_ICECUBE;
	
	TEXT	[2]			=	NAME_Damage;				
	COUNT	[2]			=	60;
	
	TEXT	[3]			=	NAME_Sec_Duration;				
	COUNT	[3]			=	SPL_TIME_FREEZE;
	
	TEXT	[4]			=	NAME_DamagePerSec;				
	COUNT	[4]			=	SPL_FREEZE_DAMAGE;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
// Kreis 4
INSTANCE ItRu_ThunderBall (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_ThunderBall;

	visual				=	"ItRu_ThunderBall.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ChargeZap;
	mag_circle 			=	3;		

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_ChargeZap;
	
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;						
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_ChargeZap;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_ChargeZap;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_Damage_ChargeZap;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_Damage_ChargeZap*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};

/*******************************************************************************************/	
INSTANCE ItRu_SumGol (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumGol;

	visual				=	"ItRu_SumGol.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonGolem;
	mag_circle			= 	4;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGolem;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonGolem;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_HarmUndead (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_HarmUndead;

	visual				=	"ItRu_HarmUndead.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_DESTROYUNDEAD;
	mag_circle			= 	4;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_DestroyUndead;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_DESTROYUNDEAD;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_DESTROYUNDEAD;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Pyrokinesis (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Pyrokinesis;

	visual				=	"ItRu_Pyrokinesis.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PYROKINESIS;
	mag_circle 			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Pyrokinesis;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;						
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_Firestorm;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_Firestorm;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_Damage_Firestorm;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_Damage_Firestorm*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
// Kreis 5
INSTANCE ItRu_Firestorm (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Firestorm;

	visual				=	"ItRu_Firestorm.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRESTORM;
	mag_circle 			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_Firestorm;
	
	TEXT	[0]			=	NAME_Mag_Circle;							
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;							
	COUNT	[1]			=	SPL_COST_INSTANTFIRESTORM;
	
	TEXT	[2]			=	NAME_Dam_Magic;	
	COUNT	[2]			=	SPL_DAMAGE_INSTANTFIRESTORM;
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_IceWave (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_IceWave;

	visual				=	"ItRu_IceWave.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ICEWAVE;
	mag_circle 			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceWave;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_IceWave;
	
	TEXT	[2]			=	NAME_Damage;				
	COUNT	[2]			=	60;
	
	TEXT	[3]			=	NAME_Sec_Duration;				
	COUNT	[3]			=	SPL_TIME_FREEZE;
	
	TEXT	[4]			=	NAME_DamagePerSec;				
	COUNT	[4]			=	SPL_FREEZE_DAMAGE;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_SumDemon (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumDemon;

	visual				=	"ItRu_SumDemon.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONDEMON;
	mag_circle			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonDemon;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SUMMONDEMON;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_FullHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_FullHeal;

	visual				=	"ItRu_FullHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FullHeal;
	mag_circle			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_FullHeal;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;	
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_FullHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_FullHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
// Kreis 6
INSTANCE ItRu_Firerain (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Firerain;

	visual				=	"ItRu_Firerain.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRERAIN;
	mag_circle 			= 	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Firerain;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_FIRERAIN;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_FIRERAIN;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_BreathOfDeath (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_BreathOfDeath;

	visual				=	"ItRu_BreathOfDeath.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_BREATHOFDEATH;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_BreathOfDeath;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_BREATHOFDEATH;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_BREATHOFDEATH;
		
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItRu_MassDeath (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Ru_MassDeath;

	visual				=	"ItRu_MassDeath.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_MASSDEATH;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_MassDeath;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;

	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_MASSDEATH;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_MASSDEATH;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItRu_MasterOfDisaster	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_MasterOfDisaster;

	visual				=	"ItRu_MasterOfDesaster.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_MasterOfDisaster;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_MasterOfDisaster;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_MasterOfDisaster;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_MasterOfDisaster;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_ArmyOfDarkness (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_ArmyofDarkness;

	visual				=	"ItRu_ArmyOfDarkness.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_ARMYOFDARKNESS;
	mag_circle			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_ArmyOfDarkness;
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_ARMYOFDARKNESS;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Shrink (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Shrink;

	visual				=	"ItRu_Shrink.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SHRINK;
	mag_circle			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Shrink;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SHRINK;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

//#########################
//NPC Spell
//#########################

INSTANCE ItRu_Deathbolt	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	0;

	visual				=	"ItRu_PalRepelEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Deathbolt;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Pocisk œmierci";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Deathbolt;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Deathbolt;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_Deathball	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	0;

	visual				=	"ItRu_PalRepelEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Deathball;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Œmiertelna kula";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Deathball;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Deathball;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_Concussionbolt	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	0;

	visual				=	"ItRu_PalRepelEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Concussionbolt;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Pocisk nieprzytomnoœci";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Concussionbolt;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Concussionbolt;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};



























