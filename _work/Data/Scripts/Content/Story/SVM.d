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
	MILGreetings				= 	"SVM_1_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_1_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_1_Weather"						;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_1_IGetYouStill"				;//A jednak mi siê nie wymkniesz!
	DieEnemy					=	"SVM_1_DieEnemy"					;//Doigra³eœ siê!
	DieMonster					=	"SVM_1_DieMonster"					;//Znowu jedna z tych g³upich bestii!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Czekaj tylko, ty parszywy z³odzieju!
	HandsOff					=	"SVM_1_HandsOff"					;//£apy precz!
	SheepKiller					=	"SVM_1_SheepKiller"					;//Ten bydlak szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_1_SheepKillerMonster"			;//Ta przeklêta bestia po¿era nasze owce!
	YouMurderer					=	"SVM_1_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_1_DieStupidBeast"				;//¯adne bestie nie maj¹ tu prawa wstêpu!
	YouDareHitMe				=	"SVM_1_YouDareHitMe"				;//Czekaj tylko, bydlaku!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_1_ThenIBeatYouOutOfHere"		;//W takim razie bêdê musia³ ciê st¹d wykopaæ!
	WhatDidYouDoInThere			=	"SVM_1_WhatDidYouDoInThere"			;//A czego TY tam szuka³eœ, hê?!
	WillYouStopFighting			=	"SVM_1_WillYouStopFighting"			;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_1_KillEnemy"					;//Giñ, gnido!
	EnemyKilled					=	"SVM_1_EnemyKilled"					;//To ju¿ koniec, œmieciu!
	MonsterKilled				=	"SVM_1_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_1_ThiefDown"					;//Nigdy wiêcej nie próbuj mnie okradaæ!
	rumfummlerDown				=	"SVM_1_rumfummlerDown"				;//W przysz³oœci trzymaj ³apska z dala od cudzych spraw.
	SheepAttackerDown			=	"SVM_1_SheepAttackerDown"			;//Nigdy wiêcej tego nie rób! To NASZE owce!
	KillMurderer				=	"SVM_1_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_1_StupidBeastKilled"			;//Co za g³upia bestia!
	NeverHitMeAgain				=	"SVM_1_NeverHitMeAgain"				;//Nigdy wiêcej nie próbuj siê ze mn¹ mierzyæ!
	YouBetterShouldHaveListened	=	"SVM_1_YouBetterShouldHaveListened"	;//Trzeba by³o mnie s³uchaæ!
	GetUpAndBeGone				=	"SVM_1_GetUpAndBeGone"				;//A teraz zmywaj siê st¹d!
	NeverEnterRoomAgain			=	"SVM_1_NeverEnterRoomAgain"			;//I ¿ebym ciê ju¿ nigdy wiêcej tam nie przy³apa³!
	ThereIsNoFightingHere		=	"SVM_1_ThereIsNoFightingHere"		;//Tu siê nie walczy, jasne?! Niech to bêdzie dla ciebie nauczk¹!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_1_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_1_RunAway"						;//A niech to! Trzeba wiaæ!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_1_Alarm"						;//ALARM!
	Guards						=	"SVM_1_Guards"						;//STRA¯!
	Help						=	"SVM_1_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_1_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_1_GoodKill"					;//Dobrze! Wykoñcz œwiniê!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_1_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_1_RunCoward"					;//Stój, œmieciu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Wynocha!
	WhyAreYouInHere				=	"SVM_1_WhyAreYouInHere"				;//Czego tu szukasz? OdejdŸ!
	YesGoOutOfHere				= 	"SVM_1_YesGoOutOfHere"				;//No, wynoœ siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Ej ty! Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Cholera, co siê dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_1_ITookYourGold"				;//Z³oto! Zaopiekujê siê nim...
	ShitNoGold					=	"SVM_1_ShitNoGold"					;//Ten frajer nie ma nawet z³ota.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Zajmê siê twoj¹ broni¹...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Ej! Uwa¿aj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Ci¹gle ci ma³o?!
	StopMagic					=	"SVM_1_StopMagic"					;//Zabieraj siê z t¹ swoj¹ magi¹!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Powiedzia³em: KONIEC z magi¹! Og³uch³eœ, czy co?!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Og³uch³eœ? Od³ó¿ tê broñ!
	WiseMove					=	"SVM_1_WiseMove"					;//No proszê, jednak mo¿na!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_1_NextTimeYoureInForIt"		;//Jeszcze zobaczymy...
	OhMyHead					=	"SVM_1_OhMyHead"					;//Och, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_1_TheresAFight"				;//Wreszcie coœ siê dzieje...
	OhMyGodItsAFight			=	"SVM_1_OhMyGodItsAFight"			;//Oni zrobi¹ sobie krzywdê...
	GoodVictory					=	"SVM_1_GoodVictory"					;//Zas³u¿y³ sobie na to!
	NotBad						= 	"SVM_1_NotBad"						;//NieŸle... Ca³kiem nieŸle.
	OhMyGodHesDown				=	"SVM_1_OhMyGodHesDown"				;//Co za brutal...
	CheerFriend01				=	"SVM_1_CheerFriend01"				;//Dobrze, tak trzymaj!
	CheerFriend02				=	"SVM_1_CheerFriend02"				;//No, dalej!
	CheerFriend03				=	"SVM_1_CheerFriend03"				;//Mocniej!
	Ooh01						=	"SVM_1_Ooh01"						;//Nie pozwól na to!
	Ooh02						=	"SVM_1_Ooh02"						;//Dasz sobie radê!
	Ooh03						=	"SVM_1_Ooh03"						;//A niech to!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_1_WhatWasThat"					;//Co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_1_GetOutOfMyBed"					;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_1_Awake"							;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_1_ABS_COMMANDER"					;//Powiadaj¹, ¿e by³eœ u kapitana i za³atwi³eœ sprawê.
	ABS_MONASTERY				= "SVM_1_ABS_MONASTERY"					;//Ponoæ by³eœ u Ojca Parlana i wyspowiada³eœ siê ze swych grzechów?
	ABS_FARM					= "SVM_1_ABS_FARM"						;//S³ysza³em, ¿e by³eœ u Lee i doprowadzi³eœ sprawê do porz¹dku.
	ABS_GOOD					= "SVM_1_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_1_SHEEPKILLER_CRIME"				;//Tak po prostu zaszlachtowaæ nasze owce... Wynoœ siê!
	ATTACK_CRIME				= "SVM_1_ATTACK_CRIME"					;//Z takimi jak ty nie bêdê rozmawiaæ!
	THEFT_CRIME					= "SVM_1_THEFT_CRIME"					;//ZejdŸ mi z oczu, parszywy z³odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_1_PAL_CITY_CRIME"				;//Jesteœ zaka³¹ swojego zakonu! Lord Hagen bêdzie wœciek³y!
	MIL_CITY_CRIME				= "SVM_1_MIL_CITY_CRIME"				;//Jesteœ zaka³¹ stra¿y miejskiej! Lord Andre na pewno da ci nauczkê!
	CITY_CRIME					= "SVM_1_CITY_CRIME"					;//Lord Andre dowie siê o wszystkim!
	// -------------------------
	MONA_CRIME					= "SVM_1_MONA_CRIME"					;//Twoje czyny z pewnoœci¹ nie uciesz¹ Ojca Parlana!
	FARM_CRIME					= "SVM_1_FARM_CRIME"					;//Dostanie ci siê za to od Lee! I na co ci to by³o?!
	OC_CRIME					= "SVM_1_OC_CRIME"						;//Kapitan Garond rozliczy ciê z tego!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_1_TOUGHGUY_ATTACKLOST"			;//No ju¿ dobrze, wygra³eœ. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_1_TOUGHGUY_ATTACKWON"			;//Mam ci jeszcze raz pokazaæ, kto tu rz¹dzi?
	TOUGHGUY_PLAYERATTACK		= "SVM_1_TOUGHGUY_PLAYERATTACK"			;//Chcesz siê jeszcze raz ze mn¹ spróbowaæ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_1_GOLD_1000"						;//1000 sztuk z³ota.
	GOLD_950					= "SVM_1_GOLD_950"						;//950 sztuk z³ota.
	GOLD_900					= "SVM_1_GOLD_900"						;//900 sztuk z³ota.
	GOLD_850					= "SVM_1_GOLD_850"						;//850 sztuk z³ota.
	GOLD_800					= "SVM_1_GOLD_800"						;//800 sztuk z³ota.
	GOLD_750					= "SVM_1_GOLD_750"						;//750 sztuk z³ota.
	GOLD_700					= "SVM_1_GOLD_700"						;//700 sztuk z³ota.
	GOLD_650					= "SVM_1_GOLD_650"						;//650 sztuk z³ota.
	GOLD_600					= "SVM_1_GOLD_600"						;//600 sztuk z³ota.
	GOLD_550					= "SVM_1_GOLD_550"						;//550 sztuk z³ota.
	GOLD_500					= "SVM_1_GOLD_500"						;//500 sztuk z³ota.
	GOLD_450					= "SVM_1_GOLD_450"						;//450 sztuk z³ota.
	GOLD_400					= "SVM_1_GOLD_400"						;//400 sztuk z³ota.
	GOLD_350					= "SVM_1_GOLD_350"						;//350 sztuk z³ota.
	GOLD_300					= "SVM_1_GOLD_300"						;//300 sztuk z³ota.
	GOLD_250					= "SVM_1_GOLD_250"						;//250 sztuk z³ota.
	GOLD_200					= "SVM_1_GOLD_200"						;//200 sztuk z³ota.
	GOLD_150					= "SVM_1_GOLD_150"						;//150 sztuk z³ota.
	GOLD_100					= "SVM_1_GOLD_100"						;//100 sztuk z³ota.
	GOLD_90						= "SVM_1_GOLD_90"						;//90 sztuk z³ota.
	GOLD_80						= "SVM_1_GOLD_80"						;//80 sztuk z³ota.
	GOLD_70						= "SVM_1_GOLD_70"						;//70 sztuk z³ota.
	GOLD_60						= "SVM_1_GOLD_60"						;//60 sztuk z³ota.
	GOLD_50						= "SVM_1_GOLD_50"						;//50 sztuk z³ota.
	GOLD_40						= "SVM_1_GOLD_40"						;//40 sztuk z³ota.
	GOLD_30						= "SVM_1_GOLD_30"						;//30 sztuk z³ota.
	GOLD_20						= "SVM_1_GOLD_20"						;//20 sztuk z³ota.
	GOLD_10						= "SVM_1_GOLD_10"						;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_1_Smalltalk01"					;//...naprawdê s¹dzisz...
	Smalltalk02					= "SVM_1_Smalltalk02"					;//...wszystko jest mo¿liwe...
	Smalltalk03					= "SVM_1_Smalltalk03"					;//...powinien by³ wiedzieæ lepiej...
	Smalltalk04					= "SVM_1_Smalltalk04"					;//...tak jakby brakowa³o mi zmartwieñ...
	Smalltalk05					= "SVM_1_Smalltalk05"					;//...kto opowiada takie rzeczy...
	Smalltalk06					= "SVM_1_Smalltalk06"					;//...przez to bêdzie jeszcze wiêcej k³opotów...
	Smalltalk07					= "SVM_1_Smalltalk07"					;//...wiesz, mówi siê o tym i o tamtym...
	Smalltalk08					= "SVM_1_Smalltalk08"					;//...ja bym tego nie zrobi³...
	Smalltalk09					= "SVM_1_Smalltalk09"					;//...to wszystko tylko pog³oski...
	Smalltalk10					= "SVM_1_Smalltalk10"					;//...trzeba uwa¿aæ na to, co siê mówi...
	Smalltalk11					= "SVM_1_Smalltalk11"					;//...mog³em ci powiedzieæ wczeœniej...
	Smalltalk12					= "SVM_1_Smalltalk12"					;//...mnie i tak nikt nie pyta...
	Smalltalk13					= "SVM_1_Smalltalk13"					;//...w³aœciwie mo¿e byæ go tylko ¿al...
	Smalltalk14					= "SVM_1_Smalltalk14"					;//...to przecie¿ nic nowego...
	Smalltalk15					= "SVM_1_Smalltalk15"					;//...to przecie¿ oczywiste...
	Smalltalk16					= "SVM_1_Smalltalk16"					;//...mnie nie musisz o to pytaæ...
	Smalltalk17					= "SVM_1_Smalltalk17"					;//...to nie mo¿e byæ tak dalej...
	Smalltalk18					= "SVM_1_Smalltalk18"					;//...znasz ju¿ moje zdanie...
	Smalltalk19					= "SVM_1_Smalltalk19"					;//...powiedzia³em dok³adnie to samo...
	Smalltalk20					= "SVM_1_Smalltalk20"					;//...nic siê nie zmieni...
	Smalltalk21					= "SVM_1_Smalltalk21"					;//...dlaczego dowiadujê siê o tym dopiero teraz...
	Smalltalk22					= "SVM_1_Smalltalk22"					;//...po prostu trzeba odczekaæ....
	Smalltalk23					= "SVM_1_Smalltalk23"					;//...niektóre problemy same siê rozwi¹zuj¹...
	Smalltalk24					= "SVM_1_Smalltalk24"					;//...nie chcê ju¿ o tym s³uchaæ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_1_Smalltalk25"					;//...by³ w sztok pijany...
	Smalltalk26					= "SVM_1_Smalltalk26"					;//...nie ze mn¹ te numery...
	Smalltalk27					= "SVM_1_Smalltalk27"					;//...pouciekali jak zaj¹ce, by³em zupe³nie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_1_Smalltalk28"					;//...tak jest napisane w œwiêtych pismach...
	Smalltalk29					= "SVM_1_Smalltalk29"					;//...w swych dzia³aniach kierujê siê wol¹ Innosa...
	Smalltalk30					= "SVM_1_Smalltalk30"					;//...nie wolno wystêpowaæ przeciwko boskiemu porz¹dkowi...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_1_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_1_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_1_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_1_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_1_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_1_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_1_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_1_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_1_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_1_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_1_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_1_WHERETO"					;//A gdzie siê wybierasz?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_1_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_1_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_1_UNTERSTADT_2_TEMPEL"		;//IdŸ od strony kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_1_UNTERSTADT_2_HAFEN"		;//IdŸ od strony kuŸni w dó³ ulic¹ portow¹, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_1_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_1_TEMPEL_2_MARKT"			;//Kiedy bêdziesz przed œwi¹tyni¹, skrêæ w lewo i idŸ wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_1_TEMPEL_2_GALGEN"			;//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_1_MARKT_2_TEMPEL"			;//Je¿eli pójdziesz wzd³u¿ murów miejskich od strony targowiska, to dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_1_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz siê do nich po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_1_MARKT_2_GALGEN"			;//Po prostu przejdŸ obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_1_GALGEN_2_TEMPEL"			;//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_1_GALGEN_2_MARKT"			;//Po prostu przejdŸ obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_1_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz siê do niego po schodach.
	KASERNE_2_MARKT				= "SVM_1_KASERNE_2_MARKT"			;//Po prostu zejdŸ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_1_KASERNE_2_GALGEN"			;//Po prostu zejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_1_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_1_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_1_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_1_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_1_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_1_Addon_WrongArmor";				//To nie jest twoje ubranie. Nie bêdê z tob¹ rozmawiaæ.
	ADDON_WRONGARMOR_SLD		= "SVM_1_ADDON_WRONGARMOR_SLD";			//Jak ty wygl¹dasz? Ubierz siê porz¹dnie!
	ADDON_WRONGARMOR_MIL		= "SVM_1_ADDON_WRONGARMOR_MIL";			//Jesteœ ¿o³nierzem! Ubierz siê odpowiednio!
	ADDON_WRONGARMOR_KDF		= "SVM_1_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz siê!
	ADDON_NOARMOR_BDT			= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj siê st¹d!

	ADDON_DIEBANDIT				= "SVM_1_ADDON_DIEBANDIT";				//Giñ, bandycki pomiocie!
	ADDON_DIRTYPIRATE			= "SVM_1_ADDON_DIRTYPIRATE";			//Piracka œwinia!
};

INSTANCE SVM_2	(C_SVM)	
{
	//leer
};

instance SVM_3 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_3_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_3_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_3_Weather"					;//Ale nêdzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_3_IGetYouStill"				;//Teraz ciê dorwê!
	DieEnemy					=	"SVM_3_DieEnemy"					;//Zaraz ciê za³atwiê!
	DieMonster					=	"SVM_3_DieMonster"					;//Znowu jedna z tych g³upich bestii!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Czekaj tylko, ty parszywy z³odzieju!
	HandsOff					=	"SVM_3_HandsOff"					;//£apy precz!
	SheepKiller					=	"SVM_3_SheepKiller"				;//Ten bydlak szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_3_SheepKillerMonster"			;//Ta przeklêta bestia z¿era nasze owce!
	YouMurderer					=	"SVM_3_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_3_DieStupidBeast"				;//¯adne stwory nie maj¹ tu prawa wstêpu!
	YouDareHitMe				=	"SVM_3_YouDareHitMe"				;//Czekaj tylko, ty gnido!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_3_ThenIBeatYouOutOfHere"		;//Nie chcesz iœæ? Dobrze!
	WhatDidYouDoInThere			=	"SVM_3_WhatDidYouDoInThere"		;//Czego tam szuka³eœ?
	WillYouStopFighting			=	"SVM_3_WillYouStopFighting"		;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_3_KillEnemy"					;//Giñ, gnido!
	EnemyKilled					=	"SVM_3_EnemyKilled"				;//Zas³u¿y³eœ sobie na to, bydlaku!
	MonsterKilled				=	"SVM_3_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_3_ThiefDown"					;//Nigdy wiêcej nie próbuj mnie okraœæ!
	rumfummlerDown				=	"SVM_3_rumfummlerDown"				;//Na przysz³oœæ trzymaj siê z dala od cudzej w³asnoœci!
	SheepAttackerDown			=	"SVM_3_SheepAttackerDown"			;//Nigdy wiêcej tego nie rób! To s¹ nasze owce!
	KillMurderer				=	"SVM_3_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_3_StupidBeastKilled"			;//Ale g³upia bestia!
	NeverHitMeAgain				=	"SVM_3_NeverHitMeAgain"			;//Nigdy wiêcej nie próbuj siê ze mn¹ mierzyæ!
	YouBetterShouldHaveListened	=	"SVM_3_YouBetterShouldHaveListened";//Trzeba by³o mnie pos³uchaæ!
	GetUpAndBeGone				=	"SVM_3_GetUpAndBeGone"				;//A teraz zmywaj siê st¹d!
	NeverEnterRoomAgain			=	"SVM_3_NeverEnterRoomAgain"		;//I ¿ebym ciê ju¿ nigdy wiêcej tam nie przy³apa³!
	ThereIsNoFightingHere		=	"SVM_3_ThereIsNoFightingHere"		;//Tu siê nie walczy, jasne?! Niech to bêdzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_3_SpareMe"					;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_3_RunAway"					;//O cholera!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_3_Alarm"					;//ALARM!
	Guards						=	"SVM_3_Guards"					;//STRA¯!
	Help						=	"SVM_3_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_3_GoodMonsterKill"		;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_3_GoodKill"				;//No, wykoñcz œwiniê!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_3_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_3_RunCoward"				;//No, biegnij! Najszybciej jak potrafisz!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_3_GetOutOfHere"			;//Wynoœ siê st¹d!
	WhyAreYouInHere				=	"SVM_3_WhyAreYouInHere"		;//Czego tu szukasz? OdejdŸ!
	YesGoOutOfHere				= 	"SVM_3_YesGoOutOfHere"			;//No, wynoœ siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"	;//Ej ty! Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"	;//Cholera, co siê dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_3_ITookYourGold"			;//Dziêki za z³oto, mój ty bohaterze!
	ShitNoGold					=	"SVM_3_ShitNoGold"				;//Ty frajerze, nawet nie masz z³ota!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"		;//Lepiej zaopiekujê siê twoj¹ broni¹...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"		;//Lepiej uwa¿aj! Nastêpnym razem ci przy³o¿ê.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"	;//Ci¹gle ci ma³o?!
	StopMagic					=	"SVM_3_StopMagic"				;//Skoñcz wreszcie z tym czarowaniem!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"			;//Chcesz dostaæ? Natychmiast przestañ!
	WeaponDown					=	"SVM_3_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"		;//Od³ó¿ wreszcie tê cholern¹ broñ!
	WiseMove					=	"SVM_3_WiseMove"				;//Spryciarz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_3_NextTimeYoureInForIt"	;//Zobaczymy nastêpnym razem...
	OhMyHead					=	"SVM_3_OhMyHead"				;//Och, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_3_TheresAFight"			;//Aach, walka..
	OhMyGodItsAFight			=	"SVM_3_OhMyGodItsAFight"		;//O rany, walka!
	GoodVictory					=	"SVM_3_GoodVictory"			;//Ale mu pokaza³eœ!
	NotBad						= 	"SVM_3_NotBad"					;//NieŸle...
	OhMyGodHesDown				=	"SVM_3_OhMyGodHesDown"			;//Na bogów! Jak brutalnie...
	CheerFriend01				=	"SVM_3_CheerFriend01"			;//Wal!
	CheerFriend02				=	"SVM_3_CheerFriend02"			;//Daj z siebie wszystko!
	CheerFriend03				=	"SVM_3_CheerFriend03"			;//Poka¿ mu!
	Ooh01						=	"SVM_3_Ooh01"					;//Trzymaj siê!
	Ooh02						=	"SVM_3_Ooh02"					;//Uwaga!
	Ooh03						=	"SVM_3_Ooh03"					;//O! To musia³o boleæ!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_3_WhatWasThat"				;//Co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_3_GetOutOfMyBed"			;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_3_Awake"					;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_3_ABS_COMMANDER"			;//By³eœ zatem u kapitana i doprowadzi³eœ wszystko do porz¹dku.
	ABS_MONASTERY				= "SVM_3_ABS_MONASTERY"			;//By³eœ zatem u Ojca Parlana i wyspowiada³eœ siê ze swoich grzechów.
	ABS_FARM					= "SVM_3_ABS_FARM"					;//By³eœ wiêc u Lee i wyjaœni³eœ sprawê.
	ABS_GOOD					= "SVM_3_ABS_GOOD"					;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_3_SHEEPKILLER_CRIME"		;//Tak po prostu zaszlachtowaæ nasze owce!
	ATTACK_CRIME				= "SVM_3_ATTACK_CRIME"				;//Zostaw mnie w spokoju, bydlaku!
	THEFT_CRIME					= "SVM_3_THEFT_CRIME"				;//Zostaw mnie w spokoju, ty parszywy z³odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_3_PAL_CITY_CRIME"			;//Jesteœ hañb¹ dla swojego zakonu! Poczekaj tylko, a¿ Lord Hagen siê o tym dowie!
	MIL_CITY_CRIME				= "SVM_3_MIL_CITY_CRIME"			;//Hañbisz dobre imiê stra¿y miejskiej! Poczekaj, a¿ dowie siê o tym Lord Andre!
	CITY_CRIME					= "SVM_3_CITY_CRIME"				;//Poczekaj tylko, a¿ Lord Andre siê o tym dowie.
	// -------------------------
	MONA_CRIME					= "SVM_3_MONA_CRIME"				;//Poczekaj tylko, a¿ dowie siê o tym Ojciec Parlan!
	FARM_CRIME					= "SVM_3_FARM_CRIME"				;//Poczekaj tylko, a¿ Lee siê o tym dowie...
	OC_CRIME					= "SVM_3_OC_CRIME"					;//Poczekaj, a¿ dowie siê o tym kapitan Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_3_TOUGHGUY_ATTACKLOST"		;//Dobrze, dobrze. Jesteœ lepszy ode mnie. Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_3_TOUGHGUY_ATTACKWON"		;//Wiesz ju¿ chyba, który z nas jest tym silniejszym... Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_3_TOUGHGUY_PLAYERATTACK"	;//Myœla³em, ¿e chcesz siê ze mn¹ zmierzyæ. Zmieni³eœ zdanie? Wolisz jednak ROZMAWIAÆ, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_3_GOLD_1000"				;//1000 sztuk z³ota.
	GOLD_950					= "SVM_3_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_3_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_3_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_3_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_3_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_3_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_3_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_3_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_3_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_3_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_3_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_3_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_3_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_3_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_3_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_3_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_3_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_3_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_3_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_3_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_3_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_3_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_3_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_3_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_3_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_3_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_3_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_3_Smalltalk01"				;//...naprawdê myœlisz...
	Smalltalk02					= "SVM_3_Smalltalk02"				;//...wszystko jest mo¿liwe...
	Smalltalk03					= "SVM_3_Smalltalk03"				;//...powinien byæ m¹drzejszy...
	Smalltalk04					= "SVM_3_Smalltalk04"				;//...tak jakbym nie mia³ wystarczaj¹co du¿o problemów...
	Smalltalk05					= "SVM_3_Smalltalk05"				;//...kto ci to powiedzia³...
	Smalltalk06					= "SVM_3_Smalltalk06"				;//...z tego wyniknie tylko jeszcze wiêcej k³opotów...
	Smalltalk07					= "SVM_3_Smalltalk07"				;//...kr¹¿¹ ostatnio ró¿ne plotki...
	Smalltalk08					= "SVM_3_Smalltalk08"				;//...nigdy by mi nie przysz³o do g³owy...
	Smalltalk09					= "SVM_3_Smalltalk09"				;//...to przecie¿ tylko pog³oski...
	Smalltalk10					= "SVM_3_Smalltalk10"				;//...trzeba uwa¿aæ na to, co siê mówi...
	Smalltalk11					= "SVM_3_Smalltalk11"				;//...mog³em ci powiedzieæ wczeœniej...
	Smalltalk12					= "SVM_3_Smalltalk12"				;//...mnie i tak nikt nie pyta...
	Smalltalk13					= "SVM_3_Smalltalk13"				;//...biedakowi mo¿na tylko wspó³czuæ...
	Smalltalk14					= "SVM_3_Smalltalk14"				;//...to przecie¿ nic nowego...
	Smalltalk15					= "SVM_3_Smalltalk15"				;//...to przecie¿ oczywiste...
	Smalltalk16					= "SVM_3_Smalltalk16"				;//...mnie nie musisz o to pytaæ...
	Smalltalk17					= "SVM_3_Smalltalk17"				;//...tak dalej byæ nie mo¿e...
	Smalltalk18					= "SVM_3_Smalltalk18"				;//...znasz ju¿ moje zdanie...
	Smalltalk19					= "SVM_3_Smalltalk19"				;//...dok³adnie to samo powiedzia³em...
	Smalltalk20					= "SVM_3_Smalltalk20"				;//...nic tego nie zmieni...
	Smalltalk21					= "SVM_3_Smalltalk21"				;//...czemu dowiadujê siê o tym dopiero teraz...
	Smalltalk22					= "SVM_3_Smalltalk22"				;//...poczekajmy, co z tego wyniknie...
	Smalltalk23					= "SVM_3_Smalltalk23"				;//...niektóre problemy same siê rozwi¹zuj¹...
	Smalltalk24					= "SVM_3_Smalltalk24"				;//...ju¿ nie chce mi siê o tym s³uchaæ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_3_Smalltalk25"				;//...przecie¿ on by³ w sztok pijany...
	Smalltalk26					= "SVM_3_Smalltalk26"				;//...nie pozwolê siê tak traktowaæ...
	Smalltalk27					= "SVM_3_Smalltalk27"				;//...wszyscy uciekali jak zaj¹ce, by³em zupe³nie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_3_Smalltalk28"				;//...tak jest napisane w œwiêtych pismach...
	Smalltalk29					= "SVM_3_Smalltalk29"				;//...dzia³am zawsze w imieniu Innosa...
	Smalltalk30					= "SVM_3_Smalltalk30"				;//...nikt nie mo¿e wystêpowaæ przeciwko boskiemu porz¹dkowi...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_3_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_3_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_3_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_3_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_3_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_3_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_3_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_3_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_3_GALGEN"					;//Znajdujesz siê teraz na placu wisielców.
	KASERNE						= "SVM_3_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_3_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_3_WHERETO"					;//Dok¹d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_3_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_3_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_3_UNTERSTADT_2_TEMPEL"		;//Id¹c od kowala, miñ przejœcie, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_3_UNTERSTADT_2_HAFEN"		;//IdŸ od kowala ulic¹ portow¹, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_3_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_3_TEMPEL_2_MARKT"			;//Kiedy znajdziesz siê przed œwi¹tyni¹, skrêæ w lewo i idŸ potem wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_3_TEMPEL_2_GALGEN"			;//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_3_MARKT_2_TEMPEL"			;//Je¿eli bêdziesz szed³ od strony targowiska wzd³u¿ murów miejskich, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_3_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. WejdŸ po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_3_MARKT_2_GALGEN"			;//Udaj siê drog¹ obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_3_GALGEN_2_TEMPEL"			;//IdŸ w dó³ uliczk¹ odchodz¹c¹ od placu wisielców, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_3_GALGEN_2_MARKT"			;//PrzejdŸ obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_3_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejœæ po schodach.
	KASERNE_2_MARKT				= "SVM_3_KASERNE_2_MARKT"			;//ZejdŸ po schodach znajduj¹cych siê na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_3_KASERNE_2_GALGEN"			;//ZejdŸ po schodach znajduj¹cych siê na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_3_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_3_Dead"						;//Aaarrrhhh!
	Aargh_1						= "SVM_3_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_3_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_3_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_3_Addon_WrongArmor";				//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju!
	ADDON_WRONGARMOR_SLD		= "SVM_3_ADDON_WRONGARMOR_SLD";			//Jeœli chcesz porozmawiaæ, najpierw siê jakoœ ubierz.
	ADDON_WRONGARMOR_MIL		= "SVM_3_ADDON_WRONGARMOR_MIL";			//My, ¿o³nierze, nosimy nasze mundury z dum¹. Za³ó¿ swój.
	ADDON_WRONGARMOR_KDF		= "SVM_3_ADDON_WRONGARMOR_KDF";			//W naszym Zakonie wszyscy s¹ równi, dlatego nosimy identyczne ubrania. Przebierz siê!
	ADDON_NOARMOR_BDT			= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//Wyszed³eœ prosto z wiêzienia, prawda? Za³ó¿ na siebie jakieœ ubranie!

	ADDON_DIEBANDIT				= "SVM_3_ADDON_DIEBANDIT";				//CHOD TU, BANDYTO!
	ADDON_DIRTYPIRATE			= "SVM_3_ADDON_DIRTYPIRATE";			//CHOD TU, PIRACIE!
};

