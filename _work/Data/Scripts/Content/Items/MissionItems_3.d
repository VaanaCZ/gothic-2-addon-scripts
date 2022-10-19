//********************************************
//	Das Auge Innos	(Das reparierte Auge, mit dem man mit den Drachen Spricht)
//********************************************

const int AM_EyeProtEdge	= 10;
const int AM_EyeProtPoint	= 10;
const int AM_EyeProtMage	= 20;
const int AM_EyeProtFire	= 30;

// -------------------------------------------

INSTANCE  ItMi_InnosEye_MIS (C_ITEM)
{
	name 				=	"Oko Innosa";

	mainflag 			=	ITEM_KAT_MAGIC;
	flags 				=	ITEM_AMULET|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_InnosEye_MIS.3DS";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description			= 	name;
	on_equip			=	Equip_InnosEye;
	on_unequip			=	UnEquip_InnosEye;

	TEXT	[0]			=	"Pulsuje energi¹.";

	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};
FUNC VOID Equip_InnosEye()	 
	{
		Wld_PlayEffect("spellFX_Innoseye",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("spellFX_LIGHTSTAR_RED",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		AI_PlayAni (self,"T_MAGRUN_2_HEASHOOT");	
		AI_StandUp (self);
		Snd_Play ("SFX_INNOSEYE"); 
		
		self.protection [PROT_EDGE]   += AM_EyeProtEdge;
		self.protection [PROT_BLUNT]  += AM_EyeProtEdge;
		self.protection [PROT_POINT]  += AM_EyeProtPoint;
		self.protection [PROT_FIRE]   += AM_EyeProtFire;
		self.protection [PROT_MAGIC]  += AM_EyeProtMage;		
		

		PrintScreen ("", -1, -1, FONT_Screen, 0);
		
	};

FUNC VOID UnEquip_InnosEye()
	{
		self.protection [PROT_EDGE]   -=  AM_EyeProtEdge;
		self.protection [PROT_BLUNT]  -=  AM_EyeProtEdge;
		self.protection [PROT_POINT]  -=  AM_EyeProtPoint;
		self.protection [PROT_FIRE]   -=  AM_EyeProtFire;
		self.protection [PROT_MAGIC]  -=  AM_EyeProtMage;	
	};

INSTANCE ItMi_InnosEye_Discharged_Mis (C_Item)	
{
	name 				=	"Oko Innosa"; 

	mainflag 			=	ITEM_KAT_MAGIC;
	flags 				=	ITEM_AMULET|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_InnosEye_MIS.3DS";	
	material 			=	MAT_STONE;

	description			= 	name;
	on_equip			=	Equip_ItMi_InnosEye_Discharged_Mis;
	TEXT	[0]			=	"Oko jest martwe i pozbawione blasku.";
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
};

INSTANCE ItMi_InnosEye_Broken_Mis (C_Item)	
{
	name 				=	"Oko Innosa"; 

	mainflag 			=	ITEM_KAT_MAGIC;
	flags 				=	ITEM_AMULET|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_InnosEye_MIS.3DS";  
	material 			=	MAT_STONE;

	description			= 	name;
	on_equip			=	Equip_ItMi_InnosEye_Broken_Mis;
	TEXT	[0]			=	TEXT_Innoseye_Setting;
	TEXT	[1]			=	TEXT_Innoseye_Gem;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
		
};  
func void Equip_ItMi_InnosEye_Broken_Mis()
{
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
};
//**********************************************************************************
//	Ermächtigungsschreiben für SC für Pyrokar, das Auge Innos rauszurücken.
//----------------------------------------------------------------------------------

INSTANCE ItWr_PermissionToWearInnosEye_MIS		(C_Item)
{
	name 				=	"List polecaj¹cy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_PermissionToWearInnosEye;
	scemeName			=	"MAP";
	description			= "List polecaj¹cy dla Pyrokara.";
};
func void Use_PermissionToWearInnosEye ()
{   
 
	var int nDocID;
		
			nDocID = 	Doc_Create		();
						Doc_SetPages	(nDocID,  1);
						Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
						Doc_SetFont		(nDocID, -1, FONT_Book);
						Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLines	(nDocID,  0, "Posiadacz tego listu ma zostaæ wpuszczony do œwiêtych sal klasztoru.");
						Doc_PrintLines	(nDocID,  0, "Oko Innosa ma mu zostaæ wydane w trybie natychmiastowym.");
						Doc_PrintLines	(nDocID,  0, "Niniejsze rozkazy wydajê jako zarz¹dca wyspy i reprezentant w³adzy królewskiej. Ich podstaw¹ prawn¹ jest uk³ad o podziale Koœcio³a Innosa z 2 roku Ognia.");
						Doc_PrintLines	(nDocID,  0, "Oczekujê zatem, ¿e zostan¹ one natychmiast wprowadzone w ¿ycie.");
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, "Niechaj Innos b³ogos³awi Króla"						);
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, "     Lord Hagen"								);
						Doc_Show		(nDocID );				
		
};

