// ******************
// B_CreateAmbientInv
// ******************

//Hier stehen die Hilfsfunktionen zum befüllen der NPCs

func void B_CreateAmbientInv_VLK (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItPl_Blueplant, 1);
	CreateInvItems (self, ItMi_SilverRing, 1);
	CreateInvItems (self, ItFo_Water, 1);
	CreateInvItems (self, ItMi_gold, 5);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItPl_Planeberry, 1);
	CreateInvItems (self, ItFo_Apple, 1);
	CreateInvItems (self, ItFo_Fish, 1);
	CreateInvItems (self, ItFo_Beer, 1);
	CreateInvItems (self, ItMi_gold, 1);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_Fish, 1);
	CreateInvItems (self, ItFo_Bread, 1);
	CreateInvItems (self, ItMi_Flask, 1);
	CreateInvItems (self, ItMi_gold, 17);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFo_Bread, 1);
	CreateInvItems (self, ItFo_Water, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItMi_gold, 17);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Apple, 1);
	CreateInvItems (self, ItFo_Cheese, 1);
	CreateInvItems (self, ItFo_Bread, 1);
	CreateInvItems (self, ItMi_gold, 13);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFo_Apple, 1);
	CreateInvItems (self, ItFo_Cheese, 1);
	CreateInvItems (self, ItPo_Health_01, 1);
	CreateInvItems (self, ItMi_gold, 11);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItPl_Planeberry, 1);
	CreateInvItems (self, ItFo_Apple, 1);
	CreateInvItems (self, ItFo_Beer, 1);
	CreateInvItems (self, ItMi_gold, 12);
	};
};
func void B_CreateAmbientInv_BAU (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItPl_Forestberry, 1);
	CreateInvItems (self, ItFo_Water, 1);
	CreateInvItems (self, ItFo_Milk, 1);
	CreateInvItems (self, ItMi_gold, 12);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItPl_Forestberry, 1);
	CreateInvItems (self, ItPl_Planeberry, 1);
	CreateInvItems (self, ItFo_Apple, 1);
	CreateInvItems (self, ItFo_Cheese, 1);
	CreateInvItems (self, ItMi_gold, 10);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_Apple, 1);
	CreateInvItems (self, ItFo_Cheese, 1);
	CreateInvItems (self, ItPo_Health_01, 1);
	CreateInvItems (self, ItMi_gold, 17);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItPl_Blueplant, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItFo_Bread, 1);
	CreateInvItems (self, ItMi_gold, 14);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItPl_Forestberry, 1);
	CreateInvItems (self, ItFo_Bread, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItMi_gold, 13);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItPl_Forestberry, 1);
	CreateInvItems (self, ItMi_Joint, 1);
	CreateInvItems (self, ItFo_Cheese, 1);
	CreateInvItems (self, ItPl_Planeberry, 1);
	CreateInvItems (self, ItMi_gold, 11);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItPl_Planeberry, 1);
	CreateInvItems (self, ItFo_Apple, 1);
	CreateInvItems (self, ItFo_Cheese, 4);
	CreateInvItems (self, ItFo_Beer, 1);
	};
};
func void B_CreateAmbientInv_NOV (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItPl_Forestberry, 1);
	CreateInvItems (self, ItFo_Water, 3);
	CreateInvItems (self, ItPl_Blueplant, 1);
	CreateInvItems (self, ItFo_Fish, 1);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItFo_Cheese, 1);
	CreateInvItems (self, ItMi_Flask, 1);
	CreateInvItems (self, ItMi_gold, 15);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_Apple, 3);
	CreateInvItems (self, ItFo_Cheese, 2);
	CreateInvItems (self, ItFo_Beer, 2);
	CreateInvItems (self, ItMi_Sulfur, 1);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItPl_Blueplant, 1);
	CreateInvItems (self, ItFo_Bread, 1);
	CreateInvItems (self, ItFo_Water, 1);
	CreateInvItems (self, ItMi_Coal, 1);
	CreateInvItems (self, ItMi_gold, 13);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Bread, 2);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItFo_Fish, 1);
	CreateInvItems (self, ItMi_gold, 14);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItPl_Forestberry, 1);
	CreateInvItems (self, ItFo_Fish, 1);
	CreateInvItems (self, ItFo_Bread, 1);
	CreateInvItems (self, ItPo_Mana_01, 1);
	CreateInvItems (self, ItMi_gold, 12);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItPl_Planeberry, 3);
	CreateInvItems (self, ItFo_Apple, 1);
	CreateInvItems (self, ItFo_Cheese, 1);
	CreateInvItems (self, ItFo_Beer, 1);
	};
};
func void B_CreateAmbientInv_SLD (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFoMutton, 1);
	CreateInvItems (self, ItPl_Mushroom_01, 1);
	CreateInvItems (self, ItMi_gold, 17);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItPl_Health_Herb_01, 1);
	CreateInvItems (self, ItFo_Booze, 2);
	CreateInvItems (self, ItFo_Sausage, 1);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_Stew, 1);
	CreateInvItems (self, ItMi_Joint, 2);
	CreateInvItems (self, ItMi_gold, 16);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFo_Stew, 1);
	CreateInvItems (self, ItFo_Booze, 1);
	CreateInvItems (self, ItMi_gold, 15);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItMi_gold, 11);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFo_Booze, 1);
	CreateInvItems (self, ItPl_Planeberry, 1);
	CreateInvItems (self, ItFo_FishSoup, 1);
	CreateInvItems (self, ItMi_gold, 19);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItPl_Mushroom_02, 3);
	CreateInvItems (self, ItFo_Booze, 1);
	CreateInvItems (self, ItMi_gold, 10);
	CreateInvItems (self, ItFoMutton, 2);
	};
};
func void B_CreateAmbientInv_KDF (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFoMutton, 1);
	CreateInvItems (self, ItMi_Quartz, 1);
	CreateInvItems (self, ItMi_Coal, 1);
	CreateInvItems (self, ItMi_gold, 33);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItPo_Mana_02, 1);
	CreateInvItems (self, ItMi_Sulfur, 1);
	CreateInvItems (self, ItMi_Flask, 1);
	CreateInvItems (self, ItMi_gold, 36);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItMi_SilverRing, 1);
	CreateInvItems (self, ItPl_Mushroom_01, 1);
	CreateInvItems (self, ItPl_Planeberry, 1);
	CreateInvItems (self, ItMi_Rockcrystal, 1);
	CreateInvItems (self, ItMi_gold, 30);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, ItPo_Health_03, 1);
	CreateInvItems (self, ItFo_Booze, 1);
	CreateInvItems (self, ItMi_gold, 36);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItPl_Health_Herb_01, 1);
	CreateInvItems (self, ItPl_Mushroom_01, 1);
	CreateInvItems (self, ItPl_Mana_Herb_01, 1);
	CreateInvItems (self, ItMi_gold, 39);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItFo_Booze, 1);
	CreateInvItems (self, ItMi_Sulfur, 1);
	CreateInvItems (self, ItPl_Blueplant, 1);
	CreateInvItems (self, ItMi_gold, 34);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItPl_Mushroom_02, 1);
	CreateInvItems (self, ItMi_Quartz, 1);
	CreateInvItems (self, ItMi_Pitch, 1);
	CreateInvItems (self, ItMi_gold, 35);
	};
};
func void B_CreateAmbientInv_MIL (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFoMutton, 3);
	CreateInvItems (self, ItPl_Mushroom_01, 1);
	CreateInvItems (self, ItFo_Stew, 1);
	CreateInvItems (self, ItMi_gold, 15);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItPo_Health_01, 1);
	CreateInvItems (self, ItPl_Health_Herb_01, 3);
	CreateInvItems (self, ItFoMutton, 1);
	CreateInvItems (self, ItMi_gold, 17);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItPl_Mushroom_01, 1);
	CreateInvItems (self, ItPl_Health_Herb_01, 1);
	CreateInvItems (self, ItMi_gold, 25);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItPl_Mushroom_01, 1);
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, ItMi_gold, 30);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Booze, 3);
	CreateInvItems (self, ItFo_FishSoup, 1);
	CreateInvItems (self, ItMi_gold, 14);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItPl_Health_Herb_01, 1);
	CreateInvItems (self, ItFo_FishSoup, 1);
	CreateInvItems (self, ItPl_Mushroom_02, 1);
	CreateInvItems (self, ItMi_gold, 26);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItPl_Mushroom_02, 1);
	CreateInvItems (self, ItFo_Booze, 1);
	CreateInvItems (self, ItFo_Sausage, 3);
	CreateInvItems (self, ItMi_gold, 25);
	};
};
func void B_CreateAmbientInv_DJG (var int InventorySet)
{
	if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFo_Wine, 1);
	CreateInvItems (self, ItPl_Mana_Herb_01, 1);
	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItAt_WolfFur, 1);
	CreateInvItems (self, ItMi_gold, 39);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFo_Milk, 1);
	CreateInvItems (self, ItMi_Joint, 1);
	CreateInvItems (self, ItPl_Health_Herb_02, 1);
	CreateInvItems (self, ItMi_gold, 46);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_Bacon, 1);
	CreateInvItems (self, ItPl_Speed_Herb_01, 1);
	CreateInvItems (self, ItAt_BugMandibles, 1);
	CreateInvItems (self, ItMi_gold, 45);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItFoMutton, 1);
	CreateInvItems (self, ItPl_SwampHerb, 1);
	CreateInvItems (self, ItFo_Bacon, 1);
	CreateInvItems (self, ItMi_gold, 44);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Stew, 1);
	CreateInvItems (self, ItPl_Health_Herb_02, 1);
	CreateInvItems (self, ItMi_Joint, 1);
	CreateInvItems (self, ItMi_gold, 43);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItPo_Health_02, 1);
	CreateInvItems (self, ItFo_Booze, 2);
	CreateInvItems (self, ItFo_Wine, 1);
	CreateInvItems (self, ItMi_gold, 46);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, ItFoMuttonRaw, 2);
	CreateInvItems (self, ItAt_SheepFur, 1);
	CreateInvItems (self, ItMi_gold, 41);
	};
};
func void B_CreateAmbientInv_PAL (var int InventorySet)
{
if 		InventorySet ==1 
	{
	CreateInvItems (self, ItFo_Wine, 1);
	CreateInvItems (self, ItFo_Bacon, 1);
	CreateInvItems (self, ItPl_Speed_Herb_01, 1);
	CreateInvItems (self, ItMi_Pitch, 1);
	CreateInvItems (self, ItMi_gold, 44);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFo_Booze, 1);
	CreateInvItems (self, ItFo_Milk, 1);
	CreateInvItems (self, ItMi_Rockcrystal, 1);
	CreateInvItems (self, ItPl_Mana_Herb_02, 1);
	CreateInvItems (self, ItMi_gold, 42);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_Bacon, 1);
	CreateInvItems (self, ItPl_Mana_Herb_01, 2);
	CreateInvItems (self, ItMi_Sulfur, 1);
	CreateInvItems (self, ItPl_Dex_Herb_01, 1);
	CreateInvItems (self, ItMi_gold, 23);
	}
	else if InventorySet ==4
	{
	CreateInvItems (self, ItMi_Rockcrystal, 1);
	CreateInvItems (self, ItMi_SilverRing, 1);
	CreateInvItems (self, ItMi_Pitch, 1);
	CreateInvItems (self, ItPl_Health_Herb_03, 1);
	CreateInvItems (self, ItMi_gold, 46);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Stew, 1);
	CreateInvItems (self, ItPl_Health_Herb_02, 1);
	CreateInvItems (self, ItMi_Rockcrystal, 1);
	CreateInvItems (self, ItMi_gold, 43);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItPo_Health_02, 1);
	CreateInvItems (self, ItPl_Speed_Herb_01, 2);
	CreateInvItems (self, ItMi_Coal, 1);
	CreateInvItems (self, ItMi_gold, 37);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_Sausage, 1);
	CreateInvItems (self, ItMi_Coal, 1);
	CreateInvItems (self, ItPl_Health_Herb_02, 1);
	CreateInvItems (self, ItMi_gold, 40);
	};
};
func void B_CreateAmbientInv_DMT (var int InventorySet)
{
	if 	(InventorySet == 1) 
	{
		CreateInvItems (self, ItPo_Mana_01, 1);
		CreateInvItems (self, ItMi_Pitch, 1);
		CreateInvItems (self, ItMi_gold, 42);
	}
	else if (InventorySet == 2)
	{
		CreateInvItems (self, ItPo_Mana_02, 1);
		CreateInvItems (self, ItMi_gold, 35);
		CreateInvItems (self, ItMi_Aquamarine, 1);
	}
	else if (InventorySet == 3)
	{
		CreateInvItems (self, ItMi_Sulfur, 1);
		CreateInvItems (self, ItMi_gold, 23);
		CreateInvItems (self, ItPo_Mana_01, 1);
	}
	else if (InventorySet == 4)
	{
		CreateInvItems (self, ItMi_Rockcrystal, 1);
		CreateInvItems (self, ItPo_Health_01, 1);
		CreateInvItems (self, ItMi_gold, 46);
	}
	else if (InventorySet == 5)
	{
		CreateInvItems (self, ItMi_Quartz, 1);
		CreateInvItems (self, ItMi_gold, 43);
		CreateInvItems (self, ItPo_Health_02, 1);
	}
	else if (InventorySet == 6)
	{
		CreateInvItems (self, ItPo_Speed, 1);
		CreateInvItems (self, ItMi_Coal, 1);
		CreateInvItems (self, ItMi_gold, 37);
	}
	else if (InventorySet == 0)
	{
		CreateInvItems (self, ItMi_Rockcrystal, 1);
		CreateInvItems (self, ItPo_Health_01, 1);
		CreateInvItems (self, ItMi_gold, 40);
	};
};
func void B_CreateAmbientInv_STRF (var int InventorySet)
{
if 		InventorySet ==1 
	{
	CreateInvItems (self, ItPl_Planeberry, 1);
	}
	else if InventorySet ==2
	{
	CreateInvItems (self, ItFo_Apple, 1);
	}
	else if InventorySet ==3
	{
	CreateInvItems (self, ItFo_Beer, 1);
	}
	else if InventorySet ==4
	{ 
	CreateInvItems (self, ItFo_Cheese, 1);
	}
	else if InventorySet ==5
	{
	CreateInvItems (self, ItFo_Water, 1);
	}
	else if InventorySet ==6
	{
	CreateInvItems (self, ItPl_Forestberry, 1);
	}
	else if InventorySet ==0
	{
	CreateInvItems (self, ItFo_Bread, 1);
	};
};

