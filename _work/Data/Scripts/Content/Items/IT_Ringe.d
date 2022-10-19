//Ringe//

//Schutzringe
const int Value_Ri_ProtFire 		= 250;	const int Ri_ProtFire		= 3; 
const int Value_Ri_ProtEdge 		= 250;	const int Ri_ProtEdge		= 3;
const int Value_Ri_ProtMage 		= 250;	const int Ri_ProtMage		= 3;
const int Value_Ri_ProtPoint 		= 250;	const int Ri_ProtPoint		= 3;

const int Value_Ri_ProtFire02 		= 500;	const int Ri_ProtFire02		= 5; 
const int Value_Ri_ProtEdge02 		= 500;	const int Ri_ProtEdge02		= 5;
const int Value_Ri_ProtMage02 		= 500;	const int Ri_ProtMage02		= 5;
const int Value_Ri_ProtPoint02 		= 500;	const int Ri_ProtPoint02	= 5;

const int Value_Ri_ProtTotal 		= 600;	const int Ri_TProtFire		= 2; // Schutzring Total 1
											const int Ri_TProtEdge		= 3;
											const int Ri_TProtMage		= 2;
											const int Ri_TProtPoint		= 3;

const int Value_Ri_ProtTotal02 		= 1000;	const int Ri_TProtFire02	= 3; // Schutzring Total 2
											const int Ri_TProtEdge02	= 5;
											const int Ri_TProtMage02	= 3;
											const int Ri_TProtPoint02	= 5;

// Andere Ringe

const int Value_Ri_Dex 				= 300;	const int Ri_Dex			=  3; 
const int Value_Ri_Dex02 			= 500;	const int Ri_Dex02			=  5; 

const int Value_Ri_Mana 			= 500;	const int Ri_Mana			=  5;   
const int Value_Ri_Mana02 			= 1000;	const int Ri_Mana02			=  10; 

const int Value_Ri_Strg 			= 300;	const int Ri_Strg			=  3; 
const int Value_Ri_Strg02 			= 500;	const int Ri_Strg02			=  5; 

const int Value_Ri_Hp 				= 200;	const int Ri_Hp				= 20; 
const int Value_Ri_Hp02 			= 400;	const int Ri_Hp02			= 40;

const int Value_Ri_HpMana 			= 1300;	const int Ri_HpMana_Hp		= 30;
											const int Ri_HpMana_Mana	= 10;

const int Value_Ri_DexStrg 			= 800;	const int Ri_DexStrg_Dex	=  4;
											const int Ri_DexStrg_Strg	=  4; 

/******************************************************************************************/

	instance ItRi_Prot_Fire_01(C_Item) //in einem von Halvors Fischen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Fire_01;
	on_unequip				=	UnEquip_ItRi_Prot_Fire_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ ochrony przed ogniem";
	
	TEXT[2]					= NAME_Prot_Fire;
	COUNT[2]				= Ri_ProtFire;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Fire_01()
	{
		self.protection [PROT_FIRE] 		+=  Ri_ProtFire;
	};

	FUNC VOID UnEquip_ItRi_Prot_Fire_01()
	{
	self.protection [PROT_FIRE] 		-=  Ri_ProtFire;
	};
	
/******************************************************************************************/
	instance ItRi_Prot_Fire_02(C_Item) //MayaTurm2 (Truhe)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtFire02;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Fire_02;
	on_unequip				=	UnEquip_ItRi_Prot_Fire_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ ognia";
	
	TEXT[2]					= NAME_Prot_Fire;
	COUNT[2]				= Ri_ProtFire02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Fire_02()
	{
		self.protection [PROT_FIRE] 		+=  Ri_ProtFire02;
	};

	FUNC VOID UnEquip_ItRi_Prot_Fire_02()
	{
	self.protection [PROT_FIRE] 		-=  Ri_ProtFire02;
	};