//**********************************************************************************
//	ItWr_XardasBookForPyrokar_Mis
//**********************************************************************************

INSTANCE ItWr_XardasBookForPyrokar_Mis (C_ITEM) 
{	
	name 					=	"Dwór Irdorath";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_02_05.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_XardasBookForPyrokar;
};

FUNC VOID Use_XardasBookForPyrokar()
{   
		Print (PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
		Snd_Play 	("MFX_FEAR_CAST" );
};


//**********************************************************************************
//	ItKe_CHEST_SEKOB_XARDASBOOK_MIS 		Xardas Schlüssel für die Truhe auf Sekobs Hof
//**********************************************************************************

INSTANCE ItKe_CHEST_SEKOB_XARDASBOOK_MIS (C_Item)
{
	name 				=	"Klucz Xardasa" ;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_02;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[0]				=   "do kufra na farmie Sekoba.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//**********************************************************************************
//	ItWr_CorneliusTagebuch_Mis 
//**********************************************************************************

INSTANCE ItWr_CorneliusTagebuch_Mis (C_ITEM) 
{	
	name 					=	"Dziennik";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Dziennik";
	TEXT	[0]				=	"Dziennik Corneliusa.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseCorneliusTagebuch;
};

	FUNC VOID UseCorneliusTagebuch()
	{   
		Cornelius_IsLiar = TRUE;
		B_LogEntry (TOPIC_RESCUEBENNET,"Oto dowód niewinnoœci Benneta.");	
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Jeœli Larius nadal bêdzie postêpowa³ w ten sposób, nic tu po mnie.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ostatniej nocy spotka³o mnie coœ dziwnego. Jeden z tych mê¿czyzn w czarnych kapturach z³o¿y³ mi wizytê. Podobno s¹ oni s³ugami z³a, jednak mój goœæ mia³ w sobie coœ, co budzi³o zaufanie. Niemal czu³em bij¹c¹ od niego moc, choæ kiedy przemówi³, jego g³os by³ spokojny.");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Zaoferowa³ mi 20.000 sztuk z³ota, jeœli doprowadzê do skazania jednego z najemników. Powiedzia³, ¿e nied³ugo zrozumiem, co mia³ na myœli."	);
					Doc_PrintLines	( nDocID,  1, "Oczywiœcie zgodzi³em siê od razu, ci najemnicy i tak nie zas³uguj¹ na nic lepszego. Gdyby nie oni, moje ¿ycie by³oby du¿o ³atwiejsze. A z³oto zapewni mi dobrobyt a¿ do koñca mych dni."					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Sta³o siê - aresztowali jednego z najemników. Zamierzam dotrzymaæ danego s³owa.");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

//**********************************************************************************
//	ITWR_DementorObsessionBook_MIS 			//Joly: DementorBuch, der Bessenheit, Ein NSC trägt dieses Buch mit sich, wenn er von einem Dementor kurzzeitig übernommen wurde.)
//**********************************************************************************

INSTANCE ITWR_DementorObsessionBook_MIS (C_ITEM) 
{	
	name 					=	"Almanach Opêtanych";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MULTI|ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_02_05.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_DementorObsessionBook;
};

	FUNC VOID Use_DementorObsessionBook()
{   
	Wld_PlayEffect("spellFX_Fear",  hero, hero, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
	SC_ObsessionCounter = 100;	
	B_SCIsObsessed (hero);

	if (hero.guild == GIL_KDF)
		{
			var int nDocID;
	
			nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "BOOK_MAGE_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "BOOK_MAGE_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					//1.Seite
		 			Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
	 				Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLines	( nDocID,  0, "edef Kon dirandorix"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "in Sparady bell "					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "el utoy"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Kho ray xaondron");
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "em piratoram endro"					);
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
	
					if (Kapitel >= 3)
					{
						Doc_PrintLine	(nDocID, 1, "          VINO"								);
						Doc_PrintLine	(nDocID, 1, "FERNANDO"										);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "     MALAK"									);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "BROMOR"										);
					};
					if (Kapitel >= 4)
					{
						Doc_PrintLine	(nDocID, 1, "          ENGROM"								);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "     RANDOLPH"									);
						Doc_PrintLine	(nDocID, 1, ""												);
					};
					if (Kapitel >= 5)
					{
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "          SEKOB"								);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "     BRUTUS"									);
						Doc_PrintLine	(nDocID, 1, ""												);
					};
					Doc_Show		( nDocID );
		};
};

