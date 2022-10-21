////////////////
// SPECIES.D //
//////////////


// ACHTUNG! die Turn-Speed ist durch einen "hack" im kampfmodus auf die doppelte geschwindigkeit gesetzt.
//		    deshalb ist die Turn-Speed der Monster im Spiel doppelt so schnell wie hier angegeben, da sie immer im Kampfmode sind!


INSTANCE Gil_Values(C_GILVALUES)
{
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// HUMAN
	SWIM_TIME		 		[GIL_HUMAN] = TIME_INFINITE;	// Verweildauer im Wasser ohne Schaden (in Sek.)
	DIVE_TIME		 		[GIL_HUMAN] = 30;				// Verweildauer im Dive ohne Schaden (in Sek.)
	WATER_DEPTH_KNEE 		[GIL_HUMAN] = 65;				// Wassertiefe ab der WWalk-Mode aktiv (in cm)
	WATER_DEPTH_CHEST		[GIL_HUMAN] = 140;				// Wassertiefe ab der Swim-Mode aktiv (in cm)

	STEP_HEIGHT		 		[GIL_HUMAN] = 60;				// Stufenhöhe für autom. Höhenüberwindung
	JUMPLOW_HEIGHT	 		[GIL_HUMAN] = 105;				// Höhe bis zu der JumpUpLow benutzt wird (in cm)
	JUMPMID_HEIGHT	 		[GIL_HUMAN] = 205;				// Höhe bis zu der JumpUpMid benutzt wird (in cm)
	JUMPUP_HEIGHT 			[GIL_HUMAN] = 200; 				// Sprunghöhe wenn höher als JumpUpMid (in cm) Ist effektiv höher, da von Boden bis Körpermitte gemessen!!!

	SLIDE_ANGLE		 		[GIL_HUMAN] = 50;				// Winkel ab der Model in Slide (in Grad)
	DISABLE_AUTOROLL		[GIL_HUMAN] = 0;
	SURFACE_ALIGN			[GIL_HUMAN] = 0;

	TURN_SPEED				[GIL_HUMAN] = 240;				// dieser Wert gilt nur für NSCs!
															// Turn-Speed für den Spieler ist PROGRAMMINTERN auf 100° im Normalmodus und 200° im Kampfmodus eingestellt!
	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_HUMAN] = 50;
	CLIMB_HORIZ_ANGLE		[GIL_HUMAN] = 50;
	CLIMB_GROUND_ANGLE  	[GIL_HUMAN] = 50;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_HUMAN] = 500;				// Fallhöhe in cm ohne Schaden zu nehmen
	FALLDOWN_DAMAGE			[GIL_HUMAN] = 20;				// Schaden in HPs für jeden weiteren Meter

	// Kampf
	FIGHT_RANGE_BASE		[GIL_HUMAN]	= 60;				// Bip01 bis BBox
	FIGHT_RANGE_FIST		[GIL_HUMAN] = 50;				// FAI_W = BASE + ItemRange (oder Fist)
	FIGHT_RANGE_G			[GIL_HUMAN]	= 100;				// FAI_G = BASE + ItemRange (oder Fist) + G
	//Automatisches Schieben der Figur (wenn zu nah dran) auf 0.75*FightRange
	
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// MEATBUG

	SWIM_TIME		 		[GIL_MEATBUG] = 0;
	DIVE_TIME		 		[GIL_MEATBUG] = 0;
	WATER_DEPTH_KNEE 		[GIL_MEATBUG] = 5;
	WATER_DEPTH_CHEST		[GIL_MEATBUG] = 10;

	SLIDE_ANGLE		 		[GIL_MEATBUG] = 50;
	DISABLE_AUTOROLL 		[GIL_MEATBUG] = 1;
	SURFACE_ALIGN	 		[GIL_MEATBUG] = 2;
	TURN_SPEED				[GIL_MEATBUG] = 120;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_MEATBUG] = 800;
	FALLDOWN_DAMAGE			[GIL_MEATBUG] = 1;

	// Kampf
	FIGHT_RANGE_FIST		[GIL_MEATBUG] = 10;
	FIGHT_RANGE_BASE		[GIL_MEATBUG] = 15;
	FIGHT_RANGE_G			[GIL_MEATBUG] = 15;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_MEATBUG] = "BFX_Preset2";
	BLOOD_TEXTURE			[GIL_MEATBUG] = "BQM_Meatbug.tga";
	BLOOD_FLOW				[GIL_MEATBUG] = 1;
	BLOOD_AMOUNT			[GIL_MEATBUG] = 2;
	BLOOD_MAX_DISTANCE		[GIL_MEATBUG] = 50;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SHEEP

	SWIM_TIME		 		[GIL_SHEEP] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_SHEEP] = 0;
	WATER_DEPTH_KNEE 		[GIL_SHEEP] = 25;
	WATER_DEPTH_CHEST		[GIL_SHEEP] = 50;

	JUMPLOW_HEIGHT 			[GIL_SHEEP] = 105;
	JUMPMID_HEIGHT 			[GIL_SHEEP] = 200;

	SLIDE_ANGLE		 		[GIL_SHEEP] = 50;
	DISABLE_AUTOROLL 		[GIL_SHEEP] = 1;
	SURFACE_ALIGN	 		[GIL_SHEEP] = 1;
	TURN_SPEED				[GIL_SHEEP] = 120; //!!! NICHT kleiner als 100, sonst wird Turn-Ani nicht gespielt (Bug)


	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SHEEP] = 400;
	FALLDOWN_DAMAGE			[GIL_SHEEP] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_SHEEP] = 130;
	FIGHT_RANGE_FIST		[GIL_SHEEP] = 95;
	FIGHT_RANGE_G			[GIL_SHEEP] = 95;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_SHEEP] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_SHEEP] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_SHEEP] = 1;
	BLOOD_AMOUNT			[GIL_SHEEP] = 10;
	BLOOD_MAX_DISTANCE		[GIL_SHEEP] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// GOBBO --> AUCH Gobbo-Skelett und SUMMONED Gobbo-Skelett (s.u.) beachten!

	SWIM_TIME				[GIL_GOBBO] = TIME_INFINITE;
	DIVE_TIME				[GIL_GOBBO] = 30;
	WATER_DEPTH_KNEE 		[GIL_GOBBO] = 30;
	WATER_DEPTH_CHEST		[GIL_GOBBO] = 80;

	STEP_HEIGHT				[GIL_GOBBO] = 25;
	JUMPLOW_HEIGHT			[GIL_GOBBO] = 105;
	JUMPMID_HEIGHT			[GIL_GOBBO] = 155;
	JUMPUP_HEIGHT 			[GIL_GOBBO] = 200;

	SLIDE_ANGLE		 		[GIL_GOBBO] = 50;
	TURN_SPEED				[GIL_GOBBO] = 240;
	
	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_GOBBO] = 50;
	CLIMB_HORIZ_ANGLE		[GIL_GOBBO] = 50;
	CLIMB_GROUND_ANGLE  	[GIL_GOBBO] = 50;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_GOBBO] = 500;
	FALLDOWN_DAMAGE			[GIL_GOBBO] = 10;

	// Kampf
	FIGHT_RANGE_FIST		[GIL_GOBBO] = 50;
	FIGHT_RANGE_BASE		[GIL_GOBBO] = 50;
	FIGHT_RANGE_G			[GIL_GOBBO] = 50;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// GOBBO SKELETT AUCH SUMMONED Gobbo-Skelett (s.u.) beachten!

	SWIM_TIME				[GIL_GOBBO_SKELETON] = SWIM_TIME				[GIL_GOBBO];
	DIVE_TIME				[GIL_GOBBO_SKELETON] = DIVE_TIME				[GIL_GOBBO];
	WATER_DEPTH_KNEE 		[GIL_GOBBO_SKELETON] = WATER_DEPTH_KNEE 		[GIL_GOBBO];
	WATER_DEPTH_CHEST		[GIL_GOBBO_SKELETON] = WATER_DEPTH_CHEST		[GIL_GOBBO];
                                                                                      
	STEP_HEIGHT				[GIL_GOBBO_SKELETON] = STEP_HEIGHT				[GIL_GOBBO];
	JUMPLOW_HEIGHT			[GIL_GOBBO_SKELETON] = JUMPLOW_HEIGHT			[GIL_GOBBO];
	JUMPMID_HEIGHT			[GIL_GOBBO_SKELETON] = JUMPMID_HEIGHT			[GIL_GOBBO];
	JUMPUP_HEIGHT 			[GIL_GOBBO_SKELETON] = JUMPUP_HEIGHT 			[GIL_GOBBO];
                                                                                      
	SLIDE_ANGLE		 		[GIL_GOBBO_SKELETON] = SLIDE_ANGLE		 		[GIL_GOBBO];
	TURN_SPEED				[GIL_GOBBO_SKELETON] = TURN_SPEED				[GIL_GOBBO];
	                                                                                  
	// Kletterkanten - Winkel                      // Kletterkanten - Winkel          
	CLIMB_HEADING_ANGLE		[GIL_GOBBO_SKELETON] = CLIMB_HEADING_ANGLE		[GIL_GOBBO];
	CLIMB_HORIZ_ANGLE		[GIL_GOBBO_SKELETON] = CLIMB_HORIZ_ANGLE		[GIL_GOBBO];
	CLIMB_GROUND_ANGLE  	[GIL_GOBBO_SKELETON] = CLIMB_GROUND_ANGLE  		[GIL_GOBBO];
                                                                                      
	// Fallhöhe / Fallschaden                      // Fallhöhe / Fallschaden          
	FALLDOWN_HEIGHT			[GIL_GOBBO_SKELETON] = FALLDOWN_HEIGHT			[GIL_GOBBO];
	FALLDOWN_DAMAGE			[GIL_GOBBO_SKELETON] = FALLDOWN_DAMAGE			[GIL_GOBBO];
                                                                                      
	// Kampf                                       // Kampf                           
	FIGHT_RANGE_FIST		[GIL_GOBBO_SKELETON] = FIGHT_RANGE_FIST			[GIL_GOBBO];
	FIGHT_RANGE_BASE		[GIL_GOBBO_SKELETON] = FIGHT_RANGE_BASE			[GIL_GOBBO];
	FIGHT_RANGE_G			[GIL_GOBBO_SKELETON] = FIGHT_RANGE_G			[GIL_GOBBO];
	
	BLOOD_EMITTER			[GIL_GOBBO_SKELETON] = "BFX_Skeleton";		
	
	
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SUMMONED GOBBO SKELETT

	SWIM_TIME				[GIL_SUMMONED_GOBBO_SKELETON] = SWIM_TIME				[GIL_GOBBO];
	DIVE_TIME				[GIL_SUMMONED_GOBBO_SKELETON] = DIVE_TIME				[GIL_GOBBO];
	WATER_DEPTH_KNEE 		[GIL_SUMMONED_GOBBO_SKELETON] = WATER_DEPTH_KNEE 		[GIL_GOBBO];
	WATER_DEPTH_CHEST		[GIL_SUMMONED_GOBBO_SKELETON] = WATER_DEPTH_CHEST		[GIL_GOBBO];
                                                                                                
	STEP_HEIGHT				[GIL_SUMMONED_GOBBO_SKELETON] = STEP_HEIGHT				[GIL_GOBBO];
	JUMPLOW_HEIGHT			[GIL_SUMMONED_GOBBO_SKELETON] = JUMPLOW_HEIGHT			[GIL_GOBBO];
	JUMPMID_HEIGHT			[GIL_SUMMONED_GOBBO_SKELETON] = JUMPMID_HEIGHT			[GIL_GOBBO];
	JUMPUP_HEIGHT 			[GIL_SUMMONED_GOBBO_SKELETON] = JUMPUP_HEIGHT 			[GIL_GOBBO];
                                                                                                
	SLIDE_ANGLE		 		[GIL_SUMMONED_GOBBO_SKELETON] = SLIDE_ANGLE		 		[GIL_GOBBO];
	TURN_SPEED				[GIL_SUMMONED_GOBBO_SKELETON] = TURN_SPEED				[GIL_GOBBO];
	                                                                                            
	// Kletterkanten - Winkel                               // Kletterkanten - Winkel           
	CLIMB_HEADING_ANGLE		[GIL_SUMMONED_GOBBO_SKELETON] = CLIMB_HEADING_ANGLE		[GIL_GOBBO];
	CLIMB_HORIZ_ANGLE		[GIL_SUMMONED_GOBBO_SKELETON] = CLIMB_HORIZ_ANGLE		[GIL_GOBBO];
	CLIMB_GROUND_ANGLE  	[GIL_SUMMONED_GOBBO_SKELETON] = CLIMB_GROUND_ANGLE  	[GIL_GOBBO];
                                                                                                
	// Fallhöhe / Fallschaden                               // Fallhöhe / Fallschaden           
	FALLDOWN_HEIGHT			[GIL_SUMMONED_GOBBO_SKELETON] = FALLDOWN_HEIGHT			[GIL_GOBBO];
	FALLDOWN_DAMAGE			[GIL_SUMMONED_GOBBO_SKELETON] = FALLDOWN_DAMAGE			[GIL_GOBBO];
                                                                                                
	// Kampf                                                // Kampf                            
	FIGHT_RANGE_FIST		[GIL_SUMMONED_GOBBO_SKELETON] = FIGHT_RANGE_FIST		[GIL_GOBBO];
	FIGHT_RANGE_BASE		[GIL_SUMMONED_GOBBO_SKELETON] = FIGHT_RANGE_BASE		[GIL_GOBBO];
	FIGHT_RANGE_G			[GIL_SUMMONED_GOBBO_SKELETON] = FIGHT_RANGE_G			[GIL_GOBBO];
	
	BLOOD_EMITTER			[GIL_SUMMONED_GOBBO_SKELETON] = "BFX_Skeleton";		


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SCAVENGER

	SWIM_TIME		 		[GIL_SCAVENGER] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_SCAVENGER] = 0;
	WATER_DEPTH_KNEE 		[GIL_SCAVENGER] = 50;
	WATER_DEPTH_CHEST		[GIL_SCAVENGER] = 120;

	STEP_HEIGHT		 		[GIL_SCAVENGER] = 50;
	JUMPLOW_HEIGHT	 		[GIL_SCAVENGER] = 200;

	SLIDE_ANGLE		 		[GIL_SCAVENGER] = 50;
	DISABLE_AUTOROLL 		[GIL_SCAVENGER] = 0;
	SURFACE_ALIGN	 		[GIL_SCAVENGER] = 0;
	TURN_SPEED				[GIL_SCAVENGER] = 180; 

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SCAVENGER] = 400;
	FALLDOWN_DAMAGE			[GIL_SCAVENGER] = 10;

	// Kampf
	
	FIGHT_RANGE_BASE		[GIL_SCAVENGER] = 100;
	FIGHT_RANGE_FIST		[GIL_SCAVENGER] = 150;
	FIGHT_RANGE_G			[GIL_SCAVENGER] = 200;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_SCAVENGER] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_SCAVENGER] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_SCAVENGER] = 1;
	BLOOD_AMOUNT			[GIL_SCAVENGER] = 10;
	BLOOD_MAX_DISTANCE		[GIL_SCAVENGER] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// RIESEN-RATTE (Giant_Rat)

	SWIM_TIME		 		[GIL_GIANT_RAT] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_GIANT_RAT] = 30;
	WATER_DEPTH_KNEE 		[GIL_GIANT_RAT] = 25;
	WATER_DEPTH_CHEST		[GIL_GIANT_RAT] = 50;

	JUMPLOW_HEIGHT 			[GIL_GIANT_RAT] = 105;
	JUMPMID_HEIGHT 			[GIL_GIANT_RAT] = 200;

	SLIDE_ANGLE		 		[GIL_GIANT_RAT] = 50;
	DISABLE_AUTOROLL 		[GIL_GIANT_RAT] = 1;
	SURFACE_ALIGN	 		[GIL_GIANT_RAT] = 1;
	TURN_SPEED				[GIL_GIANT_RAT] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_GIANT_RAT] = 400;
	FALLDOWN_DAMAGE			[GIL_GIANT_RAT] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_GIANT_RAT] = 170;
	FIGHT_RANGE_FIST		[GIL_GIANT_RAT] = 10;
	FIGHT_RANGE_G			[GIL_GIANT_RAT] = 100;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_GIANT_RAT] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_GIANT_RAT] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_Giant_Rat] = 1;
	BLOOD_AMOUNT			[GIL_GIANT_RAT] = 10;
	BLOOD_MAX_DISTANCE		[GIL_GIANT_RAT] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// GIANT BUG (MH: Werte erstmal von Scavenger geklaut)

	SWIM_TIME		 		[GIL_GIANT_BUG] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_GIANT_BUG] = 0;
	WATER_DEPTH_KNEE 		[GIL_GIANT_BUG] = 50;
	WATER_DEPTH_CHEST		[GIL_GIANT_BUG] = 120;

	STEP_HEIGHT		 		[GIL_GIANT_BUG] = 50;
	JUMPLOW_HEIGHT	 		[GIL_GIANT_BUG] = 200;

	SLIDE_ANGLE		 		[GIL_GIANT_BUG] = 50;
	DISABLE_AUTOROLL 		[GIL_GIANT_BUG] = 1;
	SURFACE_ALIGN	 		[GIL_GIANT_BUG] = 1;
	TURN_SPEED				[GIL_GIANT_BUG] = 240; 

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_GIANT_BUG] = 400;
	FALLDOWN_DAMAGE			[GIL_GIANT_BUG] = 10;

	// Kampf
	
	FIGHT_RANGE_BASE		[GIL_GIANT_BUG] = 120;
	FIGHT_RANGE_FIST		[GIL_GIANT_BUG] = 120;
	FIGHT_RANGE_G			[GIL_GIANT_BUG] = 50;//120;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_GIANT_BUG] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_GIANT_BUG] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_GIANT_BUG] = 1;
	BLOOD_AMOUNT			[GIL_GIANT_BUG] = 10;
	BLOOD_MAX_DISTANCE		[GIL_GIANT_BUG] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// BLOODFLY

	SWIM_TIME				[GIL_BLOODFLY] = TIME_INFINITE;
	DIVE_TIME				[GIL_BLOODFLY] = 0;

