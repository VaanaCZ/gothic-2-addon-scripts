/*
	
	10 neue Waffen
	
	Magierstab rot, blau, gold
	Zweihandkeule, Einhandkeule (Holz, Stein) 
	Steinhammer (Maya TX) klein (einhand), groß (zweihand)
	
	Sichelstab (Zweihand, Stab mit Sichelklinge)
	
	Hackmesser (machete) Einhand- Zweihand
	
		
	
	
	
	ItMW_Addon_Knife01 //Wolfsmesser//Razormesser// +3 Von Cavalorn
	ItMW_Addon_Sichel01 //goldene Sichel + 3	 //versteckt Lobart umgebung	
	ItMW_Addon_Stab01 //Magierstab, Stab der Feuermagier  KAP1 
	ItMW_Addon_Stab02 //Stab der Wassermagier			  KAP2	Addonworld
	ItMW_Addon_Stab03 //Zauberstab 						  ab KAP1  Klosterkauf
	ItMW_Addon_Stab04 //Sichelstab, Ulthar's Stab		  ab KAP1  Klosterkauf
	ItMW_Addon_Stab05 //Goldener Zauberstab				  ab KAP1  Klosterkauf	
	
	
	
	
	ItMW_Addon_Hacker_1h_01 //Machete					  ab KAP1 zu kaufen		+3
	ItMW_Addon_Hacker_2h_01 //Große Machete				  ab KAP1 zu kaufen     +3
	ItMW_Addon_Keule_1h_01 //Keule, Windknecht			  finden ab kap 1			
	ItMW_Addon_Keule_2h_01 //Große Keule, Sturmknecht     finden in Addonworld
	
	
	
		
*/