//**********************************************************************************
//	ItWr_PyrokarsObsessionList
//**********************************************************************************

INSTANCE ItWr_PyrokarsObsessionList		(C_Item)
{
	name 				=	"Magiczny list Pyrokara";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_PyrokarsObsessionList;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_PyrokarsObsessionList ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Opêtani"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
	
					if (Kapitel >= 3)
					{
						Doc_PrintLine	( nDocID,  0, ""					);
						Doc_PrintLine	( nDocID,  0, ""					);
						Doc_PrintLine	( nDocID,  0, "FERNANDO"					);
						Doc_PrintLine	( nDocID,  0, ""					);
						Doc_PrintLine	( nDocID,  0, "VINO"	);
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLine	( nDocID,  0, "MALAK"					);
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLine	( nDocID,  0, "BROMOR"					);
					};
					if (Kapitel >= 4)
					{
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLine	( nDocID,  0, "ENGROM"	);
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLine	( nDocID,  0, "RANDOLPH");
					};
					if (Kapitel >= 5)
					{
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLine	( nDocID,  0, "SEKOB"	);
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLine	( nDocID,  0, "BRUTUS");
						Doc_PrintLine	( nDocID,  0, ""					);
						Doc_PrintLine	( nDocID,  0, ""					);
						Doc_PrintLine	( nDocID,  0, "");
						Doc_PrintLine	( nDocID,  0, ""					);
					};

					Doc_Show		( nDocID );

};




/******************************************************************************************/
//	Heiltrank für Hilda																	//
/******************************************************************************************/
INSTANCE ItPo_HealHilda_MIS(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI|ITEM_MISSION;

	value 			=	Value_HpEssenz;	

	visual 			=	"ItMi_Flask.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	Use_HealHilda;
	scemeName		=	"POTIONFAST";


	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Uzdrowienie czarnej gor¹czki";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Essenz;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpEssenz;
};

	FUNC VOID Use_HealHilda()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Essenz);
	};	