instance SVM_4 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_4_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_4_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_4_Weather"						;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_4_IGetYouStill"				;//To znowu TY!
	DieEnemy					=	"SVM_4_DieEnemy"					;//Za³atwiê ciê!
	DieMonster					=	"SVM_4_DieMonster"					;//Znowu jedna z tych g³upich bestii!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Ty ma³y, parszywy z³odzieju!
	HandsOff					=	"SVM_4_HandsOff"					;//Zabieraj ³apy!
	SheepKiller					=	"SVM_4_SheepKiller"					;//Hej! Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_4_SheepKillerMonster"			;//Ta bestia z¿era nasze owce!
	YouMurderer					=	"SVM_4_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_4_DieStupidBeast"				;//A TEN stwór czego tu chce?!
	YouDareHitMe				=	"SVM_4_YouDareHitMe"				;//No, teraz to mnie wkurzy³eœ!
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_4_ThenIBeatYouOutOfHere"		;//Kto nie chce s³uchaæ, musi poczuæ...
	WhatDidYouDoInThere			=	"SVM_4_WhatDidYouDoInThere"			;//Czego tam szuka³eœ, co?!
	WillYouStopFighting			=	"SVM_4_WillYouStopFighting"			;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_4_KillEnemy"					;//Giñ!
	EnemyKilled					=	"SVM_4_EnemyKilled"					;//Cholerny bydlak...
	MonsterKilled				=	"SVM_4_MonsterKilled"				;//No, koniec z tob¹, bestio!
	ThiefDown					=	"SVM_4_ThiefDown"					;//Trzymaj na przysz³oœæ ³apy z dala od moich rzeczy, jasne?
	rumfummlerDown				=	"SVM_4_rumfummlerDown"				;//Trzymaj na przysz³oœæ ³apy przy sobie!
	SheepAttackerDown			=	"SVM_4_SheepAttackerDown"			;//Nie podnoœ nigdy wiêcej rêki na nasze owce!
	KillMurderer				=	"SVM_4_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_4_StupidBeastKilled"			;//G³upie stworzenie!
	NeverHitMeAgain				=	"SVM_4_NeverHitMeAgain"				;//Nie próbuj tego jeszcze raz, ch³opczyku!
	YouBetterShouldHaveListened	=	"SVM_4_YouBetterShouldHaveListened"	;//Niech to bêdzie dla ciebie nauczka.
	GetUpAndBeGone				=	"SVM_4_GetUpAndBeGone"				;//Wstawaj i wynoœ siê st¹d!
	NeverEnterRoomAgain			=	"SVM_4_NeverEnterRoomAgain"			;//Nie chcê ciê wiêcej tam widzieæ, zrozumiano?
	ThereIsNoFightingHere		=	"SVM_4_ThereIsNoFightingHere"		;//Je¿eli ktoœ tu rozdziela ciosy, to jestem to ja, zrozumiano?!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_4_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_4_RunAway"						;//Cholera! Trzeba uciekaæ!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_4_Alarm"					;//ALARM!
	Guards						=	"SVM_4_Guards"					;//STRA¯!
	Help						=	"SVM_4_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_4_GoodMonsterKill"			;//No! Tak nale¿y obchodziæ siê z bestiami!
	GoodKill					= 	"SVM_4_GoodKill"				;//Zas³uguje na to!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_4_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_4_RunCoward"				;//Jeszcze siê spotkamy!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_4_GetOutOfHere"			;//Wynoœ siê!
	WhyAreYouInHere				=	"SVM_4_WhyAreYouInHere"			;//Czego tu szukasz?!
	YesGoOutOfHere				= 	"SVM_4_YesGoOutOfHere"			;//Zabieraj siê st¹d!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"	;//Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"	;//Co siê dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_4_ITookYourGold"			;//Dziêki za z³oto, mój ty bohaterze!
	ShitNoGold					=	"SVM_4_ShitNoGold"				;//Ty frajerze, nawet z³ota nie masz!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"			;//Wezmê sobie twoj¹ broñ.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"			;//Lepiej uwa¿aj! Nastêpnym razem ci przy³o¿ê.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"	;//Znowu chcesz w mordê?
																	 
	StopMagic					=	"SVM_4_StopMagic"				;//Skoñcz wreszcie z tym czarowaniem!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"			;//Chcesz dostaæ? Natychmiast przestañ!
	WeaponDown					=	"SVM_4_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"			;//Od³ó¿ wreszcie tê cholern¹ broñ!
	WiseMove					=	"SVM_4_WiseMove"				;//Spryciarz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_4_NextTimeYoureInForIt"	;//Zobaczymy nastêpnym razem...
	OhMyHead					=	"SVM_4_OhMyHead"				;//O rany, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_4_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_4_OhMyGodItsAFight"		;//O rany, walka!
	GoodVictory					=	"SVM_4_GoodVictory"				;//Ale mu pokaza³eœ!
	NotBad						= 	"SVM_4_NotBad"					;//NieŸle...
	OhMyGodHesDown				=	"SVM_4_OhMyGodHesDown"			;//Bogowie! Jak ostro...
	CheerFriend01				=	"SVM_4_CheerFriend01"			;//Wal z ca³ej si³y!
	CheerFriend02				=	"SVM_4_CheerFriend02"			;//Poka¿ mu!
	CheerFriend03				=	"SVM_4_CheerFriend03"			;//Wykoñcz go!
	Ooh01						=	"SVM_4_Ooh01"					;//Broñ siê!
	Ooh02						=	"SVM_4_Ooh02"					;//Oddaj cios!
	Ooh03						=	"SVM_4_Ooh03"					;//Uuu, to musia³o boleæ!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_4_WhatWasThat"				;//Cholera, co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_4_GetOutOfMyBed"				;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_4_Awake"						;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_4_ABS_COMMANDER"    ;//Za³atwi³eœ zatem sprawê z kapitanem.
	ABS_MONASTERY    = "SVM_4_ABS_MONASTERY"    ;//Opowiedzia³eœ zatem Ojcu Parlanowi o swych czynach.
	ABS_FARM       = "SVM_4_ABS_FARM"        ;//Mówi¹, ¿e Lee za³atwi³ ca³¹ sprawê.
	ABS_GOOD       = "SVM_4_ABS_GOOD"       ;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_4_SHEEPKILLER_CRIME"   ;//Szlachtowanie owiec to ju¿ przesada! Wynoœ siê!
	ATTACK_CRIME     = "SVM_4_ATTACK_CRIME"    ;//Jesteœ jakimœ oprychem - lepiej st¹d odejdŸ!
 	THEFT_CRIME      = "SVM_4_THEFT_CRIME"    ;//Przeklêty z³odziej! Gardzê takimi jak ty!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_4_PAL_CITY_CRIME"   ;//Wydawa³o mi siê, ¿e od paladyna mo¿na spodziewaæ siê czegoœ wiêcej. Lord Hagen bêdzie niepocieszony.
 	MIL_CITY_CRIME     = "SVM_4_MIL_CITY_CRIME"   ;//¯e takich jak ty w ogóle przyjmuj¹ do stra¿y miejskiej! Odpowiesz za to przed Lordem Andre!
 	CITY_CRIME       = "SVM_4_CITY_CRIME"    ;//Lord Andre dowie siê o twoim zachowaniu!
	// -------------------------
	MONA_CRIME       = "SVM_4_MONA_CRIME"    ;//Ojciec Parlan bêdzie wœciek³y!
	FARM_CRIME       = "SVM_4_FARM_CRIME"    ;//Odpowiesz za to przed Lee!
	OC_CRIME       = "SVM_4_OC_CRIME"     ;//Kapitan Garond nie bêdzie zadowolony, kiedy o tym us³yszy! Zap³acisz za to!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_4_TOUGHGUY_ATTACKLOST"		;//Masz ca³kiem niez³e uderzenie... Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_4_TOUGHGUY_ATTACKWON"		;//Jeszcze jakieœ pytania?
	TOUGHGUY_PLAYERATTACK		= "SVM_4_TOUGHGUY_PLAYERATTACK"		;//To znowu ty!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_4_GOLD_1000"					;//1000 sztuk z³ota.
	GOLD_950					= "SVM_4_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_4_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_4_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_4_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_4_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_4_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_4_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_4_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_4_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_4_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_4_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_4_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_4_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_4_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_4_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_4_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_4_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_4_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_4_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_4_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_4_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_4_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_4_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_4_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_4_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_4_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_4_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_4_Smalltalk01"				;//...to rzeczywiœcie prawda...
	Smalltalk02					= "SVM_4_Smalltalk02"				;//...s³ysza³em coœ innego...
	Smalltalk03					= "SVM_4_Smalltalk03"				;//...nie mów, ¿e o tym nie wiedzia³eœ...
	Smalltalk04					= "SVM_4_Smalltalk04"				;//...cz³owiek nie wie, komu wierzyæ...
	Smalltalk05					= "SVM_4_Smalltalk05"				;//...to tylko gadanie...
	Smalltalk06					= "SVM_4_Smalltalk06"				;//...no widzisz, ju¿ mi lepiej...
	Smalltalk07					= "SVM_4_Smalltalk07"				;//...mnie to ju¿ nic nie dziwi...
	Smalltalk08					= "SVM_4_Smalltalk08"				;//...to naprawdê nie mój problem...
	Smalltalk09					= "SVM_4_Smalltalk09"				;//...naprawdê w to wierzysz...
	Smalltalk10					= "SVM_4_Smalltalk10"				;//...ode mnie nie us³ysz¹ nawet s³ówka...
	Smalltalk11					= "SVM_4_Smalltalk11"				;//...to by³o oczywiste od dawna...
	Smalltalk12					= "SVM_4_Smalltalk12"				;//...pos³ucha³ niew³aœciwych ludzi...
	Smalltalk13					= "SVM_4_Smalltalk13"				;//...je¿eli on sam tego nie widzi, to nie mogê mu pomóc...
	Smalltalk14					= "SVM_4_Smalltalk14"				;//...nie mówiê przecie¿ niczego nowego...
	Smalltalk15					= "SVM_4_Smalltalk15"				;//...sam by na to nie wpad³...
	Smalltalk16					= "SVM_4_Smalltalk16"				;//...przecie¿ wiadomo o tym od dawna...
	Smalltalk17					= "SVM_4_Smalltalk17"				;//...nieprzyjemna sprawa...
	Smalltalk18					= "SVM_4_Smalltalk18"				;//...zrobi³bym to inaczej...
	Smalltalk19					= "SVM_4_Smalltalk19"				;//...ca³kowicie siê z tob¹ zgadzam...
	Smalltalk20					= "SVM_4_Smalltalk20"				;//...czy to siê kiedykolwiek zmieni...
	Smalltalk21					= "SVM_4_Smalltalk21"				;//...nikt mi o tym nie mówi³...
	Smalltalk22					= "SVM_4_Smalltalk22"				;//...i tak nic nie zmienisz...
	Smalltalk23					= "SVM_4_Smalltalk23"				;//...wcale mnie to nie dziwi...
	Smalltalk24					= "SVM_4_Smalltalk24"				;//...ale on zawsze wie lepiej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                    
	Smalltalk25					= "SVM_4_Smalltalk25"				;//...i tak liczy siê tylko si³a, wiêc nie mów mi takich rzeczy...
	Smalltalk26					= "SVM_4_Smalltalk26"				;//...on nawet nie wie, jak siê trzyma miecz...
	Smalltalk27					= "SVM_4_Smalltalk27"				;//...tak, naprawdê tak powiedzia³...
	//ProInnos (NOV/KDF/PAL)                                                                                                                    
	Smalltalk28					= "SVM_4_Smalltalk28"				;//...ktoœ za to odpowie...
	Smalltalk29					= "SVM_4_Smalltalk29"				;//...Innos oœwieca wszystkich tych, którzy widz¹ jego m¹droœæ...
	Smalltalk30					= "SVM_4_Smalltalk30"				;//...w koñcu musi wygraæ sprawiedliwoœæ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_4_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_4_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_4_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_4_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_4_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_4_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_4_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_4_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_4_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_4_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_4_HAFEN"						;//Jesteœ w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_4_WHERETO"					;//Gdzie chcesz siê dostaæ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_4_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_4_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_4_UNTERSTADT_2_TEMPEL"		;//IdŸ od strony kowala przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_4_UNTERSTADT_2_HAFEN"		;//IdŸ od strony kowala w dó³ ulic¹ portow¹, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_4_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_4_TEMPEL_2_MARKT"			;//Kiedy bêdziesz przed œwi¹tyni¹, skrêæ w lewo i idŸ wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_4_TEMPEL_2_GALGEN"			;//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_4_MARKT_2_TEMPEL"			;//Je¿eli pójdziesz wzd³u¿ murów miejskich od strony targowiska, to dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_4_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. WejdŸ po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_4_MARKT_2_GALGEN"			;//Po prostu przejdŸ obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_4_GALGEN_2_TEMPEL"			;//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_4_GALGEN_2_MARKT"			;//Po prostu przejdŸ obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_4_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz siê tam po schodach.
	KASERNE_2_MARKT				= "SVM_4_KASERNE_2_MARKT"			;//Po prostu zejdŸ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_4_KASERNE_2_GALGEN"			;//Po prostu zejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_4_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nadbrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_4_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_4_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_4_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_4_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_4_Addon_WrongArmor";				//Ubierz siê porz¹dnie, to porozmawiamy.
	ADDON_WRONGARMOR_SLD		= "SVM_4_ADDON_WRONGARMOR_SLD";			//Za³ó¿ swój cholerny pancerz, jeœli chcesz ze mn¹ rozmawiaæ!
	ADDON_WRONGARMOR_MIL		= "SVM_4_ADDON_WRONGARMOR_MIL";			//Nie dosta³eœ jednego z naszych pancerzy? No to sobie taki za³atw.
	ADDON_WRONGARMOR_KDF		= "SVM_4_ADDON_WRONGARMOR_KDF";			//Sk¹d ty siê wzi¹³eœ? Przebierz siê, wtedy pogadamy.
	ADDON_NOARMOR_BDT			= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//Biedaków nam nie trzeba. Wróæ, jak bêdzie ciê staæ na pancerz.

	ADDON_DIEBANDIT				= "SVM_4_ADDON_DIEBANDIT";				//Jeszcze jeden bandyta!
	ADDON_DIRTYPIRATE			= "SVM_4_ADDON_DIRTYPIRATE";			//Ty zawszony piracie!
};

instance SVM_5 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_5_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_5_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_5_Weather"						;//Ale beznadziejna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_5_IGetYouStill"				;//A jednak ciê mam!
	DieEnemy					=	"SVM_5_DieEnemy"					;//Teraz ciê za³atwiê!
	DieMonster					=	"SVM_5_DieMonster"					;//Znowu jedna z tych przeklêtych bestii!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Czekaj tylko, parszywy z³odzieju!
	HandsOff					=	"SVM_5_HandsOff"					;//£apy precz!
	SheepKiller					=	"SVM_5_SheepKiller"					;//Ten bydlak szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_5_SheepKillerMonster"			;//Ta przeklêta bestia z¿era nasze owce!
	YouMurderer					=	"SVM_5_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_5_DieStupidBeast"				;//¯adne stwory nie maj¹ tu prawa wstêpu!
	YouDareHitMe				=	"SVM_5_YouDareHitMe"				;//No, teraz ci siê dostanie, bydlaku!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_5_ThenIBeatYouOutOfHere"		;//Bêdê ciê wiêc musia³ wyrzuciæ si³¹!
	WhatDidYouDoInThere			=	"SVM_5_WhatDidYouDoInThere"			;//Czego TY tam szuka³eœ?
	WillYouStopFighting			=	"SVM_5_WillYouStopFighting"			;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_5_KillEnemy"					;//Giñ, gnido!
	EnemyKilled					=	"SVM_5_EnemyKilled"					;//Ju¿ po tobie, œmieciu.
	MonsterKilled				=	"SVM_5_MonsterKilled"				;//Jedna cholerna bestia mniej!
	ThiefDown					=	"SVM_5_ThiefDown"					;//Nie próbuj nigdy wiêcej mnie okradaæ!
	rumfummlerDown				=	"SVM_5_rumfummlerDown"				;//Na przysz³oœæ trzymaj ³apy z dala od nieswoich rzeczy!
	SheepAttackerDown			=	"SVM_5_SheepAttackerDown"			;//Nigdy wiêcej tego nie rób! To s¹ nasze owce!
	KillMurderer				=	"SVM_5_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_5_StupidBeastKilled"			;//G³upia bestia!
	NeverHitMeAgain				=	"SVM_5_NeverHitMeAgain"				;//Nigdy wiêcej nie próbuj siê ze mn¹ mierzyæ!
	YouBetterShouldHaveListened	=	"SVM_5_YouBetterShouldHaveListened"	;//Trzeba by³o mnie pos³uchaæ!
	GetUpAndBeGone				=	"SVM_5_GetUpAndBeGone"				;//A teraz zabieraj siê st¹d!
	NeverEnterRoomAgain			=	"SVM_5_NeverEnterRoomAgain"			;//I ¿ebym ciê ju¿ nigdy wiêcej tam nie przy³apa³!
	ThereIsNoFightingHere		=	"SVM_5_ThereIsNoFightingHere"		;//Tutaj siê nie walczy, jasne?! Niech to bêdzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_5_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_5_RunAway"						;//Cholera! Trzeba uciekaæ!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_5_Alarm"						;//ALARM!
	Guards						=	"SVM_5_Guards"						;//STRA¯!
	Help						=	"SVM_5_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_5_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_5_GoodKill"					;//Dobrze, za³atw drania!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_5_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_5_RunCoward"					;//Stój, œmieciu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Wynoœ siê!
	WhyAreYouInHere				=	"SVM_5_WhyAreYouInHere"				;//Czego tu szukasz?! OdejdŸ!
	YesGoOutOfHere				= 	"SVM_5_YesGoOutOfHere"				;//No, zabieraj siê st¹d!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Ej ty! Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Cholera, co siê dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_5_ITookYourGold"				;//Z³oto! Teraz nale¿y do mnie...
	ShitNoGold					=	"SVM_5_ShitNoGold"					;//Nie masz nawet z³ota?
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Wezmê twoj¹ broñ na przechowanie...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hej, uwa¿aj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Jeszcze ci ma³o?!
	StopMagic					=	"SVM_5_StopMagic"					;//Trzymaj siê z dala ode mnie z t¹ twoj¹ magi¹!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Skoñcz z t¹ magi¹! Masz problem ze s³uchem?!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//G³uchy jesteœ? Od³ó¿ wreszcie tê broñ!
	WiseMove					=	"SVM_5_WiseMove"					;//Widzisz, to nie by³o takie trudne!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_5_NextTimeYoureInForIt"		;//Jeszcze raz, a siê doigrasz...
	OhMyHead					=	"SVM_5_OhMyHead"					;//Och, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_5_TheresAFight"				;//Wreszcie coœ siê dzieje...
	OhMyGodItsAFight			=	"SVM_5_OhMyGodItsAFight"			;//Porozwalaj¹ sobie ³by...
	GoodVictory					=	"SVM_5_GoodVictory"					;//Zas³u¿y³ sobie na to!
	NotBad						= 	"SVM_5_NotBad"						;//NieŸle...
	OhMyGodHesDown				=	"SVM_5_OhMyGodHesDown"				;//Ale brutal...
	CheerFriend01				=	"SVM_5_CheerFriend01"				;//Tak, dobrze tak!
	CheerFriend02				=	"SVM_5_CheerFriend02"				;//No, dalej!
	CheerFriend03				=	"SVM_5_CheerFriend03"				;//Mocniej, mocniej!
	Ooh01						=	"SVM_5_Ooh01"						;//Nie pozwalaj na to!
	Ooh02						=	"SVM_5_Ooh02"						;//Poka¿, kto tu rz¹dzi!
	Ooh03						=	"SVM_5_Ooh03"						;//To przecie¿ niemo¿liwe!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_5_WhatWasThat"					;//Co to by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_5_GetOutOfMyBed"					;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_5_Awake"							;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_5_ABS_COMMANDER"					;//Mówi¹, ¿e by³eœ u kapitana i za³atwi³eœ ca³¹ sprawê.
	ABS_MONASTERY				= "SVM_5_ABS_MONASTERY"					;//Ponoæ by³eœ u Ojca Parlana i wyspowiada³eœ siê ze swych grzechów?
	ABS_FARM					= "SVM_5_ABS_FARM"						;//By³eœ zatem u Lee i wyjaœni³eœ sprawê.
	ABS_GOOD					= "SVM_5_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_5_SHEEPKILLER_CRIME"				;//Tak po prostu szlachtowaæ nasze owce! Zabieraj siê st¹d!
	ATTACK_CRIME				= "SVM_5_ATTACK_CRIME"					;//Nie rozmawiam z takimi opryszkami jak ty!
	THEFT_CRIME					= "SVM_5_THEFT_CRIME"					;//ZejdŸ mi z oczu, parszywy z³odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_5_PAL_CITY_CRIME"				;//Hañbisz dobre imiê swojego zakonu! Lord Hagen bêdzie wœciek³y!
	MIL_CITY_CRIME				= "SVM_5_MIL_CITY_CRIME"				;//Jesteœ hañb¹ dla stra¿y miejskiej! Lord Andre teraz ci poka¿e!
	CITY_CRIME					= "SVM_5_CITY_CRIME"					;//Lord Andre dowie siê o twoim czynie!
	// -------------------------
	MONA_CRIME					= "SVM_5_MONA_CRIME"					;//Ojciec Parlan bêdzie niepocieszony!
	FARM_CRIME					= "SVM_5_FARM_CRIME"					;//Lee siê z tob¹ rozprawi! Zobaczysz, czy by³o warto!
	OC_CRIME					= "SVM_5_OC_CRIME"						;//Kapitan Garond ciê z tego rozliczy!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_5_TOUGHGUY_ATTACKLOST"			;//No ju¿ dobrze, wygra³eœ. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_5_TOUGHGUY_ATTACKWON"			;//Mam ci jeszcze raz pokazaæ, kto tu rz¹dzi?
	TOUGHGUY_PLAYERATTACK		= "SVM_5_TOUGHGUY_PLAYERATTACK"			;//Chcesz siê jeszcze raz ze mn¹ spróbowaæ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_5_GOLD_1000"						;//1000 sztuk z³ota.
	GOLD_950					= "SVM_5_GOLD_950"						;//950 sztuk z³ota.
	GOLD_900					= "SVM_5_GOLD_900"						;//900 sztuk z³ota.
	GOLD_850					= "SVM_5_GOLD_850"						;//850 sztuk z³ota.
	GOLD_800					= "SVM_5_GOLD_800"						;//800 sztuk z³ota.
	GOLD_750					= "SVM_5_GOLD_750"						;//750 sztuk z³ota.
	GOLD_700					= "SVM_5_GOLD_700"						;//700 sztuk z³ota.
	GOLD_650					= "SVM_5_GOLD_650"						;//650 sztuk z³ota.
	GOLD_600					= "SVM_5_GOLD_600"						;//600 sztuk z³ota.
	GOLD_550					= "SVM_5_GOLD_550"						;//550 sztuk z³ota.
	GOLD_500					= "SVM_5_GOLD_500"						;//500 sztuk z³ota.
	GOLD_450					= "SVM_5_GOLD_450"						;//450 sztuk z³ota.
	GOLD_400					= "SVM_5_GOLD_400"						;//400 sztuk z³ota.
	GOLD_350					= "SVM_5_GOLD_350"						;//350 sztuk z³ota.
	GOLD_300					= "SVM_5_GOLD_300"						;//300 sztuk z³ota.
	GOLD_250					= "SVM_5_GOLD_250"						;//250 sztuk z³ota.
	GOLD_200					= "SVM_5_GOLD_200"						;//200 sztuk z³ota.
	GOLD_150					= "SVM_5_GOLD_150"						;//150 sztuk z³ota.
	GOLD_100					= "SVM_5_GOLD_100"						;//100 sztuk z³ota.
	GOLD_90						= "SVM_5_GOLD_90"						;//90 sztuk z³ota.
	GOLD_80						= "SVM_5_GOLD_80"						;//80 sztuk z³ota.
	GOLD_70						= "SVM_5_GOLD_70"						;//70 sztuk z³ota.
	GOLD_60						= "SVM_5_GOLD_60"						;//60 sztuk z³ota.
	GOLD_50						= "SVM_5_GOLD_50"						;//50 sztuk z³ota.
	GOLD_40						= "SVM_5_GOLD_40"						;//40 sztuk z³ota.
	GOLD_30						= "SVM_5_GOLD_30"						;//30 sztuk z³ota.
	GOLD_20						= "SVM_5_GOLD_20"						;//20 sztuk z³ota.
	GOLD_10						= "SVM_5_GOLD_10"						;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_5_Smalltalk01"					;//...naprawdê s¹dzisz...
	Smalltalk02					= "SVM_5_Smalltalk02"					;//...wszystko jest mo¿liwe...
	Smalltalk03					= "SVM_5_Smalltalk03"					;//...powinien byæ m¹drzejszy...
	Smalltalk04					= "SVM_5_Smalltalk04"					;//...jakby by³o ma³o problemów...
	Smalltalk05					= "SVM_5_Smalltalk05"					;//...kto ci to powiedzia³...
	Smalltalk06					= "SVM_5_Smalltalk06"					;//...z tego bêdzie jeszcze wiêcej k³opotów...
	Smalltalk07					= "SVM_5_Smalltalk07"					;//...ludzie gadaj¹ o tym i o tamtym...
	Smalltalk08					= "SVM_5_Smalltalk08"					;//...lepiej tego nie robiæ...
	Smalltalk09					= "SVM_5_Smalltalk09"					;//...to wszystko tylko plotki...
	Smalltalk10					= "SVM_5_Smalltalk10"					;//...trzeba uwa¿aæ, co siê komu mówi...
	Smalltalk11					= "SVM_5_Smalltalk11"					;//...trzeba by³o mnie spytaæ wczeœniej...
	Smalltalk12					= "SVM_5_Smalltalk12"					;//...mnie i tak nikt nie pyta...
	Smalltalk13					= "SVM_5_Smalltalk13"					;//...¿al mi tego biedaka...
	Smalltalk14					= "SVM_5_Smalltalk14"					;//...to przecie¿ nic nowego...
	Smalltalk15					= "SVM_5_Smalltalk15"					;//...to przecie¿ oczywiste...
	Smalltalk16					= "SVM_5_Smalltalk16"					;//...mnie nie musisz o to pytaæ...
	Smalltalk17					= "SVM_5_Smalltalk17"					;//...tak dalej byæ nie mo¿e...
	Smalltalk18					= "SVM_5_Smalltalk18"					;//...moje zdanie ju¿ znasz...
	Smalltalk19					= "SVM_5_Smalltalk19"					;//...moja reakcja by³a taka sama...
	Smalltalk20					= "SVM_5_Smalltalk20"					;//...nic siê w tej sprawie nie zmieni...
	Smalltalk21					= "SVM_5_Smalltalk21"					;//...czemu dowiadujê siê o tym dopiero teraz...
	Smalltalk22					= "SVM_5_Smalltalk22"					;//...poczekajmy, co z tego wyniknie...
	Smalltalk23					= "SVM_5_Smalltalk23"					;//...niektóre problemy same siê rozwi¹zuj¹...
	Smalltalk24					= "SVM_5_Smalltalk24"					;//...ju¿ nie mogê tego s³uchaæ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_5_Smalltalk25"					;//...by³ w sztok pijany...
	Smalltalk26					= "SVM_5_Smalltalk26"					;//...nie pozwolê, ¿eby mnie tak traktowano...
	Smalltalk27					= "SVM_5_Smalltalk27"					;//...wszyscy uciekali jak zaj¹ce, by³em zupe³nie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_5_Smalltalk28"					;//...tak jest napisane w œwiêtych pismach...
	Smalltalk29					= "SVM_5_Smalltalk29"					;//...dzia³am w imieniu Innosa...
	Smalltalk30					= "SVM_5_Smalltalk30"					;//...nie wolno naruszaæ boskiego porz¹dku...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_5_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_5_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_5_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_5_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_5_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_5_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_5_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_5_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_5_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_5_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_5_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_5_WHERETO"					;//Dok¹d siê wybierasz?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_5_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_5_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_5_UNTERSTADT_2_TEMPEL"		;//IdŸ od kowala przejœciem, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_5_UNTERSTADT_2_HAFEN"		;//IdŸ od kowala w dó³ ulic¹ portow¹, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_5_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_5_TEMPEL_2_MARKT"			;//Kiedy znajdziesz siê przed œwi¹tyni¹, pójdŸ w lewo i potem wzd³u¿ murów, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_5_TEMPEL_2_GALGEN"			;//Id¹c od strony œwi¹tyni, mijasz knajpê po lewej i dochodzisz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_5_MARKT_2_TEMPEL"			;//Je¿eli id¹c od strony targowiska, bêdziesz szed³ wzd³u¿ murów miejskich, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_5_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. WejdŸ po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_5_MARKT_2_GALGEN"			;//IdŸ wzd³u¿ koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_5_GALGEN_2_TEMPEL"			;//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_5_GALGEN_2_MARKT"			;//IdŸ wzd³u¿ koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_5_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejœæ po schodach.
	KASERNE_2_MARKT				= "SVM_5_KASERNE_2_MARKT"			;//ZejdŸ po schodach na lewo od g³ównego wejœcia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_5_KASERNE_2_GALGEN"			;//ZejdŸ po schodach na prawo od g³ównego wejœcia, to dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_5_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_5_Dead"						;//Aaaarhhhh!
	Aargh_1						= "SVM_5_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_5_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_5_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_5_Addon_WrongArmor";				//Ubierz siê porz¹dnie.
	ADDON_WRONGARMOR_SLD		= "SVM_5_ADDON_WRONGARMOR_SLD";			//W czym ty chodzisz? Nie jesteœ ju¿ jednym z nas? Nie chcê mieæ z tob¹ nic do czynienia.
	ADDON_WRONGARMOR_MIL		= "SVM_5_ADDON_WRONGARMOR_MIL";			//My - ¿o³nierze - walczymy za króla, dlatego nosimy jego pancerze!
	ADDON_WRONGARMOR_KDF		= "SVM_5_ADDON_WRONGARMOR_KDF";			//Po co Zakon da³ ci ubranie, jeœli nie do noszenia? Pomyœl trochê.
	ADDON_NOARMOR_BDT			= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//Kim ty w ogóle jesteœ? Nie masz nawet pancerza. OdejdŸ!

	ADDON_DIEBANDIT				= "SVM_5_ADDON_DIEBANDIT";				//A, bandyta!
	ADDON_DIRTYPIRATE			= "SVM_5_ADDON_DIRTYPIRATE";			//Zaraz ciê za³atwiê, piracie!
};


