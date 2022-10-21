// ************************************************************************************************
// Wirkung und Kosten von Tränken
// ************************************************************************************************


const int	Value_HpEssenz			=	25;			const int	HP_Essenz		=	50;
const int	Value_HpExtrakt			=	35;			const int	HP_Extrakt		=	70;
const int	Value_HpElixier			=	50;			const int	HP_Elixier		=	100;

const int	Value_ManaEssenz		=	25;			const int	Mana_Essenz		=	50;
const int	Value_ManaExtrakt		=	40;			const int	Mana_Extrakt	=	75;
const int	Value_ManaElixier		=	60;			const int	Mana_Elixier	=	100;


const int	Value_StrElixier		=	800;		const int	STR_Elixier		=	3;
const int	Value_DexElixier		=	800;		const int	DEX_Elixier		=	3;
const int	Value_HpMaxElixier		=	1500;		const int	HPMax_Elixier	=	20;
const int	Value_ManaMaxElixier	=	1500;		const int	ManaMax_Elixier	=	5;
const int	Value_MegaDrink			=	1800;		const int	STRorDEX_MegaDrink = 15; //Joly: MegaBoost am Ende des Spiels!!!!!!!!

const int	Value_Speed				=	200;		const int	Time_Speed		=	300000;	// 5 min

//ADDON
const int 	Value_ManaTrunk			=   200;		
const int 	Value_HpTrunk			=   150;

/******************************************************************************************/
//	MANATRÄNKE																			//
/******************************************************************************************/
INSTANCE ItPo_Mana_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaEssenz;	

	visual 			=	"ItPo_Mana_01.3ds";
	material 		=	MAT_GLAS;

	on_state[0]		=	UseItPo_Mana_01;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION";

	description		= 	"Esencja many";
	
	TEXT[1]			= 	NAME_Bonus_Mana;				
	COUNT[1]		= 	Mana_Essenz;

	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaEssenz;

};

	FUNC VOID UseItPo_Mana_01()
	{
		
		Npc_ChangeAttribute	(self,	ATR_MANA, Mana_Essenz);
	};

/******************************************************************************************/
INSTANCE ItPo_Mana_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaExtrakt;	

	visual 			=	"ItPo_Mana_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Mana_02;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION";

	description		= 	"Ekstrakt many";
	
	TEXT[1]			= 	NAME_Bonus_Mana;			
	COUNT[1]		= 	Mana_Extrakt;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaExtrakt;

};

	FUNC VOID UseItPo_Mana_02()
	{
		
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItPo_Mana_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaElixier;	

	visual 			=	"ItPo_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Mana_03;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION";

	description		= 	"Eliksir many";
	
	TEXT[1]			= 	NAME_Bonus_Mana;				
	COUNT[1]		= 	Mana_Elixier;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaElixier;
};

	FUNC VOID UseItPo_Mana_03()
	{
		
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Elixier);
	};
/******************************************************************************************/
//	HEILTRÄNKE																			//
/******************************************************************************************/
INSTANCE ItPo_Health_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpEssenz;	

	visual 			=	"ItPo_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Health_01;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 

	description		= 	"Esencja lecznicza";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Essenz;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpEssenz;
};

	FUNC VOID UseItPo_Health_01()
	{
		
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Essenz);
	};

/******************************************************************************************/	
INSTANCE ItPo_Health_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpExtrakt;	

	visual 			=	"ItPo_Health_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Health_02;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 

	description		= 	"Ekstrakt leczniczy";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Extrakt;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpExtrakt;
};

	FUNC VOID UseItPo_Health_02()
	{
		
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Extrakt);
	};

/******************************************************************************************/	
INSTANCE ItPo_Health_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpElixier;	

	visual 			=	"ItPo_Health_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Health_03;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 

	description		= 	"Eliksir leczniczy";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Elixier;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpElixier;
};

	FUNC VOID UseItPo_Health_03()
	{
		
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Elixier);
	};
