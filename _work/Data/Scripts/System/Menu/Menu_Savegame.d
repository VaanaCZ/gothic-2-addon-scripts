//--------------------------------------------------------------
// SAVEGAME
//--------------------------------------------------------------


INSTANCE MENU_SAVEGAME_LOAD(C_MENU_DEF)
{
	backpic		= MENU_SAVELOAD_BACK_PIC;

	// Kopfzeile
	items[0] 	= "MENUITEM_LOAD_HEADLINE";

	// gemeinsame Komponenten
	items[1] 	= "MENUITEM_LOADSAVE_THUMBPIC";
	items[2] 	= "MENUITEM_LOADSAVE_DATETIME";
	items[3] 	= "MENUITEM_LOADSAVE_DATETIME_VALUE";
	items[4] 	= "MENUITEM_LOADSAVE_GAMETIME";
	items[5] 	= "MENUITEM_LOADSAVE_GAMETIME_VALUE";
	items[6] 	= "MENUITEM_LOADSAVE_LEVELNAME";
	items[7] 	= "MENUITEM_LOADSAVE_LEVELNAME_VALUE";
	items[8] 	= "MENUITEM_LOADSAVE_PLAYTIME_VALUE";


	// Slots (0 = QuickSave)
	items[9] 	= "MENUITEM_LOAD_SLOT1";
	items[10] 	= "MENUITEM_LOAD_SLOT2";
	items[11] 	= "MENUITEM_LOAD_SLOT3";
	items[12] 	= "MENUITEM_LOAD_SLOT4";
	items[13] 	= "MENUITEM_LOAD_SLOT5";
	items[14] 	= "MENUITEM_LOAD_SLOT6";
	items[15] 	= "MENUITEM_LOAD_SLOT7";
	items[16] 	= "MENUITEM_LOAD_SLOT8";
	items[17] 	= "MENUITEM_LOAD_SLOT9";
	items[18] 	= "MENUITEM_LOAD_SLOT10";
	items[19] 	= "MENUITEM_LOAD_SLOT11";
	items[20] 	= "MENUITEM_LOAD_SLOT12";
	items[21] 	= "MENUITEM_LOAD_SLOT13";
	items[22] 	= "MENUITEM_LOAD_SLOT14";
	items[23] 	= "MENUITEM_LOAD_SLOT15";
	items[24] 	= "MENUITEM_LOAD_SLOT16";
	items[25] 	= "MENUITEM_LOAD_SLOT17";
	items[26] 	= "MENUITEM_LOAD_SLOT18";
	items[27] 	= "MENUITEM_LOAD_SLOT19";
	items[28] 	= "MENUITEM_LOAD_SLOT20";

	items[29] 	= "MENUITEM_LOAD_SLOT0";

	// Backbutton
	items[30] 	= "MENUITEM_LOAD_BACK";

	flags = flags | MENU_SHOW_INFO;
};

INSTANCE MENU_SAVEGAME_SAVE(C_MENU_DEF)
{
	backpic		= MENU_SAVELOAD_BACK_PIC;
	// Kopfzeile
	items[0] 	= "MENUITEM_SAVE_HEADLINE";

		// Gemeinsame Komponenten
	items[1] 	= "MENUITEM_LOADSAVE_THUMBPIC";
	items[2] 	= "MENUITEM_LOADSAVE_DATETIME";
	items[3] 	= "MENUITEM_LOADSAVE_DATETIME_VALUE";
	items[4] 	= "MENUITEM_LOADSAVE_GAMETIME";
	items[5] 	= "MENUITEM_LOADSAVE_GAMETIME_VALUE";
	items[6] 	= "MENUITEM_LOADSAVE_LEVELNAME";
	items[7] 	= "MENUITEM_LOADSAVE_LEVELNAME_VALUE";
	items[8] 	= "MENUITEM_LOADSAVE_PLAYTIME_VALUE";

	// Slots
	items[9] 	= "MENUITEM_SAVE_SLOT1";
	items[10] 	= "MENUITEM_SAVE_SLOT2";
	items[11] 	= "MENUITEM_SAVE_SLOT3";
	items[12] 	= "MENUITEM_SAVE_SLOT4";
	items[13] 	= "MENUITEM_SAVE_SLOT5";
	items[14] 	= "MENUITEM_SAVE_SLOT6";
	items[15] 	= "MENUITEM_SAVE_SLOT7";
	items[16] 	= "MENUITEM_SAVE_SLOT8";
	items[17] 	= "MENUITEM_SAVE_SLOT9";
	items[18] 	= "MENUITEM_SAVE_SLOT10";
	items[19] 	= "MENUITEM_SAVE_SLOT11";
	items[20] 	= "MENUITEM_SAVE_SLOT12";
	items[21] 	= "MENUITEM_SAVE_SLOT13";
	items[22] 	= "MENUITEM_SAVE_SLOT14";
	items[23] 	= "MENUITEM_SAVE_SLOT15";
	items[24] 	= "MENUITEM_SAVE_SLOT16";
	items[25] 	= "MENUITEM_SAVE_SLOT17";
	items[26] 	= "MENUITEM_SAVE_SLOT18";
	items[27] 	= "MENUITEM_SAVE_SLOT19";
	items[28] 	= "MENUITEM_SAVE_SLOT20";

	// Backbutton
	items[29] 	= "MENUITEM_SAVE_BACK";

	flags = flags | MENU_SHOW_INFO;
};