instance SVM_6 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_6_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_6_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_6_Weather"					;//Pieska pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_6_IGetYouStill"				;//Teraz ciê dorwê!
	DieEnemy					=	"SVM_6_DieEnemy"					;//Nie powinieneœ tu przychodziæ!
	DieMonster					=	"SVM_6_DieMonster"					;//No chodŸ!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Z³odziej! Czekaj no...
	HandsOff					=	"SVM_6_HandsOff"					;//Zabieraj ³apy!
	SheepKiller					=	"SVM_6_SheepKiller"				;//Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_6_SheepKillerMonster"			;//OdejdŸ od naszych owiec, bestio!
	YouMurderer					=	"SVM_6_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_6_DieStupidBeast"				;//¯adna bestia tu nie wejdzie!
	YouDareHitMe				=	"SVM_6_YouDareHitMe"				;//Po¿a³ujesz tego!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Ostrzega³em ciê...
	ThenIBeatYouOutOfHere		=	"SVM_6_ThenIBeatYouOutOfHere"		;//Hej, WYNOŒ SIÊ!
	WhatDidYouDoInThere			=	"SVM_6_WhatDidYouDoInThere"		;//Hej! Czego tam szuka³eœ?
	WillYouStopFighting			=	"SVM_6_WillYouStopFighting"		;//Przestaæ! Natychmiast!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_6_KillEnemy"					;//Teraz ciê wypatroszê!
	EnemyKilled					=	"SVM_6_EnemyKilled"				;//Tyle na ten temat...
	MonsterKilled				=	"SVM_6_MonsterKilled"				;//Hej! Ci¹gle to potrafiê!
	ThiefDown					=	"SVM_6_ThiefDown"					;//Ostrzegam ciê! Nie próbuj tego ponownie, ty przeklêty z³odzieju!
	rumfummlerDown				=	"SVM_6_rumfummlerDown"				;//Trzymaj ³apy z dala od cudzej w³asnoœci!
	SheepAttackerDown			=	"SVM_6_SheepAttackerDown"			;//I trzymaj siê na przysz³oœæ z dala od naszych owiec!
	KillMurderer				=	"SVM_6_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_6_StupidBeastKilled"			;//G³upia bestia!
	NeverHitMeAgain				=	"SVM_6_NeverHitMeAgain"				;//Nie wa¿ siê nigdy wiêcej mnie atakowaæ!
	YouBetterShouldHaveListened	=	"SVM_6_YouBetterShouldHaveListened"	;//Ostrzega³em ciê...
	GetUpAndBeGone				=	"SVM_6_GetUpAndBeGone"					;//A teraz zabieraj siê st¹d!
	NeverEnterRoomAgain			=	"SVM_6_NeverEnterRoomAgain"			;//Nie chcê ciê ju¿ tam wiêcej widzieæ, jasne?
	ThereIsNoFightingHere		=	"SVM_6_ThereIsNoFightingHere"			;//Tu siê nie walczy, niech to bêdzie dla ciebie nauczka.
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_6_SpareMe"						;//Nie rób g³upstw!
	RunAway						= 	"SVM_6_RunAway"						;//Zmywam siê st¹d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_6_Alarm"					;//ALARM!
	Guards						=	"SVM_6_Guards"					;//STRA¯!
	Help						=	"SVM_6_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_6_GoodMonsterKill"		;//Daj im wycisk!
	GoodKill					= 	"SVM_6_GoodKill"				;//No, poka¿ draniowi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_6_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_6_RunCoward"				;//Jeszcze ciê dorwê!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_6_GetOutOfHere"			;//Wynoœ siê st¹d!
	WhyAreYouInHere				=	"SVM_6_WhyAreYouInHere"		;//Nie masz tu czego szukaæ!
	YesGoOutOfHere				= 	"SVM_6_YesGoOutOfHere"			;//No, wynoœ siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"	;//Co to ma byæ? Co ty tutaj robisz?
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"	;//Cholera, czego chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_6_ITookYourGold"			;//No, przynajmniej masz jakieœ z³oto...
	ShitNoGold					=	"SVM_6_ShitNoGold"				;//Eeee... Nawet z³ota nie ma...
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"		;//Zajmê siê twoj¹ broni¹...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"		;//Nie próbuj tego ponownie, ch³opcze!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"	;//Znowu szukasz guza?
	StopMagic					=	"SVM_6_StopMagic"				;//Przestañ z t¹ magi¹!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"			;//Ostatnie ostrze¿enie! Skoñcz z tym czarowaniem!
	WeaponDown					=	"SVM_6_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"		;//Od³ó¿ to albo ci przy³o¿ê!
	WiseMove					=	"SVM_6_WiseMove"				;//Nie jesteœ wcale taki g³upi, na jakiego wygl¹dasz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_6_NextTimeYoureInForIt"	;//Nie próbuj tego ponownie...
	OhMyHead					=	"SVM_6_OhMyHead"				;//Och, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_6_TheresAFight"			;//Teraz bêdzie zabawnie...
	OhMyGodItsAFight			=	"SVM_6_OhMyGodItsAFight"		;//O bogowie...
	GoodVictory					=	"SVM_6_GoodVictory"			;//To bêdzie dla niego nauczka...
	NotBad						= 	"SVM_6_NotBad"					;//HA! To by³o niez³e!
	OhMyGodHesDown				=	"SVM_6_OhMyGodHesDown"			;//Brutalny drañ!
	CheerFriend01				=	"SVM_6_CheerFriend01"			;//Wal!
	CheerFriend02				=	"SVM_6_CheerFriend02"			;//Nie przestawaj!
	CheerFriend03				=	"SVM_6_CheerFriend03"			;//Za³atw go!
	Ooh01						=	"SVM_6_Ooh01"					;//Uwa¿aj!
	Ooh02						=	"SVM_6_Ooh02"					;//Paruj!
	Ooh03						=	"SVM_6_Ooh03"					;//Cholera, to bola³o!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_6_WhatWasThat"				;//Co ty tutaj robisz?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_6_GetOutOfMyBed"			;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_6_Awake"					;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_6_ABS_COMMANDER"    ;//Kapitan wyjaœni³ wiêc z tob¹ ca³¹ sprawê.
	ABS_MONASTERY    = "SVM_6_ABS_MONASTERY"    ;//Ojciec Parlan uwolni³ ciê od twoich grzechów.
	ABS_FARM       = "SVM_6_ABS_FARM"        ;//By³eœ zatem u Lee i wyjaœni³eœ sprawê.
	ABS_GOOD       = "SVM_6_ABS_GOOD"       ;//Dobrze.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_6_SHEEPKILLER_CRIME"   ;//Atakujesz owce? Bardziej bezbronnej ofiary nie mog³eœ sobie pewnie znaleŸæ?!
	ATTACK_CRIME     = "SVM_6_ATTACK_CRIME"    ;//Z takimi jak ty nie chcê mieæ nic wspólnego!
	THEFT_CRIME      = "SVM_6_THEFT_CRIME"    ;//Ze z³odziejami nie chcê mieæ nic wspólnego!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_6_PAL_CITY_CRIME"   ;//I ty chcesz byæ paladynem? Ciekawe, co na to Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_6_MIL_CITY_CRIME"   ;//Naprawdê nale¿ysz do stra¿y miejskiej? Lordowi Andre siê to nie spodoba!
 	CITY_CRIME       = "SVM_6_CITY_CRIME"    ;//IdŸ do Lorda Andre, póki jeszcze mo¿esz.
 	// -------------------------
	MONA_CRIME       = "SVM_6_MONA_CRIME"    ;//IdŸ do Ojca Parlana. Otrzymasz od niego pokutê!
	FARM_CRIME       = "SVM_6_FARM_CRIME"    ;//Lee siê o tym dowie... Zap³acisz za to!
	OC_CRIME       = "SVM_6_OC_CRIME"     ;//Kapitanowi Garondowi wcale to siê nie spodoba. Porozmawiaj z nim, póki jeszcze mo¿esz!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_6_TOUGHGUY_ATTACKLOST"		;//Dobrze - wygra³eœ. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_6_TOUGHGUY_ATTACKWON"		;//S¹dzê, ¿e wiesz ju¿, kogo masz przed sob¹. Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_6_TOUGHGUY_PLAYERATTACK"	;//Znowu ty? Chcesz siê znowu ze mn¹ zmierzyæ czy jak?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_6_GOLD_1000"				;//1000 sztuk z³ota.
	GOLD_950					= "SVM_6_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_6_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_6_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_6_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_6_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_6_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_6_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_6_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_6_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_6_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_6_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_6_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_6_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_6_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_6_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_6_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_6_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_6_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_6_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_6_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_6_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_6_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_6_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_6_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_6_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_6_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_6_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_6_Smalltalk01"				;//...trudno mi w to uwierzyæ...
	Smalltalk02					= "SVM_6_Smalltalk02"				;//...trudno byæ tego pewnym...
	Smalltalk03					= "SVM_6_Smalltalk03"				;//...przecie¿ wiedzia³ o tym wczeœniej...
	Smalltalk04					= "SVM_6_Smalltalk04"				;//...nie wiem ju¿, w co wierzyæ...
	Smalltalk05					= "SVM_6_Smalltalk05"				;//...nie wiem, czym on siê tak denerwuje...
	Smalltalk06					= "SVM_6_Smalltalk06"				;//...nie trzeba mi wiêcej k³opotów...
	Smalltalk07					= "SVM_6_Smalltalk07"				;//...mówi¹ to i owo...
	Smalltalk08					= "SVM_6_Smalltalk08"				;//...bêdê siê lepiej trzymaæ od tego z daleka...
	Smalltalk09					= "SVM_6_Smalltalk09"				;//...nie mo¿na wierzyæ we wszystko, co siê s³yszy...
	Smalltalk10					= "SVM_6_Smalltalk10"				;//...ode mnie tego nie dosta³...
	Smalltalk11					= "SVM_6_Smalltalk11"				;//...przysz³o mi to do g³owy...
	Smalltalk12					= "SVM_6_Smalltalk12"				;//...moje zdanie i tak nikogo nie obchodzi...
	Smalltalk13					= "SVM_6_Smalltalk13"				;//...nie zas³u¿y³ sobie na to...
	Smalltalk14					= "SVM_6_Smalltalk14"				;//...nie mów, ¿e o tym nie wiesz...
	Smalltalk15					= "SVM_6_Smalltalk15"				;//...to by³o oczywiste...
	Smalltalk16					= "SVM_6_Smalltalk16"				;//...sk¹d ty to znowu masz...
	Smalltalk17					= "SVM_6_Smalltalk17"				;//...nie mo¿e tak dalej byæ...
	Smalltalk18					= "SVM_6_Smalltalk18"				;//...mam swoje zdanie na ten temat...
	Smalltalk19					= "SVM_6_Smalltalk19"				;//...by³o dok³adnie tak, jak mówisz...
	Smalltalk20					= "SVM_6_Smalltalk20"				;//...nie s¹dzê, ¿eby coœ siê zmieni³o...
	Smalltalk21					= "SVM_6_Smalltalk21"				;//...s³yszê o tym po raz pierwszy...
	Smalltalk22					= "SVM_6_Smalltalk22"				;//...mo¿emy jedynie przeczekaæ...
	Smalltalk23					= "SVM_6_Smalltalk23"				;//...musia³y pojawiæ siê problemy...
	Smalltalk24					= "SVM_6_Smalltalk24"				;//...czemu nikt mnie nie s³ucha...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_6_Smalltalk25"				;//...ucieka³, jakby goni³ go sam Beliar...
	Smalltalk26					= "SVM_6_Smalltalk26"				;//...w koñcu i tak go oczywiœcie dorwaliœmy...
	Smalltalk27					= "SVM_6_Smalltalk27"				;//...trzeba silnie uderzyæ w sam œrodek...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_6_Smalltalk28"				;//...niektórzy nie zdaj¹ sobie w ogóle sprawy ze swoich grzechów...
	Smalltalk29					= "SVM_6_Smalltalk29"				;//...taka jest bowiem wola Innosa...
	Smalltalk30					= "SVM_6_Smalltalk30"				;//...jego czyny by³y sprawiedliwe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_6_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_6_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_6_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_6_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_6_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_6_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_6_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_6_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_6_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_6_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_6_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_6_WHERETO"					;//Dok¹d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_6_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_6_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_6_UNTERSTADT_2_TEMPEL"		;//IdŸ od kowala przejœciem, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_6_UNTERSTADT_2_HAFEN"		;//IdŸ od kowala w dó³ ulic¹ portow¹, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_6_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_6_TEMPEL_2_MARKT"			;//Kiedy znajdziesz siê przed œwi¹tyni¹, pójdŸ w lewo i potem wzd³u¿ murów, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_6_TEMPEL_2_GALGEN"			;//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_6_MARKT_2_TEMPEL"			;//Je¿eli id¹c od strony targowiska, bêdziesz szed³ wzd³u¿ murów miejskich, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_6_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. WejdŸ po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_6_MARKT_2_GALGEN"			;//IdŸ po prostu wzd³u¿ koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_6_GALGEN_2_TEMPEL"			;//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_6_GALGEN_2_MARKT"			;//IdŸ wzd³u¿ koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_6_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejœæ po schodach.
	KASERNE_2_MARKT				= "SVM_6_KASERNE_2_MARKT"			;//ZejdŸ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_6_KASERNE_2_GALGEN"			;//ZejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_6_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nadbrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_6_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_6_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_6_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_6_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_6_Addon_WrongArmor";				//W tych ³achmanach wygl¹dasz jak idiota. Ubierz siê!
	ADDON_WRONGARMOR_SLD		= "SVM_6_ADDON_WRONGARMOR_SLD";			//Myœlisz, ¿e ciê nie poznajê? Zje¿d¿aj i ubierz siê odpowiednio!
	ADDON_WRONGARMOR_MIL		= "SVM_6_ADDON_WRONGARMOR_MIL";			//¯o³nierzu! Co to za strój?! Natychmiast siê przebierz!
	ADDON_WRONGARMOR_KDF		= "SVM_6_ADDON_WRONGARMOR_KDF";			//S³uga Innosa nie ukrywa siê! IdŸ po swoj¹ togê.
	ADDON_NOARMOR_BDT			= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//£azisz jak jakiœ kopacz. Ubierz siê!

	ADDON_DIEBANDIT				= "SVM_6_ADDON_DIEBANDIT";				//Napad³eœ niew³aœciwego cz³owieka, BANDYTO!
	ADDON_DIRTYPIRATE			= "SVM_6_ADDON_DIRTYPIRATE";			//Wynoœ siê na morze, PIRACIE!
};

instance SVM_7 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_7_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_7_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_7_Weather"						;//Kiepska pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_7_IGetYouStill"				;//Znowu TY?!
	DieEnemy					=	"SVM_7_DieEnemy"					;//Rozerwê ciê na kawa³ki!
	DieMonster					=	"SVM_7_DieMonster"					;//Znowu jedno z tych przeklêtych stworzeñ!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty ma³y, nêdzny z³odzieju!
	HandsOff					=	"SVM_7_HandsOff"					;//Trzymaj ³apy z daleka!
	SheepKiller					=	"SVM_7_SheepKiller"					;//Hej! Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_7_SheepKillerMonster"			;//Ten potwór z¿era nasze owce!
	YouMurderer					=	"SVM_7_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_7_DieStupidBeast"				;//A TA bestia co tu robi?
	YouDareHitMe				=	"SVM_7_YouDareHitMe"				;//Teraz mnie wkurzy³eœ!
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_7_ThenIBeatYouOutOfHere"		;//Kto nie chce s³uchaæ, musi poczuæ...
	WhatDidYouDoInThere			=	"SVM_7_WhatDidYouDoInThere"			;//Co tam robi³eœ, co?!
	WillYouStopFighting			=	"SVM_7_WillYouStopFighting"			;//Przestaniecie z tym?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_7_KillEnemy"					;//Giñ!
	EnemyKilled					=	"SVM_7_EnemyKilled"					;//G³upi dureñ...
	MonsterKilled				=	"SVM_7_MonsterKilled"				;//Tyle na ten temat...
	ThiefDown					=	"SVM_7_ThiefDown"					;//Trzymaj na przysz³oœæ ³apy z dala od moich rzeczy, zrozumiano?!
	rumfummlerDown				=	"SVM_7_rumfummlerDown"				;//Trzymaj ³apy przy sobie!
	SheepAttackerDown			=	"SVM_7_SheepAttackerDown"			;//Trzymaj ³apska z dala od naszych owiec!
	KillMurderer				=	"SVM_7_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_7_StupidBeastKilled"			;//G³upia bestia!
	NeverHitMeAgain				=	"SVM_7_NeverHitMeAgain"				;//Nie próbuj tego ponownie, brachu!
	YouBetterShouldHaveListened	=	"SVM_7_YouBetterShouldHaveListened"	;//Niech to bêdzie dla ciebie nauczka.
	GetUpAndBeGone				=	"SVM_7_GetUpAndBeGone"				;//Wstawaj i zabieraj siê st¹d!
	NeverEnterRoomAgain			=	"SVM_7_NeverEnterRoomAgain"			;//Nie chcê ciê ju¿ tam wiêcej widzieæ, jasne?
	ThereIsNoFightingHere		=	"SVM_7_ThereIsNoFightingHere"		;//To ja tutaj rozdajê ciosy, zrozumiano?
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_7_SpareMe"						;//Po prostu zostaw mnie w spokoju!
	RunAway						= 	"SVM_7_RunAway"						;//Cholera! Wynoszê siê st¹d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_7_Alarm"					;//ALARM!
	Guards						=	"SVM_7_Guards"					;//STRA¯!
	Help						=	"SVM_7_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_7_GoodMonsterKill"			;//Tak trzeba z nimi postêpowaæ!
	GoodKill					= 	"SVM_7_GoodKill"				;//Dobrze, poka¿ œwini!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_7_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_7_RunCoward"				;//Jeszcze ciê dorwê!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_7_GetOutOfHere"			;//Wynoœ siê!
	WhyAreYouInHere				=	"SVM_7_WhyAreYouInHere"			;//Czego tu szukasz?!
	YesGoOutOfHere				= 	"SVM_7_YesGoOutOfHere"			;//No, wynocha!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"	;//Co ty tam robisz?
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"	;//Co jest?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_7_ITookYourGold"			;//Dziêki za z³oto, mój ty bohaterze!
	ShitNoGold					=	"SVM_7_ShitNoGold"				;//Ty frajerze, nawet z³ota nie masz!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"			;//Lepiej zaopiekujê siê twoj¹ broni¹...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"			;//Uwa¿aj! Nastêpnym razem ci przy³o¿ê.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"	;//Chcesz jeszcze raz dostaæ w mordê?
																	 
	StopMagic					=	"SVM_7_StopMagic"				;//Przestañ natychmiast z tym czarowaniem!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"			;//Chcesz dostaæ? Przestañ w tej chwili!
	WeaponDown					=	"SVM_7_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"			;//Od³o¿ysz wreszcie tê przeklêt¹ broñ?!
	WiseMove					=	"SVM_7_WiseMove"				;//M¹dra decyzja!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_7_NextTimeYoureInForIt"	;//Zobaczymy nastêpnym razem...
	OhMyHead					=	"SVM_7_OhMyHead"				;//Och, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_7_TheresAFight"			;//Ach, walka...
	OhMyGodItsAFight			=	"SVM_7_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_7_GoodVictory"				;//Pokaza³eœ mu, kto tu rz¹dzi!
	NotBad						= 	"SVM_7_NotBad"					;//Hmm. NieŸle...
	OhMyGodHesDown				=	"SVM_7_OhMyGodHesDown"			;//Bogowie! Jak ostro...
	CheerFriend01				=	"SVM_7_CheerFriend01"			;//No, do³ó¿ mu!
	CheerFriend02				=	"SVM_7_CheerFriend02"			;//Poka¿ mu!
	CheerFriend03				=	"SVM_7_CheerFriend03"			;//Niech ma, czego chcia³!
	Ooh01						=	"SVM_7_Ooh01"					;//Broñ siê!
	Ooh02						=	"SVM_7_Ooh02"					;//Nie daj siê!
	Ooh03						=	"SVM_7_Ooh03"					;//Oj! To musia³o boleæ!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_7_WhatWasThat"				;//Cholera, co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_7_GetOutOfMyBed"				;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_7_Awake"						;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_7_ABS_COMMANDER"    ;//Powiadaj¹, ¿e kapitan wyprostowa³ ca³¹ sprawê.
	ABS_MONASTERY    = "SVM_7_ABS_MONASTERY"    ;//Zatem wyspowiada³eœ siê Ojcu Parlanowi ze swoich grzechów.
	ABS_FARM       = "SVM_7_ABS_FARM"        ;//Mówi¹, ¿e Lee za³atwi³ dla ciebie ca³¹ sprawê.
	ABS_GOOD       = "SVM_7_ABS_GOOD"       ;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_7_SHEEPKILLER_CRIME"   ;//Szlachtowanie owiec to ju¿ szczyt szczytów! Wynoœ siê!
	ATTACK_CRIME     = "SVM_7_ATTACK_CRIME"    ;//Jesteœ jakimœ oprychem - lepiej st¹d odejdŸ!
 	THEFT_CRIME      = "SVM_7_THEFT_CRIME"    ;//Przeklêty z³odziej! Gardzê takimi jak ty!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_7_PAL_CITY_CRIME"   ;//Wydawa³o mi siê, ¿e od paladyna mo¿na spodziewaæ siê czegoœ wiêcej. Lord Hagen bêdzie niepocieszony.
 	MIL_CITY_CRIME     = "SVM_7_MIL_CITY_CRIME"   ;//Jak ty siê w ogóle dosta³eœ do stra¿y?! Odpowiesz za to przed Lordem Andre!
 	CITY_CRIME       = "SVM_7_CITY_CRIME"    ;//Lord Andre dowie siê o twoim zachowaniu!
	// -------------------------
	MONA_CRIME       = "SVM_7_MONA_CRIME"    ;//Ojciec Parlan bêdzie wœciek³y!
	FARM_CRIME       = "SVM_7_FARM_CRIME"    ;//Lee na pewno ci nie daruje!
	OC_CRIME       = "SVM_7_OC_CRIME"     ;//Kapitan Garond nie bêdzie zadowolony, kiedy o tym us³yszy! Zap³acisz za to!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_7_TOUGHGUY_ATTACKLOST"		;//Masz ca³kiem niez³y cios... Czego chcesz ode mnie?
	TOUGHGUY_ATTACKWON			= "SVM_7_TOUGHGUY_ATTACKWON"		;//Jeszcze jakieœ pytania?
	TOUGHGUY_PLAYERATTACK		= "SVM_7_TOUGHGUY_PLAYERATTACK"		;//To znowu ty!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_7_GOLD_1000"					;//1000 sztuk z³ota.
	GOLD_950					= "SVM_7_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_7_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_7_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_7_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_7_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_7_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_7_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_7_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_7_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_7_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_7_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_7_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_7_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_7_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_7_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_7_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_7_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_7_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_7_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_7_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_7_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_7_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_7_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_7_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_7_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_7_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_7_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_7_Smalltalk01"				;//...to rzeczywiœcie prawda...
	Smalltalk02					= "SVM_7_Smalltalk02"				;//...mnie mówili co innego...
	Smalltalk03					= "SVM_7_Smalltalk03"				;//...nie mów, ¿e o tym nie wiesz...
	Smalltalk04					= "SVM_7_Smalltalk04"				;//...nie wiadomo ju¿, komu mo¿na ufaæ...
	Smalltalk05					= "SVM_7_Smalltalk05"				;//...to tylko plotki...
	Smalltalk06					= "SVM_7_Smalltalk06"				;//...myœlisz, ¿e ja mam lepiej...
	Smalltalk07					= "SVM_7_Smalltalk07"				;//...nic mnie ju¿ nie dziwi...
	Smalltalk08					= "SVM_7_Smalltalk08"				;//...to naprawdê nie mój problem...
	Smalltalk09					= "SVM_7_Smalltalk09"				;//...naprawdê w to wierzysz...
	Smalltalk10					= "SVM_7_Smalltalk10"				;//...ode mnie nikt siê niczego nie dowie...
	Smalltalk11					= "SVM_7_Smalltalk11"				;//...to by³o oczywiste...
	Smalltalk12					= "SVM_7_Smalltalk12"				;//...pos³ucha³ niew³aœciwych ludzi...
	Smalltalk13					= "SVM_7_Smalltalk13"				;//...je¿eli on tego nie widzi, to przecie¿ nie mogê mu pomagaæ wbrew jego woli...
	Smalltalk14					= "SVM_7_Smalltalk14"				;//...nie mówiê ci przecie¿ nic nowego...
	Smalltalk15					= "SVM_7_Smalltalk15"				;//...sam by na to nie wpad³...
	Smalltalk16					= "SVM_7_Smalltalk16"				;//...to by³o wiadomo od dawna...
	Smalltalk17					= "SVM_7_Smalltalk17"				;//...kiepska sprawa...
	Smalltalk18					= "SVM_7_Smalltalk18"				;//...inaczej bym siê do tego zabra³...
	Smalltalk19					= "SVM_7_Smalltalk19"				;//...zupe³nie siê z tob¹ zgadzam...
	Smalltalk20					= "SVM_7_Smalltalk20"				;//...czy coœ siê w koñcu zmieni...
	Smalltalk21					= "SVM_7_Smalltalk21"				;//...nie dosz³o do mnie nic na ten temat...
	Smalltalk22					= "SVM_7_Smalltalk22"				;//...nic nie mogê na to poradziæ...
	Smalltalk23					= "SVM_7_Smalltalk23"				;//...to mnie wcale nie dziwi...
	Smalltalk24					= "SVM_7_Smalltalk24"				;//...nie, ale on oczywiœcie wie wszystko lepiej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                   
	Smalltalk25					= "SVM_7_Smalltalk25"				;//...i tak liczy siê tylko si³a, wiêc nie mów mi takich rzeczy...
	Smalltalk26					= "SVM_7_Smalltalk26"				;//...on nawet nie wie, jak siê trzyma miecz...
	Smalltalk27					= "SVM_7_Smalltalk27"				;//...tak, naprawdê tak powiedzia³...
	//ProInnos (NOV/KDF/PAL)                                                                                                                   
	Smalltalk28					= "SVM_7_Smalltalk28"				;//...ktoœ bêdzie musia³ za to zap³aciæ...
	Smalltalk29					= "SVM_7_Smalltalk29"				;//...Innos przyœwieca tym wszystkim, którzy potrafi¹ zg³êbiæ jego m¹droœæ...
	Smalltalk30					= "SVM_7_Smalltalk30"				;//...na koñcu i tak zwyciê¿y sprawiedliwoœæ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_7_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_7_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_7_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_7_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_7_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_7_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_7_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_7_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_7_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_7_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_7_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_7_WHERETO"					;//Gdzie chcesz siê dostaæ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_7_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_7_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_7_UNTERSTADT_2_TEMPEL"		;//IdŸ od strony kowala przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_7_UNTERSTADT_2_HAFEN"		;//IdŸ od strony kowala w dó³ ulic¹ portow¹, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_7_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_7_TEMPEL_2_MARKT"			;//Kiedy bêdziesz staæ przed œwi¹tyni¹, skrêæ w lewo i idŸ wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_7_TEMPEL_2_GALGEN"			;//Je¿eli id¹c od strony œwi¹tyni, miniesz knajpê po lewej, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_7_MARKT_2_TEMPEL"			;//Je¿eli pójdziesz wzd³u¿ murów miejskich od strony targowiska, to dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_7_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. WejdŸ po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_7_MARKT_2_GALGEN"			;//PrzejdŸ obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_7_GALGEN_2_TEMPEL"			;//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_7_GALGEN_2_MARKT"			;//PrzejdŸ obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_7_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Dostaniesz siê do niego po schodach.
	KASERNE_2_MARKT				= "SVM_7_KASERNE_2_MARKT"			;//ZejdŸ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_7_KASERNE_2_GALGEN"			;//ZejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_7_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nabrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnego miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_7_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_7_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_7_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_7_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_7_Addon_WrongArmor";				//Po co to przebranie? Nie bêdê rozmawiaæ z kimœ, kto nosi coœ takiego.
	ADDON_WRONGARMOR_SLD		= "SVM_7_ADDON_WRONGARMOR_SLD";			//W czym ty chodzisz? Za³ó¿ pancerz!
	ADDON_WRONGARMOR_MIL		= "SVM_7_ADDON_WRONGARMOR_MIL";			//To pogwa³cenie zasad dotycz¹cych ubioru. Natychmiast siê przebierz!
	ADDON_WRONGARMOR_KDF		= "SVM_7_ADDON_WRONGARMOR_KDF";			//Lepiej za³ó¿ togê. Do tego czasu bêdê siê modliæ za ciebie w milczeniu.
	ADDON_NOARMOR_BDT			= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//Czego chcesz? Nie jesteœ jednym z nas. Nie nosisz nawet pancerza.

	ADDON_DIEBANDIT				= "SVM_7_ADDON_DIEBANDIT";				//Giñ, nikczemny bandyto!
	ADDON_DIRTYPIRATE			= "SVM_7_ADDON_DIRTYPIRATE";			//Giñ, ¿a³osny piracie!
};

