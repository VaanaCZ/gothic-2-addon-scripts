//**********************************************************************************
//	Brief von Lucia an William
//**********************************************************************************
INSTANCE ITWr_Addon_Hinweis_02		(C_Item)
{
	name 				=	"Wa¿na wiadomoœæ";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Hinweis_02;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=  "Z gospody w obozie bandytów";
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
					Doc_PrintLine	( nDocID,  0, "Hej ludzie,");
					Doc_PrintLines	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Lou znikn¹³ na bagnie. Pewnikiem ze¿ar³y go wê¿e.");	
					Doc_PrintLines	( nDocID,  0, "Co gorsza, wraz z nim znikn¹³ klucz do drzwi."					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ten, kto go znajdzie, bêdzie móg³ zatrzymaæ rzeczy Lou.");	
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
	name 				=	"Mikstura lecznicza – przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1000;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Heilrezept_04;
	scemeName			=	"MAP";
	description			= 	"Pe³nia ¿ycia";
	
	TEXT[2]				=	"Warzenie silnej mikstury.";
	TEXT[3]				=	"Wymagana jest znajomoœæ eliksiru leczenia.";
	
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
				B_LogEntry (TOPIC_TalentAlchemy,"Do przygotowania mikstury leczniczej potrzebne s¹ 3 esencje lecznicze oraz 1 rdest polny.");
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
					Doc_PrintLines	( nDocID,  0, "Tworzenie mikstury leczniczej:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Potrzebny jest jeden rdest polny, a tak¿e trzy esencje lecznicze.");	
					Doc_PrintLines	( nDocID,  0, "Po³¹cz je zgodnie z przepisem na tworzenie eliksiru leczenia.");	
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Mikstura mo¿e zostaæ przygotowana jedynie przez alchemika, który zna przepis na eliksir leczenia.");	
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
	name 				=	"Mikstura many – przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	1500;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Manarezept_04;
	scemeName			=	"MAP";

	description			= 	"Pe³nia many";
	
	TEXT[2]				=	"Warzenie silnej mikstury.";
	TEXT[3]				=	"Wymagana jest znajomoœæ eliksiru many.";
	
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
				B_LogEntry (TOPIC_TalentAlchemy,"Do przygotowania mikstury many potrzebne s¹ 3 esencje many oraz 1 rdest polny.");
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
					Doc_PrintLines	( nDocID,  0, "Warzenie mikstury many:");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Potrzebny jest jeden rdest polny, a tak¿e trzy esencje many.");	
					Doc_PrintLines	( nDocID,  0, "Po³¹cz je zgodnie z przepisem na tworzenie eliksiru many.");	
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Ta mikstura mo¿e byæ przygotowana jedynie przez alchemika, który zna przepis na eliksir many.");	
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
	name 				=	"Wa¿na wiadomoœæ";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Hinweis_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=  "Wisia³a w chacie na bagnie";
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
					Doc_PrintLine	( nDocID,  0, "Hej ludzie,");
					Doc_PrintLines	( nDocID,  0, "Rzeczy z tych skrzyñ s¹ tylko na nag³e wypadki.");	
					Doc_PrintLines	( nDocID,  0, "I s¹ dla nas WSZYSTKICH. Wiêc siêgajcie tam tylko wtedy, kiedy naprawdê musicie.");	
					Doc_PrintLines	( nDocID,  0, "I nie bierzcie wiêcej, ni¿ potrzebujecie."					);
					Doc_PrintLines	( nDocID,  0, "Uda siê, jeœli wszyscy bêdziemy siê tego trzymaæ."					);
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
	name 				=	"Liœcik";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_William_01;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Ten list mia³ przy sobie rybak William.";
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
					Doc_PrintLine	( nDocID,  0, "Williamie,");
					Doc_PrintLines	( nDocID,  0, "Kiedy ksiê¿yc jest w pe³ni, stra¿nicy s¹ rozkojarzeni.");	
					Doc_PrintLines	( nDocID,  0, "Przekradnij siê – ale b¹dŸ ostro¿ny!");	
					Doc_PrintLines	( nDocID,  0, "Jeœli bêdziesz iœæ drewnian¹ tam¹, uda ci siê wydostaæ z bagna."					);
					Doc_PrintLines	( nDocID,  0, "Obóz piratów jest po drugiej stronie doliny, daleko na zachodzie."					);
					Doc_PrintLines	( nDocID,  0, "Kiedy tam dotrzesz, z ³atwoœci¹ uciekniesz ³odzi¹.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Ktoœ, kto dobrze Ci ¿yczy");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Rezept von Miguel (Minecrawler Trank)
//**********************************************************************************
INSTANCE ITWr_Addon_MCELIXIER_01		(C_Item)
{
	name 				=	"Przepis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_MCELIXIER_01;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Przepis mikstury przemiany duszy";
	Text[1]				= 	"Ta mikstura przywraca utracone wspomnienia.";
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
					Doc_PrintLine	( nDocID,  0, "Mikstura przemiany duszy");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Do przyrz¹dzenia tej mikstury potrzebna jest wydzielina z dwóch ¿¹de³ krwiopijców.");	
					Doc_PrintLines	( nDocID,  0, "Dodaj do tego jeden ekstrakt many, a tak¿e esencjê lecznicz¹.");	
					Doc_PrintLines	( nDocID,  0, "W koñcu dosyp do ca³oœci woreczek czerwonego pieprzu."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Tylko doœwiadczony alchemik wie, jak pobraæ wydzielinê z ¿¹d³a potrzebn¹ do zrobienia tej mikstury.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Deal Brief von Esteban an zwei Piraten
//**********************************************************************************
INSTANCE ITWr_Addon_Pirates_01		(C_Item)
{
	name 				=	"Brudny papier";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Pirates_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=	"Ten papier by³ w kieszeni Angusa.";
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
					Doc_PrintLine	( nDocID,  0, "Piraci,"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Za³atwcie dla nas ostatni ³adunek.");	
					Doc_PrintLine	( nDocID,  0, "PrzywieŸcie go do jaskini. Tam siê spotkamy.");	
					Doc_PrintLines	( nDocID,  0, "Zap³acê wam w z³ocie. Podwójn¹ cenê."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Tak w³aœnie zrobimy.");	
					Doc_PrintLine	( nDocID,  0, "Tom");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );
};
//**********************************************************************************
//	Rezept für grünene Novizen
//**********************************************************************************
INSTANCE ITWr_Addon_Joint_01		(C_Item)
{
	name 				=	"Zielony nowicjusz";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Joint_Rezept_01;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				= 	"Le¿a³ w skrzyni Fortuna";
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
					Doc_PrintLine	( nDocID,  0, "Zielony nowicjusz"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "...Te ³odygi mo¿na ca³kiem nieŸle zwijaæ, ale nie ma porównania z tym, co mieliœmy w obozie na bagnie.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Jeœli wezmê wyci¹g z dwóch ³odyg bagiennego ziela i zmieszam go z polnym rdestem, mo¿na to bêdzie porównaæ do zielonego nowicjusza."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Zielony nowicjusz ³agodzi wszystkie bóle i oczyszcza umys³.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_Show		( nDocID );

};
//**********************************************************************************
//	Schnapsbrennen Rezept
//**********************************************************************************
INSTANCE ITWr_Addon_Lou_Rezept		(C_Item)
{
	name 				=	"Przepis na M³ot Lou ";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	70;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLouRezept;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Jak przygotowaæ M³ot Lou.";
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
					Doc_PrintLine	( nDocID,  0, "Przepis na M³ot Lou"					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Sk³adniki mocnej nalewki:");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Bierzesz butelkê, a tak¿e dwie rzepy i spor¹ garœæ bagiennego ziela.");	
					Doc_PrintLines	( nDocID,  0, "Dodajesz do tego k³y b³otnego wê¿a."					);
					Doc_PrintLines	( nDocID,  0, "Mieszasz w butelce i gotujesz z dzia³k¹ rumu."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Na zdrowie.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Wed³ug starego œlepca lepiej nie wdychaæ wyziewów!");	
					Doc_Show		( nDocID );

};
//**********************************************************************************
//	Doppelhammer
//**********************************************************************************
INSTANCE ITWr_Addon_Lou_Rezept2		(C_Item)
{
	name 				=	"Przepis na podwójny M³ot Lou";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	140;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseLouRezept2;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Jak przygotowaæ podwójny M³ot Lou.";
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
					Doc_PrintLine	( nDocID,  0, "Podwójny M³ot Lou"					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "WeŸ stary, dobry M³ot Lou i przedestyluj go jeszcze raz.");
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Ten wywar mo¿e przyrz¹dziæ jedynie ktoœ doœwiadczony w destylacji.");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Profan mo¿e od tego nie tylko oœlepn¹æ, ale te¿ ca³kiem wyzion¹æ ducha.");	
					
					Doc_Show		( nDocID );

};

//**********************************************************************************
//	Piratentod
//**********************************************************************************
INSTANCE ITWr_Addon_Piratentod		(C_Item)
{
	name 				=	"Szybki œledŸ";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseRezeptPiratentod;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Przepis na przygotowanie Szybkiego œledzia.";
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
					Doc_PrintLine	( nDocID,  0, "Szybki œledŸ (mój przepis)"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Ma³y klinek dla porz¹dnych ch³opaków");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Jak zwykle, potrzebna bêdzie butelka. Wlej do niej jedn¹ porcjê rumu i dodaj œwie¿¹ rybê.");	
					Doc_PrintLines	( nDocID,  0, "Kiedy tylko p³yn zrobi siê ¿ó³ty, wyjmij rybê i dopraw garœci¹ soli"					);
					Doc_PrintLines	( nDocID,  0, "œwie¿o zebranego zêbatego ziela."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLines	( nDocID,  0, "Uwa¿aj! Ta nalewka naprawdê stawia na nogi.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_Show		( nDocID );

};
//------------------------------------------------------------------------------------------
INSTANCE Fakescroll_Addon (C_Item)
{	
	name 					=	"Kawa³ek papieru";

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
	name 				=	"Przepis na bandycki topór";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 					=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseAxtAnleitung;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				= 	"Instrukcja stworzenia lekkiego, ostrego topora";
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
					Doc_PrintLine	( nDocID,  0, "Bandycki topór"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "Jednorêczny topór");	
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Osoba znaj¹ca podstawy kowalstwa mo¿e stworzyæ specjalny topór.");	
					Doc_PrintLines	( nDocID,  0, "Potrzebne s¹ dwa kawa³ki rozgrzanego do bia³oœci ¿elaza."					);
					Doc_PrintLines	( nDocID,  0, "Jedna bry³ka rudy i trzy komplety k³ów wilków, zêbaczy lub podobnych bestii."					);
					Doc_PrintLine	( nDocID,  0, "");	
					Doc_PrintLine	( nDocID,  0, "Ruda i k³y zbijane s¹ w jedn¹ ca³oœæ na kowadle.");	
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Taki topór jest ³atwy we w³adaniu i zadaje spore");
					Doc_PrintLines	( nDocID,  0, "obra¿enia.");	
					Doc_Show		( nDocID );
};


//------------------------------------------------------------------------------------------
INSTANCE ItWr_Addon_SUMMONANCIENTGHOST (C_ITEM)
{	
	name 				=	"Przywo³anie Quarhodrona";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	250;

	visual 				=	"ItWr_Scroll_01.3DS";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseSummonAncientGhost;
	scemeName			=	"MAP";
	description			= 	name;
	Text[0]				=	"Za pomoc¹ tego zwoju mo¿esz przywo³aæ Quarhodrona.";
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
	name 		= "Zapomniana dolina budowniczych";  

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
	
