//Missionitems 2. Kapitel

//********************************************
//	Xardas� Stein des Wissens   liegt im alten Demonenbeschw�rerturm auf dem Tisch in seinem alten Studierzimmer!
//********************************************

INSTANCE ItMi_StoneOfKnowlegde_MIS (C_Item)
{
	name 				=	"Kamie� Wiedzy";

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
	name 				=	"List";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePaladinLetter;
	scemeName			=	"MAP";
	description			= "List do Lorda Hagena";
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
					Doc_PrintLine	( nDocID,  0, "Lordzie Hagenie!");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ekspedycja do G�rniczej Doliny zako�czy�a si� kl�sk�. Ponie�li�my ogromne straty. Niedobitki schroni�y si� w zamku otoczonym przez ork�w.");
					Doc_PrintLines	( nDocID,  0, "Smoki atakowa�y nas wielokrotnie. Spustoszy�y tereny dooko�a zamku. Niechaj Innos pomo�e nam przetrwa� do przybycia posi�k�w. Zbrojny wypad z zamku nie jest mo�liwy.");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Niech nas Innos strze�e.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Garond");
					Doc_Show		( nDocID );
		
};
//**********************************************************************************
//	Schmuggelbrief von Milten an Gorn
//----------------------------------------------------------------------------------

