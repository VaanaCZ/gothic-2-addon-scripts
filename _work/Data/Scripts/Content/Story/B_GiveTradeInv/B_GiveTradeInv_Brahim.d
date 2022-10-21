var int Brahim_ItemsGiven_Chapter_1;
var int Brahim_ItemsGiven_Chapter_2;
var int Brahim_ItemsGiven_Chapter_3;
var int Brahim_ItemsGiven_Chapter_4;
var int Brahim_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Brahim (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Brahim_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf, ItWr_Map_Newworld, 1); 
		CreateInvItems (slf, ItWr_Map_NewWorld_City, 2); 
		
		Brahim_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)
	&& (Brahim_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf, ItWr_Map_Shrine_MIS, 1); 
		CreateInvItems (slf, ItWr_Map_Newworld, 1); 
		
		Brahim_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Brahim_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItWr_ShatteredGolem_MIS, 1); //Hoshi: Karte über einen Schatz bei den MayaRuinen 
		CreateInvItems (slf, ItWr_Map_Newworld, 1); 
		CreateInvItems (slf, ItWr_Map_Oldworld, 1); 
		CreateInvItems (slf, ItMi_Gold, 50); 
	
		Brahim_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Brahim_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItWr_Map_Caves_MIS, 1); 
			
		Brahim_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Brahim_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
	
		Brahim_ItemsGiven_Chapter_5 = TRUE;
	};
};
