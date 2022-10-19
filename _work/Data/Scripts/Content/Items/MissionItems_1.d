//****************************************************************************
//			Schl¸ssel f¸r Xardas Truhe
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Xardas(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od truhlice,";
	TEXT[3]				=   "kter· pat¯Ì Xardasovi.";
	
};
//**********************************************************************************
//	Canthars Kompromittierender Brief f¸r Sarah die H‰ndlerin
//----------------------------------------------------------------------------------

INSTANCE ItWr_Canthars_KomproBrief_MIS		(C_Item)
{
	name 				=	"Dopis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Canthars_KomproBrief;
	scemeName			=	"MAP";
	description			= 	"Canthar˘v dopis obchodnici Sarah.";
};
func void Use_Canthars_KomproBrief ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_Book);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "     PoslednÌ varov·nÌ"								);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "        Uû jsem ti nÏkolikr·t p¯·telsky"				);
					Doc_PrintLine	(nDocID,  0, "        p¯ipomÌnal, ûe nutnÏ pot¯ebuji"				);
					Doc_PrintLine	(nDocID,  0, "        ty zbranÏ, kterÈ jsem si"				);
					Doc_PrintLine	(nDocID,  0, "        u tebe p¯ed t˝dnem"			);
					Doc_PrintLine	(nDocID,  0, "        objednal."										);
					Doc_PrintLine	(nDocID,  0, "        Jestli mi ve velmi brzkÈ dobÏ"		);
					Doc_PrintLine	(nDocID,  0, "        nepod·ö û·dnou zpr·vu, budu se k tobÏ"			);
					Doc_PrintLine	(nDocID,  0, "        muset zaËÌt chovat trochu jinak. Douf·m,"			);
					Doc_PrintLine	(nDocID,  0, "        ûe si rozumÌme!!!!!!!!!!!!"					);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "            Onar"										);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
					
	
}; 
//****************************************************************************
//			Rods Schwert
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMw_2h_Rod (C_Item)
{	
	name 				=	"Rod˘v obouruËnÌ meË";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hSchwert;

	damageTotal  		= 	Damage_Rod;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Rod;
	visual 				=	"ItMw_035_2h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//***************
//Coragons Silber
//***************
INSTANCE ItMi_CoragonsSilber (C_Item)
{
	name 				=	"Coragonovo st¯Ìbro";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverCup;

	visual 				=	"ItMi_SilverCup.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[3]				= 	"";	
	TEXT[4]				= 	"";	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//*******************************
//P‰ckchen f¸r Thekla von Sagitta
//*******************************
INSTANCE ItMi_TheklasPaket (C_Item)
{
	name 				=	"Theklina parcela";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_TheklasPacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_TheklasPacket ()
{
	CreateInvItems (hero,ItPl_Mana_Herb_01 ,3);
	CreateInvItems (hero,ItPl_Health_Herb_02 ,1);
	CreateInvItems (hero,ItPl_Speed_Herb_01 ,1);
	CreateInvItems (hero,ItPl_Blueplant ,2);

	Print (PRINT_GotPlants);
};

//*******************************
//Marias Goldener Teller
//*******************************
instance ItMi_MariasGoldPlate (C_Item)
{
	name 				=	"TÏûk˝ zlat˝ t·c";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldPlate;

	visual 				=	"ItMi_GoldPlate.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Na t·cu jsou vyvedena"; 
	TEXT[3]				= 	"jmÈna Onar a Maria.";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//*******************************
//Valentinos Ring
//*******************************

INSTANCE ItRi_ValentinosRing(C_Item) //bei Cassia als Belohnung
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_ProtEdge;

	visual 					=	"ItRi_Prot_Edge_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ValentinosRing;
	on_unequip				=	UnEquip_ValentinosRing;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= "Valentin˘v prsten";

	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= Ri_ProtEdge;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ValentinosRing()
	{
		self.protection [PROT_EDGE] 		+=  Ri_ProtEdge;
		self.protection [PROT_BLUNT]		+=  Ri_ProtEdge;
	};

	FUNC VOID UnEquip_ValentinosRing()
	{
		self.protection [PROT_EDGE] 		-=  Ri_ProtEdge;
		self.protection [PROT_BLUNT]		-=  Ri_ProtEdge;
	};

//****************************************************************************
//			Schl¸ssel f¸r Dexter Truhe
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Dexter(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od truhlice,";
	TEXT[3]				=   "kter· pat¯Ì Dexterovi.";
	
};
//**********************************************************************************
//	Constantinos Kr‰uterliste
//----------------------------------------------------------------------------------

INSTANCE ItWr_Kraeuterliste (C_Item)
{
	name 				=	"Seznam";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Kraeuterliste;
	scemeName			=	"MAP";
	description			= 	"Constantin˘v seznam bylin.";
};
func void Use_Kraeuterliste ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "AlchymistickÈ byliny"	);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "LÈËiv· rostlina"	);
					Doc_PrintLine	( nDocID,  0, "LÈËiv· bylina"	);
					Doc_PrintLine	( nDocID,  0, "LÈËiv˝ ko¯en"    );
					Doc_PrintLine	( nDocID,  0, "Ohniv· kop¯iva"  );
					Doc_PrintLine	( nDocID,  0, "OhnivÈ b˝lÌ"  );
					Doc_PrintLine	( nDocID,  0, "Ohniv˝ ko¯en"  );
					Doc_PrintLine	( nDocID,  0, "GoblinÌ bobule"     );
					Doc_PrintLine	( nDocID,  0, "DraËÌ ko¯en");
					Doc_PrintLine	( nDocID,  0, "ChÚapavËÌ b˝lÌ"   );
					Doc_PrintLine	( nDocID,  0, "LuËnÌ pohanka"      	);
					Doc_PrintLine	( nDocID,  0, "Kr·lovsk˝ öùovÌk"       );
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Pozn·mka: Aù ti ty byliny obstar· nÏjak˝ schopn˝ uËeÚ, aspoÚ pozn·ö, jestli opravdu za nÏco stojÌ."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "ZdravÌ Zuris."						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus
				
					Doc_Show		( nDocID );
}; 
//**********************************************************************************
//Neoras Mana Rezept
//----------------------------------------------------------------------------------

INSTANCE ItWr_ManaRezept (C_Item)
{
	name 				=	"Recept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	20;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_ManaRezept;
	scemeName			=	"MAP";
	description			= 	"Recept na esenci magie.";
};
func void Use_ManaRezept ()
{   
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
	
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "MagickÈ lektvary"	);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "K p¯ÌpravÏ magick˝ch lektvar˘ pot¯ebuje alchymista tyto vÏci:");
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Ohniv· kop¯iva");
					Doc_PrintLine	( nDocID,  0, "OhnivÈ b˝lÌ");
					Doc_PrintLine	( nDocID,  0, "Ohniv˝ ko¯en");
					Doc_PrintLines	( nDocID,  0, "D·le se musÌ postarat, aby mu nechybÏlo toto:"						);
					Doc_PrintLine	( nDocID,  0, "LuËnÌ pohanka"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mistr Neoras"						);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus
				
					Doc_Show		( nDocID );
}; 


