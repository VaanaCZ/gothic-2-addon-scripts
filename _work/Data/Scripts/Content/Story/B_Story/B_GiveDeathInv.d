// **************************
// B_GiveDeathInv
// --------------
// für Menschen und Monster
// gibt Monstern AnimalTrophy
// **************************

func void B_GiveDeathInv (var C_NPC slf)
{
	// EXIT IF...
	
	//-------- NUR beim ersten Durchlauf weitermachen (AIV_DeathInvGiven ist dann FALSE, wird hier (unten) auf TRUE gesetzt) --------
	if	(slf.aivar[AIV_DeathInvGiven] == TRUE)
	{
		return;
	};
	
	// FUNC
	
	// ------ Zähne verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)			{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARG)			{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)	{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_RAZOR)			{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_BLOODHOUND)		{	CreateInvItems (slf, ItAt_Teeth		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)		{	CreateInvItems (slf, ItAt_SharkTeeth, 1);	};
		
		
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)			{	CreateInvItems (slf, ItAt_TrollTooth, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)	{	CreateInvItems (slf, ItAt_TrollTooth, 4);	};
	};
	
	// ------ Krallen verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARAN)			{	CreateInvItems (slf, ItAt_Claw		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)		{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)		{	CreateInvItems (slf, ItAt_Claw		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_RAZOR)			{	CreateInvItems (slf, ItAt_Claw		, 2);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)	{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_BLOODHOUND)		{	CreateInvItems (slf, ItAt_Claw		, 4);	};
		
		
		if (slf.aivar[AIV_MM_REAL_ID] == ID_LURKER)			{	CreateInvItems (slf, ItAt_LurkerClaw, 1);	};		
	};
	
	// ------ Fell und Häute verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHEEP)			{	CreateInvItems (slf, ItAt_SheepFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)			{	CreateInvItems (slf, ItAt_WolfFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF)		{	CreateInvItems (slf, ItAt_WolfFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARG)			{	CreateInvItems (slf, ItAt_WargFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_ShadowFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)			{	CreateInvItems (slf, ItAt_TrollFur	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)	{	CreateInvItems (slf, ItAt_TrollBlackFur	, 1);	};	
		if (slf.aivar[AIV_MM_REAL_ID] == ID_Keiler)			{	CreateInvItems (slf, ItAt_Addon_KeilerFur, 1);	};
	};
	
	// ------ Fell und Häute verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_LURKER)			{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)		{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_RAZOR)			{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)	{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_WARAN)			{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)		{	CreateInvItems (slf, itat_LurkerSkin, 1);	};
		// ---------------------------------------------------------------------------------------------------
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)		{	CreateInvItems (slf, ItAt_SharkSkin	, 1);	};	
	};

	// ------ Herzen verteilen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)		{	CreateInvItems (slf, ItAt_StoneGolemHeart	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)		{	CreateInvItems (slf, ItAt_FireGolemHeart	, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)		{	CreateInvItems (slf, ItAt_IceGolemHeart		, 1);	};
		
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DEMON)			{	CreateInvItems (slf, ItAt_DemonHeart, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)		{	CreateInvItems (slf, ItAt_DemonHeart, 1);	};
	};

	// ------ Horn eines Shadowbeasts ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)	{	CreateInvItems (slf, ItAt_ShadowHorn, 1);	};
	};
	
	// ------ Zunge eines Feuerwarans ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)		{	CreateInvItems (slf, ItAt_WaranFiretongue, 1);	};
	};

	// ------ Blutfliegen-Flügel ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)		{	CreateInvItems (slf, ItAt_Wing, 2);	};
	};
	
	// ------ Blutfliegen-Stachel ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)		{	CreateInvItems (slf, ItAt_Sting, 1);	};
	};
	
	// ------ Zangen von Giant_Bugs und Crawlern ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_GIANT_BUG)			{	CreateInvItems (slf, ItAt_BugMandibles, 	1);	};
		
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)		{	CreateInvItems (slf, ItAt_CrawlerMandibles, 1);	};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)	{	CreateInvItems (slf, ItAt_CrawlerMandibles, 1);	};
	};
	
	// ------ Crawler-Platten ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)		{	CreateInvItems (slf, ItAt_CrawlerPlate, 1);		};
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)	{	CreateInvItems (slf, ItAt_CrawlerPlate, 2);		};
	};
	
	// ------ Drachensnapperhorn ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == TRUE)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)		{	CreateInvItems (slf, ItAt_DrgSnapperHorn, 2); 	};
	};
	
	// ------ Drachen-Schuppen ------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == TRUE)
	{
		//Joly: die anderen Drachen bekommen ihren Stuff beim erlangen des Talentes TROPHY_DragonScale.
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(FireDragonIsland)){	CreateInvItems (slf, ItAt_DragonScale, 12);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Undeaddragon))	{	CreateInvItems (slf, ItAt_DragonScale, 12);		};
	};
 	
	// ------ Drachen-Blut------
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == TRUE)
	{
		//Joly: die anderen Drachen bekommen ihren Stuff beim erlangen des Talentes TROPHY_DragonBlood.
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(FireDragonIsland))	{	CreateInvItems (slf, ItAt_DragonBlood, 2);		};
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Undeaddragon))		{	CreateInvItems (slf, ItAt_DragonBlood, 2);		};
	};
 	
 	// ------ Verteilung von ANFANG AN ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_MEATBUG)		{	CreateInvItems (slf, ItAt_MeatbugFlesh, 1);		}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)	{	CreateInvItems (slf, ItAt_UndeadDragonSoulStone	, 1);	}
	else if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)	{	CreateInvItems (slf, ItAt_FireDragonHeart		, 1);	}
	else if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)	{	CreateInvItems (slf, ItAt_IceDragonHeart		, 1);	}
	else if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)	{	CreateInvItems (slf, ItAt_RockDragonHeart		, 1);	}
	else if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)	{	CreateInvItems (slf, ItAt_SwampDragonHeart		, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_SKELETON){	CreateInvItems (slf, ItAt_GoblinBone	, 1);	}
	else if (slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON)		{	CreateInvItems (slf, ItAt_SkeletonBone	, 1);	}
	//----------------ADDON-----------------------
	else if (self.aivar[AIV_MM_REAL_ID] == ID_BLATTCRAWLER) {	CreateInvItems (slf, ItAt_Addon_BCKopf		, 1);};

	//ROHES FLEISCH IN NPC_SCRIPTEN!!! - HOGE
	
	// ------ Gobbo Green Inventory ------
	GoblinGreen_Randomizer = Hlp_Random (100);
	
	if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)	
	&& (GoblinGreen_Randomizer == 0) 					{	CreateInvItems (slf, ItMi_SilverRing	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)		
	&& (GoblinGreen_Randomizer <= 5) 					{	CreateInvItems (slf, ItPl_Mushroom_01	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)		
	&& (GoblinGreen_Randomizer <= 15) 					{	CreateInvItems (slf, Itmi_Gold	, 5);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)		
	&& (GoblinGreen_Randomizer <= 30) 					{	CreateInvItems (slf, ItFo_Fish	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)		
	&& (GoblinGreen_Randomizer <= 50)					{	CreateInvItems (slf, ItMi_Gold	, 2);	};
	
	
	// ------ Gobbo Black Inventory ------
	GoblinBlack_Randomizer = Hlp_Random (100);
	
	if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)	
	&& (GoblinBlack_Randomizer == 0) 					{	CreateInvItems (slf, ItMi_GoldRing	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)		
	&& (GoblinBlack_Randomizer <= 5) 					{	CreateInvItems (slf, ItFo_Fish	, 1);	}	//CreateInvItems (slf, ItPl_Dex_Herb_01	, 1);

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)		
	&& (GoblinBlack_Randomizer <= 15) 					{	CreateInvItems (slf, Itmi_Gold	, 10);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)		
	&& (GoblinBlack_Randomizer <= 30) 					{	CreateInvItems (slf, ItPl_Mushroom_02	, 1);	}

	else if (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)		
	&& (GoblinBlack_Randomizer <= 50)					{	CreateInvItems (slf, ItMi_Gold	, 5);	};
	
	
	// ------ Orc Inventory -----
	Orc_Randomizer	= Hlp_Random (10);
	
	//------ Orcwarrior -----
	
	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 0)		
	{	
		CreateInvItems (slf, ItPo_Health_02	, 1);
		CreateInvItems (slf, ItMI_Gold	, 2);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 1)
	{	
		CreateInvItems (slf, ItPo_Health_01	, 1);
		CreateInvItems (slf, ItFoMuttonRaw	, 1);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 2)
	{	
		CreateInvItems (slf, ItPo_Health_01	, 2);
		CreateInvItems (slf, ItMI_Gold	, 18);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 3)
	{	
		CreateInvItems (slf, ItFo_Booze	, 1);
		CreateInvItems (slf, ItMi_SilverRing	, 1);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer == 4)
	{	
		CreateInvItems (slf, ItPl_Health_Herb_01	, 1);
		CreateInvItems (slf, ItMI_Gold	, 4);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCWARRIOR)
	&& (Orc_Randomizer <= 7)
	{	
		CreateInvItems (slf, ItMI_Gold	, 9);	
	};
	//----- OrcShamane -----

	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 0)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 1);
		CreateInvItems (slf, ItMI_Gold	, 5);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 1)
	{
		CreateInvItems (slf, ItPo_Mana_02	, 2);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 2)
	{
		CreateInvItems (slf, ItPo_Mana_02	, 1);
		CreateInvItems (slf, ItMi_Coal,1); 
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 3)
	{
		CreateInvItems (slf, ItPo_Mana_01	, 2);
		CreateInvItems (slf, ItMI_Gold	, 12);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer == 4)
	{
		CreateInvItems (slf, ItPo_Mana_01	, 1);
		CreateInvItems (slf, ItMi_Sulfur,1); 
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCSHAMAN)
	&& (Orc_Randomizer <= 8)
	{
		CreateInvItems (slf,ItPl_Mana_Herb_02,2);
		CreateInvItems (slf, ItMI_Gold	, 8);	
	};
	//----- OrcElite -----

	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE )
	&& (Orc_Randomizer == 0)
	{
		CreateInvItems (slf,ItAt_WolfFur,1);
		CreateInvItems (slf,ItPo_Health_03,1);
		CreateInvItems (slf,ItFoMutton,2);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer == 1)
	{
		CreateInvItems (slf,ItMi_GoldRing,1);
		CreateInvItems (slf,ItPo_Health_01,1);
		CreateInvItems (slf,ItMi_Gold,26);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer == 2)
	{
		CreateInvItems (slf,ItSc_LightHeal,1);
		CreateInvItems (slf,ItLSTorch,2);
		CreateInvItems (slf,ItAt_Teeth,1); 
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer <= 5)
	{
		CreateInvItems (slf,ItMi_Gold,19);
		CreateInvItems (slf,ItPo_Health_02,1);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer == 6)
	{
		CreateInvItems (slf,ItAt_WargFur,1);
		//CreateInvItems (slf,ItPl_Strength_Herb_01,1);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_ORCELITE)
	&& (Orc_Randomizer <= 9)
	{
		CreateInvItems (slf,ItMi_Gold ,22);
		CreateInvItems (slf,ItPo_Health_01,1);
	};
	
	//-------- Dämonen -----
	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON)
	&& (Orc_Randomizer == 0)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 2);
		CreateInvItems (slf, ItMi_GoldRing	, 1);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON)
	&& (Orc_Randomizer <= 2)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 1);
		CreateInvItems (slf, ItPo_Health_02	, 1);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON)
	&& (Orc_Randomizer <= 6)
	{
		CreateInvItems (slf, ItPo_Mana_02	, 2);
		CreateInvItems (slf, ItMi_Pitch,1); 
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON)
	{
		CreateInvItems (slf, ItPo_Mana_02	, 1);
		CreateInvItems (slf, ItPo_Health_02	, 1);	
	};
	
	//-------- Dämonen Lord-----
	if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON_LORD)
	&& (Orc_Randomizer <= 1)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 2);
		CreateInvItems (slf, ItPo_Health_03	, 2);
		CreateInvItems (slf, ItSc_SumDemon	, 1);	
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON_LORD)
	&& (Orc_Randomizer <= 5)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 2);
		CreateInvItems (slf, ItPo_Health_03	, 2);
	}
	else if (slf.aivar[AIV_MM_REAL_ID]			== 	ID_DEMON_LORD)
	{
		CreateInvItems (slf, ItPo_Mana_03	, 1);
		CreateInvItems (slf, ItPo_Health_03	, 1);	
	};	
	//-------- AIV setzen, damit INV-Items nur EINMAL vergeben werden  --------
	slf.aivar[AIV_DeathInvGiven] = TRUE;
};










