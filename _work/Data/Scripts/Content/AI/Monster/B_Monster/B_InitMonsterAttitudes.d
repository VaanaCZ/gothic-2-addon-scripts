// ***************************************************************
// B_InitMonsterAttitudes
// ---------------------- 
// Setzt die Monster/Monster-Attitüden
// und Monster/Mensch-(Mensch/Monster)-Attitüden 
// Alle Menschen werden gesammelt über GIL_SEPERATOR_HUM angegeben
// ***************************************************************

func void B_InitMonsterAttitudes ()
{
	// ------ Mensch zu Monster ------
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_FRIENDLY,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM, ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM, ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM, ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM, ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM, ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM, ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	
	// ------ Dementor zu Monstern ------
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_DMT, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_DMT, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_DMT, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_DMT, 	ATT_NEUTRAL, 	GIL_SummonedZombie			);

	// ------ Meatbug zu allen anderen ------
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_GIANT_RAT 				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	
	// ------ Schaf zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_GIANT_RAT 				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_SummonedZombie			);

	// ------ Goblin zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_FRIENDLY,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_GIANT_RAT 				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	// ------ Goblin Skelett zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	// ------ SUMMONED_GOBBO_SKELETON zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL, 	GIL_SummonedZombie			);

	// ------ Scavenger zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_FRIENDLY,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_GIANT_RAT					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL, 	GIL_SummonedZombie			);

	// ------ Giant Rat zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_FRIENDLY,	GIL_GIANT_RAT					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL, 	GIL_SummonedZombie			);

	// ------ Giant Bug zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL, 	GIL_SummonedZombie			);


	// ------ Bloodfly zu allen anderen ------
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_BLOODFLY, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_BLOODFLY, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_BLOODFLY, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_BLOODFLY, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_BLOODFLY, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL, 	GIL_SummonedZombie			);

	// ------ Warane zu allen anderen ------
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_FRIENDLY,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL, 	GIL_SummonedZombie			);


	// ------ Wölfe zu allen anderen ------
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_FRIENDLY,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_WOLF, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_WOLF, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_WOLF, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_WOLF, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_WOLF, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL, 	GIL_SummonedZombie			);


	// ------ Summoned Wolf zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF,		ATT_NEUTRAL, 	GIL_SummonedZombie			);

	// ------ Minecrawler zu allen anderen ------
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_FRIENDLY,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Lurker zu allen anderen ------
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL, 	GIL_SummonedZombie			);

	// ------ Skelette zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Summoned Skeleton zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL, 	GIL_SummonedZombie			);


	// ------ Skeleton Mage zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE, ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	// ------ Zombie zu allen anderen ------
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_ZOMBIE, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_ZOMBIE, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_ZOMBIE, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_ZOMBIE, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Snapper zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_FRIENDLY,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SNAPPER, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SNAPPER, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SNAPPER, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SNAPPER, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
		
	// ------ Shadowbeast zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	// ------ Shadowbeast Skelett zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Harpie zu allen anderen ------
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_FRIENDLY,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_HARPY, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_HARPY, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_HARPY, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_HARPY, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	// ------ Steingolem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	// ------ Feuergolem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Eisgolem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Summoned Golem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Demon zu allen anderen ------
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_DEMON, 			ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_DEMON, 			ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_DEMON, 			ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_DEMON, 			ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Summoned Demon zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Trolle zu allen anderen ------
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_TROLL, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_TROLL, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_TROLL, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_TROLL, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL, 	GIL_SummonedZombie			);

	// ------ Swampsharks zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_FRIENDLY,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	// ------ Drachen zu allen anderen ------
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_DRAGON, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_DRAGON, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_DRAGON, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_DRAGON, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	// ------ Molerat zu allen anderen ------
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_FRIENDLY,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_MOLERAT		, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_MOLERAT		, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_MOLERAT		, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Orks zu allen anderen ------
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_ORC, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_ORC, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_ORC, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_ORC, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Friendly Orcs zu allen anderen ------
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_FRIENDLY,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	
	// ------ Untote Orks zu allen anderen ------
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_UNDEADORC, ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_UNDEADORC, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_UNDEADORC, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_UNDEADORC, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE, 	GIL_SummonedZombie			);

	// ------ Drakonier zu allen anderen ------
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_DRACONIAN, ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_DRACONIAN, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_DRACONIAN, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_DRACONIAN, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
//*********************************
//		Addon
//********************************	
	
	
	// ------ Alligatoren zu allen anderen ------
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR, ATT_FRIENDLY, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	

	
	// ------ Schlammgolem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM, 	ATT_FRIENDLY, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	// ------ Steinwächtern zu allen anderen ------
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	// ------ Steinpuma zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GARGOYLE, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GARGOYLE, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GARGOYLE, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GARGOYLE, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	
	//---------- Summoned Stoneguardian ----------------------------------------------------
	
	// ------ Summoned Demon zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	
	//----------------------- Summoned Zombie ----------------------------------------------------
	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
}; 
