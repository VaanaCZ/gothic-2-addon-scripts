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
	MILGreetings				= 	"SVM_1_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_1_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_1_Weather"						;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//A jednak mi się nie wymkniesz!
	DieEnemy					=	"SVM_1_DieEnemy"					;//Doigrałeś się!
	DieMonster					=	"SVM_1_DieMonster"					;//Znowu jedna z tych głupich bestii!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Czekaj tylko, ty parszywy złodzieju!
	HandsOff					=	"SVM_1_HandsOff"					;//Łapy precz!
	SheepKiller					=	"SVM_1_SheepKiller"					;//Ten bydlak szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//Ta przeklęta bestia pożera nasze owce!
	YouMurderer					=	"SVM_1_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//Żadne bestie nie mają tu prawa wstępu!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Czekaj tylko, bydlaku!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//W takim razie będę musiał cię stąd wykopać!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//A czego TY tam szukałeś, hę?!
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Giń, gnido!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//To już koniec, śmieciu!
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_1_ThiefDown"					;//Nigdy więcej nie próbuj mnie okradać!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//W przyszłości trzymaj łapska z dala od cudzych spraw.
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Nigdy więcej tego nie rób! To NASZE owce!
	KillMurderer				=	"SVM_1_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//Co za głupia bestia!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//Nigdy więcej nie próbuj się ze mną mierzyć!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//Trzeba było mnie słuchać!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//A teraz zmywaj się stąd!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//I żebym cię już nigdy więcej tam nie przyłapał!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Tu się nie walczy, jasne?! Niech to będzie dla ciebie nauczką!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_1_RunAway"						;//A niech to! Trzeba wiać!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//ALARM!
	Guards						=	"SVM_1_Guards"						;//STRAŻ!
	Help						=	"SVM_1_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_1_GoodKill"					;//Dobrze! Wykończ świnię!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//Stój, śmieciu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Wynocha!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//Czego tu szukasz? Odejdź!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//No, wynoś się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Ej ty! Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Cholera, co się dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//Złoto! Zaopiekuję się nim...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//Ten frajer nie ma nawet złota.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Zajmę się twoją bronią...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Ej! Uważaj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Ciągle ci mało?!
	StopMagic					=	"SVM_1_StopMagic"					;//Zabieraj się z tą swoją magią!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Powiedziałem: KONIEC z magią! Ogłuchłeś, czy co?!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Ogłuchłeś? Odłóż tę broń!
	WiseMove					=	"SVM_1_WiseMove"					;//No proszę, jednak można!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//Jeszcze zobaczymy...
	OhMyHead					=	"SVM_1_OhMyHead"					;//Och, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//Wreszcie coś się dzieje...
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//Oni zrobią sobie krzywdę...
	GoodVictory					=	"SVM_1_GoodVictory"					;//Zasłużył sobie na to!
	NotBad						= 	"SVM_1_NotBad"						;//Nieźle... Całkiem nieźle.
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//Co za brutal...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Dobrze, tak trzymaj!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//No, dalej!
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//Mocniej!
	Ooh01						=	"SVM_1_Ooh01"						;//Nie pozwól na to!
	Ooh02						=	"SVM_1_Ooh02"						;//Dasz sobie radę!
	Ooh03						=	"SVM_1_Ooh03"						;//A niech to!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//Co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Wynocha z mojego łóżka!
	Awake						= "SVM_1_Awake"							;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//Powiadają, że byłeś u kapitana i załatwiłeś sprawę.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//Ponoć byłeś u Ojca Parlana i wyspowiadałeś się ze swych grzechów?
	ABS_FARM					= "SVM_1_ABS_FARM"						;//Słyszałem, że byłeś u Lee i doprowadziłeś sprawę do porządku.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Tak po prostu zaszlachtować nasze owce... Wynoś się!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//Z takimi jak ty nie będę rozmawiać!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//Zejdź mi z oczu, parszywy złodzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//Jesteś zakałą swojego zakonu! Lord Hagen będzie wściekły!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//Jesteś zakałą straży miejskiej! Lord Andre na pewno da ci nauczkę!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Lord Andre dowie się o wszystkim!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Twoje czyny z pewnością nie ucieszą Ojca Parlana!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Dostanie ci się za to od Lee! I na co ci to było?!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Kapitan Garond rozliczy cię z tego!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//No już dobrze, wygrałeś. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//Mam ci jeszcze raz pokazać, kto tu rządzi?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Chcesz się jeszcze raz ze mną spróbować?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 sztuk złota.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 sztuk złota.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 sztuk złota.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 sztuk złota.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 sztuk złota.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 sztuk złota.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 sztuk złota.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 sztuk złota.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 sztuk złota.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 sztuk złota.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 sztuk złota.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 sztuk złota.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 sztuk złota.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 sztuk złota.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 sztuk złota.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 sztuk złota.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 sztuk złota.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 sztuk złota.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 sztuk złota.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 sztuk złota.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 sztuk złota.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 sztuk złota.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 sztuk złota.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 sztuk złota.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 sztuk złota.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 sztuk złota.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 sztuk złota.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//...naprawdę sądzisz...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//...wszystko jest możliwe...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//...powinien był wiedzieć lepiej...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//...tak jakby brakowało mi zmartwień...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//...kto opowiada takie rzeczy...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//...przez to będzie jeszcze więcej kłopotów...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//...wiesz, mówi się o tym i o tamtym...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//...ja bym tego nie zrobił...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//...to wszystko tylko pogłoski...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//...trzeba uważać na to, co się mówi...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//...mogłem ci powiedzieć wcześniej...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//...mnie i tak nikt nie pyta...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//...właściwie może być go tylko żal...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//...to przecież nic nowego...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//...to przecież oczywiste...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//...mnie nie musisz o to pytać...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//...to nie może być tak dalej...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//...znasz już moje zdanie...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//...powiedziałem dokładnie to samo...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//...nic się nie zmieni...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//...dlaczego dowiaduję się o tym dopiero teraz...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//...po prostu trzeba odczekać....
	Smalltalk23					= "SVM_1_Smalltalk23"					;//...niektóre problemy same się rozwiązują...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//...nie chcę już o tym słuchać...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//...był w sztok pijany...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//...nie ze mną te numery...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//...pouciekali jak zające, byłem zupełnie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//...tak jest napisane w świętych pismach...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//...w swych działaniach kieruję się wolą Innosa...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//...nie wolno występować przeciwko boskiemu porządkowi...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_1_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_1_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_1_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_1_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_1_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//A gdzie się wybierasz?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//Idź od strony kuźni przez przejście, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//Idź od strony kuźni w dół ulicą portową, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście prowadzące do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//Kiedy będziesz przed świątynią, skręć w lewo i idź wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Jeżeli idąc od strony świątyni, skręcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Jeżeli pójdziesz wzdłuż murów miejskich od strony targowiska, to dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz się do nich po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//Po prostu przejdź obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//Idź od strony placu wisielców w dół uliczką, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//Po prostu przejdź obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz się do niego po schodach.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Po prostu zejdź po schodach na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Po prostu zejdź po schodach na prawo od głównego wejścia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nabrzeżu w górę ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_1_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_1_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_1_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//To nie jest twoje ubranie. Nie będę z tobą rozmawiać.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//Jak ty wyglądasz? Ubierz się porządnie!
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//Jesteś żołnierzem! Ubierz się odpowiednio!
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz się!
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj się stąd!

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Giń, bandycki pomiocie!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Piracka świnia!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_3_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_3_Weather"					;//Ale nędzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Teraz cię dorwę!
	DieEnemy					=	"SVM_3_DieEnemy"					;//Zaraz cię załatwię!
	DieMonster					=	"SVM_3_DieMonster"					;//Znowu jedna z tych głupich bestii!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Czekaj tylko, ty parszywy złodzieju!
	HandsOff					=	"SVM_3_HandsOff"					;//Łapy precz!
	SheepKiller					=	"SVM_3_SheepKiller"				;//Ten bydlak szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//Ta przeklęta bestia zżera nasze owce!
	YouMurderer					=	"SVM_3_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//Żadne stwory nie mają tu prawa wstępu!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Czekaj tylko, ty gnido!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//Nie chcesz iść? Dobrze!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//Czego tam szukałeś?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Giń, gnido!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//Zasłużyłeś sobie na to, bydlaku!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_3_ThiefDown"					;//Nigdy więcej nie próbuj mnie okraść!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//Na przyszłość trzymaj się z dala od cudzej własności!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Nigdy więcej tego nie rób! To są nasze owce!
	KillMurderer				=	"SVM_3_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//Ale głupia bestia!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//Nigdy więcej nie próbuj się ze mną mierzyć!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//Trzeba było mnie posłuchać!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//A teraz zmywaj się stąd!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//I żebym cię już nigdy więcej tam nie przyłapał!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Tu się nie walczy, jasne?! Niech to będzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_3_RunAway"					;//O cholera!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//ALARM!
	Guards						=	"SVM_3_Guards"					;//STRAŻ!
	Help						=	"SVM_3_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_3_GoodKill"				;//No, wykończ świnię!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//No, biegnij! Najszybciej jak potrafisz!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Wynoś się stąd!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//Czego tu szukasz? Odejdź!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//No, wynoś się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//Ej ty! Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//Cholera, co się dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//Dzięki za złoto, mój ty bohaterze!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//Ty frajerze, nawet nie masz złota!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//Lepiej zaopiekuję się twoją bronią...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//Lepiej uważaj! Następnym razem ci przyłożę.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//Ciągle ci mało?!
	StopMagic					=	"SVM_3_StopMagic"				;//Skończ wreszcie z tym czarowaniem!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Chcesz dostać? Natychmiast przestań!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Odłóż wreszcie tę cholerną broń!
	WiseMove					=	"SVM_3_WiseMove"				;//Spryciarz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//Zobaczymy następnym razem...
	OhMyHead					=	"SVM_3_OhMyHead"				;//Och, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//Aach, walka..
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//O rany, walka!
	GoodVictory					=	"SVM_3_GoodVictory"			;//Ale mu pokazałeś!
	NotBad						= 	"SVM_3_NotBad"					;//Nieźle...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//Na bogów! Jak brutalnie...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Wal!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Daj z siebie wszystko!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Pokaż mu!
	Ooh01						=	"SVM_3_Ooh01"					;//Trzymaj się!
	Ooh02						=	"SVM_3_Ooh02"					;//Uwaga!
	Ooh03						=	"SVM_3_Ooh03"					;//O! To musiało boleć!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//Co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Wynocha z mojego łóżka!
	Awake						= "SVM_3_Awake"					;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//Byłeś zatem u kapitana i doprowadziłeś wszystko do porządku.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//Byłeś zatem u Ojca Parlana i wyspowiadałeś się ze swoich grzechów.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//Byłeś więc u Lee i wyjaśniłeś sprawę.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Tak po prostu zaszlachtować nasze owce!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Zostaw mnie w spokoju, bydlaku!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Zostaw mnie w spokoju, ty parszywy złodzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//Jesteś hańbą dla swojego zakonu! Poczekaj tylko, aż Lord Hagen się o tym dowie!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//Hańbisz dobre imię straży miejskiej! Poczekaj, aż dowie się o tym Lord Andre!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Poczekaj tylko, aż Lord Andre się o tym dowie.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Poczekaj tylko, aż dowie się o tym Ojciec Parlan!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Poczekaj tylko, aż Lee się o tym dowie...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Poczekaj, aż dowie się o tym kapitan Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Dobrze, dobrze. Jesteś lepszy ode mnie. Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//Wiesz już chyba, który z nas jest tym silniejszym... Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//Myślałem, że chcesz się ze mną zmierzyć. Zmieniłeś zdanie? Wolisz jednak ROZMAWIAĆ, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 sztuk złota.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//...naprawdę myślisz...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//...wszystko jest możliwe...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//...powinien być mądrzejszy...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//...tak jakbym nie miał wystarczająco dużo problemów...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//...kto ci to powiedział...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//...z tego wyniknie tylko jeszcze więcej kłopotów...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//...krążą ostatnio różne plotki...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//...nigdy by mi nie przyszło do głowy...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//...to przecież tylko pogłoski...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//...trzeba uważać na to, co się mówi...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//...mogłem ci powiedzieć wcześniej...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//...mnie i tak nikt nie pyta...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//...biedakowi można tylko współczuć...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//...to przecież nic nowego...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//...to przecież oczywiste...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//...mnie nie musisz o to pytać...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//...tak dalej być nie może...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//...znasz już moje zdanie...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//...dokładnie to samo powiedziałem...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//...nic tego nie zmieni...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//...czemu dowiaduję się o tym dopiero teraz...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//...poczekajmy, co z tego wyniknie...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//...niektóre problemy same się rozwiązują...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//...już nie chce mi się o tym słuchać...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//...przecież on był w sztok pijany...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//...nie pozwolę się tak traktować...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//...wszyscy uciekali jak zające, byłem zupełnie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//...tak jest napisane w świętych pismach...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//...działam zawsze w imieniu Innosa...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//...nikt nie może występować przeciwko boskiemu porządkowi...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_3_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_3_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_3_GALGEN"					;//Znajdujesz się teraz na placu wisielców.
	KASERNE						= "SVM_3_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_3_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//Dokąd to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Idąc od kowala, miń przejście, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//Idź od kowala ulicą portową, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście prowadzące do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//Kiedy znajdziesz się przed świątynią, skręć w lewo i idź potem wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Jeżeli idąc od strony świątyni, skręcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Jeżeli będziesz szedł od strony targowiska wzdłuż murów miejskich, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejdź po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//Udaj się drogą obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//Idź w dół uliczką odchodzącą od placu wisielców, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//Przejdź obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejść po schodach.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//Zejdź po schodach znajdujących się na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//Zejdź po schodach znajdujących się na prawo od głównego wejścia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nabrzeżu w górę ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Aaarrrhhh!
	Aargh_1						= "SVM_3_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_3_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_3_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju!
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Jeśli chcesz porozmawiać, najpierw się jakoś ubierz.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//My, żołnierze, nosimy nasze mundury z dumą. Załóż swój.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//W naszym Zakonie wszyscy są równi, dlatego nosimy identyczne ubrania. Przebierz się!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Wyszedłeś prosto z więzienia, prawda? Załóż na siebie jakieś ubranie!

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//CHODŹ TU, BANDYTO!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//CHODŹ TU, PIRACIE!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_4_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_4_Weather"						;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//To znowu TY!
	DieEnemy					=	"SVM_4_DieEnemy"					;//Załatwię cię!
	DieMonster					=	"SVM_4_DieMonster"					;//Znowu jedna z tych głupich bestii!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Ty mały, parszywy złodzieju!
	HandsOff					=	"SVM_4_HandsOff"					;//Zabieraj łapy!
	SheepKiller					=	"SVM_4_SheepKiller"					;//Hej! Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//Ta bestia zżera nasze owce!
	YouMurderer					=	"SVM_4_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//A TEN stwór czego tu chce?!
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//No, teraz to mnie wkurzyłeś!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//Kto nie chce słuchać, musi poczuć...
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//Czego tam szukałeś, co?!
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Giń!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//Cholerny bydlak...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//No, koniec z tobą, bestio!
	ThiefDown					=	"SVM_4_ThiefDown"					;//Trzymaj na przyszłość łapy z dala od moich rzeczy, jasne?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//Trzymaj na przyszłość łapy przy sobie!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//Nie podnoś nigdy więcej ręki na nasze owce!
	KillMurderer				=	"SVM_4_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//Głupie stworzenie!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Nie próbuj tego jeszcze raz, chłopczyku!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Niech to będzie dla ciebie nauczka.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Wstawaj i wynoś się stąd!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//Nie chcę cię więcej tam widzieć, zrozumiano?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//Jeżeli ktoś tu rozdziela ciosy, to jestem to ja, zrozumiano?!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_4_RunAway"						;//Cholera! Trzeba uciekać!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//ALARM!
	Guards						=	"SVM_4_Guards"					;//STRAŻ!
	Help						=	"SVM_4_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//No! Tak należy obchodzić się z bestiami!
	GoodKill					= 	"SVM_4_GoodKill"				;//Zasługuje na to!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//Jeszcze się spotkamy!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Wynoś się!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//Czego tu szukasz?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Zabieraj się stąd!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//Co się dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//Dzięki za złoto, mój ty bohaterze!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//Ty frajerze, nawet złota nie masz!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//Wezmę sobie twoją broń.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//Lepiej uważaj! Następnym razem ci przyłożę.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//Znowu chcesz w mordę?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//Skończ wreszcie z tym czarowaniem!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Chcesz dostać? Natychmiast przestań!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Odłóż wreszcie tę cholerną broń!
	WiseMove					=	"SVM_4_WiseMove"				;//Spryciarz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//Zobaczymy następnym razem...
	OhMyHead					=	"SVM_4_OhMyHead"				;//O rany, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//O rany, walka!
	GoodVictory					=	"SVM_4_GoodVictory"				;//Ale mu pokazałeś!
	NotBad						= 	"SVM_4_NotBad"					;//Nieźle...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//Bogowie! Jak ostro...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Wal z całej siły!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Pokaż mu!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Wykończ go!
	Ooh01						=	"SVM_4_Ooh01"					;//Broń się!
	Ooh02						=	"SVM_4_Ooh02"					;//Oddaj cios!
	Ooh03						=	"SVM_4_Ooh03"					;//Uuu, to musiało boleć!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//Cholera, co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Wynocha z mojego łóżka!
	Awake						= "SVM_4_Awake"						;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//Załatwiłeś zatem sprawę z kapitanem.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//Opowiedziałeś zatem Ojcu Parlanowi o swych czynach.
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//Mówią, że Lee załatwił całą sprawę.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Szlachtowanie owiec to już przesada! Wynoś się!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Jesteś jakimś oprychem - lepiej stąd odejdź!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Przeklęty złodziej! Gardzę takimi jak ty!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//Wydawało mi się, że od paladyna można spodziewać się czegoś więcej. Lord Hagen będzie niepocieszony.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//Że takich jak ty w ogóle przyjmują do straży miejskiej! Odpowiesz za to przed Lordem Andre!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Lord Andre dowie się o twoim zachowaniu!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Ojciec Parlan będzie wściekły!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Odpowiesz za to przed Lee!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Kapitan Garond nie będzie zadowolony, kiedy o tym usłyszy! Zapłacisz za to!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//Masz całkiem niezłe uderzenie... Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//Jeszcze jakieś pytania?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//To znowu ty!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 sztuk złota.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//...to rzeczywiście prawda...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//...słyszałem coś innego...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//...nie mów, że o tym nie wiedziałeś...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//...człowiek nie wie, komu wierzyć...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//...to tylko gadanie...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//...no widzisz, już mi lepiej...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//...mnie to już nic nie dziwi...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//...to naprawdę nie mój problem...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//...naprawdę w to wierzysz...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//...ode mnie nie usłyszą nawet słówka...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//...to było oczywiste od dawna...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//...posłuchał niewłaściwych ludzi...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//...jeżeli on sam tego nie widzi, to nie mogę mu pomóc...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//...nie mówię przecież niczego nowego...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//...sam by na to nie wpadł...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//...przecież wiadomo o tym od dawna...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//...nieprzyjemna sprawa...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//...zrobiłbym to inaczej...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//...całkowicie się z tobą zgadzam...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//...czy to się kiedykolwiek zmieni...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//...nikt mi o tym nie mówił...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//...i tak nic nie zmienisz...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//...wcale mnie to nie dziwi...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//...ale on zawsze wie lepiej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//...i tak liczy się tylko siła, więc nie mów mi takich rzeczy...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//...on nawet nie wie, jak się trzyma miecz...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//...tak, naprawdę tak powiedział...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//...ktoś za to odpowie...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...Innos oświeca wszystkich tych, którzy widzą jego mądrość...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//...w końcu musi wygrać sprawiedliwość...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_4_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_4_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_4_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_4_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_4_HAFEN"						;//Jesteś w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//Gdzie chcesz się dostać?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//Idź od strony kowala przez przejście, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//Idź od strony kowala w dół ulicą portową, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście prowadzące do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//Kiedy będziesz przed świątynią, skręć w lewo i idź wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Jeżeli idąc od strony świątyni, skręcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Jeżeli pójdziesz wzdłuż murów miejskich od strony targowiska, to dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejdź po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//Po prostu przejdź obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//Idź od strony placu wisielców w dół uliczką, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//Po prostu przejdź obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz się tam po schodach.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Po prostu zejdź po schodach na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Po prostu zejdź po schodach na prawo od głównego wejścia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nadbrzeżu w górę ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_4_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_4_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_4_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Ubierz się porządnie, to porozmawiamy.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//Załóż swój cholerny pancerz, jeśli chcesz ze mną rozmawiać!
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Nie dostałeś jednego z naszych pancerzy? No to sobie taki załatw.
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//Skąd ty się wziąłeś? Przebierz się, wtedy pogadamy.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//Biedaków nam nie trzeba. Wróć, jak będzie cię stać na pancerz.

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Jeszcze jeden bandyta!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//Ty zawszony piracie!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_5_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_5_Weather"						;//Ale beznadziejna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//A jednak cię mam!
	DieEnemy					=	"SVM_5_DieEnemy"					;//Teraz cię załatwię!
	DieMonster					=	"SVM_5_DieMonster"					;//Znowu jedna z tych przeklętych bestii!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Czekaj tylko, parszywy złodzieju!
	HandsOff					=	"SVM_5_HandsOff"					;//Łapy precz!
	SheepKiller					=	"SVM_5_SheepKiller"					;//Ten bydlak szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//Ta przeklęta bestia zżera nasze owce!
	YouMurderer					=	"SVM_5_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//Żadne stwory nie mają tu prawa wstępu!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//No, teraz ci się dostanie, bydlaku!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//Będę cię więc musiał wyrzucić siłą!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//Czego TY tam szukałeś?
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Giń, gnido!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//Już po tobie, śmieciu.
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//Jedna cholerna bestia mniej!
	ThiefDown					=	"SVM_5_ThiefDown"					;//Nie próbuj nigdy więcej mnie okradać!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//Na przyszłość trzymaj łapy z dala od nieswoich rzeczy!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Nigdy więcej tego nie rób! To są nasze owce!
	KillMurderer				=	"SVM_5_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//Głupia bestia!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//Nigdy więcej nie próbuj się ze mną mierzyć!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//Trzeba było mnie posłuchać!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//A teraz zabieraj się stąd!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//I żebym cię już nigdy więcej tam nie przyłapał!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Tutaj się nie walczy, jasne?! Niech to będzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_5_RunAway"						;//Cholera! Trzeba uciekać!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//ALARM!
	Guards						=	"SVM_5_Guards"						;//STRAŻ!
	Help						=	"SVM_5_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_5_GoodKill"					;//Dobrze, załatw drania!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//Stój, śmieciu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Wynoś się!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//Czego tu szukasz?! Odejdź!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//No, zabieraj się stąd!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Ej ty! Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Cholera, co się dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//Złoto! Teraz należy do mnie...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//Nie masz nawet złota?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Wezmę twoją broń na przechowanie...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hej, uważaj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Jeszcze ci mało?!
	StopMagic					=	"SVM_5_StopMagic"					;//Trzymaj się z dala ode mnie z tą twoją magią!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Skończ z tą magią! Masz problem ze słuchem?!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Głuchy jesteś? Odłóż wreszcie tę broń!
	WiseMove					=	"SVM_5_WiseMove"					;//Widzisz, to nie było takie trudne!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//Jeszcze raz, a się doigrasz...
	OhMyHead					=	"SVM_5_OhMyHead"					;//Och, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//Wreszcie coś się dzieje...
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//Porozwalają sobie łby...
	GoodVictory					=	"SVM_5_GoodVictory"					;//Zasłużył sobie na to!
	NotBad						= 	"SVM_5_NotBad"						;//Nieźle...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//Ale brutal...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Tak, dobrze tak!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//No, dalej!
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//Mocniej, mocniej!
	Ooh01						=	"SVM_5_Ooh01"						;//Nie pozwalaj na to!
	Ooh02						=	"SVM_5_Ooh02"						;//Pokaż, kto tu rządzi!
	Ooh03						=	"SVM_5_Ooh03"						;//To przecież niemożliwe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//Co to było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Wynocha z mojego łóżka!
	Awake						= "SVM_5_Awake"							;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//Mówią, że byłeś u kapitana i załatwiłeś całą sprawę.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//Ponoć byłeś u Ojca Parlana i wyspowiadałeś się ze swych grzechów?
	ABS_FARM					= "SVM_5_ABS_FARM"						;//Byłeś zatem u Lee i wyjaśniłeś sprawę.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Tak po prostu szlachtować nasze owce! Zabieraj się stąd!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//Nie rozmawiam z takimi opryszkami jak ty!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//Zejdź mi z oczu, parszywy złodzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//Hańbisz dobre imię swojego zakonu! Lord Hagen będzie wściekły!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//Jesteś hańbą dla straży miejskiej! Lord Andre teraz ci pokaże!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Lord Andre dowie się o twoim czynie!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//Ojciec Parlan będzie niepocieszony!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Lee się z tobą rozprawi! Zobaczysz, czy było warto!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Kapitan Garond cię z tego rozliczy!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//No już dobrze, wygrałeś. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//Mam ci jeszcze raz pokazać, kto tu rządzi?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Chcesz się jeszcze raz ze mną spróbować?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 sztuk złota.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 sztuk złota.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 sztuk złota.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 sztuk złota.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 sztuk złota.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 sztuk złota.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 sztuk złota.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 sztuk złota.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 sztuk złota.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 sztuk złota.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 sztuk złota.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 sztuk złota.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 sztuk złota.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 sztuk złota.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 sztuk złota.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 sztuk złota.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 sztuk złota.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 sztuk złota.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 sztuk złota.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 sztuk złota.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 sztuk złota.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 sztuk złota.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 sztuk złota.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 sztuk złota.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 sztuk złota.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 sztuk złota.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 sztuk złota.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//...naprawdę sądzisz...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//...wszystko jest możliwe...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//...powinien być mądrzejszy...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//...jakby było mało problemów...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//...kto ci to powiedział...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//...z tego będzie jeszcze więcej kłopotów...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//...ludzie gadają o tym i o tamtym...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//...lepiej tego nie robić...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//...to wszystko tylko plotki...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//...trzeba uważać, co się komu mówi...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//...trzeba było mnie spytać wcześniej...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//...mnie i tak nikt nie pyta...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//...żal mi tego biedaka...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//...to przecież nic nowego...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//...to przecież oczywiste...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//...mnie nie musisz o to pytać...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//...tak dalej być nie może...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//...moje zdanie już znasz...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//...moja reakcja była taka sama...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//...nic się w tej sprawie nie zmieni...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//...czemu dowiaduję się o tym dopiero teraz...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//...poczekajmy, co z tego wyniknie...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//...niektóre problemy same się rozwiązują...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//...już nie mogę tego słuchać...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//...był w sztok pijany...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//...nie pozwolę, żeby mnie tak traktowano...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//...wszyscy uciekali jak zające, byłem zupełnie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//...tak jest napisane w świętych pismach...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//...działam w imieniu Innosa...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//...nie wolno naruszać boskiego porządku...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_5_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_5_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_5_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_5_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_5_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//Dokąd się wybierasz?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//Idź od kowala przejściem, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//Idź od kowala w dół ulicą portową, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście prowadzące do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//Kiedy znajdziesz się przed świątynią, pójdź w lewo i potem wzdłuż murów, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Idąc od strony świątyni, mijasz knajpę po lewej i dochodzisz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Jeżeli idąc od strony targowiska, będziesz szedł wzdłuż murów miejskich, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejdź po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//Idź wzdłuż koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//Idź od strony placu wisielców w dół uliczką, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//Idź wzdłuż koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejść po schodach.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//Zejdź po schodach na lewo od głównego wejścia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//Zejdź po schodach na prawo od głównego wejścia, to dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nabrzeżu w górę ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Aaaarhhhh!
	Aargh_1						= "SVM_5_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_5_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_5_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Ubierz się porządnie.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//W czym ty chodzisz? Nie jesteś już jednym z nas? Nie chcę mieć z tobą nic do czynienia.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//My - żołnierze - walczymy za króla, dlatego nosimy jego pancerze!
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Po co Zakon dał ci ubranie, jeśli nie do noszenia? Pomyśl trochę.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//Kim ty w ogóle jesteś? Nie masz nawet pancerza. Odejdź!

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//A, bandyta!
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//Zaraz cię załatwię, piracie!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_6_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_6_Weather"					;//Pieska pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//Teraz cię dorwę!
	DieEnemy					=	"SVM_6_DieEnemy"					;//Nie powinieneś tu przychodzić!
	DieMonster					=	"SVM_6_DieMonster"					;//No chodź!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Złodziej! Czekaj no...
	HandsOff					=	"SVM_6_HandsOff"					;//Zabieraj łapy!
	SheepKiller					=	"SVM_6_SheepKiller"				;//Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//Odejdź od naszych owiec, bestio!
	YouMurderer					=	"SVM_6_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//Żadna bestia tu nie wejdzie!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//Pożałujesz tego!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Ostrzegałem cię...
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Hej, WYNOŚ SIĘ!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Hej! Czego tam szukałeś?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//Przestać! Natychmiast!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//Teraz cię wypatroszę!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//Tyle na ten temat...
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Hej! Ciągle to potrafię!
	ThiefDown					=	"SVM_6_ThiefDown"					;//Ostrzegam cię! Nie próbuj tego ponownie, ty przeklęty złodzieju!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//Trzymaj łapy z dala od cudzej własności!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//I trzymaj się na przyszłość z dala od naszych owiec!
	KillMurderer				=	"SVM_6_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//Głupia bestia!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//Nie waż się nigdy więcej mnie atakować!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//Ostrzegałem cię...
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//A teraz zabieraj się stąd!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//Nie chcę cię już tam więcej widzieć, jasne?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Tu się nie walczy, niech to będzie dla ciebie nauczka.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Nie rób głupstw!
	RunAway						= 	"SVM_6_RunAway"						;//Zmywam się stąd!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//ALARM!
	Guards						=	"SVM_6_Guards"					;//STRAŻ!
	Help						=	"SVM_6_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//Daj im wycisk!
	GoodKill					= 	"SVM_6_GoodKill"				;//No, pokaż draniowi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//Jeszcze cię dorwę!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Wynoś się stąd!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//Nie masz tu czego szukać!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//No, wynoś się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//Co to ma być? Co ty tutaj robisz?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//Cholera, czego chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//No, przynajmniej masz jakieś złoto...
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Eeee... Nawet złota nie ma...
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Zajmę się twoją bronią...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//Nie próbuj tego ponownie, chłopcze!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//Znowu szukasz guza?
	StopMagic					=	"SVM_6_StopMagic"				;//Przestań z tą magią!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Ostatnie ostrzeżenie! Skończ z tym czarowaniem!
	WeaponDown					=	"SVM_6_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Odłóż to albo ci przyłożę!
	WiseMove					=	"SVM_6_WiseMove"				;//Nie jesteś wcale taki głupi, na jakiego wyglądasz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//Nie próbuj tego ponownie...
	OhMyHead					=	"SVM_6_OhMyHead"				;//Och, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//Teraz będzie zabawnie...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//O bogowie...
	GoodVictory					=	"SVM_6_GoodVictory"			;//To będzie dla niego nauczka...
	NotBad						= 	"SVM_6_NotBad"					;//HA! To było niezłe!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//Brutalny drań!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Wal!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Nie przestawaj!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Załatw go!
	Ooh01						=	"SVM_6_Ooh01"					;//Uważaj!
	Ooh02						=	"SVM_6_Ooh02"					;//Paruj!
	Ooh03						=	"SVM_6_Ooh03"					;//Cholera, to bolało!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//Co ty tutaj robisz?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Wynocha z mojego łóżka!
	Awake						= "SVM_6_Awake"					;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//Kapitan wyjaśnił więc z tobą całą sprawę.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Ojciec Parlan uwolnił cię od twoich grzechów.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//Byłeś zatem u Lee i wyjaśniłeś sprawę.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Dobrze.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//Atakujesz owce? Bardziej bezbronnej ofiary nie mogłeś sobie pewnie znaleźć?!
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//Z takimi jak ty nie chcę mieć nic wspólnego!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//Ze złodziejami nie chcę mieć nic wspólnego!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//I ty chcesz być paladynem? Ciekawe, co na to Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//Naprawdę należysz do straży miejskiej? Lordowi Andre się to nie spodoba!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//Idź do Lorda Andre, póki jeszcze możesz.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//Idź do Ojca Parlana. Otrzymasz od niego pokutę!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee się o tym dowie... Zapłacisz za to!
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Kapitanowi Garondowi wcale to się nie spodoba. Porozmawiaj z nim, póki jeszcze możesz!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//Dobrze - wygrałeś. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//Sądzę, że wiesz już, kogo masz przed sobą. Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//Znowu ty? Chcesz się znowu ze mną zmierzyć czy jak?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 sztuk złota.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//...trudno mi w to uwierzyć...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//...trudno być tego pewnym...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//...przecież wiedział o tym wcześniej...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//...nie wiem już, w co wierzyć...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//...nie wiem, czym on się tak denerwuje...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//...nie trzeba mi więcej kłopotów...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//...mówią to i owo...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//...będę się lepiej trzymać od tego z daleka...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//...nie można wierzyć we wszystko, co się słyszy...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//...ode mnie tego nie dostał...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//...przyszło mi to do głowy...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//...moje zdanie i tak nikogo nie obchodzi...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//...nie zasłużył sobie na to...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//...nie mów, że o tym nie wiesz...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//...to było oczywiste...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//...skąd ty to znowu masz...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//...nie może tak dalej być...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//...mam swoje zdanie na ten temat...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//...było dokładnie tak, jak mówisz...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//...nie sądzę, żeby coś się zmieniło...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//...słyszę o tym po raz pierwszy...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//...możemy jedynie przeczekać...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//...musiały pojawić się problemy...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//...czemu nikt mnie nie słucha...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//...uciekał, jakby gonił go sam Beliar...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//...w końcu i tak go oczywiście dorwaliśmy...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//...trzeba silnie uderzyć w sam środek...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//...niektórzy nie zdają sobie w ogóle sprawy ze swoich grzechów...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//...taka jest bowiem wola Innosa...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//...jego czyny były sprawiedliwe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_6_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_6_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_6_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_6_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_6_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//Dokąd to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//Idź od kowala przejściem, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//Idź od kowala w dół ulicą portową, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście prowadzące do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//Kiedy znajdziesz się przed świątynią, pójdź w lewo i potem wzdłuż murów, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Jeżeli idąc od strony świątyni, skręcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Jeżeli idąc od strony targowiska, będziesz szedł wzdłuż murów miejskich, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejdź po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//Idź po prostu wzdłuż koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//Idź od strony placu wisielców w dół uliczką, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//Idź wzdłuż koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejść po schodach.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//Zejdź po schodach na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//Zejdź po schodach na prawo od głównego wejścia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nadbrzeżu w górę ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_6_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_6_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_6_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//W tych łachmanach wyglądasz jak idiota. Ubierz się!
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//Myślisz, że cię nie poznaję? Zjeżdżaj i ubierz się odpowiednio!
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//Żołnierzu! Co to za strój?! Natychmiast się przebierz!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//Sługa Innosa nie ukrywa się! Idź po swoją togę.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//Łazisz jak jakiś kopacz. Ubierz się!

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//Napadłeś niewłaściwego człowieka, BANDYTO!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Wynoś się na morze, PIRACIE!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_7_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_7_Weather"						;//Kiepska pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//Znowu TY?!
	DieEnemy					=	"SVM_7_DieEnemy"					;//Rozerwę cię na kawałki!
	DieMonster					=	"SVM_7_DieMonster"					;//Znowu jedno z tych przeklętych stworzeń!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty mały, nędzny złodzieju!
	HandsOff					=	"SVM_7_HandsOff"					;//Trzymaj łapy z daleka!
	SheepKiller					=	"SVM_7_SheepKiller"					;//Hej! Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//Ten potwór zżera nasze owce!
	YouMurderer					=	"SVM_7_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//A TA bestia co tu robi?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//Teraz mnie wkurzyłeś!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//Kto nie chce słuchać, musi poczuć...
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//Co tam robiłeś, co?!
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Przestaniecie z tym?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Giń!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//Głupi dureń...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//Tyle na ten temat...
	ThiefDown					=	"SVM_7_ThiefDown"					;//Trzymaj na przyszłość łapy z dala od moich rzeczy, zrozumiano?!
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//Trzymaj łapy przy sobie!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//Trzymaj łapska z dala od naszych owiec!
	KillMurderer				=	"SVM_7_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//Głupia bestia!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//Nie próbuj tego ponownie, brachu!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Niech to będzie dla ciebie nauczka.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Wstawaj i zabieraj się stąd!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//Nie chcę cię już tam więcej widzieć, jasne?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//To ja tutaj rozdaję ciosy, zrozumiano?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Po prostu zostaw mnie w spokoju!
	RunAway						= 	"SVM_7_RunAway"						;//Cholera! Wynoszę się stąd!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//ALARM!
	Guards						=	"SVM_7_Guards"					;//STRAŻ!
	Help						=	"SVM_7_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//Tak trzeba z nimi postępować!
	GoodKill					= 	"SVM_7_GoodKill"				;//Dobrze, pokaż świni!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//Jeszcze cię dorwę!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Wynoś się!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//Czego tu szukasz?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//No, wynocha!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//Co ty tam robisz?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//Co jest?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//Dzięki za złoto, mój ty bohaterze!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//Ty frajerze, nawet złota nie masz!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//Lepiej zaopiekuję się twoją bronią...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//Uważaj! Następnym razem ci przyłożę.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//Chcesz jeszcze raz dostać w mordę?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//Przestań natychmiast z tym czarowaniem!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Chcesz dostać? Przestań w tej chwili!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Odłożysz wreszcie tę przeklętą broń?!
	WiseMove					=	"SVM_7_WiseMove"				;//Mądra decyzja!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//Zobaczymy następnym razem...
	OhMyHead					=	"SVM_7_OhMyHead"				;//Och, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//Ach, walka...
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_7_GoodVictory"				;//Pokazałeś mu, kto tu rządzi!
	NotBad						= 	"SVM_7_NotBad"					;//Hmm. Nieźle...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//Bogowie! Jak ostro...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//No, dołóż mu!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Pokaż mu!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Niech ma, czego chciał!
	Ooh01						=	"SVM_7_Ooh01"					;//Broń się!
	Ooh02						=	"SVM_7_Ooh02"					;//Nie daj się!
	Ooh03						=	"SVM_7_Ooh03"					;//Oj! To musiało boleć!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//Cholera, co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Wynocha z mojego łóżka!
	Awake						= "SVM_7_Awake"						;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//Powiadają, że kapitan wyprostował całą sprawę.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//Zatem wyspowiadałeś się Ojcu Parlanowi ze swoich grzechów.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//Mówią, że Lee załatwił dla ciebie całą sprawę.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Szlachtowanie owiec to już szczyt szczytów! Wynoś się!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Jesteś jakimś oprychem - lepiej stąd odejdź!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Przeklęty złodziej! Gardzę takimi jak ty!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//Wydawało mi się, że od paladyna można spodziewać się czegoś więcej. Lord Hagen będzie niepocieszony.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//Jak ty się w ogóle dostałeś do straży?! Odpowiesz za to przed Lordem Andre!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Lord Andre dowie się o twoim zachowaniu!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Ojciec Parlan będzie wściekły!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Lee na pewno ci nie daruje!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Kapitan Garond nie będzie zadowolony, kiedy o tym usłyszy! Zapłacisz za to!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//Masz całkiem niezły cios... Czego chcesz ode mnie?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//Jeszcze jakieś pytania?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//To znowu ty!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 sztuk złota.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//...to rzeczywiście prawda...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//...mnie mówili co innego...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//...nie mów, że o tym nie wiesz...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//...nie wiadomo już, komu można ufać...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//...to tylko plotki...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//...myślisz, że ja mam lepiej...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//...nic mnie już nie dziwi...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//...to naprawdę nie mój problem...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//...naprawdę w to wierzysz...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//...ode mnie nikt się niczego nie dowie...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//...to było oczywiste...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//...posłuchał niewłaściwych ludzi...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//...jeżeli on tego nie widzi, to przecież nie mogę mu pomagać wbrew jego woli...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//...nie mówię ci przecież nic nowego...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//...sam by na to nie wpadł...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//...to było wiadomo od dawna...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//...kiepska sprawa...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//...inaczej bym się do tego zabrał...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//...zupełnie się z tobą zgadzam...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//...czy coś się w końcu zmieni...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//...nie doszło do mnie nic na ten temat...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//...nic nie mogę na to poradzić...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//...to mnie wcale nie dziwi...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//...nie, ale on oczywiście wie wszystko lepiej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//...i tak liczy się tylko siła, więc nie mów mi takich rzeczy...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//...on nawet nie wie, jak się trzyma miecz...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//...tak, naprawdę tak powiedział...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//...ktoś będzie musiał za to zapłacić...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...Innos przyświeca tym wszystkim, którzy potrafią zgłębić jego mądrość...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//...na końcu i tak zwycięży sprawiedliwość...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_7_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_7_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_7_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_7_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_7_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//Gdzie chcesz się dostać?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//Idź od strony kowala przez przejście, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//Idź od strony kowala w dół ulicą portową, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście prowadzące do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//Kiedy będziesz stać przed świątynią, skręć w lewo i idź wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Jeżeli idąc od strony świątyni, miniesz knajpę po lewej, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Jeżeli pójdziesz wzdłuż murów miejskich od strony targowiska, to dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejdź po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//Przejdź obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//Idź od strony placu wisielców w dół uliczką, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//Przejdź obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz się do niego po schodach.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//Zejdź po schodach na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//Zejdź po schodach na prawo od głównego wejścia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nabrzeżu w górę ulicą portową, a dojdziesz do dolnego miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_7_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_7_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_7_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Po co to przebranie? Nie będę rozmawiać z kimś, kto nosi coś takiego.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//W czym ty chodzisz? Załóż pancerz!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//To pogwałcenie zasad dotyczących ubioru. Natychmiast się przebierz!
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Lepiej załóż togę. Do tego czasu będę się modlić za ciebie w milczeniu.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//Czego chcesz? Nie jesteś jednym z nas. Nie nosisz nawet pancerza.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Giń, nikczemny bandyto!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Giń, żałosny piracie!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_8_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_8_Weather"					;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//No, teraz to cię dorwę!
	DieEnemy					=	"SVM_8_DieEnemy"					;//Wykończę cię!
	DieMonster					=	"SVM_8_DieMonster"					;//Znowu jedno z tych przeklętych stworzeń!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Czekaj tylko, parszywy złodzieju!
	HandsOff					=	"SVM_8_HandsOff"					;//Łapy precz!
	SheepKiller					=	"SVM_8_SheepKiller"				;//Ten drań szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//Ta przeklęta bestia zżera nasze owce!
	YouMurderer					=	"SVM_8_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//Żadne bestie nie mają tu czego szukać!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Teraz jestem naprawdę wkurzony!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//Nie chcesz iść? Dobrze!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//Czego tam szukałeś?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Możesz przestać!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Giń, bydlaku!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//Zasłużyłeś sobie na to, bydlaku!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_8_ThiefDown"					;//Nigdy więcej nie próbuj mnie okraść!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//Trzymaj się na przyszłość z dala od nieswoich rzeczy!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Nigdy więcej tego nie rób! To są nasze owce!
	KillMurderer				=	"SVM_8_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//Co za głupie bestie!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//Nigdy więcej nie próbuj się ze mną mierzyć!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//Szkoda, że mnie nie posłuchałeś!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//A teraz znikaj stąd!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//Lepiej, żebym cię już tam nigdy nie przyłapał!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Tutaj się nie walczy, zrozumiano!? Niech to będzie dla ciebie nauczką!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_8_RunAway"					;//O cholera!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//ALARM!
	Guards						=	"SVM_8_Guards"					;//STRAŻ!
	Help						=	"SVM_8_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_8_GoodKill"				;//No, wykończ świnię!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//Tak, uciekaj! Najszybciej jak potrafisz!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Wynoś się!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//Czego tu szukasz!? Idź sobie!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//No, wynoś się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//Ej ty... Co ty tutaj robisz?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//Co się tu u diabła dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//Dzięki za złoto, mój ty bohaterze!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//Biedaku, nawet złota nie masz...
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//Zaopiekuję się twoją bronią...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//Uważaj! Następnym razem ci przyłożę.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//Ciągle ci za mało!?
	StopMagic					=	"SVM_8_StopMagic"				;//Przestań z tą cholerną magią!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Szukasz kłopotów!? Przestań natychmiast!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Odłóż tę broń!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Odłóż wreszcie tę przeklętą broń!
	WiseMove					=	"SVM_8_WiseMove"				;//Sprytnie!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//Proszę... Zobaczymy następnym razem...
	OhMyHead					=	"SVM_8_OhMyHead"				;//O rany, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//Ach, walka...
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//Na bogów, walka!
	GoodVictory					=	"SVM_8_GoodVictory"			;//Dałeś mu niezły wycisk...
	NotBad						= 	"SVM_8_NotBad"					;//Nieźle...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//Bogowie! Jak brutalnie...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Uderz go!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Daj z siebie wszystko!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Pokaż mu!
	Ooh01						=	"SVM_8_Ooh01"					;//Trzymaj się!
	Ooh02						=	"SVM_8_Ooh02"					;//Uwaga!
	Ooh03						=	"SVM_8_Ooh03"					;//Ał! Ten był celny...
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//Co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Wynocha z mojego łóżka!
	Awake						= "SVM_8_Awake"					;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//Byłeś więc u kapitana i wyjaśniłeś sprawę.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//Byłeś zatem u Ojca Parlana i opowiedziałeś mu o swoich grzechach.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//Byłeś zatem u Lee i doprowadziłeś wszystko do porządku.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Tak po prostu szlachtować nasze owce!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Zostaw mnie w spokoju, draniu!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Zostaw mnie w spokoju, ty parszywy złodzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//Jesteś zakałą swojego zakonu! Poczekaj tylko, aż dowie się o tym Lord Hagen!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//Okrywasz hańbą całą straż miejską! Czekaj tylko, aż dowie się o tym Lord Andre!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Poczekaj, aż dowie się o tym Lord Andre.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Poczekaj tylko, aż usłyszy o tym Ojciec Parlan!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Poczekaj, aż Lee się o tym dowie...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Poczekaj tylko, aż dowie się o tym kapitan Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Dobrze już, dobrze, jesteś lepszy ode mnie! Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//Sądzę, że wiesz już, który z nas jest tym silniejszym... czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//Myślałem, że chcesz się ze mną spróbować. Zmieniłeś zdanie? Może wolisz ROZMAWIAĆ? Jasne.
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 sztuk złota.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//...to rzeczywiście prawda...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//...mnie mówili co innego...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//...tylko nie mów, że o tym nie wiesz...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//...nie wiadomo już, komu można ufać...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//...a tam, to tylko gadanie...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//...no popatrz, już mi lepiej...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//...mnie to i tak nikt nie słucha...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//...to naprawdę nie mój problem...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//...naprawdę w to wierzysz...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//...ode mnie nikt się tego nie dowie...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//...o tym było wiadomo od dawna...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//...posłuchał niewłaściwych ludzi...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//...jeżeli on tego nie widzi, to przecież nie mogę mu pomagać wbrew jego woli...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//...nie mówię ci przecież nic nowego...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//...sam by na to nie wpadł...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//...to przecież wiadomo od dawna...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//...to niedobrze...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//...można to było zrobić zupełnie inaczej...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//...w zupełności się z tobą zgadzam...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//...czy coś się w końcu zmieni...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//...nic o tym nie wiem...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//...i tak tego nie zmienisz...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//...wcale mnie to nie dziwi...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//...powinien wiedzieć lepiej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//...liczy się przecież tylko siła, więc nie opowiadaj mi tu takich rzeczy...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//...przecież on nawet nie wie, jak się trzyma miecz...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//...tak, naprawdę tak powiedział...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//...ktoś będzie musiał za to zapłacić...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...Innos przyświeca tym wszystkim, którzy potrafią zgłębić jego mądrość...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//...w końcu zwycięży sprawiedliwość...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz trochę więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//Widzisz, nauczyłeś się czegoś nowego...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_8_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_8_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_8_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_8_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_8_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//A ty dokąd?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Kiedy będziesz szedł od kuźni, przejdź dołem przez przejście. Dojdziesz wtedy do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//Idź od kuźni w dół ulicą portową, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//Od strony placu świątynnego biegnie przejście, które prowadzi do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//Kiedy będziesz przed świątynią, skręć w lewo i idź wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Jeżeli stojąc plecami do świątyni, pójdziesz w lewo obok knajpy, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//Idź od strony targowiska, wzdłuż murów miejskich, a dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//Koszary to ten duży budynek. Wejdź po prostu po schodach naprzeciwko hotelu.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//Idź po prostu wzdłuż koszar, a powinieneś dojść do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//Idź uliczką odchodzącą od placu wisielców, to dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//Idź po prostu wzdłuż koszar, a powinieneś dojść do targowiska.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//Koszary to ten duży budynek. Wejdź po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//Zejdź po prostu po schodach znajdujących się na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//Zejdź po prostu po schodach znajdujących się na prawo od głównego wejścia. Dojdziesz nimi do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//Idź od strony murów portowych ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Aaaaarrrhhhh!
	Aargh_1						= "SVM_8_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_8_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_8_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//Nie ufam ci. Nie pasujesz mi ani ty, ani twój ubiór.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//Wygląda na to, że wstąpiłeś gdzieś indziej. W takim razie nie chcę mieć z tobą nic wspólnego.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Musimy się odpowiednio prezentować. Idź. Załóż pancerz.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos pragnie, byśmy nosili jego togi z dumą. Idź i załóż swoją.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//Nie rozmawiam z kopaczami. Nie masz nawet pancerza!

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//Ty podły bandyto!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//PIRACI!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_9_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_9_Weather"						;//Ale nędzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Teraz cię mam!
	DieEnemy					=	"SVM_9_DieEnemy"					;//Lepiej było tu nie przychodzić!
	DieMonster					=	"SVM_9_DieMonster"					;//Chodź tu, bydlaku!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//Jeszcze jedna z tych bestii!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//Tam! To jeszcze jedno z tych nikczemnych stworzeń!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Parszywy złodziej!
	HandsOff					=	"SVM_9_HandsOff"					;//Łapy precz!
	SheepKiller					=	"SVM_9_SheepKiller"				;//Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Zostaw nasze owce, ty potworze!
	YouMurderer					=	"SVM_9_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//Pożałujesz tego!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Ostrzegano cię...
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//Powiedziałem WYNOCHA!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Hej! Czego tam szukałeś?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//Przestań! Natychmiast!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//Teraz się zabawimy, gnido!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//I po sprawie...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Scheiße!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//Już po tobie, bydlaku!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//I JESZCZE JEDEN parszywy stwór załatwiony!
	ThiefDown					=	"SVM_9_ThiefDown"					;//Ostrzegam cię! Nie próbuj tego ponownie, ty przeklęty złodzieju!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//Trzymaj ręce z dala od rzeczy, które do ciebie nie należą!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//I trzymaj się na przyszłość z dala od naszych owiec!
	KillMurderer				=	"SVM_9_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//Głupie bydlę!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//Nie waż się nigdy więcej mnie atakować!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//Ostrzegano cię...
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//A teraz wynoś się!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//Nie chcę cię już tam nigdy więcej widzieć!
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//Tutaj się nie walczy, zapamiętaj to sobie!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Nie zrób czegoś głupiego!
	RunAway						= 	"SVM_9_RunAway"						;//Zmywam się!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//ALARM!
	Guards						=	"SVM_9_Guards"					;//STRAŻ!
	Help						=	"SVM_9_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//Pokaż tym potworom...!
	GoodKill					= 	"SVM_9_GoodKill"				;//Taa... Pokaż mu!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//Jeszcze cię dorwę!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Won!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//Nie masz tu czego szukać!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//No, wynoś się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//Co to ma być? Co ty tutaj robisz?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//Czego u diabła chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Dobrze, że przynajmniej masz jakieś złoto!
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Ha! Nawet złota nie ma...
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Twoja broń może mi się przydać.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//Lepiej nie próbuj tego po raz drugi!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//Znowu szukasz guza?
	StopMagic					=	"SVM_9_StopMagic"				;//Tylko bez magii!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Ostrzegam po raz ostatni!
	WeaponDown					=	"SVM_9_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Odłóż to albo ci przyłożę.
	WiseMove					=	"SVM_9_WiseMove"				;//Nie jesteś wcale taki głupi, na jakiego wyglądasz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//Lepiej nie próbuj tego po raz drugi!
	OhMyHead					=	"SVM_9_OhMyHead"				;//Aaach! Mój łeb...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//Teraz będzie zabawnie...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//O rany...
	GoodVictory					=	"SVM_9_GoodVictory"			;//Będzie miał nauczkę...
	NotBad						= 	"SVM_9_NotBad"					;//To było dobre!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//Brutal!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Wal!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//No, dalej!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Wykończ go!
	Ooh01						=	"SVM_9_Ooh01"					;//Uważaj!
	Ooh02						=	"SVM_9_Ooh02"					;//Paruj!
	Ooh03						=	"SVM_9_Ooh03"					;//Cholera, to bolało!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//Co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Wynocha z mojego łóżka!
	Awake						= "SVM_9_Awake"					;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//Wyjaśniłeś zatem sprawę z dowódcą.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Ojciec Parlan uwolnił cię od twoich grzechów.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//Odwiedziłeś zatem Lee i załatwiłeś sprawę.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Dobrze.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//Podnosisz broń na owce? Pewnie trudno ci było o bardziej bezbronne stworzenie!?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//Z takimi jak ty nie chcę mieć nic wspólnego!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//Nie chcę mieć nic wspólnego ze złodziejami!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//I ty chcesz być paladynem? Ciekawe, co na to Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//Naprawdę należysz do straży miejskiej? Lordowi Andre się to nie spodoba!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//Idź do Lorda Andre, póki jeszcze możesz.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Udaj się do Ojca Parlana. Otrzymasz od niego pokutę!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee się o tym dowie... Zapłacisz za to!
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Kapitan Garond będzie bardzo niezadowolony. Lepiej z nim porozmawiaj, zanim stanie się coś jeszcze gorszego.
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//Dobrze - wygrałeś zatem. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//Sądzę, że wiesz już, kogo masz przed sobą. Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//To znowu ty? Chcesz jeszcze raz się ze mną spróbować, czy jak?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 sztuk złota.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//...trudno mi w to uwierzyć...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//...nie wiem, czy można być tego pewnym...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//...przecież on wiedział już o tym wcześniej...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//...już nie wiem, w co mam wierzyć...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//...nie rozumiem w ogóle, czym on się tak przejmuje...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//...nie potrzebuję jeszcze więcej kłopotów...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//...doszło do mnie to i owo...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//...lepiej zostawię to w spokoju...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//...nie można wierzyć we wszystko, co się słyszy...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//...ode mnie tego nie dostał...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//...tak mi się właśnie wydawało...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//...mnie i tak nikt nie słucha...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//...nie zasłużył na coś takiego...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//...nie mów, że o tym nie wiesz...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//...to było przecież jasne...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//...skąd ty to masz...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//...tak dalej być nie może...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//...mam własne zdanie na ten temat...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//...było dokładnie tak, jak mówisz...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//...nie sądzę, żeby w tej sprawie coś się zmieniło...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//...słyszę o tym po raz pierwszy...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//...możemy jedynie przeczekać...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//...wiedziałem, że pojawią się problemy...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//...czemu nikt mnie nie słucha...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//...uciekał, jakby gonił go sam Beliar...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//...w końcu i tak go oczywiście dorwaliśmy...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//...trzeba zdecydowanie i silnie uderzyć w sam środek...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//...niektórzy nie zdają sobie w ogóle sprawy ze swoich grzechów...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//...taka jest bowiem wola Innosa
	Smalltalk30					= "SVM_9_Smalltalk30"				;//...jego czyny były sprawiedliwe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Wróć do mnie, kiedy nabierzesz więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_9_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_9_MARKT"						;//Znajdujesz się teraz na targowisku.
	GALGEN						= "SVM_9_GALGEN"					;//Znajdujesz się teraz przed koszarami na placu wisielców.
	KASERNE						= "SVM_9_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_9_HAFEN"						;//Znajdujesz się w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//Dokąd to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//Idź od kowala przez przejście, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//Idź od kowala w dół ulicą portową, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście, które prowadzi do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//Kiedy będziesz przed świątynią, skręć w lewo i idź potem wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Jeżeli staniesz plecami do świątyni i potem pójdziesz w lewo obok knajpy, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//Idź od strony targowiska, wzdłuż murów miejskich, a dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//Koszary znajdują się w tym dużym budynku. Wejdź po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//Przejdź po prostu obok koszar, a powinieneś dojść do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//Idź od strony placu wisielców w dół uliczką, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//Przejdź po prostu wzdłuż koszar, a powinieneś dojść do targowiska.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//Koszary to ten duży budynek. Wejdź po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//Zejdź po schodach na lewo od głównego wejścia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//Zejdź po schodach na prawo od głównego wejścia, to dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nabrzeżu ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Aaaaaaaahrrrrrr!
	Aargh_1						= "SVM_9_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_9_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_9_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//Co to za maskarada? Ubierz się jak człowiek.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//W czym ty chodzisz? Załóż pancerz!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Pracujesz dla króla, dlatego też nosisz jego pancerz! Przebierz się!
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz się!
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj się stąd!

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//A teraz dostaniesz, bandyto!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//Trzeba było się tu nie pokazywać, piracie!
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_10_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_10_Weather"						;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//To znowu TY!
	DieEnemy					=	"SVM_10_DieEnemy"					;//Załatwię cię!
	DieMonster					=	"SVM_10_DieMonster"					;//Znowu jedna z tych głupich bestii!
	DirtyThief					=	"SVM_10_DirtyThief"					;//Ty mały, parszywy złodzieju!
	HandsOff					=	"SVM_10_HandsOff"					;//Zabieraj łapy!
	SheepKiller					=	"SVM_10_SheepKiller"					;//Hej! Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//Ta bestia zżera nasze owce!
	YouMurderer					=	"SVM_10_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//A ten stwór czego tu chce?!
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//No, teraz to mnie wkurzyłeś!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//Z niektórymi po prostu nie można się dogadać w normalny sposób...
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//Czego tam szukałeś, co?!
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Giń!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//Cholerny bydlak...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//No, koniec z tobą, bestio!
	ThiefDown					=	"SVM_10_ThiefDown"					;//Trzymaj na przyszłość łapy z dala od moich rzeczy, jasne?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//Na przyszłość trzymaj łapy przy sobie!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//Nigdy więcej nie podnoś ręki na nasze owce!
	KillMurderer				=	"SVM_10_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//Głupie stworzenie!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Nie próbuj tego jeszcze raz, chłopczyku!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Niech to będzie dla ciebie nauczka.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Wstawaj i wynoś się stąd!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//Nie chcę cię więcej tam widzieć, zrozumiano?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//Jeżeli ktoś tu rozdziela ciosy, to jestem to ja, zrozumiano?!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_10_RunAway"						;//Cholera! Trzeba uciekać!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//ALARM!
	Guards						=	"SVM_10_Guards"					;//STRAŻ!
	Help						=	"SVM_10_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//No! Tak należy obchodzić się z bestiami!
	GoodKill					= 	"SVM_10_GoodKill"				;//Zasługuje na to!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//Jeszcze się spotkamy!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Wynoś się!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//Czego tu szukasz?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Zabieraj się stąd!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//Co się dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//Dzięki za złoto, mój ty bohaterze!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Ty frajerze, nawet złota nie masz!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Wezmę twoją broń na przechowanie.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//Lepiej uważaj! Następnym razem ci przyłożę.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//Znowu chcesz w mordę?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//Skończ wreszcie z tym czarowaniem!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Chcesz dostać? Natychmiast przestań!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Odłóż wreszcie tę cholerną broń!
	WiseMove					=	"SVM_10_WiseMove"				;//Spryciarz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//Zobaczymy następnym razem...
	OhMyHead					=	"SVM_10_OhMyHead"				;//O rany, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//O rany, walka!
	GoodVictory					=	"SVM_10_GoodVictory"				;//Ale mu pokazałeś!
	NotBad						= 	"SVM_10_NotBad"					;//Nieźle...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//Bogowie! Co za brutal...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Wal z całej siły!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Pokaż mu!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Wykończ go!
	Ooh01						=	"SVM_10_Ooh01"					;//Broń się!
	Ooh02						=	"SVM_10_Ooh02"					;//Oddaj cios!
	Ooh03						=	"SVM_10_Ooh03"					;//Uuu, to musiało boleć!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//Cholera, co to było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Wynocha z mojego łóżka!
	Awake						= "SVM_10_Awake"						;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//Załatwiłeś zatem sprawę z kapitanem.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//Opowiedziałeś zatem Ojcu Parlanowi o swych czynach.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//Mówią, że Lee udało się załatwić całą sprawę.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Szlachtowanie owiec to już po prostu szczyt wszystkiego! Wynoś się!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Jesteś jakimś oprychem - lepiej stąd znikaj!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Przeklęty złodziej! Gardzę takimi jak ty!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//Wydawało mi się, że od paladyna można oczekiwać czegoś więcej. Lord Hagen będzie niepocieszony.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//Że takich jak ty w ogóle przyjmują do straży miejskiej! Odpowiesz za to przed Lordem Andre!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Lord Andre dowie się o twoim zachowaniu!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Ojciec Parlan będzie wściekły!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Odpowiesz za to przed Lee!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Kapitan Garond nie będzie zadowolony, kiedy o tym usłyszy! Zapłacisz za to!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//Masz całkiem niezłe uderzenie... Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//Jeszcze jakieś pytania?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//To znowu ty!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 sztuk złota.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//...tak jakby mnie to cokolwiek obchodziło...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//...nikt nie chce o tym słyszeć...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//...w końcu to była jego decyzja...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//...nie wiem, ty mi powiedz...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//...trzymam się od tego z daleka...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//...nie mam czasu na takie rzeczy...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//...dużo by mnie to kosztowało...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//...nie musisz mi tego mówić...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//...widzi i słyszy się to, i owo...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//...mogę ci opowiedzieć takich rzeczach...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//...nie można na tym polegać...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//...sam tak mówiłem...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//...tego jest więcej, wierz mi...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//...ciągle to samo...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//...nie mów, że to nieprawda...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//...wcześniej czy później musiało się tak zdarzyć...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//...powinien być mądrzejszy...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//...to się nigdy nie zmieni...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//...to żadna tajemnica...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//...żadna wielka sprawa...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//...on myśli, że to takie łatwe...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//...nikt nie chce tego słuchać...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//...i to jest prawda...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//...trzeba po prostu słuchać...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//...gdyby to zależało od nas, sprawy potoczyłyby się inaczej...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//...musi po prostu więcej ćwiczyć...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//...co on wie o służbie...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//...Innos karze sprawiedliwie...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//...ścieżka cnoty jest długa i kamienista...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//...tylko Innos wie, co jest dobre, a co złe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz trochę więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_10_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_10_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_10_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_10_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_10_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//Dokąd to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//Idź od kowala przejściem, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//Idź od kowala w dół ulicą portową, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście prowadzące do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//Kiedy znajdziesz się przed świątynią, pójdź w lewo i potem wzdłuż murów, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Jeżeli idąc od strony świątyni, skręcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Jeżeli idąc od strony targowiska, będziesz szedł wzdłuż murów miejskich, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejdź po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//Idź wzdłuż koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//Idź od strony placu wisielców w dół uliczką, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//Idź po prostu wzdłuż koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejść po schodach.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//Zejdź po schodach na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//Zejdź po schodach na prawo od głównego wejścia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nadbrzeżu w górę ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Aaaarhhh!
	Aargh_1						= "SVM_10_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_10_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_10_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Jeżeli jesteś jednym z nas, powinieneś nosić nasz strój.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Skoro dostałeś królewski pancerz, noś go!
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Odrzucając togę, odrzucasz Innosa. Zastanów się nad tym.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Nie stać cię nawet na pancerz - dlaczego miałbym z tobą rozmawiać?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//Ty parszywy bandyto!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//Ty parszywy piracie!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//Czekaj!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_11_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_11_Weather"						;//Nędzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//Więc w końcu i tak cię dorwałem!
	DieEnemy					=	"SVM_11_DieEnemy"					;//Teraz kolej na ciebie!
	DieMonster					=	"SVM_11_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_11_DirtyThief"					;//Parszywy złodziej! Czekaj tylko...
	HandsOff					=	"SVM_11_HandsOff"					;//Zabieraj łapy!
	SheepKiller					=	"SVM_11_SheepKiller"					;//To cholerne bydlę zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//Ten przeklęty potwór zżera nasze owce!
	YouMurderer					=	"SVM_11_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//Bestie nie mają tu prawa wstępu!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Czekaj tylko, ty draniu!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//Sam się o to prosiłeś!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Więc będę cię musiał stąd WYKOPAĆ!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//Co ty tam robiłeś, co?!
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Giń, bydlaku!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//Koniec z tobą, paskudo!
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_11_ThiefDown"					;//Nigdy więcej nie próbuj mnie okraść!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//Na przyszłość trzymaj się z dala od cudzej własności!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Nie rób tego nigdy więcej! To są nasze owce!
	KillMurderer				=	"SVM_11_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//Głupia bestia!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//Nigdy więcej ze mną nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//Trzeba było mnie posłuchać!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//A teraz wynoś się!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//I żebym cię już nigdy więcej tam nie przyłapał!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Tu się nie walczy, zrozumiano? Niech to będzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_11_RunAway"						;//Cholera! Znikam stąd!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//ALARM!
	Guards						=	"SVM_11_Guards"						;//STRAŻ!
	Help						=	"SVM_11_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_11_GoodKill"					;//No, daj świni na co zasługuje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//Stój, padalcu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Wynoś się stąd!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//Czego tu chcesz?! Odejdź!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//No, zmywaj się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//Ej ty! Czego tam szukasz!
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//Czego u diabła chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//Złoto! Przyda mi się...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//Nie masz złota?!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Wezmę twoją broń na przechowanie.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Hej! Uważaj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//Ciągle ci mało?
	StopMagic					=	"SVM_11_StopMagic"					;//Trzymaj się ode mnie z daleka z tą swoją magią!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//Skończ z tymi czarami! Coś nie tak z twoim słuchem?!
	WeaponDown					=	"SVM_11_WeaponDown"					;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Ogłuchłeś czy co?! Powtarzam: odłóż broń!
	WiseMove					=	"SVM_11_WiseMove"					;//Widzisz, to nie było takie trudne.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//Jeszcze zobaczymy...
	OhMyHead					=	"SVM_11_OhMyHead"					;//O rany, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//Ach, wreszcie coś się dzieje!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//Porozwalają sobie łby...
	GoodVictory					=	"SVM_11_GoodVictory"					;//Zasłużył sobie na to!
	NotBad						= 	"SVM_11_NotBad"						;//Całkiem nieźle...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//Ale brutal...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Tak to się powinno robić!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Na co czekasz?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//I o to chodzi!
	Ooh01						=	"SVM_11_Ooh01"						;//Nie daj mu się!
	Ooh02						=	"SVM_11_Ooh02"						;//Pokaż mu, kto tu rządzi!
	Ooh03						=	"SVM_11_Ooh03"						;//O cholera!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//Co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Wynocha z mojego łóżka!
	Awake						= "SVM_11_Awake"							;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//Podobno byłeś u kapitana i wszystko załatwiłeś.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//Ponoć poszedłeś do Ojca Parlana, by odkupić swe grzechy.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//Mówią, że byłeś u Lee i wszystko załatwiłeś.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Tak po prostu szlachtować nasze owce! Spadaj stąd, gnido!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//Nie gadam z takimi jak ty!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//Zejdź mi z oczu, parszywy złodzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//Jesteś zakałą swojego zakonu! Lord Hagen będzie wściekły!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//Hańbisz dobre imię straży miejskiej! Lord Andre da ci nauczkę!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Lord Andre dowie się o twoich czynach!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Ojciec Parlan nie będzie zbyt szczęśliwy, gdy się o tym dowie!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Lee da ci popalić! I na co ci to było?
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Kapitan Garond na pewno zażąda od ciebie wyjaśnień!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//Dobrze już, dobrze, wygrałeś. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//Mam ci znowu pokazać, kto tu jest szefem?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Chyba chcesz mnie znowu sprowokować...
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 sztuk złota.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 sztuk złota.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 sztuk złota.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 sztuk złota.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 sztuk złota.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 sztuk złota.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 sztuk złota.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 sztuk złota.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 sztuk złota.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 sztuk złota.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 sztuk złota.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 sztuk złota.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 sztuk złota.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 sztuk złota.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 sztuk złota.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 sztuk złota.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 sztuk złota.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 sztuk złota.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 sztuk złota.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 sztuk złota.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 sztuk złota.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 sztuk złota.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 sztuk złota.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 sztuk złota.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 sztuk złota.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 sztuk złota.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 sztuk złota.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//...naprawdę tak myślisz...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//...wszystko jest możliwe...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//...powinien być mądrzejszy...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//...jakbyśmy mieli nie dość problemów...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//...kto ci to powiedział...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//...przez to będzie jeszcze więcej kłopotów...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//...ludzie mówią różne rzeczy...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//...ja bym tego nie zrobił...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//...to wszystko tylko plotki...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//...lepiej uważać, co się komu mówi...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//...mogłem ci to powiedzieć wcześniej...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//...nikt mnie nigdy nie pyta o zdanie...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//...żal biedaka...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//...to nic nowego...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//...to przecież oczywiste...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//...nie musisz mnie o to pytać...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//...tak nie może dalej być...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//...i tak wiesz, co o tym sądzę...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//...to dokładnie moje słowa...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//...nic się w związku z tym nie zmieni...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//...czemu nie doszło to do mnie wcześniej...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//...poczekajmy, co się stanie...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//...niektóre problemy rozwiązują się same...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//...nie chcę o tym słuchać...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//...był w sztok pijany...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//...nie pozwolę się tak traktować...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//...wszyscy uciekali jak zające, byłem zupełnie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//...tak mówią pisma...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//...zawsze działam w imieniu Innosa...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//...nie wolno naruszać boskiego porządku...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz trochę więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_11_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_11_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_11_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_11_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_11_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//Dokąd chcesz się udać?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//Idź od kowala przez przejście, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//Idź od kowala w dół ulicą portową, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście, które prowadzi do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//Kiedy znajdziesz się przed świątynią, skręć w lewo i idź wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Idąc od strony świątyni, skręć w lewo koło knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Idąc wzdłuż murów miejskich od strony targowiska, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//Koszary to ten duży budynek. Wystarczy wejść po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//Przejdź obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//Idź w dół uliczką odchodzącą od placu wisielców, to dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//Przejdź obok koszar, to dostaniesz się na targowisko.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//Koszary to ten duży budynek. Dostaniesz się do niego po schodach.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//Zejdź po schodach na lewo od głównego wejścia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//Zejdź po schodach na prawo od głównego wejścia, to dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nabrzeżu, w górę ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_11_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_11_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_11_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Załóż nasz pancerz, a wtedy z tobą porozmawiam. A teraz zjeżdżaj.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//Powinieneś nosić królewski pancerz! Odsuń się!
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz się!
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//Nie masz nawet pancerza. Zabieraj się stąd!

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Znowu jakiś bandyta.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//PIRACI!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_12_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_12_Weather"					;//Kiepska pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Teraz cię mam!
	DieEnemy					=	"SVM_12_DieEnemy"					;//Trzeba było tu nie przychodzić!
	DieMonster					=	"SVM_12_DieMonster"					;//No chodź, parszywa bestio!
	DirtyThief					=	"SVM_12_DirtyThief"					;//Czekaj tylko, ty śmierdzący złodzieju!
	HandsOff					=	"SVM_12_HandsOff"					;//Zabieraj stąd łapy!
	SheepKiller					=	"SVM_12_SheepKiller"				;//Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//Odejdź od naszych owiec, ty przeklęta bestio!
	YouMurderer					=	"SVM_12_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//Pożałujesz tego!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//Ostrzegałem cię!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//Powiedziałem WON!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Hej! Co ty tam robiłeś?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//Przestać! Natychmiast!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//Rozerwę cię na strzępy!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//Koniec z tobą...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//To mnie kręci!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//Kolejne bydlę załatwione!
	ThiefDown					=	"SVM_12_ThiefDown"					;//Ostrzegam cię! Nie próbuj tego ponownie, ty przeklęty złodzieju!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//Trzymaj w przyszłości łapy z dala od rzeczy, które do ciebie nie należą!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//I trzymaj się z dala od naszych owiec!
	KillMurderer				=	"SVM_12_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//Przeklęty potwór!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//Nigdy nie waż się mnie atakować!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//Ostrzegałem cię!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//A teraz wynoś się!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//Nie chcę cię tu więcej widzieć, jasne?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//Tu się nie walczy, zapamiętaj to sobie dobrze!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Nie zrób czegoś głupiego!
	RunAway						= 	"SVM_12_RunAway"						;//Wynoszę się stąd!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//ALARM!
	Guards						=	"SVM_12_Guards"					;//STRAŻ!
	Help						=	"SVM_12_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//Odeślemy te bestie do otchłani!
	GoodKill					= 	"SVM_12_GoodKill"				;//Dobrze! Pokaż draniowi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//Dorwę cię jeszcze!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Wynoś się stąd!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//Nie masz tu nic do roboty!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//No, wynocha!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//Co ty kombinujesz? Czego tam szukasz?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//Czego u diabła chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Dobrze, że masz przy sobie przynajmniej trochę złota...
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Nawet złota nie ma?!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Chyba wezmę sobie twoją broń.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//Nie próbuj tego ponownie, chłopcze!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//Ciągle ci mało?
	StopMagic					=	"SVM_12_StopMagic"				;//Przestań z tymi czarami!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Ostatnie ostrzeżenie - skończ z tą magią!
	WeaponDown					=	"SVM_12_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Odłóż to, albo pogadamy inaczej!
	WiseMove					=	"SVM_12_WiseMove"				;//Hej, nie jesteś wcale taki głupi, na jakiego wyglądasz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//Nie próbuj tego ponownie...
	OhMyHead					=	"SVM_12_OhMyHead"				;//Och, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//Teraz będzie zabawa...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//O bogowie...
	GoodVictory					=	"SVM_12_GoodVictory"			;//Niech to będzie dla niego nauczka...
	NotBad						= 	"SVM_12_NotBad"					;//To było dobre!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//Cholerny brutal!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//Rąbnij go!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Nie przestawaj!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Wykończ go!
	Ooh01						=	"SVM_12_Ooh01"					;//Uważaj!
	Ooh02						=	"SVM_12_Ooh02"					;//Paruj! Paruj!
	Ooh03						=	"SVM_12_Ooh03"					;//Cholera, to bolało!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//Co to było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Wynocha z mojego łóżka!
	Awake						= "SVM_12_Awake"					;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//Zatem kapitan wyjaśnił sprawę.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//Ojciec Parlan uwolnił cię więc od twoich grzechów.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//Widziałeś się zatem z Lee i zająłeś się sprawą.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Dobrze.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//Mordujesz owce? Przypuszczam, że bardziej bezbronnej ofiary nie mogłeś sobie znaleźć?!
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//Z takimi jak ty nie chcę mieć nic wspólnego!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//Nie zadaję się ze złodziejami!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//I ty chcesz być paladynem? Ciekawe, co na to Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//Naprawdę należysz do straży miejskiej? Lordowi Andre się to nie spodoba!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//Idź do Lorda Andre, póki jeszcze możesz.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//Idź do Ojca Parlana. Pomoże ci zmazać twoje grzechy!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee o tym usłyszy, a wtedy będziesz musiał zapłacić...
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Kapitan Garond nie będzie zadowolony. Lepiej z nim porozmawiaj, zanim będzie jeszcze gorzej!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//Dobrze - wygrałeś. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//Chyba już wiesz, z kim masz do czynienia. Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//To znowu ty? Chcesz jeszcze się raz ze mną spróbować, czy jak?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 sztuk złota.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//...tak jakby mnie to cokolwiek obchodziło...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//...nikt nie chce wiedzieć...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//...w końcu to była jego decyzja...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//...nie wiem, ty mi powiedz...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//...trzymam się od tego z daleka...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//...nie mam czasu na takie rzeczy...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//...dużo by mnie to kosztowało...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//...nie musisz mi tego mówić...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//...widzi i słyszy się to, i owo...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//...mogę ci opowiedzieć o takich rzeczach...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//...nie można na to liczyć...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//...sam tak mówiłem...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//...tego jest więcej, wierz mi...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//...ciągle to samo...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//...nie mów, że to nieprawda...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//...wcześniej czy później musiało się tak zdarzyć...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//...powinien być mądrzejszy...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//...to się nigdy nie zmieni...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//...to żadna tajemnica...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//...żadna wielka sprawa...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//...on myśli, że to takie łatwe...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//...nikt nie chce tego słuchać...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//...i to jest prawda...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//...trzeba po prostu słuchać...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//...gdyby to zależało od nas, sprawy potoczyłyby się inaczej...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//...musi po prostu więcej ćwiczyć...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//...co on wie o służbie...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//...Innos karze sprawiedliwie...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//...ścieżka cnoty jest długa i kamienista...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//...tylko Innos wie, co jest dobre, a co złe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz trochę więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_12_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_12_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_12_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_12_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_12_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//Dokąd to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//Idź od kowala przejściem, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//Idź od kowala w dół ulicą portową, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście prowadzące do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//Kiedy znajdziesz się przed świątynią, pójdź w lewo i potem wzdłuż murów, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Jeżeli idąc od strony świątyni, skręcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Jeżeli idąc od strony targowiska, będziesz szedł wzdłuż murów miejskich, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Wejdź po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//Idź po prostu wzdłuż koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//Idź od strony placu wisielców w dół uliczką, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//Idź po prostu wzdłuż koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejść po schodach.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//Zejdź po schodach na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//Zejdź po schodach na prawo od głównego wejścia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//Idź od strony muru przy nadbrzeżu w górę ulicą portową, a dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_12_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_12_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_12_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz się!
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Jeśli chcesz ze mną rozmawiać, to załóż pancerz.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//Żołnierz nosi pancerz swojego króla. NIC innego! Przebierz się!
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz się!
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Nie stać cię nawet na pancerz. Nie będę rozmawiał z takim słabeuszem.

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//Dostanę cię, bandyto!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//Dostanę cię, piracie!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_13_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_13_Weather"					;//Jakaś nędzna ta pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//Teraz cię dorwę!
	DieEnemy					=	"SVM_13_DieEnemy"					;//Rozerwę cię na kawałki!
	DieMonster					=	"SVM_13_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_13_DirtyThief"					;//Parszywy złodziej! Czekaj tylko...
	HandsOff					=	"SVM_13_HandsOff"					;//Zabieraj łapy!
	SheepKiller					=	"SVM_13_SheepKiller"				;//To cholerne bydlę zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//Ten przeklęty potwór zżera nasze owce!
	YouMurderer					=	"SVM_13_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//Dobra bestia to martwa bestia!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Czekaj tylko, ty draniu!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//Nie chcesz iść? Dobrze!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//Czego tam szukałeś?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Giń, bydlaku!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//Zasłużyłeś na to, gnido!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_13_ThiefDown"					;//Nigdy więcej nie próbuj mnie okraść!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//Od tej chwili trzymaj łapy z dala od rzeczy, które do ciebie nie należą!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Nie rób tego nigdy więcej! To są nasze owce!
	KillMurderer				=	"SVM_13_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//Głupi potwór!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//Nigdy więcej ze mną nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//Trzeba było mnie posłuchać!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//A teraz zabieraj się stąd!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//I żebym cię już nigdy więcej tam nie przyłapał!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Tu się nie walczy, zrozumiano? Niech to będzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_13_RunAway"					;//O cholera!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//ALARM!
	Guards						=	"SVM_13_Guards"					;//STRAŻ!
	Help						=	"SVM_13_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_13_GoodKill"				;//No, daj świni na co zasługuje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//Uciekaj, najszybciej jak tylko potrafisz!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Wynoś się stąd!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//Czego tu chcesz?! Odejdź!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//No, wynoś się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//Ej ty! Czego tam szukasz!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//Czego u diabła chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//Dzięki za złoto, mój ty bohaterze!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//Ty biedny frajerze, nawet złota nie masz!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//Wezmę twoją broń na przechowanie.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//Uważaj! Następnym razem ci przyłożę.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//Ciągle ci mało?!
	StopMagic					=	"SVM_13_StopMagic"				;//Skończ z tą magią!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Chcesz dostać! Przestań w tej chwili!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Odłożysz wreszcie tę przeklętą broń?!
	WiseMove					=	"SVM_13_WiseMove"				;//Dobra decyzja!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//Zobaczymy następnym razem...
	OhMyHead					=	"SVM_13_OhMyHead"				;//O rany, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//Ach, walka...
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_13_GoodVictory"			;//Pokazałeś mu, kto tu rządzi!
	NotBad						= 	"SVM_13_NotBad"					;//Nieźle...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//Bogowie! Jak ostro...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//No, wal!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Daj z siebie wszystko!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Pokaż mu!
	Ooh01						=	"SVM_13_Ooh01"					;//Trzymaj się!
	Ooh02						=	"SVM_13_Ooh02"					;//Uważaj!
	Ooh03						=	"SVM_13_Ooh03"					;//Oj! To było mocne!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//Co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Wynocha z mojego łóżka!
	Awake						= "SVM_13_Awake"					;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//Poszedłeś więc do kapitana i wszystko załatwiłeś.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//Byłeś więc u Ojca Parlana i opowiedziałeś mu o swych przewinieniach.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//Zobaczyłeś się zatem z Lee i wyjaśniłeś sprawę.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Tak po prostu szlachtować nasze owce!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Zostaw mnie w spokoju, ty parszywa gnido!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Zostaw mnie, ty mały, nędzny złodzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//Jesteś hańbą dla swego zakonu! Czekaj tylko, aż dowie się o tym Lord Hagen!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//Hańbisz dobre imię straży miejskiej! Lord Andre na pewno się o tym dowie!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Czekaj, aż Lord Andre się o tym dowie!
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Czekaj, aż dowie się o tym Ojciec Parlan!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Lee na pewno o tym usłyszy...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Kapitan Garond na pewno się o tym dowie!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Dobrze już, dobrze, jesteś lepszy ode mnie! Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//Przypuszczam, że teraz już wiesz, który z nas jest tym silniejszym... Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//Wydawało mi się, że chcesz mnie sprowokować. Zmieniłeś zdanie? Wolisz jednak POGADAĆ, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 sztuk złota.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//...tak jakby mnie to cokolwiek obchodziło...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//...nikt nie chce wiedzieć...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//...w końcu to była jego decyzja...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//...nie wiem, ty mi powiedz...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//...trzymam się od tego z daleka...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//...nie mam czasu na takie rzeczy...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//...dużo by mnie to kosztowało...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//...nie musisz mi tego mówić...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//...widzi i słyszy się to i owo...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//...mogę ci opowiedzieć o takich rzeczach...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//...nie można na tym polegać...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//...sam tak mówiłem...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//...tego jest więcej, wierz mi...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//...ciągle to samo...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//...nie mów, że to nieprawda...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//...wcześniej czy później musiało się to zdarzyć...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//...powinien był wiedzieć lepiej...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//...to się nigdy nie zmieni...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//...to żadna tajemnica...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//...żadna wielka sprawa...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//...on myśli, że to takie łatwe...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//...nikt nie chce tego słuchać...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//...i to jest prawda...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//...trzeba po prostu słuchać...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//...gdyby to zależało od nas, sprawy potoczyłyby się inaczej...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//...musi po prostu więcej ćwiczyć...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//...co on wie o służbie...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//...Innos karze sprawiedliwie...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//...ścieżka cnoty jest długa i kamienista...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//...tylko Innos wie, co jest dobre, a co złe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz trochę więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_13_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_13_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_13_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_13_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_13_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//Dokąd chcesz się udać?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//Idź od kowala przez przejście, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//Idź od kowala w dół ulicą portową, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście, które prowadzi do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//Stań przed świątynią, idź na lewo wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Idąc od strony świątyni, skręć w lewo koło knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Idąc od strony targowiska, wzdłuż murów miejskich, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//Koszary to ten duży budynek. Dostaniesz się do niego po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//Przejdź po prostu obok koszar, a powinieneś dojść do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//Idź w dół uliczką odchodzącą od placu wisielców, to dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//Przejdź obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//Koszary to ten duży budynek. Wejdź po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Po prostu zejdź po schodach na lewo od głównego wejścia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Po prostu zejdź po schodach na prawo od głównego wejścia, to dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Idąc od strony muru przy nadbrzeżu, w górę ulicą portową, dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Aaarhhhh!
	Aargh_1						= "SVM_13_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_13_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_13_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju!
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//Nie masz na sobie pancerza, idź go założyć.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//Powinieneś z dumą nosić pancerz swego króla, a nie biegać w tych szmatach. Odejdź!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Dlaczego nie nosisz pancerza naszego zakonu?
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj się stąd!

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//Ty podły bandyto!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//Ty przeklęty piracie!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_14_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_14_Weather"						;//Nędzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//W końcu cię dopadłem!
	DieEnemy					=	"SVM_14_DieEnemy"					;//Nadszedł twój czas!
	DieMonster					=	"SVM_14_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_14_DirtyThief"					;//Czekaj tylko, ty mały złodzieju!
	HandsOff					=	"SVM_14_HandsOff"					;//Łapy precz!
	SheepKiller					=	"SVM_14_SheepKiller"					;//To bydlę zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//Ten przeklęty potwór zżera nasze owce!
	YouMurderer					=	"SVM_14_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Czekaj tylko, ty gnido!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Więc będę cię musiał stąd WYKOPAĆ!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//Co ty tam robiłeś, co?!
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Giń, bydlaku!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//To twój koniec, padalcu!
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_14_ThiefDown"					;//Nigdy więcej nie próbuj mnie okraść!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//Trzymaj się w przyszłości z dala od rzeczy, które nie powinny cię interesować!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Nie rób tego nigdy więcej! To są nasze owce!
	KillMurderer				=	"SVM_14_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//Głupia bestia!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//Nigdy więcej ze mną nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//Trzeba było mnie posłuchać!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//A teraz zabieraj się stąd!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//I żebym cię już nigdy więcej tam nie przyłapał!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Tu się nie walczy, zrozumiano? Niech to będzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Zostaw mnie, proszę!
	RunAway						= 	"SVM_14_RunAway"						;//Cholera! Znikam stąd!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//ALARM!
	Guards						=	"SVM_14_Guards"						;//STRAŻ!
	Help						=	"SVM_14_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_14_GoodKill"					;//No, daj świni na co zasługuje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//Stój, gnido!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Wynoś się stąd!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//Czego tutaj szukasz? Odejdź!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//No, zmywaj się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//Ej ty? Co ty tam robisz, co?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//Cholera, co jest?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//Złoto! Dobrze... Przyda mi się.
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//Nawet nie masz złota?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Wezmę sobie twoją broń.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Hej, uważaj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//Ciągle ci mało?
	StopMagic					=	"SVM_14_StopMagic"					;//Trzymaj się ode mnie z daleka z tą swoją magią!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//Przestań z tymi czarami! Masz coś nie tak z uszami?!
	WeaponDown					=	"SVM_14_WeaponDown"					;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Nie słyszysz mnie? Powtarzam: odłóż broń!
	WiseMove					=	"SVM_14_WiseMove"					;//Widzisz, to nie było takie trudne.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//Jeszcze o tym pogadamy...
	OhMyHead					=	"SVM_14_OhMyHead"					;//O rany, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//Wreszcie coś się dzieje!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//Porozwalają sobie łby...
	GoodVictory					=	"SVM_14_GoodVictory"					;//Pokazałeś mu, kto tu rządzi!
	NotBad						= 	"SVM_14_NotBad"						;//Całkiem nieźle...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//Co za brutal...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Tak trzymaj!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Na co czekasz?!
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//Tak trzeba!
	Ooh01						=	"SVM_14_Ooh01"						;//Nie daj się!
	Ooh02						=	"SVM_14_Ooh02"						;//Pokaż mu, kto tu jest szefem!
	Ooh03						=	"SVM_14_Ooh03"						;//O cholera!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//Co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Wynocha z mojego łóżka!
	Awake						= "SVM_14_Awake"							;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//Ponoć byłeś u kapitana i wszystko wyjaśniłeś.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//Byłeś zatem u Ojca Parlana i wyznałeś mu swoje grzechy.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//Mówią, że poszedłeś do Lee i załatwiłeś sprawę.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Tak po prostu zarzynać nasze owce! Spadaj stąd, gnido!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//Nie gadam z takimi jak ty!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//Zejdź mi z oczu, parszywy złodzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//Jesteś zakałą swego zakonu! Lord Hagen będzie wściekły!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//Hańbisz dobre imię straży miejskiej! Lord Andre da ci nauczkę!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Lord Andre dowie się o twoich czynach!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Ojciec Parlan będzie bardzo niezadowolony!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Już Lee cię nauczy... I po co ci to było?
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Kapitan Garond będzie żądał wyjaśnień!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//Dobrze już, dobrze, jesteś lepszy ode mnie! Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//Mam ci jeszcze raz pokazać, kto tu jest szefem?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Znowu chcesz się ze mną zmierzyć?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 sztuk złota.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 sztuk złota.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 sztuk złota.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 sztuk złota.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 sztuk złota.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 sztuk złota.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 sztuk złota.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 sztuk złota.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 sztuk złota.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 sztuk złota.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 sztuk złota.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 sztuk złota.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 sztuk złota.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 sztuk złota.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 sztuk złota.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 sztuk złota.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 sztuk złota.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 sztuk złota.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 sztuk złota.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 sztuk złota.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 sztuk złota.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 sztuk złota.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 sztuk złota.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 sztuk złota.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 sztuk złota.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 sztuk złota.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 sztuk złota.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//...nie wierzę...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//...nie można być tego pewnym...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//...ale on o tym wiedział...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//...już nie wiem, komu ufać...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//...nie wiem, czym on się tak denerwuje...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//...i tak mam wystarczająco kłopotów...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//...a, słyszałem to i owo...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//...nie chcę mieć z tym nic wspólnego...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//...nie wolno wierzyć we wszystko, co się słyszy...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//...ode mnie tego nie dostał...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//...już o tym myślałem...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//...nikt mnie nie pyta o zdanie...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//...naprawdę na to nie zasłużył...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//...nie mów, że o tym nie wiesz...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//...to było oczywiste...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//...skąd to zatem masz...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//...nie może tak dalej być...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//...mam własne zdanie na ten temat...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//...było tak, jak mówisz...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//...nie sądzę, żeby coś się zmieniło...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//...słyszę o tym po raz pierwszy...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//...możemy tylko siedzieć i czekać...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//...wiedziałem, że będzie z tym problem...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//...więc czemu nie chcą mnie słuchać...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//...uciekał, jakby gonił go sam Beliar...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//...w końcu i tak go oczywiście dorwaliśmy...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//...trzeba się tym zająć i uporządkować sprawy...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//...niektórzy nawet nie wiedzą, jak bardzo grzeszą...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//...taka jest bowiem wola Innosa...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//...jego czyny były sprawiedliwe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz trochę więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś za dobry.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_14_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_14_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_14_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_14_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_14_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//Dokąd chcesz się udać?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//Idź od kuźni przez przejście, a dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//Idź od kuźni w dół ulicą portową, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście, które prowadzi do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//Stojąc przed świątynią, idź na lewo wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Idąc od strony świątyni, skręć w lewo koło knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Idąc od targowiska wzdłuż murów miejskich, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//Koszary to ten duży budynek. Wejdź po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//Przejdź po prostu obok koszar, a powinieneś dojść do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Idąc w dół uliczką odchodzącą od placu wisielców, dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//Przejdź obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//Koszary to ten duży budynek. Wejdź po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Jeśli zejdziesz po schodach na lewo od głównego wejścia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Schodząc po schodach na prawo od głównego wejścia, dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Idąc od strony muru wzdłuż nabrzeża w górę ulicą portową, dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_14_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_14_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_14_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//To ubranie nie pasuje na ciebie. Widać wyraźnie, że masz coś do ukrycia. A teraz zostaw mnie w spokoju.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Jeżeli chcesz ze mną rozmawiać, musisz mieć na sobie pancerz.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Powinieneś być dumny z przynależności do armii, a nie biegać w tych szmatach. Idź się przebrać!
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz się!
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj się stąd!

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Giń, bandyto!
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Giń, piracie!
};

