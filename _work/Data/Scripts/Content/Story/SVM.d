// *********************
// Standard	Voice Module
// *********************

CLASS C_SVM
{
	// ------ B_Say_GuildGreetings ------
	var string MILGreetings;				//Miliz grüßt Miliz oer Paladin
	var string PALGreetings;				//Paladin grüßt Paladin oder Magier
	var string Weather;						//So ein Mistwetter!
	
	// ------ B_Say_AttackReason ------
	var string IGetYouStill;				//Upset-NSC sieht Spieler währned seiner Angry-Time wieder. Greift mit altem AttackReason an.
	var string DieEnemy;					//Feind wird angegriffen
	var string DieMonster;					//gefährliches Monster wird angegriffen
	var string Addon_DieMonster;
	var string Addon_DieMonster2;
	var string DirtyThief;					//Dieb wird angegriffen
	var string HandsOff;					//SC fummelt an Objekt rum
	var string SheepKiller;					//Mensch greift Schaf an
	var string SheepKillerMonster;			//Monster greift Schaf an
	var string YouMurderer;					//Mensch hat Menschen umgebracht (kein Feind)
	var string DieStupidBeast;				//Torwachen schlagen ungefähliches Monster tot, das versucht durchs Tor zu gehen	
	var string YouDareHitMe;				//SC hat NSC geschlagen
	var	string YouAskedForIt;				//SC hat trotz Aufforderung seine Waffe NICHT weggesteckt
	var string ThenIBeatYouOutOfHere;		//SC hat trotz Aufforderung Raum NICHT verlassen 
	var string WhatDidYouDoInThere;			//Wache sieht SC aus einem verbotenen Raum rauskommen und greift an
	var string WillYouStopFighting;			//Wache beendet Kampf, greift Täter an
	
	// ------ B_Say_AttackEND ------
	var string KillEnemy;					//Finishing-Move
	var string EnemyKilled;					//NSC hat Feind getötet
	var string MonsterKilled;				//NSC hat gefährliches Monster getötet
	var string Addon_MonsterKilled;			
	var string Addon_MonsterKilled2;	
	var string ThiefDown;					//NSC hat Item-Dieb niedergeschlagen
	var string RumfummlerDown;				//NSC hat verbotenes-MOBSI-Benutzer niedergeschlagen
	var string SheepAttackerDown;			//NSC hat human SheepAttacker oder SheepKiller umgehauen
	var string KillMurderer;				//Mörder finishen
	var string StupidBeastKilled;			//GateGuards töten neutrales Monster, das vorbeikam
	var string NeverHitMeAgain;				//NSC hat jemand niedergeschlagen, der ihn angegriffen hat
	var string YouBetterShouldHaveListened;	//NSC hat jemed niedergeschlagen, der die Waffe nicht weggesteckt hat
	var string GetUpAndBeGone;				//NSC hat einen Eindringling im Portalraum niedergeschlagen
	var string NeverEnterRoomAgain;			//NSC hat Spieler, der aus verbotenem Portalraum kam niedergeschlagen
	var string ThereIsNoFightingHere;		//Wache hat Täter einer Schlägerei (derjenige, der angefangen hat) niedergeschlagen

	// ------ C_WantToFlee ------ 
	var string SpareMe;						//Tu mir nichts!
	var string RunAway;						//Scheiße! Nichts wie weg!		

	// ------ C_WantToCallGuardsForFight ------
	var	string Alarm;						//Wache ruft Wache
	var string Guards;						//Harter Bursche ruft Wache
	var string Help;						//Bürger ruft Hilfe
		
	// ------ B_AssessMurder ------
	var string GoodMonsterKill;				//Monster getötet - NSC findet das toll
	var string GoodKill;					//Mensch getötet - NSC findet das toll (war sein Feind)
	
	// ------ B_AssessTalk ------
	var string NOTNOW;						//wenn RefuseTalk Counter aktiv
	
	// ------ ZS_Attack ------
	var string RunCoward;					//Gegner flieht
	
	// ------ ZS_ClearRoom ------
	var string GetOutOfHere;				//Spieler in verbotenem Raum. Harter Bursche: Raus hier!
	var string WhyAreYouInHere;				//Spieler in verbotenem Raum. Weicher Bursche: Was willst du hier?
	var string YesGoOutOfHere;				//Spieler verläßt verboten Raum artig wieder

	// ------ ZS_ObservePlayer ------
	var string WhatsThisSupposedToBe;		//NSC sieht Spieler schleichen
	var	string YouDisturbedMySlumber;		//NSC wurde von SC durch QuietSound geweckt

	// ------ ZS_RansackBody ------
	var string ITookYourGold;			 
	var string ShitNoGold;				
	var string ITakeYourWeapon;	

	// ------ ZS_ReactToDamage ------
	VAR	string WhatAreYouDoing;				//NSC wird von einem FRIENDLY-SC/NSC geschlagen
	
	// ------ ZS_ReactToWeapon ------
	var string LookingForTroubleAgain;		//SC hat Kampf verloren "Willst du nochmal was aufs Maul?"
	var string StopMagic;					
	var string ISaidStopMagic;				
	var string WeaponDown;	
	var string ISaidWeaponDown;
	VAR	string WiseMove;					//Spieler hat Waffe/Spruch weggesteckt
	
	// ------ ZS_Unconscious ------
	var string NextTimeYoureInForIt;		//Harter Bursche steht auf, nachdem er niedergeschlagen wurde (murmelt zu sich selbst)
	var string OhMyHead;					//Weicher Bursche steht auf, nachdem er niedergeschlagen wurde (murmelt zu sich selbst)
	
	// ------ ZS_WatchFight ------
	var	string TheresAFight;				//NSC entdeckt einen Kampf, und findet das toll
	var string OhMyGodItsAFight;			//NSC entdeckt einen Kampf, und findet das bestützend (Bürger)
	var string GoodVictory;					//Dem Sieger zujubeln
	var string NotBad;						//'Nicht schlecht...' - Kampfende - Freund wurde von Nicht-Freund besiegt
	var string OhMyGodHesDown;				//Bestürzung über brutales Niederschlagen
	var string CheerFriend01;				//Freund landet	einen Treffer. 'Immer in die Fresse!'
	var string CheerFriend02;
	var string CheerFriend03;
	var string Ooh01;						//Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var string Ooh02;
	var string Ooh03;
	
	// ------ ZS_MagicSleep ------
	var string WhatWasThat;     			//Wenn NSC aus Magic Sleep erwacht
	
	// ------ TA_Sleep ------
	var string GetOutOfMyBed;				//Raus aus meinem Bett!
	var string Awake;						//NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, räkeln)
	
	// ------ B_AssignAmbientNEWS ------
	var string ABS_COMMANDER;				//Ich hörte, du warst beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	var string ABS_MONASTERY;				//Ich hörte, du warst bei Vater Parlan und hast Buße getan.
	var string ABS_FARM;					//Ich hörte, du warst bei Lee und und hast die Sache wieder in Ordnung gebracht.
	var string ABS_GOOD;
	// ---------------------------------
	var string SHEEPKILLER_CRIME; 			//Einfach unsere Schafe zu schlachten! Mach, daß du hier wegkommst!
	var string ATTACK_CRIME;				//Mit miesen Schlägern rede ich nicht!
	var string THEFT_CRIME;					//Geh mir aus den Augen, dreckiger Dieb!
	var string MURDER_CRIME;				//Mit gemeinen Mördern rede ich nicht.
	// ---------------------------------
	var string PAL_CITY_CRIME; 				//Du bist eine Schande für deinen Orden! Lord Hagen wird toben vor Wut!
	var string MIL_CITY_CRIME;				//Du bist eine Schande für die Stadtwache! Lord Andre wird dir das sicher austreiben!
	var string CITY_CRIME;					//Lord Andre wird von deiner Tat erfahren!
	// ---------------------------------
	var string MONA_CRIME;					//Dein Frevel wird Vater Parlan sicherlich nicht erfreuen!
	var string FARM_CRIME; 					//Lee wird dir die Hammelbeine langziehen! Wirst schon sehen, was du davon hast!
	var string OC_CRIME; 					//Kommandant Garond wird dich zur Rechenschaft ziehen!

	// ------ B_Say_ToughGuyNews ------
	var string TOUGHGUY_ATTACKLOST;			//Spieler hat einen ToughGuy angegriffen und gewonnen
	var string TOUGHGUY_ATTACKWON;			//Spieler hat einen ToughGuy angegriffen und ist besiegt worden
	var string TOUGHGUY_PLAYERATTACK;		//Spieler hat einen ToughGuy angegriffen und den Kampf abgebrochen	
	
	// ------ GOLD ------
	var string GOLD_1000;					//1000 Goldstücke.
	var string GOLD_950;					//950 Goldstücke.
	var string GOLD_900;					//900 Goldstücke.
	var string GOLD_850;					//850 Goldstücke.
	var string GOLD_800;					//800 Goldstücke.
	var string GOLD_750;					//750 Goldstücke.
	var string GOLD_700;					//700 Goldstücke.
	var string GOLD_650;					//650 Goldstücke.
	var string GOLD_600;					//600 GOldstücke.
	var string GOLD_550;					//550 Goldstücke.
	var string GOLD_500;					//500 Goldstücke.
	var string GOLD_450;					//450 Goldstücke.
	var string GOLD_400;					//400 Goldstücke.
	var string GOLD_350;					//350 Goldstücke.
	var string GOLD_300;					//300 Goldstücke.
	var string GOLD_250;					//250 Goldstücke.
	var string GOLD_200;					//200 Goldstücke.
	var string GOLD_150;					//150 Goldstücke.
	var string GOLD_100;					//100 Goldstücke.
	var string GOLD_90;						//90 Goldstücke.
	var string GOLD_80;						//80 Goldstücke.
	var string GOLD_70;						//70 Goldstücke.
	var string GOLD_60;						//60 Goldstücke.
	var string GOLD_50;						//50 Goldstücke.
	var string GOLD_40;						//40 Goldstücke.
	var string GOLD_30;						//30 Goldstücke.
	var string GOLD_20;						//20 Goldstücke.
	var string GOLD_10;						//10 Goldstücke.
	
	// ------ B_Say_Smalltalk (TA_Smalltalk) ------
	VAR	string Smalltalk01;				// ...wenn Du meinst...
	VAR	string Smalltalk02;				// ...kann schon sein...
	VAR	string Smalltalk03;				// ...war nicht besonders schlau....
	VAR	string Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	string Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	string Smalltalk06;				// ...war doch klar, daß das Ärger gibt...
	VAR	string Smalltalk07;				// ...aber behalt's für Dich, muß nicht gleich jeder wissen...
	VAR	string Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	string Smalltalk09;				// ...an der Gechichte muß wohl doch was dran sein...
	VAR	string Smalltalk10;				// ...man muß eben aufpassen was man rumerzählt...
	VAR	string Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	string Smalltalk12;				// ...man darf auch nicht alles glauben, was man hört...
	VAR	string Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	string Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	string Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	string Smalltalk16;				// ...früher wäre das ganz anders gelaufen...
	VAR	string Smalltalk17;				// ...gequatscht wird viel...
	VAR	string Smalltalk18;				// ...ich hör nicht mehr auf das Gefasel...
	VAR	string Smalltalk19;				// ...verlaß Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	string Smalltalk20;				// ...ich glaube kaum, daß sich daran was ändern wird...
	VAR	string Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	string Smalltalk22;				// ...erstmal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird...
	VAR	string Smalltalk23;				// ...ich dachte, das wäre schon lange geklärt, aber das ist wohl nicht so...
	VAR	string Smalltalk24;				// ...laß uns lieber über was anderes reden...
	//Tough Guy (SLD/MIL/DJG)
	VAR	string Smalltalk25;				// ...der war doch sturzbetrunken...							
	VAR	string Smalltalk26;				// ...mit mir kann man sowas nicht machen...			
	VAR	string Smalltalk27;				// ...alle sind gerannt wie die Hasen, ich war ganz allein...
	//ProInnos (NOV/KDF/PAL)
	VAR	string Smalltalk28;				// ...so steht es in den heiligen Schriften...							
	VAR	string Smalltalk29;				// ...ich handle stets in Innos Namen...			
	VAR	string Smalltalk30;				// ...niemand darf gegen die göttliche Ordnung verstoßen...
		
	// ------ Lehrer-Kommentare ------
	var string NoLearnNoPoints			;	//NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string NoLearnOverPersonalMAX	;	//NSC-Lehrer verbietet Steigerung ÜBER sein persönliches Lehrer-Maximum
	var string NoLearnYoureBetter		;   //NSC-Lehrer - MAX ist schlechter als oder gleich wie Spieler
	var string YouLearnedSomething		;   //SC hat etwas gelernt

	// ------ B_AssignCityGuide ------
	var string UNTERSTADT		;
	var string OBERSTADT		;
	var string TEMPEL		;
	var string MARKT		;
	var string GALGEN		;
	var string KASERNE		;
	var string HAFEN	;
	// -------------------------------
	var string WHERETO		;
	// -------------------------------
	var string OBERSTADT_2_UNTERSTADT	;
	var string UNTERSTADT_2_OBERSTADT	;
	var string UNTERSTADT_2_TEMPEL		;
	var string UNTERSTADT_2_HAFEN		;
	var string TEMPEL_2_UNTERSTADT		;
	var string TEMPEL_2_MARKT			;
	var string TEMPEL_2_GALGEN			;
	var string MARKT_2_TEMPEL			;
	var string MARKT_2_KASERNE			;
	var string MARKT_2_GALGEN			;
	var string GALGEN_2_TEMPEL			;
	var string GALGEN_2_MARKT			;
	var string GALGEN_2_KASERNE			;
	var string KASERNE_2_MARKT			;
	var string KASERNE_2_GALGEN			;
	var string HAFEN_2_UNTERSTADT		;

	// ------ Kampf ------
	var	string Dead				;			// Tödlich verletzt
	VAR	string Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	string Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	string Aargh_3			;			// Treffer kassiert im Kampf	
	
	var string ADDON_WRONGARMOR;			//Sc hat unangemessene Rüstung an				//Default
	var string ADDON_WRONGARMOR_SLD;		//Beide SLD/DJG und falsche Rüstung
	var string ADDON_WRONGARMOR_MIL;		//Beide MIL/PAL	und falsche Rüstung
	var string ADDON_WRONGARMOR_KDF;		//Beide KDF und falsche Rüstung
	var string ADDON_NOARMOR_BDT;			//self ist BAndite und SC hat keine Rüstung an.
	
	var string ADDON_DIEBANDIT;				//Stirb du dreckiger Bandit
	var string ADDON_DIRTYPIRATE;			//Piratenpack
	// ------ SC SVMs ------
	var string SC_HeyTurnAround;			//SC: Hey du! (B_AssessTalk)
	var string SC_HeyTurnAround02;	
	var string SC_HeyTurnAround03;	
	var string SC_HeyTurnAround04;			
	var string SC_HeyWaitASecond;			//SC: Hey warte mal! (B_AssessTalk)
	var string DoesntWork;				
	var string PickBroke;				
	var string NeedKey;					
	var string NoMorePicks;	
	var string NoPickLockTalent;
	var string NoSweeping;
	
	var string PICKLOCKORKEYMISSING;	
	var string KEYMISSING;
	var string PICKLOCKMISSING;
	var string NEVEROPEN;
	var string MISSINGITEM;
	var string DONTKNOW;
	var string NOTHINGTOGET;
	var string NOTHINGTOGET02;
	var string NOTHINGTOGET03;
	var string HEALSHRINE;
	var string HEALLASTSHRINE;
	var string IRDORATHTHEREYOUARE;
	var string SCOPENSIRDORATHBOOK;
	var string SCOPENSLASTDOOR;

	//-------------Addon ----------------------
	
	var string TRADE_1;
	var string TRADE_2;
	var string TRADE_3;
	
	var string VERSTEHE;
	var string FOUNDTREASURE;
	var string CANTUNDERSTANDTHIS;
	var string CANTREADTHIS;
	var string STONEPLATE_1;
	var string STONEPLATE_2;
	var string STONEPLATE_3;
	
	var string COUGH;
	var string HUI;
	
	var string Addon_ThisLittleBastard;
	var string ADDON_OPENADANOSTEMPLE;
	
	//Story Banditenlager Dialoge
	var string	ATTENTAT_ADDON_DESCRIPTION;
	var string  ATTENTAT_ADDON_DESCRIPTION2;
	var string	ATTENTAT_ADDON_PRO;
	var string 	ATTENTAT_ADDON_CONTRA;
	
	var string 	MINE_ADDON_DESCRIPTION;
	var string 	ADDON_SUMMONANCIENTGHOST;
	var string 	ADDON_ANCIENTGHOST_NOTNEAR;
	
	var string 	ADDON_GOLD_DESCRIPTION; 	
};     


