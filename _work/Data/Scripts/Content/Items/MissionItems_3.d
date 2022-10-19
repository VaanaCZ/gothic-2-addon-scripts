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
	name 				=	"Ojo de Innos";

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

	TEXT	[0]			=	"La energía late a través del Ojo.";

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
	name 				=	"Ojo de Innos"; 

	mainflag 			=	ITEM_KAT_MAGIC;
	flags 				=	ITEM_AMULET|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_InnosEye_MIS.3DS";	
	material 			=	MAT_STONE;

	description			= 	name;
	on_equip			=	Equip_ItMi_InnosEye_Discharged_Mis;
	TEXT	[0]			=	"El Ojo está apagado y no brilla.";
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
};

INSTANCE ItMi_InnosEye_Broken_Mis (C_Item)	
{
	name 				=	"Ojo de Innos"; 

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
	name 				=	"Carta de autorización";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_PermissionToWearInnosEye;
	scemeName			=	"MAP";
	description			= "Carta de autorización para Pyrokar.";
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
						Doc_PrintLines	(nDocID,  0, "El portador de esta nota está autorizado a entrar en las salas sagradas del monasterio.");
						Doc_PrintLines	(nDocID,  0, "Sus deseos en relación a la posesión del Ojo de Innos deberán satisfacerse de inmediato.");
						Doc_PrintLines	(nDocID,  0, "Estas órdenes deben considerarse válidas por mi autoridad como señor de la isla y representante del Rey, así como por el tratado de la división de la Iglesia de Innos en el año 2 del fuego.");
						Doc_PrintLines	(nDocID,  0, "No hablaré más de este tema y espero que mis instrucciones se cumplan.");
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, "Que Innos bendiga al Rey."						);
						Doc_PrintLine	(nDocID,  0, ""												);
						Doc_PrintLine	(nDocID,  0, "        Lord Hagen"								);
						Doc_Show		(nDocID );				
		
};

//**********************************************************************************
//	ItWr_XardasBookForPyrokar_Mis
//**********************************************************************************

INSTANCE ItWr_XardasBookForPyrokar_Mis (C_ITEM) 
{	
	name 					=	"Los salones de Irdorath";

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
	name 				=	"Llave de Xardas" ;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_02;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[0]				=   "Para el cofre de la granja de Sekob.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//**********************************************************************************
//	ItWr_CorneliusTagebuch_Mis 
//**********************************************************************************

INSTANCE ItWr_CorneliusTagebuch_Mis (C_ITEM) 
{	
	name 					=	"Diario";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Diario";
	TEXT	[0]				=	"El diario de Cornelius.";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseCorneliusTagebuch;
};

	FUNC VOID UseCorneliusTagebuch()
	{   
		Cornelius_IsLiar = TRUE;
		B_LogEntry (TOPIC_RESCUEBENNET,"El diario es la prueba que necesito para probar la inocencia de Benner.");	
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite
					Doc_SetFont 	( nDocID,  -1, FONT_Book	   			); 	// -1 -> all pages 
 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels					
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Si Larius sigue así, tendré que buscar otra posición.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Anoche me pasó algo extraño. Recibí en casa la visita de uno de esos tipos con capuchas negras de los que tanto hemos oído hablar últimamente. Lo cierto es que no estaba nervioso, aunque se supone que son malvados. Casi se puede sentir el poder que tienen. Pero la voz era tranquila y hacía que confiaras en el tipo.");

					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Me ofreció 20.000 piezas de oro para asegurarse de que uno de los mercenarios fuera encerrado. Dijo que sabría lo que quería decir cuando ocurriera."	);
					Doc_PrintLines	( nDocID,  1, "Por supuesto, acepté de inmediato. De todas maneras esos mercenarios no se merecen nada mejor. Si no llega a ser por ellos, todo me iría bien. El oro me garantizará una jubilación acomodada."					);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Ha ocurrido, han detenido a uno de los mercenarios. No me va a costar mantener mi palabra.");
					Doc_Show		( nDocID );
					

	PrintScreen ("", -1, -1, FONT_Screen, 0);
					
};

//**********************************************************************************
//	ITWR_DementorObsessionBook_MIS 			//Joly: DementorBuch, der Bessenheit, Ein NSC trägt dieses Buch mit sich, wenn er von einem Dementor kurzzeitig übernommen wurde.)
//**********************************************************************************

INSTANCE ITWR_DementorObsessionBook_MIS (C_ITEM) 
{	
	name 					=	"Almanáque de los poseídos";

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
					Doc_PrintLine	( nDocID,  0, "en campana de Sparady"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "el utoy"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, " Kho ray xaondron");
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
						Doc_PrintLine	(nDocID, 1, "                          VINO"								);
						Doc_PrintLine	(nDocID, 1, "FERNANDO"										);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "        MALAK"									);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "BROMOR"										);
					};
					if (Kapitel >= 4)
					{
						Doc_PrintLine	(nDocID, 1, "                       ENGROM"								);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "        RANDOLPH"									);
						Doc_PrintLine	(nDocID, 1, ""												);
					};
					if (Kapitel >= 5)
					{
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, ""												);
						Doc_PrintLine	(nDocID, 1, "                        SEKOB"								);
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
	name 				=	"Carta mágica de Pyrokar";

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
					Doc_PrintLine	( nDocID,  0, "El poseído"					);
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

	description		= 	"Cura de la fiebre negra";
	
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
	name 				=	"Hoz Cayado";  

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
	TEXT[0]				= 	"Se ha grabado en la parte";
	TEXT[1]				= 	"superior la letra ''M''.";					

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
	name 				=	"¡Una bolsa llena de oro!";

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
	name 				=	"Grasa de ratopo";

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
	name 				=	"Carta para Babo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosLetter;
	scemeName			=	"MAP";
	description			= "Un carta para Babo.";
};
func void Use_BabosLetter ()
{   
 
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Querido Babo,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Seguro que te preguntas cómo hemos logrado escribirte esta carta. Le llevamos todos nuestros ahorros al maestro Marlas y le pedimos que te escribiese estas líneas. Te deseamos lo mejor para el futuro y te enviamos un dibujo como regalo de despedida, para que nos recuerdes durante las largas noches en el monasterio.");
					Doc_PrintLines	( nDocID,  0, "Buena suerte. Esperamos que te guste el dibujo.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Feht y Bonka");
					
					Doc_Show		( nDocID );
					
			
		
};

