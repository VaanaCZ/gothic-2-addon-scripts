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
	name 				=	"Innosovo oko";

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

	TEXT	[0]			=	"Oko pulzuje tajemnou energií.";

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
	name 				=	"Innosovo oko"; 

	mainflag 			=	ITEM_KAT_MAGIC;
	flags 				=	ITEM_AMULET|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_InnosEye_MIS.3DS";	
	material 			=	MAT_STONE;

	description			= 	name;
	on_equip			=	Equip_ItMi_InnosEye_Discharged_Mis;
	TEXT	[0]			=	"Oko je ztemnìlé - vùbec nezáøí.";
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
};

INSTANCE ItMi_InnosEye_Broken_Mis (C_Item)	
{
	name 				=	"Innosovo oko"; 

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
	name 				=	"Plná moc";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_PermissionToWearInnosEye;
	scemeName			=	"MAP";
	description			= "Plná moc pro Pyrokara";
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
						Doc_PrintLines	(nDocID,  0, "Nositel tohoto listu mùže volnì vstoupit do posvátných síní kláštera.");
						Doc_PrintLines	(nDocID,  0, "Nech je jeho pøáním ohlednì oka Innosova okamžitì vyhovìno.");
						Doc_PrintLines	(nDocID,  0, "Tyto rozkazy udílím na základì svého postu vládce celého ostrova a králova zástupce, stejnì jako smlouvou od Innosova chrámu ze 2. roku ohnì.");
						Doc_PrintLines	(nDocID,  0, "V této vìci již neuèiním žádná další prohlášení a oèekávám, že mé rozkazy budete respektovat.");
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, "Nech Innos požehná králi!"						);
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, "        Lord Hagen"								);
						Doc_Show		(nDocID );				
		
};

//**********************************************************************************
//	ItWr_XardasBookForPyrokar_Mis
//**********************************************************************************

INSTANCE ItWr_XardasBookForPyrokar_Mis (C_ITEM) 
{	
	name 					=	"Irdorathské sínì";

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
	name 				=	"Xardasùv klíè" ;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_02;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[0]				=   "od bedny na Sekobovì statku.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//**********************************************************************************
//	ItWr_CorneliusTagebuch_Mis 
//**********************************************************************************

INSTANCE ItWr_CorneliusTagebuch_Mis (C_ITEM) 
{	
	name 					=	"Deník";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Deník";
	TEXT	[0]				=	"Corneliùv zápisník.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseCorneliusTagebuch;
};

	FUNC VOID UseCorneliusTagebuch()
	{   
		Cornelius_IsLiar = TRUE;
		B_LogEntry (TOPIC_RESCUEBENNET,"Tento zápisník dokazuje, že Bennet je nevinný.");	
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Jestli bude Larius takhle pokraèovat, budu si muset najít jinou pozici.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Vèera veèer se mi stala prapodivná vìc. Pøišel ke mnì jeden z tìch èerných zakuklencù, o kterých jsme toho v poslední dobì tolik slyšeli. Nebyl jsem moc nervózní, i když z tajemného návštìvníka pøímo èišelo nìjaké zlo a jeho moc byla skoro hmatatelná. Mluvil však tak klidným a pøíjemným hlasem, že jsem mìl pocit, že mu prostì musím vìøit.");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Nabídl mi 20 000 zlaákù, když se postarám, aby byl jeden z tìch žoldákù uznán vinným. Prý vím, co tím myslí."	);
					Doc_PrintLines	( nDocID,  1, "Samozøejmì že jsem souhlasil, protože ta chátra si stejnì nic jiného nezaslouží. Nebýt jich, mìl bych se teï mnohem líp. A zlato, které za to dostanu, mi zajistí slušné živobytí až do smrti."					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Jednoho z tìch žoldákù už mají pod zámkem, takže své slovo opravdu hravì splním.");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

//**********************************************************************************
//	ITWR_DementorObsessionBook_MIS 			//Joly: DementorBuch, der Bessenheit, Ein NSC trägt dieses Buch mit sich, wenn er von einem Dementor kurzzeitig übernommen wurde.)
//**********************************************************************************

INSTANCE ITWR_DementorObsessionBook_MIS (C_ITEM) 
{	
	name 					=	"Almanach posedlých";

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
						Doc_PrintLine	(nDocID, 1, "           VINO"								);
						Doc_PrintLine	(nDocID, 1, "FERNANDO"										);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "        MALAK"									);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "BROMOR"										);
					};
					if (Kapitel >= 4)
					{
						Doc_PrintLine	(nDocID, 1, "    ENGROM"								);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "        RANDOLPH"									);
						Doc_PrintLine	(nDocID, 1, ""												);
					};
					if (Kapitel >= 5)
					{
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "SEKOB"								);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "            BRUTUS"									);
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
	name 				=	"Pyrokarùv magický svitek";

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
					Doc_PrintLine	( nDocID,  0, "Posedlý"					);
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

	description		= 	"Lék na èernou horeèku";
	
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
	name 				=	"Vycházková hùl";  

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
	TEXT[0]				= 	"Na rukojeti je vyvedeno";
	TEXT[1]				= 	"ozdobné písmeno M.";					

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
	name 				=	"Mìšec naditý zlatem!";

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
	name 				=	"Tlustý rysec";

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
	name 				=	"Dopis Babovi";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosLetter;
	scemeName			=	"MAP";
	description			= "Dopis pro Baba.";
};
func void Use_BabosLetter ()
{   
 
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Milý Babo,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Urèitì se divíš, že ti píšeme. Donesli jsme totiž mistru Marlasovi všechny úspory a požádali ho, aby tyto øádky napsal za nás. Pøejeme ti do budoucna jen to nejlepší a jako dárek na rozlouèenou ti posíláme obrázek, abys mìl na co vzpomínat za dlouhých veèerù v klášteøe.");
					Doc_PrintLines	( nDocID,  0, "Hodnì štìstí - snad se ti ta malùvka bude líbit.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Feht a Bonka");
					
					Doc_Show		( nDocID );
					
			
		
};

