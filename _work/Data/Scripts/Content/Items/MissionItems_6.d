// *****************************************************************
// //Joly: Auge Innos nicht dabei? Kein Problem. Xardas hilft auch dir Idiot!!!!!!!!!!!!
// Vorsicht: Nur für D.A.U.s
// *****************************************************************

INSTANCE ItSe_XardasNotfallBeutel_MIS	(C_Item)
{
	name 				=	"Bardzo dziwna skórzana torba";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_METAL;
	on_state[0]			=   Use_XardasNotfallBeutel;
	
	description			= 	name;
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"Wydaje siê zawieraæ";
	TEXT[2]				= 	"coœ twardego i jakiœ";
	TEXT[3]				= 	"dokument.";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_XardasNotfallBeutel ()
{
	CreateInvItems (hero, ItWr_XardasErmahnungFuerIdioten_MIS ,1);
	CreateInvItems (hero, ItMi_InnosEye_Discharged_Mis ,1);

	var string concatText;
		
	concatText = ConcatStrings( "2" , PRINT_ItemsErhalten);		
	Print (concatText);
}; 

//**********************************************************************************
//	ItWr_XardasErmahnungFuerIdioten_MIS
//**********************************************************************************

INSTANCE ItWr_XardasErmahnungFuerIdioten_MIS	(C_Item)
{
	name 				=	"List ostrzegawczy Xardasa";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_XardasErmahnungFuerIdioten;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_XardasErmahnungFuerIdioten ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Mój m³ody przyjacielu - wielce mnie rozczarowa³a twoja postawa. Jak mog³eœ odp³yn¹æ bez Oka Innosa?"					);
					Doc_PrintLines	( nDocID,  0, "Liczyæ mogê jedynie na to, ¿e nawet twe niedbalstwo ma granice. W przeciwnym wypadku nie wygnasz Z³a ze œwiata i bêdê musia³ osobiœcie ocaliæ ciê od twej g³upoty."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                      Xardas"					);
					
					Doc_Show		( nDocID );
};

//**********************************************************************************
//	Brief in der Krypta
//----------------------------------------------------------------------------------

INSTANCE ItWr_Krypta_Garon		(C_Item)
{
	name 				=	"Stary list";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_Krypta_Garon;
	scemeName			=	"MAP";
	description			= 	name;

	TEXT[3]				= 	"Pisany niepewn¹ rêk¹.";
};
func void Use_Krypta_Garon ()
{   
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Zawiod³em. P³onne me nadzieje na zatrzymanie Inubisa na œcie¿ce dobra."					);
					Doc_PrintLines	( nDocID,  0, "Na pocz¹tku s¹dzi³em, ¿e nie ¿yjê, ale w starych koœciach Ivana drzemie jeszcze si³a."					);
					Doc_PrintLines	( nDocID,  0, "Inubis jednak powsta³ z martwych i szuka zemsty za wygnanie przez prastary zakon paladynów."					);
					Doc_PrintLines	( nDocID,  0, "Towarzyszy mu wielu wyznawców... Jak wojownik pokroju Inubisa móg³ staæ siê tak z³y?"					);
					Doc_PrintLines	( nDocID,  0, "Znalaz³em w tej krypcie jego grób, nie wiem jednak, czy zdo³am przekazaæ komuœ wieœci o moim odkryciu, piszê wiêc te s³owa w nadziei na to, ¿e zostan¹ odnalezione."					);
					Doc_PrintLines	( nDocID,  0, "Strze¿cie siê. Potê¿ny nieprzyjaciel siêga po dusze sprawiedliwych. Inubis nie bêdzie ostatni..."					);
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Niechaj Innos chroni wasze dusze"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                                 Ivan");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );

}; 

//****************************************************************************
//				DragonIsle_Undead_Schlüssel
//			---------------------------------------------
//****************************************************************************

//**********************************************************************************
//	Knasttürschlüssel für Pedros Zelle auf DI
//**********************************************************************************

INSTANCE ItKe_OrkKnastDI_MIS(C_Item)
{
	name 				=	"Klucz orka-pu³kownika";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_01;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItKe_EVT_UNDEAD_01(C_Item)	//Schlüssel für erste Tür
{
	name 				=	"Klucz Archola";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[2]				=	name;
	
};

//**********************************************************************************
//	Schlüssel zum Labyrinth der Untoten auf DI
//**********************************************************************************

INSTANCE ItKe_EVT_UNDEAD_02	(C_Item)
{
	name 				=	"Klucz klucznika";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};


//**********************************************************************************
//	Kammerschlüssel für´s Tor zum Saal des Untoten Drachen.
//**********************************************************************************
	
INSTANCE ItKe_LastDoorToUndeadDrgDI_MIS	(C_Item)
{
	name 				=	"Klucz do komnaty czarnego maga";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//**********************************************************************************
//	Schriftrolle für´s Tor zum Saal des Untoten Drachen.
//**********************************************************************************
	
INSTANCE ItWr_LastDoorToUndeadDrgDI_MIS	(C_Item)
{
	name 				=	"Zwój czarnego maga";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;

	on_state[0]			=   Use_ItWr_LastDoorToUndeadDrgDI_MIS;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_ItWr_LastDoorToUndeadDrgDI_MIS ()
{   
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels

					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "KHADOSH "					);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "EMEM KADAR"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Niech Oko Mocy oœwietli tw¹ œcie¿kê.");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Zwój czarnego maga zawiera s³owa KHADOSH EMEM KADAR. Brzmi to jak jakieœ zaklêcie, ale do czego s³u¿y - i czym jest Oko Mocy?"); 
};
//**********************************************************************************
//	Schlüssel zur Truhe in der Kammer des OberDementors.
//**********************************************************************************
INSTANCE ItKe_ChestMasterDementor_MIS	(C_Item)
{
	name 				=	"Klucz do kufra czarnego maga";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Key_03;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]	= value;
};