//-------------------------------------------------------
//	Addon Waffen  Wolfsmesser
//-------------------------------------------------------
INSTANCE ItMW_Addon_Knife01 (C_Item)
{	
	name 				=	"Nó¿ na wilki";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Wolfsmesser;

	damageTotal  		= 	Damage_Wolfsmesser;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Wolfsmesser;		
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Wolfsmesser;
	visual 				=	"ItMw_012_1h_Knife_02.3DS";

	description			=   name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Stab01 (C_Item)
{	
	name 				=	"Kostur maga";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab01;

	damageTotal  		= 	Damage_Stab01;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab01;		
	
	on_equip			=	Equip_2H_03;
	on_unequip			=	UnEquip_2H_03;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Stab01;
	visual 				=	"ItMW_MageStaff_Good_2H_01.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";

	description			= 	"Kostur Maga Ognia";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Stab02 (C_Item)
{	
	name 				=	"Magiczna ró¿d¿ka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab02;

	damageTotal  		= 	Damage_Stab02;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab02;		
	
	on_equip			=	Equip_Zauberstab;
	on_unequip			=	UnEquip_Zauberstab;
	
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	Condition_Stab02;
	visual 				=	"ItMW_MageStaff_Good_2H_02.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF2";

	description			= 	name;

	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	
	TEXT[2]				= NAME_Bonus_Mana;				COUNT[2]	= 20;//FIXME_FILLER
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
FUNC VOID Equip_Zauberstab()
{
	if Npc_IsPlayer (self)
	{ 
		Npc_ChangeAttribute (self, ATR_MANA_MAX,20);
		Npc_ChangeAttribute (self, ATR_MANA,20);
	};
};
FUNC VOID UnEquip_Zauberstab()
{
	if Npc_IsPlayer (self)
	{ 
		Npc_ChangeAttribute (self, ATR_MANA_MAX, - 20);
		
		if self.attribute [ATR_MANA]	>= 20
		{
			Npc_ChangeAttribute (self, ATR_MANA, - 20);
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
	
	
};
// *****************************************************
INSTANCE ItMW_Addon_Stab03 (C_Item)
{	
	name 				=	"Wodny kostur";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab03;

	damageTotal  		= 	Damage_Stab03;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab03;		
	
	on_equip			=	Equip_2H_04;
	on_unequip			=	UnEquip_2H_04;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Stab03;
	visual 				=	"ItMW_MageStaff_Blades_2H_01.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF3";

	description			= 	"Kostur Maga Wody";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_04;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Stab04 (C_Item)
{	
	name 				=	"Kostur Ulthara";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab04;

	damageTotal  		= 	Damage_Stab04;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab04;		
	
	on_equip			=	Equip_2H_04;
	on_unequip			=	UnEquip_2H_04;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Stab04;
	visual 				=	"ItMW_MageStaff_Good_2H_02.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF4";

	description			= 	"Zaklêty kostur Ulthara";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_04;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Stab05 (C_Item)
{	
	name 				=	"Tajfun";
	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab05;

	damageTotal  		= 	Damage_Stab05;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab05;		
	
	on_equip			=	Equip_2H_05;
	on_unequip			=	UnEquip_2H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Stab05;
	visual 				=	"ItMW_MageStaff_Blades_2H_01.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF5";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMW_Addon_Hacker_1h_01 (C_Item) 
{	
	name 				=	"Maczeta";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Machete;

	damageTotal			= 	Damage_Machete;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Machete;	
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;
	
	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Machete;
	visual 				=	"ItMw_1H_Machete_02.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMW_Addon_Hacker_1h_02 (C_Item) 
{	
	name 				=	"Stara maczeta";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_AltMachete;

	damageTotal			= 	Damage_AltMachete;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_AltMachete;	
	
	on_equip			=	Equip_1H_02;
	on_unequip			=	UnEquip_1H_02;
	
	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_AltMachete;
	visual 				=	"ItMw_1H_Machete_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMW_Addon_Hacker_2h_01 (C_Item) 
{	
	name 				=	"Wielka maczeta";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Hacker;

	damageTotal			= 	Damage_Hacker;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Hacker;	
	
	on_equip			=	Equip_2H_03;
	on_unequip			=	UnEquip_2H_03;
	
	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Hacker;
	visual 				=	"ItMw_2H_Machete_02.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMW_Addon_Hacker_2h_02 (C_Item) 
{	
	name 				=	"Wielka, stara maczeta";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_AltHacker;

	damageTotal			= 	Damage_AltHacker;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_AltHacker;	
	
	on_equip			=	Equip_2H_02;
	on_unequip			=	UnEquip_2H_02;
	
	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_AltHacker;
	visual 				=	"ItMw_2H_Machete_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Keule_1h_01 (C_Item)
{	
	name 				=	"S³uga Wiatru";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Windknecht;

	damageTotal  		= 	Damage_Windknecht;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Windknecht;		
	
	on_equip			=	UnEquip_1H_10; //MALUS WAFFE MUSS umgekehrt sein.  
	on_unequip			=	Equip_1H_10;   //!!!
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Windknecht;
	visual 				=	"ItMW_Club_1H_01.3DS";

	description			= name;
	
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	
	TEXT[2]				= NAME_ADDON_MALUS_1H;			COUNT[2]	= Waffenbonus_10;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// *****************************************************
INSTANCE ItMW_Addon_Keule_2h_01 (C_Item)//Sturmknecht 2h Holzkeule
{	
	name 				=	"S³uga Burzy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Sturmknecht;

	damageTotal  		= 	Damage_Sturmknecht;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Sturmknecht;		
	
	on_equip			=	UnEquip_2H_10;//MALUS WAFFE MUSS umgekehrt sein. 
	on_unequip			=	Equip_2H_10; //erhöhen 
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sturmknecht;
	visual 				=	"ItMW_Club_2H_01.3DS";

	description			= 	name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_MALUS_2H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// *****************************************************
INSTANCE ItMw_FrancisDagger_Mis (C_Item)
{	
	name 				=	"Z³oty sztylet";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	0;

	damageTotal  		= 	Damage_VLKDolch;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;	
	
	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;	

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKDolch;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	
};

// *****************************************************
INSTANCE ItMw_RangerStaff_Addon (C_Item)
{	
	name 				=	"Pika bojowa Wodnego Krêgu";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_RangerStaff;

	damageTotal  		= 	Damage_RangerStaff;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_RangerStaff;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_RangerStaff;
	visual 				=	"ItMw_020_2h_Nov_Staff_01.3DS"; 

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//*********************************************************

INSTANCE ItMw_Addon_PIR2hAxe (C_Item)
{	
	name 				=	"Mia¿d¿ydeska";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_PIR2hAxe;

	damageTotal  		= 	Damage_PIR2hAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_PIR2hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PIR2hAxe;
	visual 				=	"ItMw_070_2h_axe_heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//*********************************************************
INSTANCE ItMw_Addon_PIR2hSword (C_Item)
{	
	name 				=	"Miecz pok³adowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PIR2hSword;

	damageTotal  		= 	Damage_PIR2hSword;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_PIR2hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PIR2hSword;
	visual 				=	"ItMw_070_2h_sword_09.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//*********************************************************
INSTANCE ItMw_Addon_PIR1hAxe (C_Item)
{	
	name 				=	"Topór pok³adowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_PIR1hAxe;

	damageTotal  		= 	Damage_PIR1hAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_PIR1hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PIR1hAxe;
	visual 				=	"ItMw_030_1h_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//*********************************************************
INSTANCE ItMw_Addon_PIR1hSword (C_Item)
{	
	name 				=	"Kordelas";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PIR1hSword;

	damageTotal  		= 	Damage_PIR1hSword;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_PIR1hSword;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PIR1hSword;
	visual 				=	"ItMw_030_1h_sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// *****************************************************
INSTANCE ItMw_Addon_BanditTrader (C_Item)
{	
	name 				=	"Pa³asz bandytów";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_BanditTrader;

	damageTotal  		= 	Damage_VLKSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKSchwert;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	Condition_VLKSchwert;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;

	TEXT[1]				= 	"Na g³owicy wyciêto literê 'F'.";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *******************
// Skinenrs Waffe 
// *******************
INSTANCE ItMw_Addon_Betty (C_Item)
{	
	name 				=	"Betty";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Betty;

	damageTotal  		= 	Damage_Betty;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

////////////////////////////////////////////////////////////////////////////////
//
//	Magische Waffen
//

instance ItRw_Addon_MagicArrow (C_Item)
{
	name 				=	"Magiczna strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW | ITEM_MULTI;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_ARROW";

	// FIXME_Noki: Werte
	value 				=	Value_Pfeil;

	visual 				=	"ItRw_Arrow.3ds";
	material 			=	MAT_WOOD;

	description			= name;
//	TEXT[0]				= "";					COUNT[0]	= ;
//	TEXT[1]				= "";					COUNT[1]	= ;
//	TEXT[2]				= NAME_Damage;			COUNT[2]	= damageTotal;
//	TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
//	TEXT[4]				= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};


instance ItRw_Addon_FireArrow (C_Item)
{
	name 				=	"Ognista strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW | ITEM_MULTI;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_FIREARROW";

	// FIXME_Noki: Werte
	value 				=	Value_Pfeil;

	visual 				=	"ItRw_Arrow.3ds";
	material 			=	MAT_WOOD;

	description			= name;
//	TEXT[0]				= "";					COUNT[0]	= ;
//	TEXT[1]				= "";					COUNT[1]	= ;
//	TEXT[2]				= NAME_Damage;			COUNT[2]	= damageTotal;
//	TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
//	TEXT[4]				= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};


instance ItRw_Addon_MagicBow (C_Item)
{
	name 				=	"Magiczny ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_MagicBow;

	damageTotal			=	Damage_MagicBow;
	damagetype			=	DAM_MAGIC;
	munition			=	ItRw_Addon_MagicArrow;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_BOW";

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_MagicBow;
	visual 				=	"ItRw_Bow_H_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


instance ItRw_Addon_FireBow (C_Item)
{
	name 				=	"Ognisty ³uk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_FireBow;

	damageTotal			=	Damage_FireBow;
	damagetype			=	DAM_MAGIC;
	munition			=	ItRw_Addon_FireArrow;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_FIREBOW";

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_FireBow;
	visual 				=	"ItRw_Bow_H_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


////////////////////////////////////////////////////////////////////////////////

instance ItRw_Addon_MagicBolt (C_Item)
{
	name 				=	"Magiczny be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_CROSSBOW | ITEM_MULTI;

	value 				=	Value_Bolzen;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_BOLT";

	visual 				=	"ItRw_Bolt.3ds";
	material 			=	MAT_WOOD;

	description			= name;
//	TEXT[0]				= "";					COUNT[0]	= ;
//	TEXT[1]				= "";					COUNT[1]	= ;
//	TEXT[2]				= NAME_Damage;			COUNT[2]	= damageTotal;
//	TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
//	TEXT[4]				= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

instance ItRw_Addon_MagicCrossbow (C_Item)
{
	name 				=	"Magiczna kusza";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_CROSSBOW";

	value 				=	Value_MagicCrossbow;

	damageTotal			= 	Damage_MagicCrossbow;
	damagetype			=	DAM_MAGIC;
	munition			=	ItRw_Addon_MagicBolt;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_MagicCrossbow;
	visual 				=	"ItRw_Crossbow_H_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
