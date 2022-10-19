// *********************
//      Constants
//    Phoenix V0.67
// *********************


// *************************************************************
// PrintScreen Fonts
// *************************************************************

const string FONT_Screen					= "FONT_OLD_20_WHITE.TGA";
const string FONT_ScreenSmall				= "FONT_OLD_10_WHITE.TGA";
const string FONT_Book						= "FONT_10_BOOK.TGA";
const string FONT_BookHeadline				= "FONT_20_BOOK.TGA";


// ****************************
// Spellkosten für ALLE SCrolls
// ****************************
const int SPL_Cost_Scroll = 5;


// MH: 19.11.01 Gildennamen geändert --> Änderungen in Text.d (Character-Screen Gildenbezeichnungen) und Species.d (Gildenanhängige Bewegungswerte wie z.B Kletterhöhe)
// MH: 19.11.01 Talente hinzugefügt
// MH: 15.12.01 Neue Spells hinzugefügt
// MH: 15.12.01 Neue Player Talente hinzugefügt

//
//	NPC ATTRIBUTES
//

const int ATR_HITPOINTS				=  0;	// Lebenspunkte
const int ATR_HITPOINTS_MAX			=  1;	// Max. Lebenspunkte
const int ATR_MANA					=  2;	// Mana Mana
const int ATR_MANA_MAX				=  3;	// Mana Max

const int ATR_STRENGTH				=  4;	// Stärke
const int ATR_DEXTERITY				=  5;	// Geschick
const int ATR_REGENERATEHP			=  6;	// Regenerierung von HP alle x sekunden
const int ATR_REGENERATEMANA		=  7;   // Regenerierung von Mana alle x sekunden

const int ATR_INDEX_MAX				=  8;

//
//	NPC FLAGS
//
CONST INT NPC_FLAG_FRIEND								=  1 << 0				;	// wird nicht benutzt (wird über aivar geregelt)
CONST INT NPC_FLAG_IMMORTAL								=  1 << 1				;	// Unverwundbar
CONST INT NPC_FLAG_GHOST								=  1 << 2				;	// Halb-Transparenter NPC (Gothic.ini [INTERNAL] 'GhostAlpha')

//
//	FIGHT MODES
//
CONST INT FMODE_NONE									=  0					;
CONST INT FMODE_FIST									=  1					;
CONST INT FMODE_MELEE									=  2					;
CONST INT FMODE_FAR										=  5					;
CONST INT FMODE_MAGIC									=  7					;

//
//	WALK MODES
//
CONST INT NPC_RUN										=  0					;
CONST INT NPC_WALK										=  1					;
CONST INT NPC_SNEAK										=  2					;
CONST INT NPC_RUN_WEAPON								=  0 + 128				;
CONST INT NPC_WALK_WEAPON								=  1 + 128				;
CONST INT NPC_SNEAK_WEAPON								=  2 + 128				;

//
//	ARMOR FLAGS
//
CONST INT WEAR_TORSO									=  1					;		//	Oberkoerper	( Brustpanzer )
CONST INT WEAR_HEAD										=  2					;		//	Kopf		( Helm )
CONST INT WEAR_EFFECT									=  16					;		

//
//	INVENTORY CATEGORIES
//
CONST INT INV_WEAPON									=  1					;
CONST INT INV_ARMOR										=  2					;
CONST INT INV_RUNE										=  3					;
CONST INT INV_MAGIC										=  4					;
CONST INT INV_FOOD										=  5					;
CONST INT INV_POTION									=  6					;
CONST INT INV_DOC										=  7					;
CONST INT INV_MISC										=  8					;
CONST INT INV_CAT_MAX									=  9					;

//
//	INVENTORY CAPACITIES		// --- werden vom Programm ignoriert - INV ist unendlich groß! ---
//
CONST INT INV_MAX_WEAPONS								=    6					;
CONST INT INV_MAX_ARMORS 								=    2					;
CONST INT INV_MAX_RUNES									= 1000					;		//	virtually infinite
CONST INT INV_MAX_FOOD									=   15					;
CONST INT INV_MAX_DOCS									= 1000					;		//	virtually infinite
CONST INT INV_MAX_POTIONS								= 1000					;		//	virtually infinite
CONST INT INV_MAX_MAGIC									= 1000					;		//	virtually infinite
CONST INT INV_MAX_MISC									= 1000					;

//
//	ITEM TEXTS
//
CONST INT ITM_TEXT_MAX									=  6					;

////////////////////////////////////////////////////////////////////////////////
//
//	ITEM FLAGS
//

// categories (mainflag)
const int ITEM_KAT_NONE		= 1 <<  0;  // Sonstiges
const int ITEM_KAT_NF		= 1 <<  1;  // Nahkampfwaffen
const int ITEM_KAT_FF		= 1 <<  2;  // Fernkampfwaffen
const int ITEM_KAT_MUN		= 1 <<  3;  // Munition (MULTI)
const int ITEM_KAT_ARMOR	= 1 <<  4;  // Ruestungen
const int ITEM_KAT_FOOD		= 1 <<  5;  // Nahrungsmittel (MULTI)
const int ITEM_KAT_DOCS		= 1 <<  6;  // Dokumente
const int ITEM_KAT_POTIONS	= 1 <<  7;  // Traenke
const int ITEM_KAT_LIGHT	= 1 <<  8;  // Lichtquellen
const int ITEM_KAT_RUNE		= 1 <<  9;  // Runen/Scrolls
const int ITEM_KAT_MAGIC	= 1 << 31;  // Ringe/Amulette/Guertel
const int ITEM_KAT_KEYS		= ITEM_KAT_NONE;
// weapon type (flags)
const int ITEM_DAG			= 1 << 13;  // (OBSOLETE!)
const int ITEM_SWD			= 1 << 14;  // Schwert
const int ITEM_AXE			= 1 << 15;  // Axt
const int ITEM_2HD_SWD		= 1 << 16;  // Zweihaender
const int ITEM_2HD_AXE		= 1 << 17;  // Streitaxt
const int ITEM_SHIELD		= 1 << 18;  // (OBSOLETE!)
const int ITEM_BOW			= 1 << 19;  // Bogen
const int ITEM_CROSSBOW		= 1 << 20;  // Armbrust
// magic type (flags)
const int ITEM_RING			= 1 << 11;  // Ring
const int ITEM_AMULET		= 1 << 22;  // Amulett
const int ITEM_BELT			= 1 << 24;  // Guertel
// attributes (flags)
const int ITEM_DROPPED 		= 1 << 10;  // (INTERNAL!)
const int ITEM_MISSION 		= 1 << 12;  // Missionsgegenstand
const int ITEM_MULTI		= 1 << 21;  // Stapelbar
const int ITEM_NFOCUS		= 1 << 23;  // (INTERNAL!)
const int ITEM_CREATEAMMO	= 1 << 25;  // Erzeugt Munition selbst (magisch)
const int ITEM_NSPLIT		= 1 << 26;  // Kein Split-Item (Waffe als Interact-Item!)
const int ITEM_DRINK		= 1 << 27;  // (OBSOLETE!)
const int ITEM_TORCH		= 1 << 28;  // Fackel
const int ITEM_THROW		= 1 << 29;  // (OBSOLETE!)
const int ITEM_ACTIVE		= 1 << 30;  // (INTERNAL!)