instance SVM_8 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_8_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_8_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_8_Weather"					;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_8_IGetYouStill"				;//No, teraz to ciê dorwê!
	DieEnemy					=	"SVM_8_DieEnemy"					;//Wykoñczê ciê!
	DieMonster					=	"SVM_8_DieMonster"					;//Znowu jedno z tych przeklêtych stworzeñ!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Czekaj tylko, parszywy z³odzieju!
	HandsOff					=	"SVM_8_HandsOff"					;//£apy precz!
	SheepKiller					=	"SVM_8_SheepKiller"				;//Ten drañ szlachtuje nasze owce!
	SheepKillerMonster			=	"SVM_8_SheepKillerMonster"			;//Ta przeklêta bestia z¿era nasze owce!
	YouMurderer					=	"SVM_8_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_8_DieStupidBeast"				;//¯adne bestie nie maj¹ tu czego szukaæ!
	YouDareHitMe				=	"SVM_8_YouDareHitMe"				;//Teraz jestem naprawdê wkurzony!
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_8_ThenIBeatYouOutOfHere"		;//Nie chcesz iœæ? Dobrze!
	WhatDidYouDoInThere			=	"SVM_8_WhatDidYouDoInThere"		;//Czego tam szuka³eœ?
	WillYouStopFighting			=	"SVM_8_WillYouStopFighting"		;//Mo¿esz przestaæ!?
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_8_KillEnemy"					;//Giñ, bydlaku!
	EnemyKilled					=	"SVM_8_EnemyKilled"				;//Zas³u¿y³eœ sobie na to, bydlaku!
	MonsterKilled				=	"SVM_8_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_8_ThiefDown"					;//Nigdy wiêcej nie próbuj mnie okraœæ!
	rumfummlerDown				=	"SVM_8_rumfummlerDown"				;//Trzymaj siê na przysz³oœæ z dala od nieswoich rzeczy!
	SheepAttackerDown			=	"SVM_8_SheepAttackerDown"			;//Nigdy wiêcej tego nie rób! To s¹ nasze owce!
	KillMurderer				=	"SVM_8_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_8_StupidBeastKilled"			;//Co za g³upie bestie!
	NeverHitMeAgain				=	"SVM_8_NeverHitMeAgain"			;//Nigdy wiêcej nie próbuj siê ze mn¹ mierzyæ!
	YouBetterShouldHaveListened	=	"SVM_8_YouBetterShouldHaveListened";//Szkoda, ¿e mnie nie pos³ucha³eœ!
	GetUpAndBeGone				=	"SVM_8_GetUpAndBeGone"				;//A teraz znikaj st¹d!
	NeverEnterRoomAgain			=	"SVM_8_NeverEnterRoomAgain"		;//Lepiej, ¿ebym ciê ju¿ tam nigdy nie przy³apa³!
	ThereIsNoFightingHere		=	"SVM_8_ThereIsNoFightingHere"		;//Tutaj siê nie walczy, zrozumiano!? Niech to bêdzie dla ciebie nauczk¹!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_8_SpareMe"					;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_8_RunAway"					;//O cholera!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_8_Alarm"					;//ALARM!
	Guards						=	"SVM_8_Guards"					;//STRA¯!
	Help						=	"SVM_8_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_8_GoodMonsterKill"		;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_8_GoodKill"				;//No, wykoñcz œwiniê!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_8_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_8_RunCoward"				;//Tak, uciekaj! Najszybciej jak potrafisz!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_8_GetOutOfHere"			;//Wynoœ siê!
	WhyAreYouInHere				=	"SVM_8_WhyAreYouInHere"		;//Czego tu szukasz!? IdŸ sobie!
	YesGoOutOfHere				= 	"SVM_8_YesGoOutOfHere"			;//No, wynoœ siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"	;//Ej ty... Co ty tutaj robisz?
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"	;//Co siê tu u diab³a dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_8_ITookYourGold"			;//Dziêki za z³oto, mój ty bohaterze!
	ShitNoGold					=	"SVM_8_ShitNoGold"				;//Biedaku, nawet z³ota nie masz...
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"		;//Zaopiekujê siê twoj¹ broni¹...
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"		;//Uwa¿aj! Nastêpnym razem ci przy³o¿ê.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"	;//Ci¹gle ci za ma³o!?
	StopMagic					=	"SVM_8_StopMagic"				;//Przestañ z t¹ cholern¹ magi¹!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"			;//Szukasz k³opotów!? Przestañ natychmiast!
	WeaponDown					=	"SVM_8_WeaponDown"				;//Od³ó¿ tê broñ!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"		;//Od³ó¿ wreszcie tê przeklêt¹ broñ!
	WiseMove					=	"SVM_8_WiseMove"				;//Sprytnie!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_8_NextTimeYoureInForIt"	;//Proszê... Zobaczymy nastêpnym razem...
	OhMyHead					=	"SVM_8_OhMyHead"				;//O rany, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_8_TheresAFight"			;//Ach, walka...
	OhMyGodItsAFight			=	"SVM_8_OhMyGodItsAFight"		;//Na bogów, walka!
	GoodVictory					=	"SVM_8_GoodVictory"			;//Da³eœ mu niez³y wycisk...
	NotBad						= 	"SVM_8_NotBad"					;//NieŸle...
	OhMyGodHesDown				=	"SVM_8_OhMyGodHesDown"			;//Bogowie! Jak brutalnie...
	CheerFriend01				=	"SVM_8_CheerFriend01"			;//Uderz go!
	CheerFriend02				=	"SVM_8_CheerFriend02"			;//Daj z siebie wszystko!
	CheerFriend03				=	"SVM_8_CheerFriend03"			;//Poka¿ mu!
	Ooh01						=	"SVM_8_Ooh01"					;//Trzymaj siê!
	Ooh02						=	"SVM_8_Ooh02"					;//Uwaga!
	Ooh03						=	"SVM_8_Ooh03"					;//A³! Ten by³ celny...
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_8_WhatWasThat"				;//Co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_8_GetOutOfMyBed"			;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_8_Awake"					;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_8_ABS_COMMANDER"			;//By³eœ wiêc u kapitana i wyjaœni³eœ sprawê.
	ABS_MONASTERY				= "SVM_8_ABS_MONASTERY"			;//By³eœ zatem u Ojca Parlana i opowiedzia³eœ mu o swoich grzechach.
	ABS_FARM					= "SVM_8_ABS_FARM"					;//By³eœ zatem u Lee i doprowadzi³eœ wszystko do porz¹dku.
	ABS_GOOD					= "SVM_8_ABS_GOOD"					;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_8_SHEEPKILLER_CRIME"		;//Tak po prostu szlachtowaæ nasze owce!
	ATTACK_CRIME				= "SVM_8_ATTACK_CRIME"				;//Zostaw mnie w spokoju, draniu!
	THEFT_CRIME					= "SVM_8_THEFT_CRIME"				;//Zostaw mnie w spokoju, ty parszywy z³odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_8_PAL_CITY_CRIME"			;//Jesteœ zaka³¹ swojego zakonu! Poczekaj tylko, a¿ dowie siê o tym Lord Hagen!
	MIL_CITY_CRIME				= "SVM_8_MIL_CITY_CRIME"			;//Okrywasz hañb¹ ca³¹ stra¿ miejsk¹! Czekaj tylko, a¿ dowie siê o tym Lord Andre!
	CITY_CRIME					= "SVM_8_CITY_CRIME"				;//Poczekaj, a¿ dowie siê o tym Lord Andre.
	// -------------------------
	MONA_CRIME					= "SVM_8_MONA_CRIME"				;//Poczekaj tylko, a¿ us³yszy o tym Ojciec Parlan!
	FARM_CRIME					= "SVM_8_FARM_CRIME"				;//Poczekaj, a¿ Lee siê o tym dowie...
	OC_CRIME					= "SVM_8_OC_CRIME"					;//Poczekaj tylko, a¿ dowie siê o tym kapitan Garond!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_8_TOUGHGUY_ATTACKLOST"		;//Dobrze ju¿, dobrze, jesteœ lepszy ode mnie! Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_8_TOUGHGUY_ATTACKWON"		;//S¹dzê, ¿e wiesz ju¿, który z nas jest tym silniejszym... czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_8_TOUGHGUY_PLAYERATTACK"	;//Myœla³em, ¿e chcesz siê ze mn¹ spróbowaæ. Zmieni³eœ zdanie? Mo¿e wolisz ROZMAWIAÆ? Jasne.
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_8_GOLD_1000"				;//1000 sztuk z³ota.
	GOLD_950					= "SVM_8_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_8_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_8_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_8_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_8_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_8_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_8_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_8_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_8_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_8_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_8_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_8_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_8_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_8_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_8_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_8_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_8_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_8_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_8_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_8_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_8_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_8_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_8_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_8_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_8_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_8_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_8_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_8_Smalltalk01"				;//...to rzeczywiœcie prawda...
	Smalltalk02					= "SVM_8_Smalltalk02"				;//...mnie mówili co innego...
	Smalltalk03					= "SVM_8_Smalltalk03"				;//...tylko nie mów, ¿e o tym nie wiesz...
	Smalltalk04					= "SVM_8_Smalltalk04"				;//...nie wiadomo ju¿, komu mo¿na ufaæ...
	Smalltalk05					= "SVM_8_Smalltalk05"				;//...a tam, to tylko gadanie...
	Smalltalk06					= "SVM_8_Smalltalk06"				;//...no popatrz, ju¿ mi lepiej...
	Smalltalk07					= "SVM_8_Smalltalk07"				;//...mnie to i tak nikt nie s³ucha...
	Smalltalk08					= "SVM_8_Smalltalk08"				;//...to naprawdê nie mój problem...
	Smalltalk09					= "SVM_8_Smalltalk09"				;//...naprawdê w to wierzysz...
	Smalltalk10					= "SVM_8_Smalltalk10"				;//...ode mnie nikt siê tego nie dowie...
	Smalltalk11					= "SVM_8_Smalltalk11"				;//...o tym by³o wiadomo od dawna...
	Smalltalk12					= "SVM_8_Smalltalk12"				;//...pos³ucha³ niew³aœciwych ludzi...
	Smalltalk13					= "SVM_8_Smalltalk13"				;//...je¿eli on tego nie widzi, to przecie¿ nie mogê mu pomagaæ wbrew jego woli...
	Smalltalk14					= "SVM_8_Smalltalk14"				;//...nie mówiê ci przecie¿ nic nowego...
	Smalltalk15					= "SVM_8_Smalltalk15"				;//...sam by na to nie wpad³...
	Smalltalk16					= "SVM_8_Smalltalk16"				;//...to przecie¿ wiadomo od dawna...
	Smalltalk17					= "SVM_8_Smalltalk17"				;//...to niedobrze...
	Smalltalk18					= "SVM_8_Smalltalk18"				;//...mo¿na to by³o zrobiæ zupe³nie inaczej...
	Smalltalk19					= "SVM_8_Smalltalk19"				;//...w zupe³noœci siê z tob¹ zgadzam...
	Smalltalk20					= "SVM_8_Smalltalk20"				;//...czy coœ siê w koñcu zmieni...
	Smalltalk21					= "SVM_8_Smalltalk21"				;//...nic o tym nie wiem...
	Smalltalk22					= "SVM_8_Smalltalk22"				;//...i tak tego nie zmienisz...
	Smalltalk23					= "SVM_8_Smalltalk23"				;//...wcale mnie to nie dziwi...
	Smalltalk24					= "SVM_8_Smalltalk24"				;//...powinien wiedzieæ lepiej...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                  
	Smalltalk25					= "SVM_8_Smalltalk25"				;//...liczy siê przecie¿ tylko si³a, wiêc nie opowiadaj mi tu takich rzeczy...
	Smalltalk26					= "SVM_8_Smalltalk26"				;//...przecie¿ on nawet nie wie, jak siê trzyma miecz...
	Smalltalk27					= "SVM_8_Smalltalk27"				;//...tak, naprawdê tak powiedzia³...
	//ProInnos (NOV/KDF/PAL)                                                                                                                  
	Smalltalk28					= "SVM_8_Smalltalk28"				;//...ktoœ bêdzie musia³ za to zap³aciæ...
	Smalltalk29					= "SVM_8_Smalltalk29"				;//...Innos przyœwieca tym wszystkim, którzy potrafi¹ zg³êbiæ jego m¹droœæ...
	Smalltalk30					= "SVM_8_Smalltalk30"				;//...w koñcu zwyciê¿y sprawiedliwoœæ...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_8_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz trochê wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_8_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_8_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_8_YouLearnedSomething"		;//Widzisz, nauczy³eœ siê czegoœ nowego...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_8_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_8_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_8_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_8_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_8_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_8_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_8_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_8_WHERETO"					;//A ty dok¹d?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_8_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_8_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_8_UNTERSTADT_2_TEMPEL"		;//Kiedy bêdziesz szed³ od kuŸni, przejdŸ do³em przez przejœcie. Dojdziesz wtedy do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_8_UNTERSTADT_2_HAFEN"		;//IdŸ od kuŸni w dó³ ulic¹ portow¹, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_8_TEMPEL_2_UNTERSTADT"		;//Od strony placu œwi¹tynnego biegnie przejœcie, które prowadzi do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_8_TEMPEL_2_MARKT"			;//Kiedy bêdziesz przed œwi¹tyni¹, skrêæ w lewo i idŸ wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_8_TEMPEL_2_GALGEN"			;//Je¿eli stoj¹c plecami do œwi¹tyni, pójdziesz w lewo obok knajpy, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_8_MARKT_2_TEMPEL"			;//IdŸ od strony targowiska, wzd³u¿ murów miejskich, a dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_8_MARKT_2_KASERNE"			;//Koszary to ten du¿y budynek. WejdŸ po prostu po schodach naprzeciwko hotelu.
	MARKT_2_GALGEN				= "SVM_8_MARKT_2_GALGEN"			;//IdŸ po prostu wzd³u¿ koszar, a powinieneœ dojœæ do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_8_GALGEN_2_TEMPEL"			;//IdŸ uliczk¹ odchodz¹c¹ od placu wisielców, to dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_8_GALGEN_2_MARKT"			;//IdŸ po prostu wzd³u¿ koszar, a powinieneœ dojœæ do targowiska.
	GALGEN_2_KASERNE			= "SVM_8_GALGEN_2_KASERNE"			;//Koszary to ten du¿y budynek. WejdŸ po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_8_KASERNE_2_MARKT"			;//ZejdŸ po prostu po schodach znajduj¹cych siê na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_8_KASERNE_2_GALGEN"			;//ZejdŸ po prostu po schodach znajduj¹cych siê na prawo od g³ównego wejœcia. Dojdziesz nimi do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_8_HAFEN_2_UNTERSTADT"		;//IdŸ od strony murów portowych ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_8_Dead"						;//Aaaaarrrhhhh!
	Aargh_1						= "SVM_8_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_8_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_8_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_8_Addon_WrongArmor";				//Nie ufam ci. Nie pasujesz mi ani ty, ani twój ubiór.
	ADDON_WRONGARMOR_SLD		= "SVM_8_ADDON_WRONGARMOR_SLD";			//Wygl¹da na to, ¿e wst¹pi³eœ gdzieœ indziej. W takim razie nie chcê mieæ z tob¹ nic wspólnego.
	ADDON_WRONGARMOR_MIL		= "SVM_8_ADDON_WRONGARMOR_MIL";			//Musimy siê odpowiednio prezentowaæ. IdŸ. Za³ó¿ pancerz.
	ADDON_WRONGARMOR_KDF		= "SVM_8_ADDON_WRONGARMOR_KDF";			//Innos pragnie, byœmy nosili jego togi z dum¹. IdŸ i za³ó¿ swoj¹.
	ADDON_NOARMOR_BDT			= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//Nie rozmawiam z kopaczami. Nie masz nawet pancerza!

	ADDON_DIEBANDIT				= "SVM_8_ADDON_DIEBANDIT";				//Ty pod³y bandyto!
	ADDON_DIRTYPIRATE			= "SVM_8_ADDON_DIRTYPIRATE";			//PIRACI!
};

instance SVM_9 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_9_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_9_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_9_Weather"						;//Ale nêdzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_9_IGetYouStill"				;//Teraz ciê mam!
	DieEnemy					=	"SVM_9_DieEnemy"					;//Lepiej by³o tu nie przychodziæ!
	DieMonster					=	"SVM_9_DieMonster"					;//ChodŸ tu, bydlaku!
	Addon_DieMonster			=	"SVM_9_Addon_DieMonster"			;//Jeszcze jedna z tych bestii!
	Addon_DieMonster2			=	"SVM_9_Addon_DieMonster2"			;//Tam! To jeszcze jedno z tych nikczemnych stworzeñ!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Parszywy z³odziej!
	HandsOff					=	"SVM_9_HandsOff"					;//£apy precz!
	SheepKiller					=	"SVM_9_SheepKiller"				;//Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_9_SheepKillerMonster"			;//Zostaw nasze owce, ty potworze!
	YouMurderer					=	"SVM_9_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_9_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_9_YouDareHitMe"				;//Po¿a³ujesz tego!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Ostrzegano ciê...
	ThenIBeatYouOutOfHere		=	"SVM_9_ThenIBeatYouOutOfHere"		;//Powiedzia³em WYNOCHA!
	WhatDidYouDoInThere			=	"SVM_9_WhatDidYouDoInThere"		;//Hej! Czego tam szuka³eœ?
	WillYouStopFighting			=	"SVM_9_WillYouStopFighting"		;//Przestañ! Natychmiast!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_9_KillEnemy"					;//Teraz siê zabawimy, gnido!
	EnemyKilled					=	"SVM_9_EnemyKilled"					;//I po sprawie...
	//MonsterKilled				=	"SVM_9_MonsterKilled"				;//Ich steh' auf diese ganze Scheiße!
	Addon_MonsterKilled			=	"SVM_9_Addon_MonsterKilled"			;//Ju¿ po tobie, bydlaku!
	Addon_MonsterKilled2		=	"SVM_9_Addon_MonsterKilled2"		;//I JESZCZE JEDEN parszywy stwór za³atwiony!
	ThiefDown					=	"SVM_9_ThiefDown"					;//Ostrzegam ciê! Nie próbuj tego ponownie, ty przeklêty z³odzieju!
	rumfummlerDown				=	"SVM_9_rumfummlerDown"				;//Trzymaj rêce z dala od rzeczy, które do ciebie nie nale¿¹!
	SheepAttackerDown			=	"SVM_9_SheepAttackerDown"			;//I trzymaj siê na przysz³oœæ z dala od naszych owiec!
	KillMurderer				=	"SVM_9_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_9_StupidBeastKilled"			;//G³upie bydlê!
	NeverHitMeAgain				=	"SVM_9_NeverHitMeAgain"				;//Nie wa¿ siê nigdy wiêcej mnie atakowaæ!
	YouBetterShouldHaveListened	=	"SVM_9_YouBetterShouldHaveListened"	;//Ostrzegano ciê...
	GetUpAndBeGone				=	"SVM_9_GetUpAndBeGone"					;//A teraz wynoœ siê!
	NeverEnterRoomAgain			=	"SVM_9_NeverEnterRoomAgain"			;//Nie chcê ciê ju¿ tam nigdy wiêcej widzieæ!
	ThereIsNoFightingHere		=	"SVM_9_ThereIsNoFightingHere"			;//Tutaj siê nie walczy, zapamiêtaj to sobie!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_9_SpareMe"						;//Nie zrób czegoœ g³upiego!
	RunAway						= 	"SVM_9_RunAway"						;//Zmywam siê!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_9_Alarm"					;//ALARM!
	Guards						=	"SVM_9_Guards"					;//STRA¯!
	Help						=	"SVM_9_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_9_GoodMonsterKill"		;//Poka¿ tym potworom...!
	GoodKill					= 	"SVM_9_GoodKill"				;//Taa... Poka¿ mu!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_9_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_9_RunCoward"				;//Jeszcze ciê dorwê!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_9_GetOutOfHere"			;//Won!
	WhyAreYouInHere				=	"SVM_9_WhyAreYouInHere"		;//Nie masz tu czego szukaæ!
	YesGoOutOfHere				= 	"SVM_9_YesGoOutOfHere"			;//No, wynoœ siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"	;//Co to ma byæ? Co ty tutaj robisz?
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"	;//Czego u diab³a chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_9_ITookYourGold"			;//Dobrze, ¿e przynajmniej masz jakieœ z³oto!
	ShitNoGold					=	"SVM_9_ShitNoGold"				;//Ha! Nawet z³ota nie ma...
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"		;//Twoja broñ mo¿e mi siê przydaæ.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"		;//Lepiej nie próbuj tego po raz drugi!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"	;//Znowu szukasz guza?
	StopMagic					=	"SVM_9_StopMagic"				;//Tylko bez magii!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"			;//Ostrzegam po raz ostatni!
	WeaponDown					=	"SVM_9_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"		;//Od³ó¿ to albo ci przy³o¿ê.
	WiseMove					=	"SVM_9_WiseMove"				;//Nie jesteœ wcale taki g³upi, na jakiego wygl¹dasz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_9_NextTimeYoureInForIt"	;//Lepiej nie próbuj tego po raz drugi!
	OhMyHead					=	"SVM_9_OhMyHead"				;//Aaach! Mój ³eb...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_9_TheresAFight"			;//Teraz bêdzie zabawnie...
	OhMyGodItsAFight			=	"SVM_9_OhMyGodItsAFight"		;//O rany...
	GoodVictory					=	"SVM_9_GoodVictory"			;//Bêdzie mia³ nauczkê...
	NotBad						= 	"SVM_9_NotBad"					;//To by³o dobre!
	OhMyGodHesDown				=	"SVM_9_OhMyGodHesDown"			;//Brutal!
	CheerFriend01				=	"SVM_9_CheerFriend01"			;//Wal!
	CheerFriend02				=	"SVM_9_CheerFriend02"			;//No, dalej!
	CheerFriend03				=	"SVM_9_CheerFriend03"			;//Wykoñcz go!
	Ooh01						=	"SVM_9_Ooh01"					;//Uwa¿aj!
	Ooh02						=	"SVM_9_Ooh02"					;//Paruj!
	Ooh03						=	"SVM_9_Ooh03"					;//Cholera, to bola³o!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_9_WhatWasThat"				;//Co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_9_GetOutOfMyBed"			;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_9_Awake"					;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_9_ABS_COMMANDER"    ;//Wyjaœni³eœ zatem sprawê z dowódc¹.
	ABS_MONASTERY    = "SVM_9_ABS_MONASTERY"    ;//Ojciec Parlan uwolni³ ciê od twoich grzechów.
	ABS_FARM       = "SVM_9_ABS_FARM"        ;//Odwiedzi³eœ zatem Lee i za³atwi³eœ sprawê.
	ABS_GOOD       = "SVM_9_ABS_GOOD"       ;//Dobrze.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_9_SHEEPKILLER_CRIME"   ;//Podnosisz broñ na owce? Pewnie trudno ci by³o o bardziej bezbronne stworzenie!?
	ATTACK_CRIME     = "SVM_9_ATTACK_CRIME"    ;//Z takimi jak ty nie chcê mieæ nic wspólnego!
	THEFT_CRIME      = "SVM_9_THEFT_CRIME"    ;//Nie chcê mieæ nic wspólnego ze z³odziejami!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_9_PAL_CITY_CRIME"   ;//I ty chcesz byæ paladynem? Ciekawe, co na to Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_9_MIL_CITY_CRIME"   ;//Naprawdê nale¿ysz do stra¿y miejskiej? Lordowi Andre siê to nie spodoba!
 	CITY_CRIME       = "SVM_9_CITY_CRIME"    ;//IdŸ do Lorda Andre, póki jeszcze mo¿esz.
 	// -------------------------
	MONA_CRIME       = "SVM_9_MONA_CRIME"    ;//Udaj siê do Ojca Parlana. Otrzymasz od niego pokutê!
	FARM_CRIME       = "SVM_9_FARM_CRIME"    ;//Lee siê o tym dowie... Zap³acisz za to!
	OC_CRIME       = "SVM_9_OC_CRIME"     ;//Kapitan Garond bêdzie bardzo niezadowolony. Lepiej z nim porozmawiaj, zanim stanie siê coœ jeszcze gorszego.
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_9_TOUGHGUY_ATTACKLOST"		;//Dobrze - wygra³eœ zatem. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_9_TOUGHGUY_ATTACKWON"		;//S¹dzê, ¿e wiesz ju¿, kogo masz przed sob¹. Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_9_TOUGHGUY_PLAYERATTACK"	;//To znowu ty? Chcesz jeszcze raz siê ze mn¹ spróbowaæ, czy jak?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_9_GOLD_1000"				;//1000 sztuk z³ota.
	GOLD_950					= "SVM_9_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_9_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_9_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_9_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_9_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_9_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_9_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_9_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_9_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_9_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_9_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_9_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_9_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_9_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_9_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_9_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_9_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_9_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_9_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_9_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_9_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_9_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_9_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_9_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_9_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_9_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_9_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_9_Smalltalk01"				;//...trudno mi w to uwierzyæ...
	Smalltalk02					= "SVM_9_Smalltalk02"				;//...nie wiem, czy mo¿na byæ tego pewnym...
	Smalltalk03					= "SVM_9_Smalltalk03"				;//...przecie¿ on wiedzia³ ju¿ o tym wczeœniej...
	Smalltalk04					= "SVM_9_Smalltalk04"				;//...ju¿ nie wiem, w co mam wierzyæ...
	Smalltalk05					= "SVM_9_Smalltalk05"				;//...nie rozumiem w ogóle, czym on siê tak przejmuje...
	Smalltalk06					= "SVM_9_Smalltalk06"				;//...nie potrzebujê jeszcze wiêcej k³opotów...
	Smalltalk07					= "SVM_9_Smalltalk07"				;//...dosz³o do mnie to i owo...
	Smalltalk08					= "SVM_9_Smalltalk08"				;//...lepiej zostawiê to w spokoju...
	Smalltalk09					= "SVM_9_Smalltalk09"				;//...nie mo¿na wierzyæ we wszystko, co siê s³yszy...
	Smalltalk10					= "SVM_9_Smalltalk10"				;//...ode mnie tego nie dosta³...
	Smalltalk11					= "SVM_9_Smalltalk11"				;//...tak mi siê w³aœnie wydawa³o...
	Smalltalk12					= "SVM_9_Smalltalk12"				;//...mnie i tak nikt nie s³ucha...
	Smalltalk13					= "SVM_9_Smalltalk13"				;//...nie zas³u¿y³ na coœ takiego...
	Smalltalk14					= "SVM_9_Smalltalk14"				;//...nie mów, ¿e o tym nie wiesz...
	Smalltalk15					= "SVM_9_Smalltalk15"				;//...to by³o przecie¿ jasne...
	Smalltalk16					= "SVM_9_Smalltalk16"				;//...sk¹d ty to masz...
	Smalltalk17					= "SVM_9_Smalltalk17"				;//...tak dalej byæ nie mo¿e...
	Smalltalk18					= "SVM_9_Smalltalk18"				;//...mam w³asne zdanie na ten temat...
	Smalltalk19					= "SVM_9_Smalltalk19"				;//...by³o dok³adnie tak, jak mówisz...
	Smalltalk20					= "SVM_9_Smalltalk20"				;//...nie s¹dzê, ¿eby w tej sprawie coœ siê zmieni³o...
	Smalltalk21					= "SVM_9_Smalltalk21"				;//...s³yszê o tym po raz pierwszy...
	Smalltalk22					= "SVM_9_Smalltalk22"				;//...mo¿emy jedynie przeczekaæ...
	Smalltalk23					= "SVM_9_Smalltalk23"				;//...wiedzia³em, ¿e pojawi¹ siê problemy...
	Smalltalk24					= "SVM_9_Smalltalk24"				;//...czemu nikt mnie nie s³ucha...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_9_Smalltalk25"				;//...ucieka³, jakby goni³ go sam Beliar...
	Smalltalk26					= "SVM_9_Smalltalk26"				;//...w koñcu i tak go oczywiœcie dorwaliœmy...
	Smalltalk27					= "SVM_9_Smalltalk27"				;//...trzeba zdecydowanie i silnie uderzyæ w sam œrodek...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_9_Smalltalk28"				;//...niektórzy nie zdaj¹ sobie w ogóle sprawy ze swoich grzechów...
	Smalltalk29					= "SVM_9_Smalltalk29"				;//...taka jest bowiem wola Innosa
	Smalltalk30					= "SVM_9_Smalltalk30"				;//...jego czyny by³y sprawiedliwe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_9_NoLearnNoPoints"			;//Wróæ do mnie, kiedy nabierzesz wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_9_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_9_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_9_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_9_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_9_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_9_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_9_MARKT"						;//Znajdujesz siê teraz na targowisku.
	GALGEN						= "SVM_9_GALGEN"					;//Znajdujesz siê teraz przed koszarami na placu wisielców.
	KASERNE						= "SVM_9_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_9_HAFEN"						;//Znajdujesz siê w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_9_WHERETO"					;//Dok¹d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_9_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_9_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_9_UNTERSTADT_2_TEMPEL"		;//IdŸ od kowala przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_9_UNTERSTADT_2_HAFEN"		;//IdŸ od kowala w dó³ ulic¹ portow¹, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_9_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie, które prowadzi do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_9_TEMPEL_2_MARKT"			;//Kiedy bêdziesz przed œwi¹tyni¹, skrêæ w lewo i idŸ potem wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_9_TEMPEL_2_GALGEN"			;//Je¿eli staniesz plecami do œwi¹tyni i potem pójdziesz w lewo obok knajpy, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_9_MARKT_2_TEMPEL"			;//IdŸ od strony targowiska, wzd³u¿ murów miejskich, a dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_9_MARKT_2_KASERNE"			;//Koszary znajduj¹ siê w tym du¿ym budynku. WejdŸ po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_9_MARKT_2_GALGEN"			;//PrzejdŸ po prostu obok koszar, a powinieneœ dojœæ do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_9_GALGEN_2_TEMPEL"			;//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_9_GALGEN_2_MARKT"			;//PrzejdŸ po prostu wzd³u¿ koszar, a powinieneœ dojœæ do targowiska.
	GALGEN_2_KASERNE			= "SVM_9_GALGEN_2_KASERNE"			;//Koszary to ten du¿y budynek. WejdŸ po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_9_KASERNE_2_MARKT"			;//ZejdŸ po schodach na lewo od g³ównego wejœcia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_9_KASERNE_2_GALGEN"			;//ZejdŸ po schodach na prawo od g³ównego wejœcia, to dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_9_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nabrze¿u ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_9_Dead"						;//Aaaaaaaahrrrrrr!
	Aargh_1						= "SVM_9_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_9_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_9_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_9_Addon_WrongArmor";				//Co to za maskarada? Ubierz siê jak cz³owiek.
	ADDON_WRONGARMOR_SLD		= "SVM_9_ADDON_WRONGARMOR_SLD";			//W czym ty chodzisz? Za³ó¿ pancerz!
	ADDON_WRONGARMOR_MIL		= "SVM_9_ADDON_WRONGARMOR_MIL";			//Pracujesz dla króla, dlatego te¿ nosisz jego pancerz! Przebierz siê!
	ADDON_WRONGARMOR_KDF		= "SVM_9_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz siê!
	ADDON_NOARMOR_BDT			= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj siê st¹d!

	ADDON_DIEBANDIT				= "SVM_9_ADDON_DIEBANDIT";				//A teraz dostaniesz, bandyto!
	ADDON_DIRTYPIRATE			= "SVM_9_ADDON_DIRTYPIRATE";			//Trzeba by³o siê tu nie pokazywaæ, piracie!
};

