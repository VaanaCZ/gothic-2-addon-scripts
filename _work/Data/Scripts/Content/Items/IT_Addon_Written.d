//**********************************************************************************
//	Brief von Lucia an William
//**********************************************************************************
INSTANCE ITWr_Addon_Hinweis_02		(C_Item)
{
	name 				=	"Messaggio importante";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Hinweis_02;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=  "Dalla taverna nel campo dei briganti";
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
					Doc_PrintLine	( nDocID,  0, "Ehi gente,");
					Doc_PrintLines	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Lou è scomparso nella palude: forse è stato divorato dagli squali di palude.");	
					Doc_PrintLines	( nDocID,  0, "Ma il peggio è che la chiave della porta è scomparsa insieme a lui."					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Chi la trova può tenersi la roba di Lou.");	
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
	name 				=	"Ricetta per pozione curativa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1000;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Heilrezept_04;
	scemeName			=	"MAP";
	description			= 	"Energia vitale pura";
	
	TEXT[2]				=	"Per preparare una pozione potente.";
	TEXT[3]				=	"È necessario conoscere elisir di guarigione.";
	
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
				B_LogEntry (TOPIC_TalentAlchemy,"Per preparare una pozione curativa, mi servono 1 groviglio della prateria e 3 essenze curative.");
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
					Doc_PrintLines	( nDocID,  0, "Per una pozione curativa:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Servono un groviglio della prateria e tre essenze curative.");	
					Doc_PrintLines	( nDocID,  0, "Versa tutto insieme e segui la ricetta degli elisir curativi.");	
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Questa pozione può essere creata solo da alchimisti che conoscono la ricetta degli elisir curativi.");	
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
	name 				=	"Ricetta del mana";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1500;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Manarezept_04;
	scemeName			=	"MAP";

	description			= 	"Mana puro";
	
	TEXT[2]				=	"Per preparare una pozione potente.";
	TEXT[3]				=	"È necessario conoscere gli elisir di mana.";
	
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
				B_LogEntry (TOPIC_TalentAlchemy,"Per preparare una pozione di mana, mi servono 1 groviglio della prateria e 3 essenze di mana.");
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
					Doc_PrintLines	( nDocID,  0, "Per una pozione di mana:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Servono un groviglio della prateria e tre essenze di potere magico.");	
					Doc_PrintLines	( nDocID,  0, "Versa tutto insieme e segui la ricetta degli elisir di mana.");	
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Questa pozione può essere creata solo da alchimisti che conoscono la ricetta degli elisir di mana.");	
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
	name 				=	"Suggerimento importante";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Hinweis_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=  "Appeso su una capanna nella palude";
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
					Doc_PrintLine	( nDocID,  0, "Ehi gente,");
					Doc_PrintLines	( nDocID,  0, "la roba dentro ai forzieri serve per le emergenze.");	
					Doc_PrintLines	( nDocID,  0, "Ed è per TUTTI. Quindi prendete solo quello che vi serve.");	
					Doc_PrintLines	( nDocID,  0, "E non prendete più di quello che vi serve."					);
					Doc_PrintLines	( nDocID,  0, "Se tutti si regoleranno in questo modo andrà tutto bene."					);
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
	name 				=	"Nota";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_William_01;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Il pescatore William aveva questo addosso.";
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
					Doc_PrintLines	( nDocID,  0, "Quando la luna sarà piena, la guardia sarà distratta.");	
					Doc_PrintLines	( nDocID,  0, "Svicola fuori: ma fa attenzione!");	
					Doc_PrintLines	( nDocID,  0, "Se segui la via dei tronchi puoi uscire dalla palude."					);
					Doc_PrintLines	( nDocID,  0, "Il campo dei pirati è lontano, sull'altro lato della valle a ovest."					);
					Doc_PrintLines	( nDocID,  0, "Da là, dovrebbe essere facile allontanarsi con la barca.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Un amico");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Rezept von Miguel (Minecrawler Trank)
//**********************************************************************************
INSTANCE ITWr_Addon_MCELIXIER_01		(C_Item)
{
	name 				=	"Ricetta";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_MCELIXIER_01;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Ricetta dell'elisir dell'alterazione mentale.";
	Text[1]				= 	"La pozione aiuta a recuperare i ricordi.";
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
					Doc_PrintLine	( nDocID,  0, "Elisir d'alterazione mentale");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Per questa pozione, è necessaria la secrezione di due pungiglioni di sanguimosche.");	
					Doc_PrintLines	( nDocID,  0, "Aggiungi un estratto di mana e un'essenza curativa.");	
					Doc_PrintLines	( nDocID,  0, "Infine, mescola una borsa di pepe rosso irritante nel decotto bollente."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Solo un alchimista esperto, che sappia come estrarre le secrezioni dai pungiglioni dovrebbe cimentarsi con questa pozione.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Deal Brief von Esteban an zwei Piraten
//**********************************************************************************
INSTANCE ITWr_Addon_Pirates_01		(C_Item)
{
	name 				=	"Nota unta";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Pirates_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=	"Angus aveva in tasca questa nota.";
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
					Doc_PrintLine	( nDocID,  0, "Pirati, "					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Prendete l'ultima consegna diretta a noi.");	
					Doc_PrintLine	( nDocID,  0, "Quindi portatela nella vostra caverna. Ci vedremo là.");	
					Doc_PrintLines	( nDocID,  0, "Vi pagherò il doppio del suo valore in oro."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "È così che si fa");	
					Doc_PrintLine	( nDocID,  0, "Tom");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Rezept für grünene Novizen
//**********************************************************************************
INSTANCE ITWr_Addon_Joint_01		(C_Item)
{
	name 				=	"Il novizio verde";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Joint_Rezept_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				= 	"Nello scrigno di Fortuno";
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
					Doc_PrintLine	( nDocID,  0, "Il novizio verde"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "(…) Il sigaro si arrotola molto bene, ma nel Campo della palude abbiamo trovato roba di tutt'altro livello.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Se uso l'essenza di due piante di erba di palude e aggiungo un groviglio della prateria, ottengo un sigaro con l'effetto del novizio verde."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Il novizio verde allevia tutti i tipi di dolore e libera la mente.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );

};
//**********************************************************************************
//	Schnapsbrennen Rezept
//**********************************************************************************
INSTANCE ITWr_Addon_Lou_Rezept		(C_Item)
{
	name 				=	"Ricetta del Martello di Lou";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	70;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLouRezept;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Ricetta per preparare il Martello di Lou";
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
					Doc_PrintLine	( nDocID,  0, "Il Martello di Lou"					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Ingredienti per un Martello:");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Prendi una bottiglia d'acqua, due rape e una porzione abbondante di erba di palude.");	
					Doc_PrintLines	( nDocID,  0, "Poi denti tritati di squalo di palude."					);
					Doc_PrintLines	( nDocID,  0, "Metti tutto nella bottiglia e fai bollire con un goccetto di rum."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Salute");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Secondo il vecchio cieco, è più salutare non respirare i vapori!");	
					Doc_Show		( nDocID );

};
//**********************************************************************************
//	Doppelhammer
//**********************************************************************************
INSTANCE ITWr_Addon_Lou_Rezept2		(C_Item)
{
	name 				=	"Il Doppio Martello di Lou";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	140;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLouRezept2;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Ricetta per il Doppio Martello di Lou";
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
					Doc_PrintLine	( nDocID,  0, "Doppio Martello"					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Prendi del buon vecchio Martello di Lou e distillalo di nuovo.");
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Questa miscela dovrebbe essere preparata solo da distillatori esperti.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Se ci prova un profano, ne uscirà non solo cieco, ma proprio morto.");	
					
					Doc_Show		( nDocID );

};

//**********************************************************************************
//	Piratentod
//**********************************************************************************
INSTANCE ITWr_Addon_Piratentod		(C_Item)
{
	name 				=	"Aringa furiosa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezeptPiratentod;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Ricetta per preparare l'Aringa furiosa.";
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
					Doc_PrintLine	( nDocID,  0, "Aringa furiosa (la mia)"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Piccolo tiramisu per uomini veri");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Come al solito, ti serve una bottiglia d'acqua. Riempila con una parte di rum e aggiungi un pesce fresco.");	
					Doc_PrintLines	( nDocID,  0, "Come il liquido comincia a ingiallire, togli il pesce e aggiungi una presa di"					);
					Doc_PrintLines	( nDocID,  0, "erba fresca dello squartatore."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Attenzione: dà una scarica potente.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_Show		( nDocID );

};
//------------------------------------------------------------------------------------------
INSTANCE Fakescroll_Addon (C_Item)
{	
	name 					=	"Un pezzo di carta";

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
	name 				=	"Istruzioni: ascia da brigante";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 					=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseAxtAnleitung;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Istruzioni per un'ascia leggera e affilata.";
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
					Doc_PrintLine	( nDocID,  0, "Ascia brigante"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "Un'ascia a una mano");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Chiunque conosca le basi della forgiatura può realizzare un'ascia speciale.");	
					Doc_PrintLines	( nDocID,  0, "Servono due pezzi di ferro incandescente."					);
					Doc_PrintLines	( nDocID,  0, "Un pezzo di metallo e tre denti di lupo, squartatore o bestie simili."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Batti metallo, denti e ferro con il martello su un'incudine.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Un'ascia come questa è molto facile da usare e provoca danni notevoli.");
					Doc_PrintLines	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};


//------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_SUMMONANCIENTGHOST (C_ITEM)
{	
	name 				=	"Evocazione di 'Quarhodron'";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseSummonAncientGhost;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Usa questa pergamena per evocare Quarhodron.";
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
	name 		= "Valle perduta dei costruttori.";  

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
	
