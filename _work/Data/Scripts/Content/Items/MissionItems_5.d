 //**********************************************************************************
//	ItWr_XardasLetterToOpenBook_MIS  an den SC um die HALLEN von Irdorath zu öffnen!
//----------------------------------------------------------------------------------

INSTANCE ItWr_XardasLetterToOpenBook_MIS		(C_Item)
{
	name 				=	"List Xardasa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_XardasLetterToOpenBook;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_XardasLetterToOpenBook ()
{   
 
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book    			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Podejrzewałem, że źródłem zła w Górniczej Dolinie był jeden ze smoków."					);
					Doc_PrintLines	( nDocID,  0, "Myliłem się."					);
					Doc_PrintLines	( nDocID,  0, "Jeśli wszystko przebiegło zgodnie z moim"					);
					Doc_PrintLines	( nDocID,  0, "planem, szukasz teraz zapewne Dworu Irdorath."					);
					Doc_PrintLines	( nDocID,  0, "Książka, którą dałeś Pyrokarowi, zawiera wszystkie potrzebne Ci wskazówki."					);
					Doc_PrintLines	( nDocID,  0, "Powinienem był się domyślić, dlaczego Poszukiwacze tak bardzo"					);
					Doc_PrintLines	( nDocID,  0, "chcieli ją zdobyć."					);
					Doc_PrintLines	( nDocID,  0, "Musisz ją odzyskać!"					);
					Doc_PrintLines	( nDocID,  0, "Otworzysz ją słowami 'XARAK BENDARDO'. Tylko nie mów o tym nikomu!"					);
					Doc_PrintLines	( nDocID,  0, "Muszę zająć się teraz ważniejszymi sprawami."					);
					Doc_PrintLines	( nDocID,  0, "Odtąd jesteś zdany jedynie na siebie. Tylko Ty możesz pokonać źródło zła."					);
					Doc_PrintLines	( nDocID,  0, "Jeszcze się spotkamy!"					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                             Xardas."					);
					Doc_Show		( nDocID );

	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry (TOPIC_BuchHallenVonIrdorath,"W swoim liście Xardas poinformował mnie, jakie słowa otwierają księgę DWÓR IRDORATH."); 
	};

	MIS_Xardas_SCCanOpenIrdorathBook  = TRUE;	//Joly:  Spieler kann nun das Buch im Kloster lesen und findet so die geheime Bibliothek!
};


//**********************************************************************************
//	ItKe_MonastarySecretLibrary_Mis 		Schlüssel zur geheimen Bibliothek
//**********************************************************************************

INSTANCE ItKe_MonastarySecretLibrary_Mis (C_Item)
{
	name 				=	"Klucz" ;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_02;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[0]				= 	"z księgi 'Dwór Irdorath'";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//**********************************************************************************
//	ItWr_HallsofIrdorath_Mis
//**********************************************************************************

INSTANCE ItWr_HallsofIrdorath_Mis (C_ITEM) 
{	
	name 					=	"Dwór Irdorath";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_02_05.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAPSEALED";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_HallsofIrdorath;
};

FUNC VOID Use_HallsofIrdorath ()
{   
		if (MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
		{
			B_Say (self, self, "$SCOPENSIRDORATHBOOK");
		
  			Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  hero, hero, 0, 0, 0, FALSE );
			Snd_Play ("SFX_HealObsession" );

			CreateInvItems (hero,ItWr_HallsofIrdorath_Open_Mis ,1);
			CreateInvItems (hero,ItKe_MonastarySecretLibrary_Mis ,1);
			CreateInvItems (hero,ItWr_UseLampIdiot_Mis ,1);
			
			Print	(PRINT_IrdorathBookHiddenKey);
			B_GivePlayerXP (XP_HallsofIrdorathIsOpen);
			ItWr_HallsofIrdorathIsOpen = TRUE;
			
			B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Udało mi się otworzyć księgę Xardasa. Znalazłem w niej tajemniczą wiadomość i dziwny klucz. Kto wie, co jeszcze kryje się w klasztornych podziemiach."); 
		}
		else
		{
			CreateInvItems (hero,ItWr_HallsofIrdorath_Mis ,1);	//Joly: wegen MAPSEALED!!!!!

			Print (PRINT_IrdorathBookDoesntOpen);
			Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
			Snd_Play 	("MFX_FEAR_CAST" );
		};	
};

//**********************************************************************************
//	ItWr_HallsofIrdorath_Open_Mis
//**********************************************************************************

INSTANCE ItWr_HallsofIrdorath_Open_Mis (C_ITEM) 
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
	on_state[0]				=	Use_HallsofIrdorath_Open;
};

FUNC VOID Use_HallsofIrdorath_Open ()
{   	 
	if (ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Przeczytałem księgę Xardasa. Jest w niej wzmianka o tajnej bibliotece, która zapewne znajduje się w podziemiach klasztoru."); 
	};
	
	ItWr_SCReadsHallsofIrdorath = TRUE;
		
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
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "...tak oto ukryłem wejście do biblioteki za zamaskowanymi drzwiami, by uchronić moje zapiski ze świątyń Beliara.");
					Doc_PrintLines	( nDocID,  0, "Gdyby dowiedzieli się o nich moi bracia, mogliby je pochopnie zniszczyć.");		
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);										
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Teraz zaś wiedzą tylko, że świątynie te niegdyś istniały."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "Na wszelki wypadek zostawiłem kilka sług na straży biblioteki.");
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "Ten klucz otwiera ostatnie drzwi.");
					
					Doc_Show		( nDocID );

	
};
//**********************************************************************************
//	ItWr_XardasSeamapBook_Mis
//**********************************************************************************

