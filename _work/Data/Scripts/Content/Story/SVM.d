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
	MILGreetings				= 	"SVM_1_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_1_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_1_Weather"						;//Crappy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//So I've got you after ALL!
	DieEnemy					=	"SVM_1_DieEnemy"					;//You're in for it now!!
	DieMonster					=	"SVM_1_DieMonster"					;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Filthy thief! Just you wait!
	HandsOff					=	"SVM_1_HandsOff"					;//Take your paws off that!
	SheepKiller					=	"SVM_1_SheepKiller"					;//That piece of shit is slaughtering our sheep!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//That blasted monster is gobbling up our sheep!
	YouMurderer					=	"SVM_1_YouMurderer"					;//Murderer!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Just you wait, you sumbitch!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//You asked for it!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//Then I'll have to KNOCK you out of here!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//So what was YOUR business in there, huh!?
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Will you stop it already!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Die, bastard!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//So much for you, lowlife!
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//One less monster around!
	ThiefDown					=	"SVM_1_ThiefDown"					;//Never try to steal from me again!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//From now on, keep your paws off stuff that isn't yours!
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Never do that again! Those are our sheep!
	KillMurderer				=	"SVM_1_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//Never pick a fight with me again!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//You should have listened to me!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//And now get out of here!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//And never let me catch you in there again!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//No fighting here, do you understand? Let that be a lesson to you!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Just leave me alone!
	RunAway						= 	"SVM_1_RunAway"						;//Shit! I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//ALARM!
	Guards						=	"SVM_1_Guards"						;//GUARDS!
	Help						=	"SVM_1_Help"						;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//(calls to) Well done - one dirty beast less!
	GoodKill					= 	"SVM_1_GoodKill"					;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//(calls loudly) Stop right there, you lowlife!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Get out of here!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//What do you want here!? Go!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//Yeah, get away from here!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hey you! What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//(wakes up) Damnit, what's up?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//Gold! OK, that's mine for starters ...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//The bastard doesn't even have any gold on him.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//I think I'll take your weapon for safekeeping.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//(warning) Hey! Watch it!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//(aggressively) Haven't you had enough yet?
	StopMagic					=	"SVM_1_StopMagic"					;//Just stay away from me with that magic of yours!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Cut out that magic! Something wrong with your ears!?
	WeaponDown					=	"SVM_1_WeaponDown"					;//Put down that weapon!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Are you deaf or what? I said: Put down that weapon!
	WiseMove					=	"SVM_1_WiseMove"					;//See, that wasn't so hard.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//(to himself) We'll see about that ...
	OhMyHead					=	"SVM_1_OhMyHead"					;//(to himself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//(eagerly) And now for some action!
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//(dismayed) They're smashing each other's skulls ...
	GoodVictory					=	"SVM_1_GoodVictory"					;//(evil laugh) He deserved that!
	NotBad						= 	"SVM_1_NotBad"						;//(approvingly) Not bad at all ...
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//(to himself) What a brutal fellow ...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Yeah, that's the ticket!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//Whatcha waiting for?
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//Atta boy!
	Ooh01						=	"SVM_1_Ooh01"						;//Don't take any crap!
	Ooh02						=	"SVM_1_Ooh02"						;//Show him who's boss!
	Ooh03						=	"SVM_1_Ooh03"						;//Holy shit!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Get out of my bed!
	Awake						= "SVM_1_Awake"							;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//I hear you went to the commander and set matters right.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//I hear you went to Father Parlan and repented your sins.
	ABS_FARM					= "SVM_1_ABS_FARM"						;//They say you went to see Lee and settled that matter.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//That's good.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Slaughtering our sheep just like that! Beat it, buster!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//I don't talk to filthy thugs!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//Get out of my sight, you dirty thief!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//You're a disgrace to your order! Lord Hagen will be furious!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//You're a disgrace to the city guard! Lord Andre will teach you some manners!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Lord Andre will hear of what you've done!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Father Parlan will not be happy to hear of this sacrilege!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Lee will give you what for! You'll see where this gets you!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Commander Garond will demand an explanation from you!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//All right, all right, you win. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//(smugly) Do I have to show you again who's boss?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Trying to pick another fight with me, are you?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 gold pieces.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 gold pieces.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 gold pieces.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 gold pieces.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 gold pieces.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 gold pieces.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 gold pieces.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 gold pieces.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 gold pieces.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 gold pieces.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 gold pieces.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 gold pieces.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 gold pieces.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 gold pieces.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 gold pieces.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 gold pieces.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 gold pieces.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 gold pieces.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 gold pieces.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 gold pieces.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 gold pieces.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 gold pieces.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 gold pieces.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 gold pieces.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 gold pieces.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 gold pieces.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 gold pieces.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//... do you really think...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//... anything's possible ...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//... he should have known better ...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//... as if I didn't have enough problems ...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//... who said that ...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//... that'll only cause more trouble ...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//... there've been all kinds of rumors ...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//... I wouldn't have done that ...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//... those are all just rumors ...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//... it's better to watch out who you tell what ...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//... I could have told you that before ...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//... nobody ever asks me ...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//... you have to feel sorry for the poor guy ...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//... that's nothing new ...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//... that's totally obvious ...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//... you don't have to ask me that ...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//... it can't go on like this forever ...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//... you already know what I think ...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//... that's exactly what I said ...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//... nothing's ever going to change that ...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//... why haven't I heard about this before ...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//... let's wait and see what happens ...
	Smalltalk23					= "SVM_1_Smalltalk23"					;//... some problems solve themselves ...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//... I don't want to hear that anymore ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//... he was falling down drunk ...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//... I won't be treated like that ...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//... they all ran like rabbits, I was completely alone ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//... so it says in the scriptures ...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//... I always act in the name of Innos ...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//... no one must violate the divine order ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_1_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_1_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_1_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_1_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_1_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_1_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_1_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_1_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//Those aren't your clothes. I'm not talking to you.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//What are you wearing? Put on something decent.
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//You are a soldier! Dress like one.
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//Your clothing is not appropriate for our order. Go and change.
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//You haven't even got any armor. Beat it!

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Die, you filthy bandit!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Pirate scum!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_3_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_3_Weather"					;//What crappy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Now I've got you!
	DieEnemy					=	"SVM_3_DieEnemy"					;//I'm gonna rip you to pieces!
	DieMonster					=	"SVM_3_DieMonster"					;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Dirty thief! Just you wait!
	HandsOff					=	"SVM_3_HandsOff"					;//Take your paws off that!
	SheepKiller					=	"SVM_3_SheepKiller"				;//That piece of shit is slaughtering our sheep!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//That blasted monster is gobbling up our sheep!
	YouMurderer					=	"SVM_3_YouMurderer"				;//Murderer!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Just you wait, you sumbitch!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//You asked for it!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//You don't want to go? All right!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//What did you want in there?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Will you stop it now?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Die, bastard!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//You deserved that, lowlife!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//One less monster around!
	ThiefDown					=	"SVM_3_ThiefDown"					;//Never try to steal from me again!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//From now on, keep your paws off stuff that doesn't belong to you!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Never do that again! Those are our sheep!
	KillMurderer				=	"SVM_3_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//Never pick a fight with me again!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//You should have listened to me!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//And now get out of here!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//And never let me catch you in there again!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//No fighting here, do you understand? Let that be a lesson to you!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Don't hurt me!
	RunAway						= 	"SVM_3_RunAway"					;//Oh, shit!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//ALARM!
	Guards						=	"SVM_3_Guards"					;//GUARDS!
	Help						=	"SVM_3_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//(calls to) Well done - one dirty beast less!
	GoodKill					= 	"SVM_3_GoodKill"				;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//(calls loudly) Yes! Run as fast as you can!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Get out of here!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//What do you want here!? Go!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//Yeah, get away from here!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//Hey you! What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//(wakes up) Damnit, what's up?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//Thanks for the gold, you hero!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//You poor sucker, you don't even have any gold on you!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//I think I had better take this weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//(warning) Watch it! One more time, and I'll slug you one.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//Haven't you had enough yet?
	StopMagic					=	"SVM_3_StopMagic"				;//Cut out this magic crap!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Want a licking? Stop it this instant!!!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Put away that weapon!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Will you put away that damn weapon?!
	WiseMove					=	"SVM_3_WiseMove"				;//Smart kid!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//(to himself) Well, we'll see the next time ...
	OhMyHead					=	"SVM_3_OhMyHead"				;//(to himself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//(eagerly) Aah, a fight!
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//(dismayed) Oh my God, a fight!
	GoodVictory					=	"SVM_3_GoodVictory"			;//(evil laugh) You showed him who's boss!
	NotBad						= 	"SVM_3_NotBad"					;//(approvingly) Not bad ...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//(to himself) My God! How brutal...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Hit, then!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Give it your all!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Show him!
	Ooh01						=	"SVM_3_Ooh01"					;//Hang on!
	Ooh02						=	"SVM_3_Ooh02"					;//Watch out!
	Ooh03						=	"SVM_3_Ooh03"					;//Wow! That hit the spot!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Get out of my bed!
	Awake						= "SVM_3_Awake"					;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//So you went to the commander and set matters right.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//So you went to Father Parlan to atone for your sins.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//So you went to see Lee and put the matter in order.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//That's good.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Slaughtering our sheep just like that!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Leave me alone, you filthy brute!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Leave me alone, you miserable little thief!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//You're a disgrace to your order! Wait until Lord Hagen hears of this!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//You're a disgrace to the city guard! Wait until Lord Andre hears of this!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Wait until Lord Andre hears of this.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Wait until Father Parlan hears of this!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Wait until Lee gets wind of this...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Wait until Commander Garond hears of this!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//All right, all right, you're the better fighter. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//(smugly) I assume that, by now, you are well aware which of us is stronger ... What do you want?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//I thought you were trying to pick a fight with me. Did you change your mind? You prefer TALKING, right? (laughs)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 gold pieces.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//... do you really think...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//... anything's possible ...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//... he should have known better ...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//... as if I don't have enough problems ...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//... who told you that ...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//... that'll only cause more trouble ...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//... there've been all kinds of rumors ...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//... I never would have thought ...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//... those are all just rumors ...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//... you better watch out who you tell that to ...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//... I could have told you that before ...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//... nobody ever asks me ...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//... you have to feel sorry for the poor guy ...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//... that's nothing new ...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//... that's totally obvious ...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//... you don't have to ask me that ...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//... it can't go on like this forever ...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//... you already know what I think ...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//... that's just what I said ...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//... nothing's ever going to change that ...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//... why haven't I heard about this before ...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//... let's wait and see what happens ...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//... some problems solve themselves ...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//... I don't want to hear that anymore ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//... he was falling down drunk ...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//... I won't be treated like that ...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//... they all ran like rabbits, I was completely alone ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//... so it says in the scriptures ...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//... I always act in the name of Innos ...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//... no one must violate the divine order ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_3_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_3_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_3_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_3_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_3_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_3_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_3_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_3_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//What kind of clothes are those? They don't suit you at all. Leave me alone.
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//If you want to talk, then put on something decent first.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//We soldiers wear our uniforms with pride. Get changed.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//All are equal in our order, therefore we all wear the same clothing. Go change!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//You must have come straight out of the slammer. First get yourself something to wear.

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//COME HERE, YOU BANDIT!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//COME HERE, YOU PIRATE!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_4_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_4_Weather"						;//Crappy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//YOU again!
	DieEnemy					=	"SVM_4_DieEnemy"					;//I'm gonna rip you to pieces!
	DieMonster					=	"SVM_4_DieMonster"					;//Another one of those things!
	DirtyThief					=	"SVM_4_DirtyThief"					;//You miserable little thief!
	HandsOff					=	"SVM_4_HandsOff"					;//Get your hands off that!
	SheepKiller					=	"SVM_4_SheepKiller"					;//Hey! Leave our sheep alone!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//That monster is gobbling up our sheep!
	YouMurderer					=	"SVM_4_YouMurderer"					;//Murderer!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//What is THAT creature doing here?
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//You're in for it now!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//You asked for it.
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//I guess some people just have to learn the hard way.
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//What did you want in there, huh!?
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Will you stop it already!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Die!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//What a silly bastard...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//All right, so much for you, filthy beast!
	ThiefDown					=	"SVM_4_ThiefDown"					;//Keep your paws off my stuff from now on - got it?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//Keep your fingers to yourself from now on!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//Keep your grubby paws off our sheep from now on!
	KillMurderer				=	"SVM_4_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Don't try that again, buster!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Let that be a lesson to you.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Stand up and get out of here!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//I never want to see you in there again - understood?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//I'm the one who does the bashing around here, understood?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Just leave me alone!
	RunAway						= 	"SVM_4_RunAway"						;//Shit! I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//ALARM!
	Guards						=	"SVM_4_Guards"					;//GUARDS!
	Help						=	"SVM_4_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//(calls to) Yeah! That's how you deal with those things!
	GoodKill					= 	"SVM_4_GoodKill"				;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//(yells) You haven't seen the last of me!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Out!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//What's your business here?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Just beat it!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//(wakes up) Wassup?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//Thanks for the gold, you hero!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//You poor sucker, you don't even have any gold on you!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//I think I had better take this weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//(warning) Watch it! One more time, and I'll slug you one.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//(aggressive) Do you want another punch in the face?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//Cut out this magic crap already!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Want a licking? Stop it this instant!!!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Put away that weapon!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Will you put away that damn weapon?!
	WiseMove					=	"SVM_4_WiseMove"				;//Smart kid!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//(to himself) Well, we'll see the next time ...
	OhMyHead					=	"SVM_4_OhMyHead"				;//(to himself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//(eagerly) Ah, a fight!
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//(dismayed) Oh my God, a fight!
	GoodVictory					=	"SVM_4_GoodVictory"				;//(evil laugh) You showed him who's boss!
	NotBad						= 	"SVM_4_NotBad"					;//(approvingly) Not bad ...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//(to himself) My God! How brutal...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Yeah, let him have it!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Show him!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Finish him!
	Ooh01						=	"SVM_4_Ooh01"					;//Defend yourself!
	Ooh02						=	"SVM_4_Ooh02"					;//Go ahead, hit back!
	Ooh03						=	"SVM_4_Ooh03"					;//Ouch! That hurt!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//(to himself, waking up) Damnit, what was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Get out of my bed!
	Awake						= "SVM_4_Awake"						;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//So the commander put matters right for you.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//So you have done penance for your deeds with Father Parlan.
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//I heard that Lee managed to patch it up for you.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Good.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Slaughtering sheep is just too much! Get lost!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//You're a thug - get lost!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Accursed thief! - I've really had it with you now!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//I would have expected more of a paladin! Lord Hagen will not be pleased.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//How did someone like you ever make it into the city guard? Lord Andre will have you pay for this!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Lord Andre will hear about your behavior!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Father Parlan will be enraged by your sacrilege!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Lee won't let you get away with it!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Commander Garond won't be happy to hear this - you'll have to pay for this!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//Say, you pack a pretty punch ... What is it you want?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//(smugly) Any more questions?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//There you are again!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 gold pieces.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//... is it really true ...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//... that's not what I heard...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//... don't tell me you didn't know that ...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//... you hardly know who to believe these days ...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//... that's all just gossip ...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//... I'm no better off myself ...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//... nothing amazes me any more ...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//... that's really not my problem ...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//... do you really believe that ...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//... nobody will learn anything from me ...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//... that was obvious all along ...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//... he listened to the wrong people ...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//... if he doesn't see that, I can't help him ...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//... I'm not telling you anything new ...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//... he never would have thought of that himself ...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//... that's been known a long time ...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//... it's a bad business ...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//... I'd have done it differently ...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//... I agree with you completely ...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//... will it ever change ...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//... I never knew that ...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//... you can't do anything about it ...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//... that doesn't amaze me ...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//... but no, he insisted he knew better ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//... all that matters is strength, so don't tell me that ...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//... he doesn't even know how to hold a sword ...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//... yeah, he really said that ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//... someone's got to pay for that ...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...Innos enlightens all those who recognize his wisdom ...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//... justice will prevail in the end ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Come back when you have more experience.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//I can't teach you any more. You're too good.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_4_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_4_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_4_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_4_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_4_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_4_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_4_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_4_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//First get dressed properly, then we'll talk some more.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//You had better wear your armor if you want to talk to me.
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Hasn't anyone given you some of our armor? Then get some first.
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//Where is your robe? Go and change. Until then, I will not talk to you.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//What kind of a poor bugger are you? Come back when you can afford some armor.

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Another bandit!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//You dirty pirate!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_5_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_5_Weather"						;//What lousy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//So I've got you after ALL!
	DieEnemy					=	"SVM_5_DieEnemy"					;//You're in for it now!
	DieMonster					=	"SVM_5_DieMonster"					;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Filthy thief! Just you wait!
	HandsOff					=	"SVM_5_HandsOff"					;//Take your paws off that!
	SheepKiller					=	"SVM_5_SheepKiller"					;//That piece of shit is slaughtering our sheep!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//That blasted monster is gobbling up our sheep!
	YouMurderer					=	"SVM_5_YouMurderer"					;//Murderer!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//Just you wait, you sumbitch!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//You asked for it!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//Then I'll have to KNOCK you out of here!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//So what was YOUR business in there, huh!?
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Will you stop it now?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Die, bastard!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//So much for you, lowlife!
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//One less monster around!
	ThiefDown					=	"SVM_5_ThiefDown"					;//Never try stealing from me again!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//From now on, keep your paws off stuff that isn't yours!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Never do that again! Those are our sheep!
	KillMurderer				=	"SVM_5_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//Never pick a fight with me again!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//You should have listened to me!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//And now get out of here!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//And never let me catch you in there again!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//No fighting here, do you understand? Let that be a lesson to you!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Just leave me alone!
	RunAway						= 	"SVM_5_RunAway"						;//Shit! I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//ALARM!
	Guards						=	"SVM_5_Guards"						;//GUARDS!
	Help						=	"SVM_5_Help"						;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//(calls to) Well done - one dirty beast less!
	GoodKill					= 	"SVM_5_GoodKill"					;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//(calls loudly) Stop right there, you lowlife!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Get out of here!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//What do you want here!? Go!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//Yeah, get away from here!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Hey you! What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//(wakes up) Damnit, what's up?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//Gold! OK, that's mine for starters ...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//You don't even have any gold on you?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//I think I'll take your weapon for safekeeping.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//(warning) Hey! Watch it!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//(aggressively) Haven't you had enough yet?
	StopMagic					=	"SVM_5_StopMagic"					;//Just stay away from me with that magic of yours!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Cut out that magic! Something wrong with your ears!?
	WeaponDown					=	"SVM_5_WeaponDown"					;//Put down that weapon!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Are you deaf or what? I said: Put down that weapon!
	WiseMove					=	"SVM_5_WiseMove"					;//See, that wasn't so hard.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//(to himself) We'll see about that ...
	OhMyHead					=	"SVM_5_OhMyHead"					;//(to himself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//(eagerly) And now for some action!
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//(dismayed) But they're smashing each other's skulls ...
	GoodVictory					=	"SVM_5_GoodVictory"					;//(evil laugh) He deserved that!
	NotBad						= 	"SVM_5_NotBad"						;//(approvingly) Not bad at all ...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//(to himself) What a brutal fellow ...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Yeah, that's the ticket!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//Whatcha waiting for?
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//Atta boy!
	Ooh01						=	"SVM_5_Ooh01"						;//Don't take any crap!
	Ooh02						=	"SVM_5_Ooh02"						;//Show him who's boss!
	Ooh03						=	"SVM_5_Ooh03"						;//Holy shit!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Get out of my bed!
	Awake						= "SVM_5_Awake"							;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//I hear you went to the commander and set matters right.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//I heard you went to Father Parlan and did penance.
	ABS_FARM					= "SVM_5_ABS_FARM"						;//I heard you went to Lee and straightened things out.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//That's good.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Slaughtering our sheep just like that! Beat it, buster!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//I don't talk to filthy thugs!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//Get out of my sight, you dirty thief!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//You're a disgrace to your order! Lord Hagen will be furious!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//You're a disgrace to the city guard! Lord Andre will teach you some manners!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Lord Andre will hear of what you've done!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//Father Parlan will not be happy to hear of this sacrilege!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Lee will give you what for! You'll see where this gets you!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Commander Garond will demand an explanation from you!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//All right, all right, you win. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//(smugly) Do I have to show you again who's boss?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Trying to pick another fight with me, are you?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 gold pieces.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 gold pieces.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 gold pieces.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 gold pieces.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 gold pieces.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 gold pieces.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 gold pieces.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 gold pieces.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 gold pieces.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 gold pieces.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 gold pieces.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 gold pieces.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 gold pieces.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 gold pieces.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 gold pieces.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 gold pieces.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 gold pieces.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 gold pieces.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 gold pieces.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 gold pieces.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 gold pieces.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 gold pieces.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 gold pieces.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 gold pieces.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 gold pieces.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 gold pieces.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 gold pieces.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//... do you really think...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//... anything's possible ...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//... he should have known better ...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//... as if I don't have enough problems ...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//... who told you that ...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//... that'll only cause more trouble ...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//... there've been all kinds of rumors ...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//... I wouldn't have done that ...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//... those are all just rumors ...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//... it's better to watch out who you tell what ...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//... I could have told you that before ...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//... nobody ever asks me ...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//... you have to feel sorry for the poor guy ...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//... that's nothing new ...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//... that's totally obvious ...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//... you don't have to ask me that ...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//... it can't go on like this forever ...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//... you already know what I think ...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//... that's exactly what I said ...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//... nothing's ever going to change that ...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//... why haven't I heard about this before ...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//... let's wait and see what happens ...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//... some problems solve themselves ...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//... I don't want to hear that anymore ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//... he was falling down drunk ...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//... I won't be treated like that ...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//... they all ran like rabbits, I was completely alone ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//... so it says in the scriptures ...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//... I always act in the name of Innos ...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//... no one must violate the divine order ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_5_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_5_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_5_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_5_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_5_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_5_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_5_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_5_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//First put on something appropriate.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//What are you wearing? Aren't you one of us any more? Then I won't have anything to do with you.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//We soldiers fight for the King, so you had better wear his armor.
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Why does the order give you clothes if you don't wear them? Think about it.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//What kind of poor sucker are you? You haven't even got any armor. Go away.

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//Ah, a bandit.
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//I'll tear you to pieces, pirate!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_6_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_6_Weather"					;//Lousy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//I'll get you now!
	DieEnemy					=	"SVM_6_DieEnemy"					;//You shouldn't have come here!
	DieMonster					=	"SVM_6_DieMonster"					;//Come here, damn beast!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Filthy thief! Just you wait!
	HandsOff					=	"SVM_6_HandsOff"					;//Take your paws off that!
	SheepKiller					=	"SVM_6_SheepKiller"				;//Leave our sheep alone!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//Get away from our sheep, you brute!
	YouMurderer					=	"SVM_6_YouMurderer"				;//Murderer!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//You'll regret this!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//It's not like I didn't warn you.
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Hey, GET OUT!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Hey! What did you want in there?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//Stop it! At once!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//I'm going to run you through, you bastard!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//So much for you ...
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Hey, I've still got it!
	ThiefDown					=	"SVM_6_ThiefDown"					;//I'm warning you! Don't try that again, you filthy thief!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//From now on, keep your paws off stuff that isn't yours!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//And stay away from our sheep from now on!
	KillMurderer				=	"SVM_6_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//Don't you ever dare attack me again!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//It's not like I didn't warn you.
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//And now get out!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//I never want to see you in there again, capisce?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//No fighting here. Let that be a lesson to you.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Don't try anything funny!
	RunAway						= 	"SVM_6_RunAway"						;//I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//ALARM!
	Guards						=	"SVM_6_Guards"					;//GUARDS!
	Help						=	"SVM_6_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//(calls to) Send those beasts to kingdom come!
	GoodKill					= 	"SVM_6_GoodKill"				;//(calls) Yeah, give that bastard what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//(calls loudly) I'll get you yet!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Get out of here!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//You've no business being here!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//Yeah, get out!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//What are you up to? What's all this creeping about?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//(wakes up) Damnit, what do you want?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//Well, at least you've got some gold on you.
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Not even any gold - hmpf.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//I think I'll take your weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//(warning) Boy! Don't you ever do that again!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//(aggressively) Need yet another licking?
	StopMagic					=	"SVM_6_StopMagic"				;//Cut out that magic!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Last warning! Cut out that magic!
	WeaponDown					=	"SVM_6_WeaponDown"				;//Put that weapon down!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Put that away, or you're in for it!
	WiseMove					=	"SVM_6_WiseMove"				;//Hey, you're not quite as stupid as you look!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//(to himself) Don't you try that again ...
	OhMyHead					=	"SVM_6_OhMyHead"				;//(to himself) Ohh! My head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//(greedily) And now for the fun part ...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//(dismayed) Oh my goodness ...
	GoodVictory					=	"SVM_6_GoodVictory"			;//(evil laugh) Let that be a lesson to him...
	NotBad						= 	"SVM_6_NotBad"					;//(approvingly) That hit the spot!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//(to himself) What a filthy brute!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Slug him!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Don't stop now!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Finish him!
	Ooh01						=	"SVM_6_Ooh01"					;//Watch out!
	Ooh02						=	"SVM_6_Ooh02"					;//Parry, then!
	Ooh03						=	"SVM_6_Ooh03"					;//Shit, that hurt!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Get out of my bed!
	Awake						= "SVM_6_Awake"					;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//So the commander patched up things with you.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Father Parlan has relieved you of your guilt.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//So you went to see Lee and took care of that business.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Good.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//You're assaulting sheep? I suppose you couldn't find a more defenseless victim?
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//I'll have nothing to do with nasty thugs!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//I won't have anything to do with thieves!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//And you want to be a paladin? Wait until you hear what Lord Hagen thinks of this!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//Do you really belong to the city guard? Lord Andre isn't going to stand for that!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Go to Lord Andre as long as you still can.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Go to Father Parlan. He'll help you atone for your sins!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee is going to hear about this, and you're going to pay.
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Commander Garond is not going to be amused. You had better talk to him before matters get even worse!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//All right - you win. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//(smugly) I think that now you realize who you're dealing with. What do you want?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//You again? Trying to pick another fight with me, are you?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 gold pieces.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//... I can't believe that ...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//... I wouldn't be so sure ...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//... but he knew that all along ...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//... I hardly know what to believe anymore...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//... I don't know why he gets so worked up ...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//... I'm in enough trouble as it is ...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//... I have heard a thing or two ...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//... I'm not touching that ...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//... you mustn't believe everything you hear ...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//... he didn't get that from me ...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//... I already thought as much ...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//... nobody ever asks for my opinion ...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//... he really didn't deserve that ...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//... don't say you didn't know that ...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//... that was quite obvious ...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//... where did you pick that up then ...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//... it can't go on like this forever ...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//... I've got my own opinion about that ...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//... it was just like you said ...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//... I don't believe this is going to change ...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//... that's the first I've heard of it ...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//... we can only wait and see ...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//... I knew that would be a problem ...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//... so why won't they listen to me ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//... he ran like Beliar himself was after him ...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//... of course we got him in the end ...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//... you have to step in and sort things out ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//... some don't even know how wicked they are ...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//... for that is the will of Innos ...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//... his deeds were just ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_6_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_6_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_6_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_6_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_6_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_6_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_6_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_6_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//You look ridiculous in that get-up. Put on something decent.
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//Don't think I don't recognize you. Beat it and get changed.
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//Soldier. What sort of clothes are those? Get changed, on the spot!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//A servant of Innos does not conceal himself. Go and fetch your robe.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//You're running around like a digger. First put something on.

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//You picked a fight with the wrong guy, BANDIT!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Back to sea, PIRATE!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_7_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_7_Weather"						;//Crappy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//YOU again!
	DieEnemy					=	"SVM_7_DieEnemy"					;//I'm gonna rip you to pieces!
	DieMonster					=	"SVM_7_DieMonster"					;//Another one of those things!
	DirtyThief					=	"SVM_7_DirtyThief"					;//You miserable little thief!
	HandsOff					=	"SVM_7_HandsOff"					;//Get your hands off that!
	SheepKiller					=	"SVM_7_SheepKiller"					;//Hey! Leave our sheep alone!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//That monster is gobbling up our sheep!
	YouMurderer					=	"SVM_7_YouMurderer"					;//Murderer!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//What is THAT creature doing here?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//You're in for it now!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//You asked for it.
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//I guess some people just have to learn the hard way.
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//What did you want in there, huh!?
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Will you stop it already!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Die!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//What a silly bastard...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//All right, so much for you, filthy beast!
	ThiefDown					=	"SVM_7_ThiefDown"					;//Keep your paws off my stuff from now on - got it?
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//Keep your fingers to yourself from now on!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//Keep your grubby paws off our sheep from now on!
	KillMurderer				=	"SVM_7_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//Don't try that again, boyo!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Let that be a lesson to you.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Stand up and get out of here!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//I never want to see you in there again - understood?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//I'm the one who does the bashing around here, understood?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Just leave me alone!
	RunAway						= 	"SVM_7_RunAway"						;//Shit! I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//ALARM!
	Guards						=	"SVM_7_Guards"					;//GUARDS!
	Help						=	"SVM_7_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//(calls to) Yeah! That's how you deal with those things!
	GoodKill					= 	"SVM_7_GoodKill"				;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//(yells) You haven't seen the last of me!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Out!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//What's your business here?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//Just beat it!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//(wakes up) Wassup?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//Thanks for the gold, you hero!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//You poor sucker, you don't even have any gold on you!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//I think I had better take this weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//(warning) Watch it! One more time, and I'll slug you one.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//(aggressive) Do you want another punch in the face?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//Cut out this magic crap already!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Want a licking? Stop it this instant!!!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Put away that weapon!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Will you put away that damn weapon?!
	WiseMove					=	"SVM_7_WiseMove"				;//Smart kid!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//(to himself) Well, we'll see the next time ...
	OhMyHead					=	"SVM_7_OhMyHead"				;//(to himself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//(eagerly) Ah, a fight!
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//(dismayed) Oh my God, a fight!
	GoodVictory					=	"SVM_7_GoodVictory"				;//(evil laugh) You showed him who's boss!
	NotBad						= 	"SVM_7_NotBad"					;//(approvingly) Not bad ...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//(to himself) My God! How brutal...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//Yeah, let him have it!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Show him!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Let him have it!
	Ooh01						=	"SVM_7_Ooh01"					;//Defend yourself!
	Ooh02						=	"SVM_7_Ooh02"					;//Go ahead, hit back!
	Ooh03						=	"SVM_7_Ooh03"					;//Ouch! That hurt!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//(to himself, waking up) Damnit, what was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Get out of my bed!
	Awake						= "SVM_7_Awake"						;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//So the commander put matters right for you.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//So you have done penance for your deeds with Father Parlan.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//I heard that Lee managed to patch it up for you.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Good.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Slaughtering sheep is just too much! Get lost!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//You're a thug - get lost!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Accursed thief! - I've really had it with you now!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//I would have expected more of a paladin! Lord Hagen will not be pleased.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//How did someone like you ever make it into the city guard? Lord Andre will have you pay for this!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Lord Andre will hear about your behavior!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Father Parlan will be enraged by your sacrilege!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Lee won't let you get away with it!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Commander Garond won't be happy to hear this - you'll have to pay for this!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//Say, you pack a pretty punch ... What is it you want?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//(smugly) Any more questions?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//There you are again!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 gold pieces.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//... is it really true ...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//... that's not what I heard...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//... don't tell me you didn't know that ...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//... you hardly know who to believe these days ...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//... that's all just gossip ...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//... I'm no better off myself ...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//... nothing amazes me any more ...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//... that's really not my problem ...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//... do you really believe that ...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//... nobody will learn anything from me ...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//... that was obvious all along ...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//... he listened to the wrong people ...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//... if he doesn't see that, I can't help him ...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//... I'm not telling you anything new ...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//... he never would have thought of that himself ...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//... that's been known a long time ...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//... it's a bad business ...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//... I'd have gone about it differently ...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//... I agree with you completely ...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//... will it ever change ...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//... I never knew that ...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//... there's nothing you can do about it ...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//... that doesn't surprise me ...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//... but no, he insisted he knew better ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//... all that matters is strength, so don't tell me that ...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//... he doesn't even know how to hold a sword ...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//... yeah, he really said that ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//... someone'll have to pay for it ...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...Innos enlightens all those who recognize his wisdom ...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//... justice will prevail in the end ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Come back when you have more experience.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//I can't teach you any more. You're too good.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_7_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_7_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_7_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_7_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_7_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_7_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_7_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_7_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Why the disguise? I won't talk to you like that.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//What are you wearing? Put on our armor, will you!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//That is a violation of the army's dress code. Get changed, on the spot.
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//You had better wear your robe. Until then, I will say nothing and pray for you.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//What do you want? You aren't one of us. You don't even wear our armor.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Die, you miserable bandit!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Die, you despicable pirate!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_8_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_8_Weather"					;//What crappy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//Now I've got you!
	DieEnemy					=	"SVM_8_DieEnemy"					;//I'm gonna rip you to pieces!
	DieMonster					=	"SVM_8_DieMonster"					;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Dirty thief! Just you wait!
	HandsOff					=	"SVM_8_HandsOff"					;//Take your paws off!
	SheepKiller					=	"SVM_8_SheepKiller"				;//That piece of shit is slaughtering our sheep!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//That blasted monster is gobbling up our sheep!
	YouMurderer					=	"SVM_8_YouMurderer"				;//Murderer!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Just you wait, you sumbitch!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//You asked for it!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//You don't want to go? All right!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//What did you want in there?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Will you stop it now?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Die, bastard!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//You deserved that, lowlife!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//One less monster around!
	ThiefDown					=	"SVM_8_ThiefDown"					;//Never try to steal from me again!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//From now on, keep your paws off stuff that doesn't belong to you!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Never do that again! Those are our sheep!
	KillMurderer				=	"SVM_8_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//Never pick a fight with me again!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//You should have listened to me!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//And now get out of here!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//And never let me catch you in there again!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//No fighting here, do you understand? Let that be a lesson to you!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Don't hurt me!
	RunAway						= 	"SVM_8_RunAway"					;//Oh, shit!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//ALARM!
	Guards						=	"SVM_8_Guards"					;//GUARDS!
	Help						=	"SVM_8_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//(calls to) Well done - one dirty beast less!
	GoodKill					= 	"SVM_8_GoodKill"				;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//(calls loudly) Yeah! Run as fast as you can!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Get out of here!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//What do you want here!? Go!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//Yeah, get away from here!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//Hey you! What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//(wakes up) Damnit, what's up?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//Thanks for the gold, you hero!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//You poor sucker, you don't even have any gold on you!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//I think I had better take this weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//(warning) Watch it! One more time, and I'll slug you one.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//Haven't you had enough yet?
	StopMagic					=	"SVM_8_StopMagic"				;//Cut out this magic crap!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Want a licking? Stop it this instant!!!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Put away that weapon!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Will you put away that damn weapon?!
	WiseMove					=	"SVM_8_WiseMove"				;//Smart kid!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//(to himself) Well, we'll see the next time ...
	OhMyHead					=	"SVM_8_OhMyHead"				;//(to himself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//(eagerly) Aah, a fight!
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//(dismayed) Oh my God, a fight!
	GoodVictory					=	"SVM_8_GoodVictory"			;//(evil laugh) You showed him!
	NotBad						= 	"SVM_8_NotBad"					;//(approvingly) Not bad ...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//(to himself) My God! How brutal...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Hit, then!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Give it your all!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Show him!
	Ooh01						=	"SVM_8_Ooh01"					;//Hang on!
	Ooh02						=	"SVM_8_Ooh02"					;//Watch out!
	Ooh03						=	"SVM_8_Ooh03"					;//Ow! That hit the spot!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Get out of my bed!
	Awake						= "SVM_8_Awake"					;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//So you went to the commander and set matters right.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//So you went to Father Parlan to atone for your sins.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//So you went to see Lee and put the matter in order.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//That's good.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Slaughtering our sheep just like that!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Leave me alone, you filthy brute!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Leave me alone, you miserable little thief!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//You're a disgrace to your order! Wait until Lord Hagen hears of this!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//You're a disgrace to the city guard! Wait until Lord Andre hears of this!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Wait until Lord Andre hears of this.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Wait until Father Parlan hears of this!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Wait until Lee gets wind of this...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Wait until Commander Garond hears of this!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//All right, all right, you're the better fighter. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//(smugly) I assume that, by now, you are well aware which of us is stronger ... What do you want?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//I thought you were trying to pick a fight with me. Did you change your mind? You prefer TALKING, right? (laughs)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 gold pieces.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//... is it really true ...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//... that's not what I heard...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//... don't tell me you didn't know that ...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//... you hardly know who to believe these days ...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//... that's all just gossip ...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//... I'm no better off myself ...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//... nothing surprises me any more ...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//... that's really not my problem ...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//... do you really believe that ...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//... nobody will learn anything from me ...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//... that was obvious all along ...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//... he listened to the wrong people ...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//... if he doesn't see that, I can't help him ...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//... I'm not telling you anything new ...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//... he never would have thought of that himself ...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//... that's been known a long time ...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//... it's a bad business ...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//... I'd have gone about it differently ...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//... I agree with you completely ...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//... will it ever change ...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//... I never knew that ...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//... there's nothing you can do about it ...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//... that doesn't surprise me ...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//... but no, he insisted he knew better ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//... all that matters is strength, so don't tell me that ...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//... he doesn't even know how to hold a sword ...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//... yeah, he really said that ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//... someone'll have to pay for it ...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...Innos enlightens all those who recognize his wisdom ...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//... justice will prevail in the end ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Come back when you have more experience.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//I can't teach you any more. You're too good.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_8_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_8_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_8_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_8_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_8_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_8_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_8_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_8_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//I don't trust you. Something isn't right about you or the way you're dressed.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//The way you look, you must have signed on somewhere else? Then I won't have anything to do with you.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//We have to show a presence. So go and fetch your armor.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos wants us to wear his robes with pride. Go and change.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//I don't talk to diggers. You haven't even got any armor.

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//You filthy bandit!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//PIRATES!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_9_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_9_Weather"						;//Lousy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Now I've got you!
	DieEnemy					=	"SVM_9_DieEnemy"					;//You should never have come here!
	DieMonster					=	"SVM_9_DieMonster"					;//Come here, you filthy beast!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//Another one of those beasts!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Dirty thief! Just wait!
	HandsOff					=	"SVM_9_HandsOff"					;//Get your paws off!
	SheepKiller					=	"SVM_9_SheepKiller"				;//Leave our sheep alone!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Get away from our sheep, you filthy animal!
	YouMurderer					=	"SVM_9_YouMurderer"				;//Murderer!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//You'll regret this!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//I warned you!
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//I said OUT!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Hey! What were you doing in there?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//Stop it! Right now!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//I'll skewer you, bastard!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//That's it for you...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Scheiße!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//So much for you, filthy beast!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//ONE less monster around!
	ThiefDown					=	"SVM_9_ThiefDown"					;//I'm warning you! Don' try that again, you dirty thief!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//From now on, keep your paws off stuff that isn't yours!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//And stay away from our sheep from now on!
	KillMurderer				=	"SVM_9_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//What a bloody stupid creature!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//Don't you ever dare attack me again!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//I warned you!
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//And now, get out!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//I don't want to see you in there again, ever, you got that?
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//There's to be no fighting here, and don't you forget it!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Don't do anything stupid!
	RunAway						= 	"SVM_9_RunAway"						;//I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//ALARM!
	Guards						=	"SVM_9_Guards"					;//GUARDS!
	Help						=	"SVM_9_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//(calls to) Send those beasts to kingdom come!
	GoodKill					= 	"SVM_9_GoodKill"				;//(shouts) Yeah, give it to the bastard!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//(shouts loudly) I'll get you!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Get out of here!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//You've got no business being here!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//Yeah, get out of here!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//What are you up to? What are you sneaking around here for?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//(wakes up) Damnit, what do you want?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Well, at least you've got some gold on you.
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Not even any gold - hmpf.
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//I think I'll take your weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//(warning) Boy! Don't you ever do that again!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//(aggressively) Need another licking?
	StopMagic					=	"SVM_9_StopMagic"				;//Cut out that magic!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Last warning! Cut out that magic!
	WeaponDown					=	"SVM_9_WeaponDown"				;//Put down that weapon!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Put that away, or you're in for it!
	WiseMove					=	"SVM_9_WiseMove"				;//Hey, you're not quite as stupid as you look!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//(to himself) Don't try that again ...
	OhMyHead					=	"SVM_9_OhMyHead"				;//(to himself) Ohh! My head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//(greedily) And now for the fun part ...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//(dismayed) Oh my goodness ...
	GoodVictory					=	"SVM_9_GoodVictory"			;//(evil laugh) Let that be a lesson to him...
	NotBad						= 	"SVM_9_NotBad"					;//(approvingly) That hit the spot!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//(to himself) What a filthy brute!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Slug him!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//Don't stop now!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Finish him!
	Ooh01						=	"SVM_9_Ooh01"					;//Watch out!
	Ooh02						=	"SVM_9_Ooh02"					;//Parry, then!
	Ooh03						=	"SVM_9_Ooh03"					;//Shit, that hurt!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Get out of my bed!
	Awake						= "SVM_9_Awake"					;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//So the commander patched up things with you.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Father Parlan has freed you of your guilt.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//So you saw Lee and took care of that business.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Good.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//You're assaulting sheep? I suppose you couldn't find a more defenseless victim?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//I'll have nothing to do with nasty thugs!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//I won't have anything to do with thieves!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//So you want to be a paladin? Just wait until you hear what Lord Hagen says about this!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//Do you really belong to the city guard? Lord Andre isn't going to stand for that!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Go to Lord Andre while you still can.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Go to Father Parlan. He'll help you atone for your sins!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee is going to hear about this, and you're going to have to pay.
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Commander Garond is not going to be amused. You had better talk to him before matters get even worse!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//All right - you win. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//(smugly) I think now you know who you're dealing with. What do you want?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//You again? Trying to pick another fight with me, are you?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 gold pieces.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//... I can't believe it ...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//... I wouldn't be so sure ...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//... but he knew that all along ...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//... I hardly know what to believe anymore ...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//... I don't know why he gets so worked up ...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//... I'm in enough trouble as it is ...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//... I've heard a thing or two ...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//... I'm not touching that ...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//... you mustn't believe everything you hear ...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//... he didn't get that from me ...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//... I already thought as much ...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//... nobody ever asks for my opinion ...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//... he really didn't deserve that ...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//... don't say you didn't know that ...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//... that was obvious ...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//... where did you pick that up then ...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//... it can't go on like this forever ...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//... I've my own opinion about that ...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//... it was just like you said ...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//... I don't believe this is going to change ...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//... that's the first I've heard of it ...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//... all we can do is wait and see ...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//... I knew that would be a problem ...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//... so why won't they listen to me ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//... he ran like Beliar himself was after him ...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//... of course we got him in the end ...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//... you have to step in and sort things out ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//... some don't even know how wicked they are ...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//... for that is the will of Innos ...
	Smalltalk30					= "SVM_9_Smalltalk30"				;//... his deeds were just ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//You're demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//There's nothing else I can teach you. You've become too good.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_9_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_9_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_9_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_9_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_9_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the blacksmith's shop will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the blacksmith's shop will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//If you pass the pub on the left when you're coming from the temple, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_9_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_9_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_9_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//What's with the get-up? Put on something that suits you.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//What are you wearing? Put on your armor, will you!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//You work for the King, so you had better wear his armor. Get changed.
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//Your clothing is not appropriate for our order. Go and change.
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//You haven't even got any armor. Beat it!

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//Now it's your turn, bandit!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//You shouldn't have shown up here, pirate.
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_10_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_10_Weather"						;//Crappy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//YOU again!
	DieEnemy					=	"SVM_10_DieEnemy"					;//I'm gonna rip you to pieces!
	DieMonster					=	"SVM_10_DieMonster"					;//Another one of those things!
	DirtyThief					=	"SVM_10_DirtyThief"					;//You miserable little thief!
	HandsOff					=	"SVM_10_HandsOff"					;//Take your hands off that!
	SheepKiller					=	"SVM_10_SheepKiller"					;//Hey! Leave our sheep alone!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//That monster is gobbling up our sheep!
	YouMurderer					=	"SVM_10_YouMurderer"					;//Murderer!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//What is THAT creature doing here?
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//You're in for it now!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//You asked for it.
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//I guess some people just have to learn the hard way.
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//What did you want in there, huh!?
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Will you stop it already!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Die!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//What a silly bastard...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//All right, so much for you, filthy beast!
	ThiefDown					=	"SVM_10_ThiefDown"					;//Keep your paws off my stuff in future - got it?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//Keep your fingers to yourself from now on!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//Keep your grubby paws off our sheep from now on!
	KillMurderer				=	"SVM_10_KillMurderer"				;//Die, you murderer!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//What a bloody stupid creature!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Don't ever try that again, buster!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Let that be a lesson to you.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Stand up and get out of here!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//I never want to see you in there again - understood?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//I'm the one who does the bashing around here, understood?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Just leave me alone!
	RunAway						= 	"SVM_10_RunAway"						;//Shit! I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//ALARM!
	Guards						=	"SVM_10_Guards"					;//GUARDS!
	Help						=	"SVM_10_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//(calls to) Yeah! That's how you deal with those things!
	GoodKill					= 	"SVM_10_GoodKill"				;//(calls) That's what the swine deserves!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//(yells) You haven't seen the last of me!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Out!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//What's your business here?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Yeah, beat it!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//(wakes up) Wassup?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//Thanks for the gold, you hero!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//You poor sucker - you don't even have any gold on you!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//I think I'll take this weapon for safekeeping!
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//(warning) Watch it! One more time, and I'll slug you.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//(aggressively) Would you like another punch in the face?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//Cut out this magic crap already!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Are you asking for a licking? Stop it at once!!!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Put that weapon away!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Put that damn weapon away already!
	WiseMove					=	"SVM_10_WiseMove"				;//Smart kid!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//(to himself) We'll see about that the next time...
	OhMyHead					=	"SVM_10_OhMyHead"				;//(to himself) Oh man, my head...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//(eagerly) Aah, a fight!
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//(dismayed) Oh my God, a fight!
	GoodVictory					=	"SVM_10_GoodVictory"				;//(with an evil laugh) You sure showed him!
	NotBad						= 	"SVM_10_NotBad"					;//(appreciative) Not bad...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//(to himself) My God! How brutal...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Yeah, let him have it!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Show him!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Finish him!
	Ooh01						=	"SVM_10_Ooh01"					;//Defend yourself!
	Ooh02						=	"SVM_10_Ooh02"					;//Go ahead, strike back!
	Ooh03						=	"SVM_10_Ooh03"					;//Ouch! That hurt!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//(to himself, waking up) Damnit, what was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Get out of my bed!
	Awake						= "SVM_10_Awake"						;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//So the commander put matters right for you.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//So you have done penance for your deeds with Father Parlan.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//I heard that Lee managed to patch it up for you.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//Fair enough.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Slaughtering sheep is just too much! Get lost!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//You're a thug - get lost!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Accursed thief! - I've really had it with you now!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//I would have expected more of a paladin! Lord Hagen will not be pleased.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//How did someone like you ever make it into the city guard? Lord Andre will have you pay for this!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Lord Andre will hear about your behavior!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Father Parlan will be enraged by your sacrilege!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Lee won't let you get away with it!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Commander Garond won't be happy to hear this - you'll have to pay for this!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//Say, you're packing a pretty punch ... What is it you want?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//(smugly) Any more questions?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//There you are again!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 gold pieces.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//... I couldn't care less ...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//... nobody wants to know ...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//... it was his decision, wasn't it ...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//... no idea, you tell me ...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//... I'm staying out of it ...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//... I've got no time for things like that ...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//... I couldn't get away with that ...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//... you don't have to tell me that ...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//... been there, done that ...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//... the things I could tell you ...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//... you can't rely on that ...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//... I used to say that myself ...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//... and there's more, believe me ...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//... same old thing all over again ...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//... tell me that isn't true ...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//... it had to happen sooner or later ...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//... he really should have known better ...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//... that will never change ...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//... that's no secret ...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//... that was no big deal ...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//... he thinks it's as easy as that ...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//... no-one really wants to hear that  ...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//... and that's the truth ...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//... just listen to him talk ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//... things would have turned out differently if it hadn't been for us ...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//... he simply needs to practice more ...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//... what does he know about duty ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//... Innos deals out fair punishment ...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//... the path of virtue is long and rocky ...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//... only Innos decides what's right or wrong ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_10_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_10_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_10_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_10_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_10_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//Where are you headed?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_10_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_10_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_10_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//What kind of clothes are those? They don't suit you at all. Leave me alone.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//If you're one of us, then you should wear our gear. First go change.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//If someone gives you the King's armor, then you had better wear it.
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//If you deny the robe, you deny Innos. Go and think upon this.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//If you can't even afford any armor, why should I talk to you?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//You filthy bandit!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//You dirty pirate!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//(calls) Wait!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_11_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_11_Weather"						;//Crappy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//So I've got you after ALL!
	DieEnemy					=	"SVM_11_DieEnemy"					;//You're in for it now!
	DieMonster					=	"SVM_11_DieMonster"					;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_11_DirtyThief"					;//Filthy thief! Just you wait!
	HandsOff					=	"SVM_11_HandsOff"					;//Take your paws off that!
	SheepKiller					=	"SVM_11_SheepKiller"					;//That piece of shit is slaughtering our sheep!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//That blasted monster is gobbling up our sheep!
	YouMurderer					=	"SVM_11_YouMurderer"					;//Murderer!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Just you wait, you sumbitch!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//You asked for it!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Then I'll have to KNOCK you out of here!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//So what was YOUR business in there, huh!?
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Will you stop it now?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Die, bastard!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//So much for you, lowlife!
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//One less monster around!
	ThiefDown					=	"SVM_11_ThiefDown"					;//Never try to steal from me again!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//In the future, keep your paws off stuff that is no concern of yours!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Never do that again! Those are our sheep!
	KillMurderer				=	"SVM_11_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//Never pick a fight with me again!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//You should have listened to me!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//And now get out of here!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//And never let me catch you in there again!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//No fighting here, do you understand? Let that be a lesson to you!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Just leave me in peace!
	RunAway						= 	"SVM_11_RunAway"						;//Shit! I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//ALARM!
	Guards						=	"SVM_11_Guards"						;//GUARDS!
	Help						=	"SVM_11_Help"						;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//(calls) Well done - one dirty beast less!
	GoodKill					= 	"SVM_11_GoodKill"					;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//(calls loudly) Stop right there, you lowlife!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Get out of here!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//What do you want here!? Go!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//Yeah, make yourself scarce!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//Hey you! What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//(wakes up) Damnit, what's up?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//Gold! OK, that's mine for starters ...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//You don't even have any gold on you?
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//I think I'll take your weapon for safekeeping.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//(warning) Hey! Watch it!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//(aggressively) Haven't you had enough yet?
	StopMagic					=	"SVM_11_StopMagic"					;//Just stay away from me with that magic of yours!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//Cut out that magic! Something wrong with your ears!?
	WeaponDown					=	"SVM_11_WeaponDown"					;//Put down that weapon!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Are you deaf or what? I said: Put down that weapon!
	WiseMove					=	"SVM_11_WiseMove"					;//See, that wasn't so hard.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//(to himself) We'll see about that ...
	OhMyHead					=	"SVM_11_OhMyHead"					;//(to himself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//(eagerly) And now for some action!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//(dismayed) They're smashing each other's skulls ...
	GoodVictory					=	"SVM_11_GoodVictory"					;//(evil laugh) He deserved that!
	NotBad						= 	"SVM_11_NotBad"						;//(approvingly) Not bad at all ...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//(to himself) What a brutal fellow ...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Yeah, that's the ticket!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Whatcha waiting for?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//Atta boy!
	Ooh01						=	"SVM_11_Ooh01"						;//Don't take any crap!
	Ooh02						=	"SVM_11_Ooh02"						;//Show him who's boss!
	Ooh03						=	"SVM_11_Ooh03"						;//Holy shit!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Get out of my bed!
	Awake						= "SVM_11_Awake"							;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//I hear you went to the commander and set matters right.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//I hear you went to Father Parlan and repented your sins.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//They say you went to see Lee and settled that matter.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//That's good.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Slaughtering our sheep just like that! Beat it, buster!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//I don't talk to filthy thugs!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//Get out of my sight, you dirty thief!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//You're a disgrace to your order! Lord Hagen will be furious!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//You're a disgrace to the city guard! Lord Andre will teach you some manners!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Lord Andre will hear of what you've done!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Father Parlan will not be happy to hear of this!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Lee will give you what for! You'll see where this gets you!
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Commander Garond will demand an explanation from you!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//All right, all right, you win. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//(smugly) Do I have to show you again who's boss?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Trying to pick another fight with me, are you?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 gold pieces.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 gold pieces.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 gold pieces.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 gold pieces.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 gold pieces.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 gold pieces.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 gold pieces.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 gold pieces.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 gold pieces.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 gold pieces.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 gold pieces.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 gold pieces.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 gold pieces.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 gold pieces.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 gold pieces.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 gold pieces.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 gold pieces.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 gold pieces.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 gold pieces.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 gold pieces.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 gold pieces.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 gold pieces.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 gold pieces.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 gold pieces.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 gold pieces.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 gold pieces.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 gold pieces.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//... do you really think...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//... anything's possible ...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//... he should have known better ...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//... as if I didn't have enough problems ...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//... who told you that ...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//... that'll only cause more trouble ...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//... there've been all kinds of rumors ...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//... I wouldn't have done that ...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//... those are all just rumors ...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//... it's better to watch out who you tell what ...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//... I could have told you that before ...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//... nobody ever asks me ...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//... you have to feel sorry for the poor guy ...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//... that's nothing new ...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//... that's totally obvious ...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//... you don't have to ask me that ...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//... it can't go on like this forever ...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//... you already know what I think ...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//... that's exactly what I said ...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//... nothing's going to change about that ...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//... why haven't I heard about this before ...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//... let's wait and see what happens ...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//... some problems solve themselves ...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//... I don't want to hear that anymore ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//... he was falling down drunk ...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//... I won't be treated like that ...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//... they all ran like rabbits, I was completely alone ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//... so it says in the scriptures ...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//... I always act in the name of Innos ...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//... no one must violate the divine order ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_11_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_11_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_11_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_11_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_11_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_11_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_11_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_11_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//What kind of clothes are those? They don't suit you at all. Leave me alone.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Kindly wear our armor when I'm talking to you. Go on, beat it.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//You are supposed to wear the King's armor. Now, go.
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//Your clothing is not appropriate for our order. Go and change.
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//You haven't even got any armor. Beat it!

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Another bandit.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//PIRATES!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_12_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_12_Weather"					;//Lousy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Now I've got you!
	DieEnemy					=	"SVM_12_DieEnemy"					;//You should never have come here!
	DieMonster					=	"SVM_12_DieMonster"					;//Come here, you filthy beast!
	DirtyThief					=	"SVM_12_DirtyThief"					;//Dirty thief! Just wait!
	HandsOff					=	"SVM_12_HandsOff"					;//Get your paws off of that!
	SheepKiller					=	"SVM_12_SheepKiller"				;//Leave our sheep alone!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//Get away from our sheep, you filthy animal!
	YouMurderer					=	"SVM_12_YouMurderer"				;//Murderer!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//You'll regret this!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//I warned you!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//I said OUT!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Hey! What were you doing in there?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//Stop it! Right now!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//I'll skewer you, bastard!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//That's it for you...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//I love this shit!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//ONE less monster around!
	ThiefDown					=	"SVM_12_ThiefDown"					;//I'm warning you! Don' try that again, you dirty thief!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//From now on, keep your paws off stuff that isn't yours!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//And stay away from our sheep from now on!
	KillMurderer				=	"SVM_12_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//What a bloody stupid creature!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//Don't you ever dare attack me again!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//I warned you!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//And now, get out!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//I don't want to see you here again, got it?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//There's to be no fighting here, and don't you forget it!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Don't do anything stupid!
	RunAway						= 	"SVM_12_RunAway"						;//I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//ALARM!
	Guards						=	"SVM_12_Guards"					;//GUARDS!
	Help						=	"SVM_12_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//(calls to) Send those beasts to kingdom come!
	GoodKill					= 	"SVM_12_GoodKill"				;//(shouts) Yeah, give it to the bastard!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//(shouts loudly) I'll get you!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Get out of here!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//You've got no business being here!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//Yeah, get out of here!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//What are you up to? What are you sneaking around here for?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//(wakes up) Damnit, what do you want?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Well, at least you've got some gold on you.
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Not even any gold - hmpf.
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//I think I'll take your weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//(warning) Boy! Don't you ever do that again!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//(aggressively) Need another licking?
	StopMagic					=	"SVM_12_StopMagic"				;//Cut out that magic!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Last warning! Cut out that magic!
	WeaponDown					=	"SVM_12_WeaponDown"				;//Put down that weapon!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Put that away, or you're in for it!
	WiseMove					=	"SVM_12_WiseMove"				;//Hey, you're not quite as stupid as you look!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//(to himself) Don't try that again ...
	OhMyHead					=	"SVM_12_OhMyHead"				;//(to himself) Ohh! My head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//(greedily) And now for the fun part ...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//(dismayed) Oh my goodness ...
	GoodVictory					=	"SVM_12_GoodVictory"			;//(evil laugh) Let that be a lesson to him...
	NotBad						= 	"SVM_12_NotBad"					;//(approvingly) That hit the spot!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//(to himself) What a filthy brute!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//Slug him!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Don't stop now!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Finish him!
	Ooh01						=	"SVM_12_Ooh01"					;//Watch out!
	Ooh02						=	"SVM_12_Ooh02"					;//Parry, then!
	Ooh03						=	"SVM_12_Ooh03"					;//Shit, that hurt!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Get out of my bed!
	Awake						= "SVM_12_Awake"					;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//So the commander patched up things with you.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//So Father Parlan has freed you of your guilt.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//So you saw Lee and took care of that business.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Good.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//You're assaulting sheep? I suppose you couldn't find a more defenseless victim?
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//I'll have nothing to do with nasty thugs!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//I won't have anything to do with thieves!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//So you want to be a paladin? Just wait until you hear what Lord Hagen says about this!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//Do you really belong to the city guard? Lord Andre isn't going to stand for that!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Go to Lord Andre while you still can.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Go to Father Parlan. He'll help you atone for your sins!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee is going to hear about this, and you're going to have to pay.
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Commander Garond is not going to be amused. You had better talk to him before matters get even worse!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//All right - you win. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//(smugly) I think now you know who you're dealing with. What do you want?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//You again? Trying to pick another fight with me, are you?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 gold pieces.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//... I couldn't care less ...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//... nobody wants to know ...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//... it was his decision, wasn't it ...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//... no idea, you tell me ...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//... I'm staying out of it ...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//... I've got no time for things like that ...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//... I couldn't get away with that ...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//... you don't have to tell me that ...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//... been there, done that ...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//... the things I could tell you ...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//... you can't rely on that ...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//... I used to say that myself ...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//... and there's more, believe me ...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//... same old thing all over again ...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//... tell me that isn't true ...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//... it had to happen sooner or later ...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//... he should really have known better ...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//... that will never change ...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//... that's no secret ...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//... that was no big deal ...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//... he thinks it's as easy as that ...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//... no-one really wants to hear that  ...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//... and that's the truth ...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//...you just have to listen ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//... things would have turned out differently if it hadn't been for us ...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//... he simply needs to practice more ...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//... what does he know about duty ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//... Innos deals out fair punishment ...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//... the path of virtue is long and rocky ...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//... only Innos decides what's right or wrong ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_12_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_12_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_12_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_12_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_12_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_12_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_12_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_12_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Your clothes just don't suit you. First, go change.
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Wear your armor if you want to talk to me.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//A soldier wears the armor of the King. NOT something else! So go change.
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//Your clothing is not appropriate for our order. Go and change.
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//You can't even afford any armor. I don't talk to weaklings.

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//I'll tear you to pieces, bandit!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//I'll tear you to pieces, pirate!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_13_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_13_Weather"					;//Crappy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//I'll get you now!
	DieEnemy					=	"SVM_13_DieEnemy"					;//I'm gonna rip you to pieces!
	DieMonster					=	"SVM_13_DieMonster"					;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_13_DirtyThief"					;//Filthy thief! Just you wait!
	HandsOff					=	"SVM_13_HandsOff"					;//Take your paws off that!
	SheepKiller					=	"SVM_13_SheepKiller"				;//That piece of shit is slaughtering our sheep!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//That blasted monster is gobbling up our sheep!
	YouMurderer					=	"SVM_13_YouMurderer"				;//Murderer!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Just you wait, you sumbitch!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//You asked for it!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//You don't want to leave? All right!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//What did you want in there?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Will you stop it now?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Die, bastard!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//You deserved that, lowlife!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//One less monster around!
	ThiefDown					=	"SVM_13_ThiefDown"					;//Never try to steal from me again!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//From now on, keep your paws off stuff that isn't yours!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Never do that again! Those are our sheep!
	KillMurderer				=	"SVM_13_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//Never pick a fight with me again!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//You should have listened to me!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//And now get out of here!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//And never let me catch you in there again!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//No fighting here, do you understand? Let that be a lesson to you!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Don't hurt me!
	RunAway						= 	"SVM_13_RunAway"					;//Oh, shit!!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//ALARM!
	Guards						=	"SVM_13_Guards"					;//GUARDS!
	Help						=	"SVM_13_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//(calls to) Well done - one dirty beast less!
	GoodKill					= 	"SVM_13_GoodKill"				;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//(calls loudly) Yes! Run as fast as you can!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Get out of here!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//What do you want here!? Go!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//Yeah, get away from here!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//Hey you! What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//(wakes up) Damnit, what's up?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//Thanks for the gold, you hero!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//You poor sucker, you don't even have any gold on you!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//I think I had better take this weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//(warning) Watch it! One more time, and I'll slug you one.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//Haven't you had enough yet?
	StopMagic					=	"SVM_13_StopMagic"				;//Cut out this magic crap!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Want a licking? Stop it this instant!!!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Put away that weapon!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Will you put away that damn weapon?!
	WiseMove					=	"SVM_13_WiseMove"				;//Smart kid!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//(to himself) Well, we'll see the next time ...
	OhMyHead					=	"SVM_13_OhMyHead"				;//(to himself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//(eagerly) Ah, a fight!
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//(dismayed) Oh my God, a fight!
	GoodVictory					=	"SVM_13_GoodVictory"			;//(evil laugh) You showed him who's boss!
	NotBad						= 	"SVM_13_NotBad"					;//(approvingly) Not bad ...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//(to himself) My God! How brutal...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//Hit, then!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Give it your all!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Show him!
	Ooh01						=	"SVM_13_Ooh01"					;//Hang on!
	Ooh02						=	"SVM_13_Ooh02"					;//Watch out!
	Ooh03						=	"SVM_13_Ooh03"					;//Wow! That hit the spot!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Get out of my bed!
	Awake						= "SVM_13_Awake"					;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//So you went to the commander and set matters right.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//So you went to Father Parlan to atone for your sins.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//So you went to see Lee and put the matter in order.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//That's good.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Slaughtering our sheep just like that!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Leave me alone, you filthy brute!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Leave me alone, you miserable little thief!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//You're a disgrace to your order! Wait until Lord Hagen hears of this!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//You're a disgrace to the city guard! Wait until Lord Andre hears of this!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Wait until Lord Andre hears of this.
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Wait until Father Parlan hears of this!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Wait until Lee gets wind of this...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Wait until Commander Garond hears of this!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//All right, all right, you're the better fighter. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//(smugly) I assume that, by now, you are well aware which of us is stronger ... What do you want?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//I thought you were trying to pick a fight with me. Did you change your mind? You prefer TALKING, right? (laughs)
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 gold pieces.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//... I couldn't care less ...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//... nobody wants to know ...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//... it was his decision, wasn't it ...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//... no idea, you tell me ...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//... I'm staying out of it ...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//... I've got no time for things like that ...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//... I couldn't get away with that ...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//... you don't have to tell me that ...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//... been there, done that ...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//... the things I could tell you ...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//... you can't rely on that ...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//... I used to say that myself ...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//... and there's more, believe me ...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//... same old thing all over again ...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//... tell me that isn't true ...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//... it had to happen sooner or later ...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//... he really should have known better ...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//... that will never change ...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//... that's no secret ...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//... that was no big deal ...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//... he thinks it's as easy as that ...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//... no-one really wants to hear that  ...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//... and that's the truth ...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//...you just have to listen ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//... things would have turned out differently if it hadn't been for us ...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//... he simply needs to practice more ...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//... what does he know about duty ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//... Innos deals out fair punishment ...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//... the path of virtue is long and rocky ...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//... only Innos decides what's right or wrong ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_13_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_13_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_13_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_13_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_13_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_13_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_13_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_13_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//What kind of clothes are those? They don't suit you at all. Leave me alone.
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//You aren't wearing your armor. Go and fetch it.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//You should be proud to wear the armor of the King, rather than running around in these rags. Now, go!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Why aren't you wearing the clothing of our order? Go and think upon this.
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//You haven't even got any armor. Beat it!

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//You filthy bandit!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//You miserable pirate!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_14_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_14_Weather"						;//What lousy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//So I've got you after ALL!
	DieEnemy					=	"SVM_14_DieEnemy"					;//You're in for it now!
	DieMonster					=	"SVM_14_DieMonster"					;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_14_DirtyThief"					;//Filthy thief! Just you wait!
	HandsOff					=	"SVM_14_HandsOff"					;//Take your paws off that!
	SheepKiller					=	"SVM_14_SheepKiller"					;//That piece of shit is slaughtering our sheep!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//That blasted monster is gobbling up our sheep!
	YouMurderer					=	"SVM_14_YouMurderer"					;//Murderer!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Just you wait, you sumbitch!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//You asked for it!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Then I'll have to KNOCK you out of here!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//So what was YOUR business in there, huh!?
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Will you stop it now?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Die, bastard!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//So much for you, lowlife!
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//One less monster around!
	ThiefDown					=	"SVM_14_ThiefDown"					;//Never try to steal from me again!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//In the future, keep your paws off stuff that is no concern of yours!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Never do that again! Those are our sheep!
	KillMurderer				=	"SVM_14_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//Never pick a fight with me again!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//You should have listened to me!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//And now get out of here!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//And never let me catch you in there again!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//No fighting here, do you understand? Let that be a lesson to you!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Just leave me in peace!
	RunAway						= 	"SVM_14_RunAway"						;//Shit! I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//ALARM!
	Guards						=	"SVM_14_Guards"						;//GUARDS!
	Help						=	"SVM_14_Help"						;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//(calls to) Well done - one dirty beast less!
	GoodKill					= 	"SVM_14_GoodKill"					;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//(calls loudly) Stop right there, you lowlife!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Get out of here!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//What do you want here!? Go!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//Yeah, make yourself scarce!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//Hey you! What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//(wakes up) Damnit, what's up?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//Gold! OK, that's mine for starters ...
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//You don't even have any gold on you?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//I think I'll take your weapon for safekeeping.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//(warning) Hey! Watch it!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//(aggressively) Haven't you had enough yet?
	StopMagic					=	"SVM_14_StopMagic"					;//Just stay away from me with that magic of yours!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//Cut out that magic! Something wrong with your ears!?
	WeaponDown					=	"SVM_14_WeaponDown"					;//Put down that weapon!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Can't you hear me? I said: Put down that weapon!
	WiseMove					=	"SVM_14_WiseMove"					;//See, that wasn't so hard.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//(to himself) We'll talk about that ...
	OhMyHead					=	"SVM_14_OhMyHead"					;//(to himself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//(eagerly) And now for some action!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//(dismayed) They're smashing each other's skulls ...
	GoodVictory					=	"SVM_14_GoodVictory"					;//(evil laugh) He deserved that!
	NotBad						= 	"SVM_14_NotBad"						;//(approvingly) Not bad at all ...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//(to himself) What a brutal fellow ...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Yeah, that's the ticket!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Whatcha waiting for?
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//Atta boy!
	Ooh01						=	"SVM_14_Ooh01"						;//Don't take any crap!
	Ooh02						=	"SVM_14_Ooh02"						;//Show him who's boss!
	Ooh03						=	"SVM_14_Ooh03"						;//Holy shit!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//(to himself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Get out of my bed!
	Awake						= "SVM_14_Awake"							;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//I hear you went to the commander and set matters right.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//I hear you went to Father Parlan and repented your sins.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//They say you went to see Lee and settled that matter.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//That's good.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Slaughtering our sheep just like that! Beat it, buster!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//I don't talk to filthy thugs!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//Get out of my sight, you dirty thief!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//You're a disgrace to your order! Lord Hagen will be furious!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//You're a disgrace to the city guard! Lord Andre will teach you some manners!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Lord Andre will hear of what you've done!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Father Parlan will not be happy to hear of this!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Lee will give you what for! You'll see where this gets you!
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Commander Garond will demand an explanation from you!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//All right, all right, you win. What do you want?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//(smugly) Do I have to show you again who's boss?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Trying to pick another fight with me, are you?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 gold pieces.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 gold pieces.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 gold pieces.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 gold pieces.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 gold pieces.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 gold pieces.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 gold pieces.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 gold pieces.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 gold pieces.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 gold pieces.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 gold pieces.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 gold pieces.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 gold pieces.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 gold pieces.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 gold pieces.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 gold pieces.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 gold pieces.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 gold pieces.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 gold pieces.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 gold pieces.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 gold pieces.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 gold pieces.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 gold pieces.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 gold pieces.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 gold pieces.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 gold pieces.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 gold pieces.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//... I don't believe it ...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//... I wouldn't be so sure ...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//... but he knew that all along ...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//... I hardly know what to believe anymore...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//... I don't know why he gets so worked up ...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//... I'm in enough trouble as it is ...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//... I have heard a thing or two ...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//... I'm not touching that ...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//... you mustn't believe everything you hear ...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//... he didn't get that from me ...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//... I already thought as much ...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//... nobody ever asks for my opinion ...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//... he really didn't deserve that ...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//... don't say you didn't know that ...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//... that was quite obvious ...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//... where did you pick that up then ...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//... it can't go on like this forever ...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//... I've got my own opinion about that ...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//... it was just like you said ...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//... I don't believe this is going to change ...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//... that' the first I've heard of it ...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//... we can only wait and see ...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//... I knew that would be a problem ...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//... so why won't they listen to me ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//... he ran like Beliar himself was after him ...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//... of course we got him after all ...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//... you have to step in and sort things out ...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//... some don't even know how wicked they are ...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//... for that is the will of Innos ...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//... his deeds were just ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_14_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_14_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_14_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_14_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_14_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_14_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_14_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_14_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//Your clothes don't suit you. You must have something to hide. Leave me alone.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//If you want to talk to me, you have to wear our armor.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Be proud of the army and don't run around in those rags. First, go change.
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//Your clothing is not appropriate for our order. Go and change.
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//You haven't even got any armor. Beat it!

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Die, bandit.
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Die, pirate.
};