// .Der Wert "999999" für fiegende Monster führt dazu, dass Wasserpolys wie statische Polys behandelt werden
//	auch auf diesen "laufen" und niemals ins Schwimmen/Tauchen kommen können.
	WATER_DEPTH_KNEE		[GIL_BLOODFLY] = 999999;
	WATER_DEPTH_CHEST		[GIL_BLOODFLY] = 999999;

	STEP_HEIGHT		 		[GIL_BLOODFLY] = 100;
	JUMPLOW_HEIGHT	 		[GIL_BLOODFLY] = 800;

	SLIDE_ANGLE				[GIL_BLOODFLY] = 50;
	DISABLE_AUTOROLL		[GIL_BLOODFLY] = 0;
	SURFACE_ALIGN			[GIL_BLOODFLY] = 0;
	TURN_SPEED				[GIL_BLOODFLY] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_BLOODFLY] = 9999;
	FALLDOWN_DAMAGE			[GIL_BLOODFLY] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_BLOODFLY] = 80;
	FIGHT_RANGE_FIST		[GIL_BLOODFLY] = 80;
	FIGHT_RANGE_G			[GIL_BLOODFLY] = 100; //sonst bringt Jumpback die Fly immer in FK-Distanz

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// WARAN (Waran und Feuerwaran)

	SWIM_TIME		 		[GIL_WARAN] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_WARAN] = 0;
	WATER_DEPTH_KNEE 		[GIL_WARAN] = 50;
	WATER_DEPTH_CHEST		[GIL_WARAN] = 120;

	STEP_HEIGHT		 		[GIL_WARAN] = 60;
	JUMPLOW_HEIGHT	 		[GIL_WARAN] = 100;
	JUMPMID_HEIGHT 			[GIL_WARAN] = 200;