INSTANCE ItWr_LetterForGorn_MIS		(C_Item)
{
	name 				=	"List";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLetterForGorn;
	scemeName			=	"MAP";
	description			= 	"List Miltena do Gorna";
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
					Doc_PrintLine	( nDocID,  0, "Gorn!"					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLines	( nDocID,  0, "Garond zgodzi� si� wypu�ci� ci� na wolno�� - za 1000 sztuk z�ota.");
					Doc_PrintLines	( nDocID,  0, "Je�li masz wi�c jakie� z�oto, lepiej powiedz, gdzie je ukry�e�.");
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Milten"					);
					Doc_Show		( nDocID );
		
};

//********************************************
//	Kerkerschl�ssel der Burg im Minental
//********************************************


INSTANCE ItKe_PrisonKey_MIS(C_Item)
{
	name 				=	"Klucz do lochu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Klucz do lochu";
	TEXT[3]				= 	"zamkowego.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//********************************************
//	Schl�ssel Erzlager der Burg im Minental
//********************************************
INSTANCE ItKe_OC_Store(C_Item)
{
	name 				=	"Klucz do magazynu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				= 	"Klucz do magazynu";
	TEXT[3]				= 	"zamkowego.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schl�ssel Erzbaron Flur der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronFlur(C_Item)
{
	name 				=	"Klucz do drzwi";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Klucz do pierwszych drzwi.";
	
	TEXT[2]				= 	"Wyryto na nim imi�.";
	TEXT[3]				= 	"Gomez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schl�ssel Erzbaron Raum der Burg im Minental
//********************************************
INSTANCE ITKE_ErzBaronRaum(C_Item)
{
	name 				=	"Klucz do drzwi";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Klucz do drugich drzwi.";
	
	TEXT[2]				= 	"Wyryto na nim imi�.";
	TEXT[3]				= 	"Gomez";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Der Schatz von Gorn
//********************************************

INSTANCE ItMi_GornsTreasure_MIS(C_Item)
{
	name 				=	"Sk�rzany mieszek";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	250;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseGornsTreasure;
	
	description			= 	"Sk�rzana sakwa Gorna.";
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
	name 				=	"Wiadomo��";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseItwr_Silvestro;
	scemeName			=	"MAP";
	description			= 	"Wiadomo�� od Silvestra";
};
func void UseItwr_Silvestro ()
{   
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;							// DocManager 
				Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
				Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
				Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
				Doc_PrintLine	( nDocID,  0, "Od kr�lewskiego paladyna Silvestra");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLines	( nDocID,  0, "Kolejny dzie� dr��enia przed nami. Dzi� zamierzamy przebi� si� przez �cian� skaln�.");
				Doc_PrintLines	( nDocID,  0, "Mam z�e przeczucia, wi�c zabezpiecz� wydobyt� dotychczas rud�.");
				Doc_PrintLines	( nDocID,  0, "Tylko Diego zna okolic�. Musz� mu wi�c zaufa�. To on zabierze skrzynie - ale nie puszcz� go samego.");	
				Doc_PrintLines	( nDocID,  0, "Musz� chroni� rud� za wszelk� cen�, wy�l� wi�c z nim dw�ch rycerzy.");	
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "Niech �yje Kr�l");
				Doc_PrintLine	( nDocID,  0, "");
				Doc_PrintLine	( nDocID,  0, "Silvestro");
				Doc_Show		( nDocID );
				
};
//**********************************************************************************
//	Krallen des Rudelf�hrers
//----------------------------------------------------------------------------------
INSTANCE ItAt_ClawLeader (C_Item)
{
	name 				=	"Pazury z�bacza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	100;

	visual 				=	"ItAt_Claw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Pazury przyw�dcy stada";
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
	name 				=	"Sk�rzana sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   UseOlav;
	
	description			= 	"Sakiewka Olava";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"W �rodku podzwania kilka monet.";
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
	name 				=	"Z�oty talerz";

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
//	Schl�ssel Erzlager der Burg im Minental
//********************************************
INSTANCE ItKe_Pass_MIS(C_Item)
{
	name 				=	"Klucz do prze��czy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Niewielki klucz";
	TEXT[1]				= 	"otwieraj�cy bram� na prze��czy.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schl�ssel Bromor
//********************************************
INSTANCE ItKe_Bromor(C_Item)
{
	name 				=	"Klucz Bromora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	"Klucz do pokoju w�a�ciciela";
	TEXT[1]				= 	"burdelu.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//********************************************
//	Schl�ssel Runenstein
//********************************************
INSTANCE ITKE_RUNE_MIS(C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	"Niewielki klucz do kufra.";
	
	TEXT[1]				= 	"Sam kufer znajduje si�";
	TEXT[2]				= 	"pod mostem.";
	TEXT[3]				= 	"W �rodku ukryto kamie� runiczny.";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Bloodfly Stachel ausschl�rfen lernen
//----------------------------------------------------------------------------------
INSTANCE ItWr_Bloody_MIS		(C_Item)
{
	name 				=	"Notatka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseBloodMIS;
	scemeName			=	"MAP";
	description			= 	"Trucizna krwiopijc�w";
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
					Doc_PrintLines	( nDocID,  0, "��d�o krwiopijcy zawiera �mierteln� trucizn�, na kt�r� trzeba bardzo uwa�a�."					);
					Doc_PrintLines	( nDocID,  0, "Dlatego podczas usuwania ��d�a nale�y przestrzega� nast�puj�cej zasady:");
					Doc_PrintLines	( nDocID,  0, "��d�o rozcinamy od ko�ca a� do samej podstawy.");					
					Doc_PrintLines	( nDocID,  0, "Usuwamy sk�r�, a nast�pnie nacinamy tkank� otaczaj�c� gruczo�."					);
					Doc_PrintLines	( nDocID,  0, "Zawiera ona substancj� o w�a�ciwo�ciach leczniczych.");
					Doc_PrintLines	( nDocID,  0, "Jednak ludzki organizm po jakim� czasie uodparnia si� na jej dzia�anie."					);
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Damarok");
					Doc_Show		( nDocID );
					
		if (Knows_Bloodfly == FALSE)
		{
			Knows_Bloodfly = TRUE;
			Log_CreateTopic (Topic_Bonus,LOG_NOTE);
			B_LogEntry (Topic_Bonus, "Teraz wiem, jak uzyska� substancj� lecznicz� z ��de� krwiopijc�w.");
			B_GivePlayerXP (XP_Ambient);
		};		
};
//**********************************************************************************
//	Brief von Lutero
//----------------------------------------------------------------------------------

INSTANCE ItWr_Pfandbrief_MIS		(C_Item)
{
	name 				=	"Weksel";

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
					Doc_PrintLine	( nDocID,  0, "D�ug mo�e zosta� sp�acony poprzez"					);
					Doc_PrintLine	( nDocID,  0, "przej�cie zastawionego przedmiotu, kt�rego"					);
					Doc_PrintLine	( nDocID,  0, "warto�� r�wna jest warto�ci d�ugu."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Zastawiono: ozdobny z�oty kielich"					);
					Doc_PrintLines	( nDocID,  0, "z kolekcji Krwawych Kielich�w");
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "podpisano");
					Doc_PrintLine	( nDocID,  0, "Lutero, kupiec"					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Lehmar, lichwiarz"					);
					Doc_Show		( nDocID );
		
};

instance ItWr_Map_OldWorld_Oremines_MIS (C_Item)
{
	name 		= "Mapa kopalni Garonda";

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
	name 				=	"Tekst";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseManowar;
	scemeName			=	"MAP";
	description			=   "S�owa pie�ni.";
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
					Doc_PrintLines	( nDocID,  0, "Lament Dominique");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "D��ymy do Jego �aski.");
					Doc_PrintLines	( nDocID,  0, "Innos chroni mnie i moich braci.");					
					Doc_PrintLines	( nDocID,  0, "Nie pozwol� si� zatrzyma� mym wrogom,"					);
					Doc_PrintLines	( nDocID,  0, "Albowiem w mym sercu p�onie Jego ogie�."					);
					Doc_PrintLines	( nDocID,  0, "Moje ostrze s�u�y tylko Jemu."					);
					Doc_PrintLines	( nDocID,  0, "Niechaj zabrzmi Jego �wi�te imi�."					);
					Doc_PrintLines	( nDocID,  0, "Ka�dy, kto mi si� sprzeciwi"					);
					Doc_PrintLines	( nDocID,  0, "zginie na miejscu,");
					Doc_PrintLines	( nDocID,  0, "bom jest wojownikiem Innosa."					);
					
					Doc_Show		( nDocID );
		
};

//**********************************************************************************
//	BRIEF der Wassermagier
//----------------------------------------------------------------------------------

INSTANCE ItWr_KDWLetter		(C_Item)
{
	name 				=	"Wiadomo��";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseKDWLetter;
	scemeName			=	"MAP";
	description			=  "Wiadomo��";
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
					Doc_PrintLines	( nDocID,  0, "Opu�cili�my ob�z i zamierzamy uda� si� do samego centrum destrukcji. Mo�e tam znajdziemy odpowiedzi, kt�rych szukali�my przez tyle lat. Jeden Adanos wie, dok�d zawiedzie nas ta �cie�ka."					);
					Doc_PrintLines	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "");					
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Adanos niech b�dzie z nami"					);
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
	name 				=	"Notatka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseGilbertLetter;
	scemeName			=	"MAP";
	description			=  "Wiadomo��";
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
					Doc_PrintLines	( nDocID,  0, "Mam ju� do��. Ukrywam si� tutaj strasznie d�ugo, a Bariera podobno upad�a."					);
					Doc_PrintLines	( nDocID,  0, "Teraz raczej nikt nie b�dzie mnie szuka�. Mam do�� tej jaskini i ca�ej tej cholernej doliny. Id� do domu.");
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
