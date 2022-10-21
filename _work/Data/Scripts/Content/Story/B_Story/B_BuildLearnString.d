// *********************************************************
// B_BuildLearnString
// ------------------
// macht einen String aus übergebener Stringkonstante (Text) 
// und übergebenen Kosten
// *********************************************************

func string B_BuildLearnString (var string text, var int kosten)
{
	var string concatText;
	
	// ------ Beispiel: "Taschendiebstahl lernen. Kosten: 10 LP"
	concatText = ConcatStrings (text, 		PRINT_Kosten);				// ". Kosten: "
	concatText = ConcatStrings (concatText, IntToString(kosten));
	concatText = ConcatStrings (concatText, PRINT_LP);						// " LP"
	
	return concatText;
};