//	JUMPUP_HEIGHT 			[GIL_WARAN] = 200;

	SLIDE_ANGLE		 		[GIL_WARAN] = 50;
	DISABLE_AUTOROLL 		[GIL_WARAN] = 1;
	SURFACE_ALIGN	 		[GIL_WARAN] = 1;
	TURN_SPEED				[GIL_WARAN] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_WARAN] = 500;
	FALLDOWN_DAMAGE			[GIL_WARAN] = 10;

	// Kampf

	FIGHT_RANGE_BASE		[GIL_WARAN] = 250;
	FIGHT_RANGE_FIST		[GIL_WARAN] = 50;
	FIGHT_RANGE_G			[GIL_WARAN] = 100;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_WARAN] = "BFX_Preset2";
	BLOOD_TEXTURE			[GIL_WARAN] = "BQM_Meatbug.tga";
	//BLOOD_FLOW				[GIL_WARAN] = 1;
	BLOOD_AMOUNT			[GIL_WARAN] = 10;
	BLOOD_MAX_DISTANCE		[GIL_WARAN] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// WOLF (Wolf und Warg) - AUCH SUMMONED Wolf (s.u.) beachten!

	SWIM_TIME		 		[GIL_WOLF] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_WOLF] = 0;
	WATER_DEPTH_KNEE 		[GIL_WOLF] = 40;
	WATER_DEPTH_CHEST		[GIL_WOLF] = 70;

	STEP_HEIGHT		 		[GIL_WOLF] = 60;
	JUMPLOW_HEIGHT	 		[GIL_WOLF] = 100;
	JUMPMID_HEIGHT	 		[GIL_WOLF] = 200;

	SLIDE_ANGLE		 		[GIL_WOLF] = 50;
	DISABLE_AUTOROLL 		[GIL_WOLF] = 1;
	SURFACE_ALIGN	 		[GIL_WOLF] = 1;
	TURN_SPEED				[GIL_WOLF] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_WOLF] = 500;
	FALLDOWN_DAMAGE			[GIL_WOLF] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_WOLF] = 170;//100	// Bip01 bis BBox         
	FIGHT_RANGE_FIST		[GIL_WOLF] = 30; //100  // BBox bis  "Attack-Limb"
	FIGHT_RANGE_G			[GIL_WOLF] = 100;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_WOLF] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_WOLF] = "BQM_Scavenger2.tga";
	BLOOD_FLOW				[GIL_WOLF] = 1;
	BLOOD_AMOUNT			[GIL_WOLF] = 5;
	BLOOD_MAX_DISTANCE		[GIL_WOLF] = 80;       

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SUMMONED WOLF

	SWIM_TIME		 		[GIL_SUMMONED_WOLF] = SWIM_TIME		 		[GIL_WOLF];
	DIVE_TIME		 		[GIL_SUMMONED_WOLF] = DIVE_TIME		 		[GIL_WOLF];
	WATER_DEPTH_KNEE 		[GIL_SUMMONED_WOLF] = WATER_DEPTH_KNEE 		[GIL_WOLF];
	WATER_DEPTH_CHEST		[GIL_SUMMONED_WOLF] = WATER_DEPTH_CHEST		[GIL_WOLF];

	STEP_HEIGHT		 		[GIL_SUMMONED_WOLF] = STEP_HEIGHT		 	[GIL_WOLF];
	JUMPLOW_HEIGHT	 		[GIL_SUMMONED_WOLF] = JUMPLOW_HEIGHT	 	[GIL_WOLF];
	JUMPMID_HEIGHT	 		[GIL_SUMMONED_WOLF] = JUMPMID_HEIGHT	 	[GIL_WOLF];

	SLIDE_ANGLE		 		[GIL_SUMMONED_WOLF] = SLIDE_ANGLE		 	[GIL_WOLF];
	DISABLE_AUTOROLL 		[GIL_SUMMONED_WOLF] = DISABLE_AUTOROLL 		[GIL_WOLF]; 
	SURFACE_ALIGN	 		[GIL_SUMMONED_WOLF] = SURFACE_ALIGN	 		[GIL_WOLF]; 
	TURN_SPEED				[GIL_SUMMONED_WOLF] = TURN_SPEED			[GIL_WOLF]; 
                                                                                     
	// Fallhöhe / Fallschaden                     // Fallhöhe / Fallschaden          
	FALLDOWN_HEIGHT			[GIL_SUMMONED_WOLF] = FALLDOWN_HEIGHT		[GIL_WOLF]; 
	FALLDOWN_DAMAGE			[GIL_SUMMONED_WOLF] = FALLDOWN_DAMAGE		[GIL_WOLF];

	// Kampf
	FIGHT_RANGE_BASE		[GIL_SUMMONED_WOLF] = FIGHT_RANGE_BASE		[GIL_WOLF];
	FIGHT_RANGE_FIST		[GIL_SUMMONED_WOLF] = FIGHT_RANGE_FIST		[GIL_WOLF];
	FIGHT_RANGE_G			[GIL_SUMMONED_WOLF] = FIGHT_RANGE_G			[GIL_WOLF];
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_SUMMONED_WOLF] = "BFX_Preset1";     	
	BLOOD_TEXTURE			[GIL_SUMMONED_WOLF] = "BQM_Scaveng2.tga";
	BLOOD_FLOW				[GIL_SUMMONED_WOLF] = BLOOD_FLOW			[GIL_WOLF];
	BLOOD_AMOUNT			[GIL_SUMMONED_WOLF] = BLOOD_AMOUNT			[GIL_WOLF];
	BLOOD_MAX_DISTANCE		[GIL_SUMMONED_WOLF] = BLOOD_MAX_DISTANCE	[GIL_WOLF];

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// MINECRAWLER (Crawler und Crawler-Warrior)

	SWIM_TIME		 		[GIL_MINECRAWLER] = 0;
	DIVE_TIME		 		[GIL_MINECRAWLER] = 0;
	WATER_DEPTH_KNEE 		[GIL_MINECRAWLER] = 75;
	WATER_DEPTH_CHEST		[GIL_MINECRAWLER] = 100;

//	JUMPUP_HEIGHT 			[GIL_MINECRAWLER] = 200;

	SLIDE_ANGLE		 		[GIL_MINECRAWLER] = 50;
	DISABLE_AUTOROLL 		[GIL_MINECRAWLER] = 1;
	SURFACE_ALIGN	 		[GIL_MINECRAWLER] = 2;
	TURN_SPEED				[GIL_MINECRAWLER] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_MINECRAWLER] = 1000;
	FALLDOWN_DAMAGE			[GIL_MINECRAWLER] = 1;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_MINECRAWLER] = 100;
	FIGHT_RANGE_FIST		[GIL_MINECRAWLER] = 170;
	FIGHT_RANGE_G			[GIL_MINECRAWLER] = 170;
			
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// LURKER

	SWIM_TIME				[GIL_LURKER] = TIME_INFINITE;
	DIVE_TIME				[GIL_LURKER] = TIME_INFINITE;
	WATER_DEPTH_KNEE 		[GIL_LURKER] = 50;
	WATER_DEPTH_CHEST		[GIL_LURKER] = 120;

	STEP_HEIGHT		 		[GIL_LURKER] = 55;
	JUMPLOW_HEIGHT	 		[GIL_LURKER] = 205;
	JUMPUP_HEIGHT 			[GIL_LURKER] = 300;

	SLIDE_ANGLE		 		[GIL_LURKER] = 50;
	DISABLE_AUTOROLL 		[GIL_LURKER] = 1;
	SURFACE_ALIGN	 		[GIL_LURKER] = 1;
	TURN_SPEED				[GIL_LURKER] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_LURKER] = 400;
	FALLDOWN_DAMAGE			[GIL_LURKER] = 20;

	// Kampf

	FIGHT_RANGE_BASE		[GIL_LURKER] = 150;
	FIGHT_RANGE_FIST		[GIL_LURKER] = 150;
	FIGHT_RANGE_G			[GIL_LURKER] = 150;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SKELETON - AUCH SUMMONED Skeleton (s.u.) beachten!

	SWIM_TIME				[GIL_SKELETON] = 0;	 
	DIVE_TIME		 		[GIL_SKELETON] = 0; 
	WATER_DEPTH_KNEE 		[GIL_SKELETON] = WATER_DEPTH_KNEE 		[GIL_HUMAN]; 
	WATER_DEPTH_CHEST		[GIL_SKELETON] = WATER_DEPTH_CHEST		[GIL_HUMAN]; 
                                                                                                        
	STEP_HEIGHT		 		[GIL_SKELETON] = STEP_HEIGHT	 		[GIL_HUMAN]; 
	JUMPLOW_HEIGHT	 		[GIL_SKELETON] = JUMPLOW_HEIGHT	 		[GIL_HUMAN];
	JUMPMID_HEIGHT	 		[GIL_SKELETON] = JUMPMID_HEIGHT	 		[GIL_HUMAN]; 
	JUMPUP_HEIGHT 			[GIL_SKELETON] = JUMPUP_HEIGHT 			[GIL_HUMAN]; 
                                                                                                        
	SLIDE_ANGLE		 		[GIL_SKELETON] = SLIDE_ANGLE 			[GIL_HUMAN]; 
	DISABLE_AUTOROLL		[GIL_SKELETON] = 0;
	SURFACE_ALIGN			[GIL_SKELETON] = 0;
	TURN_SPEED				[GIL_SKELETON] = TURN_SPEED				[GIL_HUMAN];
	// Kletterkanten - Winkel                                                                           
	CLIMB_HEADING_ANGLE		[GIL_SKELETON] = CLIMB_HEADING_ANGLE	[GIL_HUMAN];                     
	CLIMB_HORIZ_ANGLE		[GIL_SKELETON] = CLIMB_HORIZ_ANGLE		[GIL_HUMAN];                    									
	CLIMB_GROUND_ANGLE  	[GIL_SKELETON] = CLIMB_GROUND_ANGLE  	[GIL_HUMAN];                   
                                                                    
	// Fallhöhe / Fallschaden                                        
	FALLDOWN_HEIGHT			[GIL_SKELETON] = FALLDOWN_HEIGHT		[GIL_HUMAN];                
	FALLDOWN_DAMAGE			[GIL_SKELETON] = FALLDOWN_DAMAGE		[GIL_HUMAN];                                                        
                                                                          
	// Kampf                                                         
	FIGHT_RANGE_BASE		[GIL_SKELETON] = 60;                    
	FIGHT_RANGE_FIST		[GIL_SKELETON] = 150; //50 + 100 Waffe (Hack)
	FIGHT_RANGE_G			[GIL_SKELETON] = 100;      
                                                                    
	// Bluteffekte by KaiRo                                        
	BLOOD_EMITTER			[GIL_SKELETON] = "BFX_Skeleton";    
	
	
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SUMMONED SKELETON

	SWIM_TIME				[GIL_SUMMONED_SKELETON] = SWIM_TIME				[GIL_SKELETON];
	DIVE_TIME		 		[GIL_SUMMONED_SKELETON] = DIVE_TIME		 		[GIL_SKELETON];
	WATER_DEPTH_KNEE 		[GIL_SUMMONED_SKELETON] = WATER_DEPTH_KNEE 		[GIL_SKELETON];
	WATER_DEPTH_CHEST		[GIL_SUMMONED_SKELETON] = WATER_DEPTH_CHEST		[GIL_SKELETON];
                                                                                            
	STEP_HEIGHT		 		[GIL_SUMMONED_SKELETON] = STEP_HEIGHT		 	[GIL_SKELETON];
	JUMPLOW_HEIGHT	 		[GIL_SUMMONED_SKELETON] = JUMPLOW_HEIGHT	 	[GIL_SKELETON];
	JUMPMID_HEIGHT	 		[GIL_SUMMONED_SKELETON] = JUMPMID_HEIGHT	 	[GIL_SKELETON];
	JUMPUP_HEIGHT 			[GIL_SUMMONED_SKELETON] = JUMPUP_HEIGHT 		[GIL_SKELETON];
                                                                                            
	SLIDE_ANGLE		 		[GIL_SUMMONED_SKELETON] = SLIDE_ANGLE		 	[GIL_SKELETON];
	TURN_SPEED				[GIL_SUMMONED_SKELETON] = TURN_SPEED			[GIL_SKELETON];
	                                                                                        
	// Kletterkanten - Winkel                         // Kletterkanten - Winkel             
	CLIMB_HEADING_ANGLE		[GIL_SUMMONED_SKELETON] = CLIMB_HEADING_ANGLE	[GIL_SKELETON];
	CLIMB_HORIZ_ANGLE		[GIL_SUMMONED_SKELETON] = CLIMB_HORIZ_ANGLE		[GIL_SKELETON];
	CLIMB_GROUND_ANGLE  	[GIL_SUMMONED_SKELETON] = CLIMB_GROUND_ANGLE  	[GIL_SKELETON];
                                                                                            
	// Fallhöhe / Fallschaden                         // Fallhöhe / Fallschaden             
	FALLDOWN_HEIGHT			[GIL_SUMMONED_SKELETON] = FALLDOWN_HEIGHT		[GIL_SKELETON];
	FALLDOWN_DAMAGE			[GIL_SUMMONED_SKELETON] = FALLDOWN_DAMAGE		[GIL_SKELETON];
                                                                                            
	// Kampf                                          // Kampf                              
	FIGHT_RANGE_BASE		[GIL_SUMMONED_SKELETON] = FIGHT_RANGE_BASE		[GIL_SKELETON];
	FIGHT_RANGE_FIST		[GIL_SUMMONED_SKELETON] = FIGHT_RANGE_FIST		[GIL_SKELETON];
	FIGHT_RANGE_G			[GIL_SUMMONED_SKELETON]	= FIGHT_RANGE_G			[GIL_SKELETON];
                                                                                            
	// Bluteffekte by KaiRo                                        
	BLOOD_EMITTER			[GIL_SUMMONED_SKELETON] = "BFX_Skeleton";
	
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SKELETON MAGE (MH: Werte erstmal von Demon geklaut)

	SWIM_TIME		 		[GIL_SKELETON_MAGE] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_SKELETON_MAGE] = 0;

