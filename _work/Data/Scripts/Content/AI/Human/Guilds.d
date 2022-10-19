// ******************************
// Gildenattitüden zum Spielstart
// ******************************

CONST INT TAB_ANZAHL = 16 * 16;


CONST INT GIL_ATTITUDES [TAB_ANZAHL] =	
{
//	-->		None			Pal				Mil				Vlk							KdF				Nov 						Djg 			Sld				Bau 						Bdt		 		Strf 			Dmt 						Out 			PIR				KDW 				D		
/* NONE*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* NONE*/	ATT_NEUTRAL,	ATT_NEUTRAL,	/* NONE*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* NONE*/	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* NONE*/	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/**********************************************************************************************************************************************************************************************************************************************************************************************************************/
/* Pal */	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Pal */	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Pal */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Pal */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Pal */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/* Mil */	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Mil */	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Mil */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Mil */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Mil */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/* Vlk */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Vlk */	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Vlk */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Vlk */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Vlk */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/*********************************************************************************************************************************************************************************************************************************************************************************************************************/
/* KdF */	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* KdF */	ATT_FRIENDLY,	ATT_FRIENDLY,	/* KdF */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* KdF */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* KdF */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/* Nov */	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Nov */	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Nov */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Nov */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Nov */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/*********************************************************************************************************************************************************************************************************************************************************************************************************************/
/* Djg */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Djg */	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Djg */	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Djg */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Djg */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/* Sld */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Sld */	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Sld */	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Sld */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Sld */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/* Bau */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Bau */	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Bau */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	/* Bau */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Bau */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/*********************************************************************************************************************************************************************************************************************************************************************************************************************/
/* Bdt */	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/* Bdt */	ATT_HOSTILE,	ATT_HOSTILE,	/* Bdt */	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/* Bdt */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Bdt */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/* Strf*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Strf*/	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Strf*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Strf*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Strf*/	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/* Dmt */	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/* Dmt */	ATT_HOSTILE,	ATT_HOSTILE,	/* Dmt */	ATT_HOSTILE,	ATT_HOSTILE,	ATT_HOSTILE,	/* Dmt */	ATT_NEUTRAL,	ATT_HOSTILE,	ATT_FRIENDLY,	/* Dmt */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/**********************************************************************************************************************************************************************************************************************************************************************************************************************/
/* Out */	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Out */	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Out */	ATT_FRIENDLY,	ATT_FRIENDLY,	ATT_FRIENDLY,	/* Out */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* Out */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	
/* PIR   */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* PIR   */	ATT_NEUTRAL,	ATT_NEUTRAL,	/* PIR   */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* PIR   */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* PIR   */	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_NEUTRAL,	
/* KDW  */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	/* KDW   */	ATT_NEUTRAL,	ATT_NEUTRAL,	/* KDW   */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_FRIENDLY,	/* KDW   */	ATT_HOSTILE,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* KDW   */	ATT_FRIENDLY,	ATT_NEUTRAL,	ATT_FRIENDLY,	ATT_NEUTRAL,	
/* D   */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* D   */	ATT_NEUTRAL,	ATT_NEUTRAL,	/* D   */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* D   */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	/* D   */	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL,	ATT_NEUTRAL	
};



