//
//	DAMAGE TYPES v2.0
//
CONST INT DAM_INVALID									= 0						;       //	  0 - 0x00 - nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )
CONST INT DAM_BARRIER									= 1						;  		//	  1 - 0x01 - nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )
CONST INT DAM_BLUNT										= DAM_BARRIER	<< 1	;  		//	  2 - 0x02 - blunt ist das bit links von barrier
CONST INT DAM_EDGE										= DAM_BLUNT		<< 1	;		//	  4 - 0x04 - edge 	ist das bit links von blunt
CONST INT DAM_FIRE										= DAM_EDGE		<< 1	;  		//	  8 - 0x08 - fire 	ist das bit links von edge
CONST INT DAM_FLY										= DAM_FIRE		<< 1	;		//	 16 - 0x10 - fly 	ist das bit links von fire
CONST INT DAM_MAGIC										= DAM_FLY		<< 1	;  		//	 32 - 0x20 - magic	ist das bit links von fly
CONST INT DAM_POINT										= DAM_MAGIC		<< 1	;  		//	 64 - 0x40 - point	ist das bit links von magic
CONST INT DAM_FALL										= DAM_POINT		<< 1	;  		//	128 - 0x80 - nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )

//
//	DAMAGE TYPE ARRAY INDICES	( !!! DAM_XXX = 1 << DAM_INDEX_XXX !!! )
//
CONST INT DAM_INDEX_BARRIER								= 0						;  		//				 nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )
CONST INT DAM_INDEX_BLUNT								= DAM_INDEX_BARRIER + 1	;
CONST INT DAM_INDEX_EDGE								= DAM_INDEX_BLUNT	+ 1	;
CONST INT DAM_INDEX_FIRE								= DAM_INDEX_EDGE	+ 1	;
CONST INT DAM_INDEX_FLY									= DAM_INDEX_FIRE	+ 1	;
CONST INT DAM_INDEX_MAGIC								= DAM_INDEX_FLY		+ 1	;
CONST INT DAM_INDEX_POINT								= DAM_INDEX_MAGIC	+ 1	;
CONST INT DAM_INDEX_FALL								= DAM_INDEX_POINT	+ 1	;  		//				 nur der Vollstandigkeit und Transparenz wegen hier definiert ( _NICHT_ verwenden )
CONST INT DAM_INDEX_MAX									= DAM_INDEX_FALL	+ 1 ;

//
//	OTHER DAMAGE CONSTANTS
//
CONST INT NPC_ATTACK_FINISH_DISTANCE					= 180		;
CONST INT NPC_BURN_TICKS_PER_DAMAGE_POINT				= 1000		; //Default 1000
CONST INT NPC_BURN_DAMAGE_POINTS_PER_INTERVALL			= 50		; //Default 10
CONST INT DAM_CRITICAL_MULTIPLIER						= 2			; //Obsolet, da Treffer-%-CHance CriticalHit ersetzt hat

CONST INT BLOOD_SIZE_DIVISOR							= 1000		;
CONST INT BLOOD_DAMAGE_MAX								= 200	    ;

CONST INT DAMAGE_FLY_CM_MAX								= 2000  	;
CONST INT DAMAGE_FLY_CM_MIN	                            = 300   	;
const INT DAMAGE_FLY_CM_PER_POINT						= 5			;

const int NPC_DAM_DIVE_TIME								= 100		;

const int IMMUNE										= -1 		;

// ------ Wie weit werden Npcs im Kampf voneinander weggeschoben -------
// ------ Faktor zu W-Distanz (BASE + Waffe, bzw. BASE + FIST) ------
const float NPC_COLLISION_CORRECTION_SCALER				= 0.75;		//Default = 0.75


//
//	PROTECTION TYPES v2.0
//
CONST INT PROT_BARRIER									= DAM_INDEX_BARRIER		;
CONST INT PROT_BLUNT									= DAM_INDEX_BLUNT		;
CONST INT PROT_EDGE										= DAM_INDEX_EDGE		;
CONST INT PROT_FIRE										= DAM_INDEX_FIRE		;
CONST INT PROT_FLY										= DAM_INDEX_FLY			;
CONST INT PROT_MAGIC									= DAM_INDEX_MAGIC		;
CONST INT PROT_POINT									= DAM_INDEX_POINT		;
CONST INT PROT_FALL										= DAM_INDEX_FALL		;
CONST INT PROT_INDEX_MAX								= DAM_INDEX_MAX			;

//
//	PERCEPTIONS	( ACTIVE )
//
CONST INT PERC_ASSESSPLAYER								=	1					;
CONST INT PERC_ASSESSENEMY								=	2					;
CONST INT PERC_ASSESSFIGHTER							=	3					;
CONST INT PERC_ASSESSBODY								=	4					;
CONST INT PERC_ASSESSITEM								=	5					;

//
//	SENSES
//
CONST INT SENSE_SEE										= 1 << 0				;
CONST INT SENSE_HEAR									= 1 << 1				;
CONST INT SENSE_SMELL									= 1 << 2				;

//
//	PERCEPTIONS	( PASSIVE )
//
CONST INT PERC_ASSESSMURDER								=	6					;
CONST INT PERC_ASSESSDEFEAT								=	7					;
CONST INT PERC_ASSESSDAMAGE								=	8					;
CONST INT PERC_ASSESSOTHERSDAMAGE						=	9					;
CONST INT PERC_ASSESSTHREAT								=  10					;
CONST INT PERC_ASSESSREMOVEWEAPON						=  11					;
CONST INT PERC_OBSERVEINTRUDER							=  12					;
CONST INT PERC_ASSESSFIGHTSOUND							=  13					;
CONST INT PERC_ASSESSQUIETSOUND							=  14					;
CONST INT PERC_ASSESSWARN								=  15					;
CONST INT PERC_CATCHTHIEF								=  16					;
CONST INT PERC_ASSESSTHEFT								=  17					;
CONST INT PERC_ASSESSCALL								=  18					;
CONST INT PERC_ASSESSTALK								=  19					;
CONST INT PERC_ASSESSGIVENITEM							=  20					;
CONST INT PERC_ASSESSFAKEGUILD							=  21					; //wird gesendet, sobald der SC sich verwandelt
CONST INT PERC_MOVEMOB									=  22					;
CONST INT PERC_MOVENPC									=  23					;
CONST INT PERC_DRAWWEAPON								=  24					;
CONST INT PERC_OBSERVESUSPECT							=  25					;
CONST INT PERC_NPCCOMMAND								=  26					;
CONST INT PERC_ASSESSMAGIC								=  27					;
CONST INT PERC_ASSESSSTOPMAGIC							=  28					;
CONST INT PERC_ASSESSCASTER								=  29					; //wird beim 1. investierten Manapunkt gesendet
CONST INT PERC_ASSESSSURPRISE							=  30					; //wird beim Zurückverwandeln gesendet
CONST INT PERC_ASSESSENTERROOM							=  31					;
CONST INT PERC_ASSESSUSEMOB								=  32					;