// .Der Wert "999999" für fiegende Monster führt dazu, dass Wasserpolys wie statische Polys behandelt werden
//	auch auf diesen "laufen" und niemals ins Schwimmen/Tauchen kommen können.
	WATER_DEPTH_KNEE 		[GIL_SKELETON_MAGE] = 999999;
	WATER_DEPTH_CHEST		[GIL_SKELETON_MAGE] = 999999;

	STEP_HEIGHT		 		[GIL_SKELETON_MAGE] = 150;
	JUMPLOW_HEIGHT 			[GIL_SKELETON_MAGE] = 800;

	SLIDE_ANGLE		 		[GIL_SKELETON_MAGE] = 50;
	DISABLE_AUTOROLL 		[GIL_SKELETON_MAGE] = 0;
	SURFACE_ALIGN	 		[GIL_SKELETON_MAGE] = 0;
	TURN_SPEED				[GIL_SKELETON_MAGE] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SKELETON_MAGE] = 9999;
	FALLDOWN_DAMAGE			[GIL_SKELETON_MAGE] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_SKELETON_MAGE] = 60;
	FIGHT_RANGE_FIST		[GIL_SKELETON_MAGE] = 150;
	FIGHT_RANGE_G			[GIL_SKELETON_MAGE] = 100;

	//Blut
	BLOOD_EMITTER			[GIL_SKELETON_MAGE] = "BFX_Skeleton";  
	

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ZOMBIE

	SWIM_TIME		 		[GIL_ZOMBIE] = 0;
	DIVE_TIME		 		[GIL_ZOMBIE] = 0;
	WATER_DEPTH_KNEE 		[GIL_ZOMBIE] = 90;
	WATER_DEPTH_CHEST		[GIL_ZOMBIE] = 150;

	STEP_HEIGHT		 		[GIL_ZOMBIE] = 60;
	JUMPLOW_HEIGHT	 		[GIL_ZOMBIE] = 200;

	SLIDE_ANGLE		 		[GIL_ZOMBIE] = 50;
	TURN_SPEED				[GIL_ZOMBIE] = 240;

	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_ZOMBIE] = 50;
	CLIMB_HORIZ_ANGLE		[GIL_ZOMBIE] = 50;
	CLIMB_GROUND_ANGLE  	[GIL_ZOMBIE] = 50;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_ZOMBIE] = 9999;
	FALLDOWN_DAMAGE			[GIL_ZOMBIE] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_ZOMBIE] = 60;
	FIGHT_RANGE_FIST		[GIL_ZOMBIE] = 50;
	FIGHT_RANGE_G			[GIL_ZOMBIE] = 300;

	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_ZOMBIE] = "BFX_Zombie";
	BLOOD_TEXTURE			[GIL_ZOMBIE] = "BQM_Zombie.tga";
	BLOOD_FLOW				[GIL_ZOMBIE] = 0;
	BLOOD_AMOUNT			[GIL_ZOMBIE] = 10;
	BLOOD_MAX_DISTANCE		[GIL_ZOMBIE] = 100;


// ZOMBIE

	SWIM_TIME		 		[GIL_SUMMONEDZOMBIE] = 0;
	DIVE_TIME		 		[GIL_SUMMONEDZOMBIE] = 0;
	WATER_DEPTH_KNEE 		[GIL_SUMMONEDZOMBIE] = 90;
	WATER_DEPTH_CHEST		[GIL_SUMMONEDZOMBIE] = 150;

	STEP_HEIGHT		 		[GIL_SUMMONEDZOMBIE] = 60;
	JUMPLOW_HEIGHT	 		[GIL_SUMMONEDZOMBIE] = 200;

	SLIDE_ANGLE		 		[GIL_SUMMONEDZOMBIE] = 50;
	TURN_SPEED				[GIL_SUMMONEDZOMBIE] = 240;

	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_SUMMONEDZOMBIE] = 50;
	CLIMB_HORIZ_ANGLE		[GIL_SUMMONEDZOMBIE] = 50;
	CLIMB_GROUND_ANGLE  	[GIL_SUMMONEDZOMBIE] = 50;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SUMMONEDZOMBIE] = 9999;
	FALLDOWN_DAMAGE			[GIL_SUMMONEDZOMBIE] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_SUMMONEDZOMBIE] = 60;
	FIGHT_RANGE_FIST		[GIL_SUMMONEDZOMBIE] = 50;
	FIGHT_RANGE_G			[GIL_SUMMONEDZOMBIE] = 300;

	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_SUMMONEDZOMBIE] = "BFX_Zombie";
	BLOOD_TEXTURE			[GIL_SUMMONEDZOMBIE] = "BQM_Zombie.tga";
	BLOOD_FLOW				[GIL_SUMMONEDZOMBIE] = 0;
	BLOOD_AMOUNT			[GIL_SUMMONEDZOMBIE] = 10;
	BLOOD_MAX_DISTANCE		[GIL_SUMMONEDZOMBIE] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SNAPPER (Aich: Dragonsnapper)

	SWIM_TIME				[GIL_SNAPPER] = TIME_INFINITE;
	DIVE_TIME				[GIL_SNAPPER] = TIME_INFINITE;
	WATER_DEPTH_KNEE 		[GIL_SNAPPER] = 50;
	WATER_DEPTH_CHEST		[GIL_SNAPPER] = 120;

	STEP_HEIGHT		 		[GIL_SNAPPER] = 60;
	JUMPLOW_HEIGHT	 		[GIL_SNAPPER] = 300;
//	JUMPMID_HEIGHT 			[GIL_SNAPPER] = 200;
//	JUMPUP_HEIGHT 			[GIL_SNAPPER] = 200;

	SLIDE_ANGLE		 		[GIL_SNAPPER] = 50;
	DISABLE_AUTOROLL 		[GIL_SNAPPER] = 1;
	SURFACE_ALIGN	 		[GIL_SNAPPER] = 1;
	TURN_SPEED				[GIL_SNAPPER] = 240;
	
	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SNAPPER] = 400;
	FALLDOWN_DAMAGE			[GIL_SNAPPER] = 10;

	// Kampf

	FIGHT_RANGE_BASE		[GIL_SNAPPER] = 100;
	FIGHT_RANGE_FIST		[GIL_SNAPPER] = 150;
	FIGHT_RANGE_G			[GIL_SNAPPER] = 150;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_SNAPPER] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_SNAPPER] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_SNAPPER] = 1;
	BLOOD_AMOUNT			[GIL_SNAPPER] = 10;
	BLOOD_MAX_DISTANCE		[GIL_SNAPPER] = 100;
	
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SHADOWBEAST - AUCH Shadowbeast-Skelett (s.u.) beachten!

	SWIM_TIME		 		[GIL_SHADOWBEAST] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_SHADOWBEAST] = 0;
	WATER_DEPTH_KNEE 		[GIL_SHADOWBEAST] = 50;
	WATER_DEPTH_CHEST		[GIL_SHADOWBEAST] = 120;

	STEP_HEIGHT		 		[GIL_SHADOWBEAST] = 60;
	JUMPLOW_HEIGHT	 		[GIL_SHADOWBEAST] = 150;
	JUMPMID_HEIGHT 			[GIL_SHADOWBEAST] = 300;

	SLIDE_ANGLE		 		[GIL_SHADOWBEAST] = 50;
	DISABLE_AUTOROLL 		[GIL_SHADOWBEAST] = 1;
	SURFACE_ALIGN	 		[GIL_SHADOWBEAST] = 2;
	TURN_SPEED				[GIL_SHADOWBEAST] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SHADOWBEAST] = 600;
	FALLDOWN_DAMAGE			[GIL_SHADOWBEAST] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_SHADOWBEAST] = 150;
	FIGHT_RANGE_FIST		[GIL_SHADOWBEAST] = 200;
	FIGHT_RANGE_G			[GIL_SHADOWBEAST] = 200;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SHADOWBEAST SKELETT

	SWIM_TIME		 		[GIL_SHADOWBEAST_SKELETON] = SWIM_TIME		 		[GIL_SHADOWBEAST];
	DIVE_TIME		 		[GIL_SHADOWBEAST_SKELETON] = DIVE_TIME		 		[GIL_SHADOWBEAST];
	WATER_DEPTH_KNEE 		[GIL_SHADOWBEAST_SKELETON] = WATER_DEPTH_KNEE 		[GIL_SHADOWBEAST];
	WATER_DEPTH_CHEST		[GIL_SHADOWBEAST_SKELETON] = WATER_DEPTH_CHEST		[GIL_SHADOWBEAST];
                                                                                                  
	STEP_HEIGHT		 		[GIL_SHADOWBEAST_SKELETON] = STEP_HEIGHT		 	[GIL_SHADOWBEAST];
	JUMPLOW_HEIGHT	 		[GIL_SHADOWBEAST_SKELETON] = JUMPLOW_HEIGHT	 		[GIL_SHADOWBEAST];
	JUMPMID_HEIGHT 			[GIL_SHADOWBEAST_SKELETON] = JUMPMID_HEIGHT 		[GIL_SHADOWBEAST];
                                                                                                  
	SLIDE_ANGLE		 		[GIL_SHADOWBEAST_SKELETON] = SLIDE_ANGLE		 	[GIL_SHADOWBEAST];
	DISABLE_AUTOROLL 		[GIL_SHADOWBEAST_SKELETON] = DISABLE_AUTOROLL 		[GIL_SHADOWBEAST];
	SURFACE_ALIGN	 		[GIL_SHADOWBEAST_SKELETON] = SURFACE_ALIGN	 		[GIL_SHADOWBEAST];
	TURN_SPEED				[GIL_SHADOWBEAST_SKELETON] = TURN_SPEED				[GIL_SHADOWBEAST];
                                                                                                  
	// Fallhöhe / Fallschaden                            // Fallhöhe / Fallschaden                
	FALLDOWN_HEIGHT			[GIL_SHADOWBEAST_SKELETON] = FALLDOWN_HEIGHT		[GIL_SHADOWBEAST];
	FALLDOWN_DAMAGE			[GIL_SHADOWBEAST_SKELETON] = FALLDOWN_DAMAGE		[GIL_SHADOWBEAST];
                                                                                                  
	// Kampf                                             // Kampf                                 
	FIGHT_RANGE_BASE		[GIL_SHADOWBEAST_SKELETON] = FIGHT_RANGE_BASE		[GIL_SHADOWBEAST];
	FIGHT_RANGE_FIST		[GIL_SHADOWBEAST_SKELETON] = FIGHT_RANGE_FIST		[GIL_SHADOWBEAST];
	FIGHT_RANGE_G			[GIL_SHADOWBEAST_SKELETON] = FIGHT_RANGE_G			[GIL_SHADOWBEAST];

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// HARPIE (MH: Werte erstmal vom Demon geklaut)

	SWIM_TIME		 		[GIL_HARPY] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_HARPY] = 0;

// .Der Wert "999999" für fiegende Monster führt dazu, dass Wasserpolys wie statische Polys behandelt werden
//	auch auf diesen "laufen" und niemals ins Schwimmen/Tauchen kommen können.
	WATER_DEPTH_KNEE 		[GIL_HARPY] = 999999;
	WATER_DEPTH_CHEST		[GIL_HARPY] = 999999;

	STEP_HEIGHT		 		[GIL_HARPY] = 150;
	JUMPLOW_HEIGHT 			[GIL_HARPY] = 800;

	SLIDE_ANGLE		 		[GIL_HARPY] = 50;
	DISABLE_AUTOROLL 		[GIL_HARPY] = 0;
	SURFACE_ALIGN	 		[GIL_HARPY] = 0;
	TURN_SPEED				[GIL_HARPY] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_HARPY] = 9999;
	FALLDOWN_DAMAGE			[GIL_HARPY] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_HARPY] = 100;
	FIGHT_RANGE_FIST		[GIL_HARPY] = 140;
	FIGHT_RANGE_G			[GIL_HARPY] = 200;

	//Blut
	BLOOD_EMITTER			[GIL_HARPY] = "BFX_Demon";
	BLOOD_TEXTURE			[GIL_HARPY] = "BQM_Scavenger2.tga";
	BLOOD_FLOW				[GIL_HARPY] = 0;
	BLOOD_AMOUNT			[GIL_HARPY] = 10;
	BLOOD_MAX_DISTANCE		[GIL_HARPY] = 200;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// STONEGOLEM - AUCH andere Golems (s.u.) beachten!