// *****************************************************
// 		Maleths verlorener Gehstock
// *****************************************************
INSTANCE ItMw_MalethsGehstock_MIS (C_Item)
{	
	name 				=	"Laska";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_VLKMace;

	damageTotal  		= 	Damage_VLKMace;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_VLKMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKMace;
	visual 				=	"Itmw_008_1h_pole_01.3ds";

	description			= 	name;
	TEXT[0]				= 	"Na ga³ce wygrawerowano";
	TEXT[1]				= 	"literê 'M'.";					

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// *****************************************************
// 		Maleths BanditenGeldbeutel
// *****************************************************

INSTANCE ItMi_MalethsBanditGold(C_Item)
{
	name 				=	"Sakwa pe³na z³ota!";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_MalethsBanditGold;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_MalethsBanditGold ()
{
	B_PlayerFindItem (ItMi_Gold,300);
};


// *****************************************************
// 		MoleratFett für "die Winde klemmt"
// *****************************************************

INSTANCE ItMi_Moleratlubric_MIS (C_Item)
{
	name 				=	"£ój kretoszczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pitch;

	visual 				=	"ItMi_Moleratlubric.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*****************************************************
//	Babos Brief
//*****************************************************

INSTANCE ItWr_BabosLetter_MIS		(C_Item)
{
	name 				=	"List do Babo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosLetter;
	scemeName			=	"MAP";
	description			= "List do Babo.";
};
func void Use_BabosLetter ()
{   
 
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Drogi Babo,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "pewnie zastanawiasz siê, jak napisa³yœmy ten list. Otó¿ zabra³yœmy wszystkie nasze oszczêdnoœci do Mistrza Marlasa i poprosi³yœmy, aby go dla nas napisa³. ¿yczymy ci wszystkiego najlepszego i przesy³amy ten obrazek jako prezent po¿egnalny - niechaj przypomina ci o nas podczas nocy, które spêdzisz w klasztorze.");
					Doc_PrintLines	( nDocID,  0, "Mamy nadziejê, ¿e lubisz takie obrazki.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Fehta i Bonka");
					
					Doc_Show		( nDocID );
					
			
		
};

//********************************************************
//	BabosPinup
//********************************************************

INSTANCE ItWr_BabosPinUp_MIS		(C_Item)
{
	name 				=	"Portret kobiety";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosPinUp;
	scemeName			=	"MAP";
	description			= "Portret nagiej kobiety.";
};
func void Use_BabosPinUp ()
{   
	var int nDocID;
	nDocID 	= 	Doc_Create() ;		
	Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
	Doc_SetPage 	( nDocID,  0, "Map_Pinup.TGA"  , 0 		); 	
	Doc_Show (nDocID);
		
};

//********************************************************
//	BabosDocs
//********************************************************

INSTANCE ItWr_BabosDocs_MIS	(C_Item)
{
	name 				=	"Zwitek papierów";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosDocs;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "Kilka dokumentów";
	TEXT[3]				=   "zwiniêtych w rulon.";
};
func void Use_BabosDocs ()
{   
		BaboSDocsOpen = TRUE;
		
		CreateInvItems (self, ItWr_BabosLetter_MIS,1);
		CreateInvItems (self, ItWr_BabosPinUp_MIS,1);
};

//*************************************************************
//	igaraz Schlüssel
//*************************************************************

INSTANCE ItKe_IgarazChest_Mis(C_Item)
{
	name 				=	"Klucz do kufra";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Klucz do kufra";
	TEXT[3]				=   "nale¿¹cego do Igaraza.";
	
}; 

//**********************************************************************************
//	ItWr_Astronomy_Mis
//**********************************************************************************

INSTANCE ItWr_Astronomy_Mis (C_ITEM) 
{	
	name 					=	"Boska moc gwiazd";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	400;

	visual 					=	"ItWr_Book_02_02.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Astronomy;
};

var int Astronomy_once;

FUNC VOID Use_Astronomy()
{   
		if (Astronomy_once == FALSE)
		{
			B_RaiseAttribute (self, ATR_MANA_MAX, 2);
			Print (PRINT_ReadAstronomy);
			Astronomy_once = TRUE;
		};
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "...jednak kiedy upór wo³u po³¹czy siê z przebieg³oœci¹ wojownika, strze¿cie siê, albowiem bêdziecie œwiadkami wielkich zmian.");
					Doc_PrintLines	( nDocID,  0, "Upór wo³u po³¹czony z wytrwa³oœci¹ wojownika mo¿e zaburzyæ odwieczny porz¹dek. Kosmiczna materia oddzielaj¹ca wymiary staje siê coraz cieñsza i s³absza. Wkrótce nie bêdzie w stanie powstrzymaæ istot Beliara przed wdarciem siê do naszej rzeczywistoœci.");
					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "W pradawnych czasach, kiedy oba œwiaty by³y po³¹czone siln¹ wiêzi¹, s³udzy Z³a mogli bez przeszkód pl¹drowaæ nasze ziemie, i tylko moc Innosa oraz jego Wybrañca pozwoli³a nam odeprzeæ ataki Wroga."	);
					Doc_PrintLines	( nDocID,  1, "Jeœli taka sytuacja siê powtórzy, niechaj Innos ma nas w swej opiece, albowiem od stuleci nie by³o poœród nas jego Wybrañca."					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "");
					Doc_Show		( nDocID );
};