//********************************************************
//	BabosPinup
//********************************************************

INSTANCE ItWr_BabosPinUp_MIS		(C_Item)
{
	name 				=	"Obrázek ženy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosPinUp;
	scemeName			=	"MAP";
	description			= "Obrázek nahé ženy.";
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
	name 				=	"Dokumenty";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosDocs;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "Srolované";
	TEXT[3]				=   "dokumenty.";
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
	name 				=	"Klíè od truhlice";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Klíè od Valentinovy";
	TEXT[3]				=   "truhlice.";
	
}; 

//**********************************************************************************
//	ItWr_Astronomy_Mis
//**********************************************************************************

INSTANCE ItWr_Astronomy_Mis (C_ITEM) 
{	
	name 					=	"Božská moc hvìzd";

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
					Doc_PrintLines	( nDocID,  0, "...ale když se síla vola spojí s váleènickými ideály, pak se støezte událostí, které mohou nastat.");
					Doc_PrintLines	( nDocID,  0, "Nespoutaná volská síla a vytrvalost váleèníka dokáže narušit pradávnou rovnováhu sil. Hranice mezi dimenzemi pak zaène slábnout - až nakonec bude tak tenká, že k nám ze svìta stínù snadno proniknou Beliarovy nestvùry.");
					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Války ze starých èasù nám budiž pøíkladem, jak nìco takového dopadá. I když tehdy byla vazba mezi svìty ještì stále pevná, stoupenci zla sem pøinesli smrt a zkázu, pøed kterou lidstvo ochránil pouze Innos a Jeho vyvolený."	);
					Doc_PrintLines	( nDocID,  1, "Innos nás chraò, jestli by se mìla podobná hrozba znovu objevit, protože žádný další Innosùv vyvolený nepøišel už víc jak sto let."					);
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

	description		= 	"Lék pro posedlé";
	
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
	name 				=	"Mìšec";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_GolemChest;
	
	description			= 	"Mìšec.";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Tento váèek je plný mincí.";
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
	name 		= "Velmi stará mapa";  // 
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
	name 				=	"Dopis od Diega";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_DiegosLetter_Mis;
	scemeName			=	"MAP";
	description			= "Diegùv dopis Gerbrandtovi.";
};
func void Use_DiegosLetter_Mis ()
{   

		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Gerbrandte,");
					Doc_PrintLines	( nDocID,  0, "Víš, mìl jsi mì radši zabít.");
					Doc_PrintLines	( nDocID,  0, "Teï jsem zpátky ve mìstì a hledám tì. A až tì najdu, nadìlám z tebe sekanou. Znáš mì už dost dlouho, abys vìdìl, že se jen tak lehce oblbnout nenechám."); 
					Doc_PrintLines	( nDocID,  0, "Poèítám, že když jsi mì házel pøes bariéru, ani ve snu tì nenapadlo, že bych se mohl vrátit. A to byla chyba.");
					Doc_PrintLines	( nDocID,  0, "Vezmu si zpátky, co mi patøí.");
					Doc_PrintLines	( nDocID,  0, "Jestli je ti život milej, tak si sbalíš fidlátka a svùj obchod pøenecháš mnì. Tím si budeme kvit.");				
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Diego");
					Doc_Show		( nDocID );
		
};

//*************************************************************************************
//		Diegos Goldschatz
//*************************************************************************************

