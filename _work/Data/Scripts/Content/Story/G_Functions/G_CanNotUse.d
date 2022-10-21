// ************************************************
// G_CanNotUse
// -----------
// Funktion wir vom Programm aufgerufen, 
// wenn SC oder NSC etwas equippt, für das ihm 
// die Attributs-Voraussetzung fehlt
// ------------------------------------------------
// self = der NSC, der das Item nicht equippen kann
// item = das Item
// ************************************************

func void G_CanNotUse (var int bIsPlayer, var int nAttribute, var int nValue)
{
	// ------ Ausgabe-String ------
	var string strMessage;
	
	// ------ Attribut ermitteln ------
	var string  strAttributeMissing;
	var int		nAttributeValue;	
	
	//ADDON>
	if (nAttribute == ATR_MANA_MAX)	
	&& (nValue == 666666)//Joly: ATR_MANA_MAX von Raven
	{
		strMessage = PRINT_ADDON_BELIARSCOURSE_MISSING;
		B_BlitzInArsch ();
		SC_FailedToEquipBeliarsWeapon = TRUE;
	}
	//ADDON<
	else
	{
		if 		(nAttribute == ATR_HITPOINTS)		{	strAttributeMissing = PRINT_HITPOINTS_MISSING		; nAttributeValue = self.attribute[ATR_HITPOINTS]; 		}
		else if (nAttribute == ATR_HITPOINTS_MAX)	{	strAttributeMissing = PRINT_HITPOINTS_MAX_MISSING	; nAttributeValue = self.attribute[ATR_HITPOINTS_MAX]; 	}
		else if (nAttribute == ATR_MANA)			{	strAttributeMissing = PRINT_MANA_MISSING			; nAttributeValue = self.attribute[ATR_MANA]; 			}
		else if (nAttribute == ATR_MANA_MAX)		{	strAttributeMissing = PRINT_MANA_MAX_MISSING		; nAttributeValue = self.attribute[ATR_MANA_MAX]; 		}
		else if (nAttribute == ATR_STRENGTH)		{	strAttributeMissing = PRINT_STRENGTH_MISSING		; nAttributeValue = self.attribute[ATR_STRENGTH]; 		}
		else if (nAttribute == ATR_DEXTERITY)		{	strAttributeMissing = PRINT_DEXTERITY_MISSING		; nAttributeValue = self.attribute[ATR_DEXTERITY]; 		}
		else										{	strAttributeMissing = ""							; nAttributeValue = 0; 									};
		
		// ------ Ermittlen, wieviele Punkte fehlen ------
		var int		nDifference	 ;	nDifference 	= nValue - nAttributeValue;
		var string  strDifference;  strDifference 	= IntToString(nDifference);
			
		// ------- String zusammenbauen -------
		strMessage = strDifference;
		strMessage = ConcatStrings( strMessage, " " 				);
		strMessage = ConcatStrings( strMessage, strAttributeMissing	);
	};
	
	// ------- String ausgeben ------
	if (bIsPlayer)
	{
		Print (strMessage);	
	};
};