// **************************************************************************************

INSTANCE ItWr_Passierschein	(C_Item)
{
	name 				=	"Propustka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	50;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePassierschein;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"S tÏmito dokumenty mne";
	TEXT[4]				=   "str·ûe pustÌ do mÏsta.";
};
func void UsePassierschein ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1 );
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_BookHeadline);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "     Propustka"								);
					Doc_PrintLine	(nDocID,  0, "            Khorinis    "								);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "        Nositel tohoto dokumentu"					);
					Doc_PrintLine	(nDocID,  0, "        se m˘ûe po neomezenou dobu volnÏ"		);
					Doc_PrintLine	(nDocID,  0, "        pohybovat v dolnÌ Ë·sti Khorinidu."		);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "            Larius,"										);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "            kr·lovsk˝ mÌstodrûÌcÌ"						);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
};

//****************************************************************************
//				Kraut Paket f¸r MIS_ANDRE_WAREHOUSE 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_HerbPaket(C_Item)
{
	name 				=	"BalÌËek tr·vy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	
	material 			=	 MAT_LEATHER;
	
	description			= 	name;
	TEXT[2]				= 	"TÏûk˝ a mÏkk˝ balÌËek, kter˝";
	TEXT[3]				=	"je cÌtit tr·vou z baûin.";
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	200;
	
};
//****************************************************************************
//				Lagerhaus Schl¸ssel f¸r MIS_ANDRE_WAREHOUSE 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Storage(C_Item)
{
	name 				=	"KlÌË od skladiötÏ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od p¯ÌstavnÌho";
	TEXT[3]				=   "skladiötÏ.";
	
};
const int HP_Hering = 20;
//****************************************************************************
//				Alternativer Fish - danke Levelbereich !
//			---------------------------------------------
//****************************************************************************
INSTANCE ItFo_SmellyFish (C_Item)
{	
	name 				=	"SleÔ";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	0;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_SmellyFish;

	description			= 	"SleÔ (herynek).";
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Hering;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_Fish;
};

	FUNC VOID Use_SmellyFish()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Hering);
	};
