var int Juan_ItemsGiven_Chapter_1;

FUNC VOID B_GiveTradeInv_Addon_Juan (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Juan_ItemsGiven_Chapter_1 == FALSE))
	{
		//Special
		CreateInvItems (slf,ItMi_GoldNugget_Addon,2);
		//STAHLPAKET IM INVENTORY  
		CreateInvItems (slf,ItFo_Addon_Pfeffer_01,1);//FÜR Mission fortuno
		//Lennars Paket
		
		//Food
		CreateInvItems (slf,ItFo_Booze , 5);
		CreateInvItems (slf,ItFo_Apple , 5);
		CreateInvItems (slf,ItFo_Bread , 5);
		
		//Pflanzen
		CreateInvItems (slf,ItPl_Mana_Herb_02 , 10);
		CreateInvItems (slf,ItPl_Mana_Herb_03 ,  5);
		
		CreateInvItems (slf,ItPl_Health_Herb_02, 10); 
		CreateInvItems (slf,ItPl_Health_Herb_03, 5);
		
		CreateInvItems (slf,ItPl_Temp_Herb, 3); 
		
		//Tränke
		CreateInvItems (slf,ItPo_Mana_01 	, 5); 
		CreateInvItems (slf,ItPo_Health_01	, 5);
		
		CreateInvItems (slf,ItPo_Mana_02 	, 4); 
		CreateInvItems (slf,ItPo_Health_02	, 4);
		
		CreateInvItems (slf,ItPo_Mana_03 	, 3); 
		CreateInvItems (slf,ItPo_Health_03	, 3);
		
		CreateInvItems (slf,ItPo_Mana_Addon_04 		, 1); 
		CreateInvItems (slf,ItPo_Health_Addon_04	, 1);
		
		//Muni
		CreateInvItems (slf, ItRw_Arrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 100); 
				
		Juan_ItemsGiven_Chapter_1 = TRUE;
	};
};




