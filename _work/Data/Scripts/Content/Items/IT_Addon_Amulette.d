//------------------------------------------------------------------------------------------
//Amulette 
//------------------------------------------------------------------------------------------
//Constanten 									

const int Value_ItAm_Addon_Franco		= 1200;	
const int HP_ItAm_Addon_Franco			= 40;
const int STR_Franco					= 4;
const int DEX_Franco					= 4;
//------------------------------------------------------------------------------------------
const int Value_ItRi_Addon_Health_01  	  = 400;
const int Value_ItAm_Addon_Health 		  = 800;
                                                                                                                
const int Value_ItRi_Addon_Mana_01  	  = 1000;
const int Value_ItAm_Addon_Mana 		  = 2000;	
														
const int Value_ItRi_Addon_STR_01  		  = 500;	
const int Value_ItAm_Addon_STR 			  = 1000;																
                                           
//------------------------------------------------------------------------------------------
//	Artefakt Set der Heiler                                                                                            													
//------------------------------------------------------------------------------------------
const int  HP_Ring_Solo_Bonus			=	20; //EIN Ring alleine 
const int  HP_Ring_Double_Bonus			=   60; //ZWEITER RING
  		                                                                                    
const int  HP_Amulett_Solo_Bonus		=   40;	//Amulett alleine                  
const int  HP_Amulett_EinRing_Bonus		=   80;	//wenn schon ein Ring equipped ist 
const int  HP_Amulett_Artefakt_Bonus	=  160; //wenn schon beide Ringe equipped sind 	

//------------------------------------------------------------------------------------------
//	Artefakt Set der Priester                                   													
//------------------------------------------------------------------------------------------                                                               
const int  MA_Ring_Solo_Bonus			=	5;  //EIN Ring alleine                           
const int  MA_Ring_Double_Bonus			=   15; //ZWEITER RING                       		
  		                                                                                    
const int  MA_Amulett_Solo_Bonus		=   10;	//Amulett alleine
const int  MA_Amulett_EinRing_Bonus		=   20;	//wenn schon ein Ring equipped ist
const int  MA_Amulett_Artefakt_Bonus	=   40; //wenn schon beide Ringe equipped sind

//------------------------------------------------------------------------------------------
//	Artefakt Set der Krieger                                   													
//------------------------------------------------------------------------------------------                                                               


const int  STR_Ring_Solo_Bonus			=	5;  //EIN Ring alleine                           
const int  STR_Ring_Double_Bonus		=   15; //ZWEITER RING                       		
  		                                                                                    
const int  STR_Amulett_Solo_Bonus		=   10;	//Amulett alleine                          
const int  STR_Amulett_EinRing_Bonus	=   20;	//wenn schon ein Ring equipped ist         
const int  STR_Amulett_Artefakt_Bonus	=   40; //wenn schon beide Ringe equipped sind 	

