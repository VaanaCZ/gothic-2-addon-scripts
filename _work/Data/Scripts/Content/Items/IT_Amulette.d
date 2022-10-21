//Amulette//

// Schutzamulette
 
const int Value_Am_ProtFire 		= 600;	const int Am_ProtFire		= 10; 
const int Value_Am_ProtEdge 		= 800;	const int Am_ProtEdge		= 10;
const int Value_Am_ProtMage 		= 700;	const int Am_ProtMage		= 10;
const int Value_Am_ProtPoint 		= 500;	const int Am_ProtPoint		= 10;

const int Value_Am_ProtTotal 		= 1000;	const int Am_TProtFire		= 8; // Schutzamulett Total
											const int AM_TProtEdge		= 8;
											const int Am_TProtMage		= 8;
											const int Am_TProtPoint		= 8;
// Andere Amulette

const int Value_Am_Dex 				= 1000;	const int Am_Dex			= 10; 
const int Value_Am_Mana 			= 1000;	const int Am_Mana			= 10; //ITAM_HP
const int Value_Am_Strg 			= 1000;	const int Am_Strg			= 10; 
const int Value_Am_Hp 				= 400;	const int Am_Hp				= 40; 

const int Value_Am_HpMana 			= 1300;	const int Am_HpMana_Hp		= 30; // Mana + Hp Amulett
											const int Am_HpMana_Mana	= 10; 

const int Value_Am_DexStrg 			= 1600;	const int Am_DexStrg_Dex	= 8; // Strg + Dex Amulett
											const int Am_DexStrg_Strg	= 8; 
/******************************************************************************************/
INSTANCE  ItAm_Prot_Fire_01(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_ProtFire;

	visual 			=	"ItAm_Prot_Fire_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Prot_Fire_01;
	on_unequip		=	UnEquip_ItAm_Prot_Fire_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Flammen";
	
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= Am_ProtFire;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Prot_Fire_01()
	{
	 	self.protection [PROT_FIRE] += Am_ProtFire;
	};


	FUNC VOID UnEquip_ItAm_Prot_Fire_01()
	{
		self.protection [PROT_FIRE] -= Am_ProtFire;
	};

/******************************************************************************************/
	INSTANCE  ItAm_Prot_Edge_01(C_Item) // Waffen Schutz Amulett
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_ProtEdge;

	visual 			=	"ItAm_Prot_Edge_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Prot_Edge_01;
	on_unequip		=	UnEquip_ItAm_Prot_Edge_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Harnischamulett";
	
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= Am_ProtEdge;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Prot_Edge_01()
	{
		self.protection [PROT_EDGE] += Am_ProtEdge;
		self.protection [PROT_BLUNT] += Am_ProtEdge;
	};


	FUNC VOID UnEquip_ItAm_Prot_Edge_01()
	{
		self.protection [PROT_EDGE] -= Am_ProtEdge;
		self.protection [PROT_BLUNT] -= Am_ProtEdge;
	};

/******************************************************************************************/
	INSTANCE  ItAm_Prot_Point_01(C_ITEM) // Geschoss Schutz Amulett 
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_ProtPoint;

	visual 			=	"ItAm_Prot_Point_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Prot_Point_01;
	on_unequip		=	UnEquip_ItAm_Prot_Point_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Eichenhaut";
	
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= Am_ProtPoint;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;

};

	FUNC VOID Equip_ItAm_Prot_Point_01()
	{
		self.protection [PROT_POINT] += Am_ProtPoint;
	};


	FUNC VOID UnEquip_ItAm_Prot_Point_01()
	{
		self.protection [PROT_POINT] -= Am_ProtPoint;
	};

/******************************************************************************************/
	INSTANCE  ItAm_Prot_Mage_01(C_ITEM) // Magie Schutz Amulett von Serpentes an KDF für alle Minenanteile (Mission -> MIS_Serpentes_MinenAnteil_KDF == LOG_SUCCESS)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_ProtMage;

	visual 			=	"ItAm_Prot_Mage_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Prot_Mage_01;
	on_unequip		=	UnEquip_ItAm_Prot_Mage_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Geisteskraft";
	
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= Am_ProtMage;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Prot_Mage_01()
	{
		self.protection [PROT_MAGIC] += Am_ProtMage;
	};

	FUNC VOID UnEquip_ItAm_Prot_Mage_01()
	{
		self.protection [PROT_MAGIC] -= Am_ProtMage;
	};

/******************************************************************************************/

	INSTANCE  ItAm_Prot_Total_01(C_ITEM)//ItAm_AmulettOfDeath_Mis (alle + 30)  MAGIER_EXKLUSIV_AMULETT für den Endkampf des KDFs  (Kapitel 5)

{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_ProtTotal;

	visual 			=	"ItAm_Prot_Total_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Value_Am_ProtTotal;
	on_unequip		=	UnEquip_Value_Am_ProtTotal;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Erzhaut";
	
	TEXT[1]			= NAME_Prot_Fire;
	COUNT[1]		= AM_TProtFire;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= AM_TProtMage;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= AM_TProtPoint;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= AM_TProtEdge;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;

};

	FUNC VOID Equip_Value_Am_ProtTotal()
	{
		self.protection [PROT_EDGE]   += AM_TProtEdge;
		self.protection [PROT_BLUNT]  += AM_TProtEdge;
		self.protection [PROT_POINT]  += AM_TProtPoint;
		self.protection [PROT_FIRE]   += AM_TProtFire;
		self.protection [PROT_MAGIC]  += AM_TProtMage;

	};

	FUNC VOID UnEquip_Value_Am_ProtTotal()
	{
		self.protection [PROT_EDGE]   -=  AM_TProtEdge;
		self.protection [PROT_BLUNT]  -=  AM_TProtEdge;
		self.protection [PROT_POINT]  -=  AM_TProtPoint;
		self.protection [PROT_FIRE]   -=  AM_TProtFire;
		self.protection [PROT_MAGIC]  -=  AM_TProtMage;
	};