//********************************************************
//	BabosPinup
//********************************************************

INSTANCE ItWr_BabosPinUp_MIS		(C_Item)
{
	name 				=	"Dibujo de una mujer";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosPinUp;
	scemeName			=	"MAP";
	description			= "El dibujo de una mujer desnuda.";
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
	name 				=	"Fajo de papeles";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_BabosDocs;
	scemeName			=	"MAPSEALED";
	description			= 	name;
	TEXT[2]				=   "Varios documentos enrollados";
	TEXT[3]				=   "y juntos.";
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
	name 				=	"Llave de cofre";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	"La llave del cofre";
	TEXT[3]				=   "que pertenece a Igaraz.";
	
}; 

//**********************************************************************************
//	ItWr_Astronomy_Mis
//**********************************************************************************

INSTANCE ItWr_Astronomy_Mis (C_ITEM) 
{	
	name 					=	"El poder divino de las estrellas";

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
					Doc_PrintLines	( nDocID,  0, "... Pero cuando la fuerza de un toro se combina con los ideales de un guerrero, cuidado con lo que pueda acontecer.");
					Doc_PrintLines	( nDocID,  0, "La fuerza desencadenada del toro y la perseverancia de un guerrero pueden acabar con el antiguo equilibrio de poderes. Las fronteras cósmicas de las dimensiones se debilitan, tanto que a las criaturas sombrías de Beliar les resulta sencillo entrar en nuestro mundo.");
					//2.Seite
					Doc_SetMargins	( nDocID,  -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Lo que sucedería a partir de ese momento lo podemos ver en las guerras de los tiempos antiguos, cuando el vínculo entre los mundos aún era fuerte. Los seguidores del mal trajeron la muerte y la destrucción al mundo, solo la ayuda de Innos y del Elegido pudo alejar al mal de la humanidad."	);
					Doc_PrintLines	( nDocID,  1, "Si volviera a existir una amenaza así, que Innos nos proteja, ya que desde hace más de cien años no ha habido ningún Elegido de Innos."					);
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

	description		= 	"Curación de posesión";
	
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
	name 				=	"Bolsón de cuero";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_GolemChest;
	
	description			= 	"Una bolsa de cuero.";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Está llena de monedas.";
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
	name 		= "Un mapa muy antiguo.";  // 
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
	name 				=	"Carta de Diego";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_DiegosLetter_Mis;
	scemeName			=	"MAP";
	description			= "Carta de Diego par Gerbrandt.";
};
func void Use_DiegosLetter_Mis ()
{   

		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Gerbrandt,");
					Doc_PrintLines	( nDocID,  0, "lo sabes, deberías haberme matado.");
					Doc_PrintLines	( nDocID,  0, "He vuelto a la ciudad y te estoy buscando. Y cuando te encuentre, te voy a hacer rodajitas, como si fueras un salchichón. Me conoces lo suficiente como para tener claro que no se me engaña sin consecuencias."); 
					Doc_PrintLines	( nDocID,  0, "Supongo que cuando hiciste que me arrojaran al otro lado de la barrera no te imaginabas que podría volver. Pues bien, te equivocaste.");
					Doc_PrintLines	( nDocID,  0, "He venido a por lo que me pertenece.");
					Doc_PrintLines	( nDocID,  0, "Tú única oportunidad de seguir vivo es que te largues cuanto antes y me dejes a mí tu negocio. Eso nos dejaría en paz.");				
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Diego");
					Doc_Show		( nDocID );
		
};

//*************************************************************************************
//		Diegos Goldschatz
//*************************************************************************************

INSTANCE ItSe_DiegosTreasure_Mis(C_Item)
{
	name 				=	"Bolsón de cuero lleno";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_DiegosTreasure;
	description			= 	"Vieja bolsa de cuero de Diego.";
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
	name 				=	"Agua bendita de Ulthar";

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
	name 				=	"Concesión de mina de mineral de Khorinis";

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
					Doc_PrintLine	(nDocID,  0, "Concesión de mina de mineral"									);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "Por el decreto de propiedad del Rey obtenido de tierras reales, el portador del presente documento ha recibido derechos de prospección en las tierras del rey.");
					Doc_PrintLines	(nDocID,  0, "Deberá limitarse al área de una pequeña parcela real.");
					Doc_PrintLines	(nDocID,  0, "De acuerdo con el decreto de medidas de tierras mineras, una pequeña parcela real se compone de 16 pasos en horizontal y 3 en vertical.");
					Doc_PrintLines	(nDocID,  0, "El prospector del reino no está sujeto a las obligaciones relacionadas con el acceso libre y la protección de prospecciones.");
					Doc_PrintLines	(nDocID,  0, "Si el propietario no puede pagar la renta, todos los derechos sobre la tierra revierten en el reino.");
					Doc_PrintLine	(nDocID,  0, "         firmado"									);
					Doc_PrintLine	(nDocID,  0, "      Prospector del rey"						);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "                Salandril"								);
					Doc_Show		(nDocID);
					
		SC_KnowsProspektorSalandril = TRUE;

	if (ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_MinenAnteile,"El tipo que vendió las concesiones de la mina a los mercaderes se llama Salandril. Probablemente le encontraré en el barrio alto de Khorinis, a menos que ya haya huido de la justicia."); 
	
		if (Npc_IsDead(Salandril))
		{
			B_LogEntry (TOPIC_MinenAnteile,"Salandril ha muerto. Voy a tener que decírselo a Serpentes."); 
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};