//**********************************************************************************
//	Der Schwarzmagiernovize
//**********************************************************************************

//**********************************************************************************
//	ItWr_Rezept_MegaDrink_MIS
//**********************************************************************************

INSTANCE ItWr_Rezept_MegaDrink_MIS	(C_Item)
{
	name 				=	"Receptura";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_RezeptFuerMegaTrank;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_RezeptFuerMegaTrank ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Zdo³a³em wskrzesiæ pradawn¹ sztukê, bojê siê jednak, ¿e nie spodoba siê to Feodaronowi."					);
					Doc_PrintLines	( nDocID,  0, "Muszê zmieszaæ ca³e jego potomstwo i stworzyæ z niego miksturê w moim laboratorium. Gdyby jeszcze tylko nie siedzia³ bez przerwy na tych jajach... Nadal jednak czujê wobec niego szacunek."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Embarla Firgasto:"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "10 smoczych jaj, jedna starta na proszek czarna per³a i szczypta siarki."					);
					Doc_PrintLines	( nDocID,  0, "Miksturê nale¿y doprowadziæ do wrzenia i mieszaæ bez przerwy podczas destylacji."					);
					Doc_PrintLines	( nDocID,  0, "Substancji koñcowej nale¿y u¿ywaæ z umiarem, gdy¿ wywo³uje silne efekty uboczne i mo¿e rozchwiaæ ca³y system kontroli nad magi¹."					);
					
					Doc_Show		( nDocID );
		
		PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};

//**********************************************************************************
//	Tagebuch des SchwarzmagierNovizen
//**********************************************************************************

INSTANCE ItWr_Diary_BlackNovice_MIS (C_ITEM)
{	
	name 					=	"Dziennik";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_04.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	name;
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	Use_Diary_BlackNovice;
};

	FUNC VOID Use_Diary_BlackNovice()
	{   
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "BOOK_RED_L.tga"  , 0 	); 		// VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "BOOK_RED_R.tga" 	, 0		); 		// VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga
					
					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels 					
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages 
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);										
					Doc_PrintLines	( nDocID,  0, "Ju¿ od 36 dni czekam na wezwanie. Zaczynam w¹tpiæ, czy siê doczekam - mimo ¿e zrobi³em wszystko, o co mnie proszono. Lata³em dla nich i przynosi³em ró¿ne rzeczy jak jakiœ lokaj."					);
					//Absatz
					Doc_PrintLines	( nDocID,  0, "Klucznik nakaza³ mi zamkniêcie krat, ale jeszcze siê do tego nie zabra³em. Jak tak dalej pójdzie, to ka¿dy bêdzie sobie móg³ po prostu wejœæ przez bramê...");
					Doc_PrintLines	( nDocID,  0, "Szkoda, ¿e nie pamiêtam w³aœciwych kombinacji.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Bardzo dawno ju¿ nie zakrada³em siê do wielkiej komnaty i nie mogê siê doczekaæ spotkania z Mistrzem. Ciekaw jestem, czy pozwol¹ mi na nie, gdy ju¿ do nich do³¹czê."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "Wczoraj podj¹³em próbê, ale dotar³em tylko do komnaty z dwoma dŸwigniami - nawet nie zdo³a³em wypróbowaæ kombinacji prze³¹czników w zachodnim skrzydle! Ta œwinia pozamyka³a komnaty. Jutro spróbujê wydostaæ od niego klucz...");
					Doc_Show		( nDocID );

	B_LogEntry (TOPIC_HallenVonIrdorath,"Dziennik ucznia czarnego maga wspomina o komnatach z dŸwigniami, kluczniku, kombinacji prze³¹czników... Trzeba to zapamiêtaæ, nigdy nie wiadomo, kiedy mo¿e siê przydaæ."); 
};

//**********************************************************************************
//	ItWr_ZugBruecke_MIS
//**********************************************************************************

INSTANCE ItWr_ZugBruecke_MIS	(C_Item)
{
	name 				=	"Stary list";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_ZugBruecke;
	scemeName			=	"MAP";
	description			= 	name;
};
func void Use_ZugBruecke ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							// DocManager 
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "   Ostatnie ostrze¿enie!"					);
					Doc_SetMargins	( nDocID, -1, 50, 50, 70, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages 
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Nic mnie nie obchodzi, czy uda siê wam przeleŸæ przez most z drugiej strony. Dla mnie mo¿ecie piec siê w piekle."					);
					Doc_PrintLines	( nDocID,  0, "Tak d³ugo, jak jestem w swoich w³oœciach, most bêdzie podniesiony, a ka¿dego mêdrka, który bêdzie próbowa³ ustrzeliæ z ³uku prze³¹cznik, ¿eby siê tu dostaæ, osobiœcie wypatroszê i powieszê na najbli¿szym drzewie!"	);
					Doc_PrintLines	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "                      Archol"					);
					
					Doc_Show		( nDocID );
};


//**********************************************************************************
//	ItMi_PowerEye zum öffnen der letzten Tür
//**********************************************************************************

INSTANCE ItMi_PowerEye (C_Item)
{
	name 				=	"Oko Mocy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_METAL;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};