//****************************************************************************
//				Komischer Fisch von den Banditen mit Nachricht an Halvor 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItFo_HalvorFish_MIS (C_Item)
{	
	name 				=	"Podivn· ryba";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	0;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_HalvorFish;

	description			= 	"Tato ryba vypad· zvl·ötnÏ.";
	TEXT[2]				= 	"S touto rybou nenÌ nÏco v po¯·dku.";		
	TEXT[3]				= 	"Jako by ji nÏkdo roz¯Ìzl a pak zaöil.";
};

	FUNC VOID Use_HalvorFish()
	{
		CreateInvItems (hero,ItWr_HalvorMessage ,1);
		Print	(PRINT_FishLetter);
	};
//****************************************************************************
//				Nachricht von Halvor an die Banditen, im Fisch versteckt
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_HalvorMessage	(C_Item)
{
	name 				=	"P·chnoucÌ zpr·va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseHalvorMessage;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[2]				=   "Tato zpr·va byla ukryta v rybÏ.";
};
func void UseHalvorMessage ()
{   
		Knows_Halvor = TRUE;
	
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_Book);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "    Koukejte drûet hubu a krok!"				);
					Doc_PrintLine	(nDocID,  0, "    Str·ûe zaËÌnajÌ mÌt podez¯enÌ."				);
					Doc_PrintLine	(nDocID,  0, "    NedÏlejte nic, dokud se v·m zase neozvu!");
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "                                                   Halvor");
					Doc_Show		(nDocID);
}; 
//****************************************************************************
//				Komischer Fisch von Halvor als Schweigegeld
//			---------------------------------------------
//****************************************************************************
/*
INSTANCE ItFo_HalvorFish (C_Item)
{	
	name 				=	"Seltsamer Fisch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	0;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_HalvorFish;

	description			= 	"Seltsam aussehender Fisch";
	TEXT[2]				= 	"Irgendwas ist in diesem Fisch versteckt";		
	
};

	FUNC VOID Use_HalvorFish()
	{
		CreateInvItems (hero,ItMi_Nugget ,1);
		PrintScreen		(PRINT_FoundOreNugget, -1, YPOS_LEVELUP, FONT_ScreenSmall, 2);
	};
*/
//****************************************
//	Alriks Schwert
//****************************************