const int SAVEGAME_X1 = 1200;
const int SAVEGAME_X2 = 5400;
const int SAVEGAME_Y  = 1200;
const int SAVEGAME_DY =  275;
const int SAVEGAME_DX1= 3500;
const int SAVEGAME_DX2= 1000;





instance MENUITEM_LOAD_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0]		=	"WCZYTAJ";
	type		=	MENU_ITEM_TEXT;
	posx		=	SAVEGAME_X1;
	posy		=	700;
	flags		=	IT_CHROMAKEYED|IT_TRANSPARENT;
	flags		= flags  & ~IT_SELECTABLE;
};


INSTANCE MENUITEM_SAVE_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0]		=	"ZAPISZ";
	type		=	MENU_ITEM_TEXT;
	posx		=	SAVEGAME_X1;
	posy		=	700;
	flags		=	flags | IT_CHROMAKEYED | IT_TRANSPARENT;
	flags		=   flags & ~IT_SELECTABLE;
};

//--------------------------------------------------------------
// Gemeinsame Komponenten
//--------------------------------------------------------------

instance MENUITEM_LOADSAVE_THUMBPIC(C_MENU_ITEM_DEF)
{
	backpic		= "";
	posx		= SAVEGAME_X2;
	posy		= 1350;
	dimx		= 2048;
	dimy		= 2048;
	flags		= flags  & ~IT_SELECTABLE;
};

//
// WorldName
//
instance MENUITEM_LOADSAVE_LEVELNAME(C_MENU_ITEM_DEF)
{
	type		= MENU_ITEM_TEXT;
	text[0]		= "Świat:";
	posx		= SAVEGAME_X2;
	posy		= 3960;
	fontName	= MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;
};

instance MENUITEM_LOADSAVE_LEVELNAME_VALUE(C_MENU_ITEM_DEF)
{
	type		= MENU_ITEM_TEXT;
	text[0]		= "";
	posx		= SAVEGAME_X2;
	posy		= 3960 + 320;
	dimx		= 8192 - posx;
	dimy		= 350;
	fontName	= MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;
};


//
// Datum und Uhrzeit
//
instance MENUITEM_LOADSAVE_DATETIME(C_MENU_ITEM_DEF)
{
	type		= MENU_ITEM_TEXT;
	text[0]		= "Zapisane";
	posx		= SAVEGAME_X2;
	posy		= 4900;
	fontName	= MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;
};

instance MENUITEM_LOADSAVE_DATETIME_VALUE(C_MENU_ITEM_DEF)
{
	type		= MENU_ITEM_TEXT;
	text[0]		= "";
	posx		= SAVEGAME_X2;
	posy		= 4900 + 320;
	dimx		= 8192 - posx;
	dimy		= 350;
	fontName	= MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;
};




//
// Gametime
//

instance MENUITEM_LOADSAVE_GAMETIME(C_MENU_ITEM_DEF)
{
	type		= MENU_ITEM_TEXT;
	text[0]		= "Czas:";
	posx		= SAVEGAME_X2;
	posy		= 6200;
	fontName	= MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;
};

instance MENUITEM_LOADSAVE_GAMETIME_VALUE(C_MENU_ITEM_DEF)
{
	type		= MENU_ITEM_TEXT;
	text[0]		= "";
	posx		= SAVEGAME_X2;
	posy		= 6200+320;
	dimx		= 8192 - posx;
	dimy		= 350;
	fontName	= MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;
};


//
// Playtime
//

instance MENUITEM_LOADSAVE_PLAYTIME_VALUE(C_MENU_ITEM_DEF)
{
	type		= MENU_ITEM_TEXT;
	text[0]		= "";
	posx		= SAVEGAME_X2;
	posy		= 6200 + 320*2;
	dimx		= 8192 - posx;
	dimy		= 350;
	fontName	= MENU_FONT_SMALL;
	flags		= flags  & ~IT_SELECTABLE;
};


//--------------------------------------------------------------
// SAVGE-GAME-Komponenten
//--------------------------------------------------------------

instance MENUITEM_SAVE_BACK(C_MENU_ITEM_DEF)
{
	text[0]		=	"Wróć";
	text[1]		=	"Wróć";
	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 21*SAVEGAME_DY;
};