/******************************************************************************************/
// TRÄNKE FÜR PERMANENTE ATTRIBUT-ÄNDERUNGEN!
/******************************************************************************************/
INSTANCE ItPo_Perm_STR(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrElixier;	

	visual 			=	"ItPo_Perm_STR.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Perm_STR;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Eliksir si³y";
	
	TEXT[1]			= 	NAME_Bonus_Str;				
	COUNT[1]		= 	STR_Elixier;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_StrElixier;
};

	FUNC VOID UseItPo_Perm_STR()
	{ 
		B_RaiseAttribute	(self, ATR_STRENGTH,	STR_Elixier);
	};
/******************************************************************************************/		
INSTANCE ItPo_Perm_DEX(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexElixier;	

	visual 			=	"ItPo_Perm_DEX.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Perm_DEX;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Eliksir zrêcznoœci";
	TEXT[1]			= 	NAME_Bonus_Dex;
	COUNT[1]		= 	DEX_Elixier;
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_DexElixier;
};
	FUNC VOID UseItPo_Perm_DEX()
	{ 
		B_RaiseAttribute	(self, ATR_DEXTERITY,	DEX_Elixier);
	};
/******************************************************************************************/
INSTANCE ItPo_Perm_Health(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxElixier;	

	visual 			=	"ItPo_Perm_Health.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Perm_Health;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 

	description		= 	"Eliksir ¿ycia";
	
	TEXT[1]			= 	NAME_Bonus_HpMax;				
	COUNT[1]		= 	HPMax_Elixier;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpMaxElixier;
};

	FUNC VOID UseItPo_Perm_Health()
	{
		B_RaiseAttribute	(self, ATR_HITPOINTS_MAX,	HPMax_Elixier);	
		Npc_ChangeAttribute	(self, ATR_HITPOINTS,	HPMax_Elixier);
	
	};
/******************************************************************************************/
INSTANCE ItPo_Perm_Mana(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxElixier;	

	visual 			=	"ItPo_Perm_Mana.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Perm_Mana;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION"; 

	description		= 	"Eliksir ducha";
	TEXT[1]			= 	NAME_Bonus_ManaMax;			
	COUNT[1]		= 	ManaMax_Elixier;
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_ManaMaxElixier;
};

	FUNC VOID UseItPo_Perm_Mana()
	{
		B_RaiseAttribute	(self, ATR_MANA_MAX,	ManaMax_Elixier);
		Npc_ChangeAttribute	(self, ATR_MANA,	ManaMax_Elixier);
	};

/******************************************************************************************/
//	SPEED-POTIONS																	      //
/******************************************************************************************/
INSTANCE ItPo_Speed(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Speed;	

	visual 			=	"ItPo_Speed.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_Speed;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Mikstura szybkoœci";
	TEXT[1]			= 	"Tymczasowo zwiêksza twoj¹ szybkoœæ.";
	
	TEXT[3]			= 	NAME_Duration;				
	COUNT[3]		= 	Time_Speed/60000;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

	FUNC VOID UseItPo_Speed()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Speed);
		
	};
	
/******************************************************************************************/
//	MegaDrink	Kapitel 6																      //
/******************************************************************************************/

INSTANCE ItPo_MegaDrink (C_Item)	//Joly: Megatrank aus Dracheneiern auf der Dracheninsel -> Kapitel 6 kurz vor´m Endgegner
{
	name 			=	"Embarla Firgasto";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_MegaDrink;	

	visual 			=	"ItPo_Perm_Mana.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_MegaDrink;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	name;
	
	TEXT[3]			= 	"Skutki nieznane.";				

	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

	FUNC VOID UseItPo_MegaDrink()
		{
			if (self.attribute[ATR_STRENGTH] < self.attribute[ATR_DEXTERITY])
				{
					B_RaiseAttribute	(self, ATR_DEXTERITY,	STRorDEX_MegaDrink);
				}
			else
				{
					B_RaiseAttribute	(self, ATR_STRENGTH,	STRorDEX_MegaDrink);
				};
	
			Npc_ChangeAttribute	(self,	ATR_MANA, - ATR_MANA); //Joly: gemäß des Rezeptes
			Snd_Play ("DEM_Warn");
		};
