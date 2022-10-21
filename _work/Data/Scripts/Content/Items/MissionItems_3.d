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

	TEXT	[0]			=	"Oko pulzuje tajemnou energi�.";

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
	TEXT	[0]			=	"Oko je ztemn�l� - v�bec nez���.";
	
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
//	Erm�chtigungsschreiben f�r SC f�r Pyrokar, das Auge Innos rauszur�cken.
//----------------------------------------------------------------------------------

INSTANCE ItWr_PermissionToWearInnosEye_MIS		(C_Item)
{
	name 				=	"Pln� moc";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_PermissionToWearInnosEye;
	scemeName			=	"MAP";
	description			= "Pln� moc pro Pyrokara";
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
						Doc_PrintLines	(nDocID,  0, "Nositel tohoto listu m��e voln� vstoupit do posv�tn�ch s�n� kl�tera.");
						Doc_PrintLines	(nDocID,  0, "Nech� je jeho p��n�m ohledn� oka Innosova okam�it� vyhov�no.");
						Doc_PrintLines	(nDocID,  0, "Tyto rozkazy ud�l�m na z�klad� sv�ho postu vl�dce cel�ho ostrova a kr�lova z�stupce, stejn� jako smlouvou od Innosova chr�mu ze 2. roku ohn�.");
						Doc_PrintLines	(nDocID,  0, "V t�to v�ci ji� neu�in�m ��dn� dal�� prohl�en� a o�ek�v�m, �e m� rozkazy budete respektovat.");
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, "Nech� Innos po�ehn� kr�li!"						);
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, "        Lord Hagen"								);
						Doc_Show		(nDocID );				
		
};

//**********************************************************************************
//	ItWr_XardasBookForPyrokar_Mis
//**********************************************************************************