INSTANCE ItMw_AlriksSword_Mis (C_Item)
{	
	name 				=	"Alrik˘v meË";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_MISSION|ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	value_Alrik;

	damageTotal  		= 	damage_Alrik;
	damagetype 			=	DAM_EDGE;
	range    			=  	range_Alrik;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Alrik;
	visual 				=	"ItMw_025_1h_Sld_Sword_01.3DS";
	
	on_equip			=	Equip_AlriksSword;
	on_unequip			=	UnEquip_AlriksSword;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
	
	func void Equip_AlriksSword()
	{
		B_AddFightSkill (self, NPC_TALENT_1H, 10);
	};
	
	func void UnEquip_AlriksSword()
	{
		B_AddFightSkill (self, NPC_TALENT_1H, -10);
	};

//****************************************************************************
//				Botschaft von Vatras an die Magier des Feuers
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_VatrasMessage	(C_Item)
{
	name 				=	"ZapeËetÏn· zpr·va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseVatrasMessage;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "Zpr·va od Vatrase";
	TEXT[3]				=   "pro m·gy ohnÏ.";
};
func void UseVatrasMessage ()
{   
		
		CreateInvItems (self, ItWr_VatrasMessage_Open,1);
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  1 );                         
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 	); 
					Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   	);  
					Doc_PrintLine	( nDocID,  0, "Mil˝ Isgarothe,"					);
					Doc_PrintLines	( nDocID,  0, "CÌtÌm, ûe tu s n·mi dlÌ jeötÏ jin· moc, kter· den ode dne sÌlÌ."					);
					Doc_PrintLines	( nDocID,  0, "JejÌ podstata mi ale zcela unik·. ée by se k n·m blÌûili Beliarovi vazalovÈ?"					);
					Doc_PrintLines	( nDocID,  0, "Moûn· se pletu, ale vÏ¯Ìm, ûe by bylo moudrÈ tuhle vÏc svÏ¯it otci Pyrokarovi."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Nechù vyslyöÌ naöe modlitby."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Vatras"					);
					Doc_Show		( nDocID );
}; 
//****************************************************************************
//				Botschaft von Vatras an die Magier des Feuers
//				Das Siegel wurde geˆffnet		
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_VatrasMessage_Open	(C_Item)
{
	name 				=	"Zpr·va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseVatrasMessageOpen;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[2]				=   "Zpr·va od Vatrase";
	TEXT[3]				=   "pro m·gy ohnÏ.";
	TEXT[4]				=   "PeËeù byla zlomena.";
};
func void UseVatrasMessageOpen ()
{   
	var int nDocID;
		
		
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  1 );                         
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 	); 
					Doc_SetFont 	( nDocID, -1, FONT_Book		   		); 	
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   	);  
					Doc_PrintLine	( nDocID,  0, "Mil˝ Isgarothe,"					);
					Doc_PrintLines	( nDocID,  0, "CÌtÌm, ûe tu s n·mi dlÌ jeötÏ jin· moc, kter· den ode dne sÌlÌ."					);
					Doc_PrintLines	( nDocID,  0, "JejÌ podstata mi ale zcela unik·. ée by se k n·m blÌûili Beliarovi vazalovÈ?"					);
					Doc_PrintLines	( nDocID,  0, "Moûn· se pletu, ale vÏ¯Ìm, ûe by bylo moudrÈ tuhle vÏc svÏ¯it otci Pyrokarovi."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Nechù vyslyöÌ naöe modlitby."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Vatras"					);
					Doc_Show		( nDocID );
}; 
//****************************************************
//		Hotelschl¸ssel
//****************************************************
INSTANCE ItKe_Hotel(C_Item)
{
	name 				=	"KlÌË od pokoje";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od hostinskÈho";
	TEXT[3]				=   "pokoje.";
	
};
//****************************************************
//		Schl¸ssel zur Diebesgilde
//****************************************************
INSTANCE ItKe_ThiefGuildKey_MIS (C_Item)
{
	name 				=	"Rezav˝ klÌË";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Tento klÌË poznamenala slan· mo¯sk· voda.";
	
};
//****************************************************
//		Schl¸ssel zur Diebesgilde vom Hotel
//****************************************************
INSTANCE ItKe_ThiefGuildKey_Hotel_MIS (C_Item)
{
	name 				=	"Rezav˝ klÌË";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od sklepa hostince.";
	
};
//****************************************************
//		Pfortenschl¸ssel Tempel von Innos
//****************************************************
INSTANCE ItKe_Innos_MIS(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od port·lu, kter˝ vede";
	TEXT[3]				=   "do Innosovy svatynÏ.";
	
};
//****************************************************************************
//			Schl¸ssel Vorratskammer Kloster
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_KlosterSchatz(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od kl·öternÌ";
	TEXT[3]				=   "pokladnice.";
	
};
//****************************************************************************
//			Schl¸ssel Vorratskammer Kloster
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_KlosterStore(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od kl·öternÌ";
	TEXT[3]				=   "spiûÌrny.";
	
};
//****************************************************************************
//			Schl¸ssel Schlafgemach Player
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_KDFPlayer(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od kl·öternÌ";
	TEXT[3]				=   "sÌnÏ.";
	
};
//****************************************************************************
//			Schl¸ssel Bibliothek Kloster
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_KlosterBibliothek(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od kl·öternÌ";
	TEXT[3]				=   "knihovny.";
	
};
//****************************************************************************
//			Extra Wurst Gorax Mission
//			---------------------------------------------
//****************************************************************************
INSTANCE ItFo_Schafswurst (C_Item)
{	
	name 				=	"Skopov· klob·sa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Sausage;
	
	visual 				=	"ItFo_Sausage.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Schafswurst;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Sausage;
	TEXT[5]				= 	NAME_Value;			COUNT[5]	= Value_Sausage;

};

	FUNC VOID Use_Schafswurst()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Sausage);
	};
