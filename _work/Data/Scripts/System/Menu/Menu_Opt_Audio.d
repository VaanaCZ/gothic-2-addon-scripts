// *********************************************************************
// audio options menu
// *********************************************************************

INSTANCE MENU_OPT_AUDIO(C_MENU_DEF)
{
	backpic			= MENU_BACK_PIC;

	items[0]		= "MENUITEM_AUDIO_HEADLINE";

	items[1]		= "MENUITEM_AUDIO_SFXVOL";
	items[2]		= "MENUITEM_AUDIO_SFXVOL_SLIDER";

	items[3]		= "MENUITEM_AUDIO_MUSICVOL";
	items[4]		= "MENUITEM_AUDIO_MUSICVOL_SLIDER";

	items[5]		= "MENUITEM_AUDIO_MUSIC";
	items[6]		= "MENUITEM_AUDIO_MUSIC_CHOICE";

	items[7]		= "MENUITEM_AUDIO_PROVIDER";
	items[8]		= "MENUITEM_AUDIO_PROVIDER_CHOICE";

	items[9]		= "MENUITEM_AUDIO_SPEEKER";
	items[10]		= "MENUITEM_AUDIO_SPEEKER_CHOICE";

	items[11]		= "MENUITEM_AUDIO_REVERB";
	items[12]		= "MENUITEM_AUDIO_REVERB_CHOICE";

	items[13]		= "MENUITEM_AUDIO_REVERB_SPEECH";
	items[14]		= "MENUITEM_AUDIO_REVERB_SPEECH_CHOICE";

	items[15]		= "MENUITEM_AUDIO_SAMPLERATE";
	items[16]		= "MENUITEM_AUDIO_SAMPLERATE_CHOICE";

	items[17]		= "MENUITEM_AUDIO_BACK";

	flags = flags | MENU_SHOW_INFO;
};

const int MENU_SOUND_DY = 550;


INSTANCE MENUITEM_AUDIO_HEADLINE(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Opciones de sonido";
	type		= MENU_ITEM_TEXT;
	// Position und Dimension
	posx		= 0;		posy		= MENU_TITLE_Y;
	dimx		= 8100;
	// Weitere Eigenschaften
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};


//
// Sound-Volume
//

INSTANCE MENUITEM_AUDIO_SFXVOL(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Vol. efectos ";
	text[1]		= "Volumen de los efectos de sonido y los diálogos"; // Kommentar

	// Position und Dimension
	posx		= 1000;		posy		= MENU_START_SOUND_Y + MENU_SOUND_DY*0;
	dimx		= 3400;		dimy		= 750;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		=	flags | IT_EFFECTS_NEXT;
};


INSTANCE MENUITEM_AUDIO_SFXVOL_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		= MENU_SLIDER_BACK_PIC;
	type		= MENU_ITEM_SLIDER;
	// Position und Dimension
	posx		= 4300;		posy		= MENU_START_SOUND_Y + MENU_SOUND_DY*0;
	dimx = MENU_SLIDER_DX; dimy	= MENU_SLIDER_DY;
	// Aktionen
	onChgSetOption													= "soundVolume";
	onChgSetOptionSection 											= "SOUND";
	// Weitere Eigenschaften
	userFloat[0]	= 20; // 20 Slider-Steps
	userString[0]	= MENU_SLIDER_POS_PIC;
	flags			= flags & ~IT_SELECTABLE;
};

//
// Musik-Volume
//

INSTANCE MENUITEM_AUDIO_MUSICVOL(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Vol. música";
	text[1]		= "Volumen de la música de fondo"; // Kommentar

	// Position und Dimension
	posx		= 1000;		posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*1;
	dimx		= 3400;		dimy		=	750;
	// Aktionen
	onSelAction[0]  =	SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		=	flags | IT_EFFECTS_NEXT;
};

INSTANCE MENUITEM_AUDIO_MUSICVOL_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		= MENU_SLIDER_BACK_PIC;
	type		= MENU_ITEM_SLIDER;
	// Position und Dimension
	posx		= 4300;		posy		= 	MENU_START_SOUND_Y + MENU_SOUND_DY*1;
	dimx = MENU_SLIDER_DX; dimy	= MENU_SLIDER_DY;
	// Aktionen
	onChgSetOption													= "musicVolume";
	onChgSetOptionSection											= "SOUND";
	// Weitere Eigenschaften
	userFloat[0]	= 15; // 20 Slider-Steps
	userString[0]	=	MENU_SLIDER_POS_PIC;
	flags			= flags & ~IT_SELECTABLE;
};


//
// Music on/off
//

instance MENUITEM_AUDIO_MUSIC(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Música ";
	text[1]		= "Activar/desactivar música de fondo"; // Kommentar

	// Position und Dimension
	posx		=	1000;	posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*2;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	// Weitere Einstellungen
	flags		= flags | IT_EFFECTS_NEXT;
};