//
//	NEWS SPREAD MODE
//
CONST INT NEWS_DONT_SPREAD								= 0						;
const INT NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_VICTIM		= 1						;
CONST INT NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_WITNESS		= 2						;
CONST INT NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_OFFENDER		= 3						;
CONST INT NEWS_SPREAD_NPC_SAME_GUILD_VICTIM				= 4						;

//
//	NEWS CONSTANTS
//
CONST INT IMPORTANT										= 1						;

//
//	INFO STATUS
//
CONST INT INF_TELL										= 0						;
CONST INT INF_UNKNOWN									= 2						;

//
//	MISSION STATUS
//
const INT LOG_RUNNING									= 1						;		//	Mission läuft gerade
CONST INT LOG_SUCCESS									= 2						;		//	Mission erfolgreich beendet
CONST INT LOG_FAILED									= 3						;		//	Mission wurde abgebrochen
CONST INT LOG_OBSOLETE									= 4						;		//	Mission ist hinfaellig

//
//	ATTITUDES
//
CONST INT ATT_FRIENDLY									= 3						;
CONST INT ATT_NEUTRAL									= 2						;
CONST INT ATT_ANGRY										= 1						;
CONST INT ATT_HOSTILE									= 0						;


// ******************
// 		Gilden
// ******************

const int GIL_NONE						= 0		;	// (keine)
const int GIL_HUMAN						= 1		;	// Special Guild -> To set Constants for ALL Human Guilds --> wird verwendet in Species.d
const int GIL_PAL						= 1		;	// Paladin
const int GIL_MIL						= 2		;	// Miliz
const int GIL_VLK						= 3		;	// Bürger
const int GIL_KDF						= 4		;	// Magier
const int GIL_NOV						= 5		;	// Magier Novize
const int GIL_DJG						= 6		;	// Drachenjäger
const int GIL_SLD						= 7		;	// Söldner
const int GIL_BAU						= 8		;	// Bauer
const int GIL_BDT						= 9		;	// Bandit
const int GIL_STRF						= 10	; 	// Prisoner, Sträfling
const int GIL_DMT						= 11	;	// Dementoren
const int GIL_OUT						= 12	; 	// Outlander (z.B. kleine Bauernhöfe)

const int GIL_PIR						= 13	;	//Pirat
const int GIL_KDW						= 14	;	//KDW
const int GIL_EMPTY_D					= 15	;	// NICHT VERWENDEN!
//-----------------------------------------------
const int GIL_PUBLIC					= 15	; 	// für öffentliche Portalräume
//-----------------------------------------------

const int GIL_SEPERATOR_HUM				= 16	;

const int GIL_MEATBUG					= 17	;
const int GIL_SHEEP						= 18	;
const int GIL_GOBBO						= 19	; 	// Green Goblin / Black Goblin
const int GIL_GOBBO_SKELETON			= 20	;
const int GIL_SUMMONED_GOBBO_SKELETON 	= 21	;
const int GIL_SCAVENGER					= 22	; 	// (bei Bedarf) Scavenger / Evil Scavenger /OrcBiter
const int GIL_GIANT_RAT					= 23	;
const int GIL_GIANT_BUG					= 24	;
const int GIL_BLOODFLY					= 25	;
const int GIL_WARAN						= 26	; 	// Waren / Feuerwaran
const int GIL_WOLF						= 27	; 	// Wolf / Warg
const int GIL_SUMMONED_WOLF				= 28	;
const int GIL_MINECRAWLER				= 29	; 	// Minecrawler / Minecrawler Warrior
const int GIL_LURKER					= 30	;
const int GIL_SKELETON					= 31	;
const int GIL_SUMMONED_SKELETON			= 32	;
const int GIL_SKELETON_MAGE				= 33	;
const int GIL_ZOMBIE					= 34	;
const int GIL_SNAPPER					= 35	; 	// Snapper / Dragon Snapper /Razor
const int GIL_SHADOWBEAST				= 36	;	//Shadowbeast / Bloodhound
const int GIL_SHADOWBEAST_SKELETON		= 37	;
const int GIL_HARPY						= 38	;
const int GIL_STONEGOLEM				= 39 	;
const int GIL_FIREGOLEM					= 40	;
const int GIL_ICEGOLEM					= 41	;
const int GIL_SUMMONED_GOLEM			= 42	;
const int GIL_DEMON						= 43	;
const int GIL_SUMMONED_DEMON			= 44	;
const int GIL_TROLL						= 45 	; 	// Troll / Schwarzer Troll
const int GIL_SWAMPSHARK				= 46	; 	// (bei Bedarf)
const int GIL_DRAGON					= 47	; 	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
const int GIL_MOLERAT					= 48	; 	// Molerat

const int GIL_ALLIGATOR					= 49	;
const int GIL_SWAMPGOLEM				= 50	;
const int GIL_Stoneguardian				= 51	;
const int GIL_Gargoyle					= 52	;
const int GIL_Empty_A					= 53	;
const int GIL_SummonedGuardian			= 54	;
const int GIL_SummonedZombie			= 55	;
const int GIL_EMPTY_B					= 56	;
const int GIL_EMPTY_C					= 57	;

const int GIL_SEPERATOR_ORC				= 58	;	// (ehem. 37)

const int GIL_ORC						= 59	;	// Ork-Krieger / Ork-Shamane / Ork-Elite
const int GIL_FRIENDLY_ORC				= 60	;	// Ork-Sklave / Ur-Shak
const int GIL_UNDEADORC					= 61	;
const int GIL_DRACONIAN					= 62	;

const int GIL_EMPTY_X					= 63	;
const int GIL_EMPTY_Y					= 64	;
const int GIL_EMPTY_Z					= 65	;

const int GIL_MAX						= 66	;	// (ehem. 42)