INSTANCE ItWr_XardasBookForPyrokar_Mis (C_ITEM) 
{	
	name 					=	"Irdorathsk� s�n�";

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
//	ItKe_CHEST_SEKOB_XARDASBOOK_MIS 		Xardas Schl�ssel f�r die Truhe auf Sekobs Hof
//**********************************************************************************

INSTANCE ItKe_CHEST_SEKOB_XARDASBOOK_MIS (C_Item)
{
	name 				=	"Xardas�v kl��" ;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_02;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[0]				=   "od bedny na Sekobov� statku.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//**********************************************************************************
//	ItWr_CorneliusTagebuch_Mis 
//**********************************************************************************

INSTANCE ItWr_CorneliusTagebuch_Mis (C_ITEM) 
{	
	name 					=	"Den�k";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Den�k";
	TEXT	[0]				=	"Corneli�v z�pisn�k.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseCorneliusTagebuch;
};

	FUNC VOID UseCorneliusTagebuch()
	{   
		Cornelius_IsLiar = TRUE;
		B_LogEntry (TOPIC_RESCUEBENNET,"Tento z�pisn�k dokazuje, �e Bennet je nevinn�.");	
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Jestli bude Larius takhle pokra�ovat, budu si muset naj�t jinou pozici.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "V�era ve�er se mi stala prapodivn� v�c. P�i�el ke mn� jeden z t�ch �ern�ch zakuklenc�, o kter�ch jsme toho v posledn� dob� tolik sly�eli. Nebyl jsem moc nerv�zn�, i kdy� z tajemn�ho n�v�t�vn�ka p��mo �i�elo n�jak� zlo a jeho moc byla skoro hmatateln�. Mluvil v�ak tak klidn�m a p��jemn�m hlasem, �e jsem m�l pocit, �e mu prost� mus�m v��it.");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Nab�dl mi 20 000 zla��k�, kdy� se postar�m, aby byl jeden z t�ch �old�k� uzn�n vinn�m. Pr� v�m, co t�m mysl�."	);
					Doc_PrintLines	( nDocID,  1, "Samoz�ejm� �e jsem souhlasil, proto�e ta ch�tra si stejn� nic jin�ho nezaslou��. Neb�t jich, m�l bych se te� mnohem l�p. A zlato, kter� za to dostanu, mi zajist� slu�n� �ivobyt� a� do smrti."					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Jednoho z t�ch �old�k� u� maj� pod z�mkem, tak�e sv� slovo opravdu hrav� spln�m.");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

//**********************************************************************************
//	ITWR_DementorObsessionBook_MIS 			//Joly: DementorBuch, der Bessenheit, Ein NSC tr�gt dieses Buch mit sich, wenn er von einem Dementor kurzzeitig �bernommen wurde.)
//**********************************************************************************

INSTANCE ITWR_DementorObsessionBook_MIS (C_ITEM) 
{	
	name 					=	"Almanach posedl�ch";

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
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
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
	name 				=	"Pyrokar�v magick� svitek";

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
					Doc_PrintLine	( nDocID,  0, "Posedl�"					);
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
//	Heiltrank f�r Hilda																	//
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

	description		= 	"L�k na �ernou hore�ku";
	
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
	name 				=	"Vych�zkov� h�l";  

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
	TEXT[1]				= 	"ozdobn� p�smeno M.";					

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
	name 				=	"M�ec nadit� zlatem!";

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
// 		MoleratFett f�r "die Winde klemmt"
// *****************************************************

INSTANCE ItMi_Moleratlubric_MIS (C_Item)
{
	name 				=	"Tlust� rysec";

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
					Doc_PrintLine	( nDocID,  0, "Mil� Babo,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ur�it� se div�, �e ti p�eme. Donesli jsme toti� mistru Marlasovi v�echny �spory a po��dali ho, aby tyto ��dky napsal za n�s. P�ejeme ti do budoucna jen to nejlep�� a jako d�rek na rozlou�enou ti pos�l�me obr�zek, abys m�l na co vzpom�nat za dlouh�ch ve�er� v kl�te�e.");
					Doc_PrintLines	( nDocID,  0, "Hodn� �t�st� - snad se ti ta mal�vka bude l�bit.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Feht a Bonka");
					
					Doc_Show		( nDocID );
					
			
		
};

//********************************************************
//	BabosPinup
//********************************************************

INSTANCE ItWr_BabosPinUp_MIS		(C_Item)
{
	name 				=	"Obr�zek �eny";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosPinUp;
	scemeName			=	"MAP";
	description			= "Obr�zek nah� �eny.";
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
	TEXT[2]				=   "Srolovan�";
	TEXT[3]				=   "dokumenty.";
};
func void Use_BabosDocs ()
{   
		BaboSDocsOpen = TRUE;
		
		CreateInvItems (self, ItWr_BabosLetter_MIS,1);
		CreateInvItems (self, ItWr_BabosPinUp_MIS,1);
};

//*************************************************************
//	igaraz Schl�ssel
//*************************************************************

INSTANCE ItKe_IgarazChest_Mis(C_Item)
{
	name 				=	"Kl�� od truhlice";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"Kl�� od Valentinovy";
	TEXT[3]				=   "truhlice.";
	
}; 

//**********************************************************************************
//	ItWr_Astronomy_Mis
//**********************************************************************************

INSTANCE ItWr_Astronomy_Mis (C_ITEM) 
{	
	name 					=	"Bo�sk� moc hv�zd";

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
					Doc_PrintLines	( nDocID,  0, "...ale kdy� se s�la vola spoj� s v�le�nick�mi ide�ly, pak se st�ezte ud�lost�, kter� mohou nastat.");
					Doc_PrintLines	( nDocID,  0, "Nespoutan� volsk� s�la a vytrvalost v�le�n�ka dok�e naru�it prad�vnou rovnov�hu sil. Hranice mezi dimenzemi pak za�ne sl�bnout - a� nakonec bude tak tenk�, �e k n�m ze sv�ta st�n� snadno proniknou Beliarovy nestv�ry.");
					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "V�lky ze star�ch �as� n�m budi� p��kladem, jak n�co takov�ho dopad�. I kdy� tehdy byla vazba mezi sv�ty je�t� st�le pevn�, stoupenci zla sem p�inesli smrt a zk�zu, p�ed kterou lidstvo ochr�nil pouze Innos a Jeho vyvolen�."	);
					Doc_PrintLines	( nDocID,  1, "Innos n�s chra�, jestli by se m�la podobn� hrozba znovu objevit, proto�e ��dn� dal�� Innos�v vyvolen� nep�i�el u� v�c jak sto let."					);
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

	description		= 	"L�k pro posedl�";
	
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
	name 				=	"M�ec";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_GolemChest;
	
	description			= 	"M�ec.";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Tento v��ek je pln� minc�.";
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
	name 		= "Velmi star� mapa";  // 
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
	description			= "Dieg�v dopis Gerbrandtovi.";
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
					Doc_PrintLines	( nDocID,  0, "V�, m�l jsi m� rad�i zab�t.");
					Doc_PrintLines	( nDocID,  0, "Te� jsem zp�tky ve m�st� a hled�m t�. A a� t� najdu, nad�l�m z tebe sekanou. Zn� m� u� dost dlouho, abys v�d�l, �e se jen tak lehce oblbnout nenech�m."); 
					Doc_PrintLines	( nDocID,  0, "Po��t�m, �e kdy� jsi m� h�zel p�es bari�ru, ani ve snu t� nenapadlo, �e bych se mohl vr�tit. A to byla chyba.");
					Doc_PrintLines	( nDocID,  0, "Vezmu si zp�tky, co mi pat��.");
					Doc_PrintLines	( nDocID,  0, "Jestli je ti �ivot milej, tak si sbal� fidl�tka a sv�j obchod p�enech� mn�. T�m si budeme kvit.");				
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Diego");
					Doc_Show		( nDocID );
		
};

//*************************************************************************************
//		Diegos Goldschatz
//*************************************************************************************

INSTANCE ItSe_DiegosTreasure_Mis(C_Item)
{
	name 				=	"Pln� m�ec";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_DiegosTreasure;
	description			= 	"Dieg�v star� m�ec.";
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
	name 				=	"Ultharova sv�cen� voda";

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
	name 				=	"Akcie khorinidsk�ch rudn�ch dol�";

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
					Doc_PrintLine	(nDocID,  0, "Akcie rudn�ch dol�"									);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "T�mto dokumentem d�v� kr�l a vl�dce t�to ��e jeho nositeli pr�vo kutat na �zem� pod kr�lovskou spr�vou.");
					Doc_PrintLines	(nDocID,  0, "Svou p�sobnost v�ak mus� omezit na jedno mal� kr�lovsk� pole.");
					Doc_PrintLines	(nDocID,  0, "Podle listiny o velikosti dol� �in� jedno mal� kr�lovsk� pole 16 yard� na ���ku a 3 yardy na v��ku.");
					Doc_PrintLines	(nDocID,  0, "Kr�lovsk� prospektor nen� povinen zajistit voln� p��stup a ochranu d�ln�ch cel.");
					Doc_PrintLines	(nDocID,  0, "Nebude-li n�jemce moci uhradit n�jemn�, p�ejdou v�echna pr�va zp�t pod spr�vu ��e.");
					Doc_PrintLine	(nDocID,  0, "         Podeps�n"									);
					Doc_PrintLine	(nDocID,  0, "      Kr�lovsk� prospektor"						);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "                Salandril"								);
					Doc_Show		(nDocID);
					
		SC_KnowsProspektorSalandril = TRUE;

	if (ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_MinenAnteile,"Ten chlap�k, kter� prodal d�ln� akcie obchodn�k�m, se jmenoval Salandril. Najdu ho nejsp� v horn� �tvrti Khorinidu, jestli tedy u� p�ed spravedlnost� neutekl n�kam d�l."); 
	
		if (Npc_IsDead(Salandril))
		{
			B_LogEntry (TOPIC_MinenAnteile,"Salandril je mrtev. Mus�m to ozn�mit Serpentovi."); 
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};

//**********************************************************************************
//	Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

INSTANCE  ItAm_Prot_BlackEye_Mis (C_Item)
{
	name 			=	"Amulet p�ivol�v�n� du��";

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
	
	TEXT[3] 		= "Amulet ochrany p�ed uhranut�m";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
		
};
//**********************************************************************************
//	Gestein aus gesegneter Erde f�r das Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

INSTANCE  ItMi_KarrasBlessedStone_Mis (C_Item)
{
	name 			=	"K�men ze svat� p�dy";

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
//	Komprobrief f�r Lee
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
					Doc_PrintLines	( nDocID,  0, "Morgaharde, ty mizern� budi�kni�emu! Bu� vypln� moje rozkazy, nebo se na�tvu a nech�m v�s v�echny zav��t, a� z�ern�te!");
					Doc_PrintLines	( nDocID,  0, "Mus�te to prov�st dneska v noci, Larius za��n� n�co tu�it.");
					Doc_PrintLines	( nDocID,  0, "Jestli mu kapsy nevybereme te�, pak u� m��e b�t pozd�. Postar�m se, aby ses s n�m setkal dneska ve�er na trhu.");
					Doc_PrintLines	( nDocID,  0, "Ale ne abys z toho d�lal estr�du, jinak t� str�e zatknou, ne� se sta�� rozkoukat.");
					Doc_PrintLines	( nDocID,  0, "Mimochodem, kdyby p�itom n�hodou nat�hl brka, docela by se mi to hodilo."									);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "          Kr�lovsk� soudce"		);
					Doc_PrintLine	( nDocID,  0, "          a tajemn�k"		);
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
					Doc_PrintLines	(nDocID,  0, "Pokra�uji d�l. Douf�m, �e a� se to trochu uklidn�, zase se setk�me.");
					Doc_PrintLines	(nDocID,  0, "��dn� strachy, ho�i. Kdy� sel�e v�echno ostatn�, po��d�m Onara, aby na to dohl�dl.");
					Doc_PrintLines	(nDocID,  0, "To bude v po��dku."					);
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
	name 		= "Mapa olt���";  // 
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
	name 					=	"Duch v�na";

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
					Doc_PrintLines	( nDocID,  0, "Moc hrozn�"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "...u� jsem toho v �ivot� vyzkou�el spoustu, ale tohle ovoce, kter� mi minul� t�den p�ivezli z ciziny, p�ed�ilo v�echna m� o�ek�v�n�..."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  0, "...���va z t�chto hrozn� je daleko vydatn�j�� ne� cokoliv, co lze z�skat v t�chto kon�in�ch..."					);
					Doc_PrintLines	( nDocID,  0, "");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "...tak�e zat�m to jde dob�e. Ale po��d mi ned� sp�t pomy�len�, co by se mohlo st�t, kdyby n�kdo na�el m�j tajn� destila�n� apar�t. Rad�i ani nechci v�d�t, co by mi za to dr�bov� provedli - nakonec by m� mohli hodit p�es bari�ru..."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "...za��naj� m�t podez�en�. Rad�i se odsud uklid�m a chv�li po�k�m, a� se v�ci trochu uklidn� a budu se moci op�t vr�tit k pr�ci. Hlavn� mus�m m�t jistotu, �e po mn� u� nejdou...");
					Doc_Show		( nDocID );
};