instance SVM_10 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_10_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_10_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_10_Weather"						;//Beznadziejna pogoda!
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_10_IGetYouStill"				;//To znowu TY!
	DieEnemy					=	"SVM_10_DieEnemy"					;//Za³atwiê ciê!
	DieMonster					=	"SVM_10_DieMonster"					;//Znowu jedna z tych g³upich bestii!
	DirtyThief					=	"SVM_10_DirtyThief"					;//Ty ma³y, parszywy z³odzieju!
	HandsOff					=	"SVM_10_HandsOff"					;//Zabieraj ³apy!
	SheepKiller					=	"SVM_10_SheepKiller"					;//Hej! Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_10_SheepKillerMonster"			;//Ta bestia z¿era nasze owce!
	YouMurderer					=	"SVM_10_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_10_DieStupidBeast"				;//A ten stwór czego tu chce?!
	YouDareHitMe				=	"SVM_10_YouDareHitMe"				;//No, teraz to mnie wkurzy³eœ!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_10_ThenIBeatYouOutOfHere"		;//Z niektórymi po prostu nie mo¿na siê dogadaæ w normalny sposób...
	WhatDidYouDoInThere			=	"SVM_10_WhatDidYouDoInThere"			;//Czego tam szuka³eœ, co?!
	WillYouStopFighting			=	"SVM_10_WillYouStopFighting"			;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_10_KillEnemy"					;//Giñ!
	EnemyKilled					=	"SVM_10_EnemyKilled"					;//Cholerny bydlak...
	MonsterKilled				=	"SVM_10_MonsterKilled"				;//No, koniec z tob¹, bestio!
	ThiefDown					=	"SVM_10_ThiefDown"					;//Trzymaj na przysz³oœæ ³apy z dala od moich rzeczy, jasne?
	rumfummlerDown				=	"SVM_10_rumfummlerDown"				;//Na przysz³oœæ trzymaj ³apy przy sobie!
	SheepAttackerDown			=	"SVM_10_SheepAttackerDown"			;//Nigdy wiêcej nie podnoœ rêki na nasze owce!
	KillMurderer				=	"SVM_10_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_10_StupidBeastKilled"			;//G³upie stworzenie!
	NeverHitMeAgain				=	"SVM_10_NeverHitMeAgain"				;//Nie próbuj tego jeszcze raz, ch³opczyku!
	YouBetterShouldHaveListened	=	"SVM_10_YouBetterShouldHaveListened"	;//Niech to bêdzie dla ciebie nauczka.
	GetUpAndBeGone				=	"SVM_10_GetUpAndBeGone"				;//Wstawaj i wynoœ siê st¹d!
	NeverEnterRoomAgain			=	"SVM_10_NeverEnterRoomAgain"			;//Nie chcê ciê wiêcej tam widzieæ, zrozumiano?
	ThereIsNoFightingHere		=	"SVM_10_ThereIsNoFightingHere"		;//Je¿eli ktoœ tu rozdziela ciosy, to jestem to ja, zrozumiano?!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_10_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_10_RunAway"						;//Cholera! Trzeba uciekaæ!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_10_Alarm"					;//ALARM!
	Guards						=	"SVM_10_Guards"					;//STRA¯!
	Help						=	"SVM_10_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_10_GoodMonsterKill"			;//No! Tak nale¿y obchodziæ siê z bestiami!
	GoodKill					= 	"SVM_10_GoodKill"				;//Zas³uguje na to!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_10_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_10_RunCoward"				;//Jeszcze siê spotkamy!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_10_GetOutOfHere"			;//Wynoœ siê!
	WhyAreYouInHere				=	"SVM_10_WhyAreYouInHere"			;//Czego tu szukasz?!
	YesGoOutOfHere				= 	"SVM_10_YesGoOutOfHere"			;//Zabieraj siê st¹d!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"	;//Co ty tu robisz?
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"	;//Co siê dzieje?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_10_ITookYourGold"			;//Dziêki za z³oto, mój ty bohaterze!
	ShitNoGold					=	"SVM_10_ShitNoGold"				;//Ty frajerze, nawet z³ota nie masz!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"			;//Wezmê twoj¹ broñ na przechowanie.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"			;//Lepiej uwa¿aj! Nastêpnym razem ci przy³o¿ê.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"	;//Znowu chcesz w mordê?
																	 
	StopMagic					=	"SVM_10_StopMagic"				;//Skoñcz wreszcie z tym czarowaniem!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"			;//Chcesz dostaæ? Natychmiast przestañ!
	WeaponDown					=	"SVM_10_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"			;//Od³ó¿ wreszcie tê cholern¹ broñ!
	WiseMove					=	"SVM_10_WiseMove"				;//Spryciarz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_10_NextTimeYoureInForIt"	;//Zobaczymy nastêpnym razem...
	OhMyHead					=	"SVM_10_OhMyHead"				;//O rany, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_10_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_10_OhMyGodItsAFight"		;//O rany, walka!
	GoodVictory					=	"SVM_10_GoodVictory"				;//Ale mu pokaza³eœ!
	NotBad						= 	"SVM_10_NotBad"					;//NieŸle...
	OhMyGodHesDown				=	"SVM_10_OhMyGodHesDown"			;//Bogowie! Co za brutal...
	CheerFriend01				=	"SVM_10_CheerFriend01"			;//Wal z ca³ej si³y!
	CheerFriend02				=	"SVM_10_CheerFriend02"			;//Poka¿ mu!
	CheerFriend03				=	"SVM_10_CheerFriend03"			;//Wykoñcz go!
	Ooh01						=	"SVM_10_Ooh01"					;//Broñ siê!
	Ooh02						=	"SVM_10_Ooh02"					;//Oddaj cios!
	Ooh03						=	"SVM_10_Ooh03"					;//Uuu, to musia³o boleæ!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_10_WhatWasThat"				;//Cholera, co to by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_10_GetOutOfMyBed"				;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_10_Awake"						;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_10_ABS_COMMANDER"    ;//Za³atwi³eœ zatem sprawê z kapitanem.
	ABS_MONASTERY    = "SVM_10_ABS_MONASTERY"    ;//Opowiedzia³eœ zatem Ojcu Parlanowi o swych czynach.
	ABS_FARM       = "SVM_10_ABS_FARM"        ;//Mówi¹, ¿e Lee uda³o siê za³atwiæ ca³¹ sprawê.
	ABS_GOOD       = "SVM_10_ABS_GOOD"       ;//Dobrze.
	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_10_SHEEPKILLER_CRIME"   ;//Szlachtowanie owiec to ju¿ po prostu szczyt wszystkiego! Wynoœ siê!
	ATTACK_CRIME     = "SVM_10_ATTACK_CRIME"    ;//Jesteœ jakimœ oprychem - lepiej st¹d znikaj!
 	THEFT_CRIME      = "SVM_10_THEFT_CRIME"    ;//Przeklêty z³odziej! Gardzê takimi jak ty!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_10_PAL_CITY_CRIME"   ;//Wydawa³o mi siê, ¿e od paladyna mo¿na oczekiwaæ czegoœ wiêcej. Lord Hagen bêdzie niepocieszony.
 	MIL_CITY_CRIME     = "SVM_10_MIL_CITY_CRIME"   ;//¯e takich jak ty w ogóle przyjmuj¹ do stra¿y miejskiej! Odpowiesz za to przed Lordem Andre!
 	CITY_CRIME       = "SVM_10_CITY_CRIME"    ;//Lord Andre dowie siê o twoim zachowaniu!
	// -------------------------
	MONA_CRIME       = "SVM_10_MONA_CRIME"    ;//Ojciec Parlan bêdzie wœciek³y!
	FARM_CRIME       = "SVM_10_FARM_CRIME"    ;//Odpowiesz za to przed Lee!
	OC_CRIME       = "SVM_10_OC_CRIME"     ;//Kapitan Garond nie bêdzie zadowolony, kiedy o tym us³yszy! Zap³acisz za to!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_10_TOUGHGUY_ATTACKLOST"		;//Masz ca³kiem niez³e uderzenie... Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_10_TOUGHGUY_ATTACKWON"		;//Jeszcze jakieœ pytania?
	TOUGHGUY_PLAYERATTACK		= "SVM_10_TOUGHGUY_PLAYERATTACK"		;//To znowu ty!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_10_GOLD_1000"					;//1000 sztuk z³ota.
	GOLD_950					= "SVM_10_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_10_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_10_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_10_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_10_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_10_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_10_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_10_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_10_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_10_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_10_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_10_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_10_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_10_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_10_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_10_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_10_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_10_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_10_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_10_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_10_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_10_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_10_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_10_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_10_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_10_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_10_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_10_Smalltalk01"				;//...tak jakby mnie to cokolwiek obchodzi³o...
	Smalltalk02					= "SVM_10_Smalltalk02"				;//...nikt nie chce o tym s³yszeæ...
	Smalltalk03					= "SVM_10_Smalltalk03"				;//...w koñcu to by³a jego decyzja...
	Smalltalk04					= "SVM_10_Smalltalk04"				;//...nie wiem, ty mi powiedz...
	Smalltalk05					= "SVM_10_Smalltalk05"				;//...trzymam siê od tego z daleka...
	Smalltalk06					= "SVM_10_Smalltalk06"				;//...nie mam czasu na takie rzeczy...
	Smalltalk07					= "SVM_10_Smalltalk07"				;//...du¿o by mnie to kosztowa³o...
	Smalltalk08					= "SVM_10_Smalltalk08"				;//...nie musisz mi tego mówiæ...
	Smalltalk09					= "SVM_10_Smalltalk09"				;//...widzi i s³yszy siê to, i owo...
	Smalltalk10					= "SVM_10_Smalltalk10"				;//...mogê ci opowiedzieæ takich rzeczach...
	Smalltalk11					= "SVM_10_Smalltalk11"				;//...nie mo¿na na tym polegaæ...
	Smalltalk12					= "SVM_10_Smalltalk12"				;//...sam tak mówi³em...
	Smalltalk13					= "SVM_10_Smalltalk13"				;//...tego jest wiêcej, wierz mi...
	Smalltalk14					= "SVM_10_Smalltalk14"				;//...ci¹gle to samo...
	Smalltalk15					= "SVM_10_Smalltalk15"				;//...nie mów, ¿e to nieprawda...
	Smalltalk16					= "SVM_10_Smalltalk16"				;//...wczeœniej czy póŸniej musia³o siê tak zdarzyæ...
	Smalltalk17					= "SVM_10_Smalltalk17"				;//...powinien byæ m¹drzejszy...
	Smalltalk18					= "SVM_10_Smalltalk18"				;//...to siê nigdy nie zmieni...
	Smalltalk19					= "SVM_10_Smalltalk19"				;//...to ¿adna tajemnica...
	Smalltalk20					= "SVM_10_Smalltalk20"				;//...¿adna wielka sprawa...
	Smalltalk21					= "SVM_10_Smalltalk21"				;//...on myœli, ¿e to takie ³atwe...
	Smalltalk22					= "SVM_10_Smalltalk22"				;//...nikt nie chce tego s³uchaæ...
	Smalltalk23					= "SVM_10_Smalltalk23"				;//...i to jest prawda...
	Smalltalk24					= "SVM_10_Smalltalk24"				;//...trzeba po prostu s³uchaæ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_10_Smalltalk25"				;//...gdyby to zale¿a³o od nas, sprawy potoczy³yby siê inaczej...
	Smalltalk26					= "SVM_10_Smalltalk26"				;//...musi po prostu wiêcej æwiczyæ...
	Smalltalk27					= "SVM_10_Smalltalk27"				;//...co on wie o s³u¿bie...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_10_Smalltalk28"				;//...Innos karze sprawiedliwie...
	Smalltalk29					= "SVM_10_Smalltalk29"				;//...œcie¿ka cnoty jest d³uga i kamienista...
	Smalltalk30					= "SVM_10_Smalltalk30"				;//...tylko Innos wie, co jest dobre, a co z³e...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_10_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz trochê wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_10_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_10_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_10_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_10_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_10_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_10_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_10_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_10_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_10_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_10_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_10_WHERETO"					;//Dok¹d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_10_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_10_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_10_UNTERSTADT_2_TEMPEL"		;//IdŸ od kowala przejœciem, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_10_UNTERSTADT_2_HAFEN"		;//IdŸ od kowala w dó³ ulic¹ portow¹, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_10_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_10_TEMPEL_2_MARKT"			;//Kiedy znajdziesz siê przed œwi¹tyni¹, pójdŸ w lewo i potem wzd³u¿ murów, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_10_TEMPEL_2_GALGEN"			;//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_10_MARKT_2_TEMPEL"			;//Je¿eli id¹c od strony targowiska, bêdziesz szed³ wzd³u¿ murów miejskich, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_10_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. WejdŸ po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_10_MARKT_2_GALGEN"			;//IdŸ wzd³u¿ koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_10_GALGEN_2_TEMPEL"			;//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_10_GALGEN_2_MARKT"			;//IdŸ po prostu wzd³u¿ koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_10_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejœæ po schodach.
	KASERNE_2_MARKT				= "SVM_10_KASERNE_2_MARKT"			;//ZejdŸ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_10_KASERNE_2_GALGEN"			;//ZejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_10_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nadbrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_10_Dead"						;//Aaaarhhh!
	Aargh_1						= "SVM_10_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_10_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_10_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_10_Addon_WrongArmor";			//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju.
	ADDON_WRONGARMOR_SLD		= "SVM_10_ADDON_WRONGARMOR_SLD";		//Je¿eli jesteœ jednym z nas, powinieneœ nosiæ nasz strój.
	ADDON_WRONGARMOR_MIL		= "SVM_10_ADDON_WRONGARMOR_MIL";		//Skoro dosta³eœ królewski pancerz, noœ go!
	ADDON_WRONGARMOR_KDF		= "SVM_10_ADDON_WRONGARMOR_KDF";		//Odrzucaj¹c togê, odrzucasz Innosa. Zastanów siê nad tym.
	ADDON_NOARMOR_BDT			= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//Nie staæ ciê nawet na pancerz - dlaczego mia³bym z tob¹ rozmawiaæ?

	ADDON_DIEBANDIT				= "SVM_10_ADDON_DIEBANDIT";				//Ty parszywy bandyto!
	ADDON_DIRTYPIRATE			= "SVM_10_ADDON_DIRTYPIRATE";			//Ty parszywy piracie!
};

instance SVM_11 (C_SVM)
{
	SC_HeyWaitASecond			= 	"SVM_11_Addon_HeyWaitASecond"			;//Czekaj!
	
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_11_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_11_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_11_Weather"						;//Nêdzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_11_IGetYouStill"				;//Wiêc w koñcu i tak ciê dorwa³em!
	DieEnemy					=	"SVM_11_DieEnemy"					;//Teraz kolej na ciebie!
	DieMonster					=	"SVM_11_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_11_DirtyThief"					;//Parszywy z³odziej! Czekaj tylko...
	HandsOff					=	"SVM_11_HandsOff"					;//Zabieraj ³apy!
	SheepKiller					=	"SVM_11_SheepKiller"					;//To cholerne bydlê zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_11_SheepKillerMonster"			;//Ten przeklêty potwór z¿era nasze owce!
	YouMurderer					=	"SVM_11_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_11_DieStupidBeast"				;//Bestie nie maj¹ tu prawa wstêpu!
	YouDareHitMe				=	"SVM_11_YouDareHitMe"				;//Czekaj tylko, ty draniu!
	YouAskedForIt				=	"SVM_11_YouAskedForIt"				;//Sam siê o to prosi³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_11_ThenIBeatYouOutOfHere"		;//Wiêc bêdê ciê musia³ st¹d WYKOPAÆ!
	WhatDidYouDoInThere			=	"SVM_11_WhatDidYouDoInThere"			;//Co ty tam robi³eœ, co?!
	WillYouStopFighting			=	"SVM_11_WillYouStopFighting"			;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_11_KillEnemy"					;//Giñ, bydlaku!
	EnemyKilled					=	"SVM_11_EnemyKilled"					;//Koniec z tob¹, paskudo!
	MonsterKilled				=	"SVM_11_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_11_ThiefDown"					;//Nigdy wiêcej nie próbuj mnie okraœæ!
	rumfummlerDown				=	"SVM_11_rumfummlerDown"				;//Na przysz³oœæ trzymaj siê z dala od cudzej w³asnoœci!
	SheepAttackerDown			=	"SVM_11_SheepAttackerDown"			;//Nie rób tego nigdy wiêcej! To s¹ nasze owce!
	KillMurderer				=	"SVM_11_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_11_StupidBeastKilled"			;//G³upia bestia!
	NeverHitMeAgain				=	"SVM_11_NeverHitMeAgain"				;//Nigdy wiêcej ze mn¹ nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_11_YouBetterShouldHaveListened"	;//Trzeba by³o mnie pos³uchaæ!
	GetUpAndBeGone				=	"SVM_11_GetUpAndBeGone"				;//A teraz wynoœ siê!
	NeverEnterRoomAgain			=	"SVM_11_NeverEnterRoomAgain"			;//I ¿ebym ciê ju¿ nigdy wiêcej tam nie przy³apa³!
	ThereIsNoFightingHere		=	"SVM_11_ThereIsNoFightingHere"		;//Tu siê nie walczy, zrozumiano? Niech to bêdzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_11_SpareMe"						;//Zostaw mnie w spokoju!
	RunAway						= 	"SVM_11_RunAway"						;//Cholera! Znikam st¹d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_11_Alarm"						;//ALARM!
	Guards						=	"SVM_11_Guards"						;//STRA¯!
	Help						=	"SVM_11_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_11_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_11_GoodKill"					;//No, daj œwini na co zas³uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_11_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_11_RunCoward"					;//Stój, padalcu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_11_GetOutOfHere"				;//Wynoœ siê st¹d!
	WhyAreYouInHere				=	"SVM_11_WhyAreYouInHere"				;//Czego tu chcesz?! OdejdŸ!
	YesGoOutOfHere				= 	"SVM_11_YesGoOutOfHere"				;//No, zmywaj siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"		;//Ej ty! Czego tam szukasz!
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"		;//Czego u diab³a chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_11_ITookYourGold"				;//Z³oto! Przyda mi siê...
	ShitNoGold					=	"SVM_11_ShitNoGold"					;//Nie masz z³ota?!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Wezmê twoj¹ broñ na przechowanie.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Hej! Uwa¿aj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"		;//Ci¹gle ci ma³o?
	StopMagic					=	"SVM_11_StopMagic"					;//Trzymaj siê ode mnie z daleka z t¹ swoj¹ magi¹!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"				;//Skoñcz z tymi czarami! Coœ nie tak z twoim s³uchem?!
	WeaponDown					=	"SVM_11_WeaponDown"					;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Og³uch³eœ czy co?! Powtarzam: od³ó¿ broñ!
	WiseMove					=	"SVM_11_WiseMove"					;//Widzisz, to nie by³o takie trudne.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_11_NextTimeYoureInForIt"		;//Jeszcze zobaczymy...
	OhMyHead					=	"SVM_11_OhMyHead"					;//O rany, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_11_TheresAFight"				;//Ach, wreszcie coœ siê dzieje!
	OhMyGodItsAFight			=	"SVM_11_OhMyGodItsAFight"			;//Porozwalaj¹ sobie ³by...
	GoodVictory					=	"SVM_11_GoodVictory"					;//Zas³u¿y³ sobie na to!
	NotBad						= 	"SVM_11_NotBad"						;//Ca³kiem nieŸle...
	OhMyGodHesDown				=	"SVM_11_OhMyGodHesDown"				;//Ale brutal...
	CheerFriend01				=	"SVM_11_CheerFriend01"				;//Tak to siê powinno robiæ!
	CheerFriend02				=	"SVM_11_CheerFriend02"				;//Na co czekasz?
	CheerFriend03				=	"SVM_11_CheerFriend03"				;//I o to chodzi!
	Ooh01						=	"SVM_11_Ooh01"						;//Nie daj mu siê!
	Ooh02						=	"SVM_11_Ooh02"						;//Poka¿ mu, kto tu rz¹dzi!
	Ooh03						=	"SVM_11_Ooh03"						;//O cholera!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_11_WhatWasThat"					;//Co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_11_GetOutOfMyBed"					;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_11_Awake"							;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_11_ABS_COMMANDER"					;//Podobno by³eœ u kapitana i wszystko za³atwi³eœ.
	ABS_MONASTERY				= "SVM_11_ABS_MONASTERY"					;//Ponoæ poszed³eœ do Ojca Parlana, by odkupiæ swe grzechy.
	ABS_FARM					= "SVM_11_ABS_FARM"						;//Mówi¹, ¿e by³eœ u Lee i wszystko za³atwi³eœ.
	ABS_GOOD					= "SVM_11_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_11_SHEEPKILLER_CRIME"				;//Tak po prostu szlachtowaæ nasze owce! Spadaj st¹d, gnido!
	ATTACK_CRIME				= "SVM_11_ATTACK_CRIME"					;//Nie gadam z takimi jak ty!
	THEFT_CRIME					= "SVM_11_THEFT_CRIME"					;//ZejdŸ mi z oczu, parszywy z³odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_11_PAL_CITY_CRIME"				;//Jesteœ zaka³¹ swojego zakonu! Lord Hagen bêdzie wœciek³y!
	MIL_CITY_CRIME				= "SVM_11_MIL_CITY_CRIME"				;//Hañbisz dobre imiê stra¿y miejskiej! Lord Andre da ci nauczkê!
	CITY_CRIME					= "SVM_11_CITY_CRIME"					;//Lord Andre dowie siê o twoich czynach!
	// -------------------------
	MONA_CRIME					= "SVM_11_MONA_CRIME"					;//Ojciec Parlan nie bêdzie zbyt szczêœliwy, gdy siê o tym dowie!
	FARM_CRIME					= "SVM_11_FARM_CRIME"					;//Lee da ci popaliæ! I na co ci to by³o?
	OC_CRIME					= "SVM_11_OC_CRIME"						;//Kapitan Garond na pewno za¿¹da od ciebie wyjaœnieñ!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_11_TOUGHGUY_ATTACKLOST"			;//Dobrze ju¿, dobrze, wygra³eœ. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_11_TOUGHGUY_ATTACKWON"			;//Mam ci znowu pokazaæ, kto tu jest szefem?
	TOUGHGUY_PLAYERATTACK		= "SVM_11_TOUGHGUY_PLAYERATTACK"			;//Chyba chcesz mnie znowu sprowokowaæ...
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_11_GOLD_1000"						;//1000 sztuk z³ota.
	GOLD_950					= "SVM_11_GOLD_950"						;//950 sztuk z³ota.
	GOLD_900					= "SVM_11_GOLD_900"						;//900 sztuk z³ota.
	GOLD_850					= "SVM_11_GOLD_850"						;//850 sztuk z³ota.
	GOLD_800					= "SVM_11_GOLD_800"						;//800 sztuk z³ota.
	GOLD_750					= "SVM_11_GOLD_750"						;//750 sztuk z³ota.
	GOLD_700					= "SVM_11_GOLD_700"						;//700 sztuk z³ota.
	GOLD_650					= "SVM_11_GOLD_650"						;//650 sztuk z³ota.
	GOLD_600					= "SVM_11_GOLD_600"						;//600 sztuk z³ota.
	GOLD_550					= "SVM_11_GOLD_550"						;//550 sztuk z³ota.
	GOLD_500					= "SVM_11_GOLD_500"						;//500 sztuk z³ota.
	GOLD_450					= "SVM_11_GOLD_450"						;//450 sztuk z³ota.
	GOLD_400					= "SVM_11_GOLD_400"						;//400 sztuk z³ota.
	GOLD_350					= "SVM_11_GOLD_350"						;//350 sztuk z³ota.
	GOLD_300					= "SVM_11_GOLD_300"						;//300 sztuk z³ota.
	GOLD_250					= "SVM_11_GOLD_250"						;//250 sztuk z³ota.
	GOLD_200					= "SVM_11_GOLD_200"						;//200 sztuk z³ota.
	GOLD_150					= "SVM_11_GOLD_150"						;//150 sztuk z³ota.
	GOLD_100					= "SVM_11_GOLD_100"						;//100 sztuk z³ota.
	GOLD_90						= "SVM_11_GOLD_90"						;//90 sztuk z³ota.
	GOLD_80						= "SVM_11_GOLD_80"						;//80 sztuk z³ota.
	GOLD_70						= "SVM_11_GOLD_70"						;//70 sztuk z³ota.
	GOLD_60						= "SVM_11_GOLD_60"						;//60 sztuk z³ota.
	GOLD_50						= "SVM_11_GOLD_50"						;//50 sztuk z³ota.
	GOLD_40						= "SVM_11_GOLD_40"						;//40 sztuk z³ota.
	GOLD_30						= "SVM_11_GOLD_30"						;//30 sztuk z³ota.
	GOLD_20						= "SVM_11_GOLD_20"						;//20 sztuk z³ota.
	GOLD_10						= "SVM_11_GOLD_10"						;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_11_Smalltalk01"					;//...naprawdê tak myœlisz...
	Smalltalk02					= "SVM_11_Smalltalk02"					;//...wszystko jest mo¿liwe...
	Smalltalk03					= "SVM_11_Smalltalk03"					;//...powinien byæ m¹drzejszy...
	Smalltalk04					= "SVM_11_Smalltalk04"					;//...jakbyœmy mieli nie doœæ problemów...
	Smalltalk05					= "SVM_11_Smalltalk05"					;//...kto ci to powiedzia³...
	Smalltalk06					= "SVM_11_Smalltalk06"					;//...przez to bêdzie jeszcze wiêcej k³opotów...
	Smalltalk07					= "SVM_11_Smalltalk07"					;//...ludzie mówi¹ ró¿ne rzeczy...
	Smalltalk08					= "SVM_11_Smalltalk08"					;//...ja bym tego nie zrobi³...
	Smalltalk09					= "SVM_11_Smalltalk09"					;//...to wszystko tylko plotki...
	Smalltalk10					= "SVM_11_Smalltalk10"					;//...lepiej uwa¿aæ, co siê komu mówi...
	Smalltalk11					= "SVM_11_Smalltalk11"					;//...mog³em ci to powiedzieæ wczeœniej...
	Smalltalk12					= "SVM_11_Smalltalk12"					;//...nikt mnie nigdy nie pyta o zdanie...
	Smalltalk13					= "SVM_11_Smalltalk13"					;//...¿al biedaka...
	Smalltalk14					= "SVM_11_Smalltalk14"					;//...to nic nowego...
	Smalltalk15					= "SVM_11_Smalltalk15"					;//...to przecie¿ oczywiste...
	Smalltalk16					= "SVM_11_Smalltalk16"					;//...nie musisz mnie o to pytaæ...
	Smalltalk17					= "SVM_11_Smalltalk17"					;//...tak nie mo¿e dalej byæ...
	Smalltalk18					= "SVM_11_Smalltalk18"					;//...i tak wiesz, co o tym s¹dzê...
	Smalltalk19					= "SVM_11_Smalltalk19"					;//...to dok³adnie moje s³owa...
	Smalltalk20					= "SVM_11_Smalltalk20"					;//...nic siê w zwi¹zku z tym nie zmieni...
	Smalltalk21					= "SVM_11_Smalltalk21"					;//...czemu nie dosz³o to do mnie wczeœniej...
	Smalltalk22					= "SVM_11_Smalltalk22"					;//...poczekajmy, co siê stanie...
	Smalltalk23					= "SVM_11_Smalltalk23"					;//...niektóre problemy rozwi¹zuj¹ siê same...
	Smalltalk24					= "SVM_11_Smalltalk24"					;//...nie chcê o tym s³uchaæ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                        
	Smalltalk25					= "SVM_11_Smalltalk25"					;//...by³ w sztok pijany...
	Smalltalk26					= "SVM_11_Smalltalk26"					;//...nie pozwolê siê tak traktowaæ...
	Smalltalk27					= "SVM_11_Smalltalk27"					;//...wszyscy uciekali jak zaj¹ce, by³em zupe³nie sam...
	//ProInnos (NOV/KDF/PAL)                                                                                                                        
	Smalltalk28					= "SVM_11_Smalltalk28"					;//...tak mówi¹ pisma...
	Smalltalk29					= "SVM_11_Smalltalk29"					;//...zawsze dzia³am w imieniu Innosa...
	Smalltalk30					= "SVM_11_Smalltalk30"					;//...nie wolno naruszaæ boskiego porz¹dku...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_11_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz trochê wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_11_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_11_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_11_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_11_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_11_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_11_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_11_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_11_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_11_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_11_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_11_WHERETO"					;//Dok¹d chcesz siê udaæ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_11_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_11_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_11_UNTERSTADT_2_TEMPEL"		;//IdŸ od kowala przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_11_UNTERSTADT_2_HAFEN"		;//IdŸ od kowala w dó³ ulic¹ portow¹, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_11_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie, które prowadzi do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_11_TEMPEL_2_MARKT"			;//Kiedy znajdziesz siê przed œwi¹tyni¹, skrêæ w lewo i idŸ wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_11_TEMPEL_2_GALGEN"			;//Id¹c od strony œwi¹tyni, skrêæ w lewo ko³o knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_11_MARKT_2_TEMPEL"			;//Id¹c wzd³u¿ murów miejskich od strony targowiska, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_11_MARKT_2_KASERNE"			;//Koszary to ten du¿y budynek. Wystarczy wejœæ po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_11_MARKT_2_GALGEN"			;//PrzejdŸ obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_11_GALGEN_2_TEMPEL"			;//IdŸ w dó³ uliczk¹ odchodz¹c¹ od placu wisielców, to dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_11_GALGEN_2_MARKT"			;//PrzejdŸ obok koszar, to dostaniesz siê na targowisko.
	GALGEN_2_KASERNE			= "SVM_11_GALGEN_2_KASERNE"			;//Koszary to ten du¿y budynek. Dostaniesz siê do niego po schodach.
	KASERNE_2_MARKT				= "SVM_11_KASERNE_2_MARKT"			;//ZejdŸ po schodach na lewo od g³ównego wejœcia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_11_KASERNE_2_GALGEN"			;//ZejdŸ po schodach na prawo od g³ównego wejœcia, to dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_11_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nabrze¿u, w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_11_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_11_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_11_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_11_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_11_Addon_WrongArmor";				//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju.
	ADDON_WRONGARMOR_SLD		= "SVM_11_ADDON_WRONGARMOR_SLD";			//Za³ó¿ nasz pancerz, a wtedy z tob¹ porozmawiam. A teraz zje¿d¿aj.
	ADDON_WRONGARMOR_MIL		= "SVM_11_ADDON_WRONGARMOR_MIL";			//Powinieneœ nosiæ królewski pancerz! Odsuñ siê!
	ADDON_WRONGARMOR_KDF		= "SVM_11_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz siê!
	ADDON_NOARMOR_BDT			= "SVM_11_ADDON_ADDON_NOARMOR_BDT";			//Nie masz nawet pancerza. Zabieraj siê st¹d!

	ADDON_DIEBANDIT				= "SVM_11_ADDON_DIEBANDIT";				//Znowu jakiœ bandyta.
	ADDON_DIRTYPIRATE			= "SVM_11_ADDON_DIRTYPIRATE";			//PIRACI!
};

