// *****************************************************************
// B_GiveInvItems
// --------------
// wenn das Geben geklappt hat --> TRUE
// wenn nicht (Spieler hat nicht genug oder gar kein Item) --> FALSE
// *****************************************************************

func int B_GiveInvItems (var C_NPC giver, var C_NPC taker, var int itemInstance, var int amount)
{
	// EXIT IF...

	if (Npc_IsPlayer(giver))
	{
		if (amount > Npc_HasItems(giver,itemInstance))
		{
			return FALSE;
		};
	};
	
	if (amount == 0)
	{
		return TRUE;
	};
	
	
	//FUNC
	
	// ------ Itmes transferieren ------
	Npc_RemoveInvItems	(giver,	itemInstance,	amount);
	CreateInvItems		(taker,	itemInstance,	amount);
	
	// ------ PrintScreen ------
	var string concatText;
	var string itemname;
	
	itemname = item.name; //wird von CreateInvItems gesetzt --> Nico
	
	if	Npc_IsPlayer(giver)
	{
		if (itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount), PRINT_GoldGegeben);				// "x Gold gegeben"
			AI_PrintScreen	(concatText, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
		}
		else
		{
		    if amount == 1
		    {
			    concatText	= ConcatStrings (itemname,PRINT_Addon_gegeben);
			    AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			}   
			else
		    {
				concatText = ConcatStrings(IntToString(amount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
				concatText = ConcatStrings(concatText," (");
			    concatText = ConcatStrings(concatText,itemname); 
			    concatText = ConcatStrings(concatText,")");
				AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
			};   
		};
	}
	else if Npc_IsPlayer(taker)
	{
		if (itemInstance == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount), PRINT_GoldErhalten);			// "x Gold erhalten"
			AI_PrintScreen	(concatText, -1, YPOS_GoldTaken, FONT_ScreenSmall, 2);
		}
		else
		{
		    if amount == 1
		    {
				
				 concatText	= ConcatStrings (itemname,PRINT_Addon_erhalten);
				 
				AI_PrintScreen	(concatText, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"
			}   
			else
		    {
			    concatText = ConcatStrings(IntToString(amount), PRINT_ItemsErhalten);		// "x Gegenstände erhalten"
			    concatText = ConcatStrings(concatText," (");
			    concatText = ConcatStrings(concatText,itemname); 
			    concatText = ConcatStrings(concatText,")");
			    
			    AI_PrintScreen	(concatText, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);
			}; 
		};
	};	
	
	return TRUE;
};
