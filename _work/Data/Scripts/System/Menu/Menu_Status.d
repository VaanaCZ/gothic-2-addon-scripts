// ********************************
// Anmeldung der MenuItem-Instanzen
// ********************************

instance MENU_STATUS (C_MENU_DEF) 
{
	// Gilde, Level, XP und Magiekreis
	
	items[0]	= "MENU_ITEM_STATUS_HEADING";
	// ---------------------------------------------
	items[1]	= "MENU_ITEM_PLAYERGUILD";
	items[2]	= "MENU_ITEM_LEVEL_TITLE";
	items[3]	= "MENU_ITEM_LEVEL";
	// ---------------------------------------------
	items[4]	= "MENU_ITEM_TALENT_7_TITLE"; 		//Magie
	items[5]	= "MENU_ITEM_TALENT_7_CIRCLE";		//Kreis
	items[6]	= "MENU_ITEM_TALENT_7_SKILL";
	// ---------------------------------------------
	items[7]	= "MENU_ITEM_EXP_TITLE";
	items[8]	= "MENU_ITEM_EXP";
	// ---------------------------------------------
	items[9]	= "MENU_ITEM_LEVEL_NEXT_TITLE";
	items[10]	= "MENU_ITEM_LEVEL_NEXT";
	// ---------------------------------------------
	items[11]	= "MENU_ITEM_LEARN_TITLE";
	items[12]	= "MENU_ITEM_LEARN";
	
	// ------ Attribute ------
	items[13]	= "MENU_ITEM_ATTRIBUTE_HEADING";
	// --------------------------------------------			   
	items[14]	= "MENU_ITEM_ATTRIBUTE_1_TITLE";
	items[15]	= "MENU_ITEM_ATTRIBUTE_2_TITLE";
	items[16]	= "MENU_ITEM_ATTRIBUTE_3_TITLE";
	items[17]	= "MENU_ITEM_ATTRIBUTE_4_TITLE";
	// ---------------------------------------------
	items[18]	= "MENU_ITEM_ATTRIBUTE_1";
	items[19]	= "MENU_ITEM_ATTRIBUTE_2";
	items[20]	= "MENU_ITEM_ATTRIBUTE_3";
	items[21]	= "MENU_ITEM_ATTRIBUTE_4";


	// Rüstungswerte
	
	items[22]	= "MENU_ITEM_ARMOR_HEADING";
	// ---------------------------------------------
	items[23]	= "MENU_ITEM_ARMOR_1_TITLE";
	items[24]	= "MENU_ITEM_ARMOR_2_TITLE";
	items[25]	= "MENU_ITEM_ARMOR_3_TITLE";
	items[26]	= "MENU_ITEM_ARMOR_4_TITLE";
	// --------------------------------------------
	items[27]	= "MENU_ITEM_ARMOR_1";
	items[28]	= "MENU_ITEM_ARMOR_2";
	items[29]	= "MENU_ITEM_ARMOR_3";
	items[30]	= "MENU_ITEM_ARMOR_4";
	
	
	// TALENTE
	
	items[31]	= "MENU_ITEM_TALENTS_HEADING";
	// --- 1h ------------------------------------------
	items[32]	= "MENU_ITEM_TALENT_1_TITLE";
	items[33]	= "MENU_ITEM_TALENT_1_SKILL";
	items[34]	= "MENU_ITEM_TALENT_1";
	// --- 2h -----------------------------------------
	items[35]	= "MENU_ITEM_TALENT_2_TITLE";
	items[36]	= "MENU_ITEM_TALENT_2_SKILL";
	items[37]	= "MENU_ITEM_TALENT_2";
	// --- Bow ------------------------------------------
	items[38]	= "MENU_ITEM_TALENT_3_TITLE";
	items[39]	= "MENU_ITEM_TALENT_3_SKILL";
	items[40]	= "MENU_ITEM_TALENT_3";
	// --- Crossbow ------------------------------------------
	items[41]	= "MENU_ITEM_TALENT_4_TITLE";
	items[42]	= "MENU_ITEM_TALENT_4_SKILL";
	items[43]	= "MENU_ITEM_TALENT_4";

	// --- Sneak ------------------------------------------
	items[44]	= "MENU_ITEM_TALENT_8_TITLE";
	items[45]	= "MENU_ITEM_TALENT_8_SKILL";
	// --- Picklock ---------------------------------------
	items[46]	= "MENU_ITEM_TALENT_5_TITLE";
	items[47]	= "MENU_ITEM_TALENT_5_SKILL";
	// --- Pickpocket ------------------------------------------
	items[48]	= "MENU_ITEM_TALENT_12_TITLE";
	items[49]	= "MENU_ITEM_TALENT_12_SKILL";
	// --- Runes ---------------------------------------
	items[50]	= "MENU_ITEM_TALENT_14_TITLE";
	items[51]	= "MENU_ITEM_TALENT_14_SKILL";
	// --- Alchemy ------------------------------------------
	items[52]	= "MENU_ITEM_TALENT_15_TITLE";
	items[53]	= "MENU_ITEM_TALENT_15_SKILL";
	// --- Smith ------------------------------------------
	items[54]	= "MENU_ITEM_TALENT_13_TITLE";
	items[55]	= "MENU_ITEM_TALENT_13_SKILL";
	// --- TakeAnimalTrophy ------------------------------------------
	items[56]	= "MENU_ITEM_TALENT_16_TITLE";
	items[57]	= "MENU_ITEM_TALENT_16_SKILL";
	

	// ------ Eigenschaften ------
		
	dimx		= 8192;
	dimy		= 8192;
	flags		= flags | MENU_OVERTOP|MENU_NOANI;	
	backPic		= STAT_BACK_PIC;
};