instance SVM_12 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_12_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_12_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_12_Weather"					;//Kiepska pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_12_IGetYouStill"				;//Teraz ciê mam!
	DieEnemy					=	"SVM_12_DieEnemy"					;//Trzeba by³o tu nie przychodziæ!
	DieMonster					=	"SVM_12_DieMonster"					;//No chodŸ, parszywa bestio!
	DirtyThief					=	"SVM_12_DirtyThief"					;//Czekaj tylko, ty œmierdz¹cy z³odzieju!
	HandsOff					=	"SVM_12_HandsOff"					;//Zabieraj st¹d ³apy!
	SheepKiller					=	"SVM_12_SheepKiller"				;//Zostaw nasze owce w spokoju!
	SheepKillerMonster			=	"SVM_12_SheepKillerMonster"			;//OdejdŸ od naszych owiec, ty przeklêta bestio!
	YouMurderer					=	"SVM_12_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_12_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_12_YouDareHitMe"				;//Po¿a³ujesz tego!
	YouAskedForIt				=	"SVM_12_YouAskedForIt"				;//Ostrzega³em ciê!
	ThenIBeatYouOutOfHere		=	"SVM_12_ThenIBeatYouOutOfHere"		;//Powiedzia³em WON!
	WhatDidYouDoInThere			=	"SVM_12_WhatDidYouDoInThere"		;//Hej! Co ty tam robi³eœ?
	WillYouStopFighting			=	"SVM_12_WillYouStopFighting"		;//Przestaæ! Natychmiast!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_12_KillEnemy"					;//Rozerwê ciê na strzêpy!
	EnemyKilled					=	"SVM_12_EnemyKilled"				;//Koniec z tob¹...
	MonsterKilled				=	"SVM_12_MonsterKilled"				;//To mnie krêci!
	Addon_MonsterKilled			=	"SVM_12_Addon_MonsterKilled"		;//Kolejne bydlê za³atwione!
	ThiefDown					=	"SVM_12_ThiefDown"					;//Ostrzegam ciê! Nie próbuj tego ponownie, ty przeklêty z³odzieju!
	rumfummlerDown				=	"SVM_12_rumfummlerDown"				;//Trzymaj w przysz³oœci ³apy z dala od rzeczy, które do ciebie nie nale¿¹!
	SheepAttackerDown			=	"SVM_12_SheepAttackerDown"			;//I trzymaj siê z dala od naszych owiec!
	KillMurderer				=	"SVM_12_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_12_StupidBeastKilled"			;//Przeklêty potwór!
	NeverHitMeAgain				=	"SVM_12_NeverHitMeAgain"				;//Nigdy nie wa¿ siê mnie atakowaæ!
	YouBetterShouldHaveListened	=	"SVM_12_YouBetterShouldHaveListened"	;//Ostrzega³em ciê!
	GetUpAndBeGone				=	"SVM_12_GetUpAndBeGone"					;//A teraz wynoœ siê!
	NeverEnterRoomAgain			=	"SVM_12_NeverEnterRoomAgain"			;//Nie chcê ciê tu wiêcej widzieæ, jasne?
	ThereIsNoFightingHere		=	"SVM_12_ThereIsNoFightingHere"			;//Tu siê nie walczy, zapamiêtaj to sobie dobrze!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_12_SpareMe"						;//Nie zrób czegoœ g³upiego!
	RunAway						= 	"SVM_12_RunAway"						;//Wynoszê siê st¹d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_12_Alarm"					;//ALARM!
	Guards						=	"SVM_12_Guards"					;//STRA¯!
	Help						=	"SVM_12_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_12_GoodMonsterKill"		;//Odeœlemy te bestie do otch³ani!
	GoodKill					= 	"SVM_12_GoodKill"				;//Dobrze! Poka¿ draniowi!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_12_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_12_RunCoward"				;//Dorwê ciê jeszcze!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_12_GetOutOfHere"			;//Wynoœ siê st¹d!
	WhyAreYouInHere				=	"SVM_12_WhyAreYouInHere"		;//Nie masz tu nic do roboty!
	YesGoOutOfHere				= 	"SVM_12_YesGoOutOfHere"			;//No, wynocha!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"	;//Co ty kombinujesz? Czego tam szukasz?
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"	;//Czego u diab³a chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_12_ITookYourGold"			;//Dobrze, ¿e masz przy sobie przynajmniej trochê z³ota...
	ShitNoGold					=	"SVM_12_ShitNoGold"				;//Nawet z³ota nie ma?!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"		;//Chyba wezmê sobie twoj¹ broñ.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"		;//Nie próbuj tego ponownie, ch³opcze!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"	;//Ci¹gle ci ma³o?
	StopMagic					=	"SVM_12_StopMagic"				;//Przestañ z tymi czarami!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"			;//Ostatnie ostrze¿enie - skoñcz z t¹ magi¹!
	WeaponDown					=	"SVM_12_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"		;//Od³ó¿ to, albo pogadamy inaczej!
	WiseMove					=	"SVM_12_WiseMove"				;//Hej, nie jesteœ wcale taki g³upi, na jakiego wygl¹dasz!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_12_NextTimeYoureInForIt"	;//Nie próbuj tego ponownie...
	OhMyHead					=	"SVM_12_OhMyHead"				;//Och, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_12_TheresAFight"			;//Teraz bêdzie zabawa...
	OhMyGodItsAFight			=	"SVM_12_OhMyGodItsAFight"		;//O bogowie...
	GoodVictory					=	"SVM_12_GoodVictory"			;//Niech to bêdzie dla niego nauczka...
	NotBad						= 	"SVM_12_NotBad"					;//To by³o dobre!
	OhMyGodHesDown				=	"SVM_12_OhMyGodHesDown"			;//Cholerny brutal!
	CheerFriend01				=	"SVM_12_CheerFriend01"			;//R¹bnij go!
	CheerFriend02				=	"SVM_12_CheerFriend02"			;//Nie przestawaj!
	CheerFriend03				=	"SVM_12_CheerFriend03"			;//Wykoñcz go!
	Ooh01						=	"SVM_12_Ooh01"					;//Uwa¿aj!
	Ooh02						=	"SVM_12_Ooh02"					;//Paruj! Paruj!
	Ooh03						=	"SVM_12_Ooh03"					;//Cholera, to bola³o!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_12_WhatWasThat"				;//Co to by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_12_GetOutOfMyBed"			;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_12_Awake"					;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     = "SVM_12_ABS_COMMANDER"    ;//Zatem kapitan wyjaœni³ sprawê.
	ABS_MONASTERY    = "SVM_12_ABS_MONASTERY"    ;//Ojciec Parlan uwolni³ ciê wiêc od twoich grzechów.
	ABS_FARM       = "SVM_12_ABS_FARM"        ;//Widzia³eœ siê zatem z Lee i zaj¹³eœ siê spraw¹.
	ABS_GOOD       = "SVM_12_ABS_GOOD"       ;//Dobrze.
 	// -------------------------
	SHEEPKILLER_CRIME   = "SVM_12_SHEEPKILLER_CRIME"   ;//Mordujesz owce? Przypuszczam, ¿e bardziej bezbronnej ofiary nie mog³eœ sobie znaleŸæ?!
	ATTACK_CRIME     = "SVM_12_ATTACK_CRIME"    ;//Z takimi jak ty nie chcê mieæ nic wspólnego!
	THEFT_CRIME      = "SVM_12_THEFT_CRIME"    ;//Nie zadajê siê ze z³odziejami!
 	// -------------------------
 	PAL_CITY_CRIME     = "SVM_12_PAL_CITY_CRIME"   ;//I ty chcesz byæ paladynem? Ciekawe, co na to Lord Hagen!
 	MIL_CITY_CRIME     = "SVM_12_MIL_CITY_CRIME"   ;//Naprawdê nale¿ysz do stra¿y miejskiej? Lordowi Andre siê to nie spodoba!
 	CITY_CRIME       = "SVM_12_CITY_CRIME"    ;//IdŸ do Lorda Andre, póki jeszcze mo¿esz.
 	// -------------------------
	MONA_CRIME       = "SVM_12_MONA_CRIME"    ;//IdŸ do Ojca Parlana. Pomo¿e ci zmazaæ twoje grzechy!
	FARM_CRIME       = "SVM_12_FARM_CRIME"    ;//Lee o tym us³yszy, a wtedy bêdziesz musia³ zap³aciæ...
	OC_CRIME       = "SVM_12_OC_CRIME"     ;//Kapitan Garond nie bêdzie zadowolony. Lepiej z nim porozmawiaj, zanim bêdzie jeszcze gorzej!
 	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_12_TOUGHGUY_ATTACKLOST"		;//Dobrze - wygra³eœ. Czego ode mnie chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_12_TOUGHGUY_ATTACKWON"		;//Chyba ju¿ wiesz, z kim masz do czynienia. Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_12_TOUGHGUY_PLAYERATTACK"	;//To znowu ty? Chcesz jeszcze siê raz ze mn¹ spróbowaæ, czy jak?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_12_GOLD_1000"				;//1000 sztuk z³ota.
	GOLD_950					= "SVM_12_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_12_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_12_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_12_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_12_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_12_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_12_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_12_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_12_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_12_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_12_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_12_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_12_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_12_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_12_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_12_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_12_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_12_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_12_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_12_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_12_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_12_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_12_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_12_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_12_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_12_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_12_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_12_Smalltalk01"				;//...tak jakby mnie to cokolwiek obchodzi³o...
	Smalltalk02					= "SVM_12_Smalltalk02"				;//...nikt nie chce wiedzieæ...
	Smalltalk03					= "SVM_12_Smalltalk03"				;//...w koñcu to by³a jego decyzja...
	Smalltalk04					= "SVM_12_Smalltalk04"				;//...nie wiem, ty mi powiedz...
	Smalltalk05					= "SVM_12_Smalltalk05"				;//...trzymam siê od tego z daleka...
	Smalltalk06					= "SVM_12_Smalltalk06"				;//...nie mam czasu na takie rzeczy...
	Smalltalk07					= "SVM_12_Smalltalk07"				;//...du¿o by mnie to kosztowa³o...
	Smalltalk08					= "SVM_12_Smalltalk08"				;//...nie musisz mi tego mówiæ...
	Smalltalk09					= "SVM_12_Smalltalk09"				;//...widzi i s³yszy siê to, i owo...
	Smalltalk10					= "SVM_12_Smalltalk10"				;//...mogê ci opowiedzieæ o takich rzeczach...
	Smalltalk11					= "SVM_12_Smalltalk11"				;//...nie mo¿na na to liczyæ...
	Smalltalk12					= "SVM_12_Smalltalk12"				;//...sam tak mówi³em...
	Smalltalk13					= "SVM_12_Smalltalk13"				;//...tego jest wiêcej, wierz mi...
	Smalltalk14					= "SVM_12_Smalltalk14"				;//...ci¹gle to samo...
	Smalltalk15					= "SVM_12_Smalltalk15"				;//...nie mów, ¿e to nieprawda...
	Smalltalk16					= "SVM_12_Smalltalk16"				;//...wczeœniej czy póŸniej musia³o siê tak zdarzyæ...
	Smalltalk17					= "SVM_12_Smalltalk17"				;//...powinien byæ m¹drzejszy...
	Smalltalk18					= "SVM_12_Smalltalk18"				;//...to siê nigdy nie zmieni...
	Smalltalk19					= "SVM_12_Smalltalk19"				;//...to ¿adna tajemnica...
	Smalltalk20					= "SVM_12_Smalltalk20"				;//...¿adna wielka sprawa...
	Smalltalk21					= "SVM_12_Smalltalk21"				;//...on myœli, ¿e to takie ³atwe...
	Smalltalk22					= "SVM_12_Smalltalk22"				;//...nikt nie chce tego s³uchaæ...
	Smalltalk23					= "SVM_12_Smalltalk23"				;//...i to jest prawda...
	Smalltalk24					= "SVM_12_Smalltalk24"				;//...trzeba po prostu s³uchaæ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_12_Smalltalk25"				;//...gdyby to zale¿a³o od nas, sprawy potoczy³yby siê inaczej...
	Smalltalk26					= "SVM_12_Smalltalk26"				;//...musi po prostu wiêcej æwiczyæ...
	Smalltalk27					= "SVM_12_Smalltalk27"				;//...co on wie o s³u¿bie...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_12_Smalltalk28"				;//...Innos karze sprawiedliwie...
	Smalltalk29					= "SVM_12_Smalltalk29"				;//...œcie¿ka cnoty jest d³uga i kamienista...
	Smalltalk30					= "SVM_12_Smalltalk30"				;//...tylko Innos wie, co jest dobre, a co z³e...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_12_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz trochê wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_12_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_12_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_12_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_12_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_12_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_12_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_12_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_12_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_12_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_12_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_12_WHERETO"					;//Dok¹d to?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_12_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_12_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_12_UNTERSTADT_2_TEMPEL"		;//IdŸ od kowala przejœciem, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_12_UNTERSTADT_2_HAFEN"		;//IdŸ od kowala w dó³ ulic¹ portow¹, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_12_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie prowadz¹ce do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_12_TEMPEL_2_MARKT"			;//Kiedy znajdziesz siê przed œwi¹tyni¹, pójdŸ w lewo i potem wzd³u¿ murów, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_12_TEMPEL_2_GALGEN"			;//Je¿eli id¹c od strony œwi¹tyni, skrêcisz przy knajpie w lewo, dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_12_MARKT_2_TEMPEL"			;//Je¿eli id¹c od strony targowiska, bêdziesz szed³ wzd³u¿ murów miejskich, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_12_MARKT_2_KASERNE"			;//Koszary to ten wielki budynek. WejdŸ po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_12_MARKT_2_GALGEN"			;//IdŸ po prostu wzd³u¿ koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_12_GALGEN_2_TEMPEL"			;//IdŸ od strony placu wisielców w dó³ uliczk¹, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_12_GALGEN_2_MARKT"			;//IdŸ po prostu wzd³u¿ koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_12_GALGEN_2_KASERNE"			;//Koszary to ten wielki budynek. Wystarczy wejœæ po schodach.
	KASERNE_2_MARKT				= "SVM_12_KASERNE_2_MARKT"			;//ZejdŸ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_12_KASERNE_2_GALGEN"			;//ZejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_12_HAFEN_2_UNTERSTADT"		;//IdŸ od strony muru przy nadbrze¿u w górê ulic¹ portow¹, a dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_12_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_12_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_12_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_12_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_12_Addon_WrongArmor";				//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz siê!
	ADDON_WRONGARMOR_SLD		= "SVM_12_ADDON_WRONGARMOR_SLD";			//Jeœli chcesz ze mn¹ rozmawiaæ, to za³ó¿ pancerz.
	ADDON_WRONGARMOR_MIL		= "SVM_12_ADDON_WRONGARMOR_MIL";			//¯o³nierz nosi pancerz swojego króla. NIC innego! Przebierz siê!
	ADDON_WRONGARMOR_KDF		= "SVM_12_ADDON_WRONGARMOR_KDF";			//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz siê!
	ADDON_NOARMOR_BDT			= "SVM_12_ADDON_ADDON_NOARMOR_BDT";			//Nie staæ ciê nawet na pancerz. Nie bêdê rozmawia³ z takim s³abeuszem.

	ADDON_DIEBANDIT				= "SVM_12_ADDON_DIEBANDIT";				//Dostanê ciê, bandyto!
	ADDON_DIRTYPIRATE			= "SVM_12_ADDON_DIRTYPIRATE";			//Dostanê ciê, piracie!
};

instance SVM_13 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_13_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_13_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_13_Weather"					;//Jakaœ nêdzna ta pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_13_IGetYouStill"				;//Teraz ciê dorwê!
	DieEnemy					=	"SVM_13_DieEnemy"					;//Rozerwê ciê na kawa³ki!
	DieMonster					=	"SVM_13_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_13_DirtyThief"					;//Parszywy z³odziej! Czekaj tylko...
	HandsOff					=	"SVM_13_HandsOff"					;//Zabieraj ³apy!
	SheepKiller					=	"SVM_13_SheepKiller"				;//To cholerne bydlê zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_13_SheepKillerMonster"			;//Ten przeklêty potwór z¿era nasze owce!
	YouMurderer					=	"SVM_13_YouMurderer"				;//Morderca!
	DieStupidBeast				=	"SVM_13_DieStupidBeast"				;//Dobra bestia to martwa bestia!
	YouDareHitMe				=	"SVM_13_YouDareHitMe"				;//Czekaj tylko, ty draniu!
	YouAskedForIt				=	"SVM_13_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_13_ThenIBeatYouOutOfHere"		;//Nie chcesz iœæ? Dobrze!
	WhatDidYouDoInThere			=	"SVM_13_WhatDidYouDoInThere"		;//Czego tam szuka³eœ?
	WillYouStopFighting			=	"SVM_13_WillYouStopFighting"		;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_13_KillEnemy"					;//Giñ, bydlaku!
	EnemyKilled					=	"SVM_13_EnemyKilled"				;//Zas³u¿y³eœ na to, gnido!
	MonsterKilled				=	"SVM_13_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_13_ThiefDown"					;//Nigdy wiêcej nie próbuj mnie okraœæ!
	rumfummlerDown				=	"SVM_13_rumfummlerDown"				;//Od tej chwili trzymaj ³apy z dala od rzeczy, które do ciebie nie nale¿¹!
	SheepAttackerDown			=	"SVM_13_SheepAttackerDown"			;//Nie rób tego nigdy wiêcej! To s¹ nasze owce!
	KillMurderer				=	"SVM_13_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_13_StupidBeastKilled"			;//G³upi potwór!
	NeverHitMeAgain				=	"SVM_13_NeverHitMeAgain"			;//Nigdy wiêcej ze mn¹ nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_13_YouBetterShouldHaveListened";//Trzeba by³o mnie pos³uchaæ!
	GetUpAndBeGone				=	"SVM_13_GetUpAndBeGone"				;//A teraz zabieraj siê st¹d!
	NeverEnterRoomAgain			=	"SVM_13_NeverEnterRoomAgain"		;//I ¿ebym ciê ju¿ nigdy wiêcej tam nie przy³apa³!
	ThereIsNoFightingHere		=	"SVM_13_ThereIsNoFightingHere"		;//Tu siê nie walczy, zrozumiano? Niech to bêdzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_13_SpareMe"					;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_13_RunAway"					;//O cholera!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_13_Alarm"					;//ALARM!
	Guards						=	"SVM_13_Guards"					;//STRA¯!
	Help						=	"SVM_13_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_13_GoodMonsterKill"		;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_13_GoodKill"				;//No, daj œwini na co zas³uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_13_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_13_RunCoward"				;//Uciekaj, najszybciej jak tylko potrafisz!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_13_GetOutOfHere"			;//Wynoœ siê st¹d!
	WhyAreYouInHere				=	"SVM_13_WhyAreYouInHere"		;//Czego tu chcesz?! OdejdŸ!
	YesGoOutOfHere				= 	"SVM_13_YesGoOutOfHere"			;//No, wynoœ siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"	;//Ej ty! Czego tam szukasz!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"	;//Czego u diab³a chcesz?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_13_ITookYourGold"			;//Dziêki za z³oto, mój ty bohaterze!
	ShitNoGold					=	"SVM_13_ShitNoGold"				;//Ty biedny frajerze, nawet z³ota nie masz!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"		;//Wezmê twoj¹ broñ na przechowanie.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"		;//Uwa¿aj! Nastêpnym razem ci przy³o¿ê.
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"	;//Ci¹gle ci ma³o?!
	StopMagic					=	"SVM_13_StopMagic"				;//Skoñcz z t¹ magi¹!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"			;//Chcesz dostaæ! Przestañ w tej chwili!
	WeaponDown					=	"SVM_13_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"		;//Od³o¿ysz wreszcie tê przeklêt¹ broñ?!
	WiseMove					=	"SVM_13_WiseMove"				;//Dobra decyzja!
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_13_NextTimeYoureInForIt"	;//Zobaczymy nastêpnym razem...
	OhMyHead					=	"SVM_13_OhMyHead"				;//O rany, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_13_TheresAFight"			;//Ach, walka...
	OhMyGodItsAFight			=	"SVM_13_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_13_GoodVictory"			;//Pokaza³eœ mu, kto tu rz¹dzi!
	NotBad						= 	"SVM_13_NotBad"					;//NieŸle...
	OhMyGodHesDown				=	"SVM_13_OhMyGodHesDown"			;//Bogowie! Jak ostro...
	CheerFriend01				=	"SVM_13_CheerFriend01"			;//No, wal!
	CheerFriend02				=	"SVM_13_CheerFriend02"			;//Daj z siebie wszystko!
	CheerFriend03				=	"SVM_13_CheerFriend03"			;//Poka¿ mu!
	Ooh01						=	"SVM_13_Ooh01"					;//Trzymaj siê!
	Ooh02						=	"SVM_13_Ooh02"					;//Uwa¿aj!
	Ooh03						=	"SVM_13_Ooh03"					;//Oj! To by³o mocne!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_13_WhatWasThat"				;//Co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_13_GetOutOfMyBed"			;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_13_Awake"					;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_13_ABS_COMMANDER"			;//Poszed³eœ wiêc do kapitana i wszystko za³atwi³eœ.
	ABS_MONASTERY				= "SVM_13_ABS_MONASTERY"			;//By³eœ wiêc u Ojca Parlana i opowiedzia³eœ mu o swych przewinieniach.
	ABS_FARM					= "SVM_13_ABS_FARM"					;//Zobaczy³eœ siê zatem z Lee i wyjaœni³eœ sprawê.
	ABS_GOOD					= "SVM_13_ABS_GOOD"					;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_13_SHEEPKILLER_CRIME"		;//Tak po prostu szlachtowaæ nasze owce!
	ATTACK_CRIME				= "SVM_13_ATTACK_CRIME"				;//Zostaw mnie w spokoju, ty parszywa gnido!
	THEFT_CRIME					= "SVM_13_THEFT_CRIME"				;//Zostaw mnie, ty ma³y, nêdzny z³odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_13_PAL_CITY_CRIME"			;//Jesteœ hañb¹ dla swego zakonu! Czekaj tylko, a¿ dowie siê o tym Lord Hagen!
	MIL_CITY_CRIME				= "SVM_13_MIL_CITY_CRIME"			;//Hañbisz dobre imiê stra¿y miejskiej! Lord Andre na pewno siê o tym dowie!
	CITY_CRIME					= "SVM_13_CITY_CRIME"				;//Czekaj, a¿ Lord Andre siê o tym dowie!
	// -------------------------
	MONA_CRIME					= "SVM_13_MONA_CRIME"				;//Czekaj, a¿ dowie siê o tym Ojciec Parlan!
	FARM_CRIME					= "SVM_13_FARM_CRIME"				;//Lee na pewno o tym us³yszy...
	OC_CRIME					= "SVM_13_OC_CRIME"					;//Kapitan Garond na pewno siê o tym dowie!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_13_TOUGHGUY_ATTACKLOST"		;//Dobrze ju¿, dobrze, jesteœ lepszy ode mnie! Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_13_TOUGHGUY_ATTACKWON"		;//Przypuszczam, ¿e teraz ju¿ wiesz, który z nas jest tym silniejszym... Czego chcesz?
	TOUGHGUY_PLAYERATTACK		= "SVM_13_TOUGHGUY_PLAYERATTACK"	;//Wydawa³o mi siê, ¿e chcesz mnie sprowokowaæ. Zmieni³eœ zdanie? Wolisz jednak POGADAÆ, co?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_13_GOLD_1000"				;//1000 sztuk z³ota.
	GOLD_950					= "SVM_13_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_13_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_13_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_13_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_13_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_13_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_13_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_13_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_13_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_13_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_13_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_13_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_13_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_13_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_13_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_13_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_13_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_13_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_13_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_13_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_13_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_13_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_13_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_13_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_13_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_13_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_13_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_13_Smalltalk01"				;//...tak jakby mnie to cokolwiek obchodzi³o...
	Smalltalk02					= "SVM_13_Smalltalk02"				;//...nikt nie chce wiedzieæ...
	Smalltalk03					= "SVM_13_Smalltalk03"				;//...w koñcu to by³a jego decyzja...
	Smalltalk04					= "SVM_13_Smalltalk04"				;//...nie wiem, ty mi powiedz...
	Smalltalk05					= "SVM_13_Smalltalk05"				;//...trzymam siê od tego z daleka...
	Smalltalk06					= "SVM_13_Smalltalk06"				;//...nie mam czasu na takie rzeczy...
	Smalltalk07					= "SVM_13_Smalltalk07"				;//...du¿o by mnie to kosztowa³o...
	Smalltalk08					= "SVM_13_Smalltalk08"				;//...nie musisz mi tego mówiæ...
	Smalltalk09					= "SVM_13_Smalltalk09"				;//...widzi i s³yszy siê to i owo...
	Smalltalk10					= "SVM_13_Smalltalk10"				;//...mogê ci opowiedzieæ o takich rzeczach...
	Smalltalk11					= "SVM_13_Smalltalk11"				;//...nie mo¿na na tym polegaæ...
	Smalltalk12					= "SVM_13_Smalltalk12"				;//...sam tak mówi³em...
	Smalltalk13					= "SVM_13_Smalltalk13"				;//...tego jest wiêcej, wierz mi...
	Smalltalk14					= "SVM_13_Smalltalk14"				;//...ci¹gle to samo...
	Smalltalk15					= "SVM_13_Smalltalk15"				;//...nie mów, ¿e to nieprawda...
	Smalltalk16					= "SVM_13_Smalltalk16"				;//...wczeœniej czy póŸniej musia³o siê to zdarzyæ...
	Smalltalk17					= "SVM_13_Smalltalk17"				;//...powinien by³ wiedzieæ lepiej...
	Smalltalk18					= "SVM_13_Smalltalk18"				;//...to siê nigdy nie zmieni...
	Smalltalk19					= "SVM_13_Smalltalk19"				;//...to ¿adna tajemnica...
	Smalltalk20					= "SVM_13_Smalltalk20"				;//...¿adna wielka sprawa...
	Smalltalk21					= "SVM_13_Smalltalk21"				;//...on myœli, ¿e to takie ³atwe...
	Smalltalk22					= "SVM_13_Smalltalk22"				;//...nikt nie chce tego s³uchaæ...
	Smalltalk23					= "SVM_13_Smalltalk23"				;//...i to jest prawda...
	Smalltalk24					= "SVM_13_Smalltalk24"				;//...trzeba po prostu s³uchaæ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                      
	Smalltalk25					= "SVM_13_Smalltalk25"				;//...gdyby to zale¿a³o od nas, sprawy potoczy³yby siê inaczej...
	Smalltalk26					= "SVM_13_Smalltalk26"				;//...musi po prostu wiêcej æwiczyæ...
	Smalltalk27					= "SVM_13_Smalltalk27"				;//...co on wie o s³u¿bie...
	//ProInnos (NOV/KDF/PAL)                                                                                                                      
	Smalltalk28					= "SVM_13_Smalltalk28"				;//...Innos karze sprawiedliwie...
	Smalltalk29					= "SVM_13_Smalltalk29"				;//...œcie¿ka cnoty jest d³uga i kamienista...
	Smalltalk30					= "SVM_13_Smalltalk30"				;//...tylko Innos wie, co jest dobre, a co z³e...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_13_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz trochê wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_13_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_13_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_13_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_13_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_13_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_13_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_13_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_13_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_13_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_13_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_13_WHERETO"					;//Dok¹d chcesz siê udaæ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_13_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_13_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_13_UNTERSTADT_2_TEMPEL"		;//IdŸ od kowala przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_13_UNTERSTADT_2_HAFEN"		;//IdŸ od kowala w dó³ ulic¹ portow¹, a dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_13_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie, które prowadzi do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_13_TEMPEL_2_MARKT"			;//Stañ przed œwi¹tyni¹, idŸ na lewo wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_13_TEMPEL_2_GALGEN"			;//Id¹c od strony œwi¹tyni, skrêæ w lewo ko³o knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_13_MARKT_2_TEMPEL"			;//Id¹c od strony targowiska, wzd³u¿ murów miejskich, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_13_MARKT_2_KASERNE"			;//Koszary to ten du¿y budynek. Dostaniesz siê do niego po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_13_MARKT_2_GALGEN"			;//PrzejdŸ po prostu obok koszar, a powinieneœ dojœæ do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_13_GALGEN_2_TEMPEL"			;//IdŸ w dó³ uliczk¹ odchodz¹c¹ od placu wisielców, to dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_13_GALGEN_2_MARKT"			;//PrzejdŸ obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_13_GALGEN_2_KASERNE"			;//Koszary to ten du¿y budynek. WejdŸ po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_13_KASERNE_2_MARKT"			;//Po prostu zejdŸ po schodach na lewo od g³ównego wejœcia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_13_KASERNE_2_GALGEN"			;//Po prostu zejdŸ po schodach na prawo od g³ównego wejœcia, to dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_13_HAFEN_2_UNTERSTADT"		;//Id¹c od strony muru przy nadbrze¿u, w górê ulic¹ portow¹, dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_13_Dead"						;//Aaarhhhh!
	Aargh_1						= "SVM_13_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_13_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_13_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_13_Addon_WrongArmor";			//Co to za ubranie? Nie pasuje na ciebie. Zostaw mnie w spokoju!
	ADDON_WRONGARMOR_SLD		= "SVM_13_ADDON_WRONGARMOR_SLD";		//Nie masz na sobie pancerza, idŸ go za³o¿yæ.
	ADDON_WRONGARMOR_MIL		= "SVM_13_ADDON_WRONGARMOR_MIL";		//Powinieneœ z dum¹ nosiæ pancerz swego króla, a nie biegaæ w tych szmatach. OdejdŸ!
	ADDON_WRONGARMOR_KDF		= "SVM_13_ADDON_WRONGARMOR_KDF";		//Dlaczego nie nosisz pancerza naszego zakonu?
	ADDON_NOARMOR_BDT			= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj siê st¹d!

	ADDON_DIEBANDIT				= "SVM_13_ADDON_DIEBANDIT";				//Ty pod³y bandyto!
	ADDON_DIRTYPIRATE			= "SVM_13_ADDON_DIRTYPIRATE";			//Ty przeklêty piracie!
};