// ****************
// 		SPIELER
// ****************

INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	// ------ Player-Only SVMs ---------------------------------------------------------------------
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hej, ty!
	SC_HeyTurnAround02		= 	"SVM_15_SC_HeyTurnAround02"			;//Hej, ty!
	SC_HeyTurnAround03		= 	"SVM_15_SC_HeyTurnAround03"			;//Hej!
	SC_HeyTurnAround04		= 	"SVM_15_SC_HeyTurnAround04"			;//Hej!
	
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Chwila!

	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nie działa.
	PickBroke				= 	"SVM_15_PickBroke"					;//Hm, złamał się...
	NeedKey					= 	"SVM_15_NeedKey"					;//Potrzebuję do tego klucza...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//Nie mam już wytrychów...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//Nie znam się na otwieraniu zamków.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//Posprzątanie wszystkich komnat zajmie wieki!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Hm... Nie mam ani klucza, ani wytrychu.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//Bez właściwego klucza nigdy tego nie otworzę!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//Przydałoby się parę wytrychów!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//Nigdy tego nie otworzę!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//Czym?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Hm... Nie...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Niczego tu nie znajdę...
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Nic tu nie ma...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Nie ma czego plądrować...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaaarhhh!
	Awake					=	"SVM_15_Awake"						;//(budzi się)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Hm... A więc tam jest twoja kryjówka. Cholernie daleko. Chyba będę potrzebować statku...
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innosie, obdarz mnie swą łaską i oczyść tę kapliczkę.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innosie, obdarz mnie swą łaską i tak dalej... No, to chyba ostatni raz.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//XARAK BENDARDO! Ach... Księga została otwarta. W środku jest klucz i jakiś list.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//KHADOSH EMEM KADAR! Otwórz się!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Pohandlujmy.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Pokaż mi swoje towary.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Pokaż mi, co masz.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Rozumiem.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Ach. Sądzę, że coś znalazłem.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//Nie rozumiem.
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//Nie potrafię tego przeczytać.
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//AKHANTAR!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//JHERHEDRA!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//URIZIEL RATIS!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//Och, chłopie, brr!
	HUI						=	"SVM_15_Addon_HUI"						;//Hahaaa!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//Co wiesz o próbie zabójstwa Estebana?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//A co do próby zabójstwa Estebana...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Zabiję tych zdrajców.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Chcę znaleźć tych ludzi, by wystąpić przeciwko Estebanowi.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//Potrzebują cię w kopalni.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. Przyzywam cię, Quarhodronie, pradawny przywódco kasty wojowników!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Hmm... To tutaj nie działa.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//Co muszę wiedzieć o wydobyciu złota?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Ach, księga rozrachunkowa Francisa. Wygląda na to, że ten człowiek napycha sobie złotem kieszenie.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_16_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_16_Weather"						;//Nędzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//W końcu i tak cię dorwę!
	DieEnemy					=	"SVM_16_DieEnemy"					;//Wybiła twoja godzina!
	DieMonster					=	"SVM_16_DieMonster"					;//Znowu jedna z tych przeklętych bestii!
	DirtyThief					=	"SVM_16_DirtyThief"					;//Parszywy złodziej! Czekaj tylko...
	HandsOff					=	"SVM_16_HandsOff"					;//Łapy precz!
	SheepKiller					=	"SVM_16_SheepKiller"					;//To bydlę zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//Ten cholerny potwór pożera nasze owce!
	YouMurderer					=	"SVM_16_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Czekaj tylko, gnido!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Zatem będę musiała cię stąd WYKOPAĆ!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//Co ty tam robiłeś, co?!
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Giń, bydlaku!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//To twój koniec, padalcu!
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_16_ThiefDown"					;//Nigdy więcej nie próbuj mnie okraść!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//Na przyszłość trzymaj się z dala od rzeczy, które nie powinny cię interesować!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Nigdy więcej tego nie rób! To są nasze owce!
	KillMurderer				=	"SVM_16_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//Głupia bestia!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//Nigdy więcej ze mną nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//Trzeba było mnie posłuchać!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//A teraz zabieraj się stąd!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//I żebym cię już nigdy więcej tam nie przyłapała!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Tu się nie walczy, zrozumiano? Niech to będzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_16_RunAway"						;//Wynoszę się stąd!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//ALARM!
	Guards						=	"SVM_16_Guards"					;//STRAŻ!
	Help						=	"SVM_16_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//Dobra robota!
	GoodKill					= 	"SVM_16_GoodKill"				;//No, daj świni na co zasługuje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//Stój, tchórzu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Wynoś się stąd!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//Czego tutaj szukasz? Odejdź!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//No, zabieraj się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//Hej ty! Czego ty tam szukasz?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//Co jest?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//Dzięki za złoto, mój ty bohaterze!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//Ty biedny frajerze, nawet złota nie masz!
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//Lepiej zaopiekuję się twoją bronią.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//Hej, uważaj! Jeszcze raz i ci przyłożę!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//Ciągle ci mało?!
	StopMagic					=	"SVM_16_StopMagic"				;//Przestań z tymi czarami!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Chcesz dostać? Przestań w tej chwili!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Odłożysz w końcu tę cholerną broń?!
	WiseMove					=	"SVM_16_WiseMove"				;//Mądra decyzja...
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//Zobaczymy następnym razem...
	OhMyHead					=	"SVM_16_OhMyHead"				;//O bogowie, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_16_GoodVictory"			;//Pokazałeś mu, kto tu rządzi!
	NotBad						= 	"SVM_16_NotBad"					;//Nieźle...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//Bogowie! Jak brutalnie...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Rozwal go!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Pokaż mu!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Daj mu popalić!
	Ooh01						=	"SVM_16_Ooh01"					;//Oddaj mu!
	Ooh02						=	"SVM_16_Ooh02"					;//Uważaj!
	Ooh03						=	"SVM_16_Ooh03"					;//Och! To musiało boleć!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//Co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Wynoś się z mojego łóżka!
	Awake						= "SVM_16_Awake"					;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//Poszedłeś więc do kapitana i oczyściłeś się z zarzutów.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//Byłeś zatem u Ojca Parlana i wyznałeś mu swoje grzechy.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee rozwiązał ten problem.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//Dobre.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//Nie możesz tak po prostu zabijać naszych owiec! Odejdź!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Jesteś brutalnym oprychem. Nie chcę mieć z tobą nic wspólnego.
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//Nie rozmawiam ze złodziejami - a teraz odejdź stąd!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Twoje zachowanie nie jest zbyt honorowe. Lordowi Hagenowi to się nie spodoba!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Twe zachowanie hańbi dobre imię straży miejskiej! Lord Andre zażąda wyjaśnień!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Lord Andre dowie się o twoich czynach!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Postąpiłeś niewłaściwie. Idź do Ojca Parlana i żałuj za swoje grzechy!
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Lee się o tym dowie. Zostaniesz ukarany!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Kapitan Garond zażąda wyjaśnień!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 sztuk złota.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//...doprawdy? To interesujące...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//...nie wierzę w to...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//...mój mąż uważa inaczej...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//...daj spokój, nie opowiadaj mi takich rzeczy...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//...naprawdę, sama widziałam...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//...nie mów...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//...nikomu tego nie powtarzaj...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//...przyszło nam żyć w niedobrych czasach...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//...kto to opowiada takie rzeczy...
	Smalltalk10					= "SVM_16_Smalltalk10"				;//...gdybym sama tego nie widziała...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//...ktoś musi pracować...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//...słyszałam co innego...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//...tak, to bardzo typowe...
	Smalltalk14					= "SVM_16_Smalltalk14"				;//...nie potrafi niczego zatrzymać dla siebie...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//...lepiej by było, gdyby się przymknął...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//...i pracuje niemal przez cały dzień...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//...nie mogę zajmować się wszystkim i wszystkimi...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//...on po prostu za dużo gada...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//...tajemnica, o której wszyscy wiedzą...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//...teraz każdy już o tym wie...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//...niczego jej już nie powiem...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//...a będzie jeszcze gorzej...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//...to przecież okropne...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//...zawsze to powtarzałam...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz trochę więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś już zbyt dobry.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Jesteś teraz w niższej części miasta.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_16_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_16_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_16_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_16_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_16_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//Dokąd chcesz się udać?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Idąc od kuźni przez przejście, dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Idąc od kuźni w dół ulicą portową, dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście, które prowadzi do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//Jesteś przed świątynią, idź na lewo wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Idąc od strony świątyni, skręć w lewo koło knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Idąc od strony targowiska, wzdłuż murów miejskich, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//Koszary to ten duży budynek. Wejdź po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//Przejdź po prostu obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//Idź w dół uliczką odchodzącą od placu wisielców, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//Przejdź po prostu obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//Ten duży budynek to koszary. Wejdź po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//Zejdź w dół po schodach na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//Zejdź w dół po schodach na prawo od głównego wejścia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Idąc w górę ulicą portową, od strony muru przy nadbrzeżu, dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Aaaarhhh!
	Aargh_1						= "SVM_16_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_16_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_16_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Ubierz się odpowiednio. Nie chcę, by widziano mnie z kimś takim.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//BANDYTA!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//PIRAT!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//Niech żyje Król!
	PALGreetings				=	"SVM_17_PALGreetings"				;//Chwała Innosowi!
	Weather						= 	"SVM_17_Weather"						;//Nędzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//W końcu cię dopadłam!
	DieEnemy					=	"SVM_17_DieEnemy"					;//Wybiła twoja godzina!
	DieMonster					=	"SVM_17_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_17_DirtyThief"					;//Parszywy złodziej! Czekaj tylko...
	HandsOff					=	"SVM_17_HandsOff"					;//Łapy precz!
	SheepKiller					=	"SVM_17_SheepKiller"					;//Ten bydlak zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//Ten cholerny potwór zżera nasze owce!
	YouMurderer					=	"SVM_17_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Czekaj tylko, gnido!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//Sam tego chciałeś!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Zatem będę musiała cię stąd WYKOPAĆ!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//Co TY tam robiłeś, co?!
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Przestaniecie w końcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Giń, bydlaku!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//To twój koniec, padalcu!
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_17_ThiefDown"					;//Nigdy więcej nie próbuj mnie okraść!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//Na przyszłości trzymaj się z dala od rzeczy, które nie powinny cię interesować!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Nigdy więcej tego nie rób! To są nasze owce!
	KillMurderer				=	"SVM_17_KillMurderer"				;//Giń, morderco!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//Głupia bestia!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//Nigdy więcej ze mną nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//Trzeba było mnie posłuchać!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//A teraz zabieraj się stąd!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//I żebym cię już nigdy więcej tam nie przyłapała!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Tu się nie walczy, zrozumiano? Niech to będzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_17_RunAway"						;//Wynoszę się stąd!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//ALARM!
	Guards						=	"SVM_17_Guards"					;//STRAŻ!
	Help						=	"SVM_17_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//Dobra robota!
	GoodKill					= 	"SVM_17_GoodKill"				;//No, daj świni na co zasługuje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//Stój, tchórzu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Wynoś się stąd!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//Czego tutaj szukasz? Odejdź!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//No, zabieraj się!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//Hej ty! Czego ty tam szukasz?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//Co jest
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//Dzięki za złoto, mój ty bohaterze!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//Ty biedny frajerze, nawet złota nie masz!
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//Lepiej zaopiekuję się twoją bronią.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//Hej, uważaj! Jeszcze raz i ci przyłożę!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//Ciągle ci mało?!
	StopMagic					=	"SVM_17_StopMagic"				;//Przestań z tymi czarami!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Chcesz dostać? Przestań w tej chwili!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Odłóż broń!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Odłożysz w końcu tę cholerną broń?!
	WiseMove					=	"SVM_17_WiseMove"				;//Mądra decyzja...
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//Zobaczymy następnym razem...
	OhMyHead					=	"SVM_17_OhMyHead"				;//O bogowie, moja głowa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_17_GoodVictory"			;//Pokazałeś mu, kto tu rządzi!
	NotBad						= 	"SVM_17_NotBad"					;//Nieźle...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//Bogowie! Jak brutalnie...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Rozwal go!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Pokaż mu!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Daj mu popalić!
	Ooh01						=	"SVM_17_Ooh01"					;//Oddaj mu!
	Ooh02						=	"SVM_17_Ooh02"					;//Uważaj!
	Ooh03						=	"SVM_17_Ooh03"					;//Och! To bolało!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//Co TO było!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Wynoś się z mojego łóżka!
	Awake						= "SVM_17_Awake"					;//(ziewnięcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//Poszedłeś więc do kapitana i oczyściłeś się z zarzutów.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//Byłeś zatem u Ojca Parlana i wyznałeś mu o swoje grzechy.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee rozwiązał tę sprawę dla ciebie.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//Dobre.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//Nie możesz tak po prostu zabijać naszych owiec! Odejdź!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Jesteś brutalnym oprychem. Nie chcę mieć z tobą nic wspólnego.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//Nie rozmawiam ze złodziejami - wynocha!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Twoje zachowanie nie jest zbyt honorowe. Lordowi Hagenowi to się nie spodoba!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Twoje zachowanie hańbi dobre imię straży miejskiej! Lord Andre zażąda wyjaśnień!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Lord Andre dowie się o twych czynach!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Postąpiłeś niewłaściwie. Idź do Ojca Parlana i żałuj za swoje grzechy!
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Lee się o tym dowie. Zostaniesz ukarany!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Kapitan Garond zażąda wyjaśnień!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 sztuk złota.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 sztuk złota.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 sztuk złota.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 sztuk złota.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 sztuk złota.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 sztuk złota.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 sztuk złota.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 sztuk złota.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 sztuk złota.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 sztuk złota.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 sztuk złota.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 sztuk złota.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 sztuk złota.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 sztuk złota.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 sztuk złota.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 sztuk złota.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 sztuk złota.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 sztuk złota.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 sztuk złota.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 sztuk złota.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 sztuk złota.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 sztuk złota.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 sztuk złota.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 sztuk złota.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 sztuk złota.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 sztuk złota.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 sztuk złota.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 sztuk złota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//...doprawdy? To interesujące...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//...nie wierzę w to...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//...mój mąż uważa inaczej...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//...daj spokój, nie opowiadaj mi takich rzeczy...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//...naprawdę, sama widziałam...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//...nie mów...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//...nikomu tego nie powtarzaj...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//...przyszło nam żyć w niedobrych czasach...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//...kto to opowiada takie rzeczy...
	Smalltalk10					= "SVM_17_Smalltalk10"				;//...gdybym sama tego nie widziała...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//...ktoś musi pracować...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//...słyszałam co innego...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//...tak, to bardzo typowe...
	Smalltalk14					= "SVM_17_Smalltalk14"				;//...nie potrafi niczego zatrzymać dla siebie...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//...lepiej by było, gdyby się przymknął...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//...i pracuje niemal przez cały dzień...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//...nie mogę się zajmować wszystkim i wszystkimi...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//...on po prostu za dużo gada...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//...tajemnica, o której wszyscy wiedzą...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//...teraz każdy już o tym wie...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//...niczego jej już nie powiem...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//...a będzie jeszcze gorzej...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//...to przecież okropne...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//...zawsze to powtarzałam...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Wróć, kiedy nabierzesz trochę więcej doświadczenia.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie więcej, niż mogę cię nauczyć.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//Nie mogę cię już niczego nauczyć. Jesteś zbyt dobry.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//Widzisz, już się czegoś nauczyłeś...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Jesteś teraz w dolnej części miasta.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Jesteś teraz w górnym mieście.
	TEMPEL						= "SVM_17_TEMPEL"					;//Jesteś teraz przy świątyni.
	MARKT						= "SVM_17_MARKT"						;//Jesteś teraz na targowisku.
	GALGEN						= "SVM_17_GALGEN"					;//Jesteś teraz na placu wisielców.
	KASERNE						= "SVM_17_KASERNE"					;//To są koszary.
	HAFEN						= "SVM_17_HAFEN"						;//Jesteś teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//Dokąd chcesz się udać?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//Przejdź przez wewnętrzną bramę, a dojdziesz do dolnej części miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//Przy południowej bramie znajdują się schody, które prowadzą do bramy wewnętrznej. Za nią zaczyna się górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Idąc od kużni przez przejście, dojdziesz do placu świątynnego.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Idąc od kuźni w dół ulicą portową, dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//Od placu świątynnego odchodzi przejście, które prowadzi do dolnej części miasta.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//Jesteś przed świątynią, idź na lewo wzdłuż murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Idąc od strony świątyni, skręć w lewo koło knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Idąc od strony targowiska, wzdłuż murów miejskich, dojdziesz do świątyni.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//Ten duży budynek to koszary. Wejdź po schodach naprzeciwko hotelu.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//Przejdź obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//Idź w dół uliczką odchodzącą od placu wisielców, a dojdziesz do placu świątynnego.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//Przejdź obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//Ten duży budynek to koszary. Wejdź po schodach.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//Zejdź po schodach na lewo od głównego wejścia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//Zejdź po schodach na prawo od głównego wejścia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Idąc w górę ulicą portową od strony muru przy nabrzeżu, dojdziesz do dolnej części miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_17_Dead"						;//Aaaarhhh!
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
	DieEnemy     	= "SVM_19_DieEnemy"     	;//Tam jesssssst!
	RunCoward    	= "SVM_19_RunCoward"    	;//Nie wymkniessssz ssssię nam!
	Dead      		= "SVM_19_Dead"      	;//Aaaaarhhh!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Aargh
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Aargh
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Aargh
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