// **********************************
// NSCs
// ----
// SVMs müssen immer "SVM_x" heissen, 
// wobei x die VoiceNummer ist.	
// **********************************

// ------ wird nur intern gebraucht! ------
instance SVM_0 (C_SVM)				
{

};

instance SVM_1 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_1_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_1_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_1_Weather"						;//So ein Mistwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//Krieg ich dich DOCH noch!
	DieEnemy					=	"SVM_1_DieEnemy"					;//Jetzt bist du dran!
	DieMonster					=	"SVM_1_DieMonster"					;//Da ist wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Na warte, du dreckiger Dieb!
	HandsOff					=	"SVM_1_HandsOff"					;//Finger weg da!
	SheepKiller					=	"SVM_1_SheepKiller"					;//Der Mistkerl schlachtet unsere Schafe!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//Das verdammte Mistvieh frisst unsere Schafe!
	YouMurderer					=	"SVM_1_YouMurderer"					;//Mörder!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Na warte, du Mistkerl!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Du hast es so gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//Dann muss ich dich eben rausprügeln!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//Was hattest DU denn da drin zu suchen, he!?
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Stirb, Mistkerl!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//Das war's für dich, Penner.
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//Ein Mistvieh weniger!
	ThiefDown					=	"SVM_1_ThiefDown"					;//Versuch nie wieder, mich zu bestehlen!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Tu das nie wieder! Das sind unsere Schafe!
	KillMurderer				=	"SVM_1_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//Leg dich nie wieder mit mir an!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//Du hättest auf mich hören sollen!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//Und jetzt mach, dass du hier rauskommst!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//Und dass ich dich nie wieder da drin erwische!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Lass mich bloß in Ruhe!
	RunAway						= 	"SVM_1_RunAway"						;//Scheiße! Nichts wie weg!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//ALARM!
	Guards						=	"SVM_1_Guards"						;//WACHE!
	Help						=	"SVM_1_Help"						;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//(ruft zu) Gut gemacht - ein Drecksvieh weniger!
	GoodKill					= 	"SVM_1_GoodKill"					;//(ruft) Ja, mach das Schwein fertig!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//(ruft laut) Bleib stehen, du Lump!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Raus hier!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//Was suchst du hier!? Geh!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//Ja, mach, dass du wegkommst!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hey du! Was schleichst du da rum.
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//(wacht auf) Verdammt, was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//Gold! Das ist schon mal meins ...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//Der Mistkerl hat noch nicht mal Gold dabei.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Deine Waffe nehm' ich mal lieber mit.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//(warnt) Hey! Pass auf!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//(aggressiv) Hast du immer noch nicht genug?!
	StopMagic					=	"SVM_1_StopMagic"					;//Geh bloß weg mit deiner Magie!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Weg mit der Magie! Hörst du schlecht!?
	WeaponDown					=	"SVM_1_WeaponDown"					;//Weg mit der Waffe!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Hörst du schlecht? Ich sagte: Weg mit der Waffe!
	WiseMove					=	"SVM_1_WiseMove"					;//Na bitte, geht doch!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//(zu sich selbst) Darüber reden wir noch ...
	OhMyHead					=	"SVM_1_OhMyHead"					;//(zu sich selbst) Oh, mein Schädel ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//(gierig) Jetzt geht's zur Sache!
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//(bestürzt) Die hauen sich den Schädel ein ...
	GoodVictory					=	"SVM_1_GoodVictory"					;//(böse lachend) Das hat er verdient.
	NotBad						= 	"SVM_1_NotBad"						;//(anerkennend) Gar nicht so übel ...
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//(zu sich selbst) Was für ein brutaler Kerl ...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Ja, so ist's gut!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//Na, mach schon!
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//Immer feste drauf!
	Ooh01						=	"SVM_1_Ooh01"						;//Lass dir nichts gefallen!
	Ooh02						=	"SVM_1_Ooh02"						;//Den wirst du ja wohl schaffen!
	Ooh03						=	"SVM_1_Ooh03"						;//Das gibt's doch gar nicht!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Raus aus meinem Bett!
	Awake						= "SVM_1_Awake"							;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//Ich hörte, du warst beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//Ich hörte, du warst bei Vater Parlan und hast Buße getan.
	ABS_FARM					= "SVM_1_ABS_FARM"						;//Ich hörte, du warst bei Lee und hast die Sache wieder in Ordnung gebracht.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//Das ist gut.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Einfach unsere Schafe zu schlachten! Mach, dass du hier wegkommst!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//Mit miesen Schlägern rede ich nicht!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//Geh mir aus den Augen, dreckiger Dieb!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//Du bist eine Schande für deinen Orden! Lord Hagen wird toben vor Wut!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//Du bist eine Schande für die Stadtwache! Lord Andre wird dir das sicher austreiben!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Lord Andre wird von deiner Tat erfahren!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Dein Frevel wird Vater Parlan sicherlich nicht erfreuen!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Lee wird dir die Hammelbeine lang ziehen! Wirst schon sehen, was du davon hast!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Kommandant Garond wird dich zur Rechenschaft ziehen!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//Ist ja schon gut, du hast gewonnen. Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//(selbstgefällig) Muss ich dir noch mal zeigen, wer hier der Herr ist?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Willst du dich noch mal mit mir anlegen oder was?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 Goldstücke.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 Goldstücke.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 Goldstücke.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 Goldstücke.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 Goldstücke.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 Goldstücke.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 Goldstücke.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 Goldstücke.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 Goldstücke.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 Goldstücke.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 Goldstücke.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 Goldstücke.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 Goldstücke.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 Goldstücke.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 Goldstücke.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 Goldstücke.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 Goldstücke.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 Goldstücke.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 Goldstücke.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 Goldstücke.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 Goldstücke.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 Goldstücke.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 Goldstücke.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 Goldstücke.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 Goldstücke.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 Goldstücke.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 Goldstücke.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//... glaubst du wirklich ...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//... möglich ist alles ...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//... das hätte er doch besser wissen müssen ...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//... als ob ich nicht schon genug Probleme hätte ...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//... wer erzählt denn so was ...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//... das gibt doch nur noch mehr Ärger ...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//... man erzählt sich ja so einiges ...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//... ich hätte das nicht gemacht ...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//... das sind doch alles nur Gerüchte ...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//... man muss eben aufpassen, was man so rumerzählt ...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//... das hätte ich dir vorher sagen können ...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//... mich fragt ja keiner ...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//... der arme Kerl kann einem Leid tun ...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//... das ist doch nichts Neues ...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//... das liegt doch auf der Hand ...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//... mich brauchst du das nicht zu fragen ...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//... das kann ja nicht ewig so weitergehen ...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//... meine Meinung kennst du ja schon ...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//... genau das hab ich auch gesagt ...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//... daran wird sich nie etwas ändern ...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//... warum erfahre ich das erst jetzt ...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//... lass uns mal abwarten, was daraus wird ...
	Smalltalk23					= "SVM_1_Smalltalk23"					;//... einige Probleme erledigen sich von selbst ...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//... ich kann das nicht mehr hören ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//... der war doch sturzbetrunken ...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//... mit mir kann man so was nicht machen ...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//... alle sind gerannt wie die Hasen, ich war ganz allein ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//... so steht es in den heiligen Schriften ...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//... ich handle stets in Innos' Namen ...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//... niemand darf gegen die göttliche Ordnung verstoßen ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_1_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_1_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_1_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_1_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_1_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_1_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_1_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_1_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//Das ist nicht deine Kleidung. Ich rede nicht mit dir.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//Wie läufst du denn rum? Zieh dir was Vernünftiges an.
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//Du bist Soldat! Kleide dich entsprechend.
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//Deine Kleidung ist unserem Orden nicht angemessen. Zieh dich um.
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//Hast ja noch nicht mal 'ne Rüstung. Verschwinde!

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Stirb, du dreckiger Bandit!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Piratenpack!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_3_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_3_Weather"					;//So ein Mistwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Aber jetzt krieg ich dich!
	DieEnemy					=	"SVM_3_DieEnemy"					;//Ich mach dich fertig!
	DieMonster					=	"SVM_3_DieMonster"					;//Da ist wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Na warte, du dreckiger Dieb!
	HandsOff					=	"SVM_3_HandsOff"					;//Finger weg da!
	SheepKiller					=	"SVM_3_SheepKiller"				;//Der Mistkerl schlachtet unsere Schafe!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//Das verdammte Mistvieh frisst unsere Schafe!
	YouMurderer					=	"SVM_3_YouMurderer"				;//Mörder!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Na warte, du Mistkerl!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Du hast es so gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//Du willst nicht gehen? Na gut!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//Was hattest du da drin zu suchen?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Stirb, Mistkerl!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//Das hast du verdient, Mistkerl!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//Ein Mistvieh weniger!
	ThiefDown					=	"SVM_3_ThiefDown"					;//Versuch nie wieder, mich zu bestehlen!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Tu das nie wieder! Das sind unsere Schafe!
	KillMurderer				=	"SVM_3_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//Leg dich nie wieder mit mir an!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//Du hättest auf mich hören sollen!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//Und jetzt sieh zu, dass du hier verschwindest!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//Und lass dich ja nie wieder da drinnen erwischen!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Tu mir nichts!
	RunAway						= 	"SVM_3_RunAway"					;//Ach du Scheiße!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//ALARM!
	Guards						=	"SVM_3_Guards"					;//WACHE!
	Help						=	"SVM_3_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//(ruft zu) Gut gemacht - ein Drecksvieh weniger!
	GoodKill					= 	"SVM_3_GoodKill"				;//(ruft) Ja, mach das Schwein fertig!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//(ruft laut) Ja! Renn, so schnell du kannst!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Raus hier!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//Was suchst du hier!? Geh!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//Ja, mach dass du wegkommst!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//Hey du! Was schleichst du da rum.
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//(wacht auf) Verdammt, was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//Danke für das Gold, du Held!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//Du arme Wurst, hast ja nicht mal Gold dabei!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//Die Waffe nehm ich mal besser an mich!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//(warnt) Pass auf! Noch mal, und ich verpass dir eine.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//Hast du immer noch nicht genug?!
	StopMagic					=	"SVM_3_StopMagic"				;//Hör auf mit dieser Magie-Scheiße!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Willst du Schläge? Hör sofort damit auf!!!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Steck endlich die Scheißwaffe weg!
	WiseMove					=	"SVM_3_WiseMove"				;//Kluges Kerlchen!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//(zu sich selbst) Das nächste Mal werden wir ja sehen ...
	OhMyHead					=	"SVM_3_OhMyHead"				;//(zu sich selbst) Oh Mann, mein Kopf ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//(gierig) Ah, ein Kampf!
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//(bestürzt) Mein Gott, ein Kampf!
	GoodVictory					=	"SVM_3_GoodVictory"			;//(böse lachend) Dem hast du's gezeigt!
	NotBad						= 	"SVM_3_NotBad"					;//(anerkennend) Nicht schlecht ...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//(zu sich selbst) Mein Gott! Wie brutal ...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Schlag zu!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Gib alles!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Zeig's ihm!
	Ooh01						=	"SVM_3_Ooh01"					;//Bleib dran!
	Ooh02						=	"SVM_3_Ooh02"					;//Vorsicht!
	Ooh03						=	"SVM_3_Ooh03"					;//Oh! Der hat gesessen!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Raus aus meinem Bett!
	Awake						= "SVM_3_Awake"					;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//Du warst also beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//Du warst also bei Vater Parlan und hast Buße getan.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//Du warst also bei Lee und hast die Sache wieder in Ordnung gebracht.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//Das ist gut.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Einfach unsere Schafe zu schlachten!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Lass mich in Ruhe, du brutaler Mistkerl!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Lass mich in Ruhe, du mieser kleiner Dieb!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//Du bist eine Schande für deinen Orden! Warte, bis Lord Hagen davon hört!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//Du bist eine Schande für die Stadtwache! Warte, bis Lord Andre davon hört!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Warte, bis Lord Andre davon hört.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Warte, bis Vater Parlan davon hört!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Warte, bis Lee davon hört ...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Warte, bis Kommandant Garond davon hört!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Okay, okay, du bist der Bessere von uns beiden! Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//(selbstgefällig) Ich nehme an, du hast mittlerweile begriffen, wer von uns beiden der Stärkere ist ... Was willst du?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//Ich dachte, du wolltest dich mit mir anlegen. Hast du's dir anders überlegt? Willst doch lieber REDEN, was? (lacht)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 Goldstücke.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//... glaubst du wirklich ...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//... möglich ist alles ...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//... das hätte er doch besser wissen müssen ...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//... als ob ich nicht schon genug Probleme hätte ...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//... wer erzählt denn so was ...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//... das gibt doch nur noch mehr Ärger ...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//... man erzählt sich ja so einiges ...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//... ich hätte das nicht gedacht ...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//... das sind doch alles nur Gerüchte ...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//... man muss eben aufpassen, was man so rumerzählt ...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//... das hätte ich dir vorher sagen können ...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//... mich fragt ja keiner ...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//... der arme Kerl kann einem Leid tun ...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//... das ist doch nichts Neues ...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//... das liegt doch auf der Hand ...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//... mich brauchst du das nicht zu fragen ...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//... das kann ja nicht ewig so weitergehen ...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//... meine Meinung kennst du ja schon ...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//... genau das hab ich auch gesagt ...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//... daran wird sich nie etwas ändern ...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//... warum erfahre ich das jetzt erst ...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//... lass uns erstmal abwarten, was daraus wird ...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//... einige Probleme erledigen sich von selbst ...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//... ich kann das nicht mehr hören ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//... der war doch sturzbetrunken ...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//... mit mir kann man so was nicht machen ...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//... alle sind gerannt wie die Hasen, ich war ganz allein ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//... so steht es in den heiligen Schriften ...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//... ich handle stets in Innos' Namen ...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//... niemand darf gegen die göttliche Ordnung verstoßen ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_3_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_3_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_3_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_3_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_3_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hoch führt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_3_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_3_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_3_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//Was ist das für Kleidung? Sie passt nicht zu dir. Lass mich in Ruhe.
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Wenn du reden willst, dann zieh dir erst mal was Richtiges an.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//Wir Soldaten tragen unsere Uniform mit Stolz. Zieh dich um.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//In unserem Orden sind alle gleich, deshalb tragen wir auch alle die gleiche Kleidung. Zieh dich um!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Kommst wohl direkt aus dem Knast. Besorg dir erst mal was zum Anziehen.

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//KOMM HER, BANDIT!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//KOMM HER, PIRAT!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_4_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_4_Weather"						;//Scheißwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//DU schon wieder!
	DieEnemy					=	"SVM_4_DieEnemy"					;//Ich mach dich fertig!
	DieMonster					=	"SVM_4_DieMonster"					;//Schon wieder eins von diesen Biestern!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Du mieser kleiner Dieb!
	HandsOff					=	"SVM_4_HandsOff"					;//Nimm deine Finger weg da!
	SheepKiller					=	"SVM_4_SheepKiller"					;//Hey! Lass unsere Schafe in Ruhe!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//Das Biest frisst unsere Schafe!
	YouMurderer					=	"SVM_4_YouMurderer"					;//Mörder!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//Was will DAS Vieh denn hier?
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//Jetzt kannst du was erleben!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Du hast es nicht anders gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//Wer nicht hören will, muss fühlen.
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//Was wolltet du da drin, he!?
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Stirb!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//So ein dämlicher Mistkerl ...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//So, das war's mit dir, du Mistvieh!
	ThiefDown					=	"SVM_4_ThiefDown"					;//Lass in Zukunft die Finger von meinen Sachen, klar?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//Behalt in Zukunft deine Finger bei dir!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//Vergreif dich nie wieder an unseren Schafen!
	KillMurderer				=	"SVM_4_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Versuch das nicht noch mal, Bürschchen!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Lass dir das eine Lehre sein.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Steh auf und mach, dass du hier rauskommst!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//Ich will dich nie wieder da drinnen sehen, klar?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//Wenn hier einer Schläge verteilt, dann bin ich das, kapiert?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Lass mich bloß in Ruhe!
	RunAway						= 	"SVM_4_RunAway"						;//Scheiße! Nichts wie weg!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//ALARM!
	Guards						=	"SVM_4_Guards"					;//WACHE!
	Help						=	"SVM_4_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//(ruft zu) Ja! So muss man's den Biestern geben!
	GoodKill					= 	"SVM_4_GoodKill"				;//(ruft) Das hat die Sau verdient!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//(ruft laut) Wir sprechen uns noch!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Raus!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//Was hast du hier zu suchen?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Hau bloß ab!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//Was schleichst du denn da rum?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//(wacht auf) Was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//Danke für das Gold, du Held!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//Du arme Wurst, hast ja nicht mal Gold dabei!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//Die Waffe nehm ich mal besser an mich!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//(warnt) Pass auf! Noch mal und ich verpass dir eine.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//(agressiv) Willst du noch mal was aufs Maul?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//Hör auf mit dieser Magie-Scheiße!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Willst du Schläge? Hör sofort auf damit!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Steck endlich die Scheißwaffe weg!
	WiseMove					=	"SVM_4_WiseMove"				;//Kluges Kerlchen!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//(zu sich selbst) Das nächste Mal werden wir ja sehen ...
	OhMyHead					=	"SVM_4_OhMyHead"				;//(zu sich selbst) Oh Mann, mein Kopf ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//(gierig) Ah, ein Kampf!
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//(bestürzt) Mein Gott, ein Kampf!
	GoodVictory					=	"SVM_4_GoodVictory"				;//(böse lachend) Dem hast du's gezeigt!
	NotBad						= 	"SVM_4_NotBad"					;//(anerkennend) Nicht schlecht ...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//(zu sich selbst) Mein Gott! Wie brutal ...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Ja, gib's ihm!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Zeig's ihm!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Mach ihn fertig!
	Ooh01						=	"SVM_4_Ooh01"					;//Wehr dich!
	Ooh02						=	"SVM_4_Ooh02"					;//Schlag doch zurück!
	Ooh03						=	"SVM_4_Ooh03"					;//Uh! Das tat weh!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//(zu sich selbst, wacht auf) Verdammt, was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Raus aus meinem Bett!
	Awake						= "SVM_4_Awake"						;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//Der Kommandant hat also die Sache für dich in Ordnung gebracht.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//Du hast also bei Vater Parlan für deine Taten gebüßt.
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//Ich hörte, Lee hat's noch mal für dich hingebogen.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Gut.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Schafe schlachten ist das Letzte! Verschwinde!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Du bist ein Schläger - hau ab!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Verfluchter Dieb! - Für dich habe ich nichts mehr übrig!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//Von einem Paladin hätte ich mehr erwartet! Lord Hagen wird nicht sehr erfreut sein.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//Dass so einer wie du überhaupt bei der Stadtwache ist! Lord Andre wird dich dafür zahlen lassen!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Lord Andre wird von deinem Verhalten erfahren!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Vater Parlan wird erzürnt sein über deinen Frevel!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Damit wird Lee dich nicht davonkommen lassen!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Das wird Kommandant Garond nicht gerne hören - dafür musst du zahlen!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//Du hast ja 'nen ganz schönen Schlag drauf ... Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//(selbstgefällig) Noch Fragen?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//Da bist du ja wieder!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 Goldstücke.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//... ist das wirklich wahr ...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//... ich hab was anderes gehört ...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//... sag mir nicht, dass du das nicht gewusst hast ...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//... man weiß gar nicht mehr, wem man noch glauben soll ...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//... das ist doch alles nur Gerede ...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//... meinst du, mir geht es besser ...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//... ich wundere mich über gar nichts mehr ...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//... das ist wirklich nicht mein Problem ...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//... glaubst du wirklich daran ...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//... von mir erfährt keiner was ...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//... das war doch schon vorher klar ...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//... er hat auf die falschen Leute gehört ...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//... wenn er das nicht sieht, kann ich ihm auch nicht mehr helfen ...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//... ich erzähl dir doch nichts Neues ...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//... von selbst ist er da nicht drauf gekommen ...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//... das ist doch lange bekannt ...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//... das ist 'ne schlimme Sache ...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//... ich hätte das anders gemacht ...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//... ich bin ganz deiner Meinung ...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//... wird sich das jemals ändern ...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//... das habe ich noch gar nicht gewusst ...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//... da kannst du eh nichts dran ändern ...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//... das wundert mich nicht ...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//... er musste es ja besser wissen ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//... es kommt nur auf die Kraft an, also komm mir nicht so ...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//... der weiß ja nicht mal, wie man ein Schwert hält ...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//... ja, das hat er wirklich behauptet ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//... jemand wird dafür büßen müssen ...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//... Innos leuchtet all denen, die seine Weisheit erkennen ...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//... letztendlich wird die Gerechtigkeit siegen ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_4_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_4_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_4_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_4_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_4_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hoch führt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_4_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_4_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_4_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Zieh dich erst mal anständig an, dann reden wir weiter.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//Trag gefälligst deine Rüstung, wenn du mit mir reden willst.
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Hat man dir keine von unseren Rüstung gegeben? Dann besorg dir erst mal eine.
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//Wo ist deine Robe? Zieh dich um. Vorher werde ich nicht mit dir reden.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//Was bist du denn für eine arme Sau? Komm wieder, wenn du dir eine Rüstung leisten kannst.

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Noch ein Bandit!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//Du dreckiger Pirat!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_5_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_5_Weather"						;//So ein Mistwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//Krieg' ich dich DOCH noch!
	DieEnemy					=	"SVM_5_DieEnemy"					;//Jetzt bist du dran!
	DieMonster					=	"SVM_5_DieMonster"					;//Da ist wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Na warte, du dreckiger Dieb!
	HandsOff					=	"SVM_5_HandsOff"					;//Finger weg da!
	SheepKiller					=	"SVM_5_SheepKiller"					;//Der Mistkerl schlachtet unsere Schafe!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//Das verdammte Mistvieh frisst unsere Schafe!
	YouMurderer					=	"SVM_5_YouMurderer"					;//Mörder!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//Na warte, du Mistkerl!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Du hast es so gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//Dann muss ich dich eben rausPRÜGELN!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//Was hattest DU denn da drin zu suchen, he!?
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Stirb, Mistkerl!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//Das war's für dich, Penner.
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//Ein Mistvieh weniger!
	ThiefDown					=	"SVM_5_ThiefDown"					;//Versuch nie wieder, mich zu bestehlen!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Tu das nie wieder! Das sind unsere Schafe!
	KillMurderer				=	"SVM_5_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//Leg dich nie wieder mit mir an!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//Du hättest auf mich hören sollen!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//Und jetzt mach, dass du hier rauskommst!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//Und dass ich dich nie wieder da drin erwische!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Lass mich bloß in Ruhe!
	RunAway						= 	"SVM_5_RunAway"						;//Scheiße! Nichts wie weg hier!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//ALARM!
	Guards						=	"SVM_5_Guards"						;//WACHE!
	Help						=	"SVM_5_Help"						;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//(ruft zu) Gut gemacht - ein Drecksvieh weniger!
	GoodKill					= 	"SVM_5_GoodKill"					;//(ruft) Ja, mach das Schwein fertig!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//(ruft laut) Bleib stehen, du Lump!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Raus hier!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//Was suchst du hier!? Geh!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//Ja, mach, dass du wegkommst!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Hey du! Was schleichst denn du da rum?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//(wacht auf) Verdammt, was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//Gold! Das ist schon mal meins ...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//Du hast noch nicht mal Gold dabei?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Deine Waffe nehm ich mal lieber mit.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//(warnt) Hey! Pass auf!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//(aggressiv) Hast du immer noch nicht genug?!
	StopMagic					=	"SVM_5_StopMagic"					;//Geh bloß weg mit deiner Magie!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Weg mit der Magie! Hörst du schlecht!?
	WeaponDown					=	"SVM_5_WeaponDown"					;//Weg mit der Waffe!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Hörst du schlecht? Ich sagte: Weg mit der Waffe!
	WiseMove					=	"SVM_5_WiseMove"					;//Na bitte, geht doch!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//(zu sich selbst) Darüber reden wir noch ...
	OhMyHead					=	"SVM_5_OhMyHead"					;//(zu sich selbst) Oh, mein Schädel ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//(gierig) Jetzt geht's zur Sache!
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//(bestürzt) Die hauen sich ja den Schädel ein ...
	GoodVictory					=	"SVM_5_GoodVictory"					;//(böse lachend) Das hat er verdient.
	NotBad						= 	"SVM_5_NotBad"						;//(anerkennend) Gar nicht so übel ...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//(zu sich selbst) Was für ein brutaler Kerl ...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Ja, so ist's gut!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//Na, mach schon!
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//Immer feste drauf!
	Ooh01						=	"SVM_5_Ooh01"						;//Lass dir nichts gefallen!
	Ooh02						=	"SVM_5_Ooh02"						;//Den wirst du ja wohl schaffen!
	Ooh03						=	"SVM_5_Ooh03"						;//Das gibt's doch gar nicht!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Raus aus meinem Bett!
	Awake						= "SVM_5_Awake"							;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//Ich hörte, du warst beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//Ich hörte, du warst bei Vater Parlan und hast Buße getan.
	ABS_FARM					= "SVM_5_ABS_FARM"						;//Ich hörte, du warst bei Lee und hast die Sache wieder in Ordnung gebracht.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//Das ist gut.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Einfach unsere Schafe zu schlachten! Mach, dass du hier wegkommst!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//Mit miesen Schlägern rede ich nicht!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//Geh mir aus den Augen, dreckiger Dieb!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//Du bist eine Schande für den Orden! Lord Hagen wird toben vor Wut!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//Du bist eine Schande für die Stadtwache! Lord Andre wird dir das sicher austreiben!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Lord Andre wird von deiner Tat erfahren!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//Dein Frevel wird Vater Parlan sicherlich nicht erfreuen!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Lee wird dir die Hammelbeine lang ziehen! Wirst schon sehen, was du davon hast!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Kommandant Garond wird dich zur Rechenschaft ziehen!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//Ist ja schon gut, du hast gewonnen. Na, was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//(selbstgefällig) Muss ich dir noch mal zeigen, wer hier der Herr ist?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Willst du dich noch mal mit mir anlegen oder was?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 Goldstücke.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 Goldstücke.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 Goldstücke.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 Goldstücke.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 Goldstücke.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 Goldstücke.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 Goldstücke.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 Goldstücke.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 Goldstücke.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 Goldstücke.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 Goldstücke.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 Goldstücke.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 Goldstücke.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 Goldstücke.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 Goldstücke.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 Goldstücke.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 Goldstücke.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 Goldstücke.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 Goldstücke.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 Goldstücke.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 Goldstücke.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 Goldstücke.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 Goldstücke.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 Goldstücke.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 Goldstücke.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 Goldstücke.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 Goldstücke.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//... glaubst du wirklich ...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//... möglich ist alles ...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//... das hätte er doch besser wissen müssen ....
	Smalltalk04					= "SVM_5_Smalltalk04"					;//... als wenn ich nicht schon genug Probleme hätte ...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//... wer erzählt denn so was ...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//... das gibt doch nur noch mehr Ärger ...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//... man erzählt sich ja so einiges ...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//... ich hätte das nicht gemacht ...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//... das sind doch alles nur Gerüchte ...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//... man muss eben aufpassen, was man so rumerzählt ...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//... das hätte ich dir vorher sagen können ...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//... mich fragt ja keiner ...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//... der arme Kerl kann einem Leid tun ...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//... das ist doch nichts Neues ...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//... das liegt doch auf der Hand ...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//... mich brauchst du das nicht zu fragen ...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//... das kann ja nicht ewig so weitergehen ...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//... meine Meinung kennst du ja schon ...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//... genau das hab ich auch gesagt ...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//... daran wird sich nie etwas ändern ...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//... warum erfahre ich das erst jetzt ...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//... lass uns erstmal abwarten, was daraus wird ...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//... einige Probleme erledigen sich von selbst ...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//... ich kann das nicht mehr hören ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//... der war doch sturzbetrunken ...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//... mit mir kann man so was nicht machen ...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//... alle sind gerannt wie die Hasen, ich war ganz allein ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//... so steht es in den heiligen Schriften ...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//... ich handle stets in Innos Namen ...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//... niemand darf gegen die göttliche Ordnung verstoßen ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_5_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_5_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_5_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_5_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_5_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hoch führt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//Wenn du vor dem Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_5_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_5_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_5_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Zieh dir erst einmal was Passendes an.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//Wie läufst du denn rum? Gehörst du nicht mehr zu uns? Dann will ich nichts mit dir zu tun haben.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//Wir Soldaten kämpfen für den König, also trag gefälligst auch seine Rüstung.
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Warum gibt dir der Orden Kleidung, wenn du sie nicht trägst? Denk mal darüber nach.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//Was bist du denn für ein Würstchen? Du hast ja nicht mal 'ne Rüstung. Geh weg.

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//Ah, ein Bandit.
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//Ich mach dich fertig, Pirat!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_6_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_6_Weather"					;//Sauwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//Jetzt krieg ich dich!
	DieEnemy					=	"SVM_6_DieEnemy"					;//Du wärst besser nicht hier hergekommen!
	DieMonster					=	"SVM_6_DieMonster"					;//Komm her, Mistvieh!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Dreckiger Dieb! Na warte!
	HandsOff					=	"SVM_6_HandsOff"					;//Nimm deine Pfoten da weg!
	SheepKiller					=	"SVM_6_SheepKiller"				;//Lass unsere Schafe in Ruhe!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//Geh weg von unseren Schafen, du Mistvieh!
	YouMurderer					=	"SVM_6_YouMurderer"				;//Mörder!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//Das wirst du bereuen!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Ich hatte dich gewarnt!
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Hey, RAUS!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Hey! Was wolltest du da drin?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//Aufhören! Sofort!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//Jetzt spieß ich dich auf, Mistkerl!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//Das war's für dich ...
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Ich hab's immer noch drauf!
	ThiefDown					=	"SVM_6_ThiefDown"					;//Ich warne dich! Versuch das nicht noch mal, du dreckiger Dieb!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//Vergreif dich nie wieder an Sachen, die dir nicht gehören!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//Und halt dich in Zukunft von unseren Schafen fern!
	KillMurderer				=	"SVM_6_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//Wag es ja nie wieder, mich anzugreifen!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//Ich hatte dich gewarnt!
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//Und jetzt raus mit dir!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//Ich will dich nie wieder da drin sehen, klar?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Hier wird nicht gekämpft, lass dir das eine Lehre sein.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Mach kein' Scheiß!
	RunAway						= 	"SVM_6_RunAway"						;//Ich hau ab!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//ALARM!
	Guards						=	"SVM_6_Guards"					;//WACHE!
	Help						=	"SVM_6_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//(ruft zu) Gib den Viechern ordentlich Saures!
	GoodKill					= 	"SVM_6_GoodKill"				;//(ruft) Ja, gib's dem Mistkerl!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//(ruft laut) Ich krieg dich noch!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Raus hier!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//Du hast hier nichts zu suchen!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//Ja, raus mit dir!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//Was soll das denn werden? Warum schleichst du hier rum?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//(wacht auf) Verdammt, was willst du?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//Na, immerhin hast du wenigstens Gold dabei!
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Noch nicht mal Gold - hmpf.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Deine Waffe nehm ich mal mit.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//(warnt) Junge! Mach das ja nicht noch mal!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//(agressiv) Brauchst du schon wieder Schläge?
	StopMagic					=	"SVM_6_StopMagic"				;//Weg mit der Magie!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Letzte Warnung! Weg mit der Magie!
	WeaponDown					=	"SVM_6_WeaponDown"				;//Weg mit der Waffe!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Weg damit oder ich verpass dir eine!
	WiseMove					=	"SVM_6_WiseMove"				;//Du bist ja gar nicht so dumm, wie du aussiehst!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//(zu sich selbst) Versuch das ja nicht noch mal ...
	OhMyHead					=	"SVM_6_OhMyHead"				;//(zu sich selbst) Oh! Mein Schädel ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//(gierig) Jetzt wird's lustig ...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//(bestürzt) Du meine Güte ...
	GoodVictory					=	"SVM_6_GoodVictory"			;//(böse lachend) Das wird ihm eine Lehre sein ...
	NotBad						= 	"SVM_6_NotBad"					;//(anerkennend) Der hat gesessen!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//(zu sich selbst) Brutaler Mistkerl!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Hau drauf!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Hör nicht auf!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Mach ihn fertig!
	Ooh01						=	"SVM_6_Ooh01"					;//Pass auf!
	Ooh02						=	"SVM_6_Ooh02"					;//Parier doch!
	Ooh03						=	"SVM_6_Ooh03"					;//Scheiße, das tat weh!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Raus aus meinem Bett!
	Awake						= "SVM_6_Awake"					;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//Der Kommandant hat also die Sache mit dir bereinigt.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Vater Parlan hat dich von deiner Schuld befreit.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//Du warst also bei Lee und hast die Sache aus der Welt geschafft.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Gut.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//Du vergreifst dich an Schafen? Ein wehrloseres Opfer konntest du wohl nicht finden?
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//Mit üblen Schlägern will ich nichts zu tun haben!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//Mit Dieben will ich nichts zu tun haben!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//Du willst ein Paladin sein? Warte, was Lord Hagen dazu sagt!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//Gehörst du wirklich zur Stadtwache? Lord Andre wird das nicht dulden!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Geh zu Lord Andre, solange du noch kannst.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Geh zu Vater Parlan. Er wird dir eine Buße auferlegen!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee wird davon erfahren und du wirst dafür zahlen müssen!
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Das wird Kommandant Garond gar nicht gefallen. Sprich mit ihm, bevor alles noch schlimmer wird!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//Gut - du hast gewonnen. Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//(selbstgefällig) Ich denke, dir ist jetzt klar, wen du vor dir hast. Was willst du?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//Du schon wieder? Willst du dich noch mal mit mir anlegen oder was?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 Goldstücke.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//... ich kann das nicht glauben ...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//... ich wär mir da nicht so sicher ...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//... das hat er doch vorher gewusst ...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//... ich weiß langsam nicht mehr, was ich glauben soll ...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//... ich weiß gar nicht, warum er sich so aufregt ...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//... noch mehr Ärger kann ich nicht gebrauchen ...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//... ich hab so einiges gehört ...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//... davon lass ich lieber die Finger ...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//... man darf halt nicht alles glauben, was man hört ...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//... von mir hat er das nicht ...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//... ich habe mir das schon gedacht ...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//... meine Meinung will ja keiner hören ...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//... das hat er wirklich nicht verdient ...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//... sag nicht, dass hast du nicht gewusst ...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//... das war doch klar ...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//... wo hast du das denn schon wieder her ...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//... das kann ja nicht ewig so weitergehen ...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//... ich hab da meine eigene Meinung ...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//... es war genau so, wie du sagst ...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//... ich glaub nicht, dass sich daran was ändert ...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//... das höre ich zum ersten Mal ...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//... wir können nur abwarten ...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//... die Probleme habe ich kommen sehen ...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//... warum hört eigentlich keiner auf mich ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//... der ist gerannt, als ob Beliar selbst hinter ihm her wäre ...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//... wir haben ihn natürlich doch noch gekriegt ...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//... da muss man mal ganz kräftig dazwischen hauen ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//... einige wissen gar nicht, wie sehr sie sich versündigen ...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//... denn so ist Innos' Wille ...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//... seine Taten waren gerecht ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_6_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_6_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_6_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_6_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_6_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe die zum inneren Stadttor hoch führt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_6_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_6_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_6_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//In dem Aufzug machst du dich lächerlich. Zieh dir was Vernünftiges an.
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//Denkst wohl, ich erkenn dich nicht. Verschwinde und zieh dich um.
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//Soldat. Was ist das für Kleidung? Auf der Stelle umziehen!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//Ein Diener Innos' versteckt sich nicht. Geh und hole deine Robe.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//Du läufst rum wie ein Buddler. Zieh dir erst mal was an.

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//Du legst dich mit dem Falschen an, BANDIT!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Zurück auf's Meer, PIRAT!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_7_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_7_Weather"						;//Scheißwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//DU schon wieder!
	DieEnemy					=	"SVM_7_DieEnemy"					;//Ich mach dich fertig!
	DieMonster					=	"SVM_7_DieMonster"					;//Schon wieder eins von diesen Biestern!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Du mieser kleiner Dieb!
	HandsOff					=	"SVM_7_HandsOff"					;//Nimm deine Finger weg da!
	SheepKiller					=	"SVM_7_SheepKiller"					;//Hey! Lass unsere Schafe in Ruhe!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//Das Biest frisst unsere Schafe!
	YouMurderer					=	"SVM_7_YouMurderer"					;//Mörder!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//Was will DAS Vieh denn hier?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//Jetzt kannst du was erleben!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Du hast es nicht anders gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//Wer nicht hören will, muss fühlen.
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//Was wolltet du da drin, he!?
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Stirb!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//So ein dämlicher Mistkerl ...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//So, das war's mit dir, du Mistvieh!
	ThiefDown					=	"SVM_7_ThiefDown"					;//Lass in Zukunft die Finger von meinen Sachen, klar?
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//Behalt in Zukunft deine Finger bei dir!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//Vergreif dich nie wieder an unseren Schafen!
	KillMurderer				=	"SVM_7_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//Versuch das nicht noch mal, Bürschchen!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Lass dir das eine Lehre sein,
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Steh auf und mach, dass du hier rauskommst!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//Ich will dich nie wieder da drinnen sehen, klar?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//Wenn hier einer Schläge verteilt, dann bin ich das, kapiert?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Lass mich bloß in Ruhe!
	RunAway						= 	"SVM_7_RunAway"						;//Scheiße! Nichts wie weg!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//ALARM!
	Guards						=	"SVM_7_Guards"					;//WACHE!
	Help						=	"SVM_7_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//(ruft zu) Ja! So muss man's den Biestern geben!
	GoodKill					= 	"SVM_7_GoodKill"				;//(ruft) Das hat die Sau verdient!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//(ruft laut) Wir sprechen uns noch!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Raus!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//Was hast du hier zu suchen?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//Hau bloß ab!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//Was schleichst du denn da rum?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//(wacht auf) Was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//Danke für das Gold, du Held!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//Du arme Wurst, hast ja nicht mal Gold dabei!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//Die Waffe nehm ich mal besser an mich!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//(warnt) Pass auf! Noch mal und ich verpass dir eine.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//(agressiv) Willst du noch mal was aufs Maul?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//Hör auf mit dieser Magie-Scheiße!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Willst du Schläge? Hör sofort damit auf!!!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Steck endlich die Scheiß-Waffe weg!
	WiseMove					=	"SVM_7_WiseMove"				;//Kluges Kerlchen!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//(zu sich selbst) Das nächste Mal werden wir ja sehen ...
	OhMyHead					=	"SVM_7_OhMyHead"				;//(zu sich selbst) Oh Mann, mein Kopf ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//(gierig) Ah, ein Kampf!
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//(bestürzt) Mein Gott, ein Kampf!
	GoodVictory					=	"SVM_7_GoodVictory"				;//(böse lachend) Dem hast du's gezeigt!
	NotBad						= 	"SVM_7_NotBad"					;//(anerkennend) Nicht schlecht ...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//(zu sich selbst) Mein Gott! Wie brutal ...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//Ja, gib's ihm!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Zeig's ihm!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Mach ihn fertig!
	Ooh01						=	"SVM_7_Ooh01"					;//Wehr dich!
	Ooh02						=	"SVM_7_Ooh02"					;//Schlag doch zurück!
	Ooh03						=	"SVM_7_Ooh03"					;//Uh! Das tat weh!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//(zu sich selbst, wacht auf) Verdammt, Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Raus aus meinem Bett!
	Awake						= "SVM_7_Awake"						;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//Der Kommandant hat also die Sache für dich in Ordnung gebracht.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//Du hast also bei Vater Parlan für deine Taten gebüßt.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//Ich hörte, Lee hat's noch mal für dich hingebogen.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Gut.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Schafe schlachten ist das Letzte! Verschwinde!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Du bist ein Schläger - hau ab!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Verfluchter Dieb! - Für dich habe ich nichts mehr übrig!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//Von einem Paladin hätte ich mehr erwartet! Lord Hagen wird nicht erfreut sein.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//Dass so einer wie du überhaupt bei der Stadtwache ist! Lord Andre wird dich dafür zahlen lassen!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Lord Andre wird von deinem Verhalten erfahren!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Vater Parlan wird erzürnt sein über deinen Frevel!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Damit wird Lee dich nicht davonkommen lassen!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Das wird Kommandant Garond nicht gerne hören - dafür musst du zahlen!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//Du hast ja 'nen ganz schönen Schlag drauf ... Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//(selbstgefällig) Noch Fragen?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//Da bist du ja wieder!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 Goldstücke.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//... ist das wirklich wahr ...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//... ich hab was Anderes gehört ...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//... sag mir nicht, du hast das nicht gewusst ...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//... man weiß gar nicht mehr, wem man noch glauben kann ...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//... das ist doch alles nur Gerede ...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//... meinst du, mir geht es besser ...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//... ich wunder mich über gar nichts mehr ...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//... das ist wirklich nicht mein Problem ...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//... glaubst du wirklich daran ...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//... von mir erfährt keiner was ...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//... das war doch schon vorher klar ...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//... er hat auf die falsche Leute gehört ...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//... wenn er das nicht sieht, kann ich ihm auch nicht mehr helfen ...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//... ich erzähl dir doch nichts Neues ...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//... von selbst ist er da nicht drauf gekommen ...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//... das ist doch lange bekannt ...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//... das ist ne schlimme Sache ...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//... ich hätte das anders gemacht ...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//... ich bin ganz deiner Meinung ...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//... wird sich das jemals ändern ...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//... das habe ich noch gar nicht gewusst ...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//... da kannst du eh nichts dran ändern ...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//... das wundert mich nicht ...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//... er musste es ja besser wissen ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//... es kommt nur auf die Kraft an, also komm mir nicht so ...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//... er weiß ja nicht mal, wie er ein Schwert hält ...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//... ja, das hat er wirklich behauptet ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//... jemand wird dafür büßen müssen ...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//... Innos leuchtet all denen, die seine Weisheit erkennen ...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//... letztendlich wird die Gerechtigkeit siegen ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_7_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_7_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_7_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_7_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_7_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hoch führt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_7_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_7_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_7_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Warum die Verkleidung? So rede ich nicht mit dir.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//Wie läufst du denn hier rum? Trage gefälligst unsere Rüstung.
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//Das ist ein Verstoß gegen die Kleiderordnung der Armee. Zieh dich auf der Stelle um.
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Du solltest besser deine Robe tragen. Bis dahin werde ich schweigen und für dich beten.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//Was willst du? Du gehörst nicht zu uns. Du trägst ja nicht mal unsere Rüstung.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Stirb, du elender Bandit.
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Stirb, du elender Pirat.
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_8_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_8_Weather"					;//So ein Mistwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//Jetzt krieg ich dich aber!
	DieEnemy					=	"SVM_8_DieEnemy"					;//Ich mach dich fertig!
	DieMonster					=	"SVM_8_DieMonster"					;//Da ist wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Na warte, du dreckiger Dieb!
	HandsOff					=	"SVM_8_HandsOff"					;//Finger weg da!
	SheepKiller					=	"SVM_8_SheepKiller"				;//Der Mistkerl schlachtet unsere Schafe!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//Das verdammte Mistvieh frisst unsere Schafe!
	YouMurderer					=	"SVM_8_YouMurderer"				;//Mörder!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Na warte, du Mistkerl!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Du hast es so gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//Du willst nicht gehen? Na gut!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//Was hattest du da drin zu suchen?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Stirb, Mistkerl!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//Das hast du verdient, Mistkerl!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//Ein Mistvieh weniger!
	ThiefDown					=	"SVM_8_ThiefDown"					;//Versuch nie wieder, mich zu bestehlen!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Tu das nie wieder! Das sind unsere Schafe!
	KillMurderer				=	"SVM_8_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//Leg dich nie wieder mit mir an!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//Du hättest auf mich hören sollen!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//Und jetzt sieh zu, dass du hier verschwindest!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//Und lass dich ja nie wieder da drinnen erwischen!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Tu mir nichts!
	RunAway						= 	"SVM_8_RunAway"					;//Ach du Scheiße!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//ALARM!
	Guards						=	"SVM_8_Guards"					;//WACHE!
	Help						=	"SVM_8_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//(ruft zu) Gut gemacht - ein Drecksvieh weniger!
	GoodKill					= 	"SVM_8_GoodKill"				;//(ruft) Ja, mach das Schwein fertig!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//(ruft laut) Ja! Renn, so schnell du kannst!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Raus hier!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//Was suchst du hier!? Geh!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//Ja, mach, dass du wegkommst!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//Hey du! Was schleichst du da rum?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//(wacht auf) Verdammt, was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//Danke für das Gold, du Held!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//Du arme Wurst, hast ja nicht mal Gold dabei!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//Die Waffe nehm ich mal besser an mich!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//(warnt) Pass auf! Noch mal und ich verpass dir eine.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//Hast du immer noch nicht genug?!
	StopMagic					=	"SVM_8_StopMagic"				;//Hör auf mit dieser Magie-Scheiße!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Willst du Schläge? Hör sofort auf damit!!!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Steck endlich die Scheißwaffe weg!
	WiseMove					=	"SVM_8_WiseMove"				;//Kluges Kerlchen!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//(zu sich selbst) Das nächste Mal werden wir ja sehen ...
	OhMyHead					=	"SVM_8_OhMyHead"				;//(zu sich selbst) Oh Mann, mein Kopf ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//(gierig) Ah, ein Kampf!
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//(bestürzt) Mein Gott, ein Kampf!
	GoodVictory					=	"SVM_8_GoodVictory"			;//(böse lachend) Dem hast du's gezeigt!
	NotBad						= 	"SVM_8_NotBad"					;//(anerkennend) Nicht schlecht ...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//(zu sich selbst) Mein Gott! Wie brutal ...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Schlag zu!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Gib alles!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Zeig's ihm!
	Ooh01						=	"SVM_8_Ooh01"					;//Bleib dran!
	Ooh02						=	"SVM_8_Ooh02"					;//Vorsicht!
	Ooh03						=	"SVM_8_Ooh03"					;//Oh! Der hat gesessen!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Raus aus meinem Bett!
	Awake						= "SVM_8_Awake"					;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//Du warst also beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//Du warst also bei Vater Parlan und hast Buße getan.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//Du warst also bei Lee und hast die Sache wieder in Ordnung gebracht.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//Das ist gut.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Einfach unsere Schafe zu schlachten!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Lass mich in Ruhe, du brutaler Mistkerl!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Lass mich in Ruhe, du mieser kleiner Dieb!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//Du bist eine Schande für deinen Orden! Warte, bis Lord Hagen davon erfährt!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//Du bist eine Schande für die Stadtwache! Warte, bis Lord Andre davon hört!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Warte, bis Lord Andre davon hört.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Warte, bis Vater Parlan davon hört!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Warte, bis Lee davon hört ...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Warte, bis Kommandant Garond davon hört!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Okay, okay, du bist der Bessere von uns beiden! Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//(selbstgefällig) Ich nehme an, du hast mittlerweile begriffen, wer von uns beiden der Stärkere ist ... was willst du?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//Ich dachte, du wolltest dich mit mir anlegen. Hast du's dir anders überlegt? Willst doch lieber REDEN, was? (lacht) Ja klar.
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 Goldstücke.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//... ist das wirklich wahr ...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//... ich hab was anderes gehört ...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//... sag mir nicht, du hast das nicht gewusst ...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//... man weiß gar nicht mehr, wem man noch glauben kann ...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//... das ist doch alles nur Gerede ...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//... meinst du, mir geht es besser ...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//... ich wunder mich über gar nichts mehr ...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//... das ist wirklich nicht mein Problem ...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//... glaubst du wirklich daran ...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//... von mir erfährt keiner was ...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//... das war doch schon vorher klar ...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//... er hat auf die falschen Leute gehört ...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//... wenn er das nicht sieht, kann ich ihm auch nicht mehr helfen ...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//... ich erzähl dir doch nichts Neues ...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//... von selbst ist er nicht darauf gekommen ...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//... das ist doch lange bekannt ...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//... das ist 'ne schlimme Sache ...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//... ich hätte das anders gemacht ...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//... ich bin ganz deiner Meinung ...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//... wird sich das jemals ändern ...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//... das habe ich noch gar nicht gewusst ...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//... da kannst du eh nichts dran ändern ...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//... das wundert mich nicht ...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//... er musste es ja besser wissen ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//... es kommt nur auf die Kraft an, also komm mir nicht so ...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//... der weiß ja nicht mal, wie man ein Schwert hält ...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//... ja, das hat er wirklich behauptet ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//... jemand wird dafür büßen müssen ...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//... Innos leuchtet all denen, die seine Weisheit erkennen ...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//... letztendlich wird die Gerechtigkeit siegen ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_8_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_8_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_8_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_8_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_8_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//Wenn du vor dem Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbeigehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlanggehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_8_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_8_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_8_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//Ich trau dir nicht. Irgendetwas stimmt nicht mit dir oder mit deiner Kleidung.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//So wie du aussiehst, hast du wohl woanders angeheuert? Dann will ich nichts mit dir zu tun haben.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Wir müssen Präsenz zeigen. Also geh und hol deine Rüstung.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos will, dass wir seine Robe mit Stolz tragen. Geh und ziehe dich um.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//Mit Buddlern rede ich nicht. Du hast ja nicht mal 'ne Rüstung.

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//Du dreckiger Bandit!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//PIRATEN!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_9_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_9_Weather"						;//Sauwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Jetzt krieg' ich dich!
	DieEnemy					=	"SVM_9_DieEnemy"					;//Du wärst besser nicht hierher gekommen!
	DieMonster					=	"SVM_9_DieMonster"					;//Komm her, Mistvieh!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//Schon wieder eins von diesen Biestern!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//Da ist wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Dreckiger Dieb! Na warte!
	HandsOff					=	"SVM_9_HandsOff"					;//Nimm deine Pfoten da weg!
	SheepKiller					=	"SVM_9_SheepKiller"				;//Lass unsere Schafe in Ruhe!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Geh weg von unseren Schafen, du Mistvieh!
	YouMurderer					=	"SVM_9_YouMurderer"				;//Mörder!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//Das wirst du bereuen!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Ich hatte dich gewarnt!
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//Ich hab gesagt RAUS!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Hey! Was wolltest du da drin?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//Aufhören! Sofort!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//Jetzt spieß ich dich auf, Mistkerl!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//Das war's für dich...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Scheiße!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//Das war's mit dir, Mistvieh!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//EIN Mistvieh weniger!
	ThiefDown					=	"SVM_9_ThiefDown"					;//Ich warne dich! Versuch das nicht noch mal, du dreckiger Dieb!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//Vergreif dich nie wieder an Sachen, die dir nicht gehören!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//Und halt dich in Zukunft von unseren Schafen fern!
	KillMurderer				=	"SVM_9_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//Wag es ja nie wieder, mich anzugreifen!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//Ich hatte dich gewarnt!
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//Und jetzt raus mit dir!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//Ich will dich nie wieder da drin sehen, klar?
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//Hier wird nicht gekämpft, merk dir das!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Mach kein' Scheiß!
	RunAway						= 	"SVM_9_RunAway"						;//Ich hau ab!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//ALARM!
	Guards						=	"SVM_9_Guards"					;//WACHE!
	Help						=	"SVM_9_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//(ruft zu) Gib den Viechern ordentlich saures!
	GoodKill					= 	"SVM_9_GoodKill"				;//(ruft) Ja, gib's dem Mistkerl!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//(ruft laut) Ich krieg dich noch!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Raus hier!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//Du hast hier nichts zu suchen!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//Ja, raus mit dir!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//Was soll das denn werden? Warum schleichst du hier rum?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//(wacht auf) Verdammt, was willst du?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Na, immerhin hast du wenigstens Gold dabei!
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Noch nicht mal Gold - hmpf.
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Deine Waffe nehme ich mal mit.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//(warnt) Junge! Mach das ja nicht noch mal!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//(agressiv) Brauchst du schon wieder Schläge?
	StopMagic					=	"SVM_9_StopMagic"				;//Weg mit der Magie!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Letzte Warnung! Weg mit der Magie!
	WeaponDown					=	"SVM_9_WeaponDown"				;//Weg mit der Waffe!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Weg damit oder ich verpass dir eine!
	WiseMove					=	"SVM_9_WiseMove"				;//Du bist ja gar nicht so dumm wie du aussiehst!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//(zu sich selbst) Versuch das ja nicht noch mal ...
	OhMyHead					=	"SVM_9_OhMyHead"				;//(zu sich selbst) Oh! Mein Schädel ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//(gierig) Jetzt wird's lustig ...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//(bestürzt) Du meine Güte ...
	GoodVictory					=	"SVM_9_GoodVictory"			;//(böse lachend) Das wird ihm eine Lehre sein ...
	NotBad						= 	"SVM_9_NotBad"					;//(anerkennend) Der hat gesessen!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//(zu sich selbst) Brutaler Mistkerl!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Hau drauf!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//Hör nicht auf!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Mach ihn fertig!
	Ooh01						=	"SVM_9_Ooh01"					;//Pass auf!
	Ooh02						=	"SVM_9_Ooh02"					;//Parier doch!
	Ooh03						=	"SVM_9_Ooh03"					;//Scheiße, das tat weh!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Raus aus meinem Bett!
	Awake						= "SVM_9_Awake"					;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//Der Kommandant hat also die Sache mit dir bereinigt.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Vater Parlan hat dich von deiner Schuld befreit.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//Du warst also bei Lee und hast die Sache aus der Welt geschafft.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Gut.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//Du vergreifst dich an Schafen? Ein wehrloseres Opfer konntest du wohl nicht finden?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//Mit üblen Schlägern will ich nichts zu tun haben!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//Mit Dieben will ich nichts zu tun haben!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//Du willst ein Paladin sein? Warte, was Lord Hagen dazu sagt!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//Gehörst du wirklich zur Stadtwache? Lord Andre wird das nicht dulden!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Geh zu Lord Andre solange du noch kannst.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Geh zu Vater Parlan. Er wird dir eine Buße auferlegen!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee wird davon erfahren und du wirst dafür zahlen müssen!
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Das wird Kommandant Garond gar nicht gefallen. Sprich mit ihm, bevor alles noch schlimmer wird!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//Gut - du hast gewonnen. Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//(selbstgefällig) Ich denke, dir ist jetzt klar, wen du vor dir hast. Was willst du?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//Du schon wieder? Willst du dich noch mal mit mir anlegen oder was?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 Goldstücke.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//... ich kann das nicht glauben ...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//... ich wär mir da nicht so sicher ...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//... das hat er doch vorher gewusst ...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//... ich weiß langsam nicht mehr, was ich glauben soll ...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//... ich weiß gar nicht, warum er sich so aufregt ...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//... noch mehr Ärger kann ich nicht gebrauchen ...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//... ich hab so einiges gehört ...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//... davon lass ich lieber die Finger ...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//... man darf halt nicht alles glauben, was man hört ...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//... von mir hat er das nicht ...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//... ich habe mir das schon gedacht ...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//... meine Meinung will ja keiner hören ...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//... das hat er wirklich nicht verdient ...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//... sag nicht, das hast du nicht gewusst ...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//... das war doch klar ...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//... wo hast du das denn schon wieder her ...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//... das kann ja nicht ewig so weitergehen ...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//... ich hab da meine eigene Meinung ...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//... es war genau so, wie du sagst ...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//... ich glaub nicht, dass sich daran was ändert ...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//... das höre ich zum ersten Mal ...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//... wir können nur abwarten ...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//... die Probleme habe ich kommen sehen ...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//... warum hört eigentlich keiner auf mich ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//... der ist gerannt, als wenn Beliar selbst hinter ihm her wär ...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//... wir haben ihn natürlich doch noch gekriegt ...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//... da muss man mal ganz kräftig dazwischenhauen ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//... einige wissen gar nicht, wie sehr sie sich versündigen ...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//... denn so ist es Innos' Wille ...
	Smalltalk30					= "SVM_9_Smalltalk30"				;//... seine Taten waren gerecht ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_9_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_9_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_9_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_9_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_9_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbeigehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlanggehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, und dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_9_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_9_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_9_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//Was soll der Aufzug? Zieh dir was an, was zu dir passt.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//Wie rennst du denn rum? Zieh dir gefälligst deine Rüstung an.
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Du arbeitest für den König, also trägst du auch gefälligst seine Rüstung. Zieh dich um.
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//Deine Kleidung ist unserem Orden nicht angemessen. Zieh dich um.
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//Hast ja noch nicht mal 'ne Rüstung. Verschwinde!

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//Jetzt bist du dran, Bandit!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//Du hättest hier nicht auftauchen sollen, Pirat.
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_10_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_10_Weather"						;//Scheißwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//DU schon wieder!
	DieEnemy					=	"SVM_10_DieEnemy"					;//Ich mach dich fertig!
	DieMonster					=	"SVM_10_DieMonster"					;//Schon wieder eins von diesen Biestern!
	DirtyThief					=	"SVM_10_DirtyThief"					;//Du mieser kleiner Dieb!
	HandsOff					=	"SVM_10_HandsOff"					;//Nimm die Finger weg da!
	SheepKiller					=	"SVM_10_SheepKiller"					;//Hey! Lass unsere Schafe in Ruhe!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//Das Biest frisst unsere Schafe!
	YouMurderer					=	"SVM_10_YouMurderer"					;//Mörder!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//Was will DAS Vieh denn hier?
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//Jetzt kannst du was erleben!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//Du hast es nicht anders gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//Wer nicht hören will, muss fühlen.
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//Was wolltet du da drin, he!?
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Stirb!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//So ein dämlicher Mistkerl ...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//So, das war's mit dir, du Mistvieh!
	ThiefDown					=	"SVM_10_ThiefDown"					;//Lass in Zukunft die Finger von meinen Sachen, klar?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//Behalt in Zukunft deine Finger bei dir!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//Vergreif dich nie wieder an unseren Schafen!
	KillMurderer				=	"SVM_10_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Versuch das nicht noch mal, Bürschchen!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Lass dir das eine Lehre sein.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Steh auf und mach, dass du hier rauskommst!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//Ich will dich nie wieder da drinnen sehen, klar?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//Wenn hier einer Schläge verteilt, dann bin ich das, kapiert?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Lass mich bloß in Ruhe!
	RunAway						= 	"SVM_10_RunAway"						;//Scheiße! Nichts wie weg!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//ALARM!
	Guards						=	"SVM_10_Guards"					;//WACHE!
	Help						=	"SVM_10_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//(ruft zu) Ja! So muss man's den Biestern geben!
	GoodKill					= 	"SVM_10_GoodKill"				;//(ruft) Das hat die Sau verdient!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//(ruft laut) Wir sprechen uns noch!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Raus!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//Was hast du hier zu suchen?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Ja, hau ab!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//Was schleichst du denn da rum?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//(wacht auf) Was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//Danke für das Gold, du Held!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Du armes Würstchen, hast ja nicht mal Gold dabei!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Die Waffe nehm ich mal besser an mich!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//(warnt) Pass auf! Noch mal und ich verpass dir eine.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//(agressiv) Willst du noch mal was aufs Maul?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//Hör auf mit dieser Magie-Scheiße!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Willst du Schläge? Hör sofort damit auf!!!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Steck endlich die Scheißwaffe weg!!
	WiseMove					=	"SVM_10_WiseMove"				;//Kluges Kerlchen!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//(zu sich selbst) Das nächste Mal werden wir ja sehen ...
	OhMyHead					=	"SVM_10_OhMyHead"				;//(zu sich selbst) Oh Mann, mein Kopf ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//(gierig) Ah, ein Kampf!
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//(bestürzt) Mein Gott, ein Kampf!
	GoodVictory					=	"SVM_10_GoodVictory"				;//(böse lachend) Dem hast du's gezeigt!
	NotBad						= 	"SVM_10_NotBad"					;//(anerkennend) Nicht schlecht ...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//(zu sich selbst) Mein Gott! Wie brutal ...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Ja, gib's ihm!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Zeig's ihm!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Mach ihn fertig!
	Ooh01						=	"SVM_10_Ooh01"					;//Wehr dich!
	Ooh02						=	"SVM_10_Ooh02"					;//Schlag doch zurück!
	Ooh03						=	"SVM_10_Ooh03"					;//Uh! Das tat weh!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//(zu sich selbst, wacht auf) Verdammt, was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Raus aus meinem Bett!
	Awake						= "SVM_10_Awake"						;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//Der Kommandant hat also die Sache für dich in Ordnung gebracht.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//Du hast also bei Vater Parlan für deine Taten gebüßt.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//Ich hörte, Lee hat's noch mal für dich hingebogen.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//Na gut.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Schafe schlachten ist das Letzte! Verschwinde!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Du bist ein Schläger - hau ab!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Verfluchter Dieb! - Für dich habe ich nichts mehr übrig!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//Von einem Paladin hätte ich mehr erwartet! Lord Hagen wird nicht erfreut sein.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//Dass so einer wie du überhaupt bei der Stadtwache ist! Lord Andre wird dich dafür zahlen lassen!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Lord Andre wird von deinem Verhalten erfahren!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Vater Parlan wird erzürnt sein über deinen Frevel!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Damit wird Lee dich nicht davonkommen lassen!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Das wird Kommandant Garond nicht gerne hören - dafür musst du zahlen!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//Du hast ja 'nen ganz schönen Schlag drauf ... Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//(selbstgefällig) Noch Fragen?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//Da bist du ja wieder!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 Goldstücke.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//... das interessiert mich nicht ...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//... das will doch keiner wissen ...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//... es war doch seine Entscheidung ...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//... keine Ahnung, sag du es mir ...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//... ich werde mich da nicht einmischen ...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//... ich hab für so etwas keine Zeit ...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//... ich könnte mir so etwas nicht erlauben ...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//... mir brauchst du das nicht zu sagen ...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//... erzähl mir nichts, ich kenne so was ...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//... ich könnte dir Sachen erzählen ...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//... da kann man sich nicht drauf verlassen ...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//... das habe ich früher auch immer gesagt ...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//... und glaub ja nicht, dass das alles ist ...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//... immer wieder das gleiche ...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//... das kann doch nicht wahr sein ...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//... irgendwann musste es ja so kommen ...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//... das hätte er auch selbst wissen können ...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//... das wird sich nie ändern ...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//... das ist kein Geheimnis ...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//... das war keine große Sache ...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//... er stellt sich das immer so einfach vor ...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//... das will doch keiner mehr hören ...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//... ist doch wahr ...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//... da muss man einfach mal zuhören ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//... wenn wir nicht gekommen wären, wäre die Sache anders ausgegangen ...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//...der muss einfach mehr trainieren...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//... der soll mir nichts von Pflicht erzählen ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//... Innos' Strafe ist gerecht ...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//... der Pfad der Tugend ist lang und steinig ...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//... nur Innos entscheidet über Recht und Unrecht ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist zu gut.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_10_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_10_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_10_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_10_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_10_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbeigehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlanggehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppe rauf.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_10_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_10_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_10_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//Was ist das für Kleidung? Sie passt nicht zu dir. Lass mich in Ruhe.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Wenn du zu uns gehörst, solltest du auch unsere Klamotten tragen. Zieh dich erst mal um.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Wenn man dir die Rüstung des Königs gibt, dann trage sie auch gefälligst.
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Wenn du die Robe verleugnest, verleugnest du Innos. Geh und denk darüber nach.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Wenn du dir noch nicht mal eine Rüstung leisten kannst, warum soll ich mich dann mit dir unterhalten?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//Du dreckiger Bandit!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//Du dreckiger Pirat!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//(ruft) Warte!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_11_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_11_Weather"						;//So ein Mistwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//Krieg ich dich DOCH noch!
	DieEnemy					=	"SVM_11_DieEnemy"					;//Jetzt bist du dran!
	DieMonster					=	"SVM_11_DieMonster"					;//Da ist wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_11_DirtyThief"					;//Na warte, du dreckiger Dieb!
	HandsOff					=	"SVM_11_HandsOff"					;//Finger weg da!
	SheepKiller					=	"SVM_11_SheepKiller"					;//Der Mistkerl schlachtet unsere Schafe!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//Das verdammte Mistvieh frisst unsere Schafe!
	YouMurderer					=	"SVM_11_YouMurderer"					;//Mörder!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Na warte, du Mistkerl!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//Du hast es so gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Dann muss ich dich eben rausprügeln!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//Was hattest DU denn da drin zu suchen, he!?
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Stirb, Mistkerl!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//Das war's für dich, Penner.
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//Ein Mistvieh weniger!
	ThiefDown					=	"SVM_11_ThiefDown"					;//Versuch nie wieder, mich zu bestehlen!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Tu das nie wieder! Das sind unsere Schafe!
	KillMurderer				=	"SVM_11_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//Leg dich nie wieder mit mir an!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//Du hättest auf mich hören sollen!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//Und jetzt mach, dass du hier rauskommst!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//Und dass ich dich nie wieder da drin erwische!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Lass mich bloß in Ruhe!
	RunAway						= 	"SVM_11_RunAway"						;//Scheiße! Nichts wie weg!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//ALARM!
	Guards						=	"SVM_11_Guards"						;//WACHE!
	Help						=	"SVM_11_Help"						;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//(ruft zu) Gut gemacht - ein Drecksvieh weniger!
	GoodKill					= 	"SVM_11_GoodKill"					;//(ruft) Ja, mach das Schwein fertig!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//(ruft laut) Bleib stehen, du Lump!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Raus hier!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//Was suchst du hier!? Geh!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//Ja, mach, dass du wegkommst!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//Hey du! Was schleichst du da rum?
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//(wacht auf) Verdammt, was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//Gold! Das ist schon mal meins ...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//Du hast noch nicht mal Gold dabei?
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Deine Waffe nehm ich mal lieber mit.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//(warnt) Hey! Pass auf!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//(agressiv) Hast du immer noch nicht genug?!
	StopMagic					=	"SVM_11_StopMagic"					;//Geh bloß weg mit deiner Magie!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//Weg mit der Magie! Hörst du schlecht!?
	WeaponDown					=	"SVM_11_WeaponDown"					;//Weg mit der Waffe!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Hörst du schlecht? Ich sagte: Weg mit der Waffe!
	WiseMove					=	"SVM_11_WiseMove"					;//Na bitte, geht doch!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//(zu sich selbst) Darüber reden wir noch ...
	OhMyHead					=	"SVM_11_OhMyHead"					;//(zu sich selbst) Oh, mein Schädel ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//(gierig) Jetzt geht's zur Sache!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//(bestürzt) Die hauen sich den Schädel ein ...
	GoodVictory					=	"SVM_11_GoodVictory"					;//(böse lachend) Das hat er verdient.
	NotBad						= 	"SVM_11_NotBad"						;//(anerkennend) Gar nicht so übel ...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//(zu sich selbst) Was für ein brutaler Kerl ...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Ja, so ist's gut!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Na, mach schon!
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//Immer feste drauf!
	Ooh01						=	"SVM_11_Ooh01"						;//Lass dir nichts gefallen!
	Ooh02						=	"SVM_11_Ooh02"						;//Den wirst du ja wohl schaffen!
	Ooh03						=	"SVM_11_Ooh03"						;//Das gibt's doch gar nicht!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Raus aus meinem Bett!
	Awake						= "SVM_11_Awake"							;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//Ich hörte, du warst beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//Ich hörte, du warst bei Vater Parlan und hast Buße getan.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//Ich hörte, du warst bei Lee und hast die Sache wieder in Ordnung gebracht.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//Das ist gut.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Einfach unsere Schafe zu schlachten! Mach, dass du hier wegkommst!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//Mit miesen Schlägern rede ich nicht!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//Geh mir aus den Augen, dreckiger Dieb!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//Du bist eine Schande für deinen Orden! Lord Hagen wird toben vor Wut!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//Du bist eine Schande für die Stadtwache! Lord Andre wird dir das sicher austreiben!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Lord Andre wird von deiner Tat erfahren!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Dein Frevel wird Vater Parlan sicherlich nicht erfreuen!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Lee wird dir die Hammelbeine lang ziehen! Wirst schon sehen, was du davon hast!
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Kommandant Garond wird dich zur Rechenschaft ziehen!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//Ist ja schon gut, du hast gewonnen. Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//(selbstgefällig) Muss ich dir noch mal zeigen, wer hier der Herr ist?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Willst du dich noch mal mit mir anlegen oder was?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 Goldstücke.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 Goldstücke.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 Goldstücke.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 Goldstücke.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 Goldstücke.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 Goldstücke.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 Goldstücke.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 Goldstücke.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 Goldstücke.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 Goldstücke.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 Goldstücke.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 Goldstücke.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 Goldstücke.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 Goldstücke.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 Goldstücke.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 Goldstücke.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 Goldstücke.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 Goldstücke.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 Goldstücke.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 Goldstücke.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 Goldstücke.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 Goldstücke.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 Goldstücke.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 Goldstücke.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 Goldstücke.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 Goldstücke.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 Goldstücke.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//... glaubst du wirklich ...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//... möglich ist alles ...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//... das hätte er doch besser wissen müssen ...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//... als ob ich nicht schon genug Probleme hätte ...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//... wer erzählt denn so was ...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//... das gibt doch nur noch mehr Ärger ...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//... man erzählt sich ja so einiges ...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//... ich hätte das nicht gemacht ...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//... das sind doch alles nur Gerüchte ...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//... man muss eben aufpassen, was man so rumerzählt ...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//... das hätte ich dir vorher sagen können ...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//... mich fragt ja keiner ...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//... der arme Kerl kann einem Leid tun ...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//... das ist doch nichts Neues ...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//... das liegt doch auf der Hand ...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//... mich brauchst du das nicht zu fragen ...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//... das kann ja nicht ewig so weitergehen ...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//... meine Meinung kennst du ja schon ...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//... genau das hab ich auch gesagt ...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//... daran wird dich nie was ändern ...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//... warum erfahre ich das erst jetzt ...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//... lass uns erstmal abwarten, was daraus wird ...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//... einige Probleme erledigen sich von selbst ...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//... ich kann das nicht mehr hören ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//... der war doch sturzbetrunken ...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//... mit mir kann man so was nicht machen ...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//... alle sind gerannt wie die Hasen, ich war ganz allein ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//... so steht es in den heiligen Schriften ...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//... ich handle stets in Innos' Namen ...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//... niemand darf gegen die göttliche Ordnung verstoßen ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_11_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_11_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_11_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_11_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_11_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbeigehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlanggehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_11_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_11_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_11_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//Was ist das für Kleidung? Sie passt nicht zu dir. Lass mich in Ruhe.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Trage gefälligst unsere Rüstung, wenn ich mit dir rede. Los, verschwinde.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//Trage gefälligst die Rüstung des Königs. Los geh schon.
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//Deine Kleidung ist unserem Orden nicht angemessen. Zieh dich um.
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//Hast ja noch nicht mal 'ne Rüstung. Verschwinde!

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Schon wieder ein Bandit.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//PIRATEN!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_12_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_12_Weather"					;//Sauwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Jetzt krieg ich dich!
	DieEnemy					=	"SVM_12_DieEnemy"					;//Du wärst besser nicht hierher gekommen!
	DieMonster					=	"SVM_12_DieMonster"					;//Komm her, Mistvieh!
	DirtyThief					=	"SVM_12_DirtyThief"					;//Dreckiger Dieb! Na warte!
	HandsOff					=	"SVM_12_HandsOff"					;//Nimm deine Pfoten da weg!
	SheepKiller					=	"SVM_12_SheepKiller"				;//Lass unsere Schafe in Ruhe!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//Geh weg von unseren Schafen, du Mistvieh!
	YouMurderer					=	"SVM_12_YouMurderer"				;//Mörder!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//Das wirst du bereuen!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//Ich habe dich gewarnt!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//Ich hab gesagt RAUS!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Hey! Was wolltest du da drin?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//Aufhören! Sofort!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//Jetzt spieß ich dich auf, Mistkerl!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//Das war's für dich ...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//Ich steh auf diese ganze Scheiße!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//EIN Mistvieh weniger!
	ThiefDown					=	"SVM_12_ThiefDown"					;//Ich warne dich! Versuch das nicht noch mal, du dreckiger Dieb!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//Vergreif dich nie wieder an Sachen, die nicht dir gehören!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//Und halt dich in Zukunft von unseren Schafen fern!
	KillMurderer				=	"SVM_12_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//Wag es ja nie wieder, mich anzugreifen!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//Ich hatte dich gewarnt!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//Und jetzt raus mit dir!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//Ich will dich nie wieder da drinnen sehen, klar?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//Hier wird nicht gekämpft, ist das klar?!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Mach kein' Scheiß!
	RunAway						= 	"SVM_12_RunAway"						;//Ich hau ab!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//ALARM!
	Guards						=	"SVM_12_Guards"					;//WACHE!
	Help						=	"SVM_12_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//(ruft zu) Gib den Viechern ordentlich Saures!
	GoodKill					= 	"SVM_12_GoodKill"				;//(ruft) Ja, gib's dem Mistkerl!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//(ruft laut) Dich krieg ich noch!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Raus hier!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//Du hast hier nichts zu suchen!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//Ja, raus mit dir!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//Was soll das denn werden? Warum schleichst du hier rum?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//(wacht auf) Verdammt, was willst du?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Na, immerhin hast du wenigstens Gold dabei!
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Noch nicht mal Gold - hmpf.
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Deine Waffe nehme ich mal mit.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//(warnt) Junge! Mach das ja nicht noch mal!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//(agressiv) Brauchst du schon wieder Schläge?
	StopMagic					=	"SVM_12_StopMagic"				;//Weg mit der Magie!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Letzte Warnung! Weg mit der Magie!
	WeaponDown					=	"SVM_12_WeaponDown"				;//Weg mit der Waffe!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Weg damit oder ich verpass dir eine!
	WiseMove					=	"SVM_12_WiseMove"				;//Du bist ja gar nicht so dumm, wie du aussiehst!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//(zu sich selbst) Versuch das ja nicht noch mal ...
	OhMyHead					=	"SVM_12_OhMyHead"				;//(zu sich selbst) Oh! Mein Schädel ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//(gierig) Jetzt wird's lustig ...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//(bestürzt) Du meine Güte ...
	GoodVictory					=	"SVM_12_GoodVictory"			;//(böse lachend) Das wird ihm eine Lehre sein ...
	NotBad						= 	"SVM_12_NotBad"					;//(anerkennend) Der hat gesessen!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//(zu sich selbst) Brutaler Mistkerl!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//Hau drauf!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Hör nicht auf!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Mach ihn fertig!
	Ooh01						=	"SVM_12_Ooh01"					;//Pass auf!
	Ooh02						=	"SVM_12_Ooh02"					;//Parier doch!
	Ooh03						=	"SVM_12_Ooh03"					;//Scheiße, das tat weh!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Raus aus meinem Bett!
	Awake						= "SVM_12_Awake"					;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//Der Kommandant hat also die Sache mit dir bereinigt.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//Vater Parlan hat dich also von deiner Schuld befreit.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//Du warst also bei Lee und hast die Sache aus der Welt geschafft.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Gut.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//Du vergreifst dich an Schafen? Ein wehrloseres Opfer konntest du wohl nicht finden?
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//Mit üblen Schlägern will ich nichts zu tun haben!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//Mit Dieben will ich nichts zu tun haben!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//Du willst ein Paladin sein? Warte, was Lord Hagen dazu sagt!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//Gehörst du wirklich zur Stadtwache? Lord Andre wird das nicht dulden!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Geh zu Lord Andre, solange du noch kannst.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Geh zu Vater Parlan. Er wird dir eine Buße auferlegen!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee wird davon erfahren und du wirst dafür zahlen müssen!
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Das wird Kommandant Garond gar nicht gefallen. Sprich mit ihm, bevor alles noch schlimmer wird!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//Gut - du hast gewonnen. Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//(selbstgefällig) Ich denke, dir ist jetzt klar, wen du vor dir hast. Was willst du?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//Du schon wieder? Willst du dich noch mal mit mir anlegen oder was?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 Goldstücke.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//... das interessiert mich nicht ...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//... das will doch keiner wissen ...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//... es war doch seine Entscheidung ...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//... keine Ahnung, sag du es mir ...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//... ich werde mich da nicht einmischen ...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//... ich hab für so etwas keine Zeit ...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//... ich könnte mir so etwas nie erlauben ...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//... mir brauchst du das nicht zu sagen ...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//... erzähl mir nichts, ich kenne so was ...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//... ich könnte dir Sachen erzählen ...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//... da kann man sich nicht drauf verlassen ...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//... das habe ich früher auch immer gesagt ...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//... ich glaub ja nicht, dass das alles ist ...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//... immer wieder das gleiche ...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//... das kann doch nicht wahr sein ...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//... irgendwann musste es ja so kommen ...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//... das hätte er auch selbst wissen können ...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//... das wird sich nie ändern ...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//... das ist kein Geheimnis ...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//... das war keine große Sache ...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//... er stellt sich das immer so einfach vor ...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//... das will doch keiner mehr hören ...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//... ist doch wahr ...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//... da muss man auch mal zuhören ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//... wenn wir nicht gekommen wären, wäre die Sache anders ausgegangen ...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//... der muss einfach mehr trainieren ...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//... der soll mir nichts von Pflicht erzählen ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//... Innos' Strafe ist gerecht ...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//... der Pfad der Tugend ist lang und steinig ...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//... nur Innos entscheidet über Recht und Unrecht ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_12_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_12_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_12_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_12_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_12_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbeigehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlanggehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppe rauf.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_12_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_12_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_12_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Deine Kleidung passt einfach nicht zu dir. Zieh dich erst mal um.
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Zieh dir unsere Rüstung an, wenn du mit mir reden willst.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//Ein Soldat trägt die Rüstung des Königs. NICHTS anderes! Also zieh dich um.
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//Deine Kleidung ist unserem Orden nicht angemessen. Zieh dich um.
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Kannst dir ja noch nicht mal eine Rüstung leisten. Mit Schwächlingen rede ich nicht.

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//Ich mach dich fertig, Bandit!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//Ich mach dich fertig, Pirat!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_13_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_13_Weather"					;//So ein Mistwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//Jetzt krieg ich dich aber!
	DieEnemy					=	"SVM_13_DieEnemy"					;//Ich mach dich fertig!
	DieMonster					=	"SVM_13_DieMonster"					;//Da ist wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_13_DirtyThief"					;//Na warte, du dreckiger Dieb!
	HandsOff					=	"SVM_13_HandsOff"					;//Finger weg da!
	SheepKiller					=	"SVM_13_SheepKiller"				;//Der Mistkerl schlachtet unsere Schafe!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//Das verdammte Mistvieh frisst unsere Schafe!
	YouMurderer					=	"SVM_13_YouMurderer"				;//Mörder!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Na warte, du Mistkerl!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//Du hast es so gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//Du willst nicht gehen? Na gut!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//Was hattest du da drin zu suchen?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Stirb, Mistkerl!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//Das hast du verdient, Mistkerl!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//Ein Mistvieh weniger!
	ThiefDown					=	"SVM_13_ThiefDown"					;//Versuch nie wieder, mich zu bestehlen!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Tu das nie wieder! Das sind unsere Schafe!
	KillMurderer				=	"SVM_13_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//Leg dich nie wieder mit mir an!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//Du hättest auf mich hören sollen!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//Und jetzt sieh zu, dass du hier verschwindest!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//Und lass dich ja nie wieder da drinnen erwischen!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Tu mir nichts!
	RunAway						= 	"SVM_13_RunAway"					;//Ach du Scheiße!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//ALARM!
	Guards						=	"SVM_13_Guards"					;//WACHE!
	Help						=	"SVM_13_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//(ruft zu) Gut gemacht - ein Drecksvieh weniger!
	GoodKill					= 	"SVM_13_GoodKill"				;//(ruft) Ja, mach das Schwein fertig!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//(ruft laut) Ja! Renn, so schnell wie du kannst!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Raus hier!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//Was suchst du hier!? Geh!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//Ja, mach, dass du wegkommst!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//Hey du! Was schleichst du da rum.
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//(wacht auf) Verdammt, was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//Danke für das Gold, du Held!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//Du arme Wurst, hast ja nicht mal Gold dabei!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//Die Waffe nehm ich mal besser an mich!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//(warnt) Pass auf! Noch mal und ich verpass dir eine.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//Hast du immer noch nicht genug?!
	StopMagic					=	"SVM_13_StopMagic"				;//Hör auf mit dieser Magie-Scheiße!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Willst du Schläge? Hör sofort damit auf!!!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Steck endlich die Scheißwaffe weg!
	WiseMove					=	"SVM_13_WiseMove"				;//Kluges Kerlchen!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//(zu sich selbst) Das nächste Mal werden wir ja sehen ...
	OhMyHead					=	"SVM_13_OhMyHead"				;//(zu sich selbst) Oh Mann, mein Kopf ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//(gierig) Ah, ein Kampf!
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//(bestürzt) Mein Gott, ein Kampf!
	GoodVictory					=	"SVM_13_GoodVictory"			;//(böse lachend) Dem hast du's gezeigt!
	NotBad						= 	"SVM_13_NotBad"					;//(anerkennend) Nicht schlecht ...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//(zu sich selbst) Mein Gott! Wie brutal ...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//Schlag zu!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Gib alles!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Zeig's ihm!
	Ooh01						=	"SVM_13_Ooh01"					;//Bleib dran!
	Ooh02						=	"SVM_13_Ooh02"					;//Vorsicht!
	Ooh03						=	"SVM_13_Ooh03"					;//Oh! Der hat gesessen!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Raus aus meinem Bett!
	Awake						= "SVM_13_Awake"					;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//Du warst also beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//Du warst also bei Vater Parlan und hast Buße getan.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//Du warst also bei Lee und hast die Sache wieder in Ordnung gebracht.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//Das ist gut.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Einfach unsere Schafe zu schlachten!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Lass mich in Ruhe, du brutaler Mistkerl!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Lass mich in Ruhe, du mieser kleiner Dieb!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//Du bist eine Schande für deinen Orden! Warte, bis Lord Hagen davon hört!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//Du bist eine Schande für die Stadtwache! Warte, bis Lord Andre davon hört!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Warte, bis Lord Andre davon hört.
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Warte, bis Vater Parlan davon hört!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Warte, bis Lee davon hört ...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Warte, bis Kommandant Garond davon hört!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Okay, okay, du bist der Bessere von uns beiden! Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//(selbstgefällig) Ich nehme an, du hast mittlerweile begriffen, wer von uns beiden der Stärkere ist ... was willst du?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//Ich dachte, du wolltest dich mit mir anlegen. Hast du's dir anders überlegt? Willst doch lieber REDEN, was? (lacht)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 Goldstücke.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//... das interessiert mich nicht ...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//... das will doch keiner wissen ...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//... es war doch seine Entscheidung ...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//... keine Ahnung, sag du es mir ...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//... ich werde mich da nicht einmischen ...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//... ich hab für so etwas keine Zeit ...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//... ich könnte mir so etwas nicht erlauben ...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//... mir brauchst du das nicht zu sagen ...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//... erzähl mir nichts, ich kenne so was ...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//... ich könnte dir Sachen erzählen ...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//... da kann man sich nicht drauf verlassen ...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//... das habe ich früher auch immer gesagt ...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//... und glaub ja nicht, dass das alles ist ...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//... immer wieder das Gleiche ...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//... das kann doch nicht wahr sein ...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//... irgendwann musste es ja so kommen ...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//... das hätte er auch selbst wissen können ...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//... das wird sich nie ändern ...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//... das ist kein Geheimnis ...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//... das war keine große Sache ...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//... er stellt sich das immer so einfach vor ...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//... das will doch keiner mehr hören ...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//... ist doch wahr ...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//... da muss man auch mal zuhören ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//... wenn wir nicht gekommen wären, wäre die Sache anders ausgegangen ...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//... der muss einfach mehr trainieren ...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//... der soll mir nichts von Pflicht erzählen ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//... Innos' Strafe ist gerecht ...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//... der Pfad der Tugend ist lang und steinig ...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//... nur Innos entscheidet über Recht und Unrecht ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_13_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_13_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_13_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_13_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_13_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbeigehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlanggehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_13_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_13_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_13_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//Was ist das für Kleidung? Sie passt nicht zu dir. Lass mich in Ruhe.
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//Du hast deine Rüstung nicht an, geh und hol sie.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//Du solltest stolz sein, die Rüstung des Königs zu tragen und nicht mit diesen Klamotten durch die Gegend laufen. Jetzt geh!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Warum trägst du nicht die Kleidung unseres Ordens? Geh und denke darüber nach.
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Hast ja noch nicht mal 'ne Rüstung. Verschwinde!

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//Du dreckiger Bandit.
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//Du elender Pirat!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_14_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_14_Weather"						;//So ein Mistwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//Krieg ich dich DOCH noch!
	DieEnemy					=	"SVM_14_DieEnemy"					;//Jetzt bist du dran!
	DieMonster					=	"SVM_14_DieMonster"					;//Da ist wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_14_DirtyThief"					;//Na warte, du dreckiger Dieb!
	HandsOff					=	"SVM_14_HandsOff"					;//Finger weg da!
	SheepKiller					=	"SVM_14_SheepKiller"					;//Der Mistkerl schlachtet unsere Schafe!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//Das verdammte Mistvieh frisst unsere Schafe!
	YouMurderer					=	"SVM_14_YouMurderer"					;//Mörder!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Na warte, du Mistkerl!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//Du hast es so gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Dann muss ich dich eben rausPRÜGELN!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//Was hattest DU denn da drin zu suchen, he!?
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Stirb, Mistkerl!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//Das war's für dich, Penner.
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//Ein Mistvieh weniger!
	ThiefDown					=	"SVM_14_ThiefDown"					;//Versuch nie wieder, mich zu bestehlen!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Tu das nie wieder! Das sind unsere Schafe!
	KillMurderer				=	"SVM_14_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//Leg dich nie wieder mit mir an!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//Du hättest auf mich hören sollen!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//Und jetzt mach, dass du hier rauskommst!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//Und dass ich dich nie wieder da drin erwische!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Lass mich bloß in Ruhe!
	RunAway						= 	"SVM_14_RunAway"						;//Scheiße! Nichts wie weg!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//ALARM!
	Guards						=	"SVM_14_Guards"						;//WACHE!
	Help						=	"SVM_14_Help"						;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//(ruft zu) Gut gemacht - ein Drecksvieh weniger!
	GoodKill					= 	"SVM_14_GoodKill"					;//(ruft) Ja, mach das Schwein fertig!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//(ruft laut) Bleib stehen, du Lump!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Raus hier!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//Was suchst du hier!? Geh!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//Ja, mach, dass du wegkommst!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//Hey du! Was schleichst du da rum.
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//(wacht auf) Verdammt, was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//Gold! Das ist schon mal meins ...
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//Du hast noch nicht mal Gold dabei?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Deine Waffe nehme ich mal lieber mit.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//(warnt) Hey! Pass auf!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//(agressiv) Hast du immer noch nicht genug?!
	StopMagic					=	"SVM_14_StopMagic"					;//Geh bloß weg mit deiner Magie!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//Weg mit der Magie! Hörst du schlecht!?
	WeaponDown					=	"SVM_14_WeaponDown"					;//Weg mit der Waffe!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Hörst du schlecht? Ich sagte: Weg mit der Waffe!
	WiseMove					=	"SVM_14_WiseMove"					;//Na bitte, geht doch!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//(zu sich selbst) Darüber reden wir noch ...
	OhMyHead					=	"SVM_14_OhMyHead"					;//(zu sich selbst) Oh, mein Schädel ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//(gierig) Jetzt geht's zur Sache!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//(bestürzt) Die hauen sich den Schädel ein ...
	GoodVictory					=	"SVM_14_GoodVictory"					;//(böse lachend) Das hat er verdient.
	NotBad						= 	"SVM_14_NotBad"						;//(anerkennend) Gar nicht so übel ...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//(zu sich selbst) Was für ein brutaler Kerl ...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Ja, so ist's gut!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Na, mach schon!
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//Immer feste drauf!
	Ooh01						=	"SVM_14_Ooh01"						;//Lass dir nichts gefallen!
	Ooh02						=	"SVM_14_Ooh02"						;//Den wirst du ja wohl schaffen!
	Ooh03						=	"SVM_14_Ooh03"						;//Das gibt's doch gar nicht!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Raus aus meinem Bett!
	Awake						= "SVM_14_Awake"							;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//Ich hörte, du warst beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//Ich hörte, du warst bei Vater Parlan und hast Buße getan.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//Ich hörte, du warst bei Lee und hast die Sache wieder in Ordnung gebracht.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//Das ist gut.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Einfach unsere Schafe zu schlachten! Mach, dass du hier wegkommst!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//Mit miesen Schlägern rede ich nicht!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//Geh mir aus den Augen, dreckiger Dieb!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//Du bist eine Schande für deinen Orden! Lord Hagen wird toben vor Wut!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//Du bist eine Schande für die Stadtwache! Lord Andre wird dir das sicher austreiben!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Lord Andre wird von deiner Tat erfahren!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Dein Frevel wird Vater Parlan sicherlich nicht erfreuen!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Lee wird dir die Hammelbeine lang ziehen! Wirst schon sehen, was du davon hast!
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Kommandant Garond wird dich zur Rechenschaft ziehen!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//Ist ja schon gut, du hast gewonnen. Was willst du?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//(selbstgefällig) Muss ich dir noch mal zeigen, wer hier der Herr ist?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Willst du dich noch mal mit mir anlegen oder was?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 Goldstücke.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 Goldstücke.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 Goldstücke.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 Goldstücke.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 Goldstücke.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 Goldstücke.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 Goldstücke.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 Goldstücke.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 Goldstücke.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 Goldstücke.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 Goldstücke.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 Goldstücke.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 Goldstücke.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 Goldstücke.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 Goldstücke.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 Goldstücke.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 Goldstücke.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 Goldstücke.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 Goldstücke.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 Goldstücke.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 Goldstücke.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 Goldstücke.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 Goldstücke.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 Goldstücke.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 Goldstücke.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 Goldstücke.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 Goldstücke.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//... ich kann das nicht glauben ...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//... ich wäre mir da nicht so sicher ...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//... das hat er doch vorher gewusst ....
	Smalltalk04					= "SVM_14_Smalltalk04"					;//... ich weiß langsam nicht mehr, was ich glauben soll ...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//... ich weiß gar nicht, warum er sich so aufregt ...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//... noch mehr Ärger kann ich nicht gebrauchen ...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//... ich hab so einiges gehört ...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//... davon lass ich lieber die Finger ...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//... man darf halt nicht alles glauben, was man hört ...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//... von mir hat er das nicht ...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//... ich habe mir das schon gedacht ...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//... meine Meinung will ja keiner hören ...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//... das hat er wirklich nicht verdient ...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//... sag nicht, das hast du nicht gewusst ...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//... das war doch klar ...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//... wo hast du das denn schon wieder her ...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//... das kann ja nicht ewig so weiter gehen ...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//... ich hab da so meine eigene Meinung ...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//... es war genau so, wie du sagst ...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//... ich glaub nicht, dass sich daran was ändert ...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//... das höre ich zum ersten Mal ...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//... wir können nur abwarten ...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//... die Probleme habe ich kommen sehen ...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//... warum hört eigentlich keiner auf mich ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//... der ist gerannt, als ob Beliar selbst hinter ihm her wäre ...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//... wir haben ihn natürlich dann doch noch gekriegt ...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//... da muss man mal ganz kräftig dazwischenhauen ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//... einige wissen gar nicht, wie sehr sie sich versündigen ...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//... denn so ist es Innos' Wille ...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//... seine Taten waren gerecht ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_14_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_14_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_14_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_14_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_14_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbeigehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlanggehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_14_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_14_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_14_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//Die Kleidung passt nicht zu dir. Du hast bestimmt was zu verbergen. Lass mich Ruhe.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Wenn du mit mir reden willst, musst du unsere Rüstung tragen.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Sei stolz auf die Armee und renn nicht mit diesen Klamotten durch die Gegend. Zieh dich erst mal um.
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//Deine Kleidung ist unserem Orden nicht angemessen. Zieh dich um.
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//Hast ja noch nicht mal 'ne Rüstung. Verschwinde!

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Stirb, Bandit.
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Stirb, Pirat.
};