//			
	SWIM_TIME		 		[GIL_STONEGOLEM] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_STONEGOLEM] = 0;
	WATER_DEPTH_KNEE 		[GIL_STONEGOLEM] = 50000;
	WATER_DEPTH_CHEST		[GIL_STONEGOLEM] = 51000;

	SLIDE_ANGLE		 		[GIL_STONEGOLEM] = 50;
	DISABLE_AUTOROLL 		[GIL_STONEGOLEM] = 1;
	SURFACE_ALIGN	 		[GIL_STONEGOLEM] = 0;
	TURN_SPEED				[GIL_STONEGOLEM] = 120;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_STONEGOLEM] = 9999;
	FALLDOWN_DAMAGE			[GIL_STONEGOLEM] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_STONEGOLEM] = 100;
	FIGHT_RANGE_FIST		[GIL_STONEGOLEM] = 120;
	FIGHT_RANGE_G			[GIL_STONEGOLEM] = 120;

	//Blut
	BLOOD_EMITTER			[GIL_STONEGOLEM] = "BFX_Golem";
	BLOOD_TEXTURE			[GIL_STONEGOLEM] = "BQM_Golem.tga";
	BLOOD_FLOW				[GIL_STONEGOLEM] = 0;
	BLOOD_AMOUNT			[GIL_STONEGOLEM] = 5;
	BLOOD_MAX_DISTANCE		[GIL_STONEGOLEM] = 60;
	
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// FIREGOLEM
//			
	SWIM_TIME		 		[GIL_FIREGOLEM] = SWIM_TIME		 		[GIL_STONEGOLEM];
	DIVE_TIME		 		[GIL_FIREGOLEM] = DIVE_TIME		 		[GIL_STONEGOLEM];
	WATER_DEPTH_KNEE 		[GIL_FIREGOLEM] = WATER_DEPTH_KNEE 		[GIL_STONEGOLEM];
	WATER_DEPTH_CHEST		[GIL_FIREGOLEM] = WATER_DEPTH_CHEST		[GIL_STONEGOLEM];
                                                                                      
	SLIDE_ANGLE		 		[GIL_FIREGOLEM] = SLIDE_ANGLE		 	[GIL_STONEGOLEM];
	DISABLE_AUTOROLL 		[GIL_FIREGOLEM] = DISABLE_AUTOROLL 		[GIL_STONEGOLEM];
	SURFACE_ALIGN	 		[GIL_FIREGOLEM] = SURFACE_ALIGN	 		[GIL_STONEGOLEM];
	TURN_SPEED				[GIL_FIREGOLEM] = TURN_SPEED			[GIL_STONEGOLEM];
                                                                                      
	// Fallhöhe / Fallschaden                 // Fallhöhe / Fallschaden               
	FALLDOWN_HEIGHT			[GIL_FIREGOLEM] = FALLDOWN_HEIGHT		[GIL_STONEGOLEM];
	FALLDOWN_DAMAGE			[GIL_FIREGOLEM] = FALLDOWN_DAMAGE		[GIL_STONEGOLEM];
                                                                                      
	// Kampf                                  // Kampf                                
	FIGHT_RANGE_BASE		[GIL_FIREGOLEM] = FIGHT_RANGE_BASE		[GIL_STONEGOLEM];
	FIGHT_RANGE_FIST		[GIL_FIREGOLEM] = FIGHT_RANGE_FIST		[GIL_STONEGOLEM];
	FIGHT_RANGE_G			[GIL_FIREGOLEM] = FIGHT_RANGE_G			[GIL_STONEGOLEM];
                                                                                      
	//Blut                                    //Blut                                  
	BLOOD_EMITTER			[GIL_FIREGOLEM] = "BFX_Golem";    
	BLOOD_TEXTURE			[GIL_FIREGOLEM] = "BQM_Golem.tga";
	BLOOD_FLOW				[GIL_FIREGOLEM] = BLOOD_FLOW			[GIL_STONEGOLEM];
	BLOOD_AMOUNT			[GIL_FIREGOLEM] = BLOOD_AMOUNT			[GIL_STONEGOLEM];
	BLOOD_MAX_DISTANCE		[GIL_FIREGOLEM] = BLOOD_MAX_DISTANCE	[GIL_STONEGOLEM];

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ICEGOLEM
//			
	SWIM_TIME		 		[GIL_ICEGOLEM] = SWIM_TIME		 		[GIL_STONEGOLEM];
	DIVE_TIME		 		[GIL_ICEGOLEM] = DIVE_TIME		 		[GIL_STONEGOLEM];
	WATER_DEPTH_KNEE 		[GIL_ICEGOLEM] = WATER_DEPTH_KNEE 		[GIL_STONEGOLEM];
	WATER_DEPTH_CHEST		[GIL_ICEGOLEM] = WATER_DEPTH_CHEST		[GIL_STONEGOLEM];
                                                                                      
	SLIDE_ANGLE		 		[GIL_ICEGOLEM] = SLIDE_ANGLE		 	[GIL_STONEGOLEM];    
	DISABLE_AUTOROLL 		[GIL_ICEGOLEM] = DISABLE_AUTOROLL 		[GIL_STONEGOLEM];
	SURFACE_ALIGN	 		[GIL_ICEGOLEM] = SURFACE_ALIGN	 		[GIL_STONEGOLEM];
	TURN_SPEED				[GIL_ICEGOLEM] = TURN_SPEED				[GIL_STONEGOLEM];    
                                                                                      
	// Fallhöhe / Fallschaden                // Fallhöhe / Fallschaden                
	FALLDOWN_HEIGHT			[GIL_ICEGOLEM] = FALLDOWN_HEIGHT		[GIL_STONEGOLEM];    
	FALLDOWN_DAMAGE			[GIL_ICEGOLEM] = FALLDOWN_DAMAGE		[GIL_STONEGOLEM];    
                                                                                      
	// Kampf                                 // Kampf                                 
	FIGHT_RANGE_BASE		[GIL_ICEGOLEM] = FIGHT_RANGE_BASE		[GIL_STONEGOLEM];
	FIGHT_RANGE_FIST		[GIL_ICEGOLEM] = FIGHT_RANGE_FIST		[GIL_STONEGOLEM];
	FIGHT_RANGE_G			[GIL_ICEGOLEM] = FIGHT_RANGE_G			[GIL_STONEGOLEM];
                                                                                      
	//Blut                                   //Blut                                   
	BLOOD_EMITTER			[GIL_ICEGOLEM] = "BFX_Golem";    
	BLOOD_TEXTURE			[GIL_ICEGOLEM] = "BQM_Golem.tga";
	BLOOD_FLOW				[GIL_ICEGOLEM] = BLOOD_FLOW				[GIL_STONEGOLEM];    
	BLOOD_AMOUNT			[GIL_ICEGOLEM] = BLOOD_AMOUNT			[GIL_STONEGOLEM];
	BLOOD_MAX_DISTANCE		[GIL_ICEGOLEM] = BLOOD_MAX_DISTANCE		[GIL_STONEGOLEM];    

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SUMMONED GOLEM

	SWIM_TIME		 		[GIL_SUMMONED_GOLEM] = SWIM_TIME		 	[GIL_STONEGOLEM];
	DIVE_TIME		 		[GIL_SUMMONED_GOLEM] = DIVE_TIME		 	[GIL_STONEGOLEM];
	WATER_DEPTH_KNEE 		[GIL_SUMMONED_GOLEM] = WATER_DEPTH_KNEE 	[GIL_STONEGOLEM];
	WATER_DEPTH_CHEST		[GIL_SUMMONED_GOLEM] = WATER_DEPTH_CHEST	[GIL_STONEGOLEM];
                                                                                            
	SLIDE_ANGLE		 		[GIL_SUMMONED_GOLEM] = SLIDE_ANGLE		 	[GIL_STONEGOLEM];    
	DISABLE_AUTOROLL 		[GIL_SUMMONED_GOLEM] = DISABLE_AUTOROLL 	[GIL_STONEGOLEM];
	SURFACE_ALIGN	 		[GIL_SUMMONED_GOLEM] = SURFACE_ALIGN	 	[GIL_STONEGOLEM];
	TURN_SPEED				[GIL_SUMMONED_GOLEM] = TURN_SPEED			[GIL_STONEGOLEM];    
                                                                                            
	// Fallhöhe / Fallschaden                      // Fallhöhe / Fallschaden                
	FALLDOWN_HEIGHT			[GIL_SUMMONED_GOLEM] = FALLDOWN_HEIGHT		[GIL_STONEGOLEM];    
	FALLDOWN_DAMAGE			[GIL_SUMMONED_GOLEM] = FALLDOWN_DAMAGE		[GIL_STONEGOLEM];    
                                                                                            
	// Kampf                                       // Kampf                                 
	FIGHT_RANGE_BASE		[GIL_SUMMONED_GOLEM] = FIGHT_RANGE_BASE		[GIL_STONEGOLEM];
	FIGHT_RANGE_FIST		[GIL_SUMMONED_GOLEM] = FIGHT_RANGE_FIST		[GIL_STONEGOLEM];
    FIGHT_RANGE_G			[GIL_SUMMONED_GOLEM] = FIGHT_RANGE_G		[GIL_STONEGOLEM];
                                                                                            
	//Blut                                         //Blut                                   
	BLOOD_EMITTER			[GIL_SUMMONED_GOLEM] = "BFX_Golem";    
	BLOOD_TEXTURE			[GIL_SUMMONED_GOLEM] = "BQM_Golem.tga";
	BLOOD_FLOW				[GIL_SUMMONED_GOLEM] = BLOOD_FLOW			[GIL_STONEGOLEM];    
	BLOOD_AMOUNT			[GIL_SUMMONED_GOLEM] = BLOOD_AMOUNT			[GIL_STONEGOLEM];
	BLOOD_MAX_DISTANCE		[GIL_SUMMONED_GOLEM] = BLOOD_MAX_DISTANCE	[GIL_STONEGOLEM];    

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// DEMON (Demon und Demon Lord) - AUCH SUMMONED Demon (s.u.) beachten!

	SWIM_TIME		 		[GIL_DEMON] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_DEMON] = 0;