INSTANCE ItWr_XardasSeamapBook_Mis (C_ITEM) 
{	
	name 					=	"Zakurzona księga";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	0;

	visual 					=	"ItWr_Book_02_01.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_XardasSeamapBook_Mis;
};

FUNC VOID Use_XardasSeamapBook_Mis ()
{   	 

	var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "BOOK_BROWN_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "BOOK_BROWN_R.tga" , 0		); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages 
 					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "...Jestem pewien, że ta budowla to Dwór Irdorath. Znajduje się on na niewielkiej wyspie, całkiem blisko przystani w Khorinis. Nie ma wątpliwości, że Beliara interesuje ruda z kopalń...");
					Doc_PrintLines	( nDocID,  0, "");		
	
					if (hero.guild == GIL_PAL)
					{
						Doc_PrintLines	( nDocID,  0, "...Im są potężniejsi, tym bardziej przydatni będą dla niego jako ożywieńczy słudzy. Pokonanie tych upadłych paladynów to niełatwe zadanie. Jeden z nich wpadł w moje ręce. Mam tylko nadzieję, że pozostali nie dowiedzą się o nim...");		
						
						//2.Seite
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
						Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
						Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
						Doc_PrintLine	( nDocID,  1, ""					);
						Doc_PrintLines	( nDocID,  1, "...Upadły paladyn nie reaguje na żadne bodźce. Jego zbroję i inne przedmioty schowałem w tylnej komorze. Drzwi można otworzyć tylko od wewnątrz, więc stworzyłem na tę okazję specjalną runę teleportacji. Instrukcje są w almanachu, by mógł je znaleźć Wybraniec..."	);
					};
					
					if (hero.guild == GIL_KDF)
					{
						Doc_PrintLines	( nDocID,  0, "...Znaki są jasne! Gdy przybędzie Wybrany, przyda się mu każda pomoc. Beliar i tak jest już zbyt silny. Zgromadziłem tu na wszelki wypadek kilka przydatnych artefaktów. Podejrzewam, że Wybraniec będzie jednym z nas,");
						
						//2.Seite
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
						Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
						Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
						Doc_PrintLines	( nDocID,  1, "dlatego spisałem dla niego instrukcje w almanachu."					);
						Doc_PrintLine	( nDocID,  1, ""					);
						Doc_PrintLines	( nDocID,  1, "...Nie mam już złudzeń. Jesteśmy bezbronni wobec wyroków losu. Gdy Beliar odpowiednio urośnie w siłę, spróbuje przejąć władzę nad całym światem. Muszę znaleźć Wybrańca!"); 
					};
					
					if (hero.guild == GIL_DJG)
					{
						Doc_PrintLines	( nDocID,  0, "...Wybuchnie wojna, która zadecyduje o losach świata. Chyba jestem jedynym, który potrafi odczytać znaki. Pozostali po prostu je ignorują. Wybraniec nadejdzie, a jego przyjście będzie oznaczać początek wojny. Odwieczna rywalizacja może zostać rozstrzygnięta.");
						
						//2.Seite
						Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
						Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages 
						Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
						Doc_PrintLines	( nDocID,  1, "Nie będę stał bezczynnie, pozwalając innym decydować o losach świata."					);
						Doc_PrintLine	( nDocID,  1, ""					);
						Doc_PrintLines	( nDocID,  1, "...Ze starożytnych pism dowiedziałem się, jak stworzyć legendarną broń pradawnych Smoczych Mistrzów. Nie wiem jednak, gdzie szukać potrzebnych składników. Na wszelki wypadek zapisałem wszystko w almanachu. Kto wie, może przyjdzie nam walczyć także ze smokami."); 
					};					
					
					Doc_Show		( nDocID );
};


