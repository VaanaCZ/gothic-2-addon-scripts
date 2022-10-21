/******************************************************************************************/
//	Trank der Geistesver�nderung (unwissend zusammengebraut)																		//
/******************************************************************************************/
INSTANCE ItPo_Addon_Geist_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	300;	

	visual 			=	"ItPo_Perm_STR.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Geist_01;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Potion of mental alteration";
	
	TEXT[2]			=   "Take PRECAUTIONS before using!";
	
	TEXT[3]			= 	"Can strongly influence the mind";	
	TEXT[4]			= 	"or kill the user";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaEssenz;

};

	FUNC VOID UseItPo_Geist_01()
	{
		
		self.attribute[ATR_HITPOINTS] = (self.attribute[ATR_HITPOINTS] -1000);
	};
/******************************************************************************************/
//	Trank der Geistesver�nderung (wissend zusammengebraut)																		//
/******************************************************************************************/
INSTANCE ItPo_Addon_Geist_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	300;	

	visual 			=	"ItPo_Perm_STR.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Geist_02;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Potion of mental alteration";
	
	TEXT[2]			=   "Take PRECAUTIONS before using!";
	
	TEXT[3]			= 	"Can strongly influence the mind";	
	TEXT[4]			= 	"or kill the user";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaEssenz;

};

	FUNC VOID UseItPo_Geist_02()
	{
		if Npc_IsPlayer (self)
		{
			B_GivePlayerXP (XP_Ambient * 5);
		};
	};
/******************************************************************************************/	
INSTANCE ItPo_Health_Addon_04(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpTrunk;	

	visual 			=	"ItPo_Health_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Health_04;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 


	description		= 	"Pure life energy";
	
	//TEXT[1]			= 	NAME_Bonus_HP;				
	TEXT[2]			= 	"Complete regeneration";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpTrunk;
};

	FUNC VOID UseItPo_Health_04()
	{
		
		self.attribute[ATR_HITPOINTS] =  self.attribute[ATR_HITPOINTS_MAX];
	};
/******************************************************************************************/
INSTANCE ItPo_Mana_Addon_04(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaTrunk;	

	visual 			=	"ItPo_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Mana_04;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION"; 


	description		= 	"Pure mana";
	
	//TEXT[1]			= 	NAME_Bonus_Mana;				
	TEXT[2]			= 	"Complete mana regeneration";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaTrunk;
};

	FUNC VOID UseItPo_Mana_04()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