/******************************************************************************************/
	INSTANCE ItRi_Prot_Point_01(C_Item) //Constantinos Schutzring
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtPoint ;

	visual 					=	"ItRi_Prot_Point_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Point_01;
	on_unequip				=	UnEquip_ItRi_Prot_Point_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ drewnianej skóry";
	
	TEXT[2]					= NAME_Prot_Point;
	COUNT[2]				= Ri_ProtPoint;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Point_01()
	{
	self.protection [PROT_POINT] 		+=  Ri_ProtPoint;
	};

	FUNC VOID UnEquip_ItRi_Prot_Point_01()
	{
	self.protection [PROT_POINT] 		-=  Ri_ProtPoint;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Point_02(C_Item)	//  Beim Schwarzen Troll      / Auf Dacheninsel -> NONE_101_MARIO_DI in der Tasche
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtPoint02 ;

	visual 					=	"ItRi_Prot_Point_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Point_02;
	on_unequip				=	UnEquip_ItRi_Prot_Point_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ kamiennej skóry";
	
	TEXT[2]					= NAME_Prot_Point;
	COUNT[2]				= Ri_ProtPoint02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Point_02()
	{
	self.protection [PROT_POINT] 		+=  Ri_ProtPoint02;
	};

	FUNC VOID UnEquip_ItRi_Prot_Point_02()
	{
	self.protection [PROT_POINT] 		-=  Ri_ProtPoint02;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Edge_01(C_Item) //bei Cassia als Belohnung //Höhle OW//PassNW bei den Orks
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtEdge;

	visual 					=	"ItRi_Prot_Edge_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Edge_01;
	on_unequip				=	UnEquip_ItRi_Prot_Edge_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ ¿elaznej skóry";

	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= Ri_ProtEdge;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Edge_01()
	{
	self.protection [PROT_EDGE] 		+=  Ri_ProtEdge;
	self.protection [PROT_BLUNT]		+=  Ri_ProtEdge;
	};

	FUNC VOID UnEquip_ItRi_Prot_Edge_01()
	{
	self.protection [PROT_EDGE] 		-=  Ri_ProtEdge;
	self.protection [PROT_BLUNT]		-=  Ri_ProtEdge;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Edge_02(C_Item) //Im Alten Lager
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtEdge02;

	visual 					=	"ItRi_Prot_Edge_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Edge_02;
	on_unequip				=	UnEquip_ItRi_Prot_Edge_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ magicznego pancerza";
	
	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= Ri_ProtEdge02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Edge_02()
	{
	self.protection [PROT_EDGE] 		+=  Ri_ProtEdge02;
	self.protection [PROT_BLUNT]		+=  Ri_ProtEdge02;
	};

	FUNC VOID UnEquip_ItRi_Prot_Edge_02()
	{
	self.protection [PROT_EDGE] 		-=  Ri_ProtEdge02;
	self.protection [PROT_BLUNT]		-=  Ri_ProtEdge02;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Mage_01(C_ITEM) //XARDAS RING 
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtMage;

	visual 					=	"ItRi_Prot_Mage_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Mage_01;
	on_unequip				=	UnEquip_ItRi_Prot_Mage_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ ducha";
	
	TEXT[2]					= NAME_Prot_Magic;
	COUNT[2]				= Ri_ProtMage;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Mage_01()
	{
	self.protection [PROT_MAGIC] 		+= Ri_ProtMage;
	};


	FUNC VOID UnEquip_ItRi_Prot_Mage_01()
	{
	self.protection [PROT_MAGIC] 		-=  Ri_ProtMage;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Mage_02(C_ITEM)	//Joly: von Neoras, wenn SC ihm Drachenei bringt. (Nur PAL oder KDF) ab Kapitel 4	//ricelordhütte OW
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtMage02;

	visual 					=	"ItRi_Prot_Mage_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Mage_02;
	on_unequip				=	UnEquip_ItRi_Prot_Mage_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ obrony";
	
	TEXT[2]					= NAME_Prot_Magic;
	COUNT[2]				= Ri_ProtMage02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Mage_02()
	{
	self.protection [PROT_MAGIC] 		+= Ri_ProtMage02;
	};


	FUNC VOID UnEquip_ItRi_Prot_Mage_02()
	{
	self.protection [PROT_MAGIC] 		-=  Ri_ProtMage02;
	};
	
/******************************************************************************************/

	INSTANCE ItRi_Prot_Total_01(C_ITEM) //Bei Lutero
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtTotal;

	visual 					=	"ItRi_Prot_Total_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_ItRi_Prot_Total_01;
	on_unequip				= 	UnEquip_ItRi_Prot_Total_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Pierœcieñ wiecznych zwyciêstw";
	
	TEXT[1]			= NAME_Prot_Magic;
	COUNT[1]		= Ri_TProtMage;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= Ri_TProtFire;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= Ri_TProtPoint;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= Ri_TProtEdge;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Total_01()
	{
	self.protection [PROT_EDGE] 	+=   Ri_TProtEdge;
	self.protection [PROT_BLUNT]	+=   Ri_TProtEdge;
	self.protection [PROT_POINT]	+=   Ri_TProtPoint;
 	self.protection [PROT_FIRE]     +=   Ri_TProtFire;
	self.protection [PROT_MAGIC]    +=   Ri_TProtMage;
	};

	FUNC VOID UnEquip_ItRi_Prot_Total_01()
	{
	self.protection [PROT_EDGE] 	-=   Ri_TProtEdge;
	self.protection [PROT_BLUNT]	-=   Ri_TProtEdge;
	self.protection [PROT_POINT]	-=   Ri_TProtPoint;
 	self.protection [PROT_FIRE]     -=   Ri_TProtFire;
	self.protection [PROT_MAGIC]    -=   Ri_TProtMage;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Prot_Total_02(C_ITEM) //bei Lutero ab Kapitel 4 zu kaufen
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtTotal02;

	visual 					=	"ItRi_Prot_Total_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_ItRi_Prot_Total_02;
	on_unequip				= 	UnEquip_ItRi_Prot_Total_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Pierœcieñ nietykalnoœci";
	
	TEXT[1]			= NAME_Prot_Magic;
	COUNT[1]		= Ri_TProtMage02;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= Ri_TProtFire02;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= Ri_TProtPoint02;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= Ri_TProtEdge02;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Prot_Total_02()
	{
	self.protection [PROT_EDGE] 	+=   Ri_TProtEdge02;
	self.protection [PROT_BLUNT]	+=   Ri_TProtEdge02;
	self.protection [PROT_POINT]	+=   Ri_TProtPoint02;
 	self.protection [PROT_FIRE]     +=   Ri_TProtFire02;
	self.protection [PROT_MAGIC]    +=   Ri_TProtMage02;
	};

	FUNC VOID UnEquip_ItRi_Prot_Total_02()
	{
	self.protection [PROT_EDGE] 	-=   Ri_TProtEdge02;
	self.protection [PROT_BLUNT]	-=   Ri_TProtEdge02;
	self.protection [PROT_POINT]	-=   Ri_TProtPoint02;
 	self.protection [PROT_FIRE]     -=   Ri_TProtFire02;
	self.protection [PROT_MAGIC]    -=   Ri_TProtMage02;
	};
	
/******************************************************************************************/
		INSTANCE ItRi_Dex_01(C_Item) //bei Vatras Kap2. 
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Dex;

	visual 					=	"ItRi_Dex_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Dex_01;
	on_unequip				=	UnEquip_ItRi_Dex_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Pierœcieñ zdolnoœci";
	
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= Ri_Dex;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Dex_01()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,+ Ri_Dex );
	};


	FUNC VOID UnEquip_ItRi_Dex_01()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,- Ri_Dex );
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Dex_02(C_Item)//Joly:in OW Nähe Alter DT
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Dex02;

	visual 					=	"ItRi_Dex_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Dex_02;
	on_unequip				=	UnEquip_ItRi_Dex_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ zrêcznoœci";

	TEXT[2]					= 	NAME_Bonus_Dex;
	COUNT[2]				= 	Ri_Dex02;
	
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Dex_02()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,+ Ri_Dex02 );
	};


	FUNC VOID UnEquip_ItRi_Dex_02()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,- Ri_Dex02 );
	};