instance SVM_14 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_14_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_14_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_14_Weather"						;//Nêdzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_14_IGetYouStill"				;//W koñcu ciê dopad³em!
	DieEnemy					=	"SVM_14_DieEnemy"					;//Nadszed³ twój czas!
	DieMonster					=	"SVM_14_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_14_DirtyThief"					;//Czekaj tylko, ty ma³y z³odzieju!
	HandsOff					=	"SVM_14_HandsOff"					;//£apy precz!
	SheepKiller					=	"SVM_14_SheepKiller"					;//To bydlê zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_14_SheepKillerMonster"			;//Ten przeklêty potwór z¿era nasze owce!
	YouMurderer					=	"SVM_14_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_14_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_14_YouDareHitMe"				;//Czekaj tylko, ty gnido!
	YouAskedForIt				=	"SVM_14_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_14_ThenIBeatYouOutOfHere"		;//Wiêc bêdê ciê musia³ st¹d WYKOPAÆ!
	WhatDidYouDoInThere			=	"SVM_14_WhatDidYouDoInThere"			;//Co ty tam robi³eœ, co?!
	WillYouStopFighting			=	"SVM_14_WillYouStopFighting"			;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_14_KillEnemy"					;//Giñ, bydlaku!
	EnemyKilled					=	"SVM_14_EnemyKilled"					;//To twój koniec, padalcu!
	MonsterKilled				=	"SVM_14_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_14_ThiefDown"					;//Nigdy wiêcej nie próbuj mnie okraœæ!
	rumfummlerDown				=	"SVM_14_rumfummlerDown"				;//Trzymaj siê w przysz³oœci z dala od rzeczy, które nie powinny ciê interesowaæ!
	SheepAttackerDown			=	"SVM_14_SheepAttackerDown"			;//Nie rób tego nigdy wiêcej! To s¹ nasze owce!
	KillMurderer				=	"SVM_14_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_14_StupidBeastKilled"			;//G³upia bestia!
	NeverHitMeAgain				=	"SVM_14_NeverHitMeAgain"				;//Nigdy wiêcej ze mn¹ nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_14_YouBetterShouldHaveListened"	;//Trzeba by³o mnie pos³uchaæ!
	GetUpAndBeGone				=	"SVM_14_GetUpAndBeGone"				;//A teraz zabieraj siê st¹d!
	NeverEnterRoomAgain			=	"SVM_14_NeverEnterRoomAgain"			;//I ¿ebym ciê ju¿ nigdy wiêcej tam nie przy³apa³!
	ThereIsNoFightingHere		=	"SVM_14_ThereIsNoFightingHere"		;//Tu siê nie walczy, zrozumiano? Niech to bêdzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_14_SpareMe"						;//Zostaw mnie, proszê!
	RunAway						= 	"SVM_14_RunAway"						;//Cholera! Znikam st¹d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_14_Alarm"						;//ALARM!
	Guards						=	"SVM_14_Guards"						;//STRA¯!
	Help						=	"SVM_14_Help"						;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_14_GoodMonsterKill"				;//Dobra robota - jedna bestia mniej!
	GoodKill					= 	"SVM_14_GoodKill"					;//No, daj œwini na co zas³uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_14_NOTNOW"						;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_14_RunCoward"					;//Stój, gnido!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_14_GetOutOfHere"				;//Wynoœ siê st¹d!
	WhyAreYouInHere				=	"SVM_14_WhyAreYouInHere"				;//Czego tutaj szukasz? OdejdŸ!
	YesGoOutOfHere				= 	"SVM_14_YesGoOutOfHere"				;//No, zmywaj siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"		;//Ej ty? Co ty tam robisz, co?
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"		;//Cholera, co jest?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_14_ITookYourGold"				;//Z³oto! Dobrze... Przyda mi siê.
	ShitNoGold					=	"SVM_14_ShitNoGold"					;//Nawet nie masz z³ota?
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Wezmê sobie twoj¹ broñ.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Hej, uwa¿aj!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"		;//Ci¹gle ci ma³o?
	StopMagic					=	"SVM_14_StopMagic"					;//Trzymaj siê ode mnie z daleka z t¹ swoj¹ magi¹!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"				;//Przestañ z tymi czarami! Masz coœ nie tak z uszami?!
	WeaponDown					=	"SVM_14_WeaponDown"					;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Nie s³yszysz mnie? Powtarzam: od³ó¿ broñ!
	WiseMove					=	"SVM_14_WiseMove"					;//Widzisz, to nie by³o takie trudne.
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_14_NextTimeYoureInForIt"		;//Jeszcze o tym pogadamy...
	OhMyHead					=	"SVM_14_OhMyHead"					;//O rany, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_14_TheresAFight"				;//Wreszcie coœ siê dzieje!
	OhMyGodItsAFight			=	"SVM_14_OhMyGodItsAFight"			;//Porozwalaj¹ sobie ³by...
	GoodVictory					=	"SVM_14_GoodVictory"					;//Pokaza³eœ mu, kto tu rz¹dzi!
	NotBad						= 	"SVM_14_NotBad"						;//Ca³kiem nieŸle...
	OhMyGodHesDown				=	"SVM_14_OhMyGodHesDown"				;//Co za brutal...
	CheerFriend01				=	"SVM_14_CheerFriend01"				;//Tak trzymaj!
	CheerFriend02				=	"SVM_14_CheerFriend02"				;//Na co czekasz?!
	CheerFriend03				=	"SVM_14_CheerFriend03"				;//Tak trzeba!
	Ooh01						=	"SVM_14_Ooh01"						;//Nie daj siê!
	Ooh02						=	"SVM_14_Ooh02"						;//Poka¿ mu, kto tu jest szefem!
	Ooh03						=	"SVM_14_Ooh03"						;//O cholera!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_14_WhatWasThat"					;//Co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_14_GetOutOfMyBed"					;//Wynocha z mojego ³ó¿ka!
	Awake						= "SVM_14_Awake"							;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER				= "SVM_14_ABS_COMMANDER"					;//Ponoæ by³eœ u kapitana i wszystko wyjaœni³eœ.
	ABS_MONASTERY				= "SVM_14_ABS_MONASTERY"					;//By³eœ zatem u Ojca Parlana i wyzna³eœ mu swoje grzechy.
	ABS_FARM					= "SVM_14_ABS_FARM"						;//Mówi¹, ¿e poszed³eœ do Lee i za³atwi³eœ sprawê.
	ABS_GOOD					= "SVM_14_ABS_GOOD"						;//Dobre.
	// -------------------------
	SHEEPKILLER_CRIME			= "SVM_14_SHEEPKILLER_CRIME"				;//Tak po prostu zarzynaæ nasze owce! Spadaj st¹d, gnido!
	ATTACK_CRIME				= "SVM_14_ATTACK_CRIME"					;//Nie gadam z takimi jak ty!
	THEFT_CRIME					= "SVM_14_THEFT_CRIME"					;//ZejdŸ mi z oczu, parszywy z³odzieju!
	// -------------------------
	PAL_CITY_CRIME				= "SVM_14_PAL_CITY_CRIME"				;//Jesteœ zaka³¹ swego zakonu! Lord Hagen bêdzie wœciek³y!
	MIL_CITY_CRIME				= "SVM_14_MIL_CITY_CRIME"				;//Hañbisz dobre imiê stra¿y miejskiej! Lord Andre da ci nauczkê!
	CITY_CRIME					= "SVM_14_CITY_CRIME"					;//Lord Andre dowie siê o twoich czynach!
	// -------------------------
	MONA_CRIME					= "SVM_14_MONA_CRIME"					;//Ojciec Parlan bêdzie bardzo niezadowolony!
	FARM_CRIME					= "SVM_14_FARM_CRIME"					;//Ju¿ Lee ciê nauczy... I po co ci to by³o?
	OC_CRIME					= "SVM_14_OC_CRIME"						;//Kapitan Garond bêdzie ¿¹da³ wyjaœnieñ!
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST			= "SVM_14_TOUGHGUY_ATTACKLOST"			;//Dobrze ju¿, dobrze, jesteœ lepszy ode mnie! Czego chcesz?
	TOUGHGUY_ATTACKWON			= "SVM_14_TOUGHGUY_ATTACKWON"			;//Mam ci jeszcze raz pokazaæ, kto tu jest szefem?
	TOUGHGUY_PLAYERATTACK		= "SVM_14_TOUGHGUY_PLAYERATTACK"			;//Znowu chcesz siê ze mn¹ zmierzyæ?
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_14_GOLD_1000"						;//1000 sztuk z³ota.
	GOLD_950					= "SVM_14_GOLD_950"						;//950 sztuk z³ota.
	GOLD_900					= "SVM_14_GOLD_900"						;//900 sztuk z³ota.
	GOLD_850					= "SVM_14_GOLD_850"						;//850 sztuk z³ota.
	GOLD_800					= "SVM_14_GOLD_800"						;//800 sztuk z³ota.
	GOLD_750					= "SVM_14_GOLD_750"						;//750 sztuk z³ota.
	GOLD_700					= "SVM_14_GOLD_700"						;//700 sztuk z³ota.
	GOLD_650					= "SVM_14_GOLD_650"						;//650 sztuk z³ota.
	GOLD_600					= "SVM_14_GOLD_600"						;//600 sztuk z³ota.
	GOLD_550					= "SVM_14_GOLD_550"						;//550 sztuk z³ota.
	GOLD_500					= "SVM_14_GOLD_500"						;//500 sztuk z³ota.
	GOLD_450					= "SVM_14_GOLD_450"						;//450 sztuk z³ota.
	GOLD_400					= "SVM_14_GOLD_400"						;//400 sztuk z³ota.
	GOLD_350					= "SVM_14_GOLD_350"						;//350 sztuk z³ota.
	GOLD_300					= "SVM_14_GOLD_300"						;//300 sztuk z³ota.
	GOLD_250					= "SVM_14_GOLD_250"						;//250 sztuk z³ota.
	GOLD_200					= "SVM_14_GOLD_200"						;//200 sztuk z³ota.
	GOLD_150					= "SVM_14_GOLD_150"						;//150 sztuk z³ota.
	GOLD_100					= "SVM_14_GOLD_100"						;//100 sztuk z³ota.
	GOLD_90						= "SVM_14_GOLD_90"						;//90 sztuk z³ota.
	GOLD_80						= "SVM_14_GOLD_80"						;//80 sztuk z³ota.
	GOLD_70						= "SVM_14_GOLD_70"						;//70 sztuk z³ota.
	GOLD_60						= "SVM_14_GOLD_60"						;//60 sztuk z³ota.
	GOLD_50						= "SVM_14_GOLD_50"						;//50 sztuk z³ota.
	GOLD_40						= "SVM_14_GOLD_40"						;//40 sztuk z³ota.
	GOLD_30						= "SVM_14_GOLD_30"						;//30 sztuk z³ota.
	GOLD_20						= "SVM_14_GOLD_20"						;//20 sztuk z³ota.
	GOLD_10						= "SVM_14_GOLD_10"						;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_14_Smalltalk01"					;//...nie wierzê...
	Smalltalk02					= "SVM_14_Smalltalk02"					;//...nie mo¿na byæ tego pewnym...
	Smalltalk03					= "SVM_14_Smalltalk03"					;//...ale on o tym wiedzia³...
	Smalltalk04					= "SVM_14_Smalltalk04"					;//...ju¿ nie wiem, komu ufaæ...
	Smalltalk05					= "SVM_14_Smalltalk05"					;//...nie wiem, czym on siê tak denerwuje...
	Smalltalk06					= "SVM_14_Smalltalk06"					;//...i tak mam wystarczaj¹co k³opotów...
	Smalltalk07					= "SVM_14_Smalltalk07"					;//...a, s³ysza³em to i owo...
	Smalltalk08					= "SVM_14_Smalltalk08"					;//...nie chcê mieæ z tym nic wspólnego...
	Smalltalk09					= "SVM_14_Smalltalk09"					;//...nie wolno wierzyæ we wszystko, co siê s³yszy...
	Smalltalk10					= "SVM_14_Smalltalk10"					;//...ode mnie tego nie dosta³...
	Smalltalk11					= "SVM_14_Smalltalk11"					;//...ju¿ o tym myœla³em...
	Smalltalk12					= "SVM_14_Smalltalk12"					;//...nikt mnie nie pyta o zdanie...
	Smalltalk13					= "SVM_14_Smalltalk13"					;//...naprawdê na to nie zas³u¿y³...
	Smalltalk14					= "SVM_14_Smalltalk14"					;//...nie mów, ¿e o tym nie wiesz...
	Smalltalk15					= "SVM_14_Smalltalk15"					;//...to by³o oczywiste...
	Smalltalk16					= "SVM_14_Smalltalk16"					;//...sk¹d to zatem masz...
	Smalltalk17					= "SVM_14_Smalltalk17"					;//...nie mo¿e tak dalej byæ...
	Smalltalk18					= "SVM_14_Smalltalk18"					;//...mam w³asne zdanie na ten temat...
	Smalltalk19					= "SVM_14_Smalltalk19"					;//...by³o tak, jak mówisz...
	Smalltalk20					= "SVM_14_Smalltalk20"					;//...nie s¹dzê, ¿eby coœ siê zmieni³o...
	Smalltalk21					= "SVM_14_Smalltalk21"					;//...s³yszê o tym po raz pierwszy...
	Smalltalk22					= "SVM_14_Smalltalk22"					;//...mo¿emy tylko siedzieæ i czekaæ...
	Smalltalk23					= "SVM_14_Smalltalk23"					;//...wiedzia³em, ¿e bêdzie z tym problem...
	Smalltalk24					= "SVM_14_Smalltalk24"					;//...wiêc czemu nie chc¹ mnie s³uchaæ...
	//ToughGuy (SLD/MIL/DJG)                                                                                                                           
	Smalltalk25					= "SVM_14_Smalltalk25"					;//...ucieka³, jakby goni³ go sam Beliar...
	Smalltalk26					= "SVM_14_Smalltalk26"					;//...w koñcu i tak go oczywiœcie dorwaliœmy...
	Smalltalk27					= "SVM_14_Smalltalk27"					;//...trzeba siê tym zaj¹æ i uporz¹dkowaæ sprawy...
	//ProInnos (NOV/KDF/PAL)                                                                                                                           
	Smalltalk28					= "SVM_14_Smalltalk28"					;//...niektórzy nawet nie wiedz¹, jak bardzo grzesz¹...
	Smalltalk29					= "SVM_14_Smalltalk29"					;//...taka jest bowiem wola Innosa...
	Smalltalk30					= "SVM_14_Smalltalk30"					;//...jego czyny by³y sprawiedliwe...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_14_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz trochê wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_14_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_14_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ za dobry.
	YouLearnedSomething			= "SVM_14_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_14_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_14_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_14_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_14_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_14_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_14_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_14_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_14_WHERETO"					;//Dok¹d chcesz siê udaæ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_14_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_14_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_14_UNTERSTADT_2_TEMPEL"		;//IdŸ od kuŸni przez przejœcie, a dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_14_UNTERSTADT_2_HAFEN"		;//IdŸ od kuŸni w dó³ ulic¹ portow¹, a dojdziesz do przystani.
	TEMPEL_2_UNTERSTADT			= "SVM_14_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie, które prowadzi do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_14_TEMPEL_2_MARKT"			;//Stoj¹c przed œwi¹tyni¹, idŸ na lewo wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_14_TEMPEL_2_GALGEN"			;//Id¹c od strony œwi¹tyni, skrêæ w lewo ko³o knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_14_MARKT_2_TEMPEL"			;//Id¹c od targowiska wzd³u¿ murów miejskich, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_14_MARKT_2_KASERNE"			;//Koszary to ten du¿y budynek. WejdŸ po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_14_MARKT_2_GALGEN"			;//PrzejdŸ po prostu obok koszar, a powinieneœ dojœæ do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_14_GALGEN_2_TEMPEL"			;//Id¹c w dó³ uliczk¹ odchodz¹c¹ od placu wisielców, dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_14_GALGEN_2_MARKT"			;//PrzejdŸ obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_14_GALGEN_2_KASERNE"			;//Koszary to ten du¿y budynek. WejdŸ po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_14_KASERNE_2_MARKT"			;//Jeœli zejdziesz po schodach na lewo od g³ównego wejœcia, to dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_14_KASERNE_2_GALGEN"			;//Schodz¹c po schodach na prawo od g³ównego wejœcia, dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_14_HAFEN_2_UNTERSTADT"		;//Id¹c od strony muru wzd³u¿ nabrze¿a w górê ulic¹ portow¹, dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_14_Dead"						;//Aaaaarhhh!
	Aargh_1						= "SVM_14_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_14_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_14_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_14_Addon_WrongArmor";			//To ubranie nie pasuje na ciebie. Widaæ wyraŸnie, ¿e masz coœ do ukrycia. A teraz zostaw mnie w spokoju.
	ADDON_WRONGARMOR_SLD		= "SVM_14_ADDON_WRONGARMOR_SLD";		//Je¿eli chcesz ze mn¹ rozmawiaæ, musisz mieæ na sobie pancerz.
	ADDON_WRONGARMOR_MIL		= "SVM_14_ADDON_WRONGARMOR_MIL";		//Powinieneœ byæ dumny z przynale¿noœci do armii, a nie biegaæ w tych szmatach. IdŸ siê przebraæ!
	ADDON_WRONGARMOR_KDF		= "SVM_14_ADDON_WRONGARMOR_KDF";		//Twoje ubranie nie przynosi naszemu zakonowi chluby. Przebierz siê!
	ADDON_NOARMOR_BDT			= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//Nie masz nawet pancerza. Zabieraj siê st¹d!

	ADDON_DIEBANDIT				= "SVM_14_ADDON_DIEBANDIT";				//Giñ, bandyto!
	ADDON_DIRTYPIRATE			= "SVM_14_ADDON_DIRTYPIRATE";			//Giñ, piracie!
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

	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nie dzia³a.
	PickBroke				= 	"SVM_15_PickBroke"					;//Hm, z³ama³ siê...
	NeedKey					= 	"SVM_15_NeedKey"					;//Potrzebujê do tego klucza...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;//Nie mam ju¿ wytrychów...
	NoPickLockTalent		= 	"SVM_15_NoPickLockTalent"			;//Nie znam siê na otwieraniu zamków.
	NoSweeping				= 	"SVM_15_NoSweeping"					;//Posprz¹tanie wszystkich komnat zajmie wieki!
	
	PICKLOCKORKEYMISSING	= 	"SVM_15_PICKLOCKORKEYMISSING"		;//Hm... Nie mam ani klucza, ani wytrychu.
	KEYMISSING				= 	"SVM_15_KEYMISSING"					;//Bez w³aœciwego klucza nigdy tego nie otworzê!
	PICKLOCKMISSING			= 	"SVM_15_PICKLOCKMISSING"			;//Przyda³oby siê parê wytrychów!
	NEVEROPEN				= 	"SVM_15_NEVEROPEN"					;//Nigdy tego nie otworzê!
	MISSINGITEM				= 	"SVM_15_MISSINGITEM"				;//Czym?
	DONTKNOW				= 	"SVM_15_DONTKNOW"					;//Hm... Nie...
	NOTHINGTOGET			= 	"SVM_15_NOTHINGTOGET"				;//Niczego tu nie znajdê...
	NOTHINGTOGET02			= 	"SVM_15_NOTHINGTOGET02"				;//Nic tu nie ma...
	NOTHINGTOGET03			= 	"SVM_15_NOTHINGTOGET03"				;//Nie ma czego pl¹drowaæ...
	
	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaaarhhh!
	Awake					=	"SVM_15_Awake"						;//(budzi siê)
	
	// ------ Story SVMs ----------------------------------------------------------------------------
	
	IRDORATHTHEREYOUARE		= 	"SVM_15_IRDORATHTHEREYOUARE"		;//Hm... A wiêc tam jest twoja kryjówka. Cholernie daleko. Chyba bêdê potrzebowaæ statku...
	HEALSHRINE				= 	"SVM_15_HEALSHRINE"					;//Innosie, obdarz mnie sw¹ ³ask¹ i oczyœæ tê kapliczkê.
	HEALLASTSHRINE			= 	"SVM_15_HEALLASTSHRINE"				;//Innosie, obdarz mnie sw¹ ³ask¹ i tak dalej... No, to chyba ostatni raz.
	SCOPENSIRDORATHBOOK		= 	"SVM_15_SCOPENSIRDORATHBOOK"		;//XARAK BENDARDO! Ach... Ksiêga zosta³a otwarta. W œrodku jest klucz i jakiœ list.
	SCOPENSLASTDOOR			= 	"SVM_15_SCOPENSLASTDOOR"			;//KHADOSH EMEM KADAR! Otwórz siê!

	//---------Addon SVMs----------------------------------------------------------------------------
	//ADDON>
	TRADE_1					= 	"SVM_15_Addon_TRADE_1"					;//Pohandlujmy.
	TRADE_2					= 	"SVM_15_Addon_TRADE_2"					;//Poka¿ mi swoje towary.
	TRADE_3					=	"SVM_15_Addon_TRADE_3"					;//Poka¿ mi, co masz.
	
	VERSTEHE				=   "SVM_15_Addon_VERSTEHE"					;//Rozumiem.
	FOUNDTREASURE			=   "SVM_15_Addon_FOUNDTREASURE"			;//Ach. S¹dzê, ¿e coœ znalaz³em.
	CANTUNDERSTANDTHIS		=   "SVM_15_Addon_CANTUNDERSTANDTHIS"		;//Nie rozumiem.
	CANTREADTHIS			= 	"SVM_15_Addon_CANTREADTHIS"				;//Nie potrafiê tego przeczytaæ.
	STONEPLATE_1			= 	"SVM_15_Addon_STONEPLATE_1"				;//AKHANTAR!
	STONEPLATE_2			= 	"SVM_15_Addon_STONEPLATE_2"				;//JHERHEDRA!
	STONEPLATE_3			= 	"SVM_15_Addon_STONEPLATE_3"				;//URIZIEL RATIS!
		
	COUGH					=   "SVM_15_Addon_COUGH"					;//Och, ch³opie, brr!
	HUI						=	"SVM_15_Addon_HUI"						;//Hahaaa!
	
	ATTENTAT_ADDON_DESCRIPTION	=	"SVM_15_ATTENTAT_ADDON_DESCRIPTION"		;//Co wiesz o próbie zabójstwa Estebana?
	ATTENTAT_ADDON_DESCRIPTION2 = 	"SVM_15_ATTENTAT_ADDON_DESCRIPTION2"	;//A co do próby zabójstwa Estebana...
	ATTENTAT_ADDON_PRO			=	"SVM_15_ATTENTAT_ADDON_PRO"				;//Zabijê tych zdrajców.
	ATTENTAT_ADDON_CONTRA		=	"SVM_15_ATTENTAT_ADDON_CONTRA"			;//Chcê znaleŸæ tych ludzi, by wyst¹piæ przeciwko Estebanowi.
	
	MINE_ADDON_DESCRIPTION		=	"SVM_15_MINE_ADDON_DESCRIPTION"		;//Potrzebuj¹ ciê w kopalni.
	ADDON_SUMMONANCIENTGHOST	=	"SVM_15_ADDON_SUMMONANCIENTGHOST"	;//Ighoriat Thorul. Przyzywam ciê, Quarhodronie, pradawny przywódco kasty wojowników!
	ADDON_ANCIENTGHOST_NOTNEAR	=	"SVM_15_ADDON_ANCIENTGHOST_NOTNEAR"	;//Hmm... To tutaj nie dzia³a.
	ADDON_GOLD_DESCRIPTION		=	"SVM_15_ADDON_GOLD_DESCRIPTION"		;//Co muszê wiedzieæ o wydobyciu z³ota?
	
	ADDON_THISLITTLEBASTARD		=   "SVM_15_Addon_ThisLittleBastard";		//Ach, ksiêga rozrachunkowa Francisa. Wygl¹da na to, ¿e ten cz³owiek napycha sobie z³otem kieszenie.
	ADDON_OPENADANOSTEMPLE		=   "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR!

	//ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_16_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_16_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_16_Weather"						;//Nêdzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_16_IGetYouStill"				;//W koñcu i tak ciê dorwê!
	DieEnemy					=	"SVM_16_DieEnemy"					;//Wybi³a twoja godzina!
	DieMonster					=	"SVM_16_DieMonster"					;//Znowu jedna z tych przeklêtych bestii!
	DirtyThief					=	"SVM_16_DirtyThief"					;//Parszywy z³odziej! Czekaj tylko...
	HandsOff					=	"SVM_16_HandsOff"					;//£apy precz!
	SheepKiller					=	"SVM_16_SheepKiller"					;//To bydlê zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_16_SheepKillerMonster"			;//Ten cholerny potwór po¿era nasze owce!
	YouMurderer					=	"SVM_16_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_16_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_16_YouDareHitMe"				;//Czekaj tylko, gnido!
	YouAskedForIt				=	"SVM_16_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_16_ThenIBeatYouOutOfHere"		;//Zatem bêdê musia³a ciê st¹d WYKOPAÆ!
	WhatDidYouDoInThere			=	"SVM_16_WhatDidYouDoInThere"			;//Co ty tam robi³eœ, co?!
	WillYouStopFighting			=	"SVM_16_WillYouStopFighting"			;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_16_KillEnemy"					;//Giñ, bydlaku!
	EnemyKilled					=	"SVM_16_EnemyKilled"				;//To twój koniec, padalcu!
	MonsterKilled				=	"SVM_16_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_16_ThiefDown"					;//Nigdy wiêcej nie próbuj mnie okraœæ!
	rumfummlerDown				=	"SVM_16_rumfummlerDown"				;//Na przysz³oœæ trzymaj siê z dala od rzeczy, które nie powinny ciê interesowaæ!
	SheepAttackerDown			=	"SVM_16_SheepAttackerDown"			;//Nigdy wiêcej tego nie rób! To s¹ nasze owce!
	KillMurderer				=	"SVM_16_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_16_StupidBeastKilled"			;//G³upia bestia!
	NeverHitMeAgain				=	"SVM_16_NeverHitMeAgain"				;//Nigdy wiêcej ze mn¹ nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_16_YouBetterShouldHaveListened"	;//Trzeba by³o mnie pos³uchaæ!
	GetUpAndBeGone				=	"SVM_16_GetUpAndBeGone"				;//A teraz zabieraj siê st¹d!
	NeverEnterRoomAgain			=	"SVM_16_NeverEnterRoomAgain"			;//I ¿ebym ciê ju¿ nigdy wiêcej tam nie przy³apa³a!
	ThereIsNoFightingHere		=	"SVM_16_ThereIsNoFightingHere"		;//Tu siê nie walczy, zrozumiano? Niech to bêdzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_16_SpareMe"						;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_16_RunAway"						;//Wynoszê siê st¹d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_16_Alarm"					;//ALARM!
	Guards						=	"SVM_16_Guards"					;//STRA¯!
	Help						=	"SVM_16_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_16_GoodMonsterKill"			;//Dobra robota!
	GoodKill					= 	"SVM_16_GoodKill"				;//No, daj œwini na co zas³uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_16_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_16_RunCoward"				;//Stój, tchórzu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_16_GetOutOfHere"			;//Wynoœ siê st¹d!
	WhyAreYouInHere				=	"SVM_16_WhyAreYouInHere"		;//Czego tutaj szukasz? OdejdŸ!
	YesGoOutOfHere				= 	"SVM_16_YesGoOutOfHere"			;//No, zabieraj siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_16_WhatsThisSupposedToBe"	;//Hej ty! Czego ty tam szukasz?
	YouDisturbedMySlumber		=	"SVM_16_YouDisturbedMySlumber"	;//Co jest?
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_16_ITookYourGold"			;//Dziêki za z³oto, mój ty bohaterze!
	ShitNoGold					=	"SVM_16_ShitNoGold"				;//Ty biedny frajerze, nawet z³ota nie masz!
	ITakeYourWeapon				=	"SVM_16_ITakeYourWeapon"			;//Lepiej zaopiekujê siê twoj¹ broni¹.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_16_WhatAreYouDoing"			;//Hej, uwa¿aj! Jeszcze raz i ci przy³o¿ê!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_16_LookingForTroubleAgain"	;//Ci¹gle ci ma³o?!
	StopMagic					=	"SVM_16_StopMagic"				;//Przestañ z tymi czarami!
	ISaidStopMagic				=	"SVM_16_ISaidStopMagic"			;//Chcesz dostaæ? Przestañ w tej chwili!
	WeaponDown					=	"SVM_16_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_16_ISaidWeaponDown"		;//Od³o¿ysz w koñcu tê cholern¹ broñ?!
	WiseMove					=	"SVM_16_WiseMove"				;//M¹dra decyzja...
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_16_NextTimeYoureInForIt"	;//Zobaczymy nastêpnym razem...
	OhMyHead					=	"SVM_16_OhMyHead"				;//O bogowie, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_16_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_16_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_16_GoodVictory"			;//Pokaza³eœ mu, kto tu rz¹dzi!
	NotBad						= 	"SVM_16_NotBad"					;//NieŸle...
	OhMyGodHesDown				=	"SVM_16_OhMyGodHesDown"			;//Bogowie! Jak brutalnie...
	CheerFriend01				=	"SVM_16_CheerFriend01"			;//Rozwal go!
	CheerFriend02				=	"SVM_16_CheerFriend02"			;//Poka¿ mu!
	CheerFriend03				=	"SVM_16_CheerFriend03"			;//Daj mu popaliæ!
	Ooh01						=	"SVM_16_Ooh01"					;//Oddaj mu!
	Ooh02						=	"SVM_16_Ooh02"					;//Uwa¿aj!
	Ooh03						=	"SVM_16_Ooh03"					;//Och! To musia³o boleæ!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_16_WhatWasThat"				;//Co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_16_GetOutOfMyBed"			;//Wynoœ siê z mojego ³ó¿ka!
	Awake						= "SVM_16_Awake"					;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_16_ABS_COMMANDER"    		;//Poszed³eœ wiêc do kapitana i oczyœci³eœ siê z zarzutów.
	ABS_MONASTERY    			= "SVM_16_ABS_MONASTERY"    		;//By³eœ zatem u Ojca Parlana i wyzna³eœ mu swoje grzechy.
	ABS_FARM       				= "SVM_16_ABS_FARM"        			;//Lee rozwi¹za³ ten problem.
	ABS_GOOD       				= "SVM_16_ABS_GOOD"        			;//Dobre.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_16_SHEEPKILLER_CRIME"   		;//Nie mo¿esz tak po prostu zabijaæ naszych owiec! OdejdŸ!
	ATTACK_CRIME     			= "SVM_16_ATTACK_CRIME"    			;//Jesteœ brutalnym oprychem. Nie chcê mieæ z tob¹ nic wspólnego.
	THEFT_CRIME      			= "SVM_16_THEFT_CRIME"    			;//Nie rozmawiam ze z³odziejami - a teraz odejdŸ st¹d!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_16_PAL_CITY_CRIME"   		;//Twoje zachowanie nie jest zbyt honorowe. Lordowi Hagenowi to siê nie spodoba!
	MIL_CITY_CRIME     			= "SVM_16_MIL_CITY_CRIME"   		;//Twe zachowanie hañbi dobre imiê stra¿y miejskiej! Lord Andre za¿¹da wyjaœnieñ!
	CITY_CRIME       			= "SVM_16_CITY_CRIME"    			;//Lord Andre dowie siê o twoich czynach!
	// -------------------------
 	MONA_CRIME       			= "SVM_16_MONA_CRIME"    			;//Post¹pi³eœ niew³aœciwie. IdŸ do Ojca Parlana i ¿a³uj za swoje grzechy!
	FARM_CRIME      			= "SVM_16_FARM_CRIME"    			;//Lee siê o tym dowie. Zostaniesz ukarany!
 	OC_CRIME       				= "SVM_16_OC_CRIME"     			;//Kapitan Garond za¿¹da wyjaœnieñ!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_16_GOLD_1000"					;//1000 sztuk z³ota.
	GOLD_950					= "SVM_16_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_16_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_16_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_16_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_16_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_16_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_16_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_16_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_16_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_16_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_16_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_16_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_16_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_16_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_16_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_16_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_16_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_16_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_16_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_16_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_16_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_16_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_16_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_16_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_16_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_16_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_16_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_16_Smalltalk01"				;//...doprawdy? To interesuj¹ce...
	Smalltalk02					= "SVM_16_Smalltalk02"				;//...nie wierzê w to...
	Smalltalk03					= "SVM_16_Smalltalk03"				;//...mój m¹¿ uwa¿a inaczej...
	Smalltalk04					= "SVM_16_Smalltalk04"				;//...daj spokój, nie opowiadaj mi takich rzeczy...
	Smalltalk05					= "SVM_16_Smalltalk05"				;//...naprawdê, sama widzia³am...
	Smalltalk06					= "SVM_16_Smalltalk06"				;//...nie mów...
	Smalltalk07					= "SVM_16_Smalltalk07"				;//...nikomu tego nie powtarzaj...
	Smalltalk08					= "SVM_16_Smalltalk08"				;//...przysz³o nam ¿yæ w niedobrych czasach...
	Smalltalk09					= "SVM_16_Smalltalk09"				;//...kto to opowiada takie rzeczy...
	Smalltalk10					= "SVM_16_Smalltalk10"				;//...gdybym sama tego nie widzia³a...
	Smalltalk11					= "SVM_16_Smalltalk11"				;//...ktoœ musi pracowaæ...
	Smalltalk12					= "SVM_16_Smalltalk12"				;//...s³ysza³am co innego...
	Smalltalk13					= "SVM_16_Smalltalk13"				;//...tak, to bardzo typowe...
	Smalltalk14					= "SVM_16_Smalltalk14"				;//...nie potrafi niczego zatrzymaæ dla siebie...
	Smalltalk15					= "SVM_16_Smalltalk15"				;//...lepiej by by³o, gdyby siê przymkn¹³...
	Smalltalk16					= "SVM_16_Smalltalk16"				;//...i pracuje niemal przez ca³y dzieñ...
	Smalltalk17					= "SVM_16_Smalltalk17"				;//...nie mogê zajmowaæ siê wszystkim i wszystkimi...
	Smalltalk18					= "SVM_16_Smalltalk18"				;//...on po prostu za du¿o gada...
	Smalltalk19					= "SVM_16_Smalltalk19"				;//...tajemnica, o której wszyscy wiedz¹...
	Smalltalk20					= "SVM_16_Smalltalk20"				;//...teraz ka¿dy ju¿ o tym wie...
	Smalltalk21					= "SVM_16_Smalltalk21"				;//...niczego jej ju¿ nie powiem...
	Smalltalk22					= "SVM_16_Smalltalk22"				;//...a bêdzie jeszcze gorzej...
	Smalltalk23					= "SVM_16_Smalltalk23"				;//...to przecie¿ okropne...
	Smalltalk24					= "SVM_16_Smalltalk24"				;//...zawsze to powtarza³am...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_16_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz trochê wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_16_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_16_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ ju¿ zbyt dobry.
	YouLearnedSomething			= "SVM_16_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_16_UNTERSTADT"				;//Jesteœ teraz w ni¿szej czêœci miasta.
	OBERSTADT					= "SVM_16_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_16_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_16_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_16_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_16_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_16_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_16_WHERETO"					;//Dok¹d chcesz siê udaæ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_16_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_16_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_16_UNTERSTADT_2_TEMPEL"		;//Id¹c od kuŸni przez przejœcie, dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_16_UNTERSTADT_2_HAFEN"		;//Id¹c od kuŸni w dó³ ulic¹ portow¹, dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_16_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie, które prowadzi do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_16_TEMPEL_2_MARKT"			;//Jesteœ przed œwi¹tyni¹, idŸ na lewo wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_16_TEMPEL_2_GALGEN"			;//Id¹c od strony œwi¹tyni, skrêæ w lewo ko³o knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_16_MARKT_2_TEMPEL"			;//Id¹c od strony targowiska, wzd³u¿ murów miejskich, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_16_MARKT_2_KASERNE"			;//Koszary to ten du¿y budynek. WejdŸ po prostu po schodach naprzeciwko gospody.
	MARKT_2_GALGEN				= "SVM_16_MARKT_2_GALGEN"			;//PrzejdŸ po prostu obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_16_GALGEN_2_TEMPEL"			;//IdŸ w dó³ uliczk¹ odchodz¹c¹ od placu wisielców, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_16_GALGEN_2_MARKT"			;//PrzejdŸ po prostu obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_16_GALGEN_2_KASERNE"			;//Ten du¿y budynek to koszary. WejdŸ po prostu po schodach.
	KASERNE_2_MARKT				= "SVM_16_KASERNE_2_MARKT"			;//ZejdŸ w dó³ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_16_KASERNE_2_GALGEN"			;//ZejdŸ w dó³ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_16_HAFEN_2_UNTERSTADT"		;//Id¹c w górê ulic¹ portow¹, od strony muru przy nadbrze¿u, dojdziesz do dolnej czêœci miasta.
	// -------------------------------------------------------------------------------------
	Dead						= "SVM_16_Dead"						;//Aaaarhhh!
	Aargh_1						= "SVM_16_Aargh_1"					;//Aargh
	Aargh_2						= "SVM_16_Aargh_2"					;//Aargh
	Aargh_3						= "SVM_16_Aargh_3"					;//Aargh
	
	//-------------------------------- Addon ------------------------------------------------
	
	ADDON_WRONGARMOR			= "SVM_16_Addon_WrongArmor";				//Ubierz siê odpowiednio. Nie chcê, by widziano mnie z kimœ takim.
	
	ADDON_DIEBANDIT				= "SVM_16_ADDON_DIEBANDIT";				//BANDYTA!
	ADDON_DIRTYPIRATE			= "SVM_16_ADDON_DIRTYPIRATE";			//PIRAT!
};