INSTANCE MENUITEM_AUDIO_MUSIC_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;
	text[0]		=   "desact.|activ.";
	fontName	= 	MENU_FONT_SMALL;
	// Position und Dimension
	posx		= 4300;		posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*2 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;dimy = MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "musicEnabled";
	onChgSetOptionSection 											= "SOUND";
	// Weitere Eigenschaften
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};




//
// Provider
//




instance MENUITEM_AUDIO_PROVIDER(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Proveedor ";
	text[1]		= "Para que los cambios tengan efecto, hay que reiniciar"; // Kommentar

	// Position und Dimension
	posx		=	1000;	posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*3;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	// Weitere Einstellungen
	flags		= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_PROVIDER_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;
	text[0]		=   "1|2|3|4|5";
	fontName	= 	MENU_FONT_SMALL;
	// Position und Dimension
	posx		= 4300;		posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*3 + MENU_CHOICE_YPLUS;
	dimx 		= 3000;		dimy = MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "soundProviderIndex";
	onChgSetOptionSection 											= "INTERNAL";
	onEventAction[EVENT_INIT] 	= Update_AudioOptions;
	// Weitere Eigenschaften
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

instance MENUITEM_AUDIO_SPEEKER(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Altavoces";
	text[1]		= ""; // Kommentar

	// Position und Dimension
	posx		=	1000;	posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*4;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	// Weitere Einstellungen
	flags		= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_SPEEKER_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;
	// PATCH 1.30 - added 5.1 and 7.1 speaker system flags
	text[0]		=   "2 altavoces|auriculares|envolvente|4 altavoces|altavoces 5.1|altavoces 7.1";
	fontName	= 	MENU_FONT_SMALL;
	// Position und Dimension
	posx		= 4300;		posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*4 + MENU_CHOICE_YPLUS;
	dimx 		= 3000;		dimy = MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "soundSpeakerIndex";
	onChgSetOptionSection 											= "INTERNAL";
	// Weitere Eigenschaften
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER | IT_PERF_OPTION;
};

instance MENUITEM_AUDIO_REVERB(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Eco ambiental";
	text[1]		= "¿Quieres escuchar eco en las cuevas, etc?"; // Kommentar

	// Position und Dimension
	posx		=	1000;	posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*5;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	// Weitere Einstellungen
	flags		= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_REVERB_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;
	text[0]		=   "desact.|activ.";
	fontName	= 	MENU_FONT_SMALL;
	// Position und Dimension
	posx		= 4300;		posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*5 + MENU_CHOICE_YPLUS;
	dimx = MENU_CHOICE_DX;dimy = MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption												= "soundUseReverb";
	onChgSetOptionSection 											= "SOUND";
	// Weitere Eigenschaften
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};


instance MENUITEM_AUDIO_REVERB_SPEECH(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Eco diálogos";
	text[1]		= "¿Quieres que el eco afecte a los diálogos?";

	// Position und Dimension
	posx		=	1000;	posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*6;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	// Weitere Einstellungen
	flags		= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_REVERB_SPEECH_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;
	text[0]		=   "nada|normal|completo";
	fontName	= 	MENU_FONT_SMALL;
	// Position und Dimension
	posx		= 4300;		posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*6 + MENU_CHOICE_YPLUS;
	dimx 		= MENU_SLIDER_DX;		dimy = MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "useSpeechReverbLevel";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER | IT_PERF_OPTION;

};


instance MENUITEM_AUDIO_SAMPLERATE(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Frecuencia ";
	text[1]		= "Para que los cambios tengan efecto, hay que reiniciar"; // Kommentar

	// Position und Dimension
	posx		=	1000;	posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*7;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]  = SEL_ACTION_UNDEF;
	// Weitere Einstellungen
	flags		= flags | IT_EFFECTS_NEXT;

};

instance MENUITEM_AUDIO_SAMPLERATE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;
	text[0]		=   "22 khz|44 khz";
	fontName	= 	MENU_FONT_SMALL;
	// Position und Dimension
	posx		= 4300;		posy		=	MENU_START_SOUND_Y + MENU_SOUND_DY*7 + MENU_CHOICE_YPLUS;
	dimx = MENU_CHOICE_DX;dimy = MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "soundSampleRateIndex";
	onChgSetOptionSection 											= "INTERNAL";
	// Weitere Eigenschaften
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

INSTANCE MENUITEM_AUDIO_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Atrás";
	// Position und Dimension
	posx		=	1000;		posy		=	MENU_BACK_Y;
	dimx		=	6192;		dimy		=	MENU_SOUND_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;

	flags = flags | IT_TXT_CENTER;
};


// -------------------------------------------------------------------
// Functions
// -------------------------------------------------------------------

func int Update_AudioOptions()
{
	Update_ChoiceBox("MENUITEM_AUDIO_PROVIDER_CHOICE");
	return 1;
};


func int Apply_AudioResolution()
{
	Apply_Options_Audio();
	return 0;
};

