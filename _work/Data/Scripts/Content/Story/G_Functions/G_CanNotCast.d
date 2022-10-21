// ********************************************
// G_CanNotCast
// ------------
// self = Npc, der die Rune nicht equippen kann
// item = das Item
// ********************************************

func void G_CanNotCast (var int bIsPlayer, var int nCircleNeeded, var int nCirclePossessed )
{
	// ------ Ausgabe-String ------
	var string	strMessage	 ;
	
	// ------ ermitteln, wieviele Punkte fehlen ------
	var int		nDifference	 ;	nDifference 	= nCircleNeeded - nCirclePossessed;
	var string  strDifference;  strDifference 	= IntToString( nDifference );

	// ------ String zusammenbauen ------
	//strMessage = ConcatStrings( strMessage, strDifference 			); //FIX M.F. Ohne diese Zeile klappt's damit der String nciht mehr als einmal angezeigt wird. 
	strMessage = ConcatStrings( strDifference, " " 					);
	strMessage = ConcatStrings( strMessage, PRINT_MAGCIRCLES_MISSING);

	// ------ PRINT MESSAGE ------
	if (bIsPlayer)
	{
		Print (strMessage);
	};
};