//
//	GUILDS DESCRIPTION
//
CLASS C_GILVALUES
{
	VAR INT		WATER_DEPTH_KNEE						[GIL_MAX]				;
	VAR INT		WATER_DEPTH_CHEST						[GIL_MAX]				;
	VAR INT		JUMPUP_HEIGHT							[GIL_MAX]				;		//	DEFAULT = 200;
//	VAR INT		JUMPUP_FORCE							[GIL_MAX]				;
	VAR INT		SWIM_TIME								[GIL_MAX]				;
	VAR INT		DIVE_TIME								[GIL_MAX]				;
	VAR INT		STEP_HEIGHT								[GIL_MAX]				;
	VAR INT		JUMPLOW_HEIGHT							[GIL_MAX]				;
	VAR INT		JUMPMID_HEIGHT							[GIL_MAX]				;
	VAR INT		SLIDE_ANGLE								[GIL_MAX]				;
	VAR INT		SLIDE_ANGLE2							[GIL_MAX]				;
	VAR INT		DISABLE_AUTOROLL						[GIL_MAX]				;		//	DEFAULT = 0					;  0 = Autoroll  enabled	/ 1 = Autoroll  disabled
	VAR INT		SURFACE_ALIGN							[GIL_MAX]				;		//	DEFAULT = 0					;  0 = Alignment disabled	/ 1 = Alignment enabled
	VAR INT		CLIMB_HEADING_ANGLE						[GIL_MAX]				;
	VAR INT		CLIMB_HORIZ_ANGLE						[GIL_MAX]				;
	VAR INT		CLIMB_GROUND_ANGLE						[GIL_MAX]				;
	VAR INT		FIGHT_RANGE_BASE						[GIL_MAX]				;
	VAR INT		FIGHT_RANGE_FIST						[GIL_MAX]				;
	var int 	FIGHT_RANGE_G							[GIL_MAX]				;
	VAR INT		FIGHT_RANGE_1HS							[GIL_MAX]				;
	VAR INT		FIGHT_RANGE_1HA							[GIL_MAX]				;
	VAR INT		FIGHT_RANGE_2HS							[GIL_MAX]				;
	VAR INT		FIGHT_RANGE_2HA							[GIL_MAX]				;
	VAR INT		FALLDOWN_HEIGHT							[GIL_MAX]				;		//									Wie tief Fallen ohne Schaden ?
	VAR INT		FALLDOWN_DAMAGE							[GIL_MAX]				;		//									Schaden für jeden weiteren angefangenen Meter.
	VAR INT		BLOOD_DISABLED							[GIL_MAX]				;		//	DEFAULT = 0					;	Blut ganz ausschalten (z.B. bei Sekletten) ?
	VAR INT		BLOOD_MAX_DISTANCE						[GIL_MAX]				;		//	DEFAULT = 1000				;	Wie weit spritzt das Blut (in cm) ?
	VAR INT		BLOOD_AMOUNT							[GIL_MAX]				;		//	DEFAULT = 10				;	Wie viel Blut ?
	VAR INT		BLOOD_FLOW								[GIL_MAX]				;		//	DEFAULT = 0					;	Soll es sich langsam ausbreiten ?
	VAR STRING  BLOOD_EMITTER							[GIL_MAX]				;		//	DEFAULT = "PFX_BLOOD"		;	Welcher Partikel-Emitter ?
	VAR STRING  BLOOD_TEXTURE							[GIL_MAX]				;		//	DEFAULT = "ZBLOODSPLAT2.TGA";	Welche Textur ?
	VAR INT 	TURN_SPEED								[GIL_MAX]				;		//	DEFAULT = 150				;
};

//
//	SOUND TYPES
//
CONST INT NPC_SOUND_DROPTAKE							= 1						;
CONST INT NPC_SOUND_SPEAK								= 3						;
CONST INT NPC_SOUND_STEPS								= 4						;
CONST INT NPC_SOUND_THROWCOLL							= 5						;
CONST INT NPC_SOUND_DRAWWEAPON							= 6						;
CONST INT NPC_SOUND_SCREAM								= 7						;
CONST INT NPC_SOUND_FIGHT								= 8						;

//
//	MATERIAL TYPES
//
CONST INT MAT_WOOD										= 0						;
CONST INT MAT_STONE										= 1						;
CONST INT MAT_METAL										= 2						;
CONST INT MAT_LEATHER									= 3						;
CONST INT MAT_CLAY										= 4						;
CONST INT MAT_GLAS										= 5						;		// ??

//
//	LOG
//
CONST INT LOG_MISSION									= 0						;
CONST INT LOG_NOTE										= 1						;

//
//	OTHER CONSTANTS
//
const int TIME_INFINITE									= -1000000 / 1000		;
const int NPC_VOICE_VARIATION_MAX						= 10					;

const float		TRADE_VALUE_MULTIPLIER					= 0.15;			// DEFAULT = 0.3			Faktor auf den Wert eines Items, den ein Haendler bezahlt
const string	TRADE_CURRENCY_INSTANCE					= "ITMI_GOLD";	// DEFAULT = "ITMI_GOLD"	Name der Instanz des Waehrungs-Items


////////////////////////////////////////////////////////////////////////////////
//
//	Spells: Kategorie-Konstanten
//

const int SPELL_GOOD	= 0;
const int SPELL_NEUTRAL	= 1;
const int SPELL_BAD		= 2;


////////////////////////////////////////////////////////////////////////////////
//
//	Spells: Steuerungs-Konstanten
//

const int SPL_DONTINVEST 		= 0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
const int SPL_RECEIVEINVEST		= 1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
const int SPL_SENDCAST			= 2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
const int SPL_SENDSTOP			= 3;		// Beende Zauber ohne Effekt
const int SPL_NEXTLEVEL			= 4;		// setze den Spruch auf den nächsten Level
const int SPL_STATUS_CANINVEST_NO_MANADEC=8;
const int SPL_FORCEINVEST		 = 1 << 16;	// zieht auf jeden Fall einen Manapunkt ab, egal ob timePerMana abgelaufen ist, oder nicht (sinnvoll für Investierzauber, die zumindest einen Manapunkt abziehen sollen, obwohl timePerMana noch nicht abgelaufen ist.


////////////////////////////////////////////////////////////////////////////////
//
//	Spells: Target-Konstanten
//

const int TARGET_COLLECT_NONE 					= 0;	// target will be set by effect (range, azi, elev)
const int TARGET_COLLECT_CASTER					= 1;	// target is the caster
const int TARGET_COLLECT_FOCUS 					= 2;	// target is the focus vob
const int TARGET_COLLECT_ALL 					= 3;	// all targets in range will be assembled
const int TARGET_COLLECT_FOCUS_FALLBACK_NONE	= 4;	// target is the focus vob, if the focus vob is not valid, the trajectory will be set by the effect
const int TARGET_COLLECT_FOCUS_FALLBACK_CASTER	= 5;	// target is the focus vob, if the focus vob is not valid, the target is the caster
const int TARGET_COLLECT_ALL_FALLBACK_NONE		= 6;	// all targets in range will be assembled, if there are no valid targets, the trajectory will be set by the effect
const int TARGET_COLLECT_ALL_FALLBACK_CASTER	= 7;	// all targets in range will be assembled, if there are no valid targets, the target is the caster