/******************************************************************************************/
		INSTANCE ItRi_Hp_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Hp;

	visual 					=	"ItRi_Hp_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Hp_01;
	on_unequip				=	UnEquip_ItRi_Hp_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ ¿ycia";
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= Ri_Hp;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Hp_01()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
	};

	FUNC VOID UnEquip_ItRi_Hp_01()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] -Ri_Hp;
		if self.attribute [ATR_HITPOINTS]> Ri_Hp+1
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Hp_02(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Hp02;

	visual 					=	"ItRi_Hp_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Hp_02;
	on_unequip				=	UnEquip_ItRi_Hp_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ ¿ywotnoœci";
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= Ri_Hp02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Hp_02()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp02; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp02;
	};

	FUNC VOID UnEquip_ItRi_Hp_02()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX]- Ri_Hp02;
		if self.attribute [ATR_HITPOINTS]> Ri_Hp02+1
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp02;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Str_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Strg;

	visual 					=	"ItRi_Str_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Str_01;
	on_unequip				=	UnEquip_ItRi_Str_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ mocy";
	
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= Ri_Strg;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Str_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,+ Ri_Strg );
	};

	FUNC VOID UnEquip_ItRi_Str_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,- Ri_Strg );
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Str_02(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Strg02;

	visual 					=	"ItRi_Str_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Str_02;
	on_unequip				=	UnEquip_ItRi_Str_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ si³y";
	
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= Ri_Strg02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Str_02()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,+Ri_Strg02 );
	};

	FUNC VOID UnEquip_ItRi_Str_02()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Strg02 );
	};