func void B_CreateAmbientInv_PIR (var int InventorySet)
{
if 	InventorySet ==1 
	{
		CreateInvItems (self, ItPl_Planeberry, 1);
		CreateInvItems (self, ITMW_1H_VLK_Sword,1);
		CreateInvItems (self, ItFO_Addon_Grog,1);
		CreateInvItems (self, ItPl_Health_Herb_02, 1);
		
	}
	else if InventorySet ==2
	{
		CreateInvItems (self, ItFo_Apple, 1);
		CreateInvItems (self, ItFO_Addon_Grog,2);
		CreateInvItems (self, ItMi_Gold,12);
		CreateInvItems (self ,ItMi_Joint,3);
	}
	else if InventorySet ==3
	{
		CreateInvItems (self, ItFo_Beer, 1);
		CreateInvItems (self ,ItPo_Health_01,1);
		CreateInvItems (self ,ItMi_GoldRing,1);
	}
	else if InventorySet ==4
	{ 
		CreateInvItems (self, ItFo_Addon_Grog,2);
		CreateInvItems (self, ItFo_Cheese, 1);
		CreateInvItems (self ,itMi_Joint,1);
		CreateInvItems (self ,ItMi_Gold,9);
	}
	else if InventorySet ==5
	{
		CreateInvItems (self, ItFo_Beer, 1);
		CreateInvItems (self, ItFo_Addon_Rum,1);
		CreateInvItems (self ,ItFo_Addon_Pfeffer_01,1);
	}
	else if InventorySet ==6
	{
		CreateInvItems (self ,ItMi_Gold, 23);
		CreateInvItems (self, ItPl_Forestberry, 1);
		CreateInvItems (self, ITMW_1H_VLK_Sword,1);
	}
	else if InventorySet ==0
	{
		CreateInvItems (self ,itFO_Fish,1);
		CreateInvItems (self,ItFo_Addon_Grog,1);
		CreateInvItems (self, ItFo_Bread, 1);
	};
};