const int TARGET_TYPE_ALL		= 1;
const int TARGET_TYPE_ITEMS		= 2;
const int TARGET_TYPE_NPCS		= 4;
const int TARGET_TYPE_ORCS		= 8;
const int TARGET_TYPE_HUMANS	= 16;
const int TARGET_TYPE_UNDEAD	= 32;


////////////////////////////////////////////////////////////////////////////////
//
//	Spells: ID-Konstanten
//

// Paladin-Runen
const int SPL_PalLight				= 0;
const int SPL_PalLightHeal			= 1;
const int SPL_PalHolyBolt			= 2;
const int SPL_PalMediumHeal			= 3;
const int SPL_PalRepelEvil			= 4;
const int SPL_PalFullHeal			= 5;
const int SPL_PalDestroyEvil		= 6;

// Teleport-Runen
const int SPL_PalTeleportSecret		= 7;
const int SPL_TeleportSeaport		= 8;
const int SPL_TeleportMonastery		= 9;
const int SPL_TeleportFarm			= 10;
const int SPL_TeleportXardas		= 11;
const int SPL_TeleportPassNW		= 12;
const int SPL_TeleportPassOW		= 13;
const int SPL_TeleportOC			= 14;
const int SPL_TeleportOWDemonTower 	= 15;
const int SPL_TeleportTaverne		= 16;
const int SPL_Teleport_3			= 17;

// Kreis 1
const int SPL_Light 				= 18;
const int SPL_Firebolt				= 19;

// Kreis 2
const int SPL_Icebolt				= 20;

// Kreis 1
const int SPL_LightHeal				= 21;		// SPL_Heal Instant!
const int SPL_SummonGoblinSkeleton	= 22;

// Kreis 2
const int SPL_InstantFireball		= 23;

// Kreis 1
const int SPL_Zap					= 24; 		// ###UNCONSCIOUS###

// Kreis 2
const int SPL_SummonWolf			= 25;
const int SPL_WindFist				= 26;		// ###UNCONSCIOUS###
const int SPL_Sleep					= 27;

// Kreis 3
const int SPL_MediumHeal			= 28;
const int SPL_LightningFlash		= 29;
const int SPL_ChargeFireball		= 30;
const int SPL_SummonSkeleton		= 31;
const int SPL_Fear					= 32;
const int SPL_IceCube				= 33;

// Kreis 4
const int SPL_ChargeZap				= 34;
const int SPL_SummonGolem			= 35;
const int SPL_DestroyUndead			= 36;
const int SPL_Pyrokinesis			= 37;

// Kreis 5
const int SPL_Firestorm				= 38;
const int SPL_IceWave				= 39;
const int SPL_SummonDemon			= 40;
const int SPL_FullHeal				= 41;

// Kreis 6
const int SPL_Firerain				= 42;
const int SPL_BreathOfDeath			= 43;
const int SPL_MassDeath				= 44;
const int SPL_ArmyOfDarkness		= 45;
const int SPL_Shrink				= 46;

// Scrolls
const int SPL_TrfSheep				= 47;
const int SPL_TrfScavenger			= 48;
const int SPL_TrfGiantRat			= 49;
const int SPL_TrfGiantBug			= 50;
const int SPL_TrfWolf				= 51;
const int SPL_TrfWaran				= 52;
const int SPL_TrfSnapper			= 53;
const int SPL_TrfWarg				= 54;
const int SPL_TrfFireWaran			= 55;
const int SPL_TrfLurker				= 56;
const int SPL_TrfShadowbeast		= 57;
const int SPL_TrfDragonSnapper		= 58;
const int SPL_Charm					= 59;	// MAX_SPELL (Gothic)

// Kreis 5
const int SPL_MasterOfDisaster		= 60;

// ???
const int SPL_Deathbolt				= 61;
const int SPL_Deathball				= 62;
const int SPL_ConcussionBolt		= 63;
const int SPL_Reserved_64			= 64;	// SPL_E
const int SPL_Reserved_65		    = 65;	// SPL_F
const int SPL_Reserved_66	        = 66;	// SPL_G
const int SPL_Reserved_67	        = 67;	// SPL_H
const int SPL_Reserved_68			= 68;	// MAX_SPELL (Gothic2)
const int SPL_Reserved_69			= 69;

// Magick (Wasser)
const int SPL_Thunderstorm			= 70;
const int SPL_Whirlwind				= 71;
const int SPL_WaterFist				= 72;
const int SPL_IceLance				= 73;
const int SPL_Inflate				= 74;
const int SPL_Geyser				= 75;
const int SPL_Waterwall				= 76;
const int SPL_Reserved_77			= 77;
const int SPL_Reserved_78			= 78;
const int SPL_Reserved_79			= 79;

// Magick (Maya)
const int SPL_Plague				= 80;
const int SPL_Swarm					= 81;
const int SPL_GreenTentacle			= 82;
const int SPL_Earthquake			= 83;
const int SPL_SummonGuardian		= 84;
const int SPL_Energyball			= 85;
const int SPL_SuckEnergy			= 86;
const int SPL_Skull					= 87;
const int SPL_SummonZombie			= 88;
const int SPL_SummonMud				= 89;

// ...
const int SPL_Reserved_90			= 90;
const int SPL_Reserved_91			= 91;
const int SPL_Reserved_92			= 92;
const int SPL_Reserved_93			= 93;
const int SPL_Reserved_94			= 94;
const int SPL_Reserved_95			= 95;
const int SPL_Reserved_96			= 96;
const int SPL_Reserved_97			= 97;
const int SPL_Reserved_98			= 98;
const int SPL_Reserved_99			= 99;

const int MAX_SPELL					= 100;   // 59 (Gothic), 68 (Gothic2), 100 (G2Addon)


////////////////////////////////////////////////////////////////////////////////
//
//	Spells: Fx-/Spell-Klassennamen (Array)
//