//------------------------------------------------------------------------------------------
// Items 
//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
// Franco's Amulett
//------------------------------------------------------------------------------------------
	INSTANCE  ItAm_Addon_Franco(C_Item)  
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_ItAm_Addon_Franco;

	visual 			=	"ItAm_Hp_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Addon_Franco;
	on_unequip		=	UnEquip_ItAm_Addon_Franco;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 


	description		=  "Amulet Franka";

	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= STR_FRANCO;
	TEXT[3]			= NAME_Bonus_Dex;
	COUNT[3]		= DEX_FRANCO;
	TEXT[4]			= NAME_Bonus_HP;
	COUNT[4]		= HP_ItAm_Addon_Franco;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Addon_Franco()
	{
		self.attribute[ATR_STRENGTH] 		+= STR_FRANCO;
		self.attribute[ATR_DEXTERITY] 		+= DEX_FRANCO;
		self.attribute[ATR_HITPOINTS_MAX] 	+= HP_ItAm_Addon_Franco;
		self.attribute[ATR_HITPOINTS] 		+= HP_ItAm_Addon_Franco;
	};


	FUNC VOID UnEquip_ItAm_Addon_Franco()
	{
		self.attribute[ATR_STRENGTH] 		-= STR_FRANCO;
		self.attribute[ATR_DEXTERITY] 		-= DEX_FRANCO;
		self.attribute[ATR_HITPOINTS_MAX] 	-= HP_ItAm_Addon_Franco;	
		
		if (self.attribute[ATR_HITPOINTS] > (HP_ItAm_Addon_Franco + 2))
		{
			self.attribute [ATR_HITPOINTS] -= HP_ItAm_Addon_Franco;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};
	
//------------------------------------------------------------------------------------------
// Kumulatives Lebensenergie Amulett (Maya) Health
//------------------------------------------------------------------------------------------
	INSTANCE  ItAm_Addon_Health(C_Item)  //Balken Eingang zur Mine
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_ItAm_Addon_Health;

	visual 			=	"ItAm_Hp_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Addon_Health;
	on_unequip		=	UnEquip_ItAm_Addon_Health;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Amulet Uzdrowiciela";

	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= HP_Amulett_Solo_Bonus;
	 
	TEXT[3]			= PRINT_Addon_KUMU_01;
	TEXT[4]			= PRINT_Addon_KUMU_02;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Addon_Health()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_HP_ArtefaktValue();
		
		HP_Amulett_Equipped = TRUE;
		
		NewValue = C_HP_ArtefaktValue();
		
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
		
	};
	FUNC VOID UnEquip_ItAm_Addon_Health()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_HP_ArtefaktValue();
		
		HP_Amulett_Equipped = FALSE;
		
		NewValue = C_HP_ArtefaktValue();
		
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
		
	};
//------------------------------------------------------------------------------------------
// Kumulativer Lebensenergie Ring (Maya) Health 
//------------------------------------------------------------------------------------------
	INSTANCE  ItRi_Addon_Health_01 (C_Item)  //Entrance Ruine
{
	name 			=	NAME_Ring;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_RING;

	value 			=	Value_ItRi_Addon_Health_01;

	visual 			=	"ItRi_Prot_Total_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItRi_Addon_Health_01;
	on_unequip		=	UnEquip_ItRi_Addon_Health_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Pierœcieñ Uzdrowiciela";

	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= HP_Ring_Solo_Bonus;
	
	TEXT[3]			= PRINT_Addon_KUMU_01;
	TEXT[4]			= PRINT_Addon_KUMU_02;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Addon_Health_01()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_HP_ArtefaktValue();
		
		HP_Ring_1_Equipped = TRUE;
		
		NewValue = C_HP_ArtefaktValue();
		
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
		
	};
	FUNC VOID UnEquip_ItRi_Addon_Health_01()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_HP_ArtefaktValue();
		
		HP_Ring_1_Equipped = FALSE;
		
		NewValue = C_HP_ArtefaktValue();
		
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
		//aktuelle Hitpoints werden nicht gesteigert. (Sonst Heilmaschine)
	};
//---------------------------------------------------------------------------------------------------------
	INSTANCE  ItRi_Addon_Health_02 (C_Item)  //Höhle zum Canyon
{
	name 			=	NAME_Ring;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_RING;

	value 			=	Value_ItRi_Addon_Health_01;

	visual 			=	"ItRi_Prot_Total_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItRi_Addon_Health_02;
	on_unequip		=	UnEquip_ItRi_Addon_Health_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Pierœcieñ Uzdrowiciela";

	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= HP_Ring_Solo_Bonus;
	
	TEXT[3]			= PRINT_Addon_KUMU_01;
	TEXT[4]			= PRINT_Addon_KUMU_02;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Addon_Health_02()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_HP_ArtefaktValue();
		
		HP_Ring_2_Equipped = TRUE;
		
		NewValue = C_HP_ArtefaktValue();
		
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
		
	};
	FUNC VOID UnEquip_ItRi_Addon_Health_02()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_HP_ArtefaktValue();
		
		HP_Ring_2_Equipped = FALSE;
		
		NewValue = C_HP_ArtefaktValue();
		
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (NewValue - OldValue);
		
		
	};