//**********************************************************************
//	geheime Nachricht geheimer Schalter Lampe
//**********************************************************************


INSTANCE ItWr_UseLampIdiot_Mis	(C_Item)
{
	name 				=	"Podniszczony list";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	50;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseItWr_UseLampIdiot_Mis;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[0]				=	"z księgi 'Dwór Irdorath'";
};
func void UseItWr_UseLampIdiot_Mis ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_BookHeadline);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, "               Lampa rzuca światło"						);
					Doc_PrintLine	(nDocID,  0, "               na podziemne korytarze"						);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
		
}; 



//**********************************************************************************
//	ItWr_Seamap_Irdorath
//**********************************************************************************

INSTANCE ItWr_Seamap_Irdorath (C_Item)
{	
	name 					=	"Mapa morska wyspy Irdorath";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	Use_Seamap_Irdorath;

	description				= name;
	TEXT[0]					= "";
	TEXT[1]					= "";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};


FUNC VOID Use_Seamap_Irdorath ()
{
	var int nDocID;
	
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
				Doc_SetPages	( nDocID, 1 );                         
				Doc_SetPage 	( nDocID, 0, "Map_NewWorld_Seamap.tga", 	1	);  //  1 -> DO NOT SCALE 
				Doc_Show		( nDocID 	);
	
	if  (MIS_ShipIsFree == FALSE)
		&& (Kapitel < 6)
	 	{
			B_Say (self, self, "$IRDORATHTHEREYOUARE");
		};
	
	if (MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic (TOPIC_SHIP, LOG_MISSION);                                                                   
	    Log_SetTopicStatus(TOPIC_SHIP, LOG_RUNNING);                                                                 
	    B_LogEntry (TOPIC_SHIP,"Wygląda na to, że muszę się dostać na wyspę nieprzyjaciela. Będę potrzebował statku, załogi i kapitana.");
		B_GivePlayerXP (XP_SCKnowsWayToIrdorath);
	};

	MIS_SCKnowsWayToIrdorath  = TRUE;
};

//**********************************************************************
//	Gefälschter Brief von Lee zum benutzen des Schiffes
//**********************************************************************


INSTANCE ITWr_ForgedShipLetter_MIS	(C_Item)
{
	name 				=	"Akt okrętowy";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	50;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseITWr_ForgedShipLetter_MIS;
	scemeName			=	"MAP";
	description			= 	name;
	TEXT[3]				=	"Upoważnienie";
	TEXT[4]				=   "do korzystania z okrętu paladynów.";
};
func void UseITWr_ForgedShipLetter_MIS ()
{   
		var int nDocID;
		
//Joly:VORSICHT : Dieser Brief ist ein ERMÄCHTIGUNGSSCHREIBEN für das Schiff und kann von LEE oder dem Richter stammen. NICHT zwangsläufig von Lord Hagen oder gefälscht!!!!!!!!!

		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_BookHeadline);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, " Upoważnienie"							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetFont		(nDocID,  0, FONT_Book);
					Doc_PrintLine	(nDocID,  0, " Ten dokument uprawnia jego"					);
					Doc_PrintLine	(nDocID,  0, " posiadacza do swobodnego wykorzystania"		);
					Doc_PrintLine	(nDocID,  0, " królewskiej galery wojennej Lorda Hagena"		);
					Doc_PrintLine	(nDocID,  0, " przez czas nieograniczony."			);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, "     królewska pieczęć"							);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_PrintLine	(nDocID,  0, ""													);
					Doc_SetMargins	(nDocID, -1, 200, 50, 50, 50, 1);
					Doc_Show		(nDocID);
		
}; 