//**********************************************************************************
//	Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

INSTANCE  ItAm_Prot_BlackEye_Mis (C_Item)
{
	name 			=	"Amuleto de convocación de almas";

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
	
	TEXT[3] 		= "Protección contra la mirada oscura";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
		
};
//**********************************************************************************
//	Gestein aus gesegneter Erde für das Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

INSTANCE  ItMi_KarrasBlessedStone_Mis (C_Item)
{
	name 			=	"Piedra de suelo consagrado";

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
	name 				=	"Encargo del juez";

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
					Doc_PrintLines	( nDocID,  0, "Morgahard, eres un desgraciado inútil. Cumple mis órdenes o tendré que cambiar de idea y arrestaros a todos.");
					Doc_PrintLines	( nDocID,  0, "Tiene que ser mañana por la noche. Larius empieza a recelar.");
					Doc_PrintLines	( nDocID,  0, "Si no le sacamos ahora el dinero de los bolsillos, puede que sea demasiado tarde. Me aseguraré de que lo encuentras esta noche en el mercado.");
					Doc_PrintLines	( nDocID,  0, "Pero no hagas de esto un espectáculo o tendrás encima a la milicia antes de que te enteres.");
					Doc_PrintLines	( nDocID,  0, "Por cierto: si por un casual estira la pata, me parecerá estupendo."									);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "          Juez jefe y"		);
					Doc_PrintLine	( nDocID,  0, "          secretario del Rey"		);
					Doc_PrintLine	( nDocID,  0, ""			);
					
					Doc_Show		( nDocID );
		
};

//**********************************************************************************
//	ItWr_MorgahardTip
//----------------------------------------------------------------------------------

INSTANCE ItWr_MorgahardTip		(C_Item)
{
	name 				=	"Carta";

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
					Doc_PrintLines	(nDocID,  0, "He seguido adelante. Espero que volvamos a vernos cuando las cosas se calmen un poco.");
					Doc_PrintLines	(nDocID,  0, "No os preocupéis, chicos. Si todo lo demás falla, le pediré a Onar que se encargue de ello.");
					Doc_PrintLines	(nDocID,  0, "Todo irá bien."					);
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
	name 		= "Mapa de los altares sagrados";  // 
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
	name 					=	"El espíritu del vino";

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
					Doc_PrintLines	( nDocID,  0, "El poder de la uva"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "... En mis tiempos probé muchas, pero esta fruta que me trajeron del extranjero la semaná pasada ha superado todas mis expectativas..."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  0, "... El zumo de esta uva es más afrutado que cualquiera que se pueda encontrar en esta parte del país..."					);
					Doc_PrintLines	( nDocID,  0, "");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "... Hasta aquí todo bien. Pero me preocupa qué pueda pasar si me pillan en mi alambique secreto. No tengo ni idea de lo que me haría la milicia si me encuentra aquí. Podrían arrojarme al otro lado de la barrera..."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "... Sospechan. Voy a dejarlo todo hasta que las cosas se calmen un poco, y volveré al trabajo cuando esté seguro de que no andan tras de mí...");
					Doc_Show		( nDocID );
};