/******************************************************************************************/
INSTANCE ItPo_Perm_LittleMana(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	150;	

	visual 			=	"ItPo_Perm_Mana.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_LittleMana;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION"; 

	description		= 	"Esence ducha";
	TEXT[1]			= 	NAME_Bonus_ManaMax;			
	COUNT[1]		= 	3;
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value;
};

	FUNC VOID UseItPo_LittleMana()
	{
		B_RaiseAttribute	(self, ATR_MANA_MAX,	3);
		Npc_ChangeAttribute	(self, ATR_MANA,	3);
	};
//****************************************************
//		Hammer Innos, f¸r Golem Pr¸fung 
//****************************************************
INSTANCE Holy_Hammer_MIS (C_Item)
{	
	name 				=	"Posv·tnÈ kladivo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_MISSION |ITEM_2HD_AXE ;	
	material 			=	MAT_METAL;

	value 				=	Value_HolyHammer;

	owner				=	Nov_608_Garwig;

	damageTotal  		= 	Damage_HolyHammer;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_HolyHammer;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_HolyHammer;
	visual 				=	"ItMw_030_2h_kdf_hammer_01.3DS";

	description			=  name;
	//FIXME_Noki: TAB
	TEXT[2]				=  "PoökozenÌ:                 ??";
	TEXT[3] 			=  "Poûadovan· sÌla:        ??";
	TEXT[4] 			=  "ObouruËnÌ zbraÚ";
	TEXT[5]				=  "Cena:  nelze urËit";					
	/*
	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	
	
	Die Konstanten stehen in der Tuning_Melee_Weapons.d M.F.
	*/
};

