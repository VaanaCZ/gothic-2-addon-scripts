//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////												//////////////////////////////////////////////
//////////////////////////////////////////////			  Beliars ChaosWaffe				//////////////////////////////////////////////
//////////////////////////////////////////////												//////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////				1 HAND WAFFE					//////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
prototype BeliarWeaponPrototype_1H (C_Item)
{	
	name 				=	NAME_ADDON_BELIARSWEAPON;  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	//value 				=	0;

	//damageTotal  		= 	0;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Orkschlaechter;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	0;
	visual 				=	"ItMw_BeliarWeapon_1H.3DS";

	effect				= 	"SPELLFX_FIRESWORDBLACK";

	description			= name;
	TEXT[2]				= NAME_OneHanded;
	TEXT[3]				= NAME_Damage;					COUNT[3]	= damageTotal;
	TEXT[4] 			= NAME_ADDON_ONEHANDED_BELIAR;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

instance ItMw_BeliarWeapon_1H_01 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_01;
	damageTotal  		= 	Damage_BeliarW_1H_01;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_01; 
};
instance ItMw_BeliarWeapon_1H_02 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_02;
	damageTotal  		= 	Damage_BeliarW_1H_02;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_02;          
};
instance ItMw_BeliarWeapon_1H_03 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_03;
	damageTotal  		= 	Damage_BeliarW_1H_03;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_03;          
};
instance ItMw_BeliarWeapon_1H_04 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_04;
	damageTotal  		= 	Damage_BeliarW_1H_04;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_04;          
};
instance ItMw_BeliarWeapon_1H_05 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_05;
	damageTotal  		= 	Damage_BeliarW_1H_05;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_05;          
};
instance ItMw_BeliarWeapon_1H_06 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_06;
	damageTotal  		= 	Damage_BeliarW_1H_06;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_06;          
};
instance ItMw_BeliarWeapon_1H_07 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_07;
	damageTotal  		= 	Damage_BeliarW_1H_07;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_07;          
};
instance ItMw_BeliarWeapon_1H_08 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_08;
	damageTotal  		= 	Damage_BeliarW_1H_08;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_08;          
};
instance ItMw_BeliarWeapon_1H_09 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_09;
	damageTotal  		= 	Damage_BeliarW_1H_09;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_09;          
};
instance ItMw_BeliarWeapon_1H_10 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_10;
	damageTotal  		= 	Damage_BeliarW_1H_10;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_10;          
};
instance ItMw_BeliarWeapon_1H_11 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_11;
	damageTotal  		= 	Damage_BeliarW_1H_11;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_11;          
};
instance ItMw_BeliarWeapon_1H_12 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_12;
	damageTotal  		= 	Damage_BeliarW_1H_12;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_12;          
};
instance ItMw_BeliarWeapon_1H_13 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_13;
	damageTotal  		= 	Damage_BeliarW_1H_13;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_13;          
};
instance ItMw_BeliarWeapon_1H_14 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_14;
	damageTotal  		= 	Damage_BeliarW_1H_14;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_14;          
};
instance ItMw_BeliarWeapon_1H_15 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_15;
	damageTotal  		= 	Damage_BeliarW_1H_15;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_15;          
};
instance ItMw_BeliarWeapon_1H_16 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_16;
	damageTotal  		= 	Damage_BeliarW_1H_16;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_16;          
};
instance ItMw_BeliarWeapon_1H_17 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_17;
	damageTotal  		= 	Damage_BeliarW_1H_17;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_17;         
};
instance ItMw_BeliarWeapon_1H_18 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_18;
	damageTotal  		= 	Damage_BeliarW_1H_18;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_18;          
};
instance ItMw_BeliarWeapon_1H_19 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_19;
	damageTotal  		= 	Damage_BeliarW_1H_19;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_19;          
};
instance ItMw_BeliarWeapon_1H_20 (BeliarWeaponPrototype_1H)
{
	value 				=	Value_BeliarW_1H_20;
	damageTotal  		= 	Damage_BeliarW_1H_20;   	COUNT[5]	= value;  COUNT[3]	= damageTotal;    COUNT[4]	= BeliarDamageChance_20;          
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////				2 HAND WAFFE					//////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
prototype BeliarWeaponPrototype_2H (C_Item) 
{	
	name 				=	NAME_ADDON_BELIARSWEAPON;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	//value 				=	Value_Drachenschneide;

	//damageTotal			= 	Damage_Drachenschneide;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Drachenschneide;	

	effect				= 	"SPELLFX_FIRESWORDBLACK";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	0;
	visual 				=	"ItMw_BeliarWeapon_2H.3DS"; 

	description			= name;
	TEXT[2]				= NAME_TwoHanded;
	TEXT[3]				= NAME_Damage;					COUNT[3]	= damageTotal;
	TEXT[4] 			= NAME_ADDON_TWOHANDED_BELIAR;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
instance ItMw_BeliarWeapon_Raven (BeliarWeaponPrototype_2H)
{
	value 				=	Value_BeliarW_Raven;
	damageTotal  		= 	Damage_BeliarW_Raven;   	
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	666666; //Joly:spezieller Wert von Raven!
	TEXT[3] 			= 	"";
	TEXT[5] 			= 	NAME_Value;	COUNT[5]	= value;
};
instance ItMw_BeliarWeapon_2H_01 (BeliarWeaponPrototype_2H)
{
	value 				=	Value_BeliarW_2H_01;
	damageTotal  		= 	Damage_BeliarW_2H_01;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_01;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_02 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_02;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_02;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_02;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_03 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_03;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_03;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_03;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_04 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_04;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_04;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_04;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_05 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_05;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_05;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_05;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_06 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_06;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_06;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_06;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_07 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_07;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_07;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_07;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_08 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_08;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_08;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_08;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_09 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_09;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_09;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_09;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_10 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_10;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_10;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_10;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_11 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_11;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_11;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_11;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_12 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_12;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_12;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_12;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_13 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_13;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_13;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_13;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_14 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_14;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_14;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_14;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_15 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_15;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_15;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_15;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_16 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_16;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_16;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_16;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_17 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_17;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_17;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_17;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_18 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_18;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_18;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_18;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_19 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_19;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_19;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_19;      
};                                                                                                                                           
instance ItMw_BeliarWeapon_2H_20 (BeliarWeaponPrototype_2H)                                                                                  
{                                                                                                                                            
	value 				=	Value_BeliarW_2H_20;                                                                                             
	damageTotal  		= 	Damage_BeliarW_2H_20;   	COUNT[5]	= value;  COUNT[3]	= damageTotal; COUNT[4]	= BeliarDamageChance_20;      
};

/*
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////					RUNE						//////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
prototype BeliarWeaponPrototype_Rune (C_Item)
{
	name 				=	NAME_ADDON_BELIARSWEAPON;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_ArmyofDarkness;

	visual				=	"ItRu_ArmyOfDarkness.3DS"; 
	material			=	MAT_STONE;

	spell				= 	SPL_ARMYOFDARKNESS;
	mag_circle			=	6;

	description			=	NAME_SPL_ArmyOfDarkness;

	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_ARMYOFDARKNESS;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
instance ItRu_BeliarWeapon_Rune_01 (BeliarWeaponPrototype_Rune)
{ 
};
instance ItRu_BeliarWeapon_Rune_02 (BeliarWeaponPrototype_Rune)
{ 
};
instance ItRu_BeliarWeapon_Rune_03 (BeliarWeaponPrototype_Rune)
{ 
};
instance ItRu_BeliarWeapon_Rune_04 (BeliarWeaponPrototype_Rune)
{ 
};
instance ItRu_BeliarWeapon_Rune_05 (BeliarWeaponPrototype_Rune)
{ 
};
*/

// Feuerschwert
instance ItMw_BeliarWeapon_Fire (BeliarWeaponPrototype_2H)
{
	value				= Value_BeliarW_2H_20;
	damageTotal  		= Damage_BeliarW_2H_20;			COUNT[5]	= value;  COUNT[3]	= damageTotal;     
	effect				= "SPELLFX_FIRESWORD";
};
