func void PrintPlus (var string txt)
{
	// ------ Ausgabe-String ------
	var string ausgabe;
	
	// ------ Zufallszahl als Text ------
	var int zufall; zufall = Hlp_Random(100);
	var string zufallTxt; zufallTxt = IntToString (zufall);
	
	// ------ übergebenen txt mit zufallTxt zusammenbasteln ------
	ausgabe = ConcatStrings(txt, " ");
	ausgabe = ConcatStrings(ausgabe, zufallTxt);
		
	Print (ausgabe);
};