///////////////////////
//Besessenheit heilen.
///////////////////////

var int SC_ObsessionTimes;

INSTANCE ItPo_HealObsession_MIS(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI|ITEM_MISSION;

	value 			=	Value_HpEssenz;	

	visual 			=	"ItMi_Flask.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	Use_HealObsession;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Uleczenie z opêtania";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Essenz;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpEssenz;
};

	FUNC VOID Use_HealObsession()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Essenz);
		SC_ObsessionTimes = SC_ObsessionTimes + 1;
		B_ClearSCObsession (self);
		Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play ("SFX_HealObsession" );
	};	
	
//************************************************
//	Die Golem Truhe
//************************************************

INSTANCE ItSe_Golemchest_Mis	(C_Item)
{
	name 				=	"Skórzany mieszek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_GolemChest;
	
	description			= 	"Skórzany mieszek.";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"W sakwie pe³no jest z³ota.";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_GolemChest ()
{
		CreateInvItems (hero, ItMi_Gold ,50);
		Print (PRINT_FoundGold50);
		Print (PRINT_FoundRing);
		CreateInvItems (hero, ItRi_Prot_Total_02,1);
		Snd_Play ("Geldbeutel");
};

//////////////////////////////////////////////////////////////////////////////
//
//	ItWr_ShatteredGolem_MIS
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_ShatteredGolem_MIS (C_Item)
{
	name 		= "Bardzo stara mapa.";  // 
	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION;

	value 		= 150;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_ShatteredGolem_Mis;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_ShatteredGolem_Mis()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_ShatteredGolem_MIS);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_NewWorld_ShatteredGolem.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "NewWorld\NewWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};
	
//**********************************************************************************
//	Diegos Brief an den Richter
//----------------------------------------------------------------------------------

INSTANCE ItWr_DiegosLetter_MIS		(C_Item)
{
	name 				=	"List od Diega";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_DiegosLetter_Mis;
	scemeName			=	"MAP";
	description			= "List Diega do Gerbrandta.";
};
func void Use_DiegosLetter_Mis ()
{   

		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Gerbrandt, ");
					Doc_PrintLines	( nDocID,  0, "pope³ni³eœ b³¹d, nie zabijaj¹c mnie...");
					Doc_PrintLines	( nDocID,  0, "Wróci³em do miasta i nied³ugo siê spotkamy, a wtedy posiekam ciê na plasterki. Znasz mnie wystarczaj¹co d³ugo, by wiedzieæ, ¿e nie ¿artujê."); 
					Doc_PrintLines	( nDocID,  0, "Nie przypuszcza³eœ pewnie, ¿e mogê jeszcze wróciæ zza Bariery. To b³¹d...");
					Doc_PrintLines	( nDocID,  0, "Wróci³em, by odzyskaæ, co moje.");
					Doc_PrintLines	( nDocID,  0, "Jeœli ¿ycie ci mi³e, uciekaj czym prêdzej z miasta. A ja przejmê twój interes. W ten sposób bêdziemy kwita.");				
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Diego");
					Doc_Show		( nDocID );
		
};

//*************************************************************************************
//		Diegos Goldschatz
//*************************************************************************************

INSTANCE ItSe_DiegosTreasure_Mis(C_Item)
{
	name 				=	"Wype³niona skórzana torba";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_DiegosTreasure;
	description			= 	"Stara, skórzana torba Diega.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_DiegosTreasure ()
{
	OpenedDiegosBag = TRUE;
	
	B_PlayerFindItem (ItMi_Gold,DiegosTreasure);
};

//*************************************************************************************
//		Ulthars heilendes Wasser zum reinigen der Wegschreine (nur PAL)
//*************************************************************************************

INSTANCE ItMi_UltharsHolyWater_Mis (C_Item)
{
	name 				=	"Woda œwiêcona Ulthara";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION|ITEM_MULTI;	

	value 				=	Value_HolyWater;

	visual 				=	"ItMi_HolyWater.3ds";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//**********************************************************************************
//	ItWr_MinenAnteil_Mis
//----------------------------------------------------------------------------------
var int ItWr_MinenAnteil_Mis_OneTime;
INSTANCE ItWr_MinenAnteil_Mis		(C_Item)
{
	name 				=	"Udzia³ w kopalni rudy Khorinis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION | ITEM_MULTI;

	value 				=	Value_HpElixier;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_MinenAnteil_Mis;
	scemeName			=	"MAP";
	description			= 	name;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
func void Use_MinenAnteil_Mis ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID,  0, FONT_BookHeadline);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, "Udzia³ w kopalni rudy"									);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "Na mocy królewskiego Aktu W³asnoœci, wystawionego na czêœæ ziem królewskich, posiadacz tego dokumentu mo¿e eksploatowaæ surowce tych ziem,");
					Doc_PrintLines	(nDocID,  0, "na obszarze nie wiêkszym jednak ni¿ jeden ar królewski.");
					Doc_PrintLines	(nDocID,  0, "Na mocy Prawa o Miarach ar królewski równa siê powierzchni¹ fragmentowi terenu o szerokoœci 16 kroków i d³ugoœci 3.");
					Doc_PrintLines	(nDocID,  0, "Posiadacz tego dokumentu zostaje nadto zwolniony z obowi¹zków nak³adanych przez prawa swobody dostêpu,");
					Doc_PrintLines	(nDocID,  0, "jeœli jednak nie zdo³a uiœciæ op³aty za u¿ytkowane ziemie, to powróc¹ one na w³asnoœæ Korony.");
					Doc_PrintLine	(nDocID,  0, "         Podpisano"									);
					Doc_PrintLine	(nDocID,  0, "         Rz¹dca królewski,"						);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "                Salandril"								);
					Doc_Show		(nDocID);
					
		SC_KnowsProspektorSalandril = TRUE;

	if (ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_MinenAnteile,"Goœæ, który sprzeda³ te udzia³y kupcom, ma na imiê Salandril. Pewnie naj³atwiej go bêdzie znaleŸæ w górnym Khorinis - chyba ¿e ju¿ zwia³ przed d³ugim ramieniem sprawiedliwoœci."); 
	
		if (Npc_IsDead(Salandril))
		{
			B_LogEntry (TOPIC_MinenAnteile,"Salandril nie ¿yje. Trzeba o tym powiedzieæ Serpentesowi."); 
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};

