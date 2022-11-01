//Missionitems 2. Kapitel

//********************************************
//	Xardas´ Stein des Wissens   liegt im alten Demonenbeschwörerturm auf dem Tisch in seinem alten Studierzimmer!
//********************************************

INSTANCE ItMi_StoneOfKnowlegde_MIS (C_Item)
{
	name 				=	"Piedra del conocimiento";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_StoneOfKnowlegde_MIS.3DS";
	material 			=	MAT_STONE;

	description			= 	name;

};

//**********************************************************************************
//	BRIEF von Garond an Lord Hagen
//----------------------------------------------------------------------------------

INSTANCE ItWr_PaladinLetter_MIS		(C_Item)
{
	name 				=	"Carta";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePaladinLetter;
	scemeName			=	"MAP";
	description			= "Un carta para lord Hagen";
};
func void UsePaladinLetter ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "¡Lord Hagen!");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "La expedición al Valle de las Minas ha fracasado. Hemos sufrido numerosas bajas. Los supervivientes están atrapados en el castillo, asediados por los orcos.");
					Doc_PrintLines	( nDocID,  0, "Hemos sufrido varios ataques de dragones, que han devastado las tierras que rodean al castillo. Con la ayuda de Innos podremos aguantar hasta que lleguen refuerzos. Es imposible salir.");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Que Innos nos guarde a todos.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Garond");
					Doc_Show		( nDocID );
		
};
//**********************************************************************************
//	Schmuggelbrief von Milten an Gorn
//----------------------------------------------------------------------------------

INSTANCE ItWr_LetterForGorn_MIS		(C_Item)
{
	name 				=	"Carta";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLetterForGorn;
	scemeName			=	"MAP";
	description			= 	"Nota de Milten para Gorn";
};
func void UseLetterForGorn ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Gorn"					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLines	( nDocID,  0, "Garond ha accedido a liberarte a cambio de 1000 piezas de oro.");
					Doc_PrintLines	( nDocID,  0, "Por lo tanto, si tienes oro guardado, sería un buen momento para sacarlo.");
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Milten"					);
					Doc_Show		( nDocID );
		
};

//********************************************
//	Kerkerschlüssel der Burg im Minental
//********************************************