// .Der Wert "999999" für fiegende Monster führt dazu, dass Wasserpolys wie statische Polys behandelt werden
//	auch auf diesen "laufen" und niemals ins Schwimmen/Tauchen kommen können.
	WATER_DEPTH_KNEE 		[GIL_DEMON] = 999999;
	WATER_DEPTH_CHEST		[GIL_DEMON] = 999999;

	STEP_HEIGHT		 		[GIL_DEMON] = 150;
	JUMPLOW_HEIGHT 			[GIL_DEMON] = 800;

	SLIDE_ANGLE		 		[GIL_DEMON] = 50;
	DISABLE_AUTOROLL 		[GIL_DEMON] = 0;
	SURFACE_ALIGN	 		[GIL_DEMON] = 0;
	TURN_SPEED				[GIL_DEMON] = 240;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_DEMON] = 9999;
	FALLDOWN_DAMAGE			[GIL_DEMON] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_DEMON] = 120;
	FIGHT_RANGE_FIST		[GIL_DEMON] = 120;
	FIGHT_RANGE_G			[GIL_DEMON] = 100;

	//Blut
	BLOOD_EMITTER			[GIL_DEMON] = "BFX_Demon";         
	BLOOD_TEXTURE			[GIL_DEMON] = "BQM_Scavenger2.tga";                     
	BLOOD_FLOW				[GIL_DEMON] = 0;                
	BLOOD_AMOUNT			[GIL_DEMON] = 10;
	BLOOD_MAX_DISTANCE		[GIL_DEMON] = 200;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SUMMONED DEMON

	SWIM_TIME		 		[GIL_SUMMONED_DEMON] = SWIM_TIME		 	[GIL_DEMON];
	DIVE_TIME		 		[GIL_SUMMONED_DEMON] = DIVE_TIME		 	[GIL_DEMON];
                                                                                     
	WATER_DEPTH_KNEE 		[GIL_SUMMONED_DEMON] = WATER_DEPTH_KNEE 	[GIL_DEMON];
	WATER_DEPTH_CHEST		[GIL_SUMMONED_DEMON] = WATER_DEPTH_CHEST	[GIL_DEMON];
                                                                                      
	STEP_HEIGHT		 		[GIL_SUMMONED_DEMON] = STEP_HEIGHT		 	[GIL_DEMON];
	JUMPLOW_HEIGHT 			[GIL_SUMMONED_DEMON] = JUMPLOW_HEIGHT 		[GIL_DEMON];
                                                                                      
	SLIDE_ANGLE		 		[GIL_SUMMONED_DEMON] = SLIDE_ANGLE		 	[GIL_DEMON];
	DISABLE_AUTOROLL 		[GIL_SUMMONED_DEMON] = DISABLE_AUTOROLL 	[GIL_DEMON];
	SURFACE_ALIGN	 		[GIL_SUMMONED_DEMON] = SURFACE_ALIGN	 	[GIL_DEMON];
	TURN_SPEED				[GIL_SUMMONED_DEMON] = TURN_SPEED			[GIL_DEMON];
                                                                                      
	// Fallhöhe / Fallschaden                      // Fallhöhe / Fallschaden          
	FALLDOWN_HEIGHT			[GIL_SUMMONED_DEMON] = FALLDOWN_HEIGHT		[GIL_DEMON];
	FALLDOWN_DAMAGE			[GIL_SUMMONED_DEMON] = FALLDOWN_DAMAGE		[GIL_DEMON];
                                                                                      
	// Kampf                                       // Kampf                           
	FIGHT_RANGE_BASE		[GIL_SUMMONED_DEMON] = FIGHT_RANGE_BASE		[GIL_DEMON];
	FIGHT_RANGE_FIST		[GIL_SUMMONED_DEMON] = FIGHT_RANGE_FIST		[GIL_DEMON];
	FIGHT_RANGE_G			[GIL_SUMMONED_DEMON] = FIGHT_RANGE_G		[GIL_DEMON];
                                                                                      
	//Blut                                         //Blut                             
	BLOOD_EMITTER			[GIL_SUMMONED_DEMON] = "BFX_Demon";          
	BLOOD_TEXTURE			[GIL_SUMMONED_DEMON] = "BQM_Scavenger2.tga"; 
	BLOOD_FLOW				[GIL_SUMMONED_DEMON] = BLOOD_FLOW			[GIL_DEMON];
	BLOOD_AMOUNT			[GIL_SUMMONED_DEMON] = BLOOD_AMOUNT			[GIL_DEMON];
	BLOOD_MAX_DISTANCE		[GIL_SUMMONED_DEMON] = BLOOD_MAX_DISTANCE	[GIL_DEMON];

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// TROLL (Troll und Schwarzer Troll) 

	SWIM_TIME				[GIL_TROLL] = 0;
	DIVE_TIME		 		[GIL_TROLL] = 0;
	WATER_DEPTH_KNEE 		[GIL_TROLL] = 100;
	WATER_DEPTH_CHEST		[GIL_TROLL] = 300;

	STEP_HEIGHT		 		[GIL_TROLL] = 100;
	SLIDE_ANGLE		 		[GIL_TROLL] = 50;

	DISABLE_AUTOROLL 		[GIL_TROLL] = 1;
	TURN_SPEED				[GIL_TROLL] = 60;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_TROLL] = 800;
	FALLDOWN_DAMAGE			[GIL_TROLL] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_TROLL] = 250;
	FIGHT_RANGE_FIST		[GIL_TROLL] = 250;
	FIGHT_RANGE_G			[GIL_TROLL] = 250;
	
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SWAMPSHARK

	SWIM_TIME				[GIL_SWAMPSHARK]	= TIME_INFINITE;
	DIVE_TIME				[GIL_SWAMPSHARK] 	= TIME_INFINITE;
	WATER_DEPTH_KNEE		[GIL_SWAMPSHARK] 	= 100000;
	WATER_DEPTH_CHEST		[GIL_SWAMPSHARK] 	= 100005;

	STEP_HEIGHT		 		[GIL_SWAMPSHARK] 	= 100;
	SLIDE_ANGLE				[GIL_SWAMPSHARK] 	= 50;

	DISABLE_AUTOROLL		[GIL_SWAMPSHARK]	= 1;