INSTANCE ITKE_OC_MAINGATE_MIS(C_Item)
{
	name 				=	"Klucz do wieży strażnika głównej bramy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ITKE_SHIP_LEVELCHANGE_MIS(C_Item)	//Joly: führt zum Levelchange Kapitel 6!!!!!!!!!!!!!!!!!!!!!!
{
	name 				=	"Klucz do kajuty kapitańskiej";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	10;	

	visual 			=	"ItMi_Flask.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_PotionOfDeath;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Łzy Innosa";
	
	TEXT[1]			= 	"???";				
	COUNT[1]		= 	Mana_Essenz;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

	FUNC VOID UseItPo_PotionOfDeath()
	{
		IF (hero.guild == GIL_KDF)
		{
 			Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",  hero, hero, 0, 0, 0, FALSE );
			Snd_Play ("SFX_HealObsession" );
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];		 
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
			
			Npc_ChangeAttribute (self,	ATR_STRENGTH  	,5);
			self.aivar[REAL_STRENGTH] = self.aivar[REAL_STRENGTH] + 5;
			Npc_ChangeAttribute (self,	ATR_DEXTERITY  	,5);
			self.aivar[REAL_DEXTERITY] = self.aivar[REAL_DEXTERITY] + 5;
			
			PrintScreen	(PRINT_LearnSTR5, -1, 45, FONT_SCREEN, 2);
			PrintScreen	(PRINT_LearnDex5, -1, 55, FONT_SCREEN, 2);
			PrintScreen (PRINT_FullyHealed, - 1, 65, FONT_Screen, 2); 
			Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Speed);
		}
		else
		{
			
												
			AI_Wait (hero,3);
			AI_PlayAni (self, "S_FIRE_VICTIM"); 
			Wld_PlayEffect("VOB_MAGICBURN",  hero, hero, 0, 0, 0, FALSE );
			B_Say (self,self, "$Dead");
			AI_StopFX	(self, "VOB_MAGICBURN");
			Npc_ChangeAttribute	(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);	
			NPC_StopAni (self,"S_FIRE_VICTIM");
			
			
		};
	};
	

	
INSTANCE ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	10;	

	visual 			=	"ItMi_Flask.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_PotionOfDeath;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Łzy Innosa";
	TEXT[1]			= 	"Ta mikstura zapewnia Magom Ognia specjalne moce,";
	Text[2]			=   "jeśli użyje jej ktoś inny, umrze.";
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;

};

//************************************************
//	Amulett des Todes
//************************************************

INSTANCE  ItAm_AmulettOfDeath_Mis(C_Item)
{
	name 			=	"Święta Aura Innosa";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"ItAm_Prot_Fire_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip		=	UnEquip_ItAm_AmulettOfDeath_Mis;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= "Święta aura Innosa.";
	
	TEXT[2]			= "Ten amulet chroni swego posiadacza";
	TEXT[3]			= "przed wszelkimi obrażeniami.";
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
	
	INV_ZBIAS				= INVCAM_ENTF_AMULETTE_STANDARD;
	
};

	FUNC VOID Equip_ItAm_AmulettOfDeath_Mis()
	{
	 	self.protection [PROT_EDGE]   += 30;
		self.protection [PROT_BLUNT]  += 30;
		self.protection [PROT_POINT]  += 30;
		self.protection [PROT_FIRE]   += 30;
		self.protection [PROT_MAGIC]  += 30;
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",  self, self, 0, 0, 0, FALSE );
		AI_PlayAni (self,"T_MAGRUN_2_HEASHOOT");	
		AI_StandUp (self);
		Snd_Play ("MFX_FIRERAIN_INVEST"); 
	};

	FUNC VOID UnEquip_ItAm_AmulettOfDeath_Mis()
	{
		self.protection [PROT_EDGE]   -= 30;
		self.protection [PROT_BLUNT]  -= 30;
		self.protection [PROT_POINT]  -= 30;
		self.protection [PROT_FIRE]   -= 30;
		self.protection [PROT_MAGIC]  -= 30;
	};
	
/******************************************************************************************/
//	Heiltrank für Randolph																	//
/******************************************************************************************/
INSTANCE ItPo_HealRandolph_MIS(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI|ITEM_MISSION;

	value 			=	Value_HpEssenz;	

	visual 			=	"ItMi_Flask.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	Use_HealRandolph;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Leczenie z nałogu";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Essenz;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_HpEssenz;
};

	FUNC VOID Use_HealRandolph()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Essenz);
	};	