const string spellFxInstanceNames[MAX_SPELL] =
{
	// Paladin-Runen
	"PalLight",				// 0	SPL_PalLight
	"PalHeal",  			// 1	SPL_PalLightHeal
	"PalHolyBolt",  		// 2	SPL_PalHolyBolt
	"PalHeal",  			// 3	SPL_PalMediumHeal
	"PalRepelEvil",			// 4	SPL_PalRepelEvil
	"PalHeal",  			// 5	SPL_PalFullHeal
	"PalDestroyEvil",  		// 6	SPL_PalDestroyEvil

	// Teleport-Runen
	"Teleport",  			// 7	SPL_PalTeleportSecret
	"Teleport",  			// 8	SPL_TeleportSeaport
	"Teleport",  			// 9	SPL_TeleportMonastery
	"Teleport",  			// 10	SPL_TeleportFarm
	"Teleport",  			// 11	SPL_TeleportXardas
	"Teleport",  			// 12	SPL_TeleportPassNW
	"Teleport",  			// 13	SPL_TeleportPassOW
	"Teleport",  			// 14	SPL_TeleportOC
	"Teleport",  			// 15	SPL_TeleportOWDemonTower
	"Teleport",  			// 16	SPL_TeleportTaverne
	"Teleport",  			// 17	SPL_Teleport_3

	// Kreis 1
	"Light",				// 18	SPL_Light
	"Firebolt",				// 19	SPL_Firebolt

	// Kreis 2
	"Icebolt",				// 20	SPL_Icebolt

	// Kreis 1
	"Heal",  				// 21	SPL_LightHeal
	"SummonGoblinSkeleton",	// 22	SPL_SummonGoblinSkeleton

	// Kreis 2
	"InstantFireball",  	// 23	SPL_InstantFireball

	// Kreis 1
	"Zap",					// 24	SPL_Zap

	// Kreis 2
	"SummonWolf",  			// 25	SPL_SummonWolf
	"WindFist",  			// 26	SPL_WindFist
	"Sleep",  				// 27	SPL_Sleep

	// Kreis 3
	"Heal",  				// 28	SPL_MediumHeal
	"LightningFlash",		// 29	SPL_LightningFlash
	"ChargeFireball",  		// 30	SPL_ChargeFireball
	"SummonSkeleton",  		// 31	SPL_SummonSkeleton
	"Fear",  				// 32	SPL_Fear
	"Icecube",  			// 33	SPL_IceCube

	// Kreis 4
	"ChargeZap",  			// 34	SPL_ChargeZap
	"SummonGolem",  		// 53	SPL_SummonGolem
	"DestroyUndead",  		// 36	SPL_DestroyUndead
	"Pyrokinesis",  		// 37	SPL_Pyrokinesis

	// Kreis 5
	"Firestorm", 			// 38	SPL_Firestorm
	"Icewave",  			// 39	SPL_IceWave
	"SummonDemon",  		// 40	SPL_SummonDemon
	"Heal",  				// 41	SPL_FullHeal

	// Kreis 6
	"Firerain",  			// 42	SPL_Firerain
	"BreathOfDeath",  		// 43	SPL_BreathOfDeath
	"MassDeath",  			// 44	SPL_MassDeath
	"ArmyOfDarkness", 		// 45	SPL_ArmyOfDarkness
	"Shrink",  				// 46	SPL_Shrink

	// Scrolls
	"Transform",  			// 47	SPL_TrfSheep
	"Transform",  			// 48	SPL_TrfScavenger
	"Transform",  			// 49	SPL_TrfGiantRat
	"Transform",  			// 50	SPL_TrfGiantBug
	"Transform",  			// 51	SPL_TrfWolf
	"Transform",  			// 52	SPL_TrfWaran
	"Transform",  			// 53	SPL_TrfSnapper
	"Transform",  			// 54	SPL_TrfWarg
	"Transform",  			// 55	SPL_TrfFireWaran
	"Transform",  			// 56	SPL_TrfLurker
	"Transform",  			// 57	SPL_TrfShadowbeast
	"Transform",  			// 58	SPL_TrfDragonSnapper
	"Charm",				// 59	SPL_Charm

	// Kreis 5
	"MasterOfDisaster", 	// 60	SPL_MasterOfDisaster

	// ???
	"Deathbolt",  			// 61	SPL_Deathbolt
	"Deathball", 			// 62	SPL_Deathball
	"Concussionbolt", 		// 63	SPL_Concussionbolt
	"Light",  				// 64	SPL_Reserved_64
	"Light",  				// 65	SPL_Reserved_65
	"Light",  				// 66	SPL_Reserved_66
	"Light",				// 67	SPL_Reserved_67
	"Light",				// 68	SPL_Reserved_68
	"Light",				// 69	SPL_Reserved_69

	// Magick (Wasser)
    "Thunderstorm",			// 70	SPL_Thunderstorm
	"Whirlwind",			// 71	SPL_Whirlwind
	"Waterfist",			// 72	SPL_WaterFist
	"IceLance",				// 73	SPL_IceLance
	"Sleep",				// 74	SPL_Inflate
	"Geyser",				// 75	SPL_Geyser
	"Firerain",				// 76	SPL_Waterwall
	"Light",				// 77	SPL_Reserved_77
	"Light",				// 78	SPL_Reserved_78
	"Light",				// 79	SPL_Reserved_79

	// Magick (Maya)
	"Fear",					// 80	SPL_Plague
	"Swarm",				// 81	SPL_Swarm
	"Greententacle",		// 82	SPL_GreenTentacle
	"Firerain",				// 83	SPL_Earthquake
	"SummonGuardian",		// 84	SPL_SummonGuardian
	"Energyball",			// 85	SPL_Energyball
	"SuckEnergy",			// 86	SPL_SuckEnergy
	"Skull",				// 87	SPL_Skull
	"SummonZombie",			// 88	SPL_SummonZombie
	"SummonMud",			// 89	SPL_SummonMud

	// ...
	"Light",				// 90	SPL_Reserved_90
	"Light",				// 91	SPL_Reserved_91
	"Light",				// 92	SPL_Reserved_92
	"Light",				// 93	SPL_Reserved_93
	"Light",				// 94	SPL_Reserved_94
	"Light",				// 95	SPL_Reserved_95
	"Light",				// 96	SPL_Reserved_96
	"Light",				// 97	SPL_Reserved_97
	"Light",				// 98	SPL_Reserved_98
	"Light"					// 99	SPL_Reserved_99
};


////////////////////////////////////////////////////////////////////////////////
//
//	Spells: Animationskürzel (Array)
//