INSTANCE ItSe_DiegosTreasure_Mis(C_Item)
{
	name 				=	"Plný mìšec";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_DiegosTreasure;
	description			= 	"Diegùv starý mìšec.";
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
	name 				=	"Ultharova svìcená voda";

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
	name 				=	"Akcie khorinidských rudných dolù";

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
					Doc_PrintLine	(nDocID,  0, "Akcie rudných dolù"									);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "Tímto dokumentem dává král a vládce této øíše jeho nositeli právo kutat na území pod královskou správou.");
					Doc_PrintLines	(nDocID,  0, "Svou pùsobnost však musí omezit na jedno malé královské pole.");
					Doc_PrintLines	(nDocID,  0, "Podle listiny o velikosti dolù èiní jedno malé královské pole 16 yardù na šíøku a 3 yardy na výšku.");
					Doc_PrintLines	(nDocID,  0, "Královský prospektor není povinen zajistit volný pøístup a ochranu dùlních cel.");
					Doc_PrintLines	(nDocID,  0, "Nebude-li nájemce moci uhradit nájemné, pøejdou všechna práva zpìt pod správu øíše.");
					Doc_PrintLine	(nDocID,  0, "         Podepsán"									);
					Doc_PrintLine	(nDocID,  0, "      Královský prospektor"						);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "                Salandril"								);
					Doc_Show		(nDocID);
					
		SC_KnowsProspektorSalandril = TRUE;

	if (ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_MinenAnteile,"Ten chlapík, který prodal dùlní akcie obchodníkùm, se jmenoval Salandril. Najdu ho nejspíš v horní ètvrti Khorinidu, jestli tedy už pøed spravedlností neutekl nìkam dál."); 
	
		if (Npc_IsDead(Salandril))
		{
			B_LogEntry (TOPIC_MinenAnteile,"Salandril je mrtev. Musím to oznámit Serpentovi."); 
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};

//**********************************************************************************
//	Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

INSTANCE  ItAm_Prot_BlackEye_Mis (C_Item)
{
	name 			=	"Amulet pøivolávání duší";

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
	
	TEXT[3] 		= "Amulet ochrany pøed uhranutím";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
		
};
//**********************************************************************************
//	Gestein aus gesegneter Erde für das Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

INSTANCE  ItMi_KarrasBlessedStone_Mis (C_Item)
{
	name 			=	"Kámen ze svaté pùdy";

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
	name 				=	"Rozkazy od soudce";

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
					Doc_PrintLines	( nDocID,  0, "Morgaharde, ty mizerný budižknièemu! Buï vyplníš moje rozkazy, nebo se naštvu a nechám vás všechny zavøít, až zèernáte!");
					Doc_PrintLines	( nDocID,  0, "Musíte to provést dneska v noci, Larius zaèíná nìco tušit.");
					Doc_PrintLines	( nDocID,  0, "Jestli mu kapsy nevybereme teï, pak už mùže být pozdì. Postarám se, aby ses s ním setkal dneska veèer na trhu.");
					Doc_PrintLines	( nDocID,  0, "Ale ne abys z toho dìlal estrádu, jinak tì stráže zatknou, než se staèíš rozkoukat.");
					Doc_PrintLines	( nDocID,  0, "Mimochodem, kdyby pøitom náhodou natáhl brka, docela by se mi to hodilo."									);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "          Královský soudce"		);
					Doc_PrintLine	( nDocID,  0, "          a tajemník"		);
					Doc_PrintLine	( nDocID,  0, ""			);
					
					Doc_Show		( nDocID );
		
};

//**********************************************************************************
//	ItWr_MorgahardTip
//----------------------------------------------------------------------------------

INSTANCE ItWr_MorgahardTip		(C_Item)
{
	name 				=	"Dopis";

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
					Doc_PrintLines	(nDocID,  0, "Pokraèuji dál. Doufám, že až se to trochu uklidní, zase se setkáme.");
					Doc_PrintLines	(nDocID,  0, "Žádné strachy, hoši. Když selže všechno ostatní, požádám Onara, aby na to dohlédl.");
					Doc_PrintLines	(nDocID,  0, "To bude v poøádku."					);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "                           M."											);
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
	name 		= "Mapa oltáøù";  // 
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
	name 					=	"Duch vína";

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
					Doc_PrintLines	( nDocID,  0, "Moc hroznù"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "...už jsem toho v životì vyzkoušel spoustu, ale tohle ovoce, které mi minulý týden pøivezli z ciziny, pøedèilo všechna má oèekávání..."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  0, "...šáva z tìchto hroznù je daleko vydatnìjší než cokoliv, co lze získat v tìchto konèinách..."					);
					Doc_PrintLines	( nDocID,  0, "");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "...takže zatím to jde dobøe. Ale poøád mi nedá spát pomyšlení, co by se mohlo stát, kdyby nìkdo našel mùj tajný destilaèní aparát. Radši ani nechci vìdìt, co by mi za to drábové provedli - nakonec by mì mohli hodit pøes bariéru..."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "...zaèínají mít podezøení. Radši se odsud uklidím a chvíli poèkám, až se vìci trochu uklidní a budu se moci opìt vrátit k práci. Hlavnì musím mít jistotu, že po mnì už nejdou...");
					Doc_Show		( nDocID );
};

