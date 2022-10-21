//**********************************************************************************
//	Brief von Lucia an William
//**********************************************************************************
INSTANCE ITWr_Addon_Hinweis_02		(C_Item)
{
	name 				=	"Wichtiger Hinweis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Hinweis_02;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=  "Aus der Kneipe im Banditenlager";
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
					Doc_PrintLine	( nDocID,  0, "Hey Leute,");
					Doc_PrintLines	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Lou ist im Sumpf verschwunden, wahrscheinlich wurde er von den Haien gefressen.");	
					Doc_PrintLines	( nDocID,  0, "Viel schlimmer ist - mit ihm ist auch der Tür Schlüssel verschwunden."					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Also wer ihn findet, kann Lou's Kram behalten.");	
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
	name 				=	"Heiltrunk- Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1000;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Heilrezept_04;
	scemeName			=	"MAP";
	description			= 	"Reine Lebensenergie";
	
	TEXT[2]				=	"Zur Herstellung eines mächtigen Trunks.";
	TEXT[3]				=	"Zur Anwendung ist das Wissen über Elixiere der Heilung erforderlich.";
	
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
				B_LogEntry (TOPIC_TalentAlchemy,"Um einen Heiltrunk herzustellen, benötige ich 1 Feldknöterich und 3 Essenzen der Heilung.");
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
					Doc_PrintLines	( nDocID,  0, "Herstellung eines Heiltrunkes:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Benötigt wird ein Feldknöterich, sowie drei Essenzen der Heilung.");	
					Doc_PrintLines	( nDocID,  0, "Zusammenkippen und aufbrühen nach dem Rezept der Heilungs - Elixiere. ");	
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Dieser Trank kann nur von einem Alchemisten erstellt werden, der das Rezept der Heilungs - Elixiere kennt.");	
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
	name 				=	"Mana - Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1500;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Manarezept_04;
	scemeName			=	"MAP";

	description			= 	"Reines Mana";
	
	TEXT[2]				=	"Zur Herstellung eines mächtigen Trunks.";
	TEXT[3]				=	"Zur Anwendung ist das Wissen über Mana - Elixiere erforderlich.";
	
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
				B_LogEntry (TOPIC_TalentAlchemy,"Um einen Manatrunk herzustellen, benötige ich 1 Feldknöterich und 3 Mana - Essenzen.");
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
					Doc_PrintLines	( nDocID,  0, "Herstellung eines Manatrunkes:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Benötigt wird ein Feldknöterich, sowie drei Essenzen magischer Kraft.");	
					Doc_PrintLines	( nDocID,  0, "Zusammenkippen und aufbrühen nach dem Rezept der Mana - Elixiere. ");	
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Dieser Trank kann nur von einem Alchemisten erstellt werden, der das Rezept der Mana -Elixiere kennt.");	
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
	name 				=	"Wichtiger Hinweis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Hinweis_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=  "Hing an einer Hütte im Sumpf";
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
					Doc_PrintLine	( nDocID,  0, "Hey Leute,");
					Doc_PrintLines	( nDocID,  0, "Das Zeug in den Truhen ist für Notfälle gedacht. ");	
					Doc_PrintLines	( nDocID,  0, "Und es ist für ALLE da. Also nehmt euch nur was, falls ihr was davon braucht.");	
					Doc_PrintLines	( nDocID,  0, "Und nehmt nur soviel ihr braucht."					);
					Doc_PrintLines	( nDocID,  0, "Wenn sich alle daran halten, dann klappt es auch."					);
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
	name 				=	"Notiz";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_William_01;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Diese Notiz hatte der Fischer William bei sich.";
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
					Doc_PrintLine	( nDocID,  0, "William,");
					Doc_PrintLines	( nDocID,  0, "Wenn der Mond im vollen Licht steht, wird die Wache abgelenkt sein.");	
					Doc_PrintLines	( nDocID,  0, "Schleich dich raus - aber sei vorsichtig!");	
					Doc_PrintLines	( nDocID,  0, "Wenn du dem Knüppeldamm folgst, kannst du den Sumpf verlassen."					);
					Doc_PrintLines	( nDocID,  0, "Das Piratenlager liegt auf der anderen Seite des Tals weit im Westen. "					);
					Doc_PrintLines	( nDocID,  0, "Von dort sollte es dir ein leichtes sein mit dem Boot zu entkommen. ");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Jemand der es gut mit dir meint");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Rezept von Miguel (Minecrawler Trank)
//**********************************************************************************
INSTANCE ITWr_Addon_MCELIXIER_01		(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_MCELIXIER_01;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Rezept für den Elixier der Geistveränderung.";
	Text[1]				= 	"Dieser Trank hilft verlorenen Erinnerung zurück zu bringen.";
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
					Doc_PrintLine	( nDocID,  0, "Elixier der Geistveränderung");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Zur Herstellung des Trankes erforderlich, ist das Sekret aus zwei Blutfliegenstacheln.");	
					Doc_PrintLines	( nDocID,  0, "Dazu gibt man ein Mana Extrakt, sowie eine Essenz der Heilung.");	
					Doc_PrintLines	( nDocID,  0, "Abschließend wird in den köchelnden Sud ein Beutel roter Tränen - Pfeffer gerührt."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Nur ein kundigen Alchemist, der weiß wie das Sekret aus den Stacheln zu entnehmen ist, sollte sich an dem Trank versuchen. ");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Deal Brief von Esteban an zwei Piraten
//**********************************************************************************
INSTANCE ITWr_Addon_Pirates_01		(C_Item)
{
	name 				=	"Schmieriger Zettel";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Pirates_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=	"Diesen Zettel hatte Angus in der Tasche.";
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
					Doc_PrintLine	( nDocID,  0, "Ihr Piraten,"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Besorgt die letzte Lieferung, die für uns bestimmt ist.");	
					Doc_PrintLine	( nDocID,  0, "Bringt sie dann zu eurer Höhle. Dort treffen wir uns.");	
					Doc_PrintLines	( nDocID,  0, "Ich bezahle euch den doppelten Wert in Gold."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "So wird's gemacht");	
					Doc_PrintLine	( nDocID,  0, "Tom");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Rezept für grünene Novizen
//**********************************************************************************
INSTANCE ITWr_Addon_Joint_01		(C_Item)
{
	name 				=	"Der grüne Novize";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Joint_Rezept_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				= 	"Lag in der Truhe von Fortuno";
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
					Doc_PrintLine	( nDocID,  0, "Der grüne Novize"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "(...) Die Stengel lassen sich zwar prima drehen, aber was wir im Sumpflager hatten, war von anderem Kaliber.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Wenn ich die Essenz aus zwei Sumpfkrautpflanzen verwende, und dazu einen Feldknöterich, dann habe ich einen Stengel mit der Wirkung des grünen Novizen."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Der grüne Novize hilft gegen Schmerzen jeder Art und macht einen klaren Kopf.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );

};
//**********************************************************************************
//	Schnapsbrennen Rezept
//**********************************************************************************
INSTANCE ITWr_Addon_Lou_Rezept		(C_Item)
{
	name 				=	"Rezept für Lou's Hammer";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	70;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLouRezept;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Rezept zur Herstellung von Lou's Hammer.";
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
					Doc_PrintLine	( nDocID,  0, "Lou's Hammer Rezept"					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Zutaten für ein Hammergebräu:");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Man nehme eine Wasserflasche, sowie 2 Rüben und 'ne ordentliche Portion Sumpfkraut.");	
					Doc_PrintLines	( nDocID,  0, "Dazu gemahlene Zähne von einem Sumpfhai."					);
					Doc_PrintLines	( nDocID,  0, "Alles zusammen in die Flasche kippen und mit einem Schuß Rum abkochen."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Prost.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Laut dem blinden alten Mann ist es gesünder, die Dämpfe nicht einzuatmen!");	
					Doc_Show		( nDocID );

};
//**********************************************************************************
//	Doppelhammer
//**********************************************************************************
INSTANCE ITWr_Addon_Lou_Rezept2		(C_Item)
{
	name 				=	"Rezept für Lou's Doppelhammer";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	140;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLouRezept2;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Rezept zur Herstellung von Lou's Doppelhammer.";
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
					Doc_PrintLine	( nDocID,  0, "Lou's Doppelhammer"					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Man nimmt den guten alten Lou's Hammer und destilliert ihn nochmal.");
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Dieses Mischung sollte nur von erfahrenen Schnapsbrennern hergestellt werden.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Wenn sich ein Laie daran versucht, wird er nicht nur blind, sondern auch tot sein.");	
					
					Doc_Show		( nDocID );

};

//**********************************************************************************
//	Piratentod
//**********************************************************************************
INSTANCE ITWr_Addon_Piratentod		(C_Item)
{
	name 				=	"Schneller Hering";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezeptPiratentod;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Rezept zur Herstellung des Schnellen Herings.";
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
					Doc_PrintLine	( nDocID,  0, "Schneller Hering (von mir)"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Kleiner Muntermacher für echte Kerle");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Man braucht wie üblich eine Wasserflasche. Diese füllst du mit einer Einheit Rum, dazu gibst du einen frischen Fisch.");	
					Doc_PrintLines	( nDocID,  0, "Sobald die Flüssigkeit beginnt sich gelb zu färben, nimmst du den Fisch heraus und rundest das ganze mit einem Bund"					);
					Doc_PrintLines	( nDocID,  0, "frisch gepflückten Snapperkraut ab."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Vorsicht. Das Zeug hat 'nen starken Abgang.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_Show		( nDocID );

};
//------------------------------------------------------------------------------------------
INSTANCE Fakescroll_Addon (C_Item)
{	
	name 					=	"Ein Blatt Papier";

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
	name 				=	"Anleitung Banditenaxt";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 					=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseAxtAnleitung;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Anleitung zum Bau einer leichten, scharfen Axt";
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
					Doc_PrintLine	( nDocID,  0, "Die Banditenaxt"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "Eine einhändige Axt");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Ein Mann der die Grundsätze des Schmiedens beherrscht, kann eine besondere Axt herstellen. ");	
					Doc_PrintLines	( nDocID,  0, "Dazu braucht man zwei Stücke heißes Roheisen."					);
					Doc_PrintLines	( nDocID,  0, "Einen Brocken Erz und dreimal Zähne von Wölfen, Snappern oder ähnlichem Getier."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Erz und Zähne zusammen mit dem Eisen am Amboß zusammenhauen.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Eine solche Axt läßt sich sehr leicht führen und macht ordentlich Schaden.");
					Doc_PrintLines	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};


//------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_SUMMONANCIENTGHOST (C_ITEM)
{	
	name 				=	"'Quarhodron' Beschwören";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseSummonAncientGhost;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Mit dieser Schriftrolle kann man Quarhodron beschwören.";
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
	name 		= "Das vergessene Tal der Erbauer.";  

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
	