//------------------------------------------------------------------------------------------
// Kumulatives Mana Amulett (Maya) MANA
//------------------------------------------------------------------------------------------
	INSTANCE  ItAm_Addon_MANA(C_Item)  //Joly: verteilt RAKEPLACE[19]
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_ItAm_Addon_MANA;

	visual 			=	"ItAm_Hp_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Addon_MANA;
	on_unequip		=	UnEquip_ItAm_Addon_MANA;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Amulet Kap³ana";

	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= MA_Amulett_Solo_Bonus;
	
	TEXT[3]			= PRINT_Addon_KUMU_01;
	TEXT[4]			= PRINT_Addon_KUMU_02;
	 
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Addon_MANA()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_MA_ArtefaktValue();
		
		MA_Amulett_Equipped = TRUE;
		
		NewValue = C_MA_ArtefaktValue();
		
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
		
	};
	FUNC VOID UnEquip_ItAm_Addon_MANA()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_MA_ArtefaktValue();
		
		MA_Amulett_Equipped = FALSE;
		
		NewValue = C_MA_ArtefaktValue();
		
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
		
	};
//------------------------------------------------------------------------------------------
// Kumulativer Mana Ring (Maya) 
//------------------------------------------------------------------------------------------
	INSTANCE  ItRi_Addon_MANA_01 (C_Item)  //Bloodhound mine
{
	name 			=	NAME_Ring;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_RING;

	value 			=	Value_ItRi_Addon_MANA_01;

	visual 			=	"ItRi_Prot_Total_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItRi_Addon_MANA_01;
	on_unequip		=	UnEquip_ItRi_Addon_MANA_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Pierœcieñ Kap³ana";

	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= MA_Ring_Solo_Bonus;
	
	TEXT[3]			= PRINT_Addon_KUMU_01;
	TEXT[4]			= PRINT_Addon_KUMU_02;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Addon_MANA_01()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_MA_ArtefaktValue();
		
		MA_Ring_1_Equipped = TRUE;
		
		NewValue = C_MA_ArtefaktValue();
		
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
		
	};
	FUNC VOID UnEquip_ItRi_Addon_MANA_01()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_MA_ArtefaktValue();
		
		MA_Ring_1_Equipped = FALSE;
		
		NewValue = C_MA_ArtefaktValue();
		
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
		
	};
//---------------------------------------------------------------------------------------------------------
	INSTANCE  ItRi_Addon_MANA_02 (C_Item)  //Senat
{
	name 			=	NAME_Ring;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_RING;

	value 			=	Value_ItRi_Addon_Mana_01;

	visual 			=	"ItRi_Prot_Total_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItRi_Addon_MANA_02;
	on_unequip		=	UnEquip_ItRi_Addon_MANA_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Pierœcieñ Kap³ana";

	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= MA_Ring_Solo_Bonus;
	
	TEXT[3]			= PRINT_Addon_KUMU_01;
	TEXT[4]			= PRINT_Addon_KUMU_02;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Addon_Mana_02()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_MA_ArtefaktValue();
		
		MA_Ring_2_Equipped = TRUE;
		
		NewValue = C_MA_ArtefaktValue();
		
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
		
	};
	FUNC VOID UnEquip_ItRi_Addon_Mana_02()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_MA_ArtefaktValue();
		
		MA_Ring_2_Equipped = FALSE;
		
		NewValue = C_MA_ArtefaktValue();
		
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (NewValue - OldValue);
		
		
	};