func void B_CreateAmbientInv_BDT (var int InventorySet)
{
if 	InventorySet ==1 
	{
		CreateInvItems (self, ItPl_Planeberry, 1);
		CreateInvItems (self, ITMW_1H_VLK_Sword,1);
		CreateInvItems (self, Itke_Lockpick,2);
		CreateInvItems (self, ItPl_Health_Herb_02, 1);
		
	}
	else if InventorySet ==2
	{
		CreateInvItems (self, ItFo_Apple, 1);
		CreateInvItems (self, ItFO_Booze,2);
		CreateInvItems (self ,ItMi_GoldNugget_Addon,1);
		CreateInvItems (self ,ItMi_Joint,3);
	}
	else if InventorySet ==3
	{
		CreateInvItems (self, ItFo_Beer, 1);
		CreateInvItems (self ,ItPo_Health_01,1);
		CreateInvItems (self ,ItMi_SilverRing,1);
		CreateInvItems (self, ItFO_Beer,2);
	}
	else if InventorySet ==4
	{ 
		CreateInvItems (self, ItKe_lockpick,1);
		CreateInvItems (self, ItFo_Cheese, 1);
		CreateInvItems (self ,itMi_Joint,1);
		CreateInvItems (self ,ItMi_GoldNugget_Addon,1);
	}
	else if InventorySet ==5
	{
		CreateInvItems (self, ItFo_Beer, 1);
		CreateInvItems (self, ItFo_Addon_Rum,1);
		CreateInvItems (self ,ItFo_Fish,1);
		CreateInvItems (self ,ItMi_GoldNugget_Addon,2);
	}
	else if InventorySet ==6
	{
		CreateInvItems (self ,ItMi_Gold, 23);
		CreateInvItems (self, ItPl_Forestberry, 1);
		CreateInvItems (self, ITMW_1H_VLK_Sword,1);
	}
	else if InventorySet ==0
	{
		CreateInvItems (self ,itFO_Fish,1);
		CreateInvItems (self,ItFo_Addon_Grog,1);
		CreateInvItems (self, ItFo_Bread, 1);
		CreateInvItems (self, Itke_Lockpick, 3);
	};
};


