/*
	Items in Items finden
*/
FUNC VOID B_PlayerFindItem (var int itm, var int amount)
{
	if Npc_IsPlayer (self)
	{
		CreateInvItems (self, itm, amount);
		
		var string ConcatText;
		var string itemname;
	
		itemname = item.name;//kommt von createinvitems
		
		if (itm == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount), PRINT_GoldErhalten);			
			Print (concatText);
			
			Snd_Play ("Geldbeutel");
		}
		else
		{
			 if (amount == 1)
		   	 {
				concatText	= ConcatStrings (itemname,PRINT_Addon_erhalten);
				Print(concatText);
				
			}   
			else
		    {
			    concatText = ConcatStrings(IntToString(amount), PRINT_ItemsErhalten);		
			    concatText = ConcatStrings(concatText," (");
			    concatText = ConcatStrings(concatText,itemname); 
			    concatText = ConcatStrings(concatText,")");
			    
			    Print (concatText);
			}; 
		};
	};
}; 