//------------------------------------------------------------------------------------------
// Kumulatives Stärke Amulett (Maya) 
//------------------------------------------------------------------------------------------
	INSTANCE  ItAm_Addon_STR(C_Item)  //feuerwaranhöhle strand
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_ItAm_Addon_STR;

	visual 			=	"ItAm_Hp_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_Addon_STR;
	on_unequip		=	UnEquip_ItAm_Addon_STR;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Amulet Wojownika";

	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= STR_Amulett_Solo_Bonus;
	
	TEXT[3]			= PRINT_Addon_KUMU_01;
	TEXT[4]			= PRINT_Addon_KUMU_02;
	 
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS		= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_Addon_STR()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_STR_ArtefaktValue();
		
		STR_Amulett_Equipped = TRUE;
		
		NewValue = C_STR_ArtefaktValue();
		
		self.protection[PROT_EDGE] += (NewValue - OldValue);
		self.protection[PROT_BLUNT]+= (NewValue - OldValue);
	};
	FUNC VOID UnEquip_ItAm_Addon_STR()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_STR_ArtefaktValue();
		
		STR_Amulett_Equipped = FALSE;
		
		NewValue = C_STR_ArtefaktValue();
		
		self.protection[PROT_EDGE] += (NewValue - OldValue);
		self.protection[PROT_BLUNT]+= (NewValue - OldValue);
		
	};
//------------------------------------------------------------------------------------------
// Kumulativer STR Ring (Maya) 
//------------------------------------------------------------------------------------------
	INSTANCE  ItRi_Addon_STR_01 (C_Item)  //Geschenk von Greg
{
	name 			=	NAME_Ring;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_RING;

	value 			=	Value_ItRi_Addon_STR_01;

	visual 			=	"ItRi_Prot_Total_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItRi_Addon_STR_01;
	on_unequip		=	UnEquip_ItRi_Addon_STR_01;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Pierœcieñ Wojownika";

	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= STR_Ring_Solo_Bonus;
	
	TEXT[3]			= PRINT_Addon_KUMU_01;
	TEXT[4]			= PRINT_Addon_KUMU_02;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Addon_STR_01()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_STR_ArtefaktValue();
		
		STR_Ring_1_Equipped = TRUE;
		
		NewValue = C_STR_ArtefaktValue();
		
		self.protection[PROT_EDGE] += (NewValue - OldValue);
		self.protection[PROT_BLUNT]+= (NewValue - OldValue);
		
	};
	FUNC VOID UnEquip_ItRi_Addon_STR_01()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_STR_ArtefaktValue();
		
		STR_Ring_1_Equipped = FALSE;
		
		NewValue = C_STR_ArtefaktValue();
		
		self.protection[PROT_EDGE] += (NewValue - OldValue);
		self.protection[PROT_BLUNT]+= (NewValue - OldValue);
		
	};
//---------------------------------------------------------------------------------------------------------
	INSTANCE  ItRi_Addon_STR_02 (C_Item)  //in Quarhodrons grab
{
	name 			=	NAME_Ring;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_RING;

	value 			=	Value_ItRi_Addon_STR_01;

	visual 			=	"ItRi_Prot_Total_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItRi_Addon_STR_02;
	on_unequip		=	UnEquip_ItRi_Addon_STR_02;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Pierœcieñ Wojownika";

	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= STR_Ring_Solo_Bonus;
	
	TEXT[3]			= PRINT_Addon_KUMU_01;
	TEXT[4]			= PRINT_Addon_KUMU_02;
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Addon_STR_02()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_STR_ArtefaktValue();
		
		STR_Ring_2_Equipped = TRUE;
		
		NewValue = C_STR_ArtefaktValue();
		
		self.protection[PROT_EDGE] += (NewValue - OldValue);
		self.protection[PROT_BLUNT]+= (NewValue - OldValue);
		
	};
	FUNC VOID UnEquip_ItRi_Addon_STR_02()
	{
		var int OldValue;
		var int NewValue;
		
		OldValue = C_STR_ArtefaktValue();
		
		STR_Ring_2_Equipped = FALSE;
		
		NewValue = C_STR_ArtefaktValue();
		
		self.protection[PROT_EDGE] += (NewValue - OldValue);
		self.protection[PROT_BLUNT]+= (NewValue - OldValue);
		
		
	};