/******************************************************************************************/
	INSTANCE ItRi_Mana_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Mana;

	visual 					=	"ItRi_Mana_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Mana_01;
	on_unequip				=	UnEquip_ItRi_Mana_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ magii";
	
	TEXT[2]					= NAME_Bonus_Mana;
	COUNT[2]				= Ri_Mana;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Mana_01()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana;
	};


	FUNC VOID UnEquip_ItRi_Mana_01()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana;
		
		if self.attribute [ATR_MANA]	>= Ri_Mana
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana;
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
		
		
	};
/******************************************************************************************/
INSTANCE ItRi_Mana_02(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Mana02;

	visual 					=	"ItRi_Mana_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Mana_02;
	on_unequip				=	UnEquip_ItRi_Mana_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ gwiezdnej mocy";
	
	TEXT[2]					= NAME_Bonus_Mana;
	COUNT[2]				= Ri_Mana02;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Mana_02()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_Mana02;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_Mana02;
		
	};


	FUNC VOID UnEquip_ItRi_Mana_02()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_Mana02;
		
		if self.attribute [ATR_MANA]	>= Ri_Mana02
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_Mana02;
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
		
	};	
/******************************************************************************************/
		INSTANCE ItRi_Hp_Mana_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_HpMana;

	visual 					=	"ItRi_Hp_Mana_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Hp_Mana_01;
	on_unequip				=	UnEquip_ItRi_Hp_Mana_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ oœwiecenia";
	
	TEXT[2]					= NAME_Bonus_Mana;
	COUNT[2]				= Ri_HpMana_Mana;
	TEXT[3] 				= NAME_Bonus_HP;
	COUNT[3]				= Ri_HpMana_HP;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Hp_Mana_01()
	{
		
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + Ri_HpMana_Mana;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + Ri_HpMana_Mana;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_HpMana_Hp;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_HpMana_Hp;
		
	};


	FUNC VOID UnEquip_ItRi_Hp_Mana_01()
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - Ri_HpMana_Mana;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_HpMana_Hp;
		
		if (self.attribute [ATR_HITPOINTS] > Ri_HpMana_Hp+1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_HpMana_Hp;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
		if self.attribute [ATR_MANA]	>= Ri_HpMana_Hp
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Ri_HpMana_Hp;
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
		
/******************************************************************************************/
	INSTANCE ItRi_Dex_Strg_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_DexStrg;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Dex_Strg_01;
	on_unequip				=	UnEquip_ItRi_Dex_Strg_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Pierœcieñ mocy";
	
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= 4;
	TEXT[3] 				= NAME_Bonus_Dex;
	COUNT[3]				= 4;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Dex_Strg_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH, Ri_DexStrg_Strg);
		Npc_ChangeAttribute(self,ATR_DEXTERITY, Ri_DexStrg_Dex);
	};

	FUNC VOID UnEquip_ItRi_Dex_Strg_01()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,- Ri_DexStrg_Strg);
		Npc_ChangeAttribute(self,ATR_DEXTERITY, - Ri_DexStrg_Dex);
	};
		