//**********************************************************************************
//	Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

INSTANCE  ItAm_Prot_BlackEye_Mis (C_Item)
{
	name 			=	"Amulet przyzywania dusz";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	Value_Am_HpMana;

	visual 			=	"ItAm_Hp_Mana_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	name;
	
	TEXT[2]			= "";
	
	TEXT[3] 		= "Ochrona przed Czarnym Spojrzeniem";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
		
};
//**********************************************************************************
//	Gestein aus gesegneter Erde für das Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

INSTANCE  ItMi_KarrasBlessedStone_Mis (C_Item)
{
	name 			=	"Kamieñ z poœwiêconej ziemi";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MISSION|ITEM_MULTI ;

	value 			=	0;

	visual 			=	"ItMi_Rockcrystal.3ds";

	visual_skin 	=	0;
	material 		=	MAT_STONE ;

	description		= 	name;
	
	TEXT[2]			= "";
	
	TEXT[3] 		= "";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

//**********************************************************************************
//	Komprobrief für Lee
//----------------------------------------------------------------------------------

INSTANCE ItWr_RichterKomproBrief_MIS		(C_Item)
{
	name 				=	"Zlecenie sêdziego";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_RichterKomproBrief;
	scemeName			=	"MAP";
	description			= 	name;
};

func void Use_RichterKomproBrief ()
{   
		SCKnowsRichterKomproBrief = TRUE;
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Morgahard - ty robaku! Lepiej rób, co ci ka¿ê, albo inaczej sobie pogadamy. Byæ mo¿e nawet bêdê musia³ was aresztowaæ.");
					Doc_PrintLines	( nDocID,  0, "Sprawê trzeba za³atwiæ jutro w nocy, Larius coœ podejrzewa.");
					Doc_PrintLines	( nDocID,  0, "Jeœli teraz nie wyci¹gniemy od niego forsy, to mo¿e nie byæ kolejnej okazji. Zadbam o to, abyœcie go spotkali wieczorem na targowisku.");
					Doc_PrintLines	( nDocID,  0, "Tylko nie róbcie ha³asu. Chyba nie chcecie, ¿eby wsiedli na was stra¿nicy?");
					Doc_PrintLines	( nDocID,  0, "A gdyby mia³ go spotkaæ jakiœ nieszczêœliwy wypadek, to ja p³aka³ nie bêdê."									);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "          G³ówny sêdzia i "		);
					Doc_PrintLine	( nDocID,  0, "          królewski sekretarz"		);
					Doc_PrintLine	( nDocID,  0, ""			);
					
					Doc_Show		( nDocID );
		
};