// SURFACE_ALIGN 2 ist WICHTIG damit der Swampshark nich an jeder Kante hängenbleibt!
	SURFACE_ALIGN			[GIL_SWAMPSHARK]	= 2;
	TURN_SPEED				[GIL_SWAMPSHARK] 	= 80;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SWAMPSHARK] = 500;
	FALLDOWN_DAMAGE			[GIL_SWAMPSHARK] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_SWAMPSHARK] = 200;
	FIGHT_RANGE_FIST		[GIL_SWAMPSHARK] = 200;
	FIGHT_RANGE_G			[GIL_SWAMPSHARK] = 200;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// DRACHE (Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache)

	SWIM_TIME				[GIL_DRAGON] = 0;
	DIVE_TIME		 		[GIL_DRAGON] = 0;
	WATER_DEPTH_KNEE 		[GIL_DRAGON] = 100;
	WATER_DEPTH_CHEST		[GIL_DRAGON] = 300;

	STEP_HEIGHT		 		[GIL_DRAGON] = 200; //sonst "fällt" der Drache in manchen Drehungsframes (geht in FallDown)
	SLIDE_ANGLE		 		[GIL_DRAGON] = 50;

	DISABLE_AUTOROLL 		[GIL_DRAGON] = 1;
	TURN_SPEED				[GIL_DRAGON] = 120;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_DRAGON] = 9999;
	FALLDOWN_DAMAGE			[GIL_DRAGON] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_DRAGON] = 250;
	FIGHT_RANGE_FIST		[GIL_DRAGON] = 250; //W = Base + Fist = 600 //Schiebefaktor NICHT 450 (*0.75) sondern Kürzer!!!
	FIGHT_RANGE_G			[GIL_DRAGON] = 400; //G = W + G = 900
	
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Molerat

	SWIM_TIME				[GIL_MOLERAT] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_MOLERAT] = 0;
	WATER_DEPTH_KNEE 		[GIL_MOLERAT] = 25;
	WATER_DEPTH_CHEST		[GIL_MOLERAT] = 50;

	STEP_HEIGHT		 		[GIL_MOLERAT] = 50;
	JUMPLOW_HEIGHT 			[GIL_MOLERAT] = 105;
	JUMPMID_HEIGHT 			[GIL_MOLERAT] = 200;
	
	SLIDE_ANGLE		 		[GIL_MOLERAT] = 50;
	DISABLE_AUTOROLL 		[GIL_MOLERAT] = 1;
	SURFACE_ALIGN	 		[GIL_MOLERAT] = 1;
	TURN_SPEED				[GIL_MOLERAT] = 120;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_MOLERAT] = 400;
	FALLDOWN_DAMAGE			[GIL_MOLERAT] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_MOLERAT] = 130;
	FIGHT_RANGE_FIST		[GIL_MOLERAT] = 95;
	FIGHT_RANGE_G			[GIL_MOLERAT] = 200;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_MOLERAT] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_MOLERAT] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_MOLERAT] = 1;
	BLOOD_AMOUNT			[GIL_MOLERAT] = 10;
	BLOOD_MAX_DISTANCE		[GIL_MOLERAT] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ORC (Orc-Warrior, Orc-Shaman, Orc-Elite) - AUCH FRIENDLY Orc und UNDEAD Orc beachten!

	SWIM_TIME		 		[GIL_ORC] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_ORC] = 30;
	WATER_DEPTH_KNEE 		[GIL_ORC] = 120;
	WATER_DEPTH_CHEST		[GIL_ORC] = 170;

	STEP_HEIGHT		 		[GIL_ORC] = 65;
	JUMPLOW_HEIGHT	 		[GIL_ORC] = 105;
	JUMPMID_HEIGHT	 		[GIL_ORC] = 205;
	JUMPUP_HEIGHT 			[GIL_ORC] = 300;

	SLIDE_ANGLE		 		[GIL_ORC] = 50;
	TURN_SPEED				[GIL_ORC] = 240;

	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_ORC] = 50; 
	CLIMB_HORIZ_ANGLE		[GIL_ORC] = 50; 
	CLIMB_GROUND_ANGLE  	[GIL_ORC] = 50; 

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_ORC] = 600;
	FALLDOWN_DAMAGE			[GIL_ORC] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_ORC] = 60;
	FIGHT_RANGE_FIST		[GIL_ORC] = 80; 
	FIGHT_RANGE_G			[GIL_ORC] = 100; 

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// FRIENDLY ORC

	SWIM_TIME		 		[GIL_FRIENDLY_ORC] = SWIM_TIME		 		[GIL_ORC];
	DIVE_TIME		 		[GIL_FRIENDLY_ORC] = DIVE_TIME		 		[GIL_ORC];
	WATER_DEPTH_KNEE 		[GIL_FRIENDLY_ORC] = WATER_DEPTH_KNEE 		[GIL_ORC];
	WATER_DEPTH_CHEST		[GIL_FRIENDLY_ORC] = WATER_DEPTH_CHEST		[GIL_ORC];
                                                                                  
	STEP_HEIGHT		 		[GIL_FRIENDLY_ORC] = STEP_HEIGHT		 	[GIL_ORC];
	JUMPLOW_HEIGHT	 		[GIL_FRIENDLY_ORC] = JUMPLOW_HEIGHT	 		[GIL_ORC];
	JUMPMID_HEIGHT	 		[GIL_FRIENDLY_ORC] = JUMPMID_HEIGHT	 		[GIL_ORC];
	JUMPUP_HEIGHT 			[GIL_FRIENDLY_ORC] = JUMPUP_HEIGHT 			[GIL_ORC];
                                                                                  
	SLIDE_ANGLE		 		[GIL_FRIENDLY_ORC] = SLIDE_ANGLE		 	[GIL_ORC];
	TURN_SPEED				[GIL_FRIENDLY_ORC] = TURN_SPEED				[GIL_ORC];
                                                                                  
	// Kletterkanten - Winkel                    // Kletterkanten - Winkel        
	CLIMB_HEADING_ANGLE		[GIL_FRIENDLY_ORC] = CLIMB_HEADING_ANGLE	[GIL_ORC];
	CLIMB_HORIZ_ANGLE		[GIL_FRIENDLY_ORC] = CLIMB_HORIZ_ANGLE		[GIL_ORC];
	CLIMB_GROUND_ANGLE  	[GIL_FRIENDLY_ORC] = CLIMB_GROUND_ANGLE  	[GIL_ORC];
                                                                                  
	// Fallhöhe / Fallschaden                    // Fallhöhe / Fallschaden        
	FALLDOWN_HEIGHT			[GIL_FRIENDLY_ORC] = FALLDOWN_HEIGHT		[GIL_ORC];
	FALLDOWN_DAMAGE			[GIL_FRIENDLY_ORC] = FALLDOWN_DAMAGE		[GIL_ORC];
                                                                                  
	// Kampf                                     // Kampf                         
	FIGHT_RANGE_BASE		[GIL_FRIENDLY_ORC] = FIGHT_RANGE_BASE		[GIL_ORC];
	FIGHT_RANGE_FIST		[GIL_FRIENDLY_ORC] = FIGHT_RANGE_FIST		[GIL_ORC];
	FIGHT_RANGE_G			[GIL_FRIENDLY_ORC] = FIGHT_RANGE_G			[GIL_ORC];

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// UNDEAD ORC

	SWIM_TIME		 		[GIL_UNDEADORC] = SWIM_TIME		 		[GIL_ORC];        
	DIVE_TIME		 		[GIL_UNDEADORC] = DIVE_TIME		 		[GIL_ORC];        
	WATER_DEPTH_KNEE 		[GIL_UNDEADORC] = WATER_DEPTH_KNEE 		[GIL_ORC];        
	WATER_DEPTH_CHEST		[GIL_UNDEADORC] = WATER_DEPTH_CHEST		[GIL_ORC];        
                                                                                    
	STEP_HEIGHT		 		[GIL_UNDEADORC] = STEP_HEIGHT		 	[GIL_ORC];    
	JUMPLOW_HEIGHT	 		[GIL_UNDEADORC] = JUMPLOW_HEIGHT	 	[GIL_ORC];
	JUMPMID_HEIGHT	 		[GIL_UNDEADORC] = JUMPMID_HEIGHT	 	[GIL_ORC];
	JUMPUP_HEIGHT 			[GIL_UNDEADORC] = JUMPUP_HEIGHT 		[GIL_ORC];
                                                                                    
	SLIDE_ANGLE		 		[GIL_UNDEADORC] = SLIDE_ANGLE		 	[GIL_ORC];    
	TURN_SPEED				[GIL_UNDEADORC] = TURN_SPEED			[GIL_ORC];
	                                                                                
	// Kletterkanten - Winkel                 // Kletterkanten - Winkel             
	CLIMB_HEADING_ANGLE		[GIL_UNDEADORC] = CLIMB_HEADING_ANGLE	[GIL_ORC];    
	CLIMB_HORIZ_ANGLE		[GIL_UNDEADORC] = CLIMB_HORIZ_ANGLE		[GIL_ORC];        
	CLIMB_GROUND_ANGLE  	[GIL_UNDEADORC] = CLIMB_GROUND_ANGLE  	[GIL_ORC];        
                                                                                    
	// Fallhöhe / Fallschaden                 // Fallhöhe / Fallschaden             
	FALLDOWN_HEIGHT			[GIL_UNDEADORC] = FALLDOWN_HEIGHT		[GIL_ORC];     
	FALLDOWN_DAMAGE			[GIL_UNDEADORC] = FALLDOWN_DAMAGE		[GIL_ORC];    
                                                                                    
	// Kampf                                  // Kampf                              
	FIGHT_RANGE_BASE		[GIL_UNDEADORC] = FIGHT_RANGE_BASE		[GIL_ORC];        
	FIGHT_RANGE_FIST		[GIL_UNDEADORC] = FIGHT_RANGE_FIST		[GIL_ORC];   
	FIGHT_RANGE_G			[GIL_UNDEADORC] = FIGHT_RANGE_G			[GIL_ORC];     

	//Blut
	BLOOD_DISABLED			[GIL_UNDEADORC] = 1;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// DRAKONIER (MH: Werte erstmal vom Orc geklaut)

	SWIM_TIME		 		[GIL_DRACONIAN] = SWIM_TIME		 		[GIL_ORC];        
	DIVE_TIME		 		[GIL_DRACONIAN] = DIVE_TIME		 		[GIL_ORC];        
	WATER_DEPTH_KNEE 		[GIL_DRACONIAN] = WATER_DEPTH_KNEE 		[GIL_ORC];        
	WATER_DEPTH_CHEST		[GIL_DRACONIAN] = WATER_DEPTH_CHEST		[GIL_ORC];        
                                                                                     
	STEP_HEIGHT		 		[GIL_DRACONIAN] = STEP_HEIGHT		 	[GIL_ORC];    
	JUMPLOW_HEIGHT	 		[GIL_DRACONIAN] = JUMPLOW_HEIGHT	 	[GIL_ORC];
	JUMPMID_HEIGHT	 		[GIL_DRACONIAN] = JUMPMID_HEIGHT	 	[GIL_ORC];
	JUMPUP_HEIGHT 			[GIL_DRACONIAN] = JUMPUP_HEIGHT 		[GIL_ORC];
                                                                                     
	SLIDE_ANGLE		 		[GIL_DRACONIAN] = SLIDE_ANGLE		 	[GIL_ORC];    
	TURN_SPEED				[GIL_DRACONIAN] = TURN_SPEED			[GIL_ORC];
                                                                                     
	// Kletterkanten - Winkel                 // Kletterkanten - Winkel              
	CLIMB_HEADING_ANGLE		[GIL_DRACONIAN] = CLIMB_HEADING_ANGLE	[GIL_ORC];    
	CLIMB_HORIZ_ANGLE		[GIL_DRACONIAN] = CLIMB_HORIZ_ANGLE		[GIL_ORC];        
	CLIMB_GROUND_ANGLE  	[GIL_DRACONIAN] = CLIMB_GROUND_ANGLE  	[GIL_ORC];        
                                                                                     
	// Fallhöhe / Fallschaden                 // Fallhöhe / Fallschaden              
	FALLDOWN_HEIGHT			[GIL_DRACONIAN] = FALLDOWN_HEIGHT		[GIL_ORC];     
	FALLDOWN_DAMAGE			[GIL_DRACONIAN] = FALLDOWN_DAMAGE		[GIL_ORC];    
                                                                                     
	// Kampf                                  // Kampf                               
	FIGHT_RANGE_BASE		[GIL_DRACONIAN] = FIGHT_RANGE_BASE		[GIL_ORC];        
	FIGHT_RANGE_FIST		[GIL_DRACONIAN] = FIGHT_RANGE_FIST		[GIL_ORC];       
	FIGHT_RANGE_G			[GIL_DRACONIAN] = FIGHT_RANGE_G			[GIL_ORC]; 


//*********************************************************
//		Addon
//*********************************************************

// Alligtor

	SWIM_TIME		 		[GIL_ALLIGATOR] = SWIM_TIME		 		[GIL_WARAN];        
	DIVE_TIME		 		[GIL_ALLIGATOR] = DIVE_TIME		 		[GIL_WARAN];        
	WATER_DEPTH_KNEE 		[GIL_ALLIGATOR] = WATER_DEPTH_KNEE 		[GIL_WARAN];        
	WATER_DEPTH_CHEST		[GIL_ALLIGATOR] = WATER_DEPTH_CHEST		[GIL_WARAN];        
                                                                                     
	STEP_HEIGHT		 		[GIL_ALLIGATOR] = STEP_HEIGHT		 	[GIL_WARAN];    
	JUMPLOW_HEIGHT	 		[GIL_ALLIGATOR] = JUMPLOW_HEIGHT	 	[GIL_WARAN];
	JUMPMID_HEIGHT	 		[GIL_ALLIGATOR] = JUMPMID_HEIGHT	 	[GIL_WARAN];
	JUMPUP_HEIGHT 			[GIL_ALLIGATOR] = JUMPUP_HEIGHT 		[GIL_WARAN];
                                                                                     
	SLIDE_ANGLE		 		[GIL_ALLIGATOR] = SLIDE_ANGLE		 	[GIL_WARAN];    
	TURN_SPEED				[GIL_ALLIGATOR] = TURN_SPEED			[GIL_WARAN];
                                                                                     
	// Kletterkanten - Winkel                 // Kletterkanten - Winkel              
	CLIMB_HEADING_ANGLE		[GIL_ALLIGATOR] = CLIMB_HEADING_ANGLE	[GIL_WARAN];    
	CLIMB_HORIZ_ANGLE		[GIL_ALLIGATOR] = CLIMB_HORIZ_ANGLE		[GIL_WARAN];        
	CLIMB_GROUND_ANGLE  	[GIL_ALLIGATOR] = CLIMB_GROUND_ANGLE  	[GIL_WARAN];        
                                                                                     
	// Fallhöhe / Fallschaden                 // Fallhöhe / Fallschaden              
	FALLDOWN_HEIGHT			[GIL_ALLIGATOR] = FALLDOWN_HEIGHT		[GIL_WARAN];     
	FALLDOWN_DAMAGE			[GIL_ALLIGATOR] = FALLDOWN_DAMAGE		[GIL_WARAN];    
                                                                                     
	// Kampf                                  // Kampf                               
	FIGHT_RANGE_BASE		[GIL_ALLIGATOR] = FIGHT_RANGE_BASE		[GIL_WARAN];        
	FIGHT_RANGE_FIST		[GIL_ALLIGATOR] = FIGHT_RANGE_FIST		[GIL_WARAN];       
	FIGHT_RANGE_G			[GIL_ALLIGATOR] = FIGHT_RANGE_G			[GIL_WARAN]; 


// SwampGolem

	SWIM_TIME		 		[GIL_SWAMPGOLEM] = SWIM_TIME		 		[GIL_STONEGOLEM];        
	DIVE_TIME		 		[GIL_SWAMPGOLEM] = DIVE_TIME		 		[GIL_STONEGOLEM];        
	WATER_DEPTH_KNEE 		[GIL_SWAMPGOLEM] = WATER_DEPTH_KNEE 		[GIL_STONEGOLEM];        
	WATER_DEPTH_CHEST		[GIL_SWAMPGOLEM] = WATER_DEPTH_CHEST		[GIL_STONEGOLEM];        
                                                                                     
	STEP_HEIGHT		 		[GIL_SWAMPGOLEM] = STEP_HEIGHT		 	[GIL_STONEGOLEM];    
	JUMPLOW_HEIGHT	 		[GIL_SWAMPGOLEM] = JUMPLOW_HEIGHT	 	[GIL_STONEGOLEM];
	JUMPMID_HEIGHT	 		[GIL_SWAMPGOLEM] = JUMPMID_HEIGHT	 	[GIL_STONEGOLEM];
	JUMPUP_HEIGHT 			[GIL_SWAMPGOLEM] = JUMPUP_HEIGHT 		[GIL_STONEGOLEM];
                                                                                     
	SLIDE_ANGLE		 		[GIL_SWAMPGOLEM] = SLIDE_ANGLE		 	[GIL_STONEGOLEM];    
	TURN_SPEED				[GIL_SWAMPGOLEM] = TURN_SPEED			[GIL_STONEGOLEM];
                                                                                     
	// Kletterkanten - Winkel                 // Kletterkanten - Winkel              
	CLIMB_HEADING_ANGLE		[GIL_SWAMPGOLEM] = CLIMB_HEADING_ANGLE	[GIL_STONEGOLEM];    
	CLIMB_HORIZ_ANGLE		[GIL_SWAMPGOLEM] = CLIMB_HORIZ_ANGLE	[GIL_STONEGOLEM];        
	CLIMB_GROUND_ANGLE  	[GIL_SWAMPGOLEM] = CLIMB_GROUND_ANGLE  	[GIL_STONEGOLEM];        
                                                                                     
	// Fallhöhe / Fallschaden                 // Fallhöhe / Fallschaden              
	FALLDOWN_HEIGHT			[GIL_SWAMPGOLEM] = FALLDOWN_HEIGHT		[GIL_STONEGOLEM];     
	FALLDOWN_DAMAGE			[GIL_SWAMPGOLEM] = FALLDOWN_DAMAGE		[GIL_STONEGOLEM];    
                                                                                     
	// Kampf                                  // Kampf                               
	FIGHT_RANGE_BASE		[GIL_SWAMPGOLEM] = FIGHT_RANGE_BASE		[GIL_STONEGOLEM];        
	FIGHT_RANGE_FIST		[GIL_SWAMPGOLEM] = FIGHT_RANGE_FIST		[GIL_STONEGOLEM];       
	FIGHT_RANGE_G			[GIL_SWAMPGOLEM] = FIGHT_RANGE_G			[GIL_STONEGOLEM]; 