const string spellFxAniLetters[MAX_SPELL] =
{
	// Paladin-Runen
	"SLE",					// 0	 SPL_PalLight
	"HEA",  				// 1	 SPL_PalLightHeal
	"FBT",  				// 2	 SPL_PalHolyBolt
	"HEA",  				// 3	 SPL_PalMediumHeal
	"FBT",					// 4	 SPL_PalRepelEvil
	"HEA",  				// 5	 SPL_PalFullHeal
	"FIB",  				// 6	 SPL_PalDestroyEvil

	// Teleport-Runen
	"HEA",  				// 7	SPL_PalTeleportSecret
	"HEA",  				// 8	SPL_TeleportSeaport
	"HEA",  				// 9	SPL_TeleportMonastery
	"HEA",  				// 10	SPL_TeleportFarm
	"HEA",  				// 11	SPL_TeleportXardas
	"HEA",  				// 12	SPL_TeleportPassNW
	"HEA",  				// 13	SPL_TeleportPassOW
	"HEA",  				// 14	SPL_TeleportOC
	"HEA",  				// 15	SPL_TeleportOWDemonTower
	"HEA",  				// 16	SPL_TeleportTaverne
	"HEA",  				// 17	SPL_Teleport_3

	// Kreis 1
	"SLE",					// 18	SPL_Light
	"FBT",					// 19	SPL_Firebolt

	// Kreis 2
	"FBT",					// 20	SPL_Icebolt

	// Kreis 1
	"HEA",  				// 21	SPL_LightHeal
	"SUM",  				// 22	SPL_SummonGoblinSkeleton

	// Kreis 2
	"FBT",  				// 23	SPL_InstantFireball

	// Kreis 1
	"FBT",					// 24	SPL_Zap

	// Kreis 2
	"SUM",  				// 25	SPL_SummonWolf
	"WND",  				// 26	SPL_WindFist
	"SLE",  				// 27	SPL_Sleep

	// Kreis 3
	"HEA",  				// 28	SPL_MediumHeal
	"WND",  				// 29	SPL_LightningFlash
	"FIB",  				// 30	SPL_ChargeFireball
	"SUM",  				// 31	SPL_SummonSkeleton
	"FEA",  				// 32	SPL_Fear
	"FRZ",  				// 33	SPL_IceCube
	"FIB",  				// 34	SPL_ChargeZap

	// Kreis 4
	"SUM",  				// 35	SPL_SummonGolem
	"FIB",  				// 36	SPL_DestroyUndead
	"FIB",  				// 37	SPL_Pyrokinesis

	// Kreis 5
	"FIB",  				// 38	SPL_Firestorm
	"FEA",  				// 39	SPL_IceWave
	"SUM",  				// 40	SPL_SummonDemon
	"HEA",  				// 41	SPL_FullHeal

	// Kreis 6
	"FEA",  				// 42	SPL_Firerain
	"FIB",  				// 43	SPL_BreathOfDeath
	"MSD",  				// 44	SPL_MassDeath
	"SUM",  				// 45	SPL_ArmyOfDarkness
	"SLE",  				// 46	SPL_Shrink

	// Scrolls
	"TRF",  				// 47	SPL_TrfSheep
	"TRF",  				// 48	SPL_TrfScavenger
	"TRF",  				// 49	SPL_TrfGiantRat
	"TRF",  				// 50	SPL_TrfGiantBug
	"TRF",  				// 51	SPL_TrfWolf
	"TRF",  				// 52	SPL_TrfWaran
	"TRF",  				// 53	SPL_TrfSnapper
	"TRF",  				// 54	SPL_TrfWarg
	"TRF",  				// 55	SPL_TrfFireWaran
	"TRF",  				// 56	SPL_TrfLurker
	"TRF",  				// 57	SPL_TrfShadowbeast
	"TRF",  				// 58	SPL_TrfDragonSnapper
	"FIB",					// 59	SPL_Charm

	// Kreis 5
	"FIB",  				// 60	SPL_MasterOfDisaster

	// ???
	"FBT",  				// 61	SPL_Deathbolt
	"FBT",  				// 62	SPL_Deathball
	"FBT",  				// 63	SPL_Concussionbolt
	"XXX",  				// 64	SPL_Reserved_64
	"XXX",  				// 65	SPL_Reserved_65
	"XXX",  				// 66	SPL_Reserved_66
	"XXX",					// 67	SPL_Reserved_67
 	"XXX",					// 68	SPL_Reserved_68
	"XXX",					// 69	SPL_Reserved_69

	// Magick (Wasser)
	"STM",  				// 70	SPL_Thunderstorm
	"WHI",  				// 71	SPL_Whirlwind		
	"WND",  				// 72	SPL_WaterFist
	"FBT",  				// 73	SPL_IceLance
	"SLE",  				// 74	SPL_Inflate			
	"WND",  				// 75	SPL_Geyser			
	"FEA",  				// 76	SPL_Waterwall
	"XXX",					// 77	SPL_Reserved_77
	"XXX",					// 78	SPL_Reserved_78
	"XXX",					// 79	SPL_Reserved_79

	// Magick (Maya)
	"FBT",  				// 80	SPL_Plague
	"FBT",  				// 81	SPL_Swarm			
	"FRZ",  				// 82	SPL_GreenTentacle
	"FEA",  				// 83	SPL_Earthquake
	"SUM",  				// 84	SPL_SummonGuardian
	"WND",  				// 85	SPL_Energyball
	"WND",  				// 86	SPL_SuckEnergy
	"WND",					// 87	SPL_Skull
	"SUM",					// 88	SPL_SummonZombie	
	"SUM",					// 89	SPL_SummonMud

	// ...
	"XXX",  				// 90	SPL_Reserved_90
	"XXX",  				// 91	SPL_Reserved_91
	"XXX",  				// 92	SPL_Reserved_92
	"XXX",  				// 93	SPL_Reserved_93
	"XXX",  				// 94	SPL_Reserved_94
	"XXX",  				// 95	SPL_Reserved_95
	"XXX",  				// 96	SPL_Reserved_96
	"XXX",					// 97	SPL_Reserved_97
	"XXX",					// 98	SPL_Reserved_98
	"XXX"					// 99	SPL_Reserved_99
};


// *******
// Talente
// *******

const int NPC_TALENT_UNKNOWN			= 0;

// Skilled Talents
const int NPC_TALENT_1H					= 1;
const int NPC_TALENT_2H					= 2;
const int NPC_TALENT_BOW				= 3;
const int NPC_TALENT_CROSSBOW			= 4;

const int NPC_TALENT_PICKLOCK			= 5;	//wird jetzt per DEX geregelt
//const int NPC_TALENT_PICKPOCKET		= 6;	//altes Pickpocket aus Gothic 1 - NICHT benutzen! Bleibt als Relikt im Code

// Magiekreis
const int NPC_TALENT_MAGE				= 7;

// Special-Talents
const int NPC_TALENT_SNEAK				= 8;
const int NPC_TALENT_REGENERATE			= 9;	//??? was ist davon drin?
const int NPC_TALENT_FIREMASTER			= 10;	//??? was ist davon drin?
const int NPC_TALENT_ACROBAT			= 11;	//--> Anis ändern!

