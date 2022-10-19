const int Value_Sc_Water = 1;

const int Value_Sc_IceLance = 100;
const int Value_Sc_Whirlwind = 200;
const int Value_Sc_Geyser = 100;
const int Value_Sc_Thunderstorm = 200;
const int Value_Sc_Waterfist = 100;

INSTANCE ItSc_Geyser (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Geyser;

	visual				=	"ItSc_Water01.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Geyser;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Geyser;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Damage;			
	COUNT	[2]			=	SPL_DAMAGE_Geyser;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Icelance (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Icelance;

	visual				=	"ItSc_Water04.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Icelance;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Icelance;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Damage;			
	COUNT	[2]			=	SPL_DAMAGE_Icelance;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Waterfist (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Waterfist;

	visual				=	"ItSc_Water03.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Waterfist;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Waterfist;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Damage;			
	COUNT	[2]			=	SPL_DAMAGE_Waterfist;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Thunderstorm (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Thunderstorm;

	visual				=	"ItSc_Water05.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Thunderstorm;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Thunderstorm;

	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Damage;				
	COUNT	[2]			=	SPL_DAMAGE_Thunderstorm;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Whirlwind (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Whirlwind;

	visual				=	"ItSc_Water02.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Whirlwind;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Whirlwind;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Sec_Duration;				
	COUNT	[2]			=	SPL_TIME_WHIRLWIND;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};


/*

INSTANCE ItSc_Water01 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water01.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W01";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water02 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water02.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W02";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water03 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water03.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W03";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water04 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water04.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W04";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water05 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water05.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W05";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water06 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water06.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W06";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water07 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water07.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W07";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water08 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water08.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W08";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water09 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water09.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W09";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water10 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water10.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W10";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water11 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water11.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W11";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water12 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water12.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W12";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water13 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water13.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W13";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water14 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water14.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W14";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water15 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water15.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W15";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Water16 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Water;

	visual				=	"ItSc_Water16.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"W16";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};


*/






