// Steinpuma

	SWIM_TIME		 		[GIL_GARGOYLE] = SWIM_TIME		 		[GIL_SHADOWBEAST];        
	DIVE_TIME		 		[GIL_GARGOYLE] = DIVE_TIME		 		[GIL_SHADOWBEAST];        
	WATER_DEPTH_KNEE 		[GIL_GARGOYLE] = WATER_DEPTH_KNEE 		[GIL_SHADOWBEAST];        
	WATER_DEPTH_CHEST		[GIL_GARGOYLE] = WATER_DEPTH_CHEST		[GIL_SHADOWBEAST];        
                                                                                     
	STEP_HEIGHT		 		[GIL_GARGOYLE] = STEP_HEIGHT		 	[GIL_SHADOWBEAST];    
	JUMPLOW_HEIGHT	 		[GIL_GARGOYLE] = JUMPLOW_HEIGHT	 	[GIL_SHADOWBEAST];
	JUMPMID_HEIGHT	 		[GIL_GARGOYLE] = JUMPMID_HEIGHT	 	[GIL_SHADOWBEAST];
	JUMPUP_HEIGHT 			[GIL_GARGOYLE] = JUMPUP_HEIGHT 		[GIL_SHADOWBEAST];
                                                                                     
	SLIDE_ANGLE		 		[GIL_GARGOYLE] = SLIDE_ANGLE		 	[GIL_SHADOWBEAST];    
	TURN_SPEED				[GIL_GARGOYLE] = TURN_SPEED			[GIL_SHADOWBEAST];
                                                                                     
	// Kletterkanten - Winkel                 // Kletterkanten - Winkel              
	CLIMB_HEADING_ANGLE		[GIL_GARGOYLE] = CLIMB_HEADING_ANGLE	[GIL_SHADOWBEAST];    
	CLIMB_HORIZ_ANGLE		[GIL_GARGOYLE] = CLIMB_HORIZ_ANGLE		[GIL_SHADOWBEAST];        
	CLIMB_GROUND_ANGLE  	[GIL_GARGOYLE] = CLIMB_GROUND_ANGLE  	[GIL_SHADOWBEAST];        
                                                                                     
	// Fallhöhe / Fallschaden                 // Fallhöhe / Fallschaden              
	FALLDOWN_HEIGHT			[GIL_GARGOYLE] = FALLDOWN_HEIGHT		[GIL_SHADOWBEAST];     
	FALLDOWN_DAMAGE			[GIL_GARGOYLE] = FALLDOWN_DAMAGE		[GIL_SHADOWBEAST];    
                                                                                     
	// Kampf                                  // Kampf                               
	FIGHT_RANGE_BASE		[GIL_GARGOYLE] = FIGHT_RANGE_BASE		[GIL_SHADOWBEAST];        
	FIGHT_RANGE_FIST		[GIL_GARGOYLE] = FIGHT_RANGE_FIST		[GIL_SHADOWBEAST];       
	FIGHT_RANGE_G			[GIL_GARGOYLE] = FIGHT_RANGE_G			[GIL_SHADOWBEAST]; 


// Steinwächter

	SWIM_TIME		 		[GIL_STONEGUARDIAN] = SWIM_TIME		 		[GIL_STONEGOLEM];        
	DIVE_TIME		 		[GIL_STONEGUARDIAN] = DIVE_TIME		 		[GIL_STONEGOLEM];        
	WATER_DEPTH_KNEE 		[GIL_STONEGUARDIAN] = WATER_DEPTH_KNEE 		[GIL_STONEGOLEM];        
	WATER_DEPTH_CHEST		[GIL_STONEGUARDIAN] = WATER_DEPTH_CHEST		[GIL_STONEGOLEM];        
                                                                                     
	STEP_HEIGHT		 		[GIL_STONEGUARDIAN] = STEP_HEIGHT		 	[GIL_HUMAN];    
	JUMPLOW_HEIGHT	 		[GIL_STONEGUARDIAN] = JUMPLOW_HEIGHT	 	[GIL_HUMAN];
	JUMPMID_HEIGHT	 		[GIL_STONEGUARDIAN] = JUMPMID_HEIGHT	 	[GIL_HUMAN];
	JUMPUP_HEIGHT 			[GIL_STONEGUARDIAN] = JUMPUP_HEIGHT 		[GIL_HUMAN];
                                                                                     
	SLIDE_ANGLE		 		[GIL_STONEGUARDIAN] = SLIDE_ANGLE		 	[GIL_HUMAN];    
	TURN_SPEED				[GIL_STONEGUARDIAN] = TURN_SPEED			[GIL_HUMAN];
                                                                                     
	// Kletterkanten - Winkel                 // Kletterkanten - Winkel              
	CLIMB_HEADING_ANGLE		[GIL_STONEGUARDIAN] = CLIMB_HEADING_ANGLE	[GIL_HUMAN];    
	CLIMB_HORIZ_ANGLE		[GIL_STONEGUARDIAN] = CLIMB_HORIZ_ANGLE		[GIL_HUMAN];        
	CLIMB_GROUND_ANGLE  	[GIL_STONEGUARDIAN] = CLIMB_GROUND_ANGLE  	[GIL_HUMAN];        
                                                                                     
	// Fallhöhe / Fallschaden                 // Fallhöhe / Fallschaden              
	FALLDOWN_HEIGHT			[GIL_STONEGUARDIAN] = FALLDOWN_HEIGHT		[GIL_HUMAN];     
	FALLDOWN_DAMAGE			[GIL_STONEGUARDIAN] = FALLDOWN_DAMAGE		[GIL_HUMAN];    
                                                                                     
	// Kampf                                  // Kampf                               
	FIGHT_RANGE_BASE		[GIL_STONEGUARDIAN] = FIGHT_RANGE_BASE		[GIL_HUMAN];        
	FIGHT_RANGE_FIST		[GIL_STONEGUARDIAN] = FIGHT_RANGE_FIST		[GIL_HUMAN];       
	FIGHT_RANGE_G			[GIL_STONEGUARDIAN] = FIGHT_RANGE_G			[GIL_HUMAN]; 
	
	BLOOD_EMITTER			[GIL_STONEGUARDIAN] = "BFX_Golem";
	BLOOD_TEXTURE			[GIL_STONEGUARDIAN] = "BQM_Golem.tga";
	BLOOD_FLOW				[GIL_STONEGUARDIAN] = 0;
	BLOOD_AMOUNT			[GIL_STONEGUARDIAN] = 5;
	BLOOD_MAX_DISTANCE		[GIL_STONEGUARDIAN] = 60; 
	
	// Steinwächter

	SWIM_TIME		 		[GIL_SUMMONEDGUARDIAN] = SWIM_TIME		 		[GIL_STONEGOLEM];        
	DIVE_TIME		 		[GIL_SUMMONEDGUARDIAN] = DIVE_TIME		 		[GIL_STONEGOLEM];        
	WATER_DEPTH_KNEE 		[GIL_SUMMONEDGUARDIAN] = WATER_DEPTH_KNEE 		[GIL_STONEGOLEM];        
	WATER_DEPTH_CHEST		[GIL_SUMMONEDGUARDIAN] = WATER_DEPTH_CHEST		[GIL_STONEGOLEM];        
                                                                                     
	STEP_HEIGHT		 		[GIL_SUMMONEDGUARDIAN] = STEP_HEIGHT		 	[GIL_HUMAN];    
	JUMPLOW_HEIGHT	 		[GIL_SUMMONEDGUARDIAN] = JUMPLOW_HEIGHT	 	[GIL_HUMAN];
	JUMPMID_HEIGHT	 		[GIL_SUMMONEDGUARDIAN] = JUMPMID_HEIGHT	 	[GIL_HUMAN];
	JUMPUP_HEIGHT 			[GIL_SUMMONEDGUARDIAN] = JUMPUP_HEIGHT 		[GIL_HUMAN];
                                                                                     
	SLIDE_ANGLE		 		[GIL_SUMMONEDGUARDIAN] = SLIDE_ANGLE		 	[GIL_HUMAN];    
	TURN_SPEED				[GIL_SUMMONEDGUARDIAN] = TURN_SPEED			[GIL_HUMAN];
                                                                                     
	// Kletterkanten - Winkel                 // Kletterkanten - Winkel              
	CLIMB_HEADING_ANGLE		[GIL_SUMMONEDGUARDIAN] = CLIMB_HEADING_ANGLE	[GIL_HUMAN];    
	CLIMB_HORIZ_ANGLE		[GIL_SUMMONEDGUARDIAN] = CLIMB_HORIZ_ANGLE		[GIL_HUMAN];        
	CLIMB_GROUND_ANGLE  	[GIL_SUMMONEDGUARDIAN] = CLIMB_GROUND_ANGLE  	[GIL_HUMAN];        
                                                                                     
	// Fallhöhe / Fallschaden                 // Fallhöhe / Fallschaden              
	FALLDOWN_HEIGHT			[GIL_SUMMONEDGUARDIAN] = FALLDOWN_HEIGHT		[GIL_HUMAN];     
	FALLDOWN_DAMAGE			[GIL_SUMMONEDGUARDIAN] = FALLDOWN_DAMAGE		[GIL_HUMAN];    
                                                                                     
	// Kampf                                  // Kampf                               
	FIGHT_RANGE_BASE		[GIL_SUMMONEDGUARDIAN] = FIGHT_RANGE_BASE		[GIL_HUMAN];        
	FIGHT_RANGE_FIST		[GIL_SUMMONEDGUARDIAN] = FIGHT_RANGE_FIST		[GIL_HUMAN];       
	FIGHT_RANGE_G			[GIL_SUMMONEDGUARDIAN] = FIGHT_RANGE_G			[GIL_HUMAN];
	
	BLOOD_EMITTER			[GIL_SUMMONEDGUARDIAN] = "BFX_Golem";
	BLOOD_TEXTURE			[GIL_SUMMONEDGUARDIAN] = "BQM_Golem.tga";
	BLOOD_FLOW				[GIL_SUMMONEDGUARDIAN] = 0;
	BLOOD_AMOUNT			[GIL_SUMMONEDGUARDIAN] = 5;
	BLOOD_MAX_DISTANCE		[GIL_SUMMONEDGUARDIAN] = 60; 

};

