// *********************************************************************
// game options menu
// *********************************************************************

INSTANCE MENU_OPT_GAME(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENUITEM_GAME_HEADLINE";
				
	items[1]		= "MENUITEM_GAME_SUB_TITLES";
	items[2]		= "MENUITEM_GAME_SUB_TITLES_CHOICE";
	
//	items[3]		= "MENUITEM_GAME_ANIMATE_WINDOWS";					// in gothic 2 nur noch über die ini tunebar
//	items[4]		= "MENUITEM_GAME_ANIMATE_WINDOWS_CHOICE";

	items[3]		= "MENUITEM_GAME_FIGHTFOCUS";
	items[4]		= "MENUITEM_GAME_FIGHTFOCUS_CHOICE";	

	items[5]		= "MENUITEM_GAME_INTERACTFOCUS";
	items[6]		= "MENUITEM_GAME_INTERACTFOCUS_CHOICE";	

	items[7]		= "MENUITEM_GAME_LOOKAROUND_INVERSE";
	items[8]		= "MENUITEM_GAME_LOOKAROUND_INVERSE_CHOICE";
	
	items[9]		= "MENUITEM_M";
	items[10]		= "MENUITEM_M_CHOICE";
	
	items[11]		= "MENUITEM_MSENSITIVITY";
	items[12]		= "MENUITEM_MSENSITIVITY_SLIDER";
	
	//items[11]		= "MENUITEM_GAME_BLOOD";				// in gothic 2 nur noch über die ini tunebar
	//items[12]		= "MENUITEM_GAME_BLOOD_CHOICE";
	
	items[13]		= "MENUITEM_GAME_OLDCONTROLS";
	items[14]		= "MENUITEM_GAME_OLDCONTROLS_CHOICE";
				
	items[15]		= "MENUITEM_GAME_BACK";
	
	flags = flags | MENU_SHOW_INFO;
};


INSTANCE MENUITEM_GAME_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"USTAWIENIA GRY";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8100;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;	
};


//
// Lookaround
//

INSTANCE MENUITEM_GAME_SUB_TITLES(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Podpisy";
	text[1]		= 	"Włączenie/wyłączenie podpisów przy dialogach"; // Kommentar
	// Position und Dimension	
	posx		=	700;	posy		=	MENU_START_Y + MENU_SOUND_DY*0;
	dimx		=	4600;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SUB_TITLES_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	"Nie|Tak";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5400;		posy		=	MENU_START_Y + MENU_SOUND_DY*0 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "subTitles";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};


//
// Fenster faden, nur noch in der INI ab Gothic 2
//
/*
INSTANCE MENUITEM_GAME_ANIMATE_WINDOWS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Animierte Fenster";
	text[1]		= 	"Animierte Dialogfenster."; // Kommentar
	// Position und Dimension	
	posx		=	700;	posy		=	MENU_START_Y + MENU_SOUND_DY*1;
	dimx		=	4600;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_ANIMATE_WINDOWS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"Nie|Tak";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5400;		posy		= MENU_START_Y + MENU_SOUND_DY*1 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "animatedWindows";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};
*/

INSTANCE MENUITEM_GAME_FIGHTFOCUS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Oznaczanie celów";
	text[1]		= 	"Wł./wył. wyróżniania bierzącego celu w czasie walki"; // Kommentar
	// Position und Dimension	
	posx		=	700;	posy		=	MENU_START_Y + MENU_SOUND_DY*1;
	dimx		=	4600;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_FIGHTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"Nie|Okienko|Podświetlenie|Oba";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5400;		posy		= MENU_START_Y + MENU_SOUND_DY*1 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "highlightMeleeFocus";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


INSTANCE MENUITEM_GAME_INTERACTFOCUS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Podświetlanie obiektów";
	text[1]		= 	"Wł./wył. podświetlania przedmiotów w polu widzenia"; // Kommentar
	// Position und Dimension	
	posx		=	700;	posy		=	MENU_START_Y + MENU_SOUND_DY*2;
	dimx		=	4600;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_INTERACTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"Nie|Tak";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5400;		posy		= MENU_START_Y + MENU_SOUND_DY*2 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "highlightInteractFocus";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};





//
// Lookaround
//

INSTANCE MENUITEM_GAME_LOOKAROUND_INVERSE(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Zmiana pracy kamery";
	text[1]		= 	"Włączenie/wyłączenie odwróconych ruchów kamery"; // Kommentar
	// Position und Dimension	
	posx		=	700;	posy		=	MENU_START_Y + MENU_SOUND_DY*3;
	dimx		=	4600;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_LOOKAROUND_INVERSE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	"Nie|Tak";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5400;		posy		=	MENU_START_Y + MENU_SOUND_DY*3 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "camLookaroundInverse";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


//
// M.
//

INSTANCE MENUITEM_M(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Myszka w grze";
	text[1]		= 	"Korzystanie z myszki"; // Kommentar
	// Position und Dimension	
	posx		=	700;	posy		=	MENU_START_Y + MENU_SOUND_DY*4;
	dimx		=	4600;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_M_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"Nie|Tak";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5400;		posy		= MENU_START_Y + MENU_SOUND_DY*4 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "enableMouse";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


//
// M-Sensibility
//

INSTANCE MENUITEM_MSENSITIVITY(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Czułość myszy";
	text[1]		= 	"Ustawienie czułości myszy"; // Kommentar
	// Position und Dimension	
	posx		=	700;	posy		=	MENU_START_Y + MENU_SOUND_DY*5;
	dimx		=	4600;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_MSENSITIVITY_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_SLIDER_BACK_PIC;	
	type		=	MENU_ITEM_SLIDER;	
	text[0]		= 	"";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5400;		posy		= MENU_START_Y + MENU_SOUND_DY*5 + MENU_SLIDER_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_SLIDER_DY;
	// Aktionen
	onChgSetOption													= "mouseSensitivity";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	userFloat[0]	= 20;
	userString[0]	= MENU_SLIDER_POS_PIC;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


//
// Bluteffekte deaktivert in Gothic 2 (nur noch über die INI tunebar)
//
/*
INSTANCE MENUITEM_GAME_BLOOD(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Blut Details";
	text[1]		= 	"Grad der Darstellung von Bluteffekten."; // Kommentar
	// Position und Dimension	
	posx		=	700;	posy		=	MENU_START_Y + MENU_SOUND_DY*5;
	dimx		=	4600;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT | IT_EXTENDED_MENU;
};

instance MENUITEM_GAME_BLOOD_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"keine|wenige|mehrere|viele";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5400;		posy		= MENU_START_Y + MENU_SOUND_DY*5 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "bloodDetail";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER | IT_EXTENDED_MENU;
};*/





INSTANCE MENUITEM_GAME_OLDCONTROLS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Sterowanie z Gothic I";
	text[1]		= 	"Wykorzystanie sposobu sterowania z Gothic I"; // Kommentar
	// Position und Dimension	
	posx		=	700;	posy		=	MENU_START_Y + MENU_SOUND_DY*6;
	dimx		=	4600;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

INSTANCE MENUITEM_GAME_OLDCONTROLS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"Nie|Tak";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5400;		posy		= MENU_START_Y + MENU_SOUND_DY*6 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption												= "useGothic1Controls";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};




INSTANCE MENUITEM_GAME_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Wróć";
	// Position und Dimension	
	posx		=	1000;		posy		=	MENU_BACK_Y;
	dimx		=	6192;		dimy		=	MENU_SOUND_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;	
	flags = flags | IT_TXT_CENTER;
};