instance SVM_17 (C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings				= 	"SVM_17_MILGreetings"				;//Niech ¿yje Król!
	PALGreetings				=	"SVM_17_PALGreetings"				;//Chwa³a Innosowi!
	Weather						= 	"SVM_17_Weather"						;//Nêdzna pogoda...
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill				= 	"SVM_17_IGetYouStill"				;//W koñcu ciê dopad³am!
	DieEnemy					=	"SVM_17_DieEnemy"					;//Wybi³a twoja godzina!
	DieMonster					=	"SVM_17_DieMonster"					;//Znowu jedna z tych cholernych bestii!
	DirtyThief					=	"SVM_17_DirtyThief"					;//Parszywy z³odziej! Czekaj tylko...
	HandsOff					=	"SVM_17_HandsOff"					;//£apy precz!
	SheepKiller					=	"SVM_17_SheepKiller"					;//Ten bydlak zarzyna nasze owce!
	SheepKillerMonster			=	"SVM_17_SheepKillerMonster"			;//Ten cholerny potwór z¿era nasze owce!
	YouMurderer					=	"SVM_17_YouMurderer"					;//Morderca!
	DieStupidBeast				=	"SVM_17_DieStupidBeast"				;//Tu nie ma miejsca dla bestii!
	YouDareHitMe				=	"SVM_17_YouDareHitMe"				;//Czekaj tylko, gnido!
	YouAskedForIt				=	"SVM_17_YouAskedForIt"				;//Sam tego chcia³eœ!
	ThenIBeatYouOutOfHere		=	"SVM_17_ThenIBeatYouOutOfHere"		;//Zatem bêdê musia³a ciê st¹d WYKOPAÆ!
	WhatDidYouDoInThere			=	"SVM_17_WhatDidYouDoInThere"			;//Co TY tam robi³eœ, co?!
	WillYouStopFighting			=	"SVM_17_WillYouStopFighting"			;//Przestaniecie w koñcu?!
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy					= 	"SVM_17_KillEnemy"					;//Giñ, bydlaku!
	EnemyKilled					=	"SVM_17_EnemyKilled"				;//To twój koniec, padalcu!
	MonsterKilled				=	"SVM_17_MonsterKilled"				;//Jedna bestia mniej!
	ThiefDown					=	"SVM_17_ThiefDown"					;//Nigdy wiêcej nie próbuj mnie okraœæ!
	rumfummlerDown				=	"SVM_17_rumfummlerDown"				;//Na przysz³oœci trzymaj siê z dala od rzeczy, które nie powinny ciê interesowaæ!
	SheepAttackerDown			=	"SVM_17_SheepAttackerDown"			;//Nigdy wiêcej tego nie rób! To s¹ nasze owce!
	KillMurderer				=	"SVM_17_KillMurderer"				;//Giñ, morderco!
	StupidBeastKilled			=	"SVM_17_StupidBeastKilled"			;//G³upia bestia!
	NeverHitMeAgain				=	"SVM_17_NeverHitMeAgain"				;//Nigdy wiêcej ze mn¹ nie zaczynaj!
	YouBetterShouldHaveListened	=	"SVM_17_YouBetterShouldHaveListened"	;//Trzeba by³o mnie pos³uchaæ!
	GetUpAndBeGone				=	"SVM_17_GetUpAndBeGone"				;//A teraz zabieraj siê st¹d!
	NeverEnterRoomAgain			=	"SVM_17_NeverEnterRoomAgain"			;//I ¿ebym ciê ju¿ nigdy wiêcej tam nie przy³apa³a!
	ThereIsNoFightingHere		=	"SVM_17_ThereIsNoFightingHere"		;//Tu siê nie walczy, zrozumiano? Niech to bêdzie dla ciebie nauczka!
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe						=	"SVM_17_SpareMe"						;//Nie rób mi krzywdy!
	RunAway						= 	"SVM_17_RunAway"						;//Wynoszê siê st¹d!
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm						=	"SVM_17_Alarm"					;//ALARM!
	Guards						=	"SVM_17_Guards"					;//STRA¯!
	Help						=	"SVM_17_Help"					;//Pomocy!
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill				=	"SVM_17_GoodMonsterKill"			;//Dobra robota!
	GoodKill					= 	"SVM_17_GoodKill"				;//No, daj œwini na co zas³uguje!
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW						= 	"SVM_17_NOTNOW"					;//Zostaw mnie w spokoju!
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward					=	"SVM_17_RunCoward"				;//Stój, tchórzu!
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere				=	"SVM_17_GetOutOfHere"			;//Wynoœ siê st¹d!
	WhyAreYouInHere				=	"SVM_17_WhyAreYouInHere"		;//Czego tutaj szukasz? OdejdŸ!
	YesGoOutOfHere				= 	"SVM_17_YesGoOutOfHere"			;//No, zabieraj siê!
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe		=	"SVM_17_WhatsThisSupposedToBe"	;//Hej ty! Czego ty tam szukasz?
	YouDisturbedMySlumber		=	"SVM_17_YouDisturbedMySlumber"	;//Co jest
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold				=	"SVM_17_ITookYourGold"			;//Dziêki za z³oto, mój ty bohaterze!
	ShitNoGold					=	"SVM_17_ShitNoGold"				;//Ty biedny frajerze, nawet z³ota nie masz!
	ITakeYourWeapon				=	"SVM_17_ITakeYourWeapon"			;//Lepiej zaopiekujê siê twoj¹ broni¹.
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing				=	"SVM_17_WhatAreYouDoing"			;//Hej, uwa¿aj! Jeszcze raz i ci przy³o¿ê!
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain		=	"SVM_17_LookingForTroubleAgain"	;//Ci¹gle ci ma³o?!
	StopMagic					=	"SVM_17_StopMagic"				;//Przestañ z tymi czarami!
	ISaidStopMagic				=	"SVM_17_ISaidStopMagic"			;//Chcesz dostaæ? Przestañ w tej chwili!
	WeaponDown					=	"SVM_17_WeaponDown"				;//Od³ó¿ broñ!
	ISaidWeaponDown				=	"SVM_17_ISaidWeaponDown"		;//Od³o¿ysz w koñcu tê cholern¹ broñ?!
	WiseMove					=	"SVM_17_WiseMove"				;//M¹dra decyzja...
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt		=	"SVM_17_NextTimeYoureInForIt"	;//Zobaczymy nastêpnym razem...
	OhMyHead					=	"SVM_17_OhMyHead"				;//O bogowie, moja g³owa...
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight				=	"SVM_17_TheresAFight"			;//Aach, walka...
	OhMyGodItsAFight			=	"SVM_17_OhMyGodItsAFight"		;//O bogowie, walka!
	GoodVictory					=	"SVM_17_GoodVictory"			;//Pokaza³eœ mu, kto tu rz¹dzi!
	NotBad						= 	"SVM_17_NotBad"					;//NieŸle...
	OhMyGodHesDown				=	"SVM_17_OhMyGodHesDown"			;//Bogowie! Jak brutalnie...
	CheerFriend01				=	"SVM_17_CheerFriend01"			;//Rozwal go!
	CheerFriend02				=	"SVM_17_CheerFriend02"			;//Poka¿ mu!
	CheerFriend03				=	"SVM_17_CheerFriend03"			;//Daj mu popaliæ!
	Ooh01						=	"SVM_17_Ooh01"					;//Oddaj mu!
	Ooh02						=	"SVM_17_Ooh02"					;//Uwa¿aj!
	Ooh03						=	"SVM_17_Ooh03"					;//Och! To bola³o!
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat					= "SVM_17_WhatWasThat"				;//Co TO by³o!?
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed				= "SVM_17_GetOutOfMyBed"			;//Wynoœ siê z mojego ³ó¿ka!
	Awake						= "SVM_17_Awake"					;//(ziewniêcie)
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER     			= "SVM_17_ABS_COMMANDER"    		;//Poszed³eœ wiêc do kapitana i oczyœci³eœ siê z zarzutów.
	ABS_MONASTERY    			= "SVM_17_ABS_MONASTERY"    		;//By³eœ zatem u Ojca Parlana i wyzna³eœ mu o swoje grzechy.
	ABS_FARM       				= "SVM_17_ABS_FARM"        			;//Lee rozwi¹za³ tê sprawê dla ciebie.
	ABS_GOOD       				= "SVM_17_ABS_GOOD"        			;//Dobre.
 	// -------------------------
	SHEEPKILLER_CRIME   		= "SVM_17_SHEEPKILLER_CRIME"   		;//Nie mo¿esz tak po prostu zabijaæ naszych owiec! OdejdŸ!
	ATTACK_CRIME     			= "SVM_17_ATTACK_CRIME"    			;//Jesteœ brutalnym oprychem. Nie chcê mieæ z tob¹ nic wspólnego.
	THEFT_CRIME      			= "SVM_17_THEFT_CRIME"    			;//Nie rozmawiam ze z³odziejami - wynocha!
	// -------------------------
	PAL_CITY_CRIME     			= "SVM_17_PAL_CITY_CRIME"   		;//Twoje zachowanie nie jest zbyt honorowe. Lordowi Hagenowi to siê nie spodoba!
	MIL_CITY_CRIME     			= "SVM_17_MIL_CITY_CRIME"   		;//Twoje zachowanie hañbi dobre imiê stra¿y miejskiej! Lord Andre za¿¹da wyjaœnieñ!
	CITY_CRIME       			= "SVM_17_CITY_CRIME"    			;//Lord Andre dowie siê o twych czynach!
	// -------------------------
 	MONA_CRIME       			= "SVM_17_MONA_CRIME"    			;//Post¹pi³eœ niew³aœciwie. IdŸ do Ojca Parlana i ¿a³uj za swoje grzechy!
	FARM_CRIME      			= "SVM_17_FARM_CRIME"    			;//Lee siê o tym dowie. Zostaniesz ukarany!
 	OC_CRIME       				= "SVM_17_OC_CRIME"     			;//Kapitan Garond za¿¹da wyjaœnieñ!
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000					= "SVM_17_GOLD_1000"					;//1000 sztuk z³ota.
	GOLD_950					= "SVM_17_GOLD_950"					;//950 sztuk z³ota.
	GOLD_900					= "SVM_17_GOLD_900"					;//900 sztuk z³ota.
	GOLD_850					= "SVM_17_GOLD_850"					;//850 sztuk z³ota.
	GOLD_800					= "SVM_17_GOLD_800"					;//800 sztuk z³ota.
	GOLD_750					= "SVM_17_GOLD_750"					;//750 sztuk z³ota.
	GOLD_700					= "SVM_17_GOLD_700"					;//700 sztuk z³ota.
	GOLD_650					= "SVM_17_GOLD_650"					;//650 sztuk z³ota.
	GOLD_600					= "SVM_17_GOLD_600"					;//600 sztuk z³ota.
	GOLD_550					= "SVM_17_GOLD_550"					;//550 sztuk z³ota.
	GOLD_500					= "SVM_17_GOLD_500"					;//500 sztuk z³ota.
	GOLD_450					= "SVM_17_GOLD_450"					;//450 sztuk z³ota.
	GOLD_400					= "SVM_17_GOLD_400"					;//400 sztuk z³ota.
	GOLD_350					= "SVM_17_GOLD_350"					;//350 sztuk z³ota.
	GOLD_300					= "SVM_17_GOLD_300"					;//300 sztuk z³ota.
	GOLD_250					= "SVM_17_GOLD_250"					;//250 sztuk z³ota.
	GOLD_200					= "SVM_17_GOLD_200"					;//200 sztuk z³ota.
	GOLD_150					= "SVM_17_GOLD_150"					;//150 sztuk z³ota.
	GOLD_100					= "SVM_17_GOLD_100"					;//100 sztuk z³ota.
	GOLD_90						= "SVM_17_GOLD_90"					;//90 sztuk z³ota.
	GOLD_80						= "SVM_17_GOLD_80"					;//80 sztuk z³ota.
	GOLD_70						= "SVM_17_GOLD_70"					;//70 sztuk z³ota.
	GOLD_60						= "SVM_17_GOLD_60"					;//60 sztuk z³ota.
	GOLD_50						= "SVM_17_GOLD_50"					;//50 sztuk z³ota.
	GOLD_40						= "SVM_17_GOLD_40"					;//40 sztuk z³ota.
	GOLD_30						= "SVM_17_GOLD_30"					;//30 sztuk z³ota.
	GOLD_20						= "SVM_17_GOLD_20"					;//20 sztuk z³ota.
	GOLD_10						= "SVM_17_GOLD_10"					;//10 sztuk z³ota.
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01					= "SVM_17_Smalltalk01"				;//...doprawdy? To interesuj¹ce...
	Smalltalk02					= "SVM_17_Smalltalk02"				;//...nie wierzê w to...
	Smalltalk03					= "SVM_17_Smalltalk03"				;//...mój m¹¿ uwa¿a inaczej...
	Smalltalk04					= "SVM_17_Smalltalk04"				;//...daj spokój, nie opowiadaj mi takich rzeczy...
	Smalltalk05					= "SVM_17_Smalltalk05"				;//...naprawdê, sama widzia³am...
	Smalltalk06					= "SVM_17_Smalltalk06"				;//...nie mów...
	Smalltalk07					= "SVM_17_Smalltalk07"				;//...nikomu tego nie powtarzaj...
	Smalltalk08					= "SVM_17_Smalltalk08"				;//...przysz³o nam ¿yæ w niedobrych czasach...
	Smalltalk09					= "SVM_17_Smalltalk09"				;//...kto to opowiada takie rzeczy...
	Smalltalk10					= "SVM_17_Smalltalk10"				;//...gdybym sama tego nie widzia³a...
	Smalltalk11					= "SVM_17_Smalltalk11"				;//...ktoœ musi pracowaæ...
	Smalltalk12					= "SVM_17_Smalltalk12"				;//...s³ysza³am co innego...
	Smalltalk13					= "SVM_17_Smalltalk13"				;//...tak, to bardzo typowe...
	Smalltalk14					= "SVM_17_Smalltalk14"				;//...nie potrafi niczego zatrzymaæ dla siebie...
	Smalltalk15					= "SVM_17_Smalltalk15"				;//...lepiej by by³o, gdyby siê przymkn¹³...
	Smalltalk16					= "SVM_17_Smalltalk16"				;//...i pracuje niemal przez ca³y dzieñ...
	Smalltalk17					= "SVM_17_Smalltalk17"				;//...nie mogê siê zajmowaæ wszystkim i wszystkimi...
	Smalltalk18					= "SVM_17_Smalltalk18"				;//...on po prostu za du¿o gada...
	Smalltalk19					= "SVM_17_Smalltalk19"				;//...tajemnica, o której wszyscy wiedz¹...
	Smalltalk20					= "SVM_17_Smalltalk20"				;//...teraz ka¿dy ju¿ o tym wie...
	Smalltalk21					= "SVM_17_Smalltalk21"				;//...niczego jej ju¿ nie powiem...
	Smalltalk22					= "SVM_17_Smalltalk22"				;//...a bêdzie jeszcze gorzej...
	Smalltalk23					= "SVM_17_Smalltalk23"				;//...to przecie¿ okropne...
	Smalltalk24					= "SVM_17_Smalltalk24"				;//...zawsze to powtarza³am...
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints				= "SVM_17_NoLearnNoPoints"			;//Wróæ, kiedy nabierzesz trochê wiêcej doœwiadczenia.
	NoLearnOverPersonalMAX		= "SVM_17_NoLearnOverPersonalMAX"	;//Wymagasz ode mnie wiêcej, ni¿ mogê ciê nauczyæ.
	NoLearnYoureBetter			= "SVM_17_NoLearnYoureBetter"		;//Nie mogê ciê ju¿ niczego nauczyæ. Jesteœ zbyt dobry.
	YouLearnedSomething			= "SVM_17_YouLearnedSomething"		;//Widzisz, ju¿ siê czegoœ nauczy³eœ...
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT					= "SVM_17_UNTERSTADT"				;//Jesteœ teraz w dolnej czêœci miasta.
	OBERSTADT					= "SVM_17_OBERSTADT"					;//Jesteœ teraz w górnym mieœcie.
	TEMPEL						= "SVM_17_TEMPEL"					;//Jesteœ teraz przy œwi¹tyni.
	MARKT						= "SVM_17_MARKT"						;//Jesteœ teraz na targowisku.
	GALGEN						= "SVM_17_GALGEN"					;//Jesteœ teraz na placu wisielców.
	KASERNE						= "SVM_17_KASERNE"					;//To s¹ koszary.
	HAFEN						= "SVM_17_HAFEN"						;//Jesteœ teraz w dzielnicy portowej.
	// -----------------------
	WHERETO						= "SVM_17_WHERETO"					;//Dok¹d chcesz siê udaæ?
	// -----------------------
	OBERSTADT_2_UNTERSTADT		= "SVM_17_OBERSTADT_2_UNTERSTADT"	;//PrzejdŸ przez wewnêtrzn¹ bramê, a dojdziesz do dolnej czêœci miasta.
	UNTERSTADT_2_OBERSTADT		= "SVM_17_UNTERSTADT_2_OBERSTADT"	;//Przy po³udniowej bramie znajduj¹ siê schody, które prowadz¹ do bramy wewnêtrznej. Za ni¹ zaczyna siê górne miasto.
	UNTERSTADT_2_TEMPEL			= "SVM_17_UNTERSTADT_2_TEMPEL"		;//Id¹c od ku¿ni przez przejœcie, dojdziesz do placu œwi¹tynnego.
	UNTERSTADT_2_HAFEN			= "SVM_17_UNTERSTADT_2_HAFEN"		;//Id¹c od kuŸni w dó³ ulic¹ portow¹, dojdziesz do portu.
	TEMPEL_2_UNTERSTADT			= "SVM_17_TEMPEL_2_UNTERSTADT"		;//Od placu œwi¹tynnego odchodzi przejœcie, które prowadzi do dolnej czêœci miasta.
	TEMPEL_2_MARKT				= "SVM_17_TEMPEL_2_MARKT"			;//Jesteœ przed œwi¹tyni¹, idŸ na lewo wzd³u¿ murów miejskich, a dojdziesz do targowiska.
	TEMPEL_2_GALGEN				= "SVM_17_TEMPEL_2_GALGEN"			;//Id¹c od strony œwi¹tyni, skrêæ w lewo ko³o knajpy, a dojdziesz do placu wisielców.
	MARKT_2_TEMPEL				= "SVM_17_MARKT_2_TEMPEL"			;//Id¹c od strony targowiska, wzd³u¿ murów miejskich, dojdziesz do œwi¹tyni.
	MARKT_2_KASERNE				= "SVM_17_MARKT_2_KASERNE"			;//Ten du¿y budynek to koszary. WejdŸ po schodach naprzeciwko hotelu.
	MARKT_2_GALGEN				= "SVM_17_MARKT_2_GALGEN"			;//PrzejdŸ obok koszar, a dojdziesz do placu wisielców.
	GALGEN_2_TEMPEL				= "SVM_17_GALGEN_2_TEMPEL"			;//IdŸ w dó³ uliczk¹ odchodz¹c¹ od placu wisielców, a dojdziesz do placu œwi¹tynnego.
	GALGEN_2_MARKT				= "SVM_17_GALGEN_2_MARKT"			;//PrzejdŸ obok koszar, a dojdziesz do targowiska.
	GALGEN_2_KASERNE			= "SVM_17_GALGEN_2_KASERNE"			;//Ten du¿y budynek to koszary. WejdŸ po schodach.
	KASERNE_2_MARKT				= "SVM_17_KASERNE_2_MARKT"			;//ZejdŸ po schodach na lewo od g³ównego wejœcia, a dojdziesz do targowiska.
	KASERNE_2_GALGEN			= "SVM_17_KASERNE_2_GALGEN"			;//ZejdŸ po schodach na prawo od g³ównego wejœcia, a dojdziesz do placu wisielców.
	HAFEN_2_UNTERSTADT			= "SVM_17_HAFEN_2_UNTERSTADT"		;//Id¹c w górê ulic¹ portow¹ od strony muru przy nabrze¿u, dojdziesz do dolnej czêœci miasta.
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
	RunCoward    	= "SVM_19_RunCoward"    	;//Nie wymkniessssz ssssiê nam!
	Dead      		= "SVM_19_Dead"      	;//Aaaaarhhh!
	Aargh_1      	= "SVM_19_Aargh_1"     	;//Aargh
	Aargh_2      	= "SVM_19_Aargh_2"     	;//Aargh
	Aargh_3      	= "SVM_19_Aargh_3"     	;//Aargh
};
 

// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	20;