/******************************************************************************************/
	INSTANCE  ItAm_Dex_01(C_Item)	//Joly: von Dar an KDF und DJG vergeben ab Kapitel 4 \ Xardas_Secret-area für PAL	(Kapitel 3)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_Dex;

	visual 			=	"ItAm_Dex_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Dex_01;
	on_unequip		=	UnEquip_ItAm_Dex_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Wendigkeit";
	
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= Am_Dex;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Dex_01()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,+ Am_Dex);
	};


	FUNC VOID UnEquip_ItAm_Dex_01()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,- Am_Dex);
	};

/******************************************************************************************/

	INSTANCE  ItAm_Strg_01(C_Item) //in LOCkpick Truhe Fingers
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_Strg;

	visual 			=	"ItAm_Strg_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Strg_01;
	on_unequip		=	UnEquip_ItAm_Strg_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Kraft";
	
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= Am_Strg;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Strg_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,+ Am_Strg);
	};

	FUNC VOID UnEquip_ItAm_Strg_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,- Am_Strg);
	};

/******************************************************************************************/

	INSTANCE  ItAm_Hp_01(C_Item)  //von Bennet dem Schmied an den PAL und dem KDF        (Kapitel 3)\Xardas_Secret-area für DJG	(Kapitel 3)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_Hp;

	visual 			=	"ItAm_Hp_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Hp_01;
	on_unequip		=	UnEquip_ItAm_Hp_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Lebenskraft";

	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= Am_Hp;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Hp_01()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Am_Hp;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Am_Hp;
	};


	FUNC VOID UnEquip_ItAm_Hp_01()
	{
		self.attribute [ATR_HITPOINTS_MAX] = self.attribute [ATR_HITPOINTS_MAX] -Am_Hp;
		if (self.attribute[ATR_HITPOINTS] > (Am_Hp + 2))
		{
			self.attribute [ATR_HITPOINTS] = self.attribute [ATR_HITPOINTS] -Am_Hp;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};

/******************************************************************************************/
	INSTANCE  ItAm_Mana_01(C_Item) //in der OW von Angar an alle SC Gilden!  (Kapitel 4)

{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_Mana;

	visual 			=	"ItAm_Mana_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Mana_01;
	on_unequip		=	UnEquip_ItAm_Mana_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Magie";
	
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= Am_Mana;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Mana_01()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Am_Mana;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Am_Mana;
	};

	FUNC VOID UnEquip_ItAm_Mana_01 ()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Am_Mana;
		if (self.attribute[ATR_MANA] > (Am_Mana))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Am_Mana;
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};	
		
	};

/******************************************************************************************/
	INSTANCE  ItAm_Dex_Strg_01(C_Item)	// wird dem PAL von Ulthar überreicht für die Reinigung der Schreine Kapitel 3\
{
	name 			=	"Amulett der Macht";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_DexStrg;

	visual 			=	"ItAm_Dex_Strg_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Dex_Strg_01;
	on_unequip		=	UnEquip_ItAm_Dex_Strg_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Macht";
	
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= Am_DexStrg_Dex;
	TEXT[3] 		= NAME_Bonus_Str;
	COUNT[3]		= Am_DexStrg_Strg;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Dex_Strg_01()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,+ Am_DexStrg_Dex );
		Npc_ChangeAttribute(self,ATR_STRENGTH,+ Am_DexStrg_Strg );
	};


	FUNC VOID UnEquip_ItAm_Dex_Strg_01 ()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-Am_DexStrg_Dex );
		Npc_ChangeAttribute(self,ATR_STRENGTH,-Am_DexStrg_Strg );
	};

/******************************************************************************************/
	INSTANCE  ItAm_Hp_Mana_01 (C_Item)	//Xardas_Secret-area für KDF	(Kapitel 3)
{
	name 			=	"Amulett der Erleuchtung";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_Am_HpMana;

	visual 			=	"ItAm_Hp_Mana_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Hp_Mana_01 ;
	on_unequip		=	UnEquip_ItAm_Hp_Mana_01 ;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Amulett der Erleuchtung";
	
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= Am_HpMana_Hp;
	
	TEXT[3] 		= NAME_Bonus_Mana;
	COUNT[3]		= Am_HpMana_Mana;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Hp_Mana_01 ()
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Am_HpMana_Hp;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Am_HpMana_Hp;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Am_HpMana_Mana;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Am_HpMana_Mana;
		
	};


	FUNC VOID UnEquip_ItAm_Hp_Mana_01 ()
	{
		
		//self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Am_HpMana_Mana;
	
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Am_HpMana_Mana;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Am_HpMana_Hp;
		
		if (self.attribute[ATR_HITPOINTS] > Am_HpMana_Hp+1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Am_HpMana_Hp;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
		
		if (self.attribute[ATR_MANA] >= Am_HpMana_Mana)
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Am_HpMana_Mana;
		}
		else
		{
			self.attribute [ATR_MANA] = 0;
		};
	};

/******************************************************************************************/











	
