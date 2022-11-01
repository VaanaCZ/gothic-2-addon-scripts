/******************************************************************************************/
//	Trank der Geistesveränderung (unwissend zusammengebraut)																		//
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

	description		= 	"Potion d'altération mentale";
	
	TEXT[2]			=   "A consommer avec MODERATION !";
	
	TEXT[3]			= 	"Peut fortement influencer l'esprit,";	
	TEXT[4]			= 	"voire tuer l'utilisateur";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaEssenz;

};

	FUNC VOID UseItPo_Geist_01()
	{
		
		self.attribute[ATR_HITPOINTS] = (self.attribute[ATR_HITPOINTS] -1000);
	};
/******************************************************************************************/
//	Trank der Geistesveränderung (wissend zusammengebraut)																		//
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

	description		= 	"Potion d'altération mentale";
	
	TEXT[2]			=   "A consommer avec MODERATION !";
	
	TEXT[3]			= 	"Peut fortement influencer l'esprit,";	
	TEXT[4]			= 	"voire tuer l'utilisateur";
	
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


	description		= 	"Energie vitale pure";
	
	//TEXT[1]			= 	NAME_Bonus_HP;				
	TEXT[2]			= 	"Régénération totale";
	
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


	description		= 	"Mana pur";
	
	//TEXT[1]			= 	NAME_Bonus_Mana;				
	TEXT[2]			= 	"Régénération totale du mana";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaTrunk;
};

	FUNC VOID UseItPo_Mana_04()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