//**********************************************************************************
//	ItWr_MorgahardTip
//----------------------------------------------------------------------------------

INSTANCE ItWr_MorgahardTip		(C_Item)
{
	name 				=	"List";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_MorgahardTip;
	scemeName			=	"MAP";
	description			= 	name;
};

func void Use_MorgahardTip ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "Zrobi³em to. Mam nadziejê, ¿e spotkamy siê jeszcze, gdy ca³e zamieszanie przycichnie.");
					Doc_PrintLines	(nDocID,  0, "Nie martwcie siê. Jeœli wszystko zawiedzie, poproszê Onara o za³atwienie sprawy.");
					Doc_PrintLines	(nDocID,  0, "Wszystko bêdzie w porz¹dku."					);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "     M."											);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_Show		(nDocID);
		
};
//////////////////////////////////////////////////////////////////////////////
//
//	MAP der Schreine
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_Shrine_MIS (C_Item)
{
	name 		= "Mapa œwiêtych kapliczek";  // 
	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 200;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_NewWorld_Shrine_MIS;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Map_NewWorld_Shrine_MIS()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_Shrine_MIS);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_NewWorld_Shrine.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "NewWorld\NewWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};
	
	
//**********************************************************************************
//	ItWr_VinosKellergeister_Mis
//**********************************************************************************

INSTANCE ItWr_VinosKellergeister_Mis (C_ITEM)
{
	name 					=	"Duch wina";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Book_02_05.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_VinosKellergeister_Mis;
};

	FUNC VOID Use_VinosKellergeister_Mis()
	{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "BOOK_RED_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "BOOK_RED_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga

					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Potêga winnego grona"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "...W swoim czasie spróbowa³em niejednego, ale ten owoc, który dosta³em w zesz³ym tygodniu z zagranicy... przekroczy³ wszystkie oczekiwania..."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  0, "...sok z tego winnego grona ma bukiet bogatszy ni¿ z jakiegokolwiek innego..."					);
					Doc_PrintLines	( nDocID,  0, "");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "...nie jest Ÿle, ale ca³y czas martwiê siê, ¿e ktoœ mo¿e mnie z³apaæ w mojej tajnej pracowni. Nie mam pojêcia, co zrobiliby stra¿nicy, gdyby siê o tym wszystkim dowiedzieli. Byæ mo¿e wyrzuciliby mnie poza Barierê..."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "...Nabrali podejrzeñ. Muszê wszystko zostawiæ, dopóki sprawa troszkê nie przycichnie i nie nabiorê pewnoœci, ¿e nikt mnie ju¿ nie podejrzewa...");
					Doc_Show		( nDocID );
};