INSTANCE ItKe_PrisonKey_MIS(C_Item)
{
	name 				=	"Llave de la mazmorra";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"La llave de la mazmorra";
	TEXT[3]				= 	"del castillo.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//********************************************
//	Schlüssel Erzlager der Burg im Minental
//********************************************
INSTANCE ItKe_OC_Store(C_Item)
{
	name 				=	"Llave del almacén";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"La llave del almacén";
	TEXT[3]				= 	"del castillo.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Erzbaron Flur der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronFlur(C_Item)
{
	name 				=	"Llave de puerta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Para la primera puerta.";
	
	TEXT[2]				= 	"Hay un nombre grabado.";
	TEXT[3]				= 	"Gómez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Erzbaron Raum der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronRaum(C_Item)
{
	name 				=	"Llave de puerta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Para la segunda puerta.";
	
	TEXT[2]				= 	"Hay un nombre grabado.";
	TEXT[3]				= 	"Gómez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Der Schatz von Gorn
//********************************************

INSTANCE ItMi_GornsTreasure_MIS(C_Item)
{
	name 				=	"Bolsón de cuero";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	250;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseGornsTreasure;
	
	description			= 	"Bolsa de cuero de Gorn.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseGornsTreasure ()
{
	B_PlayerFindItem (ItMi_Gold,250);   
	Gorns_Beutel = TRUE;
};
//**********************************************************************************
//	Schreiben von Silvestro
//----------------------------------------------------------------------------------

INSTANCE ItWr_Silvestro_MIS		(C_Item)
{
	name 				=	"Nota";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseItwr_Silvestro;
	scemeName			=	"MAP";
	description			= 	"Nota de Silvestro";
};
func void UseItwr_Silvestro ()
{   
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;							// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
				Doc_PrintLine	( nDocID,  0, "Del paladín de Rey, Silvestro");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Otro día de espera. Hoy intentaremos atravesar el muro y excavar.");
				Doc_PrintLines	( nDocID,  0, "Todo esto me da mala espina, por lo que voy a tener que esconder el mineral.");
				Doc_PrintLines	( nDocID,  0, "Diego es el único que conoce el camino. Tengo que confiar en él. Llevará el cofre a lugar seguro, pero no le voy a dejar solo.");	
				Doc_PrintLines	( nDocID,  0, "Hay que proteger el mineral como sea, así que mandaré dos caballeros con Diego.");	
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "Larga vida al Rey.");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "Silvestro");
				Doc_Show		( nDocID );
				
};
//**********************************************************************************
//	Krallen des Rudelführers
//----------------------------------------------------------------------------------
INSTANCE ItAt_ClawLeader (C_Item)
{
	name 				=	"Garras de chasqueador";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	100;

	visual 				=	"ItAt_Claw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Garras del líder de la manáda";
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Olavs Beutel 
//----------------------------------------------------------------------------------
INSTANCE ItSe_Olav	(C_Item)
{
	name 				=	"Bolsón de cuero";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseOlav;
	
	description			= 	"Bolsa de Olav";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"En su interior suenan monedas.";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseOlav ()
{
		B_PlayerFindItem (ItMi_Gold,25);
};
/******************************************************************************************/
instance ItMi_GoldPlate_MIS (C_Item)
{
	name 				=	"Bandeja de oro";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldPlate;

	visual 				=	"ItMi_GoldPlate.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//********************************************
//	Schlüssel Erzlager der Burg im Minental
//********************************************
INSTANCE ItKe_Pass_MIS(C_Item)
{
	name 				=	"Llave de pasadizo";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Una llave pequeña.";
	TEXT[1]				= 	"Abre la puerta del pasadizo.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Bromor
//********************************************
INSTANCE ItKe_Bromor(C_Item)
{
	name 				=	"Llave de Bromor";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"La llave de la habitación";
	TEXT[1]				= 	"dueño del burdel.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schlüssel Runenstein
//********************************************
INSTANCE ITKE_RUNE_MIS(C_Item)
{
	name 				=	"Llave";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Una llave pequeña de un cofre.";
	
	TEXT[1]				= 	"El cofre con el que corresponde esta llave";
	TEXT[2]				= 	"está debajo del puente.";
	TEXT[3]				= 	"Contiene una piedra rúnica.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Bloodfly Stachel ausschlürfen lernen
//----------------------------------------------------------------------------------
INSTANCE ItWr_Bloody_MIS		(C_Item)
{
	name 				=	"Nota";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBloodMIS;
	scemeName			=	"MAP";
	description			= 	"Veneno de moscas de sangre";
};
func void UseBloodMIS ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "El aguijón de una mosca de sangre contiene un veneno mortal que nadie en sus cabales se atrevería a coger."					);
					Doc_PrintLines	( nDocID,  0, "A menos que conozca el arte de quitar el aguijón y la siguiente regla.");
					Doc_PrintLines	( nDocID,  0, "El aguijón debe cortarse cuidadosamente con una cuchilla afilada, desde la base hasta la punta.");					
					Doc_PrintLines	( nDocID,  0, "Se debe retirar la capa superior de piel. El tejido expuesto debe cortarse alrededor de las glándulas."					);
					Doc_PrintLines	( nDocID,  0, "El extracto especial del tejido tiene propiedades curativas.");
					Doc_PrintLines	( nDocID,  0, "Sin embargo, el cuerpo humano desarrolla con el tiempo inmunidad a la poción curativa."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Damarok");
					Doc_Show		( nDocID );
					
		if (Knows_Bloodfly == FALSE)
		{
			Knows_Bloodfly = TRUE;
			Log_CreateTopic (Topic_Bonus,LOG_NOTE);
			B_LogEntry (Topic_Bonus, "Ahora sé qué hacer para extraer jugos curativos de los aguijones de las moscas de sangre.");
			B_GivePlayerXP (XP_Ambient);
		};		
};
//**********************************************************************************
//	Brief von Lutero
//----------------------------------------------------------------------------------

INSTANCE ItWr_Pfandbrief_MIS		(C_Item)
{
	name 				=	"Nota para Debenture";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePfandbrief;
	scemeName			=	"MAP";
	description			= 	name;
};
func void UsePfandbrief ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Se aceptará el empeño de objetos"					);
					Doc_PrintLine	( nDocID,  0, "para cancelar deudas cuantiosas, siempre"					);
					Doc_PrintLine	( nDocID,  0, "que el valor iguale al de las deudas."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Empeñado: un cáliz de oro ornamentado"					);
					Doc_PrintLines	( nDocID,  0, "de la colección de cálices de sangre");
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "firmado");
					Doc_PrintLine	( nDocID,  0, "Lutero, mercader"					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Lehmar, prestamista"					);
					Doc_Show		( nDocID );
		
};

instance ItWr_Map_OldWorld_Oremines_MIS (C_Item)
{
	name 		= "Mapa de la mina de Garond";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 50;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_OldWorld_Oremines;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};
	func void Use_Map_OldWorld_Oremines ()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_OldWorld_Oremines_MIS);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_OldWorld_Oremines.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);
	};

//**********************************************************************************
//	Ruf des Dominique
//----------------------------------------------------------------------------------

INSTANCE ItWr_Manowar		(C_Item)
{
	name 				=	"Texto";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseManowar;
	scemeName			=	"MAP";
	description			=   "Letra de canción.";
};
func void UseManowar ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Llanto de Dominique");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Cosecharemos su gloria.");
					Doc_PrintLines	( nDocID,  0, "Innos está conmigo y mis hermanos.");					
					Doc_PrintLines	( nDocID,  0, "Sacrificaré como a un cordero a aquel que quiera pararme"					);
					Doc_PrintLines	( nDocID,  0, "ya que Él es el fuego de mi corazón."					);
					Doc_PrintLines	( nDocID,  0, "Mi acero le sirve solo a Él."					);
					Doc_PrintLines	( nDocID,  0, "En este día, Su nombre resonará."					);
					Doc_PrintLines	( nDocID,  0, "Aquel que se me oponga"					);
					Doc_PrintLines	( nDocID,  0, "morirá a mis manos");
					Doc_PrintLines	( nDocID,  0, "ya que soy un guerrero de Innos."					);
					
					Doc_Show		( nDocID );
		
};

//**********************************************************************************
//	BRIEF der Wassermagier
//----------------------------------------------------------------------------------

INSTANCE ItWr_KDWLetter		(C_Item)
{
	name 				=	"Mensaje";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseKDWLetter;
	scemeName			=	"MAP";
	description			=  "Un mensaje.";
};
func void UseKDWLetter ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Hemos abandonado el campamento. Ahora que la barrera ha caído, buscaremos en el centro de la destrucción. Puede que allí encontremos las respuestas que llevamos tantos años buscando. Solo Adanos parece saber adónde nos lleva nuestro viaje."					);
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Adanos está con nosotros."					);
					Doc_PrintLine	( nDocID,  0, "Saturas");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_Show		( nDocID );
		
};
//**********************************************************************************
//	BRIEF von Gilbert
//----------------------------------------------------------------------------------

INSTANCE ItWr_GilbertLetter		(C_Item)
{
	name 				=	"Nota";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseGilbertLetter;
	scemeName			=	"MAP";
	description			=  "Un mensaje.";
};
func void UseGilbertLetter ()
{   

		var int nDocID;
		
			nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Estoy harto. Ya llevo suficiente tiempo aquí escondido. Y, si he oído bien, la barrera por fin ha caído."					);
					Doc_PrintLines	( nDocID,  0, "Parece improbable que me estén buscando. Ya estoy harto de esta cueva y de todo el condenado valle. Es hora de volver a casa.");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Gilbert");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_Show		( nDocID );
		
};

INSTANCE ItRi_Tengron(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	Value_Ri_Hp;

	visual 					=	"ItRi_Hp_01.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Tengron;
	on_unequip				=	UnEquip_ItRi_Tengron;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description				= NAME_ADDON_TengronsRing;
	
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= Ri_Hp;
	
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
		
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
	
};

	FUNC VOID Equip_ItRi_Tengron()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
	};

	FUNC VOID UnEquip_ItRi_Tengron()
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