// **********************
// Koordinaten Konstanten
// **********************

// ------ 1. Spalte ------
const int STAT_A_X1 =  500; //Titel
const int STAT_A_X2 = 2300; //Werte
const int STAT_A_X3 = 3000; //hintere Werte (Level _0_)
const int STAT_A_X4 = 3400;	//Ende der A-Spalte (zum zentrieren der Headings)

// ------ 2. Spalte ------
const int STAT_B_X1 = 3800; //Titel
const int STAT_B_X2 = 6000; //Talent-Bezeichnung
const int STAT_B_X3 = 7200; //%-Werte
const int STAT_B_X4 = 7700; //Ende der B-Spalte (zum zentrieren der Headings)

// ----- Zeilen / Blockanfang ------
// 1. Spalte
const int STAT_PLYHEAD_Y	= 1000;
const int STAT_PLY_Y 		= 1450; //Gilde / Punkteblock (1000 + 300 Fonthöhe + 150 Abstand)

const int STAT_ATRHEAD_Y  	= 3250; 
const int STAT_ATR_Y 		= 3700; //Attributsblock

const int STAT_ARMHEAD_Y	= 5200;
const int STAT_ARM_Y 		= 5650; //Armorblock

// 2. Spalte
const int STAT_TALHEAD_Y  	= 1000;
const int STAT_TAL_Y  		= 1450; //2. Spalte - Talentblock

// ----- Zeilengrösse ------
const int STAT_DY =  300;


// ******************
// Menuitem Instanzen
// ******************

// --------------- 
// Charakterprofil
// ---------------
instance MENU_ITEM_STATUS_HEADING(C_MENU_ITEM_DEF)
{
	text[0]	 	= "CHARACTER";
	posx		= STAT_A_X1;				posy = STAT_PLYHEAD_Y;	
	dimx 		= STAT_A_X4 - STAT_A_X1;	dimy = STAT_DY;
	fontName	= STAT_FONT_DEFAULT;
	flags		= (flags & ~IT_SELECTABLE)|IT_TXT_CENTER;
};

// ------ Gildenlos		Level 0 ------
instance MENU_ITEM_PLAYERGUILD(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1;				posy = STAT_PLY_Y+STAT_DY*0;
	fontName	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_LEVEL_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X2;				posy = STAT_PLY_Y + STAT_DY*0;
	text[0]		= "Level";	
	fontName	= STAT_FONT_DEFAULT;		
	flags		= flags & ~IT_SELECTABLE; //Selectable wird mit &! rausgeworfen - alle andern Flags bleiben, wie sie sind
};