// ****************
// 		SPIELER
// ****************

INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	// ------ Player-Only SVMs ---------------------------------------------------------------------
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hey, you!
	SC_HeyTurnAround02		= 	"SVM_15_SC_HeyTurnAround02"			;//Hey!
	SC_HeyTurnAround03		= 	"SVM_15_SC_HeyTurnAround03"			;//
	SC_HeyTurnAround04		= 	"SVM_15_SC_HeyTurnAround04"			;//
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Wait a minute!

	DoesntWork				= 	"SVM_15_DoesntWork"					;//Doesn't work.
	PickBroke				= 	"SVM_15_PickBroke"					;//Hm, it broke.
	NeedKey					= 	"SVM_15_NeedKey"					;//I need the key for that ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//No more lock picks ...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//I know nothing about picking locks.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//Sweeping all the chambers will take forever!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Hm ... I don't have a lock pick or the key.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//I'll never get this open without the right key!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//A few lock picks would be helpful!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//I'll never be able to open this thing!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//What with?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Hmm ... No ...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Nothing to be had there ...
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Nothing there ...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Nothing to plunder ...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargl
	Awake					=	"SVM_15_Awake"						;//(wakes up)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Mmh. So that's where you're hiding out. Damn far away. Mmh. I'll need a ship to get there.
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innos, grant me your aid and purify this shrine.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innos, grant me your aid and all that ... There. That ought to be the last time.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//XARAK BENDARDO! Ah. The book's open. There's a letter and a key hidden inside.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//KHADOSH EMEM KADAR! Open!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Let's deal.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Show me your wares.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Show me what you have.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//I see.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Ah. I think I've found something.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//I don't understand...
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//I can't read that!
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//AKHANTAR!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//JHERHEDRA!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//URIZIEL RATIS!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//(cough) Oh, man. Brrr!!
	HUI						=	"SVM_15_Addon_HUI"						;//Oh oh oh!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//What do you know about the attempt on Esteban's life?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//About the attack on Esteban...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//I'll kill those traitors.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//I'm looking for those guys so I can move against Esteban.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//You're needed in the mine.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. Appear to me, Quarhodron, ancient leader of the warrior caste!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Mmh... That doesn't work here.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//What do I have to know about mining gold?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Aha. Francis' paybook. The man seems to have finagled a lot of gold into his own pockets.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_16_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_16_Weather"						;//What lousy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//So I've got you after ALL!
	DieEnemy					=	"SVM_16_DieEnemy"					;//You're in for it now!
	DieMonster					=	"SVM_16_DieMonster"					;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_16_DirtyThief"					;//Filthy thief! Just you wait!
	HandsOff					=	"SVM_16_HandsOff"					;//Take your paws off that!
	SheepKiller					=	"SVM_16_SheepKiller"					;//That piece of shit is slaughtering our sheep!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//That blasted monster is gobbling up our sheep!
	YouMurderer					=	"SVM_16_YouMurderer"					;//Murderer!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Just you wait, you sumbitch!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//You asked for it!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Then I'll have to KNOCK you out of here!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//So what was YOUR business in there, huh!?
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Will you stop it now?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Die, bastard!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//So much for you, lowlife!
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//One less monster around!
	ThiefDown					=	"SVM_16_ThiefDown"					;//Never try to steal from me again!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//From now on, keep your paws off stuff that is no concern of yours!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Never do that again! Those are our sheep!
	KillMurderer				=	"SVM_16_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//Never pick a fight with me again!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//You should have listened to me!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//And now get out of here!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//And never let me catch you in there again!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//No fighting here, do you understand? Let that be a lesson to you!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Don't hurt me!
	RunAway						= 	"SVM_16_RunAway"						;//I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//ALARM!
	Guards						=	"SVM_16_Guards"					;//GUARDS!
	Help						=	"SVM_16_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//(calls) Well done!
	GoodKill					= 	"SVM_16_GoodKill"				;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//(calls loudly) Stop right there, you coward!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Get out of here!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//What do you want here!? Go!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//Yeah, make yourself scarce!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//Hey you! What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//(wakes up) What's the matter?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//Thanks for the gold, you hero!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//You poor sucker, you don't even have any gold on you!
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//I think I had better take this weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//(warning) Watch it! One more time, and I'll slug you one.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//Haven't you had enough yet?
	StopMagic					=	"SVM_16_StopMagic"				;//Cut out this magic crap!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Want a beating? Stop it this instant!!!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Put away that weapon!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Will you put away that damn weapon?!
	WiseMove					=	"SVM_16_WiseMove"				;//Smart kid!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//(to herself) Well, we'll see the next time ...
	OhMyHead					=	"SVM_16_OhMyHead"				;//(to herself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//(eagerly) Aah, a fight!
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//(dismayed) Oh my God, a fight!
	GoodVictory					=	"SVM_16_GoodVictory"			;//(evil laugh) You showed him who's boss!
	NotBad						= 	"SVM_16_NotBad"					;//(approvingly) Not bad ...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//(to herself) My God! How brutal...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Whack him!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Give him what for!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Let him have it!
	Ooh01						=	"SVM_16_Ooh01"					;//Hit back!
	Ooh02						=	"SVM_16_Ooh02"					;//Watch out, then!
	Ooh03						=	"SVM_16_Ooh03"					;//Oh! That hurt!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//(to herself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Get out of my bed!
	Awake						= "SVM_16_Awake"					;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//So you went to the commander and cleared your name.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//So you went to Father Parlan and atoned for your sins.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee straightened out that matter for you.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//That's good.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//You can't just kill our sheep like that! Go away!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//You're a brutal thug, I want nothing to do with you.
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//I don't talk to thieves - and now go away!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Your behavior wasn't honorable. Lord Hagen won't like this!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Your behavior is a disgrace to the city guard! Lord Andre will demand an explanation!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Lord Andre will hear about what you've done!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Your conduct was wrong. Go to Father Parlan and repent.
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Lee will find out what you did - and he will punish you!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Commander Garond will demand an explanation from you!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 gold pieces.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//... really? How interesting ...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//... I don't believe that ...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//... That's not what my husband thinks ...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//... go away, don't tell me that ...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//... honestly, I witnessed it myself ...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//... you don't say ...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//... don't tell this to anyone ...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//... these are bad times ...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//... who says things like that? ...
	Smalltalk10					= "SVM_16_Smalltalk10"				;//... if I hadn't seen it with my own eyes ...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//... someone's got to do the work ...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//... that's not what I heard ...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//... now that's typical, isn't it ...
	Smalltalk14					= "SVM_16_Smalltalk14"				;//... he can't keep anything to himself ...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//... he had better shut up ...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//... and he works all day, too ...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//... I can't take care of everything for everybody ...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//... he simply talks too much ...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//... that's an open secret ...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//... everybody knows by now ...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//... I won't tell her a thing from now on ...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//... and It's going to get even worse ...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//... but that's terrible ...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//... that's what I've always said ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_16_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_16_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_16_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_16_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_16_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Aaaaaargl!
	Aargh_1						= "SVM_16_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_16_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_16_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Put on something decent. I don't want to see you like that.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//A BANDIT!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//A PIRATE!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//For the King!
	PALGreetings				=	"SVM_17_PALGreetings"				;//For Innos!
	Weather						= 	"SVM_17_Weather"						;//What lousy weather!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//So I've got you after ALL!
	DieEnemy					=	"SVM_17_DieEnemy"					;//You're in for it now!
	DieMonster					=	"SVM_17_DieMonster"					;//There's another of those scummy beasts!
	DirtyThief					=	"SVM_17_DirtyThief"					;//Filthy thief! Just you wait!
	HandsOff					=	"SVM_17_HandsOff"					;//Take your paws off that!
	SheepKiller					=	"SVM_17_SheepKiller"					;//That piece of shit is slaughtering our sheep!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//That blasted monster is gobbling up our sheep!
	YouMurderer					=	"SVM_17_YouMurderer"					;//Murderer!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//No beasts in here!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Just you wait, you sumbitch!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//You asked for it!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Then I'll have to KNOCK you out of here!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//So what was YOUR business in there, huh!?
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Will you stop it now?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Die, bastard!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//So much for you, lowlife!
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//One less monster around!
	ThiefDown					=	"SVM_17_ThiefDown"					;//Never try to steal from me again!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//From now on, keep your paws off stuff that is no concern of yours!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Never do that again! Those are our sheep!
	KillMurderer				=	"SVM_17_KillMurderer"				;//Die, murderer!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//What a bloody stupid beast!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//Never pick a fight with me again!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//You should have listened to me!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//And now get out of here!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//And never let me catch you in there again!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//No fighting here, do you understand? Let that be a lesson to you!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Don't hurt me!
	RunAway						= 	"SVM_17_RunAway"						;//I'm outta here!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//ALARM!
	Guards						=	"SVM_17_Guards"					;//GUARDS!
	Help						=	"SVM_17_Help"					;//Help!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//(calls) Well done!
	GoodKill					= 	"SVM_17_GoodKill"				;//(calls) Yeah, give the swine what for!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Leave me alone!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//(calls loudly) Stop right there, you coward!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Get out of here!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//What do you want here!? Go!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//Yeah, make yourself scarce!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//Hey you! What are you creeping around there for?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//(wakes up) Wassup?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//Thanks for the gold, you hero!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//You poor sucker, you don't even have any gold on you!
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//I think I had better take this weapon.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//(warning) Watch it! One more time, and I'll slug you one.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//Haven't you had enough yet?
	StopMagic					=	"SVM_17_StopMagic"				;//Cut out this magic crap!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Want a beating? Stop it this instant!!!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Put away that weapon!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Will you put away that damn weapon?!
	WiseMove					=	"SVM_17_WiseMove"				;//Smart kid!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//(to herself) Well, we'll see the next time ...
	OhMyHead					=	"SVM_17_OhMyHead"				;//(to herself) Oh man, my head ...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//(eagerly) Aah, a fight!
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//(dismayed) Oh my God, a fight!
	GoodVictory					=	"SVM_17_GoodVictory"			;//(evil laugh) You showed him who's boss!
	NotBad						= 	"SVM_17_NotBad"					;//(approvingly) Not bad ...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//(to herself) My God! How brutal...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Whack him!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Give him what for!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Let him have it!
	Ooh01						=	"SVM_17_Ooh01"					;//Hit back!
	Ooh02						=	"SVM_17_Ooh02"					;//Watch out, then!
	Ooh03						=	"SVM_17_Ooh03"					;//Oh! That hurt!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//(to herself, waking up) What was THAT!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Get out of my bed!
	Awake						= "SVM_17_Awake"					;//(hearty yawn)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//So you went to the commander and cleared your name.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//So you went to Father Parlan and atoned for your sins.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee straightened out that matter for you.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//That's good.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//You can't just kill our sheep like that! Go away!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//You're a brutal thug, I want nothing to do with you.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//I don't talk to thieves - and now go away!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Your behavior wasn't honorable. Lord Hagen won't like this!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Your behavior is a disgrace to the city guard! Lord Andre will demand an explanation!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Lord Andre will hear about what you've done!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Your conduct was wrong. Go to Father Parlan and repent.
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Lee will find out what you did - and he will punish you!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Commander Garond will demand an explanation from you!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 gold pieces.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 gold pieces.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 gold pieces.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 gold pieces.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 gold pieces.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 gold pieces.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 gold pieces.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 gold pieces.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 gold pieces.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 gold pieces.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 gold pieces.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 gold pieces.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 gold pieces.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 gold pieces.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 gold pieces.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 gold pieces.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 gold pieces.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 gold pieces.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 gold pieces.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 gold pieces.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 gold pieces.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 gold pieces.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 gold pieces.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 gold pieces.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 gold pieces.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 gold pieces.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 gold pieces.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 gold pieces.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//... really? How interesting ...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//... I don't believe that ...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//... That's not what my husband thinks ...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//... go away, don't tell me that ...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//... honestly, I witnessed it myself ...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//... you don't say ...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//... don't tell this to anyone ...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//... these are bad times ...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//... who says things like that? ...
	Smalltalk10					= "SVM_17_Smalltalk10"				;//... if I hadn't seen it with my own eyes ...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//... someone's got to do the work ...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//... that's not what I heard ...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//... now that's typical, isn't it ...
	Smalltalk14					= "SVM_17_Smalltalk14"				;//... he can't keep anything to himself ...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//... he had better shut up ...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//... and he works all day, too ...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//... I can't take care of everything for everybody ...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//... he simply talks too much ...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//... that's an open secret ...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//... everybody knows by now ...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//... I won't tell her a thing from now on ...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//... and It's going to get even worse ...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//... but that's terrible ...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//... that's what I've always said ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Come back once you have more experience.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//You are demanding more than I can teach you.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//There is nothing else I can teach you. You have become too good.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//See, you're better already ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//You are now in the lower part of town.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//You are now in the upper part of town.
	TEMPEL						= "SVM_17_TEMPEL"					;//You are now at the temple.
	MARKT						= "SVM_17_MARKT"						;//You are now at the marketplace.
	GALGEN						= "SVM_17_GALGEN"					;//You are now at the gallows square in front of the barracks.
	KASERNE						= "SVM_17_KASERNE"					;//These are the barracks.
	HAFEN						= "SVM_17_HAFEN"						;//You are now in the harbor district.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//Where do you want to go?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Walk through the inner city gate from here, and you'll get to the lower part of town.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//A flight of stairs leads up from the southern city gate to the inner city gate. That's where the upper part of town begins.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Walking through the underpass from the smithy will take you to the temple square.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Walking down the harbor road from the smithy will take you to the harbor.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//There is an underpass which leads to the lower part of town from the temple square.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//When you're in front of the temple, go up to the left and along the city wall. This will take you to the marketplace.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Coming from the temple, if you pass the pub on the left, you'll come out at the gallows square.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Walking along the high city wall from the marketplace will take you to the temple.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs opposite the hotel.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//Just walk past the large barracks and you'll get to the gallows square.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Walk down the alley from the gallows square, and you'll come to the temple square.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//Just walk past the large barracks and you'll get to the marketplace.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//The huge building is the barracks. Just walk up the stairs.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//Just walk down the stairs to the left at the main entrance, and you'll get to the marketplace.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//Just walk down the stairs to the right at the main entrance, and you'll get to the gallows square.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Walking up the harbor road from the quay wall will take you to the lower part of town.
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
	DieEnemy     	= "SVM_19_DieEnemy"     	;//(hisses) There he is!
	RunCoward    	= "SVM_19_RunCoward"    	;//(hisses) We shall get you!
	Dead      		= "SVM_19_Dead"      	;//Aaaaaargl!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Aargh
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Aargh
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Aargh
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




