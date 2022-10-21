//**********************************************************************************
//	Brief von Lucia an William
//**********************************************************************************
INSTANCE ITWr_Addon_Hinweis_02		(C_Item)
{
	name 				=	"D�le�it� zpr�va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Hinweis_02;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=  "Z hospody v t�bo�e bandit�";
};
func void Use_Hinweis_02 ()
{
		var int nDocID;
	
		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Hele lidi,");
					Doc_PrintLines	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Lou zmizel v ba�in�ch. Nejsp� ho se�rali mo��lov� �raloci.");	
					Doc_PrintLines	( nDocID,  0, "A co h�� - spolu s n�m zmizel i kl�� ode dve��."					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Jestli ho najde�, m��e� si nechat v�ecky Louovy v�ci!");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Snaf");
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Heiltrunk
//**********************************************************************************
INSTANCE ITWr_Addon_Health_04		(C_Item)
{
	name 				=	"Recept na l��iv� lektvar";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1000;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Heilrezept_04;
	scemeName			=	"MAP";
	description			= 	"�ist� �ivotn� energie";
	
	TEXT[2]				=	"Jak nam�chat mocn� elix�r.";
	TEXT[3]				=	"K pou�it� pot�ebuje� zn�t l��iv� elix�ry.";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};
func void Use_Heilrezept_04 ()
{
		var int nDocID;
		
		if Npc_IsPlayer (self)
		{
			if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
			{
				PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
				Snd_Play ("LevelUP");
				B_LogEntry (TOPIC_TalentAlchemy,"K v�rob� lektvaru �ist� �ivotn� energie pot�ebuji 1 lu�n� pohanku a 3 l��iv� esence.");
			};
		};
		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Jak vyrobit lektvar �ist� �ivotn� energie:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pot�ebuje� jednu lu�n� pohanku a t�i esence hojiv� s�ly.");	
					Doc_PrintLines	( nDocID,  0, "V�e dob�e sm�chej a sva� podle receptu na l��iv� lektvary.");	
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Tento lektvar mohou vyr�b�t pouze alchymist�, kte�� znaj� recept na l��iv� lektvary.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Manatrunk
//**********************************************************************************
INSTANCE ITWr_Addon_Mana_04		(C_Item)
{
	name 				=	"Recept na manu";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1500;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Manarezept_04;
	scemeName			=	"MAP";

	description			= 	"�ist� mana";
	
	TEXT[2]				=	"Jak nam�chat mocn� elix�r.";
	TEXT[3]				=	"K pou�it� pot�ebuje� zn�t lektvary many.";
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};
func void Use_Manarezept_04 ()
{
		var int nDocID;
		
		if Npc_IsPlayer (self)
		{
			if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
			{
				PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
				Snd_Play ("LevelUP");
				B_LogEntry (TOPIC_TalentAlchemy,"K v�rob� lektvaru many pot�ebuji 1 lu�n� pohanku a 3 esence many.");
			};
		};
		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Jak vytvo�it lektvar many:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Pot�ebuje� jednu lu�n� pohanku a t�i esence magick� s�ly.");	
					Doc_PrintLines	( nDocID,  0, "V�e dob�e sm�chej a sva� podle receptu na lektvary many.");	
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Tento lektvar mohou vyr�b�t pouze alchymist�, kte�� znaj� recept na lektvary many.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Brief von Lucia an William
//**********************************************************************************
INSTANCE ITWr_Addon_Hinweis_01		(C_Item)
{
	name 				=	"D�le�it� tip";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Hinweis_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=  "Z chatr�e v ba�in�.";
};
func void Use_Hinweis_01 ()
{
		var int nDocID;
	
		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Zdrav�m,");
					Doc_PrintLines	( nDocID,  0, "V�ci v truhl�ch maj slou�it pro p��pad nouze.");	
					Doc_PrintLines	( nDocID,  0, "A jsou pro KA�D�HO. Tak�e kdy� budete n�co pot�ebovat, klidn� si to vemte.");	
					Doc_PrintLines	( nDocID,  0, "Ale vemte si jenom tolik, kolik pot�ebujete."					);
					Doc_PrintLines	( nDocID,  0, "Kdy� to tak bude d�lat ka�dej, bude to fungovat."					);
					Doc_PrintLines	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Fletcher");
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Brief von Lucia an William
//**********************************************************************************
INSTANCE ITWr_Addon_William_01		(C_Item)
{
	name 				=	"Zpr�va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_William_01;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Tohle m�l u sebe ryb�� William.";
};
func void Use_William_01 ()
{
		var int nDocID;
	
		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Williame. ");
					Doc_PrintLines	( nDocID,  0, "A� bude �pln�k, odl�k�me hl�dku.");	
					Doc_PrintLines	( nDocID,  0, "Vpli� se dovnit�, ale bu� opatrn�!");	
					Doc_PrintLines	( nDocID,  0, "Z ba�iny se dostane�, kdy� p�jde� po cest� z kl�d."					);
					Doc_PrintLines	( nDocID,  0, "T�bor pir�t� je na druh� stran� �dol�, a� na z�pad�."					);
					Doc_PrintLines	( nDocID,  0, "Odsud u� s lod� zmiz� snadno.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Tajn� p��znivce");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Rezept von Miguel (Minecrawler Trank)
//**********************************************************************************
INSTANCE ITWr_Addon_MCELIXIER_01		(C_Item)
{
	name 				=	"Recept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_MCELIXIER_01;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Recept na elix�r pozm�n�n� mysli.";
	Text[1]				= 	"Tento lektvar pom��e obnovit ztracen� vzpom�nky.";
};
func void Use_MCELIXIER_01 ()
{
		Knows_MCELIXIER = TRUE;
		var int nDocID;
	
		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "Elix�r pozm�n�n� mysli");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "K nam�ch�n� tohoto lektvaru pot�ebuje� dv� �ihadla z krvav�ch much.");	
					Doc_PrintLines	( nDocID,  0, "D�le p�idej jeden extrakt z many a jednu l��ivou esenci.");	
					Doc_PrintLines	( nDocID,  0, "V�e p�ive� k varu a p�iho� s��ek �erven�ho pep�e."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "O nam�ch�n� tohoto lektvaru nech� se pokou�� pouze alchymista dob�e znal� sv�ho oboru, jen� um� z�skat jed ze �ihadel.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Deal Brief von Esteban an zwei Piraten
//**********************************************************************************
INSTANCE ITWr_Addon_Pirates_01		(C_Item)
{
	name 				=	"Uma�t�n� zpr�va";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Pirates_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=	"Tuhle zpr�vu jsi na�el v Angusov� kapse.";
};
func void Use_Pirates_01 ()
{
	Read_JuansText = TRUE;
	
	var int nDocID;
	
		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Pir�t�m:"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Dostal jsem posledn� dod�vku ur�enou pro n�s.");	
					Doc_PrintLine	( nDocID,  0, "Pak v�m ji p�inesu do jeskyn�. Sejdeme se tam.");	
					Doc_PrintLines	( nDocID,  0, "Zaplat�m dvojn�sobnou hodnotu ve zlat�."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Takhle se to d�l�");	
					Doc_PrintLine	( nDocID,  0, "Tom");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Rezept f�r gr�nene Novizen
//**********************************************************************************
INSTANCE ITWr_Addon_Joint_01		(C_Item)
{
	name 				=	"Zelen� novic";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Joint_Rezept_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				= 	"Z Fortunovy truhly";
};
func void Use_Joint_Rezept_01 ()
{
		var int nDocID;
	
		Green_Extrem = TRUE;
		
		
		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Zelen� novic"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "(...) Tyhle �peky se sice bal� dob�e, ale v na�em t�bo�e v ba�in�ch jsme m�li o t��du lep�� zbo��.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Kdybych tak m�l v�ta�ek ze dvou lodyh tr�vy z ba�in a p�idal k nim lu�n� pohanku, mohl bych nam�chat jointa stejn� dobr�ho, jako b�val zelen� novic."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Zelen� novic ti�� ve�kerou bolest a vy�ist� ti hlavu.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );

};
//**********************************************************************************
//	Schnapsbrennen Rezept
//**********************************************************************************
INSTANCE ITWr_Addon_Lou_Rezept		(C_Item)
{
	name 				=	"Recept na Lou�v cloum�k";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	70;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLouRezept;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Recept na v�robu Louova cloum�ka";
};
func void UseLouRezept ()
{
		Knows_LousHammer = TRUE;
		
		
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "Recept na Lou�v cloum�k"					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Ingredience pro v�robu cloum�ka:");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Vezmi jednu l�hev, dva tu��ny a po��dnou porci tr�vy z ba�in.");	
					Doc_PrintLines	( nDocID,  0, "P�idej rozemlet� zuby mo��lov�ho �raloka."					);
					Doc_PrintLines	( nDocID,  0, "V�echno nasypej do l�hve a sva� s pan�kem rumu."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Na zdrav�.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Podle star�ho slepce je zdrav�j��, kdy� se nenad�ch� v�par�.");	
					Doc_Show		( nDocID );

};
//**********************************************************************************
//	Doppelhammer
//**********************************************************************************
INSTANCE ITWr_Addon_Lou_Rezept2		(C_Item)
{
	name 				=	"Recept na Lou�v supercloum�k";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	140;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLouRezept2;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Recept na v�robu Louova supercloum�ku.";
};
func void UseLouRezept2 ()
{
		Knows_SchlafHammer = TRUE;
		
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "Lou�v supercloum�k"					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Vezmi star� dobr� Lou�v cloum�k a znovu jej p�edestiluj.");
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "To by ale m�li d�lat jen ti nejzku�en�j�� pali�i.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Jestli to zkus� n�jak� nezku�en� lama, m��e z toho oslepnout nebo rovnou zcepen�t.");	
					
					Doc_Show		( nDocID );

};

//**********************************************************************************
//	Piratentod
//**********************************************************************************
INSTANCE ITWr_Addon_Piratentod		(C_Item)
{
	name 				=	"Rychl� herynek";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezeptPiratentod;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Recept na rychl�ho herynka";
};
func void UseRezeptPiratentod ()
{
		Knows_SchnellerHering = TRUE;
		
		
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Rychl� herynek (ode m�)"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Mal� povzbuzen� pro skute�n� mu�e");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Jako obvykle pot�ebuje� l�hev, kterou napln� m�rkou rumu a p�id� �erstvou rybu.");	
					Doc_PrintLines	( nDocID,  0, "A� tekutina za�ne fialov�t, vyjme� rybu a m�sto n� p�isype� �erstv� natrhan�"					);
					Doc_PrintLines	( nDocID,  0, "ch�apav�� b�l�, aby dodalo chu� i aroma."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Ale opatrn�, tohle pit� je celkem zabij�k.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_Show		( nDocID );

};
//------------------------------------------------------------------------------------------
INSTANCE Fakescroll_Addon (C_Item)
{	
	name 					=	"Kousek pap�ru";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	hp 						=	5;
	hp_max 					=	5;
	weight 					=	1;
	value 					=	0;

	visual 					=	"Fakescroll.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAPSEALED";	
	
	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};
//------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_AxtAnleitung (C_ITEM)
{	
	name 				=	"N�vod na sekyru bandit�";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 					=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseAxtAnleitung;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"N�vod na v�robu lehk� a ostr� sekyry.";
};
func void UseAxtAnleitung ()
{
		if (Npc_GetTalentSkill 	(hero, NPC_TALENT_SMITH) >= 1)
		{
			Knows_Banditenaxt = TRUE;
		};
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Sekyra bandit�"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "Jednoru�n� sekyra");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Tuhle zvl�tn� sekyru vykov� ka�d�, kdo zn� alespo� z�klady kova�iny.");	
					Doc_PrintLines	( nDocID,  0, "Pot�ebuje� dva kousky rozp�len�ho surov�ho �eleza."					);
					Doc_PrintLines	( nDocID,  0, "Kousek rudy a t�i zuby z vlka, ch�apavce nebo podobn� �elmy."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Rudu, zuby a �elezo polo� na kovadlinu a v�echno po��dn� skuj dohromady.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Hotov� sekyra bude velmi lehce ovladateln� a v boji mimo��dn� ��inn�.");
					Doc_PrintLines	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};


//------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_SUMMONANCIENTGHOST (C_ITEM)
{	
	name 				=	"Vyvol�v�m 'Quarhodrona'";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseSummonAncientGhost;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"T�mto kouzeln�m svitkem lze p�ivolat Quarhodrona.";
};
func void UseSummonAncientGhost ()
{
	if (SC_SummonedAncientGhost == FALSE)
	{
		 B_Say (self, self, "$ADDON_SUMMONANCIENTGHOST");
		
		if (Npc_GetDistToWP(self,"ADW_ANCIENTGHOST")<1000)  
		{ 
			Wld_InsertNpc 	(NONE_ADDON_111_Quarhodron, "ADW_ANCIENTGHOST");
	 		Wld_PlayEffect("spellFX_Maya_Ghost",  NONE_ADDON_111_Quarhodron, NONE_ADDON_111_Quarhodron, 0, 0, 0, FALSE ); 
	 		Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",  NONE_ADDON_111_Quarhodron, NONE_ADDON_111_Quarhodron, 0, 0, 0, FALSE ); 
	 		Snd_Play ("MFX_GhostVoice"); 
	 		Snd_Play ("MFX_Firestorm_Cast"); 
	 		Snd_Play ("MFX_Lightning_Origin");
	 		SC_SummonedAncientGhost = TRUE;
	    }
		else
		{
			B_Say (self, self, "$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};

//////////////////////////////////////////////////////////////////////////////
//
//	MAPS
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_AddonWorld (C_Item)
{
	name 		= "Zapomenut� �dol� stavitel�.";  

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 250;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_AddonWorld;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Map_AddonWorld ()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_AddonWorld);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_AddonWorld.tga", TRUE);  // TRUE = scale to fullscreen
 				    Doc_SetLevel        (Document, "Addon\AddonWorld.zen");
   					Doc_SetLevelCoords  (Document, -47783, 36300, 43949, -32300);
   			 //Joly:Doc_SetLevelCoords  (Document, -47783, 36300, 43949, -32300);
   			 //Nico:Doc_SetLevelCoords  (Document, -43000, 39000, 43000, -29000);
					Doc_Show			(Document);
	};
	
