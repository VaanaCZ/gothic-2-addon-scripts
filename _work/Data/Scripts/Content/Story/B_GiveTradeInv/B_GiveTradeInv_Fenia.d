
var int Fenia_ItemsGiven_Chapter_1;
var int Fenia_ItemsGiven_Chapter_2;
var int Fenia_ItemsGiven_Chapter_3;
var int Fenia_ItemsGiven_Chapter_4;
var int Fenia_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Fenia (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Fenia_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf,ItFo_Water , 5);
		CreateInvItems (slf,ItFo_Bread , 3);
		CreateInvItems (slf, ItFo_Fish, 5);
		
		Fenia_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Fenia_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf,ItFo_Cheese, 5); 
		CreateInvItems (slf,ItFo_Fishsoup, 5); 
		CreateInvItems (slf, ItFo_Fish, 3);
	
		Fenia_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Fenia_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItFoMutton, 2); 
		CreateInvItems (slf,ItFo_Stew , 5); 
		CreateInvItems (slf, ItFo_Fish, 2);
		CreateInvItems (slf,ItFo_Sausage, 5); 
		CreateInvItems (slf,ItFo_Booze, 5); 

		Fenia_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Fenia_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf,ItFo_Wine, 5); 
		CreateInvItems (slf,ItFoMutton, 5); 
		CreateInvItems (slf,ItFo_Stew , 5); 
		CreateInvItems (slf,ItFo_Bacon, 5); 
		CreateInvItems (slf, ItFo_Fish, 5);
	
		Fenia_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Fenia_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf,ItFo_Wine, 2); 
		CreateInvItems (slf,ItFoMutton, 2); 
		CreateInvItems (slf,ItFo_Stew , 2); 
		CreateInvItems (slf, ItFo_Fish, 5);

		Fenia_ItemsGiven_Chapter_5 = TRUE;
	};
};