instance MENU_ITEM_LEVEL(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X3;				posy = STAT_PLY_Y + STAT_DY*0;	
	fontName	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

// ------ Magie 	Kreis 1	------ //Talent 7
instance MENU_ITEM_TALENT_7_TITLE(C_MENU_ITEM_DEF) 
{ 
	posx 		= STAT_A_X1;				posy = STAT_PLY_Y + STAT_DY*1;	
	fontName 	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE; 
};

instance MENU_ITEM_TALENT_7_CIRCLE(C_MENU_ITEM_DEF) 
{
	posx 		= STAT_A_X2;				posy = STAT_PLY_Y + STAT_DY*1;	
	text[0]		= "Circle"; 
	fontName 	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE; 
};
instance MENU_ITEM_TALENT_7_SKILL(C_MENU_ITEM_DEF)  
{ 
	posx 		= STAT_A_X3;				posy = STAT_PLY_Y + STAT_DY*1;
	fontName 	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE; 
};

// ------ Erfahrung		16000 ------
instance MENU_ITEM_EXP_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1;				posy = STAT_PLY_Y + STAT_DY*2;	
	text[0]		= "Experience"; 
	fontName 	= STAT_FONT_DEFAULT;	
	flags		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_EXP(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X2;				posy = STAT_PLY_Y + STAT_DY*2;	
	fontName 	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

// ------ Next Level XP 	20000 ------
instance MENU_ITEM_LEVEL_NEXT_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1;				posy = STAT_PLY_Y + STAT_DY*3;	
	text[0]		= "Next Level";
	fontName 	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_LEVEL_NEXT(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X2;				posy = STAT_PLY_Y + STAT_DY*3;	
	fontName 	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

// ------ Lernpunkte	1 ------
instance MENU_ITEM_LEARN_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1;				posy = STAT_PLY_Y + STAT_DY*4;	
	text[0]		= "Learning Pts.";	
	fontName 	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_LEARN(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X2;				posy = STAT_PLY_Y + STAT_DY*4;	
	fontName 	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};


// --------- 
// Attribute
// ---------

INSTANCE MENU_ITEM_ATTRIBUTE_HEADING(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1;				posy = STAT_ATRHEAD_Y;
	dimx 		= STAT_A_X4 - STAT_A_X1;	dimy = STAT_DY;
	text[0]		= "ATTRIBUTES";	
	fontName	= STAT_FONT_DEFAULT;
	flags		= (flags & ~IT_SELECTABLE)|IT_TXT_CENTER;
};

// ------ Stärke ------
INSTANCE MENU_ITEM_ATTRIBUTE_1_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1;				posy = STAT_ATR_Y + STAT_DY*0;
	text[0]		= "Strength";
	fontName	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ATTRIBUTE_1(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X2;				posy = STAT_ATR_Y + STAT_DY*0;
	fontName	= STAT_FONT_DEFAULT;	
	flags		= flags & ~IT_SELECTABLE;
};

// ------ Geschick -------
INSTANCE MENU_ITEM_ATTRIBUTE_2_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1;				posy = STAT_ATR_Y + STAT_DY*1;
	text[0]		= "Dexterity";
	fontName	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ATTRIBUTE_2(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X2;				posy = STAT_ATR_Y + STAT_DY*1;
	fontName	= STAT_FONT_DEFAULT;	
	flags		= flags & ~IT_SELECTABLE;
};

// ------ Mana ------
INSTANCE MENU_ITEM_ATTRIBUTE_3_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1;				posy = STAT_ATR_Y + STAT_DY*2;
	text[0]		= "Mana";
	fontName	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ATTRIBUTE_3(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X2;				posy = STAT_ATR_Y + STAT_DY*2;
	fontName	= STAT_FONT_DEFAULT;	
	flags		= flags & ~IT_SELECTABLE;
};

// ------ Lebensenergie ------
INSTANCE MENU_ITEM_ATTRIBUTE_4_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1;				posy = STAT_ATR_Y + STAT_DY*3;
	text[0]		= "Hitpoints";
	fontName	= STAT_FONT_DEFAULT;
	flags		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ATTRIBUTE_4(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X2;				posy = STAT_ATR_Y + STAT_DY*3;
	fontName	= STAT_FONT_DEFAULT;	
	flags		= flags & ~IT_SELECTABLE;
};


// --------------
// Rüstungsschutz
// --------------

INSTANCE MENU_ITEM_ARMOR_HEADING(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1; 				posy = STAT_ARMHEAD_Y;
	dimx 		= STAT_A_X4 - STAT_A_X1;	dimy = STAT_DY;
	text[0]		= "PROTECTION";
	fontName	= STAT_FONT_DEFAULT;
	flags		= (flags & ~IT_SELECTABLE)|IT_TXT_CENTER;
};

// ------ Waffen ------ (nur Edge wird angezeigt)
INSTANCE MENU_ITEM_ARMOR_1_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1; 				posy = STAT_ARM_Y + STAT_DY*0;
	text[0]		= "Weapons";
	fontName 	= STAT_FONT_DEFAULT;
	flags 		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_1(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X3; 				posy = STAT_ARM_Y + STAT_DY*0;	
	fontName 	= STAT_FONT_DEFAULT;
	flags 		= flags & ~IT_SELECTABLE;
};

// ------ Point ------
instance MENU_ITEM_ARMOR_2_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1; 				posy = STAT_ARM_Y + STAT_DY*1;	
	text[0]		= "Projectiles";
	fontName 	= STAT_FONT_DEFAULT;
	flags 		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_2(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X3; 				posy = STAT_ARM_Y + STAT_DY*1;	
	fontName 	= STAT_FONT_DEFAULT;
	flags 		= flags & ~IT_SELECTABLE;
};

// ------ Fire ------
INSTANCE MENU_ITEM_ARMOR_3_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1; 				posy = STAT_ARM_Y + STAT_DY*2;
	text[0]		= "Dragon fire";
	fontName 	= STAT_FONT_DEFAULT;
	flags 		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_3(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X3; 				posy = STAT_ARM_Y + STAT_DY*2;
	fontName 	= STAT_FONT_DEFAULT;
	flags 		= flags & ~IT_SELECTABLE;
};

// ------ Magic ------
INSTANCE MENU_ITEM_ARMOR_4_TITLE(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X1; 				posy = STAT_ARM_Y + STAT_DY*3;
	text[0]		= "Magic";
	fontName 	= STAT_FONT_DEFAULT;
	flags 		= flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_ARMOR_4(C_MENU_ITEM_DEF)
{
	posx 		= STAT_A_X3; 				posy = STAT_ARM_Y + STAT_DY*3;
	fontName 	= STAT_FONT_DEFAULT;
	flags 		= flags & ~IT_SELECTABLE;
};


// -------
// Talente
// -------

INSTANCE MENU_ITEM_TALENTS_HEADING(C_MENU_ITEM_DEF)
{

	posx		= STAT_B_X1; 				posy = STAT_TALHEAD_Y;
	dimx 		= STAT_B_X4 - STAT_B_X1;	dimy = STAT_DY;
	text[0]		= "SKILLS";
	fontName	= STAT_FONT_DEFAULT;	
	flags		= (flags & ~IT_SELECTABLE)|IT_TXT_CENTER;
};

// ------ 1h ------ // Talent 1
INSTANCE MENU_ITEM_TALENT_1_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  0*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_1_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  0*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_1(C_MENU_ITEM_DEF) 	   { posx = STAT_B_X3;posy = STAT_TAL_Y +  0*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// ------ 2h ------ // Talent 2
INSTANCE MENU_ITEM_TALENT_2_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_2_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_2(C_MENU_ITEM_DEF) 	   { posx = STAT_B_X3;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// ----- Bow ----- // Talent 3
INSTANCE MENU_ITEM_TALENT_3_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_3_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_3(C_MENU_ITEM_DEF)       { posx = STAT_B_X3;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// ------ Crossbow // Talent 4
INSTANCE MENU_ITEM_TALENT_4_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_4_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_4(C_MENU_ITEM_DEF)       { posx = STAT_B_X3;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// LEERZEILE

// ------ Sneak ------Talent 8
INSTANCE MENU_ITEM_TALENT_8_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y +  5*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_8_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y +  5*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// ------ Picklock ------ // Talent 5
INSTANCE MENU_ITEM_TALENT_5_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  6*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_5_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  6*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// ------ Pickpocket (NEW) ------ // Talent 12
INSTANCE MENU_ITEM_TALENT_12_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 7*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_12_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 7*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// LEERZEILE

// ------ Runes ------ // Talent 14
INSTANCE MENU_ITEM_TALENT_14_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 9*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_14_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 9*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// ------ Alchemy ------ // Talent 15
INSTANCE MENU_ITEM_TALENT_15_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 10*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_15_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 10*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// ------ Smith ------ // Talent 13
INSTANCE MENU_ITEM_TALENT_13_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 11*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_13_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 11*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// LEERZEILE

// ------ TakeAnimalTrophy ------ // Talent 16
INSTANCE MENU_ITEM_TALENT_16_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 13*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_16_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 13*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };











/*

// Talent 6
INSTANCE MENU_ITEM_TALENT_6_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  8*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_6_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2;posy = STAT_TAL_Y +  8*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_6(C_MENU_ITEM_DEF)       { posx = STAT_B_X3;posy = STAT_TAL_Y +  8*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };


// Spezial


// Talent 9
INSTANCE MENU_ITEM_TALENT_9_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y +  16*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_9_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y +  16*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 10
INSTANCE MENU_ITEM_TALENT_10_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 17*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_10_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 17*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 11
INSTANCE MENU_ITEM_TALENT_11_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 18*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_11_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 18*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

// Talent 12
INSTANCE MENU_ITEM_TALENT_12_TITLE(C_MENU_ITEM_DEF)  { posx = STAT_B_X1;posy = STAT_TAL_Y + 19*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_12_SKILL(C_MENU_ITEM_DEF)  { posx = STAT_B_X2;posy = STAT_TAL_Y + 19*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };

*/