// Hier der NPC Befehl
func void B_CreateAmbientInv (var C_NPC slf)
{
	var int Zufall;
	Zufall = Hlp_Random (7);

	if 		(slf.guild == GIL_VLK)			{		B_CreateAmbientInv_VLK (Zufall);}
			else if (slf.guild == GIL_BAU)	{		B_CreateAmbientInv_BAU (Zufall);		}
			else if (slf.guild == GIL_NOV)	{		B_CreateAmbientInv_NOV (Zufall);		}
			else if (slf.guild == GIL_SLD)	{		B_CreateAmbientInv_SLD (Zufall);		}
			else if (slf.guild == GIL_KDF)	{		B_CreateAmbientInv_KDF (Zufall);		}
			else if (slf.guild == GIL_MIL)	{		B_CreateAmbientInv_MIL (Zufall);		}
			else if (slf.guild == GIL_DJG)	{		B_CreateAmbientInv_DJG (Zufall);		}
			else if (slf.guild == GIL_PAL)	{		B_CreateAmbientInv_PAL (Zufall);		}
			else if (slf.guild == GIL_DMT)	{		B_CreateAmbientInv_DMT (Zufall);		}
			else if (slf.guild == GIL_STRF)	{		B_CreateAmbientInv_STRF(Zufall);		}
			else if (slf.guild == GIL_PIR)	{		B_CreateAmbientInv_PIR(Zufall);			}
			else if (slf.guild == GIL_BDT)	{		B_CreateAmbientInv_BDT(Zufall);			}
			else 							{		B_CreateAmbientInv_BAU (Zufall);		};
	
};