//****************************************************************************
//			Schl¸ssel f¸r die Truhe in der Magierhˆhle
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_MagicChest(C_Item)
{
	name 				=	"Star˝ klÌË";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION |ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Star˝ ûelezn˝ klÌË.";
	TEXT[3]				=   "Mohl by pat¯it k nÏjakÈmu";
	TEXT[4]				=	"visacÌmu z·mku.";
};
//****************************************************************************
//			gef‰lschter Passierschein von Lee 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_Passage_MIS	(C_Item)
{
	name 				=	"N·vrh mÌrovÈ smlouvy s paladiny";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePassage;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"S touto zpr·vou budu moci";
	TEXT[4]				=   "navötÌvit lorda Hagena.";
};
func void UsePassage ()
{   
		var int nDocID;
		
		

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

					Doc_PrintLine	( nDocID,  0, ""								);
					Doc_PrintLine	( nDocID,  0, "Velev·ûen˝ lorde Hagene,"			);
					Doc_PrintLine	( nDocID,  0, ""								);
					Doc_PrintLines	( nDocID,  0, "Oba vÌme, jak· je Vaöe situace, a proto navrhuji n·sledujÌcÌ ujedn·nÌ:" 	);
					Doc_PrintLines	( nDocID,  0, "ZajistÏte mnÏ i m˝m muû˘m bez˙honnost p¯ed Innosem i p¯ed kr·lem"				);
					Doc_PrintLines	( nDocID,  0, "a my v·m na opl·tku pom˘ûeme ochraÚovat mÏsto i okolnÌ zemÏ." );
					Doc_PrintLines	( nDocID,  0, "J· s·m krom toho osobnÏ dohlÈdnu, aby se moji lidÈ drûeli d·l od okolnÌch statk˘ - samoz¯ejmÏ vyjma toho Onarova, kde budeme sÌdlit i nad·le." );
					Doc_PrintLines	( nDocID,  0, "VÌm, ûe na palubÏ lodi, kterou vypravujete k pevninÏ, je dost mÌsta pro mÏ i pro nÏkterÈ z m˝ch muû˘. Proto chci plout s V·mi." );
					Doc_PrintLines	( nDocID,  0, "ProsÌm, rozhodnÏte se moud¯e." );
					Doc_PrintLine	( nDocID,  0, ""								);
					Doc_PrintLine	( nDocID,  0, "podeps·n   gener·l Lee"		);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   				);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus
				
					Doc_Show		( nDocID );
		
}; 
//****************************************************************************
//			Nachricht des Banditen -> Plot Wo ist die Armee?
//			---------------------------------------------
//****************************************************************************

INSTANCE ItWr_BanditLetter_MIS	(C_Item)
{
	name 				=	"Zpr·va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBanditLetter;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"";
	TEXT[4]				=   "";
};
func void UseBanditLetter ()
{   
		var int nDocID;
	
		/*
		if (Bdt13_Dexter_verraten == FALSE)
		{
			Bdt13_Dexter_verraten = TRUE;
		
			Log_CreateTopic (Topic_Bandits,LOG_MISSION);
			Log_SetTopicStatus (Topic_Bandits,LOG_RUNNING);
			B_LogEntry (Topic_Bandits,"Der Anf¸hrer der Banditen ist Dexter. Er versteckt sich bei einer Mine, beim Groﬂbauer.");
			MIS_Steckbriefe = LOG_RUNNING;
		};
		*/
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0); 
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "Zastav kaûdÈho muûe,"							);
					Doc_PrintLine	(nDocID,  0, " kter˝ p¯ich·zÌ z hor."						);
					Doc_PrintLine	(nDocID,  0, "Jestli na nÏkoho takovÈho narazÌö, pak"				);
					Doc_PrintLine	(nDocID,  0, " to bude nejspÌö n·ö star˝ zn·m˝."			);
					Doc_PrintLine	(nDocID,  0, "Dej si pozor, aù mu nenaletÌö -"				);
					Doc_PrintLine	(nDocID,  0, "    je to nebezpeËn˝ ËarodÏj."				);
					Doc_PrintLine	(nDocID,  0, "BuÔ st·le ve st¯ehu."						);
					Doc_PrintLine	(nDocID,  0, "     "											);
					Doc_PrintLine	(nDocID,  0, "Je moûnÈ, ûe se s nÌm spojÌ ten chl·pek,"		);
					Doc_PrintLine	(nDocID,  0, "    co ho hled·me.  "						);
					Doc_PrintLine	(nDocID,  0, "Spolu s tÌmhle dopisem ti posÌl·m"				);
					Doc_PrintLine	(nDocID,  0, "    t¯icet zlaù·k˘."							);
					Doc_PrintLine	(nDocID,  0, "DalöÌch t¯icet dostane ten,"				);
					Doc_PrintLine	(nDocID,  0, "    kdo toho chlapa zabije."							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "Jeho hlavu dones do starÈho dolu u statku.");
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ".....D."											);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
}; 
//****************************************************************************
//			Steckbrief vom Spieler
//			---------------------------------------------
//****************************************************************************
INSTANCE ItWr_Poster_MIS	(C_Item)
{
	name 				=	"Podobizna hledanÈho";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MULTI|ITEM_MISSION ;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePoster;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"Ten portrÈt je m˘j!";
	TEXT[4]				=   "";
};
FUNC VOID UsePoster()
{
	var int nDocID;
	nDocID 	= 	Doc_Create() ;		
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "Gesucht.TGA"  , 0 		); 	
	Doc_Show (nDocID);
};
//****************************************************************************
//				Banditen Truhen Schl¸ssel 
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Bandit(C_Item)
{
	name 				=	"KlÌË od truhlice";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË, kter˝ mÏl u sebe";
	TEXT[3]				=   "bandita.";
	
};