// NEW Talents //werden komplett auf Scriptebene umgesetzt - Programm braucht sie nur für Ausgabe im Characterscreen
const int NPC_TALENT_PICKPOCKET			= 12;
const int NPC_TALENT_SMITH				= 13;
const int NPC_TALENT_RUNES				= 14;
const int NPC_TALENT_ALCHEMY			= 15;
const int NPC_TALENT_TAKEANIMALTROPHY	= 16;

const int NPC_TALENT_FOREIGNLANGUAGE	= 17;
const int NPC_TALENT_WISPDETECTOR		= 18;
const int NPC_TALENT_C					= 19;
const int NPC_TALENT_D					= 20;
const int NPC_TALENT_E					= 21;

const int NPC_TALENT_MAX				= 22;	//ehem. 12


// *************
// Runen-Talente
// *************

var int PLAYER_TALENT_RUNES[MAX_SPELL];				//Die SPL_ Konstanten werden hierfür als Kennung verwendet

// *************
// ForeignLanguage-TalentStufen
// *************

const int LANGUAGE_1 		= 0;
const int LANGUAGE_2 		= 1;
const int LANGUAGE_3 		= 2;

const int MAX_LANGUAGE 		= 3;

var int PLAYER_TALENT_FOREIGNLANGUAGE[MAX_LANGUAGE];

// *************
// WispDetector-Talente
// *************

const int WISPSKILL_NF	 			= 0;
const int WISPSKILL_FF	 			= 1;
const int WISPSKILL_NONE 			= 2;
const int WISPSKILL_RUNE 			= 3;
const int WISPSKILL_MAGIC    		= 4;
const int WISPSKILL_FOOD 			= 5;
const int WISPSKILL_POTIONS   		= 6;

const int MAX_WISPSKILL 			= 7;

var int PLAYER_TALENT_WISPDETECTOR [MAX_WISPSKILL];

VAR int WispSearching;
const int WispSearch_Follow 	= 1;
const int WispSearch_ALL		= 2;
const int WispSearch_POTIONS	= 3;
const int WispSearch_MAGIC		= 4;
const int WispSearch_FOOD		= 5;
const int WispSearch_NF			= 6;
const int WispSearch_FF			= 7;
const int WispSearch_NONE		= 8;
const int WispSearch_RUNE		= 9;

// ****************
// Alchemie-Talente
// ****************

const int POTION_Health_01	  			= 0;
const int POTION_Health_02  			= 1;
const int POTION_Health_03  			= 2;
const int POTION_Mana_01  				= 3;
const int POTION_Mana_02  				= 4;
const int POTION_Mana_03 	 			= 5;
const int POTION_Speed  				= 6;
const int POTION_Perm_STR  				= 7;
const int POTION_Perm_DEX  				= 8;
const int POTION_Perm_Mana  			= 9;
const int POTION_Perm_Health			= 10;
const int POTION_MegaDrink				= 11;
const int CHARGE_Innoseye				= 12;
const int POTION_Mana_04				= 13;
const int POTION_Health_04				= 14;

const int MAX_POTION					= 15;

var int PLAYER_TALENT_ALCHEMY[MAX_POTION];


// ***************
// Schmied-Talente
// ***************

const int WEAPON_Common					= 0;

const int WEAPON_1H_Special_01			= 1;
const int WEAPON_2H_Special_01			= 2;
const int WEAPON_1H_Special_02			= 3;
const int WEAPON_2H_Special_02			= 4;
const int WEAPON_1H_Special_03			= 5;
const int WEAPON_2H_Special_03			= 6;
const int WEAPON_1H_Special_04			= 7;
const int WEAPON_2H_Special_04			= 8;

const int WEAPON_1H_Harad_01			= 9;	
const int WEAPON_1H_Harad_02			= 10;
const int WEAPON_1H_Harad_03			= 11;
const int WEAPON_1H_Harad_04			= 12;

const int MAX_WEAPONS 					= 13;

var int PLAYER_TALENT_SMITH[MAX_WEAPONS];


// ********************
// AnimalTrophy-Talente
// ********************

const int TROPHY_Teeth					= 0;
const int TROPHY_Claws					= 1;
const int TROPHY_Fur					= 2;
const int TROPHY_Heart					= 3;
const int TROPHY_ShadowHorn 			= 4;
const int TROPHY_FireTongue				= 5;
const int TROPHY_BFWing					= 6;
const int TROPHY_BFSting				= 7;
const int TROPHY_Mandibles				= 8;
const int TROPHY_CrawlerPlate			= 9;
const int TROPHY_DrgSnapperHorn			= 10;
const int TROPHY_DragonScale			= 11;
const int TROPHY_DragonBlood			= 12;
const int TROPHY_ReptileSkin			= 13;

const int MAX_TROPHIES					= 14;

var int PLAYER_TALENT_TAKEANIMALTROPHY[MAX_TROPHIES];


// ****************************************
// Font-Konstanten der Engine (ausgelagert)
// ****************************************

const string TEXT_FONT_20 			= "Font_old_20_white.tga";
const string TEXT_FONT_10 			= "Font_old_10_white.tga";
const string TEXT_FONT_DEFAULT 		= "Font_old_10_white.tga";
const string TEXT_FONT_Inventory 	= "Font_old_10_white.tga";


// ****************************************
// wie lange bklleibt ein TExt (OU) stehen,
// wenn kein wav da ist (msec/character)
// ****************************************

const float VIEW_TIME_PER_CHAR		= 550;

// ****************************************
//	LevelZen-Abfrage im B_Kapitelwechsel
// ****************************************

const int NEWWORLD_ZEN 					= 1;
const int OLDWORLD_ZEN 					= 2;
const int DRAGONISLAND_ZEN				= 3;
const int ADDONWORLD_ZEN				= 4;


// ****************************************
//	Kamera für Inventory-Items
// ****************************************

const int INVCAM_ENTF_RING_STANDARD 	= 400;
const int INVCAM_ENTF_AMULETTE_STANDARD = 150;
const int INVCAM_ENTF_MISC_STANDARD 	= 200;
const int INVCAM_ENTF_MISC2_STANDARD 	= 250;
const int INVCAM_ENTF_MISC3_STANDARD 	= 500;
const int INVCAM_ENTF_MISC4_STANDARD 	= 650;
const int INVCAM_ENTF_MISC5_STANDARD 	= 850;
const int INVCAM_X_RING_STANDARD 		= 25;
const int INVCAM_Z_RING_STANDARD 		= 45;

/*
const int INVCAM_ENTF_MISC_STANDARD 	= 150;
const int INVCAM_X_MISC_STANDARD 		= 0;
const int INVCAM_Y_MISC_STANDARD 		= 0;
const int INVCAM_Z_MISC_STANDARD 		= 0;
*/



