// ****************
// 		SPIELER
// ****************

INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	// ------ Player-Only SVMs ---------------------------------------------------------------------
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hey du!
	SC_HeyTurnAround02		= 	"SVM_15_SC_HeyTurnAround02"			;//Hey du!
	SC_HeyTurnAround03		= 	"SVM_15_SC_HeyTurnAround03"			;//Hey!
	SC_HeyTurnAround04		= 	"SVM_15_SC_HeyTurnAround04"			;//Hey!
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Warte mal!

	DoesntWork				= 	"SVM_15_DoesntWork"					;//Funktioniert nicht
	PickBroke				= 	"SVM_15_PickBroke"					;//Hm, abgebrochen.
	NeedKey					= 	"SVM_15_NeedKey"					;//Dafür brauch ich den Schlüssel ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//Keine Dietriche mehr ...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//Vom Schlösserknacken versteh ich nichts.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//Alle Kammern auszufegen dauert ewig!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Hm ... ich hab weder einen Dietrich noch den Schlüssel.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//Ohne den richtigen Schlüssel kriege ich das nie auf!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//Ein paar Dietriche wären hilfreich!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//Das Ding krieg ich nie auf!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//Womit denn?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Hmm ... Nein ...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Da ist nichts zu holen ...
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Nichts zu holen ...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Nichts zu plündern ...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargl
	Awake					=	"SVM_15_Awake"						;//(wacht auf)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Mmh. Da hast du dich also versteckt. Verdammt weit weg. Mmh. Ich werde ein Schiff brauchen, um dahin zu kommen.
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innos, gewähre mir deine Hilfe und reinige diesen Schrein.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innos, gewähre mir deine Hilfe und so weiter ... So. Ich schätze, das sollte das letzte Mal gewesen sein.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//XARAK BENDARDO! Ah. Das Buch öffnet sich. Es ist ein Brief und ein Schlüssel in dem Buch versteckt.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//KHADOSH EMEM KADAR! Öffne dich!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Lass uns handeln.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Zeig mir deine Ware.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Zeig mal, was du hast.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Verstehe.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Ah. Ich glaube, ich habe etwas gefunden.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//Ich verstehe nicht ...
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//Das kann ich nicht lesen!
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//AKHANTAR!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//JHERHEDRA!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//URIZIEL RATIS!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//(hust) Oh Mann, Brrr!!
	HUI						=	"SVM_15_Addon_HUI"						;//Huihuihui!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//Was weißt du über das Attentat auf Esteban?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//Wegen des Attentats auf Esteban ...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Ich will diese Verräter töten.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Ich suche diese Typen, um gegen Esteban vorzugehen.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//Du wirst in der Mine gebraucht.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. Erscheine mir, Quarhodron, alter Führer der kriegerischen Kaste!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Mmh ... Das funktioniert hier nicht.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//Was muss ich über's Goldhacken wissen?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Aha. Francis' Heuerbuch. Der Mann scheint sich eine Menge Gold in die eigene Tasche zu wirtschaften.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_16_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_16_Weather"						;//So ein Mistwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//Krieg' ich dich DOCH noch!
	DieEnemy					=	"SVM_16_DieEnemy"					;//Jetzt bist du dran!
	DieMonster					=	"SVM_16_DieMonster"					;//Da ist schon wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_16_DirtyThief"					;//Na warte, du dreckiger Dieb!
	HandsOff					=	"SVM_16_HandsOff"					;//Finger weg da!
	SheepKiller					=	"SVM_16_SheepKiller"					;//Der Mistkerl schlachtet unsere Schafe!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//Das verdammte Mistvieh frisst unsere Schafe!
	YouMurderer					=	"SVM_16_YouMurderer"					;//Mörder!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Na warte, du Mistkerl!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//Du hast es so gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Dann muss ich dich eben rausPRÜGELN!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//Was hattest DU denn da drin zu suchen, he!?
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Stirb, Mistkerl!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//Das war's für dich, Junge.
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//Ein Mistvieh weniger!
	ThiefDown					=	"SVM_16_ThiefDown"					;//Versuch nie wieder, mich zu bestehlen!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Tu das nie wieder! Das sind unsere Schafe!
	KillMurderer				=	"SVM_16_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//Leg dich nie wieder mit mir an!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//Du hättest auf mich hören sollen!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//Und jetzt mach, dass du hier rauskommst!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//Und dass ich dich nie wieder da drin erwische, okay?
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein, okay?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Tu mir nichts!
	RunAway						= 	"SVM_16_RunAway"						;//Nichts wie weg!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//ALARM!
	Guards						=	"SVM_16_Guards"					;//WACHE!
	Help						=	"SVM_16_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//(ruft zu) Gut gemacht!
	GoodKill					= 	"SVM_16_GoodKill"				;//(ruft) Ja, mach das Schwein fertig!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//(ruft laut) Bleib stehen, du Feigling!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Mach, dass du hier rauskommst!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//Was suchst du hier!? Geh!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//Ja, mach, dass du hier wegkommst!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//Hey du! Was schleichst du da rum.
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//(wacht auf) Verdammt, was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//Danke für das Gold, du Held!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//Du arme Wurst, hast ja nicht mal Gold dabei!
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//Die Waffe nehm ich mal besser an mich!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//(warnt) Pass auf! Noch mal, und ich verpass dir eine.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//Hast du immer noch nicht genug?!
	StopMagic					=	"SVM_16_StopMagic"				;//Hör auf mit dieser Magie-Scheiße!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Willst du Schläge? Hör sofort damit auf!!!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Steck endlich die Scheißwaffe weg!
	WiseMove					=	"SVM_16_WiseMove"				;//Kluges Kerlchen!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//(zu sich selbst) Das nächste Mal werden wir ja sehen ...
	OhMyHead					=	"SVM_16_OhMyHead"				;//(zu sich selbst) Oh Mann, mein Kopf ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//(gierig) Ah, ein Kampf!
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//(bestürzt) Mein Gott, ein Kampf!
	GoodVictory					=	"SVM_16_GoodVictory"			;//(böse lachend) Dem hast du's gezeigt!
	NotBad						= 	"SVM_16_NotBad"					;//(anerkennend) Nicht schlecht ...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//(zu sich selbst) Mein Gott! Wie brutal ...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Hau drauf!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Zeig's ihm!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Mach ihn fertig!
	Ooh01						=	"SVM_16_Ooh01"					;//Schlag zurück!
	Ooh02						=	"SVM_16_Ooh02"					;//Pass doch auf!
	Ooh03						=	"SVM_16_Ooh03"					;//Oh! Das tat weh!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Raus aus meinem Bett!
	Awake						= "SVM_16_Awake"					;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//Du hast also beim Kommandanten deine Schuld gesühnt.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//Du hast also bei Vater Parlan Buße getan.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee hat die Sache mit dir wieder in Ordnung gebracht.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//Das ist gut.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//Du kannst nicht einfach unsere Schafe töten! Geh weg!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Du bist ein brutaler Schläger, mit dir will ich nichts zu tun haben.
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//Mit Dieben rede ich nicht - und jetzt geh!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Du hast dich nicht ehrenhaft verhalten. Lord Hagen wird das nicht gefallen!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Dein Verhalten ist eine Schande für die Stadtwache! Lord Andre wird dich zur Rechenschaft ziehen!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Lord Andre wird erfahren, was du getan hast.
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Dein Handeln war nicht Rechtens. Geh zu Vater Parlan und tue Buße.
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Lee wird erfahren, was du angestellt hast - und er wird dich bestrafen.
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Kommandant Garond wird eine Erklärung von dir fordern!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 Goldstücke.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//... wirklich? Das ist ja interessant ...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//... ich glaube da nicht dran ...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//... mein Mann sieht das anders ...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//... ach, erzähl mir nicht so was ...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//... ehrlich, ich hab es selbst erlebt ...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//... was du nicht sagst ...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//... das darfst du keinem erzählen ...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//... schlimme Zeiten sind das ...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//... wer sagt denn so was?...
	Smalltalk10					= "SVM_16_Smalltalk10"				;//... wenn ich es nicht mit eigenen Augen gesehen hätte ...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//... irgendwer muss die Arbeit ja machen ...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//... ich habe was anderes gehört ...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//... das ist mal wieder typisch ...
	Smalltalk14					= "SVM_16_Smalltalk14"				;//... er erzählt alles weiter ..
	Smalltalk15					= "SVM_16_Smalltalk15"				;//... er sollte lieber den Mund halten ...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//... er arbeitet auch den ganzen Tag ...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//... worum soll ich mich denn noch alles kümmern ...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//... er redet einfach zu viel ...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//... das ist doch kein Geheimnis mehr...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//... das weiß doch inzwischen jeder ...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//... der erzähl ich gar nichts mehr ...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//... und es wird noch viel schlimmer ...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//... das ist ja schrecklich ...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//... das habe ich schon immer gesagt ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_16_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_16_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_16_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_16_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_16_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbeigehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlanggehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_16_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_16_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_16_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Zieh dir mal was Vernünftiges an. So will ich nicht mit dir gesehen werden.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//EIN BANDIT!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//EIN PIRAT!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//Für den König!
	PALGreetings				=	"SVM_17_PALGreetings"				;//Für Innos!
	Weather						= 	"SVM_17_Weather"						;//So ein Mistwetter!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//Krieg ich dich DOCH noch!
	DieEnemy					=	"SVM_17_DieEnemy"					;//Jetzt bist du dran!
	DieMonster					=	"SVM_17_DieMonster"					;//Da ist wieder eins von diesen Drecksviechern!
	DirtyThief					=	"SVM_17_DirtyThief"					;//Na warte, du dreckiger Dieb!
	HandsOff					=	"SVM_17_HandsOff"					;//Finger weg da!
	SheepKiller					=	"SVM_17_SheepKiller"					;//Der Mistkerl schlachtet unsere Schafe!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//Das verdammte Mistvieh frisst unsere Schafe!
	YouMurderer					=	"SVM_17_YouMurderer"					;//Mörder!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//Hier kommen keine Viecher rein!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Na warte, du Mistkerl!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//Du hast es so gewollt!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Dann muss ich dich eben rausPRÜGELN!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//Was hattest DU denn da drin zu suchen, he!?
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Wollt ihr wohl damit aufhören!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Stirb, Mistkerl!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//Das war's für dich, Junge.
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//Ein Mistvieh weniger!
	ThiefDown					=	"SVM_17_ThiefDown"					;//Versuch nie wieder, mich zu bestehlen!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Tu das nie wieder! Das sind unsere Schafe!
	KillMurderer				=	"SVM_17_KillMurderer"				;//Stirb, Mörder!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//So ein saublödes Vieh!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//Leg dich nie wieder mit mir an!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//Du hättest auf mich hören sollen!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//Und jetzt mach, dass du hier rauskommst!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//Und dass ich dich nie wieder da drin erwische!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Tu mir nichts!
	RunAway						= 	"SVM_17_RunAway"						;//Nichts wie weg!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//ALARM!
	Guards						=	"SVM_17_Guards"					;//WACHE!
	Help						=	"SVM_17_Help"					;//Hilfe!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//(ruft zu) Gut gemacht!
	GoodKill					= 	"SVM_17_GoodKill"				;//(ruft) Ja, mach das Schwein fertig!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Lass mich in Ruhe!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//(ruft laut) Bleib stehen, du Feigling!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Mach, dass du hier rauskommst!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//Was suchst du hier!? Geh!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//Ja, mach, dass du wegkommst!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//Hey du! Was schleichst du da rum.
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//(wacht auf) Was ist los?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//Danke für das Gold, du Held!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//Du arme Wurst, hast ja nicht mal Gold dabei!
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//Die Waffe nehm ich mal besser an mich!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//(warnt) Pass auf! Noch mal und ich verpass dir eine.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//Hast du immer noch nicht genug?!
	StopMagic					=	"SVM_17_StopMagic"				;//Hör auf mit dieser Magie-Scheiße!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Willst du Schläge? Hör sofort damit auf!!!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Steck die Waffe weg!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Steck endlich die Scheißwaffe weg!
	WiseMove					=	"SVM_17_WiseMove"				;//Kluges Kerlchen!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//(zu sich selbst) Das nächste Mal werden wir ja sehen ...
	OhMyHead					=	"SVM_17_OhMyHead"				;//(zu sich selbst) Oh Mann, mein Kopf ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//(gierig) Ah, ein Kampf!
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//(bestürzt) Mein Gott, ein Kampf!
	GoodVictory					=	"SVM_17_GoodVictory"			;//(böse lachend) Dem hast du's gezeigt!
	NotBad						= 	"SVM_17_NotBad"					;//(anerkennend) Nicht schlecht ...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//(zu sich selbst) Mein Gott! Wie brutal ...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Hau drauf!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Zeig's ihm!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Mach ihn fertig!
	Ooh01						=	"SVM_17_Ooh01"					;//Schlag zurück!
	Ooh02						=	"SVM_17_Ooh02"					;//Pass doch auf!
	Ooh03						=	"SVM_17_Ooh03"					;//Oh! Das tat weh!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//(zu sich selbst, wacht auf) Was WAR das!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Raus aus meinem Bett!
	Awake						= "SVM_17_Awake"					;//(herzhaftes Gähnen)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//Du hast also beim Kommandanten deine Schuld gesühnt.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//Du hast also bei Vater Parlan Buße getan.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee hat die Sache mit dir wieder in Ordnung gebracht.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//Das ist gut.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//Du kannst nicht einfach unsere Schafe töten! Geh weg!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Du bist ein brutaler Schläger, mit dir will ich nichts zu tun haben.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//Mit Dieben rede ich nicht - und jetzt geh!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Du hast dich nicht ehrenhaft verhalten. Lord Hagen wird das nicht gefallen!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Dein Verhalten ist eine Schande für die Stadtwache! Lord Andre wird dich zur Rechenschaft ziehen!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Lord Andre wird erfahren, was du getan hast.
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Dein Handeln war nicht rechtens. Geh zu Vater Parlan und tue Buße.
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Lee wird erfahren, was du angestellt hast - und er wird dich bestrafen.
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Kommandant Garond wird eine Erklärung von dir fordern!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 Goldstücke.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 Goldstücke.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 Goldstücke.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 Goldstücke.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 Goldstücke.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 Goldstücke.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 Goldstücke.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 Goldstücke.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 Goldstücke.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 Goldstücke.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 Goldstücke.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 Goldstücke.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 Goldstücke.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 Goldstücke.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 Goldstücke.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 Goldstücke.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 Goldstücke.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 Goldstücke.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 Goldstücke.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 Goldstücke.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 Goldstücke.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 Goldstücke.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 Goldstücke.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 Goldstücke.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 Goldstücke.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 Goldstücke.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 Goldstücke.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 Goldstücke.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//... wirklich? Das ist ja interessant ...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//... ich glaube da nicht dran ...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//... Mein Mann sieht das anders ....
	Smalltalk04					= "SVM_17_Smalltalk04"				;//... ach, erzähl mir nicht so was ...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//... ehrlich, ich hab es selbst erlebt ...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//... was du nicht sagst ...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//... das darfst du keinem erzählen ...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//... schlimme Zeiten sind das ...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//... wer sagt denn so was? ...
	Smalltalk10					= "SVM_17_Smalltalk10"				;//... wenn ich es nicht mit eigenen Augen gesehen hätte ...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//... irgendwer muss die Arbeit ja machen ...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//... ich habe was anderes gehört ...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//... das ist mal wieder typisch ...
	Smalltalk14					= "SVM_17_Smalltalk14"				;//... er erzählt alles weiter ...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//... er sollte lieber den Mund halten ...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//... er arbeitet auch den ganzen Tag ...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//... worum soll ich mich denn noch alles kümmern ...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//... er redet einfach zu viel ...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//... das ist doch kein Geheimnis mehr ...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//... das weiß doch inzwischen jeder ...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//... der erzähl ich gar nichts mehr ...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//... und es wird noch viel schlimmer ...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//... das ist ja schrecklich ...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//... das habe ich schon immer gesagt ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Du verlangst mehr von mir, als ich dir beibringen kann.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//Ich kann dir nichts mehr beibringen. Du bist schon zu gut.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//Siehst du, du bist schon besser geworden ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Du bist jetzt in der Unterstadt.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Du bist jetzt in der Oberstadt.
	TEMPEL						= "SVM_17_TEMPEL"					;//Du bist jetzt am Tempel.
	MARKT						= "SVM_17_MARKT"						;//Du bist jetzt am Marktplatz.
	GALGEN						= "SVM_17_GALGEN"					;//Du bist jetzt am Galgenplatz vor der Kaserne.
	KASERNE						= "SVM_17_KASERNE"					;//Das hier ist die Kaserne.
	HAFEN						= "SVM_17_HAFEN"						;//Du bist hier im Hafenviertel.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//Wo willst du hin?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//Am südlichen Stadttor gibt es eine Treppe, die zum inneren Stadttor hochführt. Dort beginnt die Oberstadt.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Geh vom Schmied aus die Hafenstraße runter, dann kommst du zum Hafen.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Wenn du vom Tempel aus gesehen links an der Kneipe vorbeigehst, kommst du zum Galgenplatz.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlanggehst, kommst du zum Tempel.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Geh vom Galgenplatz aus die Gasse runter und du kommst zum Tempelplatz.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Marktplatz.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Geh von der Kaimauer aus die Hafenstraße hoch, dann kommst du in die Unterstadt.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_17_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_17_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_17_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_17_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------

};


// *************
// 		Orks
// *************

INSTANCE SVM_18	(C_SVM)							
{

};

// ****************
// 	   Dementor
// ****************

INSTANCE SVM_19	(C_SVM)
{
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(zischt) Da ist er!
	RunCoward    	= "SVM_19_RunCoward"    	;//(zischt) Wir werden dich kriegen!
	Dead      		= "SVM_19_Dead"      	;//Aaaaaargl!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Aargh
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Aargh
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Aargh
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