//****************************************************************************
//				Bospers Jagdbogen
//			---------------------------------------------
//****************************************************************************
INSTANCE ItRw_Bow_L_03_MIS (C_Item)
{
	name 				=	"Loveck˝ luk";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MISSION;
	material 			=	MAT_WOOD;

	value 				=	Value_Jagdbogen;

	damageTotal			=	Damage_Jagdbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Jagdbogen;
	visual 				=	"ItRw_Bow_L_03.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= "Bosper˘v loveck˝ luk.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//****************************************************************************
//				Constantinos Schutzring
//			---------------------------------------------
//****************************************************************************
INSTANCE ItRi_Prot_Point_01_MIS(C_Item)
{
	name 					=	"Constantin˘v prsten";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING|ITEM_MISSION;

	value 					=	Value_Ri_ProtPoint ;

	visual 					=	"ItRi_Prot_Point_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Prot_Point_01_MIS;
	on_unequip				=	UnEquip_ItRi_Prot_Point_01_MIS;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				=  "Prsten ochrany";
	
	TEXT[2]					= NAME_Prot_Point;
	COUNT[2]				= Ri_ProtPoint;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
		
};

	FUNC VOID Equip_ItRi_Prot_Point_01_MIS()
	{
	self.protection [PROT_POINT] 		+=  Ri_ProtPoint;
	};

	FUNC VOID UnEquip_ItRi_Prot_Point_01_MIS()
	{
	self.protection [PROT_POINT] 		-=  Ri_ProtPoint;
	};

//****************************************************************************
//				Eddas Statue
//			---------------------------------------------
//****************************************************************************
INSTANCE ItMi_EddasStatue (C_Item)
{
	name 				=	"Innosova socha";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI| ITEM_MISSION ;

	value 				=	50;

	visual 				=	"ItMi_InnosStatue.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Innosi, Pane spravedlnosti,";
	TEXT[3]				= 	"poûehnej mi, veÔ mne";
	TEXT[4]				= 	"a chraÚ mne ode vöeho zlÈho.";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//****************************************************************************
//				Crypta-Schl¸ssel
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_EVT_CRYPT_01(C_Item)
{
	name 				=	"Star˝ mosazn˝ klÌË";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od kostlivce v mÌstnosti 1";
	
};

INSTANCE ItKe_EVT_CRYPT_02(C_Item)
{
	name 				=	"Star˝ mosazn˝ klÌË";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od kostlivce v mÌstnosti 2";
	
};

INSTANCE ItKe_EVT_CRYPT_03(C_Item)
{
	name 				=	"Star˝ mosazn˝ klÌË";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od kostlivce v mÌstnosti 3";
	
};

const int VALUE_ITAR_PAL_SKEL	= 500;

INSTANCE ITAR_PAL_SKEL (C_Item)
{
	name 					=	"Star· rytÌ¯sk· zbroj";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_PAL_SKEL;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_H.3ds";
	visual_change 			=	"Armor_Pal_Skeleton.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

//****************************************************************************
//				Schl¸ssel zu Valentinos Truhe
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Valentino(C_Item)
{
	name 				=	"KlÌË od truhlice";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od Valentinovy";
	TEXT[3]				=   "truhlice.";
	
};
//****************************************************************************
//				Schl¸ssel zur Truhe OV Noname Typen
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Buerger(C_Item)
{
	name 				=	"KlÌË od truhlice";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Tohle leûelo na ¯Ìmse.";
	TEXT[3]				=   "";
	
};
//****************************************************************************
//				Schl¸ssel Richter Truhe
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Richter(C_Item)
{
	name 				=	"KlÌË od truhlice";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"KlÌË od Valentinovy";
	TEXT[3]				=   "truhlice.";
	
};
//****************************************************************************
//				Schl¸ssel Salandril
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Salandril(C_Item)
{
	name 				=	"KlÌË od truhlice";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"kter· pat¯Ì alchymistovi Salandrilovi.";
	TEXT[3]				=   "";
	
};

//****************************************************************************
//				Schl¸ssel Truhe ...wo die Paladine schlafen
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_PaladinTruhe(C_Item)
{
	name 				=	"KlÌË od truhlice";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Mal˝ mosazn˝ klÌËek";
	TEXT[3]				=   "z p¯Ìbytku paladin˘.";
	
};
//****************************************************************************
//				Diebsgilde Schatz (Insel)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_ThiefTreasure(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Mal˝ klÌËek";
};
//****************************************************************************
//				Diebsgilde Fingers T¸r
//			---------------------------------------------
//****************************************************************************
INSTANCE ItKe_Fingers(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Rezav˝ klÌË ode dve¯Ì";
	TEXT[3]				=   "do stok.";
	
};
//**********************************************************************************
//	Lehmars Schuldenbuch
//**********************************************************************************

INSTANCE ItWr_Schuldenbuch (C_ITEM)
{	
	name 					=	"Kniha z·vazk˘";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Lehmarova ˙ËetnÌ kniha.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseSchuldBuch;
};

	FUNC VOID UseSchuldBuch()
	{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								
					Doc_SetPages	( nDocID,  2 );                         

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); 
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages 
 					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Pohled·vky a z·vazky"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "J· mistr Thorben, khorinidsk˝ tesa¯, dluûÌm ctihodnÈmu Lehmarovi 200 zlaù·k˘.");
					Doc_PrintLine	( nDocID,  0, ""					);		
					Doc_PrintLine	( nDocID,  0, "             Thorben");
					Doc_PrintLine	( nDocID,  0, ""					);	
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "J· Coragon, khorinidsk˝ hostinsk˝, dluûÌm ctihodnÈmu Lehmarovi 150 zlaù·k˘.");
					Doc_PrintLine	( nDocID,  0, ""					);		
					Doc_PrintLine	( nDocID,  0, "             Coragon");										
					//Absatz
					Doc_PrintLine	( nDocID,  0, ""					);

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R‰nder des TGAs aus, links,oben,rechts,unten)
					//Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
					//Doc_PrintLine	( nDocID,  1, ""					);										
					//Doc_PrintLines( nDocID,  1, "StandardBuch Seite 2"	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "J· Hanna, khorinidsk· hostinsk·, dluûÌm ctihodnÈmu Lehmarovi 250 zlaù·k˘.");
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "               Hanna");
					//Absatz
					Doc_PrintLines	( nDocID,  1, "");
					Doc_Show		( nDocID );
};

//**********************************************************************************
//	Lehmars Schuldenbuch
//**********************************************************************************

INSTANCE ItPl_Sagitta_Herb_MIS (C_Item)
{	
	name 				=	"SluneËnÌ aloe";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Strength_Herb_01;

	visual 				=	"ItPl_Strength_Herb_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			= 	Value_Strength_Herb_01;
};


//****************************************************************************
//			Schl¸ssel f¸r die obernen Schlafzimmer in der Taverne (MITTE DER WELT!)
//			---------------------------------------------
//****************************************************************************
INSTANCE ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name 				=	"KlÌË od pokoje";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"v hospodÏ 'U MrtvÈ harpyje'.";
	TEXT[3]				=   "";
	
};

INSTANCE ItRw_DragomirsArmbrust_MIS (C_Item)
{
	name 				=	"Dragomirova kuöe";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	Value_LeichteArmbrust;

	damageTotal			= 	Damage_LeichteArmbrust;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Bolt;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_LeichteArmbrust;
	visual 				=	"ItRw_Crossbow_L_02.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_STR_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