//--------------------------------------------------------------
// LOAD-GAME-Komponenten
//--------------------------------------------------------------


INSTANCE MENUITEM_LOAD_BACK(C_MENU_ITEM_DEF)
{
	text[0]		=	"Wróć";
	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 21*SAVEGAME_DY;
};















//--------------------------------------------------------------
// SAVE-SLOTS (Editierbar)
//--------------------------------------------------------------

INSTANCE MENUITEM_SAVE_SLOT1(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "1 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 0 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT1";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT2(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "2 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 1 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT2";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT3(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "3 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 2 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT3";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";

	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT4(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "4 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 3 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT4";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";

	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT5(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "5 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 4 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT5";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT6(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "6 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 5 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT6";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT7(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "7 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 6 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT7";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT8(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "8 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 7 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT8";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT9(C_MENU_ITEM_DEF)
{
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "9 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 8 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT9";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT10(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "10 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 9 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT10";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};

INSTANCE MENUITEM_SAVE_SLOT11(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "11 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 10 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT11";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT12(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "12 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 11 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT12";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT13(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "13 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 12 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT13";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT14(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "14 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 13 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT14";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT15(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "15 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 14 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT15";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};

INSTANCE MENUITEM_SAVE_SLOT16(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "16 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 15 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT16";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT17(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "17 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 16 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT17";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT18(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "18 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 17 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT18";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT19(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "19 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 18 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT19";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_SAVE_SLOT20(C_MENU_ITEM_DEF)
{
	backPic		=   MENU_INPUT_BACK_PIC;
	type		=	MENU_ITEM_INPUT;
	text[0]		=   "nieznane";
	text[1]		=   "20 zapis - wciśnij [Enter] i wpisz nazwę stanu gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 19 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	=	SEL_ACTION_STARTITEM;
	onSelAction_S[0]=	"MENUITEM_SAVE_SLOT20";
	onSelAction[1]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[1]=	"SAVEGAME_SAVE";
	fontName	=	MENU_FONT_SMALL;
};


//--------------------------------------------------------------
// LOAD-SLOTS (nicht editierbar)
//--------------------------------------------------------------


INSTANCE MENUITEM_LOAD_SLOT1(C_MENU_ITEM_DEF)
{
	text[0]		=   "nieznane";
	text[1]		=   "1 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 0 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT2(C_MENU_ITEM_DEF)
{
	text[0]		=   "nieznane";
	text[1]		=   "2 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 1 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT3(C_MENU_ITEM_DEF)
{
	text[0]		=   "nieznane";
	text[1]		=   "3 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 2 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT4(C_MENU_ITEM_DEF)
{
	text[0]		=   "nieznane";
	text[1]		=   "4 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 3 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT5(C_MENU_ITEM_DEF)
{
	text[0]		=   "nieznane";
	text[1]		=   "5 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 4 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT6(C_MENU_ITEM_DEF)
{
	text[0]		=   "nieznane";
	text[1]		=   "6 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 5 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT7(C_MENU_ITEM_DEF)
{
	text[0]		=   "nieznane";
	text[1]		=   "7 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 6 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT8(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "8 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 7 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT9(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "9 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 8 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT10(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "10 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 9 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};



INSTANCE MENUITEM_LOAD_SLOT11(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "11 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 10 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT12(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "12 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 11 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT13(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "13 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 12 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT14(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "14 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 13 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT15(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "15 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 14 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};

INSTANCE MENUITEM_LOAD_SLOT16(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "16 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 15 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT17(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "17 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 16 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT18(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "18 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 17 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT19(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "19 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 18 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};
INSTANCE MENUITEM_LOAD_SLOT20(C_MENU_ITEM_DEF)
{
	text[0]		=   "---";
	text[1]		=   "20 zapis - wciśnij [Enter], aby wczytać ten stan gry"; // Kommentar

	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 19 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
};


INSTANCE MENUITEM_LOAD_SLOT0(C_MENU_ITEM_DEF)
{
	text[0]		=   "    - Szybki zapis -    ";
	text[1]		=   "Wciśnij [Enter], aby wczytać wybrany stan gry"; // Kommentar
	posx		=	SAVEGAME_X1;
	posy		=	SAVEGAME_Y + 20 * SAVEGAME_DY;
	dimx		= 	SAVEGAME_DX1;
	dimy		=	SAVEGAME_DY;
	onSelAction[0]	= 	SEL_ACTION_CLOSE;
	onSelAction_S[0]=	"SAVEGAME_LOAD";
	fontName	=	MENU_FONT_SMALL;
	flags		=  flags ;

	hideIfOptionSectionSet	= "GAME";
	hideIfOptionSet		 	= "useQuickSaveKeys";
	hideOnValue				= 0;

};
